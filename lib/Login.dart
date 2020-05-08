import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginState();
  }
}

class LoginState extends State<Login> {

  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String _welcomeString = "";
  String username, password;

  void _erase(){
    setState(() {
      _userController.clear();
      _passwordController.clear();
    });
  }

  void _showWelcome(){

    setState(() {
      username = _userController.text;
      password = _passwordController.text;

      if(username.isEmpty && password.isEmpty){
        var snackbar = new SnackBar(content: new Text("Empty fields available",), duration: new Duration(seconds: 1),);
        Scaffold.of(context).showSnackBar(snackbar);
      } else{
        _welcomeString = username;
      }

    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Login"),
        backgroundColor: Colors.blueAccent,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            //adding image
            new Image.asset(
              "image/face.png",
              width: 90.0,
              height: 90.0,
              color: Colors.lightGreen,
            ),

            new Container(
              height: 180.0,
              width: 430.0,
              color: Colors.white,

              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                      hintText: "Username",
                      icon: new Icon(Icons.person),
                    ),
                  ),

                  new TextField(
                    controller: _passwordController,
                    decoration: new InputDecoration(
                      hintText: "Password",
                      icon: new Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),

                  new Padding(padding: new EdgeInsets.all(10.5)),

                  new Center(
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          margin: new EdgeInsets.only(left: 38.0),
                          child: new RaisedButton(
                              onPressed: (){
                                _showWelcome();
                              },
                            color: Colors.red,
                          child: new Text("Login",
                            style: new TextStyle(
                            color: Colors.white,
                              fontSize: 16.9,
                          ),),),
                        ),

                        new Container(
                          margin: new EdgeInsets.only(left: 120.0),
                          child: new RaisedButton(
                            onPressed: (){
                              _erase();
                            },
                            color: Colors.red,
                            child: new Text("Clear",
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 16.9,
                              ),),),
                        )
                      ],
                    ),

                  )

                ],
              ),
            ), 
            
            new Center(
              child: new Container(
                margin: new EdgeInsets.only(top: 40.0),
                child: new Text(
                "Welcome, $_welcomeString!",
                style: new TextStyle(color: Colors.white,
                    fontSize: 22.0),),
              ),
            )

          ],
        ),
      ),
    );
  }
}

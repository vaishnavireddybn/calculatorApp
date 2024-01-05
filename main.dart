import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '0';
  double _num1 = 0;
  double _num2 = 0;
  String _operator = '';
  bool _operatorClicked = false;

  void _onNumberClick(String value) {
    if (_operatorClicked) {
      _output = '0';
      _operatorClicked = false;
    }

    if (_output == '0') {
      _output = value;
    } else {
      _output += value;
    }

    setState(() {});
  }

  void _onOperatorClick(String operator) {
    if (_operator.isNotEmpty) {
      _calculateResult();
      _operatorClicked = true;
    } else {
      _num1 = double.parse(_output);
      _operator = operator;
      _operatorClicked = true;
    }
  }

  void _onEqualClick() {
    _calculateResult();
    _operator = '';
  }

  void _calculateResult() {
    _num2 = double.parse(_output);
    switch (_operator) {
      case '+':
        _output = (_num1 + _num2).toString();
        break;
      case '-':
        _output = (_num1 - _num2).toString();
        break;
      case '*':
        _output = (_num1 * _num2).toString();
        break;
      case '/':
        _output = (_num1 / _num2).toString();
        break;
    }
    _num1 = double.parse(_output);
    setState(() {});
  }

  void _onClearClick() {
    _output = '0';
    _num1 = 0;
    _num2 = 0;
    _operator = '';
    _operatorClicked = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      
        children: [
          
          Text(
            _output,
            style: TextStyle(fontSize: 40),
          ),
          SizedBox(height: 20),
          Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildOperatorButton('/'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildOperatorButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildOperatorButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('0'),
              _buildOperatorButton('+'),
              _buildEqualButton(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildClearButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      onPressed: () => _onNumberClick(text),
      style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 205, 74, 118)),
      child: Text(text),
    );
  }

  Widget _buildOperatorButton(String text) {
    return ElevatedButton(
      onPressed: () => _onOperatorClick(text),
      style: ElevatedButton.styleFrom(primary: Colors.lightBlue),
      child: Text(text),
    );
  }
  Widget _buildEqualButton() {
    return ElevatedButton(
      onPressed: _onEqualClick,
      child: Text('='),
    );
  }

  Widget _buildClearButton() {
    return ElevatedButton(
      onPressed: _onClearClick,
      child: Text('C'),);
}
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '簡單網頁計算器',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({super.key});

  @override
  State<CalculatorHomePage> createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();
  final TextEditingController _thirdNumberController = TextEditingController();
  final TextEditingController _resultController = TextEditingController();

  void _calculateResult() {
    double firstNumber = double.tryParse(_firstNumberController.text) ?? 0;
    double secondNumber = double.tryParse(_secondNumberController.text) ?? 0;
    double thirdNumber = double.tryParse(_thirdNumberController.text) ?? 0;

    double result = (firstNumber + secondNumber) * thirdNumber;

    setState(() {
      _resultController.text = result.toStringAsFixed(2);
    });
  }

  @override
  void dispose() {
    _firstNumberController.dispose();
    _secondNumberController.dispose();
    _thirdNumberController.dispose();
    _resultController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('簡單網頁計算器'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                '計算公式：(第一個數字 + 第二個數字) × 第三個數字',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              
              TextField(
                controller: _firstNumberController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                decoration: const InputDecoration(
                  labelText: '第一個數字',
                  border: OutlineInputBorder(),
                  hintText: '請輸入數字',
                ),
              ),
              const SizedBox(height: 16),
              
              TextField(
                controller: _secondNumberController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                decoration: const InputDecoration(
                  labelText: '第二個數字',
                  border: OutlineInputBorder(),
                  hintText: '請輸入數字',
                ),
              ),
              const SizedBox(height: 16),
              
              TextField(
                controller: _thirdNumberController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                decoration: const InputDecoration(
                  labelText: '第三個數字',
                  border: OutlineInputBorder(),
                  hintText: '請輸入數字',
                ),
              ),
              const SizedBox(height: 24),
              
              ElevatedButton(
                onPressed: _calculateResult,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                child: const Text(
                  '計算結果',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 24),
              
              TextField(
                controller: _resultController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: '計算結果',
                  border: OutlineInputBorder(),
                  fillColor: Color(0xFFF5F5F5),
                  filled: true,
                ),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
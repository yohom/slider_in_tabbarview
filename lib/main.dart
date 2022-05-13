import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              tabs: [Tab(text: '1'), Tab(text: '2')],
              labelColor: Colors.black,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  const Center(child: Placeholder()),
                  Center(
                    child: Slider(
                      value: _value,
                      onChangeEnd: (value) => debugPrint('onChangeEnd: $value'),
                      onChanged: (value) {
                        debugPrint('onChanged: $value');
                        setState(() => _value = value);
                      },
                      onChangeStart: (value) {
                        debugPrint('onChangeStart: $value');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

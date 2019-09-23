Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 232ADBB5D9
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 15:57:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCOnH-0003nm-WD; Mon, 23 Sep 2019 13:54:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dNMU=XS=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iCOnF-0003ng-VE
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 13:54:21 +0000
X-Inumbo-ID: a469ee12-de09-11e9-978d-bc764e2007e4
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::707])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a469ee12-de09-11e9-978d-bc764e2007e4;
 Mon, 23 Sep 2019 13:54:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YtQo13Z8ewr9pxymQJ4yqg07mAv1l47KzpxVSmp7absi01I5OXc6/bPR94MbSuJv81xpIMwXdleuDltTrUVUAh4Rmf45AGqJQ8rm560E609ym7FLai+IzsY3epDaWZE04wwwhQXQhr5bML/+V0o0Bi3fpINA7eM/BOGsQwRn1cSHFJXDttbvOJGL2XkGz0zffHHnd8wEKn/jTVmuG6zCO0EjCmEfVJriEZDSsWaOfnKo5/TIHPnt4aeddin4WlgR873+gUGVOxd/DqWwDh556C7JRtQu9Zm18A6a3OCyHVPKIMFAMZt1OUJ9cQ06SMIkupmBSfb7x63pHOj8X4Ohsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YM7OJe1oxitcwoXCVdMhNfgifJM0KI8MCqZ/iEzRyZY=;
 b=DfEKlZPFYWSTyGvr+O0K1ITbNFbXdNt3fmoyL02SzurAQB7AIhpo3+G4PP5PuBtbub6KM9M726L1VSomzxK4GYBAX42BxkcVXY0VtI1pfh/E4vV7tastySQx1egMu+OCS/CcD5jK9Kiu/bN47IjTXAjG03NrelBv8CsvyYgYrCfbuI5kfnfPnF01zqwu8qefygTApinLUFDkvKpqV/Z6cZuhLZ7l2N3qtZha1FrfCHt2d9aI0DqSPdsFzXfRj2wrLoq43rGtvTRc5DpeRVXA1FM0hPmfNBxnXbdsIzWVIKuJDP0WkawzTflLwVaqFu+4MVb4o0PhrG7l9ZGOSDaUew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YM7OJe1oxitcwoXCVdMhNfgifJM0KI8MCqZ/iEzRyZY=;
 b=IOjoCNm/p/W2dzBdp5wmTxFFRI2I10DcAP/1P/ptWLA66VBgk59qsHZE7dN07wLaH3X1AgSlBUepSPUNWAK/lZ0yCb+hPlZHMN7EtHV5rpXbynyF6GPM2tH7BonC8SZAVex5DKcM7p9RkFK1DDAuM2CyEENyTZfo8RuBLFD2NEg=
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com (10.141.171.8) by
 AM7PR02MB5784.eurprd02.prod.outlook.com (10.141.172.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.21; Mon, 23 Sep 2019 13:54:19 +0000
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8]) by AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8%2]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 13:54:19 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v13] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVcgc/RjZRGBRqJUWCjIFeFraK9Kc5OsKQgAAN94A=
Date: Mon, 23 Sep 2019 13:54:19 +0000
Message-ID: <65e943ad-9f4b-7cbb-6219-1bf64d80a006@bitdefender.com>
References: <20190923120539.25242-1-aisaila@bitdefender.com>
 <e3338d5c50804dfba8ca611271b7b393@AMSPEX02CL03.citrite.net>
In-Reply-To: <e3338d5c50804dfba8ca611271b7b393@AMSPEX02CL03.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR07CA0033.eurprd07.prod.outlook.com
 (2603:10a6:205:1::46) To AM7PR02MB5750.eurprd02.prod.outlook.com
 (2603:10a6:20b:102::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07915d03-7eca-4636-77f0-08d7402d8818
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM7PR02MB5784; 
x-ms-traffictypediagnostic: AM7PR02MB5784:|AM7PR02MB5784:|AM7PR02MB5784:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR02MB57845B1392B5FD81CE491335AB850@AM7PR02MB5784.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39860400002)(376002)(136003)(396003)(366004)(189003)(199004)(51914003)(13464003)(8676002)(66476007)(64756008)(66446008)(66556008)(6486002)(5660300002)(66946007)(8936002)(54906003)(476003)(2616005)(11346002)(31696002)(81156014)(316002)(86362001)(81166006)(6506007)(53546011)(2501003)(386003)(2906002)(305945005)(66066001)(71190400001)(71200400001)(7736002)(446003)(14454004)(478600001)(186003)(25786009)(99286004)(6246003)(256004)(14444005)(6512007)(36756003)(26005)(52116002)(4326008)(31686004)(3846002)(6116002)(76176011)(229853002)(6436002)(110136005)(486006)(102836004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR02MB5784;
 H:AM7PR02MB5750.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UzBxNyUcMnc2PD7XZTfEdT9pxi/a3IRl5eb11cLifOFWWJDYEYPGXL49Sp+EjvYLPOxKIFjum8zh3mStQOesuVqSFpn+k4b0kp+7o/pihNPJburbNK3OmdXU2awWJXOCPNd7kWCwQ+j6Py+uBvsoUYetD8feTY29hDWnscobwuKuUzXY+uOq952WNGdMknJk/bwdLM6HV6jIrC9PAdpySOU/kIKfI2LBSx7R2w+OekeYUglSAfrry2DpTZokyxeOZR60+A5KdrwaRKZvYLktbYHC9SIiuv6PMn1xJNQx2ZNUHdecLl/lNM7Nt+m+UzQLSd8opaLUy+5I5Wq2AiAbbW9PcmsrPOUjyhVKy2kbOpZRQhwvo2rV6Dw+13YKcHDQBW6FQNRAMfNuIo/CEUChe5pHISAZRX5e9e7kb/IsEeQ=
Content-ID: <907B88A6996D6048B7510A03DA4177BE@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07915d03-7eca-4636-77f0-08d7402d8818
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 13:54:19.8416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: be4ncQ9YlsCdn+AnG6xCzXLszp8IFoHuKhniIHCknd51bUX5pUAcrQaonUQZtlztgRDeETT/8HLfXvmmyg8OIs6ezrIIo+nbN3kt8WQwaGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5784
Subject: Re: [Xen-devel] [PATCH v13] x86/emulate: Send vm_event from emulate
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDIzLjA5LjIwMTkgMTY6MDUsIFBhdWwgRHVycmFudCB3cm90ZToNCj4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+PiBGcm9tOiBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSA8YWlz
YWlsYUBiaXRkZWZlbmRlci5jb20+DQo+PiBTZW50OiAyMyBTZXB0ZW1iZXIgMjAxOSAxMzowNg0K
Pj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPj4gQ2M6IFBhdWwgRHVycmFu
dCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyBqYmV1bGljaEBzdXNlLmNvbTsgQW5kcmV3IENv
b3Blcg0KPj4gPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyB3bEB4ZW4ub3JnOyBSb2dlciBQ
YXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgUmF6dmFuIENPSk9DQVJVDQo+PiA8cmNv
am9jYXJ1QGJpdGRlZmVuZGVyLmNvbT47IHRhbWFzQHRrbGVuZ3llbC5jb207IEFsZXhhbmRydSBT
dGVmYW4gSVNBSUxBIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT47DQo+PiBQZXRyZSBPdmlkaXUg
UElSQ0FMQUJVIDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT47IEdlb3JnZSBEdW5sYXAgPEdl
b3JnZS5EdW5sYXBAY2l0cml4LmNvbT4NCj4+IFN1YmplY3Q6IFtQQVRDSCB2MTNdIHg4Ni9lbXVs
YXRlOiBTZW5kIHZtX2V2ZW50IGZyb20gZW11bGF0ZQ0KPj4NCj4+IEEvRCBiaXQgd3JpdGVzIChv
biBwYWdlIHdhbGtzKSBjYW4gYmUgY29uc2lkZXJlZCBiZW5pZ24gYnkgYW4gaW50cm9zcGVjdGlv
bg0KPj4gYWdlbnQsIHNvIHJlY2VpdmluZyB2bV9ldmVudHMgZm9yIHRoZW0gaXMgYSBwZXNzaW1p
emF0aW9uLiBXZSB0cnkgaGVyZSB0bw0KPj4gb3B0aW1pemUgYnkgZmlsdGVyaW5nIHRoZXNlIGV2
ZW50cyBvdXQuDQo+PiBDdXJyZW50bHksIHdlIGFyZSBmdWxseSBlbXVsYXRpbmcgdGhlIGluc3Ry
dWN0aW9uIGF0IFJJUCB3aGVuIHRoZSBoYXJkd2FyZSBzZWVzDQo+PiBhbiBFUFQgZmF1bHQgd2l0
aCBucGZlYy5raW5kICE9IG5wZmVjX2tpbmRfd2l0aF9nbGEuIFRoaXMgaXMsIGhvd2V2ZXIsDQo+
PiBpbmNvcnJlY3QsIGJlY2F1c2UgdGhlIGluc3RydWN0aW9uIGF0IFJJUCBtaWdodCBsZWdpdGlt
YXRlbHkgY2F1c2UgYW4NCj4+IEVQVCBmYXVsdCBvZiBpdHMgb3duIHdoaWxlIGFjY2Vzc2luZyBh
IF9kaWZmZXJlbnRfIHBhZ2UgZnJvbSB0aGUgb3JpZ2luYWwgb25lLA0KPj4gd2hlcmUgQS9EIHdl
cmUgc2V0Lg0KPj4gVGhlIHNvbHV0aW9uIGlzIHRvIHBlcmZvcm0gdGhlIHdob2xlIGVtdWxhdGlv
biwgd2hpbGUgaWdub3JpbmcgRVBUIHJlc3RyaWN0aW9ucw0KPj4gZm9yIHRoZSB3YWxrIHBhcnQs
IGFuZCB0YWtpbmcgdGhlbSBpbnRvIGFjY291bnQgZm9yIHRoZSAiYWN0dWFsIiBlbXVsYXRpbmcg
b2YNCj4+IHRoZSBpbnN0cnVjdGlvbiBhdCBSSVAuIFdoZW4gd2Ugc2VuZCBvdXQgYSB2bV9ldmVu
dCwgd2UgZG9uJ3Qgd2FudCB0aGUgZW11bGF0aW9uDQo+PiB0byBjb21wbGV0ZSwgc2luY2UgaW4g
dGhhdCBjYXNlIHdlIHdvbid0IGJlIGFibGUgdG8gdmV0byB3aGF0ZXZlciBpdCBpcyBkb2luZy4N
Cj4+IFRoYXQgd291bGQgbWVhbiB0aGF0IHdlIGNhbid0IGFjdHVhbGx5IHByZXZlbnQgYW55IG1h
bGljaW91cyBhY3Rpdml0eSwgaW5zdGVhZA0KPj4gd2UnZCBvbmx5IGJlIGFibGUgdG8gcmVwb3J0
IG9uIGl0Lg0KPj4gV2hlbiB3ZSBzZWUgYSAic2VuZC12bV9ldmVudCIgY2FzZSB3aGlsZSBlbXVs
YXRpbmcsIHdlIG5lZWQgdG8gZmlyc3Qgc2VuZCB0aGUNCj4+IGV2ZW50IG91dCBhbmQgdGhlbiBz
dXNwZW5kIHRoZSBlbXVsYXRpb24gKHJldHVybiBYODZFTVVMX1JFVFJZKS4NCj4+IEFmdGVyIHRo
ZSBlbXVsYXRpb24gc3RvcHMgd2UnbGwgY2FsbCBodm1fdm1fZXZlbnRfZG9fcmVzdW1lKCkgYWdh
aW4gYWZ0ZXIgdGhlDQo+PiBpbnRyb3NwZWN0aW9uIGFnZW50IHRyZWF0cyB0aGUgZXZlbnQgYW5k
IHJlc3VtZXMgdGhlIGd1ZXN0LiBUaGVyZSwgdGhlDQo+PiBpbnN0cnVjdGlvbiBhdCBSSVAgd2ls
bCBiZSBmdWxseSBlbXVsYXRlZCAod2l0aCB0aGUgRVBUIGlnbm9yZWQpIGlmIHRoZQ0KPj4gaW50
cm9zcGVjdGlvbiBhcHBsaWNhdGlvbiBhbGxvd3MgaXQsIGFuZCB0aGUgZ3Vlc3Qgd2lsbCBjb250
aW51ZSB0byBydW4gcGFzdA0KPj4gdGhlIGluc3RydWN0aW9uLg0KPj4NCj4+IEEgY29tbW9uIGV4
YW1wbGUgaXMgaWYgdGhlIGhhcmR3YXJlIGV4aXRzIGJlY2F1c2Ugb2YgYW4gRVBUIGZhdWx0IGNh
dXNlZCBieSBhDQo+PiBwYWdlIHdhbGssIHAybV9tZW1fYWNjZXNzX2NoZWNrKCkgZGVjaWRlcyBp
ZiBpdCBpcyBnb2luZyB0byBzZW5kIGEgdm1fZXZlbnQuDQo+PiBJZiB0aGUgdm1fZXZlbnQgd2Fz
IHNlbnQgYW5kIGl0IHdvdWxkIGJlIHRyZWF0ZWQgc28gaXQgcnVucyB0aGUgaW5zdHJ1Y3Rpb24N
Cj4+IGF0IFJJUCwgdGhhdCBpbnN0cnVjdGlvbiBtaWdodCBhbHNvIGhpdCBhIHByb3RlY3RlZCBw
YWdlIGFuZCBwcm92b2tlIGEgdm1fZXZlbnQuDQo+Pg0KPj4gTm93IGlmIG5wZmVjLmtpbmQgPT0g
bnBmZWNfa2luZF9pbl9ncHQgYW5kIGQtPmFyY2gubW9uaXRvci5pbmd1ZXN0X3BhZ2VmYXVsdF9k
aXNhYmxlZA0KPj4gaXMgdHJ1ZSB0aGVuIHdlIGFyZSBpbiB0aGUgcGFnZSB3YWxrIGNhc2UgYW5k
IHdlIGNhbiBkbyB0aGlzIGVtdWxhdGlvbiBvcHRpbWl6YXRpb24NCj4+IGFuZCBlbXVsYXRlIHRo
ZSBwYWdlIHdhbGsgd2hpbGUgaWdub3JpbmcgdGhlIEVQVCwgYnV0IGRvbid0IGlnbm9yZSB0aGUg
RVBUIGZvciB0aGUNCj4+IGVtdWxhdGlvbiBvZiB0aGUgYWN0dWFsIGluc3RydWN0aW9uLg0KPj4N
Cj4+IEluIHRoZSBmaXJzdCBjYXNlIHdlIHdvdWxkIGhhdmUgMiBFUFQgZXZlbnRzLCBpbiB0aGUg
c2Vjb25kIGNhc2Ugd2Ugd291bGQgaGF2ZQ0KPj4gMSBFUFQgZXZlbnQgaWYgdGhlIGluc3RydWN0
aW9uIGF0IHRoZSBSSVAgdHJpZ2dlcnMgYW4gRVBUIGV2ZW50Lg0KPj4NCj4+IFdlIHVzZSBodm1l
bXVsX21hcF9saW5lYXJfYWRkcigpIHRvIGludGVyY2VwdCB3cml0ZSBhY2Nlc3MgYW5kDQo+PiBf
X2h2bV9jb3B5KCkgdG8gaW50ZXJjZXB0IGV4ZWMsIHJlYWQgYW5kIHdyaXRlIGFjY2Vzcy4NCj4+
DQo+PiBBIG5ldyByZXR1cm4gdHlwZSB3YXMgYWRkZWQsIEhWTVRSQU5TX25lZWRfcmV0cnksIGlu
IG9yZGVyIHRvIGhhdmUgYWxsDQo+PiB0aGUgcGxhY2VzIHRoYXQgY29uc3VtZSBIVk1UUkFOUyog
cmV0dXJuIFg4NkVNVUxfUkVUUlkuDQo+Pg0KPj4gaHZtX2VtdWxhdGVfc2VuZF92bV9ldmVudCgp
IGNhbiByZXR1cm4gZmFsc2UgaWYgdGhlcmUgd2FzIG5vIHZpb2xhdGlvbiwNCj4+IGlmIHRoZXJl
IHdhcyBhbiBlcnJvciBmcm9tIG1vbml0b3JfdHJhcHMoKSBvciBwMm1fZ2V0X21lbV9hY2Nlc3Mo
KS4NCj4+IC1FU1JDSCBmcm9tIHAybV9nZXRfbWVtX2FjY2VzcygpIGlzIHRyZWF0ZWQgYXMgcmVz
dHJpY3RlZCBhY2Nlc3MuDQo+Pg0KPj4gTk9URTogaHZtX2VtdWxhdGVfc2VuZF92bV9ldmVudCgp
IGFzc3VtZXMgdGhlIGNhbGxlciB3aWxsIGVuYWJsZS9kaXNhYmxlDQo+PiBhcmNoLnZtX2V2ZW50
LT5zZW5kX2V2ZW50DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlz
YWlsYUBiaXRkZWZlbmRlci5jb20+DQo+Pg0KPiANCj4gZW11bGF0ZSBwYXJ0cy4uLg0KPiANCj4g
QWNrZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPg0KPiANCg0KVGhhbmtzIGZvciB0
aGUgYWNrLg0KDQpBbGV4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs

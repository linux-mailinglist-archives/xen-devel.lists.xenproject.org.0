Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 169C0A54C1
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 13:26:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4kQn-0002pm-PM; Mon, 02 Sep 2019 11:23:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6LlC=W5=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1i4kQm-0002pf-ER
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 11:23:32 +0000
X-Inumbo-ID: 157ecfa6-cd74-11e9-aea1-12813bfff9fa
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.103]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 157ecfa6-cd74-11e9-aea1-12813bfff9fa;
 Mon, 02 Sep 2019 11:23:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/elbwl2nvT3sacIRJELPDSmVG54aNUKlvNRjMouSD4AgZGkswCeAV39bd/yNuomTIoumrbxbJXMIz3YvutHBF3eksLtX+IFUqCNnEO9V2B8kmJz0Qes3FamvNoxWGdux1cuspsLFlUL3hAnptGDwliImaYyybNkYlZ9VL2BTv4cWS2X4Ygsd+GeN2CT1KbquHf7UIFc1azZVn1oNc/JsYSHVZoO4Muu3BTWEVofF/aeW6J4jMaqdMbTFXUR2aV3oW+k8GUQKElBMwFjBhaVh/7T8lqnN9ATHtz0duhKsEJ7/VdpnE12XH/I7Sg0fDoaREcB5j9RMXGg1l3S6YtsDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQzpFyFJ1scIm8HwmmrsLjRy6eHZB6l2wUQ9n8/12L0=;
 b=jWMJ7GCKQzC+m4zjFWilzTk7C0YZDCuSweZzDMmWgFg+tjpFdxCJDVtKE/VT1ROwG8MOC0UAw7FQKzOzktaT0UDKqCFsrfPCvyI6v/wLeUtwvWmTnM114Jwt9b6w2wJuK5bII1swer2qLQQ2nixfYDAxniTxX9o0IvuIZyWPewd1HXNXP5+6kV2REegVv9s104CCs8gQ2hHvD4JMnQW7kqP3TfqBogl1UO+la3/ph2qK9PKUw0XYhQU9OzsmHqCw24yHI6VS732ZqFIBNDJX8RVxlEiLEh8MzRNPpljQmFjK2kWcMr61u5A+T2vPZ0F4HJJC1mLDYS4FBYmuoGqW+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQzpFyFJ1scIm8HwmmrsLjRy6eHZB6l2wUQ9n8/12L0=;
 b=tcjDoEm1yVwYPRzOzzDJPGkK17yKwEBeNVVaOk6W42ntPUCAfDAPY5oe4Q08QZfh7fHhiGv/E9hb383jrpLCoqkegHSRfj0XgJsP05OQ6uu1OgzrZCCcCaT5E5GljQ+5nMUIBFBFwlR7+7aqQQK4RPlckVk5j6tTftX6E4JFoKo=
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com (10.141.171.8) by
 AM7PR02MB5910.eurprd02.prod.outlook.com (10.141.174.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Mon, 2 Sep 2019 11:23:25 +0000
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::d422:432c:51e0:2d74]) by AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::d422:432c:51e0:2d74%4]) with mapi id 15.20.2220.022; Mon, 2 Sep 2019
 11:23:25 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v2] x86/mm: Add mem access rights to NPT
Thread-Index: AQHVWPI5B/wD3XiZaECvNX3mnheiUKcSREOAgAYLgoA=
Date: Mon, 2 Sep 2019 11:23:25 +0000
Message-ID: <0b745940-d71b-7ce3-37d2-7ae4ff9e5819@bitdefender.com>
References: <20190822140210.24749-1-aisaila@bitdefender.com>
 <93e0dae4-7e6a-2f04-2886-203685b6ad28@suse.com>
In-Reply-To: <93e0dae4-7e6a-2f04-2886-203685b6ad28@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0095.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::35) To AM7PR02MB5750.eurprd02.prod.outlook.com
 (2603:10a6:20b:102::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ecca4c9-2225-4af1-68ee-08d72f97f897
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM7PR02MB5910; 
x-ms-traffictypediagnostic: AM7PR02MB5910:|AM7PR02MB5910:|AM7PR02MB5910:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR02MB591067EEA2A635E2685988C5ABBE0@AM7PR02MB5910.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(376002)(136003)(39860400002)(346002)(189003)(199004)(11346002)(2616005)(486006)(446003)(6436002)(229853002)(8676002)(53936002)(54906003)(102836004)(7416002)(478600001)(36756003)(81166006)(81156014)(476003)(71190400001)(71200400001)(14454004)(25786009)(6512007)(86362001)(6246003)(386003)(66556008)(64756008)(66946007)(14444005)(26005)(186003)(66066001)(6486002)(66446008)(7736002)(4326008)(3846002)(31686004)(31696002)(6506007)(53546011)(52116002)(99286004)(76176011)(8936002)(2906002)(6916009)(316002)(305945005)(5660300002)(6116002)(256004)(66476007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR02MB5910;
 H:AM7PR02MB5750.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qRpPWfaxrLP6zV8GQYDkJ1hbNYMKeLyuH7zFkH3X9UrTy86MiRarduawBjJEVYIjNVIhVa5jfwkGLHSh71Cbz4Awcc1YApqcAbvXri9T+tt8ReUdfgmH7MJJPQJ9sUpXLykwwtZLg6FRvXjB3bFhmKRieKDnGRFFF7G0snaH80vwkYGp+MULVG7gguyT0w4eW+IOS9F923oJO8NMH1vthvozSqq8PJo5XMX/lTYpDfob2fTy/lxsCQ9oSw9VAe4exX77JP1kk+/Vtsa+apW2nfEUENOfn0pOlV8xvOaXR4PcCKRsmCfZyqIQc4kPtc2Cc43JP3yGfGTzMlxVTXjtZfKLZt2qkhEbd7j7FUQuxIbALTt2AfUAarHlApP2C7O1rV/dI4xRFnLJ9xga/vLLR0ePPKs2M12z1vhubqwWtQE=
Content-ID: <F5AF5F054DC8A847B08369C4D6AFD6AD@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ecca4c9-2225-4af1-68ee-08d72f97f897
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 11:23:25.5085 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I+IyUGSlQ39DlXHTToTldMiVl6Vd+kDHg02EwG/rvp1K6Ds0A6oR0DZKPMmeDTHPwjfiY1cEwJk9h00U3r4BKtd9wUSaP7ncC3MO5ceTLwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5910
Subject: Re: [Xen-devel] [PATCH v2] x86/mm: Add mem access rights to NPT
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
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "jun.nakajima@intel.com" <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDI5LjA4LjIwMTkgMTg6MDQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMi4wOC4y
MDE5IDE2OjAyLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IFRoaXMgcGF0Y2gg
YWRkcyBhY2Nlc3MgY29udHJvbCBmb3IgTlBUIG1vZGUuDQo+Pg0KPj4gVGhlIGFjY2VzcyByaWdo
dHMgYXJlIHN0b3JlZCBpbiB0aGUgTlBUIHAybSB0YWJsZSA1Njo1My4NCj4gDQo+IFdoeSBzdGFy
dGluZyBmcm9tIGJpdCA1Mz8gSSBjYW4ndCBzZWVtIHRvIGZpbmQgYW55IHVzZSBvZiBiaXQgNTIu
DQoNClRoZXJlIGlzIGEgY29tbWVudCBpbiBwYWdlLmggdGhhdCB3YXJucyB0aGF0IGJpdCAxMig1
MikgaXMgdGFrZW4uDQoiLyoNCiAgKiBCaXQgMTIgb2YgYSAyNC1iaXQgZmxhZyBtYXNrLiBUaGlz
IGNvcnJlc3BvbmRzIHRvIGJpdCA1MiBvZiBhIHB0ZS4NCiAgKiBUaGlzIGlzIG5lZWRlZCB0byBk
aXN0aW5ndWlzaCBiZXR3ZWVuIHVzZXIgYW5kIGtlcm5lbCBQVEVzIHNpbmNlIA0KX1BBR0VfVVNF
Ug0KICAqIGlzIGFzc2VydGVkIGZvciBib3RoLg0KICAqLw0KI2RlZmluZSBfUEFHRV9HVUVTVF9L
RVJORUwgKDFVPDwxMikNCiINCg0KPiANCj4+IFRoZSBiaXRzIGFyZSBmcmVlIGFmdGVyIGNsZWFy
aW5nIHRoZSBJT01NVSBmbGFncyBbMV0uDQo+Pg0KPj4gTW9kaWZ5IHAybV90eXBlX3RvX2ZsYWdz
KCkgdG8gYWNjZXB0IGFuZCBpbnRlcnByZXQgYW4gYWNjZXNzIHZhbHVlLA0KPj4gcGFyYWxsZWwg
dG8gdGhlIGVwdCBjb2RlLg0KPj4NCj4+IEFkZCBhIHNldF9kZWZhdWx0X2FjY2VzcygpIG1ldGhv
ZCB0byB0aGUgcDJtLXB0IGFuZCBwMm0tZXB0IHZlcnNpb25zDQo+PiBvZiB0aGUgcDJtIHJhdGhl
ciB0aGFuIHNldHRpbmcgaXQgZGlyZWN0bHksIHRvIGRlYWwgd2l0aCBkaWZmZXJlbnQNCj4+IGRl
ZmF1bHQgcGVybWl0dGVkIGFjY2VzcyB2YWx1ZXMuDQo+IA0KPiBJIHRoaW5rIHRoaXMgd291bGQg
YmV0dGVyIGJlIGEgc2VwYXJhdGUgY2hhbmdlLg0KDQpPayBJIHdpbGwgYnJha2UgdGhlIHBhdGNo
IGluIHR3byBwYXJ0cy4gSSB3YXMgZm9sbG93aW5nIEdlb3JnZSdzIHYxIHBhdGNoLg0KDQo+IA0K
Pj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS1wdC5jDQo+PiArKysgYi94ZW4vYXJjaC94ODYv
bW0vcDJtLXB0LmMNCj4+IEBAIC02MywxMCArNjMsMTMgQEANCj4+ICAgI2RlZmluZSBuZWVkc19y
ZWNhbGMobGV2ZWwsIGVudCkgX25lZWRzX3JlY2FsYyhsZXZlbCMjZV9nZXRfZmxhZ3MoZW50KSkN
Cj4+ICAgI2RlZmluZSB2YWxpZF9yZWNhbGMobGV2ZWwsIGVudCkgKCEobGV2ZWwjI2VfZ2V0X2Zs
YWdzKGVudCkgJiBfUEFHRV9BQ0NFU1NFRCkpDQo+PiAgIA0KPj4gKyNkZWZpbmUgX1BBR0VfQUND
RVNTX0JJVFMgICgweDFlMDApIC8qIG1lbV9hY2Nlc3MgcmlnaHRzIDE2OjEzICovDQo+IA0KPiBJ
IGd1ZXNzIHRoaXMgaXMgdG9vIGRpc2Nvbm5lY3RlZCBmcm9tIHRoZSB0d28gcGFnZS5oIGhlYWRl
cnMgd2hlcmUNCj4gdGhlIGNvcnJlbGF0aW9uIGJldHdlZW4gYml0IHBvc2l0aW9ucyBnZXRzIGV4
cGxhaW5lZCwgc28gSSBndWVzcw0KPiB5b3Ugd2FudCB0byBleHRlbmQgdGhlIGNvbW1lbnQgYW5k
IGVpdGhlciByZWZlciB0aGVyZSwgb3IgcmVwbGljYXRlDQo+IHNvbWUgb2YgaXQgdG8gbWFrZSB1
bmRlcnN0YW5kYWJsZSB3aHkgMTY6MTMgbWF0Y2hlcyA1Njo1My4NCj4gDQoNCkkgd2lsbCBleHRl
bmQgdGhlIGNvbW1lbnQgc28gYXMgdGhlIGJpdCBzaGlmdGluZyB3aWxsIGJlIGNsZWFyLg0KDQo+
IEknbSBhbHNvIGNvbmNlcm5lZCBob3cgZWFzeSBpdCdsbCBiZSBmb3Igc29tZW9uZSB0byBmaW5k
IHRoaXMNCj4gZGVmaW5pdGlvbiB3aGVuIHdhbnRpbmcgdG8gdXNlIG90aGVyIG9mIHRoZSBhdmFp
bGFibGUgYml0cy4NCg0KWWVzIHlvdSBhcmUgcmlnaHQsIEkgd2lsbCBhZGQgYSBjb21tZW50IGlu
IHBhZ2UuaCB0aGF0IGJpdHMgNTY6NTMgYXJlIA0KdXNlZCBmb3IgbWVtb3J5IGFjY2VzcyByaWdo
dHMgb24gU1ZNLg0KDQo+IA0KPj4gQEAgLTEwNCw4ICsxMTIsMzIgQEAgc3RhdGljIHVuc2lnbmVk
IGxvbmcgcDJtX3R5cGVfdG9fZmxhZ3MoY29uc3Qgc3RydWN0IHAybV9kb21haW4gKnAybSwNCj4+
ICAgICAgICAgICAgICAgZmxhZ3MgfD0gX1BBR0VfUFdUOw0KPj4gICAgICAgICAgICAgICBBU1NF
UlQoIWxldmVsKTsNCj4+ICAgICAgICAgICB9DQo+PiAtICAgICAgICByZXR1cm4gZmxhZ3MgfCBQ
Mk1fQkFTRV9GTEFHUyB8IF9QQUdFX1BDRDsNCj4+ICsgICAgICAgIGZsYWdzIHw9IFAyTV9CQVNF
X0ZMQUdTIHwgX1BBR0VfUENEOw0KPj4gKyAgICAgICAgYnJlYWs7DQo+PiAgICAgICB9DQo+PiAr
DQo+PiArICAgIHN3aXRjaCAoIGFjY2VzcyApDQo+PiArICAgIHsNCj4+ICsgICAgY2FzZSBwMm1f
YWNjZXNzX3I6DQo+PiArICAgICAgICBmbGFncyB8PSBfUEFHRV9OWF9CSVQ7DQo+PiArICAgICAg
ICBmbGFncyAmPSB+X1BBR0VfUlc7DQo+PiArICAgICAgICBicmVhazsNCj4+ICsgICAgY2FzZSBw
Mm1fYWNjZXNzX3J3Og0KPj4gKyAgICAgICAgZmxhZ3MgfD0gX1BBR0VfTlhfQklUOw0KPj4gKyAg
ICAgICAgYnJlYWs7DQo+PiArICAgIGNhc2UgcDJtX2FjY2Vzc19yeDoNCj4+ICsgICAgY2FzZSBw
Mm1fYWNjZXNzX3J4MnJ3Og0KPj4gKyAgICAgICAgZmxhZ3MgJj0gfihfUEFHRV9OWF9CSVQgfCBf
UEFHRV9SVyk7DQo+PiArICAgICAgICBicmVhazsNCj4+ICsgICAgY2FzZSBwMm1fYWNjZXNzX3g6
DQo+PiArICAgICAgICBmbGFncyAmPSB+X1BBR0VfUlc7DQo+PiArICAgICAgICBicmVhazsNCj4g
DQo+IEkgY2FuJ3Qgc2VlbSB0byBiZSBhYmxlIHRvIGZvbGxvdyB5b3UgaGVyZS4gSW4gZmFjdCBJ
IGRvbid0IHNlZQ0KPiBob3cgeW91IHdvdWxkIGJlIGFibGUgdG8gZXhwcmVzcyBleGVjdXRlLW9u
bHkgd2l0aCBOUFQuIElmIHRoaXMNCj4gaXMgcmVhbGx5IG5lZWRlZCBmb3Igc29tZSByZWFzb24s
IHRoZW4gYSBqdXN0aWZ5aW5nIGNvbW1lbnQNCj4gc2hvdWxkIGJlIGFkZGVkLg0KDQpFeGVjdXRl
LW9ubHkgc2hvdWxkIGJlIGV4cHJlc3NlZCBhcyBub3QgUEFHRV9SVyBhbmQgUEFHRV9OWF9CSVQg
bm90IHNldC4NCg0KPiANCj4+IEBAIC0xNTIsNiArMTg0LDE3IEBAIHAybV9mcmVlX2VudHJ5KHN0
cnVjdCBwMm1fZG9tYWluICpwMm0sIGwxX3BnZW50cnlfdCAqcDJtX2VudHJ5LCBpbnQgcGFnZV9v
cmRlcikNCj4+ICAgICAgIHAybV9mcmVlX3B0cChwMm0sIGwxZV9nZXRfcGFnZSgqcDJtX2VudHJ5
KSk7DQo+PiAgIH0NCj4+ICAgDQo+PiArc3RhdGljIHZvaWQgcDJtX3NldF9hY2Nlc3MoaW50cHRl
X3QgKmVudHJ5LCBwMm1fYWNjZXNzX3QgYWNjZXNzKQ0KPj4gK3sNCj4+ICsgICAgKmVudHJ5IHw9
IHB1dF9wdGVfZmxhZ3MoKGdldF9wdGVfZmxhZ3MoKmVudHJ5KSAmIH5fUEFHRV9BQ0NFU1NfQklU
UykgfA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAoTUFTS19JTlNSKGFjY2Vzcywg
X1BBR0VfQUNDRVNTX0JJVFMpKSk7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBwMm1fYWNjZXNz
X3QgcDJtX2dldF9hY2Nlc3MoaW50cHRlX3QgZW50cnkpDQo+PiArew0KPj4gKyAgICByZXR1cm4g
KHAybV9hY2Nlc3NfdCkoTUFTS19FWFRSKGdldF9wdGVfZmxhZ3MoZW50cnkpLCBfUEFHRV9BQ0NF
U1NfQklUUykpOw0KPiANCj4gSXMgdGhlIGNhc3QgcmVhbGx5IG5lZWRlZCBoZXJlPw0KDQpOb3Qg
cmVhbGx5LCBJIGNhbiByZW1vdmUgaXQgaW4gdGhlIG5leHQgdmVyc2lvbi4NCg0KPiANCj4+IEBA
IC0yMjYsNiArMjY5LDcgQEAgcDJtX25leHRfbGV2ZWwoc3RydWN0IHAybV9kb21haW4gKnAybSwg
dm9pZCAqKnRhYmxlLA0KPj4gICAgICAgICAgIHsNCj4+ICAgICAgICAgICAgICAgbmV3X2VudHJ5
ID0gbDFlX2Zyb21fcGZuKHBmbiB8IChpIDw8ICgobGV2ZWwgLSAxKSAqIFBBR0VUQUJMRV9PUkRF
UikpLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmxhZ3MpOw0K
Pj4gKyAgICAgICAgICAgIHAybV9zZXRfYWNjZXNzKCZuZXdfZW50cnkubDEsIHAybS0+ZGVmYXVs
dF9hY2Nlc3MpOw0KPj4gICAgICAgICAgICAgICByYyA9IHAybS0+d3JpdGVfcDJtX2VudHJ5KHAy
bSwgZ2ZuLCBsMV9lbnRyeSArIGksIG5ld19lbnRyeSwgbGV2ZWwpOw0KPj4gICAgICAgICAgICAg
ICBpZiAoIHJjICkNCj4+ICAgICAgICAgICAgICAgew0KPj4gQEAgLTIzNyw2ICsyODEsNyBAQCBw
Mm1fbmV4dF9sZXZlbChzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLCB2b2lkICoqdGFibGUsDQo+PiAg
ICAgICAgICAgdW5tYXBfZG9tYWluX3BhZ2UobDFfZW50cnkpOw0KPj4gICANCj4+ICAgICAgICAg
ICBuZXdfZW50cnkgPSBsMWVfZnJvbV9tZm4obWZuLCBQMk1fQkFTRV9GTEFHUyB8IF9QQUdFX1JX
KTsNCj4+ICsgICAgICAgIHAybV9zZXRfYWNjZXNzKCZuZXdfZW50cnkubDEsIHAybS0+ZGVmYXVs
dF9hY2Nlc3MpOw0KPj4gICAgICAgICAgIHJjID0gcDJtLT53cml0ZV9wMm1fZW50cnkocDJtLCBn
Zm4sIHAybV9lbnRyeSwgbmV3X2VudHJ5LA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbGV2ZWwgKyAxKTsNCj4+ICAgICAgICAgICBpZiAoIHJjICkNCj4gDQo+IElzIGl0
IHJlYWxseSBpbnRlbmRlZCB0byBpbnNlcnQgdGhlIGFjY2VzcyBiaXRzIGFsc28gaW50byBub24t
bGVhZg0KPiBlbnRyaWVzICh3aGljaCBtYXkgYmUgd2hhdCBpcyBiZWluZyBwcm9jZXNzZWQgaGVy
ZSk/IChNYXkgYWxzbw0KPiBhcHBseSBmdXJ0aGVyIGRvd24uKQ0KPiANCj4+IEBAIC00NzQsNiAr
NTIwLDMyIEBAIGludCBwMm1fcHRfaGFuZGxlX2RlZmVycmVkX2NoYW5nZXModWludDY0X3QgZ3Bh
KQ0KPj4gICAgICAgcmV0dXJuIHJjOw0KPj4gICB9DQo+PiAgIA0KPj4gK3N0YXRpYyBpbnQgcDJt
X3B0X2NoZWNrX2FjY2VzcyhwMm1fYWNjZXNzX3QgcDJtYSkNCj4+ICt7DQo+PiArICAgIHN3aXRj
aCAoIHAybWEgKQ0KPj4gKyAgICB7DQo+PiArICAgIGNhc2UgcDJtX2FjY2Vzc19uOg0KPj4gKyAg
ICBjYXNlIHAybV9hY2Nlc3NfdzoNCj4+ICsgICAgY2FzZSBwMm1fYWNjZXNzX3d4Og0KPj4gKyAg
ICBjYXNlIHAybV9hY2Nlc3NfbjJyd3g6DQo+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4g
DQo+IEknbSBub3QgY29udmluY2VkIEVJTlZBTCBpcyBhcHByb3ByaWF0ZSBoZXJlIC0gdGhlIGFy
Z3VtZW50IGlzbid0DQo+IGludmFsaWQsIGl0J3MganVzdCB0aGF0IHRoZXJlJ3Mgbm8gd2F5IHRv
IHJlcHJlc2VudCBpdC4NCg0KV291bGQgRVBFUk0gYmUgYSBiZXR0ZXIgcmV0dXJuIGhlcmU/DQoN
ClJlZ2FyZHMsDQpBbGV4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs

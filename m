Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 035096D090
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 16:58:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho7ow-0000NX-Bn; Thu, 18 Jul 2019 14:55:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lBbd=VP=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1ho7ou-0000NS-T2
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 14:55:44 +0000
X-Inumbo-ID: 1d62f138-a96c-11e9-a021-7b17f84521a9
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.99]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d62f138-a96c-11e9-a021-7b17f84521a9;
 Thu, 18 Jul 2019 14:55:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wqf3GNwcr+EX2kjpOuKG1UHyEdjuRPETW8DBVbNLNXIeZI2jfj5Py6ZlA7rAmbH1OfLeqEoG8lCB+ggA+TU4k4OgzjyFxIFMQ40U+ApfZDe0jT2t5XWPwmdwVwcWJmDzT4M72/I87Py3LMIYkrTvuYJ6DL8aF55C5GHTTev3iiFNxCSzoiR4X3mnHDJh02BJA1mPDalqQeQZ0SIyw76kiYEMg8sSUm60DBJBIbgXy7ww0MFpL97JGenwxLC5Nkj5fLrepudWiAYK2jcAqR55wBTBEsGkX9swB/WF+1ONpeRZFqh2jcinb13WvZLMiCvMO8qGiEh1zb+DMSMHVZUNvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zF+D2qjGfP/3jdWQI4N2hgLaKkwGcXhi+rST8zAXoDo=;
 b=IDyNo0KgcjC8Z7ob8082232sGkhGWkv4vwXIb8hAkq5k+ANHjtSZ7KMQHwaVvqtVJ9zrd1Ces1d1baWKjFrYmzCyZXY36ZW3lrPCiLPL4FrBaX7GDhx9rWRzrRZ7Y0EsPFGxaqwdTIOnNHLcsUMmcHNbBZBGIaW1MYvFetGfvvyu8JPG/KV7Q32n2qeOQHx/+1psOFpEJ6l6IFvlcI+srxFWLUT1RdErj2ry1NMmmCRGRKIdMFSD+/DaUs1s/29Cf8yl3DJTeWhSVTXkQ378WxEbBytaz+5dflHHdNW+klaaZ4RPD+evITOg7yW+hlBxBVc3r6b0fyufiJ1utF1n/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zF+D2qjGfP/3jdWQI4N2hgLaKkwGcXhi+rST8zAXoDo=;
 b=xTt4Ehxb2T31ELp6wP+x9fERlpgJoj/FCZUnIlLFehxIidTxczU/T4yJRxzOE1qwPxnKz6tONEl8OqbyA44JcWzt5M1za9TcslXHlH3+QAX6TZu4rBc3msPf2CESfECIJrOUQ2Q3Lwyv7TuH7Rbt+fThKsbq5hncN21BSVCXJqY=
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com (20.177.198.89) by
 AM6PR02MB4358.eurprd02.prod.outlook.com (20.177.114.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Thu, 18 Jul 2019 14:55:41 +0000
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::8185:36ef:58bb:9a00]) by AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::8185:36ef:58bb:9a00%2]) with mapi id 15.20.2094.011; Thu, 18 Jul 2019
 14:55:41 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v2 07/10] vm_event: Add vm_event_ng interface
Thread-Index: AQHVO/ji+ep3hd1WrES1BL2P0bM6cabOlq4AgABMy4CAAB8oAIABZ1KAgAAMwoCAAAMRAA==
Date: Thu, 18 Jul 2019 14:55:41 +0000
Message-ID: <54ffb078c4c4c5d793a4bed2e47b587237cb7b0d.camel@bitdefender.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <cover.1563293545.git.ppircalabu@bitdefender.com>
 <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
 <e1c9a42d-7bde-5749-7cf3-cb5e7b4041e1@suse.com>
 <de42faf2929b0ff0d52949d21dea5f2b30336840.camel@bitdefender.com>
 <20603303-440d-3ac4-8f78-861abaa78d70@suse.com>
 <22abf98c86af08adb0444ffa115bc56b9bd552fc.camel@bitdefender.com>
 <58a8a000-7dff-be57-7d75-f39abbd41f69@suse.com>
In-Reply-To: <58a8a000-7dff-be57-7d75-f39abbd41f69@suse.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0052.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::16) To AM6PR02MB4615.eurprd02.prod.outlook.com
 (2603:10a6:20b:6a::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34e34b9d-2c38-4301-e252-08d70b9000b3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR02MB4358; 
x-ms-traffictypediagnostic: AM6PR02MB4358:|AM6PR02MB4358:
x-microsoft-antispam-prvs: <AM6PR02MB4358D6A91F1B6886A47F1BA4D6C80@AM6PR02MB4358.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(136003)(346002)(39860400002)(396003)(199004)(189003)(2906002)(66446008)(66476007)(66556008)(64756008)(256004)(118296001)(25786009)(14444005)(52116002)(5660300002)(54906003)(66946007)(76176011)(102836004)(6506007)(53546011)(386003)(478600001)(26005)(486006)(4326008)(186003)(71190400001)(71200400001)(2616005)(11346002)(476003)(99286004)(446003)(7416002)(6246003)(6436002)(8936002)(6486002)(7736002)(6916009)(229853002)(53936002)(68736007)(81166006)(3846002)(86362001)(81156014)(14454004)(50226002)(36756003)(316002)(66066001)(8676002)(6512007)(6116002)(305945005)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR02MB4358;
 H:AM6PR02MB4615.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wN3X69lrA9ktrYfTv4Pe8fvutf3lPKAX72q0B2MMlu6KrayXP8qyb+RKQI1vCg+JfZN7XHy2LKkxshqB0LLdZHPKXXeQA2buWufqt5Eicmd+5frKCim+d9p8dBKv50yPsHNDIKOl7yw+USWiRTY2yVzOZO9chVwIEjbANBGDe6enoSonUsrAZ12ORuNQyfdsAuIAUNwd/2BhGYb8FoJSuilLfA7e2oziDi9eRYXxFD2z6J6jdquMVXlrLwvORs2/PCcUlzejrS7vmrKTzj0M8gTMVCXucOAF8xRtWtaMVHqg8uKIPifZy/wFKhAe03E3TjeNUSbtV1JlcS20lT1628333EP/aH/mi91DhVxER8xZDXhlNF41+8qCr7vZAKifpIwtpZ1t/WQK71aiN1F/RP64ppSv9bgs6brzW4ni9zM=
Content-ID: <0E7ADB70B5DBA842949A3A4227FE84CC@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e34b9d-2c38-4301-e252-08d70b9000b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 14:55:41.3468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppircalabu@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB4358
Subject: Re: [Xen-devel] [PATCH v2 07/10] vm_event: Add vm_event_ng interface
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 JulienGrall <julien.grall@arm.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyMDE5LTA3LTE4IGF0IDE0OjQ0ICswMDAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
T24gMTguMDcuMjAxOSAxNTo1OSwgUGV0cmUgT3ZpZGl1IFBJUkNBTEFCVSB3cm90ZToNCj4gPiBC
ZWZvcmUgdXNpbmcgeGVuZm9yZWlnbm1lbW9yeV9tYXBfcmVzb3VyY2UgSSBpbnZlc3RpZ2F0ZWQg
c2V2ZXJhbA0KPiA+IGRpZmZlcmVudCBhcHByb2FjaGVzOg0KPiA+IC0gQWxsb2NhdGUgdGhlIG1l
bW9yeSBpbiBoeXBlcnZpc29yIGFuZCB4Y19tYXBfZm9yZWlnbl9wYWdlcw0KPiA+IChkb2Vzbid0
DQo+ID4gd29yayBiZWNhdXNlIHlvdSBjYW5ub3QgImZvcmVpZ25tYXAiIHBhZ2VzIG9mIHlvdXIg
b3duIGRvbWFpbi4NCj4gPiAtIEFsbG9jYXRlIHRoZSBtZW1vcnkgaW4gZ3Vlc3QsIGFuZCBtYXAg
dGhlIGFsbG9jYXRlZCBwYWdlcyBpbiBYRU4uDQo+ID4gVG8NCj4gPiBteSBrbm93bGVkZ2UgdGhl
cmUgaXMgbm8gc3VjaCBBUEkgaW4gbGludXggdG8gZG8gdGhpcyBhbmQgdGhlDQo+ID4gbW9uaXRv
cg0KPiA+IGFwcGxpY2F0aW9uLCBhcyBhbiB1c2Vyc3BhY2UgcHJvZ3JhbSwgaXMgbm90IGF3YXJl
IG9mIHRoZSBhY3R1YWwNCj4gPiBnZm5zDQo+ID4gZm9yIGFuIGFsbG9jYXRlZCBtZW1vcnkgYXJl
YS4NCj4gPiANCj4gPiBTbywgYXQgdGhpcyBwb2ludCB0aGUgbW9zdCBwcm9taXNpbmcgc29sdXRp
b24gaXMgYWxsb2NhdGluZyB0aGUNCj4gPiBtZW1vcnkNCj4gPiBpbiBYRU4sIHNoYXJpbmcgaXQg
d2l0aCBJRCB1c2luZyBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0LCBhbmQNCj4gPiBtYXBwaW5n
DQo+ID4gaXQgd2l0aCB4ZW5mb3JlaWdubWVtb3J5X21hcF9yZXNvdXJjZSAod2l0aCB0aGUgZmxh
Zw0KPiA+IFhFTk1FTV9yc3JjX2FjcV9jYWxsZXJfb3duZWQgc2V0KQ0KPiANCj4gV2hpY2ggaXMg
ZmluZSAtIHRoYXQncyB3aHkgUGF1bCBoYWQgaW50cm9kdWNlZCB0aGUgZ2VuZXJpYyBpbnRlcmZh
Y2UuDQo+IA0KPiA+IFRvIG15IHVuZGVyc3RhbmRpbmcgdGhlIGNsZWFudXAgc2VxdWVuY2UgZnJv
bQ0KPiA+IGdudHRhYl91bnBvcHVsYXRlX3N0YXR1c19mcmFtZXMgYmFzaWNhbGx5IGJvaWxzIGRv
d24gdG86DQo+ID4gMS4gZ3Vlc3RfcGh5c21hcF9yZW1vdmVfcGFnZQ0KPiA+IDIuIGlmICggdGVz
dF9hbmRfY2xlYXJfYml0KF9QR0NfYWxsb2NhdGVkLCAmcGctPmNvdW50X2luZm8pICkNCj4gPiAg
ICAgICAgIHB1dF9wYWdlKHBnKTsNCj4gPiAzLiBmcmVlX3hlbmhlYXBfcGFnZQ0KPiANCj4gWW91
J3JlIG1pc3NpbmcgdGhlIGNydWNpYWwgcGFydCBvZiB1bmRvaW5nIHN0ZXAgMiBpZiB5b3UgZmlu
ZA0KPiB0aGF0IHRoZXJlIGFyZSBzdGlsbCByZWZlcmVuY2VzIGxlZnQgdG8gdGhlIHBhZ2UuDQo+
IA0KPiBBbmQgdGhlbiwgYmVjYXVzZSBvZiB5b3VyIHVzZSBvZiB2emFsbG9jKCksIHlvdSBjYW4n
dCB1c2UNCj4gZnJlZV94ZW5oZWFwX3BhZ2VzKCksIGFzIHRoYXQgdGFrZXMgYSAoZGlyZWN0IG1h
cCkgbGluZWFyIGFkZHJlc3MNCj4gYXMgaW5wdXQuIEl0IGhhcyB0byBiZSBmcmVlX2RvbWhlYXBf
cGFnZXMoKSBpbiB5b3VyIGNhc2UuDQo+IA0KPiA+IE15IGN1cnJlbnQgaW1wbGVtZW50YXRpb24g
dXNlcyB2emFsbG9jIGluc3RlYWQgb2YNCj4gPiBhbGxvY194ZW5oZWFwX3BhZ2VzDQo+ID4gYW5k
IHRoYXQncyB3aHkgSSBhc3N1bWVkIHZ1bm1hcCBhbmQgZnJlZV9kb21oZWFwX3BhZ2VzIHdpbGwg
c3VmZmljZQ0KPiA+IChJDQo+ID4gd291bGQgaGF2ZSBjYWxsZWQgdmZyZWUgZGlyZWN0bHksIGJ1
dCB0aGUgdGVtcG9yYXJ5IGxpbmtlZCBsaXN0DQo+ID4gdGhhdCBpcw0KPiA+IHVzZWQgdG8gaG9s
ZCB0aGUgcGFnZSByZWZlcmVuY2VzIGNhdXNlcyBmcmVlX2RvbWhlYXBfcGFnZXMgdG8NCj4gPiBj
cmFzaCkNCj4gPiANCj4gPiBEbyBJIGFsc28gaGF2ZSB0byBjYWxsIGd1ZXN0X3BoeXNtYXBfcmVt
b3ZlX3BhZ2UgYW5kIHB1dF9wYWdlPw0KPiA+IChzdGVwcw0KPiA+IDEuIGFuZCAyLikNCj4gDQo+
IGd1ZXN0X3BoeXNtYXBfcmVtb3ZlX3BhZ2UoKSBuZWVkcyB0byBiZSBjYWxsZWQgZm9yIHRyYW5z
bGF0ZWQgcGFnZS0NCj4gb3duaW5nIGRvbWFpbnMgaWYgdGhlIHBhZ2Ugd2FzIGV2ZXIgYWRkZWQg
dG8gdGhlaXIgcGh5c21hcC4gQXMgbG9uZw0KPiBhcyB5b3UgYXZvaWQgYWRkaW5nLCB5b3UgYWxz
byBkb24ndCBuZWVkIHRvIHJlbW92ZS4gSSBkb24ndCByZWNhbGwNCj4gdGhvdWdoIHdoZXRoZXIg
YSB0cmFuc2xhdGVkIGRvbWFpbiBjYW4gYWNjZXNzIGEgcmVzb3VyY2Ugd2l0aG91dCBpdA0KPiBo
YXZpbmcgYSByZXByZXNlbnRhdGlvbiBpbiBpdHMgR0ZOIHNwYWNlLg0KPiANCj4gWW91IGRlZmlu
aXRlbHkgbmVlZCB0byBkbyBzdGVwIDIgKHdoaWNoIGlzIHRvIHVuZG8gdGhlIHJlc3BlY3RpdmUN
Cj4gcGFydCBvZiBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0KCksIGFuZCB5b3UgX2Fsc29fIG5l
ZWQgdG8gY2xlYXINCj4gdGhlIHBhZ2Ugb3duZXIgKHVuZG9pbmcgdGhlIG90aGVyIHBhcnQgb2Yg
d2hhdCB0aGF0IGZ1bmN0aW9uIGhhcw0KPiBkb25lKS4gQW5kIHRoZW4sIGFzIHNhaWQgYWJvdmUs
IHlvdSBuZWVkIHRvIGNoZWNrIHRoYXQgdGhlIHBhZ2UNCj4gaGFzIG5vIHJlZmVyZW5jZXMgbGVm
dCBvbiBpdCwgYW5kIGNvcnJlY3RseSBkZWFsIHdpdGggdGhlIGNhc2Ugd2hlbg0KPiBpdCBzdGls
bCBoYXMgc29tZS4NCj4gDQo+IE9uIHRoZSB3aG9sZSBnbnR0YWJfdW5wb3B1bGF0ZV9zdGF0dXNf
ZnJhbWVzKCkgaXMgdmVyeSB1bmZvcnR1bmF0ZQ0KPiB0byBoYXZlIHRoZSB3YXkgaXQgaXMsIGlu
Y2x1ZGluZyB0aGUgdmFyaW91cyBkb21haW5fY3Jhc2goKS1lcy4gSXQNCj4gd2FzIG1lcmVseSB0
aGUgb25seSB3YXkgd2UgY291bGQgc2VlIHdoZW4gZGVhbGluZyB3aXRoIFhTQS0yNTUuIEkNCj4g
d291bGQgc3Ryb25nbHkgcmVjb21tZW5kIGFnYWluc3QgbmV3IGNvZGUgdHJ5aW5nIHRvIGdvIHRo
aXMgc2FtZQ0KPiByb3V0ZSwgdW5sZXNzIHdlIGludHJvZHVjZSBhIGdlbmVyaWMgYW5kIGNsZWFu
L3NhZmUgZnVuY3Rpb24NCj4gaW52ZXJ0aW5nIHNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3QoKSAo
d2hpY2ggSSd2ZSB0cmllZCBpbiB0aGUgcGFzdA0KPiBhbmQgZmFpbGVkKS4NCj4gDQo+IEphbg0K
DQpUaGFuay15b3UgdmVyeSBtdWNoIGZvciBleHBsYWluaW5nIHRoaXMgdG8gbWUuIEkgd2lsbCB1
cGRhdGUgdGhlDQpjbGVhbnVwIHByb2NlZHVyZSBhbmQgbGV0IHlvdSBrbm93IHRoZSBvdXRjb21l
Lg0KDQpCZXN0IHJlZ2FyZHMsDQpQZXRyZQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

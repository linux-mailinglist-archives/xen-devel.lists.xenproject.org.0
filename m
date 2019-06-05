Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCE03620E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 19:05:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYZIN-0006Vi-Gv; Wed, 05 Jun 2019 17:01:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kgSu=UE=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hYZIL-0006Vd-EN
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 17:01:49 +0000
X-Inumbo-ID: 99fc1b95-87b3-11e9-8980-bc764e045a96
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::71e])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 99fc1b95-87b3-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 17:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXmfwuadlcZyGeek8IECgtTHdLbhtzzidieNXUaEqaA=;
 b=vzVJbcp2Thp6XcW8IMiEKQy9jK3OCp35wxrhrOfdmjVcQt43DZk+4A//dzKJ6E7Ag5s3gQwDp0aP/mrq0hFiNUmfuk5dm5LhOrrPFnyTFGeEpXqn89DKh7dMJECrTnwdm6ewaegmTvqDlhJzVDpX8xVUFLLVuCSBm80Ctml7OGk=
Received: from AM0PR02MB5572.eurprd02.prod.outlook.com (10.255.30.141) by
 AM0PR02MB5876.eurprd02.prod.outlook.com (52.132.213.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Wed, 5 Jun 2019 17:01:44 +0000
Received: from AM0PR02MB5572.eurprd02.prod.outlook.com
 ([fe80::1120:f8e6:62cc:c204]) by AM0PR02MB5572.eurprd02.prod.outlook.com
 ([fe80::1120:f8e6:62cc:c204%5]) with mapi id 15.20.1943.023; Wed, 5 Jun 2019
 17:01:44 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 8/9] vm_event: Add vm_event_ng interface
Thread-Index: AQHVFvKbpX1coRM25UyAvnVo6EqQ76aLmcoAgAG5AAA=
Date: Wed, 5 Jun 2019 17:01:44 +0000
Message-ID: <2d36968a158b9ff12ef8b717d9ae617062abae6c.camel@bitdefender.com>
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <3ec19ed5425a62ecbc524e44c4bba86d5fe41762.1559224640.git.ppircalabu@bitdefender.com>
 <74176687-4c9f-f2dc-fafa-a999e3129f3c@citrix.com>
In-Reply-To: <74176687-4c9f-f2dc-fafa-a999e3129f3c@citrix.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0401CA0018.eurprd04.prod.outlook.com
 (2603:10a6:800:4a::28) To AM0PR02MB5572.eurprd02.prod.outlook.com
 (2603:10a6:208:161::13)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40091104-8a28-491c-6148-08d6e9d77c9e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR02MB5876; 
x-ms-traffictypediagnostic: AM0PR02MB5876:|AM0PR02MB5876:
x-microsoft-antispam-prvs: <AM0PR02MB5876678BF06BBBE681E8C6F4D6160@AM0PR02MB5876.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(396003)(376002)(39860400002)(346002)(189003)(199004)(2906002)(476003)(25786009)(229853002)(5660300002)(316002)(86362001)(6486002)(256004)(14444005)(118296001)(478600001)(14454004)(3846002)(486006)(6116002)(66066001)(2501003)(81166006)(53936002)(73956011)(81156014)(8676002)(11346002)(6436002)(68736007)(99286004)(6246003)(71190400001)(446003)(52116002)(50226002)(8936002)(71200400001)(4326008)(186003)(26005)(386003)(6506007)(36756003)(305945005)(54906003)(102836004)(2616005)(66556008)(53546011)(66476007)(66946007)(6512007)(110136005)(7416002)(7736002)(66446008)(76176011)(64756008)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5876;
 H:AM0PR02MB5572.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qoLuIZz/brKdOeNREmuk27HyEQQSuWDyy9yb930bYuU4z4WSD1almcdFmSu6EurZt58b0z0Y9jIlPxtbgw8iKMEOywtYUCoDVuGbgXgoSD3obTaxV+YG21wmqKikLsyf2oEa1yz3z621gC6h1PZMq48t6CYyQ9Xj0tCBz2xDckYTrmOwsb0/XyfIL+x74HKl0D9YWzCaKI7c0LEOkA2+bV6jU7MNurx4X5Q38Ifqtu9YApY3vE7hhD7BFAgrwOYNKOFl2txwwUu3FKgRLBmSWy/g3td6k/5486MYOsJpDF1J5BiSEnGUFb0P39VvO8Zv4jGbgIdWtvf5CJtOj5Xt5QT2u1/HxCmzev96OQNleYOUswEDLowxRUvLp6bJw90TeTsRWlKzjB6o3+elhyanEo2xxwuaVr+9UTi/wllOwjw=
Content-ID: <DFBF78B8D2542B49B08EB464CDC7D109@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40091104-8a28-491c-6148-08d6e9d77c9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 17:01:44.1056 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppircalabu@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5876
Subject: Re: [Xen-devel] [PATCH 8/9] vm_event: Add vm_event_ng interface
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMDE5LTA2LTA0IGF0IDE1OjQzICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiBPbiAzMC8wNS8yMDE5IDE1OjE4LCBQZXRyZSBQaXJjYWxhYnUgd3JvdGU6DQo+ID4gDQo+ID4g
U2lnbmVkLW9mZi1ieTogUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNv
bT4NCj4gDQo+IFRoZXJlIGFyZSBhIG51bWJlciBvZiBjb25jZXJucyBoZXJlLg0KPiANCj4gRmly
c3QgYW5kIGZvcmVtb3N0LCB3aHkgaXMgYSBuZXcgZG9tY3RsIGJlaW5nIGFkZGVkPyAgU3VyZWx5
IHRoaXMNCj4gc2hvdWxkDQo+IGp1c3QgYmUgYSAidHlwZSBvZiByaW5nIGFjY2VzcyIgcGFyYW1l
dGVyIHRvIGV2ZW50X2VuYWJsZT8gDQo+IEV2ZXJ5dGhpbmcNCj4gZWxzZSBpbiB0aGUgdm1fZXZl
bnQgc2V0IG9mIEFQSXMgc2hvdWxkIGJlIHVuY2hhbmdlZCBhcyBhIHJlc3VsdCBvZg0KPiB0aGUN
Cj4gaW50ZXJmYWNlIGRpZmZlcmVuY2VzLg0KPiANCj4gT3IgYW0gSSBtaXNzaW5nIHNvbWV0aGlu
Zz8NCj4gDQpJJ3ZlIHVzZWQgZGlmZmVyZW50IGRvbWN0bHMgaW4gb3JkZXIgdG8gY29tcGxldGVs
eSBzZXBhcmF0ZSB0aGUgbmV3DQppbnRlcmZhY2UgZnJvbSB0aGUgb2xkIG9uZS4NCk9uZSB0aGlu
ZyBJIGRvbid0IHJlYWxseSBsaWtlIGFib3V0IHRoZSBvbGQgdm1fZXZlbnQgaW50ZXJmYWNlIGlz
IHRoYXQNCnRoZSAiY3JlYXRlIiBhbmQgInN0YXJ0IiBvcGVyYXRpb25zIGFyZSBoYW5kbGVkIGlu
IHRoZSBzYW1lIGNhbGwNCihYRU5fVk1fRVZFTlRfRU5BQkxFKS4NClRoZXNlIGNhbGxzIHNob3Vs
ZCBzZXBhcmF0ZWQgaW4gdGhlIG5ldyBpbnRlcmZhY2UgYmVjYXVzZSB0aGUgY2xpZW50DQpuZWVk
cyB0byBwZXJmb3JtIGl0cyBvd24gaW5pdGFsaXphdGlvbiAobWFwcGluZyB0aGUgcmVzb3VyY2Ug
YW5kIGV2ZW50DQpjaGFubmVsIGJpbmRpbmcpIGJldHdlZW4gImNyZWF0ZSIgYW5kICJzdGFydCIu
DQoNCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi92bV9ldmVudF9uZy5jIGIveGVuL2NvbW1v
bi92bV9ldmVudF9uZy5jDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAw
MDAwLi4xN2FlMzNjDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL3hlbi9jb21tb24vdm1f
ZXZlbnRfbmcuYw0KPiA+IDxzbmlwPg0KPiA+IA0KPiA+ICtzdGF0aWMgaW50IHZtX2V2ZW50X2No
YW5uZWxzX2FsbG9jX2J1ZmZlcihzdHJ1Y3QNCj4gPiB2bV9ldmVudF9jaGFubmVsc19kb21haW4g
KmltcGwpDQo+ID4gK3sNCj4gPiArICAgIGludCBpLCByYyA9IC1FTk9NRU07DQo+ID4gKw0KPiA+
ICsgICAgZm9yICggaSA9IDA7IGkgPCBpbXBsLT5ucl9mcmFtZXM7IGkrKyApDQo+ID4gKyAgICB7
DQo+ID4gKyAgICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSA9IGFsbG9jX2RvbWhlYXBfcGFn
ZShpbXBsLT52ZWQuZCwNCj4gPiAwKTsNCj4gDQo+IFRoaXMgY3JlYXRlcyBwYWdlcyB3aGljaCBh
cmUgcmVmZXJlbmNlLWFibGUgKGluIHByaW5jaXBsZSkgYnkgdGhlDQo+IGd1ZXN0LA0KPiBhbmQg
YXJlIGJvdW5kZWQgYnkgZC0+bWF4X3BhZ2VzLg0KPiANCj4gQm90aCBvZiB0aGVzZSBhcmUgcHJv
cGVydGllcyBvZiB0aGUgZXhpc3RpbmcgaW50ZXJmYWNlIHdoaWNoIHdlJ2QNCj4gcHJlZmVyDQo+
IHRvIHJlbW92ZS4NClRoZSBhbGxvY2F0aW9uIG1lY2hhbmlzbSBpcyBzaW1pbGFyIHdpdGggdGhl
IG9uZSB1c2VkIGJ5IGlvcmVxICh0aGUNCm1haW4gZGlmZmVyZW5jZSBpcyB0aGUgbnVtYmVyIG9m
IHBhZ2VzKS4NCj4gDQo+ID4gKyAgICAgICAgaWYgKCAhcGFnZSApDQo+ID4gKyAgICAgICAgICAg
IGdvdG8gZXJyOw0KPiA+ICsNCj4gPiArICAgICAgICBpZiAoICFnZXRfcGFnZV9hbmRfdHlwZShw
YWdlLCBpbXBsLT52ZWQuZCwNCj4gPiBQR1Rfd3JpdGFibGVfcGFnZSkgKQ0KPiA+ICsgICAgICAg
IHsNCj4gPiArICAgICAgICAgICAgcmMgPSAtRU5PREFUQTsNCj4gPiArICAgICAgICAgICAgZ290
byBlcnI7DQo+ID4gKyAgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgICBpbXBsLT5tZm5baV0g
PSBwYWdlX3RvX21mbihwYWdlKTsNCj4gPiArICAgIH0NCj4gPiArDQo+ID4gKyAgICBpbXBsLT5z
bG90cyA9IChzdHJ1Y3Qgdm1fZXZlbnRfc2xvdCAqKXZtYXAoaW1wbC0+bWZuLCBpbXBsLQ0KPiA+
ID5ucl9mcmFtZXMpOw0KPiANCj4gWW91IGFwcGVhciB0byBoYXZlIG9wZW5jb2RlZCB2bWFsbG9j
KCkgaGVyZS4gIElzIHRoZXJlIGFueSByZWFzb24gbm90DQo+IHRvDQo+IHVzZSB0aGF0Pw0KPiAN
Cg0KVGhlIHByb2JsZW0gd2l0aCB2bWFsbG9jIGlzIHRoYXQgaWYgdGhlIHBhZ2VzIGFyZSBub3Qg
YXNzaWduZWQgdG8gYQ0Kc3BlY2lmaWMgZG9tYWluIHRoZSByZW1hcHBpbmcgZmFpbHMgaW4gdGhl
IG1vbml0b3IgZG9tYWluLg0KZS5nLjoNCi4uLg0KKFhFTikgbW0uYzoxMDE1OmQwdjIgcGdfb3du
ZXIgZDEgbDFlX293bmVyIGQwLCBidXQgcmVhbF9wZ19vd25lciBkLTENCihYRU4pIG1tLmM6MTA5
MTpkMHY3IEVycm9yIGdldHRpbmcgbWZuIDVmYmY1MyAocGZuIGZmZmZmZmZmZmZmZmZmZmYpDQpm
cm9tIEwxIGVudHJ5IDgwMDAwMDA1ZmJmNTMyMjcgZm9yIGwxZV9vd25lciBkMCwgcGdfb3duZXIg
ZDENCg0KPiA+ICtlcnI6DQo+ID4gKyAgICBzcGluX3VubG9jaygmaW1wbC0+dmVkLmxvY2spOw0K
PiA+ICsgICAgWEZSRUUoaW1wbCk7DQo+IA0KPiBZb3UgZG9uJ3QgZnJlZSB0aGUgZXZlbnQgY2hh
bm5lbHMgb24gZXJyb3IuDQo+IA0KPiBQbGVhc2Ugd3JpdGUgbWFrZSB0aGUgZGVzdHJ1Y3RvciBp
ZGVtcG90ZW50IGFuZCBjYWxsIGl0IGZyb20gaGVyZS4NCj4gDQo+ID4gDQo+ID4gKyNpZmRlZiBD
T05GSUdfSEFTX01FTV9QQUdJTkcNCj4gPiArICAgIGNhc2UgWEVOX1ZNX0VWRU5UX1RZUEVfUEFH
SU5HOg0KPiA+ICsjZW5kaWYNCj4gPiArDQo+ID4gKyNpZmRlZiBDT05GSUdfSEFTX01FTV9TSEFS
SU5HDQo+ID4gKyAgICBjYXNlIFhFTl9WTV9FVkVOVF9UWVBFX1NIQVJJTkc6DQo+ID4gKyNlbmRp
Zg0KPiANCj4gVGhlc2UgYXJlIHVubmVjZXNzYXJ5LCBhcyB0aGV5IGRvbid0IGRldmlhdGUgZnJv
bSB0aGUgZGVmYXVsdC4NCj4gDQo+IH5BbmRyZXcNCj4gDQo+ID4gDQpJIHdpbGwgY29ycmVjdCB0
aGVzZSBpbiB0aGUgbmV4dCBwYXRjaHNldCBpdGVyYXRpb24uDQoNCk1hbnkgdGhhbmtzIGZvciB5
b3VyIHN1cHBvcnQsDQpQZXRyZQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34590B463
	for <lists+xen-devel@lfdr.de>; Sat, 27 Apr 2019 21:46:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hKTET-0006h8-Fy; Sat, 27 Apr 2019 19:43:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SU19=S5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hKTES-0006h2-As
 for xen-devel@lists.xenproject.org; Sat, 27 Apr 2019 19:43:32 +0000
X-Inumbo-ID: bad871e5-6924-11e9-843c-bc764e045a96
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.58]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bad871e5-6924-11e9-843c-bc764e045a96;
 Sat, 27 Apr 2019 19:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xT83Z4Jd9iseEnWPu5yQotcYkILt8bAuXstb6YIXqA8=;
 b=ax+A2/q7gW/yy0/UW6eUST5hoT9bsyUxzZ5rHRD5AyPZf7lqFnTaXC/DepYqlsvP18OFq71zrLST/Y8KiJduPyrOA36RHZt9E6SUn3XdaD9xSV5PVbd+vqAKlD4QEs3/3UcYq+qSd8dleEFYgtOWegt17fA0dp/sxHR1+upqAYM=
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com (52.134.93.144) by
 AM0PR08MB3907.eurprd08.prod.outlook.com (20.178.82.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Sat, 27 Apr 2019 19:43:26 +0000
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::59ea:42fc:c79f:8769]) by AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::59ea:42fc:c79f:8769%4]) with mapi id 15.20.1835.015; Sat, 27 Apr 2019
 19:43:26 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH] xen/arm: skip first page when RAM starts at 0x0
Thread-Index: AQHU+4+V8sBdh/eMtkuHR7Gc/qAr9KZNdRwAgAC0LgCAAAHiAIAABmQAgAB0LgD///IIAIAAcJIAgAAVZACAAU4YAA==
Date: Sat, 27 Apr 2019 19:43:26 +0000
Message-ID: <1f66675e-2dc7-6868-857c-6d96e949d5f6@arm.com>
References: <1556214715-22030-1-git-send-email-sstabellini@kernel.org>
 <981e7b3f-464b-d37c-e03e-22408ae65f85@arm.com>
 <5CC2CB8C02000078002295AA@prv1-mh.provo.novell.com>
 <e23e0f33-82c6-c592-06d9-8581c5400761@arm.com>
 <5CC2D27C02000078002295F6@prv1-mh.provo.novell.com>
 <43510317-ca8a-ed23-835a-86a28286b919@arm.com>
 <5CC3283A0200007800229832@prv1-mh.provo.novell.com>
 <72a0eee1-1d29-2368-3737-d37f7a4926c6@arm.com>
 <alpine.DEB.2.10.1904261621360.24598@sstabellini-ThinkPad-X260>
In-Reply-To: <alpine.DEB.2.10.1904261621360.24598@sstabellini-ThinkPad-X260>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0389.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::17) To AM0PR08MB3139.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: edcd2036-1164-439f-754c-08d6cb489dae
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB3907; 
x-ms-traffictypediagnostic: AM0PR08MB3907:
x-ms-exchange-purlcount: 1
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB3907C26F28F2C697FD62C4B8803F0@AM0PR08MB3907.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0020414413
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39850400004)(346002)(366004)(136003)(376002)(199004)(189003)(6116002)(72206003)(14454004)(966005)(2906002)(31696002)(68736007)(86362001)(478600001)(3846002)(2616005)(44832011)(53546011)(6506007)(386003)(26005)(102836004)(31686004)(11346002)(446003)(186003)(36756003)(66066001)(486006)(476003)(81166006)(97736004)(81156014)(73956011)(8676002)(305945005)(7736002)(25786009)(99286004)(8936002)(93886005)(5660300002)(66946007)(6246003)(53936002)(52116002)(66446008)(229853002)(64756008)(66556008)(66476007)(54906003)(6436002)(6486002)(4326008)(316002)(256004)(76176011)(14444005)(6916009)(71190400001)(71200400001)(6512007)(6306002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3907;
 H:AM0PR08MB3139.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hN5l37VovenH7bc4ygm9ILNKxXM8HtoLDrZeVqPEZ+HDcEkPXOASTOZ/isNELLA2Y9y8Urni+dA/Ey0fPWI8S4xsOvxdZhAJH1/RoUbaxoLseJ6R2XaQi+yGcvyHyWkTEz8v8bywGBnQnJEigty/ri0cyaimL1Urv1CWMHgsCvl9DiNZpQEpPB06rCiKEjYv5DB4YAeG3lHAL7dxf5Fk8DQm3exIXlPN/eBoWnzf3GNYdAwrSdqWJqAa3afKiuoUXil8Mr9miNRiXN2gCoB5FzqSL5enrGrYEDcxedThKuMXo4VcFru07k/TcqO+WrU3sSXCewAHZQPzLYVZIzg+hso00B+rBdmPjCkDc2DhuIu4qvjkXEUMjJbsNm1m5yyVqf1sFxXYgYKxPg++f1HqyJ1yPiaTe0XTzgdDeRUbsTU=
Content-ID: <13DF7E311E22A143ADC105BBFDDDF629@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edcd2036-1164-439f-754c-08d6cb489dae
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2019 19:43:26.7316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3907
Subject: Re: [Xen-devel] [PATCH] xen/arm: skip first page when RAM starts at
 0x0
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "206497@studenti.unimore.it" <206497@studenti.unimore.it>,
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIDI3LzA0LzIwMTkgMDA6NDcsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4g
T24gRnJpLCAyNiBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4gT24gNC8yNi8xOSA0
OjQ4IFBNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+PiBPbiAyNi4wNC4xOSBhdCAxNzozOCwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToNCj4+Pj4gT24gMjYvMDQvMjAxOSAxMDo0Miwg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+PiBPbiAyNi4wNC4xOSBhdCAxMToxOSwgPEp1bGll
bi5HcmFsbEBhcm0uY29tPiB3cm90ZToNCj4+Pj4+PiBTbyBob3cgZG9lcyB0aGUgUERYIHdvcmsg
Zm9yIG1lbW9yeSBiZWxvdyA0R0I/IERvIHlvdSBzdGlsbCBjYWxsDQo+Pj4+Pj4gcGZuX3RvX3Bk
eCBvciB0aG9zZSBwYWdlcz8NCj4+Pj4+DQo+Pj4+PiBPZiBjb3Vyc2UuIFdlIG1lcmVseSBuZXZl
ciBjb21wcmVzcyBhbnkgb2YgdGhlIGxvdyAzMiBhZGRyZXNzDQo+Pj4+PiBiaXRzLCBpLmUuIG91
ciBjaG9pY2UgaXMgbGltaXRlZCB0byBhZGRyZXNzIGJpdHMgMzIgLi4uIDUxLg0KPj4+Pg0KPj4+
PiBBaCwgdGhlIGNvZGUgbWFrZXMgYSBiaXQgbW9yZSBzZW5zZSBvbiB0aGUgeDg2IHNpZGUuIElz
IHRoZXJlIGFueSByZWFzb24NCj4+Pj4gdG8NCj4+Pj4gbGltaXQgdG8gYWRkcmVzcyBiaXQgMzIg
Li4gNTE/DQo+Pj4NCj4+PiBXZWxsLCB0aGVyZSBiZWluZyB2YXJpb3VzIHNwZWNpYWwgdGhpbmdz
IGltbWVkaWF0ZWx5IGJlbG93IDRHYg0KPj4+IHRoZXJlJ3Mgc2ltcGx5IGxpdHRsZSBwb2ludCBp
biB0cnlpbmcgdG8gc3F1YXNoIGFueSBvZiB0aGUgbG93ZXIgYml0cy4NCj4+Pg0KPj4+PiBGb3Ig
QXJtLCB3ZSBjYW4ndCBjb21wcmVzcyBiaXRzIDAgLi4uIDMwIGR1ZSB0byB0aGUgYnVkZHkgYWxs
b2NhdG9yIChzZWUNCj4+Pj4gcGZuX3BkeF9ob2xlX3NldHVwKS4gU28gd2UgY291bGQgaWdub3Jl
IHRoZSBmaXJzdCAxR0Igb2YgUkFNLg0KPj4+DQo+Pj4gQml0cyAwIC4uLiAzMCB3b3VsZCBiZSB0
aGUgZmlyc3QgMkdiIGFmYWljdC4NCj4+DQo+PiBTb3JyeSBJIG1lc3NlZCB1cyBteSBtYXRocy4g
SSBtZWFudCAwIC4uLiAyOSAoTUFYX09SREVSID0gMTgpLg0KPj4NCj4+IEBTdGVmYW5vLCBkbyB5
b3UgdGhpbmsgeW91IGNhbiBoYXZlIGEgbG9vayBhdCBpdD8NCj4gDQo+IEFmdGVyIGFuIGV4dGVu
c2l2ZSBvbmxpbmUgZGVidWdnaW5nIHNlc3Npb24gd2l0aCBKdWxpZW4sIHdlIGZvdW5kIGEgZml4
DQo+IHRvIHRoZSBQRFggY29kZSB0aGF0IG1ha2VzIHRoZSBtYXNrcyBhbmQgbnJfcGR4cyBjYWxj
dWxhdGlvbiBjb3JyZWN0Lg0KPiBTZWUgdGhlIGFwcGVuZGVkIHBhdGNoIGJlbG93Lg0KPiANCj4g
TWFzayBpcyBpbml0aWFsaXplZCB0byAwIHRvIHRoZSBsZXQgdGhlIGFsZ29yaXRobSBjb21wdXRl
IHRoZSByaWdodCBtYXNrDQo+IGJhc2VkIG9uIHRoZSBSQU0gYmFua3MuIHBkeF9pbml0X21hc2sg
ZG9lc24ndCBjb3BlIHdpdGggYSBzdGFydCBhZGRyZXNzDQo+IG9mIDB4MCBiZWNhdXNlIGl0IGRv
ZXMgYGJhc2VfYWRkciAtIDEnIHdoaWNoIGNhdXNlcyBhIHdyYXAgYXJvdW5kIHdoZW4NCj4gYmFz
ZV9hZGRyIGlzIDB4MC4gVGhhdCB3b3JrcyBPSyBhcyBmYXIgYXMgSSBjYW4gdGVsbCBhbmQgdGhl
IHJlc3VsdGluZw0KPiB2YWx1ZXMgb2YgYHBmbl9wZHhfYm90dG9tX21hc2snLCBgcGZuX3RvcF9t
YXNrJywgYW5kDQo+IGBwZm5fcGR4X2hvbGVfc2hpZnQnIHNlZW1zIGNvcnJlY3QgKHRoZXkgbWF0
Y2ggdGhlIGNhc2Ugd2hlcmUgSSBmb3JjZQ0KPiByYW1fc3RhcnQgPSBQQUdFX1NJWkUpLg0KDQpX
ZWxsLCBJIGFza2VkIHRvIHVzZSAwIGFzIGEgbWFzayB0byB1bmRlcnN0YW5kIGEgYml0IG1vcmUg
dGhlIGlzc3VlIGluIA0KdGhlIGFsZ29yaXRobS4gTm93LCB3ZSBuZWVkIHRvIHVuZGVyc3RhbmQg
d2hldGhlciB0aGlzIGlzIHRoZSByaWdodCANCnRoaW5nIHRvIGRvIGV2ZXJ5dGltZS4NCg0KSW4g
dGhpcyBjYXNlLCBKYW4gaGFzIHBvaW50ZWQgb3V0IHRoYXQgb24geDg2IHRoZXkgZG9uJ3QgY29t
cHV0ZSB0aGUgUERYIA0KY29tcHJlc3Npb24gdXNpbmcgYW55IFJBTSBiZWxvdyA0R0IuDQoNCkZv
ciBBcm0sIHRoZXJlIGFyZSBsaW1pdGVkIHJlYXNvbiB0byB1c2UgYW55IFJBTSBiZWxvdyAxR0Ig
dG8gd29yayBvdXQgDQp0aGUgUERYIGNvbXByZXNzaW9uIGJlY2F1c2UgdGhleSB3aWxsIG5vdCBi
ZSBpZ25vcmVkIGJ5IHRoZSBQRFggYWxsb2NhdG9yLg0KDQpTbyBtYXliZSBhIG1vcmUgc2Vuc2li
bGUgY2hvaWNlIChhbmQgcG90ZW50aWFsbHkgcmVxdWlyaW5nIGxlc3MgYnJhaW4gDQp3b3JrIDop
KSBpcyB0byBzZXQgYSBib3VuZGFyeSBiZWxvdyB3aGljaCB0aGVyZSBhcmUgbm8gcG9pbnQgdG8g
dXNlIGZvciANCmJpdHMgdG8gY29tcGFjdC4NCg0KTXkgc3VnZ2VzdGlvbiB3b3VsZCBiZSB0byBm
b2xsb3cgeDg2IGFuZCB1c2UgNEdCLg0KDQo+IFRoZSBvdGhlciBjaGFuZ2UgdG8gbnJfcGR4cyBp
cyBsZXNzIG9idmlvdXMuIEl0IGlzIGNsZWFyIHRoYXQgbnJfcGR4cyBpcw0KPiBjYWxjdWxhdGVk
IHdyb25nbHkgaW4gdGhpcyBjYXNlIChtZW1vcnkgMC0weDgwMDAwMDAwLA0KPiAweDgwMDAwMDAw
MC0weDg4MDAwMDAwMCwgcHM9MCwgcGU9MHg4ODAwMDAwMDApOiBucl9wZHhzPTUyNDI4OCB3aGlj
aCBpcw0KPiBoYWxmIHRoZSBudW1iZXIgd2UgbmVlZCAodGhlIGNvcnJlY3QgbnVtYmVyIGlzIDEw
NDg1NzUpLg0KPiANCj4gVGFraW5nIGEgbGluZSBmcm9tIHRoZSB4ODYgY29kZSB4ZW4vYXJjaC94
ODYvc2V0dXAuYzpzZXR1cF9tYXhfcGR4DQo+IChKdWxpZW4ncyBzdWdnZXN0aW9uKToNCj4gDQo+
ICAgIG1heF9wZHggPSBwZm5fdG9fcGR4KHRvcF9wYWdlIC0gMSkgKyAxOw0KPiANCj4gSSBjaGFu
Z2VkIG5yX3BkeHMgdG8NCj4gICAgDQo+ICAgIG5yX3BkeHMgPSBwZm5fdG9fcGR4KChwZSA+PiBQ
QUdFX1NISUZUKSAtIDEpICsgMTsNCj4gDQo+IGFuZCBpdCB3b3Jrcy4gSSB0aGluayB0aGUgY2hh
bmdlIGlzIGNvcnJlY3QgYmVjYXVzZSBsb29raW5nIGF0IHRoZQ0KPiBpbXBsZW1lbnRhdGlvbiBv
ZiBwZm5fdG9fcGR4IGl0IGlzIGNlcnRhaW5seSBtZWFudCB0byBvcGVyYXRlIG9uIGEgcGZuDQo+
IG1hc2tpbmcgYml0cyBvbiBpdCB0byBjb21wZW5zYXRlIGZvciB0aGUgaG9sZXMuIEl0IGlzIG5v
dCBtZWFudCB0byB3b3JrDQo+IG9uIGEgc2l6ZS4NCg0KV2hpbGUgdGhlIGNoYW5nZSBtYWtlcyBw
ZXJmZWN0IHNlbnNlIHRvIG1lLCAgSSBzdGlsbCBkb24ndCB1bmRlcnN0YW5kIA0KaG93IHRoaXMg
aGFzIGV2ZXIgd29ya2VkIG9uIEFybS4gU3VyZWx5IGlmIHdlIHBhc3NlZCBhIHNpemUgcmF0aGVy
IHRoYW4gDQphIFBGTiB0aGVuIHRoZSBjb21wdXRhdGlvbiB3aWxsIGJlIHdyb25nLiBIb3cgZG8g
d2UgZ2V0IGF3YXkgdG9kYXk/IElzIA0KaXQgYmVjYXVzZSB0aGUgZnJhbWV0YWJsZSB3aWxsIGFs
d2F5cyBiZSBhIG11bHRpcGxlIG9mIDJNQiAob3IgMzJNQiBpZiANCmJpZ2dlciB0aGFuIDMyTUIp
PyBCdXQgdGhlbiBpdCB3b3VsZCBtZWFuIHRoYXQgc29tZSBwYWdlX2luZm8gbWF5IG5vdCBiZSAN
CmluaXRpYWxpemVkIGNvcnJlY3RseS4NCg0KSSBoYXZlIHNlZW4gcmVwb3J0IHJlZ2FyZGluZyBt
ZW1vcnkgaXNzdWUgb24gWGVuIHJlY2VudGx5IFsxXSAoZGF0YSANCmFib3J0IG9uIHBhZ2VfaW5m
bykuIFRoaXMgc2VlbXMgdG8gaGFwcGVuIGJlY2F1c2Ugd2Ugc3RvcCByZWxvY2F0aW5nIFhlbiAN
CnRvd2FyZHMgdGhlIGVuZCBvZiB0aGUgbWVtb3J5LiBJIGFtIHdvbmRlcmluZyB3aGV0aGVyIHRo
ZSBpc3N1ZSBpcyANCmJlY2F1c2Ugb2YgdGhlIHdheSB3ZSBzZXR1cCB0aGUgZnJhbWV0YWJsZSBh
cyB3ZWxsLg0KDQpbMV0gDQpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0
bWwveGVuLWRldmVsLzIwMTktMDMvbXNnMDE0ODMuaHRtbA0KDQpDaGVlcnMsDQoNCi0tIA0KSnVs
aWVuIEdyYWxsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

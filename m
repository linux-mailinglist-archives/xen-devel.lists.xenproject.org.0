Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD0424199
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 21:56:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSoLZ-0005O2-E7; Mon, 20 May 2019 19:53:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DuAc=TU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hSoLX-0005Nw-JD
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 19:53:19 +0000
X-Inumbo-ID: e853e25b-7b38-11e9-8980-bc764e045a96
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::60d])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e853e25b-7b38-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 19:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTLI4CcrhIk6W8/DRwutYIOl8IHGAuExUT1JU5DaiEc=;
 b=b2MAnstj9aIiHf+u+RCkrUQHYClwH4RMYdo0UZPqVM5Kv2p3ysJtZ/MqgfuCVoDVDZkch4x0Q5J3J8JV9nxLoZh3FsRVy00CNGiHnHk9nnwk4NgexGyIkdej+d+KZW44NrF6gtHSOPg3WeswpkeQ+GDX2Ylxls1syrB7AajbayY=
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com (52.134.93.144) by
 AM0PR08MB5138.eurprd08.prod.outlook.com (10.255.30.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Mon, 20 May 2019 19:53:14 +0000
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::3498:cf18:7cd6:d98b]) by AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::3498:cf18:7cd6:d98b%7]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 19:53:14 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH MM-PART1 v3 1/8] xen/arm: Don't boot Xen on platform
 using AIVIVT instruction caches
Thread-Index: AQHVCk4xiIt7zyljAkaCDm2ea/z5qaZ0ZvoAgAAPuQA=
Date: Mon, 20 May 2019 19:53:14 +0000
Message-ID: <42c29444-01b0-cb6a-a8e7-3642175402f7@arm.com>
References: <20190514121132.26732-1-julien.grall@arm.com>
 <20190514121132.26732-2-julien.grall@arm.com>
 <alpine.DEB.2.21.1905201143390.16404@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1905201143390.16404@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0501CA0009.eurprd05.prod.outlook.com
 (2603:10a6:4:8f::19) To AM0PR08MB3139.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.100.41.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7ad1274-d1ff-4072-51e4-08d6dd5ccb88
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB5138; 
x-ms-traffictypediagnostic: AM0PR08MB5138:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB51383A9818955C915AC4369880060@AM0PR08MB5138.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(366004)(39860400002)(346002)(376002)(52314003)(199004)(189003)(6246003)(68736007)(54906003)(5660300002)(36756003)(66066001)(86362001)(71190400001)(71200400001)(76176011)(7736002)(6506007)(53546011)(386003)(26005)(186003)(8936002)(8676002)(99286004)(81166006)(81156014)(52116002)(316002)(31696002)(72206003)(446003)(229853002)(256004)(14444005)(478600001)(44832011)(102836004)(476003)(11346002)(2616005)(486006)(6916009)(6486002)(3846002)(305945005)(14454004)(2906002)(53936002)(66476007)(6436002)(64756008)(66556008)(25786009)(4326008)(31686004)(6116002)(66446008)(66946007)(6512007)(73956011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB5138;
 H:AM0PR08MB3139.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YA+aBbwtgccPg3Q5hbFGD/oKB6IGPLVSQ0Lnc0VnUGOQPsd+OhsaMBG1tVpJGL9o/GzJfWjlixfSBTULyw6Nc3HO9iZd+Si95EAfXZoNw2mfFCBWT18EDIs9nXFySWs6OfyvMgIvbXeNPg7Cxs3y2x414F3uVY6dfw+tBWA9xvgHq+SWwLBkutPRruYQfwuRk51UMIvNwArFPq5ebPSUTV+ckdVKpqcJYJwaCW3J4oB0BjiCf4+nn+ofOrjlEY/k6s/59ccpSvqlj7raN1hSxeAgBiAMT7wSGZexChE1uagUvehV/lCBTuEZQi9lHdueOyzWjxKLHVQ2YnSrUx+bwHrxsTz5MzLeOM5QeNGC9Q3BPEslvLSuc1UFOZwf9p7VSDdfLBugQYTAREBKSr42CJiMeP10rHNukCREsyy0srw=
Content-ID: <9E174BCC65233A488ABF7D5B8B2B1183@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ad1274-d1ff-4072-51e4-08d6dd5ccb88
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 19:53:14.3380 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5138
Subject: Re: [Xen-devel] [PATCH MM-PART1 v3 1/8] xen/arm: Don't boot Xen on
 platform using AIVIVT instruction caches
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>,
 "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIDIwLzA1LzIwMTkgMTk6NTYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4g
T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4gVGhlIEFJVklWVCBp
cyBhIHR5cGUgb2YgaW5zdHJ1Y3Rpb24gY2FjaGUgYXZhaWxhYmxlIG9uIEFybXY3LiBUaGlzIGlz
DQo+PiB0aGUgb25seSBjYWNoZSBub3QgaW1wbGVtZW50aW5nIHRoZSBJVklQVCBleHRlbnNpb24g
YW5kIHRoZXJlZm9yZQ0KPj4gcmVxdWlyaW5nIHNwZWNpZmljIGNhcmUuDQo+Pg0KPj4gVG8gc2lt
cGxpZnkgbWFpbnRlbmFuY2UgcmVxdWlyZW1lbnRzLCBYZW4gd2lsbCBub3QgYm9vdCBvbiBwbGF0
Zm9ybQ0KPj4gdXNpbmcgQUlWSVZUIGNhY2hlLg0KPj4NCj4+IFRoaXMgc2hvdWxkIG5vdCBiZSBh
biBpc3N1ZSBiZWNhdXNlIFhlbiBBcm0zMiBjYW4gb25seSBib290IG9uIGEgc21hbGwNCj4+IG51
bWJlciBvZiBwcm9jZXNzb3JzIChzZWUgYXJjaC9hcm0vYXJtMzIvcHJvYy12Ny5TKS4gQWxsIG9m
IHRoZW0gYXJlDQo+PiBub3QgdXNpbmcgQUlWSVZUIGNhY2hlLg0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+DQo+IA0KPiBBcyB3ZSBoYXZl
IGFscmVhZHkgZGlzY3Vzc2VkLCBJIGFtIE9LIHdpdGggdGhpcyBhbmQgbmVpdGhlciBvZiB1cw0K
PiBmb3Jlc2VlIGFueSBpc3N1ZXMuIEdpdmVuIHRoYXQgaXQgY291bGQgYmUgY29uc2lkZXJlZCBh
cyBhIGRyb3AgaW4NCj4gc3VwcG9ydCBmb3Igc29tZXRoaW5nLCBJIHRoaW5rIGl0IHdvdWxkIGJl
IG5pY2UgdG8gc2VuZCBhbiBlbWFpbCBvdXRzaWRlDQo+IG9mIHRoZSBzZXJpZXMgdG8gc2F5IHdl
IHdvbid0IHN1cHBvcnQgQUlWSVZUIHByb2Nlc3NvcnMgYW55IGxvbmdlciwNCj4gdXNpbmcgd29y
ZHMgZWFzaWVyIHRvIHVuZGVyc3RhbmQgdG8gdXNlcnMgKG5vdCBuZWNlc3NhcmlseSBkZXZlbG9w
ZXJzKS4NCg0KVXNlcnMgb2Ygd2hhdD8gWGVuIHVwc3RyZWFtIHdpbGwgKnBhbmljKiBvbiBldmVy
eSBwcm9jZXNzb3Igbm90IGxpc3RlZCANCmluIGFyY2gvYXJtL2FybTMyL3Byb2MtdjcuUyBldmVu
IHdpdGhvdXQgdGhpcyBwYXRjaC4NCg0KPiBXb3VsZCB5b3UgYmUgYWJsZSB0byBkbyB0aGF0PyBJ
IGNhbiBoZWxwIHlvdSB3aXRoIHRoZSB0ZXh0Lg0KV2hpbGUgaW4gdGhlb3J5IHRoaXMgc291bmRz
IHNlbnNpYmxlLCBmb3IgcmVhY2hpbmcgdGhlIHBhbmljIGFkZGVkIGluIA0KdGhpcyBwYXRjaCwg
eW91IHdvdWxkIG5lZWQgb3V0LW9mLXRyZWUgcGF0Y2hlcy4gU28gaW4gcHJhY3RpY2UgeW91IGFy
ZSANCnNheWluZyB3ZSBzaG91bGQgY2FyZSBhYm91dCBvdXQtb2YtdHJlZSB1c2Vycy4NCg0KSSBo
YXZlIGFscmVhZHkgZW5vdWdoIHRvIGNhcmUgYWJvdXQgWGVuIHVwc3RyZWFtIGl0c2VsZiB0aGF0
IG91dC1vZi10cmVlIA0KaXMgbXkgbGFzdCBjb25jZXJuLiBJZiBzb21lb25lIHdlcmUgdXNpbmcg
b3V0LW9mLXRyZWUgdGhlbiB0aGVuIHRvbyBiYWQgDQp0aGV5IHdpbGwgc2VlIHRoZSBwYW5pYy4N
Cg0KVEJILCBJIGFtIHByZXR0eSBzdXJlIHdlIGRvbid0IGN1cnJlbnRseSBwcm9wZXJseSBmb2xs
b3cgdGhlIG1haW50ZW5hbmNlIA0KcmVxdWlyZW1lbnRzLi4uIFNvIHdlIGFyZSBtYWtpbmcgdGhl
bSBhIGZhdm9yIHRvIGFkZCBhIHBhbmljLiBCZWZvcmUgDQp0aGV5IGNvdWxkIGp1c3Qgc2VlIHJh
bmRvbSBjb3JydXB0aW9uLi4uDQoNCkFueXdheSwgZmVlbCBmcmVlIHRvIHNlbmQgdGhlIG1lc3Nh
Z2UgeW91cnNlbGYuDQoNCj4gDQo+IA0KPj4gLS0tDQo+Pg0KPj4gICAgICBDaGFuZ2VzIGluIHYz
Og0KPj4gICAgICAgICAgLSBQYXRjaCBhZGRlZA0KPj4gLS0tDQo+PiAgIHhlbi9hcmNoL2FybS9z
ZXR1cC5jICAgICAgICAgICAgfCA1ICsrKysrDQo+PiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vcHJv
Y2Vzc29yLmggfCA1ICsrKysrDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc2V0dXAuYyBiL3hlbi9hcmNoL2Fy
bS9zZXR1cC5jDQo+PiBpbmRleCBjY2IwZjE4MWVhLi5mYWFmMDI5Yjk5IDEwMDY0NA0KPj4gLS0t
IGEveGVuL2FyY2gvYXJtL3NldHVwLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jDQo+
PiBAQCAtNTI2LDEwICs1MjYsMTUgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX21tKHVuc2ln
bmVkIGxvbmcgZHRiX3BhZGRyLCBzaXplX3QgZHRiX3NpemUpDQo+PiAgICAgICB1bnNpZ25lZCBs
b25nIGJvb3RfbWZuX3N0YXJ0LCBib290X21mbl9lbmQ7DQo+PiAgICAgICBpbnQgaTsNCj4+ICAg
ICAgIHZvaWQgKmZkdDsNCj4+ICsgICAgY29uc3QgdWludDMyX3QgY3RyID0gUkVBRF9DUDMyKENU
Uik7DQo+PiAgIA0KPj4gICAgICAgaWYgKCAhYm9vdGluZm8ubWVtLm5yX2JhbmtzICkNCj4+ICAg
ICAgICAgICBwYW5pYygiTm8gbWVtb3J5IGJhbmtcbiIpOw0KPj4gICANCj4+ICsgICAgLyogV2Ug
b25seSBzdXBwb3J0cyBpbnN0cnVjdGlvbiBjYWNoZXMgaW1wbGVtZW50aW5nIHRoZSBJVklQVCBl
eHRlbnNpb24uICovDQo+IA0KPiBQbGVhc2UgbWVudGlvbiB0aGF0IElWSVBUIGNhbiBvbmx5IGJl
IGltcGxlbWVudGVkIGJ5IFBJUFQgYW5kIFZJUFQNCj4gY2FjaGVzLCBub3QgYnkgQUlWSVZUIGNh
Y2hlcy4gVGhhdCBzaG91bGQgbWFrZSBpdCBzdHJhaWdodGZvcndhcmQgdG8NCj4gdW5kZXJzdGFu
ZCB0aGUgcmVhc29uIGZvciB0aGUgcGFuaWMgYmVsb3cuDQoNCkkgd291bGQgcHJlZmVyIHRvIGFk
ZCAiVGhpcyBpcyBub3QgdGhlIGNhc2Ugb2YgQUlWSVZUIiByYXRoZXIgdGhhbiANCnNwZWxsaW5n
IG91dCB0aGUgb3RoZXIgY2FjaGVzLg0KDQpDaGVlcnMsDQoNCg0KLS0gDQpKdWxpZW4gR3JhbGwN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

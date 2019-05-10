Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3818A1A30B
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 20:38:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hPAMY-0008F1-Nj; Fri, 10 May 2019 18:35:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=thpN=TK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hPAMX-0008Ew-2N
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 18:35:17 +0000
X-Inumbo-ID: 59b3d5e0-7352-11e9-8980-bc764e045a96
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::630])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 59b3d5e0-7352-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 18:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e63E0Ne+J3x5OhoK6JvSMXaJIHjaSDFmYoTc7s9FHqw=;
 b=AdYztml2BsKw/lV5mZ7QhK3ZQOeNsJppRDiimAc7yn7KIB2+I46mU4wgkfy8Dc0GeRUH0/4I1XqnGRncTWmqMXkckOzk34h3zd+dRvB/KCgK8f6IbVcJg49vo3B78XsHXFnp9tbd/iwdHwRRHtl4KE3fCJDkdAeMj4o0efRvo+g=
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com (52.134.93.144) by
 AM0PR08MB3538.eurprd08.prod.outlook.com (20.177.109.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Fri, 10 May 2019 18:35:13 +0000
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::3498:cf18:7cd6:d98b]) by AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::3498:cf18:7cd6:d98b%7]) with mapi id 15.20.1878.022; Fri, 10 May 2019
 18:35:13 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH v2 4/7] xen/arm: page: Clarify the Xen TLBs helpers name
Thread-Index: AQHVBbleI/E+c66c/k2S05mcqExj0KZjO/yAgAAV8ACAAAPygIABK2gAgAAnAoCAAAp3AA==
Date: Fri, 10 May 2019 18:35:12 +0000
Message-ID: <10c3ba27-c0df-a0d4-4033-530ec99291ac@arm.com>
References: <20190508161603.21964-1-julien.grall@arm.com>
 <20190508161603.21964-5-julien.grall@arm.com>
 <alpine.DEB.2.21.1905091307080.25766@sstabellini-ThinkPad-T480s>
 <5fe19f3a-e17b-04b5-ff15-5579ebe789eb@arm.com>
 <cc1d2550-794c-842d-26db-178f614f81b3@arm.com>
 <4b1d9bf6-bf3b-a5ec-da06-534618bb34a8@arm.com>
 <alpine.DEB.2.21.1905101050260.25766@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1905101050260.25766@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::14) To AM0PR08MB3139.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54911ae8-8e68-4fb1-1f1d-08d6d5763d04
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB3538; 
x-ms-traffictypediagnostic: AM0PR08MB3538:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB353830E954629D1BCE88FFDA800C0@AM0PR08MB3538.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(366004)(136003)(39860400002)(346002)(189003)(199004)(31686004)(446003)(71200400001)(478600001)(71190400001)(25786009)(6116002)(3846002)(72206003)(8676002)(8936002)(186003)(81156014)(81166006)(14454004)(305945005)(26005)(2906002)(5660300002)(7736002)(53546011)(6506007)(386003)(6916009)(102836004)(76176011)(44832011)(6486002)(36756003)(66476007)(73956011)(64756008)(66946007)(66446008)(66556008)(66066001)(86362001)(31696002)(229853002)(6436002)(476003)(6246003)(316002)(256004)(14444005)(6512007)(4326008)(11346002)(54906003)(2616005)(53936002)(68736007)(99286004)(52116002)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3538;
 H:AM0PR08MB3139.eurprd08.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BTBUL4ej6xDCLQ0NlwquNQpwO+Z0JbDO0n2BVV3fxSqTkcR53wgZOmP4q2+0khOEpodbKcEdTVSuTyKbAB9DhqHIZfZB9nFcXEppnA+2mIuDQzIskbNPJIGGo0OWMvA21kG8+h2SCnp3n/TilM1MfqeJRj3xSivoEjXJ9iAuSj0ulye7ICQ/izKuIDGcknP5tI6ln0fULsgDw1h0YHgnI5qJzAF7B1qnAyMX0o/whdtuMuLDosCuzj+etteVsdcU3yF/akfs9WzhUQ+WIb5l8eravG9wjY6CH9UfMvb4UyUh8UfhiNadncG285Cc43wkvhllcIaCZuMxd/dJJ17aUasU1pN+TCT9jhxy5Oyqeh7DbGvUmRcwp7iqd4hYYuUKrcNGAD+bw306+mzKEFEeTz8EcyLXMzwZ/qLHmmMiQkY=
Content-ID: <51B40BC1B5B6AB40A0EEE73966D8C548@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54911ae8-8e68-4fb1-1f1d-08d6d5763d04
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 18:35:12.8719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3538
Subject: Re: [Xen-devel] [PATCH v2 4/7] xen/arm: page: Clarify the Xen TLBs
 helpers name
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
 nd <nd@arm.com>, Andrii Anisov <Andrii_Anisov@epam.com>,
 "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIDEwLzA1LzIwMTkgMTg6NTcsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4g
T24gRnJpLCAxMCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4gT24gMDkvMDUvMjAx
OSAyMjo0NiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpLA0KPj4+DQo+Pj4gT24gMDkvMDUv
MjAxOSAyMTozMiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+PiBIaSwNCj4+Pj4NCj4+Pj4gT24g
MDkvMDUvMjAxOSAyMToxMywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+Pj4gT24gV2Vk
LCA4IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+Pj4gIMKgIC8qIFJlbGVhc2Ug
YWxsIF9faW5pdCBhbmQgX19pbml0ZGF0YSByYW5nZXMgdG8gYmUgcmV1c2VkICovDQo+Pj4+Pj4g
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJtMzIvcGFnZS5oDQo+Pj4+Pj4gYi94
ZW4vaW5jbHVkZS9hc20tYXJtL2FybTMyL3BhZ2UuaA0KPj4+Pj4+IGluZGV4IDQwYTc3ZGFhOWQu
LjBiNDFiOTIxNGIgMTAwNjQ0DQo+Pj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9hcm0z
Mi9wYWdlLmgNCj4+Pj4+PiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTMyL3BhZ2UuaA0K
Pj4+Pj4+IEBAIC02MSwxMiArNjEsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgaW52YWxpZGF0ZV9p
Y2FjaGVfbG9jYWwodm9pZCkNCj4+Pj4+PiAgwqDCoMKgwqDCoCBpc2IoKTvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogU3luY2hyb25pemUgZmV0Y2hlZCBpbnN0
cnVjdGlvbg0KPj4+Pj4+IHN0cmVhbS4gKi8NCj4+Pj4+PiAgwqAgfQ0KPj4+Pj4+IC0vKg0KPj4+
Pj4+IC0gKiBGbHVzaCBhbGwgaHlwZXJ2aXNvciBtYXBwaW5ncyBmcm9tIHRoZSBkYXRhIFRMQiBv
ZiB0aGUgbG9jYWwNCj4+Pj4+PiAtICogcHJvY2Vzc29yLiBUaGlzIGlzIG5vdCBzdWZmaWNpZW50
IHdoZW4gY2hhbmdpbmcgY29kZSBtYXBwaW5ncyBvcg0KPj4+Pj4+IC0gKiBmb3Igc2VsZiBtb2Rp
ZnlpbmcgY29kZS4NCj4+Pj4+PiAtICovDQo+Pj4+Pj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBmbHVz
aF94ZW5fZGF0YV90bGJfbG9jYWwodm9pZCkNCj4+Pj4+PiArLyogRmx1c2ggYWxsIGh5cGVydmlz
b3IgbWFwcGluZ3MgZnJvbSB0aGUgVExCIG9mIHRoZSBsb2NhbCBwcm9jZXNzb3IuDQo+Pj4+Pj4g
Ki8NCj4+Pj4+DQo+Pj4+PiBJIHJlYWxpemUgdGhhdCB0aGUgc3RhdGVtZW50ICJUaGlzIGlzIG5v
dCBzdWZmaWNpZW50IHdoZW4gY2hhbmdpbmcgY29kZQ0KPj4+Pj4gbWFwcGluZ3Mgb3IgZm9yIHNl
bGYgbW9kaWZ5aW5nIGNvZGUiIGlzIG5vdCBxdWl0ZSBhY2N1cmF0ZSwgYnV0IEkgd291bGQNCj4+
Pj4+IHByZWZlciBub3QgdG8gcmVtb3ZlIGl0IGNvbXBsZXRlbHkuIEl0IHdvdWxkIGJlIGdvb2Qg
dG8gcmV0YWluIGEgd2FybmluZw0KPj4+Pj4gc29tZXdoZXJlIGFib3V0IElDIGJlZW4gbmVlZGVk
IHdoZW4gY2hhbmdpbmcgWGVuJ3Mgb3duIG1hcHBpbmdzLiBNYXliZQ0KPj4+Pj4gb24gdG9wIG9m
IGludmFsaWRhdGVfaWNhY2hlX2xvY2FsPw0KPj4+Pg0KPj4+PiBDYW4geW91IHBsZWFzZSBleHBh
bmQgaW4gd2hpY2ggY2lyY3Vtc3RhbmNlIHlvdSBuZWVkIHRvIGludmFsaWQgdGhlDQo+Pj4+IGlu
c3RydWN0aW9uIGNhY2hlIHdoZW4gY2hhbmdpbmcgWGVuJ3Mgb3duIG1hcHBpbmdzPw0KPj4+DQo+
Pj4gUmVhZGluZyB0aGUgQXJtdjcgKEIzLjExLjIgaW4gQVJNIERESSAwNDA2Qy5jKSBhbmQgQXJt
djggKEQ1LjExLjIgaW4gQVJNIERESQ0KPj4+IDA0ODdELmEpLCBtb3N0IG9mIHRoZSBpbnN0cnVj
dGlvbiBjYWNoZXMgaW1wbGVtZW50IHRoZSBJVklQVCBleHRlbnNpb24uIFRoaXMNCj4+PiBtZWFu
cyB0aGF0IGluc3RydWN0aW9uIGNhY2hlIG1haW50ZW5hbmNlIGlzIHJlcXVpcmVkIG9ubHkgYWZ0
ZXIgd3JpdGUgbmV3DQo+Pj4gZGF0YSB0byBhIFBBIHRoYXQgaG9sZHMgaW5zdHJ1Y3Rpb25zIChz
ZWUgRDUtMjUyMiBpbiBBUk0gRERJIDA0ODdELmEgYW5kDQo+Pj4gQjMuMTEuMiBpbiBBUk0gRERJ
IDA0MDZDLmMpLg0KPj4+DQo+Pj4gVGhlIG9ubHkgb25lIHRoYXQgZGlmZmVycyB3aXRoIHRoYXQg
YmVoYXZpb3IgaXMgQVNJRCBhbmQgVk1JRCB0YWdnZWQgVklWVA0KPj4+IGluc3RydWN0aW9uIGNh
Y2hlcyB3aGljaCBpcyBvbmx5IHByZXNlbnQgaW4gQXJtdjcgKEkgY2FuJ3QgcmVtZW1iZXIgd2h5
IGl0DQo+Pj4gd2FzIGRyb3BwZWQgaW4gQXJtdjgpLiBJbnN0cnVjdGlvbiBjYWNoZSBtYWludGVu
YW5jZSBjYW4gYmUgcmVxdWlyZWQgd2hlbg0KPj4+IGNoYW5naW5nIHRoZSB0cmFuc2xhdGlvbiBv
ZiBhIHZpcnR1YWwgYWRkcmVzcyB0byBhIHBoeXNpY2FsIGFkZHJlc3MuDQo+Pg0KPj4gSSB0aG91
Z2h0IGFib3V0IHRoaXMgYSBiaXQgbW9yZSBhbmQgY2hhdCB3aXRoIG15IHRlYW0gYXQgQXJtLiBY
ZW4gb24gQXJtIG9ubHkNCj4+IHN1cHBvcnQgQ29ydGV4LUE3LCBDb3J0ZXgtQTE1IGFuZCBCcmFo
bWEgMTUgKHNlZSB0aGUgQ1BVIElEIGNoZWNrIGluDQo+PiBhcm0zMi9oZWFkLlMpLg0KPj4gCQ0K
Pj4gTm9uZSBvZiB0aGVtIGFyZSBhY3R1YWxseSB1c2luZyBWSVZUIGluc3RydWN0aW9uIGNhY2hl
cy4gSW4gZ2VuZXJhbCwgVklWVA0KPj4gY2FjaGVzIGFyZSBtb3JlIGRpZmZpY3VsdCB0byBkZWFs
IHdpdGggYmVjYXVzZSB0aGV5IHJlcXVpcmUgbW9yZSBmbHVzaC4gU28gSQ0KPj4gd291bGQgYmUg
bW9yZSBpbmNsaW5lIHRvIGRlbnkgYm9vdGluZyBYZW4gb24gcGxhdGZvcm0gd2hlcmUgdGhlIGlu
c3RydWN0aW9uDQo+PiBjYWNoZXMgZG9uJ3Qgc3VwcG9ydCBJVklWVCBleHRlbnNpb24uDQo+Pg0K
Pj4gSSBkb24ndCB0aGluayB0aGF0IHdpbGwgaGF2ZSBhIG1ham9yIGltcGFjdCBvbiB0aGUgdXNl
ciBiZWNhdXNlIG9mIG15IHBvaW50DQo+PiBhYm92ZS4NCj4gDQo+IFRoYW5rcyBmb3IgbG9va2lu
ZyB0aGlzIHVwIGluIGRldGFpbHMuIEkgdGhpbmsgdGhlcmUgYXJlIHR3byBpbnRlcmVzdGluZw0K
PiBwb2ludHMgaGVyZToNCj4gDQo+IDEpIHdoYXQgdG8gZG8gd2l0aCBWSVZUDQo+IDIpIHdoYXQg
dG8gd3JpdGUgaW4gdGhlIGluLWNvZGUgY29tbWVudA0KPiANCj4gRm9yIDEpIEkgdGhpbmsgaXQg
d291bGQgYmUgT0sgdG8gZGVueSBib290aW5nLiBGb3Igc3VyZSB3ZSBuZWVkIGF0IGxlYXN0DQo+
IGEgd2FybmluZy4gV291bGQgeW91IGJlIGFibGUgdG8gYWRkIHRoZSB3YXJuaW5nL2Jvb3QtZGVu
aWFsIGFzIHBhcnQgb2YNCj4gdGhpcyBzZXJpZXMsIG9yIGF0IGxlYXN0IGFuIGluLWNvZGUgY29t
bWVudD8NCg0KSSBhbSBwbGFubmluZyB0byBkZW55IGJvb3RpbmcgWGVuIG9uIHN1Y2ggcGxhdGZv
cm1zLg0KDQo+IA0KPiBGb3IgMikgSSB3b3VsZCBsaWtlIHRoaXMgcmVhc29uaW5pbmcgdG8gYmUg
Y2FwdHVyZWQgc29tZXdoZXJlIHdpdGggYQ0KPiBpbi1jb2RlIGNvbW1lbnQsIGlmIG5vdGhpbmcg
ZWxzZSBhcyBhIHJlZmVyZW5jZSB0byB3aGF0IHRvIHNlYXJjaCBpbg0KPiB0aGUgQXJtIEFybS4g
SSBkb24ndCBrbm93IHdoZXJlIGlzIHRoZSBiZXN0IHBsYWNlIGZvciBpdC4gSWYNCj4gaW52YWxp
ZGF0ZV9pY2FjaGVfbG9jYWwgaXMgbm90IGdvb2QgcGxhY2UgZm9yIHRoZSBjb21tZW50IHBsZWFz
ZSBzdWdnZXN0DQo+IGEgYmV0dGVyIGxvY2F0aW9uLg0KDQpJIHN0aWxsIGRvbid0IHVuZGVyc3Rh
bmQgd2hhdCByZWFzb25pbmcgeW91IHdhbnQgdG8gd3JpdGUuIElmIHdlIGRvbid0IA0Kc3VwcG9y
dCBWSVZUIHRoZW4gdGhlIGluc3RydWN0aW9uIGNhY2hlIGlzIHZlcnkgZWFzeSB0byBtYWludGFp
bi4gSS5lIA0KIllvdSBmbHVzaCBpZiB5b3UgbW9kaWZ5IHRoZSBpbnN0cnVjdGlvbiIuDQoNCkkg
YW0gd29ycnkgdGhhdCBpZiB3ZSBvdmVyZG8gdGhlIGV4cGxhbmF0aW9uIGluIHRoZSBjb2RlLCB0
aGVuIHlvdSBhcmUgDQpnb2luZyB0byBjb25mdXNlIG1vcmUgdGhhbiBvbmUgcGVyc29uLiBTbyBp
dCB3b3VsZCBiZSBiZXR0ZXIgdG8gYmxhbmsgDQpvdXQgIlZJVlQiIGNvbXBsZXRlbHkgZnJvbSB0
aGVuLg0KDQpGZWVsIGZyZWUgdG8gc3VnZ2VzdCBhbiBpbi1jb2RlIGNvbW1lbnQgc28gd2UgY2Fu
IGRpc2N1c3Mgb24gdGhlIHdvcnRoaW5lc3MuDQoNCkNoZWVycywNCg0KLS0gDQpKdWxpZW4gR3Jh
bGwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

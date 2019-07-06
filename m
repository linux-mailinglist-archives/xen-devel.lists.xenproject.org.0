Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A753612C5
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jul 2019 21:03:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjptm-00020I-KV; Sat, 06 Jul 2019 18:59:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vVoM=VD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hjptl-00020D-MQ
 for xen-devel@lists.xenproject.org; Sat, 06 Jul 2019 18:59:01 +0000
X-Inumbo-ID: 1c4b8a65-a020-11e9-8980-bc764e045a96
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.84]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1c4b8a65-a020-11e9-8980-bc764e045a96;
 Sat, 06 Jul 2019 18:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gk3XYBQED17q1KuqQ5hfYrTbVpl+zFYDfd8yn31AyfM=;
 b=UWmA3OcOvRYalWLJOY4maBMtGThrfgRq7kSucdlWSSZWoevXuJgw1Idr6e0bwiIJT9q+4j2fEmgJqwPA/lI2WBLij+s5EIpbgea3VUIoZBd7bPC2j3I0EmfnWTEbHfwd7tRrfKLGu2Vp7oLPJ3v4dUOxkkLlm1psfqQ22wZLq0w=
Received: from AM6PR08MB5271.eurprd08.prod.outlook.com (10.255.123.151) by
 AM6PR08MB3301.eurprd08.prod.outlook.com (52.135.164.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Sat, 6 Jul 2019 18:58:56 +0000
Received: from AM6PR08MB5271.eurprd08.prod.outlook.com
 ([fe80::710f:e30c:686f:6d02]) by AM6PR08MB5271.eurprd08.prod.outlook.com
 ([fe80::710f:e30c:686f:6d02%5]) with mapi id 15.20.2052.019; Sat, 6 Jul 2019
 18:58:56 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Denis Obrezkov <denisobrezkov@gmail.com>, Iain Hunter
 <drhunter95@gmail.com>
Thread-Topic: [GSOC-2019] Problem with initializing crossbar on bb-x15 in dom0
Thread-Index: AQHVM/UrlHAhu1Hrek2k4BkolWbUBqa9vy+AgAAJjICAABL4gP//8jOAgAAeCYD///QRAIAAEcwA
Date: Sat, 6 Jul 2019 18:58:56 +0000
Message-ID: <aa6c668d-acd3-6d9b-fb91-ff9b4ec9f82a@arm.com>
References: <4ec41ede-a8cb-6724-aa88-254387b2aa15@gmail.com>
 <CALC81-tWyUTXVf5uxtdi_i5Ndz0CRtoJ=XwTecz40bzyL7Ps1w@mail.gmail.com>
 <779518d6-b7f8-9faa-f22d-558013dc8cfb@gmail.com>
 <583833d2-8303-48f5-7cab-f9e4e112a694@gmail.com>
 <3a2a6185-0056-d931-a194-578239eedabc@gmail.com>
 <c85dcf69-2a56-811d-fa95-b313ca9ea66f@arm.com>
 <42daf482-9f3e-55c7-9bad-c61b147252af@gmail.com>
 <da1d04bb-54ad-5bf7-f62e-1fecbb1e7611@arm.com>
 <e22d87c2-d09b-848a-b520-e80599d895a1@gmail.com>
 <625d8126-5baa-4d83-b27c-fabd94fe5f77@arm.com>
 <27be8a8a-7bf1-2c18-bc1d-6dd4898da47b@gmail.com>
 <761afa88-7655-96d9-0ad9-3eb198c1eb59@arm.com>
 <9e4fd741-176b-04dc-2356-587a1542b832@gmail.com>
In-Reply-To: <9e4fd741-176b-04dc-2356-587a1542b832@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0202CA0013.eurprd02.prod.outlook.com
 (2603:10a6:4:29::23) To AM6PR08MB5271.eurprd08.prod.outlook.com
 (2603:10a6:20b:ef::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.100.41.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d400e81e-03da-470e-6457-08d70243ff26
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR08MB3301; 
x-ms-traffictypediagnostic: AM6PR08MB3301:
x-microsoft-antispam-prvs: <AM6PR08MB33010D0602ACCDF37C0A7A6C80F40@AM6PR08MB3301.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00909363D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(189003)(199004)(2616005)(229853002)(8936002)(7736002)(446003)(478600001)(31696002)(11346002)(66446008)(53936002)(72206003)(476003)(6436002)(305945005)(81166006)(81156014)(71200400001)(6512007)(6246003)(256004)(316002)(66556008)(73956011)(66066001)(4326008)(66946007)(86362001)(14454004)(25786009)(66476007)(6506007)(102836004)(14444005)(53546011)(386003)(76176011)(26005)(99286004)(52116002)(186003)(486006)(36756003)(2906002)(68736007)(110136005)(31686004)(5660300002)(44832011)(54906003)(8676002)(3846002)(6486002)(64756008)(6116002)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3301;
 H:AM6PR08MB5271.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 056lYgH/uN7ipJWoMk8gnx6WsdOLHteACoR5QAKA/ydKUD0UuHb7FEQycIbnnutfqZS+TkmujrlDyr1HOamXLbkJ4RqQyCxBsJjQdkkOEeSgue8R8U6DMVZYTvkEyTbSF7+YrKTkHGp7SngQQ0Sc7g91q58KB4HgrdF/vf+1Xlbbq08745goRdgyFYpVJVymR0M8ZutCDQlHcZxbMbW9xnbhepfRhNaNfAyRYvBbBvl2puQJvL6FPH8w8cyFwzHJ6/eoiK1IWv3Xfn+z+NKNf/+fH33pcc9dxxh18tdkwM6ZZy0Bo7gJsmyGe2TA+ll8GTMv2F86r9Xq3/b7469998n2WShi+LESB5wl+ohxKrsmR1QRfyMMHaTv3euvM5v/G/WRw6hBnzubQO3YB/WDs+TSZT/fTH8X98iVVQugIPU=
Content-ID: <15CC0CC37674DB4F97AD1435D07D8D92@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d400e81e-03da-470e-6457-08d70243ff26
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2019 18:58:56.5073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Julien.Grall@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3301
Subject: Re: [Xen-devel] [GSOC-2019] Problem with initializing crossbar on
 bb-x15 in dom0
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
 nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Hunyue Yau <hy-gsoc@hy-research.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDA2LzA3LzIwMTkgMTg6NTUsIERlbmlzIE9icmV6a292IHdyb3RlOg0KPiBIaSwNCj4g
DQo+IE9uIDcvNi8xOSA3OjM3IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IA0KPj4NCj4+IFll
cyBpdCB3b3VsZCBiZSBzZW5zaWJsZSB0byB0cnkgdG8gaW1wbGVtZW50IGEgY3Jvc3NiYXIgZHJp
dmVyIGluIFhlbg0KPj4gYW5kIHRlc3Qgd2l0aCB0aGUgVUFSVC4gTG9va2luZyBhdCB0aGUgZHJp
dmVyIGluIExpbnV4LCB0aGlzIHNob3VsZCBub3QNCj4+IGJlIHRvbyBkaWZmaWN1bHQuDQo+IEkg
ZG9uJ3QgdW5kZXJzdGFuZCB3aHkgeGVuIGRvZXNuJ3QgcmVhY3Qgb24gdHJpcGxlIEN0cmwrYS4g
SXQgcHJvYmFibHkNCj4gbWVhbnMgdGhhdCBVQVJUJ3MgaW50ZXJydXB0cyBkb2Vzbid0IHdvcmsu
IEJ1dCBJIHdhcyBhYmxlIHRvIHR5cGUgaW4NCj4gdS1ib290IHNvIHRoZSB1YXJ0IHNob3VsZCBi
ZSBhbHJlYWR5IGNvbmZpZ3VyZWQuIE9yIG5vdD8gU2hvdWxkIEkgc2V0IHVwDQo+IGl0IGluIGEg
Y3Jvc3NiYXIgZmlyc3Q/DQpYZW4gaXMgbm90IGFibGUgdG8gZGVhbCB3aXRoIHRoZSBjcm9zc2Jh
ci4gSXQgbWVhbnMgaXQgY2Fubm90IHRyYW5zbGF0ZSANCnRoZSBpbnRlcnJ1cHQgYW5kIHRoZXJl
Zm9yZSBjYW5ub3QgaW5pdGlhbGl6ZSB0aGUgVUFSVDoNCg0KKFhFTikgb21hcC11YXJ0OiBVbmFi
bGUgdG8gcmV0cmlldmUgdGhlIElSUQ0KKFhFTikgVW5hYmxlIHRvIGluaXRpYWxpemUgZHR1YXJ0
OiAtMjINCihYRU4pIEJhZCBjb25zb2xlPSBvcHRpb24gJ2R0dWFydCcNCg0KIEZyb20gbXkgdW5k
ZXJzdGFuZGluZywgZXZlbiBpZiB5b3UgYXJlIGFibGUgdG8gdHJhbnNsYXRlIGl0LCB5b3UgZG9u
J3QgDQprbm93IGhvdyBVLWJvb3QgY29uZmlndXJlZCB0aGUgY3Jvc3NiYXIuIEluIG90aGVyIHdv
cmRzLCB5b3UgZG9uJ3Qga25vdyANCndoaWNoIEdJQyBJbnRlcnJ1cHQgSUQgd2FzIHVzZWQgZm9y
IHRoZSBVQVJULiBTbywgeW91IHN0aWxsIG5lZWQgdG8gDQpjb25maWd1cmUgdGhlIGNyb3NzYmFy
IGluIFhlbi4NCg0KPj4NCj4+Pj4NCj4+DQo+PiBJIGRvbid0IHRoaW5rIEkgZXZlciBzdWdnZXN0
ZWQgdG8gbm90IGV4cG9zZSB0aGUgY3Jvc3NiYXIgdG8gRG9tMC4NCj4+IEluc3RlYWQsIEkgc3Vn
Z2VzdGVkIHRvIHZpcnR1YWxpemUgZm9yIERvbTAsIHNvIGl0IGNhbiBiZSB1c2VkIGJ5IFhlbiBh
cw0KPj4gd2VsbC4NCj4+DQo+Pj4+DQo+Pj4+PiBBbHNvLCB0aGUgdGVncmENCj4+Pj4+IGltcGxl
bWVudGF0aW9uIGJsYWNrbGlzdCBvbmx5IGEgdWFydC4NCj4+Pj4NCj4+Pj4gSSBkb24ndCB1bmRl
cnN0YW5kIHRoaXMuDQo+Pj4gSW4gaGVyZSBbMV0geW91IGNhbiBmaW5kIHRoYXQgb25seSB1YXJ0
IGlzIGJsYWNrbGlzdGVkIChpbg0KPj4+IHRlZ3JhX2JsYWNrbGlzdF9kZXZbXSkuIFNvLCBpbiB0
ZWdyYSB0aGV5IGRpZG4ndCBibGFja2xpc3QgdGhlaXIgdmVyc2lvbg0KPj4+IG9mIHRoZSBjcm9z
c2Jhci4NCj4+DQo+PiBUaGlzIHNlcmllcyBoYXMgbm90IGJlZW4gbWVyZ2VkLiBJbiBvdGhlciB3
b3JkLCB0aGUgY29kZSBpcyBub3QgeWV0DQo+PiBtYXRjaGluZyB0aGUgZXhwZWN0YXRpb25zIG9m
IHRoZSBtYWludGFpbmVycy4NCj4+DQo+PiBJIHBvaW50ZWQgeW91IHRvIHRoaXMgc2VyaWVzLCBi
ZWNhdXNlIEkgdGhpbmsgc29tZSBvZiB0aGUgaWRlYSBjb3VsZCBiZQ0KPj4gcmUtdXNlZCBmb3Ig
aW1wbGVtZW50aW5nIHRoZSBjcm9zc2Jhci4NCj4+DQo+PiBJbiB0aGlzIHBhcnRpY3VsYXIgY2Fz
ZSwgaXQgaGFzIGJlZW4gc3VnZ2VzdGVkIHRvIHVzZSBibGFja2xpc3RfZGV2DQo+PiByYXRoZXIg
dGhhbiB1bm1hcHBpbmcgKHNlZSBbMl0pLg0KPj4NCj4gDQo+IEhtLCBJIHRob3VnaHQgdGhhdCBp
ZGVhIGJlaGluZCB0aGUgcGF0Y2ggd2FzIHRoYXQgdGhleSB1bm1hcCB0aGUgY29udHJvbA0KPiBy
ZWdpc3RlciBhbmQgaW50ZXJjZXB0IHRoZSBjYWxscyBmcm9tIExpbnV4IHRvIHRoYXQgY29udHJv
bCByZWdpc3Rlci4gQXQNCj4gdGhlIHNhbWUgdGltZSB0aGV5IHByZXNlcnZlZCB0aGUgY3Jvc3Ni
YXIgaW4gdGhlIGRldmljZSB0cmVlLiBBbmQsIEkNCj4gdGhvdWdodCB0aGF0IHlvdSB3YW50ZWQg
dG8gZGVtb25zdHJhdGUgdGhpcyBleGFjdCB0aGluZy4NCg0KSSB0aGluayB1bm1hcHBpbmcgc29t
ZXRoaW5nIHlvdSBqdXN0IG1hcHBlZCBpcyBhIGdyb3NzIGhhY2suIEl0IHdvdWxkIGJlIA0KYmVz
dCBpZiB0aGlzIGNhbiBiZSBhdm9pZGVkLg0KDQpBbHNvLCBJIGFtIGFsc28gbm90IGVudGlyZWx5
IGNvbnZpbmNlIHdlIHdhbnQgdG8gZnVsbHkgcHJlc2VydmUgdGhlIA0KY3Jvc3NiYXIgbm9kZSBp
biB0aGUgRFQuIEl0IHdpbGwgZGVwZW5kIGhvdyB0aGUgY3Jvc3NiYXIgd2lsbCBiZSANCnZpcnR1
YWxpemVkIGZvciBEb20wLg0KDQogRnJvbSBteSB1bmRlcnN0YW5kaW5nLCB0aGUgY3Jvc3NiYXIg
aXMgYWJsZSB0byBoYW5kbGUgTiBpcnFzLiBGb3IgZWFjaCANCmlycXMsIHRoZXJlIHdpbGwgYmUg
YSBjb3JyZXNwb25kaW5nIHJlZ2lzdGVyLg0KDQpUaGUgc2ltcGxlc3QgYXBwcm9hY2ggd291bGQg
YmUgdG8gZXhwb3NlIGV4YWN0bHkgdGhlIHNhbWUgY3Jvc3NiYXIgdG8gDQpEb20wIGFuZCB0cmFw
IGFsbCB0aGUgYWNjZXNzLiBBbnkgYWNjZXNzIHRvIHJlZ2lzdGVycyBhc3NvY2lhdGVkIHRvIElS
UXMgDQp1c2VkIGJ5IFhlbiB3b3VsZCBqdXN0IGJlIGlnbm9yZWQuIEluIHRoaXMgYXBwcm9hY2gs
IHdlIHdvdWxkIHByb2JhYmx5IA0Kd2FudCB0byB1cGRhdGUgdGktaXJxcy1za2lwL3RpLGlycXMt
cmVzZXJ2ZWQuDQoNCj4gQ291bGQgeW91DQo+IGRlc2NyaWJlIGhvdyBpbiBnZW5lcmFsIHRoZSBh
cHByb2FjaCB3aXRoIGJsYWNrbGlzdGluZyBzaG91bGQgd29yaz8NCg0KSSBkaWRuJ3QgZnVsbHkg
dGhvdWdodCB0aHJvdWdoIHNvIGZhci4NCg0KT24gYSBzZWNvbmQgdGhvdWdodCwgdGhpcyBtYXkg
bm90IHdvcmsgY29ycmVjdGx5LiBXZSB3YW50IHRvIGtlZXAgdGhlIA0KY3Jvc3NiYXIgbm9kZSBw
YXRoIHRoZSBzYW1lIHRvIGF2b2lkIGlzc3VlIHdpdGggYWxpYXNpbmcgKHNlZSAvYWxpYXNlcyku
DQoNClNvIHByb2JhYmx5IHRoZSBiZXN0IHdvdWxkIGJlIHRvIG1hdGNoIHRoZSBjcm9zc2JhciBj
b21wYXRpYmxlIGFuZCB0aGVuIA0KYWx0ZXIgYW55dGhpbmcgd2Ugd2FudC4gU2VlIGhvdyB3ZSBk
ZWFsIHdpdGggdGhlIEdJQyBpbiBtYWtlX2dpY19ub2RlLg0KDQpJbiBzdW1tYXJ5Og0KICAgIDEp
IEEgcGxhdGZvcm0gY2FsbGJhY2sgKG1heWJlIHBsYXRmb3JtX3NwZWNpZmljX21hcHBpbmcpIHdp
bGwgaG9vayANCnRoZSBoYW5kbGVycyBmb3IgdGhlIGNyb3NzYmFyDQogICAgMikgaGFuZGxlX25v
ZGUgaXMgZXh0ZW5kZWQgdG8gY2F0Y2ggdGhlIGNyb3NzYmFyIG5vZGUuIEZvciBub3csICwgDQp5
b3UgY291bGQgaGFjayBkb21haW5fYnVpbGQuYyB0byBtYXRjaCB0aGUgY2FsbGJhY2suIFRoaXMg
YWxsb3dzIHlvdSB0byANCmZvY3VzIG9uIHZpcnR1YWxpemluZyB0aGUgY3Jvc3NiYXIuIFdlIGNh
biBkaXNjdXNzIGEgYmV0dGVyIGFwcHJvYWNoIA0KbGF0ZXIgb24uDQoNCkNoZWVycywNCg0KLS0g
DQpKdWxpZW4gR3JhbGwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=

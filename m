Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C97CE61235
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jul 2019 18:43:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjnjD-0006x3-QR; Sat, 06 Jul 2019 16:39:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vVoM=VD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hjnjC-0006wy-21
 for xen-devel@lists.xenproject.org; Sat, 06 Jul 2019 16:39:58 +0000
X-Inumbo-ID: adf3245c-a00c-11e9-97f1-8373ddcbcf63
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.66]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id adf3245c-a00c-11e9-97f1-8373ddcbcf63;
 Sat, 06 Jul 2019 16:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNrQN5tmvvhyF6w5Ke/rwyT5Rpr3wvwmmr9Wr5WwnFc=;
 b=1tFfvh9WvxMVddkW3O/GlNlzNLzw0hL4dvKfHg2R23+hHfskXl1DZaGMIS7tcbw2GChKtXa4a3WobKKtfYlei8IFEcE0WDVOCmvXHUjSs6iK4bxgFIfEQnxMiC5oAUjBgYy1RoO+zhH+Xkb3cZARdDqmTfjeFDDKnivapziwTWE=
Received: from AM6PR08MB5271.eurprd08.prod.outlook.com (10.255.123.151) by
 AM6PR08MB4915.eurprd08.prod.outlook.com (10.255.99.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.17; Sat, 6 Jul 2019 16:39:51 +0000
Received: from AM6PR08MB5271.eurprd08.prod.outlook.com
 ([fe80::710f:e30c:686f:6d02]) by AM6PR08MB5271.eurprd08.prod.outlook.com
 ([fe80::710f:e30c:686f:6d02%5]) with mapi id 15.20.2052.019; Sat, 6 Jul 2019
 16:39:51 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Denis Obrezkov <denisobrezkov@gmail.com>, Iain Hunter
 <drhunter95@gmail.com>
Thread-Topic: [GSOC-2019] Problem with initializing crossbar on bb-x15 in dom0
Thread-Index: AQHVM/UrlHAhu1Hrek2k4BkolWbUBqa9vy+AgAAJjICAAAI1gA==
Date: Sat, 6 Jul 2019 16:39:51 +0000
Message-ID: <625d8126-5baa-4d83-b27c-fabd94fe5f77@arm.com>
References: <4ec41ede-a8cb-6724-aa88-254387b2aa15@gmail.com>
 <CALC81-tWyUTXVf5uxtdi_i5Ndz0CRtoJ=XwTecz40bzyL7Ps1w@mail.gmail.com>
 <779518d6-b7f8-9faa-f22d-558013dc8cfb@gmail.com>
 <583833d2-8303-48f5-7cab-f9e4e112a694@gmail.com>
 <3a2a6185-0056-d931-a194-578239eedabc@gmail.com>
 <c85dcf69-2a56-811d-fa95-b313ca9ea66f@arm.com>
 <42daf482-9f3e-55c7-9bad-c61b147252af@gmail.com>
 <da1d04bb-54ad-5bf7-f62e-1fecbb1e7611@arm.com>
 <e22d87c2-d09b-848a-b520-e80599d895a1@gmail.com>
In-Reply-To: <e22d87c2-d09b-848a-b520-e80599d895a1@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR01CA0090.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:44::31) To AM6PR08MB5271.eurprd08.prod.outlook.com
 (2603:10a6:20b:ef::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.100.41.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3cc8dd5-f667-408c-e437-08d702309128
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR08MB4915; 
x-ms-traffictypediagnostic: AM6PR08MB4915:
x-microsoft-antispam-prvs: <AM6PR08MB4915085E5A1EEEEFE2302DD680F40@AM6PR08MB4915.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00909363D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(366004)(39860400002)(376002)(199004)(189003)(66446008)(73956011)(66476007)(66946007)(64756008)(66556008)(6486002)(44832011)(229853002)(3846002)(6116002)(8936002)(81166006)(81156014)(7736002)(305945005)(14454004)(8676002)(110136005)(476003)(316002)(25786009)(6436002)(31696002)(256004)(446003)(71190400001)(71200400001)(53936002)(478600001)(54906003)(486006)(6512007)(86362001)(72206003)(186003)(6246003)(11346002)(4326008)(102836004)(386003)(6506007)(53546011)(76176011)(5660300002)(2906002)(68736007)(99286004)(31686004)(26005)(52116002)(66066001)(36756003)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4915;
 H:AM6PR08MB5271.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ixk3m5lpnZ82UGVt1VXhZNRMELzPUXPCrJauql0dHpY3ZEGJHQ50HSIQC3HnPKUFnXC78p3vFwFZGwsO7DQBY0j9m0FXBhucb4lYieJrCG/1Wm167Fi0CCNau2oVW5+AVelxI1rmT1AD2g56CL9LfadUkPGJOlV4jrQ0v78/VunEoT0f+wJmOIM+R+VY1XNw0H3NOhp78h9ddsRYPgiF1HcUna3zObOL5NTG3oJYhotezT86h5L5ByjhcQiY5WoayBx+6L0xyOGZQA8up/H7tWpk8XJAwoTfX+ESGCK2nUpbqrEIaTAU2UR0BKV/BWXT1qqgputEndO+nrX+u7EgNXtcB21MmVgXVRMa9zd1GIb+yawRaCKD/Vy1NidAdeElq9JZAlFrjtXLv8dj14XVEESrtv8KyiCDAIt+boeohsE=
Content-ID: <E95C1CB82C2A194AAF3D9DB3E887F727@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3cc8dd5-f667-408c-e437-08d702309128
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2019 16:39:51.4855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Julien.Grall@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4915
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

DQoNCk9uIDA2LzA3LzIwMTkgMTc6MzEsIERlbmlzIE9icmV6a292IHdyb3RlOg0KPiBIaSwNCg0K
SGkgRGVuaXMsDQoNCj4gDQo+IE9uIDcvNi8xOSA1OjU3IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6
DQo+Pg0KPiANCj4+DQo+PiAgICAgICByYyA9IHVubWFwX21taW9fcmVnaW9ucyhkLCBfZ2ZuKHBm
bl9zdGFydCksDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwZm5fZW5kICsgcGZu
X3N0YXJ0ICsgMSwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9tZm4ocGZuX3N0
YXJ0KSk7DQo+Pg0KPj4gWW91IGFyZSBub3QgY29tcHV0aW5nIGNvcnJlY3RseSB0aGUgbnVtYmVy
IG9mIHBhZ2VzLiBJIHRoaW5rIHlvdSB3YW50DQo+PiAicGZuX2VuZCAtIHBmbl9zdGFydCArIDEi
Lg0KPiBPaywgSSBjaGFuZ2VkIGl0IGFuZCB3YXMgYWJsZSB0byBib290IHRvIHRoZSBwcmV2aW91
cyBlcnJvci4gSSB0aGluayBhDQo+IGxvZ2ljYWwgbmV4dCBzdGVwIHdvdWxkIGJlIHRvIHNldCB1
cCB0aGUgdWFydCBzb21laG93Pw0KDQpEbyB5b3UgbWVhbiB0aGUgVUFSVCB1c2VkIGJ5IFhlbj8N
Cg0KPj4NCj4+IEJ1dCB0aGlzIGZlZWxzIHdlaXJkIHRvIG1hcCB0aGVuIHVubWFwIHRoZSBtbWlv
LiBJbnN0ZWFkLCB5b3Ugc2hvdWxkDQo+PiBibGFja2xpc3QgdGhlIGNyb3NzYmFyIGRldmljZS4g
SGF2ZSBhIGxvb2sgYXQgdGhlIGZpZWxkIGJsYWNrbGlzdF9kZXYgaW4NCj4+IHBsYXRmb3JtX2Rl
c2MuDQo+IEhtLCBJIGNhbiBzZWUgdGhhdCBpbiB0aGUgZGV2aWNlIHRyZWUgdGhlIGNyb3NzYmFy
IGhhcyBhIHBoYW5kbGUNCj4gcHJvcGVydHkgPDB4MDAwMDAwMDg+IGFuZCB0aGUgbWFpbiBub2Rl
IGhhcyBhbiBpbnRlcnJ1cHQtcGFyZW50IHByb3BlcnR5DQo+IDB4MDAwMDAwMDguIFNvLCBhbGwg
dGhlIGludGVycnVwdHMgc2VlbXMgdG8gYmUgbWFwcGVkIHRvIHRoZSBjcm9zc2Jhci4NCj4gV291
bGRuJ3QgYmUgdGhhdCBhIHByb2JsZW0gaWYgd2UgYmxhY2tsaXN0IHRoZSBkZXZpY2U/DQoNCg0K
VGhlIERldmljZSBpcyBvd25lZCBieSBYZW4sIHNvIHRlY2huaWNhbGx5IERvbTAgZG9lcyBub3Qg
c2VlIHRoZSANCmhhcmR3YXJlIG9uZS4gSW5zdGVhZCBpdCBzZWVzIGEgdmlydHVhbCBhbmQgdGhl
cmVmb3JlIHRoZSBub2RlIHNob3VsZCBiZSANCmNyZWF0ZWQgdG8gcmVmbGVjdCBpdC4NCg0KVGhl
IHB1cnBvc2Ugb2YgcmVjcmVhdGluZyB0aGUgbm9kZSBpcyB5b3UgY2FuIGFsdGVyIGl0IHRvIG1h
dGNoIHdoYXQgd2UgDQphY3R1YWxseSBleHBvc2VkIHRvIHRoZSBkb21haW4gKHByb3BlcnR5IHZh
bHVlcyBtYXkgZGlmZmVyKS4gSXQgbWF5IA0KaGFwcGVuIHRoYXQgYSBsb3Qgb2YgaW5mb3JtYXRp
b24gYXJlIGV4YWN0bHkgdGhlIHNhbWUgYXMgdGhlIGhhcmR3YXJlIA0KYW5kIGNhbiBqdXN0IGJl
IGNvcGllZC4NCg0KVGhpcyBpcywgZm9yIGluc3RhbmNlLCB3aGF0IHdlIGRvIGZvciB0aGUgR0lD
IGFuZCB0aW1lci4NCg0KPiBBbHNvLCB0aGUgdGVncmENCj4gaW1wbGVtZW50YXRpb24gYmxhY2ts
aXN0IG9ubHkgYSB1YXJ0Lg0KDQpJIGRvbid0IHVuZGVyc3RhbmQgdGhpcy4NCg0KQ2hlZXJzLA0K
DQotLSANCkp1bGllbiBHcmFsbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC3548D37
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 21:00:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcwpJ-0001wj-5K; Mon, 17 Jun 2019 18:57:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jUew=UQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hcwpI-0001we-EQ
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 18:57:56 +0000
X-Inumbo-ID: cfd6047e-9131-11e9-8980-bc764e045a96
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::60c])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cfd6047e-9131-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 18:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6BqRxCTve74R+yy+IRUYFF3ZJ78LZ5RpkyzZk/yZZQ=;
 b=xTsDiecvUlH63ldGnTjsXmxvW7JArt2F1vkxLcoq7xuH/LQtWCa2jidDjZgy63bsiI4Ua5Njq7fi6ReHyhL3LUkGCzoCAooWSzycScR1AlILJ4PNU0lm3HkNup5bFtzwoFDLnUD9JiyI/rFe1n4EYC6PBsJzqypwkw0ml4Ptgxk=
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com (52.134.93.144) by
 AM0PR08MB4401.eurprd08.prod.outlook.com (20.179.32.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Mon, 17 Jun 2019 18:57:52 +0000
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::a52e:cd0a:64fb:a6ee]) by AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::a52e:cd0a:64fb:a6ee%5]) with mapi id 15.20.1987.014; Mon, 17 Jun 2019
 18:57:52 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: How to boot domU and dom0 from a device tree
Thread-Index: AQHVH3STU3UqEXhG5UOC6kqmaTTwD6aUz9wAgABbgQCAACxlAIAADx2AgAEVboCAABtngIAACYSAgAAwdWKAADaMgIAA7N2AgAOyTgCAAXE3AIADGNKAgAAMyAA=
Date: Mon, 17 Jun 2019 18:57:52 +0000
Message-ID: <8ac08c20-ce01-f256-7da1-c3aaa110a99b@arm.com>
References: <59199da7-40ad-6513-2000-7e10fdbb564b@gmail.com>
 <28b298ba-9acb-5d3b-b4ba-4ef72f4db4be@gmail.com>
 <65e7d353-b587-516e-d167-aa59a1e94f73@gmail.com>
 <alpine.DEB.2.21.1906101329140.8691@sstabellini-ThinkPad-T480s>
 <ba65a0e3-d7c4-f007-1a34-be28561804e5@gmail.com>
 <22ab207e-ae22-2002-35e0-f28177e29c30@arm.com>
 <f3034c36-cb04-b698-5a0e-1d4af3ac8f84@gmail.com>
 <alpine.DEB.2.21.1906110907220.13737@sstabellini-ThinkPad-T480s>
 <4db25be4-195e-6187-e9b8-c1a212429659@gmail.com>
 <987d8bb6-31a1-6d5e-2514-7498423c8c53@gmail.com>
 <alpine.DEB.2.21.1906111515000.13737@sstabellini-ThinkPad-T480s>
 <dca4af7b-6591-cb01-8e75-32438097f65a@arm.com>
 <alpine.DEB.2.21.1906141343510.2072@sstabellini-ThinkPad-T480s>
 <9084ec81-b2b2-d6ba-0e77-22a79936476b@arm.com>
 <alpine.DEB.2.21.1906171103580.2072@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1906171103580.2072@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0381.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::33) To AM0PR08MB3139.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 972da7bb-163e-432c-4f1a-08d6f355b300
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB4401; 
x-ms-traffictypediagnostic: AM0PR08MB4401:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB4401673D9C0D6B553C6BB95580EB0@AM0PR08MB4401.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0071BFA85B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(136003)(376002)(396003)(39860400002)(52314003)(199004)(189003)(31014005)(11346002)(54906003)(36756003)(66066001)(86362001)(6916009)(31696002)(6116002)(14454004)(66946007)(73956011)(64756008)(66446008)(53936002)(66556008)(3846002)(66476007)(71200400001)(305945005)(71190400001)(7736002)(229853002)(2906002)(14444005)(256004)(6486002)(316002)(6512007)(6436002)(486006)(476003)(26005)(2616005)(72206003)(4326008)(31686004)(8936002)(76176011)(99286004)(478600001)(68736007)(5660300002)(52116002)(81156014)(81166006)(6246003)(53546011)(25786009)(8676002)(186003)(6506007)(386003)(44832011)(102836004)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4401;
 H:AM0PR08MB3139.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4RgSIav6YhFafGUZ6+XnAKTN9jS5Rx3eX7+Jbj+8qo84U8+ianFGjShydMxDF5vppjtNxDdE0CCmEaAGM+fJrgtbjSYKZarPiUb8GH0bXjb5mRyGA9Fv+4aIhaWIeMtBlQIpxQPpKvqCgZO4GffX2b4ujkMyLIa4aoaw/fqyQV4wlLAzjqE3oQF2LDeI7Nare+oJbuJ78eprbmzRuhqXj9pqF2bpGFqavSZVjF2+smVzPnhjoZVxIi9XxdzF+GKOU0Td+lrOt18HBpCsCYYZoWGtgQaZX9lPiWkRm/dCe4gyxkxhuaK6ZtVrTSPnzSQzBNyMRVL79ZQK3CVB76Cok5cYaPf50ADngXzdpCvaheIRTDrrHhk4CSUYFx2gJSH7wLYTBmxZaDzqpQz3Mott0dWXqLcl51d4W9+FUFqah7w=
Content-ID: <383A392D6AB94E4E93C8610448B101D2@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 972da7bb-163e-432c-4f1a-08d6f355b300
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2019 18:57:52.3603 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Julien.Grall@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4401
Subject: Re: [Xen-devel] How to boot domU and dom0 from a device tree
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
Cc: Iain Hunter <drhunter95@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Hunyue Yau <hy-gsoc@hy-research.com>, Denis Obrezkov <denisobrezkov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDE3LzA2LzIwMTkgMTk6MTIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24g
U2F0LCAxNSBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4gT24gNi8xNC8xOSA5OjUz
IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4gT24gV2VkLCAxMiBKdW4gMjAxOSwg
SnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4gUmVnYXJkbGVzcyB0aGF0LCBJIHN0aWxsIHRoaW5rIHdl
IGhhdmUgc29tZSBpc3N1ZXMgd2hlbiB1c2luZyB0aGUgc2FtZQ0KPj4gY29tcHJlc3NlZCBrZXJu
ZWwgZm9yIERvbTAgYW5kIERvbVUgKHNlZSBpbiBteSBwcmV2aW91cyBlLW1haWwpLg0KPiANCj4g
WW91IHdyb3RlIGluIHRoZSBwcmV2aW91cyBlbWFpbDoNCj4gDQo+PiBCeSByZWFkaW5nIHRoZSBj
b2RlIEkgY2FuIGFscmVhZHkgc3BvdCB0aGUgcmVhc29uIG9mIHRoZSBmaXJzdCBpc3N1ZSByZXBv
cnRlZCBieSBEZW5pcy4gRm9yIHJlbWluZGVyLCB0aGlzIGlzIHdoZW4gRG9tMCBhbmQgRG9tVSBh
cmUgdXNpbmcNCj4+IHRoZSBzYW1lIG1vZHVsZSBhZGRyZXNzIGZvciB0aGUgZ3ppcCBJbWFnZS4N
Cj4gDQo+IEJ5ICJtb2R1bGUgYWRkcmVzcyIsIGRvIHlvdSBtZWFuIHRoZXkgdXNlIHRoZSBzYW1l
IGxvYWRpbmcgYWRkcmVzcyBpbg0KPiB1LWJvb3Q/IEJlY2F1c2UgRGVuaXMgd2FzIGxvYWRpbmcg
dGhlIEltYWdlLmd6IGtlcm5lbCB0d2ljZSBhdCBkaWZmZXJlbnQNCj4gYWRkcmVzc2VzIGZvciBk
b20wIGFuZCBkb21VOiBhdCAweDQ3MDAwMDAwIGFuZCBhdCAweDQzMDAwMDAwLg0KDQpMb29rIGF0
IHRoZSB2ZXJ5IGUtbWFpbCBvZiB0aGlzIHRocmVhZC4gSGUgaGFkIGRvbTAgYW5kIGRvbVUgdXNp
bmcgdGhlIA0Kc2FtZSBhZGRyZXNzIGZvciB0aGUga2VybmVsLg0KDQpBbnl3YXksIHJlZ2FyZGxl
c3Mgd2hhdCBEZW5pcyByZXBvcnRlZCwgdGhlcmUgYXJlIGNsZWFybHkgYW4gaXNzdWUgaWYgDQpE
b20wIGFuZCBEb20xIGtlcm5lbCBhcmUgdXNpbmcgdGhlIGV4YWN0IHNhbWUgbG9hZGluZyBhZGRy
ZXNzIGFuZCB0aGUgDQprZXJuZWwgaXMgY29tcHJlc3NlZC4gVGhpcyB3b3VsZCBiZSBmYWlybHkg
ZWFzeSB0byByZXByb2R1Y2UuDQoNCkNoZWVycywNCg0KLS0gDQpKdWxpZW4gR3JhbGwNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7CD61212
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jul 2019 18:01:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjn4X-0002jc-5G; Sat, 06 Jul 2019 15:57:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vVoM=VD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hjn4V-0002jX-0y
 for xen-devel@lists.xenproject.org; Sat, 06 Jul 2019 15:57:55 +0000
X-Inumbo-ID: cd6d8a58-a006-11e9-8235-17059d2b8a85
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.40]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd6d8a58-a006-11e9-8235-17059d2b8a85;
 Sat, 06 Jul 2019 15:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bZXITxyEa+cx5JewcYHhRb/5Nz1K8Yf9BvvtjknDVU=;
 b=oD6JYAtgcf4f3qCmgbOi5ajZope5LsEUNEsDsVahzocyxOY/2bRa0bspdax1C052STzW9mK3+QmLQcXhJgBDxHqqVvDpQArxVJC9R+eXLlRoV0Kdwy3dC9EAM8xP7lEz0DMHfsanqk8eF2y2YvCeVO0r2VUar0vO5BxUu26SbYQ=
Received: from AM6PR08MB5271.eurprd08.prod.outlook.com (10.255.123.151) by
 AM6PR08MB2999.eurprd08.prod.outlook.com (52.135.163.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Sat, 6 Jul 2019 15:57:47 +0000
Received: from AM6PR08MB5271.eurprd08.prod.outlook.com
 ([fe80::710f:e30c:686f:6d02]) by AM6PR08MB5271.eurprd08.prod.outlook.com
 ([fe80::710f:e30c:686f:6d02%5]) with mapi id 15.20.2052.019; Sat, 6 Jul 2019
 15:57:47 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Denis Obrezkov <denisobrezkov@gmail.com>, Iain Hunter
 <drhunter95@gmail.com>
Thread-Topic: [GSOC-2019] Problem with initializing crossbar on bb-x15 in dom0
Thread-Index: AQHVM/UrlHAhu1Hrek2k4BkolWbUBqa9vy+A
Date: Sat, 6 Jul 2019 15:57:47 +0000
Message-ID: <da1d04bb-54ad-5bf7-f62e-1fecbb1e7611@arm.com>
References: <4ec41ede-a8cb-6724-aa88-254387b2aa15@gmail.com>
 <CALC81-tWyUTXVf5uxtdi_i5Ndz0CRtoJ=XwTecz40bzyL7Ps1w@mail.gmail.com>
 <779518d6-b7f8-9faa-f22d-558013dc8cfb@gmail.com>
 <583833d2-8303-48f5-7cab-f9e4e112a694@gmail.com>
 <3a2a6185-0056-d931-a194-578239eedabc@gmail.com>
 <c85dcf69-2a56-811d-fa95-b313ca9ea66f@arm.com>
 <42daf482-9f3e-55c7-9bad-c61b147252af@gmail.com>
In-Reply-To: <42daf482-9f3e-55c7-9bad-c61b147252af@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0501CA0010.eurprd05.prod.outlook.com
 (2603:10a6:4:8f::20) To AM6PR08MB5271.eurprd08.prod.outlook.com
 (2603:10a6:20b:ef::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.100.41.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e2a2d00-bb58-4738-2b2f-08d7022ab086
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR08MB2999; 
x-ms-traffictypediagnostic: AM6PR08MB2999:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM6PR08MB2999B5D042EE5A58CFE3D84380F40@AM6PR08MB2999.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-forefront-prvs: 00909363D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(189003)(199004)(186003)(53936002)(86362001)(305945005)(71200400001)(31696002)(6246003)(7736002)(26005)(71190400001)(6506007)(4326008)(81166006)(11346002)(52116002)(446003)(3846002)(53546011)(6486002)(8676002)(68736007)(81156014)(476003)(8936002)(6116002)(386003)(44832011)(76176011)(99286004)(2616005)(229853002)(6436002)(6512007)(102836004)(36756003)(5660300002)(25786009)(486006)(2906002)(14454004)(6306002)(31686004)(4744005)(110136005)(66066001)(73956011)(66476007)(66556008)(64756008)(66446008)(316002)(478600001)(66946007)(54906003)(14444005)(72206003)(256004)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB2999;
 H:AM6PR08MB5271.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3yvEQ/02i3fbrsrlhSfJkOtf5Sd3OZfhpO9rnsHmINxMwv5M5M3swoNbaxq03VWhv9vxZWJ6TA3ivKQ3BHBKblcGAJG/3ox67M/jLMYyqhxUCorh0e/kDHL83Pl0qkeg/TGnklXFua3G3kpVy2peVJeDH2Htga9eyxyr4HR9F/eS7QkkiQwEFrXgK+D2Q7FB4WmLWO6D+tuRyNOAvfM3NVvFWF4LMP13cvAO0SFA7iCXnbluhz4Kd6XJpMtubSmn9obbgGfTX/g10AKtqtSgoE5FiY9+HGcB0BxZIxbEIQ2RA/FJr/dfysJWVJ7dHlsh++qYvhepO7HFsBRE0jzhT/ajTAtbkPvC7ga6pE5Jc30zckEHf0YNFiLmIP9NNUbSHrUcWNzOjnHBhhZh7a8G9ej3c7/1dDLA9MqBkYX1whs=
Content-ID: <64774D7114316D4F804E9E2C1C9859E3@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2a2d00-bb58-4738-2b2f-08d7022ab086
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2019 15:57:47.2088 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Julien.Grall@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2999
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

DQoNCk9uIDA2LzA3LzIwMTkgMTM6MjAsIERlbmlzIE9icmV6a292IHdyb3RlOg0KPiBzb3JyeSBm
b3IgY29uZnVzaW5nIHlvdSwgSSBzaGFyZSBhIGJpdCBvdXRkYXRlZCBsb2cgYnV0IG9ubHkgdG8g
c2hvdyB0aGUNCj4gb3V0cHV0IG9mIHhlbiBhYm91dCBkZXZpY2UgdHJlZS4gV2UgYWxyZWFkeSBv
dmVyY29tZSB0aGF0IGVycm9yIGFib3V0DQo+IG9tYXAgc3BlY2lmaWMgbWFwcGluZyAoYXBwbGll
ZCBvbmUgb2YgSWFpbidzIHBhdGNoZXMpLg0KDQpJIGFjdHVhbGx5IG1pc3JlYWQgdGhlIGZpcnN0
IGUtbWFpbCBhbmQgZGlkbid0IG5vdGljZSB0aGUgImFuIG9sZGVyIA0KdmVyc2lvbiIuIFNvcnJ5
IGZvciB0aGUgbm9pc2UuDQoNCj4gDQo+IEkgdHJpZWQgdG8gcmVwbGljYXRlIHRoZSB0ZWdyYSB2
ZXJzaW9uIG9mIGxlZ2FjeSBpcnEgY29udHJvbGxlciBzdXBwb3J0DQo+IHlvdSBtZW50aW9uZWQg
aW4gdGhlIGlycToNCj4gaHR0cHM6Ly9naXRodWIuY29tL2VtYmVkZGVkZGVuL3hlbi9jb21taXQv
MTgwYWY3ZmZjOGFiYmJjM2VkNDFkY2JjOWFiYzZlOGIxMmRhYTU3YQ0KDQogICAgIHJjID0gdW5t
YXBfbW1pb19yZWdpb25zKGQsIF9nZm4ocGZuX3N0YXJ0KSwNCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGZuX2VuZCArIHBmbl9zdGFydCArIDEsDQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF9tZm4ocGZuX3N0YXJ0KSk7DQoNCllvdSBhcmUgbm90IGNvbXB1dGluZyBjb3JyZWN0
bHkgdGhlIG51bWJlciBvZiBwYWdlcy4gSSB0aGluayB5b3Ugd2FudCANCiJwZm5fZW5kIC0gcGZu
X3N0YXJ0ICsgMSIuDQoNCkJ1dCB0aGlzIGZlZWxzIHdlaXJkIHRvIG1hcCB0aGVuIHVubWFwIHRo
ZSBtbWlvLiBJbnN0ZWFkLCB5b3Ugc2hvdWxkIA0KYmxhY2tsaXN0IHRoZSBjcm9zc2JhciBkZXZp
Y2UuIEhhdmUgYSBsb29rIGF0IHRoZSBmaWVsZCBibGFja2xpc3RfZGV2IGluIA0KcGxhdGZvcm1f
ZGVzYy4NCg0KQ2hlZXJzLA0KDQotLSANCkp1bGllbiBHcmFsbA0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

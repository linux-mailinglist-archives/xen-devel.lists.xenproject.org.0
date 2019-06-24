Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2747251B6F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 21:31:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfUdC-0005Cf-Ac; Mon, 24 Jun 2019 19:27:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VJaK=UX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hfUdB-0005Ca-5c
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 19:27:57 +0000
X-Inumbo-ID: 2a2e234f-96b6-11e9-8980-bc764e045a96
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::601])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2a2e234f-96b6-11e9-8980-bc764e045a96;
 Mon, 24 Jun 2019 19:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XlgOgybt/CZpTYQag/F9WU6ons/Ah01yTsUgQEA21G8=;
 b=rmtt75h1P3+r/LbRKTLj1fpbiVElKnKflh9uQy0ydGy7xZmtkqni8gpPkp8mLsf1ZGjylcdoc0dLibHcIxcjwfljUMZL/4+6c+Pesst2+DJZmJLuWtqICBi1cVHNuFVaBckH/o83FlDPaJzxs/YkHqQtCLAHyED6AntI9VcSTSs=
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com (52.134.93.144) by
 AM0PR08MB4420.eurprd08.prod.outlook.com (20.179.34.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 19:27:53 +0000
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::290d:81aa:7f97:5a49]) by AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::290d:81aa:7f97:5a49%3]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 19:27:53 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH] xen/arm: io: add function swap_mmio_handler()
Thread-Index: AQHVIOGxe+eg0DuAkEGFDhTPwP3uS6aXy8kAgAAAFICAADW/gIAAu02AgBJz6ACAAAJEgIAAEPqA
Date: Mon, 24 Jun 2019 19:27:53 +0000
Message-ID: <bc042ae4-db0a-6b25-1e9c-d71a73a0315d@arm.com>
References: <a7c44d926cbe4a0e6447c4aaf8d9862e@sslemail.net>
 <af3fe48d-afaa-3184-e142-9a1e2b8574f4@arm.com>
 <2ed30cde-e2ab-745e-94f5-0cf6155c9122@mxnavi.com>
 <7c645dfb-72f5-5fc2-b559-0a4d09ba8801@arm.com>
 <36531850-15de-2642-6f28-c752a360959c@mxnavi.com>
 <alpine.DEB.2.21.1906241109440.2468@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1906241121070.2468@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1906241121070.2468@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR09CA0035.eurprd09.prod.outlook.com
 (2603:10a6:10:a0::48) To AM0PR08MB3139.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.100.41.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f761e3e-a56a-4c0a-2352-08d6f8da0d47
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB4420; 
x-ms-traffictypediagnostic: AM0PR08MB4420:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB44209BAE14B691ACE3E07B4E80E00@AM0PR08MB4420.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(136003)(366004)(396003)(346002)(189003)(199004)(6506007)(316002)(14454004)(386003)(53936002)(81166006)(81156014)(5660300002)(6246003)(2906002)(6436002)(76176011)(8676002)(11346002)(8936002)(99286004)(53546011)(229853002)(54906003)(6486002)(6116002)(66446008)(3846002)(66556008)(6512007)(64756008)(52116002)(6916009)(66476007)(73956011)(66946007)(31686004)(31696002)(66066001)(44832011)(446003)(86362001)(486006)(71200400001)(71190400001)(68736007)(36756003)(25786009)(305945005)(7736002)(4326008)(102836004)(26005)(256004)(4744005)(2616005)(476003)(478600001)(72206003)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4420;
 H:AM0PR08MB3139.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9kb8esGDbSjtm4vBBUyjOPzjyBYkL4c4tFJhpEJtfsQpc0+8eTqI0H2aFHsdSwsA1CdZl/PyIETj+yPBJFwSZYJ02BKfD0ovCkDFBqpfNFnKS5V+7Dsv4INRxGLwRn7IgEjyPP6iVOtDvRQAw7MFsuamlh1nq/buDBbjVs6vOLRBCWCdIhygyHGiSyhTdjDGBelZKTnzKrxLs5QkfDo2Fzv61/+5a4jWOTbHJJRsqaa4dk0YI2u3fv3dES47+Luc8nP8o7ivYXYNtVLgZvc+QR7g1zDOA2q3mm20T+Qju/9jOs5pQp1moTieSzX9OTL5XmOwYkNo7VOSBl4lZMtb7ZcAtD+fpRKAj1W7S1PFjTeHn5eHcrdwCINrfkZLC8fEwB8zBrXimRXIZ5GT7kH0hX+3Jt0q9xUVTWF+zgUUP7I=
Content-ID: <1438AA8C562A4D419FB2621358B3B8B8@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f761e3e-a56a-4c0a-2352-08d6f8da0d47
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 19:27:53.1906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Julien.Grall@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4420
Subject: Re: [Xen-devel] [PATCH] xen/arm: io: add function
 swap_mmio_handler()
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
Cc: chenbaodong <chenbaodong@mxnavi.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywNCg0KT24gMjQvMDYvMjAxOSAxOToyNywgU3RlZmFubyBTdGFiZWxsaW5pIHdy
b3RlOg0KPiBPbiBNb24sIDI0IEp1biAyMDE5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+
PiBPbiBUaHUsIDEzIEp1biAyMDE5LCBjaGVuYmFvZG9uZyB3cm90ZToNCj4gTGV0IG1lIGFkZCB0
aGF0IGlmIHlvdSBwcmVmZXIgdG8gZG9jdW1lbnQgb25lIG9mIHRoZSBvdGhlciBpbnRlcmZhY2Vz
DQo+IGxpc3RlZCBhYm92ZSBpbiBteSBlbWFpbCwgeW91IGFyZSB3ZWxjb21lIHRvIHBpY2sgYW5v
dGhlciBvbmUuIEZvcg0KPiBleGFtcGxlLCB3ZSBhcmUgYWxzbyBtaXNzaW5nIGEgZG9jIGFib3V0
IHRoZSBEb21VIG1lbW9yeSBtYXAsIGxpc3RpbmcNCj4gYWxsIG1lbW9yeSByZWdpb25zIHdpdGgg
YWRkcmVzc2VzIGFuZCBzaXplcywgYm90aCBNTUlPIGFuZCBub3JtYWwNCj4gbWVtb3J5LiBGb3Ig
dGhhdCwgbW9zdCBvZiB0aGUgaW5mb3JtYXRpb24gaXM6DQo+IA0KPiB4ZW4vaW5jbHVkZS9wdWJs
aWMvYXJjaC1hcm0uaA0KPiANCj4gQSB3ZWxsIHdyaXR0ZW4gaW4tY29kZSBjb21tZW50IGluIGFy
Y2gtYXJtLmggd291bGQgYmUgT0ssIG9yIGFsc28gYQ0KPiBkb2N1bWVudCB1bmRlciBkb2NzL21p
c2MvYXJtLg0KDQpQbGVhc2Ugbm8gZHVwbGljYXRpb24sIGl0IGlzIGFscmVhZHkgcXVpdGUgaGFy
ZCB0byBtYWludGFpbiBvbmUgcGxhY2UuDQpJbnN0ZWFkLCB3ZSBzaG91bGQgZG9jdW1lbnQgYWxs
IHRoZSBoZWFkZXJzIGluIGEgZG9jdW1lbnRlZCBmb3JtYXQgdGhhdCANCmNhbiBiZSBleHRyYWN0
ZWQgYXV0b21hdGljYWxseS4NCg0KQ2hlZXJzLA0KDQotLSANCkp1bGllbiBHcmFsbA0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

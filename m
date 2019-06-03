Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF40333B6
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 17:37:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXoyG-0006Zf-Nh; Mon, 03 Jun 2019 15:34:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b4kp=UC=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hXoyF-0006Za-Gu
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 15:33:59 +0000
X-Inumbo-ID: fff57f19-8614-11e9-8980-bc764e045a96
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::71f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fff57f19-8614-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 15:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXq152VIIcwwK/SF5jbbMAUFtyrwZS/OURkro4+LTvs=;
 b=E6MX85NeWTImh6tl2Hvkl21Tz3adeKcMTiQD2sHJPX/X5cToue9EVwqhs7qKbRaq4HXdAu/xQOhnKzCbl7m9wAxhUOAdS5TEvL6eivFQLHi4yF2iRuRUkGJt/b8nNkRYAmc/PYNizUsT5oZbJBFEKWDPwW4EhEWTG+bP//fDKxA=
Received: from AM0PR02MB5572.eurprd02.prod.outlook.com (10.255.30.141) by
 AM0PR02MB5795.eurprd02.prod.outlook.com (52.132.212.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.16; Mon, 3 Jun 2019 15:33:55 +0000
Received: from AM0PR02MB5572.eurprd02.prod.outlook.com
 ([fe80::1120:f8e6:62cc:c204]) by AM0PR02MB5572.eurprd02.prod.outlook.com
 ([fe80::1120:f8e6:62cc:c204%5]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 15:33:55 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 5/9] vm_event: Simplify vm_event interface
Thread-Index: AQHVFvKajqaPY1TYr0O2MCtyaWDsEqaF50QAgAAGsYCABCekAA==
Date: Mon, 3 Jun 2019 15:33:55 +0000
Message-ID: <e72ed358dc072d7f27294e1c69703af404adaadd.camel@bitdefender.com>
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <922965b261f4ca23bcb276d6907f36c892c2478b.1559224640.git.ppircalabu@bitdefender.com>
 <12a39c6e-6e4e-1bbe-47e4-ad13769acdae@citrix.com>
 <5e29c821-8812-9fc9-1fc1-88dd4a04fb31@citrix.com>
In-Reply-To: <5e29c821-8812-9fc9-1fc1-88dd4a04fb31@citrix.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR04CA0053.eurprd04.prod.outlook.com
 (2603:10a6:802:2::24) To AM0PR02MB5572.eurprd02.prod.outlook.com
 (2603:10a6:208:161::13)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6252312b-52b4-4fae-278e-08d6e838e352
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR02MB5795; 
x-ms-traffictypediagnostic: AM0PR02MB5795:|AM0PR02MB5795:
x-microsoft-antispam-prvs: <AM0PR02MB57954FBC27959BFEAE792CC3D6140@AM0PR02MB5795.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(346002)(376002)(136003)(366004)(199004)(189003)(71200400001)(71190400001)(118296001)(26005)(52116002)(102836004)(76176011)(4744005)(68736007)(99286004)(53546011)(386003)(6506007)(5660300002)(66946007)(110136005)(73956011)(66556008)(66476007)(66446008)(64756008)(316002)(486006)(66066001)(256004)(186003)(476003)(2616005)(446003)(11346002)(25786009)(6116002)(50226002)(478600001)(305945005)(2906002)(36756003)(8676002)(81156014)(81166006)(3846002)(86362001)(6436002)(7736002)(6486002)(14454004)(229853002)(6512007)(6246003)(53936002)(2501003)(8936002)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5795;
 H:AM0PR02MB5572.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XljO4vFKPqEhOH4IzSVINCVUHtEGtLDRbOBVdluzepw6QUSSWNpFcPr+ddTvnu6MpD8T1LEmTOST1olaJpOCdJ7cgUgPDyJ8VLn+ZqTOSJXWYwOrbevs3U47n+h7E26KmAq8+QmWPd6ap9w3H2HEOUTYWwH6ISfLIlYwHsSIXiEKe3CtWNawB0oGmO8dR5KiHikvo8ryo0vmptdl3AzjKtU6brJEVIs1pUDiOvbGRhFGD9D493ld+HwcY1HFoTzNJftqHi0Uj0xWvQahAs0FKKvRMuYkd0fJUPbcFbCYRjOGbGtWbMHOXn8675/yE/Afds1WkHl0lfsVJ6q2iQY25A2X/ZEA2K/7Y+E5Phk4uXHDWahjeu94R1VzuBwrfk88pEqwQHFI64Nyaw/sO66VOj/EyG5FGoHc0Gw8DxNs4YA=
Content-ID: <8C0912EB3016DA42A7A133A41F88DF98@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6252312b-52b4-4fae-278e-08d6e838e352
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 15:33:55.1687 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppircalabu@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5795
Subject: Re: [Xen-devel] [PATCH 5/9] vm_event: Simplify vm_event interface
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyMDE5LTA1LTMxIGF0IDE3OjA2IC0wNzAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiBPbiAzMS8wNS8yMDE5IDE2OjQzLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPiA+IE9uIDMwLzA1
LzIwMTkgMDc6MTgsIFBldHJlIFBpcmNhbGFidSB3cm90ZToNCj4gPiA+IFRoZSBkb21haW4gcmVm
ZXJlbmNlIGNhbiBiZSBwYXJ0IG9mIHRoZSB2bV9ldmVudF9kb21haW4gc3RydWN0dXJlDQo+ID4g
PiBiZWNhdXNlIGZvciBldmVyeSBjYWxsIHRvIGEgdm1fZXZlbnQgaW50ZXJmYWNlIGZ1bmN0aW9u
IGJvdGggdGhlDQo+ID4gPiBsYXR0ZXINCj4gPiA+IGFuZCBpdCdzIGNvcnJlc3BvbmRpbmcgZG9t
YWluIGFyZSBwYXNzZWQgYXMgcGFyYW1ldGVycy4NCj4gPiANCj4gPiBJdCBjYW4sIGJ1dCB3aHkg
aXMgYWRkaW5nIGEgYmFja3BvaW50ZXIgaGVscGZ1bD8NCj4gPiANCj4gPiBJIGFzayBiZWNhdXNl
IEkgc2VlIDUgcmVhZHMgb2YgdmVkLT5kLCBhbmQgbm90aGluZyB3aGljaCBldmVyDQo+ID4gaW5p
dGlhbGlzZXMgaXQuDQo+IA0KPiBQLlMuIEkndmUgZmluYWxseSBmb3VuZCB0aGUgaW5pdGlhbGlz
YXRpb24gaW4gcGF0Y2ggNy4NCj4gDQo+IH5BbmRyZXcNCj4gDQpNeSBtaXN0YWtlLiBJJ3ZlIG9u
bHkgY2hlY2sgaWYgdGhpcyBwYXRjaCBjb21waWxlcyBvay4gSSB3aWxsIGZpeCBpdA0KYW5kIHNw
bGl0IHRoZSBwYXRjaCBhY2NvcmRpbmcgdG8geW91ciBzdWdnZXN0aW9ucy4NCg0KTWFueSB0aGFu
a3MgZm9yIG5vdGljaW5nLA0KUGV0cmUNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 612A68E194
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 01:59:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hy36b-0000US-2p; Wed, 14 Aug 2019 23:55:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yoLQ=WK=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1hy36Z-0000UN-3D
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 23:54:59 +0000
X-Inumbo-ID: eb53b59a-beee-11e9-96f7-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.97]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb53b59a-beee-11e9-96f7-bc764e2007e4;
 Wed, 14 Aug 2019 23:54:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDOfntREvowEJ5GLEcvltws7SI9x6ztFRwbbZLv6d7RWINsMeENK/Qehh1kwcNVfZBUG1csuL7FHm4k8x2YlsIrfAs8wJocUP6/+2DAmRXllzyMNnrT8GTvcRzxgL3lK6J0MAxjTRgsfQDlkJ2kFHSOxTIRg2/Qjd8elTuATrFYfyfXKsIunJuZ9V/zs8eGHtBG75cEi9Vbyuiuiof8cGutmRn1Vi6t9RauhNjgmj0VCN8shO7WzQKApriHHceFFY6G3RUONUj7GzeePCuhnsd6Ex4MeGP9647O/5bOFtWkS5ctA6+3Xat0yLbudyHBrCivNGmwb/VrxQXR76qpWXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODM+UYT7b+0YB1B0Rx4uBf6NcOHYtsQXYsxd9j+Rk9Q=;
 b=RTPEAwPwnoZgQnpKs+x2DcZRzGLZ5BE1KWo0j2s/aICVWknMr5QUsI3aTQ26mw+20/lQMGuPBx1f9GBt+erYbm/smtl0UrGTG+xDj+FjdxjlOREhnVgk0S42FoOpBIWJmUvJ/TVkb9SJlwFURb3tVGdE8KPRVvA10rcRjs9NyqedmICHif4g/4Hj94RZ62788p+qK3zNmXkAkjzm2yKh3VtoCKkMm/rae4US8JTMFoSV0ysTRSeYT/02HpYGMkTGuqSzM3RyVWbOi+HYThi58bVdVS43AS5kn6cF6TneegF3nSesOS/pgHPuYzJrv1wNpz3afw6MFFbm5dcl1iuidA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=durham.ac.uk; dmarc=pass action=none header.from=durham.ac.uk;
 dkim=pass header.d=durham.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector2-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODM+UYT7b+0YB1B0Rx4uBf6NcOHYtsQXYsxd9j+Rk9Q=;
 b=hczMEU788inUHtOQP6OUpuz2PtOmPwY8OWTSMYCVQEZYUAQtWwL+gTuKseGrYYyjdkN0Bome5cW62omGw8fD0y1wGVikDXkNjC42o8sjNF7GehCrJt1e3ll7tAOe1hwslVh9f/ZFDQmACgdQIjHfDN7B6GxeT4SieqovhoFDqiw=
Received: from VI1PR06MB4720.eurprd06.prod.outlook.com (20.177.200.18) by
 VI1PR06MB4110.eurprd06.prod.outlook.com (20.176.5.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Wed, 14 Aug 2019 23:54:53 +0000
Received: from VI1PR06MB4720.eurprd06.prod.outlook.com
 ([fe80::3164:1b3d:165e:ac42]) by VI1PR06MB4720.eurprd06.prod.outlook.com
 ([fe80::3164:1b3d:165e:ac42%6]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 23:54:53 +0000
From: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
To: Steven Haigh <netwiz@crc.id.au>
Thread-Topic: [PATCH] read grubenv and set default from saved_entry or
 next_entry
Thread-Index: AQHVUvuqPvsRoX8NVkqUHn9yEgeJ1g==
Date: Wed, 14 Aug 2019 23:54:53 +0000
Message-ID: <alpine.LFD.2.21.1908150030150.2807@austen3.home>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Alpine 2.21 (LFD 202 2017-01-01)
x-originating-ip: [2a00:23c4:9208:400:c49a:db08:8036:b390]
x-clientproxiedby: LO2P265CA0444.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::24) To VI1PR06MB4720.eurprd06.prod.outlook.com
 (2603:10a6:803:90::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=m.a.young@durham.ac.uk; 
x-ms-exchange-messagesentrepresentingtype: 1
x-x-sender: michael@austen3.home
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 775b2c72-56b1-4e5e-441b-08d72112cd55
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR06MB4110; 
x-ms-traffictypediagnostic: VI1PR06MB4110:
x-microsoft-antispam-prvs: <VI1PR06MB4110C2DFF1C36A51D514808387AD0@VI1PR06MB4110.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(199004)(189003)(58126008)(786003)(305945005)(64756008)(7736002)(66556008)(71200400001)(66446008)(256004)(99286004)(6916009)(14454004)(4744005)(6486002)(316002)(5660300002)(6436002)(66476007)(54906003)(9686003)(6512007)(66946007)(71190400001)(53346004)(86362001)(102836004)(476003)(81166006)(186003)(486006)(25786009)(8676002)(2906002)(6506007)(4326008)(52116002)(53936002)(386003)(36756003)(46003)(8936002)(81156014)(478600001)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR06MB4110;
 H:VI1PR06MB4720.eurprd06.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: durham.ac.uk does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: acLeFn/Ym5MVbaYNK7Xd5cguvm3mPkyS/Bao4qlgG3OGK5aa9DE5SPtX/h92z71+o0vTc50pmfvTEfCvdHZQoGXM68BN+VHtLEKgrcbzmNxAKQYpNP4uJJnGelfEZona1PcepyGTM8wTdIu4sp7dJbSF1mP7JjXiMDj7kpIIXKub2FwSz937VpH6DYUzlB+R8B/PJwJwdCDJ7pMg0ykFdGfqAPoQNw8Ncmv1x1xAMckK12AaSRc6i4b5m+mg15KtMx5CbHdYiaCkG1V7mKvDRVezOpklphcQ4H68Ylm60n4iJrNKOM8soP0HWmGFpgj4jJeFr3J8Kdg0VatuEC1KdE6SBi2JCb5frJDoWCpvoqAc91nbCXyDLY4HGf9qKoag0bHB3DHxO89wzP386PBpmQeIS5NOuKZNrknJ+LqlAdA=
x-ms-exchange-transport-forked: True
Content-ID: <5853D166265F0740997D33C33F8BE1EA@eurprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: 775b2c72-56b1-4e5e-441b-08d72112cd55
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 23:54:53.6328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lqhCSzN0CIaFP2emZWPL1gBe2mQJ97JsdrgzyIREoKf2JtpdTAd8jjlcToE+EceO/0fwNOI71OEQGEbPEomKaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB4110
Subject: [Xen-devel] [PATCH] read grubenv and set default from saved_entry
 or next_entry
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBtYXkgaGVscCB5b3VyIGlzc3VlIHdpdGggdGhlIGRlZmF1bHQga2VybmVsIHNl
dHRpbmcgb24gRmVkb3JhIAozMCBhcyBpdCB1c2VzIHRoZSBzZXR0aW5nIG9mIHNhdmVkX2VudHJ5
IG9yIG5leHRfZW50cnkgZnJvbSB0aGUgZ3J1YmVudiAKZmlsZSB0byBjaG9vc2UgdGhlIGRlZmF1
bHQga2VybmVsIHdoaWNoIHNob3VsZCBvdmVycmlkZSBhbnkgc2V0dGluZyBwaWNrZWQgCnVwIGZy
b20gaWYgY2xhdXNlcyBpbiB0aGUgZ3J1Yi5jZmcgZmlsZS4KCkkgaGF2ZSBvbmx5IGRvbmUgbGlt
aXRlZCBhbmQgc29tZXdoYXQgaW1wZXJmZWN0IHRlc3Rpbmcgb24gaXQgYW5kIGlzbid0IGEgCnBy
b3BlciBmaXggKHdoaWNoIHdvdWxkIHVzZSBncnViZW52IHNldHRpbmdzIGJhc2VkIG9uIHdoYXQg
aXMgaW4gdGhlIGlmIApjbGF1c2VzKSBidXQgSSB0aGluayBpdCBzaG91bGQgd29yayBpbiB5b3Vy
IGNhc2UuCgogCU1pY2hhZWwgWW91bmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=

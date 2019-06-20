Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 010424D27D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 17:54:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdzKV-0008Ox-MF; Thu, 20 Jun 2019 15:50:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IGdI=UT=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hdzKU-0008Os-3J
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 15:50:26 +0000
X-Inumbo-ID: 1d5e10d6-9373-11e9-8980-bc764e045a96
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::601])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1d5e10d6-9373-11e9-8980-bc764e045a96;
 Thu, 20 Jun 2019 15:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAhiIu5dr4YVXDwt/PsXnwCsSRVKOViuuhkBL6Hme6s=;
 b=HXk5B5yN6T9fiNHpEJ4Q0Fork+MKo4RhKwUuXtAJH64ZbqKf4NBI2rKjMUTZcikVkV6HA9Gg0ZHXExMmkrb7kz8e3x/V5a1uObI5aDWBvxLqjABwZenHsuOPNVZqVtOj3u1ZZjL7Sg9dw6M1jPGmwZUTH4mjXHloOOwa1R/SW0vQNTjFDo6L1AebMDYdFlSCuEGQoyNNwpSGCNygjW+gg6IsI7dElcFQc9sry0ni1yN2EXQPP5z7dI6dMjTvUemPK8lhVQ4tngPLvFUsOwkwJRseOqA4twlatuOq+hmZ09DhdkENFZHFc1bOJCMyRouxYrqNdfGX93gBEgxeN2BfhQ==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB5908.eurprd03.prod.outlook.com (10.255.29.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.15; Thu, 20 Jun 2019 15:50:22 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb%7]) with mapi id 15.20.1987.013; Thu, 20 Jun 2019
 15:50:22 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien.grall@arm.com>
Thread-Topic: [PATCH] xen/arm: optee: fix compilation with GCC 4.8
Thread-Index: AQHVJ3/e0PpRJnVb40CIrCVLjIvnsg==
Date: Thu, 20 Jun 2019 15:50:21 +0000
Message-ID: <20190620154952.31286-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ef592d6-327b-45d5-e1cc-08d6f59700b2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB5908; 
x-ms-traffictypediagnostic: AM0PR03MB5908:
x-microsoft-antispam-prvs: <AM0PR03MB590862BCCA141EB40EFCFE6DE6E40@AM0PR03MB5908.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(366004)(39860400002)(136003)(396003)(189003)(199004)(478600001)(6486002)(66446008)(81156014)(8676002)(72206003)(76116006)(8936002)(1076003)(7736002)(66556008)(91956017)(4326008)(64756008)(36756003)(66946007)(53936002)(71190400001)(81166006)(186003)(66476007)(26005)(71200400001)(305945005)(476003)(25786009)(486006)(2616005)(86362001)(3846002)(5660300002)(68736007)(80792005)(6436002)(66066001)(102836004)(316002)(14444005)(99286004)(2906002)(6512007)(73956011)(14454004)(6116002)(54906003)(110136005)(6506007)(55236004)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5908;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ykeObCG/hFrPe/tC6OTONLzWw/EG7ROfTtxL33kI3V/c3723XM8G4tQSg86+JzVpqYUAncBt6epyIDd3C2SgX+zC3c17z9tyT6K7DqcK3T+QHh9ATCciA0k9Pqa8svL7WYIylf0mNTv32V8Zr38vactUeg42AvggIgxP2aPEzVLRBEt6w5ha8ElStg3vz97ubf8NONE3NKEBxy1GN21bP1/YrGZdQf+U/6BGeS60iIwLMIBF/9qMWCeBnoLITFVAxe7MEmPMHwgTPU+3f1EXh2cqDynGtDLH0Ne8kSLxuejGAMKkM1BzVjW+OFYIPqy0OGKv5u8Y/s/GyZ1BN30NUwQifXl04pnvJYnfU+/ym7ElOHdiFbW1S8nVBwYCZN47GsN0SQGei+oSGv9Ta/TLhfa33yBYnvPd8S/G409AfXs=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef592d6-327b-45d5-e1cc-08d6f59700b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 15:50:21.8944 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5908
Subject: [Xen-devel] [PATCH] xen/arm: optee: fix compilation with GCC 4.8
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkdDQyA0LjggaXMgdW5hYmxlIHRvIHNlZSB0aGF0IHZhcmlhYmxlcyBndWVzdF9wZywgZ3Vlc3Rf
ZGF0YSBhbmQKeGVuX2RhdGEgd2lsbCBiZSBhbHdheXMgaW5pdGlhbGl6ZWQgYmVmb3JlIGFjY2Vz
cywgc28gd2UgbmVlZCB0bwppbml0aWFsaXplIHRoZW0gZWFybGllci4KClN1Z2dlc3RlZC1ieTog
U3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgpTaWduZWQtb2ZmLWJ5OiBW
b2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+Ci0tLQogeGVuL2Fy
Y2gvYXJtL3RlZS9vcHRlZS5jIHwgMTMgKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL29wdGVlLmMgYi94
ZW4vYXJjaC9hcm0vdGVlL29wdGVlLmMKaW5kZXggMTQzODFkNmIyZC4uNTUyNjg3NWU2ZiAxMDA2
NDQKLS0tIGEveGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5jCisrKyBiL3hlbi9hcmNoL2FybS90ZWUv
b3B0ZWUuYwpAQCAtNzE3LDYgKzcxNywxOSBAQCBzdGF0aWMgaW50IHRyYW5zbGF0ZV9ub25jb250
aWcoc3RydWN0IG9wdGVlX2RvbWFpbiAqY3R4LAogICAgIGdmbiA9IGdhZGRyX3RvX2dmbihwYXJh
bS0+dS50bWVtLmJ1Zl9wdHIgJgogICAgICAgICAgICAgICAgICAgICAgICB+KE9QVEVFX01TR19O
T05DT05USUdfUEFHRV9TSVpFIC0gMSkpOwogCisgICAgLyoKKyAgICAgKiBXZSBhcmUgaW5pdGlh
bGl6aW5nIGd1ZXN0X3BnLCBndWVzdF9kYXRhIGFuZCB4ZW5fZGF0YSB3aXRoIE5VTEwKKyAgICAg
KiB0byBtYWtlIEdDQyA0LjggaGFwcHksIGFzIGl0IGNhbid0IGluZmVyIHRoYXQgdGhvc2UgdmFy
aWFibGVzCisgICAgICogd2lsbCBiZSBpbml0aWFsaXplZCB3aXRoIGNvcnJlY3QgdmFsdWVzIGlu
IHRoZSBsb29wIGJlbG93LgorICAgICAqCisgICAgICogVGhpcyBzaWxlbmNlcyBvbGQgR0NDLCBi
dXQgY2FuIGxlYWQgdG8gTlVMTCBkZXJlZmVyZW5jZSwgaW4KKyAgICAgKiBjYXNlIG9mIHByb2dy
YW1tZXIncyBtaXN0YWtlLiBUbyBtaW5pbWl6ZSBjaGFuY2Ugb2YgdGhpcywgd2UKKyAgICAgKiBh
cmUgaW5pdGlhbGl6aW5nIHRob3NlIHZhcmlhYmxlcyB0aGVyZSwgaW5zdGVhZCBvZiBkb2luZyB0
aGlzCisgICAgICogYXQgYmVnaW5uaW5nIG9mIHRoZSBmdW5jdGlvbi4KKyAgICAgKi8KKyAgICBn
dWVzdF9wZyA9IE5VTEw7CisgICAgeGVuX2RhdGEgPSBOVUxMOworICAgIGd1ZXN0X2RhdGEgPSBO
VUxMOwogICAgIHdoaWxlICggcGdfY291bnQgKQogICAgIHsKICAgICAgICAgc3RydWN0IHBhZ2Vf
aW5mbyAqcGFnZTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 227119B66E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 20:52:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i1Ec6-0001ho-K7; Fri, 23 Aug 2019 18:48:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gZL1=WT=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1i1Ec5-0001hj-Ey
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 18:48:41 +0000
X-Inumbo-ID: 9ed06486-c5d6-11e9-adef-12813bfff9fa
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.75]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ed06486-c5d6-11e9-adef-12813bfff9fa;
 Fri, 23 Aug 2019 18:48:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBjRYSv97eeV4ns9jaDSFBKPdsK2Udc3BjjwySv8RO/qetJKkpDac3i5Su10hcynOtkca+iQnGn5toD5O/jix73t64lJnhLEcfnSEa94ga/+d71NMTm/3ORsc0Zlr0FXye0E1F4fjkQ8N958BDlQCQfs6JkjkNAQf3AROHqLV0WUhKYoF/ZAjjGnlfE6Fj5rHTO0gDjb4mtoIwMSCGIIUc5L+VLccSrgZwhHs5hojnhtmNhT5VzYYDN/nTgMagPar2HdpWcWnkyAlPUGXdyUuaaTBreoYv9zNhIOFETVTHdRWjhOEcKro0Db4ogC/Ufh+c7LbJXhqUwlL3pPfy4XZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yb87uhhnNZkJ+VEbIb/cDZ9setpPuf6DZRwUiaIt7hI=;
 b=DaufWc3OMIDacgHLQFrW53srZ4KkUPZz4Hhicc/UUbHgDnmEHpALX2Dc0qk7dP+8YUnCKOLh8p1PbNIZ/M93+7XzgS674YDX/FlwRlBaflS/27k5ematl2ZY6UGsmZW1g06raqUJx0FXsfLUx8CbI0RreV3i0x55NOrBkhfA8TfYe3EAIU3yfEr1/001r5mqAPjnhBot9mj0P1VaaNFWXjYpj3kwQTQaYe3rymYBHzMayGtoiWRoWgA/IOAt7XMZjetbiEHl6pT77f0nqpCfKP85oRWDCiH45lJrd6dXCImqIYTziAfyVKYc760VswLNO/Pt85JWJE//m6VYcGQWrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yb87uhhnNZkJ+VEbIb/cDZ9setpPuf6DZRwUiaIt7hI=;
 b=H0EuAd8gQi8COeBSPHyFqefW5ezEHNweQd35hP15NZ9C3LAS4TEshyK7OD07sJUpfgVI7siZEBWSi/RoqrpOOIAl8xPMT+2z1j5+jbcILCHApnIWbi9uJEb6bshg8wloa9frtPVgI2kAg4VoG2LY6Uj/KIMiXGHAsxFHtZrFF5Xfnzn+ABKtH1Dx8oGF3ERvw8zBLvgxVvY+71dC4CD3d7alH0G4dMpXYdKjcS1Xg+IvZv8uQq9Mq8bNbNv6eYRz4azhhviuvQKMhXvAW1eftZbDVDog66tB2mp4qq0BtFbj2X4YKCehcoOGHxnJ/6nM1KjzTnzh2tZvq6TMz4lBOw==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4690.eurprd03.prod.outlook.com (20.177.41.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Fri, 23 Aug 2019 18:48:38 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Fri, 23 Aug 2019
 18:48:37 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 0/5] arch/arm: optee: fix TODOs and remove "experimental"
 status
Thread-Index: AQHVWeNfPLX4B+V83EWZmLSwU6JTbQ==
Date: Fri, 23 Aug 2019 18:48:37 +0000
Message-ID: <20190823184826.14525-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ea7639e3-4fec-4baf-b07e-08d727fa8258
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4690; 
x-ms-traffictypediagnostic: AM0PR03MB4690:|AM0PR03MB4690:
x-ms-exchange-transport-forked: True
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM0PR03MB4690722DAD8A2F92DDED59B3E6A40@AM0PR03MB4690.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(189003)(199004)(6436002)(305945005)(25786009)(81166006)(71190400001)(478600001)(7736002)(81156014)(966005)(5660300002)(8676002)(71200400001)(4326008)(186003)(6506007)(99286004)(2351001)(6486002)(1076003)(2501003)(26005)(2906002)(6916009)(66446008)(55236004)(66946007)(91956017)(14454004)(76116006)(66476007)(66556008)(36756003)(64756008)(6116002)(6512007)(3846002)(476003)(6306002)(2616005)(316002)(54906003)(86362001)(80792005)(102836004)(5640700003)(8936002)(66066001)(14444005)(486006)(256004)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4690;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cbnVe1WuuSGTmVkGtBA/pnqN7SoKT1ZDx1DTOTt68hAUCq3SAihWg1SSxJePcbvkZCaz6lSr2VbqxV2YEukkKDuiYcR4mEW1AgavPMdwZt295FEEFKYkBfayW1x4xAJQtg/tBTrVW+CUshtma1fjE/CAjDh7S9QaIbtZjpLMkzoxBtNIR4+zMhEItajL6T14nOdqTsaqv+MkIzt64R3WaP/+b9gLKrveixWsXeI/bvY2ibZfecucFLIZUH6tQ8a4PlrfPXIj6kdSqR30gQ4FLKkO+8S/n9kbOUFXxwq8Gjjh5RR61mEjPmUvQJuIuoQeYDYbOjCQe+zgP2jrt3TCl05HN8KJiqS1KW/HDN7C9RmTUIYO3u+HNvEu+TwKj2DGoRkWvUwxspKJHrF3b2yvmjTi4BuiRRUN61yxO9uHH/M=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea7639e3-4fec-4baf-b07e-08d727fa8258
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 18:48:37.6343 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jatIosauGJbd69YyVJr6okcuVDBSPAYrK5msj+aLZK1ljpADggeLXnaixL8j1omNtcWSXbmkAfrIhO5jxFvL8kWoFWgzjrg2VF6rbNISHXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4690
Subject: [Xen-devel] [PATCH 0/5] arch/arm: optee: fix TODOs and remove
 "experimental" status
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpUaGlzIHBhdGNoIHNlcmllcyBmaXhlcyB2YXJpb3VzIHVuZmluaXNoZWQgaXRlbXMg
aW4gdGhlIE9QLVRFRSBtZWRpYXRvci4KTW9zdGx5IHRoaXMgaXMgYWJvdXQgbGltaXRpbmcgcmVz
b3VyY2VzIHRoYXQgZ3Vlc3QgY2FuIGNvbnN1bWUuIFRoaXMKaW5jbHVkZXMgYm90aCBtZW1vcnkg
YW5kIHRpbWUgLSBob3cgbWFueSBidWZmZXJzIGd1ZXN0IGNhbiBzaGFyZSB3aXRoCk9QLVRFRSAo
dGhpcyB1c2VzIFhlbiBtZW1vcnkpIGFuZCB3aGVuIG1lZGlhdG9yIHNob3VsZCBwcmVlbXB0IGl0
c2VsZiwKdG8gbWFrZSBzdXJlIHRoYXQgZ3Vlc3QgZG9lcyBub3Qgc3RyZXNzIHNjaGVkdWxpbmcu
CgpBcGFydCBmcm9tIHRoaXMsIHRoZXJlIHdlcmUgb25lIGNhc2UsIHdoZW4gbWVkaWF0b3IncyBh
Y3Rpb25zIG1pZ2h0IGxlYWQKdG8gbWVtb3J5IGxlYWsgaW4gYSBnb29kLWJlaGF2aW5nIGd1ZXN0
LiBUbyBmaXggdGhpcyBpc3N1ZSBJIGhhZCB0bwpleHRlbmQgbWVkaWF0b3IgbG9naWMsIHNvIG5v
dyBpdCBjYW4gaXNzdWUgUlBDIHJlcXVlc3RzIHRvIGd1ZXN0IGluIHRoZQpzYW1lIHdheSwgYXMg
T1AtVEVFIGRvZXMgdGhpcy4gVGhpcyBpcyB1c2VmdWwgZmVhdHVyZSwgYmVjYXVzZSBpdAphbGxv
d3MgdG8gcHJlZW1wdCBtZWRpYXRvciBkdXJpbmcgbG9uZyBvcGVyYXRpb25zLiBTbywgaW4gdGhl
IGZ1dHVyZQppdCB3aWxsIGJlIHBvc3NpYmxlIHRvIHJlbW92ZSBzaGFyZWQgYnVmZmVyIHNpemUg
bGltaXRhdGlvbiwgYmVjYXVzZQptZWRpYXRvciBjYW4gcHJlZW1wdCBzZWxmIGR1cmluZyBidWZm
ZXIgdHJhbnNsYXRpb24uCgpUaGlzIHBhdGNoIHNlcmllcyBjYW4gYmUgcHVsbGVkIGZyb20gWzFd
LgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9sb3JjL3hlbi90cmVlL29wdGVlM192MQoKVm9sb2R5
bXlyIEJhYmNodWsgKDUpOgogIHhlbi9hcm06IG9wdGVlOiBpbXBvc2UgbGltaXQgb24gc2hhcmVk
IGJ1ZmZlciBzaXplCiAgeGVuL2FybTogb3B0ZWU6IGNoZWNrIGZvciBwcmVlbXB0aW9uIHdoaWxl
IGZyZWVpbmcgc2hhcmVkIGJ1ZmZlcnMKICB4ZW4vYXJtOiBvcHRlZTogbGltaXQgbnVtYmVyIG9m
IHNoYXJlZCBidWZmZXJzCiAgeGVuL2FybTogb3B0ZWU6IGhhbmRsZSBzaGFyZSBidWZmZXIgdHJh
bnNsYXRpb24gZXJyb3IKICB4ZW4vYXJtOiBvcHRlZTogcmVtb3ZlIGV4cGVyaW1lbnRhbCBzdGF0
dXMKCiB4ZW4vYXJjaC9hcm0vS2NvbmZpZyAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL2FybS90ZWUv
S2NvbmZpZyB8ICAgMiArLQogeGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5jIHwgMjM3ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAxODQgaW5z
ZXJ0aW9ucygrKSwgNTcgZGVsZXRpb25zKC0pCgotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

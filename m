Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A459B672
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 20:52:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i1EcF-0001i8-T4; Fri, 23 Aug 2019 18:48:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gZL1=WT=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1i1EcE-0001hy-5Z
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 18:48:50 +0000
X-Inumbo-ID: a4076792-c5d6-11e9-adef-12813bfff9fa
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.44]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a4076792-c5d6-11e9-adef-12813bfff9fa;
 Fri, 23 Aug 2019 18:48:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lq30uAqT7TttHlpmVWq+uKvkeXhuywLVeFBp0FhzCDazdCOey80K3iDxeP9RfXbHcPIqwL32ZcN+iyi5He1fe6EWJ5aqUrSb8WOPwcD64DGGv5W9eldgeWRphqh7NuSZjmWLMCl0VZTw3biyIcDRacSPZxxjPfqX3LvOnHl5g65hSjS63KnrRAtvayloNGEJ1YbDkbzwRu6HE/LZmhT+37qBvxpDKrNkOcHztBv3fww4ilDbTHxjm/OmoY4FBy0DZ2TNNazYIpoqjydjY7KaPKVhOMMsak4y0IfgAer5aiStgL6NYDyjlyS6S7BkZATX6hYFzCpb/Sq8oJ+3YxxSCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wcxbcpo/okkTVzuNPy2P6JFd/kTE20LYJk6ij1ASiA=;
 b=BaP732LkfSptowFZe15cMDkYNbboJb9cgjPQtAJRzGzyirn8Yegy5L5BYIJP8Eq5hW6h7oH3wR8BwE/jrSsktM0RcgWw436X9xJO7Kd555RBa642ZAYHItJ2W0s6zWd5aKVVpcLW9J9wVvI8ZFRReBH84Kysuok/1o8kVK2Sk9gvBbawr8Yuj/Sv2GWt4XDAry5tjM0VBSOW5U0L6SrqJS7ps0tY4BCyGhmGsGawl9HrOa9Z+havTQOCUiVsFGe9uNtk/kUrfnp/0VJgeuB8cDvoPZPPiI4bI2GiQ0j3rN2Kr5o5TUG0mSrpW0vMcaOda7rjp0ywLPWa0ZTI4VmPOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wcxbcpo/okkTVzuNPy2P6JFd/kTE20LYJk6ij1ASiA=;
 b=aY71xuS46n6jlaCShBuXvM3mP//FqPmLEayKPcdvLCvfFbsR28ty6sLQ5ArmmCtZMvDcuad3Cd5VE3nYsmltHvMHwUH0nEJo8t9TmSCrSaV+lNcQdXf8jeluP4/24i3O9Ge6WgNLfXp4c1xnD98p5JAsbYrmpBQg0Z/pTxrYcSUVEK0/F09qLygBdoJnT6+0DHGN27aaEYV0gTMdD/Nlay1Ge4XM5cN2q58vH7OZZIhO+TwtwCsJkW/4n8u/7IlwOUGhCphLmJlTUuBpU90t+0Trl6vpkUIB12GADBx52loJ6uYnE54+RxMPA6RRL0VKy6ufelbqTfZuYb8eQHcIRw==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4690.eurprd03.prod.outlook.com (20.177.41.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Fri, 23 Aug 2019 18:48:46 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Fri, 23 Aug 2019
 18:48:46 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 1/5] xen/arm: optee: impose limit on shared buffer size
Thread-Index: AQHVWeNlCY0CqDi7zE2giEuaPhvOCg==
Date: Fri, 23 Aug 2019 18:48:46 +0000
Message-ID: <20190823184826.14525-2-volodymyr_babchuk@epam.com>
References: <20190823184826.14525-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20190823184826.14525-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8ddb2ad-9b70-4622-4ef3-08d727fa87ad
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4690; 
x-ms-traffictypediagnostic: AM0PR03MB4690:|AM0PR03MB4690:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB46904E02BDA4EB07E91D5964E6A40@AM0PR03MB4690.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(189003)(199004)(52084003)(6436002)(305945005)(25786009)(76176011)(81166006)(71190400001)(478600001)(7736002)(81156014)(5660300002)(8676002)(71200400001)(4326008)(186003)(6506007)(99286004)(2351001)(6486002)(1076003)(2501003)(26005)(2906002)(6916009)(66446008)(55236004)(66946007)(91956017)(14454004)(76116006)(66476007)(66556008)(36756003)(64756008)(6116002)(6512007)(446003)(11346002)(3846002)(476003)(2616005)(316002)(54906003)(86362001)(80792005)(102836004)(5640700003)(8936002)(66066001)(14444005)(486006)(256004)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4690;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pljiRIPf4TvJOrfmikttJeu7cen9KdZLvrf4ZdH7TM9LDm9mbp/sykKctRenPu2P38S2DsObNvY9N7xSDSbqzjycBwchv7KUsxGi5CkXP1VG5gJV4jOK68+BM46H6l99lfeM/08z5+6SaAvNK2wWqgUu/b3GsTwR4unbn1zIySJ90HrvEro95frMH5dP2Qg5GyUNMc1i/qrzN+6MT9JjMbr2X0QJVsIEc+tp+qd/7PvVEbnX3ZX5v0lmH8XL1xUuSechz6Z71rwM/ubCdHbWryvnUC1YP3wRBkJJFM9vEtQhbYWbInzL4nu1Y/u3tV3Tx4wLoyhgR/rrtJtRhBsgh93LBmAoAt2wwU1I7qqlU+f3CdKPue3bmpbImBSr+etwfWZyI9qf29FZ6Y+cMjv1aLpEITBKwezZQL+B6XXaeUM=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ddb2ad-9b70-4622-4ef3-08d727fa87ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 18:48:46.7004 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fIVLU6+ahhQAguozHQDWqpiPDgJFgdLAiAAoCFphzDhYAnQAj3WQm0CKi3Fmz845bEZW5N0ZkvZX7rluIGtk/ygGqg0kAXMO8J7Jd3mqz8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4690
Subject: [Xen-devel] [PATCH 1/5] xen/arm: optee: impose limit on shared
 buffer size
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

V2Ugd2FudCB0byBsaW1pdCBudW1iZXIgb2YgY2FsbHMgdG8gbG9va3VwX2FuZF9waW5fZ3Vlc3Rf
cmFtX2FkZHIoKQpwZXIgb25lIHJlcXVlc3QuIFRoZXJlIGFyZSB0d28gd2F5cyB0byBkbyB0aGlz
OiBlaXRoZXIgcHJlZW1wdAp0cmFuc2xhdGVfbm9uY29udGlnKCkgb3IgdG8gbGltaXQgc2l6ZSBv
ZiBvbmUgc2hhcmVkIGJ1ZmZlciBzaXplLgoKSXQgaXMgcXVpdGUgaGFyZCB0byBwcmVlbXB0IHRy
YW5zbGF0ZV9ub25jb250aWcoKSwgYmVjYXVzZSBpdCBpcyBkZWVwCm5lc3RlZC4gU28gd2UgY2hv
c2Ugc2Vjb25kIG9wdGlvbi4gV2Ugd2lsbCBhbGxvdyA1MTIgcGFnZXMgcGVyIG9uZQpzaGFyZWQg
YnVmZmVyLiBUaGlzIGRvZXMgbm90IGludGVyZmVyZSB3aXRoIEdQIHN0YW5kYXJkLCBhcyBpdApy
ZXF1aXJlcyB0aGF0IHNpemUgbGltaXQgZm9yIHNoYXJlZCBidWZmZXIgc2hvdWxkIGJlIGF0IGxl
c3QgNTEya0IuCkFsc28sIHdpdGggdGhpcyBsaW1pdGF0aW9uIE9QLVRFRSBzdGlsbCBwYXNzZXMg
b3duICJ4dGVzdCIgdGVzdCBzdWl0ZSwKc28gdGhpcyBpcyBva2F5IGZvciBub3cuCgpTaWduZWQt
b2ZmLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+Ci0t
LQogeGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5jIHwgMzAgKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5jIGIveGVuL2FyY2gvYXJtL3Rl
ZS9vcHRlZS5jCmluZGV4IGVjNTQwMmU4OWIuLmY0ZmE4YTc3NTggMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL2FybS90ZWUvb3B0ZWUuYworKysgYi94ZW4vYXJjaC9hcm0vdGVlL29wdGVlLmMKQEAgLTcy
LDYgKzcyLDE3IEBACiAgKi8KICNkZWZpbmUgTUFYX1RPVEFMX1NNSF9CVUZfUEcgICAgMTYzODQK
IAorLyoKKyAqIEFyYml0cmFyeSB2YWx1ZSB0aGF0IGxpbWl0cyBtYXhpbXVtIHNoYXJlZCBidWZm
ZXIgc2l6ZS4gSXQgaXMKKyAqIG1lcmVseSBjb2luY2lkZW5jZSB0aGF0IGl0IGVxdWFscyB0byBi
b3RoIGRlZmF1bHQgT1AtVEVFIFNITSBidWZmZXIKKyAqIHNpemUgbGltaXQgYW5kIHRvICgxIDw8
IENPTkZJR19ET01VX01BWF9PUkRFUikuIFBsZWFzZSBub3RlIHRoYXQKKyAqIHRoaXMgZGVmaW5l
IGxpbWl0cyBudW1iZXIgb2YgcGFnZXMuIEJ1dCB1c2VyIGJ1ZmZlciBjYW4gYmUgbm90CisgKiBh
bGlnbmVkIHRvIGEgcGFnZSBib3VuZGFyeS4gU28gaXQgaXMgcG9zc2libGUgdGhhdCB1c2VyIHdv
dWxkIG5vdAorICogYmUgYWJsZSB0byBzaGFyZSBleGFjdGx5IE1BWF9TSE1fQlVGRkVSX1BHICog
UEFHRV9TSVpFIGJ5dGVzIHdpdGgKKyAqIE9QLVRFRS4KKyAqLworI2RlZmluZSBNQVhfU0hNX0JV
RkZFUl9QRyAgICAgICA1MTIKKwogI2RlZmluZSBPUFRFRV9LTk9XTl9OU0VDX0NBUFMgT1BURUVf
U01DX05TRUNfQ0FQX1VOSVBST0NFU1NPUgogI2RlZmluZSBPUFRFRV9LTk9XTl9TRUNfQ0FQUyAo
T1BURUVfU01DX1NFQ19DQVBfSEFWRV9SRVNFUlZFRF9TSE0gfCBcCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBPUFRFRV9TTUNfU0VDX0NBUF9VTlJFR0lTVEVSRURfU0hNIHwgXApAQCAt
Njk3LDE1ICs3MDgsMTcgQEAgc3RhdGljIGludCB0cmFuc2xhdGVfbm9uY29udGlnKHN0cnVjdCBv
cHRlZV9kb21haW4gKmN0eCwKICAgICBzaXplID0gUk9VTkRVUChwYXJhbS0+dS50bWVtLnNpemUg
KyBvZmZzZXQsIE9QVEVFX01TR19OT05DT05USUdfUEFHRV9TSVpFKTsKIAogICAgIHBnX2NvdW50
ID0gRElWX1JPVU5EX1VQKHNpemUsIE9QVEVFX01TR19OT05DT05USUdfUEFHRV9TSVpFKTsKKyAg
ICBpZiAoIHBnX2NvdW50ID4gTUFYX1NITV9CVUZGRVJfUEcgKQorICAgICAgICByZXR1cm4gLUVO
T01FTTsKKwogICAgIG9yZGVyID0gZ2V0X29yZGVyX2Zyb21fYnl0ZXMoZ2V0X3BhZ2VzX2xpc3Rf
c2l6ZShwZ19jb3VudCkpOwogCiAgICAgLyoKLSAgICAgKiBJbiB0aGUgd29yc3QgY2FzZSB3ZSB3
aWxsIHdhbnQgdG8gYWxsb2NhdGUgMzMgcGFnZXMsIHdoaWNoIGlzCi0gICAgICogTUFYX1RPVEFM
X1NNSF9CVUZfUEcvNTExIHJvdW5kZWQgdXAuIFRoaXMgZ2l2ZXMgb3JkZXIgNiBvciBhdAotICAg
ICAqIG1vc3QgNjQgcGFnZXMgYWxsb2NhdGVkLiBUaGlzIGJ1ZmZlciB3aWxsIGJlIGZyZWVkIHJp
Z2h0IGFmdGVyCi0gICAgICogdGhlIGVuZCBvZiB0aGUgY2FsbCBhbmQgdGhlcmUgY2FuIGJlIG5v
IG1vcmUgdGhhbgorICAgICAqIEluIHRoZSB3b3JzdCBjYXNlIHdlIHdpbGwgd2FudCB0byBhbGxv
Y2F0ZSAyIHBhZ2VzLCB3aGljaCBpcworICAgICAqIE1BWF9TSE1fQlVGRkVSX1BHLzUxMSByb3Vu
ZGVkIHVwLiBUaGlzIGJ1ZmZlciB3aWxsIGJlIGZyZWVkCisgICAgICogcmlnaHQgYWZ0ZXIgdGhl
IGVuZCBvZiB0aGUgY2FsbCBhbmQgdGhlcmUgY2FuIGJlIG5vIG1vcmUgdGhhbgogICAgICAqIG1h
eF9vcHRlZV90aHJlYWRzIGNhbGxzIHNpbXVsdGFuZW91c2x5LiBTbyBpbiB0aGUgd29yc3QgY2Fz
ZQotICAgICAqIGd1ZXN0IGNhbiB0cmljayB1cyB0byBhbGxvY2F0ZSA2NCAqIG1heF9vcHRlZV90
aHJlYWRzIHBhZ2VzIGluCisgICAgICogZ3Vlc3QgY2FuIHRyaWNrIHVzIHRvIGFsbG9jYXRlIDIg
KiBtYXhfb3B0ZWVfdGhyZWFkcyBwYWdlcyBpbgogICAgICAqIHRvdGFsLgogICAgICAqLwogICAg
IHhlbl9wZ3MgPSBhbGxvY19kb21oZWFwX3BhZ2VzKGN1cnJlbnQtPmRvbWFpbiwgb3JkZXIsIDAp
OwpAQCAtNzQ3LDEzICs3NjAsNiBAQCBzdGF0aWMgaW50IHRyYW5zbGF0ZV9ub25jb250aWcoc3Ry
dWN0IG9wdGVlX2RvbWFpbiAqY3R4LAogICAgICAgICAgICAgeGVuX2RhdGEgPSBfX21hcF9kb21h
aW5fcGFnZSh4ZW5fcGdzKTsKICAgICAgICAgfQogCi0gICAgICAgIC8qCi0gICAgICAgICAqIFRP
RE86IFRoYXQgZnVuY3Rpb24gY2FuIHBpbiB1cCB0byA2NE1CIG9mIGd1ZXN0IG1lbW9yeSBieQot
ICAgICAgICAgKiBjYWxsaW5nIGxvb2t1cF9hbmRfcGluX2d1ZXN0X3JhbV9hZGRyKCkgMTYzODQg
dGltZXMKLSAgICAgICAgICogKGFzc3VtaW5nIHRoYXQgUEFHRV9TSVpFIGVxdWFscyB0byA0MDk2
KS4KLSAgICAgICAgICogVGhpcyBzaG91bGQgYmUgYWRkcmVzc2VkIGJlZm9yZSBkZWNsYXJpbmcg
T1AtVEVFIHNlY3VyaXR5Ci0gICAgICAgICAqIHN1cHBvcnRlZC4KLSAgICAgICAgICovCiAgICAg
ICAgIEJVSUxEX0JVR19PTihQQUdFX1NJWkUgIT0gNDA5Nik7CiAgICAgICAgIHBhZ2UgPSBnZXRf
ZG9tYWluX3JhbV9wYWdlKGdhZGRyX3RvX2dmbihndWVzdF9kYXRhLT5wYWdlc19saXN0W2lkeF0p
KTsKICAgICAgICAgaWYgKCAhcGFnZSApCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

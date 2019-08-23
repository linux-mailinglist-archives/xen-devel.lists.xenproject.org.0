Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0899B671
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 20:52:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i1EcL-0001ic-FD; Fri, 23 Aug 2019 18:48:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gZL1=WT=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1i1EcK-0001iW-Bq
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 18:48:56 +0000
X-Inumbo-ID: a56b2061-c5d6-11e9-adef-12813bfff9fa
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.44]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a56b2061-c5d6-11e9-adef-12813bfff9fa;
 Fri, 23 Aug 2019 18:48:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnbCvGBozHSs5M6E5a9CP2YGRqWyqMVTC42XNMohs7HJ7tJBMQd0PugSrJB+Agd6L2vaDxuxEtfqEHpUF4XCn2P1d9qQsAkMNLN96AazxPu1Llaz5L89KTYNCylk/bNTTVpUP9+uBMMAzjLxNo9VhspeXceikq+XH5XCKzK9UzgcRbZGeLQSlCWzevqYBly9xq9Gg43Eg1+iGsVqBlSXVVmZ92+qC7g2MwW72Nv1tLyMpIakJhvRq1s30JWnXjYG1tRKYw0VkNPEoNS255jze5AZl+kCxWrZUXUtM2eX+obUal1HUX01eOywL81+ETszmrJZUB3fQgfkK1FFaIGN2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlJ90XUs8jVx5CifVbLC/0YeGQuKvGEl+NnI+DNdQL8=;
 b=mvniO9dy+U/viT3yQDD/ZyowFjNzPammKmDjI6zJMMS1WRRatAs3jdFLN/pnS1sUexjXmxqtAzfX+H94OntGL+qQa29X/JJc28Qc6IQXcjhmWbVPVoZO1NJb8Qlp/o4EIlK7wakt16D7LMjweJVnMkxNguR+7i+UNXDmUGRMDG/UYWQ2vcF0TlVAwh7U4wtpLI25GzlV20ksBTlPpksNPYf6vbv5JC4VGbyPPKaSQ8rFQI357OOhFEKVovjG1lADrz/eTiiiHPOW/ouRlFHyiYej517f0/jQv0WHm5tr744NEw4Mqy7L4ssS0hXo5hCrN46wrpQD4uwtBePE7qFIOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlJ90XUs8jVx5CifVbLC/0YeGQuKvGEl+NnI+DNdQL8=;
 b=S1l7SoBSaGvNcdoI1cfDWFBbk8cHx9MIaz1ZIIZIY4QutXTfMjCuQKTLrBqSYzLEI7z4fPea48fvg0u+TUNJL5EQLEhrdAGxt3YY11Ea0x1U17im8Rpaz5zzrO1zpnpYGnPCR7Zjk4vz1DrME4R9QEXNcflszRIgRsdkUenn7nulX66jtmC6XcndHqqvmU05gKxhP5lwpTqgi7FU1Ft/bmR7ID0eiDm5ppWmR6gHOVEqNvFA512CgkDofQLkkBuKYPxFGLEsjnmNgL9osS2JGDz+0Z4EVRndKujlmkdOWLOhFEcw4Z36E6R1dcviWj1WeAiwMGpSJJFsxAmmdmUDEQ==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4690.eurprd03.prod.outlook.com (20.177.41.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Fri, 23 Aug 2019 18:48:49 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Fri, 23 Aug 2019
 18:48:49 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 3/5] xen/arm: optee: limit number of shared buffers
Thread-Index: AQHVWeNm60BkuvqDyUmm6mdhz0g5CQ==
Date: Fri, 23 Aug 2019 18:48:49 +0000
Message-ID: <20190823184826.14525-4-volodymyr_babchuk@epam.com>
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
x-ms-office365-filtering-correlation-id: b18b73af-a232-4443-793e-08d727fa8961
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4690; 
x-ms-traffictypediagnostic: AM0PR03MB4690:|AM0PR03MB4690:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB46909EEB6C911D05A8A6D899E6A40@AM0PR03MB4690.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(189003)(199004)(6436002)(305945005)(25786009)(76176011)(81166006)(71190400001)(478600001)(7736002)(81156014)(5660300002)(8676002)(71200400001)(4326008)(186003)(6506007)(99286004)(2351001)(6486002)(1076003)(2501003)(26005)(2906002)(6916009)(66446008)(55236004)(66946007)(91956017)(14454004)(76116006)(66476007)(66556008)(36756003)(64756008)(6116002)(6512007)(446003)(11346002)(3846002)(476003)(2616005)(316002)(54906003)(86362001)(80792005)(102836004)(5640700003)(8936002)(66066001)(14444005)(486006)(256004)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4690;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0rWoOZNscxMr0JhkFwQWedbXhnAPVi2TNFfQE5N3/8pXc4Zd3au6PwuDV8p6sxW6mRhFwGSpv+zCOpk8r9CZrVURQ0l6Q03REb5Y60ZmrqrxLlnj2BpQIXWeiDQmCS/9LvfzqgRJWRQ1iYdeJd2osWJorndH5IKCNchK7z0rtO9tGgQxkNFRoWsxaVmCIcv4Tkv4y6VJDjtk4J6QTBsC7sUJMBbYDAiC6H/HgAytEpPagC84ta1FTI9pewqFrjLzosM94JqMuyginWeDJgLyImtZNjVnAOuryJ/5FJtutt7lXj9anRrxsj1w1otWjM9QipxefTiucdrguXVrQHYg9kA5B5dDQuAgES8IfYjZPUohmE3DGRx8UnrziFaqXQeGJKX5CQA0mPsX8vl0iDnM+4iBVQ23XK6Fd1U8Bdxvlpo=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b18b73af-a232-4443-793e-08d727fa8961
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 18:48:49.5149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7+w9gHe4dYIOpDE/gLTOrPiIB80e0TeIHZTZxUMfTkRpx0VbDB5J9duZnwuJMiMtULPWfgaWsE3KEkuXgYuU7Wq/QCx1xl1Z2lrVfSJlm/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4690
Subject: [Xen-devel] [PATCH 3/5] xen/arm: optee: limit number of shared
 buffers
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

V2Ugd2FudCB0byBsaW1pdCBudW1iZXIgb2Ygc2hhcmVkIGJ1ZmZlcnMgdGhhdCBndWVzdCBjYW4g
cmVnaXN0ZXIgaW4KT1AtVEVFLiBFdmVyeSBzdWNoIGJ1ZmZlciBjb25zdW1lcyBYRU4gcmVzb3Vy
Y2VzIGFuZCB3ZSBkb24ndCB3YW50Cmd1ZXN0IHRvIGV4aGF1c3QgWEVOLiBTbyB3ZSBjaG9vc2Ug
YXJiaXRyYXJ5IGxpbWl0IGZvciBzaGFyZWQgYnVmZmVycy4KClNpZ25lZC1vZmYtYnk6IFZvbG9k
eW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KLS0tCiB4ZW4vYXJjaC9h
cm0vdGVlL29wdGVlLmMgfCAzMCArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS90ZWUvb3B0ZWUuYyBiL3hlbi9hcmNoL2FybS90ZWUvb3B0ZWUuYwppbmRl
eCBhODRmZmEzMDg5Li4zY2U2ZTdmYTU1IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vdGVlL29w
dGVlLmMKKysrIGIveGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5jCkBAIC04Myw2ICs4MywxNCBAQAog
ICovCiAjZGVmaW5lIE1BWF9TSE1fQlVGRkVSX1BHICAgICAgIDUxMgogCisvKgorICogTGltaXRz
IHRoZSBudW1iZXIgb2Ygc2hhcmVkIGJ1ZmZlcnMgdGhhdCBndWVzdCBjYW4gaGF2ZSBhdCBvbmNl
LgorICogVGhpcyBpcyB0byBwcmV2ZW50IGNhc2UsIHdoZW4gZ3Vlc3RzIHRyaWNrcyBYRU4gaW50
byBleGhhdXN0aW5nCisgKiBvd24gbWVtb3J5IGJ5IGFsbG9jYXRpbmcgemlsbGlvbnMgb2Ygb25l
LWJ5dGUgYnVmZmVycy4gVmFsdWUgaXMKKyAqIGNob3NlbiBhcmJpdHJhcnkuCisgKi8KKyNkZWZp
bmUgTUFYX1NITV9CVUZGRVJfQ09VTlQgICAxNgorCiAjZGVmaW5lIE9QVEVFX0tOT1dOX05TRUNf
Q0FQUyBPUFRFRV9TTUNfTlNFQ19DQVBfVU5JUFJPQ0VTU09SCiAjZGVmaW5lIE9QVEVFX0tOT1dO
X1NFQ19DQVBTIChPUFRFRV9TTUNfU0VDX0NBUF9IQVZFX1JFU0VSVkVEX1NITSB8IFwKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIE9QVEVFX1NNQ19TRUNfQ0FQX1VOUkVHSVNURVJFRF9T
SE0gfCBcCkBAIC0xNDQsNiArMTUyLDcgQEAgc3RydWN0IG9wdGVlX2RvbWFpbiB7CiAgICAgc3Ry
dWN0IGxpc3RfaGVhZCBvcHRlZV9zaG1fYnVmX2xpc3Q7CiAgICAgYXRvbWljX3QgY2FsbF9jb3Vu
dDsKICAgICBhdG9taWNfdCBvcHRlZV9zaG1fYnVmX3BhZ2VzOworICAgIGF0b21pY190IG9wdGVl
X3NobV9idWZfY291bnQ7CiAgICAgc3BpbmxvY2tfdCBsb2NrOwogfTsKIApAQCAtMjMxLDYgKzI0
MCw3IEBAIHN0YXRpYyBpbnQgb3B0ZWVfZG9tYWluX2luaXQoc3RydWN0IGRvbWFpbiAqZCkKICAg
ICBJTklUX0xJU1RfSEVBRCgmY3R4LT5vcHRlZV9zaG1fYnVmX2xpc3QpOwogICAgIGF0b21pY19z
ZXQoJmN0eC0+Y2FsbF9jb3VudCwgMCk7CiAgICAgYXRvbWljX3NldCgmY3R4LT5vcHRlZV9zaG1f
YnVmX3BhZ2VzLCAwKTsKKyAgICBhdG9taWNfc2V0KCZjdHgtPm9wdGVlX3NobV9idWZfY291bnQs
IDApOwogICAgIHNwaW5fbG9ja19pbml0KCZjdHgtPmxvY2spOwogCiAgICAgZC0+YXJjaC50ZWUg
PSBjdHg7CkBAIC00NzksMjMgKzQ4OSwyNiBAQCBzdGF0aWMgc3RydWN0IG9wdGVlX3NobV9idWYg
KmFsbG9jYXRlX29wdGVlX3NobV9idWYoc3RydWN0IG9wdGVlX2RvbWFpbiAqY3R4LAogICAgIHN0
cnVjdCBvcHRlZV9zaG1fYnVmICpvcHRlZV9zaG1fYnVmLCAqb3B0ZWVfc2htX2J1Zl90bXA7CiAg
ICAgaW50IG9sZCwgbmV3OwogICAgIGludCBlcnJfY29kZTsKKyAgICBpbnQgY291bnQ7CisKKyAg
ICBjb3VudCA9IGF0b21pY19hZGRfdW5sZXNzKCZjdHgtPm9wdGVlX3NobV9idWZfY291bnQsIDEs
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNQVhfU0hNX0JVRkZFUl9DT1VOVCk7Cisg
ICAgaWYgKCBjb3VudCA9PSBNQVhfU0hNX0JVRkZFUl9DT1VOVCApCisgICAgICAgIHJldHVybiBF
UlJfUFRSKC1FTk9NRU0pOwogCiAgICAgZG8KICAgICB7CiAgICAgICAgIG9sZCA9IGF0b21pY19y
ZWFkKCZjdHgtPm9wdGVlX3NobV9idWZfcGFnZXMpOwogICAgICAgICBuZXcgPSBvbGQgKyBwYWdl
c19jbnQ7CiAgICAgICAgIGlmICggbmV3ID49IE1BWF9UT1RBTF9TTUhfQlVGX1BHICkKLSAgICAg
ICAgICAgIHJldHVybiBFUlJfUFRSKC1FTk9NRU0pOworICAgICAgICB7CisgICAgICAgICAgICBl
cnJfY29kZSA9IC1FTk9NRU07CisgICAgICAgICAgICBnb3RvIGVycl9kZWNfY250OworICAgICAg
ICB9CiAgICAgfQogICAgIHdoaWxlICggdW5saWtlbHkob2xkICE9IGF0b21pY19jbXB4Y2hnKCZj
dHgtPm9wdGVlX3NobV9idWZfcGFnZXMsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgb2xkLCBuZXcpKSApOwogCi0gICAgLyoKLSAgICAgKiBUT0RPOiBHdWVzdCBj
YW4gdHJ5IHRvIHJlZ2lzdGVyIG1hbnkgc21hbGwgYnVmZmVycywgdGh1cywgZm9yY2luZwotICAg
ICAqIFhFTiB0byBhbGxvY2F0ZSBjb250ZXh0IGZvciBldmVyeSBidWZmZXIuIFByb2JhYmx5IHdl
IG5lZWQgdG8KLSAgICAgKiBsaW1pdCBub3Qgb25seSB0b3RhbCBudW1iZXIgb2YgcGFnZXMgcGlu
bmVkIGJ1dCBhbHNvIG51bWJlcgotICAgICAqIG9mIGJ1ZmZlciBvYmplY3RzLgotICAgICAqLwog
ICAgIG9wdGVlX3NobV9idWYgPSB4emFsbG9jX2J5dGVzKHNpemVvZihzdHJ1Y3Qgb3B0ZWVfc2ht
X2J1ZikgKwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZ2VzX2NudCAqIHNp
emVvZihzdHJ1Y3QgcGFnZSAqKSk7CiAgICAgaWYgKCAhb3B0ZWVfc2htX2J1ZiApCkBAIC01MzEs
NiArNTQ0LDggQEAgc3RhdGljIHN0cnVjdCBvcHRlZV9zaG1fYnVmICphbGxvY2F0ZV9vcHRlZV9z
aG1fYnVmKHN0cnVjdCBvcHRlZV9kb21haW4gKmN0eCwKIGVycjoKICAgICB4ZnJlZShvcHRlZV9z
aG1fYnVmKTsKICAgICBhdG9taWNfc3ViKHBhZ2VzX2NudCwgJmN0eC0+b3B0ZWVfc2htX2J1Zl9w
YWdlcyk7CitlcnJfZGVjX2NudDoKKyAgICBhdG9taWNfZGVjKCZjdHgtPm9wdGVlX3NobV9idWZf
Y291bnQpOwogCiAgICAgcmV0dXJuIEVSUl9QVFIoZXJyX2NvZGUpOwogfQpAQCAtNTczLDYgKzU4
OCw3IEBAIHN0YXRpYyB2b2lkIGZyZWVfb3B0ZWVfc2htX2J1ZihzdHJ1Y3Qgb3B0ZWVfZG9tYWlu
ICpjdHgsIHVpbnQ2NF90IGNvb2tpZSkKICAgICBmcmVlX3BnX2xpc3Qob3B0ZWVfc2htX2J1Zik7
CiAKICAgICBhdG9taWNfc3ViKG9wdGVlX3NobV9idWYtPnBhZ2VfY250LCAmY3R4LT5vcHRlZV9z
aG1fYnVmX3BhZ2VzKTsKKyAgICBhdG9taWNfZGVjKCZjdHgtPm9wdGVlX3NobV9idWZfY291bnQp
OwogCiAgICAgeGZyZWUob3B0ZWVfc2htX2J1Zik7CiB9Ci0tIAoyLjIyLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

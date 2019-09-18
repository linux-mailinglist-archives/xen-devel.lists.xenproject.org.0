Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04422B6B14
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 20:53:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAf2h-0006FL-Iw; Wed, 18 Sep 2019 18:51:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9cKO=XN=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iAf2g-0006Ei-B4
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 18:51:06 +0000
X-Inumbo-ID: 420acab0-da45-11e9-b299-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.44]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 420acab0-da45-11e9-b299-bc764e2007e4;
 Wed, 18 Sep 2019 18:51:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Subn5MWVhJx2Et1EY6/pNkASkvAp6aA5cHxTpAc802c9YZu4yloDZKddIbRtcnYLW78vO3qqj1jMYZ3s6qXvUvugqgE1cM81SvyYCOjaXHuKJq9C1ZM2J2GsxugDACgktkuJKRKEmj9iVjSvvEaduM4gqbSDRNWkeTBqelvL8/cKkdRhUvWAJRK18kMH7YzAtGutfHNJ32pGMrBCt1FmqQaoCM8i2aE7DZYvjrkajF1iD5Zc7NfaNFtrFJ7npFm8INDu2VM96t6FPbgD4kUuGId/vzomFL1YHnQ8QkskPnk87KRqcIEDanLN/RIyYhpI+olIvpQz5dpgWRjKt7TFrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUVUVQgeO7ZQc9FMlIXiSEBIkKIp00y6FcNfsfQE1+4=;
 b=NS1zG8GOyhlD7IPiBRF6NrQfwQPheY1Faf4o+6yON4IqVX15vUwPKjXv2+3iDjzY9c2hnpKzezqNwWgpQ4WT0nxaeA0Qpf1uI4l1Hv2/utLnZua42wKRkTyy0HPQFZO4TRNC0vWgbK2r8hzKmVpCXnwT4gW8yPlXXJKnadSkPN7IVvg5MicxEOF2kDwKHSXzI1ced8SAGHTJqijDpefZLgYFPulalllLYouQxjEmsa2uaVz+T9y4e11id2yq3qwkU/dki5Gk5RMcGYH8ce9MmOc/OKb4QlpbkY0rw2+yoyOLohHgZPegCd1KCgtVh87x6WdI8fzAP8TI3+uQlCUDvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUVUVQgeO7ZQc9FMlIXiSEBIkKIp00y6FcNfsfQE1+4=;
 b=KgOxQfItDzN+48PEstO63k9c8VW/sDK4ZSvEjOWmmQkSPGJHBZvvqOnM5j1fbzqWLCFfDyjYD6mzWx4oiE1cGNZ5SLI6yxNP0DHWrNgykyj+YmusBaE7ZpZNoAYfKUP3izqD0vUocIhgyInXyrBTFncn3uw9KJ2KsMMzDzQy7aU=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB5761.eurprd03.prod.outlook.com (20.179.252.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Wed, 18 Sep 2019 18:50:59 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Wed, 18 Sep 2019
 18:50:59 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 3/6] xen/arm: optee: limit number of shared buffers
Thread-Index: AQHVblIDOzQYaSMlIUe2FmdIoibUfw==
Date: Wed, 18 Sep 2019 18:50:59 +0000
Message-ID: <20190918185041.22738-4-volodymyr_babchuk@epam.com>
References: <20190918185041.22738-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20190918185041.22738-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 918fd33c-f5ac-46b1-56e1-08d73c6925c5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR03MB5761; 
x-ms-traffictypediagnostic: AM0PR03MB5761:|AM0PR03MB5761:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB5761DEEF3DB78CCFD45D96B5E68E0@AM0PR03MB5761.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(189003)(199004)(66476007)(6116002)(478600001)(14454004)(66446008)(80792005)(2616005)(55236004)(8936002)(66066001)(5660300002)(2501003)(81156014)(305945005)(7736002)(81166006)(66556008)(8676002)(256004)(71200400001)(14444005)(71190400001)(99286004)(54906003)(1076003)(86362001)(26005)(11346002)(6512007)(5640700003)(2906002)(186003)(102836004)(3846002)(64756008)(76116006)(2351001)(91956017)(6506007)(25786009)(486006)(66946007)(36756003)(476003)(446003)(4326008)(316002)(6436002)(76176011)(6486002)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5761;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rRafnntzk6X0AOCyt2y+Ur1w7X3Y4wvroGDtlJGVSjsgWRVCqN5ipIO+VK9uxgoX7ttpPQslSBtT49yeHGiAkVQ2QJh/8luIlO2aXOMeZ1Iy+nZfMfwFbxStUits4tCHsICX/2n7MhCdf+Z65lKazMTNo5+3FfjkcreSOIM1Rm3oqoPvHrgNpB6BG1mjPl7bj2WxA2H70AqGIaubcXKukzuzV+TNFtDcibZon2FGVIuOc989NjNFQVC0NXpfq3rHVqDqtlzoMWyf90CotMPTs7zueSGzIdJXEIWKgn3e27t4QBjhS8tDULP3jsYV/x6bNyMVjOU7b1jKInDdq6qnqRuOSd/9c/se1M661bZzJPPWbJ+z6JI62EsH8Nl4H7xcWEUtPZaUl38zVgsv5lysvyyKKaShGSXc5kpwPSexPd8=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 918fd33c-f5ac-46b1-56e1-08d73c6925c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 18:50:59.7997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 64T5AuvTw/amivovMkU18/GJU7J1yOO+YmvocejgkCfNoOvTIuSJBy5kGQV/KVm1UCgl8PuwmPEnqZwBbemfG1EkHIhW1E62xO6n77OZvA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5761
Subject: [Xen-devel] [PATCH v2 3/6] xen/arm: optee: limit number of shared
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
eCA1NWQxMWI5MWE5Li44OGJlOTU5ODE5IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vdGVlL29w
dGVlLmMKKysrIGIveGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5jCkBAIC04NSw2ICs4NSwxNCBAQAog
ICovCiAjZGVmaW5lIE1BWF9TSE1fQlVGRkVSX1BHICAgICAgIDEyOQogCisvKgorICogTGltaXRz
IHRoZSBudW1iZXIgb2Ygc2hhcmVkIGJ1ZmZlcnMgdGhhdCBndWVzdCBjYW4gaGF2ZSBhdCBvbmNl
LgorICogVGhpcyBpcyB0byBwcmV2ZW50IGNhc2UsIHdoZW4gZ3Vlc3RzIHRyaWNrcyBYRU4gaW50
byBleGhhdXN0aW5nCisgKiBvd24gbWVtb3J5IGJ5IGFsbG9jYXRpbmcgemlsbGlvbnMgb2Ygb25l
LWJ5dGUgYnVmZmVycy4gVmFsdWUgaXMKKyAqIGNob3NlbiBhcmJpdHJhcnkuCisgKi8KKyNkZWZp
bmUgTUFYX1NITV9CVUZGRVJfQ09VTlQgICAxNgorCiAjZGVmaW5lIE9QVEVFX0tOT1dOX05TRUNf
Q0FQUyBPUFRFRV9TTUNfTlNFQ19DQVBfVU5JUFJPQ0VTU09SCiAjZGVmaW5lIE9QVEVFX0tOT1dO
X1NFQ19DQVBTIChPUFRFRV9TTUNfU0VDX0NBUF9IQVZFX1JFU0VSVkVEX1NITSB8IFwKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIE9QVEVFX1NNQ19TRUNfQ0FQX1VOUkVHSVNURVJFRF9T
SE0gfCBcCkBAIC0xNDYsNiArMTU0LDcgQEAgc3RydWN0IG9wdGVlX2RvbWFpbiB7CiAgICAgc3Ry
dWN0IGxpc3RfaGVhZCBvcHRlZV9zaG1fYnVmX2xpc3Q7CiAgICAgYXRvbWljX3QgY2FsbF9jb3Vu
dDsKICAgICBhdG9taWNfdCBvcHRlZV9zaG1fYnVmX3BhZ2VzOworICAgIGF0b21pY190IG9wdGVl
X3NobV9idWZfY291bnQ7CiAgICAgc3BpbmxvY2tfdCBsb2NrOwogfTsKIApAQCAtMjMzLDYgKzI0
Miw3IEBAIHN0YXRpYyBpbnQgb3B0ZWVfZG9tYWluX2luaXQoc3RydWN0IGRvbWFpbiAqZCkKICAg
ICBJTklUX0xJU1RfSEVBRCgmY3R4LT5vcHRlZV9zaG1fYnVmX2xpc3QpOwogICAgIGF0b21pY19z
ZXQoJmN0eC0+Y2FsbF9jb3VudCwgMCk7CiAgICAgYXRvbWljX3NldCgmY3R4LT5vcHRlZV9zaG1f
YnVmX3BhZ2VzLCAwKTsKKyAgICBhdG9taWNfc2V0KCZjdHgtPm9wdGVlX3NobV9idWZfY291bnQs
IDApOwogICAgIHNwaW5fbG9ja19pbml0KCZjdHgtPmxvY2spOwogCiAgICAgZC0+YXJjaC50ZWUg
PSBjdHg7CkBAIC00ODEsMjMgKzQ5MSwyNiBAQCBzdGF0aWMgc3RydWN0IG9wdGVlX3NobV9idWYg
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
emVvZihzdHJ1Y3QgcGFnZSAqKSk7CiAgICAgaWYgKCAhb3B0ZWVfc2htX2J1ZiApCkBAIC01MzMs
NiArNTQ2LDggQEAgc3RhdGljIHN0cnVjdCBvcHRlZV9zaG1fYnVmICphbGxvY2F0ZV9vcHRlZV9z
aG1fYnVmKHN0cnVjdCBvcHRlZV9kb21haW4gKmN0eCwKIGVycjoKICAgICB4ZnJlZShvcHRlZV9z
aG1fYnVmKTsKICAgICBhdG9taWNfc3ViKHBhZ2VzX2NudCwgJmN0eC0+b3B0ZWVfc2htX2J1Zl9w
YWdlcyk7CitlcnJfZGVjX2NudDoKKyAgICBhdG9taWNfZGVjKCZjdHgtPm9wdGVlX3NobV9idWZf
Y291bnQpOwogCiAgICAgcmV0dXJuIEVSUl9QVFIoZXJyX2NvZGUpOwogfQpAQCAtNTc1LDYgKzU5
MCw3IEBAIHN0YXRpYyB2b2lkIGZyZWVfb3B0ZWVfc2htX2J1ZihzdHJ1Y3Qgb3B0ZWVfZG9tYWlu
ICpjdHgsIHVpbnQ2NF90IGNvb2tpZSkKICAgICBmcmVlX3BnX2xpc3Qob3B0ZWVfc2htX2J1Zik7
CiAKICAgICBhdG9taWNfc3ViKG9wdGVlX3NobV9idWYtPnBhZ2VfY250LCAmY3R4LT5vcHRlZV9z
aG1fYnVmX3BhZ2VzKTsKKyAgICBhdG9taWNfZGVjKCZjdHgtPm9wdGVlX3NobV9idWZfY291bnQp
OwogCiAgICAgeGZyZWUob3B0ZWVfc2htX2J1Zik7CiB9Ci0tIAoyLjIyLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

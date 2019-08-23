Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2877A9B66F
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 20:52:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i1EcH-0001iI-5j; Fri, 23 Aug 2019 18:48:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gZL1=WT=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1i1EcF-0001i3-8p
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 18:48:51 +0000
X-Inumbo-ID: a56b2060-c5d6-11e9-adef-12813bfff9fa
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.44]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a56b2060-c5d6-11e9-adef-12813bfff9fa;
 Fri, 23 Aug 2019 18:48:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiISmk9ckQpR6GwDgxIl1J8k3RIBES/lZ8rGQqpDT936QMHcwnMN0yTrPyHyZnA7kSXIWTfeJD+CmLbdQOT/r2ebbpLmRzIbUaSpm+Zuybhir2oUPnhkCvN/ANOiKHQWPvvX1LAOc2Qaw83JWSy3gOXx6HlPmv28fuTHb5VpAo+4noCOFmLS5nHF7O56BITdeCRUc299Yu+wIAr5IL4E7Y9U7QcmvRjXilNmePrV48pnCPTnZdCN/d4VVuRclBStCyLeeEmtRLTiy4LHPANb7vJqVx5bOkmys8RBiRnsIqDvq8Wit1wKLTMJJAgMSggd+OJTk6s39iOR2HPPBJpNWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9slQsESnMOdoeXOxnMo+h2DWjSwXDwU5+fCRetsgFU=;
 b=BRWrW66MwH842tr5sIyMhDFckjrFqtz2rsGKnoHbEM+oqblTbEKDMyWYYg/NFnoiPEE5SrPGSS+RjGxylQry1Hpjbkuc+9QEvgNlen2COSrpDbemp5yNf3divs02yF8t06Ue4kpewnRWCJ6qDwsBay09eRZodwE8vA8/htmYeEfsRIISqlPUnzDW1PrGdNZahhup2Y0MhpgSZ/8cnSf2SWVPd15o7+husBsJ4kq/CDz0ExD4VVI7tjFfuFL2iDyfqwtg5Kloo4Rn/l4RFcnvCsJlJP7Grq5UiWZkGP55JynZYkQc853ZsOCdaQKc9unyw3Z6ImHGb26tCbbnMoacGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9slQsESnMOdoeXOxnMo+h2DWjSwXDwU5+fCRetsgFU=;
 b=PYDvDl6oYhM6ewlKhCT/aZYxX5wxgG1nOOK+tfaC4RTP/6E0iTI4EZIN4SGEmh/hgewWYLWKa2sHabo3xF4ekmuEn71TZoU11X49zBvJK6h3kQu1Tlt94Ky7Pe1G0tKEZ7V16PolHXycV0kvQ/YYZWwSnoBxLdl2qqvs6MOTylRMlDRrtOe+sEJ+14ucis9X2NQxDw3SMoY2p5a5LdJVSEOMyLg1e6xiwZNc7yWDapnIbLVAdMc8IOYtNEIlin0krcf9lYKEnYnJEbWCsBZ/unK0kRdP4Ljrx4sh74nHjGL8//lcrBKyFCVSGtCiTAdkbJWc8KED0EUXNpzIsiYUkg==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4690.eurprd03.prod.outlook.com (20.177.41.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Fri, 23 Aug 2019 18:48:48 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Fri, 23 Aug 2019
 18:48:48 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 2/5] xen/arm: optee: check for preemption while freeing
 shared buffers
Thread-Index: AQHVWeNlIytwW28PUEKII1lAK5bjtQ==
Date: Fri, 23 Aug 2019 18:48:47 +0000
Message-ID: <20190823184826.14525-3-volodymyr_babchuk@epam.com>
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
x-ms-office365-filtering-correlation-id: 6f2ed6bf-b848-459b-4dd0-08d727fa8891
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4690; 
x-ms-traffictypediagnostic: AM0PR03MB4690:|AM0PR03MB4690:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB46906D84F10C53463FB5D1D5E6A40@AM0PR03MB4690.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(189003)(199004)(6436002)(305945005)(25786009)(76176011)(81166006)(71190400001)(478600001)(7736002)(81156014)(5660300002)(8676002)(71200400001)(4326008)(186003)(6506007)(99286004)(2351001)(6486002)(1076003)(2501003)(26005)(2906002)(6916009)(66446008)(55236004)(66946007)(91956017)(14454004)(76116006)(66476007)(66556008)(36756003)(64756008)(6116002)(6512007)(446003)(11346002)(3846002)(476003)(2616005)(316002)(54906003)(86362001)(80792005)(102836004)(5640700003)(8936002)(66066001)(14444005)(486006)(256004)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4690;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1bMtjGHCJ3Kmw55s8ZSqZeXbGXHZdcm2e2g/0GF92hBtF9tsRHTWsY8BeiudbSGQuKKVNyiNyGPCnjO4udvJMAWoZvqofrJz+l/74Mt7ezJBgacIQBWkL0cfv8h0vn60gHnatlDDAzmqr20q4tf2Tztd4UORu2zy3Zxq4XfywRTgXAF9T3eIEGETnksoa7DVUt9ET+5eIntcuTjQ7FvOtB5Nazv0wsgoI+pVTbgQMQGRmFI7SRXqlQH6/jO6Y1C18UkQkbL14CFkU/3bbaIkUduod07xJHzuHQqHh1cHz/QZv+7hhBoJeVbQWpeGeK9SjV0xEoTBXOEx2QiMdxkWKjTMFnFaJZqS5V+4mggz1Cg8JEU1+fGPaPbQNa7htTB/EbXrmKn2maGdIutBY6Smgn/Hh3Q5l6JImP5fsGOWKbQ=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f2ed6bf-b848-459b-4dd0-08d727fa8891
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 18:48:48.0537 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1bTAAWNXqfFEsIsvsJdAqZsYPlc2oVxYQnSsc8LRP9Wwl8PzGpayYRiNDaY2zPP1FJUKVhIJhB0zXDEI1LNdjnVzu3CR1mOOAgEd6gun7BA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4690
Subject: [Xen-devel] [PATCH 2/5] xen/arm: optee: check for preemption while
 freeing shared buffers
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

Tm93IHdlIGhhdmUgbGltaXQgZm9yIG9uZSBzaGFyZWQgYnVmZmVyIHNpemUsIHNvIHdlIGNhbiBi
ZSBzdXJlIHRoYXQKb25lIGNhbGwgdG8gZnJlZV9vcHRlZV9zaG1fYnVmKCkgd2lsbCBub3QgZnJl
ZSBhbGwKTUFYX1RPVEFMX1NNSF9CVUZfUEcgcGFnZXMgYXQgb25jZS4gVGh1cywgd2Ugbm93IGNh
biBjaGVjayBmb3IKaHlwZXJjYWxsX3ByZWVtcHRfY2hlY2soKSBpbiB0aGUgbG9vcCBpbnNpZGUK
b3B0ZWVfcmVsaW5xdWlzaF9yZXNvdXJjZXMoKSBhbmQgdGhpcyB3aWxsIGVuc3VyZSB0aGF0IHdl
IGFyZSBub3QKbWlzc2luZyBwcmVlbXB0aW9uLgoKU2lnbmVkLW9mZi1ieTogVm9sb2R5bXlyIEJh
YmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgotLS0KIHhlbi9hcmNoL2FybS90ZWUv
b3B0ZWUuYyB8IDEwICsrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5jIGIv
eGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5jCmluZGV4IGY0ZmE4YTc3NTguLmE4NGZmYTMwODkgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS90ZWUvb3B0ZWUuYworKysgYi94ZW4vYXJjaC9hcm0vdGVl
L29wdGVlLmMKQEAgLTYzNCwxNCArNjM0LDE0IEBAIHN0YXRpYyBpbnQgb3B0ZWVfcmVsaW5xdWlz
aF9yZXNvdXJjZXMoc3RydWN0IGRvbWFpbiAqZCkKICAgICBpZiAoIGh5cGVyY2FsbF9wcmVlbXB0
X2NoZWNrKCkgKQogICAgICAgICByZXR1cm4gLUVSRVNUQVJUOwogCi0gICAgLyoKLSAgICAgKiBU
T0RPOiBHdWVzdCBjYW4gcGluIHVwIHRvIE1BWF9UT1RBTF9TTUhfQlVGX1BHIHBhZ2VzIGFuZCBh
bGwgb2YKLSAgICAgKiB0aGVtIHdpbGwgYmUgcHV0IGluIHRoaXMgbG9vcC4gSXQgaXMgd29ydGgg
Y29uc2lkZXJpbmcgdG8KLSAgICAgKiBjaGVjayBmb3IgcHJlZW1wdGlvbiBpbnNpZGUgdGhlIGxv
b3AuCi0gICAgICovCiAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKCBvcHRlZV9zaG1fYnVm
LCBvcHRlZV9zaG1fYnVmX3RtcCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZjdHgt
Pm9wdGVlX3NobV9idWZfbGlzdCwgbGlzdCApCisgICAgeworICAgICAgICBpZiAoIGh5cGVyY2Fs
bF9wcmVlbXB0X2NoZWNrKCkgKQorICAgICAgICAgICAgcmV0dXJuIC1FUkVTVEFSVDsKKwogICAg
ICAgICBmcmVlX29wdGVlX3NobV9idWYoY3R4LCBvcHRlZV9zaG1fYnVmLT5jb29raWUpOworICAg
IH0KIAogICAgIGlmICggaHlwZXJjYWxsX3ByZWVtcHRfY2hlY2soKSApCiAgICAgICAgIHJldHVy
biAtRVJFU1RBUlQ7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=

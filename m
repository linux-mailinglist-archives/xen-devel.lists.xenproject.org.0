Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 534D3B6B20
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 20:54:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAf2d-0006D5-7N; Wed, 18 Sep 2019 18:51:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9cKO=XN=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iAf2b-0006Bs-9k
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 18:51:01 +0000
X-Inumbo-ID: 400037b4-da45-11e9-b299-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::61c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 400037b4-da45-11e9-b299-bc764e2007e4;
 Wed, 18 Sep 2019 18:50:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLa/pWlBl5eHyJPHOizEjb6edtJI48jRE9w6GHlsTzJ7tG9txafUUS/u3i94E1R1E7iInD8/JYZ+Z2zWI8c7aAvXF772t2PZDQU0TZFDFoMVxqXh+VxEW8v7OpzdRtwIcq9HVglDtqWEl7VPjjNeOHuD5bTRFYWJntDPyfFjjRPVA7qrRhZ4R7sIOkMwuEvYUot/sqx4pOe055OL5KvWG6t5ssVSs5sLfwRVFz9OJFRw7mHgRJ4hQO5AugijZUdztx72TFQdM32rHz46Vh5FVn5KYz8KacdrYdZHps4EPC3hVJ2/20er4akXb9AQlSoovK+hfdd5YqDLldRQzynYYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqXfQOLOnYJoNe5kfocRbeNB6ZWU3b9htobggzv1TZU=;
 b=DEUTSdcN2Ffyv8+i9or8GgLdxL8o8D6u2OYdu40zMJDW37Y57dP8sQuJ2Sd0m4+EtpOJ+Bekn1j4IzPMb48RCW6n81FbSkXuLD0B2J1qscXG6JJ3+My8wx/bcU0WdzAJ9wH6Hvh7slsKYPnMpegQJTzAYE5ANXLwH3hTKnRBKXyjypjgxBi+LiSVbjw4Vvm/CU4CaiTnPYyhV0DMXd2LGOexmAK4cxRI/bNU5ZGgB6NL7M3FwpoJKpKMtHxlu+l5Ndr9FFMqg5eduGaMf/+RYErfObqs1L1eCaF9eA2iU1rfGJIBMQpFYI4UTcO0jAufooKPT44qbJTZIqTLlXl9bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqXfQOLOnYJoNe5kfocRbeNB6ZWU3b9htobggzv1TZU=;
 b=kUNJy8pjkhIZyh8SqDADX0ZXTFuh/1QqOrnC+9YCZlfL+el0E9rQR8V6OKCGNo9hKQMHVuuyXqiWoztSeQuLDgH1NX8IPmvJxcw8VYxroQWMYY4zpsmuJlDYhjpuoezPsIZ/ZH7O6DksKLrKxpLP8Kev3Jpe9AhoQxeOmf2F4W0=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB5761.eurprd03.prod.outlook.com (20.179.252.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Wed, 18 Sep 2019 18:50:56 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Wed, 18 Sep 2019
 18:50:56 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 2/6] xen/arm: optee: check for preemption while
 freeing shared buffers
Thread-Index: AQHVblIBa+Rcg914Z0Sq56RvzPPcmg==
Date: Wed, 18 Sep 2019 18:50:56 +0000
Message-ID: <20190918185041.22738-3-volodymyr_babchuk@epam.com>
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
x-ms-office365-filtering-correlation-id: bea227ee-2905-48b5-058e-08d73c6923c4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR03MB5761; 
x-ms-traffictypediagnostic: AM0PR03MB5761:|AM0PR03MB5761:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB57614CF0A25263E4D9B98C96E68E0@AM0PR03MB5761.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1169;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(189003)(199004)(66476007)(6116002)(478600001)(14454004)(66446008)(80792005)(2616005)(55236004)(8936002)(66066001)(5660300002)(2501003)(81156014)(305945005)(7736002)(81166006)(66556008)(8676002)(256004)(71200400001)(71190400001)(99286004)(54906003)(1076003)(86362001)(26005)(11346002)(6512007)(5640700003)(2906002)(186003)(102836004)(3846002)(64756008)(76116006)(2351001)(91956017)(6506007)(25786009)(486006)(66946007)(36756003)(476003)(446003)(4326008)(316002)(6436002)(76176011)(6486002)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5761;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Kz5akGMxrIP6eRoyC5tzZaQguCz3ll01D/SvTGMk/vcu50DPrI661HIRDornWH+YpsnIdvQZoKGIyTs/I00WS2foSgHKuhDJpDNHMK9I6eE20/LWl+rZEt7n+rbUxdiHdtcrZLFkntcve9zmWf51408a1u6UaBHRDZlVm1o2LzMtomE8J6FQ+OcLNYgxwIO8yCdw4G1WzWp2pxT4jlTQhADQn+7H7eBt1GRzBSw6c5a4xRlO/HiqMLu3R/OkcJWDhMVyMoTGvH0gXR7uj33TMX0p5JRBkik3uCr6PyYBAWPNlsXy7rbiVLwPuq1rDXO60C7zL7ku6bLlmQOKKmr+VTjff7jSjmvwg9QMl80xqN+a+ZWrZoeuAT8MWrYuCYUlMtrDIRcjUb92CqPsD3mKHbF9t+orIZBlbEkYq1CiQmQ=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bea227ee-2905-48b5-058e-08d73c6923c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 18:50:56.4616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BD9Pj96b+82t6bBwaPY0NqUkrCp9++LIEMT3+HgSREFwSMTVUA52MPNze1MCIvNhrbglHKAs/mYi82c1q9W2RkSMGnAYTM9zzxSSKDmCDLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5761
Subject: [Xen-devel] [PATCH v2 2/6] xen/arm: optee: check for preemption
 while freeing shared buffers
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

V2UgY2FuIGNoZWNrIGZvciBoeXBlcmNhbGxfcHJlZW1wdF9jaGVjaygpIGluIHRoZSBsb29wIGlu
c2lkZQpvcHRlZV9yZWxpbnF1aXNoX3Jlc291cmNlcygpIHRvIGluY3JlYXNlIGh5cGVydmlzb3Ig
cmVzcG9uc2l2ZW5lc3MgaW4KY2FzZSBpZiBwcmVlbXB0aW9uIGlzIHJlcXVpcmVkLgoKU2lnbmVk
LW9mZi1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgoK
LS0tCgpDaGFuZ2VzIGZyb20gdjE6CiAtIFJlbW92ZWQgZXh0cmEgaHlwZXJjYWxsX3ByZWVtcHRf
Y2hlY2soKQogLSBVcGRhdGVkIHRoZSBjb21taXQgbWVzc2FnZQotLS0KIHhlbi9hcmNoL2FybS90
ZWUvb3B0ZWUuYyB8IDEzICsrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RlZS9vcHRl
ZS5jIGIveGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5jCmluZGV4IGQ2NGU5YzNiODUuLjU1ZDExYjkx
YTkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS90ZWUvb3B0ZWUuYworKysgYi94ZW4vYXJjaC9h
cm0vdGVlL29wdGVlLmMKQEAgLTYzMywxNyArNjMzLDE0IEBAIHN0YXRpYyBpbnQgb3B0ZWVfcmVs
aW5xdWlzaF9yZXNvdXJjZXMoc3RydWN0IGRvbWFpbiAqZCkKICAgICBsaXN0X2Zvcl9lYWNoX2Vu
dHJ5X3NhZmUoIHNobV9ycGMsIHNobV9ycGNfdG1wLCAmY3R4LT5zaG1fcnBjX2xpc3QsIGxpc3Qg
KQogICAgICAgICBmcmVlX3NobV9ycGMoY3R4LCBzaG1fcnBjLT5jb29raWUpOwogCi0gICAgaWYg
KCBoeXBlcmNhbGxfcHJlZW1wdF9jaGVjaygpICkKLSAgICAgICAgcmV0dXJuIC1FUkVTVEFSVDsK
LQotICAgIC8qCi0gICAgICogVE9ETzogR3Vlc3QgY2FuIHBpbiB1cCB0byBNQVhfVE9UQUxfU01I
X0JVRl9QRyBwYWdlcyBhbmQgYWxsIG9mCi0gICAgICogdGhlbSB3aWxsIGJlIHB1dCBpbiB0aGlz
IGxvb3AuIEl0IGlzIHdvcnRoIGNvbnNpZGVyaW5nIHRvCi0gICAgICogY2hlY2sgZm9yIHByZWVt
cHRpb24gaW5zaWRlIHRoZSBsb29wLgotICAgICAqLwogICAgIGxpc3RfZm9yX2VhY2hfZW50cnlf
c2FmZSggb3B0ZWVfc2htX2J1Ziwgb3B0ZWVfc2htX2J1Zl90bXAsCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAmY3R4LT5vcHRlZV9zaG1fYnVmX2xpc3QsIGxpc3QgKQorICAgIHsKKyAg
ICAgICAgaWYgKCBoeXBlcmNhbGxfcHJlZW1wdF9jaGVjaygpICkKKyAgICAgICAgICAgIHJldHVy
biAtRVJFU1RBUlQ7CisKICAgICAgICAgZnJlZV9vcHRlZV9zaG1fYnVmKGN0eCwgb3B0ZWVfc2ht
X2J1Zi0+Y29va2llKTsKKyAgICB9CiAKICAgICBpZiAoIGh5cGVyY2FsbF9wcmVlbXB0X2NoZWNr
KCkgKQogICAgICAgICByZXR1cm4gLUVSRVNUQVJUOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

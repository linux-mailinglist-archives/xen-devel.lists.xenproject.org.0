Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FB13D5C2
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 20:48:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1halnK-0006VH-Nn; Tue, 11 Jun 2019 18:46:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZYfD=UK=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1halnI-0006Tr-NQ
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 18:46:52 +0000
X-Inumbo-ID: 46440458-8c79-11e9-8e96-375380862569
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.75]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 46440458-8c79-11e9-8e96-375380862569;
 Tue, 11 Jun 2019 18:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fP8vJPN22b6OLgoR82XgeZN8aCm/Eqc6Z8g29fVGTPY=;
 b=Q3cVf+f27Lg8BmW0POG23EadM4MtrOl4PhdJj4Kngf6PDzy7hyBKJUvR0zT2Ox/U0Wr7hd1THLRJKx38CKUOCepKKFclwVgaSIQKpcgEe+hz/w4GgEAdnUOlohlKHUBj5QlRMsBSQ/iHDeGBFu3GaXV79HJTpP/Fd+FV2B//UMaWPdBksY2srfFLgKQ503SnDdXpjdcjDcC22p+x6rBobCOzTlJ9Cy6HHjRAekZmodSqydeOUzgQv8bpYe0tGfnl//yT8IfHZlB+G7nrKZGW9Q+JwHNca1HEEHfypZCxlO9XZVNrJCseUJnwvjBMK7DYVXXcUB+gb5RycMO3ScMyKQ==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB4020.eurprd03.prod.outlook.com (52.135.147.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.17; Tue, 11 Jun 2019 18:46:49 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb%7]) with mapi id 15.20.1965.011; Tue, 11 Jun 2019
 18:46:49 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v6 10/10] tools/arm: optee: create optee firmware node in
 DT if tee=optee
Thread-Index: AQHVIIYHkNjY1FWYAUqunta53z+c6Q==
Date: Tue, 11 Jun 2019 18:46:49 +0000
Message-ID: <20190611184541.7281-11-volodymyr_babchuk@epam.com>
References: <20190611184541.7281-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20190611184541.7281-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c4daab7-e95e-4559-3471-08d6ee9d29dc
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4020; 
x-ms-traffictypediagnostic: AM0PR03MB4020:
x-microsoft-antispam-prvs: <AM0PR03MB4020073E7498A04C70679301E6ED0@AM0PR03MB4020.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(396003)(366004)(136003)(199004)(189003)(2351001)(54906003)(86362001)(1076003)(256004)(316002)(71200400001)(11346002)(6916009)(2616005)(476003)(71190400001)(486006)(446003)(2501003)(5660300002)(6116002)(80792005)(7736002)(305945005)(99286004)(3846002)(26005)(53936002)(66946007)(4326008)(6436002)(6506007)(76116006)(76176011)(68736007)(8936002)(36756003)(73956011)(72206003)(25786009)(102836004)(186003)(6486002)(6512007)(55236004)(91956017)(8676002)(64756008)(66556008)(66476007)(66066001)(2906002)(14454004)(81156014)(81166006)(478600001)(66446008)(5640700003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4020;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: X4GJ5xEVS3F8hgjcq6mnN3nVCUJKDt1CpUwFCDpKtmb5DlYUw2RLrDayEPIV3zvyiuvfoB5CZfwwVATBE0I0gleYQFgVZVGCr69viP0gLbmEpvYbh3/1tTcH02yxT8pLVKyqOIPvz9rw8KyhEEqD6LYPFEMyulmHt2cuCS3/ZKZ24hlYfi+J8mi8WZsQ+TId8O81Zj1VPmoT4VkxP4YK4lGUXxMxEvTeWlIbdyX6qUM5ljF96+Q49MfDqbfxI0SYLFeqHcrzsI2QlM+Ml56m/j08aJURahtD/5qcfSktcwKzVff+RHT3EsPKG5kdLZSdTwu2JB6pY02LkKdeUZ9r4bpjM0nvRB9FFczYNtAv6MdmTatbSm7I1ugzydiEzmc5rm38ZXO51XCwFMtzECKmIlsQxr8qms8uUK8U82e6zqQ=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c4daab7-e95e-4559-3471-08d6ee9d29dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 18:46:49.8307 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4020
Subject: [Xen-devel] [PATCH v6 10/10] tools/arm: optee: create optee
 firmware node in DT if tee=optee
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWYgVEVFIHN1cHBvcnQgaXMgZW5hYmxlZCB3aXRoICJ0ZWU9b3B0ZWUiIG9wdGlvbiBpbiB4bC5j
ZmcsCnRoZW4gd2UgbmVlZCB0byBpbmZvcm0gZ3Vlc3QgYWJvdXQgYXZhaWxhYmxlIFRFRSwgYnkg
Y3JlYXRpbmcKY29ycmVzcG9uZGluZyBub2RlIGluIHRoZSBndWVzdCdzIGRldmljZSB0cmVlLgoK
U2lnbmVkLW9mZi1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0u
Y29tPgpSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQWNr
ZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKLS0tCiBUaGlz
IHBhdGNoIGRlcGVuZHMgb24gcGF0Y2hlcyB0byBvcHRlZS5jLgoKIENoYW5nZXMgZnJvbSB2NDoK
ICAtICJuYXRpdmUiIG9wdGlvbiByZXBsYWNlZCB3aXRoICJvcHRlZSIKCiBDaGFuZ2VzIGZyb20g
djM6CiAgLSAic21jIiBtZXRob2QgcmVwbGFjZWQgd2l0aCAiaHZjIgogIC0gQ29kaW5nIHN0eWxl
IGZpeGVzCi0tLQogdG9vbHMvbGlieGwvbGlieGxfYXJtLmMgfCAyOSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS90b29scy9saWJ4bC9saWJ4bF9hcm0uYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2FybS5jCmlu
ZGV4IDZiNzJjMDA5NjAuLmJmMzFiOWIzY2EgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhs
X2FybS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2FybS5jCkBAIC00MjAsNiArNDIwLDMyIEBA
IHN0YXRpYyBpbnQgbWFrZV9wc2NpX25vZGUobGlieGxfX2djICpnYywgdm9pZCAqZmR0KQogICAg
IHJldHVybiAwOwogfQogCitzdGF0aWMgaW50IG1ha2Vfb3B0ZWVfbm9kZShsaWJ4bF9fZ2MgKmdj
LCB2b2lkICpmZHQpCit7CisgICAgaW50IHJlczsKKyAgICBMT0coREVCVUcsICJDcmVhdGluZyBP
UC1URUUgbm9kZSBpbiBkdGIiKTsKKworICAgIHJlcyA9IGZkdF9iZWdpbl9ub2RlKGZkdCwgImZp
cm13YXJlIik7CisgICAgaWYgKHJlcykgcmV0dXJuIHJlczsKKworICAgIHJlcyA9IGZkdF9iZWdp
bl9ub2RlKGZkdCwgIm9wdGVlIik7CisgICAgaWYgKHJlcykgcmV0dXJuIHJlczsKKworICAgIHJl
cyA9IGZkdF9wcm9wZXJ0eV9jb21wYXQoZ2MsIGZkdCwgMSwgImxpbmFybyxvcHRlZS10eiIpOwor
ICAgIGlmIChyZXMpIHJldHVybiByZXM7CisKKyAgICByZXMgPSBmZHRfcHJvcGVydHlfc3RyaW5n
KGZkdCwgIm1ldGhvZCIsICJodmMiKTsKKyAgICBpZiAocmVzKSByZXR1cm4gcmVzOworCisgICAg
cmVzID0gZmR0X2VuZF9ub2RlKGZkdCk7CisgICAgaWYgKHJlcykgcmV0dXJuIHJlczsKKworICAg
IHJlcyA9IGZkdF9lbmRfbm9kZShmZHQpOworICAgIGlmIChyZXMpIHJldHVybiByZXM7CisKKyAg
ICByZXR1cm4gMDsKK30KKwogc3RhdGljIGludCBtYWtlX21lbW9yeV9ub2RlcyhsaWJ4bF9fZ2Mg
KmdjLCB2b2lkICpmZHQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVj
dCB4Y19kb21faW1hZ2UgKmRvbSkKIHsKQEAgLTkzMyw2ICs5NTksOSBAQCBuZXh0X3Jlc2l6ZToK
ICAgICAgICAgaWYgKGluZm8tPmFyY2hfYXJtLnZ1YXJ0ID09IExJQlhMX1ZVQVJUX1RZUEVfU0JT
QV9VQVJUKQogICAgICAgICAgICAgRkRUKCBtYWtlX3ZwbDAxMV91YXJ0X25vZGUoZ2MsIGZkdCwg
YWluZm8sIGRvbSkgKTsKIAorICAgICAgICBpZiAoaW5mby0+dGVlID09IExJQlhMX1RFRV9UWVBF
X09QVEVFKQorICAgICAgICAgICAgRkRUKCBtYWtlX29wdGVlX25vZGUoZ2MsIGZkdCkgKTsKKwog
ICAgICAgICBpZiAocGZkdCkKICAgICAgICAgICAgIEZEVCggY29weV9wYXJ0aWFsX2ZkdChnYywg
ZmR0LCBwZmR0KSApOwogCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=

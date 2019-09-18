Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C3AB6B12
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 20:53:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAf2X-0006Ar-U4; Wed, 18 Sep 2019 18:50:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9cKO=XN=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iAf2W-0006AX-AX
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 18:50:56 +0000
X-Inumbo-ID: 3d4d380a-da45-11e9-978d-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::610])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d4d380a-da45-11e9-978d-bc764e2007e4;
 Wed, 18 Sep 2019 18:50:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMU04dRMAPlzKMH4aCsDTRY8I4tpVYPsFhD7AVURhKKoheCd+THzPpBxHCcjKLjdUMvJm38y9XC60V64ntzhCgJzM0jjF0iI6IeLR/47g+gVEup5v/4y+fcha8y518R0c407LFpI41j//4LraLC0QDVOVJE+N618jFNw4Cx7J0RFXdHpqbnR7ZM9utdMfco0MC5pnJ1gZSE2MOSuNPzL95QshtpPGMJcFOK7IDR7nDp9cTpZ14LqO+4FS2RjHazr7YryD+A5CvIGZempKgmNqjeKC4lBOp3scdeJQGNjLg/nkryJ7mPwmDk+Z5g8G/D/rw19oWZSTfVIEmRPsog22A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BO64aWIMKF8+kHI1j+d2aul1S4f+TxtzxSQwzpb1xk4=;
 b=Qu1L1tZHK7SR16Ky4ETs8a52dpEHbr2zCb/zqifmTPmuSXvwLeV0lX3CasXtiYwqz2R984jGOXhTiN4gFXS2RmwbrE6jtr56n1RLqdYAC8FvTnjaRNcCGVupHc9gsNmAXtkRMPV9ijtTEy8UN7TFYgyh76jaiuSfIpxRvE5eOsymSxRLg7DqTYZgcDRr9y9Ov+0E2Whp/YJg2SqdBTtIpNuw+K4XiE4fYYSibrRjfpKDRhF7ObhsgPVxYvv100LGKQyYT7eeRNFBVxyUr4pFbsweX6l073T0RFydpIFuCP7zZwmJfDi3bcq3ekTP4+F2BpsOWSb792oa5F4xfuLerg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BO64aWIMKF8+kHI1j+d2aul1S4f+TxtzxSQwzpb1xk4=;
 b=U+2nIVv5YeOqt9N4jBHaKdmh04m+Fx18tKSzyo0GBQxGsINn9h/sKHPaso/mxriMMwmQwaA78s2jnErFNPSI3illzbBj1LOTlAns13rtp2g5J341R8XPKODRoCXowHyhRvQnK3NkHZ5YY0PplgLHfyVaGGNwW0k/QfZY3zn5YEY=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB5761.eurprd03.prod.outlook.com (20.179.252.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Wed, 18 Sep 2019 18:50:51 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Wed, 18 Sep 2019
 18:50:51 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 1/6] xen/arm: optee: impose limit on shared buffer size
Thread-Index: AQHVblH+avUrsKasKUuqntnk7iOMNA==
Date: Wed, 18 Sep 2019 18:50:51 +0000
Message-ID: <20190918185041.22738-2-volodymyr_babchuk@epam.com>
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
x-ms-office365-filtering-correlation-id: a723deed-fbb3-4439-d738-08d73c692104
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR03MB5761; 
x-ms-traffictypediagnostic: AM0PR03MB5761:|AM0PR03MB5761:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB5761B49DEBC7874E35F9EF2AE68E0@AM0PR03MB5761.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(189003)(199004)(52084003)(66476007)(6116002)(478600001)(14454004)(66446008)(80792005)(2616005)(55236004)(8936002)(66066001)(5660300002)(2501003)(81156014)(305945005)(7736002)(81166006)(66556008)(8676002)(256004)(71200400001)(14444005)(71190400001)(99286004)(54906003)(1076003)(86362001)(26005)(11346002)(6512007)(5640700003)(2906002)(186003)(102836004)(3846002)(64756008)(76116006)(2351001)(91956017)(6506007)(25786009)(486006)(66946007)(36756003)(476003)(446003)(4326008)(316002)(6436002)(76176011)(6486002)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5761;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TOElGEeH6956ADnV/Kzf8VC1K2e5FfCBcwKmcKX91XCBVin5zhth/NgQT7dRJc2TGvo93Ez3QYkcyE1pI9p7K3GAd5kQQMSLzrz2+zUSl8L13+jb+uP/lsv7ese/sDoGEZksSiU2D6Nz1dU0hO3nvQ2y92NqXiF/AKV4Mf4ojbqbsy8/JDysCz8093+VXDFjGJDX3peN7qRG4I75tM6NAnjYfndqTtJTPJ4WhxA855dKrKFK3bdFXGKxggM1izlmsAWvrYbCoX60VQjmvuTXH6vaRptwtAG9t1J30e33nXFgbpHZ0HzHmSQQbW1EZYmLK9dALCOBZxevPMgXH+kHY5AZOAhorGf500X1Sq3XmoNZAOzX5EaOYsiWun19/55y/I3XVwL1CT5bMb77K7ATu/0MZi5xtrQD2XkZLNmKjzg=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a723deed-fbb3-4439-d738-08d73c692104
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 18:50:51.7463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1J7LHiSkQC3hGzvqds2x4L+lZTDBbKPL6n9OLIBxmjBEZK9XiTk9RmUQYF5es39SvYrsZ73tg9oHs7FwjYAORWStuVvWVqqslLmRqraMO4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5761
Subject: [Xen-devel] [PATCH v2 1/6] xen/arm: optee: impose limit on shared
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
OiBlaXRoZXIgcHJlZW1wdAp0cmFuc2xhdGVfbm9uY29udGlnKCkgb3IgbGltaXQgc2l6ZSBvZiBv
bmUgc2hhcmVkIGJ1ZmZlciBzaXplLgoKSXQgaXMgcXVpdGUgaGFyZCB0byBwcmVlbXB0IHRyYW5z
bGF0ZV9ub25jb250aWcoKSwgYmVjYXVzZSBpdCBpcyBkZWVwCm5lc3RlZC4gU28gd2UgY2hvc2Ug
dGhlIHNlY29uZCBvcHRpb24uIFdlIHdpbGwgYWxsb3cgMTI5IHBhZ2VzIHBlciBvbmUKc2hhcmVk
IGJ1ZmZlci4gVGhpcyBjb3JyZXNwb25kcyB0byB0aGUgR1Agc3RhbmRhcmQsIGFzIGl0IHJlcXVp
cmVzCnRoYXQgc2l6ZSBsaW1pdCBmb3Igc2hhcmVkIGJ1ZmZlciBzaG91bGQgYmUgYXQgbGVhc3Qg
NTEya0IuIE9uZSBleHRyYQpwYWdlICgxMjl0aCkgaXMgbmVlZGVkIHRvIGNvcGUgd2l0aCB0aGUg
ZmFjdCB0aGF0IHVzZXIncyBidWZmZXIgaXMgbm90Cm5lY2Vzc2FyeSBhbGlnbmVkIHdpdGggcGFn
ZSBib3VuZGFyeS4KCkFsc28sIHdpdGggdGhpcyBsaW1pdGF0aW9uIE9QLVRFRSBzdGlsbCBwYXNz
ZXMgb3duICJ4dGVzdCIgdGVzdCBzdWl0ZSwKc28gdGhpcyBpcyBva2F5IGZvciBub3cuCgpTaWdu
ZWQtb2ZmLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+
CgotLS0KCkNoYW5nZXMgZnJvbSB2MToKIC0gQWRkZWQgY29tbWVudCBiZWZvcmUgQlVJTERfQlVH
X09OKFBBR0VfU0laRSAhPSA0MDk2KTsKIC0gRml4ZWQgdHlwbyBpbiB0aGUgY29tbWl0IG1lc3Nh
Z2UKIC0gRGVjcmVhc2VkIE1BWF9TSE1fQlVGRkVSX1BHIHRvIDEyOQotLS0KIHhlbi9hcmNoL2Fy
bS90ZWUvb3B0ZWUuYyB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL29wdGVlLmMgYi94ZW4vYXJjaC9hcm0vdGVlL29w
dGVlLmMKaW5kZXggZWM1NDAyZTg5Yi4uZDY0ZTljM2I4NSAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
YXJtL3RlZS9vcHRlZS5jCisrKyBiL3hlbi9hcmNoL2FybS90ZWUvb3B0ZWUuYwpAQCAtNzIsNiAr
NzIsMTkgQEAKICAqLwogI2RlZmluZSBNQVhfVE9UQUxfU01IX0JVRl9QRyAgICAxNjM4NAogCisv
KgorICogTGltaXQgZm9yIHNoYXJlZCBidWZmZXIgc2l6ZS4gUGxlYXNlIG5vdGUgdGhhdCB0aGlz
IGRlZmluZSBsaW1pdHMKKyAqIG51bWJlciBvZiBwYWdlcy4gQnV0IHVzZXIgYnVmZmVyIGNhbiBi
ZSBub3QgYWxpZ25lZCB0byBhIHBhZ2UKKyAqIGJvdW5kYXJ5LiBTbyBpdCBpcyBwb3NzaWJsZSB0
aGF0IHVzZXIgd291bGQgbm90IGJlIGFibGUgdG8gc2hhcmUKKyAqIGV4YWN0bHkgTUFYX1NITV9C
VUZGRVJfUEcgKiBQQUdFX1NJWkUgYnl0ZXMgd2l0aCBPUC1URUUuCisgKgorICogR2xvYmFsIFBs
YXRmb3JtIHNwZWNpZmljYXRpb24gZm9yIFRFRSByZXF1aXJlcyB0aGF0IGFueSBURUUKKyAqIGlt
cGxlbWVudGF0aW9uIHNob3VsZCBhbGxvdyB0byBzaGFyZSBidWZmZXJzIHdpdGggc2l6ZSBvZiBh
dCBsZWFzdAorICogNTEyS0IsIHdoaWNoIGVxdWFscyB0byAxMjggNEtCIHBhZ2VzLiBEdWUgdG8g
YWxpZ24gaXNzdWUgbWVudGlvbmVkCisgKiBhYm92ZSwgd2UgbmVlZCB0byBpbmNyZWFzZSB0aGlz
IHZhbHVlIHRvIDEyOS4KKyAqLworI2RlZmluZSBNQVhfU0hNX0JVRkZFUl9QRyAgICAgICAxMjkK
KwogI2RlZmluZSBPUFRFRV9LTk9XTl9OU0VDX0NBUFMgT1BURUVfU01DX05TRUNfQ0FQX1VOSVBS
T0NFU1NPUgogI2RlZmluZSBPUFRFRV9LTk9XTl9TRUNfQ0FQUyAoT1BURUVfU01DX1NFQ19DQVBf
SEFWRV9SRVNFUlZFRF9TSE0gfCBcCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBPUFRF
RV9TTUNfU0VDX0NBUF9VTlJFR0lTVEVSRURfU0hNIHwgXApAQCAtNjk3LDE2ICs3MTAsMjkgQEAg
c3RhdGljIGludCB0cmFuc2xhdGVfbm9uY29udGlnKHN0cnVjdCBvcHRlZV9kb21haW4gKmN0eCwK
ICAgICBzaXplID0gUk9VTkRVUChwYXJhbS0+dS50bWVtLnNpemUgKyBvZmZzZXQsIE9QVEVFX01T
R19OT05DT05USUdfUEFHRV9TSVpFKTsKIAogICAgIHBnX2NvdW50ID0gRElWX1JPVU5EX1VQKHNp
emUsIE9QVEVFX01TR19OT05DT05USUdfUEFHRV9TSVpFKTsKKyAgICBpZiAoIHBnX2NvdW50ID4g
TUFYX1NITV9CVUZGRVJfUEcgKQorICAgICAgICByZXR1cm4gLUVOT01FTTsKKwogICAgIG9yZGVy
ID0gZ2V0X29yZGVyX2Zyb21fYnl0ZXMoZ2V0X3BhZ2VzX2xpc3Rfc2l6ZShwZ19jb3VudCkpOwog
CiAgICAgLyoKLSAgICAgKiBJbiB0aGUgd29yc3QgY2FzZSB3ZSB3aWxsIHdhbnQgdG8gYWxsb2Nh
dGUgMzMgcGFnZXMsIHdoaWNoIGlzCi0gICAgICogTUFYX1RPVEFMX1NNSF9CVUZfUEcvNTExIHJv
dW5kZWQgdXAuIFRoaXMgZ2l2ZXMgb3JkZXIgNiBvciBhdAotICAgICAqIG1vc3QgNjQgcGFnZXMg
YWxsb2NhdGVkLiBUaGlzIGJ1ZmZlciB3aWxsIGJlIGZyZWVkIHJpZ2h0IGFmdGVyCi0gICAgICog
dGhlIGVuZCBvZiB0aGUgY2FsbCBhbmQgdGhlcmUgY2FuIGJlIG5vIG1vcmUgdGhhbgorICAgICAq
IEluIHRoZSB3b3JzdCBjYXNlIHdlIHdpbGwgd2FudCB0byBhbGxvY2F0ZSAxIHBhZ2UsIHdoaWNo
IGlzCisgICAgICogTUFYX1NITV9CVUZGRVJfUEcvNTExIHJvdW5kZWQgdXAuIFRoaXMgYnVmZmVy
IHdpbGwgYmUgZnJlZWQKKyAgICAgKiByaWdodCBhZnRlciB0aGUgZW5kIG9mIHRoZSBjYWxsIGFu
ZCB0aGVyZSBjYW4gYmUgbm8gbW9yZSB0aGFuCiAgICAgICogbWF4X29wdGVlX3RocmVhZHMgY2Fs
bHMgc2ltdWx0YW5lb3VzbHkuIFNvIGluIHRoZSB3b3JzdCBjYXNlCi0gICAgICogZ3Vlc3QgY2Fu
IHRyaWNrIHVzIHRvIGFsbG9jYXRlIDY0ICogbWF4X29wdGVlX3RocmVhZHMgcGFnZXMgaW4KKyAg
ICAgKiBndWVzdCBjYW4gdHJpY2sgdXMgdG8gYWxsb2NhdGUgMSAqIG1heF9vcHRlZV90aHJlYWRz
IHBhZ2VzIGluCiAgICAgICogdG90YWwuCisgICAgICoKKyAgICAgKiBJdCBtYXkgc2VlbSBzdHJh
bmdlIHRvIGhhdmUgc3VjaCBjb21wbGV4IGNhbGN1bGF0aW9ucyBpZiB3ZQorICAgICAqIGFsd2F5
cyB3aWxsIGFsbG9jYXRlIGV4YWN0bHkgb25lIHBhZ2UuIFRob3NlIGNhbGN1bGF0aW9ucyBleGlz
dAorICAgICAqIGluIHRoZSBmaXJzdCBwbGFjZSBiZWNhdXNlIGVhcmxpZXIgdGhlcmUgd2VyZSBi
aWdnZXIgbGltaXQgZm9yCisgICAgICogc2hhcmVkIGJ1ZmZlciBzaXplLCBzbyB0aGVyZSB3ZXJl
IGNhc2VzLCB3aGVuIHdlIG5lZWRlZCBtb3JlCisgICAgICogdGhhdCBvbmUgcGFnZSB0aGVyZS4g
UmlnaHQgbm93IHRoaXMgaXMgbm90IHRydWUsIGJ1dCB0aGlzIGNvZGUKKyAgICAgKiByZW1haW5z
IGZvciB0d28gcmVhc29uczoKKyAgICAgKiAtIFVzZXJzIGNhbiBjaGFuZ2UgTUFYX1NITV9CVUZG
RVJfUEcgdG8gYSBoaWdoZXIgdmFsdWUsIGluIHdoaWNoCisgICAgICogICBjYXNlIHRoZXkgd2ls
bCBuZWVkIHRoaXMgY29kZS4KKyAgICAgKiAtIFRoZXJlIGlzIGEgcGxhbiB0byBpbXBsZW1lbnQg
cHJlZW1wdGlvbiBpbiB0aGUgY29kZSBiZWxvdywgd2hpY2gKKyAgICAgKiAgIHdpbGwgYWxsb3cg
dXNlIHRvIGluY3JlYXNlIGRlZmF1bHQgTUFYX1NITV9CVUZGRVJfUEcgdmFsdWUuCiAgICAgICov
CiAgICAgeGVuX3BncyA9IGFsbG9jX2RvbWhlYXBfcGFnZXMoY3VycmVudC0+ZG9tYWluLCBvcmRl
ciwgMCk7CiAgICAgaWYgKCAheGVuX3BncyApCkBAIC03NDcsMTMgKzc3Myw3IEBAIHN0YXRpYyBp
bnQgdHJhbnNsYXRlX25vbmNvbnRpZyhzdHJ1Y3Qgb3B0ZWVfZG9tYWluICpjdHgsCiAgICAgICAg
ICAgICB4ZW5fZGF0YSA9IF9fbWFwX2RvbWFpbl9wYWdlKHhlbl9wZ3MpOwogICAgICAgICB9CiAK
LSAgICAgICAgLyoKLSAgICAgICAgICogVE9ETzogVGhhdCBmdW5jdGlvbiBjYW4gcGluIHVwIHRv
IDY0TUIgb2YgZ3Vlc3QgbWVtb3J5IGJ5Ci0gICAgICAgICAqIGNhbGxpbmcgbG9va3VwX2FuZF9w
aW5fZ3Vlc3RfcmFtX2FkZHIoKSAxNjM4NCB0aW1lcwotICAgICAgICAgKiAoYXNzdW1pbmcgdGhh
dCBQQUdFX1NJWkUgZXF1YWxzIHRvIDQwOTYpLgotICAgICAgICAgKiBUaGlzIHNob3VsZCBiZSBh
ZGRyZXNzZWQgYmVmb3JlIGRlY2xhcmluZyBPUC1URUUgc2VjdXJpdHkKLSAgICAgICAgICogc3Vw
cG9ydGVkLgotICAgICAgICAgKi8KKyAgICAgICAgLyogT25seSA0ayBwYWdlcyBhcmUgc3VwcG9y
dGVkIHJpZ2h0IG5vdyAqLwogICAgICAgICBCVUlMRF9CVUdfT04oUEFHRV9TSVpFICE9IDQwOTYp
OwogICAgICAgICBwYWdlID0gZ2V0X2RvbWFpbl9yYW1fcGFnZShnYWRkcl90b19nZm4oZ3Vlc3Rf
ZGF0YS0+cGFnZXNfbGlzdFtpZHhdKSk7CiAgICAgICAgIGlmICggIXBhZ2UgKQotLSAKMi4yMi4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

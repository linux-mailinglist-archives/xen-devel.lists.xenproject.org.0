Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CE0259EB
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 23:28:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTCH9-0008Sq-9S; Tue, 21 May 2019 21:26:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C2a6=TV=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hTCH7-0008Rr-Ih
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 21:26:21 +0000
X-Inumbo-ID: 12e79ae0-7c0f-11e9-a16b-dbe450c486f0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.56]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12e79ae0-7c0f-11e9-a16b-dbe450c486f0;
 Tue, 21 May 2019 21:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Chwwj3eFWveYoQ6Bn43DmSx7Q+hzFy24++03rrdYhZ0=;
 b=UvSJdgrrAyYNL1+PyJTn9DsJeX64mATyKwGEzOFzjAxC5QsXgTGxw2MiCA1gDWUUy1nK5Qx6QcA/mcKAMs24rhdyuXla8I5ZCKMdj8yfvTFKZPp1wR4xdZfRZDObwLcSPaNfMnXShxO/aARpEYZS8QOUVVRH1veGMf1GUqgDplxa2HNAIMpOasM8jiqGsFWWt86i77FaYfyAcHvP/P7Jn5syZ5kBp01Xa252TGol5u7Abk0ob5r6mmEbqjHNKpTpq6adfyOFUGDPMyb/v4c77ZP4BmZvD3jDaAvjUZ8an+5hu8eEOswEqgUCC9XfPrw5ZbDfqTBrUXCa7hSrWwp0cw==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB5698.eurprd03.prod.outlook.com (20.179.254.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Tue, 21 May 2019 21:26:18 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a%3]) with mapi id 15.20.1900.020; Tue, 21 May 2019
 21:26:18 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v5 09/10] tools/arm: tee: add "tee" option for xl.cfg
Thread-Index: AQHVEBvTWnS0JriE6E6xTB61iQ032g==
Date: Tue, 21 May 2019 21:26:18 +0000
Message-ID: <20190521212530.12706-10-volodymyr_babchuk@epam.com>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0cb8bcd-56ad-4e4f-2235-08d6de32f66c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:AM0PR03MB5698; 
x-ms-traffictypediagnostic: AM0PR03MB5698:
x-microsoft-antispam-prvs: <AM0PR03MB5698ED4B186342D147859B80E6070@AM0PR03MB5698.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:478;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(1496009)(376002)(136003)(366004)(346002)(396003)(39860400002)(189003)(199004)(6512007)(6486002)(5640700003)(6436002)(68736007)(3846002)(2616005)(476003)(11346002)(6916009)(486006)(6116002)(76116006)(14444005)(256004)(64756008)(66476007)(478600001)(305945005)(66946007)(54906003)(316002)(7736002)(73956011)(71190400001)(72206003)(2501003)(66556008)(80792005)(71200400001)(66446008)(26005)(4326008)(14454004)(25786009)(102836004)(2906002)(55236004)(8936002)(81166006)(5660300002)(99286004)(66066001)(1076003)(36756003)(86362001)(53936002)(6506007)(81156014)(446003)(2351001)(186003)(8676002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5698;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: e+a1WcqFtJaMKHjZx6i2HQ9saIwqloQ5MasFuc1sw2Vswwr5441uwV7acbGgYW8ME86BBdo90j8sRDbxhf56j3YQgrLAUTWWF5oJf8XkL8v0gCCcy/S4/6mSLthCBTcHg8+k+ls+RQ/G27ks2HVVKhkzdaP45A8jR8RqWnTZIVleV14KuN+1BVzwqA1rKndq+16hpHtO6r4mLLzWt2P51MUwVk92r0yRAlnraXPH7/IqLCuwxnKgZw78UATUxEeTsNG6dJYQJODI1Kg6x3fKCAiDHW7a3jv2ItbboDGJpfZP3EP/71oiFuHlYFaUm8QBt9w1bXhrLOjI38crOBVkZoQ8+dMhwxiGY913q6kIOAl9t9QRbmd8cZY3KlCJ8ayJMlLIF+VEoLFub/Wy8aebDntGRS8y0QvXJ8tC07YMw7E=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0cb8bcd-56ad-4e4f-2235-08d6de32f66c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 21:26:18.2747 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5698
Subject: [Xen-devel] [PATCH v5 09/10] tools/arm: tee: add "tee" option for
 xl.cfg
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBlbnVtZXJhdGlvbiBjb250cm9scyBURUUgdHlwZSBmb3IgYSBkb21haW4uIEN1cnJlbnRs
eSB0aGVyZSBpcwp0d28gcG9zc2libGUgb3B0aW9uczogZWl0aGVyICdub25lJyBvciAnb3B0ZWUn
LgoKJ25vbmUnIGlzIHRoZSBkZWZhdWx0IHZhbHVlIGFuZCBpdCBiYXNpY2FsbHkgZGlzYWJsZXMg
VEVFIHN1cHBvcnQgYXQKYWxsLgoKJ25hdGl2ZScgZW5hYmxlcyBhY2Nlc3MgdG8gYSAicmVhbCIg
T1AtVEVFIGluc3RhbGxlZCBvbiBhIHBsYXRmb3JtLgoKSXQgaXMgcG9zc2libGUgdG8gYWRkIGFu
b3RoZXIgdHlwZXMgaW4gdGhlIGZ1dHVyZS4KClNpZ25lZC1vZmYtYnk6IFZvbG9keW15ciBCYWJj
aHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KLS0tCgogQWxsIHRoZSBwYXRjaGVzIHRv
IG9wdGVlLmMgc2hvdWxkIGJlIG1lcmdlZCB0b2dldGhlci4gVGhleSB3ZXJlCiBzcGxpdCB0byBl
YXNlIHVwIHJldmlldy4gQnV0IHRoZXkgZGVwZW5kIGhlYXZpbHkgb24gZWFjaCBvdGhlci4KCiBD
aGFuZ2VzIGZyb20gdjQ6CiAgLSAibmF0aXZlIiBvcHRpb24gd2FzIHJlcGxhY2VkIHdpdGggIm9w
dGVlIgogIC0gInRlZSIgcHJvcGVydHkgd2FzIG1vdmVkIGZyb20gYXJjaC1zcGVjaWZpYyBzZWN0
aW9uIHRvIHRoZQogICAgIGdsb2JhbCBvbmUuIERvY3VtZW50YXRpb24gbW92ZWQgaW5zaWRlICJE
ZXZpY2VzIiBzZWN0aW9uLgoKIENoYW5nZXMgZnJvbSB2MzoKICAtIHRlZV9lbmFibGVkIHJlbmFt
ZWQgdG8gdGVlX3R5cGUuIEN1cnJlbnRseSB0d28gdHlwZXMgYXJlIHN1cHBvcnRlZAogICAgYXMg
ZGVzY3JpYmVkIGluIHRoZSBjb21taXQgbWVzc2FnZQogIC0gQWRkIExJQlhMX0hBVkVfQlVJTERJ
TkZPX0FSQ0hfQVJNX1RFRSBkZWZpbml0aW9uCgogQ2hhbmdlcyBmcm9tIHYyOgogIC0gVXNlIGFy
Y2gudGVlX2VuYWJsZWQgaW5zdGVhZCBvZiBzZXBhcmF0ZSBkb21jdGwKLS0tCiBkb2NzL21hbi94
bC5jZmcuNS5wb2QuaW4gICAgfCAxOSArKysrKysrKysrKysrKysrKysrCiB0b29scy9saWJ4bC9s
aWJ4bC5oICAgICAgICAgfCAgNSArKysrKwogdG9vbHMvbGlieGwvbGlieGxfYXJtLmMgICAgIHwg
MTMgKysrKysrKysrKysrKwogdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsIHwgIDYgKysrKysr
CiB0b29scy94bC94bF9wYXJzZS5jICAgICAgICAgfCAgOSArKysrKysrKysKIDUgZmlsZXMgY2hh
bmdlZCwgNTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RvY3MvbWFuL3hsLmNmZy41LnBv
ZC5pbiBiL2RvY3MvbWFuL3hsLmNmZy41LnBvZC5pbgppbmRleCBjN2Q3MGU2MThiLi43M2M2NGRj
ODk2IDEwMDY0NAotLS0gYS9kb2NzL21hbi94bC5jZmcuNS5wb2QuaW4KKysrIGIvZG9jcy9tYW4v
eGwuY2ZnLjUucG9kLmluCkBAIC0xNTQ0LDYgKzE1NDQsMjUgQEAgU2V0IG1heGltdW0gaGVpZ2h0
IGZvciBwb2ludGVyIGRldmljZS4KIAogPWJhY2sKIAorPWl0ZW0gQjx0ZWU9WyJub25lIiwgIm9w
dGVlIl0+CisKK1NldCBURUUgdHlwZSBmb3IgdGhlIGd1ZXN0LiBURUUgaXMgYSBUcnVzdGVkIEV4
ZWN1dGlvbiBFbnZpcm9ubWVudCAtLSBzZXBhcmF0ZQorc2VjdXNlIE9TIGZvdW5kIG9uIHNvbWUg
cGxhdGZvcm1zLgorCis9b3ZlciA0CisKKz1pdGVtIEI8Im5vbmUiPgorCitEaXNhYmxlIFRFRSBz
dXBwb3J0IGF0IGFsbC4gVGhpcyBpcyB0aGUgZGVmYXVsdCB2YWx1ZS4KKworPWl0ZW0gQjwib3B0
ZWUiPgorCitBbGxvdyBndWVzdCB0byBhY2Nlc3MgdG8gT1AtVEVFIGVuYWJsZWQgb24gdGhlIHBs
YXRmb3JtLiBHdWVzdCB3aWxsIG5vdCBiZSBjcmVhdGVkCitpZiBwbGF0Zm9ybSBkb2VzIG5vdCBo
YXZlIE9QLVRFRSB3aXRoIHZpcnR1YWxpemF0aW9uIGZlYXR1cmUgb3IgaWYgT1AtVEVFIHdpbGwK
K2RlbnkgYWNjZXNzLgorCis9YmFjaworCiA9YmFjawogCiA9aGVhZDIgUGFyYXZpcnR1YWxpc2Vk
IChQVikgR3Vlc3QgU3BlY2lmaWMgT3B0aW9ucwpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGli
eGwuaCBiL3Rvb2xzL2xpYnhsL2xpYnhsLmgKaW5kZXggNDgyNDk5YTZjMC4uMjk0YTkyZjY0NSAx
MDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGwuaAorKysgYi90b29scy9saWJ4bC9saWJ4bC5o
CkBAIC0yNzMsNiArMjczLDExIEBACiAgKi8KICNkZWZpbmUgTElCWExfSEFWRV9CVUlMRElORk9f
QVJNX0dJQ19WRVJTSU9OIDEKIAorLyoKKyAqIGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvIGhhcyB0
aGUgYXJjaF9hcm0udGVlIGZpZWxkLgorICovCisjZGVmaW5lIExJQlhMX0hBVkVfQlVJTERJTkZP
X0FSQ0hfQVJNX1RFRSAxCisKIC8qCiAgKiBMSUJYTF9IQVZFX1NPRlRfUkVTRVQgaW5kaWNhdGVz
IHRoYXQgbGlieGwgc3VwcG9ydHMgcGVyZm9ybWluZwogICogJ3NvZnQgcmVzZXQnIGZvciBkb21h
aW5zIGFuZCB0aGVyZSBpcyAnc29mdF9yZXNldCcgc2h1dGRvd24gcmVhc29uCmRpZmYgLS1naXQg
YS90b29scy9saWJ4bC9saWJ4bF9hcm0uYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2FybS5jCmluZGV4
IDE0MWUxNTkwNDMuLjZiNzJjMDA5NjAgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2Fy
bS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2FybS5jCkBAIC04OSw2ICs4OSwxOSBAQCBpbnQg
bGlieGxfX2FyY2hfZG9tYWluX3ByZXBhcmVfY29uZmlnKGxpYnhsX19nYyAqZ2MsCiAgICAgICAg
IHJldHVybiBFUlJPUl9GQUlMOwogICAgIH0KIAorICAgIHN3aXRjaCAoZF9jb25maWctPmJfaW5m
by50ZWUpIHsKKyAgICBjYXNlIExJQlhMX1RFRV9UWVBFX05PTkU6CisgICAgICAgIGNvbmZpZy0+
YXJjaC50ZWVfdHlwZSA9IFhFTl9ET01DVExfQ09ORklHX1RFRV9OT05FOworICAgICAgICBicmVh
azsKKyAgICBjYXNlIExJQlhMX1RFRV9UWVBFX09QVEVFOgorICAgICAgICBjb25maWctPmFyY2gu
dGVlX3R5cGUgPSBYRU5fRE9NQ1RMX0NPTkZJR19URUVfT1BURUU7CisgICAgICAgIGJyZWFrOwor
ICAgIGRlZmF1bHQ6CisgICAgICAgIExPRyhFUlJPUiwgIlVua25vd24gVEVFIHR5cGUgJWQiLAor
ICAgICAgICAgICAgZF9jb25maWctPmJfaW5mby50ZWUpOworICAgICAgICByZXR1cm4gRVJST1Jf
RkFJTDsKKyAgICB9CisKICAgICByZXR1cm4gMDsKIH0KIApkaWZmIC0tZ2l0IGEvdG9vbHMvbGli
eGwvbGlieGxfdHlwZXMuaWRsIGIvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsCmluZGV4IGNi
NDcwMmZkN2EuLjRlYWNjZDJjYzcgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX3R5cGVz
LmlkbAorKysgYi90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwKQEAgLTQ2MCw2ICs0NjAsMTEg
QEAgbGlieGxfZ2ljX3ZlcnNpb24gPSBFbnVtZXJhdGlvbigiZ2ljX3ZlcnNpb24iLCBbCiAgICAg
KDB4MzAsICJ2MyIpCiAgICAgXSwgaW5pdF92YWwgPSAiTElCWExfR0lDX1ZFUlNJT05fREVGQVVM
VCIpCiAKK2xpYnhsX3RlZV90eXBlID0gRW51bWVyYXRpb24oInRlZV90eXBlIiwgWworICAgICgw
LCAibm9uZSIpLAorICAgICgxLCAib3B0ZWUiKQorICAgIF0sIGluaXRfdmFsID0gIkxJQlhMX1RF
RV9UWVBFX05PTkUiKQorCiBsaWJ4bF9yZG1fcmVzZXJ2ZSA9IFN0cnVjdCgicmRtX3Jlc2VydmUi
LCBbCiAgICAgKCJzdHJhdGVneSIsICAgIGxpYnhsX3JkbV9yZXNlcnZlX3N0cmF0ZWd5KSwKICAg
ICAoInBvbGljeSIsICAgICAgbGlieGxfcmRtX3Jlc2VydmVfcG9saWN5KSwKQEAgLTUzNyw2ICs1
NDIsNyBAQCBsaWJ4bF9kb21haW5fYnVpbGRfaW5mbyA9IFN0cnVjdCgiZG9tYWluX2J1aWxkX2lu
Zm8iLFsKICAgICAoIm5lc3RlZF9odm0iLCAgICAgICBsaWJ4bF9kZWZib29sKSwKICAgICAoImFw
aWMiLCAgICAgICAgICAgICBsaWJ4bF9kZWZib29sKSwKICAgICAoImRtX3Jlc3RyaWN0IiwgICAg
ICBsaWJ4bF9kZWZib29sKSwKKyAgICAoInRlZSIsICAgICAgICAgICAgICBsaWJ4bF90ZWVfdHlw
ZSksCiAgICAgKCJ1IiwgS2V5ZWRVbmlvbihOb25lLCBsaWJ4bF9kb21haW5fdHlwZSwgInR5cGUi
LAogICAgICAgICAgICAgICAgIFsoImh2bSIsIFN0cnVjdChOb25lLCBbKCJmaXJtd2FyZSIsICAg
ICAgICAgc3RyaW5nKSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICgi
YmlvcyIsICAgICAgICAgICAgIGxpYnhsX2Jpb3NfdHlwZSksCmRpZmYgLS1naXQgYS90b29scy94
bC94bF9wYXJzZS5jIGIvdG9vbHMveGwveGxfcGFyc2UuYwppbmRleCAzNTJjZDIxNGRkLi5kOThh
ZDBjZmZiIDEwMDY0NAotLS0gYS90b29scy94bC94bF9wYXJzZS5jCisrKyBiL3Rvb2xzL3hsL3hs
X3BhcnNlLmMKQEAgLTI2OTAsNiArMjY5MCwxNSBAQCBza2lwX3VzYmRldjoKICAgICAgICAgfQog
ICAgIH0KIAorICAgIGlmICgheGx1X2NmZ19nZXRfc3RyaW5nIChjb25maWcsICJ0ZWUiLCAmYnVm
LCAxKSkgeworICAgICAgICBlID0gbGlieGxfdGVlX3R5cGVfZnJvbV9zdHJpbmcoYnVmLCAmYl9p
bmZvLT50ZWUpOworICAgICAgICBpZiAoZSkgeworICAgICAgICAgICAgZnByaW50ZihzdGRlcnIs
CisgICAgICAgICAgICAgICAgICAgICJVbmtub3duIHRlZSBcIiVzXCIgc3BlY2lmaWVkXG4iLCBi
dWYpOworICAgICAgICAgICAgZXhpdCgtRVJST1JfRkFJTCk7CisgICAgICAgIH0KKyAgICB9CisK
ICAgICBwYXJzZV92a2JfbGlzdChjb25maWcsIGRfY29uZmlnKTsKIAogICAgIHhsdV9jZmdfZGVz
dHJveShjb25maWcpOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs

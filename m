Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E85DB259F2
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 23:28:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTCHD-0008WU-No; Tue, 21 May 2019 21:26:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C2a6=TV=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hTCHC-0008VO-6b
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 21:26:26 +0000
X-Inumbo-ID: 15868a7e-7c0f-11e9-8980-bc764e045a96
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.78]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 15868a7e-7c0f-11e9-8980-bc764e045a96;
 Tue, 21 May 2019 21:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3BBuCwi6Da+BrtoPDUg+A+dtth6L4FPD0wgV5abJ1e0=;
 b=QlgeG62vfB1KVbip0RipAwhV5L6/jFnMoPiS8pZvVCn0MhIR5hFVJBW3G+ojNShq5T2dDixPtGz2sPYaGjaP5hyxDq3Xa6BREreGkW1N/zzPM7axu1PWxhKZz++UTKfCjJTdN5sugFS0CulmZS8E+Flf3Ew/Cjuh3elwDj6R9ryw8hQWWn6YObQ8y6jCwyMprdEmgewtJxPPoaHWOaLGGLP+ZbZPcoNtowiLS+vZXmTs/hl3KUcrjnFMP5aycyg+/78eUAfoX05edCekvRiZQ18BIIrcm1bDw+Pm+bMmdW4On62QdsGPGBxUiBX+0eH7H4HjHJX9XrN0il9avYTvWA==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB5698.eurprd03.prod.outlook.com (20.179.254.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Tue, 21 May 2019 21:26:22 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a%3]) with mapi id 15.20.1900.020; Tue, 21 May 2019
 21:26:22 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v5 10/10] tools/arm: optee: create optee firmware node in
 DT if tee=optee
Thread-Index: AQHVEBvW+sGuscbF0k6jSbhuAmuriA==
Date: Tue, 21 May 2019 21:26:22 +0000
Message-ID: <20190521212530.12706-11-volodymyr_babchuk@epam.com>
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
x-ms-office365-filtering-correlation-id: 090444cd-f8eb-4a69-b0ad-08d6de32f908
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:AM0PR03MB5698; 
x-ms-traffictypediagnostic: AM0PR03MB5698:
x-microsoft-antispam-prvs: <AM0PR03MB56984271C6561B209C5CD7C7E6070@AM0PR03MB5698.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(1496009)(376002)(136003)(366004)(346002)(396003)(39860400002)(189003)(199004)(6512007)(6486002)(5640700003)(6436002)(68736007)(3846002)(2616005)(476003)(11346002)(6916009)(486006)(6116002)(76116006)(256004)(64756008)(66476007)(478600001)(305945005)(66946007)(54906003)(316002)(7736002)(73956011)(71190400001)(72206003)(2501003)(66556008)(80792005)(71200400001)(66446008)(26005)(4326008)(14454004)(25786009)(102836004)(2906002)(55236004)(8936002)(81166006)(5660300002)(99286004)(66066001)(1076003)(36756003)(86362001)(53936002)(6506007)(81156014)(446003)(2351001)(186003)(8676002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5698;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DS2x9StdBmW24LP8Dl7/LTmUz2z8VVvHiDIUUvIBH/TlGk+r3a8jA+IiiZkC12rE+w+4tv8fC/H96pWAxdxBZeKVKPbNSOfpYCKNSMARcX6nXr1vyakldLwcFbgAKDKLnW5Q2XwX7ElPiBamQF6gQ/uN2BMQthLwP8kUlgQj63sf+HoYxRMF7S2XfhBHfgRd72Ad/PKq8Ps5PhaaFv8T2qVLA6tOopcBbas5nTyMV4YLRmC3ET06szahTc7CX9tLgS1z68cBaqTAbdA5v0oSSUYxolFWlqHaf+wZrnoNwVoOIoAU87TRmC/87/V4osqwdbtRIs/siSEswmyO/zpGnMpYAGKeWIAFZZYu8/h4+wgLU/J2hL9OtYICGEpZj6x1aHd90TSJNU8T5JFntpoogpcyxFC23FPgut+zkVhYuZ0=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 090444cd-f8eb-4a69-b0ad-08d6de32f908
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 21:26:22.6451 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5698
Subject: [Xen-devel] [PATCH v5 10/10] tools/arm: optee: create optee
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWYgVEVFIHN1cHBvcnQgaXMgZW5hYmxlZCB3aXRoICJ0ZWU9b3B0ZWUiIG9wdGlvbiBpbiB4bC5j
ZmcsCnRoZW4gd2UgbmVlZCB0byBpbmZvcm0gZ3Vlc3QgYWJvdXQgYXZhaWxhYmxlIFRFRSwgYnkg
Y3JlYXRpbmcKY29ycmVzcG9uZGluZyBub2RlIGluIHRoZSBndWVzdCdzIGRldmljZSB0cmVlLgoK
U2lnbmVkLW9mZi1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0u
Y29tPgpSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0t
LQogVGhpcyBwYXRjaCBkZXBlbmRzIG9uIHBhdGNoZXMgdG8gb3B0ZWUuYy4KCiBDaGFuZ2VzIGZy
b20gdjQ6CiAgLSAibmF0aXZlIiBvcHRpb24gcmVwbGFjZWQgd2l0aCAib3B0ZWUiCgogQ2hhbmdl
cyBmcm9tIHYzOgogIC0gInNtYyIgbWV0aG9kIHJlcGxhY2VkIHdpdGggImh2YyIKICAtIENvZGlu
ZyBzdHlsZSBmaXhlcwotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2FybS5jIHwgMjkgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfYXJtLmMgYi90b29scy9saWJ4bC9saWJ4bF9h
cm0uYwppbmRleCA2YjcyYzAwOTYwLi5iZjMxYjliM2NhIDEwMDY0NAotLS0gYS90b29scy9saWJ4
bC9saWJ4bF9hcm0uYworKysgYi90b29scy9saWJ4bC9saWJ4bF9hcm0uYwpAQCAtNDIwLDYgKzQy
MCwzMiBAQCBzdGF0aWMgaW50IG1ha2VfcHNjaV9ub2RlKGxpYnhsX19nYyAqZ2MsIHZvaWQgKmZk
dCkKICAgICByZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCBtYWtlX29wdGVlX25vZGUobGlieGxf
X2djICpnYywgdm9pZCAqZmR0KQoreworICAgIGludCByZXM7CisgICAgTE9HKERFQlVHLCAiQ3Jl
YXRpbmcgT1AtVEVFIG5vZGUgaW4gZHRiIik7CisKKyAgICByZXMgPSBmZHRfYmVnaW5fbm9kZShm
ZHQsICJmaXJtd2FyZSIpOworICAgIGlmIChyZXMpIHJldHVybiByZXM7CisKKyAgICByZXMgPSBm
ZHRfYmVnaW5fbm9kZShmZHQsICJvcHRlZSIpOworICAgIGlmIChyZXMpIHJldHVybiByZXM7CisK
KyAgICByZXMgPSBmZHRfcHJvcGVydHlfY29tcGF0KGdjLCBmZHQsIDEsICJsaW5hcm8sb3B0ZWUt
dHoiKTsKKyAgICBpZiAocmVzKSByZXR1cm4gcmVzOworCisgICAgcmVzID0gZmR0X3Byb3BlcnR5
X3N0cmluZyhmZHQsICJtZXRob2QiLCAiaHZjIik7CisgICAgaWYgKHJlcykgcmV0dXJuIHJlczsK
KworICAgIHJlcyA9IGZkdF9lbmRfbm9kZShmZHQpOworICAgIGlmIChyZXMpIHJldHVybiByZXM7
CisKKyAgICByZXMgPSBmZHRfZW5kX25vZGUoZmR0KTsKKyAgICBpZiAocmVzKSByZXR1cm4gcmVz
OworCisgICAgcmV0dXJuIDA7Cit9CisKIHN0YXRpYyBpbnQgbWFrZV9tZW1vcnlfbm9kZXMobGli
eGxfX2djICpnYywgdm9pZCAqZmR0LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25z
dCBzdHJ1Y3QgeGNfZG9tX2ltYWdlICpkb20pCiB7CkBAIC05MzMsNiArOTU5LDkgQEAgbmV4dF9y
ZXNpemU6CiAgICAgICAgIGlmIChpbmZvLT5hcmNoX2FybS52dWFydCA9PSBMSUJYTF9WVUFSVF9U
WVBFX1NCU0FfVUFSVCkKICAgICAgICAgICAgIEZEVCggbWFrZV92cGwwMTFfdWFydF9ub2RlKGdj
LCBmZHQsIGFpbmZvLCBkb20pICk7CiAKKyAgICAgICAgaWYgKGluZm8tPnRlZSA9PSBMSUJYTF9U
RUVfVFlQRV9PUFRFRSkKKyAgICAgICAgICAgIEZEVCggbWFrZV9vcHRlZV9ub2RlKGdjLCBmZHQp
ICk7CisKICAgICAgICAgaWYgKHBmZHQpCiAgICAgICAgICAgICBGRFQoIGNvcHlfcGFydGlhbF9m
ZHQoZ2MsIGZkdCwgcGZkdCkgKTsKIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2826E9A3
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 18:51:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoW3H-0004j7-Qe; Fri, 19 Jul 2019 16:48:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=no5L=VQ=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hoW3F-0004iv-Qm
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 16:48:10 +0000
X-Inumbo-ID: fc1b6463-aa44-11e9-8980-bc764e045a96
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.59]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fc1b6463-aa44-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 16:48:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFB0E8yi6mXchydUTFxZ4jR2ENiGHjjJvTe/j0t3qgV4xq7mtPWzNE9WJeN+GcabjUakQ+q7+POz12KJWMhxkH4lMKpWjX4nIMaiTu3JuDXHIg16VGuINtpx/JtRUhw9wNPe7lSF9Pt6cnvScp1JFqLiD2A8YGWJqgfcQWydU5Fgib8qEJEUx2/Bl+AlJoAL+tYOkUwEIPX1MXZ02dnV0y95GXzHSvqvE5zJHxJ/a9uvr1kXcK2cb8deCWqZkPkLO/ezF5K6U/cSQdYWdGs8J++6fBGQw2hrrsjwJCQ5Nzw03l9F3DSKwXmaWPdjWM2ukzpZe4L/Axa7THcthv9Uyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0L7iisJnfXsFzQeQGLNABlu+9clA9daDBWkOnb352g=;
 b=A17V+eUNWZeueUWglF2Z2pDUC7uM/2IAGg2TgR+QeBbJXvkrhBtmjLerr9X0rVEGTeBe9RDmZwJqTn2KclNsTc5EFm+v77GpSjyLben5nUq/xPnZNknMk1GYaiOBm72i3qbcQv0x4CspQqG5l0/sjTUi+UeedmRPlMGZLCLKIFv9fOn2drMvmb8smd10h0/2rxAGOXeXFjpQM2sRFfuruUM/2EYAu2jZdPOkTsjJ7S/Q3FTlbPeGGpaRReI6vi9FLBZ4oCFB4KUVmpO+kknoS6YkkHyGcm+tazl+ixniNjdvWgrD7hhG9SVgClvmQvcd9ADqBJyfOw5CLtedhoL11Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=epam.com;dmarc=pass action=none header.from=epam.com;dkim=pass
 header.d=epam.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0L7iisJnfXsFzQeQGLNABlu+9clA9daDBWkOnb352g=;
 b=Xhs5ulE67+P771Hw/7+P0MgeceoamMY08IUKTN1EbVim0ax3XSo7RoUlusxo1UkEcmPvLUEhE8vvIv3c8xIbUSgLzYiR+05QkfCTrdkT31Wtk6+t339RJzuhqhTQ2qCO7LC6Kjkyc9zL6LQhuyZTBc6EL5xUDg8K64t2q7pylf/fkS3XW/l2hHzslts4aCX8RMOB4sCBY7yDUmqFCkuMJ5paC5QbxPRmI9zWQ+jV2RCt/p+xvmWU+UWi9jaZx+LpNFxvzPdjnL97rsvK3UbZ091WBsH7C9yRhhIqJMVff+/WcZvRo7vuUcP3Lx0mFbfrtFg15tKmYwx9zf9okySjGw==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB3876.eurprd03.prod.outlook.com (52.135.148.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 16:48:06 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2094.013; Fri, 19 Jul 2019
 16:48:06 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH 2/2] CODING_STYLE: list further brace
 placement exceptions
Thread-Index: AQHVPhNEaDGDKqwi6ked7nxWCSuuuqbSJ1KA
Date: Fri, 19 Jul 2019 16:48:06 +0000
Message-ID: <877e8e2coq.fsf@epam.com>
References: <f1a5d1b0-564e-8f04-f43e-f5c68466751b@suse.com>
 <29b489fe-d7ad-68b8-b555-2a6381a28829@suse.com>
In-Reply-To: <29b489fe-d7ad-68b8-b555-2a6381a28829@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c31a8a4-84c7-4c26-96ea-08d70c68dfaf
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB3876; 
x-ms-traffictypediagnostic: AM0PR03MB3876:
x-microsoft-antispam-prvs: <AM0PR03MB3876011846B54F66ABA11244E6CB0@AM0PR03MB3876.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(199004)(189003)(7736002)(4326008)(305945005)(86362001)(6512007)(6486002)(6436002)(66066001)(8676002)(11346002)(99286004)(7416002)(256004)(80792005)(2906002)(53936002)(6246003)(486006)(91956017)(76116006)(66946007)(316002)(26005)(66556008)(5660300002)(66446008)(36756003)(3846002)(71190400001)(71200400001)(6916009)(54906003)(6116002)(476003)(229853002)(14454004)(8936002)(478600001)(68736007)(81166006)(81156014)(76176011)(102836004)(186003)(2616005)(446003)(66476007)(55236004)(64756008)(25786009)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3876;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Q4PvjtmTKQ+OEPoS+a6M8FqvK5wiml4HPttbGkU+2QW5bJ9uVkdyTE7SwSHUXVEBBNk0JOgfJZrkunm8IzfjH3KoObpqy3/qwyql8chtgLVKMV2TjHybargLjet6ilsEAdw9DiCG4jgG17J+DEk8X3kKdPYfah6gwDQPzHTRzo1LNB7/F4pyS+3Izp1CB0yLj8eGN2oZlDk7sZKM0wg5Vs9pAlH90NF3Lj7emkBCoOqbn5ejdG7vD0CmpW57biP93pQF4F/bwVspcY0kEKIy7aoUjEHYlqVzWVCjOaenHzsX2C9bL7+5H/rKxT/fNLz6hmzUbC7Wj962oUz2GMkNZKQR9wGfxPFkN+uaPRl5ohVSQgKnY/96m3upRWSffmgLumD15+b3Tksr+rgB5R3seLm1I/403Wfu4bqAmZ+wWfc=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c31a8a4-84c7-4c26-96ea-08d70c68dfaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 16:48:06.3933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3876
Subject: Re: [Xen-devel] [PATCH 2/2] CODING_STYLE: list further brace
 placement exceptions
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 JulienGrall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIEphbiwKCkphbiBCZXVsaWNoIHdyaXRlczoKCj4gRm9yIGVhc3kgc3BvdHRpbmcgb2Ygc3Ry
dWN0L3VuaW9uL2VudW0gZGVmaW5pdGlvbnMgd2UgYWxyZWFkeSBjb21tb25seQo+IHBsYWNlIHRo
ZSBvcGVuaW5nIGJyYWNlcyBvbiB0aGUgaW5pdGlhbCBsaW5lIG9mIHN1Y2ggYSBkZWZpbml0aW9u
Lgo+Cj4gV2UgYWxzbyBvZnRlbiBkb24ndCBwbGFjZSB0aGUgb3BlbmluZyBicmFjZSBvZiBhbiBp
bml0aWFsaXplciBvbiBhCj4gc2VwYXJhdGUgbGluZS4KPgo+IEFuZCBmaW5hbGx5IGZvciBjb21w
b3VuZCBsaXRlcmFscyBwbGFjaW5nIHRoZSBicmFjZXMgb24gc2VwYXJhdGUgbGluZXMKPiBvZnRl
biBtYWtlcyB0aGUgY29kZSBtb3JlIGRpZmZpY3VsdCB0byByZWFkLCBzbyBpdCBzaG91bGQgKGFu
ZCBpbgo+IHByYWN0aWNlIGRvZXMpIHR5cGljYWxseSBnbyBvbiB0aGUgc2FtZSBsaW5lIGFzIHdl
bGwuICBUaGUgcGxhY2VtZW50IG9mCj4gdGhlIGNsb3NpbmcgYnJhY2Ugb2Z0ZW4gZGVwZW5kcyBv
biBob3cgbGFyZ2Ugc3VjaCBhIGNvbXBvdW5kIGxpdGVyYWwgaXMuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gLS0tCj4gVEJEOiBXZSBtYXkgd2Fu
dCB0byBtYWtlIGV4cGxpY2l0IHRoYXQgZm9yIGluaXRpYWxpemVycyBib3RoIGZvcm1zIGFyZQo+
ICAgICAgIGZpbmUuCj4KPiAtLS0gYS9DT0RJTkdfU1RZTEUKPiArKysgYi9DT0RJTkdfU1RZTEUK
PiBAQCAtNjQsOCArNjQsMTMgQEAgQnJhY2luZwo+ICAgLS0tLS0tLQo+Cj4gICBCcmFjZXMgKCd7
JyBhbmQgJ30nKSBhcmUgdXN1YWxseSBwbGFjZWQgb24gYSBsaW5lIG9mIHRoZWlyIG93biwgZXhj
ZXB0Cj4gLWZvciB0aGUgZG8vd2hpbGUgbG9vcC4gIFRoaXMgaXMgdW5saWtlIHRoZSBMaW51eCBj
b2Rpbmcgc3R5bGUgYW5kCj4gLXVubGlrZSBLJlIuICBkby93aGlsZSBsb29wcyBhcmUgYW4gZXhj
ZXB0aW9uLiBlLmcuOgo+ICtmb3IKPiArLSB0aGUgZG8vd2hpbGUgbG9vcAo+ICstIHRoZSBvcGVu
aW5nIGJyYWNlIGluIGRlZmluaXRpb25zIG9mIGVudW0sIHN0cnVjdCwgYW5kIHVuaW9uCj4gKy0g
dGhlIG9wZW5pbmcgYnJhY2UgaW4gaW5pdGlhbGl6ZXJzCj4gKy0gY29tcG91bmQgbGl0ZXJhbHMK
TG9va3MgbGlrZSB0aGlzIGxlYXZlcyB1cyBvbmx5IHdpdGggImlmL2Vsc2UiLCAiZm9yIiwgInN3
aXRjaCIgYW5kCnZhcmlvdXMgZm9ybXMgb2YgImZvcl9lYWNoXyoiLiBTbyBtYXliZSBpdCBpcyB3
b3J0aCB0byByZXdyaXRlIHRoaXMKaW4gdGhlIG9wcG9zaXRlIG1hbm5lcj8gTGlrZSB0aGlzOgoK
QnJhY2VzICgneycgYW5kICd9JykgYXJlIHVzdWFsbHkgcGxhY2VkIG9uIHRoZSBzYW1lIGxpbmUs
IGV4Y2VwdCB0aGUKZm9sbG93aW5nIGNhc2VzOgoKIC0gaWYsIGVsc2UsIGZvciwgc3dpdGNoIHN0
YXRlbWVudHMKIC0gZm9yX2VhY2hfKiBpdGVyYXRvcnMgbGlrZSBmb3JfZWFjaF92Y3B1Cgo+ICtU
aGlzIGlzIHVubGlrZSB0aGUgTGludXggY29kaW5nIHN0eWxlIGFuZCB1bmxpa2UgSyZSLiAgZG8v
d2hpbGUgbG9vcHMKVGhlcmUgaXMgZXh0cmEgc3BhY2UgYmVmb3JlICJkby93aGlsZSIuCgo+ICth
cmUgb25lIGV4Y2VwdGlvbi4gZS5nLjoKPgo+ICAgaWYgKCBjb25kaXRpb24gKQo+ICAgewo+CgoK
LS0KVm9sb2R5bXlyIEJhYmNodWsgYXQgRVBBTQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

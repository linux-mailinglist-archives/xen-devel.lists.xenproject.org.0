Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 491E886A01
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 21:13:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvnoc-0002Mz-An; Thu, 08 Aug 2019 19:11:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LEb3=WE=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hvnoa-0002Mu-TE
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 19:11:08 +0000
X-Inumbo-ID: 44226d80-ba10-11e9-ab4a-1760637ecbc8
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.80]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44226d80-ba10-11e9-ab4a-1760637ecbc8;
 Thu, 08 Aug 2019 19:11:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JO2+RAGYMjItz22NbNGZOfA89zZEOiNQWes32aLjbrc0V0US+b8elP5b/fLK+ZHXspMA5MKoG1TsXYaMUBuKoAno3otfn+7wAUXl+2MRYuSIREs7LZYzj5Doe2XkKpH8uUykgsz/QwJ/l15emfMn77xkb6gYURfvUy1HOuMscynXV2q9fmDeooD6JiLS0+jydR9r2GNp7cUP+1ur04eCkcoSuYylrAkF7jUEJAYOsosrvf6x2C6+fffLnbRzHgrtwVhj0MgqHKIvOqAi2zF1zlUFKnaeJ5mAVYG3AivnN/S3p2yzhCmJkVzGSMCMB6RxSwhnc9OsG01WwXrcenkDVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4m0/IoxreMwzZe0mbNrf7FuWmDFcZGuEghNj/B1JrcE=;
 b=Q+0ePyu1H1JSD9YDDrgRPzEwcOZ+/EQHac0opvox/2EgzrTo+8BVIXqhtEcPygUPILsXUmoJWGDhfDQupPoH5IEyxd6JvOQxExdsSs7plciA26NkVKyJdRbRipHlrnzrCgE7BZfTkVAcM7z/nqbvrlPfyCD89C7RKwVLHeRRLSFTlrrFc+rZP+zgBGCPsQBzsIV8k5Y/8lu6PhWSQZQ12OGbEKBckazTKUTou0l9BdNESVWfEowDd1xcO6yPx/H1a2ASRDbZu/FNHaXXCnGO74PD2B9DB3h2QJzIzp5m5jyfrTqXZravVQP0XY9rxjbkfpJV+eAx2F24aBdRurFLdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4m0/IoxreMwzZe0mbNrf7FuWmDFcZGuEghNj/B1JrcE=;
 b=atdxAEmSy9APyYfTJpO3z0lajQc2xKmrng4y9RVxbk08X0zuWgj50WH+3hVcvBo/rBJaMT2hvZtyuEpYMle53sg/ZjZ72KSBH4uapFds8da2/v+tfvvpHS0rXsOJ6XXkalMQcpfh3I4ADsImWFVkxOyJ4rsInWjH6wtF9LWtOMrP4MrajujVS+xJ3BKORlYXgqniAekYIOCCXIaDnhEUzqI+IRlus+x4o691c9pWjoCibavcLbImBRksCqw+dZgmWRiVJJoDGIRyFkdfdU13jK2LY1zjEtlZjppIWlXRNMYpQSYURu7L4BCzimwHjuPT6Xn2B0k9TVoKq3unTFyBEw==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB5858.eurprd03.prod.outlook.com (10.255.28.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Thu, 8 Aug 2019 19:11:02 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 19:11:02 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [Xen-devel] [PATCH v4 0/7] reserved-memory in dom0
Thread-Index: AQHVTKDl4zrmd7rTtkSWCzoH/c25WabxoMaA
Date: Thu, 8 Aug 2019 19:11:02 +0000
Message-ID: <87r25vh3qy.fsf@epam.com>
References: <alpine.DEB.2.21.1908061428420.2451@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1908061428420.2451@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f5e3d7a-b948-460e-8348-08d71c34279a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB5858; 
x-ms-traffictypediagnostic: AM0PR03MB5858:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <AM0PR03MB58583CD96490D743DDFE8A09E6D70@AM0PR03MB5858.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(199004)(53754006)(189003)(3846002)(102836004)(66476007)(66446008)(6246003)(6116002)(966005)(64756008)(76116006)(99286004)(66946007)(66556008)(91956017)(80792005)(25786009)(476003)(2616005)(486006)(4326008)(229853002)(446003)(11346002)(5660300002)(256004)(14454004)(81166006)(86362001)(81156014)(8676002)(6916009)(478600001)(6506007)(8936002)(55236004)(54906003)(53936002)(186003)(36756003)(14444005)(6512007)(26005)(6436002)(6486002)(2906002)(6306002)(76176011)(316002)(7736002)(305945005)(71200400001)(66066001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5858;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BJ4T4yyBiRhKvYIAX0HRyFfD6tMWJzPoQI+K7u4lj+bsO1s8+wnkv84nGn53Zcgos8/RFeJJ5d6SoETZEWtMFyl0hGPhly+QSQK/XpjfRVGwRBY9JNM12/cXEoh0Lh8mIV3by1WHnD29MEJ7h5GDVBcUwqL+GOs3WI2xKw1ImWDr1ZsNg/+EyLVYn1adJhERxF6+yMZIZxeYs1a6rnRG6Cm4IxeUfA0kuUW1dzq9obUYjUaFv6eCVFFjFRyZLxZJ7EMcY9jupSRCXj51/84dwuiLNhnM9ti/8YiL9rE9gxqtGI8nynpYURDQvsfADNSLuGF44p1FMD15jec0MF6TWaRaBie/covtwsv8s7Ai1KqVwLzxqE7xWNk6rvKQz/Tdoq7hRZlLG1xn+p/RxWHVKMJvUHL22+4Gm5Wb9FYMalc=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5e3d7a-b948-460e-8348-08d71c34279a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 19:11:02.3845 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: epx8S+w5R7HRpXtRIgq204quFf0mqAJnVHxJzhtRPb/XooIe2eQ3S418F0pRSQPeUD2jgyrssfYcOMDEqkuwGY464r4RiTGyl6Pe8PXf+dA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5858
Subject: Re: [Xen-devel] [PATCH v4 0/7] reserved-memory in dom0
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIFN0ZWZhbm8sCgpTdGVmYW5vIFN0YWJlbGxpbmkgd3JpdGVzOgoKPiBIaSBhbGwsCj4KCkxv
b2tzIGxpa2UgeW91IGFyZSBub3QgdXNpbmcgYWRkX21haW50YWluZXIucGwgb3IgeW91ciBNQUlO
VEFJTkVSUyBmaWxlCmlzIG91dCBvZiBkYXRlLiBJbiBhbnkgY2FzZSBJJ20gbm90IGdldHRpbmcg
Q0MnZWQgYW5kIEknbSBtaXNzaW5nIHlvdXIKZS1tYWlscy4KClNvIGl0IHdvdWxkIGJlIGNvb2wg
aWYgeW91J2xsIENDIG1lIGlmIHlvdSB3YW50IG1lIHRvIHJldmlldyB5b3VyCnBhdGNoZXMuCgo+
IFRoaXMgcGF0Y2ggc2VyaWVzIGludHJvZHVjZXMgcGFydGlhbCByZXNlcnZlZC1tZW1vcnkgc3Vw
cG9ydCBmb3IgZG9tMAo+IG9ubHkgKG5vIGRvbVUgc3VwcG9ydCBmb3IgcmVzZXJ2ZWQtbWVtb3J5
IHlldC4pCj4KPgo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNDVjZTViODc0
OWEyMjBhZDdjNGNlNWQ1ZWJhN2MyMDFhOTQxODA3ODoKPgo+ICAgbW06IFNhZmUgdG8gY2xlYXIg
UEdDX2FsbG9jYXRlZCBvbiB4ZW5oZWFwIHBhZ2VzIHdpdGhvdXQgYW4gZXh0cmEgcmVmZXJlbmNl
ICgyMDE5LTA4LTA2IDEyOjE5OjU1ICswMTAwKQo+Cj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0
IHJlcG9zaXRvcnkgYXQ6Cj4KPiAgIGh0dHA6Ly94ZW5iaXRzLnhlbnByb2plY3Qub3JnL2dpdC1o
dHRwL3Blb3BsZS9zc3RhYmVsbGluaS94ZW4tdW5zdGFibGUuZ2l0IHJlc2VydmVkLW1lbS0yCj4K
PiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gYjNiMjBjOTg3ZmU1MzFmNzA2ZmU1MGRi
YTVlNzQ5YzNjYjMwNmIzZjoKPgo+ICAgeGVuL2FybTogYWRkIHJlc2VydmVkLW1lbW9yeSByZWdp
b25zIHRvIHRoZSBkb20wIG1lbW9yeSBub2RlICgyMDE5LTA4LTA2IDE0OjM2OjE0IC0wNzAwKQo+
Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+IFN0ZWZhbm8gU3RhYmVsbGluaSAoNyk6Cj4gICAgICAgeGVuL2FybTogZXh0
ZW5kIGRldmljZV90cmVlX2Zvcl9lYWNoX25vZGUKPiAgICAgICB4ZW4vYXJtOiBtYWtlIHByb2Nl
c3NfbWVtb3J5X25vZGUgYSBkZXZpY2VfdHJlZV9ub2RlX2Z1bmMKPiAgICAgICB4ZW4vYXJtOiBr
ZWVwIHRyYWNrIG9mIHJlc2VydmVkLW1lbW9yeSByZWdpb25zCj4gICAgICAgeGVuL2FybTogZWFy
bHlfcHJpbnRfaW5mbyBwcmludCByZXNlcnZlZF9tZW0KPiAgICAgICB4ZW4vYXJtOiBoYW5kbGUg
cmVzZXJ2ZWQtbWVtb3J5IGluIGNvbnNpZGVyX21vZHVsZXMgYW5kIGR0X3VucmVzZXJ2ZWRfcmVn
aW9ucwo+ICAgICAgIHhlbi9hcm06IGRvbid0IGlvbWVtX3Blcm1pdF9hY2Nlc3MgZm9yIHJlc2Vy
dmVkLW1lbW9yeSByZWdpb25zCj4gICAgICAgeGVuL2FybTogYWRkIHJlc2VydmVkLW1lbW9yeSBy
ZWdpb25zIHRvIHRoZSBkb20wIG1lbW9yeSBub2RlCj4KPiAgeGVuL2FyY2gvYXJtL2FjcGkvYm9v
dC5jICAgICAgfCAgMiArLQo+ICB4ZW4vYXJjaC9hcm0vYm9vdGZkdC5jICAgICAgICB8IDk0ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPiAgeGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jICAgfCA0NiArKysrKysrKysrKysrKy0tLS0tLS0KPiAgeGVuL2FyY2gv
YXJtL3NldHVwLmMgICAgICAgICAgfCA1MyArKysrKysrKysrKysrKysrKysrKysrLS0KPiAgeGVu
L2luY2x1ZGUvYXNtLWFybS9zZXR1cC5oICAgfCAgMSArCj4gIHhlbi9pbmNsdWRlL3hlbi9kZXZp
Y2VfdHJlZS5oIHwgIDYgKystCj4gIDYgZmlsZXMgY2hhbmdlZCwgMTYwIGluc2VydGlvbnMoKyks
IDQyIGRlbGV0aW9ucygtKQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbAoKCi0tClZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

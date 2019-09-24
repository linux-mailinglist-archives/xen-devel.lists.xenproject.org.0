Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82941BCBCC
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 17:49:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCn1g-0001ga-2h; Tue, 24 Sep 2019 15:46:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mc7A=XT=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iCn1e-0001gD-NV
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:46:50 +0000
X-Inumbo-ID: 8586899a-dee2-11e9-bf31-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::601]) by localhost (Halon) with ESMTPS
 id 8586899a-dee2-11e9-bf31-bc764e2007e4;
 Tue, 24 Sep 2019 15:46:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLbV+CBZrAVVO+3FytRwyewm+LeZ4QTzn6k9iLwztVqkNojR+vyn5QnjO32z+yc8z8If7Zhp2bKHlS8OeQJF+1DOYIpe5Dz6OwO1uZ5neEk0v1o1gLA532eCaf7tUn8OAx7/wTpWRoaNOW+kxYoKb8a0ZH/fio2ZiM2FtXnMhMCJBtosd1KwV4TaXHikNOCakwuTHWs88LNVqgEioOkzOLog2rVIdsmYg1PT2FnOJIJRZ3C6NC+4QBksYqaiWrs4AIz0kle3axOeS55ncpWSPjd4bTGEUwlI+hVAd0iiuLQ4pLxhUAYM/TATvDguQL/0/Lq8pgZyLBiLhb3PDXsjaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSxFzE6t67y2/sQ5AhtkKYvKQrZ1tPL0xIjf1lPeXn4=;
 b=IBPTpNto7iheK9f+/Jh/+3mNbixycfx2Kqo8tYDxvIAYDtkIyfzv0MUDGPPtRXim4FZU1iRdmwTLX5CBaI68dH8Abbj3WjxxOUbrtvv6PUDJJcAe6CEFYQE5ktKNZgfSIFBWhRjWcVvSlMDe1RHJ0yQ6al5KmyY8cY6ZkFJJqmdL1w8ycgLehsZOlSAnCXKbWKCXKmbLVS40jeKjb/Ekvrte5A1j977HnShOQiWHl+QyeLFIS2nd5bdy0/9uP0kz66CnaN0gdlrzdC50DW/bxrRKtvHS9IbKd7cuq0idv8mqiWi8vz+EBwxXhBHEnHpi3UjHsuETcxrwkQWohf7FBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSxFzE6t67y2/sQ5AhtkKYvKQrZ1tPL0xIjf1lPeXn4=;
 b=ArDz81x7LwPVoJdWcdRUm9Yjp78d4Ze45fl1wwhu8qxKL2hpAVHwAn8JQ3JlXSZLulD03h+yKv7WKBARPxoTrnTer4gOZJpdvRCz34ggFjdrY+H1GjeP3hZPMS2CW2n7KnnQDkVb8hiRoWb0cB0JDhYiXKWiE/IQ+pSQlNwVyco=
Received: from AM6PR03MB4150.eurprd03.prod.outlook.com (20.177.36.81) by
 AM6PR03MB4757.eurprd03.prod.outlook.com (20.177.35.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Tue, 24 Sep 2019 15:46:48 +0000
Received: from AM6PR03MB4150.eurprd03.prod.outlook.com
 ([fe80::3523:ad12:6e5d:5f17]) by AM6PR03MB4150.eurprd03.prod.outlook.com
 ([fe80::3523:ad12:6e5d:5f17%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 15:46:48 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 3/3] xen/arm: optee: update description in Kconfig
Thread-Index: AQHVcu9Gr/o7vsfWqUO7kB1qoubfpg==
Date: Tue, 24 Sep 2019 15:46:48 +0000
Message-ID: <20190924154633.852828-4-volodymyr_babchuk@epam.com>
References: <20190924154633.852828-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20190924154633.852828-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e246ef35-1990-4cbd-f491-08d74106693f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR03MB4757; 
x-ms-traffictypediagnostic: AM6PR03MB4757:|AM6PR03MB4757:
x-ms-exchange-transport-forked: True
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM6PR03MB4757626BE82CFE75E4903F4EE6840@AM6PR03MB4757.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(189003)(199004)(64756008)(66946007)(6116002)(3846002)(54906003)(476003)(2616005)(11346002)(76176011)(86362001)(15650500001)(8936002)(256004)(6916009)(2906002)(81156014)(5640700003)(81166006)(446003)(966005)(186003)(2351001)(14444005)(55236004)(6436002)(486006)(99286004)(6512007)(80792005)(36756003)(5660300002)(4326008)(14454004)(6486002)(66066001)(8676002)(305945005)(2501003)(6506007)(7736002)(25786009)(478600001)(66556008)(66476007)(6306002)(91956017)(76116006)(316002)(71200400001)(66446008)(71190400001)(1076003)(26005)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR03MB4757;
 H:AM6PR03MB4150.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PRjPm0GhSpi/BWEXmUW3Z1V5Rs1wc3RRW1K4AyriiF3cM5d8wWXZ1zgGhGP2oIlW/O2ksU9LHpyXRVXXmqwYbTglD+TGGGx9RhXxqPvqXpKPPZerQzuH7c28C3Qn2WY/WdyHtvZdp+a7B+DgQeYdyOilsszoSEv4FO6odfiwdqsPxrhz+PxKjRw4d5BiiCR35vkEmtz5SHmlzPp/rLHWfqnP0pt1VUhzmhhd5biQ3VTeHzXAInHRPK1DljsQosXSZPeKDxD4owvDa8dsI4wtjpTIgzL2kSLYClMiJfyLc4F2q40yXl58Vu7Nv+WTvpHPmwKMKzW+e5UDD9C4a1N8Oo8OS5SN1mzvig4MnWsFPOiBiVK4FadxylkM0Md7bFwn6KcY3r2Xg6Yhb8wtHVdNqCnwL+4dNse51fN0GwqgeW4=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e246ef35-1990-4cbd-f491-08d74106693f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 15:46:48.6559 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0JFX9zTYo1SobMZgcJMLDx2oxYtku+7bvowYd2VlW920FJ1Smi8SfeinC+oIVEwaBoSe0Nnv6XvuzQhxL6oFusR7Tme38RIJYmfBAaGrXVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4757
Subject: [Xen-devel] [PATCH v3 3/3] xen/arm: optee: update description in
 Kconfig
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

T1AtVEVFIG1lZGlhdG9yIG5vdyBpcyAiVGVjaCBQcmV2aWV3IiBzdGF0ZSwgYW5kIHdlIHdhbnQg
dG8gdXBkYXRlCml0J3MgZGVzY3JpcHRpb24gaW4gS2NvbmZpZyBhY2NvcmRpbmdseS4KClNpZ25l
ZC1vZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4K
Ci0tLQoKTm90ZSB0byBjb21taXRlcjogdGhpcyBwYXRjaCBkZXBlbmRzIG9uIGZpcnN0IDQgcGF0
Y2hlcyBpbiB0aGUgc2VyaWVzLgotLS0KIHhlbi9hcmNoL2FybS90ZWUvS2NvbmZpZyB8IDkgKysr
KystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUvS2NvbmZpZyBiL3hlbi9hcmNoL2FybS90ZWUv
S2NvbmZpZwppbmRleCBiNGI2YWEyNjEwLi4zOTIxNjliMjU1IDEwMDY0NAotLS0gYS94ZW4vYXJj
aC9hcm0vdGVlL0tjb25maWcKKysrIGIveGVuL2FyY2gvYXJtL3RlZS9LY29uZmlnCkBAIC0zLDcg
KzMsOCBAQCBjb25maWcgT1BURUUKIAlkZWZhdWx0IG4KIAlkZXBlbmRzIG9uIFRFRQogCWhlbHAK
LQkgIEVuYWJsZSBleHBlcmltZW50YWwgT1AtVEVFIG1lZGlhdG9yLiBJdCBhbGxvd3MgZ3Vlc3Rz
IHRvIGFjY2VzcwotCSAgT1AtVEVFIHJ1bm5pbmcgb24geW91ciBwbGF0Zm9ybS4gVGhpcyByZXF1
aXJlcyB2aXJ0dWFsaXphdGlvbi1lbmFibGVkCi0JICBPUC1URUUgcHJlc2VudC4gWW91IGNhbiBs
ZWFybiBtb3JlIGFib3V0IHZpcnR1YWxpemF0aW9uIGZvciBPUC1URUUKLQkgIGF0IGh0dHBzOi8v
b3B0ZWUucmVhZHRoZWRvY3MuaW8vYXJjaGl0ZWN0dXJlL3ZpcnR1YWxpemF0aW9uLmh0bWwKKwkg
IEVuYWJsZSB0aGUgT1AtVEVFIG1lZGlhdG9yLiBJdCBhbGxvd3MgZ3Vlc3RzIHRvIGFjY2Vzcwor
CSAgT1AtVEVFIHJ1bm5pbmcgb24geW91ciBwbGF0Zm9ybS4gVGhpcyByZXF1aXJlcworCSAgdmly
dHVhbGl6YXRpb24tZW5hYmxlZCBPUC1URUUgcHJlc2VudC4gWW91IGNhbiBsZWFybiBtb3JlCisJ
ICBhYm91dCB2aXJ0dWFsaXphdGlvbiBmb3IgT1AtVEVFIGF0CisJICBodHRwczovL29wdGVlLnJl
YWR0aGVkb2NzLmlvL2FyY2hpdGVjdHVyZS92aXJ0dWFsaXphdGlvbi5odG1sCi0tIAoyLjIzLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

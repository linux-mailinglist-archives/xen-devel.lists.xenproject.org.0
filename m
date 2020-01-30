Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4437514DDB2
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 16:22:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixBcH-0007Am-Ml; Thu, 30 Jan 2020 15:20:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7qPw=3T=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1ixBcG-0007Ae-Hs
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 15:20:24 +0000
X-Inumbo-ID: 0877b4e6-4374-11ea-8396-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.59]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0877b4e6-4374-11ea-8396-bc764e2007e4;
 Thu, 30 Jan 2020 15:20:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKZX9mfYTDUxfBRK+Rx+vYuphRMf/SWNJjLwEpo2g777S+CGr1Si4/WTqop3SQRuImIf4ueVTbxNdIsK7UFTEUAhjRMRT0rxA2rCp4fIWY74IxKJnMaH8BneO3kAXHdrs64X6D2zfdoPvN5b9HWS7r70+2Bs8PT454u2SiyDqG7ywpzapZKHPaJf7mb1jg+K5zk4vH1waPKt9isfoYq2NaOiLnS5sCcxV6yyRsMGUVZUWnLEAKJA67+yAJhgjmQrXqYwj6TXq42RTjuFQn6G6+iikobmcev7MyPzNmI05nqLF8T3N5QGi/Ii0d4Mu7K5OajZl3qqbSXUpjqnoT4sOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PEtnFN0UZ2bf17pKjUkH2sdddNDULeAXhhLWLit86o=;
 b=e/N+Uskrb/gGXJwl6xf2h2k7qREBb/Me04RFlNEueP8d5S2a5sB9XNocgLU80UlvMOqpa8CBaPM5TxKAWRtJQmRJ4+hvZm+N0VWietAQMkWcvNEKZUcs3fK0vbzhf1wQo4jsQJmQBPuip5XrOV7Kx6bSVsT7Nj+yxG3RKv7eZKQpY/181w+Pm8hjAWZpqLUDUX68hgPN4EDJqF0hBMCWOKFc3QUYi7LiisBE5lxB06uAuDV2mUJFTnGMTp/4/TTtkE36AqyICS366beRf/SGsuiwZRLEyns8DFtGPvKwSbirQZlQY3e3/W+22dUfPGGXH2brAgqSRM1illVU4TDcmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PEtnFN0UZ2bf17pKjUkH2sdddNDULeAXhhLWLit86o=;
 b=lmGUslcpxUtAr0h5HYit0s3oLvODvTB0IOIAJfS0ZKTABCuQAvMUU4zk77CNoSwGygAgz4Mb7Mr9JT7c9TEOus5B8AvSjCBBMDgsGpm92VteHc4h7AZkA53VjYNOkrT9OICp+nTpzPLEZek84hsUVQukJ+qqQkb/kvJ9SChb7i0=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB5780.eurprd03.prod.outlook.com (20.179.255.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.20; Thu, 30 Jan 2020 15:20:21 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::c5e7:7740:4cd5:77c1]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::c5e7:7740:4cd5:77c1%5]) with mapi id 15.20.2665.027; Thu, 30 Jan 2020
 15:20:21 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Thread-Topic: [PATCH] iommu/arm: Don't allow the same micro-TLB to be shared
 between domains
Thread-Index: AQHV1rQn7uvWmtBMUUCKekbfSzRsQagBzvuAgAF4XICAAAi8gIAABBYA
Date: Thu, 30 Jan 2020 15:20:21 +0000
Message-ID: <871rrhotsb.fsf@epam.com>
References: <1580309714-21912-1-git-send-email-olekstysh@gmail.com>
 <874kwep7pe.fsf@epam.com> <b3cf0ae9-d9ea-5a8a-0f2d-36f158aa680b@gmail.com>
 <8736bxougo.fsf@epam.com>
In-Reply-To: <8736bxougo.fsf@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 313f4329-b334-41fb-0da4-08d7a597ec15
x-ms-traffictypediagnostic: AM0PR03MB5780:|AM0PR03MB5780:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB5780B13E99DD0E9B6B3FECA2E6040@AM0PR03MB5780.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 02981BE340
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(199004)(189003)(316002)(186003)(36756003)(6486002)(2906002)(54906003)(37006003)(6862004)(6512007)(478600001)(5660300002)(4744005)(86362001)(2616005)(4326008)(8936002)(66446008)(81156014)(55236004)(6200100001)(81166006)(64756008)(66476007)(8676002)(66946007)(76116006)(66556008)(71200400001)(26005)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5780;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DWo1HU5RkcRwTuCXV0HvO61dxHuvtirmHn7/a3gu69mFQld+iTOOxtE3yr9rgt7QsDxnRkwvVrWPZAOneoh7q8colne2TEGdi1L+XuJj88h9eUlivsLabF1Q2xJoUE2yJlVTHJBU/e48zVcShkZUBOtvMCwQSHOr1T2cZDBr8kQHH4agEOWho2KFjOJmjuQr+CYKoZrHYQmQuDD3eV/GaK5skVfiw6ZBSZP0DOLQsvFyE69CkG85oUBcgEKnFQdJtKwcJdJahOklE7BluOxL9XnCd16/ACFPhxFepoW9PZz0INbUs0S2URDfp8Hqx4tZ+LSqP5ZTBJ++u1hKVjVXQE3fPWssYZiv8llHt7L9d/X+ch68mveHv6MJQxPyibe55WstLDmDhftH2J5j+kHJO1K/yXLJjin1nxO87wWj1Eq+agmt7kp+od9nMKIJx7R1
x-ms-exchange-antispam-messagedata: kOelq/YpqO6rCZvuhJ2gilhelB2EnR6j/xfOCxSB89j6ij+4IGjaVXOBo8O6xVNEiglrF13XWccKmRIQIMIMN5aDw1ULpl9gn76UlrLsn01CgGk2EiNlSth1HXpdL0mbkwjH+fCG4SvLjkBCrwq9Ow==
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 313f4329-b334-41fb-0da4-08d7a597ec15
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2020 15:20:21.2883 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vL1XkU9hIhoxsWBCLuXmktgkQ6dmLEsAPJEe9ZRZFvzgjd4+abvLSh/ePeSRXWmf8TzTclDe40pQMie4HxUTbwigbHYuBBy8AFtxlvCHIHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5780
Subject: Re: [Xen-devel] [PATCH] iommu/arm: Don't allow the same micro-TLB
 to be shared between domains
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Oleksandr <olekstysh@gmail.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpWb2xvZHlteXIgQmFiY2h1ayB3cml0ZXM6CgpPbGVrc2FuZHIsCgpbLi4uXQo+PiBkaWZmIC0t
Z2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lwbW11LXZtc2EuYwo+PiBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pcG1tdS12bXNhLmMKPj4gaW5kZXggYzIxZDJkNy4uNDEx
ZmMwZiAxMDA2NDQKPj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lwbW11LXZt
c2EuYwo+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaXBtbXUtdm1zYS5jCj4+
IEBAIC03MDIsNyArNzAyLDEyIEBAIHN0YXRpYyBpbnQgaXBtbXVfYXR0YWNoX2RldmljZShzdHJ1
Y3QKPj4gaXBtbXVfdm1zYV9kb21haW4gKmRvbWFpbiwKPj4gICAgICAgICAgaW50IHJldCA9IGlw
bW11X3V0bGJfZW5hYmxlKGRvbWFpbiwgZndzcGVjLT5pZHNbaV0pOwo+Pgo+PiAgICAgICAgICBp
ZiAoIHJldCApCj4+ICsgICAgICAgIHsKPj4gKyAgICAgICAgICAgIHdoaWxlICggaS0tICkKPiBZ
b3Ugd2lsbCBjYWxsCj4+ICsgICAgICAgICAgICAgICAgaXBtbXVfdXRsYl9kaXNhYmxlKGRvbWFp
biwgZndzcGVjLT5pZHNbaV0pOwo+IGZvciB1VExCIHRoYXQgY2F1c2VkIHRoZSBlcnJvci4gTGlr
ZWx5LCB0aGlzIHVUTEIgcmlnaHQgbm93IGlzIGFzc2lnbmVkCj4gZm9yIGFub3RoZXIgZG9tYWlu
LiBTbywgeW91IHdpbGwgZGlzYWJsZSBhY3RpdmUgdVRMQiB3aGljaCBiZWxvbmdzIHRvCj4gdGhh
dCBkb21haW4uIAoKUGxlYXNlIGRpc3JlZ2FyZCB0aGlzLiBJIHJlYWxpemVkIHRoYXQgaS0tIHdp
bGwgZW5zdXJlIHRoYXQgcmlnaHQgaW5kZXgKd2lsbCBiZSB1c2VkLiBTb3JyeSBmb3IgdGhlIG5v
aXNlLgoKLS0gClZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

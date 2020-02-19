Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 297F4164B69
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 18:04:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4Sjc-00065K-E4; Wed, 19 Feb 2020 17:02:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x/I1=4H=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1j4Sja-00065E-O5
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 17:02:03 +0000
X-Inumbo-ID: 8be0cbfe-5339-11ea-bc8e-bc764e2007e4
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::629])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8be0cbfe-5339-11ea-bc8e-bc764e2007e4;
 Wed, 19 Feb 2020 17:02:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYQwQagyzka0HzTJyKROTR/6S8pVsdgSjbxNV/vNlZheX6O4oTI8pcFyPxOo7+bbY8WW85TYJxx/nofG5C3+0KwkijdtD+CeOIrCvf3O/N6qMVEJxOqao4ntg2BbtzmXEco4/QBjBIFgVxvAQjVOCfaoRRm++Q7IVZfS50AZU7LSWFh2Erx1BfaLj9JAa3UDKBSw7J9ibNIPotdV2t5PENw+cPgicAF0Jq+/Jd3BiA4TQg1wWcpwn2aBxzgBr5EBLLYB/NWbaIQd3PLOI1+xs1qX6buVAkQlanl7BWeeUXg6q8x65kBObk8Z010Q9laaRrOy2m/16rxaKwsEG5DfCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mS47mx4vuggl0sGLs3KLM9ZZ5vEaDZaXQhshA2tfJC0=;
 b=T4g2Va8Pa3ABng5IqC6iztBQOvsSYhQoTR0AYwBUQ22XHlyWavR/dDk8ZLNM/mjkd+s3PJx54bdUj/cizMH0Iehz4GRjsYoDT6V0McmsFUzFBCvI9ofqTvjDV5N/h/q19flr3xxYbcaph2f12RCNi1kEt5rTcUehVtUqnKyHsFI55aIFBKn+Z1hKMO4pyjgrw/4Jl/qfSIFC2NCgKyyNS6vDzRJx+tI3P1iqIvagt1zWNtXgTBGfoOvl7bhaU6zgdFHA78kYQQA1+BljdWk5TVza8whLzQVI3cZJWINLWCBxrSb8r1MGJhxRFOE6hFSFD6820+0yeTAmvkTHfihXfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mS47mx4vuggl0sGLs3KLM9ZZ5vEaDZaXQhshA2tfJC0=;
 b=TeDmu2A1QPLqKr5CXRdEC0ojjW/nohy+dL0cf81CFzZ1b0MsvlAJd4t7ixA6jlIPahwmNGFA4kpTQOfbnqY5vYacnIlscnjg1W7fhX0L0V2h8dOdX66ygSiO/R0CTKtJxeND20xoDAIr78oPDS9vj4LCL+D9YzwylHoyxWap8Ds=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4770.eurprd03.prod.outlook.com (20.177.41.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Wed, 19 Feb 2020 17:01:59 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::c5e7:7740:4cd5:77c1]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::c5e7:7740:4cd5:77c1%5]) with mapi id 15.20.2729.032; Wed, 19 Feb 2020
 17:01:59 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Thread-Topic: [PATCH V2] iommu/arm: Don't allow the same micro-TLB to be
 shared between domains
Thread-Index: AQHV5aO7YteUeX2hiEa0D7U9u2DxoqgiwScA
Date: Wed, 19 Feb 2020 17:01:58 +0000
Message-ID: <8736b6mryz.fsf@epam.com>
References: <1581951935-5279-1-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1581951935-5279-1-git-send-email-olekstysh@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1bc6c13-7a88-4426-bfa6-08d7b55d6ed8
x-ms-traffictypediagnostic: AM0PR03MB4770:|AM0PR03MB4770:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB4770B30994545C864A67808BE6100@AM0PR03MB4770.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0318501FAE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(189003)(199004)(26005)(186003)(6512007)(2616005)(498600001)(6486002)(54906003)(5660300002)(71200400001)(8936002)(4326008)(81156014)(76116006)(4744005)(8676002)(6916009)(6506007)(64756008)(66446008)(81166006)(55236004)(2906002)(36756003)(86362001)(66946007)(66476007)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4770;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4li+TZJapAwxdgT6S3zbcfCPjoKTMHPCMdkMg97LuzkuB2/P8S2b7taeqUdcxuYuZra5ElNDudtIEQ+WhRhfc3ZhaVlzk2B9G41fXqQBe0a12ySPbiA4Siky6IdSJW+kFv0y9CgTi7RvUUde2MmcJZR/6WbmppHEFMJ8sXNTPYa8fJjipGksOmyTsnxDqz/r4xxlDfbVY8fbQtc9KwPqIdyK/SSDFRt2m5f7CUUWRvPwztQuViTlBUoA9JEWF1EE3N88lw6ru+pPJwQ/19WuhGd1Gtni4xXsglFklQr/1Dj3pS026REzetf5R8JpA4lk3bDPCLEQaOoX3OxbrTOLXVTCqoYvkmS5WXHFxxZ+Q6Qx57zurAIYgC36MSoMeh+O+iDwF8diGZafV1mGxrtX7qWJ+x5Mbd0JZpuguz357qDef7ByOXwr9Ky3tLe6Z4KU
x-ms-exchange-antispam-messagedata: K+8+W9uRCvJEzYUIDilDi6vU/GCazgBZmXxft0yPHQYFPxbASO0JXSVEySfUxWIyGy1x01nlHXkow0Vm3ELd3hOcFLybn/vnQzRxxmpH5S/GArqdUlcExPiwPM279bwFJ6K2SGVWciqX/hhuIc8LUA==
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1bc6c13-7a88-4426-bfa6-08d7b55d6ed8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2020 17:01:59.0930 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hfydBxSs18fD07GoC0OH9i6h0j/z7efn5NDR+rKcNq3wiXTqrZjSHhM7aHqDmsG+WGeyRVB8oAqzPEdeBzhINaxArF04Ca2g5FLjrVOjH/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4770
Subject: Re: [Xen-devel] [PATCH V2] iommu/arm: Don't allow the same
 micro-TLB to be shared between domains
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
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhlbGxvIE9sZWtzYW5kciwKCk9sZWtzYW5kciBUeXNoY2hlbmtvIHdyaXRlczoKCj4gRnJvbTog
T2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+Cj4g
Rm9yIHRoZSBJUE1NVS1WTVNBIHdlIG5lZWQgdG8gcHJldmVudCB0aGUgdXNlIGNhc2VzIHdoZXJl
IGRldmljZXMKPiB3aGljaCB1c2UgdGhlIHNhbWUgbWljcm8tVExCIGFyZSBhc3NpZ25lZCB0byBk
aWZmZXJlbnQgWGVuIGRvbWFpbnMKPiAobWljcm8tVExCIGNhbm5vdCBiZSBzaGFyZWQgYmV0d2Vl
biBtdWx0aXBsZSBYZW4gZG9tYWlucywgc2luY2UgaXQKPiBwb2ludHMgdG8gdGhlIGNvbnRleHQg
YmFuayB0byB1c2UgZm9yIHRoZSBwYWdlIHdhbGspLgo+Cj4gQXMgZWFjaCBYZW4gZG9tYWluIHVz
ZXMgaW5kaXZpZHVhbCBjb250ZXh0IGJhbmsgcG9pbnRlZCBieSBjb250ZXh0X2lkLAo+IHdlIGNh
biBwb3RlbnRpYWxseSByZWNvZ25pemUgdGhhdCB1c2UgY2FzZSBieSBjb21wYXJpbmcgY3VycmVu
dCBhbmQgbmV3Cj4gY29udGV4dF9pZCBmb3IgdGhlIGFscmVhZHkgZW5hYmxlZCBtaWNyby1UTEIg
YW5kIHByZXZlbnQgZGlmZmVyZW50Cj4gY29udGV4dCBiYW5rIGZyb20gYmVpbmcgc2V0Lgo+Cj4g
U2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtv
QGVwYW0uY29tPgpSZXZpZXdlZC1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJj
aHVrQGVwYW0uY29tPgoKPiAtLS0KPgo+IENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3Jn
Pgo+IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ0M6
IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KPiBDQzogWW9z
aGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPgo+Cj4gQ2hh
bmdlcyBWMSBbMV0gLT4gVjI6Cj4gICAgLSBSZW5hbWUgImRhdGEiIHRvICJpbXVjdHIiIGluIGlw
bW11X3V0bGJfZW5hYmxlKCkKPiAgICAtIERpc2FibGUgYWxyZWFkeSBlbmFibGVkIHVUTEJzIGlu
IGlwbW11X2F0dGFjaF9kZXZpY2UoKQo+ICAgICAgaW4gY2FzZSBvZiBlcnJvcgoKLS0gClZvbG9k
eW15ciBCYWJjaHVrIGF0IEVQQU0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==

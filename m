Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D73BCBCD
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 17:49:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCn1b-0001f6-7w; Tue, 24 Sep 2019 15:46:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mc7A=XT=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iCn1Z-0001f0-BW
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:46:45 +0000
X-Inumbo-ID: 823c0134-dee2-11e9-bf31-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::612]) by localhost (Halon) with ESMTPS
 id 823c0134-dee2-11e9-bf31-bc764e2007e4;
 Tue, 24 Sep 2019 15:46:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zv86U92nMfYSbC48G0QtMifXb4+VhqxtcQk46kMmkwjok29HGaq+u/M9ClHMFnO7UXM9GYo//H2Quf4zr4epS8WTlhClHTc31rTm5zZpH7XtLaRBiy2SjJq1svyAm08zLesjJQQYegxVfYB1uuIpYBnpRkDO4tBeH4c1uUQ/w/9eaB3YynZP9J48ihe5mkEe0O1k9RgrRxCm7idhQ4fr7VGXSsfD2DmCJjNYK6Qe+iGGSm0AAVT3CcE867mpcaWYZWDJf70glFK6WzVc+YI5opz42uP7CNeui8UA1FjLz9270Cub57wgI60CihFoG83UcALFhk+c8P3mmtweDPOI7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+j0c3WfffUmA4jOTemDuBF/zJS7AGl4uEvnO1trQcc=;
 b=gjOaHV1kc3ybmF8L3fSXVwQgo1SCFi6375uZy2BD+TkriZH63j6YbqGKLJV5s6Hw4vIywXdBNpoj6vlDHPdru24juL6umSI+8pe4Mt6w6rQ+EnratNfeOytIars77g9aiezVn/+JkUehkSpVJFrfOHvRTFNqFSTDnBLq3j9bqB6o15p+BYx2pqqjdr61vGMCu47Xpke3fLRbZituWRgw/vaedx4IChoiaAJIW1JgCSEZRq2UsRJpo7FiTbS71AaM6UXm6mOT3QDsgyySYK2AxLe3gKiNv47ug57RERL1L5eqZPHoQKr9qhdQ3bAylXciUg0XgxcqwIAePnmqyJ2CUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+j0c3WfffUmA4jOTemDuBF/zJS7AGl4uEvnO1trQcc=;
 b=OJiUCUo+eHsdt8ID9W51yfyewYcNtghRLSYgZm0PIjHBbZl4ka0jNnLdE5MoxYzoS6HnbKjyir0CVP4C9+VJuMDg1+9YUb0LYFAyduzQpAiI84Hnb8QTVWBIzmDOw7oxbETJZvg5suTQaN6SBsMR5npY1VvQUia/YB93u5Jyvpw=
Received: from AM6PR03MB4150.eurprd03.prod.outlook.com (20.177.36.81) by
 AM6PR03MB4982.eurprd03.prod.outlook.com (20.178.90.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Tue, 24 Sep 2019 15:46:42 +0000
Received: from AM6PR03MB4150.eurprd03.prod.outlook.com
 ([fe80::3523:ad12:6e5d:5f17]) by AM6PR03MB4150.eurprd03.prod.outlook.com
 ([fe80::3523:ad12:6e5d:5f17%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 15:46:42 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 0/3] arch/arm: optee: fix TODOs and change status to
 "Tech Preview"
Thread-Index: AQHVcu9DeZmnY3z9Z02/+hcfLyj3Ng==
Date: Tue, 24 Sep 2019 15:46:42 +0000
Message-ID: <20190924154633.852828-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2164a13c-b7cd-4769-b936-08d7410665c7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM6PR03MB4982; 
x-ms-traffictypediagnostic: AM6PR03MB4982:|AM6PR03MB4982:
x-ms-exchange-transport-forked: True
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <AM6PR03MB498274301606EA8F01900E39E6840@AM6PR03MB4982.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(189003)(199004)(2616005)(5660300002)(476003)(36756003)(5640700003)(6486002)(6306002)(6436002)(4326008)(86362001)(54906003)(8676002)(305945005)(6512007)(8936002)(7416002)(316002)(1076003)(7736002)(71200400001)(71190400001)(81166006)(81156014)(2501003)(66476007)(91956017)(6916009)(14454004)(64756008)(486006)(6506007)(66446008)(66556008)(66946007)(966005)(66066001)(478600001)(25786009)(2351001)(76116006)(80792005)(3846002)(2906002)(6116002)(14444005)(256004)(55236004)(26005)(102836004)(186003)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR03MB4982;
 H:AM6PR03MB4150.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0I98MnD6tZdj7W+ylbTKwg2or9RPi5WhbT/e1KN6QSkKWIlTMDXUBuIwsCrZeSymSEdpJ8IYuZYiO+FMNqk1QAPUtFUn1X4GfSchyujGun8tquBjtRRcYrQKDHWJVW2DZlLxXu3ugD3xDRzPuv9H8ZifPF5Jj3kHrLyydpjpEUzdMte9mByM3Om2UZ7d91PrgzpxY4dXN/5Jjdb3yyzoNg0tCDSR+Ohf1BFpZZZ5czjsK3bHsxFLKkvGUleyn6jt4mbTfhdDZkXqmvrnYowt8Nd3F3kjw+r3GW76G/hNffwXmsfJ1sxSEPSHSsJtNoqioxjQyCz+7AS99hTIxIa/zIQxGyt+3wBbhXGPBXy+x30xe759G/2mWBfrTBVlu9XPiezTrzl7Oh3EEDEcZaKE2rPUToDIxbgOyr1b8/xJS3g=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2164a13c-b7cd-4769-b936-08d7410665c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 15:46:42.8533 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ad6HcFDOhrYj7iEY8mOi8RMRzOBC7L6E7qeJTarhLOs1Edw7Lam8OJHwic20Y8Vl7PZxZDUeGwmD38MiBvbgmsgDck2Z50sKtFXmlHwJ5jg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4982
Subject: [Xen-devel] [PATCH v3 0/3] arch/arm: optee: fix TODOs and change
 status to "Tech Preview"
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyB0aGUgdGhpcmQgdmVyc2lvbiBvZiBtYXR1cmluZyB0aGUgT1AtVEVFIG1lZGlhdG9y
IHBhdGNoZXMuCgpDaGFuZ2VzIGFsc28gY2FuIGJlIHB1bGxlZCBmcm9tIFszXS4KCkNoYW5nZXMg
ZnJvbSB2MjoKIC0gVGhlIGZvbGxvd2luZyAzIHBhdGNoZXMgd2VyZSBjb21taXRlZDoKIHhlbi9h
cm06IG9wdGVlOiBpbXBvc2UgbGltaXQgb24gc2hhcmVkIGJ1ZmZlciBzaXplCiB4ZW4vYXJtOiBv
cHRlZTogY2hlY2sgZm9yIHByZWVtcHRpb24gd2hpbGUgZnJlZWluZyBzaGFyZWQgYnVmZmVycwog
eGVuL2FybTogb3B0ZWU6IGxpbWl0IG51bWJlciBvZiBzaGFyZWQgYnVmZmVycwogLSBPdGhlciBj
aGFuZ2VzIGFyZSBkZXNjcmliZWQgaW4gdGhlIGNvcnJlc3BvbmRpbmcgcGF0Y2hlcwoKQ2hhbmdl
cyBmcm9tIHYxOgogLSBBZGRlZCBwYXRjaCB0aGF0IHVwZGF0ZXMgU1VQUE9SVC5tZAogLSBJbnN0
ZWFkIG9mIHJlbW92aW5nICJleHBlcmltZW50YWwiIHN0YXR1cyBJIGNoYW5nZWQgaXQgdG8gIlRl
Y2ggUHJldmlldyIKIC0gT3RoZXIgY2hhbmdlcyBhcmUgZGVzY3JpYmVkIGluIHRoZSBjb3JyZXNw
b25kaW5nIHBhdGNoZXMKCkNvdmVyIGxldHRlciBmb3IgdjE6CgpUaGlzIHBhdGNoIHNlcmllcyBm
aXhlcyB2YXJpb3VzIHVuZmluaXNoZWQgaXRlbXMgaW4gdGhlIE9QLVRFRSBtZWRpYXRvci4KTW9z
dGx5IHRoaXMgaXMgYWJvdXQgbGltaXRpbmcgcmVzb3VyY2VzIHRoYXQgZ3Vlc3QgY2FuIGNvbnN1
bWUuIFRoaXMKaW5jbHVkZXMgYm90aCBtZW1vcnkgYW5kIHRpbWUgLSBob3cgbWFueSBidWZmZXJz
IGd1ZXN0IGNhbiBzaGFyZSB3aXRoCk9QLVRFRSAodGhpcyB1c2VzIFhlbiBtZW1vcnkpIGFuZCB3
aGVuIG1lZGlhdG9yIHNob3VsZCBwcmVlbXB0IGl0c2VsZiwKdG8gbWFrZSBzdXJlIHRoYXQgZ3Vl
c3QgZG9lcyBub3Qgc3RyZXNzIHNjaGVkdWxpbmcuCgpBcGFydCBmcm9tIHRoaXMsIHRoZXJlIHdl
cmUgb25lIGNhc2UsIHdoZW4gbWVkaWF0b3IncyBhY3Rpb25zIG1pZ2h0IGxlYWQKdG8gbWVtb3J5
IGxlYWsgaW4gYSBnb29kLWJlaGF2aW5nIGd1ZXN0LiBUbyBmaXggdGhpcyBpc3N1ZSBJIGhhZCB0
bwpleHRlbmQgbWVkaWF0b3IgbG9naWMsIHNvIG5vdyBpdCBjYW4gaXNzdWUgUlBDIHJlcXVlc3Rz
IHRvIGd1ZXN0IGluIHRoZQpzYW1lIHdheSwgYXMgT1AtVEVFIGRvZXMgdGhpcy4gVGhpcyBpcyB1
c2VmdWwgZmVhdHVyZSwgYmVjYXVzZSBpdAphbGxvd3MgdG8gcHJlZW1wdCBtZWRpYXRvciBkdXJp
bmcgbG9uZyBvcGVyYXRpb25zLiBTbywgaW4gdGhlIGZ1dHVyZQppdCB3aWxsIGJlIHBvc3NpYmxl
IHRvIHJlbW92ZSBzaGFyZWQgYnVmZmVyIHNpemUgbGltaXRhdGlvbiwgYmVjYXVzZQptZWRpYXRv
ciBjYW4gcHJlZW1wdCBzZWxmIGR1cmluZyBidWZmZXIgdHJhbnNsYXRpb24uCgpUaGlzIHBhdGNo
IHNlcmllcyBjYW4gYmUgcHVsbGVkIGZyb20gWzFdLgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9s
b3JjL3hlbi90cmVlL29wdGVlM192MQpbMl0gaHR0cHM6Ly9naXRodWIuY29tL2xvcmMveGVuL3Ry
ZWUvb3B0ZWUzX3YyClszXSBodHRwczovL2dpdGh1Yi5jb20vbG9yYy94ZW4vdHJlZS9vcHRlZTNf
djMKCgpWb2xvZHlteXIgQmFiY2h1ayAoMyk6CiAgeGVuL2FybTogb3B0ZWU6IGhhbmRsZSBzaGFy
ZWQgYnVmZmVyIHRyYW5zbGF0aW9uIGVycm9yCiAgU1VQUE9SVC5tZDogRGVzY3JpYmUgT1AtVEVF
IG1lZGlhdG9yCiAgeGVuL2FybTogb3B0ZWU6IHVwZGF0ZSBkZXNjcmlwdGlvbiBpbiBLY29uZmln
CgogU1VQUE9SVC5tZCAgICAgICAgICAgICAgIHwgICA0ICsKIHhlbi9hcmNoL2FybS90ZWUvS2Nv
bmZpZyB8ICAgOSArLQogeGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5jIHwgMTczICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAxNTEgaW5zZXJ0
aW9ucygrKSwgMzUgZGVsZXRpb25zKC0pCgotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs

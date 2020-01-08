Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD7C133C81
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 08:57:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ip6Az-0001VH-DH; Wed, 08 Jan 2020 07:54:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7w3v=25=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1ip6Ax-0001VC-9r
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 07:54:47 +0000
X-Inumbo-ID: 22f37b28-31ec-11ea-bf56-bc764e2007e4
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::605])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22f37b28-31ec-11ea-bf56-bc764e2007e4;
 Wed, 08 Jan 2020 07:54:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwSNQiTn9XNiH8gSvF+nhJoI+qlNarNqczJErMoOEiuA8EqgXvnPIfy+dMEYxHRl/epbVWcZXuKaubSL58jhE5+NJEdfLQbqZ4rL6B/ZELOFp07nA25pLkeWzWYRSdSsycNTtVvY3RxvEowtjLb5kdGkQu5X1aBZGb4+blheMThcCt/7G592YdSV/CEccFON5/5K0wwvtBfng1Q9XhnW71HfpizF0sPFoaGrQttbx9cc2sI3CVWRgoZ9BUxE0PWizR80e95+OpI+y4MDS/bpD8cJW/+0+wCqralEJ95JVSPY8bHCjPMmj9Sxv13UizMIyQSnoKMJknM6VaeDa5eM5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0tfw9WMBVlBSUHJSsxTFDwAILLJZqQdL2RKX4GkIgQ=;
 b=dVmI40rbymMPE3jRQoFZRQ1/q2CpO7WXJw3N8gocQYNQoGa1rY3uN0Xyu4Wv2kUqAy8USyqnZxhZmwmLwtSp8fwN32/K3yM7yfojuIQqqUL1PfIRS0l6bOP9ucolpnbQAETDKzw35BnGjxxGQbEnDXcK37JZdOus9SUaKJW7hwMQBiw3T71WINLsIcPW6cehsKyTxndvQVbsN+pLEEzkgXRBjHxZOWag4Q7bmBYhXrQt/GrLBHooYSOCozuxwg9ZT0Kccy3i7mUqDuiySiD6p3yHvHS47tSQkljRnY2pWuaIkhkoSlKiU+mlRlsAIvUrkWxiJ0UIbu6OZlnGmVTA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0tfw9WMBVlBSUHJSsxTFDwAILLJZqQdL2RKX4GkIgQ=;
 b=rjskzgAoA26xJvdLCX0p3Pvt0vsYCN+4FXZ3R0H+Esi6uIBqtaQ0a5UR6u0mgwlZjwFOGRbqhUIixm8D6pXEpMNZdHx5LmTKj1f/Xoe6Xp3FkN4D4VCU/JnHlogiSDXDIB/jBQO4gEl/FSB9MUuKJECdpAH/tBM/Ibz1QZYl6+8=
Received: from AM0PR03MB4516.eurprd03.prod.outlook.com (20.177.41.82) by
 AM0PR03MB3795.eurprd03.prod.outlook.com (52.135.146.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.12; Wed, 8 Jan 2020 07:54:44 +0000
Received: from AM0PR03MB4516.eurprd03.prod.outlook.com
 ([fe80::a489:598f:51af:6d59]) by AM0PR03MB4516.eurprd03.prod.outlook.com
 ([fe80::a489:598f:51af:6d59%4]) with mapi id 15.20.2602.015; Wed, 8 Jan 2020
 07:54:44 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Santucco
 <santucco@mail.ru>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] PV DRM doesn't work without auto_translated_physmap
 feature in Dom0
Thread-Index: AQHVxGy3Uy2wN4QJXkKZ2l02GEUbxafgaOyA
Date: Wed, 8 Jan 2020 07:54:44 +0000
Message-ID: <74664696-5e7e-8f01-e6c2-ca17f55d80e1@epam.com>
References: <1578297407.255542354@f149.i.mail.ru>
 <9ead165f-440a-31b7-c587-c228b8692a7e@suse.com>
In-Reply-To: <9ead165f-440a-31b7-c587-c228b8692a7e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Oleksandr_Andrushchenko@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf3bddc4-125d-4ec4-bd7a-08d7941006b8
x-ms-traffictypediagnostic: AM0PR03MB3795:
x-microsoft-antispam-prvs: <AM0PR03MB3795EB5BD07BE43D5DA09E73E73E0@AM0PR03MB3795.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02760F0D1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(366004)(39860400002)(376002)(189003)(199004)(2616005)(66946007)(76116006)(66556008)(66476007)(86362001)(64756008)(66446008)(186003)(31696002)(31686004)(6486002)(6506007)(110136005)(26005)(5660300002)(53546011)(6512007)(55236004)(66574012)(36756003)(81166006)(81156014)(8676002)(8936002)(478600001)(2906002)(966005)(71200400001)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3795;
 H:AM0PR03MB4516.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PZTyZ0VVb0YUF8C4CV14CKQcE5WpBF69afKdpqFCwfCkr5dDk1uNgGFss9PPb7yCiAUogmteY4Y9iwpqiKFsgwqV5yJcx6hZrnRfjKlbW72BI+Y6sV4EdRtzw4sSov5TvZaKJtTMj1CBrVW0+kTshgjP6imYphfveLI0Uymut3DUqviX79flswUaid+0MDNzM7n4QEdL7g6HehEETUOKmwunIvCtQmXIXjq89V3yKHAGV3UTgE+yLvC7fD4Uircd7Tpj3vPANuaTrwV9YyWQcdZjdGWYQm85UierXxC9Ic1G5vFHRppWKxFku+63v0FRHtnCoNToImcZMviaWi6gu3Ij4ZISQpDtPN4Gpg/LJ+QGHRbGy+bGRwgCDHDFo+2WK8slfR1EMbiY/gD4bjixHCS07vSYJRFQb6wRf6cQGrkiRCNe/1OzujOInlRobfyeZy7FdRVuyhhgTdO+piWGQFaEytUyWyoSc6DWhhJL1LtsEjRUjIINJPwLjvfj0VCXB+ixGk9diU9gOCLXRTl+6A==
x-ms-exchange-transport-forked: True
Content-ID: <35D1FDAFFE3610499FAC465B36EF41F1@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3bddc4-125d-4ec4-bd7a-08d7941006b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2020 07:54:44.8513 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MBVe0tGy9G2dPWqSmsrurbPSXlKf5QD4rDTcC2CACvNHZmjSefNywI90de3brF+kTkzrKil9ekXCIpelWxinSf7P7v7SvhEkbqDiBauqWomGEz4NSJHWh2hQcydUp+S/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3795
Subject: Re: [Xen-devel] PV DRM doesn't work without auto_translated_physmap
 feature in Dom0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS82LzIwIDEwOjM4IEFNLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPiBPbiAwNi4wMS4yMCAw
ODo1NiwgU2FudHVjY28gd3JvdGU6DQo+PiBIZWxsbywNCj4+DQo+PiBJ4oCZbSB0cnlpbmcgdG8g
dXNlIHZkaXNwbCBpbnRlcmZhY2UgZnJvbSBQViBPUywgaXQgZG9lc27igJl0IHdvcmsuDQo+PiBD
b25maWd1cmF0aW9uIGRldGFpbHM6DQo+PiDCoMKgwqDCoCBYZW4gNC4xMi4xDQo+PiDCoMKgwqDC
oCBEb20wOiBMaW51eCA0LjIwLjE3LWdlbnRvbyAjMTMgU01QIFNhdCBEZWMgMjggMTE6MTI6MjQg
TVNLIDIwMTkgDQo+PiB4ODZfNjQgSW50ZWwoUikgQ2VsZXJvbihSKSBDUFUgTjMwNTAgQCAxLjYw
R0h6IEdlbnVpbmVJbnRlbCBHTlUvTGludXgNCj4+IMKgwqDCoMKgIERvbVU6IHg4NsKgUGxhbjks
IFBWDQo+PiDCoMKgwqDCoCBkaXNwbF9iZSBhcyBhIGJhY2tlbmQgZm9yIHZkaXNwbCBhbmQgdmti
DQo+Pg0KPj4gd2hlbiBWTSBzdGFydHMsIGRpc3BsX2JlIHJlcG9ydHMgYWJvdXQgYW4gZXJyb3I6
DQo+PiBnbnR0YWI6IGVycm9yOiBpb2N0bCBETUFCVUZfRVhQX0ZST01fUkVGUyBmYWlsZWQ6IElu
dmFsaWQgYXJndW1lbnQgDQo+PiAoZGlzcGxfYmUubG9nOjIyMSkNCj4+DQo+PiByZWxhdGVkwqBE
b20wIG91dHB1dCBpczoNCj4+IFvCoCAxOTEuNTc5Mjc4XSBDYW5ub3QgcHJvdmlkZSBkbWEtYnVm
OiB1c2VfcHRlbW9kZSAxIA0KPj4gKGRtZXNnLmNyZWF0ZS5sb2c6MTIzKQ0KPg0KPiBUaGlzIHNl
ZW1zIHRvIGJlIGEgbGltaXRhdGlvbiBvZiB0aGUgeGVuIGRtYS1idWYgZHJpdmVyLiBJdCB3YXMg
d3JpdHRlbg0KPiBmb3IgYmVpbmcgdXNlZCBvbiBBUk0gaW5pdGlhbGx5IHdoZXJlIFBWIGlzIG5v
dCBhdmFpbGFibGUuDQpUaGlzIGlzIHRydWUgYW5kIHdlIG5ldmVyIHRyaWVkL3RhcmdldGVkIFBW
IGRvbWFpbnMgd2l0aCB0aGlzIA0KaW1wbGVtZW50YXRpb24sDQpzbyBpZiB0aGVyZSBpcyBhIG5l
ZWQgZm9yIHRoYXQgc29tZW9uZSBoYXMgdG8gdGFrZSBhIGxvb2sgb24gdGhlIHByb3Blcg0KaW1w
bGVtZW50YXRpb24gZm9yIFBWLi4uDQo+DQo+IENDLWluZyBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3aG8gaXMgdGhlIGF1dGhvciBvZiB0aGF0IGRyaXZlci4gSGUNCj4gc2hvdWxkIGJlIGFibGUg
dG8gdGVsbCB1cyB3aGF0IHdvdWxkIGJlIG5lZWRlZCB0byBlbmFibGUgUFYgZG9tMC4NCj4NCj4g
RGVwZW5kaW5nIG9uIHlvdXIgdXNlIGNhc2UgaXQgbWlnaHQgYmUgcG9zc2libGUgdG8gdXNlIFBW
SCBkb20wLCBidXQNCj4gc3VwcG9ydCBmb3IgdGhpcyBtb2RlIGlzICJleHBlcmltZW50YWwiIG9u
bHkgYW5kIHNvbWUgZmVhdHVyZXMgYXJlIG5vdA0KPiB5ZXQgd29ya2luZy4NCj4NCldlbGwsIG9u
ZSBvZiB0aGUgd29ya2Fyb3VuZHMgcG9zc2libGUgaXMgdG8gZHJvcCB6ZXJvLWNvcHlpbmcgdXNl
LWNhc2UNCih0aGlzIGlzIHdoeSBkaXNwbGF5IGJhY2tlbmQgdHJpZXMgdG8gY3JlYXRlIGRtdS1i
dWZzIGZyb20gZ3JhbnRzIHBhc3NlZA0KYnkgdGhlIGd1ZXN0IGRvbWFpbiBhbmQgZmFpbHMgYmVj
YXVzZSBvZiAiQ2Fubm90IHByb3ZpZGUgZG1hLWJ1ZjogDQp1c2VfcHRlbW9kZSAxIikNClNvLCBp
biB0aGlzIGNhc2UgZGlzcGxheSBiYWNrZW5kIHdpbGwgZG8gbWVtb3J5IGNvcHlpbmcgZm9yIHRo
ZSBpbmNvbWluZyANCmZyYW1lcw0KYW5kIHdvbid0IHRvdWNoIERNQUJVRl9FWFBfRlJPTV9SRUZT
IGlvY3RsLg0KVG8gZG8gc28ganVzdCBkaXNhYmxlIHplcm8tY29weWluZyB3aGlsZSBidWlsZGlu
ZyB0aGUgYmFja2VuZCBbMV0NCj4NCj4gSnVlcmdlbg0KPg0KWzFdIGh0dHBzOi8vZ2l0aHViLmNv
bS94ZW4tdHJvb3BzL2Rpc3BsX2JlL2Jsb2IvbWFzdGVyL0NNYWtlTGlzdHMudHh0I0wxMg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A3FA5179
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 10:22:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4hZR-0004E8-Hp; Mon, 02 Sep 2019 08:20:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R1Xd=W5=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i4hZQ-0004E3-Cz
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 08:20:16 +0000
X-Inumbo-ID: 7d995fb2-cd5a-11e9-8980-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d995fb2-cd5a-11e9-8980-bc764e2007e4;
 Mon, 02 Sep 2019 08:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567412415;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Pz+m99SJ1+TfCDjg921rB19YGVnLgMWP9WZEZZWgdiw=;
 b=ELFpxjFRY1aUVnh17KcqqvOAs/TX6JRU8BGKk5thy0du9Cg4EORH9oMD
 k4ceMLENUawyJIf6W7ANFefOY87FCymht9oEKzTKspB+z3qcmO9vPZQTO
 DGjmUxirIyQxTGk5/J+bMct0YP89fhc8uzkCSVUXANTIqw+RZUZJXsHDE c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 992Vf4so+MqBMyIUM6R6n9eT23tRvAfB5J5+jxqZCb32Y5b76YSk/J+S/K9DgSQU0k0vjOpCWQ
 dlD46ccpCEclm9DAffL5w+TmYOrwJFoggpd3W7YkrNt37GyTh847rN94ekhQlGpu6DvR7zRkzw
 LniEOf+So5e3jog3CMZMGMzYzrdsR6nasGRBgLMRJR41tq9MzUbXFo4LOJBU0dD7LWbOuu/tKO
 E26HrXib+QbjjWuv+K2G6ailGgsLJKInxFN431lub6zmxHf/ktOkyfFuG6uAaTQ7PpOrGMTYqc
 OPQ=
X-SBRS: 2.7
X-MesageID: 5274963
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,457,1559534400"; 
   d="scan'208";a="5274963"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Steven Haigh' <netwiz@crc.id.au>
Thread-Topic: Windows HVM no longer boots with AMD Ryzen 3700X (and 3900X)
Thread-Index: AQHVYS/C+HQxXSiQEUCMz+59RzWjzqcXfpcAgACHy+D//+D4gIAAIyfg
Date: Mon, 2 Sep 2019 08:20:11 +0000
Message-ID: <b3b0c2de1e364adea566eb961ba3d727@AMSPEX02CL03.citrite.net>
References: <51bd31f9-4fb1-84b5-7b9b-983b53133148@posteo.de>
 <a2fecd7b-a035-48b4-ed18-cd3234be8d58@citrix.com>
 <53c70f32-9ae6-a9f8-6472-5e49d01ce2b0@posteo.de>
 <1b95b3f8-b822-1f1c-243f-728e7967d04f@citrix.com>
 <1dfc79fa-acde-40af-704d-be3289fdd133@posteo.de>
 <71fad1413643be2df5f2291270b60448@crc.id.au>
 <cbbfaf3c5d4e12358c635054198bce17@crc.id.au>
 <869a473b1f7342c48f2198e46b6c8427@AMSPEX02CL03.citrite.net>
 <2d859d487c294b8d98749dccaf735c96@crc.id.au>
In-Reply-To: <2d859d487c294b8d98749dccaf735c96@crc.id.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] Windows HVM no longer boots with AMD Ryzen 3700X
 (and 3900X)
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Andreas Kinzler <hfp@posteo.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGV2ZW4gSGFpZ2ggPG5ldHdp
ekBjcmMuaWQuYXU+DQo+IFNlbnQ6IDAyIFNlcHRlbWJlciAyMDE5IDA5OjA5DQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogQW5kcmVhcyBLaW56bGVy
IDxoZnBAcG9zdGVvLmRlPjsgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNv
bT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFdp
bmRvd3MgSFZNIG5vIGxvbmdlciBib290cyB3aXRoIEFNRCBSeXplbiAzNzAwWCAoYW5kIDM5MDBY
KQ0KPiANCj4gT24gMjAxOS0wOS0wMiAxODowNCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+PiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGdXJ0aGVyIHRvIHRoZSBhYm92ZSwgSSBk
aWQgc29tZSBleHBlcmltZW50YXRpb24uIFRoZSBmb2xsb3dpbmcgaXMgYQ0KPiA+PiBsaXN0IG9m
IGF0dGVtcHRlZCBib290IGNvbmZpZ3VyYXRpb25zIGFuZCB0aGVpciBvdXRjb21lczoNCj4gPj4N
Cj4gPj4gdmlyaWRpYW49MQ0KPiA+PiB2Y3B1cz00DQo+ID4+IFNUT1BDT0RFOiBIQUwgTUVNT1JZ
IEFMTE9DQVRJT04NCj4gPj4NCj4gPj4gdmlyaWRpYW49MA0KPiA+PiB2Y3B1cz00DQo+ID4+IFNU
T1BDT0RFOiBNVUxUSVBST0NFU1NPUl9DT05GSUdVUkFUSU9OX05PVF9TVVBQT1JURUQNCj4gPj4N
Cj4gPj4gdmlyaWRpYW49MA0KPiA+PiB2Y3B1cz0xDQo+ID4+IEJvb3QgT0sgLSBnZXQgdG8gV2lu
ZG93cyBTZXJ2ZXIgMjAxNiBsb2dpbiBldGMNCj4gPj4NCj4gPg0KPiA+IEFuZCB0byBjb21wbGV0
ZSB0aGUgc2V0LCBob3cgYWJvdXQgdmlyaWRpYW49MSB2Y3B1cz0xPw0KPiANCj4gQW55IHZjcHVz
IHZhbHVlIHdoZXJlIHZpcmlkaWFuPTEgaXMgdXNlZCBjcmVhdGVzIGEgSEFMIE1FTU9SWSBBTExP
Q0FUSU9ODQo+IHN0b3Bjb2RlIHdoZW4gdHJ5aW5nIHRvIGJvb3QgV2luZG93cy4NCg0KT2ssIHNv
IEkgZ3Vlc3MgdGhhdCBpc3N1ZSBoaXRzIGZpcnN0IGFuZCwgb25seSBpZiB5b3UgZ2V0IGJleW9u
ZCB0aGF0IGRvIHlvdSBoaXQgdGhlIG11bHRpcHJvY2Vzc29yIHByb2JsZW0uDQoNClRoZSB2aXJp
ZGlhbiBvcHRpb24gaXMgbm90IGFjdHVhbGx5IGEgYm9vbGVhbiBhbnkgbW9yZSAodGhhdCBpbnRl
cnByZXRhdGlvbiBpcyBqdXN0IGZvciBjb21wYXQpIHNvIGl0IHdvdWxkIGJlIGEgZ29vZCBkYXRh
cG9pbnQgdG8ga25vdyB3aGljaCBvZiB0aGUgZW5saWdodGVubWVudHMgY2F1c2VzIHRoZSBjaGFu
Z2UgaW4gYmVoYXZpb3VyLiBDb3VsZCB5b3UgdHJ5IHZpcmlkaWFuPVsnYmFzZSddIHRvIHNlZSBp
ZiB0aGF0J3Mgc3VmZmljaWVudCB0byBjYXVzZSB0aGUgcHJvYmxlbT8gKEknbSBndWVzc2luZyBp
dCBwcm9iYWJseSBpcyBidXQgaXQgd291bGQgYmUgZ29vZCB0byBrbm93KS4NCg0KICBQYXVsDQoN
Cj4gDQo+IC0tDQo+IFN0ZXZlbiBIYWlnaA0KPiANCj4gPyBuZXR3aXpAY3JjLmlkLmF1ICAgICA/
IGh0dHA6Ly93d3cuY3JjLmlkLmF1DQo+ID8gKzYxICgzKSA5MDAxIDYwOTAgICAgPyAwNDEyIDkz
NSA4OTcNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A893111041A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 19:14:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icCdt-0002gY-Fd; Tue, 03 Dec 2019 18:11:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X1Vu=ZZ=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1icCds-0002gQ-8B
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 18:11:20 +0000
X-Inumbo-ID: 4dfb3f64-15f8-11ea-83b8-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4dfb3f64-15f8-11ea-83b8-bc764e2007e4;
 Tue, 03 Dec 2019 18:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575396680;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XJHr3YKdL8bDT02UeoZbdTmruSXmJ2QaBCsic1HSo0Q=;
 b=SgRpOhEEsVYH96hZk+RHo2PvS6ej2OWlZfLoEXVffLKv1VklDTtodsw/
 KgUq7/S4/DcVpCTX/aOk9GslKZR7SRRhD8JrT30GEvcjVfIsopAW5bsAy
 P+0DS/G4fpa1TbJ6/FZuhl7krWEYK1MabNQUiUWskMO+6W9Op9S4ClJav w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DDVUUuf9S1FX4yOMCT0wBa2w0OCW1NVuyOD7NWTrO1P7NqPsvu+b8cyTxbUMcnAm4vUtCU2dhQ
 0K+LisiytY2suuQ9qM7nmn0ggRsIdiirai9MSEJTLOFNhdGsHbh7KAi80m1dPgpK6lEkz5C5Pk
 wQ1AebDtiygf1DAwqHIPEfCcq3lYj4bI0VgsejiV5pE0FTBlWMQ9XxYuTXKDNft80+e8wdrIDr
 8ERxP0hKqkrke0/tS6zWEXagbreKWep8ZXvtsjLHq6mAjoywJ5V7rupmCMXhRovpmSM3ycrCiz
 XrU=
X-SBRS: 2.7
X-MesageID: 9146534
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,274,1571716800"; 
   d="scan'208";a="9146534"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Thread-Topic: [PATCH v2 01/22] golang/xenlight: generate enum types from IDL
Thread-Index: AQHVm+0tDakQTCT0QUydM8eSWq4NKqeowXyA
Date: Tue, 3 Dec 2019 18:11:15 +0000
Message-ID: <7B18F824-B031-4AA5-AD91-6CAA199FC1AA@citrix.com>
References: <cover.1573840473.git.rosbrookn@ainfosec.com>
 <6beae3799201ad3ad5292e08fa32861f2a1a320c.1573840474.git.rosbrookn@ainfosec.com>
In-Reply-To: <6beae3799201ad3ad5292e08fa32861f2a1a320c.1573840474.git.rosbrookn@ainfosec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3601.0.10)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <46A6656A386DB3409FBA3472FC66E956@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 01/22] golang/xenlight: generate enum
 types from IDL
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "kerriganb@ainfosec.com" <kerriganb@ainfosec.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIE5vdiAxNSwgMjAxOSwgYXQgNzo0NCBQTSwgTmljayBSb3Nicm9vayA8cm9zYnJvb2tu
QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBGcm9tOiBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25A
YWluZm9zZWMuY29tPg0KPiANCj4gSW50cm9kdWNlIGdlbmdvdHlwZXMucHkgdG8gZ2VuZXJhdGUg
R28gY29kZSB0aGUgZnJvbSBJREwuIEFzIGEgZmlyc3Qgc3RlcCwNCj4gaW1wbGVtZW50ICdlbnVt
JyB0eXBlIGdlbmVyYXRpb24uDQo+IA0KPiBBcyBhIHJlc3VsdCBvZiB0aGUgbmV3bHktZ2VuZXJh
dGVkIGNvZGUsIHJlbW92ZSB0aGUgZXhpc3RpbmcsIGFuZCBub3cNCj4gY29uZmxpY3RpbmcgZGVm
aW5pdGlvbnMgaW4geGVubGlnaHQuZ28uIEluIHRoZSBjYXNlIG9mIHRoZSBFcnJvciB0eXBlLA0K
PiByZW5hbWUgdGhlIHNsaWNlICdlcnJvcnMnIHRvICdsaWJ4bEVycm9ycycgc28gdGhhdCBpdCBk
b2VzIG5vdCBjb25mbGljdA0KPiB3aXRoIHRoZSBzdGFuZGFyZCBsaWJyYXJ5IHBhY2thZ2UgJ2Vy
cm9ycy4nIEFuZCwgbmVnYXRlIHRoZSB2YWx1ZXMgdXNlZA0KPiBpbiAnbGlieGxFcnJvcnMnIHNp
bmNlIHRoZSBnZW5lcmF0ZWQgZXJyb3IgdmFsdWVzIGFyZSBuZWdhdGl2ZS4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IE5pY2sgUm9zYnJvb2sgPHJvc2Jyb29rbkBhaW5mb3NlYy5jb20+DQo+IC0tLQ0K
PiBDaGFuZ2VzIGluIHYyOg0KPiAtIEludHJvZHVjZSBNYWtlZmlsZSB0YXJnZXRzIGZvciBjb2Rl
IGdlbmVyYXRpb24NCj4gLSBSZS1nZW5lcmF0ZSBHbyBjb2RlIChpbmNsdWRlcyBuZXcgbGlieGxf
cGFzc3RyaG91Z2ggZW51bSkuIA0KPiAtIFVzZSAqLmdlbi5nbyBuYW1pbmcgY29udmVudGlvbiBm
b3IgZ2VuZXJhdGVkIEdvIGZpbGVzLg0KPiANCj4gdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L01ha2Vm
aWxlICAgICAgfCAgMTggKy0NCj4gdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L2dlbmdvdHlwZXMucHkg
fCAxMDkgKysrKysrKysNCj4gdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3R5cGVzLmdlbi5nbyAgfCAz
ODggKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiB0b29scy9nb2xhbmcveGVubGlnaHQv
eGVubGlnaHQuZ28gICB8IDE0MCArKy0tLS0tLS0tDQo+IDQgZmlsZXMgY2hhbmdlZCwgNTM1IGlu
c2VydGlvbnMoKyksIDEyMCBkZWxldGlvbnMoLSkNCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xz
L2dvbGFuZy94ZW5saWdodC9nZW5nb3R5cGVzLnB5DQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29s
cy9nb2xhbmcveGVubGlnaHQvdHlwZXMuZ2VuLmdvDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMv
Z29sYW5nL3hlbmxpZ2h0L01ha2VmaWxlIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L01ha2VmaWxl
DQo+IGluZGV4IDA5ODczMDUyMjQuLjY4MWYzMmMyMzQgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL2dv
bGFuZy94ZW5saWdodC9NYWtlZmlsZQ0KPiArKysgYi90b29scy9nb2xhbmcveGVubGlnaHQvTWFr
ZWZpbGUNCj4gQEAgLTcsMjAgKzcsMjEgQEAgR09DT0RFX0RJUiA/PSAkKHByZWZpeCkvc2hhcmUv
Z29jb2RlLw0KPiBHT1hMX1BLR19ESVIgPSAvc3JjLyQoWEVOX0dPQ09ERV9VUkwpL3hlbmxpZ2h0
Lw0KPiBHT1hMX0lOU1RBTExfRElSID0gJChHT0NPREVfRElSKSQoR09YTF9QS0dfRElSKQ0KPiAN
Cj4gLSMgUEtHU09VUkNFUzogRmlsZXMgd2hpY2ggY29tcHJpc2UgdGhlIGRpc3RyaWJ1dGVkIHNv
dXJjZSBwYWNrYWdlDQo+IC1QS0dTT1VSQ0VTID0geGVubGlnaHQuZ28NCj4gLQ0KPiBHTyA/PSBn
bw0KPiANCj4gLlBIT05ZOiBhbGwNCj4gYWxsOiBidWlsZA0KPiANCj4gLlBIT05ZOiBwYWNrYWdl
DQo+IC1wYWNrYWdlOiAkKFhFTl9HT1BBVEgpJChHT1hMX1BLR19ESVIpJChQS0dTT1VSQ0VTKQ0K
PiArcGFja2FnZTogJChYRU5fR09QQVRIKSQoR09YTF9QS0dfRElSKQ0KPiANCj4gLSQoWEVOX0dP
UEFUSCkvc3JjLyQoWEVOX0dPQ09ERV9VUkwpL3hlbmxpZ2h0LyQoUEtHU09VUkNFUyk6ICQoUEtH
U09VUkNFUykNCj4gKyQoWEVOX0dPUEFUSCkvc3JjLyQoWEVOX0dPQ09ERV9VUkwpL3hlbmxpZ2h0
LzogJS5nZW4uZ28NCj4gCSQoSU5TVEFMTF9ESVIpICQoWEVOX0dPUEFUSCkkKEdPWExfUEtHX0RJ
UikNCj4gLQkkKElOU1RBTExfREFUQSkgJChQS0dTT1VSQ0VTKSAkKFhFTl9HT1BBVEgpJChHT1hM
X1BLR19ESVIpDQo+ICsJJChJTlNUQUxMX0RBVEEpIHhlbmxpZ2h0LmdvICQoWEVOX0dPUEFUSCkk
KEdPWExfUEtHX0RJUikNCj4gKwkkKElOU1RBTExfREFUQSkgdHlwZXMuZ2VuLmdvICQoWEVOX0dP
UEFUSCkkKEdPWExfUEtHX0RJUikNCj4gKw0KPiArJS5nZW4uZ286IGdlbmdvdHlwZXMucHkgJChY
RU5fUk9PVCkvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsICQoWEVOX1JPT1QpL3Rvb2xzL2xp
YnhsL2lkbC5weQ0KPiArCVhFTl9ST09UPSQoWEVOX1JPT1QpICQoUFlUSE9OKSBnZW5nb3R5cGVz
LnB5IC4uLy4uL2xpYnhsL2xpYnhsX3R5cGVzLmlkbA0KDQpUaGlzIHNlZW1zIHRvIGFsd2F5cyBy
dW4gZ2VuZ290eXBlcy5weSBhbmQgYWx3YXlzIGRvIHRoZSDigJhpbnN0YWxs4oCZIGhlcmUsIHJl
Z2FyZGxlc3Mgb2Ygd2hldGhlciBhbnl0aGluZyBoYXMgY2hhbmdlZCBvciBub3QuICBJIHRoaW5r
IHRoYXTigJlzIHByb2JhYmx5IGZpbmUgZm9yIG5vdywgYnV0IGl0IG1pZ2h0IGJlIG5pY2UgYXQg
c29tZSBwb2ludCB0byBtYWtlIGl0IG1vcmUgZGVwZW5kZW5jeS1kcml2ZW4uDQoNClRoYXQgc2Fp
ZDoNCg0KUmV2aWV3ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNv
bT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

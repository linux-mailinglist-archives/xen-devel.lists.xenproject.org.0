Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B20E5CE03
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 12:56:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiGPW-0005bA-Ty; Tue, 02 Jul 2019 10:53:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A/Ug=U7=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hiGPV-0005b3-6m
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 10:53:17 +0000
X-Inumbo-ID: 96b0e1b0-9cb7-11e9-822e-8faaff2cd23a
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 96b0e1b0-9cb7-11e9-822e-8faaff2cd23a;
 Tue, 02 Jul 2019 10:53:13 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rKhJCS+nMRDt6Syk+M+3iGaUTa882Bb3m8lvQ6JY+81Uq7HVvjmu6wGTqDLLCgcI/qnJj3mbQ8
 ruRBDDlZe88LBRY/eXFvlspH3bHNgFVw38YHVaFw11S8x2L6dRrTypVT208h/wOm2oZGbb55w8
 v9ygu9FBdJDlzEdiTc7D6UAut41dbJcm1qWJZQa4oPDfy4DqlsHgi56fyXiW/iuJdUWRnmFGwm
 aStx6mp4qNfwU4Dg3RkxQ/NXgVf9Zgd807d5PDIm/Unm8mdeqQrsn2NwtLFWEPW++eGeJN+Hdn
 JnE=
X-SBRS: 2.7
X-MesageID: 2483800
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,443,1557201600"; 
   d="scan'208";a="2483800"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 1/6] x86emul: generalize wbinvd() hook
Thread-Index: AQHVMAVkKhByd04q0k2rjesQjIAqKaa3HwAw///nOwCAACI2cA==
Date: Tue, 2 Jul 2019 10:53:10 +0000
Message-ID: <0d62b2ad8a4d42c8b985be13a86320c0@AMSPEX02CL03.citrite.net>
References: <2d69ac51-9c4a-96f9-fd37-578658076571@suse.com>
 <3f30c73d-94a7-f9ca-5914-0400f1f98cc3@suse.com>
 <66a6b048ef29468c87138e55eeb68e10@AMSPEX02CL03.citrite.net>
 <106174e9-de40-d41f-94d3-baaf74cd8d7d@suse.com>
In-Reply-To: <106174e9-de40-d41f-94d3-baaf74cd8d7d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/6] x86emul: generalize wbinvd() hook
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAyIEp1bHkgMjAxOSAxMTo1MA0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZw0KPiBDYzogQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFJv
Z2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1DQo+IDx3bEB4ZW4u
b3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvNl0geDg2ZW11bDogZ2VuZXJhbGl6ZSB3Ymlu
dmQoKSBob29rDQo+IA0KPiBPbiAwMi4wNy4yMDE5IDEyOjIyLCBQYXVsIER1cnJhbnQgd3JvdGU6
DQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gU2VudDog
MDEgSnVseSAyMDE5IDEyOjU2DQo+ID4+DQo+ID4+IEBAIC0yMTQ5LDEwICsyMTQ3LDY1IEBAIHN0
YXRpYyBpbnQgaHZtZW11bF93cml0ZV9tc3IoDQo+ID4+ICAgICAgICByZXR1cm4gcmM7DQo+ID4+
ICAgIH0NCj4gPj4NCj4gPj4gLXN0YXRpYyBpbnQgaHZtZW11bF93YmludmQoDQo+ID4+ICtzdGF0
aWMgaW50IGh2bWVtdWxfY2FjaGVfb3AoDQo+ID4+ICsgICAgZW51bSB4ODZlbXVsX2NhY2hlX29w
IG9wLA0KPiA+PiArICAgIGVudW0geDg2X3NlZ21lbnQgc2VnLA0KPiA+PiArICAgIHVuc2lnbmVk
IGxvbmcgb2Zmc2V0LA0KPiA+PiAgICAgICAgc3RydWN0IHg4Nl9lbXVsYXRlX2N0eHQgKmN0eHQp
DQo+ID4+ICAgIHsNCj4gPj4gLSAgICBhbHRlcm5hdGl2ZV92Y2FsbChodm1fZnVuY3Mud2JpbnZk
X2ludGVyY2VwdCk7DQo+ID4+ICsgICAgc3RydWN0IGh2bV9lbXVsYXRlX2N0eHQgKmh2bWVtdWxf
Y3R4dCA9DQo+ID4+ICsgICAgICAgIGNvbnRhaW5lcl9vZihjdHh0LCBzdHJ1Y3QgaHZtX2VtdWxh
dGVfY3R4dCwgY3R4dCk7DQo+ID4+ICsgICAgdW5zaWduZWQgbG9uZyBhZGRyLCByZXBzID0gMTsN
Cj4gPj4gKyAgICB1aW50MzJfdCBwZmVjID0gUEZFQ19wYWdlX3ByZXNlbnQ7DQo+ID4+ICsgICAg
aW50IHJjOw0KPiA+PiArICAgIHZvaWQgKm1hcHBpbmc7DQo+ID4+ICsNCj4gPj4gKyAgICBpZiAo
ICFjYWNoZV9mbHVzaF9wZXJtaXR0ZWQoY3VycmVudC0+ZG9tYWluKSApDQo+ID4+ICsgICAgICAg
IHJldHVybiBYODZFTVVMX09LQVk7DQo+ID4+ICsNCj4gPj4gKyAgICBzd2l0Y2ggKCBvcCApDQo+
ID4+ICsgICAgew0KPiA+PiArICAgIGNhc2UgeDg2ZW11bF9jbGZsdXNoOg0KPiA+PiArICAgIGNh
c2UgeDg2ZW11bF9jbGZsdXNob3B0Og0KPiA+PiArICAgIGNhc2UgeDg2ZW11bF9jbHdiOg0KPiA+
PiArICAgICAgICBBU1NFUlQoIWlzX3g4Nl9zeXN0ZW1fc2VnbWVudChzZWcpKTsNCj4gPj4gKw0K
PiA+PiArICAgICAgICByYyA9IGh2bWVtdWxfdmlydHVhbF90b19saW5lYXIoc2VnLCBvZmZzZXQs
IDAsICZyZXBzLA0KPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aHZtX2FjY2Vzc19yZWFkLCBodm1lbXVsX2N0eHQsICZhZGRyKTsNCj4gPj4gKyAgICAgICAgaWYg
KCByYyAhPSBYODZFTVVMX09LQVkgKQ0KPiA+PiArICAgICAgICAgICAgYnJlYWs7DQo+ID4+ICsN
Cj4gPj4gKyAgICAgICAgaWYgKCBodm1lbXVsX2N0eHQtPnNlZ19yZWdbeDg2X3NlZ19zc10uZHBs
ID09IDMgKQ0KPiA+PiArICAgICAgICAgICAgcGZlYyB8PSBQRkVDX3VzZXJfbW9kZTsNCj4gPj4g
Kw0KPiA+PiArICAgICAgICBtYXBwaW5nID0gaHZtZW11bF9tYXBfbGluZWFyX2FkZHIoYWRkciwg
MCwgcGZlYywgaHZtZW11bF9jdHh0LA0KPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY3VycmVudC0+YXJjaC5odm0uZGF0YV9jYWNoZSk7DQo+ID4+ICsgICAg
ICAgIGlmICggbWFwcGluZyA9PSBFUlJfUFRSKH5YODZFTVVMX0VYQ0VQVElPTikgKQ0KPiA+PiAr
ICAgICAgICAgICAgcmV0dXJuIFg4NkVNVUxfRVhDRVBUSU9OOw0KPiANCj4gVGhpcyByZXR1cm4g
Li4uDQo+IA0KPiA+PiArICAgICAgICBpZiAoIElTX0VSUl9PUl9OVUxMKG1hcHBpbmcpICkNCj4g
Pj4gKyAgICAgICAgICAgIGJyZWFrOw0KPiA+PiArDQo+ID4+ICsgICAgICAgIGlmICggY3B1X2hh
c19jbGZsdXNoICkNCj4gPj4gKyAgICAgICAgew0KPiA+PiArICAgICAgICAgICAgaWYgKCBvcCA9
PSB4ODZlbXVsX2Nsd2IgJiYgY3B1X2hhc19jbHdiICkNCj4gPj4gKyAgICAgICAgICAgICAgICBj
bHdiKG1hcHBpbmcpOw0KPiA+PiArICAgICAgICAgICAgZWxzZSBpZiAoIG9wID09IHg4NmVtdWxf
Y2xmbHVzaG9wdCAmJiBjcHVfaGFzX2NsZmx1c2hvcHQgKQ0KPiA+PiArICAgICAgICAgICAgICAg
IGNsZmx1c2hvcHQobWFwcGluZyk7DQo+ID4+ICsgICAgICAgICAgICBlbHNlDQo+ID4+ICsgICAg
ICAgICAgICAgICAgY2xmbHVzaChtYXBwaW5nKTsNCj4gPj4gKw0KPiA+PiArICAgICAgICAgICAg
aHZtZW11bF91bm1hcF9saW5lYXJfYWRkcihtYXBwaW5nLCBhZGRyLCAwLCBodm1lbXVsX2N0eHQp
Ow0KPiA+PiArICAgICAgICAgICAgYnJlYWs7DQo+ID4+ICsgICAgICAgIH0NCj4gPj4gKw0KPiA+
PiArICAgICAgICBodm1lbXVsX3VubWFwX2xpbmVhcl9hZGRyKG1hcHBpbmcsIGFkZHIsIDAsIGh2
bWVtdWxfY3R4dCk7DQo+ID4NCj4gPiBTaW5jZSB0aGUgbWFwcGluZyBpcyBkaXRjaGVkIGhlcmUs
IHdoeSBib3RoZXIgZ2V0dGluZyBvbmUgYXQgYWxsIGluIHRoZQ0KPiA+ICFjcHVfaGFzX2NsZmx1
c2ggY2FzZT8gQXJlIHlvdSB0cnlpbmcgdG8gZmx1c2ggb3V0IGFuIGVycm9yIGNvbmRpdGlvbj4g
dGhhdCB3YXMgcHJldmlvdXNseSBtaXNzZWQ/DQo+IA0KPiAuLi4gaXMgd2hhdCBJJ20gYWZ0ZXI6
IFdlIHdhbnQgZXhjZXB0aW9uIGJlaGF2aW9yIHRvIGJlIGNvcnJlY3QuDQo+IA0KDQpPaywgZmFp
ciBlbm91Z2guIEp1c3Qgd2Fzbid0IG9idmlvdXMgdG8gbWUgZnJvbSB0aGUgY29tbWl0IGNvbW1l
bnQuDQoNCiAgUGF1bA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==

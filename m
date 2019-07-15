Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD8D687FD
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 13:13:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmyrK-0004sH-NA; Mon, 15 Jul 2019 11:09:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gpPh=VM=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hmyrJ-0004sC-PC
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 11:09:29 +0000
X-Inumbo-ID: 01dcafa8-a6f1-11e9-9e5f-5fb0307b72b1
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01dcafa8-a6f1-11e9-9e5f-5fb0307b72b1;
 Mon, 15 Jul 2019 11:09:26 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: oya0moacqCX5bOVAXwmSBdmDR2uNH4CLLa5TnxbjwiUzuDs9W8VlT1ofEnChgxFZnFFHw+E5TK
 i6Y+Nva4yrXFgCzbe4Za3rrC+ppv6/EVxUj+MEjxoRI5V654Z2U6tmH00iHTcIjh+Ux4GJgbEZ
 sSDADrvgGC7e7P+iEO0yZT4R0JPsew7d4jLZJ//w0ksHjDUI5sAQJt+0cjY/nQu2WH6CC7XJiM
 0cKyc1WGyhy11LOSL641LGhuuG6jZ4j0pnTG7QJlRIwJTuTKQ4prWuzDFi8uIN9nJzYCzzY2F5
 xrY=
X-SBRS: 2.7
X-MesageID: 2992562
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="2992562"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [PATCH v2] xen/mm.h: add helper function to test-and-clear
 _PGC_allocated
Thread-Index: AQHVOu45CJOv6wo0GUahePXEsKRr6KbLRrMAgAAngBD//+7QAIAAJ+2w
Date: Mon, 15 Jul 2019 11:09:22 +0000
Message-ID: <78c70a2ccd39416dbfc1999ae7f0f524@AMSPEX02CL03.citrite.net>
References: <20190715091756.39065-1-paul.durrant@citrix.com>
 <1bdac424-c50e-309a-7a5b-125dbebf4a06@suse.com>
 <4a5720ffb5304255a58a83011bf02aa0@AMSPEX02CL03.citrite.net>
 <cc854558-db7a-9098-6dc8-ca3936a18355@suse.com>
In-Reply-To: <cc854558-db7a-9098-6dc8-ca3936a18355@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] xen/mm.h: add helper function to
 test-and-clear _PGC_allocated
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 JulienGrall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <Ian.Jackson@citrix.com>, VolodymyrBabchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDE1IEp1bHkgMjAxOSAxMTo0NA0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IEp1bGllbkdyYWxsIDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT47IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+
OyBHZW9yZ2UgRHVubGFwDQo+IDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3Nv
biA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uZQ0KPiA8cm9nZXIucGF1
QGNpdHJpeC5jb20+OyBWb2xvZHlteXJCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNv
bT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrDQo+IDxrb25y
YWQud2lsa0BvcmFjbGUuY29tPjsgVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29t
PjsgVGltIChYZW4ub3JnKSA8dGltQHhlbi5vcmc+OyBXZWkgTGl1DQo+IDx3bEB4ZW4ub3JnPg0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSB4ZW4vbW0uaDogYWRkIGhlbHBlciBmdW5jdGlvbiB0
byB0ZXN0LWFuZC1jbGVhciBfUEdDX2FsbG9jYXRlZA0KPiANCj4gT24gMTUuMDcuMjAxOSAxMTo1
MCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxpY2hA
c3VzZS5jb20+DQo+ID4+IFNlbnQ6IDE1IEp1bHkgMjAxOSAxMDoyNA0KPiA+Pg0KPiA+PiBPbiAx
NS4wNy4yMDE5IDExOjE3LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4+PiBUaGUgX1BHQ19hbGxv
Y2F0ZWQgZmxhZyBpcyBzZXQgb24gYSBwYWdlIHdoZW4gaXQgaXMgYXNzaWduZWQgdG8gYSBkb21h
aW4NCj4gPj4+IGFsb25nIHdpdGggYW4gaW5pdGlhbCByZWZlcmVuY2UgY291bnQgb2YgYXQgbGVh
c3QgMS4gVG8gY2xlYXIgdGhpcw0KPiA+Pj4gJ2FsbG9jYXRpb24nIHJlZmVyZW5jZSBpdCBpcyBu
ZWNlc3NhcnkgdG8gdGVzdC1hbmQtY2xlYXIgX1BHQ19hbGxvY2F0ZWQgYW5kDQo+ID4+PiB0aGVu
IG9ubHkgZHJvcCB0aGUgcmVmZXJlbmNlIGlmIHRoZSB0ZXN0LWFuZC1jbGVhciBzdWNjZWVkcy4g
VGhpcyBpcyBvcGVuLQ0KPiA+Pj4gY29kZWQgaW4gbWFueSBwbGFjZXMuIEl0IGlzIGFsc28gdW5z
YWZlIHRvIHRlc3QtYW5kLWNsZWFyIF9QR0NfYWxsb2NhdGVkDQo+ID4+PiB1bmxlc3MgdGhlIGNh
bGxlciBob2xkcyBhbiBhZGRpdGlvbmFsIHJlZmVyZW5jZS4NCj4gPj4+DQo+ID4+PiBUaGlzIHBh
dGNoIGFkZHMgYSBoZWxwZXIgZnVuY3Rpb24sIHB1dF9wYWdlX2FsbG9jX3JlZigpLCB0byByZXBs
YWNlIGFsbCB0aGUNCj4gPj4+IG9wZW4tY29kZWQgdGVzdC1hbmQtY2xlYXIvcHV0X3BhZ2Ugb2Nj
dXJyZW5jZXMgYW5kIGluY29ycG9yYXRlcyBpbiB0aGF0IGENCj4gPj4+IEJVR19PTigpIGFuIGFk
ZGl0aW9uYWwgcGFnZSByZWZlcmVuY2Ugbm90IGJlaW5nIGhlbGQuDQo+ID4+DQo+ID4+IFRoaXMg
bGFzdCBzZW50ZW5jZSByZWFkcyBzb21ld2hhdCBzdHJhbmdlIHRvIG1lIC0gYXJlIHRoZXJlIHdv
cmRzDQo+ID4+IG1pc3NpbmcgYW5kL29yIG1pcy1vcmRlcmVkPw0KPiA+DQo+ID4gUGVyaGFwcyBp
dCByZWFkcyBiZXR0ZXIgaWYgJ0JVR19PTigpJyBpcyBzdWJzdGl0dXRlZCB3aXRoICdCVUcoKSBv
bic/DQo+ID4gSSBqdXN0IHdhbnRlZCB0byBleHByZXNzIHRoYXQgdGhlcmUgd2FzIGEgbmV3IGNo
ZWNrIGluIHRoZSBoZWxwZXINCj4gPiBmdW5jdGlvbiB0aGF0IHRoZSBuZWNlc3NhcnkgYWRkaXRp
b25hbCByZWZlcmVuY2UgaXMgaGVsZC4NCj4gDQo+IEJ1dCB0aGVuIHN0aWxsIG1vcmUgbGlrZSAi
Li4uIGluY29ycG9yYXRlcyBpbiBhIEJVRygpIG9uIHRoYXQgYW4NCj4gYWRkaXRpb25hbCAuLi4i
PyBBdCB3aGljaCBwb2ludCBpdCBpbW8gY291bGQgYXMgd2VsbCBiZSAiLi4uDQo+IGluY29ycG9y
YXRlcyBpbiBhIEJVR19PTigpIHRoYXQgYW4gYWRkaXRpb25hbCAuLi4iIChpLmUuIGp1c3QgYQ0K
PiB3b3JkIG9yZGVyIGNoYW5nZSBmcm9tIHlvdXIgb3JpZ2luYWwgc2VudGVuY2UpLiAoVGhlcmUn
cyB0aGVuDQo+IHBlcmhhcHMgYWxzbyBhbiAiaXMiIG1pc3NpbmcgbGF0ZXIgaW4gdGhlIHNlbnRl
bmNlLikNCj4gDQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFu
dEBjaXRyaXguY29tPg0KPiA+Pg0KPiA+PiBXaXRoIHRoZSBjb21taXQgbWVzc2FnZSBhc3BlY3Qg
Y2xhcmlmaWVkDQo+ID4NCj4gPiBJIGFtIGhhcHB5IGZvciB5b3UgdG8gcmUtd29yZCBpdCBpZiB5
b3UgZmVlbCBpdCBpcyBub3QgY2xlYXIuDQo+IA0KPiBXZWxsLCB0aGUgcHJvYmxlbSBpcyB0aGF0
IEkgZG9uJ3QgZmVlbCB3ZWxsIGFkanVzdGluZyB3aGF0IGEgbmF0aXZlDQo+IEVuZ2xpc2ggc3Bl
YWtpbmcgcGVyc29uIGhhcyB3cml0dGVuLg0KDQpPay4gSG93IGFib3V0Li4uDQoNCiJUaGlzIHBh
dGNoIGFkZHMgYSBoZWxwZXIgZnVuY3Rpb24sIHB1dF9wYWdlX2FsbG9jX3JlZigpLCB0byByZXBs
YWNlIGFsbCB0aGUgb3Blbi1jb2RlZCB0ZXN0LWFuZC1jbGVhci9wdXRfcGFnZSBvY2N1cnJlbmNl
cy4gVGhhdCBoZWxwZXIgZnVuY3Rpb24gaW5jb3Jwb3JhdGVzIGEgY2hlY2sgdGhhdCBhbiBhZGRp
dGlvbmFsIHBhZ2UgcmVmZXJlbmNlIGlzIGhlbGQgYW5kIHdpbGwgQlVHKCkgaWYgaXQgaXMgbm90
LiINCg0KPw0KDQogIFBhdWwNCg0KPiANCj4gSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs

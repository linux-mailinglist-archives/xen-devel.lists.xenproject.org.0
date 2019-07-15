Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A08A5686AF
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 11:54:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmxcx-00088N-U2; Mon, 15 Jul 2019 09:50:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gpPh=VM=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hmxcv-00088B-LU
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 09:50:33 +0000
X-Inumbo-ID: fc164714-a6e5-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fc164714-a6e5-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 09:50:32 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LWAU5Urj1e/D1b9fQYObLlZZN9ORge1TyG3ZCRQwM7AiK8YSpjqKe3EwOJqrXJbVCd1jGon9Vn
 0SrKJp+SJrvZETaFJMVsHbadu+6USgz9LYL2WvOUbWCK8848wuIV9LFN/Wl4QanheGFmdHSawv
 pCKlMay10iiuAQt0E1C+N7w/fhYF/zn9YBpLfJrFT/VOquzEumjxVAknMNRQdpzmNiFpI7yEne
 e918XYTyid4Q52dA1fYRFrmco35KEmEWR10csSn3bkMLMzmmNryyqrZEfptGNCDt8gLSuC0W/t
 iEs=
X-SBRS: 2.7
X-MesageID: 3020627
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="3020627"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [PATCH v2] xen/mm.h: add helper function to test-and-clear
 _PGC_allocated
Thread-Index: AQHVOu45CJOv6wo0GUahePXEsKRr6KbLRrMAgAAngBA=
Date: Mon, 15 Jul 2019 09:50:26 +0000
Message-ID: <4a5720ffb5304255a58a83011bf02aa0@AMSPEX02CL03.citrite.net>
References: <20190715091756.39065-1-paul.durrant@citrix.com>
 <1bdac424-c50e-309a-7a5b-125dbebf4a06@suse.com>
In-Reply-To: <1bdac424-c50e-309a-7a5b-125dbebf4a06@suse.com>
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Ian
 Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 VolodymyrBabchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDE1IEp1bHkgMjAxOSAxMDoyNA0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZzsgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEFuZHJldyBD
b29wZXINCj4gPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubmUgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPjsgVm9sb2R5bXlyQmFiY2h1aw0KPiA8Vm9sb2R5bXlyX0JhYmNo
dWtAZXBhbS5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBJ
YW4gSmFja3Nvbg0KPiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEtvbnJhZCBSemVzenV0ZWsgV2lsaw0KPiA8a29u
cmFkLndpbGtAb3JhY2xlLmNvbT47IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNv
bT47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsgV2VpIExpdQ0KPiA8d2xAeGVuLm9yZz4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0geGVuL21tLmg6IGFkZCBoZWxwZXIgZnVuY3Rpb24g
dG8gdGVzdC1hbmQtY2xlYXIgX1BHQ19hbGxvY2F0ZWQNCj4gDQo+IE9uIDE1LjA3LjIwMTkgMTE6
MTcsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiBUaGUgX1BHQ19hbGxvY2F0ZWQgZmxhZyBpcyBz
ZXQgb24gYSBwYWdlIHdoZW4gaXQgaXMgYXNzaWduZWQgdG8gYSBkb21haW4NCj4gPiBhbG9uZyB3
aXRoIGFuIGluaXRpYWwgcmVmZXJlbmNlIGNvdW50IG9mIGF0IGxlYXN0IDEuIFRvIGNsZWFyIHRo
aXMNCj4gPiAnYWxsb2NhdGlvbicgcmVmZXJlbmNlIGl0IGlzIG5lY2Vzc2FyeSB0byB0ZXN0LWFu
ZC1jbGVhciBfUEdDX2FsbG9jYXRlZCBhbmQNCj4gPiB0aGVuIG9ubHkgZHJvcCB0aGUgcmVmZXJl
bmNlIGlmIHRoZSB0ZXN0LWFuZC1jbGVhciBzdWNjZWVkcy4gVGhpcyBpcyBvcGVuLQ0KPiA+IGNv
ZGVkIGluIG1hbnkgcGxhY2VzLiBJdCBpcyBhbHNvIHVuc2FmZSB0byB0ZXN0LWFuZC1jbGVhciBf
UEdDX2FsbG9jYXRlZA0KPiA+IHVubGVzcyB0aGUgY2FsbGVyIGhvbGRzIGFuIGFkZGl0aW9uYWwg
cmVmZXJlbmNlLg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBhZGRzIGEgaGVscGVyIGZ1bmN0aW9uLCBw
dXRfcGFnZV9hbGxvY19yZWYoKSwgdG8gcmVwbGFjZSBhbGwgdGhlDQo+ID4gb3Blbi1jb2RlZCB0
ZXN0LWFuZC1jbGVhci9wdXRfcGFnZSBvY2N1cnJlbmNlcyBhbmQgaW5jb3Jwb3JhdGVzIGluIHRo
YXQgYQ0KPiA+IEJVR19PTigpIGFuIGFkZGl0aW9uYWwgcGFnZSByZWZlcmVuY2Ugbm90IGJlaW5n
IGhlbGQuDQo+IA0KPiBUaGlzIGxhc3Qgc2VudGVuY2UgcmVhZHMgc29tZXdoYXQgc3RyYW5nZSB0
byBtZSAtIGFyZSB0aGVyZSB3b3Jkcw0KPiBtaXNzaW5nIGFuZC9vciBtaXMtb3JkZXJlZD8NCg0K
UGVyaGFwcyBpdCByZWFkcyBiZXR0ZXIgaWYgJ0JVR19PTigpJyBpcyBzdWJzdGl0dXRlZCB3aXRo
ICdCVUcoKSBvbic/IEkganVzdCB3YW50ZWQgdG8gZXhwcmVzcyB0aGF0IHRoZXJlIHdhcyBhIG5l
dyBjaGVjayBpbiB0aGUgaGVscGVyIGZ1bmN0aW9uIHRoYXQgdGhlIG5lY2Vzc2FyeSBhZGRpdGlv
bmFsIHJlZmVyZW5jZSBpcyBoZWxkLg0KDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVy
cmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+DQo+IA0KPiBXaXRoIHRoZSBjb21taXQgbWVz
c2FnZSBhc3BlY3QgY2xhcmlmaWVkDQoNCkkgYW0gaGFwcHkgZm9yIHlvdSB0byByZS13b3JkIGl0
IGlmIHlvdSBmZWVsIGl0IGlzIG5vdCBjbGVhci4gV2l0aCB0aGUgZXh0cmEgY29tbWVudCBpbiB0
aGUgaGVscGVyIGZ1bmN0aW9uIGluIHYyIHRoZW4gcGVyaGFwcyBpdCBpcyBub3QgcmVhbGx5IG5l
Y2Vzc2FyeSB0byBoYXZlIGFueSBhZGRpdGlvbmFsIGV4cGxhbmF0aW9uIGluIHRoZSBjb21taXQg
Y29tbWVudCBhbnl3YXk/DQoNCj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4NCg0KVGhhbmtzLA0KDQogIFBhdWwNCg0KPiANCj4gSmFuDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

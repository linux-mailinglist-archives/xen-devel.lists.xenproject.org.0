Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE55703DD
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 17:35:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpaJp-00012s-4x; Mon, 22 Jul 2019 15:33:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+VRc=VT=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hpaJo-00012m-EL
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 15:33:40 +0000
X-Inumbo-ID: 140a89c2-ac96-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 140a89c2-ac96-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 15:33:39 +0000 (UTC)
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
IronPort-SDR: 3Dts8s/AoetkggSLsDx5baW5fDE8HkByb/ZuZQYP4jjzKraVqL4KA5vuDZNfWmbeOs+KRydaHM
 uX69cEHTFFryqTO8vw1IN2EhpLhTFWD9tXJdBDkXYR4E63eOBEiT879q7v18wIxVTX0GaTxY3K
 dovJUDqYf4NHafKKXwpEUDGVfpdrKF0LuhpA6TUOm/rTGFI5xaKg9j9CAGk7j0lmNW4qBVt9Cm
 hi8KSYQuAOmiWflZ+XmS/V407JK887PHgAOVlVn0GPCQjXWhGjvUvNedTHzH3VmZDmjEfA3pB3
 t9w=
X-SBRS: 2.7
X-MesageID: 3367636
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,295,1559534400"; 
   d="scan'208";a="3367636"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86/p2m: fix non-translated handling of iommu mappings
Thread-Index: AQHVQKKjhRGKsTlIm0qPGJMvVYYO/qbWxBqw
Date: Mon, 22 Jul 2019 15:33:35 +0000
Message-ID: <aba8beac7ed04cc7a8f729d088bb0348@AMSPEX02CL03.citrite.net>
References: <20190722153209.73107-1-roger.pau@citrix.com>
In-Reply-To: <20190722153209.73107-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] x86/p2m: fix non-translated handling of
 iommu mappings
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
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiAyMiBKdWx5IDIwMTkgMTY6MzINCj4gVG86IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogUm9nZXIgUGF1IE1vbm5lIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNv
bT47IEphbiBCZXVsaWNoDQo+IDxqYmV1bGljaEBzdXNlLmNvbT47IEFuZHJldyBDb29wZXIgPEFu
ZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUGF1bCBEdXJy
YW50DQo+IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSB4ODYv
cDJtOiBmaXggbm9uLXRyYW5zbGF0ZWQgaGFuZGxpbmcgb2YgaW9tbXUgbWFwcGluZ3MNCj4gDQo+
IFRoZSBjdXJyZW50IHVzYWdlIG9mIG5lZWRfaW9tbXVfcHRfc3luYyBpbiBwMm0gZm9yIG5vbi10
cmFuc2xhdGVkDQo+IGd1ZXN0cyBpcyB3cm9uZyBiZWNhdXNlIGl0IGRvZXNuJ3QgY29ycmVjdGx5
IGhhbmRsZSBhIHJlbGF4ZWQgUFYNCj4gaGFyZHdhcmUgZG9tYWluLCB0aGF0IGhhcyBuZWVkX3N5
bmMgc2V0IHRvIGZhbHNlLCBidXQgc3RpbGwgbmVlZA0KPiBlbnRyaWVzIHRvIGJlIGFkZGVkIGZy
b20gY2FsbHMgdG8ge3NldC9jbGVhcn1faWRlbnRpdHlfcDJtX2VudHJ5Lg0KPiANCj4gQWRqdXN0
IHRoZSBjb2RlIGluIGd1ZXN0X3BoeXNtYXBfYWRkX3BhZ2UgdG8gYWxzbyBjaGVjayB3aGV0aGVy
IHRoZQ0KPiBkb21haW4gaGFzIGFuIGlvbW11IGluc3RlYWQgb2Ygd2hldGhlciBpdCBuZWVkcyBz
eW5jaW5nIG9yIG5vdCBpbg0KPiBvcmRlciB0byB0YWtlIGEgcmVmZXJlbmNlIHRvIGEgcGFnZSB0
byBiZSBtYXBwZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4NCj4gLS0tDQo+IENjOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGV1LmNpdHJpeC5jb20+DQo+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBDYzog
V2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gQ2M6IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNp
dHJpeC5jb20+DQoNClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRy
aXguY29tPg0KDQo+IC0tLQ0KPiAgeGVuL2FyY2gveDg2L21tL3AybS5jIHwgNiArKystLS0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3AybS5jIGIveGVuL2FyY2gveDg2L21tL3AybS5j
DQo+IGluZGV4IGZlZjk3YzgyZjYuLjg4YTI0MzBjOGMgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9tbS9wMm0uYw0KPiArKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMNCj4gQEAgLTgzNiw3
ICs4MzYsNyBAQCBndWVzdF9waHlzbWFwX2FkZF9wYWdlKHN0cnVjdCBkb21haW4gKmQsIGdmbl90
IGdmbiwgbWZuX3QgbWZuLA0KPiAgICAgICAgICAgKi8NCj4gICAgICAgICAgZm9yICggaSA9IDA7
IGkgPCAoMVVMIDw8IHBhZ2Vfb3JkZXIpOyArK2ksICsrcGFnZSApDQo+ICAgICAgICAgIHsNCj4g
LSAgICAgICAgICAgIGlmICggIW5lZWRfaW9tbXVfcHRfc3luYyhkKSApDQo+ICsgICAgICAgICAg
ICBpZiAoICFoYXNfaW9tbXVfcHQoZCkgKQ0KPiAgICAgICAgICAgICAgICAgIC8qIG5vdGhpbmcg
Ki87DQo+ICAgICAgICAgICAgICBlbHNlIGlmICggZ2V0X3BhZ2VfYW5kX3R5cGUocGFnZSwgZCwg
UEdUX3dyaXRhYmxlX3BhZ2UpICkNCj4gICAgICAgICAgICAgICAgICBwdXRfcGFnZV9hbmRfdHlw
ZShwYWdlKTsNCj4gQEAgLTEzNDEsNyArMTM0MSw3IEBAIGludCBzZXRfaWRlbnRpdHlfcDJtX2Vu
dHJ5KHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcgZ2ZuX2wsDQo+IA0KPiAgICAgIGlm
ICggIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZShwMm0tPmRvbWFpbikgKQ0KPiAgICAgIHsNCj4gLSAg
ICAgICAgaWYgKCAhbmVlZF9pb21tdV9wdF9zeW5jKGQpICkNCj4gKyAgICAgICAgaWYgKCAhaGFz
X2lvbW11X3B0KGQpICkNCj4gICAgICAgICAgICAgIHJldHVybiAwOw0KPiAgICAgICAgICByZXR1
cm4gaW9tbXVfbGVnYWN5X21hcChkLCBfZGZuKGdmbl9sKSwgX21mbihnZm5fbCksIFBBR0VfT1JE
RVJfNEssDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElPTU1VRl9yZWFkYWJs
ZSB8IElPTU1VRl93cml0YWJsZSk7DQo+IEBAIC0xNDMyLDcgKzE0MzIsNyBAQCBpbnQgY2xlYXJf
aWRlbnRpdHlfcDJtX2VudHJ5KHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcgZ2ZuX2wp
DQo+IA0KPiAgICAgIGlmICggIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZShkKSApDQo+ICAgICAgew0K
PiAtICAgICAgICBpZiAoICFuZWVkX2lvbW11X3B0X3N5bmMoZCkgKQ0KPiArICAgICAgICBpZiAo
ICFoYXNfaW9tbXVfcHQoZCkgKQ0KPiAgICAgICAgICAgICAgcmV0dXJuIDA7DQo+ICAgICAgICAg
IHJldHVybiBpb21tdV9sZWdhY3lfdW5tYXAoZCwgX2RmbihnZm5fbCksIFBBR0VfT1JERVJfNEsp
Ow0KPiAgICAgIH0NCj4gLS0NCj4gMi4yMC4xIChBcHBsZSBHaXQtMTE3KQ0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

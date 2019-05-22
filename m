Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED1326474
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 15:18:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTR3v-0007VF-N0; Wed, 22 May 2019 13:13:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KXPP=TW=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hTR3u-0007VA-Kf
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 13:13:42 +0000
X-Inumbo-ID: 6b12a9ff-7c93-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6b12a9ff-7c93-11e9-8980-bc764e045a96;
 Wed, 22 May 2019 13:13:41 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: itObJZRvFNSoe5wwHXkNbp7V8B+ZAc8Y2tej+F6RiNZveMEbD1UWMknYsJB5K2inwASz5enpJo
 Kdu5oIpkRcVxvY9vQgUz1LPdRXtHHsGPAN1njbnRlVIJdmq2eGCzSC4XrQ22JKzuemdCx+VA+P
 qahoPS/OTpu2133UWIb4kzwSq18rnxyXnwh80zvlhB+9cfvO7c7YqD2dIAkjMZE/HcvK3K+iS/
 rz/1RfmOwq2tu6gDO4vN8uSYUutn80QT/kZMwHnXpTHWiZ60BwFzihj335YjxaOU5kWdXEysYN
 PBg=
X-SBRS: 2.7
X-MesageID: 749916
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,499,1549947600"; 
   d="scan'208";a="749916"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Alexandru Stefan ISAILA' <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 1/2] x86/emulate: Move hvmemul_linear_to_phys
Thread-Index: AQHVDwtCd30Zw9xzVEyqgGU2/KVoUaZ3H0Dg
Date: Wed, 22 May 2019 13:13:38 +0000
Message-ID: <153d4f7da0a24805bb7112f6ff2beb80@AMSPEX02CL03.citrite.net>
References: <20190520125454.14805-1-aisaila@bitdefender.com>
In-Reply-To: <20190520125454.14805-1-aisaila@bitdefender.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 1/2] x86/emulate: Move
 hvmemul_linear_to_phys
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
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kcnUgU3RlZmFuIElT
QUlMQSBbbWFpbHRvOmFpc2FpbGFAYml0ZGVmZW5kZXIuY29tXQ0KPiBTZW50OiAyMCBNYXkgMjAx
OSAxMzo1NQ0KPiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgamJldWxpY2hAc3VzZS5jb207IEFu
ZHJldyBDb29wZXINCj4gPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47
DQo+IHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb207IHRhbWFzQHRrbGVuZ3llbC5jb207IEdlb3Jn
ZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IEFsZXhhbmRydQ0KPiBTdGVmYW4g
SVNBSUxBIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHY0IDEv
Ml0geDg2L2VtdWxhdGU6IE1vdmUgaHZtZW11bF9saW5lYXJfdG9fcGh5cw0KPiANCj4gVGhpaXMg
aXMgZG9uZSBzbyBodm1lbXVsX2xpbmVhcl90b19waHlzKCkgY2FuIGJlIGNhbGxlZCBmcm9tDQo+
IGh2bWVtdWxfc2VuZF92bV9ldmVudCgpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1
IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+DQo+IC0tLQ0KPiAgeGVuL2FyY2gveDg2
L2h2bS9lbXVsYXRlLmMgfCAxODEgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDkwIGluc2VydGlvbnMoKyksIDkxIGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jIGIveGVuL2FyY2gv
eDg2L2h2bS9lbXVsYXRlLmMNCj4gaW5kZXggODY1OWM4OTg2Mi4uMjU0ZmY2NTE1ZCAxMDA2NDQN
Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMNCj4gKysrIGIveGVuL2FyY2gveDg2
L2h2bS9lbXVsYXRlLmMNCj4gQEAgLTUzMCw2ICs1MzAsOTUgQEAgc3RhdGljIGludCBodm1lbXVs
X2RvX21taW9fYWRkcihwYWRkcl90IG1taW9fZ3BhLA0KPiAgICAgIHJldHVybiBodm1lbXVsX2Rv
X2lvX2FkZHIoMSwgbW1pb19ncGEsIHJlcHMsIHNpemUsIGRpciwgZGYsIHJhbV9ncGEpOw0KPiAg
fQ0KPiANCg0KSSBrbm93IHRoaXMgaXMgY29kZSBtb3ZlbWVudCwgYnV0IGl0IHdvdWxkIHByb2Jh
Ymx5IGdvb2QgdG8gYSBkbyBhIGJpdCBvZiB0aWR5aW5nLi4uDQoNCj4gKy8qDQo+ICsgKiBDb252
ZXJ0IGFkZHIgZnJvbSBsaW5lYXIgdG8gcGh5c2ljYWwgZm9ybSwgdmFsaWQgb3ZlciB0aGUgcmFu
Z2UNCj4gKyAqIFthZGRyLCBhZGRyICsgKnJlcHMgKiBieXRlc19wZXJfcmVwXS4gKnJlcHMgaXMg
YWRqdXN0ZWQgYWNjb3JkaW5nIHRvDQo+ICsgKiB0aGUgdmFsaWQgY29tcHV0ZWQgcmFuZ2UuIEl0
IGlzIGFsd2F5cyA+MCB3aGVuIFg4NkVNVUxfT0tBWSBpcyByZXR1cm5lZC4NCj4gKyAqIEBwZmVj
IGluZGljYXRlcyB0aGUgYWNjZXNzIGNoZWNrcyB0byBiZSBwZXJmb3JtZWQgZHVyaW5nIHBhZ2Ut
dGFibGUgd2Fsa3MuDQo+ICsgKi8NCj4gK3N0YXRpYyBpbnQgaHZtZW11bF9saW5lYXJfdG9fcGh5
cygNCj4gKyAgICB1bnNpZ25lZCBsb25nIGFkZHIsDQo+ICsgICAgcGFkZHJfdCAqcGFkZHIsDQo+
ICsgICAgdW5zaWduZWQgaW50IGJ5dGVzX3Blcl9yZXAsDQo+ICsgICAgdW5zaWduZWQgbG9uZyAq
cmVwcywNCj4gKyAgICB1aW50MzJfdCBwZmVjLA0KPiArICAgIHN0cnVjdCBodm1fZW11bGF0ZV9j
dHh0ICpodm1lbXVsX2N0eHQpDQoNClRoaXMgY2FuIGFsbCBiZSByZS1mbG93ZWQgc2luY2UgYXJn
LXBlci1saW5lIGlzIG5vdCByZWFsbHkgY2Fub25pY2FsIHN0eWxlLg0KDQo+ICt7DQo+ICsgICAg
c3RydWN0IHZjcHUgKmN1cnIgPSBjdXJyZW50Ow0KPiArICAgIHVuc2lnbmVkIGxvbmcgcGZuLCBu
cGZuLCBkb25lLCB0b2RvLCBpLCBvZmZzZXQgPSBhZGRyICYgflBBR0VfTUFTSzsNCj4gKyAgICBp
bnQgcmV2ZXJzZTsNCg0KTG9va3MgbGlrZSB0aGlzIHNob3VsZCBiZSBib29sLg0KDQo+ICsNCj4g
KyAgICAvKg0KPiArICAgICAqIENsaXAgcmVwZXRpdGlvbnMgdG8gYSBzZW5zaWJsZSBtYXhpbXVt
LiBUaGlzIGF2b2lkcyBleHRlbnNpdmUgbG9vcGluZyBpbg0KPiArICAgICAqIHRoaXMgZnVuY3Rp
b24gd2hpbGUgc3RpbGwgYW1vcnRpc2luZyB0aGUgY29zdCBvZiBJL08gdHJhcC1hbmQtZW11bGF0
ZS4NCj4gKyAgICAgKi8NCj4gKyAgICAqcmVwcyA9IG1pbl90KHVuc2lnbmVkIGxvbmcsICpyZXBz
LCA0MDk2KTsNCj4gKw0KPiArICAgIC8qIFdpdGggbm8gcGFnaW5nIGl0J3MgZWFzeTogbGluZWFy
ID09IHBoeXNpY2FsLiAqLw0KPiArICAgIGlmICggIShjdXJyLT5hcmNoLmh2bS5ndWVzdF9jclsw
XSAmIFg4Nl9DUjBfUEcpICkNCj4gKyAgICB7DQo+ICsgICAgICAgICpwYWRkciA9IGFkZHI7DQo+
ICsgICAgICAgIHJldHVybiBYODZFTVVMX09LQVk7DQo+ICsgICAgfQ0KPiArDQo+ICsgICAgLyog
UmV2ZXJzZSBtb2RlIGlmIHRoaXMgaXMgYSBiYWNrd2FyZHMgbXVsdGktaXRlcmF0aW9uIHN0cmlu
ZyBvcGVyYXRpb24uICovDQo+ICsgICAgcmV2ZXJzZSA9IChodm1lbXVsX2N0eHQtPmN0eHQucmVn
cy0+ZWZsYWdzICYgWDg2X0VGTEFHU19ERikgJiYgKCpyZXBzID4gMSk7DQo+ICsNCj4gKyAgICBp
ZiAoIHJldmVyc2UgJiYgKChQQUdFX1NJWkUgLSBvZmZzZXQpIDwgYnl0ZXNfcGVyX3JlcCkgKQ0K
PiArICAgIHsNCj4gKyAgICAgICAgLyogRG8gcGFnZS1zdHJhZGRsaW5nIGZpcnN0IGl0ZXJhdGlv
biBmb3J3YXJkcyB2aWEgcmVjdXJzaW9uLiAqLw0KPiArICAgICAgICBwYWRkcl90IF9wYWRkcjsN
Cj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBvbmVfcmVwID0gMTsNCj4gKyAgICAgICAgaW50IHJj
ID0gaHZtZW11bF9saW5lYXJfdG9fcGh5cygNCj4gKyAgICAgICAgICAgIGFkZHIsICZfcGFkZHIs
IGJ5dGVzX3Blcl9yZXAsICZvbmVfcmVwLCBwZmVjLCBodm1lbXVsX2N0eHQpOw0KDQpCbGFuayBs
aW5lIGhlcmUuDQoNCj4gKyAgICAgICAgaWYgKCByYyAhPSBYODZFTVVMX09LQVkgKQ0KPiArICAg
ICAgICAgICAgcmV0dXJuIHJjOw0KPiArICAgICAgICBwZm4gPSBfcGFkZHIgPj4gUEFHRV9TSElG
VDsNCg0KcGFkZHJfdG9fcGZuKCkNCg0KPiArICAgIH0NCj4gKyAgICBlbHNlIGlmICggKHBmbiA9
IHBhZ2luZ19ndmFfdG9fZ2ZuKGN1cnIsIGFkZHIsICZwZmVjKSkgPT0gZ2ZuX3goSU5WQUxJRF9H
Rk4pICkNCj4gKyAgICB7DQo+ICsgICAgICAgIGlmICggcGZlYyAmIChQRkVDX3BhZ2VfcGFnZWQg
fCBQRkVDX3BhZ2Vfc2hhcmVkKSApDQo+ICsgICAgICAgICAgICByZXR1cm4gWDg2RU1VTF9SRVRS
WTsNCj4gKyAgICAgICAgKnJlcHMgPSAwOw0KPiArICAgICAgICB4ODZfZW11bF9wYWdlZmF1bHQo
cGZlYywgYWRkciwgJmh2bWVtdWxfY3R4dC0+Y3R4dCk7DQo+ICsgICAgICAgIHJldHVybiBYODZF
TVVMX0VYQ0VQVElPTjsNCj4gKyAgICB9DQo+ICsNCj4gKyAgICBkb25lID0gcmV2ZXJzZSA/IGJ5
dGVzX3Blcl9yZXAgKyBvZmZzZXQgOiBQQUdFX1NJWkUgLSBvZmZzZXQ7DQo+ICsgICAgdG9kbyA9
ICpyZXBzICogYnl0ZXNfcGVyX3JlcDsNCj4gKyAgICBmb3IgKCBpID0gMTsgZG9uZSA8IHRvZG87
IGkrKyApDQo+ICsgICAgew0KPiArICAgICAgICAvKiBHZXQgdGhlIG5leHQgUEZOIGluIHRoZSBy
YW5nZS4gKi8NCj4gKyAgICAgICAgYWRkciArPSByZXZlcnNlID8gLVBBR0VfU0laRSA6IFBBR0Vf
U0laRTsNCj4gKyAgICAgICAgbnBmbiA9IHBhZ2luZ19ndmFfdG9fZ2ZuKGN1cnIsIGFkZHIsICZw
ZmVjKTsNCj4gKw0KPiArICAgICAgICAvKiBJcyBpdCBjb250aWd1b3VzIHdpdGggdGhlIHByZWNl
ZGluZyBQRk5zPyBJZiBub3QgdGhlbiB3ZSdyZSBkb25lLiAqLw0KPiArICAgICAgICBpZiAoIChu
cGZuID09IGdmbl94KElOVkFMSURfR0ZOKSkgfHwNCj4gKyAgICAgICAgICAgICAobnBmbiAhPSAo
cGZuICsgKHJldmVyc2UgPyAtaSA6IGkpKSkgKQ0KPiArICAgICAgICB7DQo+ICsgICAgICAgICAg
ICBpZiAoIHBmZWMgJiAoUEZFQ19wYWdlX3BhZ2VkIHwgUEZFQ19wYWdlX3NoYXJlZCkgKQ0KPiAr
ICAgICAgICAgICAgICAgIHJldHVybiBYODZFTVVMX1JFVFJZOw0KPiArICAgICAgICAgICAgZG9u
ZSAvPSBieXRlc19wZXJfcmVwOw0KPiArICAgICAgICAgICAgaWYgKCBkb25lID09IDAgKQ0KPiAr
ICAgICAgICAgICAgew0KPiArICAgICAgICAgICAgICAgIEFTU0VSVCghcmV2ZXJzZSk7DQo+ICsg
ICAgICAgICAgICAgICAgaWYgKCBucGZuICE9IGdmbl94KElOVkFMSURfR0ZOKSApDQo+ICsgICAg
ICAgICAgICAgICAgICAgIHJldHVybiBYODZFTVVMX1VOSEFORExFQUJMRTsNCj4gKyAgICAgICAg
ICAgICAgICAqcmVwcyA9IDA7DQo+ICsgICAgICAgICAgICAgICAgeDg2X2VtdWxfcGFnZWZhdWx0
KHBmZWMsIGFkZHIgJiBQQUdFX01BU0ssICZodm1lbXVsX2N0eHQtPmN0eHQpOw0KPiArICAgICAg
ICAgICAgICAgIHJldHVybiBYODZFTVVMX0VYQ0VQVElPTjsNCj4gKyAgICAgICAgICAgIH0NCj4g
KyAgICAgICAgICAgICpyZXBzID0gZG9uZTsNCj4gKyAgICAgICAgICAgIGJyZWFrOw0KPiArICAg
ICAgICB9DQo+ICsNCj4gKyAgICAgICAgZG9uZSArPSBQQUdFX1NJWkU7DQo+ICsgICAgfQ0KPiAr
DQo+ICsgICAgKnBhZGRyID0gKChwYWRkcl90KXBmbiA8PCBQQUdFX1NISUZUKSB8IG9mZnNldDsN
Cg0KcGZuX3RvX3BhZGRyKCkgYW5kIGEgYmxhbmsgbGluZSBiZWZvcmUgdGhlIHJldHVybi4NCg0K
PiArICAgIHJldHVybiBYODZFTVVMX09LQVk7DQo+ICt9DQo+ICsNCg0KVGhhbmtzLA0KDQogIFBh
dWwNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

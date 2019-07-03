Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A515E7C5
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 17:25:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hih5l-0000lb-S8; Wed, 03 Jul 2019 15:22:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eYTC=VA=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hih5j-0000lW-SX
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 15:22:39 +0000
X-Inumbo-ID: 63637832-9da6-11e9-9fd2-3be4103748db
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63637832-9da6-11e9-9fd2-3be4103748db;
 Wed, 03 Jul 2019 15:22:37 +0000 (UTC)
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
IronPort-SDR: JdUZP4oYd64jWNWK/QCM5pebNpmW7n7XFKOKUmfQg4aWl7SDoYiC8Xl4MLndbWnrid00A/OqXa
 D96FLT/gThEdslXXFyK8VBLMY1RISjZlGKeHiSW9+yLJ1xczJZn3CNA71zI8sFMsbIxoLUZZ3K
 itYHX4x+uee2xibbN6HkLTi7gGTHSeYribUoDCCkHyGG+cKuvUv5pdcwPGqYWF20U2I8+yWoUa
 DeNcyJgK0wX9kUd7FkOoMAAiGzSGfJ/pdvopIHqVx3eJfs6voHimO/9EmSeKG3Jq8TyoH1PiXS
 aZg=
X-SBRS: 2.7
X-MesageID: 2607755
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,446,1557201600"; 
   d="scan'208";a="2607755"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] x86/HVM: p2m_ram_ro is incompatible with device
 pass-through
Thread-Index: AQHVMZODenL8esX3CUGEt7b/0uHdFaa5AV1g
Date: Wed, 3 Jul 2019 15:22:33 +0000
Message-ID: <ee14bec6e2db4064a539f91a78d021f7@AMSPEX02CL03.citrite.net>
References: <808bb731-c5a7-86cf-5c5a-25253ea8ff17@suse.com>
In-Reply-To: <808bb731-c5a7-86cf-5c5a-25253ea8ff17@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] x86/HVM: p2m_ram_ro is incompatible with
 device pass-through
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAzIEp1bHkgMjAxOSAxMjozNg0KPiBUbzogeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFw
QGNpdHJpeC5jb20+OyBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgQW5k
cmV3IENvb3Blcg0KPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhl
bi5vcmc+OyBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTdWJqZWN0
OiBbUEFUQ0ggdjJdIHg4Ni9IVk06IHAybV9yYW1fcm8gaXMgaW5jb21wYXRpYmxlIHdpdGggZGV2
aWNlIHBhc3MtdGhyb3VnaA0KPiANCj4gVGhlIHdyaXRlLWRpc2NhcmQgcHJvcGVydHkgb2YgdGhl
IHR5cGUgY2FuJ3QgYmUgcmVwcmVzZW50ZWQgaW4gSU9NTVUNCj4gcGFnZSB0YWJsZSBlbnRyaWVz
LiBNYWtlIHN1cmUgdGhlIHJlc3BlY3RpdmUgY2hlY2tzIC8gdHJhY2tpbmcgY2FuJ3QNCj4gcmFj
ZSwgYnkgdXRpbGl6aW5nIHRoZSBkb21haW4gbG9jay4gVGhlIG90aGVyIHNpZGVzIG9mIHRoZSBz
aGFyaW5nLw0KPiBwYWdpbmcvbG9nLWRpcnR5IGV4Y2x1c2lvbiBjaGVja3Mgc2hvdWxkIHN1YnNl
cXVlbnRseSBwZXJoYXBzIGFsc28gYmUNCj4gcHV0IHVuZGVyIHRoYXQgbG9jayB0aGVuLg0KPiAN
Cj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgYW5kIGFsc28gY29udmVydCBuZWlnaGJvcmluZyBib29s
X3QgdG8gYm9vbCBpbg0KPiBzdHJ1Y3QgaHZtX2RvbWFpbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gLS0tDQo+IHYyOiBEb24ndCBzZXQg
cDJtX3JhbV9yb191c2VkIHdoZW4gZmFpbGluZyB0aGUgcmVxdWVzdC4NCj4gDQo+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9odm0vZG0uYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2RtLmMNCj4gQEAg
LTI1NSwxNiArMjU1LDMzIEBAIHN0YXRpYyBpbnQgc2V0X21lbV90eXBlKHN0cnVjdCBkb21haW4g
KmQNCj4gDQo+ICAgICAgIG1lbV90eXBlID0gYXJyYXlfaW5kZXhfbm9zcGVjKGRhdGEtPm1lbV90
eXBlLCBBUlJBWV9TSVpFKG1lbXR5cGUpKTsNCj4gDQo+IC0gICAgaWYgKCBtZW1fdHlwZSA9PSBI
Vk1NRU1faW9yZXFfc2VydmVyICkNCj4gKyAgICBzd2l0Y2ggKCBtZW1fdHlwZSApDQo+ICAgICAg
IHsNCj4gICAgICAgICAgIHVuc2lnbmVkIGludCBmbGFnczsNCj4gDQo+ICsgICAgY2FzZSBIVk1N
RU1faW9yZXFfc2VydmVyOg0KPiAgICAgICAgICAgaWYgKCAhaGFwX2VuYWJsZWQoZCkgKQ0KPiAg
ICAgICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsNCj4gDQo+ICAgICAgICAgICAvKiBEbyBu
b3QgY2hhbmdlIHRvIEhWTU1FTV9pb3JlcV9zZXJ2ZXIgaWYgbm8gaW9yZXEgc2VydmVyIG1hcHBl
ZC4gKi8NCj4gICAgICAgICAgIGlmICggIXAybV9nZXRfaW9yZXFfc2VydmVyKGQsICZmbGFncykg
KQ0KPiAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsgICAgICAgIGJyZWFr
Ow0KPiArDQo+ICsgICAgY2FzZSBIVk1NRU1fcmFtX3JvOg0KPiArICAgICAgICAvKiBwMm1fcmFt
X3JvIGNhbid0IGJlIHJlcHJlc2VudGVkIGluIElPTU1VIG1hcHBpbmdzLiAqLw0KPiArICAgICAg
ICBkb21haW5fbG9jayhkKTsNCj4gKyAgICAgICAgaWYgKCBoYXNfaW9tbXVfcHQoZCkgKQ0KPiAr
ICAgICAgICAgICAgcmMgPSAtRVhERVY7DQo+ICsgICAgICAgIGVsc2UNCj4gKyAgICAgICAgICAg
IGQtPmFyY2guaHZtLnAybV9yYW1fcm9fdXNlZCA9IHRydWU7DQoNCkRvIHdlIHJlYWxseSB3YW50
IHRoaXMgdG8gYmUgYSBvbmUtd2F5IHRyaXA/IE9uIHRoZSBmYWNlIG9mIGl0LCBpdCB3b3VsZCBz
ZWVtIHRoYXQga2VlcGluZyBhIGNvdW50IG9mIHAybV9yYW1fcm8gZW50cmllcyB3b3VsZCBiZSBt
b3JlIGRlc2lyYWJsZSBzdWNoIHRoYXQsIG9uY2UgdGhlIGxhc3Qgb25lIGlzIGdvbmUsIGRldmlj
ZXMgY2FuIGJlIGFzc2lnbmVkIGFnYWluPw0KSWYgbm90IG1heWJlIGl0J3MgdGltZSB0byBnbyBh
bGwgdGhlIHdheSBhbmQgbWFrZSBpb21tdSBwYWdlIHRhYmxlIGNvbnN0cnVjdGlvbiBwYXJ0IG9m
IGRvbWFpbiBjcmVhdGUgYW5kIHRoZW4gd2Ugc2ltcGxpZnkgYSBsb3Qgb2YgY29kZSBhbmQgd2Ug
ZG9uJ3QgbmVlZCBhbnkgZmxhZy9yZWZjb3VudCBsaWtlIHRoaXMgYXQgYWxsLg0KDQogIFBhdWwN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

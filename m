Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C50EF5F5C1
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 11:37:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiy8z-0000jW-GY; Thu, 04 Jul 2019 09:35:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=suz0=VB=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hiy8x-0000jK-HO
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 09:35:07 +0000
X-Inumbo-ID: 0189639d-9e3f-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0189639d-9e3f-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 09:35:06 +0000 (UTC)
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
IronPort-SDR: e/iPA3YpufBqnfo+vVEGVMUhMqpSN2x4z649tn/54lfbYM0ZB2fSGPfUcRPQiXLuUNimAYRK7a
 YkPubiS6lPAZn4sg/u0WoynnO+4A3DlW6+PBbjd1xnxodLYKS/09KIwlrJpqTmxBf6vV86mj/3
 seOWwTDFJ5hdtmrGVudxNW5ar9GfAGirvBYGlZqXd2CEq4+74CJNCDJw28vZ9kouBCKuwRvzn2
 k3zBXOcGQ3Ik6Jd3yxTNrKwnMpnqFol8Y+YMgUWruDXO5ZwcY97Aa+w2FeLlDwKt1HbHhkwPCT
 4CE=
X-SBRS: 2.7
X-MesageID: 2616206
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,450,1557201600"; 
   d="scan'208";a="2616206"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] x86/HVM: p2m_ram_ro is incompatible with device
 pass-through
Thread-Index: AQHVMZODenL8esX3CUGEt7b/0uHdFaa5AV1ggAEucACAAAMssA==
Date: Thu, 4 Jul 2019 09:35:02 +0000
Message-ID: <ab4d8c58855c45ed855e27d1fa15972e@AMSPEX02CL03.citrite.net>
References: <808bb731-c5a7-86cf-5c5a-25253ea8ff17@suse.com>
 <ee14bec6e2db4064a539f91a78d021f7@AMSPEX02CL03.citrite.net>
 <0f165d9f-6bfc-1ca0-648e-a64d05d204ed@suse.com>
In-Reply-To: <0f165d9f-6bfc-1ca0-648e-a64d05d204ed@suse.com>
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
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDA0IEp1bHkgMjAxOSAxMDoxOQ0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZw0KPiBDYzogQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEdl
b3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IFJvZ2VyIFBhdQ0KPiBNb25u
ZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHYyXSB4ODYvSFZNOiBwMm1fcmFtX3JvIGlzIGluY29tcGF0aWJsZSB3aXRo
IGRldmljZSBwYXNzLXRocm91Z2gNCj4gDQo+IE9uIDAzLjA3LjIwMTkgMTc6MjIsIFBhdWwgRHVy
cmFudCB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTog
SmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBTZW50OiAwMyBKdWx5IDIwMTkg
MTI6MzYNCj4gPj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiA+PiBDYzog
R2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgUGF1bCBEdXJyYW50IDxQ
YXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IEFuZHJldyBDb29wZXINCj4gPj4gPEFuZHJldy5Db29w
ZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm5lIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4NCj4gPj4gU3ViamVjdDogW1BBVENIIHYyXSB4ODYvSFZNOiBw
Mm1fcmFtX3JvIGlzIGluY29tcGF0aWJsZSB3aXRoIGRldmljZSBwYXNzLXRocm91Z2gNCj4gPj4N
Cj4gPj4gVGhlIHdyaXRlLWRpc2NhcmQgcHJvcGVydHkgb2YgdGhlIHR5cGUgY2FuJ3QgYmUgcmVw
cmVzZW50ZWQgaW4gSU9NTVUNCj4gPj4gcGFnZSB0YWJsZSBlbnRyaWVzLiBNYWtlIHN1cmUgdGhl
IHJlc3BlY3RpdmUgY2hlY2tzIC8gdHJhY2tpbmcgY2FuJ3QNCj4gPj4gcmFjZSwgYnkgdXRpbGl6
aW5nIHRoZSBkb21haW4gbG9jay4gVGhlIG90aGVyIHNpZGVzIG9mIHRoZSBzaGFyaW5nLw0KPiA+
PiBwYWdpbmcvbG9nLWRpcnR5IGV4Y2x1c2lvbiBjaGVja3Mgc2hvdWxkIHN1YnNlcXVlbnRseSBw
ZXJoYXBzIGFsc28gYmUNCj4gPj4gcHV0IHVuZGVyIHRoYXQgbG9jayB0aGVuLg0KPiA+Pg0KPiA+
PiBUYWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgYWxzbyBjb252ZXJ0IG5laWdoYm9yaW5nIGJvb2xf
dCB0byBib29sIGluDQo+ID4+IHN0cnVjdCBodm1fZG9tYWluLg0KPiA+Pg0KPiA+PiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IC0tLQ0KPiA+PiB2
MjogRG9uJ3Qgc2V0IHAybV9yYW1fcm9fdXNlZCB3aGVuIGZhaWxpbmcgdGhlIHJlcXVlc3QuDQo+
ID4+DQo+ID4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vZG0uYw0KPiA+PiArKysgYi94ZW4vYXJj
aC94ODYvaHZtL2RtLmMNCj4gPj4gQEAgLTI1NSwxNiArMjU1LDMzIEBAIHN0YXRpYyBpbnQgc2V0
X21lbV90eXBlKHN0cnVjdCBkb21haW4gKmQNCj4gPj4NCj4gPj4gICAgICAgIG1lbV90eXBlID0g
YXJyYXlfaW5kZXhfbm9zcGVjKGRhdGEtPm1lbV90eXBlLCBBUlJBWV9TSVpFKG1lbXR5cGUpKTsN
Cj4gPj4NCj4gPj4gLSAgICBpZiAoIG1lbV90eXBlID09IEhWTU1FTV9pb3JlcV9zZXJ2ZXIgKQ0K
PiA+PiArICAgIHN3aXRjaCAoIG1lbV90eXBlICkNCj4gPj4gICAgICAgIHsNCj4gPj4gICAgICAg
ICAgICB1bnNpZ25lZCBpbnQgZmxhZ3M7DQo+ID4+DQo+ID4+ICsgICAgY2FzZSBIVk1NRU1faW9y
ZXFfc2VydmVyOg0KPiA+PiAgICAgICAgICAgIGlmICggIWhhcF9lbmFibGVkKGQpICkNCj4gPj4g
ICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiA+Pg0KPiA+PiAgICAgICAgICAg
IC8qIERvIG5vdCBjaGFuZ2UgdG8gSFZNTUVNX2lvcmVxX3NlcnZlciBpZiBubyBpb3JlcSBzZXJ2
ZXIgbWFwcGVkLiAqLw0KPiA+PiAgICAgICAgICAgIGlmICggIXAybV9nZXRfaW9yZXFfc2VydmVy
KGQsICZmbGFncykgKQ0KPiA+PiAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPj4g
Kw0KPiA+PiArICAgICAgICBicmVhazsNCj4gPj4gKw0KPiA+PiArICAgIGNhc2UgSFZNTUVNX3Jh
bV9ybzoNCj4gPj4gKyAgICAgICAgLyogcDJtX3JhbV9ybyBjYW4ndCBiZSByZXByZXNlbnRlZCBp
biBJT01NVSBtYXBwaW5ncy4gKi8NCj4gPj4gKyAgICAgICAgZG9tYWluX2xvY2soZCk7DQo+ID4+
ICsgICAgICAgIGlmICggaGFzX2lvbW11X3B0KGQpICkNCj4gPj4gKyAgICAgICAgICAgIHJjID0g
LUVYREVWOw0KPiA+PiArICAgICAgICBlbHNlDQo+ID4+ICsgICAgICAgICAgICBkLT5hcmNoLmh2
bS5wMm1fcmFtX3JvX3VzZWQgPSB0cnVlOw0KPiA+DQo+ID4gRG8gd2UgcmVhbGx5IHdhbnQgdGhp
cyB0byBiZSBhIG9uZS13YXkgdHJpcD8gT24gdGhlIGZhY2Ugb2YgaXQsIGl0DQo+ID4gd291bGQg
c2VlbSB0aGF0IGtlZXBpbmcgYSBjb3VudCBvZiBwMm1fcmFtX3JvIGVudHJpZXMgd291bGQgYmUg
bW9yZQ0KPiA+IGRlc2lyYWJsZSBzdWNoIHRoYXQsIG9uY2UgdGhlIGxhc3Qgb25lIGlzIGdvbmUs
IGRldmljZXMgY2FuIGJlDQo+ID4gYXNzaWduZWQgYWdhaW4/DQo+IA0KPiBXZWxsLCBhdCB0aGlz
IHBvaW50IEknbSBub3QgcmVhbGx5IHVwIHRvIGludHJvZHVjaW5nIGFjY291bnRpbmcgb2YNCj4g
dGhlIG51bWJlciBvZiB1c2VzIG9mIHAybV9yYW1fcm8uIFRoaXMgY291bGQgYmUgYSBmdXJ0aGVy
IHN0ZXAgdG8NCj4gYmUgZG9uZSBpbiB0aGUgZnV0dXJlLCBpZiBuZWNlc3NhcnkuDQo+IA0KPiA+
IElmIG5vdCBtYXliZSBpdCdzIHRpbWUgdG8gZ28gYWxsIHRoZSB3YXkgYW5kIG1ha2UgaW9tbXUg
cGFnZSB0YWJsZQ0KPiA+IGNvbnN0cnVjdGlvbiBwYXJ0IG9mIGRvbWFpbiBjcmVhdGUgYW5kIHRo
ZW4gd2Ugc2ltcGxpZnkgYSBsb3Qgb2YNCj4gPiBjb2RlIGFuZCB3ZSBkb24ndCBuZWVkIGFueSBm
bGFnL3JlZmNvdW50IGxpa2UgdGhpcyBhdCBhbGwuDQo+IA0KPiBJJ3ZlIHNhaWQgdGhpcyBiZWZv
cmU6IEkgZG9uJ3QgdGhpbmsgaXQgc2hvdWxkIGJlIGEgcmVxdWlyZW1lbnQgdG8NCj4ga25vdyBh
dCB0aGUgdGltZSBvZiB0aGUgY3JlYXRpb24gb2YgYSBWTSB3aGV0aGVyIGl0J2xsIGV2ZW50dWFs
bHkNCj4gaGF2ZSBhIHBhc3MtdGhyb3VnaCBkZXZpY2UgYXNzaWduZWQuIEZ1cnRoZXJtb3JlIHlv
dSByZWFsaXplIHRoYXQNCj4gdGhpcyBzdWdnZXN0aW9uIG9mIHlvdXJzIGlzIGNvbnRyYXJ5IHRv
IHdoYXQgeW91J3ZlIHNhaWQgZnVydGhlciB1cDoNCj4gVGhpcyB3YXkgeW91J2QgbWFrZSB0aGUg
dHdvIHRoaW5ncyBleGNsdXNpdmUgb2Ygb25lIGFub3RoZXIgd2l0aG91dA0KPiBhbnkgcmVjb3Vy
c2UuDQoNClllcywgSSByZWFsaXplIHRoZSBzdWdnZXN0aW9ucyBhcmUgY29udHJhZGljdG9yeS4g
TXkgcG9pbnQgaXMgdGhhdCBhZGRpbmcgSU9NTVUgcGFnZXMgdG8gYSBydW5uaW5nIGRvbWFpbiBp
cyB0cmlja3kgYW5kIGxlYWRzIHRvIGlzc3VlcyBsaWtlIHRoZSBvbmUgeW91IGFyZSB0cnlpbmcg
dG8gc29sdmUgd2l0aCB0aGUgcmFtX3JvX3VzZWQgZmxhZy4NClRoZSB3aG9sZSBzdWJzeXN0ZW0g
aXMgaW4gbmVlZCBvZiBhbiBvdmVyaGF1bCBhbnl3YXkgc28gSSBndWVzcyB0aGlzIGJhbmQtYWlk
IGlzIG9rIGZvciBub3cuDQoNCiAgUGF1bA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==

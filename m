Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DE29E24A
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 10:23:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2Whj-0007xV-ED; Tue, 27 Aug 2019 08:19:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=deUM=WX=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i2Whh-0007xQ-Sp
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 08:19:49 +0000
X-Inumbo-ID: 6d047652-c8a3-11e9-ae2e-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d047652-c8a3-11e9-ae2e-12813bfff9fa;
 Tue, 27 Aug 2019 08:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566893986;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Cx6I9dcxJTG1zfMbqt2s6f7nAl+FxxPTvQPGO4TmrPY=;
 b=A4+RLuZ1CV514OKTKILdJZkmKc4Klm7ze2EZzDnu47j4oO1LBl1uaNiQ
 sAY0VClh8aymYjzLBoRL4wG6u1HvTgDDBWp8hgRI5j8hdd6vlKazTeb18
 bejJ7GjW94tMRrNTGs5oJwHdSL2JQEX8pdi9X/+wnV0YVEwNMv6bBm8EV 4=;
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
IronPort-SDR: Zd64YaMnqJALyBpgs5BnkI5mWnJsgOaOIvjkuvwKZMFUB+u5p2WmaMSqNs4ryuO3zHB66cva8a
 QO/nQ+pOZ0RjPoElsUTylDdek/jNpwDiEfcUDu/IT1XCPoQ7L9Fi8WES1YbYQDkum3wBw5v93v
 r7nU5oGS2hDrtxHQ7fAxPowjrpzcclUD0Ros6hmtH3A40er7lj59+rI/QwSgChxUd8FbEwNFR+
 ouvnRZ1n61RzSpTRDPWZte/7hU99aqnQ9sfRbqCgTnwg/DMPywhbJRYF8cxFgrxIolt/p/rAcM
 bOo=
X-SBRS: 2.7
X-MesageID: 4745735
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,436,1559534400"; 
   d="scan'208";a="4745735"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v6 02/10] x86/hvm/domain: remove the
 'hap_enabled' flag
Thread-Index: AQHVVFbb6wnJNaZqMESjSfgB0vCmtqcIkRKAgAAAjYCABiUg0A==
Date: Tue, 27 Aug 2019 08:19:39 +0000
Message-ID: <8349b70cdcdf434bbc6da7794d25e46d@AMSPEX02CL03.citrite.net>
References: <20190816172001.3905-1-paul.durrant@citrix.com>
 <20190816172001.3905-3-paul.durrant@citrix.com>
 <a109294b-6970-cf25-a2bb-fbb032ec24c9@citrix.com>
 <f3e88434-6800-2271-f5a0-9ea6776f9d40@citrix.com>
In-Reply-To: <f3e88434-6800-2271-f5a0-9ea6776f9d40@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v6 02/10] x86/hvm/domain: remove the
 'hap_enabled' flag
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxBbmRy
ZXcuQ29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50OiAyMyBBdWd1c3QgMjAxOSAxMzoyNg0KPiBU
bzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEtvbnJhZCBSemVzenV0ZWsgV2lsaw0K
PiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBA
Y2l0cml4LmNvbT47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsgSWFuDQo+IEphY2tzb24g
PElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0u
Y29tPjsgSmFuIEJldWxpY2gNCj4gPGpiZXVsaWNoQHN1c2UuY29tPjsgUm9nZXIgUGF1IE1vbm5l
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRD
SCB2NiAwMi8xMF0geDg2L2h2bS9kb21haW46IHJlbW92ZSB0aGUgJ2hhcF9lbmFibGVkJyBmbGFn
DQo+IA0KPiBPbiAyMy8wOC8yMDE5IDEzOjIzLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPiA+IE9u
IDE2LzA4LzIwMTkgMTg6MTksIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPj4gVGhlIGhhcF9lbmFi
bGVkKCkgbWFjcm8gY2FuIGRldGVybWluZSB3aGV0aGVyIHRoZSBmZWF0dXJlIGlzIGF2YWlsYWJs
ZQ0KPiA+PiB1c2luZyB0aGUgZG9tYWluICdvcHRpb25zJzsgdGhlcmUgaXMgbm8gbmVlZCBmb3Ig
YSBzZXBhcmF0ZSBmbGFnLg0KPiA+Pg0KPiA+PiBOT1RFOiBGdXJ0aGVybW9yZSwgYnkgZXh0ZW5k
aW5nIHNhbml0aXppaW5nIG9mIHRoZSBkb21haW4gJ29wdGlvbnMnLCB0aGUNCj4gPiBzL2lpL2kv
DQoNCk9oIHllcy4NCg0KPiA+DQo+ID4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG9tYWlu
LmMgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMNCj4gPj4gaW5kZXggOWE2ZWI4OWRkYy4uYmMwZGIw
MzM4NyAxMDA2NDQNCj4gPj4gLS0tIGEveGVuL2FyY2gveDg2L2RvbWFpbi5jDQo+ID4+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9kb21haW4uYw0KPiA+PiBAQCAtNDYwLDYgKzQ2MCwxMiBAQCBpbnQgYXJj
aF9zYW5pdGlzZV9kb21haW5fY29uZmlnKHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiAq
Y29uZmlnKQ0KPiA+PiAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPj4gICAgICB9DQo+ID4+
DQo+ID4+ICsgICAgaWYgKCAoY29uZmlnLT5mbGFncyAmIFhFTl9ET01DVExfQ0RGX2hhcCkgJiYg
IWh2bV9oYXBfc3VwcG9ydGVkKCkgKQ0KPiA+PiArICAgIHsNCj4gPj4gKyAgICAgICAgZHByaW50
ayhYRU5MT0dfSU5GTywgIkhBUCBlbmFibGVkIGJ1dCBub3Qgc3VwcG9ydGVkXG4iKTsNCj4gPiBz
L2VuYWJsZWQvcmVxdWVzdGVkLw0KPiA+DQoNCkknbSBub3QgZnVzc2VkLi4uIEkganVzdCB3ZW50
IHdpdGggdGhlIGluY3VtYmVudCBmbGFnIG5hbWUuDQoNCj4gPj4gZGlmZiAtLWdpdCBhL3hlbi9j
b21tb24vZG9tYWluLmMgYi94ZW4vY29tbW9uL2RvbWFpbi5jDQo+ID4+IGluZGV4IDc0NGI1NzIx
OTUuLjYxMDk2MjM3MzAgMTAwNjQ0DQo+ID4+IC0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMNCj4g
Pj4gKysrIGIveGVuL2NvbW1vbi9kb21haW4uYw0KPiA+PiBAQCAtMzEzLDYgKzMxMywxMyBAQCBz
dGF0aWMgaW50IHNhbml0aXNlX2RvbWFpbl9jb25maWcoc3RydWN0IHhlbl9kb21jdGxfY3JlYXRl
ZG9tYWluICpjb25maWcpDQo+ID4+ICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+PiAgICAg
IH0NCj4gPj4NCj4gPj4gKyAgICBpZiAoICEoY29uZmlnLT5mbGFncyAmIFhFTl9ET01DVExfQ0RG
X2h2bV9ndWVzdCkgJiYNCj4gPj4gKyAgICAgICAgIChjb25maWctPmZsYWdzICYgWEVOX0RPTUNU
TF9DREZfaGFwKSApDQo+ID4+ICsgICAgew0KPiA+PiArICAgICAgICBkcHJpbnRrKFhFTkxPR19J
TkZPLCAiSEFQIGVuYWJsZWQgZm9yIG5vbi1IVk0gZ3Vlc3RcbiIpOw0KPiA+IEFnYWluLCBJIHRo
aW5rICdyZXF1ZXN0ZWQnIHdvdWxkIGJlIGJldHRlciBoZXJlLg0KPiA+DQo+ID4+IGRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oDQo+
ID4+IGluZGV4IDJlNmUwZDM0ODguLjA3YTY0OTQ3ZWQgMTAwNjQ0DQo+ID4+IC0tLSBhL3hlbi9p
bmNsdWRlL3hlbi9zY2hlZC5oDQo+ID4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oDQo+
ID4+IEBAIC05NTQsNiArOTU0LDEyIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19odm1fdmNwdShj
b25zdCBzdHJ1Y3QgdmNwdSAqdikNCj4gPj4gICAgICByZXR1cm4gaXNfaHZtX2RvbWFpbih2LT5k
b21haW4pOw0KPiA+PiAgfQ0KPiA+Pg0KPiA+PiArc3RhdGljIGlubGluZSBib29sIGhhcF9lbmFi
bGVkKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpDQo+ID4+ICt7DQo+ID4+ICsgICAgcmV0dXJuIElT
X0VOQUJMRUQoQ09ORklHX0hWTSkgJiYgLyogbmVjZXNzYXJ5IGZvciBwdiBzaGltIGJ1aWxkICov
DQo+ID4+ICsgICAgICAgIGV2YWx1YXRlX25vc3BlYyhkLT5vcHRpb25zICYgWEVOX0RPTUNUTF9D
REZfaGFwKTsNCj4gPiBJJ20gbm90IHN1cmUgaG93IGhlbHBmdWwgdGhpcyBjb21tZW50IGlzLsKg
IFdoYXQgc2hvdWxkIGJlIGhlcmUgaG93ZXZlcg0KPiA+IGlzIGEgbm90ZSBzYXlpbmcgdGhhdCB0
aGlzIGxvZ2ljIGRlcGVuZHMgb24gZG9tYWluX2NyZWF0ZSgpIHJlamVjdGluZw0KPiA+ICFIVk3C
oCBhbmQgSEFQLg0KPiA+DQo+ID4gQWxsIGNhbiBiZSBhZGp1c3RlZCBvbiBjb21taXQgaWYgdGhl
cmUgYXJlIG5vIG90aGVyIGNvbmNlcm5zLg0KPiANCg0KT2suDQoNCj4gT25lIG90aGVyIHRoaW5n
LsKgIFdoeSBpcyB0aGlzIGV2YWxfbm9zcGVjKCk/DQo+IA0KDQpHZW5lcmFsIHBhcmFub2lhIGFi
b3V0IHdoYXQgbWlnaHQgaGFwcGVuIGluIHNwZWN1bGF0aW9uIGlmIHRoZSBpbmxpbmUgZXZhbHVh
dGVzIGZhbHNlIGFuZCB3ZSB3YW5kZXIgaW50byBlLmcuIHNoYWRvdyBjb2RlLg0KDQogIFBhdWwN
Cg0KPiB+QW5kcmV3DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

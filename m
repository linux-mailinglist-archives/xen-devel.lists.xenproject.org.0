Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 630D3A38B7
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 16:02:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3hRS-0007nx-TV; Fri, 30 Aug 2019 13:59:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0MMg=W2=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i3hRR-0007nq-EO
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 13:59:53 +0000
X-Inumbo-ID: 6fabe966-cb2e-11e9-ae8a-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6fabe966-cb2e-11e9-ae8a-12813bfff9fa;
 Fri, 30 Aug 2019 13:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567173592;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DrdcYdzLMNCdP7dSlFGORgJhmEnqzMyAu4wq5Og6EfI=;
 b=YShiY/RoZzcl8kNwe/ZSH3rw3qGwP9HBzNakwWOoEeLowXzmN44OQbTc
 NLAD/w8inn7LwGA9422LK/LG8M5cYOYK15JkRLVaUj/W3GPVxEbtNd6X0
 0kDmMGYtrbe6FkIxinwOFV6vrZdjnfk3bV5pF8PRe+YjFzAkRC9jZZ6/8 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: o3UjoHDcN8pKunYlwAP5MbI8x1v4bLuqhD5k8VYb5vWWvSOKaK3pgQqI5nAHYWWfKaFPVYedIh
 WdghwVhC84Z4b1MK950fPtn7AhzmM5YJ7DQf/nqXvnQ2Ask2+E7sYx/Dlc3TXGdi7RtXI4zpBk
 EU1SyEC7xWapkujl283kZRjEOEau2SJdT4HHE1YcE0ETQu0W568SzGY9R2fD6UqXak6XXWiGw1
 BuIqiSDN02iotNEJnXqFzTeUxjqXxyEngwCTvGgQgZnNN/j7NtTDoer3IrMBHzK3RtIfRpVCdU
 cFU=
X-SBRS: 2.7
X-MesageID: 4950282
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,447,1559534400"; 
   d="scan'208";a="4950282"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [PATCH v7 3/6] use is_iommu_enabled() where appropriate...
Thread-Index: AQHVXw0dqTeghFxsakG1eH4ZsodVRacTllsAgAAh1OA=
Date: Fri, 30 Aug 2019 13:59:47 +0000
Message-ID: <0fd69b8a9a014864a3ec85a22aa93ced@AMSPEX02CL03.citrite.net>
References: <20190830082953.2192-1-paul.durrant@citrix.com>
 <20190830082953.2192-4-paul.durrant@citrix.com>
 <116198cb-069c-34bf-e836-d23adfe8f83e@suse.com>
In-Reply-To: <116198cb-069c-34bf-e836-d23adfe8f83e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v7 3/6] use is_iommu_enabled() where
 appropriate...
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jun
 Nakajima <jun.nakajima@intel.com>, WeiLiu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, JulienGrall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau
 Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDMwIEF1Z3VzdCAyMDE5IDE0OjU4DQo+IFRvOiBQYXVsIER1
cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBTdXJhdmVlIFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5p
dEBhbWQuY29tPjsgSnVsaWVuR3JhbGwNCj4gPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgQW5kcmV3
IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uZQ0KPiA8
cm9nZXIucGF1QGNpdHJpeC5jb20+OyBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNo
dWtAZXBhbS5jb20+OyBHZW9yZ2UgRHVubGFwDQo+IDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+
OyBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+OyBLZXZpbiBUaWFuIDxrZXZp
bi50aWFuQGludGVsLmNvbT47DQo+IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz47IERhbmllbCBEZSBHcmFhZiA8ZGdkZWdyYUB0eWNoby5uc2EuZ292PjsgV2VpTGl1
DQo+IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY3IDMvNl0gdXNlIGlzX2lv
bW11X2VuYWJsZWQoKSB3aGVyZSBhcHByb3ByaWF0ZS4uLg0KPiANCj4gT24gMzAuMDguMjAxOSAx
MDoyOSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYv
aW9tbXUuaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaW9tbXUuaA0KPiA+IEBAIC02
MSw4ICs2MSwxNyBAQCBleHRlcm4gc3RydWN0IGlvbW11X29wcyBpb21tdV9vcHM7DQo+ID4NCj4g
PiAgI2lmZGVmIE5ERUJVRw0KPiA+ICAjIGluY2x1ZGUgPGFzbS9hbHRlcm5hdGl2ZS5oPg0KPiA+
IC0jIGRlZmluZSBpb21tdV9jYWxsKG9wcywgZm4sIGFyZ3MuLi4pICBhbHRlcm5hdGl2ZV9jYWxs
KGlvbW11X29wcy5mbiwgIyMgYXJncykNCj4gPiAtIyBkZWZpbmUgaW9tbXVfdmNhbGwob3BzLCBm
biwgYXJncy4uLikgYWx0ZXJuYXRpdmVfdmNhbGwoaW9tbXVfb3BzLmZuLCAjIyBhcmdzKQ0KPiA+
ICsjIGRlZmluZSBpb21tdV9jYWxsKG9wcywgZm4sIGFyZ3MuLi4pICAgICAgICAgXA0KPiA+ICso
eyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiA+ICsgICAg
KHZvaWQpb3BzOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiA+ICsgICAgYWx0
ZXJuYXRpdmVfY2FsbChpb21tdV9vcHMuZm4sICMjIGFyZ3MpOyAgXA0KPiA+ICt9KQ0KPiA+ICsN
Cj4gPiArIyBkZWZpbmUgaW9tbXVfdmNhbGwob3BzLCBmbiwgYXJncy4uLikgICAgICAgIFwNCj4g
PiArKHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gPiAr
ICAgICh2b2lkKW9wczsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gPiArICAg
IGFsdGVybmF0aXZlX3ZjYWxsKGlvbW11X29wcy5mbiwgIyMgYXJncyk7IFwNCj4gPiArfSkNCj4g
PiAgI2VuZGlmDQo+IA0KPiBXaGlsZSB1bmxpa2VseSB0byBiZWNvbWUgYW4gaXNzdWUsICJvcHMi
IHNob3VsZCBiZSBwYXJlbnRoZXNpemVkDQo+IGhlcmUuIEFsc28gd2UgY29tbW9ubHkgKGJ1dCwg
Z3JhbnRlZCwgbm90IGNvbnNpc3RlbnRseSkgcHV0ICh7IG9uDQo+IHRoZSAjZGVmaW5lIGxpbmUu
IENhbiBib3RoIGJlIGRvbmUgd2hpbGUgY29tbWl0dGluZy4NCj4gDQoNCk9rLCB0aGFua3MuDQoN
CiAgUGF1bA0KDQo+IEphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==

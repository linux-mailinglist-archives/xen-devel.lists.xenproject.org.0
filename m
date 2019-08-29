Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3F0A1BC4
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 15:48:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3Kjb-0006J4-Ir; Thu, 29 Aug 2019 13:45:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+tTk=WZ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i3Kja-0006Iz-4K
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 13:45:06 +0000
X-Inumbo-ID: 34ea7a16-ca63-11e9-b95f-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34ea7a16-ca63-11e9-b95f-bc764e2007e4;
 Thu, 29 Aug 2019 13:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567086305;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t2pZXiTiDV4QWLkuhbLq+7F8yApioBh10IdRyAdRf88=;
 b=O8MCetptnIgwq2pM0wnruRFoYZ4x+r36F9TyiRXKNrkAP44CoCAzDQRr
 TBPSaVklxjefUb0tKhR/JcfwtztnzFAVoMh7POUo8lKAzQdQUtUTtdca1
 xVPTCV8bJ/nn/ve00HcGTuT6bFvw5ZBU1JSf2HHe8NSkQ59lhKTW3vf78 Q=;
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
IronPort-SDR: YecgY/V8i9TRhOupX0ljnloYl/oqZtMD93aIUUXDXG7IVzdgXNxeilmK1HSdvRbtwY5pEHEsIE
 8nX4vQ2ahxsy2ThWRbt6EFLIbMfDtuoiUGAxak4+ocsMxkTlHI8aatY4m17+7Rd+w77rsvBvSX
 XkfzriBvZ7Xwe+OkTTmY7m1r4ZuCbxxPNS6kKROtVe9DXm5PDIzIWi6RCu/mrT4pYO9+dLYdM9
 afaKTburfZ8nJ8DZkHggfGOXaNTODJCwcZSeyzjzPNqe59QP3luOIRdHtO9X/UZtj6tzgNaXwl
 t5o=
X-SBRS: 2.7
X-MesageID: 5105110
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,443,1559534400"; 
   d="scan'208";a="5105110"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [PATCH v6 08/10] remove late (on-demand) construction of IOMMU
 page tables
Thread-Index: AQHVVFbb5tTQT4/srUC4uLEsnVa+qqcSFCCAgAAikDA=
Date: Thu, 29 Aug 2019 13:44:59 +0000
Message-ID: <6bc83685a50f44e2b7759dfbfc9c155d@AMSPEX02CL03.citrite.net>
References: <20190816172001.3905-1-paul.durrant@citrix.com>
 <20190816172001.3905-9-paul.durrant@citrix.com>
 <7ac91f71-eac4-bf13-ff01-09fe4d9b7376@suse.com>
In-Reply-To: <7ac91f71-eac4-bf13-ff01-09fe4d9b7376@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v6 08/10] remove late (on-demand)
 construction of IOMMU page tables
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI5IEF1Z3VzdCAyMDE5IDE0OjM5DQo+IFRvOiBQYXVsIER1
cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgQWxleGFu
ZHJ1IElzYWlsYQ0KPiA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+OyBQZXRyZSBQaXJjYWxhYnUg
PHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPjsgUmF6dmFuIENvam9jYXJ1DQo+IDxyY29qb2Nh
cnVAYml0ZGVmZW5kZXIuY29tPjsgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4
LmNvbT47IFJvZ2VyIFBhdSBNb25uZQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBWb2xvZHlt
eXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+OyBHZW9yZ2UgRHVubGFwDQo+
IDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0
cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47
IEtvbnJhZFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgVGFtYXMgSyBM
ZW5neWVsDQo+IDx0YW1hc0B0a2xlbmd5ZWwuY29tPjsgVGltIChYZW4ub3JnKSA8dGltQHhlbi5v
cmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDA4LzEw
XSByZW1vdmUgbGF0ZSAob24tZGVtYW5kKSBjb25zdHJ1Y3Rpb24gb2YgSU9NTVUgcGFnZSB0YWJs
ZXMNCj4gDQo+IE9uIDE2LjA4LjIwMTkgMTk6MTksIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiAt
LS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jDQo+ID4gKysrIGIveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvaW9tbXUuYw0KPiA+IEBAIC0xNDYsNiArMTQ2LDE3IEBAIHN0YXRpYyBp
bnQgX19pbml0IHBhcnNlX2RvbTBfaW9tbXVfcGFyYW0oY29uc3QgY2hhciAqcykNCj4gPiAgfQ0K
PiA+ICBjdXN0b21fcGFyYW0oImRvbTAtaW9tbXUiLCBwYXJzZV9kb20wX2lvbW11X3BhcmFtKTsN
Cj4gPg0KPiA+ICtzdGF0aWMgdm9pZCBfX2h3ZG9tX2luaXQgY2hlY2tfaHdkb21fcmVxcyhzdHJ1
Y3QgZG9tYWluICpkKQ0KPiANCj4gVGhpcyByZWFsbHkgc2hvdWxkIGhhdmUgY29uc3QsIGJ1dCBJ
IHJlYWxpemUgLi4uDQo+IA0KPiA+ICt7DQo+ID4gKyAgICBpZiAoIGlvbW11X2h3ZG9tX25vbmUg
fHwgIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZShkKSApDQo+ID4gKyAgICAgICAgcmV0dXJuOw0KPiA+
ICsNCj4gPiArICAgIGFyY2hfaW9tbXVfY2hlY2tfYXV0b3RyYW5zbGF0ZWRfaHdkb20oZCk7DQo+
IA0KPiAuLi4gdGhpcyBvbmUgd2FudHMgbm9uLWNvbnN0IChmb3IgLSBhZmFpY3QgLSBubyByZWFz
b24pLg0KPiANCj4gPiBAQCAtMTU5LDEyOSArMTcwLDQ0IEBAIGludCBpb21tdV9kb21haW5faW5p
dChzdHJ1Y3QgZG9tYWluICpkKQ0KPiA+ICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4NCj4gPiAg
ICAgIGhkLT5wbGF0Zm9ybV9vcHMgPSBpb21tdV9nZXRfb3BzKCk7DQo+ID4gLSAgICByZXR1cm4g
aGQtPnBsYXRmb3JtX29wcy0+aW5pdChkKTsNCj4gPiAtfQ0KPiA+ICsgICAgcmV0ID0gaGQtPnBs
YXRmb3JtX29wcy0+aW5pdChkKTsNCj4gPiArICAgIGlmICggcmV0ICkNCj4gPiArICAgICAgICBy
ZXR1cm4gcmV0Ow0KPiA+DQo+ID4gLXN0YXRpYyB2b2lkIF9faHdkb21faW5pdCBjaGVja19od2Rv
bV9yZXFzKHN0cnVjdCBkb21haW4gKmQpDQo+ID4gLXsNCj4gPiAtICAgIGlmICggaW9tbXVfaHdk
b21fbm9uZSB8fCAhcGFnaW5nX21vZGVfdHJhbnNsYXRlKGQpICkNCj4gPiAtICAgICAgICByZXR1
cm47DQo+ID4gKyAgICAvKg0KPiA+ICsgICAgICogTkI6ICdyZWxheGVkJyBoL3cgZG9tYWlucyBk
b24ndCBuZWVkIHRoZSBJT01NVSBtYXBwaW5ncyB0byBiZSBrZXB0DQo+ID4gKyAgICAgKiAgICAg
aW4tc3luYyB3aXRoIHRoZWlyIGFzc2lnbmVkIHBhZ2VzIGJlY2F1c2UgYWxsIGhvc3QgUkFNIHdp
bGwgYmUNCj4gPiArICAgICAqICAgICBtYXBwZWQgZHVyaW5nIGh3ZG9tX2luaXQoKS4NCj4gPiAr
ICAgICAqLw0KPiANCj4gRG9lc24ndCB0aGlzIGNvbW1lbnQgYmVsb25nIHRvIC4uLg0KPiANCj4g
PiArICAgIGlmICggaXNfaGFyZHdhcmVfZG9tYWluKGQpICkNCj4gPiArICAgICAgICBjaGVja19o
d2RvbV9yZXFzKGQpOyAvKiBtYXkgbW9kaWZ5IGlvbW11X2h3ZG9tX3N0cmljdCAqLw0KPiA+DQo+
ID4gLSAgICBhcmNoX2lvbW11X2NoZWNrX2F1dG90cmFuc2xhdGVkX2h3ZG9tKGQpOw0KPiA+ICsg
ICAgaWYgKCAhaXNfaGFyZHdhcmVfZG9tYWluKGQpIHx8IGlvbW11X2h3ZG9tX3N0cmljdCApDQo+
ID4gKyAgICAgICAgaGQtPm5lZWRfc3luYyA9ICFpb21tdV91c2VfaGFwX3B0KGQpOw0KPiANCj4g
Li4uIHRoaXMgaWYoKT8NCg0KWWVzLCBpdCdzIHByb2JhYmx5IGFkcmlmdCBmcm9tIHdoZXJlIGl0
IHNob3VsZCBiZSBub3cuDQoNCj4gDQo+ID4gQEAgLTYyOSw4ICs1NTIsNyBAQCBzdGF0aWMgdm9p
ZCBpb21tdV9kdW1wX3AybV90YWJsZSh1bnNpZ25lZCBjaGFyIGtleSkNCj4gPiAgICAgIG9wcyA9
IGlvbW11X2dldF9vcHMoKTsNCj4gPiAgICAgIGZvcl9lYWNoX2RvbWFpbihkKQ0KPiA+ICAgICAg
ew0KPiA+IC0gICAgICAgIGlmICggaXNfaGFyZHdhcmVfZG9tYWluKGQpIHx8DQo+ID4gLSAgICAg
ICAgICAgICBkb21faW9tbXUoZCktPnN0YXR1cyA8IElPTU1VX1NUQVRVU19pbml0aWFsaXplZCAp
DQo+ID4gKyAgICAgICAgaWYgKCAhaXNfaW9tbXVfZW5hYmxlZChkKSApDQo+ID4gICAgICAgICAg
ICAgIGNvbnRpbnVlOw0KPiANCj4gRGlkbid0IHlvdSBhZ3JlZSB0byByZXRhaW4gdGhlIGh3ZG9t
IHBhcnQgb2YgdGhlIGNvbmRpdGlvbiBoZXJlPw0KPiANCg0KSW5kZWVkIEkgaGF2ZSBhcyBvZiB0
b2RheSwgYnV0IHRoaXMgd2FzIHBvc3RlZCAyIHdlZWtzIGFnbyA6LSkNCg0KICBQYXVsDQoNCj4g
SmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

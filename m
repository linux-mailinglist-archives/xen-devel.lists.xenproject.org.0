Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE15A1490
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 11:20:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3GYg-0005v7-N2; Thu, 29 Aug 2019 09:17:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+tTk=WZ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i3GYg-0005v2-47
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 09:17:34 +0000
X-Inumbo-ID: d3acd502-ca3d-11e9-ae63-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3acd502-ca3d-11e9-ae63-12813bfff9fa;
 Thu, 29 Aug 2019 09:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567070250;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MG6it4HwlIdTcyEty+xfL3rLzxbeWJbVWpeEm3ouyP8=;
 b=XzJ+ibcOyP0P/OHqKdn+Kdxl8LzC3J1ZKTbkY1SahTkog+stAsjL4rTO
 pNEs4tAcdRmoqxwGzATuJJi6O2IBf3gr5O1PWhULmtp0ErEc/fpKo5ziv
 JJ7iypbIieZioL+QEf1W75GK4cEe6hWCj4Iau1w+3I/UbjaW9kGrizxbM A=;
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
IronPort-SDR: cva1XtdbDw8hAT7aj5R/iAeroRxkyYF7RidgqafUhN5oo3Cplc7ADa73BHe0/1W2izk+yfVYkB
 viiFJJ7GwciIF2q58Le7C6Tzce7WIKmPdZFB3q8oa42GOjEZ5v0mDxgMsAg5EB3SfKkXNdiE0q
 2CPWzHyx/UeQ0XQ+sAgu6OYLKzjOxkjF8wt8+TUTu7OHWiK2RIsxWl5dCBonmmff/i7EOc/g/a
 LIz5V/5W2597uIZL3mcMBNRruhwFBQivbYHC1q8So5GqX0Y25x9Y1X9VbLkw3OR0IzYlYe9Brf
 twA=
X-SBRS: 2.7
X-MesageID: 5093497
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,442,1559534400"; 
   d="scan'208";a="5093497"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH v6 07/10] use is_iommu_enabled() where appropriate...
Thread-Index: AQHVVFbaO5Tkcp5VZkOxX8NGKgV5+KcIeGUAgAlzZbA=
Date: Thu, 29 Aug 2019 09:17:26 +0000
Message-ID: <6ca6537eca6f4988b51744cacc08bcb1@AMSPEX02CL03.citrite.net>
References: <20190816172001.3905-1-paul.durrant@citrix.com>
 <20190816172001.3905-8-paul.durrant@citrix.com>
 <20190823105540.t2vbjbyd3zahlaan@Air-de-Roger>
In-Reply-To: <20190823105540.t2vbjbyd3zahlaan@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v6 07/10] use is_iommu_enabled() where
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Suravee
 Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiAyMyBBdWd1c3QgMjAxOSAxMTo1Ng0KPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZzsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPjsgSnVsaWVuIEdyYWxsDQo+IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IFZvbG9keW15
ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IEphbiBCZXVsaWNoDQo+IDxq
YmV1bGljaEBzdXNlLmNvbT47IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5j
b20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgSnVuIE5ha2FqaW1hDQo+IDxqdW4ubmFrYWppbWFA
aW50ZWwuY29tPjsgS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+OyBHZW9yZ2UgRHVu
bGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+Ow0KPiBTdXJhdmVlIFN1dGhpa3VscGFuaXQg
PHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPjsgQnJpYW4gV29vZHMgPGJyaWFuLndvb2Rz
QGFtZC5jb20+OyBEYW5pZWwgRGUNCj4gR3JhYWYgPGRnZGVncmFAdHljaG8ubnNhLmdvdj4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2NiAwNy8xMF0gdXNlIGlzX2lvbW11X2VuYWJsZWQoKSB3aGVy
ZSBhcHByb3ByaWF0ZS4uLg0KPiANCj4gT24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDY6MTk6NThQ
TSArMDEwMCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+IC4uLnJhdGhlciB0aGFuIHRlc3Rpbmcg
dGhlIGdsb2JhbCBpb21tdV9lbmFibGVkIGZsYWcgYW5kIG9wcyBwb2ludGVyLg0KPiA+DQo+ID4g
Tm93IHRoYXQgdGhlcmUgaXMgYSBwZXItZG9tYWluIGZsYWcgaW5kaWNhdGluZyB3aGV0aGVyIHRo
ZSBkb21haW4gaXMNCj4gPiBwZXJtaXR0ZWQgdG8gdXNlIHRoZSBJT01NVSAod2hpY2ggZGV0ZXJt
aW5lcyB3aGV0aGVyIHRoZSBvcHMgcG9pbnRlciB3aWxsDQo+ID4gYmUgc2V0KSwgbWFueSB0ZXN0
cyBvZiB0aGUgZ2xvYmFsIGlvbW11X2VuYWJsZWQgZmxhZyBhbmQgb3BzIHBvaW50ZXIgY2FuDQo+
ID4gYmUgdHJhbnNsYXRlZCBpbnRvIHRlc3RzIG9mIHRoZSBwZXItZG9tYWluIGZsYWcuIFNvbWUg
b2YgdGhlIG90aGVyIHRlc3RzIG9mDQo+ID4gcHVyZWx5IHRoZSBnbG9iYWwgaW9tbXVfZW5hYmxl
ZCBmbGFnIGNhbiBhbHNvIGJlIHRyYW5zbGF0ZWQgaW50byB0ZXN0cyBvZg0KPiA+IHRoZSBwZXIt
ZG9tYWluIGZsYWcuDQo+ID4NCj4gPiBOT1RFOiBUaGUgY29tbWVudCBpbiBpb21tdV9zaGFyZV9w
Mm1fdGFibGUoKSBpcyBhbHNvIGZpeGVkOyBuZWVkX2lvbW11KCkNCj4gPiAgICAgICBkaXNhcHBl
YXJlZCBzb21lIHRpbWUgYWdvLiBBbHNvLCB3aGlsc3QgdGhlIHN0eWxlIG9mIHRoZSAnaWYnIGlu
DQo+ID4gICAgICAgZmxhc2tfaW9tbXVfcmVzb3VyY2VfdXNlX3Blcm0oKSBpcyBmaXhlZCwgSSBo
YXZlIG5vdCB0cmFuc2xhdGVkIGFueQ0KPiA+ICAgICAgIGluc3RhbmNlcyBvZiB1MzIgaW50byB1
aW50MzJfdCB0byBrZWVwIGNvbnNpc3RlbmN5LiBJTU8gc3VjaCBhDQo+ID4gICAgICAgdHJhbnNs
YXRpb24gd291bGQgYmUgYmV0dGVyIGRvbmUgZ2xvYmFsbHkgZm9yIHRoZSBzb3VyY2UgbW9kdWxl
IGluDQo+ID4gICAgICAgYSBzZXBhcmF0ZSBwYXRjaC4NCj4gDQo+IEkndmUgdXN1YWxseSBjaGFu
Z2VkIHRob3NlIGluc3RhbmNlcyBhcyB0aGUgbGluZSBnZXRzIG1vZGlmaWVkIGFueXdheSwNCj4g
YnV0IEknbSBub3QgZ29pbmcgdG8gYXNrIGV2ZXJ5b25lIHRvIGRvIHRoaXMgaWYgdGhleSBkb24n
dCBmZWVsIGxpa2UNCj4gaXQuDQo+IA0KPiBUaGUgcHJvYmxlbSB3aXRoIGRvaW5nIHdob2xlc2Fs
ZSBjaGFuZ2VzIG9mIHUzMiAtPiB1aW50MzJfdCBpcyB0aGF0DQo+IHlvdSBpbnRyb2R1Y2UgYSBs
b3Qgb2Ygbm9pc2Ugd2hlbiB0cnlpbmcgdG8gdXNlIGdpdCBibGFtZSBhZnRlcndhcmRzDQo+IGZv
ciBleGFtcGxlLiBEb2luZyBpdCB3aGVuIHRvdWNoaW5nIHRoZSBsaW5lIGZvciBsZWdpdGltYXRl
IGNoYW5nZXMNCj4gYXZvaWRzIHRoZSBub2lzZS4NCj4gDQo+ID4gICAgICAgVGhlIGNoYW5nZSBp
biB0aGUgaW5pdGlhbGl6YXRpb24gb2YgdGhlICdoZCcgdmFyaWFibGUgaW4gaW9tbXVfbWFwKCkN
Cj4gPiAgICAgICBhbmQgaW9tbXVfdW5tYXAoKSBpcyBkb25lIHRvIGtlZXAgdGhlIFBWIHNoaW0g
YnVpbGQgaGFwcHkuIFdpdGhvdXQNCj4gPiAgICAgICB0aGlzIGNoYW5nZSBpdCB3aWxsIGZhaWwg
dG8gY29tcGlsZSB3aXRoIGVycm9ycyBvZiB0aGUgZm9ybToNCj4gPg0KPiA+IGlvbW11LmM6MzYx
OjMyOiBlcnJvcjogdW51c2VkIHZhcmlhYmxlIOKAmGhk4oCZIFstV2Vycm9yPXVudXNlZC12YXJp
YWJsZV0NCj4gPiAgICAgIGNvbnN0IHN0cnVjdCBkb21haW5faW9tbXUgKmhkID0gZG9tX2lvbW11
KGQpOw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4N
Cj4gDQo+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4NCj4gDQoNClRoYW5rcy4NCg0KPiBJIGhhdmVuJ3QgbG9va2VkIGhvd2V2ZXIgaWYgdGhlcmUg
YXJlIGZ1cnRoZXIgY2FzZXMgd2hlcmUNCj4gaW9tbXVfZW5hYmxlZCBzaG91bGQgYmUgY2hhbmdl
ZCBpbnRvIGlzX2lvbW11X2VuYWJsZWQuDQo+IA0KDQpKYW4gaGFkIGNsZWFybHkgY2hlY2tlZCBv
biBhIHByZXZpb3VzIHJldmlldyBpdGVyYXRpb24gYmVjYXVzZSBoZSBzcG90dGVkIGEgY291cGxl
IG9mIHBsYWNlcyBJIGhhZCBtaXNzZWQuIEknbSByZWFzb25hYmx5IGNvbmZpZGVudCBJJ3ZlIGZv
dW5kIHRoZW0gYWxsIG5vdy4NCg0KICBQYXVsDQoNCj4gPiBAQCAtNTU2LDggKzU2MCw4IEBAIGlu
dCBpb21tdV9kb19kb21jdGwoDQo+ID4gIHsNCj4gPiAgICAgIGludCByZXQgPSAtRU5PREVWOw0K
PiA+DQo+ID4gLSAgICBpZiAoICFpb21tdV9lbmFibGVkICkNCj4gPiAtICAgICAgICByZXR1cm4g
LUVOT1NZUzsNCj4gPiArICAgIGlmICggIWlzX2lvbW11X2VuYWJsZWQoZCkgKQ0KPiA+ICsgICAg
ICAgIHJldHVybiAtRU9QTk9UU1VQUDsNCj4gDQo+IEkgd291bGQgdXNlIEVOT0VOVCBoZXJlLCBi
dXQgSSBkb24ndCBoYXZlIGEgc3Ryb25nIG9waW5pb24uIFRoZQ0KPiBoeXBlcmNhbGwgaXMgc3Vw
cG9ydGVkLCBpdCdzIGp1c3QgdGhhdCB0aGVyZSdzIG5vIGlvbW11IGZvciB0aGlzDQo+IGRvbWFp
bi4NCj4gDQo+IFRoYW5rcywgUm9nZXIuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs

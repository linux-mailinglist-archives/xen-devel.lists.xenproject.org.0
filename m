Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B31C974D13
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 13:31:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqbuv-0005vi-Fx; Thu, 25 Jul 2019 11:28:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=owr5=VW=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hqbut-0005vc-73
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 11:28:11 +0000
X-Inumbo-ID: 47929ba2-aecf-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 47929ba2-aecf-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 11:28:09 +0000 (UTC)
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
IronPort-SDR: l7GNx4xzqUWq1Usa4zbZcBNhn5TzuGYsyXPVhnvFVJHJ36lYlbRfahqjVkpkok2PVe1szmYqq5
 81ROTvHhk1S5a18QbgBhnXnk27hdENsHRkPa8Yj4Q7P9TaPwJJVIMuJkq5MH/xGNIm87SujFkB
 H+WNPfTsXmUvqROLxI74vsEDWmkhF/Gtr+Qn1WEdpVoG1oYIiDlm/GWNIwHRrX8AmGwWyOzHg1
 kQWVbz45mGuzHmThSO04GEwL5ObRTsyEoNfwIxxQACyV2WLNsJzlGDrlvugAhg07djSZH72+Ib
 Rzs=
X-SBRS: 2.7
X-MesageID: 3526472
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3526472"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH 1/2] x86/iommu: avoid mapping the interrupt
 address range for hwdom
Thread-Index: AQHVQtNlBYiYbAvLoki7QHgazq2Xo6bbB3MAgAAqs5A=
Date: Thu, 25 Jul 2019 11:28:06 +0000
Message-ID: <a1b242da2f084c83bf20042962f5de15@AMSPEX02CL03.citrite.net>
References: <20190723154851.77627-1-roger.pau@citrix.com>
 <20190723154851.77627-2-roger.pau@citrix.com>
 <502a2fd8-5a03-0921-bf5f-bb88feae35c1@suse.com>
 <20190725105422.cymulz7ynruwycfy@Air-de-Roger>
In-Reply-To: <20190725105422.cymulz7ynruwycfy@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/2] x86/iommu: avoid mapping the interrupt
 address range for hwdom
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgUm9nZXIgUGF1IE1v
bm7DqQ0KPiBTZW50OiAyNSBKdWx5IDIwMTkgMTE6NTQNCj4gVG86IEphbiBCZXVsaWNoIDxKQmV1
bGljaEBzdXNlLmNvbT4NCj4gQ2M6IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJp
eC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtY
ZW4tZGV2ZWxdIFtQQVRDSCAxLzJdIHg4Ni9pb21tdTogYXZvaWQgbWFwcGluZyB0aGUgaW50ZXJy
dXB0IGFkZHJlc3MgcmFuZ2UgZm9yIGh3ZG9tDQo+IA0KPiBPbiBUaHUsIEp1bCAyNSwgMjAxOSBh
dCAxMDoyMjoxN0FNICswMDAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPiBPbiAyMy4wNy4yMDE5
IDE3OjQ4LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6DQo+ID4gPiBDdXJyZW50IGNvZGUgb25seSBw
cmV2ZW50IG1hcHBpbmcgdGhlIGxhcGljIHBhZ2UgaW50byB0aGUgZ3Vlc3QNCj4gPiA+IHBoeXNp
Y2FsIG1lbW9yeSBtYXAuIEV4cGFuZCB0aGUgcmFuZ2UgdG8gYmUgMHhGRUV4X3h4eHggYXMgZGVz
Y3JpYmVkDQo+ID4gPiBpbiB0aGUgSW50ZWwgVlRkIHNwZWNpZmljYXRpb24gc2VjdGlvbiAzLjEz
ICJIYW5kbGluZyBSZXF1ZXN0cyB0bw0KPiA+ID4gSW50ZXJydXB0IEFkZHJlc3MgUmFuZ2UiLg0K
PiA+ID4NCj4gPiA+IEFNRCBhbHNvIGxpc3RzIHRoaXMgYWRkcmVzcyByYW5nZSBpbiB0aGUgQU1E
IFNSNTY5MCBEYXRhYm9vaywgc2VjdGlvbg0KPiA+ID4gMi40LjQgIk1TSSBJbnRlcnJ1cHQgSGFu
ZGxpbmcgYW5kIE1TSSB0byBIVCBJbnRlcnJ1cHQgQ29udmVyc2lvbiIuDQo+ID4gPg0KPiA+ID4g
UmVxdWVzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0K
PiA+ID4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+DQo+ID4NCj4gPiBJJ3ZlIGNvbW1pdHRlZCB0aGlzIG9uIHRoZSBiYXNpcyB0aGF0IGl0IHNo
b3VsZG4ndCBodXJ0LCBidXQgaGF2aW5nDQo+ID4gdGhvdWdodCBhYm91dCB0aGlzIHNvbWUgbW9y
ZSBJJ20gbm90IHJlYWxseSBzdXJlIEkgc2VlIHRoZSBwb2ludDoNCj4gPiBUaGUgSU9NTVUgc3Bl
Y2lhbCBjYXNlcyBhY2Nlc3NlcyBpbnRvIHRoaXMgcmFuZ2UgYW55d2F5LCB0byByZWRpcmVjdA0K
PiA+IGxvb2t1cCB0byB0aGUgaW50ZXJydXB0IHJlbWFwcGluZyB0YWJsZSBpbnN0ZWFkIG9mIHRo
ZSBETUEgcmVtYXBwaW5nDQo+ID4gb25lLiBIZW5jZSBhbnkgbWFwcGluZ3MgaW5zZXJ0ZWQgaW50
byB0aGlzIHJhbmdlIGFyZSBzaW1wbHkgdXNlbGVzcywNCj4gPiBidXQgc2hvdWxkbid0IG90aGVy
d2lzZSBodXJ0Lg0KPiANCj4gSW50ZWwgU0RNIGNvbnRhaW5zOg0KPiANCj4gIlNvZnR3YXJlIG11
c3QgZW5zdXJlIHRoZSBzZWNvbmQtbGV2ZWwgcGFnaW5nLXN0cnVjdHVyZSBlbnRyaWVzIGFyZQ0K
PiBwcm9ncmFtbWVkIG5vdCB0byByZW1hcCBpbnB1dCBhZGRyZXNzZXMgdG8gdGhlIGludGVycnVw
dCBhZGRyZXNzDQo+IHJhbmdlLiBIYXJkd2FyZSBiZWhhdmlvciBpcyB1bmRlZmluZWQgZm9yIG1l
bW9yeSByZXF1ZXN0cyByZW1hcHBlZCB0bw0KPiB0aGUgaW50ZXJydXB0IGFkZHJlc3MgcmFuZ2Uu
Ig0KPiANCj4gSW4gc2VjdGlvbiAzLjEzIChIYW5kbGluZyBSZXF1ZXN0cyB0byBJbnRlcnJ1cHQg
QWRkcmVzcyBSYW5nZSkuDQo+IA0KPiBTaW5jZSBhcmNoX2lvbW11X2h3ZG9tX2luaXQvaHdkb21f
aW9tbXVfbWFwIGFkZHMgZW50cmllcyB0byBib3RoIHRoZQ0KPiBoYXAgYW5kIHRoZSBpb21tdSBw
YWdlIHRhYmxlcyAob3IgdG8gaGFwIG9ubHkgaWYgc2hhcmVkKSBYZW4gc2hvdWxkIGJlDQo+IGNh
cmVmdWwgdG8gbm90IG1hcCB0aGlzIHJhbmdlIGJlY2F1c2UgdGhlIGlvbW11IHNwZWNpYWwgY2Fz
ZXMgdGhpcw0KPiByYW5nZSwgYnV0IEknbSBub3Qgc3VyZSB3aGF0IGhhcCBkb2VzLg0KDQpQcmVz
dW1hYmx5IHN1Y2ggcmFuZ2VzIHNob3VsZCBuZXZlciBlbmQgdXAgaW4gdGhlIFAyTSBhcyB0aGV5
J2QgbmVlZCB0byBiZSB0cmFwcGVkIGZvciBlbXVsYXRpb24/DQoNCiAgUGF1bA0KDQo+IA0KPiBU
aGFua3MsIFJvZ2VyLg0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdA0KPiBYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==

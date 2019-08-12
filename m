Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B3989BBB
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 12:40:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hx7iN-0003Pj-Kw; Mon, 12 Aug 2019 10:38:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nxYI=WI=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hx7iM-0003PC-DR
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 10:38:10 +0000
X-Inumbo-ID: 46a16dc1-bced-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 46a16dc1-bced-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 10:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565606289;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Cws5JtbctLhMAcn+H42z6x1TDT5e1xy2PKmWGxOPKtk=;
 b=RLatD42cfa9zuEdPef3aFMEA6grAfY/ni3vSWeEpd1SmXoej+Bs4xN+q
 WAc/qaEC0kHOYopVCGqNgWlwFCMYHFLz24OOR6MMwvJvkdV/3CoipkfQJ
 V+QdJnLzivcr1lOO9BZ93IqiyYBhuQz75lsEpUjL5ddgkPXPeR2Knj3op c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=PermError smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: PermError (esa4.hc3370-68.iphmx.com: cannot
 correctly interpret sender authenticity information from
 domain of Paul.Durrant@citrix.com) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yZAbWa5dCnq9NfIsP4kCixAjODI1h4f2MPs0sDnA434+NhzkNv4S6mF4Ad4dMG2R5piS+mxfAA
 AOkFCkroy+s03gJNuXDs81AfikZ7049vkA2R81Ffm/GEjM0YrN5RydOgdmYSvKQYWR1PbS9dhd
 eWa2dHgQCxKzwP4xsEHwfZQ7DpqC72SCrFFgEvBSCUnQk+rGnXVdcS3QGevcFsSzNFzN6Y8z19
 cbNHrzV59Zvhp9ZTUc8M9wkUYwB9xRxGeAfbXExw+r2Nh7/UPJIERH/uAJZgkAr3fXnpGh3eiK
 IVY=
X-SBRS: 2.7
X-MesageID: 4345664
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,377,1559534400"; 
   d="scan'208";a="4345664"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH] fix BUG in gnttab_unpopulate_status_frames()
Thread-Index: AQHVRvYAVIzNPfBQM0evYbtd17PLOabn0gGAgAAMYYCAD4eKIA==
Date: Mon, 12 Aug 2019 10:38:05 +0000
Message-ID: <66fd6d83f2894481bbd82e3b85051f79@AMSPEX02CL03.citrite.net>
References: <20190730164401.34097-1-paul.durrant@citrix.com>
 <a1525160-a23d-59cb-74a1-ed3f70a535e6@suse.com>
 <c34a0262-1f5c-70d1-5fb7-c18c69934ce5@citrix.com>
In-Reply-To: <c34a0262-1f5c-70d1-5fb7-c18c69934ce5@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] fix BUG in gnttab_unpopulate_status_frames()
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
 Grall <julien.grall@arm.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZW9yZ2UgRHVubGFwIDxnZW9y
Z2UuZHVubGFwQGNpdHJpeC5jb20+DQo+IFNlbnQ6IDAyIEF1Z3VzdCAyMDE5IDE2OjI4DQo+IFRv
OiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+OyBQYXVsIER1cnJhbnQgPFBhdWwuRHVy
cmFudEBjaXRyaXguY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8QW5k
cmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0
cml4LmNvbT47IElhbiBKYWNrc29uDQo+IDxJYW4uSmFja3NvbkBjaXRyaXguY29tPjsgU3RlZmFu
byBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgS29ucmFkIFJ6ZXN6dXRlayBX
aWxrDQo+IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgVGltIChYZW4ub3JnKSA8dGltQHhlbi5v
cmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBmaXggQlVH
IGluIGdudHRhYl91bnBvcHVsYXRlX3N0YXR1c19mcmFtZXMoKQ0KPiANCj4gT24gOC8yLzE5IDM6
NDQgUE0sIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+IE9uIDMwLjA3LjIwMTkgMTg6NDQsIFBhdWwg
RHVycmFudCB3cm90ZToNCj4gPj4gLS0tIGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jDQo+ID4+
ICsrKyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYw0KPiA+PiBAQCAtMTY4Miw2ICsxNjgyLDE0
IEBAIGdudHRhYl91bnBvcHVsYXRlX3N0YXR1c19mcmFtZXMoc3RydWN0IGRvbWFpbiAqZCwgc3Ry
dWN0IGdyYW50X3RhYmxlICpndCkNCj4gPj4gICAgICAgICAgIHN0cnVjdCBwYWdlX2luZm8gKnBn
ID0gdmlydF90b19wYWdlKGd0LT5zdGF0dXNbaV0pOw0KPiA+PiAgICAgICAgICAgZ2ZuX3QgZ2Zu
ID0gZ250dGFiX2dldF9mcmFtZV9nZm4oZ3QsIHRydWUsIGkpOw0KPiA+Pg0KPiA+PiArICAgICAg
ICBpZiAoICFnZXRfcGFnZShwZywgZCkgKQ0KPiA+PiArICAgICAgICB7DQo+ID4+ICsgICAgICAg
ICAgICBncHJpbnRrKFhFTkxPR19FUlIsDQo+ID4+ICsgICAgICAgICAgICAgICAgICAgICJDb3Vs
ZCBub3QgZ2V0IGEgcmVmZXJlbmNlIHRvIHN0YXR1cyBmcmFtZSAldVxuIiwgaSk7DQo+ID4+ICsg
ICAgICAgICAgICBkb21haW5fY3Jhc2goZCk7DQo+ID4+ICsgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsNCj4gPj4gKyAgICAgICAgfQ0KPiA+PiArDQo+ID4+ICAgICAgICAgICAvKg0KPiA+PiAg
ICAgICAgICAgICogRm9yIHRyYW5zbGF0ZWQgZG9tYWlucywgcmVjb3ZlcmluZyBmcm9tIGZhaWx1
cmUgYWZ0ZXIgcGFydGlhbA0KPiA+PiAgICAgICAgICAgICogY2hhbmdlcyB3ZXJlIG1hZGUgaXMg
bW9yZSBjb21wbGljYXRlZCB0aGFuIGl0IHNlZW1zIHdvcnRoDQo+ID4+IEBAIC0xNzA4LDYgKzE3
MTYsNyBAQCBnbnR0YWJfdW5wb3B1bGF0ZV9zdGF0dXNfZnJhbWVzKHN0cnVjdCBkb21haW4gKmQs
IHN0cnVjdCBncmFudF90YWJsZSAqZ3QpDQo+ID4+DQo+ID4+ICAgICAgICAgICBCVUdfT04ocGFn
ZV9nZXRfb3duZXIocGcpICE9IGQpOw0KPiA+PiAgICAgICAgICAgcHV0X3BhZ2VfYWxsb2NfcmVm
KHBnKTsNCj4gPj4gKyAgICAgICAgcHV0X3BhZ2UocGcpOw0KPiA+Pg0KPiA+PiAgICAgICAgICAg
aWYgKCBwZy0+Y291bnRfaW5mbyAmIH5QR0NfeGVuX2hlYXAgKQ0KPiA+PiAgICAgICAgICAgew0K
PiA+Pg0KPiA+DQo+ID4gSSBkaXNsaWtlIHRoaXMgYXBwcm9hY2gsIGFuZCBub3QgY2hvc2luZyB0
aGUgYWx0ZXJuYXRpdmUgb2YgZXhjbHVkaW5nDQo+ID4geGVuaGVhcCBwYWdlcyBpbiB0aGUgY2hl
Y2sgaW4gcHV0X3BhZ2VfYWxsb2NfcmVmKCkgKGFzIEkgaGFkIHJlY29tbWVuZGVkDQo+ID4gZWxz
ZXdoZXJlKSBzaG91bGQgYXQgbGVhc3QgYmUgZGlzY3Vzc2VkIGluIHRoZSBkZXNjcmlwdGlvbi4g
SXQgaXMgdGhlDQo+ID4gdmVyeSBuYXR1cmUgb2YgeGVuaGVhcCBwYWdlcyB0aGF0IHRoZXkgd29u
J3QgZ2V0IGZyZWVkLCBhbmQgaGVuY2UgZG9uJ3QNCj4gPiBuZWVkIHRoaXMgZXh0cmEgcmVmIHRv
IGJlIGhlbGQgZm9yIGNsZWFyaW5nIFBHQ19hbGxvY2F0ZWQuDQo+IA0KPiBBbHNvLCBpdCBsb29r
cyBsaWtlIHRoZXJlIGFyZSBvdGhlciBwbGFjZXMgd2hlcmUgdGhlIEJVR19PTigpIG1heSAvDQo+
IHNob3VsZCBiZSBmaXJpbmc6ICBuYW1lbHksIHZteF9mcmVlX3ZsYXBpY19tYXBwaW5nKCkgYW5k
DQo+IHVuc2hhcmVfeGVub3Byb2ZfcGFnZV93aXRoX2d1ZXN0KCkuICBUZWFjaGluZyBwdXRfcGFn
ZV9hbGxvY19yZWYoKSB0aGF0DQo+IGRyb3BwaW5nIFBHQ19hbGxvY2F0ZWQgd2hlbiBQR0NfeGVu
X2hlYXAgaXMgc2V0IGlzIHNhZmUgd291bGQgZml4IGFsbA0KPiB0aHJlZSBhdCBvbmNlLg0KPiAN
Cj4gUG9zc2libHkgbW9yZSBpbXBvcnRhbnRseSwgc3VwcG9zZSB0aGF0IHRoZSBmaXJzdCB0aW1l
DQo+IGdudHRhYl91bnBvcHVsYXRlX3N0YXR1c19mcmFtZXMoKSBjb21lcyBhcm91bmQsIGd0LT5z
dGF0dXNbMV0gaXMgc3RpbGwNCj4gbWFwcGVkIGJ5IHRoZSBndWVzdC4gIFRoZW4gZ3QtPnN0YXR1
c1swXSB3aWxsIGhhdmUgaXRzIHJlZmNvdW50IHJlZHVjZWQNCj4gdG8gMCAoYnV0IG5vdCBmcmVl
ZCksIGJ1dCBndC0+c3RhdHVzWzFdIHdpbGwgYmUgcmVzdG9yZWQgdG8gaXRzIHByZXZpb3VzDQo+
IHN0YXRlLiAgSWYgdGhlIGd1ZXN0IHVubWFwcyBndC0+c3RhdHVzWzFdIGFuZA0KPiBnbnR0YWJf
dW5wb3B1bGF0ZV9zdGF0dXNfZnJhbWVzKCkgaXMgY2FsbGVkIGFnYWluLCB0aGVuIHRoZQ0KPiBn
ZXRfcGFnZShndC0+c3RhdHVzWzBdKSB3aWxsIGZhaWwgKHNpbmNlIGl0cyByZWZjb3VudCBpcyAw
KSwgY2F1c2luZyB0aGUNCj4gZ3Vlc3QgdG8gYmUgY3Jhc2hlZCBpbnN0ZWFkLg0KPiANCj4gTm90
IHRlcnJpYmxlIGZvciBzdWNoIGEgd29ua2lseS1iZWhhdmluZyBndWVzdDsgYnV0IEkgdGhpbmsg
SSdkIHJhdGhlcg0KPiBnbyB3aXRoIHRoZSAic3BlY2lhbC1jYXNlIHhlbmhlYXAgcGFnZXMiIG9w
dGlvbi4NCg0KT2ssIEkgc2VlIHlvdSd2ZSBjb21taXR0ZWQgYSBwYXRjaCB0byB0aGF0IGVmZmVj
dCB3aGlsZSBJIHdhcyBhd2F5Lg0KDQogIFBhdWwNCg0KPiANCj4gIC1HZW9yZ2UNCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

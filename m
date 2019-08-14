Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7439F8D1E3
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 13:14:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxrBL-0002MZ-F8; Wed, 14 Aug 2019 11:11:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GkAm=WK=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hxrBK-0002MN-QW
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 11:11:06 +0000
X-Inumbo-ID: 35779cc4-be84-11e9-8c9f-af35c54948fb
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35779cc4-be84-11e9-8c9f-af35c54948fb;
 Wed, 14 Aug 2019 11:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565781066;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nfGF0R28hDViJErwEZ085iAeroneLGA8w42Sd9PV47o=;
 b=GnjRY7yOU6RXEM0PR76ORPTFtv6fZ8haFEc1saH7BLnFu/BYBi8rpnQ7
 VjJKms09s8WnalLbehjVAXghQ5vZ3dNbMWp78kb+G0axPKdnyRiARQ/1m
 S9p3/o65QkXg7U2+rPgOK9vWAjbhPzJHY7LdxWahh+k1MLswZbwlN5161 o=;
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
IronPort-SDR: MW06026qIvdHw7SpnH7Gj05rokva2SHmd6eHszcy+A+Vwr9c6ynyiuKF80yI+zgR6h17SVjB/w
 XTE7wcy9yfLO8sJFrvqsNl3Ea6kQL9SF0gMA1nZhoSdtM4jzDQboqTl5JzSLcDyuQV/9YA+kC4
 x+CTUpUOHHbZ91HYHbVMPRVzEreinx6AfBcz27KQzumkNZYDsu5xqczYGQ4KrkzZLAHKkAkSaS
 +xhFoT2bHgtlOs4PUWeqxD3CEgvYOsEN10Rid/GDpRlkDV4S9/I/GHmmGLXp/F7vXyZfcyE7qe
 Vis=
X-SBRS: 2.7
X-MesageID: 4263046
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,385,1559534400"; 
   d="scan'208";a="4263046"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Julien Grall' <julien.grall@arm.com>, 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [PATCH 5/6] iommu: tidy up iommu_us_hap_pt() and
 need_iommu_pt_sync() macros
Thread-Index: AQHVRuOcR30mXE7x90iLttuoVGpOQKbvafsAgAsWnkD//+QDAIAAIpGQ///kIICAACaCkA==
Date: Wed, 14 Aug 2019 11:11:00 +0000
Message-ID: <6c00b9a439aa4d57b2973752c8eaf393@AMSPEX02CL03.citrite.net>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-6-paul.durrant@citrix.com>
 <805cd751-819a-a7d6-0755-9e82bcde2a37@suse.com>
 <57e844af36d449d0a8961793e8649827@AMSPEX02CL03.citrite.net>
 <dcf5c21a-bce4-e315-9ae9-ac1f67c0c889@arm.com>
 <8e99da72bafe4b1a8a92e146b07a3082@AMSPEX02CL03.citrite.net>
 <da3a819d-6f04-a002-25a8-10ad209e6bc8@arm.com>
In-Reply-To: <da3a819d-6f04-a002-25a8-10ad209e6bc8@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 5/6] iommu: tidy up iommu_us_hap_pt() and
 need_iommu_pt_sync() macros
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPg0KPiBTZW50OiAxNCBBdWd1c3QgMjAxOSAxMTo0NQ0KPiBUbzogUGF1
bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47ICdKYW4gQmV1bGljaCcgPGpiZXVs
aWNoQHN1c2UuY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBBbmRy
ZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm5lDQo+
IDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFi
Y2h1a0BlcGFtLmNvbT47IEdlb3JnZSBEdW5sYXANCj4gPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNv
bT47IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxs
aW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxr
b25yYWQud2lsa0BvcmFjbGUuY29tPjsgVGltIChYZW4ub3JnKSA8dGltQHhlbi5vcmc+Ow0KPiBX
ZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDUvNl0gaW9tbXU6IHRp
ZHkgdXAgaW9tbXVfdXNfaGFwX3B0KCkgYW5kIG5lZWRfaW9tbXVfcHRfc3luYygpIG1hY3Jvcw0K
PiANCj4gSGksDQo+IA0KPiBPbiAxNC8wOC8yMDE5IDExOjI3LCBQYXVsIER1cnJhbnQgd3JvdGU6
DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEp1bGllbiBHcmFs
bCA8anVsaWVuLmdyYWxsQGFybS5jb20+DQo+ID4+IFNlbnQ6IDE0IEF1Z3VzdCAyMDE5IDExOjIx
DQo+ID4+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgJ0phbiBC
ZXVsaWNoJyA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc7IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBS
b2dlciBQYXUgTW9ubmUNCj4gPj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgVm9sb2R5bXlyIEJh
YmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgR2VvcmdlIER1bmxhcA0KPiA+PiA8
R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJp
eC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
OyBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBUaW0gKFhl
bi5vcmcpDQo+IDx0aW1AeGVuLm9yZz47DQo+ID4+IFdlaSBMaXUgPHdsQHhlbi5vcmc+DQo+ID4+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNS82XSBpb21tdTogdGlkeSB1cCBpb21tdV91c19oYXBfcHQo
KSBhbmQgbmVlZF9pb21tdV9wdF9zeW5jKCkgbWFjcm9zDQo+ID4+DQo+ID4+IEhpIFBhdWwsDQo+
ID4+DQo+ID4+IE9uIDE0LzA4LzIwMTkgMTE6MTMsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPj4+
Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2lvbW11LmgNCj4gPj4+Pj4gKysrIGIveGVuL2luY2x1
ZGUveGVuL2lvbW11LmgNCj4gPj4+Pj4gQEAgLTI2OCw2ICsyNjgsMTMgQEAgc3RydWN0IGRvbWFp
bl9pb21tdSB7DQo+ID4+Pj4+ICAgICAjZGVmaW5lIGlvbW11X3NldF9mZWF0dXJlKGQsIGYpICAg
c2V0X2JpdChmLCBkb21faW9tbXUoZCktPmZlYXR1cmVzKQ0KPiA+Pj4+PiAgICAgI2RlZmluZSBp
b21tdV9jbGVhcl9mZWF0dXJlKGQsIGYpIGNsZWFyX2JpdChmLCBkb21faW9tbXUoZCktPmZlYXR1
cmVzKQ0KPiA+Pj4+Pg0KPiA+Pj4+PiArLyogQXJlIHdlIHVzaW5nIHRoZSBkb21haW4gUDJNIHRh
YmxlIGFzIGl0cyBJT01NVSBwYWdldGFibGU/ICovDQo+ID4+Pj4+ICsjZGVmaW5lIGlvbW11X3Vz
ZV9oYXBfcHQoZCkgXA0KPiA+Pj4+PiArICAgIChoYXBfZW5hYmxlZChkKSAmJiBpc19pb21tdV9l
bmFibGVkKGQpICYmIGlvbW11X2hhcF9wdF9zaGFyZSkNCj4gPj4+Pg0KPiA+Pj4+IERvZXMgdGhp
cyBidWlsZCBmb3IgQXJtLCBzZWVpbmcgdGhhdCB0aGVyZSdzIG5vIGhhcF9lbmFibGVkKCkNCj4g
Pj4+PiBkZWZpbml0aW9uIHRoZXJlPyBPciBoYXZlIEkgbWlzc2VkIGl0cyBhZGRpdGlvbiBlYXJs
aWVyIGluIHRoaXMNCj4gPj4+PiBzZXJpZXM/DQo+ID4+Pg0KPiA+Pj4gSXQgbW92ZWQgdG8gY29t
bW9uIGNvZGUgc2NoZWQuaCBpbiBhbiBlYXJsaWVyIHBhdGNoLg0KPiA+Pg0KPiA+PiBJIHdlbnQg
dGhyb3VnaCB0aGUgc2VyaWVzIGFuZCBkaWRuJ3QgZmluZCB3aGVyZSBoYXBfZW5hYmxlZCgpIGlz
IGRlZmluZWQgZm9yIEFybQ0KPiA+PiBpbiB0aGlzIHNlcmllcy4gRG8geW91IG1pbmQgcG9pbnRp
bmcgdGhlIGV4YWN0IHBhdGNoPw0KPiA+Pg0KPiA+DQo+ID4gU29ycnksIEkgd2Fzbid0IGNsZWFy
Li4uIFRoZSBjaGFuZ2UgaXMgaW4gbXkgb3RoZXIgc2VyaWVzLCAidXNlIHN0YXNoZWQgZG9tYWlu
IGNyZWF0ZSBmbGFncyIsIHdoaWNoDQo+IGlzIGEgcHJlLXJlcXVpc2l0ZSBmb3IgdGhpcyBzZXJp
ZXMgKGFzIGNhbGxlZCBvdXQgaW4gdGhlIGNvdmVyIGxldHRlcikuIFRoZSBjaGFuZ2UgaXMgbWFk
ZSBpbiBwYXRjaCAjMg0KPiBvZiB0aGF0IHNlcmllczogaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA3L21zZzAyMjU2Lmh0bWwuDQo+IA0K
PiBPaC4gSSB1bmRlcnN0YW5kIHRoaXMgYWRkcyBiZW5lZml0cyBhcyB0aGUgaW1wbGVtZW50YXRp
b24gaXMgbm93IGNvbW1vbi4gQnV0IHRoZQ0KPiBkb3duc2lkZSBpcyBoYXBfZW5hYmxlZCgpIHdp
bGwgbm93IHJlcXVpcmUgZXZhbHVhdGlvbiBvbiBBcm0gZXZlbiBpdCBpcw0KPiBldmFsdWF0ZXMg
dG8gdHJ1ZS4uLiBUaGlzIHdpbGwgcHJldmVudCB0aGUgY29tcGlsZXIgdG8gcmVtb3ZlIGFueSBu
b24tSEFQIGNvZGUNCj4gcGF0aHMgKGFzc3VtaW5nIHRoZXJlIGFyZSBhbnkgaW4gdGhlIGNvbW1v
biBjb2RlKS4NCg0KVGhlcmUgd2FzIG9uZSBpbiB0aGUgY29tbW9uIGlvbW11IGNvZGUgdGhhdCB0
aHVzIHJlcXVpcmVkIGEgI2lmZGVmIGZvciBBUk0uDQoNCj4gDQo+IEZ1cnRoZXJtb3JlLCAyIHBh
cnRzIG9mIHRoZSBpb21tdV91c2VfaGFwX3B0KCkgY29uZGl0aW9uIHdpbGwgYWx3YXlzIHJldHVy
bmluZw0KPiBhbHdheXMgdHJ1ZS4gQnV0IGFzIHRoZXkgYXJlIG5vbi1jb25zdGFudCwgc28gdGhl
eSB3aWxsIGFsd2F5cyBiZSBldmFsdWF0ZWQuDQo+IA0KPiBJdCBpcyBhbHNvIHByb2JhYmx5IGdv
aW5nIHRvIGNvbmZ1c2UgZGV2ZWxvcGVyIGFzIHRoZXkgbWF5IHRoaW5rIG5vbi1IQVAgaXMNCj4g
c3VwcG9ydGVkIG9uIEFybS4gWW91IGNhbid0IGZpbmQgZWFzaWx5IHRoYXQgYm90aCBoYXBfZW5h
YmxlZCguLi4pIGFuZA0KPiBpb21tdV9oYXBfcHRfc2hhcmUgd2lsbCBhbHdheXMgZXZhbHVhdGUg
dG8gdHJ1ZS4NCj4gDQo+IFNvIGFzaWRlIHRoZSBjb21tb24gaW1wbGVtZW50YXRpb24sIHdoYXQg
aXMgdGhlIHJlYWwgZ2FpbiBmb3IgQXJtPw0KDQpUaGVyZSdzIG5vIHJlYWwgZ2FpbiBmb3IgQVJN
LCB0aGUgZ2FpbiBpcyBpbiB0aGUgcmVkdWN0aW9uIGluIGlmZGVmLWVyeSBhbmQgdGh1cyB0aWRp
bmVzcyBvZiBjb2RlLiBJIGNvdWxkIHB1dCBiYWNrIHNvbWUgaWZkZWZzIGlmIHlvdSdkIHByZWZl
ciwgb3IgSSBjb3VsZCBqdXN0IHB1dCBhIGNvbW1lbnQgc3RhdGluZyB0aGF0IGlvbW11X3VzZV9o
YXBfcHQoKSB3aWxsIGFsd2F5cyBiZSB0cnVlIGZvciBBUk0uIFdoaWNoIHdvdWxkIHlvdSBwcmVm
ZXI/DQoNCiAgUGF1bA0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

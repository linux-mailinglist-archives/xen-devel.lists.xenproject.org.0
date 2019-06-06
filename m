Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FD1372B0
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 13:22:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYqRB-00065u-AT; Thu, 06 Jun 2019 11:20:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ATwH=UF=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hYqRA-0005xd-96
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 11:20:04 +0000
X-Inumbo-ID: 049ce1e4-884d-11e9-8e70-fb58b4c2c60d
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 049ce1e4-884d-11e9-8e70-fb58b4c2c60d;
 Thu, 06 Jun 2019 11:19:58 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=SoftFail smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: j+4tgy4dblv/Tj0y+1osav4+7S4tWie1GJF4FzTEW4qYfp9PDFmVfxu6JvyGdpdUK+9THk7/Nv
 dzWXKY/bSaQMpFkPZ6ky8gkOY5OlL2RXY88LtWl3pZfM0In9iRbOvV8k5sgN3OGbwfwz82GdpF
 6L3wjL+0xRKPTbDUp0aaLHBshzb2xb3v5e8yPsH2Q3plpMk6k4ryG6oPPw4coVzMdWiCDSlKew
 WWMdg/BslY51ihQ/ODXGCjMh48ZfkeGlPMqN++bD4ubXcrVT+W4/xboQno0e7qhD/93iY0pZyt
 l4k=
X-SBRS: -0.9
X-MesageID: 1396932
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,559,1557201600"; 
   d="scan'208";a="1396932"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>, Roger Pau Monne
 <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v2 03/12] pci: make PCI_SBDF return a
 pci_sbdf_t
Thread-Index: AQHVHEat2EWOrJMpPE+UVYYSe0+AlqaOeHHwgAABWcA=
Date: Thu, 6 Jun 2019 11:19:54 +0000
Message-ID: <b163694e8a174570870d5ff7839a685c@AMSPEX02CL03.citrite.net>
References: <20190606090146.77381-1-roger.pau@citrix.com>
 <20190606090146.77381-4-roger.pau@citrix.com>
 <d0590126d33a4ca69da45b09d6038cb5@AMSPEX02CL03.citrite.net>
In-Reply-To: <d0590126d33a4ca69da45b09d6038cb5@AMSPEX02CL03.citrite.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 03/12] pci: make PCI_SBDF return a
 pci_sbdf_t
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgW21haWx0bzp4
ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZ10gT24gQmVoYWxmIE9mIFBhdWwg
RHVycmFudA0KPiBTZW50OiAwNiBKdW5lIDIwMTkgMTI6MTENCj4gVG86IFJvZ2VyIFBhdSBNb25u
ZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcN
Cj4gQ2M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPjsgU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgV2VpIExpdQ0KPiA8d2xAeGVuLm9yZz47IEtv
bnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IEFuZHJldyBDb29w
ZXINCj4gPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVu
Lm9yZz47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47DQo+IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+OyBJYW4gSmFja3Nvbg0KPiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFJvZ2VyIFBh
dSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVs
XSBbUEFUQ0ggdjIgMDMvMTJdIHBjaTogbWFrZSBQQ0lfU0JERiByZXR1cm4gYSBwY2lfc2JkZl90
DQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogWGVuLWRldmVs
IFttYWlsdG86eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmddIE9uIEJlaGFs
ZiBPZiBSb2dlciBQYXUgTW9ubmUNCj4gPiBTZW50OiAwNiBKdW5lIDIwMTkgMTA6MDINCj4gPiBU
bzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4gQ2M6IEtldmluIFRpYW4gPGtl
dmluLnRpYW5AaW50ZWwuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPjsgV2VpIExpdQ0KPiA+IDx3bEB4ZW4ub3JnPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxr
IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgR2VvcmdlIER1bmxhcA0KPiA+IDxHZW9yZ2UuRHVu
bGFwQGNpdHJpeC5jb20+OyBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29t
PjsgSWFuIEphY2tzb24NCj4gPiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFRpbSAoWGVuLm9y
ZykgPHRpbUB4ZW4ub3JnPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEph
bg0KPiA+IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4NCj4gPiBTdWJqZWN0OiBbWGVuLWRldmVsXSBbUEFUQ0ggdjIgMDMv
MTJdIHBjaTogbWFrZSBQQ0lfU0JERiByZXR1cm4gYSBwY2lfc2JkZl90DQo+ID4NCj4gPiBBbmQg
Zml4IGl0J3Mgb25seSBjYWxsZXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBQYXVsIER1
cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPg0KDQpBY3R1YWxseSwgb24gc2Vjb25kIHRo
b3VnaHRzLi4uDQoNCj4gDQo+ID4gLS0tDQo+ID4gQ2M6IEtldmluIFRpYW4gPGtldmluLnRpYW5A
aW50ZWwuY29tPg0KPiA+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPg0KPiA+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+
DQo+ID4gQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPg0KPiA+IENj
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4gQ2M6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+DQo+ID4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29u
cmFkLndpbGtAb3JhY2xlLmNvbT4NCj4gPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPg0KPiA+IENjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4NCj4gPiBD
YzogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gPiAtLS0NCj4gPiBDaGFuZ2VzIHNpbmNlIHYxOg0K
PiA+ICAtIE5ldyBpbiB0aGlzIHZlcnNpb24uDQo+ID4gLS0tDQo+ID4gIHhlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL3Z0ZC9kbWFyLmMgfCAzICsrLQ0KPiA+ICB4ZW4vaW5jbHVkZS94ZW4vcGNpLmgg
ICAgICAgICAgICAgIHwgMyArKy0NCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvdnRkL2RtYXIuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9kbWFyLmMN
Cj4gPiBpbmRleCA5Y2M4NjIzZTUzLi41OWE0NmNkMWM2IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9kbWFyLmMNCj4gPiArKysgYi94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC92dGQvZG1hci5jDQo+ID4gQEAgLTExMTUsNyArMTExNSw4IEBAIHN0YXRpYyBpbnQg
X19pbml0IHBhcnNlX3JtcnJfcGFyYW0oY29uc3QgY2hhciAqc3RyKQ0KPiA+DQo+ID4gICAgICAg
ICAgICAgIC8qIEtlZXAgc2JkZidzIGV2ZW4gaWYgdGhleSBkaWZmZXIgYW5kIGxhdGVyIHJlcG9y
dCBhbiBlcnJvci4gKi8NCj4gPiAgICAgICAgICAgICAgZGV2X2NvdW50ID0gdXNlcl9ybXJyc1tu
cl9ybXJyXS5kZXZfY291bnQ7DQo+ID4gLSAgICAgICAgICAgIHVzZXJfcm1ycnNbbnJfcm1ycl0u
c2JkZltkZXZfY291bnRdID0gUENJX1NCREYoc2VnLCBidXMsIGRldiwgZnVuYyk7DQo+ID4gKyAg
ICAgICAgICAgIHVzZXJfcm1ycnNbbnJfcm1ycl0uc2JkZltkZXZfY291bnRdID0NCj4gPiArICAg
ICAgICAgICAgICAgUENJX1NCREYoc2VnLCBidXMsIGRldiwgZnVuYykuc2JkZjsNCj4gPg0KPiA+
ICAgICAgICAgICAgICB1c2VyX3JtcnJzW25yX3JtcnJdLmRldl9jb3VudCsrOw0KPiA+ICAgICAg
ICAgICAgICBzID0gc3RtcDsNCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3BjaS5o
IGIveGVuL2luY2x1ZGUveGVuL3BjaS5oDQo+ID4gaW5kZXggZjQ5MDhhYmQ4Yi4uOWVhNDE3ODlk
MCAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vcGNpLmgNCj4gPiArKysgYi94ZW4v
aW5jbHVkZS94ZW4vcGNpLmgNCj4gPiBAQCAtMzQsNyArMzQsOCBAQA0KPiA+ICAjZGVmaW5lIFBD
SV9ERVZGTjIoYmRmKSAoKGJkZikgJiAweGZmKQ0KPiA+ICAjZGVmaW5lIFBDSV9CREYoYixkLGYp
ICAoKCgoYikgJiAweGZmKSA8PCA4KSB8IFBDSV9ERVZGTihkLGYpKQ0KPiA+ICAjZGVmaW5lIFBD
SV9CREYyKGIsZGYpICAoKCgoYikgJiAweGZmKSA8PCA4KSB8ICgoZGYpICYgMHhmZikpDQo+ID4g
LSNkZWZpbmUgUENJX1NCREYocyxiLGQsZikgKCgoKHMpICYgMHhmZmZmKSA8PCAxNikgfCBQQ0lf
QkRGKGIsZCxmKSkNCj4gPiArI2RlZmluZSBQQ0lfU0JERihzLGIsZCxmKSBcDQo+ID4gKyAgICAo
KHBjaV9zYmRmX3QpIHsgLnNiZGYgPSAoKChzKSAmIDB4ZmZmZikgPDwgMTYpIHwgUENJX0JERihi
LGQsZikgfSkNCg0KV291bGRuJ3QgdGhpcyBiZSBiZXR0ZXIgY29kZWQgYWxvbmcgdGhlIGxpbmVz
IG9mLi4uIA0KDQogICAgKChwY2lfc2JkZl90KSB7IC5zZWcgPSBzLCAuYnVzID0gYiwgLmRldiA9
IGQsIC5mbiA9IGYgfSkNCg0KPw0KDQogIFBhdWwNCg0KPiA+ICAjZGVmaW5lIFBDSV9TQkRGMihz
LGJkZikgKCgoKHMpICYgMHhmZmZmKSA8PCAxNikgfCAoKGJkZikgJiAweGZmZmYpKQ0KPiA+ICAj
ZGVmaW5lIFBDSV9TQkRGMyhzLGIsZGYpICgoKChzKSAmIDB4ZmZmZikgPDwgMTYpIHwgUENJX0JE
RjIoYiwgZGYpKQ0KPiA+DQo+ID4gLS0NCj4gPiAyLjIwLjEgKEFwcGxlIEdpdC0xMTcpDQo+ID4N
Cj4gPg0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQo+ID4gWGVuLWRldmVsIG1haWxpbmcgbGlzdA0KPiA+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZw0KPiA+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWwNCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdA0KPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

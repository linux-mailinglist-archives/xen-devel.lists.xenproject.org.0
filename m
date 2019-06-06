Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E23C370EA
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 11:53:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYp2P-0004Uj-P2; Thu, 06 Jun 2019 09:50:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ATwH=UF=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hYp2N-0004Ue-R2
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 09:50:23 +0000
X-Inumbo-ID: 7970361e-8840-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7970361e-8840-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 09:50:11 +0000 (UTC)
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
IronPort-SDR: fFqnelCNogePyC6Rp028yDvZTr1tjM8Tm5bk6MTPPJGloT0UrdnRKQvYjxCLhOrKp+QqN5MH0X
 JQqOnvgb3HS1tYpspN9kcelj31CdJN0g1WuVkc6VeGBJFccYTRG7d+geoPUIQTeD/sTt+Xs97g
 M/zBjPVP9USbhH/VPINSgtHB7tpdcU7cqEONLlcXfz5738Hi5ENXWdOx1k/MuAOuWYTvg56V/J
 /gfvH8PyesvFaRavzL8vmKOWw7m2OZKP2pdgjVuuA57pAZNvg2ZHvNraNDiqgKRmgzso09/bI4
 qwk=
X-SBRS: -0.9
X-MesageID: 1394032
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,559,1557201600"; 
   d="scan'208";a="1394032"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v2 01/12] pci: introduce a devfn field to
 pci_sbdf_t
Thread-Index: AQHVHEatHp2etf9pOk29MOC80wyJHqaOX7jA
Date: Thu, 6 Jun 2019 09:50:06 +0000
Message-ID: <c5fc063ca2094937ac4ce0f2a345e5c9@AMSPEX02CL03.citrite.net>
References: <20190606090146.77381-1-roger.pau@citrix.com>
 <20190606090146.77381-2-roger.pau@citrix.com>
In-Reply-To: <20190606090146.77381-2-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 01/12] pci: introduce a devfn field to
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgW21haWx0bzp4
ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZ10gT24gQmVoYWxmIE9mIFJvZ2Vy
IFBhdSBNb25uZQ0KPiBTZW50OiAwNiBKdW5lIDIwMTkgMTA6MDINCj4gVG86IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEtvbnJhZCBSemVzenV0ZWsgV2ls
aw0KPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5s
YXBAY2l0cml4LmNvbT47IEFuZHJldyBDb29wZXINCj4gPEFuZHJldy5Db29wZXIzQGNpdHJpeC5j
b20+OyBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFRpbSAoWGVuLm9yZykg
PHRpbUB4ZW4ub3JnPjsgSnVsaWVuDQo+IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2MiAwMS8xMl0gcGNp
OiBpbnRyb2R1Y2UgYSBkZXZmbiBmaWVsZCB0byBwY2lfc2JkZl90DQo+IA0KPiBUaGlzIGlzIGVx
dWl2YWxlbnQgdG8gdGhlIGN1cnJlbnQgZXh0ZnVuYyBmaWVsZCBpbiB0ZXJtIG9mIGNvbnRlbnRz
Lg0KPiANCj4gU3dpdGNoIHRoZSB0d28gY3VycmVudCB1c2VycyBvZiBleHRmdW5jIHRvIHVzZSBk
ZXZmbiBpbnN0ZWFkIGZvcg0KPiBjb3JyZWN0bmVzcy4NCj4gDQo+IE5vIGZ1bmN0aW9uYWwgY2hh
bmdlLg0KPiANCj4gUmVxdWVzdGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pg0KPiAtLS0NCj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
DQo+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+DQo+IENj
OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4NCj4gQ2M6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+DQo+IENjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNs
ZS5jb20+DQo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
DQo+IENjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4NCj4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5v
cmc+DQo+IC0tLQ0KPiBDaGFuZ2VzIHNpbmNlIHYxOg0KPiAgLSBOZXcgaW4gdGhpcyB2ZXJzaW9u
Lg0KPiAtLS0NCj4gTkI6IFBhdWwgc3VnZ2VzdGVkIHRvIG5hbWUgdGhlIGZ1bmN0aW9uIGZpZWxk
IGZuIGluc3RlYWQgb2YgZnVuYywgc28NCj4gdGhhdCBpdCB3b3VsZCBtYXRjaCB0aGUgbmFtaW5n
IG9mIHRoZSBkZXZmbiBmaWVsZC4gU2FkbHkgdGhlIGZ1bmMNCj4gZmllbGQgY2Fubm90IGJlIGFs
aWFzZWQgdG8gYW5vdGhlciBmaWVsZCB1c2luZyBhIHVuaW9uIGJlY2F1c2UgaXQncyBhDQo+IGJp
dCBmaWVsZCwgc28gdGhlIG9ubHkgb3B0aW9uIGlzIHRvIHJlbmFtZSBmdW5jIHRvIGZuLg0KDQpJ
cyB0aGF0IHRydWU/IENhbiB5b3Ugbm90IGRvIHNvbWV0aGluZyBsaWtlLi4uDQoNCnVuaW9uIHsN
CiAgc3RydWN0IHsNCiAgICB1aW50OF90IGZ1bmMgOiAzLA0KICAgICAgICAgICAgZGV2ICA6IDU7
DQogIH07DQogIHN0cnVjdCB7DQogICAgdWludDhfdCBmbiAgIDogMywNCiAgICAgICAgICAgIHBh
ZCAgOiA1Ow0KICB9OyANCiAgdWludDhfdCAgZXh0ZnVuYzsNCn07DQoNCj8gSSdtIGNlcnRhaW5s
eSBub3Qgc2VlaW5nIGFueSBjb21wbGFpbnRzIGZyb20gZ2NjLg0KDQo+IEkgZG9uJ3QgaGF2ZSBh
DQo+IHN0cm9uZyBvcGluaW9uLCBidXQgaWYgdGhlcmUncyBjb25zZW5zdXMgaXQgc2hvdWxkIGJl
IGRvbmUgYWZ0ZXIgdGhpcw0KPiBwYXRjaCBJTU8gYW5kIG5vdCBsYXRlciBpbiB0aGUgc2VyaWVz
LCBhcyBtb3JlIG9jY3VycmVuY2VzIG9mDQo+IHNiZGYuZnVuYyB3aWxsIGFwcGVhci4NCg0KSU1P
IHdlIGVpdGhlciBoYXZlICdkZXZmdW5jJyBhbmQgJ2Z1bmMnLCBvciAnZGV2Zm4nIGFuZCAnZm4n
LiANCg0KICBQYXVsDQoNCj4gLS0tDQo+ICB4ZW4vZHJpdmVycy92cGNpL3ZwY2kuYyB8IDQgKyst
LQ0KPiAgeGVuL2luY2x1ZGUveGVuL3BjaS5oICAgfCA1ICsrKystDQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94
ZW4vZHJpdmVycy92cGNpL3ZwY2kuYyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+IGluZGV4
IDgyNjA3YmRiOWEuLjRmMWY5NWFiNjkgMTAwNjQ0DQo+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kv
dnBjaS5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+IEBAIC0zMjcsNyArMzI3
LDcgQEAgdWludDMyX3QgdnBjaV9yZWFkKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJl
ZywgdW5zaWduZWQgaW50IHNpemUpDQo+ICAgICAgfQ0KPiANCj4gICAgICAvKiBGaW5kIHRoZSBQ
Q0kgZGV2IG1hdGNoaW5nIHRoZSBhZGRyZXNzLiAqLw0KPiAtICAgIHBkZXYgPSBwY2lfZ2V0X3Bk
ZXZfYnlfZG9tYWluKGQsIHNiZGYuc2VnLCBzYmRmLmJ1cywgc2JkZi5leHRmdW5jKTsNCj4gKyAg
ICBwZGV2ID0gcGNpX2dldF9wZGV2X2J5X2RvbWFpbihkLCBzYmRmLnNlZywgc2JkZi5idXMsIHNi
ZGYuZGV2Zm4pOw0KPiAgICAgIGlmICggIXBkZXYgKQ0KPiAgICAgICAgICByZXR1cm4gdnBjaV9y
ZWFkX2h3KHNiZGYsIHJlZywgc2l6ZSk7DQo+IA0KPiBAQCAtNDMyLDcgKzQzMiw3IEBAIHZvaWQg
dnBjaV93cml0ZShwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCByZWcsIHVuc2lnbmVkIGlu
dCBzaXplLA0KPiAgICAgICAqIEZpbmQgdGhlIFBDSSBkZXYgbWF0Y2hpbmcgdGhlIGFkZHJlc3Mu
DQo+ICAgICAgICogUGFzc3Rocm91Z2ggZXZlcnl0aGluZyB0aGF0J3Mgbm90IHRyYXBwZWQuDQo+
ICAgICAgICovDQo+IC0gICAgcGRldiA9IHBjaV9nZXRfcGRldl9ieV9kb21haW4oZCwgc2JkZi5z
ZWcsIHNiZGYuYnVzLCBzYmRmLmV4dGZ1bmMpOw0KPiArICAgIHBkZXYgPSBwY2lfZ2V0X3BkZXZf
YnlfZG9tYWluKGQsIHNiZGYuc2VnLCBzYmRmLmJ1cywgc2JkZi5kZXZmbik7DQo+ICAgICAgaWYg
KCAhcGRldiApDQo+ICAgICAgew0KPiAgICAgICAgICB2cGNpX3dyaXRlX2h3KHNiZGYsIHJlZywg
c2l6ZSwgZGF0YSk7DQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vcGNpLmggYi94ZW4v
aW5jbHVkZS94ZW4vcGNpLmgNCj4gaW5kZXggOGIyMWU4ZGM4NC4uZWM5ODI3NDY3NSAxMDA2NDQN
Cj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3BjaS5oDQo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9w
Y2kuaA0KPiBAQCAtNDksNyArNDksMTAgQEAgdHlwZWRlZiB1bmlvbiB7DQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICB1aW50OF90IGZ1bmMgOiAzLA0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBkZXYgIDogNTsNCj4gICAgICAgICAgICAgICAgICAgICAgfTsNCj4gLSAgICAg
ICAgICAgICAgICAgICAgdWludDhfdCAgICAgZXh0ZnVuYzsNCj4gKyAgICAgICAgICAgICAgICAg
ICAgdW5pb24gew0KPiArICAgICAgICAgICAgICAgICAgICAgICAgdWludDhfdCBleHRmdW5jLA0K
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXZmbjsNCj4gKyAgICAgICAgICAg
ICAgICAgICAgfTsNCj4gICAgICAgICAgICAgICAgICB9Ow0KPiAgICAgICAgICAgICAgICAgIHVp
bnQ4X3QgICAgICAgICBidXM7DQo+ICAgICAgICAgICAgICB9Ow0KPiAtLQ0KPiAyLjIwLjEgKEFw
cGxlIEdpdC0xMTcpDQo+IA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdA0KPiBYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==

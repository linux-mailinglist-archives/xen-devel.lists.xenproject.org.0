Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C88CA685B6
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 10:48:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmwbu-00022g-Iq; Mon, 15 Jul 2019 08:45:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gpPh=VM=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hmwbs-00022b-UN
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 08:45:24 +0000
X-Inumbo-ID: df9937ae-a6dc-11e9-86fe-0b2b3eb652fc
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df9937ae-a6dc-11e9-86fe-0b2b3eb652fc;
 Mon, 15 Jul 2019 08:45:19 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mDD/74jYfpjmsF5VoWfTVXcisFMCRscD8xMvCrlggObtlATMjAqa/4H//xsJzH6gYxgRjUfZkW
 aFNTFkzvawfTgTSye/L82OzGntr6cQvwkD7bzW0HkQ4irh710p177InNhkFU9yuh5sFibPlWpw
 8c3UYPYcBOjZrSDW4kn/uZEtEVq2wRcmm8Swcbjxdhf8OH336bkwQXXlowXN/xx0z4jl1iAmWy
 YrjXCUy1DqzAOkGlZLn9NmjxfFILYyGKylTfHJk6zvmdbr2kFQlUdZ0ouL35HSCH18YOmumfPs
 otU=
X-SBRS: 2.7
X-MesageID: 2987290
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="2987290"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH] xen/mm.h: add helper function to
 test-and-clear _PGC_allocated
Thread-Index: AQHVNzsA3ObRtH9Tj0umHvcTFw1+RqbEVHqAgAcOBAA=
Date: Mon, 15 Jul 2019 08:45:14 +0000
Message-ID: <c50d8a4fdcba4a61b736d8a748c4659c@AMSPEX02CL03.citrite.net>
References: <20190710161733.39119-1-paul.durrant@citrix.com>
 <9bead6ec-9fad-2ba9-3948-de217de6d856@suse.com>
In-Reply-To: <9bead6ec-9fad-2ba9-3948-de217de6d856@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/mm.h: add helper function to
 test-and-clear _PGC_allocated
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
 Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Ian
 Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDEwIEp1bHkgMjAxOSAyMzo1Mw0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZzsgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEFuZHJldyBD
b29wZXINCj4gPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubmUgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPjsgVm9sb2R5bXlyIEJhYmNodWsNCj4gPFZvbG9keW15cl9CYWJj
aHVrQGVwYW0uY29tPjsgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsg
SWFuIEphY2tzb24NCj4gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsNCj4gPGtv
bnJhZC53aWxrQG9yYWNsZS5jb20+OyBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5j
b20+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz47IFdlaSBMaXUNCj4gPHdsQHhlbi5vcmc+
DQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0hdIHhlbi9tbS5oOiBhZGQgaGVscGVy
IGZ1bmN0aW9uIHRvIHRlc3QtYW5kLWNsZWFyIF9QR0NfYWxsb2NhdGVkDQo+IA0KPiBPbiAxMC4w
Ny4yMDE5IDE4OjE3LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4gQEAgLTQxOCwxMyArNDE3LDcg
QEAgc3RhdGljIHZvaWQgaHZtX2ZyZWVfaW9yZXFfbWZuKHN0cnVjdCBodm1faW9yZXFfc2VydmVy
ICpzLCBib29sIGJ1ZikNCj4gPiAgICAgICB1bm1hcF9kb21haW5fcGFnZV9nbG9iYWwoaW9ycC0+
dmEpOw0KPiA+ICAgICAgIGlvcnAtPnZhID0gTlVMTDsNCj4gPg0KPiA+IC0gICAgLyoNCj4gPiAt
ICAgICAqIENoZWNrIHdoZXRoZXIgd2UgbmVlZCB0byBjbGVhciB0aGUgYWxsb2NhdGlvbiByZWZl
cmVuY2UgYmVmb3JlDQo+ID4gLSAgICAgKiBkcm9wcGluZyB0aGUgZXhwbGljaXQgcmVmZXJlbmNl
cyB0YWtlbiBieSBnZXRfcGFnZV9hbmRfdHlwZSgpLg0KPiA+IC0gICAgICovDQo+ID4gLSAgICBp
ZiAoIHRlc3RfYW5kX2NsZWFyX2JpdChfUEdDX2FsbG9jYXRlZCwgJnBhZ2UtPmNvdW50X2luZm8p
ICkNCj4gPiAtICAgICAgICBwdXRfcGFnZShwYWdlKTsNCj4gPiAtDQo+ID4gKyAgICBjbGVhcl9h
c3NpZ25tZW50X3JlZmVyZW5jZShwYWdlKTsNCj4gPiAgICAgICBwdXRfcGFnZV9hbmRfdHlwZShw
YWdlKTsNCj4gPiAgIH0NCj4gDQo+IElzIHRoZXJlIGEgc3BlY2lmaWMgcmVhc29uIHlvdSBkcm9w
IHRoZSBjb21tZW50PyBJdCBkb2Vzbid0IGJlY29tZQ0KPiBsZXNzIHJlbGV2YW50IHRoYW4gd2hl
biBpdCB3YXMgYWRkZWQsIGRvZXMgaXQ/DQoNCk5vdCBzdXJlLCBzaW5jZSB3aGF0J3MgYWN0dWFs
bHkgZ29pbmcgb24gaXMgbm93IGludGVybmFsIHRvIHRoZSBmdW5jdGlvbi4gSWYgSSBjaGFuZ2Ug
dGhlIGZ1bmN0aW9uIG5hbWUgdG8gY2xlYXJfYWxsb2NhdGlvbl9yZWZlcmVuY2UoKSB0aGVuIEkg
dGhpbmsgdGhlIGNvbW1lbnQgcHJvYmFibHkgYmVjb21lcyBleHRyYW5lb3VzLg0KDQo+IA0KPiA+
IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9tbS5oDQo+ID4gKysrIGIveGVuL2luY2x1ZGUveGVuL21t
LmgNCj4gPiBAQCAtNjU4LDQgKzY1OCwxNSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc2hhcmVfeGVu
X3BhZ2Vfd2l0aF9wcml2aWxlZ2VkX2d1ZXN0cygNCj4gPiAgICAgICBzaGFyZV94ZW5fcGFnZV93
aXRoX2d1ZXN0KHBhZ2UsIGRvbV94ZW4sIGZsYWdzKTsNCj4gPiAgIH0NCj4gPg0KPiA+ICtzdGF0
aWMgaW5saW5lIHZvaWQgY2xlYXJfYXNzaWdubWVudF9yZWZlcmVuY2Uoc3RydWN0IHBhZ2VfaW5m
byAqcGFnZSkNCj4gDQo+IEkgdGhpbmsgdGhlIGZ1bmN0aW9uIHNob3VsZCBoYXZlICdwYWdlJyBp
biBpdCdzIG5hbWUuIFBlcmhhcHMNCj4gcGFnZV9kZWFzc2lnbigpIC8gcGFnZV9kZWFsbG9jKCkg
YXJlIGFsc28gbWlzbGVhZGluZywgYnV0IGhvdw0KPiBhYm91dCBwYWdlX3B1dF9hbGxvYygpIG9y
IHBhZ2VfcHV0X2FsbG9jX3JlZigpPw0KPiANCg0KT2ssIEkgdGhpbmsgcGFnZV9wdXRfYWxsb2Nf
cmVmKCkgaXMgbW9zdCBkZXNjcmlwdGl2ZSAocGFydGljdWxhcmx5IHcuci50LiB0aGUgYWJvdmUg
ZGlzY3Vzc2lvbikuDQoNCj4gPiArew0KPiA+ICsgICAgLyoNCj4gPiArICAgICAqIEl0IGlzIHVu
c2FmZSB0byBjbGVhciBfUEdDX2FsbG9jYXRlZCB3aXRob3V0IGhvbGRpbmcgYW4gYWRkaXRpb25h
bA0KPiA+ICsgICAgICogcmVmZXJlbmNlLg0KPiA+ICsgICAgICovDQo+ID4gKyAgICBBU1NFUlQo
KHBhZ2UtPmNvdW50X2luZm8gJiBQR0NfY291bnRfbWFzaykgPiAxKTsNCj4gDQo+IFdoaWxlIHRo
aXMgaXNuJ3QgcmVhbGx5IGluIGxpbmUgd2l0aCBvdXIgZ29hbCBvZiB3YW50aW5nIHRvIGxpbWl0
DQo+IGRhbWFnZSBhbHNvIGluIHJlbGVhc2UgYnVpbGRzLCBJIGFncmVlIHRoYXQgdGhlcmUncyBu
byByZWFsbHkgZ29vZA0KPiBhbHRlcm5hdGl2ZSBoZXJlLiBDcmFzaGluZyB0aGUgb3duZXIgb2Yg
dGhlIHBhZ2Ugd291bGRuJ3QgaGVscA0KPiBtdWNoLCBhbmQgYmFpbGluZyBmcm9tIHRoZSBmdW5j
dGlvbiB3b3VsZG4ndCBuZWNlc3NhcmlseSBiZSBiZXR0ZXINCj4gZWl0aGVyLiBIZW5jZSBJIHRo
aW5rIHRoaXMgd291bGQgYmV0dGVyIGJlIEJVR19PTigpLg0KDQpPay4NCg0KPiANCj4gPiArICAg
IGlmICggdGVzdF9hbmRfY2xlYXJfYml0KF9QR0NfYWxsb2NhdGVkLCAmcGFnZS0+Y291bnRfaW5m
bykgKQ0KPiA+ICsgICAgICAgIHB1dF9wYWdlKHBhZ2UpOw0KPiA+ICt9DQo+IA0KPiBPbiB0aGUg
d2hvbGUgSSBoYXZlIHRvIGFkbWl0IEknbSBub3QgZW50aXJlbHkgY29udmluY2VkIHRoZSAib3Bl
bi0NCj4gY29kaW5nIiBhcyB5b3UgY2FsbCBpdCAodG8gbWUgaXQncyBub3QgcmVhbGx5IG9wZW4t
Y29kaW5nIGFzIGxvbmcgYXMNCj4gdGhlcmUgaXMgbm8gaGVscGVyKSBpcyBzdWNoIGEgYmFkIHRo
aW5nIGhlcmU6IFdpdGhvdXQgdGhlIGhlbHBlciBpdA0KPiBpcyBzbGlnaHRseSBtb3JlIG9idmlv
dXMgYXQgdGhlIHVzZSBzaXRlcyB3aGF0J3MgYWN0dWFsbHkgZ29pbmcgb24uDQo+IEJ1dCBtYXli
ZSB0aGF0J3MgaW5kZWVkIGp1c3QgbWUuDQoNCkkgc3RpbGwgdGhpbmsgYSBoZWxwZXIgaXMgYmV0
dGVyLCBidXQgSSdsbCBhZGQgYSBjb21tZW50IHRvIGRlc2NyaWJlIHdoYXQgaXQgaXMgZG9pbmcu
DQoNCiAgUGF1bA0KDQo+IA0KPiBKYW4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==

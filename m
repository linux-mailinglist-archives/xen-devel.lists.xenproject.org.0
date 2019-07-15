Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 479FA68681
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 11:43:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmxSR-0006eP-2H; Mon, 15 Jul 2019 09:39:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gpPh=VM=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hmxSP-0006eK-O1
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 09:39:41 +0000
X-Inumbo-ID: 76a23df6-a6e4-11e9-ac73-736fa8e17056
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76a23df6-a6e4-11e9-ac73-736fa8e17056;
 Mon, 15 Jul 2019 09:39:39 +0000 (UTC)
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
IronPort-SDR: 3VdweGph1oveQfVHBCKgVV1azMbZDNKG8xpb7lO0BVgH4As6am5wqGfohLiZ2ARG3kqCrzmquq
 fW+0gOI/5Qfz8J3OUDmIeSddJodEL8B426OUh5OUoLrk5U31AfT23jA9XHKsDCfBIMTVQYk/DK
 UiPi8e+/WxwQdeuYq/6R681iUqWVsjqshQRTvSp2c6NpFGDGBz5NrgGRbhy7iDf1z5xvhyo9Yf
 lgFLJXvslDbC9YWW3St6hl/zHP6LSUuz9qYDy294zw/vFn1SUhJZ9XIFIXsSo0nY9UC4524sE/
 I90=
X-SBRS: 2.7
X-MesageID: 2971692
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="2971692"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH] xen/mm.h: add helper function to
 test-and-clear _PGC_allocated
Thread-Index: AQHVNzsA3ObRtH9Tj0umHvcTFw1+RqbEVHqAgAcOBAD//+n5gIAAJ0OQ
Date: Mon, 15 Jul 2019 09:39:34 +0000
Message-ID: <17b8d376c6f24cbf96ab9bb5cefcd8ed@AMSPEX02CL03.citrite.net>
References: <20190710161733.39119-1-paul.durrant@citrix.com>
 <9bead6ec-9fad-2ba9-3948-de217de6d856@suse.com>
 <c50d8a4fdcba4a61b736d8a748c4659c@AMSPEX02CL03.citrite.net>
 <04d3bc49-9abd-3485-df50-ee00a645d5c9@suse.com>
In-Reply-To: <04d3bc49-9abd-3485-df50-ee00a645d5c9@suse.com>
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 JulienGrall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDE1IEp1bHkgMjAxOSAxMDoxOA0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IEp1bGllbkdyYWxsIDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT47IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+
OyBHZW9yZ2UgRHVubGFwDQo+IDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3Nv
biA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uZQ0KPiA8cm9nZXIucGF1
QGNpdHJpeC5jb20+OyBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5j
b20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEtvbnJhZCBSemVzenV0ZWsgV2lsaw0KPiA8a29u
cmFkLndpbGtAb3JhY2xlLmNvbT47IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNv
bT47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsgV2VpIExpdQ0KPiA8d2xAeGVuLm9yZz4N
Cj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSF0geGVuL21tLmg6IGFkZCBoZWxwZXIg
ZnVuY3Rpb24gdG8gdGVzdC1hbmQtY2xlYXIgX1BHQ19hbGxvY2F0ZWQNCj4gDQo+IE9uIDE1LjA3
LjIwMTkgMTA6NDUsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPj4gRnJvbTogSmFuIEJldWxpY2gg
PEpCZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBTZW50OiAxMCBKdWx5IDIwMTkgMjM6NTMNCj4gPj4N
Cj4gPj4gT24gMTAuMDcuMjAxOSAxODoxNywgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+Pj4gQEAg
LTQxOCwxMyArNDE3LDcgQEAgc3RhdGljIHZvaWQgaHZtX2ZyZWVfaW9yZXFfbWZuKHN0cnVjdCBo
dm1faW9yZXFfc2VydmVyICpzLCBib29sIGJ1ZikNCj4gPj4+ICAgICAgICB1bm1hcF9kb21haW5f
cGFnZV9nbG9iYWwoaW9ycC0+dmEpOw0KPiA+Pj4gICAgICAgIGlvcnAtPnZhID0gTlVMTDsNCj4g
Pj4+DQo+ID4+PiAtICAgIC8qDQo+ID4+PiAtICAgICAqIENoZWNrIHdoZXRoZXIgd2UgbmVlZCB0
byBjbGVhciB0aGUgYWxsb2NhdGlvbiByZWZlcmVuY2UgYmVmb3JlDQo+ID4+PiAtICAgICAqIGRy
b3BwaW5nIHRoZSBleHBsaWNpdCByZWZlcmVuY2VzIHRha2VuIGJ5IGdldF9wYWdlX2FuZF90eXBl
KCkuDQo+ID4+PiAtICAgICAqLw0KPiA+Pj4gLSAgICBpZiAoIHRlc3RfYW5kX2NsZWFyX2JpdChf
UEdDX2FsbG9jYXRlZCwgJnBhZ2UtPmNvdW50X2luZm8pICkNCj4gPj4+IC0gICAgICAgIHB1dF9w
YWdlKHBhZ2UpOw0KPiA+Pj4gLQ0KPiA+Pj4gKyAgICBjbGVhcl9hc3NpZ25tZW50X3JlZmVyZW5j
ZShwYWdlKTsNCj4gPj4+ICAgICAgICBwdXRfcGFnZV9hbmRfdHlwZShwYWdlKTsNCj4gPj4+ICAg
IH0NCj4gPj4NCj4gPj4gSXMgdGhlcmUgYSBzcGVjaWZpYyByZWFzb24geW91IGRyb3AgdGhlIGNv
bW1lbnQ/IEl0IGRvZXNuJ3QgYmVjb21lDQo+ID4+IGxlc3MgcmVsZXZhbnQgdGhhbiB3aGVuIGl0
IHdhcyBhZGRlZCwgZG9lcyBpdD8NCj4gPg0KPiA+IE5vdCBzdXJlLCBzaW5jZSB3aGF0J3MgYWN0
dWFsbHkgZ29pbmcgb24gaXMgbm93IGludGVybmFsIHRvIHRoZSBmdW5jdGlvbi4NCj4gPiBJZiBJ
IGNoYW5nZSB0aGUgZnVuY3Rpb24gbmFtZSB0byBjbGVhcl9hbGxvY2F0aW9uX3JlZmVyZW5jZSgp
IHRoZW4gSQ0KPiA+IHRoaW5rIHRoZSBjb21tZW50IHByb2JhYmx5IGJlY29tZXMgZXh0cmFuZW91
cy4NCj4gDQo+IFdlbGwsIHRoZSBwZXJzcGVjdGl2ZSBJJ20gdGFraW5nIGlzIHRoYXQgdGhlIG9y
ZGVyaW5nIGNvbnN0cmFpbnQNCj4gd3J0IHB1dF9wYWdlX2FuZF90eXBlKCkgZG9lc24ndCBnbyBh
d2F5IGFuZCBpcyBhIHJlbGV2YW50IHBhcnQgb2YNCj4gd2hhdCB0aGUgY29tbWVudCB0YWxrcyBh
Ym91dC4NCg0KT2suIFdvdWxkIHlvdSBiZSBoYXBweSBmaXhpbmcgdGhlIGNvbW1lbnQgdG8geW91
ciB0YXN0ZSBvbiBjb21taXQgdGhlbiwgYXMgSSdtIG5vdCBzdXJlIGV4YWN0bHkgd2hhdCB5b3Ug
d2FudCB0byBzYXk/DQoNCiAgUGF1bA0KDQo+IA0KPiBKYW4NCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

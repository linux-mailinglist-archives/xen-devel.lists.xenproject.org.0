Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3D48D074
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 12:16:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxqHv-0005I3-UO; Wed, 14 Aug 2019 10:13:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GkAm=WK=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hxqHu-0005Hy-Tq
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 10:13:50 +0000
X-Inumbo-ID: 355d4a52-be7c-11e9-84a9-e3cd2aab3695
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 355d4a52-be7c-11e9-84a9-e3cd2aab3695;
 Wed, 14 Aug 2019 10:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565777630;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ntQMJiPFyUg79J2kpXaCl9J8jqMlWRMKNUz/2Ocn9fQ=;
 b=Gadr1ugqNVZx97g5T+79gR9la7BCFV4LNMnZSxtMjqbmb06y0wzmxTw2
 Jj55qmst2dDJ5rRMD0lToPVUI9WLUAGOGvMtfqNzJvXWbUJ+vHHUPzaiA
 9yMsflQyp8UnBF2+vdMhPpFT47HzHr/KvYvQ3ouehNcYByzCEbrwuu7pY w=;
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
IronPort-SDR: UjSk5yn7pnG4U4tHYU2gNRX2xcGvwllGMNMxFiGAeKoXXSqPbHTVy0odHLBJHgw2hPdYvpkX/2
 kdgZdEzhMwx1t4t2vwPF0nrhhSfA390bziC9J5xe4d6kFb1JC4mjvzlxir57VisvtjPt1MX6m1
 t9m2ZTVB6o3zQVCQ7dYF62HZEyxi2BRZ2Ub6se0/Xc13gUW7yc56aqp4VlP6vnr4bYpgBxarU3
 txDAGtF7oR/Ep0wbiEbPkPh0MSsCEA+x0BFbKQTSlH1yeco39P5kSdbTwfp3LUitctT5Uv8U+S
 YQw=
X-SBRS: 2.7
X-MesageID: 4290457
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,384,1559534400"; 
   d="scan'208";a="4290457"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [PATCH 5/6] iommu: tidy up iommu_us_hap_pt() and
 need_iommu_pt_sync() macros
Thread-Index: AQHVRuOcR30mXE7x90iLttuoVGpOQKbvafsAgAsWnkA=
Date: Wed, 14 Aug 2019 10:13:45 +0000
Message-ID: <57e844af36d449d0a8961793e8649827@AMSPEX02CL03.citrite.net>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-6-paul.durrant@citrix.com>
 <805cd751-819a-a7d6-0755-9e82bcde2a37@suse.com>
In-Reply-To: <805cd751-819a-a7d6-0755-9e82bcde2a37@suse.com>
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDA3IEF1Z3VzdCAyMDE5IDExOjQxDQo+IFRvOiBQYXVsIER1
cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgQW5kcmV3
IENvb3Blcg0KPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uZSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+OyBWb2xvZHlteXIgQmFiY2h1aw0KPiA8Vm9sb2R5bXlyX0Jh
YmNodWtAZXBhbS5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+
OyBJYW4gSmFja3Nvbg0KPiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEtvbnJhZCBSemVzenV0ZWsgV2lsaw0KPiA8
a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsgV2Vp
IExpdSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCA1LzZdIGlvbW11OiB0aWR5
IHVwIGlvbW11X3VzX2hhcF9wdCgpIGFuZCBuZWVkX2lvbW11X3B0X3N5bmMoKSBtYWNyb3MNCj4g
DQo+IE9uIDMwLjA3LjIwMTkgMTU6NDQsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiBUaGVzIG1h
Y3JvcyByZWFsbHkgb3VnaHQgdG8gbGl2ZSBpbiB0aGUgY29tbW9uIHhlbi9pb21tdS5oIGhlYWRl
ciByYXRoZXINCj4gPiB0aGVuIGJlaW5nIGRpc3RyaWJ1dGVkIGFtb25nc3QgYXJjaGl0ZWN0dXJl
IHNwZWNpZmljIGlvbW11IGhlYWRlcnMgYW5kDQo+ID4geGVuL3NjaGVkLmguIFRoaXMgcGF0Y2gg
bW92ZXMgdGhlbSB0aGVyZS4NCj4gPg0KPiA+IE5PVEU6IERpc2FibGluZyAnc2hhcmVwdCcgaW4g
dGhlIGNvbW1hbmQgbGluZSBpb21tdSBvcHRpb25zIHNob3VsZCByZWFsbHkNCj4gPiAgICAgICAg
YmUgaGFyZCBlcnJvciBvbiBBUk0gKGFzIG9wcG9zZWQgdG8ganVzdCBiZWluZyBpZ25vcmVkKSwg
c28gYXZvaWQNCj4gPiAgICAgICAgcGFyc2luZyB0aGF0IG9wdGlvbiBpZiBDT05GSUdfQVJNIGlz
IHNldC4NCj4gDQo+IEFncmVlZC4gQXQgdGhhdCBwb2ludCB0aGUgbGF0ZXN0IGl0IHdvdWxkIHBl
cmhhcHMgYmUgZ29vZCB0byBoYXZlDQo+IEFybSBoYXZlDQo+ICNkZWZpbmUgaW9tbXVfaGFwX3B0
X3NoYXJlIHRydWUNCg0KSSBkb24ndCBxdWl0ZSBmb2xsb3cuIGlvbW11X2hhcF9wdF9zaGFyZSBp
cyBhIGdsb2JhbCBib29sX3QgZGVmaW5lZCBpbiBwYXNzdGhyb3VnaC9pb21tdS5jLi4uIEknbSBq
dXN0IHByZXZlbnRpbmcgYW4gQVJNIGNvbW1hbmQgbGluZSBmcm9tIGJlaW5nIGFibGUgdG8gY2hh
bmdlIHRoZSB2YWx1ZS4uLiBzbyBpbiBlZmZlY3QgaXQgd2lsbCBhbHdheXMgYmUgdHJ1ZSBmb3Ig
QVJNLg0KDQo+IA0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oDQo+ID4gKysrIGIv
eGVuL2luY2x1ZGUveGVuL2lvbW11LmgNCj4gPiBAQCAtMjY4LDYgKzI2OCwxMyBAQCBzdHJ1Y3Qg
ZG9tYWluX2lvbW11IHsNCj4gPiAgICNkZWZpbmUgaW9tbXVfc2V0X2ZlYXR1cmUoZCwgZikgICBz
ZXRfYml0KGYsIGRvbV9pb21tdShkKS0+ZmVhdHVyZXMpDQo+ID4gICAjZGVmaW5lIGlvbW11X2Ns
ZWFyX2ZlYXR1cmUoZCwgZikgY2xlYXJfYml0KGYsIGRvbV9pb21tdShkKS0+ZmVhdHVyZXMpDQo+
ID4NCj4gPiArLyogQXJlIHdlIHVzaW5nIHRoZSBkb21haW4gUDJNIHRhYmxlIGFzIGl0cyBJT01N
VSBwYWdldGFibGU/ICovDQo+ID4gKyNkZWZpbmUgaW9tbXVfdXNlX2hhcF9wdChkKSBcDQo+ID4g
KyAgICAoaGFwX2VuYWJsZWQoZCkgJiYgaXNfaW9tbXVfZW5hYmxlZChkKSAmJiBpb21tdV9oYXBf
cHRfc2hhcmUpDQo+IA0KPiBEb2VzIHRoaXMgYnVpbGQgZm9yIEFybSwgc2VlaW5nIHRoYXQgdGhl
cmUncyBubyBoYXBfZW5hYmxlZCgpDQo+IGRlZmluaXRpb24gdGhlcmU/IE9yIGhhdmUgSSBtaXNz
ZWQgaXRzIGFkZGl0aW9uIGVhcmxpZXIgaW4gdGhpcw0KPiBzZXJpZXM/DQoNCkl0IG1vdmVkIHRv
IGNvbW1vbiBjb2RlIHNjaGVkLmggaW4gYW4gZWFybGllciBwYXRjaC4NCg0KPiANCj4gPiAtLS0g
YS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hl
ZC5oDQo+ID4gQEAgLTk2MywxMiArOTYzLDYgQEAgc3RhdGljIGlubGluZSBib29sIGlzX2h3ZG9t
X3Bpbm5lZF92Y3B1KGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQ0KPiA+ICAgICAgICAgICAgICAgY3B1
bWFza193ZWlnaHQodi0+Y3B1X2hhcmRfYWZmaW5pdHkpID09IDEpOw0KPiA+ICAgfQ0KPiA+DQo+
ID4gLSNpZmRlZiBDT05GSUdfSEFTX1BBU1NUSFJPVUdIDQo+ID4gLSNkZWZpbmUgbmVlZF9pb21t
dV9wdF9zeW5jKGQpIChkb21faW9tbXUoZCktPm5lZWRfc3luYykNCj4gPiAtI2Vsc2UNCj4gPiAt
I2RlZmluZSBuZWVkX2lvbW11X3B0X3N5bmMoZCkgZmFsc2UNCj4gPiAtI2VuZGlmDQo+IA0KPiBU
aGUgIiNlbHNlIiBwYXJ0IG9mIHRoaXMgZ2V0cyBsb3N0IC0gaXMgdGhpcyBpbnRlbnRpb25hbCwg
aS5lLg0KPiBhcmUgdGhlcmUgbm8gcmVmZXJlbmNlcyBsZWZ0IHRoYXQgY291bGQgYmUgYSBwcm9i
bGVtIHdpdGhvdXQNCj4gSEFTX1BBU1NUSFJPVUdIPw0KDQpOb3QgdGhhdCBpdCBjYW4gYmUgdHVy
bmVkIG9mZiBhdCB0aGUgbW9tZW50LCBidXQgeWVzIHRoZXJlIGRvZXMgYXBwZWFyIHRvIGJlIGEg
cHJvYmxlbSB3aXRoIGdudHRhYl9uZWVkX2lvbW11X21hcHBpbmcoKSBpZiBJIGZvcmNlIEhBU19Q
QVNTVEhST1VHSCBvZmYuLi4gSSdsbCBhZGQgYW4gZXF1aXZhbGVudCBpZmRlZi4NCg0KICBQYXVs
DQoNCj4gDQo+IEphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==

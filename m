Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFC97A921
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 15:02:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsRis-0008DD-Dv; Tue, 30 Jul 2019 12:59:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3sDM=V3=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hsRiq-0008D8-G8
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 12:59:20 +0000
X-Inumbo-ID: d4f34f26-b2c9-11e9-9841-fb20c6117f71
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d4f34f26-b2c9-11e9-9841-fb20c6117f71;
 Tue, 30 Jul 2019 12:59:14 +0000 (UTC)
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
IronPort-SDR: M284tYBOnYbloAk2F2e1O4VTM8xhm2W63INIjV4Rq6mncGbLDMhZmkhOMdqjpfrYBP1l7zPyE0
 ZIeDc4Q9+jPIaugk+q+8xVF8QvaeCOsyw3CFrptRM2tb0sE3rsXK9xLVTjGR4KoNMJf96TJudu
 rxgy3siRoGMhUJ8kprKLPzeKM5dsYopU2qTOv3SIQ5FW4m/sQ7GkyZDY+M13Sy/2/NpZ3jvjJb
 LEPKbeE7oZGVc/PKfBrYHCmUxC2smdkqHjseABIOiEiSrq2sCZjqS185pXle/kLClW4MbsPpNw
 tvM=
X-SBRS: 2.7
X-MesageID: 3622193
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,326,1559534400"; 
   d="scan'208";a="3622193"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [PATCH v3 2/5] x86/hvm/domain: remove the 'hap_enabled' flag
Thread-Index: AQHVRrql0tChs5bwiUutNmT6KmqQlabi7JEAgAAy+nA=
Date: Tue, 30 Jul 2019 12:59:10 +0000
Message-ID: <c23a9d48c6da4d57936f6e6e32e7d8ec@AMSPEX02CL03.citrite.net>
References: <20190730093904.1794-1-paul.durrant@citrix.com>
 <20190730093904.1794-3-paul.durrant@citrix.com>
 <0cfcbaa1-7e3b-a9e3-0da1-ee17e4e7f0a8@suse.com>
In-Reply-To: <0cfcbaa1-7e3b-a9e3-0da1-ee17e4e7f0a8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 2/5] x86/hvm/domain: remove the
 'hap_enabled' flag
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
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDMwIEp1bHkgMjAxOSAxMjo1Ng0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZzsgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEFuZHJldyBD
b29wZXINCj4gPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubmUgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcA0KPiA8R2VvcmdlLkR1bmxhcEBjaXRy
aXguY29tPjsgSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBTdGVmYW5vIFN0
YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBLb25yYWQgUnplc3p1dGVrIFdp
bGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz47
DQo+IFdlaSBMaXUgPHdsQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMi81XSB4
ODYvaHZtL2RvbWFpbjogcmVtb3ZlIHRoZSAnaGFwX2VuYWJsZWQnIGZsYWcNCj4gDQo+IE9uIDMw
LjA3LjIwMTkgMTE6MzksIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiAtLS0gYS94ZW4vYXJjaC94
ODYvZG9tYWluLmMNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMNCj4gPiBAQCAtNDYw
LDYgKzQ2MCwxMiBAQCBpbnQgYXJjaF9zYW5pdGlzZV9kb21haW5fY29uZmlnKHN0cnVjdCB4ZW5f
ZG9tY3RsX2NyZWF0ZWRvbWFpbiAqY29uZmlnKQ0KPiA+ICAgICAgICAgICByZXR1cm4gLUVJTlZB
TDsNCj4gPiAgICAgICB9DQo+ID4NCj4gPiArICAgIGlmICggY29uZmlnLT5mbGFncyAmIFhFTl9E
T01DVExfQ0RGX2hhcCAmJiAhaHZtX2hhcF9zdXBwb3J0ZWQoKSApDQo+IA0KPiBUaGUgJiB3YW50
cyB0byBiZSBwYXJlbnRoZXNpemVkIGhlcmUuDQo+IA0KPiA+IC0tLSBhL3hlbi9jb21tb24vZG9t
YWluLmMNCj4gPiArKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jDQo+ID4gQEAgLTMxMyw2ICszMTMs
MTMgQEAgc3RhdGljIGludCBzYW5pdGlzZV9kb21haW5fY29uZmlnKHN0cnVjdCB4ZW5fZG9tY3Rs
X2NyZWF0ZWRvbWFpbiAqY29uZmlnKQ0KPiA+ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4g
PiAgICAgICB9DQo+ID4NCj4gPiArICAgIGlmICggIShjb25maWctPmZsYWdzICYgWEVOX0RPTUNU
TF9DREZfaHZtX2d1ZXN0KSAmJg0KPiA+ICsgICAgICAgICBjb25maWctPmZsYWdzICYgWEVOX0RP
TUNUTF9DREZfaGFwICkNCj4gDQo+IFNhbWUgaGVyZS4NCg0KT2ggeWVzLiBOb3Qgc3VyZSBob3cg
SSBtaXNzZWQgdGhvc2UuDQoNCj4gDQo+ID4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgN
Cj4gPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaA0KPiA+IEBAIC05NDgsNiArOTQ4LDEx
IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19odm1fZG9tYWluKGNvbnN0IHN0cnVjdCBkb21haW4g
KmQpDQo+ID4gICAgICAgICAgIGV2YWx1YXRlX25vc3BlYyhkLT5vcHRpb25zICYgWEVOX0RPTUNU
TF9DREZfaHZtX2d1ZXN0KTsNCj4gPiAgIH0NCj4gPg0KPiA+ICtzdGF0aWMgaW5saW5lIGJvb2wg
aGFwX2VuYWJsZWQoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkNCj4gPiArew0KPiA+ICsgICAgcmV0
dXJuIGV2YWx1YXRlX25vc3BlYyhkLT5vcHRpb25zICYgWEVOX0RPTUNUTF9DREZfaGFwKTsNCj4g
PiArfQ0KPiA+ICsNCj4gPiAgIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19odm1fdmNwdShjb25zdCBz
dHJ1Y3QgdmNwdSAqdikNCj4gDQo+IENvdWxkIHRoaXMgcGxlYXNlIG5vdCBiZSBwbGFjZWQgYmV0
d2VlbiB0d28gY2xvc2VseSByZWxhdGVkIGZ1bmN0aW9ucz8NCj4gDQoNCk9rLg0KDQogIFBhdWwN
Cg0KPiBKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

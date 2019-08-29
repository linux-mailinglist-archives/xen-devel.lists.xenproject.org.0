Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C9BA1F2E
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 17:30:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3MLH-0006up-LJ; Thu, 29 Aug 2019 15:28:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+tTk=WZ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i3MLF-0006uk-ON
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 15:28:05 +0000
X-Inumbo-ID: 98249c66-ca71-11e9-8980-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98249c66-ca71-11e9-8980-bc764e2007e4;
 Thu, 29 Aug 2019 15:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567092485;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PLYiHP9jUUYziqltbdsnheeBGTTs8sy753KjqSo2qu4=;
 b=arjpoPR7M9SvPKU0E8Z95aVtQltz0Z3rBaTRlf3wykduutHcqGWRDb4Q
 4UlXv2hnbMpUbZsqUwl8MZHzM8joHGpCINwhANlsVTHfRfW31EmVuufie
 lVhvx8lJQtDFAXElLyeufld4Kb3XiStxLtqen8atj133MXWLaDsw84kBC I=;
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
IronPort-SDR: Vvwjwn/Hekc8GOmRERHqgypW6YHze0Dh1dfHdCjkKoo5ByI6UanYl2/6rbSnaOViciXBhzvhmK
 F5PmlYdKDvE3ew/c8Wmq9FkhRrksgkP4Q0G4nPx2q5Uk5SZoVpEUDwtlIoTfLXOCkwdkGYiiGG
 hjqCom00GjPyFalXmUCzjSYJg8+Q5oRDMzy+Nnvz31cdfpmgV7WL/itQfbfahHHyKFo/Ke8UUh
 WUoI6mo3HfBlZ27omOg1HEcp8+yg+Qa9lAWz5mSjGpchggSPRWgMqJ1wIgzTM6XG/palUswtaO
 VMc=
X-SBRS: 2.7
X-MesageID: 4939133
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,443,1559534400"; 
   d="scan'208";a="4939133"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [PATCH v6 10/10] introduce a 'passthrough' configuration option
 to xl.cfg...
Thread-Index: AQHVVFfs4jrxlwbLt0anSv+8EgHRu6cSG/IAgAA3jOA=
Date: Thu, 29 Aug 2019 15:27:45 +0000
Message-ID: <463e20d40c09456296803309a578cb69@AMSPEX02CL03.citrite.net>
References: <20190816172001.3905-1-paul.durrant@citrix.com>
 <20190816172001.3905-11-paul.durrant@citrix.com>
 <6eaff8e6-126a-dffe-9051-4e3b31e3e240@suse.com>
In-Reply-To: <6eaff8e6-126a-dffe-9051-4e3b31e3e240@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v6 10/10] introduce a 'passthrough'
 configuration option to xl.cfg...
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
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI5IEF1Z3VzdCAyMDE5IDE1OjA3DQo+IFRvOiBQYXVsIER1
cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgQW5kcmV3
IENvb3Blcg0KPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEFudGhvbnkgUGVyYXJkIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm5lDQo+IDxyb2dlci5wYXVA
Y2l0cml4LmNvbT47IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNv
bT47IEdlb3JnZSBEdW5sYXANCj4gPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IElhbiBKYWNr
c29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0Bv
cmFjbGUuY29tPjsgVGltIChYZW4ub3JnKSA8dGltQHhlbi5vcmc+Ow0KPiBXZWkgTGl1IDx3bEB4
ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDEwLzEwXSBpbnRyb2R1Y2UgYSAncGFz
c3Rocm91Z2gnIGNvbmZpZ3VyYXRpb24gb3B0aW9uIHRvIHhsLmNmZy4uLg0KPiANCj4gT24gMTYu
MDguMjAxOSAxOToyMCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+IC4uLmFuZCBoZW5jZSB0aGUg
YWJpbGl0eSB0byBkaXNhYmxlIElPTU1VIG1hcHBpbmdzLCBhbmQgY29udHJvbCBFUFQNCj4gPiBz
aGFyaW5nLg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgbmV3ICdsaWJ4bF9wYXNz
dGhyb3VnaCcgZW51bWVyYXRpb24gaW50bw0KPiA+IGxpYnhsX2RvbWFpbl9jcmVhdGVfaW5mby4g
VGhlIHZhbHVlIHdpbGwgYmUgc2V0IGJ5IHhsIGVpdGhlciB3aGVuIGl0IHBhcnNlcw0KPiA+IGEg
bmV3ICdwYXNzdGhyb3VnaCcgb3B0aW9uIGluIHhsLmNmZywgb3IgaW1wbGljaXRseSBpZiB0aGVy
ZSBpcyBwYXNzdGhyb3VnaA0KPiA+IGhhcmR3YXJlIHNwZWNpZmllZCBmb3IgdGhlIGRvbWFpbi4N
Cj4gPg0KPiA+IElmIHRoZSB2YWx1ZSBvZiB0aGUgcGFzc3Rocm91Z2ggY29uZmlndXJhdGlvbiBv
cHRpb24gaXMgJ2Rpc2FibGVkJyB0aGVuDQo+ID4gdGhlIFhFTl9ET01DVExfQ0RGX2lvbW11IGZs
YWcgd2lsbCBiZSBjbGVhciBpbiB0aGUgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4NCj4gPiBmbGFn
cywgdGh1cyBhbGxvd2luZyB0aGUgdG9vbHN0YWNrIHRvIGNvbnRyb2wgd2hldGhlciB0aGUgZG9t
YWluIGdldHMNCj4gPiBJT01NVSBtYXBwaW5ncyBvciBub3QgKHdoZXJlIHByZXZpb3VzbHkgdGhl
eSB3ZXJlIGdsb2JhbGx5IHNldCkuDQo+ID4NCj4gPiBJZiB0aGUgdmFsdWUgb2YgdGhlIHBhc3N0
aHJvdWdoIGNvbmZpZ3VyYXRpb24gb3B0aW9uIGlzICdzeW5jX3B0JyB0aGVuDQo+ID4gYSBuZXcg
J2lvbW11X29wdHMnIGZpZWxkIGluIHhlbl9kb21jdGxfY3JlYXRlZG9tYWluIHdpbGwgYmUgc2V0
IHdpdGggdGhlDQo+ID4gdmFsdWUgWEVOX0RPTUNUTF9JT01NVV9ub19zaGFyZXB0LiBUaGlzIHdp
bGwgb3ZlcnJpZGUgdGhlIGdsb2JhbCBkZWZhdWx0DQo+ID4gc2V0IGluIGlvbW11X2hhcF9wdF9z
aGFyZSwgdGh1cyBhbGxvd2luZyB0aGUgdG9vbHN0YWNrIHRvIGNvbnRyb2wgd2hldGhlcg0KPiA+
IEVQVCBzaGFyaW5nIGlzIHVzZWQgZm9yIHRoZSBkb21haW4uDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPg0KPiANCj4gUmV2aWV3
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KVGhhbmtzLg0KDQo+IHdp
dGggYSBxdWVzdGlvbi9zdWdnZXN0aW9uIGFuZCBhIG5pdDoNCj4gDQo+ID4gLS0tIGEveGVuL2Nv
bW1vbi9kb21haW4uYw0KPiA+ICsrKyBiL3hlbi9jb21tb24vZG9tYWluLmMNCj4gPiBAQCAtMzA4
LDYgKzMwOCwxMyBAQCBzdGF0aWMgaW50IHNhbml0aXNlX2RvbWFpbl9jb25maWcoc3RydWN0IHhl
bl9kb21jdGxfY3JlYXRlZG9tYWluICpjb25maWcpDQo+ID4gICAgICAgICAgcmV0dXJuIC1FSU5W
QUw7DQo+ID4gICAgICB9DQo+ID4NCj4gPiArICAgIGlmICggIShjb25maWctPmZsYWdzICYgWEVO
X0RPTUNUTF9DREZfaW9tbXUpICYmIGNvbmZpZy0+aW9tbXVfb3B0cyApDQo+ID4gKyAgICB7DQo+
ID4gKyAgICAgICAgZHByaW50ayhYRU5MT0dfSU5GTywNCj4gPiArICAgICAgICAgICAgICAgICJJ
T01NVSBvcHRpb25zIHNwZWNpZmllZCBidXQgSU9NTVUgbm90IGVuYWJsZWRcbiIpOw0KPiA+ICsg
ICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsgICAgfQ0KPiANCj4gU2VlaW5nIHRoaXMgSSB3
b25kZXIgd2hldGhlciBYRU5fRE9NQ1RMX0NERl9pb21tdSB3b3VsZG4ndCBiZXR0ZXIgYmUNCj4g
Yml0IDAgb2YgaW9tbXVfb3B0cy4NCj4gDQoNCkkgZGViYXRlZCB0aGlzIHdpdGggbXlzZWxmIGFu
ZCBJIHByZWZlciB0byBzdGljayB3aXRoIHNlcGFyYXRlIGZsYWcgYW5kIG9wdGlvbnMuDQoNCj4g
PiBAQCAtNzAsNiArNzAsMTAgQEAgc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluIHsNCj4g
Pg0KPiA+ICAgICAgdWludDMyX3QgZmxhZ3M7DQo+ID4NCj4gPiArI2RlZmluZSBfWEVOX0RPTUNU
TF9JT01NVV9ub19zaGFyZXB0ICAwDQo+ID4gKyNkZWZpbmUgWEVOX0RPTUNUTF9JT01NVV9ub19z
aGFyZXB0ICAgKDFVPDxfWEVOX0RPTUNUTF9JT01NVV9ub19zaGFyZXB0KQ0KPiANCj4gUGxlYXNl
IGNhbiB5b3UgYWRkIHRoZSBtaXNzaW5nIGJsYW5rcyBhcm91bmQgPDwgPw0KPiANCg0KU3VyZS4N
Cg0KICBQYXVsDQoNCj4gSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs

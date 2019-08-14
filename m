Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F06B8D0B8
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 12:30:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxqVb-0006Qz-Vy; Wed, 14 Aug 2019 10:27:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GkAm=WK=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hxqVZ-0006Qu-PS
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 10:27:57 +0000
X-Inumbo-ID: 2e6ee7c6-be7e-11e9-b6c7-bff87b7af1e5
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e6ee7c6-be7e-11e9-b6c7-bff87b7af1e5;
 Wed, 14 Aug 2019 10:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565778476;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4lgq21eeEjDkOf3rctoTMwUP25ycpPtUZ/F2BJ7k5UI=;
 b=CcbGQvdSPF6hotSBBQpdZirenU2v+wBf5z2IrFOzmPrv5wsj2poEw/TZ
 T65U3d0iE7XqDSjS9+2/FucoC2iWLBN7p6WplC9fZDhSqIrgIFE/br0P2
 qBDZpiIdqKp6z9Bvzy1pbYaMPP4m3KU76DTXIGAl8vFRclAMDvQm8XaTb g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: z5e82Fopo7pYauqLVd6LsZTXjF0foFwlqR+BcdtGFXY9GG+TH+x6BapVYyDPurCAYaY5Y530Vz
 GjF8kR6xuA1HAF7DZNzNMEYJxwdJUFqch04YjAfLngxP41kHHxED26ZVElj9Nb8CBL5wDe4LB0
 yKn/sR18jc7wtV3rWMa7FrRmkhNQwz1X6clMmuaTuFvUJha+eXxS/jNKdnxNeGuFhj/Et9DGYa
 sglk8DqKHjhADwKelPO77ik9A3ZsfW/AmxPJcicdxoUPOCFr77rmrQuepOJNW+LSOdbMLB6pSM
 8as=
X-SBRS: 2.7
X-MesageID: 4455453
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,384,1559534400"; 
   d="scan'208";a="4455453"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Julien Grall' <julien.grall@arm.com>, 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [PATCH 5/6] iommu: tidy up iommu_us_hap_pt() and
 need_iommu_pt_sync() macros
Thread-Index: AQHVRuOcR30mXE7x90iLttuoVGpOQKbvafsAgAsWnkD//+QDAIAAIpGQ
Date: Wed, 14 Aug 2019 10:27:52 +0000
Message-ID: <8e99da72bafe4b1a8a92e146b07a3082@AMSPEX02CL03.citrite.net>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-6-paul.durrant@citrix.com>
 <805cd751-819a-a7d6-0755-9e82bcde2a37@suse.com>
 <57e844af36d449d0a8961793e8649827@AMSPEX02CL03.citrite.net>
 <dcf5c21a-bce4-e315-9ae9-ac1f67c0c889@arm.com>
In-Reply-To: <dcf5c21a-bce4-e315-9ae9-ac1f67c0c889@arm.com>
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
bi5ncmFsbEBhcm0uY29tPg0KPiBTZW50OiAxNCBBdWd1c3QgMjAxOSAxMToyMQ0KPiBUbzogUGF1
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
PiANCj4gSGkgUGF1bCwNCj4gDQo+IE9uIDE0LzA4LzIwMTkgMTE6MTMsIFBhdWwgRHVycmFudCB3
cm90ZToNCj4gPj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oDQo+ID4+PiArKysgYi94
ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaA0KPiA+Pj4gQEAgLTI2OCw2ICsyNjgsMTMgQEAgc3RydWN0
IGRvbWFpbl9pb21tdSB7DQo+ID4+PiAgICAjZGVmaW5lIGlvbW11X3NldF9mZWF0dXJlKGQsIGYp
ICAgc2V0X2JpdChmLCBkb21faW9tbXUoZCktPmZlYXR1cmVzKQ0KPiA+Pj4gICAgI2RlZmluZSBp
b21tdV9jbGVhcl9mZWF0dXJlKGQsIGYpIGNsZWFyX2JpdChmLCBkb21faW9tbXUoZCktPmZlYXR1
cmVzKQ0KPiA+Pj4NCj4gPj4+ICsvKiBBcmUgd2UgdXNpbmcgdGhlIGRvbWFpbiBQMk0gdGFibGUg
YXMgaXRzIElPTU1VIHBhZ2V0YWJsZT8gKi8NCj4gPj4+ICsjZGVmaW5lIGlvbW11X3VzZV9oYXBf
cHQoZCkgXA0KPiA+Pj4gKyAgICAoaGFwX2VuYWJsZWQoZCkgJiYgaXNfaW9tbXVfZW5hYmxlZChk
KSAmJiBpb21tdV9oYXBfcHRfc2hhcmUpDQo+ID4+DQo+ID4+IERvZXMgdGhpcyBidWlsZCBmb3Ig
QXJtLCBzZWVpbmcgdGhhdCB0aGVyZSdzIG5vIGhhcF9lbmFibGVkKCkNCj4gPj4gZGVmaW5pdGlv
biB0aGVyZT8gT3IgaGF2ZSBJIG1pc3NlZCBpdHMgYWRkaXRpb24gZWFybGllciBpbiB0aGlzDQo+
ID4+IHNlcmllcz8NCj4gPg0KPiA+IEl0IG1vdmVkIHRvIGNvbW1vbiBjb2RlIHNjaGVkLmggaW4g
YW4gZWFybGllciBwYXRjaC4NCj4gDQo+IEkgd2VudCB0aHJvdWdoIHRoZSBzZXJpZXMgYW5kIGRp
ZG4ndCBmaW5kIHdoZXJlIGhhcF9lbmFibGVkKCkgaXMgZGVmaW5lZCBmb3IgQXJtDQo+IGluIHRo
aXMgc2VyaWVzLiBEbyB5b3UgbWluZCBwb2ludGluZyB0aGUgZXhhY3QgcGF0Y2g/DQo+IA0KDQpT
b3JyeSwgSSB3YXNuJ3QgY2xlYXIuLi4gVGhlIGNoYW5nZSBpcyBpbiBteSBvdGhlciBzZXJpZXMs
ICJ1c2Ugc3Rhc2hlZCBkb21haW4gY3JlYXRlIGZsYWdzIiwgd2hpY2ggaXMgYSBwcmUtcmVxdWlz
aXRlIGZvciB0aGlzIHNlcmllcyAoYXMgY2FsbGVkIG91dCBpbiB0aGUgY292ZXIgbGV0dGVyKS4g
VGhlIGNoYW5nZSBpcyBtYWRlIGluIHBhdGNoICMyIG9mIHRoYXQgc2VyaWVzOiBodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDcvbXNnMDIy
NTYuaHRtbC4NCg0KICBQYXVsDQoNCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxs
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

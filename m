Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D648B025
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:51:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQdB-00013w-6x; Tue, 13 Aug 2019 06:50:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8mJ6=WJ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hxQd9-0000u4-UP
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:50:03 +0000
X-Inumbo-ID: cd19a58e-bcfb-11e9-ac27-f34e38bc0803
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd19a58e-bcfb-11e9-ac27-f34e38bc0803;
 Mon, 12 Aug 2019 12:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565612528;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sfq3H6ZkpuHrdGyx6G2QL1sgGbyKQKZvOq2T13HCBYA=;
 b=GmaRyrCadVcHy+bf+nyPmTn6sv/odvcViv+BU60P08ZgmhPWLsKtW3gX
 EHVa1mB4B34DDnxcX3hK/oibFU7dbU+YDS9RqfiY2LrvlETGxCSEYHebp
 fv2enFx4cgNig6pKdNiZaCeoPj1FPLliT/9EFP4cDRRDXtz/LTYW03GJr 4=;
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
IronPort-SDR: kKK2+Nt9pJQ9Ns4eTHnyqmUdKHEMEjqsUUD8/VB8xB0M5taWjIrG9p1ppM751APKOfR0DeJe0B
 GQ/YeXHCMrr2hGNucDmL1XEXkgNwGhVNr2miCAlLDuDmAaOVBTAHe44YJfA22bvuRWwMilLw97
 KDe7hjFfByFiwCxzkoG7+KnQeZ6QiqkAU5V5xRS5rVOrMOo2EegpcQb5qD27ZZ6GLQPKRY7iGc
 FBTx8kzwGLge9zjs4+LgBH6xtfYZ9cF4D5fWnigcTPABovJ8RzpEW1TdzRTwoj6Ht86b0MzkNE
 YIU=
X-SBRS: 2.7
X-MesageID: 4161435
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,377,1559534400"; 
   d="scan'208";a="4161435"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [PATCH 1/6] domain: introduce XEN_DOMCTL_CDF_iommu
Thread-Index: AQHVRuOXtofAI4qp30+OUm0h2F2jmqbvU7QAgAgu0nA=
Date: Mon, 12 Aug 2019 12:22:03 +0000
Message-ID: <6cf946fca1b7430fb784ea1717f7efb8@AMSPEX02CL03.citrite.net>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-2-paul.durrant@citrix.com>
 <25891f16-43ae-96c5-1016-672668a5b759@suse.com>
In-Reply-To: <25891f16-43ae-96c5-1016-672668a5b759@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/6] domain: introduce XEN_DOMCTL_CDF_iommu
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
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDA3IEF1Z3VzdCAyMDE5IDEwOjIyDQo+IFRvOiBQYXVsIER1
cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgQW5kcmV3
IENvb3Blcg0KPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEFudGhvbnkgUGVyYXJkIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm5lDQo+IDxyb2dlci5wYXVA
Y2l0cml4LmNvbT47IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNv
bT47IEdlb3JnZSBEdW5sYXANCj4gPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IElhbiBKYWNr
c29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0Bv
cmFjbGUuY29tPjsgVGltIChYZW4ub3JnKSA8dGltQHhlbi5vcmc+Ow0KPiBXZWkgTGl1IDx3bEB4
ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvNl0gZG9tYWluOiBpbnRyb2R1Y2UgWEVO
X0RPTUNUTF9DREZfaW9tbXUNCj4gDQo+IE9uIDMwLjA3LjIwMTkgMTU6NDQsIFBhdWwgRHVycmFu
dCB3cm90ZToNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluLmMNCj4gPiArKysgYi94ZW4v
YXJjaC9hcm0vZG9tYWluLmMNCj4gPiBAQCAtNjczLDggKzY3Myw3IEBAIGludCBhcmNoX2RvbWFp
bl9jcmVhdGUoc3RydWN0IGRvbWFpbiAqZCwNCj4gPg0KPiA+ICAgICAgIEFTU0VSVChjb25maWcg
IT0gTlVMTCk7DQo+ID4NCj4gPiAtICAgIC8qIHAybV9pbml0IHJlbGllcyBvbiBzb21lIHZhbHVl
IGluaXRpYWxpemVkIGJ5IHRoZSBJT01NVSBzdWJzeXN0ZW0gKi8NCj4gPiAtICAgIGlmICggKHJj
ID0gaW9tbXVfZG9tYWluX2luaXQoZCkpICE9IDAgKQ0KPiA+ICsgICAgaWYgKCBpc19pb21tdV9l
bmFibGVkKGQpICYmIChyYyA9IGlvbW11X2RvbWFpbl9pbml0KGQpKSAhPSAwICkNCj4gPiAgICAg
ICAgICAgZ290byBmYWlsOw0KPiANCj4gSW5zdGVhZCBvZiB0aGlzIGFuZCAuLi4NCj4gDQo+ID4g
LS0tIGEveGVuL2FyY2gveDg2L2RvbWFpbi5jDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L2RvbWFp
bi5jDQo+ID4gQEAgLTYwNCw3ICs2MDQsNyBAQCBpbnQgYXJjaF9kb21haW5fY3JlYXRlKHN0cnVj
dCBkb21haW4gKmQsDQo+ID4gICAgICAgaWYgKCAocmMgPSBpbml0X2RvbWFpbl9pcnFfbWFwcGlu
ZyhkKSkgIT0gMCApDQo+ID4gICAgICAgICAgIGdvdG8gZmFpbDsNCj4gPg0KPiA+IC0gICAgaWYg
KCAocmMgPSBpb21tdV9kb21haW5faW5pdChkKSkgIT0gMCApDQo+ID4gKyAgICBpZiAoIGlzX2lv
bW11X2VuYWJsZWQoZCkgJiYgKHJjID0gaW9tbXVfZG9tYWluX2luaXQoZCkpICE9IDAgKQ0KPiA+
ICAgICAgICAgICBnb3RvIGZhaWw7DQo+IA0KPiAuLi4gdGhpcyAoYW5kIGFueSBmdXJ0aGVyIGNv
cGllcyBpbiBmdXR1cmUgcG9ydHMpLCB3b3VsZG4ndCBpdA0KPiBiZSBiZXR0ZXIgdG8gY2VudHJh
bGx5IGRvIHRoaXMgaW4gaW9tbXVfZG9tYWluX2luaXQoKSBpdHNlbGY/DQoNCk9rLi4uIGl0IGtp
bmQgb2Ygc2VlbWVkIG1vcmUgbG9naWNhbCB0byBhdm9pZCB0aGUgY2FsbCBpZiB0aGUgZmxhZyBp
cyBub3QgcHJlc2VudC4uLiBidXQgdGhlcmUncyBubyByZWFsIGNvbnNpc3RlbmN5IG9uIHRoaXMg
a2luZCBvZiB0aGluZyBpbiB0aGUgWGVuIGNvZGViYXNlIHNvIEknbGwgY2hhbmdlIGl0IHRvIHNo
b3J0ZW4gdGhlIHBhdGNoLg0KDQo+IA0KPiA+IC0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMNCj4g
PiArKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jDQo+ID4gQEAgLTMwMSw3ICszMDEsOCBAQCBzdGF0
aWMgaW50IHNhbml0aXNlX2RvbWFpbl9jb25maWcoc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9t
YWluICpjb25maWcpDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBYRU5fRE9NQ1RM
X0NERl9oYXAgfA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWEVOX0RPTUNUTF9D
REZfczNfaW50ZWdyaXR5IHwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFhFTl9E
T01DVExfQ0RGX29vc19vZmYgfA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICBYRU5f
RE9NQ1RMX0NERl94c19kb21haW4pICkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
WEVOX0RPTUNUTF9DREZfeHNfZG9tYWluIHwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgWEVOX0RPTUNUTF9DREZfaW9tbXUpICkNCj4gPiAgICAgICB7DQo+ID4gICAgICAgICAgIGRw
cmludGsoWEVOTE9HX0lORk8sICJVbmtub3duIENERiBmbGFncyAlI3hcbiIsIGNvbmZpZy0+Zmxh
Z3MpOw0KPiA+ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gDQo+IEFsc28gcmVmdXNlIFhF
Tl9ET01DVExfQ0RGX2lvbW11IHdoZW4gIWlvbW11X2VuYWJsZWQ/DQoNClllcywgdGhhdCB3b3Vs
ZCBiZSByZWFzb25hYmxlLg0KDQo+IA0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5o
DQo+ID4gKysrIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgNCj4gPiBAQCAtOTgxLDYgKzk4MSwx
MSBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaXNfeGVuc3RvcmVfZG9tYWluKGNvbnN0IHN0cnVjdCBk
b21haW4gKmQpDQo+ID4gICAgICAgcmV0dXJuIGQtPm9wdGlvbnMgJiBYRU5fRE9NQ1RMX0NERl94
c19kb21haW47DQo+ID4gICB9DQo+ID4NCj4gPiArc3RhdGljIGlubGluZSBib29sIGlzX2lvbW11
X2VuYWJsZWQoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkNCj4gPiArew0KPiA+ICsgICAgcmV0dXJu
IGQtPm9wdGlvbnMgJiBYRU5fRE9NQ1RMX0NERl9pb21tdTsNCj4gPiArfQ0KPiANCj4gUGVyaGFw
cyB3cmFwIGluIGV2YWx1YXRlX25vc3BlYygpPw0KPiANCg0KR2l2ZW4gdGhlIGNvZGVwYXRocyB0
aGF0IGl0IHdpbGwgZXZlbnR1YWxseSBnZXQsIHllcyBpdCBwcm9iYWJseSBzaG91bGQgaGF2ZSB0
aGUgZ3VhcmQuDQoNCiAgUGF1bA0KDQo+IEphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==

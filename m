Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 935E68A1B4
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 16:56:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxBhf-0001Kw-2m; Mon, 12 Aug 2019 14:53:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nxYI=WI=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hxBhd-0001Kr-Qb
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 14:53:41 +0000
X-Inumbo-ID: f8b74666-bd10-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f8b74666-bd10-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 14:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565621620;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V0m7LWUvmkSfqlOmFM3sV7H5XbloAwsNEIqnlhbV9ec=;
 b=b+NQzrRmNHdejBDxRmCK3r6DZ2BxBruQYBHSM+uUBI3WMdJn6cdsa6NL
 P+Q1qpS4wQHVShCBXNvgZbr1aJVpg6VNEHx6Cu1LvCThzlSOOqhGWPr/p
 PS5XvQUB54Pha6oSTtrXKSS1iJcMgjb5L6oJGHqFJ01kteEvHK7eElgga 0=;
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
IronPort-SDR: OSxMG56tJNpHArVeFRNEkH7TKh5xQFV9jmfv1dSuRuEiJdxRXc1n0XMMmrHWA7dgbatXZHtUaw
 13N94F97KZS6UUZ1TjCzgb5wlMen3HYEOW22hPlnShsXKhpehzyB8Bu99FjfXBhcFSpTxRnlZn
 P0s57AtRUO6yF/FbJRABycYApG6yOZ32/3g9krK/DR4ZdhmMWy7clsZK+xdlmaBOe1d24WPzqx
 cIgFNk3Dj1PxVlToY2RfltEwgFEVahQ061YtnlH0ebU3TXqssCjgPKYEZD4JKy2muNM5MMZBld
 O3I=
X-SBRS: 2.7
X-MesageID: 4170437
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,377,1559534400"; 
   d="scan'208";a="4170437"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [PATCH 2/6] use is_iommu_enabled() where appropriate...
Thread-Index: AQHVTQZOzdunvMU4hUq20kKpMi+dUqb3nDCg
Date: Mon, 12 Aug 2019 14:53:35 +0000
Message-ID: <4f7bc9db8dc34b5bbe392eb76546b230@AMSPEX02CL03.citrite.net>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-3-paul.durrant@citrix.com>
 <d96b7a8b-4668-576f-84d2-e0a382d86c87@suse.com>
In-Reply-To: <d96b7a8b-4668-576f-84d2-e0a382d86c87@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/6] use is_iommu_enabled() where
 appropriate...
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
 Stefano Stabellini <sstabellini@kernel.org>,
 VolodymyrBabchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Brian
 Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDA3IEF1Z3VzdCAyMDE5IDEwOjU2DQo+IFRvOiBQYXVsIER1
cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT47IFN1cmF2ZWUg
U3V0aGlrdWxwYW5pdA0KPiA8c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFtZC5jb20+OyBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8QW5kcmV3LkNv
b3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
OyBWb2xvZHlteXJCYWJjaHVrDQo+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IEdlb3Jn
ZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IEp1biBOYWthamltYQ0KPiA8anVu
Lm5ha2FqaW1hQGludGVsLmNvbT47IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPjsg
U3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgV2VpIExpdSA8
d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzZdIHVzZSBpc19pb21tdV9lbmFi
bGVkKCkgd2hlcmUgYXBwcm9wcmlhdGUuLi4NCj4gDQo+IE9uIDMwLjA3LjIwMTkgMTU6NDQsIFBh
dWwgRHVycmFudCB3cm90ZToNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vcDJtLmMNCj4gPiArKysg
Yi94ZW4vYXJjaC9hcm0vcDJtLmMNCj4gPiBAQCAtMTUzMSw4ICsxNTMxLDcgQEAgaW50IHAybV9p
bml0KHN0cnVjdCBkb21haW4gKmQpDQo+ID4gICAgICAgICogc2hhcmVkIHdpdGggdGhlIENQVSwg
WGVuIGhhcyB0byBtYWtlIHN1cmUgdGhhdCB0aGUgUFQgY2hhbmdlcyBoYXZlDQo+ID4gICAgICAg
ICogcmVhY2hlZCB0aGUgbWVtb3J5DQo+ID4gICAgICAgICovDQo+ID4gLSAgICBwMm0tPmNsZWFu
X3B0ZSA9IGlvbW11X2VuYWJsZWQgJiYNCj4gPiAtICAgICAgICAhaW9tbXVfaGFzX2ZlYXR1cmUo
ZCwgSU9NTVVfRkVBVF9DT0hFUkVOVF9XQUxLKTsNCj4gPiArICAgIHAybS0+Y2xlYW5fcHRlID0g
IWlvbW11X2hhc19mZWF0dXJlKGQsIElPTU1VX0ZFQVRfQ09IRVJFTlRfV0FMSyk7DQo+IA0KPiBJ
IGNhbid0IHRlbGwgaWYgdGhlIG9yaWdpbmFsIGNvZGUgd2FzIG1lYW50IHRvIGJlIHRoaXMgd2F5
LCBidXQgSSdtDQo+IGFmcmFpZCB5b3VyIHRyYW5zZm9ybWF0aW9uIGlzIG5vdCBjb3JyZWN0OiBU
aGUgcHJpb3IgY29uc3RydWN0LA0KPiBleHBhbmRpbmcgaW9tbXVfaGFzX2ZlYXR1cmUoKSwgd2Fz
DQo+IA0KPiBpb21tdV9lbmFibGVkICYmICEoaW9tbXVfZW5hYmxlZCAmJiB0ZXN0X2JpdChmZWF0
dXJlLCBkb21faW9tbXUoZCktPmZlYXR1cmVzKSkNCj4gDQo+IHdoaWNoIHRyYW5zZm9ybXMgdGhy
b3VnaA0KPiANCj4gaW9tbXVfZW5hYmxlZCAmJiAoIWlvbW11X2VuYWJsZWQgfHwgIXRlc3RfYml0
KGZlYXR1cmUsIGRvbV9pb21tdShkKS0+ZmVhdHVyZXMpKQ0KPiANCj4gdG8NCj4gDQo+IChpb21t
dV9lbmFibGVkICYmICFpb21tdV9lbmFibGVkKSB8fCAoaW9tbXVfZW5hYmxlZCAmJiAhdGVzdF9i
aXQoZmVhdHVyZSwgZG9tX2lvbW11KGQpLT5mZWF0dXJlcykpDQo+IA0KPiBhbmQgaGVuY2UNCj4g
DQo+IGlvbW11X2VuYWJsZWQgJiYgIXRlc3RfYml0KGZlYXR1cmUsIGRvbV9pb21tdShkKS0+ZmVh
dHVyZXMpDQo+IA0KPiB3aGVyZWFzIHRoZSBuZXcgY29kZSBzaW1wbHkgaXMNCj4gDQo+ICEoaW9t
bXVfZW5hYmxlZCAmJiB0ZXN0X2JpdChmZWF0dXJlLCBkb21faW9tbXUoZCktPmZlYXR1cmVzKSkN
Cj4gDQo+IGkuZS4NCj4gDQo+ICFpb21tdV9lbmFibGVkIHx8ICF0ZXN0X2JpdChmZWF0dXJlLCBk
b21faW9tbXUoZCktPmZlYXR1cmVzKQ0KDQpZZXMsIHNvbWVob3cgSSdkIHJlYWQgdGhhdCB0aGUg
aW9tbXVfZW5hYmxlZCB3YXMgaW52ZXJ0ZWQgaW4gdGhlIGZpcnN0IGluc3RhbmNlLiBJJ2xsIGFk
ZCBhIGNoZWNrIG9mIGlzX2lvbW11X2VuYWJsZWQoKSBiYWNrIGludG8gcDJtX2luaXQoKS4NCg0K
PiANCj4gPiBAQCAtNzY2LDcgKzc2Niw3IEBAIGVwdF9zZXRfZW50cnkoc3RydWN0IHAybV9kb21h
aW4gKnAybSwgZ2ZuX3QgZ2ZuXywgbWZuX3QgbWZuLA0KPiA+ICAgICAgICAgICBuZXdfZW50cnku
c3AgPSAhIWk7DQo+ID4gICAgICAgICAgIG5ld19lbnRyeS5zYV9wMm10ID0gcDJtdDsNCj4gPiAg
ICAgICAgICAgbmV3X2VudHJ5LmFjY2VzcyA9IHAybWE7DQo+ID4gLSAgICAgICAgbmV3X2VudHJ5
LnNucCA9IChpb21tdV9lbmFibGVkICYmIGlvbW11X3Nub29wKTsNCj4gPiArICAgICAgICBuZXdf
ZW50cnkuc25wID0gaXNfaW9tbXVfZW5hYmxlZChwMm0tPmRvbWFpbikgJiYgaW9tbXVfc25vb3A7
DQo+IA0KPiBQbGVhc2UgdXNlIGQgaGVyZS4NCj4gDQo+IFNlZWluZyB0aGF0IHRoaXMgaXMgdGhl
IGxhc3QgY2hhbmdlIGluIHg4Ni9tbS8sIGRpZCB5b3Ugb3Zlcmxvb2sNCj4gdGhlIHVzZSBpbiBw
Mm1fcHRfc2V0X2VudHJ5KCk/IE9yIGlzIHRoaXMgbWVhbnQgdG8gZ28gb24gdG9wIG9mDQo+IEFs
ZXhhbmRydSdzICJ4ODYvbW06IENsZWFuIElPTU1VIGZsYWdzIGZyb20gcDJtLXB0IGNvZGUiICh3
aGljaA0KPiBzaG91bGQgdGhlbiBiZSBub3RlZCBpbiBhIHBvc3QtY29tbWl0LW1lc3NhZ2UgcmVt
YXJrKT8NCg0KWWVzLCBpdCBuZWVkcyB0byBnbyBvbiB0b3Agb2YgQWxleGFuZHJ1J3MgcGF0Y2gu
IEkgc2FpZCB0aGUgc2VyaWVzIGlzIGJhc2VkIG9uIHRoYXQgcGF0Y2ggaW4gdGhlIGNvdmVyIGxl
dHRlciBidXQgSSBjYW4gc3RhdGUgaXQgaGVyZSBhcyB3ZWxsIGlmIGl0IGhlbHBzLg0KDQo+IA0K
PiA+IEBAIC01NTYsNyArNTU2LDcgQEAgaW50IGlvbW11X2RvX2RvbWN0bCgNCj4gPiAgIHsNCj4g
PiAgICAgICBpbnQgcmV0ID0gLUVOT0RFVjsNCj4gPg0KPiA+IC0gICAgaWYgKCAhaW9tbXVfZW5h
YmxlZCApDQo+ID4gKyAgICBpZiAoICFpc19pb21tdV9lbmFibGVkKGQpICkNCj4gPiAgICAgICAg
ICAgcmV0dXJuIC1FTk9TWVM7DQo+IA0KPiBFTk9TWVMgd2FzIHdyb25nIGhlcmUgZnJvbSB0aGUg
YmVnaW5uaW5nLCBidXQgaXQgY2VydGFpbmx5IGdldHMNCj4gd29yc2Ugd2l0aCB0aGlzIG5vIGxv
bmdlciBiZWluZyBhIHN5c3RlbSB3aWRlIHByb3BlcnR5LiBQbGVhc2UNCj4gY2hhbmdlIHRvIEVP
UE5PVFNVUFAgb3Igc29tZSBvdGhlciBzdWl0YWJsZSBvbmUuDQoNClN1cmUuIEknbGwgZ28gd2l0
aCBFT1BOT1RTVVBQLg0KDQo+IA0KPiA+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Bj
aS5jDQo+ID4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4gPiBAQCAtODY0
LDcgKzg2NCw3IEBAIHN0YXRpYyBpbnQgcGNpX2NsZWFuX2RwY2lfaXJxcyhzdHJ1Y3QgZG9tYWlu
ICpkKQ0KPiANCj4gQWJvdmUgaGVyZSB0aGVyZSdzIGFub3RoZXIgdXNlIGluIHBjaV9lbmFibGVf
YWNzKCksIHdoaWNoIHNob3VsZA0KPiBpbW8gYWN0IG9uIHBkZXYtPmRvbWFpbi4NCg0KT2ggeWVz
LCBJJ2xsIGZpeCB0aGF0Lg0KDQo+IA0KPiBUaGVyZSdzIGFub3RoZXIgdXNlIGluIGZsYXNrX2lv
bW11X3Jlc291cmNlX3VzZV9wZXJtKCkuIEFsbA0KPiBjYWxsZXJzIG9mIHRoZSBmdW5jdGlvbiBo
b2xkIGEgc3RydWN0IGRvbWFpbiAqIGluIHRoZWlyIGhhbmRzLA0KPiB3aGljaCBJIHRoaW5rIHRo
ZXkgc2hvdWxkIHBhc3MgaW50byB0aGlzIGZ1bmN0aW9uIHN1Y2ggdGhhdCB0aGUNCj4gY29uZGl0
aW9uYWwgY2FuIGJlIHJlcGxhY2VkLg0KDQpJIHdhc24ndCBzdXJlIGFib3V0IHRoaXMgb25lLiBJ
dCBsb29rcyBtb3JlIGxpa2UgdGhlIHBlcm0gcGFzc2VkIGJhY2sgaXMgYmFzZWQgb24gdGhlIGhh
cmR3YXJlIGZlYXR1cmVzIGF2YWlsYWJsZSBidXQgSSBndWVzcyBpdCB3aWxsIERUUlQgaWYgdGhl
IElPTU1VIGlzIG5vdCBlbmFibGVkIGZvciB0aGUgZG9tYWluLg0KDQogIFBhdWwNCg0KPiANCj4g
SmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DF38B040
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:56:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQhR-0002py-8N; Tue, 13 Aug 2019 06:54:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8mJ6=WJ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hxQhP-0002oM-Bi
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:54:27 +0000
X-Inumbo-ID: add6960c-bd17-11e9-bc41-4f30b06376a2
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id add6960c-bd17-11e9-bc41-4f30b06376a2;
 Mon, 12 Aug 2019 15:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565624502;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PlnJUT6CWBLvvECv9kvOZFmv6lWYWnm6O5Rxs8ARAvI=;
 b=XBG9i1K3BQaJ7UvHz9KL0T661aUrZqpj5LJqRrCVzrQ9VLmva8U2ElNX
 KwPvCsOyVgTGHATSKmRqhDSg3TTrwjtiW4rh9THbPdCoO2linJJb2ZlrA
 dB4G2UV9KNDYJfecf38Z5fl1vcuX6QBbK8pGkRw8TGpJu6zrvMfdcraDk w=;
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
IronPort-SDR: L27fmzIFKQO/Ov5sXsVSSM3y6BpEbh9r8fKhSJjY9haxvy9G8dezIeWMx+KmCuotBl2C+DJKL6
 7r6q8k7RAM/JL/nBOWIwkVzVdKSRNvBKR/CEprQ6HsRrQI954dqB3oipLizmrS391Ie3Zgunp9
 4lshOI9ojI6T6We+Ta9KWORmgBkowpYcyK+jLvTY6B0vr0X6hzRVInGqVRlYAMIFJWStImFeZt
 R7DX969l4rJdATw+VqcnRrpPONQb80EbGdyyKboZKpbS7o0KFq2CC9wqFSaEtBuNHOCNjmYBCm
 ueg=
X-SBRS: 2.7
X-MesageID: 4173605
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,377,1559534400"; 
   d="scan'208";a="4173605"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH 3/6] remove late (on-demand) construction of
 IOMMU page tables
Thread-Index: AQHVRuOcaRJ86WB7wUWdfnF755Z/qabvZ0eAgAhNFVA=
Date: Mon, 12 Aug 2019 15:41:36 +0000
Message-ID: <0134b70d04b942b4b3ce65fd2340ff0c@AMSPEX02CL03.citrite.net>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-4-paul.durrant@citrix.com>
 <1383f85e-bc08-c0be-bb02-f68b76ac1be5@suse.com>
In-Reply-To: <1383f85e-bc08-c0be-bb02-f68b76ac1be5@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/6] remove late (on-demand) construction of
 IOMMU page tables
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 VolodymyrBabchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDA3IEF1Z3VzdCAyMDE5IDExOjMyDQo+IFRvOiBQYXVsIER1
cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgQWxleGFu
ZHJ1IElzYWlsYQ0KPiA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+OyBQZXRyZSBQaXJjYWxhYnUg
PHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPjsgUmF6dmFuIENvam9jYXJ1DQo+IDxyY29qb2Nh
cnVAYml0ZGVmZW5kZXIuY29tPjsgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4
LmNvbT47IFJvZ2VyIFBhdSBNb25uZQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBWb2xvZHlt
eXJCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IEdlb3JnZSBEdW5sYXANCj4g
PEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRy
aXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsg
S29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgVGFtYXMgSyBM
ZW5neWVsDQo+IDx0YW1hc0B0a2xlbmd5ZWwuY29tPjsgVGltIChYZW4ub3JnKSA8dGltQHhlbi5v
cmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BB
VENIIDMvNl0gcmVtb3ZlIGxhdGUgKG9uLWRlbWFuZCkgY29uc3RydWN0aW9uIG9mIElPTU1VIHBh
Z2UgdGFibGVzDQo+IA0KPiBPbiAzMC4wNy4yMDE5IDE1OjQ0LCBQYXVsIER1cnJhbnQgd3JvdGU6
DQo+ID4gTk9URTogVGhpcyBwYXRjaCB3aWxsIGNhdXNlIGEgc21hbGwgYW1vdW50IG9mIGV4dHJh
IHJlc291cmNlIHRvIGJlIHVzZWQNCj4gPiAgICAgICAgdG8gYWNjb21tb2RhdGUgSU9NTVUgcGFn
ZSB0YWJsZXMgdGhhdCBtYXkgbmV2ZXIgYmUgdXNlZCwgc2luY2UgdGhlDQo+ID4gICAgICAgIHBl
ci1kb21haW4gSU9NTVUgZmxhZyBlbmFibGUgZmxhZyBpcyBjdXJyZW50bHkgc2V0IHRvIHRoZSB2
YWx1ZQ0KPiA+ICAgICAgICBvZiB0aGUgZ2xvYmFsIGlvbW11X2VuYWJsZSBmbGFnLiBBIHN1YnNl
cXVlbnQgcGF0Y2ggd2lsbCBhZGQgYW4NCj4gPiAgICAgICAgb3B0aW9uIHRvIHRoZSB0b29sc3Rh
Y2sgdG8gYWxsb3cgaXQgdG8gYmUgdHVybmVkIG9mZiBpZiB0aGVyZSBpcw0KPiA+ICAgICAgICBu
byBpbnRlbnRpb24gdG8gYXNzaWduIHBhc3N0aHJvdWdoIGhhcmR3YXJlIHRvIHRoZSBkb21haW4u
DQo+IA0KPiBJbiBwYXJ0aWN1bGFyIGlmIHRoZSBkZWZhdWx0IG9mIHRoaXMgaXMgZ29pbmcgdG8g
YmUgInRydWUiIChJDQo+IGRpZG4ndCBsb29rIGF0IHRoYXQgcGF0Y2ggeWV0LCBidXQgdGhlIHdv
cmRpbmcgYWJvdmUgbWFrZXMgbWUNCj4gYXNzdW1lIHNvKSwgaW4gYXV0by1iYWxsb29uaW5nIG1v
ZGUgd2l0aG91dCBzaGFyZWQgcGFnZSB0YWJsZXMNCj4gbW9yZSBtZW1vcnkgc2hvdWxkIGltbyBi
ZSBiYWxsb29uZWQgb3V0IG9mIERvbTAgbm93LiBJdCBoYXMNCj4gYWx3YXlzIGJlZW4gYSBidWcg
dGhhdCBJT01NVSBwYWdlIHRhYmxlcyB3ZXJlbid0IGFjY291bnRlZCBmb3IsDQo+IGJ1dCBpdCB3
b3VsZCBiZWNvbWUgZXZlbiBtb3JlIHByb21pbmVudCB0aGVuLg0KDQpVbHRpbWF0ZWx5LCBvbmNl
IHRoZSB3aG9sZSBzZXJpZXMgaXMgYXBwbGllZCwgdGhlbiBub3RoaW5nIG11Y2ggc2hvdWxkIGNo
YW5nZSBmb3IgdGhvc2Ugc3BlY2lmeWluZyBwYXNzdGhyb3VnaCBoL3cgaW4gYW4geGwuY2ZnLiBU
aGUgbWFpbiBkaWZmZXJlbmNlIHdpbGwgYmUgdGhhdCBoL3cgY2Fubm90IGJlIHBhc3NlZCB0aHJv
dWdoIHRvIGEgZG9tYWluIHRoYXQgd2FzIG5vdCBvcmlnaW5hbGx5IGNyZWF0ZWQgd2l0aCBJT01N
VSBwYWdldGFibGVzLg0KV2l0aCBwYXRjaGVzIGFwcGxpZWQgdXAgdG8gdGhpcyBwb2ludCB0aGVu
LCB5ZXMsIGV2ZXJ5IGRvbWFpbiB3aWxsIGdldCBJT01NVSBwYWdlIHRhYmxlcy4gSSBndWVzcyBJ
J2xsIHRha2UgYSBsb29rIGF0IHRoZSBhdXRvLWJhbGxvb25pbmcgY29kZSBhbmQgc2VlIHdoYXQg
bmVlZHMgdG8gYmUgZG9uZS4NCg0KPiANCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL210cnIu
Yw0KPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vbXRyci5jDQo+ID4gQEAgLTc4Myw3ICs3ODMs
OCBAQCBIVk1fUkVHSVNURVJfU0FWRV9SRVNUT1JFKE1UUlIsIGh2bV9zYXZlX210cnJfbXNyLCBo
dm1fbG9hZF9tdHJyX21zciwgMSwNCj4gPg0KPiA+ICAgdm9pZCBtZW1vcnlfdHlwZV9jaGFuZ2Vk
KHN0cnVjdCBkb21haW4gKmQpDQo+ID4gICB7DQo+ID4gLSAgICBpZiAoIChoYXNfaW9tbXVfcHQo
ZCkgfHwgY2FjaGVfZmx1c2hfcGVybWl0dGVkKGQpKSAmJiBkLT52Y3B1ICYmIGQtPnZjcHVbMF0g
KQ0KPiA+ICsgICAgaWYgKCAoaXNfaW9tbXVfZW5hYmxlZChkKSB8fCBjYWNoZV9mbHVzaF9wZXJt
aXR0ZWQoZCkpICYmIGQtPnZjcHUgJiYNCj4gPiArICAgICAgICAgZC0+dmNwdVswXSApDQo+IA0K
PiBBcyBhIHJlYWxseSBtaW5vciBjb21tZW50IC0gSSB0aGluayBpdCB3b3VsZG4ndCBiZSBiYWQg
Zm9yIGJvdGgNCj4gZC0+dmNwdSByZWZlcmVuY2VzIHRvIGVuZCB1cCBvbiB0aGUgc2FtZSBsaW5l
Lg0KDQpPay4NCg0KPiANCj4gPiBAQCAtNjI1LDggKzU0OCw3IEBAIHN0YXRpYyB2b2lkIGlvbW11
X2R1bXBfcDJtX3RhYmxlKHVuc2lnbmVkIGNoYXIga2V5KQ0KPiA+ICAgICAgIG9wcyA9IGlvbW11
X2dldF9vcHMoKTsNCj4gPiAgICAgICBmb3JfZWFjaF9kb21haW4oZCkNCj4gPiAgICAgICB7DQo+
ID4gLSAgICAgICAgaWYgKCBpc19oYXJkd2FyZV9kb21haW4oZCkgfHwNCj4gPiAtICAgICAgICAg
ICAgIGRvbV9pb21tdShkKS0+c3RhdHVzIDwgSU9NTVVfU1RBVFVTX2luaXRpYWxpemVkICkNCj4g
PiArICAgICAgICBpZiAoICFpc19pb21tdV9lbmFibGVkKGQpICkNCj4gPiAgICAgICAgICAgICAg
IGNvbnRpbnVlOw0KPiANCj4gV2h5IGRvIHlvdSBkcm9wIHRoZSBod2RvbSBjaGVjayBoZXJlPw0K
DQpCZWNhdXNlIGlzX2lvbW11X2VuYWJsZWQoKSBmb3IgdGhlIGgvdyBkb21haW4gd2lsbCBhbHdh
eXMgYmUgdHJ1ZSBpZiBpb21tdV9lbmFibGVkIGlzIHRydWUsIHNvIG5vIG5lZWQgZm9yIGEgc3Bl
Y2lhbCBjYXNlLg0KDQo+IA0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vaW9tbXUuaA0K
PiA+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vaW9tbXUuaA0KPiA+IEBAIC0yMSw3ICsyMSw3
IEBAIHN0cnVjdCBhcmNoX2lvbW11DQo+ID4gICB9Ow0KPiA+DQo+ID4gICAvKiBBbHdheXMgc2hh
cmUgUDJNIFRhYmxlIGJldHdlZW4gdGhlIENQVSBhbmQgdGhlIElPTU1VICovDQo+ID4gLSNkZWZp
bmUgaW9tbXVfdXNlX2hhcF9wdChkKSAoaGFzX2lvbW11X3B0KGQpKQ0KPiA+ICsjZGVmaW5lIGlv
bW11X3VzZV9oYXBfcHQoZCkgKGlzX2lvbW11X2VuYWJsZWQoZCkpDQo+IA0KPiBJJ2Qgc3VnZ2Vz
dCBkcm9wcGluZyB0aGUgc3RyYXkgb3V0ZXIgcGFpciBvZiBwYXJlbnRoZXNlcyBhdCB0aGUNCj4g
c2FtZSB0aW1lLg0KDQpPaywgd2lsbCBkby4NCg0KICBQYXVsDQoNCj4gDQo+IEphbg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

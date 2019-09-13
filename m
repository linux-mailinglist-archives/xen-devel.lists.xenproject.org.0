Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA78B1B80
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 12:23:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8igm-0006Tl-1U; Fri, 13 Sep 2019 10:20:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qndu=XI=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i8igk-0006Tg-5l
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 10:20:26 +0000
X-Inumbo-ID: 19a0e2a0-d610-11e9-b299-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19a0e2a0-d610-11e9-b299-bc764e2007e4;
 Fri, 13 Sep 2019 10:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568370026;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XSajEnFR3gkLrrnSTsUvlFAgEP2Tw9H5nLAYpWKtAJA=;
 b=Fs2fmprUhcj6bYywdzoXR6hy36BP5n2toYR1R3Ec2DNv5C0EF1E7TNet
 zE0t4O2QYpIHFfLT08mJ9cwojJHsEOc76XPyvUYKdWpMgcCUZIUkjpDmo
 aRjAOCLs4XuS4yJ/dc/5VsDKM3XBodZlAgdhZsXD5/Zz/8yNXjamhdDNN k=;
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
IronPort-SDR: 2U8Qy1+1RNNdBmb7zbenPDWMZUoYByfeZI9eOUCrJ+m+jroz6nsuEBJI9pFf1avRMrta07toC3
 k32JthRUGfFOWdH6PUJRBcEjIQbqm4T0WhafotcQJB8l2atiSXqLUQh9VeABBSckCDsB/JGQkq
 rKFe48IZy9hh1MMs2dk2J6UPsSRNSLholxlsi1tXnjQXgdpERxX/fUUr8o8MZT9lH96oFziEmJ
 h3V0gHKaTHyhLMwFSFbVaBeiQ/6MFBeE5Gt8vyYRutgyyWdrczP2q9GQrHQesJcm/+s5Zh5ige
 BJQ=
X-SBRS: 2.7
X-MesageID: 5529226
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,500,1559534400"; 
   d="scan'208";a="5529226"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [PATCH v10 5/6] iommu: tidy up iommu_use_hap_pt() and
 need_iommu_pt_sync() macros
Thread-Index: AQHVahhM1EPIkgHzxkKoxuHG2LmQg6cpP6yAgAAlRQA=
Date: Fri, 13 Sep 2019 10:20:18 +0000
Message-ID: <9869b0c1aa894e47a3f3bc74b5b8d18d@AMSPEX02CL03.citrite.net>
References: <20190913094741.31451-1-paul.durrant@citrix.com>
 <20190913094741.31451-6-paul.durrant@citrix.com>
 <9a2f884f-a709-b356-5a21-aae61f1ff3aa@suse.com>
In-Reply-To: <9a2f884f-a709-b356-5a21-aae61f1ff3aa@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v10 5/6] iommu: tidy up iommu_use_hap_pt()
 and need_iommu_pt_sync() macros
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
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDEzIFNlcHRlbWJlciAyMDE5IDExOjA1DQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOyBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgQW5k
cmV3IENvb3Blcg0KPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25u
ZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBWb2xvZHlteXIgQmFiY2h1aw0KPiA8Vm9sb2R5bXly
X0JhYmNodWtAZXBhbS5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5j
b20+OyBJYW4gSmFja3Nvbg0KPiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEtvbnJhZCBSemVzenV0ZWsgV2lsaw0K
PiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsg
V2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MTAgNS82XSBpb21t
dTogdGlkeSB1cCBpb21tdV91c2VfaGFwX3B0KCkgYW5kIG5lZWRfaW9tbXVfcHRfc3luYygpIG1h
Y3Jvcw0KPiANCj4gT24gMTMuMDkuMjAxOSAxMTo0NywgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+
IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oDQo+ID4gKysrIGIveGVuL2luY2x1ZGUveGVu
L2lvbW11LmgNCj4gPiBAQCAtNTYsOCArNTYsMTAgQEAgZXh0ZXJuIGJvb2xfdCBpb21tdV9lbmFi
bGUsIGlvbW11X2VuYWJsZWQ7DQo+ID4gIGV4dGVybiBib29sX3QgZm9yY2VfaW9tbXUsIGlvbW11
X3ZlcmJvc2UsIGlvbW11X2lnZng7DQo+ID4gIGV4dGVybiBib29sX3QgaW9tbXVfc25vb3AsIGlv
bW11X3FpbnZhbCwgaW9tbXVfaW50cmVtYXAsIGlvbW11X2ludHBvc3Q7DQo+ID4NCj4gPiAtI2lm
ZGVmIENPTkZJR19IVk0NCj4gPiArI2lmIGRlZmluZWQoQ09ORklHX0hWTSkNCj4gPiAgZXh0ZXJu
IGJvb2wgaW9tbXVfaGFwX3B0X3NoYXJlOw0KPiA+ICsjZWxpZiBkZWZpbmVkKENPTkZJR19JT01N
VV9GT1JDRV9QVF9TSEFSRSkNCj4gPiArI2RlZmluZSBpb21tdV9oYXBfcHRfc2hhcmUgdHJ1ZQ0K
PiA+ICAjZWxzZQ0KPiA+ICAjZGVmaW5lIGlvbW11X2hhcF9wdF9zaGFyZSBmYWxzZQ0KPiA+ICAj
ZW5kaWYNCj4gDQo+IFRoZSBvcmRlcmluZyBpcyB3cm9uZyBoZXJlIC0gQXJtIHVuY29uZGl0aW9u
YWxseSBkZWZpbmVzIEhWTSwgYW5kDQo+IGhlbmNlIGl0IG5vdyBhbHNvIHNldHRpbmcgSU9NTVVf
Rk9SQ0VfUFRfU0hBUkUgd29uJ3QgYmUgYWNjb3VudGVkDQo+IGZvciB0aGlzIHdheS4NCg0KQWgg
eWVzLCBnb29kIHBvaW50Lg0KDQo+IEknZCBiZSBoYXBweSB0byBhZGp1c3QgdGhpcyBvbiBjb21t
aXQsIGJ1dCBJJ20gYWZyYWlkDQo+IEknbSBzdGlsbCB1bmhhcHB5IGFib3V0IHBhdGNoIDMgKGJ1
dCBJIGd1ZXNzIGF0IHRoaXMgcG9pbnQgSSdsbA0KPiBiZXR0ZXIgcHJvcG9zZSBhIHJlcGxhY2Vt
ZW50IHRoYW4gYXNrIHlvdSBmb3IgZ29pbmcgdGhyb3VnaCBhbm90aGVyDQo+IHJvdW5kKS4NCj4g
DQoNClRoYXQgd291bGQgYmUgaGVscGZ1bC4NCg0KICBQYXVsDQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

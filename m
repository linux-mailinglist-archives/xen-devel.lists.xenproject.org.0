Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F460BC4B2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 11:21:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCgxj-0002uq-9S; Tue, 24 Sep 2019 09:18:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=d2pe=XT=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iCgxi-0002ul-Iq
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 09:18:22 +0000
X-Inumbo-ID: 407d4ea0-deac-11e9-9611-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id 407d4ea0-deac-11e9-9611-12813bfff9fa;
 Tue, 24 Sep 2019 09:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569316701;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j8fwz5jtkbG716GiTdSihYYCOwj1CIkQzyLSCtey6iA=;
 b=aTKSIuiZ2WCFGCyahj/Sng8S/dtMyVe9yDwLdmVsuawKm+xSsuCHlASr
 Jt2mAqzP+5dZcwFzRmSYhwVeawZ0iutu9Oe37k8KUjcL+chzEKVJ8gy4Y
 QzlQtsXLzeDR0A+2iUGzT51M8Bx1trbSsyP+8z/SRvlujZKQkT3yYW7KI s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Js4DZfUUx+asxqkKXsmrGRutZSjR8dFCR0J8w59ZoXeZnZesieK9f7YoouCToLhfozap/n6QBc
 2yRmHxopDBUXpHUoNUiD/2HhtTA5Qw8WgEfotM8l1xJRfTmoX2fALgbvkzE5emxfWK0TnukBp1
 VFLrWUV0+uMDP6kiYRxEUG+bG59aKX+bUuJoIXragsal5QDwInF4e3fUjM8pN4+wPx0bcwTUL9
 wl6tGcaw/BftYcoDzXB6I4bu+rAraVX2783RenYRDzRfHs8pTmLsySW/5ATiY78pUVZR9j2fU6
 Crk=
X-SBRS: 2.7
X-MesageID: 6245011
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,543,1559534400"; 
   d="scan'208";a="6245011"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v6 6/8] AMD/IOMMU: tidy struct ivrs_mappings
Thread-Index: AQHVbu3E2x13CiTrgkyIxcLuJ2Ba16c5eODggAD1DYCAACHJcP//4XWAgAAi3pA=
Date: Tue, 24 Sep 2019 09:18:17 +0000
Message-ID: <838051e296bb49818726b85e7c6dd094@AMSPEX02CL03.citrite.net>
References: <aa62726c-5aa4-8bcd-dc35-61eb8dfeaee3@suse.com>
 <6de11867-b872-a2a1-7c26-af004164bfea@suse.com>
 <6b8b0d5e09c24b068ede852c4eab50dc@AMSPEX02CL03.citrite.net>
 <6d5b8ac4-6787-0f01-fa6a-8301cbb9d5e3@suse.com>
 <10bdff68f43d48829437404735bb383e@AMSPEX02CL03.citrite.net>
 <1417398a-db8a-0e14-011b-78acd32e093f@suse.com>
In-Reply-To: <1417398a-db8a-0e14-011b-78acd32e093f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v6 6/8] AMD/IOMMU: tidy struct ivrs_mappings
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 SuraveeSuthikulpanit <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI0IFNlcHRlbWJlciAyMDE5IDEwOjEzDQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogU3VyYXZlZVN1dGhpa3Vs
cGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPjsgQW5kcmV3IENvb3BlciA8QW5k
cmV3LkNvb3BlcjNAY2l0cml4LmNvbT47DQo+IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
Zw0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIHY2IDYvOF0gQU1EL0lPTU1VOiB0
aWR5IHN0cnVjdCBpdnJzX21hcHBpbmdzDQo+IA0KPiBPbiAyNC4wOS4yMDE5IDExOjA4LCBQYXVs
IER1cnJhbnQgd3JvdGU6DQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCj4gPj4gU2VudDogMjQgU2VwdGVtYmVyIDIwMTkgMTA6MDINCj4gPj4NCj4gPj4gT24gMjMu
MDkuMjAxOSAxODoyNSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+Pj4+IEZyb206IFhlbi1kZXZl
bCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBK
YW4gQmV1bGljaA0KPiA+Pj4+IFNlbnQ6IDE5IFNlcHRlbWJlciAyMDE5IDE0OjI0DQo+ID4+Pj4N
Cj4gPj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2FtZC1pb21tdS5oDQo+ID4+Pj4gKysr
IGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9hbWQtaW9tbXUuaA0KPiA+Pj4+IEBAIC0xMDYsMTIgKzEw
NiwxNiBAQCBzdHJ1Y3QgYW1kX2lvbW11IHsNCj4gPj4+PiAgfTsNCj4gPj4+Pg0KPiA+Pj4+ICBz
dHJ1Y3QgaXZyc19tYXBwaW5ncyB7DQo+ID4+Pj4gLSAgICB1MTYgZHRlX3JlcXVlc3Rvcl9pZDsN
Cj4gPj4+PiAtICAgIHU4IGR0ZV9hbGxvd19leGNsdXNpb247DQo+ID4+Pj4gLSAgICB1OCB1bml0
eV9tYXBfZW5hYmxlOw0KPiA+Pj4+IC0gICAgdTggd3JpdGVfcGVybWlzc2lvbjsNCj4gPj4+PiAt
ICAgIHU4IHJlYWRfcGVybWlzc2lvbjsNCj4gPj4+PiArICAgIHVpbnQxNl90IGR0ZV9yZXF1ZXN0
b3JfaWQ7DQo+ID4+Pj4gICAgICBib29sIHZhbGlkOw0KPiA+Pj4+ICsgICAgYm9vbCBkdGVfYWxs
b3dfZXhjbHVzaW9uOw0KPiA+Pj4+ICsgICAgYm9vbCB1bml0eV9tYXBfZW5hYmxlOw0KPiA+Pj4+
ICsgICAgYm9vbCB3cml0ZV9wZXJtaXNzaW9uOw0KPiA+Pj4+ICsgICAgYm9vbCByZWFkX3Blcm1p
c3Npb247DQo+ID4+Pg0KPiA+Pj4gQ291bGQgeW91IHNocmluayB0aGlzIGV2ZW4gbW9yZSBieSB1
c2luZyBhIGJpdC1maWVsZCBpbnN0ZWFkIG9mIHRoaXMgc2VxdWVuY2Ugb2YgYm9vbHM/DQo+ID4+
DQo+ID4+IEluZGVlZCBJIGhhZCBiZWVuIGNvbnNpZGVyaW5nIHRoaXMuIEJlc2lkZXMgdGhlIGZh
Y3QgdGhhdCBtYWtpbmcNCj4gPj4gc3VjaCBhIG1vdmUgc2ltcGx5IGRpZG4ndCBsb29rIHRvIGZp
dCBvdGhlciB0aGluZ3MgaGVyZSB2ZXJ5IHdlbGwNCj4gPj4gd2hlbiBpbnRyb2R1Y2luZyB0aGUg
InZhbGlkIiBmbGFnIGluIGFuIGVhcmxpZXIgcGF0aCwgYW5kIHRoZW4NCj4gPj4gYWxzbyBub3Qg
aGVyZSwgZG8geW91IHJlYWxpemUgdGhvdWdoIHRoYXQgdGhpcyB3b3VsZG4ndCBzaHJpbmsNCj4g
Pj4gdGhlIHN0cnVjdHVyZSdzIHNpemUgcmlnaHQgbm93IChpLmUuIGl0IHdvdWxkIG9ubHkgYmUg
cG90ZW50aWFsbHkNCj4gPj4gcmVkdWNpbmcgZnV0dXJlIGdyb3d0aCk/DQo+ID4NCj4gPiBZZXMs
IEknZCBmYWlsZWQgdG8gbm90ZSB0aGUgJ3Vuc2lnbmVkIGxvbmcnIGFmdGVyd2FyZHMsIGJ1dC4u
Lg0KPiA+DQo+ID4+IFRoaXMgd2FzIG15IG1haW4gYXJndW1lbnQgYWdhaW5zdCBnb2luZw0KPiA+
PiB0aGlzIGZ1cnRoZXIgc3RlcDsgbGV0IG1lIGtub3cgd2hhdCB5b3UgdGhpbmsuDQo+ID4+DQo+
ID4NCj4gPiBJIHN0aWxsIHRoaW5rIGEgcHJlLWVtcHRpdmUgc3F1YXNoIGludG8gYSB1aW50OF90
IGJpdC1maWVsZCBmb2xsb3dlZA0KPiA+IGJ5IHRoZSBkZXZpY2VfZmxhZ3MgZmllbGQgd291bGQg
Z2l2ZSB0aGUgc3RydWN0IGEgbmljZSAzMi1iaXQgaG9sZQ0KPiA+IGZvciBwb3RlbnRpYWwgZnV0
dXJlIHVzZS4NCj4gDQo+IE9rYXksIHdpbGwgZG8gdGhlbi4gSSB0YWtlIGl0IHlvdXIgUi1iIGNh
biByZW1haW4gaW4gcGxhY2Ugd2l0aCB0aGlzDQo+IGV4dHJhIGNoYW5nZS4NCg0KQWJzb2x1dGVs
eS4gVGhhbmtzLA0KDQogIFBhdWwNCg0KPiANCj4gSmFuDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs

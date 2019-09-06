Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D00AB392
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 09:59:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i696N-0005TO-Fw; Fri, 06 Sep 2019 07:56:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gwiz=XB=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i696L-0005Sr-Or
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 07:56:13 +0000
X-Inumbo-ID: ca343878-d07b-11e9-abeb-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ca343878-d07b-11e9-abeb-12813bfff9fa;
 Fri, 06 Sep 2019 07:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567756571;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k0FbIViBY49UZhoDPR0xL276bSvrgS/UcIXEmTe2JEg=;
 b=FphRfhcjVA8KTEnfbXYH7tsBP0ixJUomKDJT5IKMeCiLLrEAGJ3YONIR
 lL3koq1uuytxrcSmL41BT/yHYrqean9CEMTj9yZ9Bvm425dt5Thxk1j/z
 Ss7Qt9Py5TXg93DRRBqD3wlN8KQ4ymVcLu4Z3eu2VBBwQ5+kPt3Dfj/Gf Q=;
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
IronPort-SDR: GimLV6iRF9cOMk30iHoJ1DMj1PIhIYu+MGiQ5noAmuQkEENqCSEwdPW4GK0CN14lMP07fYd6RR
 P3nLqqeDRx1Uq/2SoSZj9xt/Us/RbU4LqKrOG0UgmZw1nTK2CtfNwn/6Znn1UIbpe8QaCSwosl
 6COrY/QCvnWSck2ry9qIxd4d9ggj1Xs2T5lx8yKBzLNVUfHnTPKB04hbxx6lo+j1q31R5wXFnP
 acylsVTqJy1TPa9S+JTGTxaA8jnWY6KJc0bi6lFOsRlCwUAbXbjJTsQApy6x6vGrd3d/uE4zsp
 4M0=
X-SBRS: 2.7
X-MesageID: 5226665
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,472,1559534400"; 
   d="scan'208";a="5226665"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Julien Grall' <julien.grall@arm.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v8 4/6] remove late (on-demand) construction of IOMMU
 page tables
Thread-Index: AQHVYZ3BGu1OepJycUe/93XGh9kA46cdajwAgADiqfA=
Date: Fri, 6 Sep 2019 07:56:05 +0000
Message-ID: <f3bee17938314777a14af1a63b7f2a5d@AMSPEX02CL03.citrite.net>
References: <20190902145014.36442-1-paul.durrant@citrix.com>
 <20190902145014.36442-5-paul.durrant@citrix.com>
 <32f4990a-5806-04b8-9bbe-6bdb232bf8e9@arm.com>
In-Reply-To: <32f4990a-5806-04b8-9bbe-6bdb232bf8e9@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v8 4/6] remove late (on-demand) construction
 of IOMMU page tables
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPg0KPiBTZW50OiAwNSBTZXB0ZW1iZXIgMjAxOSAyMToyMQ0KPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZw0KPiBDYzogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRl
ci5jb20+OyBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+OyBKYW4N
Cj4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+OyBWb2xvZHlteXIgQmFiY2h1aw0KPiA8Vm9sb2R5bXlyX0JhYmNo
dWtAZXBhbS5jb20+OyBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsg
R2VvcmdlIER1bmxhcA0KPiA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgSWFuIEphY2tzb24g
PElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsNCj4gPGtvbnJh
ZC53aWxrQG9yYWNsZS5jb20+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz47IFdlaSBMaXUg
PHdsQHhlbi5vcmc+OyBSb2dlciBQYXUgTW9ubmUNCj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsg
VGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPjsgUGV0cmUgUGlyY2FsYWJ1DQo+
IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OCA0
LzZdIHJlbW92ZSBsYXRlIChvbi1kZW1hbmQpIGNvbnN0cnVjdGlvbiBvZiBJT01NVSBwYWdlIHRh
Ymxlcw0KPiANCj4gSGksDQo+IA0KPiBPbiA5LzIvMTkgMzo1MCBQTSwgUGF1bCBEdXJyYW50IHdy
b3RlOg0KPiA+IGRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9tZW0uYyBiL3Rvb2xzL2xp
YnhsL2xpYnhsX21lbS5jDQo+ID4gaW5kZXggNDQ4YTJhZjhmZC4uZmQ2ZjMzMzEyZSAxMDA2NDQN
Cj4gPiAtLS0gYS90b29scy9saWJ4bC9saWJ4bF9tZW0uYw0KPiA+ICsrKyBiL3Rvb2xzL2xpYnhs
L2xpYnhsX21lbS5jDQo+ID4gQEAgLTQ2MSwxNSArNDYxLDE3IEBAIGludCBsaWJ4bF9kb21haW5f
bmVlZF9tZW1vcnkobGlieGxfY3R4ICpjdHgsDQo+ID4gICAgICAgaWYgKHJjKSBnb3RvIG91dDsN
Cj4gPg0KPiA+ICAgICAgICpuZWVkX21lbWtiID0gYl9pbmZvLT50YXJnZXRfbWVta2I7DQo+ID4g
KyAgICAqbmVlZF9tZW1rYiArPSBiX2luZm8tPnNoYWRvd19tZW1rYiArIGJfaW5mby0+aW9tbXVf
bWVta2I7DQo+IA0KPiBBRkFJQ1QsIGlvbW11X21lbWtiIHdpbGwgYmUgbm9uLTAgZXZlbiB3aGVu
IHRoZSBJT01NVSBzaGFyZSB0aGUNCj4gcGFnZS10YWJsZSB3aXRoIHRoZSBDUFVzLiBJZiBzbywg
d2h5IGlzIHRoaXMgcmVxdWlyZWQgZm9yIHRoYXQgY2FzZT8NCg0KVGhlIHRvb3N0YWNrIGNhbid0
IGtub3cgYWJvdXQgc2hhcmVkIEVQVCBhcyB0aGVyZSdzIG5vIG1lY2hhbmlzbSB0byB0ZWxsIGl0
LiBPbmNlIHBhdGNoICM2IGdvZXMgaW4gdGhvdWdoLCB0aGUgdG9vbHN0YWNrIHdpbGwgYmUgYWJs
ZSB0byBzZWxlY3Qgc2hhcmVkIGFuZCBmb3JlZ28gdGhlIG92ZXJoZWFkLiBIb3dldmVyLCBJJ3Zl
IGp1c3QgcmVhbGl6ZWQgdGhhdCBvZiBjb3Vyc2UgdGhpcyBtZWFucyB0aGF0IHRoZSBkb21haW4g
bWF5IGZhaWwgZHVlIHRvIGxhY2sgb2YgcmVzb3VyY2VzIG9uIGEgaG9zdCB3aGljaCBkb2Vzbid0
IHN1cHBvcnQgc2hhcmVkIEVQVCBzbyBJIHRoaW5rIEknbSBnb2luZyB0byBoYXZlIHRvIGFkZCBh
ZGQgZXh0cmEgaW5mbyAoZm9sbG93aW5nIG9uIGZyb20gUm9nZXIncyByZWNlbnQgcGF0Y2gpIHNv
IHRoZSB0b29sc3RhY2sgY2FuIGtub3cgd2hldGhlciBzaGFyZWQgRVBUIGlzIGF2YWlsYWJsZS4N
Cg0KICBQYXVsDQoNCj4gDQo+ID4gKw0KPiA+ICAgICAgIHN3aXRjaCAoYl9pbmZvLT50eXBlKSB7
DQo+ID4gICAgICAgY2FzZSBMSUJYTF9ET01BSU5fVFlQRV9QVkg6DQo+ID4gICAgICAgY2FzZSBM
SUJYTF9ET01BSU5fVFlQRV9IVk06DQo+ID4gLSAgICAgICAgKm5lZWRfbWVta2IgKz0gYl9pbmZv
LT5zaGFkb3dfbWVta2IgKyBMSUJYTF9IVk1fRVhUUkFfTUVNT1JZOw0KPiA+ICsgICAgICAgICpu
ZWVkX21lbWtiICs9IExJQlhMX0hWTV9FWFRSQV9NRU1PUlk7DQo+ID4gICAgICAgICAgIGlmIChs
aWJ4bF9kZWZib29sX3ZhbChiX2luZm8tPmRldmljZV9tb2RlbF9zdHViZG9tYWluKSkNCj4gPiAg
ICAgICAgICAgICAgICpuZWVkX21lbWtiICs9IDMyICogMTAyNDsNCj4gPiAgICAgICAgICAgYnJl
YWs7DQo+ID4gICAgICAgY2FzZSBMSUJYTF9ET01BSU5fVFlQRV9QVjoNCj4gPiAtICAgICAgICAq
bmVlZF9tZW1rYiArPSBiX2luZm8tPnNoYWRvd19tZW1rYiArIExJQlhMX1BWX0VYVFJBX01FTU9S
WTsNCj4gPiArICAgICAgICAqbmVlZF9tZW1rYiArPSBMSUJYTF9QVl9FWFRSQV9NRU1PUlk7DQo+
ID4gICAgICAgICAgIGJyZWFrOw0KPiA+ICAgICAgIGRlZmF1bHQ6DQo+ID4gICAgICAgICAgIHJj
ID0gRVJST1JfSU5WQUw7DQo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX3R5cGVz
LmlkbCBiL3Rvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbA0KPiA+IGluZGV4IGI2MTM5OWNlMzYu
LmQ5NGI3NDUzY2IgMTAwNjQ0DQo+ID4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRs
DQo+ID4gKysrIGIvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsDQo+ID4gQEAgLTQ4Niw2ICs0
ODYsNyBAQCBsaWJ4bF9kb21haW5fYnVpbGRfaW5mbyA9IFN0cnVjdCgiZG9tYWluX2J1aWxkX2lu
Zm8iLFsNCj4gPiAgICAgICAoInRhcmdldF9tZW1rYiIsICAgIE1lbUtCKSwNCj4gPiAgICAgICAo
InZpZGVvX21lbWtiIiwgICAgIE1lbUtCKSwNCj4gPiAgICAgICAoInNoYWRvd19tZW1rYiIsICAg
IE1lbUtCKSwNCj4gPiArICAgICgiaW9tbXVfbWVta2IiLCAgICAgTWVtS0IpLA0KPiANCj4gSSB0
aGluayB5b3Ugd2FudCBhIGNvcnJlc3BvbmRpbmcgTElCWExfSEFWRSBpbiBsaWJ4bC5oIHRvIHRl
bGwgZXh0ZXJuYWwNCj4gdG9vbHN0YWNrIHdoZXRoZXIgdGhlIGZpZWxkIGV4aXN0Lg0KPiANCj4g
PiAgICAgICAoInJ0Y190aW1lb2Zmc2V0IiwgIHVpbnQzMiksDQo+ID4gICAgICAgKCJleGVjX3Nz
aWRyZWYiLCAgICB1aW50MzIpLA0KPiA+ICAgICAgICgiZXhlY19zc2lkX2xhYmVsIiwgc3RyaW5n
KSwNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

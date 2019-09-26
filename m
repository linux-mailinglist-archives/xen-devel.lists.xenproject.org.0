Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5A5BEE4F
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:20:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDPtr-0000YU-Df; Thu, 26 Sep 2019 09:17:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8zHT=XV=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iDPtq-0000YP-DK
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:17:22 +0000
X-Inumbo-ID: 7182e5c6-e03e-11e9-964b-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id 7182e5c6-e03e-11e9-964b-12813bfff9fa;
 Thu, 26 Sep 2019 09:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569489441;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GCYDhznX1z/x3OF3kZ6h+E9qstVzjMr7QLFAsE9m8ao=;
 b=GtrW+AVz4cVjSigCBqrGXTr2nqzrXbxj0clqosMN72MTrRB/gNAUTn/p
 kkxhegYjom7dtnTPw4ygvfhwH5oNSA8WI5KivoX6i/82njyDuu/TKutT3
 WSIupIRBqni3zP1r4VBJoF4u1niFQu4KV3Pi9KbcD3c/GvAHvbk72oUiB I=;
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
IronPort-SDR: Y90I8mwSjtbmASCjcRyxNZ543OfTDpO2SFbOdKfYpvBqnqU5RFZDGUhedOQCSyhLntjktaEjeJ
 r2NDvZ+2NRMmZVruGmWxVyDsK27umEQrpi24hrM8hpGjDS1SQsz4TfBCGaMo104g465gZ2QHev
 6j3mVJVNn7EMDNkZPs6YLS/ufvhAyAxyVQrMmr6MS128m483MGBqGMxBJhbXUhT3ujZcHvn5tV
 225wNx+vrGB3z3f2dZAh6UeM6FXxydiUDwpPXakLHqJQmhTciO8OE4cl8fXifO92J/cgZB+TWh
 yfg=
X-SBRS: 2.7
X-MesageID: 6381212
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,551,1559534400"; 
   d="scan'208";a="6381212"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Julien Grall' <julien.grall@arm.com>, 'Oleksandr' <olekstysh@gmail.com>, 
 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v13 0/4] add per-domain IOMMU control
Thread-Index: AQHVbg2Z91+gZvcE2UG2jzrPcpRppKc8HWgw///hpgCAACJVgIAAUp0AgAAmyFCAADmZgIAA2Ukw///p8QCAACHXIA==
Date: Thu, 26 Sep 2019 09:17:16 +0000
Message-ID: <2e20c26c2c7e4289bbb4a18481335087@AMSPEX02CL03.citrite.net>
References: <20190918104113.3294-1-paul.durrant@citrix.com>
 <013c45a9490e413cb97abb02cef960bc@AMSPEX02CL03.citrite.net>
 <dcfdf2ab-8c64-ee63-637f-b0517087e8b5@suse.com>
 <23dec58404634921a595653f8a5ea504@AMSPEX02CL03.citrite.net>
 <7d50ae35-2642-7fe5-89c7-c4ee09f263d0@gmail.com>
 <94de3adfac564f8e920bd04b3cf54734@AMSPEX02CL03.citrite.net>
 <7f18c7f3-1d25-6d24-b44b-27cf77163eec@arm.com>
 <3c719420dabd4cc1860f0d687cdc3f78@AMSPEX02CL03.citrite.net>
 <dc48b203-2213-ba55-3335-18328b4f78bf@arm.com>
In-Reply-To: <dc48b203-2213-ba55-3335-18328b4f78bf@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v13 0/4] add per-domain IOMMU control
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
 Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, KonradRzeszutek
 Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "Tim \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, David Scott <dave@recoil.org>,
 Anthony Perard <anthony.perard@citrix.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPg0KPiBTZW50OiAyNiBTZXB0ZW1iZXIgMjAxOSAxMDoxMw0KPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47ICdPbGVrc2FuZHInIDxvbGVr
c3R5c2hAZ21haWwuY29tPjsgJ0phbiBCZXVsaWNoJw0KPiA8amJldWxpY2hAc3VzZS5jb20+DQo+
IENjOiBuZCA8bmRAYXJtLmNvbT47IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZl
bmRlci5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgS29ucmFkUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxr
QG9yYWNsZS5jb20+OyBBbmRyZXcNCj4gQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29t
PjsgRGF2aWQgU2NvdHQgPGRhdmVAcmVjb2lsLm9yZz47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4u
b3JnPjsgR2VvcmdlDQo+IER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgVGFtYXMg
SyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPjsgSWFuIEphY2tzb24NCj4gPElhbi5KYWNr
c29uQGNpdHJpeC5jb20+OyBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNv
bT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gVm9sb2R5bXlyIEJhYmNodWsg
PFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4NCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2MTMgMC80XSBh
ZGQgcGVyLWRvbWFpbiBJT01NVSBjb250cm9sDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDkvMjYvMTkg
OTozOSBBTSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPEp1bGllbi5HcmFsbEBhcm0uY29tPg0KPiA+
PiBTZW50OiAyNSBTZXB0ZW1iZXIgMjAxOSAyMjozNA0KPiA+PiBUbzogUGF1bCBEdXJyYW50IDxQ
YXVsLkR1cnJhbnRAY2l0cml4LmNvbT47ICdPbGVrc2FuZHInIDxvbGVrc3R5c2hAZ21haWwuY29t
PjsgJ0phbiBCZXVsaWNoJw0KPiA+PiA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IENjOiBuZCA8
bmRAYXJtLmNvbT47IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+
OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkg
TGl1IDx3bEB4ZW4ub3JnPjsgS29ucmFkUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNs
ZS5jb20+Ow0KPiBBbmRyZXcNCj4gPj4gQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29t
PjsgRGF2aWQgU2NvdHQgPGRhdmVAcmVjb2lsLm9yZz47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4u
b3JnPjsNCj4gR2VvcmdlDQo+ID4+IER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsg
VGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPjsgSWFuIEphY2tzb24NCj4gPj4g
PElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+ID4+IFZv
bG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IFJvZ2VyIFBhdSBN
b25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVs
XSBbUEFUQ0ggdjEzIDAvNF0gYWRkIHBlci1kb21haW4gSU9NTVUgY29udHJvbA0KPiA+Pg0KPiA+
PiBIaSwNCj4gPj4NCj4gPj4gT24gMjUvMDkvMjAxOSAxNzoxMCwgUGF1bCBEdXJyYW50IHdyb3Rl
Og0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4gRnJvbTogT2xla3Nh
bmRyIDxvbGVrc3R5c2hAZ21haWwuY29tPg0KPiA+Pj4+IFNlbnQ6IDI1IFNlcHRlbWJlciAyMDE5
IDE2OjUwDQo+ID4+Pj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+
OyAnSmFuIEJldWxpY2gnIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4+PiBDYzogUGV0cmUgUGly
Y2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47DQo+IFdlaQ0KPiA+PiBMaXUNCj4gPj4+PiA8d2xAeGVu
Lm9yZz47IEtvbnJhZFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgQW5k
cmV3IENvb3Blcg0KPiA+Pj4+IDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgRGF2aWQgU2Nv
dHQgPGRhdmVAcmVjb2lsLm9yZz47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsgR2Vvcmdl
DQo+ID4+IER1bmxhcA0KPiA+Pj4+IDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBUYW1hcyBL
IExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+OyBJYW4gSmFja3Nvbg0KPiA+Pj4+IDxJYW4u
SmFja3NvbkBjaXRyaXguY29tPjsgQW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJp
eC5jb20+OyB4ZW4tDQo+ID4+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiA+Pj4+IFZv
bG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IFJvZ2VyIFBhdSBN
b25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBKdWxpZW4NCj4gPj4gR3JhbGwNCj4gPj4+PiA8
anVsaWVuLmdyYWxsQGFybS5jb20+DQo+ID4+Pj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQ
QVRDSCB2MTMgMC80XSBhZGQgcGVyLWRvbWFpbiBJT01NVSBjb250cm9sDQo+ID4+Pj4NCj4gPj4+
Pg0KPiA+Pj4+IFtDQyBKdWxpZW5dDQo+ID4+Pj4NCj4gPj4+Pg0KPiA+Pj4+IEhpIFBhdWwNCj4g
Pj4+Pg0KPiA+Pj4+IEkgbWF5IG1pc3Rha2UsIGJ1dCBsb29rcyBsaWtlDQo+ID4+Pj4NCj4gPj4+
PiA4MGZmM2QzMzhkYzkzMjYwYjQxZmZlZWViYjBmODUyYzJlZGVmOWNlIGlvbW11OiB0aWR5IHVw
DQo+ID4+Pj4gaW9tbXVfdXNlX2hhcF9wdCgpIGFuZCBuZWVkX2lvbW11X3B0X3N5bmMoKSBtYWNy
b3MNCj4gPj4+Pg0KPiA+Pj4+IHRyaWdnZXJzIEFTU0VSVF9VTlJFQUNIQUJMRSBvbiBBcm0gaWYg
bm8gSU9NTVUgaGFzIGJlZW4gZm91bmQgKEkgYnVpbHQNCj4gPj4+PiB3aXRoIG15IHBsYXRmb3Jt
J3MgSU9NTVUgZHJpdmVyIGRpc2FibGVkOiAjIENPTkZJR19JUE1NVV9WTVNBIGlzIG5vdCBzZXQp
IC4NCj4gPj4+Pg0KPiA+Pj4+IFNvLCBpb21tdV9zZXR1cCgpIGNhbGxzIGNsZWFyX2lvbW11X2hh
cF9wdF9zaGFyZSgpIHdpdGgNCj4gPj4+PiBpb21tdV9oYXBfcHRfc2hhcmUgYmVpbmcgc2V0IChD
T05GSUdfSU9NTVVfRk9SQ0VfUFRfU0hBUkU9eSkgd2hpY2gsDQo+ID4+Pj4gYWN0dWFsbHksIHRy
aWdnZXJzIEFTU0VSVC4NCj4gPj4+Pg0KPiA+Pj4NCj4gPj4+IEhlcmUgYSBtaW5pbWFsIHBhdGNo
LCBsZWF2aW5nICdmb3JjZSBwdCBzaGFyZScgaW4gcGxhY2UuIERvZXMgdGhpcyBhdm9pZCB0aGUg
cHJvYmxlbT8NCj4gPj4+DQo+ID4+PiAtLS04PC0tLQ0KPiA+Pj4gZGlmZiAtLWdpdCBhL3hlbi9j
b21tb24vc3lzY3RsLmMgYi94ZW4vY29tbW9uL3N5c2N0bC5jDQo+ID4+PiBpbmRleCBlODc2M2M3
ZmRmLi5mODhhMjg1ZTdmIDEwMDY0NA0KPiA+Pj4gLS0tIGEveGVuL2NvbW1vbi9zeXNjdGwuYw0K
PiA+Pj4gKysrIGIveGVuL2NvbW1vbi9zeXNjdGwuYw0KPiA+Pj4gQEAgLTI2OCw5ICsyNjgsMTEg
QEAgbG9uZyBkb19zeXNjdGwoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fc3lzY3RsX3QpIHVf
c3lzY3RsKQ0KPiA+Pj4gICAgICAgICAgICBwaS0+bWF4X21mbiA9IGdldF91cHBlcl9tZm5fYm91
bmQoKTsNCj4gPj4+ICAgICAgICAgICAgYXJjaF9kb19waHlzaW5mbyhwaSk7DQo+ID4+PiAgICAg
ICAgICAgIGlmICggaW9tbXVfZW5hYmxlZCApDQo+ID4+PiArICAgICAgICB7DQo+ID4+PiAgICAg
ICAgICAgICAgICBwaS0+Y2FwYWJpbGl0aWVzIHw9IFhFTl9TWVNDVExfUEhZU0NBUF9kaXJlY3Rp
bzsNCj4gPj4+IC0gICAgICAgIGlmICggaW9tbXVfaGFwX3B0X3NoYXJlICkNCj4gPj4+IC0gICAg
ICAgICAgICBwaS0+Y2FwYWJpbGl0aWVzIHw9IFhFTl9TWVNDVExfUEhZU0NBUF9pb21tdV9oYXBf
cHRfc2hhcmU7DQo+ID4+PiArICAgICAgICAgICAgaWYgKCBpb21tdV9oYXBfcHRfc2hhcmUgKQ0K
PiA+Pj4gKyAgICAgICAgICAgICAgICBwaS0+Y2FwYWJpbGl0aWVzIHw9IFhFTl9TWVNDVExfUEhZ
U0NBUF9pb21tdV9oYXBfcHRfc2hhcmU7DQo+ID4+PiArICAgICAgICB9DQo+ID4+Pg0KPiA+Pj4g
ICAgICAgICAgICBpZiAoIGNvcHlfdG9fZ3Vlc3QodV9zeXNjdGwsIG9wLCAxKSApDQo+ID4+PiAg
ICAgICAgICAgICAgICByZXQgPSAtRUZBVUxUOw0KPiA+Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL3hlbi9pb21tdS5oIGIveGVuL2luY2x1ZGUveGVuL2lvbW11LmgNCj4gPj4+IGluZGV4IDdj
MzAwM2YzZjEuLjZhMTBhMjQxMjggMTAwNjQ0DQo+ID4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4v
aW9tbXUuaA0KPiA+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2lvbW11LmgNCj4gPj4+IEBAIC02
OCw4ICs2OCw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBjbGVhcl9pb21tdV9oYXBfcHRfc2hhcmUo
dm9pZCkNCj4gPj4+ICAgIHsNCj4gPj4+ICAgICNpZm5kZWYgaW9tbXVfaGFwX3B0X3NoYXJlDQo+
ID4+PiAgICAgICAgaW9tbXVfaGFwX3B0X3NoYXJlID0gZmFsc2U7DQo+ID4+PiAtI2VsaWYgaW9t
bXVfaGFwX3B0X3NoYXJlDQo+ID4+PiAtICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOw0KPiA+Pj4g
ICAgI2VuZGlmDQo+ID4+DQo+ID4+IElITU8sIGNhbGxpbmcgdGhpcyBmdW5jdGlvbiBpcyBhIG1p
c3Rha2Ugb24gcGxhdGZvcm0gb25seSBzdXBwb3J0aW5nDQo+ID4+IHNoYXJlZCBwYWdlLXRhYmxl
IHNvIHRoZSBBU1NFUlQoKSBzaG91bGQgYmUga2VwdCBoZXJlLg0KPiA+Pg0KPiA+PiBUaGlzIHJh
aXNlcyB0aGUgcXVlc3Rpb24gd2h5IHRoZSBmdW5jdGlvbiBpcyBhY3R1YWxseSBjYWxsZWQgZnJv
bSBjb21tb24NCj4gPj4gY29kZS4gaW9tbXVfaGFwX2VuYWJsZWQoKSBzaG91bGQgdGVjaG5pY2Fs
bHkgbm90IGJlIHVzZWQgaW4gYW55IGNvZGUgaWYNCj4gPj4gdGhlIElPTU1VIGlzIG5vdCBlbmFi
bGVkL3ByZXNlbnQuIFNvIHdoYXQgYXJlIHlvdSB0cnlpbmcgdG8gcHJldmVudCBoZXJlPw0KPiA+
DQo+ID4gV2hhdCBJJ20gdHJ5aW5nIHRvIHByZXZlbnQsIG9uIHg4NiwgaXMgYSBzaXR1YXRpb24g
d2hlcmUgdGhlIGlvbW11X2VuYWJsZWQgPT0gZmFsc2UgYnV0DQo+IGlvbW11X2hhcF9wdF9zaGFy
ZSA9PSB0cnVlLg0KPiANCj4gVGhpcyBpcyBub3QgZW50aXJlbHkgdW5jb21tb24gdG8gaGF2ZSBv
dGhlciB2YXJpYWJsZXMgZ2F0ZWQgYnkgb3RoZXJzLg0KPiBTbyB3aGF0IGNvdWxkIGhhcHBlbiBp
ZiB5b3UgaGF2ZSBpb21tdV9lbmFibGVkID09IGZhbHNlIGFuZA0KPiBpb21tdV9oYXBfcHRfc2hh
cmUgPT0gdHJ1ZSBvbiB4ODY/DQo+IA0KDQpXZWxsLCBJIHdhcyBob3BpbmcgdG8gYXZvaWQgdGhl
IG5lc3RlZCBpZiBpbiBzeXNjdGwuYy4NCg0KPiA+IEkgaGFkLCBtaXN0YWtlbmx5LCBiZWxpZXZl
ZCB0aGF0IGlvbW11X2VuYWJsZWQgd291bGQgbmV2ZXIgYmUgZmFsc2UgZm9yIEFSTSBidXQgaXQg
c2VlbXMgdGhpcyBpcyBub3QNCj4gdGhlIGNhc2Ugc28gdGhhdCBzaXR1YXRpb24gaGFzIHRvIGJl
IHRvbGVyYXRlZC4gSSBndWVzcywgZ2l2ZW4gdGhlIG90aGVyIGh1bmsgb2YgbXkgcGF0Y2gsIEkg
Y2FuDQo+IGFjdHVhbGx5IGxlYXZlIHRoZSBBU1NFUlQgaW4gcGxhY2UgYW5kIGF2b2lkIG1ha2lu
ZyB0aGUgY2FsbCBmcm9tIGNvbW1vbiBjb2RlLCBpbiB3aGljaCBjYXNlIHRoZQ0KPiBmdW5jdGlv
biBvdWdodCB0byBtb3ZlIGludG8gYW4geDg2IGhlYWRlciBhcyB3ZWxsLg0KPiANCj4gQnkgInRo
ZSBmdW5jdGlvbiIsIGRvIHlvdSBtZWFuIGNsZWFyX2lvbW11X2hhcF9wdF9zaGFyZT8NCg0KWWVz
Lg0KDQo+IElmIHNvLCBJIHRoaW5rDQo+IGl0IHNob3VsZCBzdGF5IHdlcmUgaXQgaXMuIFRoaXMg
aXMgYSBnZW5lcmljIGZ1bmN0aW9uIHRoYXQgbWlnaHQgYmUNCj4gcmUtdXNlZCBmb3Igb3RoZXIg
YXJjaGl0ZWN0dXJlIGluIHRoZSBmdXR1cmUuDQo+IA0KDQpUaGF0IHNlZW1zIGxpa2UgYSBiaXQg
b2YgYSBsb25nIHNob3QuIElmIEkgcmVtb3ZlIHRoZSBjYWxsIGZyb20gaW9tbXVfc2V0dXAoKSB0
aGVuIHRoZSBvbmx5IHJlbWFpbmluZyBjYWxsZXJzIGFyZSBpbiB4ODYgY29kZSwgYnV0IEkgc3Vw
cG9zZSBpdCBjYW4gc3RheSB3aGVyZSBpdCBpcyB0byBhdm9pZCB0aGUgY2h1cm4uIEknbGwgc3Bp
biBhIG5ldyB0ZXN0IHBhdGNoLg0KDQogIFBhdWwNCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==

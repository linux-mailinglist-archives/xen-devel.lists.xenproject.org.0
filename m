Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC4E6E571
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 14:14:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoRk1-0003PD-7y; Fri, 19 Jul 2019 12:12:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=S3sa=VQ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hoRjz-0003P8-IB
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 12:11:59 +0000
X-Inumbo-ID: 67e1d449-aa1e-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 67e1d449-aa1e-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 12:11:58 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: L/rbuZiRgpRXa1kcTTPU/GLIJkgAsxjGSUsraMcCMerFG3Zd3Kqr9tE+Sfotv5IAq5a35h+LVO
 10POiba19OvdgUcnDXCosP61ekG30GHcPJdJfidjRK2bAi8t4WrlvFvs4pKZsFBCBy/CXIyGlv
 wQCmQrT7LLCzT8gzocCUdT9awE/r5IV8CCDvlWMZC1lEneFKdCioT5IMp8dWThx6HsTEwpNSNA
 PLWBFf1MqNu+uOBZJJkSEGmdVKYfK4PIKjpbvo/COd13DC7hOZt3tqrxRgbV21/kCIiK/G4GQ/
 ZUs=
X-SBRS: 2.7
X-MesageID: 3254204
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,282,1559534400"; 
   d="scan'208";a="3254204"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Petre Ovidiu PIRCALABU' <ppircalabu@bitdefender.com>, 'Jan Beulich'
 <JBeulich@suse.com>
Thread-Topic: [PATCH v2 07/10] vm_event: Add vm_event_ng interface
Thread-Index: AQHVPIeuvysw+S0SxESjjWmMYVkcbqbOwNgAgAAfJACAAWdVAIABTcoA///mggCAACI9gIAAEGyAgAAuTSA=
Date: Fri, 19 Jul 2019 12:11:54 +0000
Message-ID: <875eb41c92654f5a85625f0cc08994b5@AMSPEX02CL03.citrite.net>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <cover.1563293545.git.ppircalabu@bitdefender.com>
 <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
 <e1c9a42d-7bde-5749-7cf3-cb5e7b4041e1@suse.com>
 <de42faf2929b0ff0d52949d21dea5f2b30336840.camel@bitdefender.com>
 <20603303-440d-3ac4-8f78-861abaa78d70@suse.com>
 <22abf98c86af08adb0444ffa115bc56b9bd552fc.camel@bitdefender.com>
 <d73a2d9ba0b5407390ae9a635314f6d4@AMSPEX02CL03.citrite.net>
 <014491cd-8ee7-26ff-5619-6c5d54c51b3c@suse.com>
 <ebe52ee6d8a9483b87f21d01c5f2c435@AMSPEX02CL03.citrite.net>
 <bf1c57019b77fd6b79f86957477862ae81db5678.camel@bitdefender.com>
In-Reply-To: <bf1c57019b77fd6b79f86957477862ae81db5678.camel@bitdefender.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 07/10] vm_event: Add vm_event_ng interface
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
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, JulienGrall <julien.grall@arm.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau
 Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZXRyZSBPdmlkaXUgUElSQ0FM
QUJVIDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4NCj4gU2VudDogMTkgSnVseSAyMDE5IDEy
OjI0DQo+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgJ0phbiBC
ZXVsaWNoJyA8SkJldWxpY2hAc3VzZS5jb20+DQo+IENjOiBKdWxpZW5HcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+OyBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSA8YWlzYWlsYUBiaXRkZWZlbmRl
ci5jb20+OyBSYXp2YW4NCj4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+OyBB
bmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcA0K
PiA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNp
dHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubmUNCj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOw0KPiBLb25yYWRSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3Jh
Y2xlLmNvbT47IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT47IFRpbSAoWGVu
Lm9yZykNCj4gPHRpbUB4ZW4ub3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MiAwNy8xMF0gdm1fZXZlbnQ6IEFkZCB2bV9ldmVudF9uZyBpbnRlcmZhY2UN
Cj4gDQo+IE9uIEZyaSwgMjAxOS0wNy0xOSBhdCAwODoyNiArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEphbiBC
ZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4NCj4gPiA+IFNlbnQ6IDE5IEp1bHkgMjAxOSAwOToy
Mg0KPiA+ID4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+DQo+ID4g
PiBDYzogJ1BldHJlIE92aWRpdSBQSVJDQUxBQlUnIDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNv
bT47DQo+ID4gPiBKdWxpZW5HcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ow0KPiA+ID4gQWxl
eGFuZHJ1IFN0ZWZhbiBJU0FJTEEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPjsgUmF6dmFuIENv
am9jYXJ1DQo+ID4gPiA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT47IEFuZHJldw0KPiA+ID4g
Q29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcCA8DQo+ID4g
PiBHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3Nvbg0KPiA+ID4gPElhbi5KYWNr
c29uQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsN
Cj4gPiA+IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA+ID4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+ID4gPiBLb25yYWRSemVzenV0ZWsg
V2lsaw0KPiA+ID4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBUYW1hcyBLIExlbmd5ZWwgPHRh
bWFzQHRrbGVuZ3llbC5jb20+Ow0KPiA+ID4gVGltIChYZW4ub3JnKSA8dGltQHhlbi5vcmc+OyBX
ZWkgTGl1DQo+ID4gPiA8d2xAeGVuLm9yZz4NCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIg
MDcvMTBdIHZtX2V2ZW50OiBBZGQgdm1fZXZlbnRfbmcgaW50ZXJmYWNlDQo+ID4gPg0KPiA+ID4g
T24gMTkuMDcuMjAxOSAwOTo1NiwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+ID4gPiA+IEZyb206
IFBldHJlIE92aWRpdSBQSVJDQUxBQlUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPg0KPiA+
ID4gPiA+IFNlbnQ6IDE4IEp1bHkgMjAxOSAxNDo1OQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gU28s
IGF0IHRoaXMgcG9pbnQgdGhlIG1vc3QgcHJvbWlzaW5nIHNvbHV0aW9uIGlzIGFsbG9jYXRpbmcg
dGhlDQo+ID4gPiA+ID4gbWVtb3J5DQo+ID4gPiA+ID4gaW4gWEVOLCBzaGFyaW5nIGl0IHdpdGgg
SUQgdXNpbmcgc2hhcmVfeGVuX3BhZ2Vfd2l0aF9ndWVzdCwgYW5kDQo+ID4gPiA+ID4gbWFwcGlu
Zw0KPiA+ID4gPiA+IGl0IHdpdGggeGVuZm9yZWlnbm1lbW9yeV9tYXBfcmVzb3VyY2UgKHdpdGgg
dGhlIGZsYWcNCj4gPiA+ID4gPiBYRU5NRU1fcnNyY19hY3FfY2FsbGVyX293bmVkIHNldCkNCj4g
PiA+ID4NCj4gPiA+ID4gSWYgdGhhdCBwYWdlIGlzIHNoYXJlZCB3aXRoIHRoZSBJRCB0aGVuDQo+
ID4gPiA+IFhFTk1FTV9yc3JjX2FjcV9jYWxsZXJfb3duZWQNCj4gPiA+ID4gc2hvdWxkICpub3Qq
IGJlIHNldC4gQWxzbywgdGhhdCBmbGFnIGlzIGFuICdvdXQnIGZsYWcuLi4gdGhlDQo+ID4gPiA+
IGNhbGxlcg0KPiA+ID4gPiBkb2Vzbid0IGRlY2lkZSB3aG8gb3ducyB0aGUgcmVzb3VyY2UuDQo+
ID4gPg0KPiA+ID4gSSBoYWQgaW1wbGllZCB0aGF0IGl0J3MgcmVhbGx5IE1EIHRoYXQncyBtZWFu
dCBoZXJlLCBidXQgbWF5YmUgSQ0KPiA+ID4gd2FzDQo+ID4gPiB3cm9uZyBkb2luZyBzby4NCj4g
PiA+DQo+ID4gPiA+IFRCSCBJIHJlZ3JldCBldmVyIGludHJvZHVjaW5nIHRoZSBmbGFnOyBpdCBj
YXVzZWQgYSBsb3Qgb2YNCj4gPiA+ID4gcHJvYmxlbXMsDQo+ID4gPiA+IHdoaWNoIGlzIHdoeSBp
dCBpcyBubyBsb25nZXIgdXNlZC4NCj4gPiA+DQo+ID4gPiBJdCdzIGEgdG9vbHMgb25seSBpbnRl
cmZhY2UgLSB3aHkgZG9uJ3Qgd2UgZHJvcCB0aGUgZmxhZyBpZiB5b3Ugbm93DQo+ID4gPiB0aGlu
ayBpdCB3YXMgYSBiYWQgaWRlYSB0byBpbnRyb2R1Y2UgaXQ/DQo+ID4NCj4gPiBJIHdhcyBpbmRl
ZWQgdGhpbmtpbmcgSSBzaG91bGQgZmluZCBlbm91Z2ggdHVpdHMgdG8gZG8gdGhhdCBpbiB0aGUN
Cj4gPiBuZWFyIGZ1dHVyZS4NCj4gPg0KPiA+ICAgUGF1bA0KPiA+DQo+ID4gPg0KPiA+ID4gSmFu
DQo+IFNvcnJ5LCBteSBtaXN0YWtlLiBJIG1lYW50IHRvIHNheSBpdCdzIHNoYXJlZCB3aXRoIE1E
Lg0KPiANCj4gTWFueSB0aGFua3MgZm9yIHlvdXIgc3VwcG9ydCwNCg0KT2ssIGluIHRoYXQgY2Fz
ZSBwbGVhc2Ugc2hhcmUgd2l0aCB0aGUgSUQgaW5zdGVhZC4gSSBmb3VuZCBzb21lIHR1aXRzIHRo
aXMgbW9ybmluZyBhbmQgYW0gYWJvdXQgdG8gYSBzdWJtaXQgYSBwYXRjaC4NCg0KICBQYXVsDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

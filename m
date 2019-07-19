Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5646E281
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 10:29:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoODq-0001qJ-HD; Fri, 19 Jul 2019 08:26:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=S3sa=VQ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hoODo-0001pq-LW
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 08:26:32 +0000
X-Inumbo-ID: e9447b6d-a9fe-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e9447b6d-a9fe-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 08:26:31 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: khXECWJjhZ4tMuslCD4MV0Mja9iD6DlaHJwyzZnVMN+0zi+8+fTEyOvILmhUR5NXiLn/RyT5nH
 lQcu6d2qgWdrlHfksKbntMp74MWkY4t26oCHIMKGcY7E0UmzjQmsgt+rZfgN6+tCALMMMi2iX+
 hA0s0Fz9L0KEmEvwr1cKCUSstosN5rtwODx4p69VDlJr8A8XaKihe9lhoDkfzvwgG/KwTc1zQ7
 BY1GZTlnvVrKSjWeFcJ5YpYOfnGM7wBAcwld1O8Rf1t1xRxabq3SyFA1blK96Kpnh7aRN+X77e
 M1c=
X-SBRS: 2.7
X-MesageID: 3168007
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,281,1559534400"; 
   d="scan'208";a="3168007"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [PATCH v2 07/10] vm_event: Add vm_event_ng interface
Thread-Index: AQHVPIeuvysw+S0SxESjjWmMYVkcbqbOwNgAgAAfJACAAWdVAIABTcoA///mggCAACI9gA==
Date: Fri, 19 Jul 2019 08:26:27 +0000
Message-ID: <ebe52ee6d8a9483b87f21d01c5f2c435@AMSPEX02CL03.citrite.net>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <cover.1563293545.git.ppircalabu@bitdefender.com>
 <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
 <e1c9a42d-7bde-5749-7cf3-cb5e7b4041e1@suse.com>
 <de42faf2929b0ff0d52949d21dea5f2b30336840.camel@bitdefender.com>
 <20603303-440d-3ac4-8f78-861abaa78d70@suse.com>
 <22abf98c86af08adb0444ffa115bc56b9bd552fc.camel@bitdefender.com>
 <d73a2d9ba0b5407390ae9a635314f6d4@AMSPEX02CL03.citrite.net>
 <014491cd-8ee7-26ff-5619-6c5d54c51b3c@suse.com>
In-Reply-To: <014491cd-8ee7-26ff-5619-6c5d54c51b3c@suse.com>
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
Cc: 'Petre Ovidiu PIRCALABU' <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 JulienGrall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDE5IEp1bHkgMjAxOSAwOToyMg0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6ICdQZXRyZSBPdmlkaXUgUElSQ0FM
QUJVJyA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+OyBKdWxpZW5HcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+Ow0KPiBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSA8YWlzYWlsYUBiaXRkZWZl
bmRlci5jb20+OyBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+OyBB
bmRyZXcNCj4gQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxh
cCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgSWFuIEphY2tzb24NCj4gPElhbi5KYWNrc29u
QGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgU3Rl
ZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnOyBLb25yYWRSemVzenV0ZWsgV2lsaw0KPiA8a29ucmFkLndpbGtA
b3JhY2xlLmNvbT47IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT47IFRpbSAo
WGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsgV2VpIExpdQ0KPiA8d2xAeGVuLm9yZz4NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2MiAwNy8xMF0gdm1fZXZlbnQ6IEFkZCB2bV9ldmVudF9uZyBpbnRlcmZh
Y2UNCj4gDQo+IE9uIDE5LjA3LjIwMTkgMDk6NTYsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPj4g
RnJvbTogUGV0cmUgT3ZpZGl1IFBJUkNBTEFCVSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+
DQo+ID4+IFNlbnQ6IDE4IEp1bHkgMjAxOSAxNDo1OQ0KPiA+Pg0KPiA+PiBTbywgYXQgdGhpcyBw
b2ludCB0aGUgbW9zdCBwcm9taXNpbmcgc29sdXRpb24gaXMgYWxsb2NhdGluZyB0aGUgbWVtb3J5
DQo+ID4+IGluIFhFTiwgc2hhcmluZyBpdCB3aXRoIElEIHVzaW5nIHNoYXJlX3hlbl9wYWdlX3dp
dGhfZ3Vlc3QsIGFuZCBtYXBwaW5nDQo+ID4+IGl0IHdpdGggeGVuZm9yZWlnbm1lbW9yeV9tYXBf
cmVzb3VyY2UgKHdpdGggdGhlIGZsYWcNCj4gPj4gWEVOTUVNX3JzcmNfYWNxX2NhbGxlcl9vd25l
ZCBzZXQpDQo+ID4NCj4gPiBJZiB0aGF0IHBhZ2UgaXMgc2hhcmVkIHdpdGggdGhlIElEIHRoZW4g
WEVOTUVNX3JzcmNfYWNxX2NhbGxlcl9vd25lZA0KPiA+IHNob3VsZCAqbm90KiBiZSBzZXQuIEFs
c28sIHRoYXQgZmxhZyBpcyBhbiAnb3V0JyBmbGFnLi4uIHRoZSBjYWxsZXINCj4gPiBkb2Vzbid0
IGRlY2lkZSB3aG8gb3ducyB0aGUgcmVzb3VyY2UuDQo+IA0KPiBJIGhhZCBpbXBsaWVkIHRoYXQg
aXQncyByZWFsbHkgTUQgdGhhdCdzIG1lYW50IGhlcmUsIGJ1dCBtYXliZSBJIHdhcw0KPiB3cm9u
ZyBkb2luZyBzby4NCj4gDQo+ID4gVEJIIEkgcmVncmV0IGV2ZXIgaW50cm9kdWNpbmcgdGhlIGZs
YWc7IGl0IGNhdXNlZCBhIGxvdCBvZiBwcm9ibGVtcywNCj4gPiB3aGljaCBpcyB3aHkgaXQgaXMg
bm8gbG9uZ2VyIHVzZWQuDQo+IA0KPiBJdCdzIGEgdG9vbHMgb25seSBpbnRlcmZhY2UgLSB3aHkg
ZG9uJ3Qgd2UgZHJvcCB0aGUgZmxhZyBpZiB5b3Ugbm93DQo+IHRoaW5rIGl0IHdhcyBhIGJhZCBp
ZGVhIHRvIGludHJvZHVjZSBpdD8NCg0KSSB3YXMgaW5kZWVkIHRoaW5raW5nIEkgc2hvdWxkIGZp
bmQgZW5vdWdoIHR1aXRzIHRvIGRvIHRoYXQgaW4gdGhlIG5lYXIgZnV0dXJlLg0KDQogIFBhdWwN
Cg0KPiANCj4gSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

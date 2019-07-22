Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D606FAD8
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 10:01:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpTDi-0007uQ-9t; Mon, 22 Jul 2019 07:58:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+VRc=VT=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hpTDh-0007uL-2V
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 07:58:53 +0000
X-Inumbo-ID: 88c1e3ca-ac56-11e9-ac7c-836eb7f51fa9
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88c1e3ca-ac56-11e9-ac7c-836eb7f51fa9;
 Mon, 22 Jul 2019 07:58:48 +0000 (UTC)
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
IronPort-SDR: 3AS4aCrmjPlejxS6qq3jE6yUdbGiKpJR2TwbCqoEdB5M1UKZS1ecgYqOn3WbKoU9fXTWMitclD
 aQvrzUoIoZ5Up19ceiNpoON3uB2iQovcAVvMGi94Ch93wtwZ107EaYOQuIcCp9BYYl3wpfPlaL
 so5D/38kg14btZwC2t8pSIIem9oD8nllBaDnEA7NdHIp8Ia4K5fkKw6byN0NP7lXtW5S5c6Pmi
 9G87xRGAMJH19bK/RkxZ4CGCpoxuVhLox36bnLlrvJrg6zOMY16K7MsrWqlU07nPE6BCij9tV2
 Epo=
X-SBRS: 2.7
X-MesageID: 3345986
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,294,1559534400"; 
   d="scan'208";a="3345986"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Petre Ovidiu PIRCALABU' <ppircalabu@bitdefender.com>, Jan Beulich
 <JBeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Thread-Topic: [PATCH v2 07/10] vm_event: Add vm_event_ng interface
Thread-Index: AQHVPIeuvysw+S0SxESjjWmMYVkcbqbOwNgAgAAfJACAAWdVAIABTcoA///mggCAACI9gIAAEGyAgAAuTSD//+TaAIAAId8A///lvQAACcueAACGpjsA
Date: Mon, 22 Jul 2019 07:58:42 +0000
Message-ID: <f4c9f55aad6042b2991a22b3a88d886d@AMSPEX02CL03.citrite.net>
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
 <875eb41c92654f5a85625f0cc08994b5@AMSPEX02CL03.citrite.net>
 <88cd6480-cda4-5e9b-2e9a-aa1e275832cb@suse.com>
 <24e346edb9604148b5790369b4fce384@AMSPEX02CL03.citrite.net>
 <96e2ece1-5460-52d5-d2a5-8123d8148441@suse.com>
 <34f0c5f2d55c5318b1a922d2aec2aa70ef23010e.camel@bitdefender.com>
In-Reply-To: <34f0c5f2d55c5318b1a922d2aec2aa70ef23010e.camel@bitdefender.com>
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
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 JulienGrall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZXRyZSBPdmlkaXUgUElSQ0FM
QUJVIDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4NCj4gU2VudDogMTkgSnVseSAyMDE5IDE4
OjQwDQo+IFRvOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+OyBQYXVsIER1cnJhbnQg
PFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8QW5kcmV3LkNvb3Bl
cjNAY2l0cml4LmNvbT4NCj4gQ2M6IEp1bGllbkdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47
IEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT47IFJhenZh
bg0KPiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT47IEdlb3JnZSBEdW5sYXAg
PEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IElhbiBKYWNrc29uDQo+IDxJYW4uSmFja3NvbkBj
aXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFN0ZWZh
bm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZzsgS29ucmFkUnplc3p1dGVrIFdpbGsNCj4gPGtvbnJhZC53aWxrQG9y
YWNsZS5jb20+OyBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+OyBUaW0gKFhl
bi5vcmcpIDx0aW1AeGVuLm9yZz47IFdlaSBMaXUNCj4gPHdsQHhlbi5vcmc+DQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjIgMDcvMTBdIHZtX2V2ZW50OiBBZGQgdm1fZXZlbnRfbmcgaW50ZXJmYWNl
DQo+IA0KPiBPbiBGcmksIDIwMTktMDctMTkgYXQgMTI6NTkgKzAwMDAsIEphbiBCZXVsaWNoIHdy
b3RlOg0KPiA+IE9uIDE5LjA3LjIwMTkgMTQ6MzcsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiA+
ID4gRnJvbTogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPg0KPiA+ID4gPiBTZW50OiAx
OSBKdWx5IDIwMTkgMTM6MzINCj4gPiA+ID4NCj4gPiA+ID4gT24gMTkuMDcuMjAxOSAxNDoxMSwg
UGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+ID4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPiA+ID4gPiA+IEZyb206IFBldHJlIE92aWRpdSBQSVJDQUxBQlUgPHBwaXJjYWxhYnVA
Yml0ZGVmZW5kZXIuY29tPg0KPiA+ID4gPiA+ID4gU2VudDogMTkgSnVseSAyMDE5IDEyOjI0DQo+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gU29ycnksIG15IG1pc3Rha2UuIEkgbWVhbnQgdG8gc2F5
IGl0J3Mgc2hhcmVkIHdpdGggTUQuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gTWFueSB0aGFu
a3MgZm9yIHlvdXIgc3VwcG9ydCwNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IE9rLCBpbiB0aGF0IGNh
c2UgcGxlYXNlIHNoYXJlIHdpdGggdGhlIElEIGluc3RlYWQuDQo+ID4gPiA+DQo+ID4gPiA+IEJ1
dCB0aGF0J3MgZXhhY3RseSB3aGF0IHdlIHdhbnQgdG8gYXZvaWQ6IElmIHNoYXJpbmcgYXQgYWxs
LCB0aGVuDQo+ID4gPiA+IHBsZWFzZSB3aXRoIHRoZSBtb3JlIHByaXZpbGVnZWQgZW50aXR5Lg0K
PiA+ID4NCj4gPiA+IFdoeT8gV2UncmUgdGFsa2luZyBIVk0gZ3Vlc3RzIG9ubHkgaGVyZSBJSVVD
IHNvIHRoaXMgaXMgZXF1aXZhbGVudA0KPiA+ID4gdG8gSU9SRVEgc2VydmVyLi4uDQo+ID4NCj4g
PiBOb3Qgc3VyZTogVGhlIG1haW4gdm1fZXZlbnQuYyBmaWxlcyBsaXZlIGluIGNvbW1vbi8gYW5k
IGFyY2gveDg2Lw0KPiA+IHJlc3BlY3RpdmVseSwgc28gSSB0aG91Z2h0IGF0IGxlYXN0IGFyY2hp
dGVjdHVyYWxseSBWTSBldmVudHMgd2VyZQ0KPiA+IHBvc3NpYmxlIGZvciBQViBhcyB3ZWxsLiBJ
ZiBpdCdzIGluZGVlZCBIVk0tb25seSwgdGhlbiBmb2xsb3dpbmcNCj4gPiB0aGUgSU9SRVEgc2Vy
dmVyIG1vZGVsIGluIGl0cyBlbnRpcmV0eSB3b3VsZCBvZiBjb3Vyc2UgYmUgZmluZS4NCj4gPg0K
PiA+IEphbg0KPiANCj4gSW4gb25lIG9mIHRoZSBwcmV2aW91cyB2ZXJzaW9uIG9mIHRoZSBwYXRj
aHNldCB0aGVyZSB3YXMgYSBzdWdnZXN0aW9uDQo+IHRvIGltcGxlbWVudCB0aGUgbmV3IHZtX2V2
ZW50IHRyYW5zcG9ydCB1c2luZyBJT1JFUSwgYnV0IGl0IHdhcyBkcm9wcGVkDQo+IC4NCj4gDQo+
IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAx
OS0wNC9tc2cwMDE3My5odG1sDQo+IA0KPiBBbHNvLCB1bmxlc3MgdGhlcmUgaXNuJ3QgYSBwcm9w
ZXIgd2F5IGFsbG9jYXRlIHRoZSBuZWNlc3NhcnkgcGFnZXMsIEkNCj4gd291bGRuJ3QgaW50cm9k
dWNlIGEgSFZNLW9ubHkgbGltaXRhdGlvbiBiZWNhdXNlLCBvdGhlciB0aGFuIHRoZSBIVk0NCj4g
cGFyYW0gdXNlZCB0byBrZWVwIHRyYWNrIG9mIHRoZSByaW5nIHBmbiwgdGhlIHZtX2V2ZW50IG1l
Y2hhbmlzbSBpcw0KPiBxdWl0ZSBnZW5lcmljLg0KDQpXZWxsLCB3aXRoIHJlc291cmNlIG1hcHBp
bmcgeW91IHdvdWxkbid0IG5lZWQgdGhlIEhWTSBwYXJhbSwgcHJlc3VtYWJseS4gSU1PIGl0IHdv
dWxkIGJlIGJlc3QgdG8gbWFrZSB0aGlzIEhWTSBvbmx5IGluIHRoZSBmaXJzdCBpbnN0YW5jZSwg
dG8gYXZvaWQgYmxvY2tpbmcgcHJvZ3Jlc3MuIFRoaXMgY2FzZSBkb2VzIGhpZ2hsaWdodCB0aGUg
bmVlZCBmb3IgYSBzb2x1dGlvbiB0byB0aGUgaXNzdWUgb2YgcmVzb3VyY2UgYWNjb3VudGluZyBm
b3IgUFYgZ3Vlc3RzLiBNeSBzdWdnZXN0aW9uIGlzIGEgcGFnZSB0eXBlIHRoYXQgY2FuIGJlIGFz
c2lnbmVkIHRvIGEgZ3Vlc3QgYnV0IGNhbm5vdCBiZSBtYXBwZWQgdG8gdGhhdCBndWVzdC4uLiBz
b21ldGhpbmcgYWtpbiB0byBhIHBhZ2UgdGFibGUgcGVyaGFwcz8NCg0KICBQYXVsDQoNCj4gDQo+
IE1hbnkgdGhhbmtzIGZvciB5b3VyIHN1cHBvcnQsDQo+IFBldHJlDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

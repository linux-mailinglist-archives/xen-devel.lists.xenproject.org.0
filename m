Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1266E5D1
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 14:39:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoS8w-0005J1-36; Fri, 19 Jul 2019 12:37:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=S3sa=VQ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hoS8t-0005Ip-V5
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 12:37:43 +0000
X-Inumbo-ID: ff55d668-aa21-11e9-ae1f-97ee35a1df78
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff55d668-aa21-11e9-ae1f-97ee35a1df78;
 Fri, 19 Jul 2019 12:37:41 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6ZpBi9S/Fkm2DuH9NiE76D6BcPlR9zip0/nSN2E6KP7D4Vg/+d541cMjZayEC+zA5NZJnGJ5tR
 euDDlZgE7huJQJBSa1vgP3eN3HdO2Ahiod4PhEsrAxEZOGQjRSyKRfEsNehzHMoVqtIvjFH6Nv
 hLLqzgxUG5YQKnuukRGA4utmgderfyqEp1+QzZ4JCGYzB47/E17qRHMv7vcdiHWZLtfPiLwOOW
 ApuwBmxmsHudYPui91WDYqB1iuSU8/MTDq78iB7z4VycrcIyyaotbGXXN8FnQP78ZeXTYchTmp
 yXw=
X-SBRS: 2.7
X-MesageID: 3214898
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,282,1559534400"; 
   d="scan'208";a="3214898"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [PATCH v2 07/10] vm_event: Add vm_event_ng interface
Thread-Index: AQHVPIeuvysw+S0SxESjjWmMYVkcbqbOwNgAgAAfJACAAWdVAIABTcoA///mggCAACI9gIAAEGyAgAAuTSD//+TaAIAAId8A
Date: Fri, 19 Jul 2019 12:37:36 +0000
Message-ID: <24e346edb9604148b5790369b4fce384@AMSPEX02CL03.citrite.net>
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
In-Reply-To: <88cd6480-cda4-5e9b-2e9a-aa1e275832cb@suse.com>
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
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDE5IEp1bHkgMjAxOSAxMzozMg0KPiBUbzogUGF1bCBEdXJy
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
Y2UNCj4gDQo+IE9uIDE5LjA3LjIwMTkgMTQ6MTEsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogUGV0cmUgT3ZpZGl1IFBJUkNB
TEFCVSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+DQo+ID4+IFNlbnQ6IDE5IEp1bHkgMjAx
OSAxMjoyNA0KPiA+Pg0KPiA+PiBPbiBGcmksIDIwMTktMDctMTkgYXQgMDg6MjYgKzAwMDAsIFBh
dWwgRHVycmFudCB3cm90ZToNCj4gPj4+PiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+DQo+ID4+Pj4gU2VudDogMTkgSnVseSAyMDE5IDA5OjIyDQo+ID4+Pj4NCj4gPj4+PiBP
biAxOS4wNy4yMDE5IDA5OjU2LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4+Pj4+IElmIHRoYXQg
cGFnZSBpcyBzaGFyZWQgd2l0aCB0aGUgSUQgdGhlbg0KPiA+Pj4+PiBYRU5NRU1fcnNyY19hY3Ff
Y2FsbGVyX293bmVkDQo+ID4+Pj4+IHNob3VsZCAqbm90KiBiZSBzZXQuIEFsc28sIHRoYXQgZmxh
ZyBpcyBhbiAnb3V0JyBmbGFnLi4uIHRoZQ0KPiA+Pj4+PiBjYWxsZXINCj4gPj4+Pj4gZG9lc24n
dCBkZWNpZGUgd2hvIG93bnMgdGhlIHJlc291cmNlLg0KPiA+Pj4+DQo+ID4+Pj4gSSBoYWQgaW1w
bGllZCB0aGF0IGl0J3MgcmVhbGx5IE1EIHRoYXQncyBtZWFudCBoZXJlLCBidXQgbWF5YmUgSQ0K
PiA+Pj4+IHdhcw0KPiA+Pj4+IHdyb25nIGRvaW5nIHNvLg0KPiA+Pj4+DQo+ID4+Pj4+IFRCSCBJ
IHJlZ3JldCBldmVyIGludHJvZHVjaW5nIHRoZSBmbGFnOyBpdCBjYXVzZWQgYSBsb3Qgb2YNCj4g
Pj4+Pj4gcHJvYmxlbXMsDQo+ID4+Pj4gd2hpY2ggaXMgd2h5IGl0IGlzIG5vIGxvbmdlciB1c2Vk
Lg0KPiA+Pj4+DQo+ID4+Pj4gSXQncyBhIHRvb2xzIG9ubHkgaW50ZXJmYWNlIC0gd2h5IGRvbid0
IHdlIGRyb3AgdGhlIGZsYWcgaWYgeW91IG5vdw0KPiA+Pj4+IHRoaW5rIGl0IHdhcyBhIGJhZCBp
ZGVhIHRvIGludHJvZHVjZSBpdD8NCj4gPj4+DQo+ID4+PiBJIHdhcyBpbmRlZWQgdGhpbmtpbmcg
SSBzaG91bGQgZmluZCBlbm91Z2ggdHVpdHMgdG8gZG8gdGhhdCBpbiB0aGUNCj4gPj4+IG5lYXIg
ZnV0dXJlLg0KPiA+Pj4NCj4gPj4gU29ycnksIG15IG1pc3Rha2UuIEkgbWVhbnQgdG8gc2F5IGl0
J3Mgc2hhcmVkIHdpdGggTUQuDQo+ID4+DQo+ID4+IE1hbnkgdGhhbmtzIGZvciB5b3VyIHN1cHBv
cnQsDQo+ID4NCj4gPiBPaywgaW4gdGhhdCBjYXNlIHBsZWFzZSBzaGFyZSB3aXRoIHRoZSBJRCBp
bnN0ZWFkLg0KPiANCj4gQnV0IHRoYXQncyBleGFjdGx5IHdoYXQgd2Ugd2FudCB0byBhdm9pZDog
SWYgc2hhcmluZyBhdCBhbGwsIHRoZW4NCj4gcGxlYXNlIHdpdGggdGhlIG1vcmUgcHJpdmlsZWdl
ZCBlbnRpdHkuDQoNCldoeT8gV2UncmUgdGFsa2luZyBIVk0gZ3Vlc3RzIG9ubHkgaGVyZSBJSVVD
IHNvIHRoaXMgaXMgZXF1aXZhbGVudCB0byBJT1JFUSBzZXJ2ZXIuLi4gVGhlIHBhZ2VzIGFyZSB0
YXJnZXQgYXNzaWduZWQgc28gdGhhdCBmb3JlaWduIG1hcHBpbmcgd29ya3MsIGJ1dCBwcm90ZWN0
ZWQgZnJvbSB0aGUgZ3Vlc3QgaXRzZWxmIGJlY2F1c2UgdGhleSBhcmUgbmV2ZXIgaW4gdGhlIFAy
TS4NCg0KPiBIb3cgd291bGQgTUQgYWNjZXNzIHRoZSBwYWdlDQo+IGlmIGl0J3Mgc2hhcmVkIHdp
dGggSUQgKHdoaWNoLCBhaXVpLCBoYXMgbm8gYnVzaW5lc3MgYWNjZXNzaW5nIHRoZQ0KPiBwYWdl
IGF0IGFsbCk/DQo+IA0KDQpVc2luZyBmb3JlaWduIG1hcHBpbmcgaW4gdGhlIHNhbWUgd2F5IGFz
IElPUkVRIHNlcnZlci4gT3RoZXJ3aXNlIHdlIGFyZSBiYWNrIGludG8gdGhlIHJlZiBjb3VudGlu
ZyBhbmQgZ2VuZXJhbCBhY2NvdW50aW5nIGhlbGwgdGhhdCB0YXJnZXQgYXNzaWdubWVudCBhdm9p
ZHMuIEkgYWdyZWUgdGhhdCBhIGJldHRlciBsb25nIHRlcm0gc29sdXRpb24gaXMgcHJvYmFibHkg
ZGVzaXJhYmxlIGJ1dCBJIGRvbid0IGhvbmVzdGx5IGtub3cgd2hhdCB0aGF0IHdvdWxkIGxvb2sg
bGlrZS4NCg0KICBQYXVsDQoNCj4gSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs

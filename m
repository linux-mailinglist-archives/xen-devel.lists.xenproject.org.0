Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9089B5E603
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 16:05:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hifr7-0002HO-Ie; Wed, 03 Jul 2019 14:03:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eYTC=VA=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hifr5-0002EY-JY
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 14:03:27 +0000
X-Inumbo-ID: 539a9491-9d9b-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 539a9491-9d9b-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 14:03:26 +0000 (UTC)
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
IronPort-SDR: y2i5U4f0JM5p1jvLiQI3l6pQ7zdmXE52nF5lZYbBpz9jzSy+7mEVNm5M8DbjKEQyr6H4BIzowO
 P8QRW0V2zwuvmNTgLf2nH1s5+GiZ+j9/6HVgI+Or3eaVP0bV1ROZDPGMzPxvkZjaTKFkkJDKD6
 5qGFFx//gdx80sFxNflItPYVwZgoTXyZR5ZzcXWgqB35CZDTpf1OM5zCDR5Npm/7Zy3Q+CYpcd
 +Z++VbUs4CHeHowTsn+wrLvYhw2SR1z9cJUv6VMq/1aE5ZQcDofDXGWJ8MXYjti0VoQ6eM2EmH
 HbU=
X-SBRS: 2.7
X-MesageID: 2569555
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,446,1557201600"; 
   d="scan'208";a="2569555"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] passthrough/pci: properly qualify the
 mem_sharing_enabled check...
Thread-Index: AQHVMA9kcqsXFu/a/EyHT+XK2JkJZqa4wnSAgAAih5D//+ARAIAAKP5A
Date: Wed, 3 Jul 2019 14:03:21 +0000
Message-ID: <d7a0c8552f044696bb77b90d444021b5@AMSPEX02CL03.citrite.net>
References: <20190701131750.37855-1-paul.durrant@citrix.com>
 <a57d3e6a-b28a-611b-9db7-c49004157da3@suse.com>
 <e07d1e6fa911456490ec9a8475fa4000@AMSPEX02CL03.citrite.net>
 <14d8827e-6b13-2f0c-dd1d-f22b0917ec29@suse.com>
In-Reply-To: <14d8827e-6b13-2f0c-dd1d-f22b0917ec29@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] passthrough/pci: properly qualify the
 mem_sharing_enabled check...
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Tamas
 KLengyel <tamas@tklengyel.com>, George Dunlap <George.Dunlap@citrix.com>,
 WeiLiu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAzIEp1bHkgMjAxOSAxNDozMA0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZw0KPiBDYzogQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEdl
b3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IFJvZ2VyIFBhdQ0KPiBNb25u
ZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBUYW1hcyBLTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVs
LmNvbT47IFdlaUxpdSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gcGFzc3Ro
cm91Z2gvcGNpOiBwcm9wZXJseSBxdWFsaWZ5IHRoZSBtZW1fc2hhcmluZ19lbmFibGVkIGNoZWNr
Li4uDQo+IA0KPiBPbiAwMy4wNy4yMDE5IDE1OjI1LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxKQmV1
bGljaEBzdXNlLmNvbT4NCj4gPj4gU2VudDogMDMgSnVseSAyMDE5IDE0OjIwDQo+ID4+IFRvOiBQ
YXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnDQo+ID4+IENjOiBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRy
aXguY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IEdlb3JnZQ0K
PiBEdW5sYXANCj4gPj4gPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IFRhbWFzIEsgTGVuZ3ll
bCA8dGFtYXNAdGtsZW5neWVsLmNvbT47IFdlaUxpdSA8d2xAeGVuLm9yZz4NCj4gPj4gU3ViamVj
dDogUmU6IFtQQVRDSF0gcGFzc3Rocm91Z2gvcGNpOiBwcm9wZXJseSBxdWFsaWZ5IHRoZSBtZW1f
c2hhcmluZ19lbmFibGVkIGNoZWNrLi4uDQo+ID4+DQo+ID4+IE9uIDAxLjA3LjIwMTkgMTU6MTcs
IFBhdWwgRHVycmFudCB3cm90ZToNCj4gPj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L3BjaS5jDQo+ID4+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPiA+Pj4g
QEAgLTE0NTAsNyArMTQ1MCw3IEBAIHN0YXRpYyBpbnQgYXNzaWduX2RldmljZShzdHJ1Y3QgZG9t
YWluICpkLCB1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuLCB1MzINCj4gPj4gZmxhZykNCj4gPj4+
DQo+ID4+PiAgICAgICAgLyogUHJldmVudCBkZXZpY2UgYXNzaWduIGlmIG1lbSBwYWdpbmcgb3Ig
bWVtIHNoYXJpbmcgaGF2ZSBiZWVuDQo+ID4+PiAgICAgICAgICogZW5hYmxlZCBmb3IgdGhpcyBk
b21haW4gKi8NCj4gPj4+IC0gICAgaWYgKCB1bmxpa2VseShkLT5hcmNoLmh2bS5tZW1fc2hhcmlu
Z19lbmFibGVkIHx8DQo+ID4+PiArICAgIGlmICggdW5saWtlbHkobWVtX3NoYXJpbmdfZW5hYmxl
ZChkKSB8fA0KPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgdm1fZXZlbnRfY2hlY2tfcmluZyhk
LT52bV9ldmVudF9wYWdpbmcpIHx8DQo+ID4+PiAgICAgICAgICAgICAgICAgICAgICBwMm1fZ2V0
X2hvc3RwMm0oZCktPmdsb2JhbF9sb2dkaXJ0eSkgKQ0KPiA+Pj4gICAgICAgICAgICByZXR1cm4g
LUVYREVWOw0KPiA+Pg0KPiA+PiBUaGlzIGNoYW5nZSBpcyByZWR1bmRhbnQgd2l0aCB0aGUgbW9y
ZSBleHRlbnNpdmUgb25lIGJ5DQo+ID4+ICJ4ODYvSFZNOiBwMm1fcmFtX3JvIGlzIGluY29tcGF0
aWJsZSB3aXRoIGRldmljZSBwYXNzLXRocm91Z2giLA0KPiA+PiBvZiB3aGljaCBJJ3ZlIHNlbnQg
djIgZWFybGllciB0b2RheSwgYW5kIHYxIG9mIHdoaWNoIGhhcyBiZWVuDQo+ID4+IHBlbmRpbmcg
Zm9yIHF1aXRlIHNvbWUgdGltZSB3aXRob3V0IGhhdmluZyBoZWFyZCBiYWNrIGZyb20NCj4gPj4g
b3RoZXIgdGhhbiB5b3UuDQo+ID4NCj4gPiBBZ3JlZWQsIGJ1dCBJIHN0aWxsIHRoaW5rIGl0J3Mg
YSBnb29kIGlkZWEgdG8gbW92ZSB0aGUNCj4gPiBtZW1fc2hhcmluZ19lbmFibGVkKCkgbWFjcm8g
aW50byBkb21haW4uaCwgc28gbWF5YmUgaW5jb3Jwb3JhdGUNCj4gPiB0aGF0IGludG8geW91ciBw
YXRjaD8NCj4gDQo+IEhtbSwgdGhhdCB3b3VsZCBhY3R1YWxseSBoYXZlIGJlZW4gYSBxdWVzdGlv
biBvZiBtaW5lIGlmIEkgaGFkbid0DQo+IHJlY29nbml6ZWQgdGhlIHJlZHVuZGFuY3k6IFdoeSBk
b21haW4uaCByYXRoZXIgdGhhbiBtZW1fc2hhcmluZy5oPw0KPiBGdXJ0aGVybW9yZSBJJ2QgcmF0
aGVyIG5vdCB1c2UgaXQgaGVyZSBhbnl3YXksIHRvIGF2b2lkIHR3bw0KPiBjb25zZWN1dGl2ZSBp
c19odm1fKigpIGNoZWNrcyAod2hpY2ggaGF2ZSBiZWNvbWUgc2xpZ2h0bHkgbW9yZQ0KPiBleHBl
bnNpdmUgd2l0aCB0aGUgTEZFTkNFIGFkZGl0aW9uKS4NCg0KTWF5YmUgbWVtX3NoYXJpbmcuaCBp
cyBhIG1vcmUgbG9naWNhbCBsb2NhdGlvbiwgYnV0IEkgdGhpbmsgcHJvdmlkaW5nIGEgbWFjcm8g
dG8gbWFrZSBzdXJlIHRoZSBpc19odm1fZG9tYWluKCkgcHJvdGVjdGlvbiBpcyB0aGVyZSBpcyBh
IGdvb2QgdGhpbmcuIEFzIGZvciB1c2luZyBpdCBoZXJlLCB5ZXMgSSBndWVzcyB0aGUgYWRkaXRp
b24gb2YgdGhlIHNwZWN1bGF0aW9uIGJhcnJpZXIgbWFrZXMgaXQgbW9yZSBleHBlbnNpdmUgYnV0
IHRoZW4gaXMgbm90IHJlYWxseSBwZXJmb3JtYW5jZSBjcml0aWNhbCBjb2RlIHNvIEknZCBnbyBm
b3IgdGlkaW5lc3MuDQoNCiAgUGF1bA0KDQoNCj4gDQo+IEphbg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

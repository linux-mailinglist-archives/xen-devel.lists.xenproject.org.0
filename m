Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CDA5B758
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 10:58:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhs6D-00052l-NV; Mon, 01 Jul 2019 08:55:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vScv=U6=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hhs6C-00052g-5j
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 08:55:44 +0000
X-Inumbo-ID: ffaf9fb0-9bdd-11e9-aace-1373d8d4c56f
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ffaf9fb0-9bdd-11e9-aace-1373d8d4c56f;
 Mon, 01 Jul 2019 08:55:39 +0000 (UTC)
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
IronPort-SDR: 0gug3mHr10sak6Hkx5rcWsuIksuSQiUTtV0AE35xdPxfrixQUWLhTM+UpOsIZ8fTgZqAW3cyqU
 2uTexbh2yoJrXHTOdxYOd0pib1cJG8fW0w/wbTPVecoEs1syqkix0If6DmCM/ulGWwlBe4GNP8
 vNqjvwsmNThsEvxVadV7nJog/GOkY0xpBa9CuMo37LO6b0z5sgCbKD52+Eeb5rb4JMkKVpDqI2
 xGdSVp2RdMLXCzS3PbSYbB6emdus0loW0WMuH5dZ5Y4rASbl9weZo280m2mTXA//9T+0UChcUW
 kFs=
X-SBRS: 2.7
X-MesageID: 2438105
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,438,1557201600"; 
   d="scan'208";a="2438105"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Petre Ovidiu PIRCALABU' <ppircalabu@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>
Thread-Topic: vfree crash
Thread-Index: AQHVLdtKR3tMnDvHzU6ntSjZrlUsUaa1cLWAgAAGYACAAAF2gA==
Date: Mon, 1 Jul 2019 08:55:30 +0000
Message-ID: <e131d31b93504843a72b72e22afb41ff@AMSPEX02CL03.citrite.net>
References: <19d3bbfa82ffe542367c676d83db65e37d013544.camel@bitdefender.com>
 <e277e40ad1c54b209a6f6107cbfaf5a0@AMSPEX02CL03.citrite.net>
 <527abac0d7a9a25bb69c7af30afa8ab209c90737.camel@bitdefender.com>
In-Reply-To: <527abac0d7a9a25bb69c7af30afa8ab209c90737.camel@bitdefender.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] vfree crash
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
Cc: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZXRyZSBPdmlkaXUgUElSQ0FM
QUJVIDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4NCj4gU2VudDogMDEgSnVseSAyMDE5IDA5
OjQ2DQo+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyDQo+IDxBbmRyZXcuQ29vcGVy
M0BjaXRyaXguY29tPg0KPiBDYzogQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgPGFpc2FpbGFAYml0
ZGVmZW5kZXIuY29tPjsgcmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbQ0KPiBTdWJqZWN0OiBSZTog
dmZyZWUgY3Jhc2gNCj4gDQo+IE9uIE1vbiwgMjAxOS0wNy0wMSBhdCAwODoyOSArMDAwMCwgUGF1
bCBEdXJyYW50IHdyb3RlOg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+
IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+
IE9uIEJlaGFsZg0KPiA+ID4gT2YgUGV0cmUgT3ZpZGl1IFBJUkNBTEFCVQ0KPiA+ID4gU2VudDog
MjggSnVuZSAyMDE5IDE5OjAwDQo+ID4gPiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnOyBBbmRyZXcgQ29vcGVyIDwNCj4gPiA+IEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+DQo+
ID4gPiBDYzogQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29t
PjsNCj4gPiA+IHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20NCj4gPiA+IFN1YmplY3Q6IFtYZW4t
ZGV2ZWxdIHZmcmVlIGNyYXNoDQo+ID4gPg0KPiA+ID4gSGVsbG8sDQo+ID4gPg0KPiA+ID4gSSBu
ZWVkIHlvdXIgaGVscCB0byBwaW5wb2ludCB0aGUgcm9vdCBjYXVzZSBvZiBhIHByb2JsZW0uIFRv
IG15DQo+ID4gPiB1bmRlcnN0YW5kaW5nIHZmcmVlIHNob3VsZCBiZSB1c2VkIHdoZW4gYWxsb2Nh
dGluZyBtZW1vcnkgd2l0aA0KPiA+ID4gdm1hbGxvYy4NCj4gPiA+DQo+ID4gPiBCdXQsIEkgaGF2
ZSB0aGUgZm9sbG93aW5nIHNjZW5hcmlvIHdoaWNoIHJlc3VsdHMgaW4gYSBYRU4gY3Jhc2g6DQo+
ID4gPiAtIGFsbG9jYXRlIGEgbnVtYmVyIG9mIGZyYW1lcyB1c2luZyB2bWFsbG9jICh2emFsbG9j
KSAoZS5nLiB1c2luZyBhDQo+ID4gPiBkb21jdGwpIGFuZCBhc3NpZ24gdGhlbSB0byB0aGUgY2Fs
bGluZyBkb21haW4NCj4gPiA+IC0gbWFwIHRoZSBmcmFtZXMgdXNpbmcgeGVuZm9yZWlnbm1lbW9y
eV9tYXBfcmVzb3VyY2UNCj4gPg0KPiA+IERvIHlvdSByZWFsbHkgbWVhbiB4ZW5mb3JlaWdubWVt
b3J5X21hcF9yZXNvdXJjZSgpPyBJZiB0aGUgbWVtb3J5IGlzDQo+ID4gYXNzaWduZWQgdG8gdGhl
IGNhbGxpbmcgZG9tYWluIHRoZW4gdGhpcyBpcyBxdWl0ZSBsaWtlbHkgbm90IHRvIHdvcmsuDQo+
ID4gVGhlcmUgd2VyZSByZWZlcmVuY2UgY291bnRpbmcgcHJvYmxlbXMgd2l0aCB0aGF0IGNvZGUs
IHdoaWNoIGlzIHdoeQ0KPiA+IGNhbGxlciBhc3NpZ25lZCByZXNvdXJjZXMgd2VyZSBkcm9wcGVk
Lg0KPiA+DQo+ID4gICBQYXVsDQo+ID4NCj4gDQo+IFRoZSBwcm9ibGVtIGxpZXMgd2l0aCB2ZnJl
ZSBiZWNhdXNlIGl0IGNyZWF0ZXMgYSBuZXcgbGlzdCB3aXRoIHRoZQ0KPiBwYWdlcywgdW5tYXBz
IHRoZSB2YSBwb2ludGVyIGFuZCB0aGVuIGZyZWVzIHRoZSBwYWdlcy4gSWYgSSBkbyB0aGVzZQ0K
PiBzdGVwcyBtYW51YWxseSAod2l0aG91dCBhZGRpbmcgdGhlbSB0byBhIG5ldyBsaXN0KSBpdCB3
b3Jrcy4NCg0KU28sIGxvb2tpbmcgYXQgdGhlIGNvZGUsIEkgZG9uJ3QgdGhpbmsgaXQgaXMgaW50
ZW5kZWQgdGhhdCB2W218el1hbGxvY2VkIHBhZ2VzIGdldCBhc3NpZ25lZCB0byBhIGRvbWFpbi4g
Q291bGQgeW91IHBvaW50IGF0IHdoZXJlIHRoZSBhc3NpZ25tZW50IGlzIGhhcHBlbmluZz8NCg0K
ICBQYXVsDQoNCj4gDQo+IE1hbnkgdGhhbmtzLA0KPiBQZXRyZQ0KPiANCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

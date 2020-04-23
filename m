Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 939911B61ED
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 19:28:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRfdq-0006J8-Ce; Thu, 23 Apr 2020 17:28:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmme=6H=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jRfdo-0006J3-Gq
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 17:28:00 +0000
X-Inumbo-ID: c6bfebee-8587-11ea-9e09-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6bfebee-8587-11ea-9e09-bc764e2007e4;
 Thu, 23 Apr 2020 17:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587662880;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NixxDjzlzmTaPzVObK4CetDGsSL7Oud9FXalS93iAT4=;
 b=S4iMi0Ov5Z7WclKqPbB9yDFsuQqU6X1FAUEag+iu0kuzUX4gWgKxxDVI
 c2ynEsfaQWRCXly8G9PM55Xy+eZn1yiOdbgXW0NWzQdSXNbMbjsHrvE/V
 p8PBq3qth/ykcVevkQuPDb2ffRdFxd4NERbOUFNYgvSC9KI9SJ/nxg6dw s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rxEB/pU8dw4gPEGBsXUmcyjkWJkHZcezjs9DXmhqLsyhpVGmO9J4jE3Z7zlBAS8DaoEXyhB0cK
 LqhyPBvlhukpdRVcP2nHuRlQcRETIxxR3HVLng5ERKMrIb/kMlJHqdfzOTQ32ouAQlUxh7P9Yb
 xJwkV+5pY4PZivL20fvXawwdxB6ZFJezsJDQ8ToE7lXGQ37ibMNhBz0uJsYZB9l+18uURCdM8M
 5Jgiga2oCuD320L/IOMsUDeVh0cPUeJNV3coVIq/+cMKuFQIP1MNHhE+1/TRbI1VXbubXZ8Je2
 TGU=
X-SBRS: 2.7
X-MesageID: 16131808
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,307,1583211600"; d="scan'208";a="16131808"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH 1/2] tools: build golang tools if go compiler is present
Thread-Topic: [PATCH 1/2] tools: build golang tools if go compiler is present
Thread-Index: AQHWGXVVEMzovBzqEEyjZLPfGUwjnqiGvR+AgAAXe4A=
Date: Thu, 23 Apr 2020 17:27:55 +0000
Message-ID: <E0E74128-3E4E-44C7-976D-098CBADF4C5D@citrix.com>
References: <cover.1587599094.git.rosbrookn@ainfosec.com>
 <c2d966b43313c9df64551b0ce31462c176445b70.1587599095.git.rosbrookn@ainfosec.com>
 <CAFLBxZaKiuqpmVvP2ww9YbuTkCm9wdBKGdMJOrT=sTaJSaycqg@mail.gmail.com>
 <CAEBZRSfG053_DYA6BCZUjg6c4oa3AHDsK5Puc4ipy=py8C6Mgw@mail.gmail.com>
In-Reply-To: <CAEBZRSfG053_DYA6BCZUjg6c4oa3AHDsK5Puc4ipy=py8C6Mgw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <6638594D1C718142A09823A8F185AB7E@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 xen-devel <xen-devel@lists.xenproject.org>, George Dunlap <dunlapg@umich.edu>,
 Wei Liu <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXByIDIzLCAyMDIwLCBhdCA1OjAzIFBNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9v
a25AZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IE9uIFRodSwgQXByIDIzLCAyMDIwIGF0IDk6NDQg
QU0gR2VvcmdlIER1bmxhcCA8ZHVubGFwZ0B1bWljaC5lZHU+IHdyb3RlOg0KPj4gDQo+PiANCj4+
IA0KPj4gT24gVGh1LCBBcHIgMjMsIDIwMjAgYXQgMTo1MSBBTSBOaWNrIFJvc2Jyb29rIDxyb3Ni
cm9va25AZ21haWwuY29tPiB3cm90ZToNCj4+PiANCj4+PiBCeSBkZWZhdWx0LCBpZiB0aGUgZ28g
Y29tcGlsZXIgaXMgZm91bmQgYnkgdGhlIGNvbmZpZ3VyZSBzY3JpcHQsIGJ1aWxkDQo+Pj4gdGhl
IGdvbGFuZyB0b29scy4gSWYgdGhlIGNvbXBpbGVyIGlzIG5vdCBmb3VuZCwgYW5kDQo+Pj4gLS1l
bmFibGUtZ29sYW5nX3Rvb2xzIHdhcyBub3QgZXhwbGljaXRseSBzZXQsIGRvIG5vdCBidWlsZCB0
byB0aGUgZ29sYW5nDQo+Pj4gdG9vbHMuDQo+Pj4gDQo+Pj4gVGhlIG5ldyBjb3JyZXNwb25kaW5n
IG1ha2UgdmFyaWFibGUgaXMgQ09ORklHX0dPTEFOR19UT09MUy4gUmVtb3ZlDQo+Pj4gQ09ORklH
X0dPTEFORyBmcm9tIHRvb2xzL1J1bGVzLm1rIHNpbmNlIHRoZSBuZXcgdmFyaWFibGUgaXMgc2V0
IGJ5DQo+Pj4gY29uZmlndXJlLg0KPj4+IA0KPj4+IFNpZ25lZC1vZmYtYnk6IE5pY2sgUm9zYnJv
b2sgPHJvc2Jyb29rbkBhaW5mb3NlYy5jb20+DQo+Pj4gLS0tDQo+Pj4gY29uZmlnL1Rvb2xzLm1r
LmluIHwgICAxICsNCj4+PiBtNC9nb2xhbmcubTQgICAgICAgfCAgIDQgKysNCj4+PiB0b29scy9N
YWtlZmlsZSAgICAgfCAgIDIgKy0NCj4+PiB0b29scy9SdWxlcy5tayAgICAgfCAgIDIgLQ0KPj4+
IHRvb2xzL2NvbmZpZ3VyZSAgICB8IDEzOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4+PiB0b29scy9jb25maWd1cmUuYWMgfCAgMTIgKysrKw0KPj4+IDYg
ZmlsZXMgY2hhbmdlZCwgMTU2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pj4gY3Jl
YXRlIG1vZGUgMTAwNjQ0IG00L2dvbGFuZy5tNA0KPj4+IA0KPj4+IGRpZmYgLS1naXQgYS9jb25m
aWcvVG9vbHMubWsuaW4gYi9jb25maWcvVG9vbHMubWsuaW4NCj4+PiBpbmRleCAxODlmZGExNTk2
Li4yYzIxOWY1NDc3IDEwMDY0NA0KPj4+IC0tLSBhL2NvbmZpZy9Ub29scy5tay5pbg0KPj4+ICsr
KyBiL2NvbmZpZy9Ub29scy5tay5pbg0KPj4+IEBAIC01NSw2ICs1NSw3IEBAIENPTkZJR19RRU1V
X1RSQUQgICAgOj0gQHFlbXVfdHJhZGl0aW9uYWxADQo+Pj4gQ09ORklHX1FFTVVfWEVOICAgICA6
PSBAcWVtdV94ZW5ADQo+Pj4gQ09ORklHX1FFTVVVX0VYVFJBX0FSR1M6PSBARVhUUkFfUUVNVVVf
Q09ORklHVVJFX0FSR1NADQo+Pj4gQ09ORklHX0xJQk5MICAgICAgICA6PSBAbGlibmxADQo+Pj4g
K0NPTkZJR19HT0xBTkdfVE9PTFMgOj0gQGdvbGFuZ190b29sc0ANCj4+PiANCj4+PiBDT05GSUdf
U1lTVEVNRCAgICAgIDo9IEBzeXN0ZW1kQA0KPj4+IFNZU1RFTURfQ0ZMQUdTICAgICAgOj0gQFNZ
U1RFTURfQ0ZMQUdTQA0KPj4+IGRpZmYgLS1naXQgYS9tNC9nb2xhbmcubTQgYi9tNC9nb2xhbmcu
bTQNCj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4+IGluZGV4IDAwMDAwMDAwMDAuLjBiNGJk
NTRjZTANCj4+PiAtLS0gL2Rldi9udWxsDQo+Pj4gKysrIGIvbTQvZ29sYW5nLm00DQo+Pj4gQEAg
LTAsMCArMSw0IEBADQo+Pj4gK0FDX0RFRlVOKFtBQ19QUk9HX0dPXSwgWw0KPj4+ICsgICAgZG5s
IENoZWNrIGZvciB0aGUgZ28gY29tcGlsZXINCj4+PiArICAgIEFDX0NIRUNLX1RPT0woW0dPXSxb
Z29dLFtub10pDQo+Pj4gK10pDQo+PiANCj4+IA0KPj4gQUZBSUNUIHRoaXMgb25seSBjaGVja3Mg
Zm9yIHRoZSBleGlzdGVuY2Ugb2YgdGhlIGJpbmFyeS4gIFdpbGwgdGhlIGJpbmRpbmdzIGNvbXBp
bGUgd2l0aCBhbGwgdmVyc2lvbnMgb2YgZ28/ICBJZiBub3QsIHNob3VsZCB3ZSB0cnkgdG8gY2hl
Y2sgdGhlIHZlcnNpb24gaGVyZT8NCj4gDQo+IFRoZXJlIGFyZSBubyBvYnZpb3VzIHBpZWNlcyB0
byBtZSB0aGF0IHdvbid0IGNvbXBpbGUgb24gZmFpcmx5IHJlY2VudA0KPiAoaS5lLiA+PSAxLjkp
IHZlcnNpb25zIG9mIGdvLCBidXQgeWVzIGl0IHdvdWxkIHByb2JhYmx5IGJlIGJlc3QgdG8NCj4g
Y2hlY2sgZm9yIGEgbWluaW11bSB2ZXJzaW9uLiBJIHdpbGwgZG8gc29tZSBtb3JlIHdvcmsgdG8g
ZmlndXJlIG91dCBhbg0KPiBhcHByb3ByaWF0ZSBtaW5pbXVtIHZlcnNpb24sIGJ1dCBJIHRoaW5r
IGdvIDEuMTAgbWlnaHQgYmUgYSByZWFzb25hYmxlDQo+IHN0YXJ0Lg0KDQpPSyDigJQgSSBkaWRu
4oCZdCBtZWFuIHlvdSBoYWQgdG87IEkganVzdCB0aG91Z2h0IGl0IHdhcyB3b3J0aCBicmluZ2lu
ZyB1cC4NCg0KVGhlIHVuZGVyc2NvcmUgdGhpbmcgdGhvdWdoIOKAlCBJIHRoaW5rIGl04oCZcyBh
IGJhZCBpZGVhIHRvIG1peCBgLWAgYW5kIGBfYDsg4oCUZW5hYmxlLWdvbGFuZ190b29scyBqdXN0
IGlzbuKAmXQgYSBnb29kIGlkZWEgSU1ITy4gOi0pDQoNCkRvIHlvdSBuZWVkIF90b29scz8gIENv
dWxkIGl0IGp1c3QgYmUg4oCUZW5hYmxlLWdvbGFuZz8NCg0KIC1HZW9yZ2U=


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F441B4C81
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 20:09:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRJmu-0006Hl-7J; Wed, 22 Apr 2020 18:07:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nI87=6G=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jRJms-0006Hg-7R
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 18:07:54 +0000
X-Inumbo-ID: 2f08dedc-84c4-11ea-b58d-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f08dedc-84c4-11ea-b58d-bc764e2007e4;
 Wed, 22 Apr 2020 18:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587578873;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=hyo69tV4hYTkA6dzha8AK6bfIxwqnG4eZA8WfglpDqU=;
 b=Je/5zi7PpHExe++tY0MdSbMIcuewKofaCTfFhumSIx34YrHNOWLy3JP2
 wt9NAKtl92Oez13V4YyQ4awyzqfFZUa2CG3PK27PrSM8AHMzCekHTBnki
 6oWHIcxDS5dG5c2M7WM8DyG5GzTr7Wxi8zyAdyX90YvM1EUXrAU7QIQUy U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dO+AnPLyPDt/m73wRthnYAm16wShCidU4VC56Zua1cub1PHccwiEFdSeqNFUatDDXX33NyURZ4
 dz7YWFvv3t6jQcKowk4huhG7J1lTGpMGOyisYTwqz0aPNo1ZMQDeQs6JGKJVYYRykstAgEgDN3
 Z49IZ018xraXC2vD9JBpOcJtp7GIs5Od3kQVZ+sNdYMQLeSg86NdkY6ejulSpSR0bjNJCx5tPN
 Y9pafKiXc2jwYBiQ2WudrAbb36jGmpbYkuHr4DKpgAsPl90O2PgC29/1yICtUW485hcGpHT0uC
 47E=
X-SBRS: 2.7
X-MesageID: 16487488
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,304,1583211600"; d="scan'208";a="16487488"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH 1/4] golang/xenlight: add NameToDomid and DomidToName util
 functions
Thread-Topic: [PATCH 1/4] golang/xenlight: add NameToDomid and DomidToName
 util functions
Thread-Index: AQHWERYbx3dgi/1zV0KyTdtBFGxU1KiFXiqA
Date: Wed, 22 Apr 2020 18:07:49 +0000
Message-ID: <65721F76-319A-47E4-8184-116F02B2BCE3@citrix.com>
References: <cover.1586727061.git.rosbrookn@ainfosec.com>
 <e2d8d6c1293c8251be881cd471265aa8188ae2ae.1586727061.git.rosbrookn@ainfosec.com>
In-Reply-To: <e2d8d6c1293c8251be881cd471265aa8188ae2ae.1586727061.git.rosbrookn@ainfosec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <12FB20DF6C3CFD46AD2270A747BF8236@citrix.com>
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
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXByIDEyLCAyMDIwLCBhdCAxMTowMiBQTSwgTmljayBSb3Nicm9vayA8cm9zYnJv
b2tuQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBNYW55IGV4cG9ydGVkIGZ1bmN0aW9ucyBpbiB4
ZW5saWdodCByZXF1aXJlIGEgZG9taWQgYXMgYW4gYXJndW1lbnQuIE1ha2UNCj4gaXQgZWFzaWVy
IGZvciBwYWNrYWdlIHVzZXJzIHRvIHVzZSB0aGVzZSBmdW5jdGlvbnMgYnkgYWRkaW5nIHdyYXBw
ZXJzDQo+IGZvciB0aGUgbGlieGwgdXRpbGl0eSBmdW5jdGlvbnMgbGlieGxfbmFtZV90b19kb21p
ZCBhbmQNCj4gbGlieGxfZG9taWRfdG9fbmFtZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pY2sg
Um9zYnJvb2sgPHJvc2Jyb29rbkBhaW5mb3NlYy5jb20+DQo+IC0tLQ0KPiB0b29scy9nb2xhbmcv
eGVubGlnaHQveGVubGlnaHQuZ28gfCAyMyArKysrKysrKysrKysrKysrKysrKysrKw0KPiAxIGZp
bGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2dv
bGFuZy94ZW5saWdodC94ZW5saWdodC5nbyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdo
dC5nbw0KPiBpbmRleCAzZjFiMGJhYTBjLi44NDkyYmNlYzRlIDEwMDY0NA0KPiAtLS0gYS90b29s
cy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28NCj4gKysrIGIvdG9vbHMvZ29sYW5nL3hlbmxp
Z2h0L3hlbmxpZ2h0LmdvDQo+IEBAIC0yMCw2ICsyMCw3IEBAIHBhY2thZ2UgeGVubGlnaHQNCj4g
I2NnbyBMREZMQUdTOiAtbHhlbmxpZ2h0IC1seWFqbCAtbHhlbnRvb2xsb2cNCj4gI2luY2x1ZGUg
PHN0ZGxpYi5oPg0KPiAjaW5jbHVkZSA8bGlieGwuaD4NCj4gKyNpbmNsdWRlIDxsaWJ4bF91dGls
cy5oPg0KPiAqLw0KPiBpbXBvcnQgIkMiDQo+IA0KPiBAQCAtMTI0LDYgKzEyNSwyOCBAQCBmdW5j
IChjdHggKkNvbnRleHQpIENsb3NlKCkgZXJyb3Igew0KPiANCj4gdHlwZSBEb21pZCB1aW50MzIN
Cj4gDQo+ICsvLyBOYW1lVG9Eb21pZCByZXR1cm5zIHRoZSBEb21pZCBmb3IgYSBkb21haW4sIGdp
dmVuIGl0cyBuYW1lLCBpZiBpdCBleGlzdHMuDQo+ICtmdW5jIChDdHggKkNvbnRleHQpIE5hbWVU
b0RvbWlkKG5hbWUgc3RyaW5nKSAoRG9taWQsIGVycm9yKSB7DQo+ICsJdmFyIGRvbWlkIEMudWlu
dDMyX3QNCj4gKw0KPiArCWNuYW1lIDo9IEMuQ1N0cmluZyhuYW1lKQ0KPiArCWRlZmVyIEMuZnJl
ZSh1bnNhZmUuUG9pbnRlcihjbmFtZSkpDQo+ICsNCj4gKwlpZiByZXQgOj0gQy5saWJ4bF9uYW1l
X3RvX2RvbWlkKEN0eC5jdHgsIGNuYW1lLCAmZG9taWQpOyByZXQgIT0gMCB7DQo+ICsJCXJldHVy
biBeRG9taWQoMCksIEVycm9yKHJldCkNCg0KbGlieGwuaCBkZWZpbmVzIElOVkFMSURfRE9NSUQg
4oCUIGRvIHdlIHdhbnQgdG8gZGVmaW5lIGFuIGV4cG9ydGVkIGNvbnN0YW50IHdpdGggdGhlIHNh
bWUgbmFtZSBhbmQgdXNlIHRoYXQgaGVyZT8gIChBbHRob3VnaCBwYXJ0IG9mIG1lIHdvbmRlcnMg
aWYgRE9NSURfSU5WQUxJRCB3b3VsZCBiZSBhIGJldHRlciBvcHRpb24uKQ0KDQo+ICsJfQ0KPiAr
DQo+ICsJcmV0dXJuIERvbWlkKGRvbWlkKSwgbmlsDQo+ICt9DQo+ICsNCj4gKy8vIERvbWlkVG9O
YW1lIHJldHVybnMgdGhlIG5hbWUgZm9yIGEgZG9tYWluLCBnaXZlbiBpdHMgZG9taWQuDQo+ICtm
dW5jIChDdHggKkNvbnRleHQpIERvbWlkVG9OYW1lKGRvbWlkIERvbWlkKSBzdHJpbmcgew0KPiAr
CWNuYW1lIDo9IEMubGlieGxfZG9taWRfdG9fbmFtZShDdHguY3R4LCBDLnVpbnQzMl90KGRvbWlk
KSkNCj4gKwlkZWZlciBDLmZyZWUodW5zYWZlLlBvaW50ZXIoY25hbWUpKQ0KPiArDQo+ICsJcmV0
dXJuIEMuR29TdHJpbmcoY25hbWUpDQo+ICt9DQoNCkl0IGxvb2tzIHRvIG1lIGxpa2UgaWYgdGhl
IGRvbWlkIGRvZXNu4oCZdCBleGlzdCwgbGlieGxfZG9taWRfdG9fbmFtZSgpIHdpbGwgcmV0dXJu
IE5VTEw7IGFuZCB0aGVuIERvbWlkVG9OYW1lIHdpbGwgcmV0dXJuIOKAnOKAnS4gIElzIHRoYXQg
d2hhdCB3ZSB3YW50Pw0KDQpJZiBzbywgaXQgc2hvdWxkIHByb2JhYmx5IGJlIGRvY3VtZW50ZWQu
DQoNCk9uZSB0aGluZyB0aGF0IG1pZ2h0IGJlIHdvcnRoIHBvaW50aW5nIG91dCBpcyB0aGF0IGJv
dGggb2YgdGhlc2UgZnVuY3Rpb25zIGFyZSBhY3R1YWxseSByYWN5OiBUaGVyZeKAmXMgbm8gZ3Vh
cmFudGVlIHRoYXQgYnkgdGhlIHRpbWUgbGlieGxfZG9taWRfdG9fbmFtZSgpIHJldHVybnMgdGhh
dCB0aGUgZG9tYWluIHdpdGggdGhhdCBuYW1lIGhhcyBkaWVkLCBhbmQgYW5vdGhlciBkb21haW4g
d2l0aCBhIGRpZmZlcmVudCBuYW1lIGhhcyByZS11c2VkIHRoZSBzYW1lIGRvbWlkLiAgVGhhdOKA
mXMgcGFydGx5IHdoeSBYZW4gaGFzIHRoZSB3aG9sZSDigJxkb21haW4gcmVhcGVy4oCdIHN5c3Rl
bSwgbGlrZSBmb3IgVW5peCBwcm9jZXNzZXMgKHdoaWNoIHNvIGZhciBpc27igJl0IGltcGxlbWVu
dGFibGUgeWV0IHdpdGggdGhlIGdvbGFuZyB3cmFwcGVycykuICBJIHRoaW5rIHdoZW4gd2UgbWFr
ZSBvdXIg4oCcdm3igJ0gbGlicmFyeSwgd2XigJlyZSBnb2luZyB0byB3YW50IHRvIHRyeSB0byBj
b21lIHVwIHdpdGggc29tZXRoaW5nIGxpa2UgYW4gb2JqZWN0IHRoYXQgbWFrZXMgaXQgZWFzeSB0
byBhdm9pZCB0aGlzIHNvcnQgb2YgcmFjZS4NCg0KQnV0IHRoYXTigJlzIGEgZGlzY3Vzc2lvbiBm
b3IgYW5vdGhlciBkYXkuIDotKSAgRXZlcnl0aGluZyBlbHNlIGxvb2tzIGdvb2QsIHRoYW5rcy4N
Cg0KIC1HZW9yZ2U=


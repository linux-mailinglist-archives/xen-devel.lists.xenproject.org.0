Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 205366D6B2
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 23:58:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoEMe-0008Lw-MH; Thu, 18 Jul 2019 21:55:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y+p/=VP=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hoEMd-0008Lh-5m
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 21:54:59 +0000
X-Inumbo-ID: adafda78-a9a6-11e9-a2d9-0722d88593fd
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id adafda78-a9a6-11e9-a2d9-0722d88593fd;
 Thu, 18 Jul 2019 21:54:56 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: k/OBWeibHCVeuS4VwCvQDXBkpc5U/nlGtZAm+SPdQau0RAjqEYJ6zsQepA3hYvqp24gj0GvXKx
 ks8o9YK02AcRHM+WPdfkLqFIbvhyTv3U5NT8bZHpjYzVlWQqso6c0jjiDIZCsBsyBiQrweGe/n
 15WFbWSlzteKLXWU64ZiRjLlYl1oPy9RmRhgmgDGM2ytwLm6a/nmgwW8qzFOqgpzBq+Jh4/RLo
 xqpVUvbnBhDPgrB3OGzuCjNm0TD/i/ZHfDCKV8efpC1x/12Uw5A2K8L1dCcH8fS6u9l0J6KMNH
 qhY=
X-SBRS: 2.7
X-MesageID: 3170111
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,279,1559534400"; 
   d="scan'208";a="3170111"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nicolas Belouin <nicolas.belouin@gandi.net>, xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] golang/xenlight: Add libxl_utils support
Thread-Index: AQHVLYvHEU6KjG4cT0aCzUsgCJvyEKaxMkeAgAApqYCAH45KgA==
Date: Thu, 18 Jul 2019 21:54:52 +0000
Message-ID: <1DBE9962-9DF8-46EA-9AD5-5527BF2B1DA5@citrix.com>
References: <20190628082508.32509-1-nicolas.belouin@gandi.net>
 <810e4e95-a22a-217b-9c8f-03475b40da0f@citrix.com>
 <F808B1B6-DEC4-4687-BE45-7B20360603DB@citrix.com>
In-Reply-To: <F808B1B6-DEC4-4687-BE45-7B20360603DB@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <20D300D6C745F642A84B357CB6B868E9@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] golang/xenlight: Add libxl_utils support
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVuIDI4LCAyMDE5LCBhdCA5OjAxIFBNLCBHZW9yZ2UgRHVubGFwIDxnZW9yZ2Uu
ZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gSnVuIDI4LCAyMDE5
LCBhdCA1OjMyIFBNLCBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdy
b3RlOg0KPj4gDQo+PiBPbiA2LzI4LzE5IDk6MjUgQU0sIE5pY29sYXMgQmVsb3VpbiB3cm90ZToN
Cj4+PiBUaGUgR28gYmluZGluZ3MgZm9yIGxpYnhsIG1pc3MgZnVuY3Rpb25zIGZyb20gbGlieGxf
dXRpbHMsIGxldCdzIHN0YXJ0DQo+Pj4gd2l0aCB0aGUgc2ltcGxlIGxpYnhsX2RvbWlkX3RvX25h
bWUgYW5kIGl0cyBjb3VudGVycGFydA0KPj4+IGxpYnhsX25hbWVfdG9fZG9taWQuDQo+Pj4gDQo+
Pj4gU2lnbmVkLW9mZi1ieTogTmljb2xhcyBCZWxvdWluIDxuaWNvbGFzLmJlbG91aW5AZ2FuZGku
bmV0Pg0KPj4gDQo+PiBKdXN0IGZvciBmdXR1cmUgcmVmZXJlbmNlLCBiZWxvdyB5b3VyIFNvQiwg
aXQncyBnb29kIHByYWN0aWNlIHRvIHB1dCBhDQo+PiBgLS0tYCBsaW5lIChiZWxvdyB3aGljaCBl
dmVyeXRoaW5nIHdpbGwgYmUgaWdub3JlZCksIGFuZCBhIGxpc3Qgb2YgdGhlDQo+PiBjaGFuZ2Vz
IHlvdSBtYWRlLiAgRS5nLDoNCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogTmljb2xhcyBCZWxvdWlu
IDxuaWNvbGFzLmJlbG91aW5AZ2FuZGkubmV0Pg0KPj4gLS0tDQo+PiB2MjoNCj4+IC0gRG9uJ3Qg
bGVhayBDIHN0cmluZyByZXR1cm5lZCBieSBsaWJ4bF9kb21pZF90b19uYW1lDQo+PiANCj4+IE9u
ZSBtb3JlIHRoaW5nLi4uDQo+PiANCj4+PiArLy9jaGFyKiBsaWJ4bF9kb21pZF90b19uYW1lKGxp
YnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21pZCk7DQo+Pj4gK2Z1bmMgKEN0eCAqQ29udGV4dCkg
RG9taWRUb05hbWUoaWQgRG9taWQpIChuYW1lIHN0cmluZykgew0KPj4+ICsJY0RvbU5hbWUgOj0g
Qy5saWJ4bF9kb21pZF90b19uYW1lKEN0eC5jdHgsIEMudWludDMyX3QoaWQpKQ0KPj4+ICsJZGVm
ZXIgQy5mcmVlKHVuc2FmZS5Qb2ludGVyKGNEb21OYW1lKSkNCj4+PiArDQo+Pj4gKwluYW1lID0g
Qy5Hb1N0cmluZyhjRG9tTmFtZSkNCj4+IA0KPj4gbGlieGxfZG9taWRfdG9fbmFtZSgpIHJldHVy
bnMgTlVMTCBpZiBkb21pZCBkb2Vzbid0IGV4aXN0LiAgV2lsbCB0aGlzDQo+PiBjb2RlIERUUlQg
KHJldHVybmluZyAnbmlsJyBpbiB0aGF0IGNhc2UpPyAgT3Igd2lsbCBpdCBjcmFzaCAvIGRvDQo+
PiBzb21ldGhpbmcgZWxzZT8NCj4+IA0KPj4gSSBjb3VsZG4ndCBhY3R1YWxseSBmaW5kIHRoZSBh
bnN3ZXIgaW4gYSBxdWljayBzZWFyY2ggZm9yIHRoZQ0KPj4gZG9jdW1lbnRhdGlvbi4gIEFueSBj
aGFuY2UgeW91IGNvdWxkIGJ1aWxkIGEgdGVzdCBwcm9ncmFtIHRvIHNlZSB3aGF0DQo+PiBoYXBw
ZW5zPw0KPj4gDQo+PiBBbHRlcm5hdGVseSwgd2UgY291bGQgcGxheSBpdCBzYWZlIGFuZCBhbHdh
eXMgY2hlY2sgY0RvbU5hbWUgZm9yIGBuaWxgDQo+PiBiZWZvcmUgcGFzc2luZyBpdCB0byBDLkdv
U3RyaW5nKCkuDQo+IA0KPiBJIGp1c3QgYXNrZWQsIGFuZCBpdCB0dXJucyBvdXQgaWYgQy5Hb1N0
cmluZygpIGlzIHBhc3NlZCBhIG5pbCBwb2ludGVyLCBpdCByZXR1cm5zIHRoZSBlbXB0eSBzdHJp
bmcgKOKAnOKAnSksIHdoaWNoIGlzIHdoYXQgd2Ugd2FudC4gIEl04oCZcyBub3QgZG9jdW1lbnRl
ZCB5ZXQsIGJ1dCB0aGVyZeKAmXMgYSB0aWNrZXQgdG8gZG9jdW1lbnQgaXQgc29vbi4NCj4gDQo+
IGh0dHBzOi8vZ2l0aHViLmNvbS9nb2xhbmcvZ28vaXNzdWVzLzMyNzM0DQo+IA0KPiBTbyB0aGlz
IGlzIHJlYWR5IHRvIGdvIGluOg0KDQpBY3R1YWxseSwgdHVybnMgb3V0IGl04oCZcyBub3Q6ICBZ
b3UgYWRkZWQgYSBmaWxlLCBidXQgaXTigJlzIG5vdCB3aXJlZCBpbnRvIHRoZSBidWlsZCBzeXN0
ZW0uICBZb3UgbmVlZCB0byBhZGQgeGVubGlnaHRfdXRpbHMuZ28gdG8gUEtHU09VUkNFUyBpbiB0
aGUgTWFrZWZpbGUuICBJ4oCZdmUganVzdCBzZW50IGFuIHVwZGF0ZWQgcGF0Y2guDQoNCiAtR2Vv
cmdlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

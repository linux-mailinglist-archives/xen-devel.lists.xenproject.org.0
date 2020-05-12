Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7E61CFC58
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 19:38:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYYqo-0002Ay-F3; Tue, 12 May 2020 17:37:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XDyx=62=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jYYqm-0002At-8N
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 17:37:52 +0000
X-Inumbo-ID: 4d346152-9477-11ea-b07b-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d346152-9477-11ea-b07b-bc764e2007e4;
 Tue, 12 May 2020 17:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589305071;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2T3V+rV8+2TUN3SI5RXR5n8osG3EUMONUkvXvpWY8m4=;
 b=DRqoYVeACQHyzRj7mB9P+w6Q1Mb92OFAaY6R/ChY/8nAJat/Rp6OCHqF
 /DejvnFhHVqIusZhhVn2DMb98O2YkCfSwY/adRFXSYadblzcDsLqAAL+/
 rBJU/UZUI6Yh/fqeyw0b1OYGQNUmn+x9u/hDD1lgeBBgcYx0CBUs0dus/ M=;
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: JpvFQzTKMZm6U24rXJNmWKQoSKl6Won99KvBdwpcbfIPeuCB/HiVPB2K/O91dVuCKnWv3lpLdk
 CweSbrWgCyc3L/VV+OatnQ361oPzp14q3tlbiD2EenX712PcMySYE/FR6LUv2KaTIX3zf0tTcB
 Ic1GH2JtO8dqNiHXgzReN+4LQtllny0sdavce8iW7iGw50tCSRl9ym8QmhycJjxTLiVs4SX51U
 69IMqSwaG73l91fTzxGEZpTV6WPnd3tKMhbOazIqBFBgBbRGOUwV99tvVOmPgv9dJq6smqW58F
 2uA=
X-SBRS: 2.7
X-MesageID: 17367309
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,384,1583211600"; d="scan'208";a="17367309"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH 2/3] golang/xenlight: init xenlight go module
Thread-Topic: [PATCH 2/3] golang/xenlight: init xenlight go module
Thread-Index: AQHWHzfMuMNvM1D6EUuQ5HJvPIpidKikdZCAgAAILACAAChygIAAAfSA
Date: Tue, 12 May 2020 17:37:47 +0000
Message-ID: <0B2B28B0-C857-443B-B73A-6A5A31039889@citrix.com>
References: <cover.1588282027.git.rosbrookn@ainfosec.com>
 <c38afab85d9fc005edade229896008a4ad5a1929.1588282027.git.rosbrookn@ainfosec.com>
 <3ED0B49D-123C-4925-B3A0-4FA0B44DF9F0@citrix.com>
 <CAEBZRSdWCJo9kBnNv6Jqt76E3fb8DDX6C4zndMtvrhngEzGHxg@mail.gmail.com>
 <294923FB-07D4-4CEB-9B29-3450DB454000@citrix.com>
In-Reply-To: <294923FB-07D4-4CEB-9B29-3450DB454000@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <1AD7FAC507A6F441837E5DEE461EA4AB@citrix.com>
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWF5IDEyLCAyMDIwLCBhdCA2OjMwIFBNLCBHZW9yZ2UgRHVubGFwIDxnZW9yZ2Uu
ZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4+IA0KPj4gT24gTWF5IDEyLCAyMDIwLCBh
dCA0OjA2IFBNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AZ21haWwuY29tPiB3cm90ZToNCj4+
IA0KPj4gW0NBVVRJT04gLSBFWFRFUk5BTCBFTUFJTF0gRE8gTk9UIHJlcGx5LCBjbGljayBsaW5r
cywgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPj4gDQo+PiBPbiBUdWUsIE1heSAxMiwg
MjAyMCBhdCAxMDozNiBBTSBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+
IHdyb3RlOg0KPj4+IA0KPj4+IA0KPj4+IA0KPj4+PiBPbiBBcHIgMzAsIDIwMjAsIGF0IDEwOjM5
IFBNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AZ21haWwuY29tPiB3cm90ZToNCj4+Pj4gDQo+
Pj4+IEluaXRpYWxpemUgdGhlIHhlbmxpZ2h0IEdvIG1vZHVsZSB1c2luZyB0aGUgeGVuYml0cyBn
aXQtaHR0cCBVUkwsDQo+Pj4+IHhlbmJpdHMueGVuLm9yZy9naXQtaHR0cC94ZW4uZ2l0L3Rvb2xz
L2dvbGFuZy94ZW5saWdodCwgYW5kIHVwZGF0ZSB0aGUNCj4+Pj4gWEVOX0dPQ09ERV9VUkwgdmFy
aWFibGUgaW4gdG9vbHMvUnVsZXMubWsgYWNjb3JkaW5nbHkuDQo+Pj4+IA0KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AYWluZm9zZWMuY29tPg0KPj4+PiAtLS0N
Cj4+Pj4gdG9vbHMvUnVsZXMubWsgICAgICAgICAgICAgICB8IDIgKy0NCj4+Pj4gdG9vbHMvZ29s
YW5nL3hlbmxpZ2h0L2dvLm1vZCB8IDEgKw0KPj4+PiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvZ29s
YW5nL3hlbmxpZ2h0L2dvLm1vZA0KPj4+PiANCj4+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL1J1bGVz
Lm1rIGIvdG9vbHMvUnVsZXMubWsNCj4+Pj4gaW5kZXggNWI4Y2Y3NDhhZC4uY2EzM2NjN2IzMSAx
MDA2NDQNCj4+Pj4gLS0tIGEvdG9vbHMvUnVsZXMubWsNCj4+Pj4gKysrIGIvdG9vbHMvUnVsZXMu
bWsNCj4+Pj4gQEAgLTM2LDcgKzM2LDcgQEAgZGVidWcgPz0geQ0KPj4+PiBkZWJ1Z19zeW1ib2xz
ID89ICQoZGVidWcpDQo+Pj4+IA0KPj4+PiBYRU5fR09QQVRIICAgICAgICA9ICQoWEVOX1JPT1Qp
L3Rvb2xzL2dvbGFuZw0KPj4+PiAtWEVOX0dPQ09ERV9VUkwgICAgPSBnb2xhbmcueGVucHJvamVj
dC5vcmcNCj4+Pj4gK1hFTl9HT0NPREVfVVJMICAgID0geGVuYml0cy54ZW4ub3JnL2dpdC1odHRw
L3hlbi5naXQvdG9vbHMvZ29sYW5nDQo+Pj4gDQo+Pj4gVGhlIHByaW1hcnkgZWZmZWN0IG9mIHRo
aXMgd2lsbCBiZSB0byBpbnN0YWxsIHRoZSBjb2RlIGluICRQUkVGSVgvc2hhcmUvZ29jb2RlL3hl
bmJpdHMueGVuLm9yZy9naXQtaHR0cC94ZW4uZ2l0L3Rvb2xzL2dvbGFuZy94ZW5saWdodCB3aGVu
IG1ha2luZyBkZWJiYWxscyBvciBkb2luZyBgbWFrZSBpbnN0YWxsYC4NCj4+PiANCj4+PiBJIGRv
buKAmXQgaW1tZWRpYXRlbHkgc2VlIHRoZSBhZHZhbnRhZ2Ugb2YgdGhhdCwgcGFydGljdWxhcmx5
IGlmIHdl4oCZcmUgc3RpbGwgdGhpbmtpbmcgYWJvdXQgaGF2aW5nIGEg4oCccHJldHRpZXLigJ0g
cGF0aCBhdCBzb21lIHBvaW50IGluIHRoZSBmdXR1cmUuICBXaGF0IHdhcyB5b3VyIHRoaW5raW5n
IGhlcmU/DQo+PiANCj4+IFdpdGggdGhlIG1vZHVsZSBiZWluZyBkZWZpbmVkIGFzIGB4ZW5iaXRz
Lnhlbi5vcmcvLi4uYCwgdGhlIGBidWlsZGANCj4+IE1ha2UgdGFyZ2V0IHdpbGwgZmFpbCBhcy1p
cyBmb3IgYSBtb2R1bGUtYXdhcmUgdmVyc2lvbiBvZiBnbyAoYmVjYXVzZQ0KPj4gaXQgY2Fubm90
IGZpbmQgYSBtb2R1bGUgbmFtZWQgYGdvbGFuZy54ZW5wcm9qZWN0Lm9yZy94ZW5saWdodGApLiBT
bywNCj4+IHRoZSByZWFzb24gZm9yIHRoaXMgY2hhbmdlIGlzIHRvIHByZXNlcnZlIHRoZSBleGlz
dGluZyBmdW5jdGlvbmFsaXR5DQo+PiBvZiB0aGF0IE1ha2UgdGFyZ2V0LiBDaGFuZ2luZyBYRU5f
R09DT0RFX1VSTCBzZWVtZWQgbGlrZSB0aGUgY29ycmVjdA0KPj4gY2hhbmdlLCBidXQgSSdtIG9w
ZW4gdG8gc3VnZ2VzdGlvbnMuDQo+IA0KPiBPaC4gIEJ1dCBubywgdGhhdOKAmXMgbm90IGF0IGFs
bCB3aGF0IHdlIHdhbnQuDQo+IA0KPiBUaGUgd2hvbGUgcG9pbnQgb2YgcnVubmluZyDigJhnbyBi
dWlsZOKAmSBpcyB0byBtYWtlIHN1cmUgdGhhdCAqdGhlIGNvZGUgd2UganVzdCBjb3BpZWQqIOKA
lCB0aGUgY29kZSByaWdodCBub3cgaW4gb3VyIG93biBsb2NhbCB0cmVlLCBwZXJoYXBzIHdoaWNo
IHdhcyBqdXN0IGdlbmVyYXRlZCDigJQgYWN0dWFsbHkgY29tcGlsZXMuDQo+IA0KPiBJdCBsb29r
cyBsaWtlIHdoZW4gd2UgYWRkIHRoZSBgZ28ubW9kYCBmdXJ0aGVyIHVwIHRoZSB0cmVlLCBpdCBt
YWtlcyBgZ28gYnVpbGRgIGlnbm9yZSB0aGUgR09QQVRIIGVudmlyb25tZW50IHZhcmlhYmxlIHdl
4oCZcmUgZ2l2aW5nIGl0LCB3aGljaCBjYXVzZXMgdGhlIGJ1aWxkIGZhaWx1cmUuICBCdXQgeW91
ciDigJxmaXjigJ0gZG9lc27igJl0IG1ha2UgaXQgdXNlIHRoZSBpbi10cmVlIGdvIGNvZGUgYWdh
aW47IGluc3RlYWQgaXQgbG9va3MgbGlrZSBpdCBjYXVzZXMgYGdvIGJ1aWxkYCBjb21tYW5kIHRv
IGdvIGFuZCBmZXRjaCB0aGUgbW9zdCByZWNlbnQgYG1hc3RlcmAgdmVyc2lvbiBmcm9tIHhlbmJp
dHMsIGlnbm9yaW5nIHRoZSBnbyBjb2RlIGluIHRoZSB0cmVlIGNvbXBsZXRlbHkuIDotKQ0KDQpP
Sywgc28gYWN0dWFsbHkgd2hhdCB5b3Ugd2FudCB0byBkbyBpcyByZXBsYWNlIHRoZSBgZ28gaW5z
dGFsbCAteCAkT1RIRVJfUExBQ0VfV0VfSlVTVF9DT1BJRURfVEhFX0ZJTEVTYCB3aXRoIGBnbyBi
dWlsZCAteGAgaW4gdGhlIE1ha2VmaWxlLg0KDQogLUdlb3JnZQ==


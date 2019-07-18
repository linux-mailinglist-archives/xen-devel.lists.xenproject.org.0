Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 704C36D612
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 22:54:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoDN7-0003ow-KM; Thu, 18 Jul 2019 20:51:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y+p/=VP=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hoDN6-0003or-KY
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 20:51:24 +0000
X-Inumbo-ID: cc73e83a-a99d-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cc73e83a-a99d-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 20:51:22 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pvPrJ7H912jFGr5Rezl/1PuDmpvTrJLZj6ai6RcwQCDzLfTCzivBZORWa3HwOUqOR4MEJrM/f1
 x1Jv1DMGNoL9y1nIOtbfru0WTkwsWIVxwQAMFDL+Eo/wmThw92LGuk3NIB9+dH9vaQcKX+BhRr
 utmTiiGyPPe5H3YHgfTray4G+8YtlCIM1tHY5hGjKq42p5KujzxYS7Kp0zpOvw2TP61dWeJ79s
 bWax1YREOstPAamcjRXC5z0II7JV/3KywsIwZC2aP9l/IhgdL+c0wJ5exkFn97wJ69w76VlLmw
 XvI=
X-SBRS: 2.7
X-MesageID: 3186190
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,279,1559534400"; 
   d="scan'208";a="3186190"
From: George Dunlap <George.Dunlap@citrix.com>
To: Rich Persaud <persaur@gmail.com>
Thread-Topic: [Xen-devel] [PATCH] golang/xenlight: Fixing compilation for go
 1.11
Thread-Index: AQHU9YlYaQHRy7JwqkeZC0HzYwfyb6ZBw++AgArm0wCAABEZAICEZEKAgAAoYIA=
Date: Thu, 18 Jul 2019 20:51:18 +0000
Message-ID: <1FBA5690-D488-4D2E-9AC2-0A9BE89390A2@citrix.com>
References: <20190418015203.1636-1-dpsmith@apertussolutions.com>
 <1cf0e5e9-2109-9517-49d9-88c5251cf156@citrix.com>
 <5CC19CAC0200007800229037@prv1-mh.provo.novell.com>
 <b6599113-99ec-8c92-5316-09c0992ab122@citrix.com>
 <29A6C124-6EF4-45C2-860E-D34A9B6D2087@gmail.com>
In-Reply-To: <29A6C124-6EF4-45C2-860E-D34A9B6D2087@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <3E3B127AE6A84640BE515957743B3B4B@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] golang/xenlight: Fixing compilation for go
 1.11
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
Cc: "nicolas.belouin@gandi.net" <nicolas.belouin@gandi.net>,
 George Dunlap <George.Dunlap@citrix.com>,
 "Daniel P.Smith" <dpsmith.dev@gmail.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVsIDE4LCAyMDE5LCBhdCA3OjI2IFBNLCBSaWNoIFBlcnNhdWQgPHBlcnNhdXJA
Z21haWwuY29tPiB3cm90ZToNCj4gDQo+PiBPbiBBcHIgMjUsIDIwMTksIGF0IDA3OjQxLCBHZW9y
Z2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KPj4gDQo+PiBPbiA0
LzI1LzE5IDEyOjQwIFBNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+PiBPbiAxOC4wNC4xOSBh
dCAxNToxMSwgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4+PiBPbiA0LzE4
LzE5IDI6NTIgQU0sIERhbmllbCBQLiBTbWl0aCB3cm90ZToNCj4+Pj4+IFRoaXMgZGVhbHMgd2l0
aCB0d28gY2FzdGluZyBpc3N1ZXMgZm9yIGNvbXBpbGluZyB1bmRlciBnbyAxLjExOg0KPj4+Pj4g
LSBleHBsaWNpdGx5IGNhc3QgdG8gKkMueGVudG9vbGxvZ19sb2dnZXIgZm9yIEN0eC5sb2dnZXIg
cG9pbnRlcg0KPj4+Pj4gLSBhZGQgY2FzdCB0byB1bnNhZmUuUG9pbnRlciBmb3IgdGhlIEMgc3Ry
aW5nIGNwYXRoDQo+Pj4+PiANCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBQLiBTbWl0aCA8
ZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbT4NCj4+Pj4gDQo+Pj4+IFJldmlld2VkLWJ5OiBH
ZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+DQo+Pj4+IA0KPj4+PiBCVFcs
IGRvIHlvdSBrbm93IGlmIHRoaXMgd2lsbCBjb21waWxlIGZvciBvbGRlciB2ZXJzaW9ucyBvZiBn
bz8NCj4+Pj4gDQo+Pj4+IFRoaXMgc2hvdWxkIGJlIGNvbnNpZGVyZWQgZm9yIGJhY2twb3J0IGFz
IHdlbGwgKGNjJ2luZyBKYW4pLg0KPj4+IA0KPj4+IERpZCB5b3UgbWVhbiBJYW4sIHRoaXMgYmVp
bmcgYSB0b29scyBwYXRjaD8NCj4+IA0KPj4gSSBndWVzcyBzby4gIFNvcnJ5LCBJIGRpZG4ndCBy
ZWFsaXplIElhbiB3YXMgZG9pbmcgdGhlIHRvb2xzIGJhY2twb3J0cy4NCj4+IA0KPj4gLUdlb3Jn
ZQ0KPiANCj4gV2l0aCB0aGUgZ29sYW5nIHRvb2xzIG1haW50YWluZXIgY2hhbmdlIGNvbXBsZXRl
ZCwgaXMgYW55dGhpbmcgZnVydGhlciBuZWVkZWQgZm9yIHRoaXMgcGF0Y2ggdG8gYmUgbWVyZ2Vk
Pw0KDQpNeSBjaGFuZ2UgdG8gdGhlIE1BSU5UQUlORVJTIGZpbGUgaGFzbuKAmXQgeWV0IGJlZW4g
bWVyZ2VkOyBJIHRoaW5rIGl0IHdvdWxkIGJlIGdvb2QgdG8gd2FpdCB1bnRpbCB0aGUgdG9vbHMg
bWFpbnRhaW5lciAod2hvIHRlY2huaWNhbGx5IGlzIGN1cnJlbnRseSB0aGUgbWFpbnRhaW5lcikg
Y2FuIEFjayB0aGUgcGF0Y2guDQoNCknigJlsbCBwaW5nIElhbiBwcml2YXRlbHkgdG8gbWFrZSBz
dXJlIGhlIGRvZXNu4oCZdCBtaXNzIGl0Lg0KDQogLUdlb3JnZQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs

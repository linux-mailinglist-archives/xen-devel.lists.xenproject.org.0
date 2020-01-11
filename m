Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64991137CA8
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jan 2020 10:38:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iqDB8-0006Hn-Tg; Sat, 11 Jan 2020 09:35:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BWeW=3A=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iqDB6-0006Hi-GN
 for xen-devel@lists.xen.org; Sat, 11 Jan 2020 09:35:32 +0000
X-Inumbo-ID: b082bc68-3455-11ea-b89f-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b082bc68-3455-11ea-b89f-bc764e2007e4;
 Sat, 11 Jan 2020 09:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578735324;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=k1whSjC13aR58ADPaPZYvhMpun5jTDLihUY49YTvFzU=;
 b=h9G+Rg+Bk/VU6U4Qc6sQbQPww/g50DB9YSJ5TaB11kUFeFDTLE18kkFk
 L3roVVjxf8ICNofC7VR/JxzxK9KniCXQCl3RWfn5pA8J41pGLYaRCemXm
 RbU5f+wa9JpFK9y6KdEu8F8xJWb5SHvXMMmQKMGGd5nEkcBi+UDVKhoiM w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
IronPort-SDR: Kar8D20ZW6ZT62tyNS7gOXoVbXy6/tD+Q8tAOw6RXPF5xyMdrm26MnCT0/qsP4HVlSgM1KarBh
 UD4pJTHfC7UC2WeLfi8c/6dwpP51qNWN9OJFJqZcoz45WXgPCea5NW4s2zfzw3E6yIRXxR74e5
 Y4adR4gYud2O3hZWfIVxbO8ucsGjxFacnTFleqcPDvApbl91rADYvPIEq84srE4ubliwjT/dDi
 aRBRkOco/urKsO7O2kLX9t/2seEYKJ5fQ1Z4OHqwR9qXZh5Lx06rL8etuC3JgQRpjPfO1GbrIM
 tAY=
X-SBRS: 2.7
X-MesageID: 10793964
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,420,1571716800"; d="scan'208";a="10793964"
From: George Dunlap <George.Dunlap@citrix.com>
To: Doug Goldstein <cardoe@cardoe.com>
Thread-Topic: [Xen-devel] [PATCH v2] xsm: hide detailed Xen version from
 unprivileged guests
Thread-Index: AQHVx6H06GanjEQbAUmN87QxqbsgEKfjqvkAgABKNICAANCZgIAAXxEA
Date: Sat, 11 Jan 2020 09:35:18 +0000
Message-ID: <F99E90AE-2468-4401-A0DD-AB50D84C2A3B@citrix.com>
References: <20200110103723.29538-1-sergey.dyasli@citrix.com>
 <e79ec88a-8261-39e0-6c18-a1db5af85b6a@citrix.com>
 <5e6956a4-9b32-6fae-6fa5-cf72a627a3da@citrix.com>
 <cbe5fc46-4fc9-f905-3492-2abc34a8e12e@cardoe.com>
In-Reply-To: <cbe5fc46-4fc9-f905-3492-2abc34a8e12e@cardoe.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.40.2.2.4)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <3520469257E5E44A809AF5A10BD896C7@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Sergey Dyasli <sergey.dyasli@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@citrix.com>, Xen-devel <xen-devel@lists.xen.org>,
 Jan Beulich <jbeulich@suse.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSmFuIDExLCAyMDIwLCBhdCAzOjU1IEFNLCBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9l
QGNhcmRvZS5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAxLzEwLzIwIDk6MjggQU0sIEdl
b3JnZSBEdW5sYXAgd3JvdGU6DQo+PiBPbiAxLzEwLzIwIDExOjAyIEFNLCBBbmRyZXcgQ29vcGVy
IHdyb3RlOg0KPj4+IE9uIDEwLzAxLzIwMjAgMTA6MzcsIFNlcmdleSBEeWFzbGkgd3JvdGU6DQo+
Pj4+IEhpZGUgdGhlIGZvbGxvd2luZyBpbmZvcm1hdGlvbiB0aGF0IGNhbiBoZWxwIGlkZW50aWZ5
IHRoZSBydW5uaW5nIFhlbg0KPj4+PiBiaW5hcnkgdmVyc2lvbjogWEVOVkVSX2V4dHJhdmVyc2lv
biwgWEVOVkVSX2NvbXBpbGVfaW5mbywgWEVOVkVSX2NoYW5nZXNldC4NCj4+Pj4gQWRkIGV4cGxp
Y2l0IGNhc2VzIGZvciBYRU5WRVJfY29tbWFuZGxpbmUgYW5kIFhFTlZFUl9idWlsZF9pZCBhcyB3
ZWxsLg0KPj4+PiANCj4+Pj4gSW50cm9kdWNlIHhzbV9maWx0ZXJfZGVuaWVkKCkgdG8gaHZtbG9h
ZGVyIHRvIHJlbW92ZSAiPGRlbmllZD4iIHN0cmluZw0KPj4+PiBmcm9tIGd1ZXN0J3MgRE1JIHRh
YmxlcyB0aGF0IG90aGVyd2lzZSB3b3VsZCBiZSBzaG93biBpbiB0b29scyBsaWtlDQo+Pj4+IGRt
aWRlY29kZS4NCj4+Pj4gDQo+Pj4+IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBEeWFzbGkgPHNlcmdl
eS5keWFzbGlAY2l0cml4LmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IHYxIC0tPiB2MjoNCj4+Pj4gLSBB
ZGRlZCB4c21fZmlsdGVyX2RlbmllZCgpIHRvIGh2bWxvYWRlciBpbnN0ZWFkIG9mIG1vZGlmeWlu
ZyB4ZW5fZGVueSgpDQo+Pj4+IC0gTWFkZSBiZWhhdmlvdXIgdGhlIHNhbWUgZm9yIGJvdGggUmVs
ZWFzZSBhbmQgRGVidWcgYnVpbGRzDQo+Pj4+IC0gWEVOVkVSX2NhcGFiaWxpdGllcyBpcyBubyBs
b25nZXIgaGlkZWQNCj4+Pj4gDQo+Pj4+IENDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPg0KPj4+PiBDQzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5j
aXRyaXguY29tPg0KPj4+PiBDQzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20+DQo+Pj4+IENDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+Pj4+IENDOiBK
dWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPj4+PiBDQzogS29ucmFkIFJ6ZXN6dXRlayBX
aWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPg0KPj4+PiBDQzogU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPj4+PiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4N
Cj4+Pj4gQ0M6IERhbmllbCBEZSBHcmFhZiA8ZGdkZWdyYUB0eWNoby5uc2EuZ292Pg0KPj4+IA0K
Pj4+IEkgcmVhbGlzZSB0aGVyZSBhcmUgYXJndW1lbnRzIG92ZXIgaG93IHRvIGZpeCB0aGlzLCBi
dXQgd2UgKHRoZSBYZW4NCj4+PiBjb21tdW5pdHkpIGhhdmUgYWxyZWFkeSBmKmNrZWQgdXAgb25j
ZSBoZXJlLCBhbmQgdGhpcyBpcyBkb2luZyBzbyBhDQo+Pj4gc2Vjb25kIHRpbWUuDQo+Pj4gDQo+
Pj4gTmFjay4NCj4+PiANCj4+PiBGaXhpbmcgaXQgYW55d2hlcmUgb3RoZXIgdGhhbiBYZW4gaXMg
c2ltcGx5IG5vdCBhcHByb3ByaWF0ZS4NCj4+PiANCj4+PiBUaGUgcmVhc29uIGZvciB0aGlzICh3
aGljaCBvdWdodCB0byBiZSBvYnZpb3VzLCBidXQgSSBndWVzcyBvbmx5IHRvDQo+Pj4gdGhvc2Ug
d2hvIGFjdHVhbGx5IGRvIGN1c3RvbWVyIHN1cHBvcnQpIGlzIGJhc2ljIGh1bWFuIHBoeXNpb2xv
Z3kuDQo+Pj4gImRlbmllZCIgbWVhbnMgc29tZXRoaW5nIGhhcyBnb25lIHdyb25nLiAgSXQgc2Nh
cmVzIHBlb3BsZSwgYW5kIGNhdXNlcw0KPj4+IHRoZW0gdG8gc2VlayBoZWxwIHRvIGNoYW5nZSBm
aXggd2hhdGV2ZXIgaXMgYnJva2VuLg0KPj4gVGhpcyBzZWVtcyBsaWtlIGEgcmVhc29uYWJsZSBh
cmd1bWVudCB0aGF0ICI8ZGVuaWVkPiIgY2F1c2VzIGlzc3Vlcy4NCj4+IEJ1dCB0aGF0IGRvZXNu
J3QgY2hhbmdlIHRoZSBmYWN0IHRoYXQgIiIgYWxzbyBjYXVzZXMgaXNzdWVzLg0KPiANCj4gSSdk
IGJlIGN1cmlvdXMgdG8gaGVhciB0aGUgY2FzZSB3aGVyZSB0aGUgZW1wdHkgc3RyaW5nIGNhdXNl
cyBpc3N1ZXMuDQoNClRoaXMgd2FzIG1lbnRpb25lZCBpbiB0aGUgcHJldmlvdXMgdmVyc2lvbiBv
ZiB0aGlzIHRocmVhZC4gIFRvIG1pcnJvciBBbmR54oCZcyAocmF0aGVyIGluZmxhbW1hdG9yeSkg
Zm9ybXVsYXRpb246DQoNClRoZSByZWFzb24gZm9yIHRoaXMgKHdoaWNoIG91Z2h0IHRvIGJlIG9i
dmlvdXMsIGJ1dCBJIGd1ZXNzIG9ubHkgdG8gdGhvc2Ugd2hvIGFjdHVhbGx5IFt1c2UgY29tcHV0
ZXIgaW50ZXJmYWNlc10pIGlzIGJhc2ljIFt1c2VyIGludGVyZmFjZSBkZXNpZ25dLiAgV2hlbiB5
b3UgYXNrIGFuIGludGVyZmFjZSB0byBkbyBzb21ldGhpbmcgZm9yIHlvdSwgaXQgc2hvdWxkIGVp
dGhlciBkbyB0aGUgdGhpbmcgeW91IGFza2VkIGl0IHRvIGRvLCBvciBpdCBzaG91bGQgdGVsbCB5
b3Ugd2h5IGl0IGNvdWxkbuKAmXQuICBPciwgYXQgKnZlcnkqIGxlYXN0LCBpdCBzaG91bGQgdGVs
bCB5b3UgKnRoYXQqIGl0IGRpZG7igJl0Lg0KDQpJbWFnaW5lIHNvbWVvbmUgd2hvIHdyaXRlcyBj
b2RlIHRvIGdldCB0aGUgYnVpbGRpZCBhbmQgc3RvcmUgaXQgaW4gYSBsb2cgc29tZXdoZXJlLiAg
RXZlcnl0aGluZyBjb21waWxlcyBhbmQgcnVucyBncmVhdC4gIEFuZCB0aGVuIGEgbGl0dGxlIHdh
eXMgZG93biB0aGUgcm9hZCwgdGhleSBsb29rIGluIHRoZWlyIGxvZywgYW5kIGZpbmQg4oCcWGVu
IDQuMTMuMeKAnSwgd2l0aCBubyBidWlsZGlkISAgU28gdGhleSBzcGVuZCBhbiBhZnRlcm5vb24g
dHJ5aW5nIHRvIGZpZ3VyZSBvdXQgd2hhdCB3ZW50IHdyb25nLiAgRGlkIHRoZXkgc2NyZXcgdXAg
dGhlIGJ1aWxkIG9mIFhlbj8gIE5vLCBgeGwgaW5mb2AgcmVwb3J0cyB0aGUgYnVsaWRpZC4gIERp
ZCB0aGV5IGdyYWIgdGhleSBjb21waWxlIGFnYWluc3QgdGhlIHdyb25nIGhlYWRlcj8gIERpZCB0
aGV5IHNjcmV3IHVwIHRoZSBjYWxsIHNvbWVob3c/ICBEaWQgdGhleSBhY2NpZGVudGFsbHkgcmVh
ZCBpdCBpbnRvIHRoZSB3cm9uZyBidWZmZXI/ICBJbWFnaW5lIHRoZWlyIHJhZ2Ugd2hlbiBldmVu
dHVhbGx5LCBhZnRlciBob3VycyBvZiB0cmFjaW5nIHRocm91Z2ggY29kZSB0aGV54oCZdmUgc2Vl
biBhIGRvemVuIHRpbWVzLCB0aGV5IGZpZ3VyZSBvdXQgdGhhdCBUSEUgSU5URVJGQUNFIElTIFNJ
TEVOVExZIEZBSUxJTkcuDQoNCk9yIGltYWdpbmUgc29tZW9uZSB3aG8gc2VsbHMgc29tZXRoaW5n
IHRoYXQgcnVucyBpbnNpZGUgb2YgWGVuIGd1ZXN0cyBhbmQgdXNlcyBYZW4tc3BlY2lmaWMgZmVh
dHVyZXMuICBBbGwgb2YgaGVyIHRlc3Qgc3lzdGVtcyBoYXZlIHZlcnNpb25zIG9mIFhlbiB3aGlj
aCBleHBvc2UgdGhlIGJ1aWxkaWQgdG8gZ3Vlc3RzLiAgQXQgc29tZSBwb2ludCBvbmUgb2YgaGVy
IGN1c3RvbWVycyBoYXMgYW4gaXNzdWUsIHNvIHNoZSBhc2tzIHRoZW0gdG8gZ2V0IHRoZSBidWls
ZGlkIGJ5IGNsaWNraW5nIGhlcmUgaGVyZSBhbmQgaGVyZSwgYW5kIGdldHRpbmcgdGhlIHN0cmlu
Zy4gIEJ1dCB3aGVuIHRoZSBjdXN0b21lciByZXBvcnRzIHRoZSBzdHJpbmcsIHRoZXJl4oCZcyBu
byBidWlsZGlkLCBub3RoaW5nISAgU28gYWdhaW4gc2hlIHNwZW5kcyBob3VycyB0cnlpbmcgdG8g
4oCcZGVidWfigJ0gdGhlIOKAnHdoeSBkbyBJIG5vdCBoYXZlIGEgYnVpbGRpZOKAnSBpc3N1ZSwg
bG9va2luZyBsaWtlIGFuIGlkaW90IGluIGZyb250IG9mIGhlciBjdXN0b21lciwgb25seSB0byBk
aXNjb3ZlciB0aGF0IHRoZWlyIGN1c3RvbWVyIGlzIHJ1bm5pbmcgYSB2ZXJzaW9uIG9mIFhlbiB3
aGVyZSB0aGUgYnVpbGRpZCBpcyBzaW1wbHkgZW1wdHksIHdpdGggbm8gaW5kaWNhdGlvbiB0aGF0
IGFueXRoaW5nIGhhcyBiZWVuIGhpZGRlbi4NCg0KU2lsZW50bHkgcmV0dXJuaW5nIGEgcmVzdWx0
IHdoaWNoIGlzIGluZGlzdGluZ3Vpc2hhYmxlIGZyb20g4oCcbm8gYnVpbGRpZCBleGlzdHPigJ0g
aXMganVzdCBwbGFpbiBydWRlIHRvIGFueSBwcm9ncmFtbWVyIHdobyB1c2VzIHRoaXMgaW50ZXJm
YWNlLg0KDQpJIGNvbXBsZXRlbHkgdW5kZXJzdGFuZCB0aGF0IGhhdmluZyDigJw8ZGVuaWVkPuKA
nSBzaG93IHVwIGluIGEgR1VJIG1pZ2h0IGNhdXNlIGN1c3RvbWVyIHN1cHBvcnQgaGVhZGFjaGVz
LiAgQnV0IGZ1bmRhbWVudGFsbHkgaXTigJlzIG5vdCB0aGUgaHlwZXJ2aXNvcuKAmXMgam9iIHRv
IGNvZGRsZSB0aW1pZCBlbmQtdXNlcnM7IHRoYXTigJlzIHdoYXQgVUlzIGFyZSBmb3IuDQoNCkkg
ZG9u4oCZdCB3YW50IHRvIGJlIGRvZ21hdGljIGFib3V0IHRoYXQgcHJpbmNpcGxlLCBzbyBJ4oCZ
bSBoYXBweSB0byBlbnRlcnRhaW4gY2hhbmdpbmcgdGhlIHN0cmluZyB0byBiZSBzb21ldGhpbmcg
bW9yZSB1c2VyLWZyaWVuZGx5IChvciBzb21lIG90aGVyIHN1aXRhYmxlIGNoYW5nZSBpbiB0aGUg
aW50ZXJmYWNlKS4gIEJ1dCBJIGRvIHdhbnQgdG8gYmUgZG9nbWF0aWMgYWJvdXQgaW50ZXJmYWNl
cyBub3Qgc2lsZW50bHkgZmFpbGluZy4NCg0KIC1HZW9yZ2UKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

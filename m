Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 080958B2CC
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 10:46:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxSOw-0007jy-86; Tue, 13 Aug 2019 08:43:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hgkg=WJ=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hxSOv-0007jt-47
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 08:43:29 +0000
X-Inumbo-ID: 6b28b2ba-bda6-11e9-8155-0787c4619ce9
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b28b2ba-bda6-11e9-8155-0787c4619ce9;
 Tue, 13 Aug 2019 08:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565685808;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=JAPubaMNNh/e7OZsgYi4oPdqlgOARkymqAj3sPOTVuI=;
 b=cIbSS3xrFFQK2EvciXcIzWvRO/ISzYaREa/9MLdiOtvnWqfP9Qm3Ik7w
 nEJJDHCLhevH8Id/pmd9ceemrkqEMnhL0ofopgTDiauB2uL/Jnd9eEr6i
 g3+2oWvGHGZuN5Zhegd1fpsrkKFshjAhkliCM3hP9pWuW+217xpmA2ACO 0=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Kkf8RPKxT1zMHle/ZG7iVFx7QjEgT8a14ACYCVYCAqSw7aF5KwfOxk9FK3jjS57xRIQDf9/acb
 /DO8hKssb3ywUVloKWgJlhQ3212sIBSvZv+T6tgUE8SeC0VNS2/tfqbYrCAN1+/HHMPCJmBRta
 q5a3ey4P+T3jQvY+uSQAOqhYYZxSDA8Ou05mC8pS4SM8UrDLmj1OYWpC2GYnVPW2mEgUw+2puw
 cK/DxOfr2xnXvDc65hklb2yToaI/gSpSoysCozttIu5quC2XyQlcQy53r0jIWm/WQJg4GbulaZ
 ynY=
X-SBRS: 2.7
X-MesageID: 4192265
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,380,1559534400"; 
   d="scan'208";a="4192265"
From: George Dunlap <George.Dunlap@citrix.com>
To: Sarah Newman <srn@prgmr.com>
Thread-Topic: [Xen-devel] Terminology for "guest" - Was: [PATCH] docs/sphinx:
 Introduction
Thread-Index: AQHVTVgpwkwZRLw0fUa0u+4JMm+TnqbwpyQAgAAnN4CAAAX5AIAAAnmAgAaoXICAAAIrgIAAyJSAgABgNYA=
Date: Tue, 13 Aug 2019 08:43:23 +0000
Message-ID: <E4C0136D-9D42-4174-942E-EB6365CB11A1@citrix.com>
References: <20190807194143.1351-1-andrew.cooper3@citrix.com>
 <ad94d279-e53c-b1ae-c333-096944b217dd@suse.com>
 <2e3a40d8-14ec-9f84-6a43-d7389bdbebf8@citrix.com>
 <eba4a457-5be0-ee55-28b5-f25973c743fa@suse.com>
 <40816d88-b7e2-7d9f-2d7a-bede37a80e99@arm.com>
 <92e29dd6-0de2-09a4-86e9-e9f76341fe6f@citrix.com>
 <b436f483-1f80-c91b-8c17-a1cfbf98b6f1@citrix.com>
 <760ba819-a3ab-c5dc-054c-3064c6b07a1b@prgmr.com>
In-Reply-To: <760ba819-a3ab-c5dc-054c-3064c6b07a1b@prgmr.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <BD189B0A6079DE478ED70C7D6E6C3EA4@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] Terminology for "guest" - Was: [PATCH] docs/sphinx:
 Introduction
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
 StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXVnIDEzLCAyMDE5LCBhdCAzOjU5IEFNLCBTYXJhaCBOZXdtYW4gPHNybkBwcmdt
ci5jb20+IHdyb3RlOg0KPiANCj4gT24gOC8xMi8xOSA4OjAxIEFNLCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4gT24gMTIvMDgvMjAxOSAxNTo1MywgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4+PiBP
biA4LzgvMTkgMTA6MTMgQU0sIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4gSGkgSmFuLA0KPj4+
PiANCj4+Pj4gT24gMDgvMDgvMjAxOSAxMDowNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBP
biAwOC4wOC4yMDE5IDEwOjQzLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+Pj4+IE9uIDA4LzA4
LzIwMTkgMDc6MjIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+PiBPbiAwNy4wOC4yMDE5IDIx
OjQxLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+Pj4+Pj4gLS0tIC9kZXYvbnVsbA0KPj4+Pj4+
Pj4gKysrIGIvZG9jcy9nbG9zc2FyeS5yc3QNCj4+Pj4+Pj4+IEBAIC0wLDAgKzEsMzcgQEANCj4+
Pj4+Pj4+ICtHbG9zc2FyeQ0KPj4+Pj4+Pj4gKz09PT09PT09DQo+Pj4+Pj4+PiArDQo+Pj4+Pj4+
PiArLi4gVGVybXMgc2hvdWxkIGFwcGVhciBpbiBhbHBoYWJldGljYWwgb3JkZXINCj4+Pj4+Pj4+
ICsNCj4+Pj4+Pj4+ICsuLiBnbG9zc2FyeTo6DQo+Pj4+Pj4+PiArDQo+Pj4+Pj4+PiArICAgY29u
dHJvbCBkb21haW4NCj4+Pj4+Pj4+ICsgICAgIEEgOnRlcm06YGRvbWFpbmAsIGNvbW1vbmx5IGRv
bTAsIHdpdGggdGhlIHBlcm1pc3Npb24gYW5kDQo+Pj4+Pj4+PiByZXNwb25zaWJpbGl0eQ0KPj4+
Pj4+Pj4gKyAgICAgdG8gY3JlYXRlIGFuZCBtYW5hZ2Ugb3RoZXIgZG9tYWlucyBvbiB0aGUgc3lz
dGVtLg0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gKyAgIGRvbWFpbg0KPj4+Pj4+Pj4gKyAgICAgQSBk
b21haW4gaXMgWGVuJ3MgdW5pdCBvZiByZXNvdXJjZSBvd25lcnNoaXAsIGFuZCBnZW5lcmFsbHkg
aGFzDQo+Pj4+Pj4+PiBhdCB0aGUNCj4+Pj4+Pj4+ICsgICAgIG1pbmltdW0gc29tZSBSQU0gYW5k
IHZpcnR1YWwgQ1BVcy4NCj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+ICsgICAgIFRoZSB0ZXJtcyA6dGVy
bTpgZG9tYWluYCBhbmQgOnRlcm06YGd1ZXN0YCBhcmUgY29tbW9ubHkgdXNlZA0KPj4+Pj4+Pj4g
KyAgICAgaW50ZXJjaGFuZ2VhYmx5LCBidXQgdGhleSBtZWFuIHN1YnRseSBkaWZmZXJlbnQgdGhp
bmdzLg0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gKyAgICAgQSBndWVzdCBpcyBhIHNpbmdsZSB2aXJ0
dWFsIG1hY2hpbmUuDQo+Pj4+Pj4+PiArDQo+Pj4+Pj4+PiArICAgICBDb25zaWRlciB0aGUgY2Fz
ZSBvZiBsaXZlIG1pZ3JhdGlvbiB3aGVyZSwgZm9yIGEgcGVyaW9kIG9mDQo+Pj4+Pj4+PiB0aW1l
LCBvbmUNCj4+Pj4+Pj4+ICsgICAgIGd1ZXN0IHdpbGwgYmUgY29tcHJpc2VkIG9mIHR3byBkb21h
aW5zLCB3aGlsZSBpdCBpcyBpbiB0cmFuc2l0Lg0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gKyAgIGRv
bWlkDQo+Pj4+Pj4+PiArICAgICBUaGUgbnVtZXJpYyBpZGVudGlmaWVyIG9mIGEgcnVubmluZyA6
dGVybTpgZG9tYWluYC4gIEl0IGlzDQo+Pj4+Pj4+PiB1bmlxdWUgdG8gYQ0KPj4+Pj4+Pj4gKyAg
ICAgc2luZ2xlIGluc3RhbmNlIG9mIFhlbiwgdXNlZCBhcyB0aGUgaWRlbnRpZmllciBpbiB2YXJp
b3VzIEFQSXMsDQo+Pj4+Pj4+PiBhbmQgaXMNCj4+Pj4+Pj4+ICsgICAgIHR5cGljYWxseSBhbGxv
Y2F0ZWQgc2VxdWVudGlhbGx5IGZyb20gMC4NCj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+ICsgICBndWVz
dA0KPj4+Pj4+Pj4gKyAgICAgU2VlIDp0ZXJtOmBkb21haW5gDQo+Pj4+Pj4+IEkgdGhpbmsgeW91
IHdhbnQgdG8gbWVudGlvbiB0aGUgdXN1YWwgZGlzdGluY3Rpb24gaGVyZTogRG9tMCBpcywNCj4+
Pj4+Pj4gd2hpbGUgYSBkb21haW4sIGNvbW1vbmx5IG5vdCBjb25zaWRlcmVkIGEgZ3Vlc3QuDQo+
Pj4+Pj4gVG8gYmUgaG9uZXN0LCBJIGhhZCB0b3RhbGx5IGZvcmdvdHRlbiBhYm91dCB0aGF0LiAg
SSBndWVzcyBub3cgaXMgdGhlDQo+Pj4+Pj4gcHJvcGVyIHRpbWUgdG8gcmVoYXNoIGl0IGluIHB1
YmxpYy4NCj4+Pj4+PiANCj4+Pj4+PiBJIGRvbid0IHRoaW5rIHRoZSB3YXkgaXQgY3VycmVudGx5
IGdldHMgdXNlZCBoYXMgYSBjbGVhciBvciBjb2hlcmVudCBzZXQNCj4+Pj4+PiBvZiBydWxlcywg
YmVjYXVzZSBJIGNhbid0IHRoaW5rIG9mIGFueSB0byBkZXNjcmliZSBob3cgaXQgZG9lcyBnZXQg
dXNlZC4NCj4+Pj4+PiANCj4+Pj4+PiBFaXRoZXIgdGhlcmUgYXJlIGEgY2xlYXIgYW5kIGNvaGVy
ZW50IChhbmQgc2ltcGxlISkgc2V0IG9mIHJ1bGVzIGZvcg0KPj4+Pj4+IHdoYXQgd2UgbWVhbiBi
eSAiZ3Vlc3QiLCBhdCB3aGljaCBwb2ludCB0aGV5IGNhbiBsaXZlIGhlcmUgaW4gdGhlDQo+Pj4+
Pj4gZ2xvc3NhcnksIG9yIHRoZSBmdXp6eSB3YXkgaXQgaXMgY3VycmVudCB1c2VkIHNob3VsZCBj
ZWFzZS4NCj4+Pj4+IFdoYXQncyBmdXp6eSBhYm91dCBEb20wIG5vdCBiZWluZyBhIGd1ZXN0IChk
dWUgdG8gYmVpbmcgYSBwYXJ0IG9mIHRoZQ0KPj4+Pj4gaG9zdCBpbnN0ZWFkKT8NCj4+Pj4gRG9t
MCBpcyBub3QgcGFydCBvZiB0aGUgaG9zdCBpZiB5b3UgYXJlIHVzaW5nIGFuIGhhcmR3YXJlIGRv
bWFpbi4gSQ0KPj4+PiBhY3R1YWxseSB0aG91Z2h0IHdlIHJlbmFtZWQgZXZlcnl0aGluZyBpbiBY
ZW4gZnJvbSBEb20wIHRvIGh3ZG9tIHRvDQo+Pj4+IGF2b2lkIHRoZSBjb25mdXNpb24uDQo+Pj4+
IA0KPj4+PiBJIGFsc28gd291bGQgcmF0aGVyIGF2b2lkIHRvIHRyZWF0ICJkb20wIiBhcyBub3Qg
YSBndWVzdC4gSW4gbm9ybWFsDQo+Pj4+IHNldHVwIHRoaXMgaXMgYSBtb3JlIHByaXZpbGVnZSBn
dWVzdCwgaW4gb3RoZXIgc2V0dXAgdGhpcyBtYXkganVzdCBiZSBhDQo+Pj4+IG5vcm1hbCBndWVz
dCAodGhpbmsgYWJvdXQgcGFydGl0aW9uaW5nKS4NCj4+PiBBIGxpdGVyYWwgZ3Vlc3QgaXMgc29t
ZW9uZSB3aG8gZG9lc24ndCBsaXZlIGluIHRoZSBidWlsZGluZyAob3Igd29yayBpbg0KPj4+IHRo
ZSBidWxpZGluZywgaWYgeW91J3JlIGluIGEgaG90ZWwpLiAgVGhlIGZhY3QgdGhhdCB0aGUgc3Rh
ZmYgY2xlYW5pbmcNCj4+PiByb29tcyBhcmUgcmVzdHJpY3RlZCBpbiB0aGVpciBwcml2aWxlZ2Vz
IGRvZXNuJ3QgbWFrZSB0aGVtIGd1ZXN0cyBvZiB0aGUNCj4+PiBob3RlbC4NCj4+PiANCj4+PiBU
aGUgdG9vbHN0YWNrIGRvbWFpbiwgdGhlIGhhcmR3YXJlIGRvbWFpbiwgdGhlIGRyaXZlciBkb21h
aW4sIHRoZQ0KPj4+IHhlbnN0b3JlIGRvbWFpbiwgYW5kIHNvIG9uIGFyZSBhbGwgcGFydCBvZiB0
aGUgaG9zdCBzeXN0ZW0sIGRlc2lnbmVkIHRvDQo+Pj4gYWxsb3cgeW91IHRvIHVzZSBYZW4gdG8g
ZG8gdGhlIHRoaW5nIHlvdSBhY3R1YWxseSB3YW50IHRvIGRvOiBSdW4gZ3Vlc3RzLg0KPj4+IA0K
Pj4+IEFuZCBpdCdzIGltcG9ydGFudCB0aGF0IHdlIGhhdmUgYSB3b3JkIHRoYXQgZGlzdGluZ3Vp
c2hlcyAiZG9tYWlucyB0aGF0DQo+Pj4gd2Ugb25seSBjYXJlIGFib3V0IGJlY2F1c2UgdGhleSBt
YWtlIGl0IHBvc3NpYmxlIHRvIHJ1biBvdGhlciBkb21haW5zIiwNCj4+PiBhbmQgImRvbWFpbnMg
dGhhdCB3ZSBhY3R1YWxseSB3YW50IHRvIHJ1biIuICAiZ3Vlc3QgLyBob3N0IiBpcyBhIG5hdHVy
YWwNCj4+PiB0ZXJtaW5vbG9neSBmb3IgdGhlc2UuDQo+Pj4gDQo+Pj4gV2UgYWxyZWFkeSBoYXZl
IHRoZSB3b3JkICJkb21haW4iLCB3aGljaCBpbmNsdWRlcyBkb20wLCBkcml2ZXIgZG9tYWlucywN
Cj4+PiB0b29sc3RhY2sgZG9tYWlucywgaGFyZHdhcmUgZG9tYWlucywgYXMgd2VsbCBhcyBndWVz
dCBkb21haW5zLiAgV2UgZG9uJ3QNCj4+PiBuZWVkICJndWVzdCIgdG8gYmUgYSBzeW5vbnltIGZv
ciAiZG9tYWluIi4NCj4+IFNvLi4uDQo+PiBQbGVhc2UgY2FuIHNvbWVvbmUgcHJvcG9zZSB3b3Jk
aW5nIHNpbXBsZSwgY2xlYXIgd29yZGluZyBmb3Igd2hhdA0KPj4gImd1ZXN0IiBtZWFucy4NCj4g
DQo+IEEgcG90ZW50aWFsbHkgdW50cnVzdGVkIGRvbWFpbi4NCg0KQnV0IHdvdWxkbuKAmXQgdGhh
dCBpbmNsdWRlIGJvdGggZHJpdmVyIGRvbWFpbnMgYW5kIHN0dWJkb21haW5zPw0KDQogLUdlb3Jn
ZQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

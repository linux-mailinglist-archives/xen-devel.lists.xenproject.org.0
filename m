Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A40F6A829
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 14:04:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnMAD-0007kg-8g; Tue, 16 Jul 2019 12:02:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qSVG=VN=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hnMAC-0007kY-0A
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 12:02:32 +0000
X-Inumbo-ID: 962af4f5-a7c1-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 962af4f5-a7c1-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 12:02:30 +0000 (UTC)
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
IronPort-SDR: o4vqfQWonk7GXBlqWEbSjFaPFZVE+VQ4nGWwJwHsPixRYaMkPfRqoAZ10RhYZlcv8c0902ykOJ
 SsRyWBCZ4J3mqlLCFzMLspzS2NhFvc9ygif39/WE5rl1/x9c2OOeR6VBbeoxdVFP5O68hxnhrN
 scXbFGTUM5WrN8SVCirmoXM3Y3XAl7H1y/gCc69+5Zq4minQRlgQN/2Bps8hoNvIEILtJ4vPMn
 pDneZvr75yhhhSQIeC+/Axxy+23gnWn2ZEeI3ePmTvRDoQi5HpjTibr9FepoFqXar6B/4KZzhE
 9lk=
X-SBRS: 2.7
X-MesageID: 3048673
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,498,1557201600"; 
   d="scan'208";a="3048673"
From: George Dunlap <George.Dunlap@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
Thread-Topic: [Xen-devel] [PATCH v1 2/5] xen: sched: null: don't assign down
 vcpus to pcpus
Thread-Index: AQHUPAmhh4dMy/ZfvUyZ5Nh5ZsZu76bNtPYAgAE6CACAABQTgA==
Date: Tue, 16 Jul 2019 12:02:27 +0000
Message-ID: <10573373-94FE-47CE-A7E8-208EBFE8BC29@citrix.com>
References: <153515586506.7407.8908626058440527641.stgit@Palanthas.fritz.box>
 <153515650541.7407.13469781440827661968.stgit@Palanthas.fritz.box>
 <54fc671f-0527-e29b-e9ec-634e42c8594d@citrix.com>
 <c3661d2275abe2f34066ec334b2154d6a0339840.camel@suse.com>
In-Reply-To: <c3661d2275abe2f34066ec334b2154d6a0339840.camel@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <55D4E0472BED214087FEB4B26BE88C09@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v1 2/5] xen: sched: null: don't assign down
 vcpus to pcpus
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>, George
 Dunlap <George.Dunlap@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVsIDE2LCAyMDE5LCBhdCAxMTo1MCBBTSwgRGFyaW8gRmFnZ2lvbGkgPGRmYWdn
aW9saUBzdXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBNb24sIDIwMTktMDctMTUgYXQgMTc6MDYg
KzAxMDAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+PiBPbiA4LzI1LzE4IDE6MjEgQU0sIERhcmlv
IEZhZ2dpb2xpIHdyb3RlOg0KPj4+IElmIGEgcENQVSBoYXMgYmVlbi9pcyBiZWluZyBvZmZsaW5l
ZCwgd2UgZG9uJ3Qgd2FudCBpdCB0byBiZQ0KPj4+IG5laXRoZXINCj4+PiBhc3NpZ25lZCB0byBh
bnkgcENQVSwgbm9yIGluIHRoZSB3YWl0IGxpc3QuDQo+PiANCj4+IEkgdGFrZSBpdCB0aGUgZmly
c3QgYHBDUFVgIHNob3VsZCBiZSBgdkNQVWA/DQo+PiANCj4gSW5kZWVkLiA6LSkNCj4gDQo+PiBB
bHNvLCBFbmdsaXNoIGdyYW1tYXIgYWdyZWVtZW50IGlzIGZ1bm55OiBgbmVpdGhlcmAgbmVlZHMg
dG8gYWdyZWUNCj4+IHdpdGgNCj4+IGBub3JgLCBidXQgdGhlIHR3byBkbyAqbm90KiBhZ3JlZSB3
aXRoIHRoZSBvcmlnaW5hbCB2ZXJiLiAgVGhhdCBpcywNCj4+IHRoZQ0KPj4gc2VudGVuY2Ugc2hv
dWxkIHNheToNCj4+IA0KPj4gIi4uLndlIHdhbnQgaXQgdG8gYmUgbmVpdGhlciBhc3NpZ25lZCB0
byBwQ1BVLCBub3IgaW4gdGhlIHdhaXQgbGlzdCIuDQo+PiANCj4gWWVwLCBub3cgdGhhdCBJIHNl
ZSBpdCwgdGhpcyByaW5ncyBhIGJlbGwgYmFjayBmcm9tIG15IGhpZ2gtc2Nob29sDQo+IEVuZ2xp
c2ggY2xhc3MhIDotTw0KPiANCj4gU29ycnkuLi4gYW5kIHRoYW5rcy4gOi0pDQo+IA0KPj4gQm90
aCBoZXJlIGFuZCBpbiB0aGUgY29tbWVudC4NCj4+IA0KPiBBbmQgaW4gcGF0Y2ggMyBjaGFuZ2Vs
b2cgdG9vLCBJJ20gYWZyYWlkLiA6LVANCj4gDQo+PiBUaGUgb3RoZXIgdGhpbmcgaXMsIGZyb20g
YSAiZGV2ZWxvcG1lbnRhbCBwdXJpdHkiIHBvaW50IG9mIHZpZXcsIEkNCj4+IHRoaW5rDQo+PiB0
aGlzIHNlcmllcyB0ZWNobmljYWxseSBoYXMgYSByZWdyZXNzaW9uIGluIHRoZSBtaWRkbGU6IGNw
dSBvZmZsaW5lIC8NCj4+IG9ubGluZSBzdG9wcyB3b3JraW5nIGJldHdlZW4gcGF0Y2ggMiBhbmQg
cGF0Y2ggNC4gIEJ1dCBJJ20gaW5jbGluZWQNCj4+IGluDQo+PiB0aGlzIGNhc2Ugbm90IHRvIHdv
cnJ5IHRvbyBtdWNoLiA6LSkNCj4+IA0KPiBXZWxsLCB0aGUgcG9pbnQgaXMgdGhhdCBvZmZsaW5p
bmcvb25saW5pbmcgZG9lcyBub3Qgd29yayBiZWZvcmUgdGhpcw0KPiBzZXJpZXMuIFN5c3RlbSBk
b2VzIG5vdCBjcmFzaCwgYnV0IGJlaGF2aW9yIGlzIHdyb25nLCBhcyBvZmZsaW5lIHZDUFVzDQo+
IHN0YXkgYXNzaWduZWQgdG8gcENQVXMgKGtlZXBpbmcgdGhlbSBpZGxlKSB3aGlsZSBvbmxpbmUg
dkNQVXMgYXJlDQo+ICJ0cmFwcGVkIiBpbiB0aGUgd2FpdCBsaXN0LCB3aGljaCBpcyB3cm9uZy4N
Cj4gDQo+IFNvIHRoYXQncyB3aHkgSSBkb24ndCB0aGluayB0aGVyZSdzIG11Y2ggdmFsdWUgaW4g
YmVpbmcgY29uc2lzdGVudCB3aXRoDQo+IHN1Y2ggYmVoYXZpb3IgdGhyb3VnaG91dCB0aGUgc2Vy
aWVzLi4uIHdoaWNoIEkgZ3Vlc3MgaXMgd2h5IHlvdSBzYWlkDQo+IHlvdSAid29uJ3Qgd29ycnkg
dG9vIG11Y2ggaW4gdGhpcyBjYXNl4oCdID8NCg0KSXTigJlzIGRlZmluaXRlbHkgc3ViLW9wdGlt
YWwgZnJvbSBhIHN5c3RlbSBwb2ludCBvZiB2aWV3OyBidXQgZnJvbSBhIGd1ZXN0IHBvaW50IG9m
IHZpZXcsIGl0IGRvZXMgKG9yIHNob3VsZCkgZnVuY3Rpb24uICBCZWZvcmUgdGhpcyBzZXJpZXMs
IGlmIGEgZ3Vlc3Qgb2ZmbGluZSBhbmQgdGhlbiBvbmxpbmUgdmNwdXMsIHRoZXkgc2hvdWxkIGNv
bWUgYmFjay4gIEluIHRoZSBtaWRkbGUgb2YgdGhpcyBzZXJpZXMsIG9uY2UgYSB2Y3B1IGlzIG9m
ZmxpbmVkLCBpdCBjYW7igJl0IGJlIGJyb3VnaHQgYmFjayB1cC4gIChUaGF0IGlzLCBpZiBJ4oCZ
bSByZWFkaW5nIGl0IHJpZ2h0LikNCg0KQnV0IEnigJltIG5vdCBleHBlY3RpbmcgcGVvcGxlIHRv
IGJlIGRvaW5nIGJpc2VjdGlvbnMgb2YgdGhhdCBwYXJ0aWN1bGFyIGZ1bmN0aW9uYWxpdHkgaW4g
dGhpcyBwYXJ0aWN1bGFyIHNjaGVkdWxlciB2ZXJ5IG11Y2guICBJIHRoaW5rIHRoZSDigJxiZW5l
Zml04oCdIG9mIGF2b2lkaW5nIGEgY29tcGxpY2F0ZWQgcmUtd3JpdGUgaXMgd2VsbCB3b3J0aCB0
aGUg4oCcY29zdOKAnSBvZiBoYXZpbmcgdGhhdCBwYXJ0aWN1bGFyIGJpc2VjdGlvbiBmYWlsLCBv
biB0aGUgb2ZmIGNoYW5jZSB0aGF0IGFueW9uZSB0cmllcyBpdC4NCg0KIC1HZW9yZ2UNCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

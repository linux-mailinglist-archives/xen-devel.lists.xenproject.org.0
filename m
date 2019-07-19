Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C826E2EB
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 10:52:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoOal-0004CH-Cc; Fri, 19 Jul 2019 08:50:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9kIP=VQ=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hoOaj-0004CB-Th
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 08:50:13 +0000
X-Inumbo-ID: 36531e84-aa02-11e9-a594-9f081420019f
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36531e84-aa02-11e9-a594-9f081420019f;
 Fri, 19 Jul 2019 08:50:10 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YrDAjFXzKvCOr18sUnQYjUb/KcVyX94RNJ9LlQgiwWDJ/YcT7Soq9CcCpN/P4RPJRDwSmHXE3Z
 CKbKm0vARyU0z2WKwnkkE8shSh7hPvBHBTIQZRagIXh7BiUtCvhy97otWdjQd30ZAnFGmiNLnh
 /rfowi+ZJOBTrQBgMW0QMWEYRIIe1EvvhANhT4OUBPjSWwrWKUXDln3roNQF66phvTFVRXGlms
 kHDuE3UGGwdWLLXF2CSoRfc5x9jgEoHvKaGl1tUFFDWvkN9kgIUQ5n9KHrGD5CWQ+CQfmsXCM2
 BJE=
X-SBRS: 2.7
X-MesageID: 3261136
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,281,1559534400"; 
   d="scan'208";a="3261136"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nicolas Belouin <nicolas.belouin@gandi.net>
Thread-Topic: [PATCH] golang/xenlight: Add libxl_utils support
Thread-Index: AQHVPbNjc95pGkfIQkWl7AokKBvwWKbRa8uAgAAUawCAAADHgA==
Date: Fri, 19 Jul 2019 08:50:05 +0000
Message-ID: <FBF82058-59FC-40B7-859C-A42D6756CC05@citrix.com>
References: <20190718215428.6727-1-george.dunlap@citrix.com>
 <854f62f4-000c-d090-320e-5097887e02b4@gandi.net>
 <643C0338-ACDB-4581-A16C-0DFCC22C7C07@citrix.com>
In-Reply-To: <643C0338-ACDB-4581-A16C-0DFCC22C7C07@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <654F74517920884EA9BA06B3A9A0AD32@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] golang/xenlight: Add libxl_utils support
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVsIDE5LCAyMDE5LCBhdCA5OjQ3IEFNLCBHZW9yZ2UgRHVubGFwIDxnZW9yZ2Uu
ZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gSnVsIDE5LCAyMDE5
LCBhdCA4OjM0IEFNLCBOaWNvbGFzIEJlbG91aW4gPG5pY29sYXMuYmVsb3VpbkBnYW5kaS5uZXQ+
IHdyb3RlOg0KPj4gDQo+PiANCj4+IA0KPj4gT24gNy8xOC8xOSAxMTo1NCBQTSwgR2VvcmdlIER1
bmxhcCB3cm90ZToNCj4+PiBUaGUgR28gYmluZGluZ3MgZm9yIGxpYnhsIG1pc3MgZnVuY3Rpb25z
IGZyb20gbGlieGxfdXRpbHMsIGxldCdzIHN0YXJ0DQo+Pj4gd2l0aCB0aGUgc2ltcGxlIGxpYnhs
X2RvbWlkX3RvX25hbWUgYW5kIGl0cyBjb3VudGVycGFydA0KPj4+IGxpYnhsX25hbWVfdG9fZG9t
aWQuDQo+Pj4gDQo+Pj4gTkIgdGhhdCBDLkdvU3RyaW5nKCkgd2lsbCByZXR1cm4gIiIgaWYgaXQn
cyBwYXNzZWQgYSBOVUxMOyBzZWUNCj4+PiBodHRwczovL2dpdGh1Yi5jb20vZ29sYW5nL2dvL2lz
c3Vlcy8zMjczNCNpc3N1ZWNvbW1lbnQtNTA2ODM1NDMyDQo+Pj4gDQo+Pj4gU2lnbmVkLW9mZi1i
eTogTmljb2xhcyBCZWxvdWluIDxuaWNvbGFzLmJlbG91aW5AZ2FuZGkubmV0Pg0KPj4+IFNpZ25l
ZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4NCj4+PiAt
LS0NCj4+PiB2MzoNCj4+PiAtIFdpcmUgaW50byBidWlsZCBzeXN0ZW0NCj4+PiAtIEFkZCByZWZl
cmVuY2UgdG8gQy5Hb1N0cmluZygpIGhhbmRsaW5nIE5VTEwgdG8gY29tbWl0IG1lc3NhZ2UNCj4+
PiANCj4+PiBOaWNvbGFzLCBjb3VsZCB5b3UgdGVzdCB0byBzZWUgaWYgdGhpcyBhY3R1YWxseSB3
b3JrcyBmb3IgeW91Pw0KPj4gVGVzdGVkIGl0LCBpdCB3b3Jrcy4NCj4+IA0KPj4gSSBtdXN0IGNv
bmZlc3MgSSBkbyBub3QgdXNlIHRoYXQgaW1wb3J0IHBhdGggYXMgdGhlIG5ldyBtb2R1bGVzIG1l
Y2hhbmlzbQ0KPj4gaW50cm9kdWNlZCBpbiBHbzEuMTEgZG93bmxvYWRzIGFuZCBjb21waWxlIGEg
dmVyc2lvbmVkIGNvcHkgb2YgZXZlcnkNCj4+IGRlcGVuZGVuY3kgcGVyIHByb2plY3QsIGFuZCB0
aGlzIGJlaGF2aW9yIGlzIGluY29tcGF0aWJsZSB3aXRoIHRoZSBidWlsZA0KPj4gc3lzdGVtIHVz
ZWQgaGVyZS4NCj4gDQo+IEl04oCZcyBwb3NzaWJsZSB0aGF0IHNvbWV0aGluZyBmdW5kYW1lbnRh
bGx5IGhhcyBjaGFuZ2VkLCBidXQgSSBzdXNwZWN0IHRoYXQgcmF0aGVyIHlvdSBkb27igJl0IHF1
aXRlIHVuZGVyc3RhbmQgaG93IHRoZSBjdXJyZW50IGJ1aWxkIHN5c3RlbSBpcyBzdXBwb3NlZCB0
byB3b3JrLiAgKEluIHdoaWNoIGNhc2UgYSB3cml0ZS11cCBpbiB0aGUgdHJlZSB3b3VsZCBwcm9i
YWJseSBiZSB1c2VmdWwuKQ0KPiANCj4gR28gaGFzIGFsd2F5cyBpbnNpc3RlZCB0aGF0IHRoZXJl
IGJlIG5vIGJpbmFyeSBjb21wYXRpYmlsaXR5IGJldHdlZW4gdmVyc2lvbnM7IHNvIGl04oCZcyBh
bHdheXMgYmVlbiBuZWNlc3NhcnkgdG8gcmUtY29tcGlsZSBhbGwgeW91ciBsaWJyYXJpZXMgd2hl
biB1cGdyYWRpbmcgZnJvbSAoc2F5KSAxLjggdG8gMS45LiAgV2hpY2ggbWVhbnMgdGhhdCBhbnkg
dXNlYWJsZSBkaXN0cmlidXRpb24gbXVzdCBhbHNvIGluY2x1ZGUgYWxsIHRoZSBzb3VyY2UgZmls
ZXMgbmVjZXNzYXJ5IHRvIHJlY29tcGlsZSB3aGVuIHlvdSBidW1wIHRoZSB2ZXJzaW9uIG51bWJl
ci4NCj4gDQo+IFNvIHRoZSBjb3JlIG1lY2hhbmlzbSBvZiB0aGUg4oCcaW5zdGFsbOKAnSBpcyBh
Y3R1YWxseSB0byBjb3B5IGFsbCB0aGUgc291cmNlIGZpbGVzIG5lY2Vzc2FyeSBpbnRvIHRoZSBy
aWdodCBsb2NhbCBkaXJlY3Rvcnkgc3VjaCB0aGF0IHRoZSBnbyBjb21waWxlciBjYW4gZmluZCB0
aGVtOyBBVE0gdGhpcyBpcyAvdXNyL3NoYXJlL2dvY29kZS9nb2xhbmcueGVucHJvamVjdC5vcmcv
eGVubGlnaHQNCg0KTml0OiAgVGhpcyBvZiBjb3Vyc2Ugc2hvdWxkIGhhdmUgYSBgc3JjL2AgYmV0
d2VlbiBgZ29jb2RlL2AgYW5kIGBnb2xhbmcueGVucHJvamVjdC5vcmcvYC4NCg0KTkIgYWxzbyB0
aGF0IHRoaXMgbmFtaW5nIHNjaGVtZSB3YXMgZGVzaWduZWQgc28gdGhhdCBhdCBzb21lIHBvaW50
IGluIHRoZSBmdXR1cmUsIHdlIGNvdWxkIGFjdHVhbGx5IGhvc3QgdGhlIHhlbmxpZ2h0IHBhY2th
Z2VzIGF0IHRoZSBVUkwgcHJvdmlkZWQuDQoNCiAtR2VvcmdlDQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E9C74D10
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 13:28:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqbrQ-0005oo-Up; Thu, 25 Jul 2019 11:24:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=owr5=VW=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hqbrP-0005oi-JT
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 11:24:35 +0000
X-Inumbo-ID: c78d2016-aece-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c78d2016-aece-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 11:24:34 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gn8OrRfweId1AMkAnnFFFCKXXSefAGM98Ijm0UdkQrDZcmReM1LqhE4+KXW6mWsGYUSmgwCxgb
 aKRYP9LfSan5YSguU39jUQSipAGp2qNr/R2bKTp0/vktwrd/A1vcewavYSIW331hUCp2VHAcz/
 HJ1hZrahxtmjyTfMWuEfmiDaMRYR4ZIRwbtiPBVfgBBA+46rlSs1nBob4xPq0P0cx0IVfgsygc
 0TEtCcL+1u6S7VPi8bzVeeVnZZu4Nn4TsfzqYubfgpY/gsSakQfO+htgsxVNbGitre0cqsY+I3
 fqI=
X-SBRS: 2.7
X-MesageID: 3546128
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3546128"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH 1/6] domain: stash xen_domctl_createdomain
 flags in struct domain
Thread-Index: AQHVQXCNE/ZRWIsbn0ecXdUI0phs+Kba8J0AgAAuXaD//+LzAIAAMgXQ
Date: Thu, 25 Jul 2019 11:24:31 +0000
Message-ID: <33c9e1a98cf1444497acb21d48d5c828@AMSPEX02CL03.citrite.net>
References: <20190723160609.2177-1-paul.durrant@citrix.com>
 <20190723160609.2177-2-paul.durrant@citrix.com>
 <20190725092242.m675tevc5wudzaw5@Air-de-Roger>
 <f19d582bd08c41a79cfe04bf72b8ef37@AMSPEX02CL03.citrite.net>
 <5410c036-5c7c-b2a7-1908-336fdb7b4959@suse.com>
In-Reply-To: <5410c036-5c7c-b2a7-1908-336fdb7b4959@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/6] domain: stash xen_domctl_createdomain
 flags in struct domain
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George
 Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI1IEp1bHkgMjAxOSAxMToyNQ0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IFJvZ2VyIFBhdSBNb25uZSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsg
QW5kcmV3IENvb3Blcg0KPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5s
YXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IElhbiBKYWNrc29uDQo+IDxJYW4uSmFja3Nv
bkBjaXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiBLb25yYWRSemVzenV0ZWsgV2ls
ayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsg
V2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCAx
LzZdIGRvbWFpbjogc3Rhc2ggeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gZmxhZ3MgaW4gc3RydWN0
IGRvbWFpbg0KPiANCj4gT24gMjUuMDcuMjAxOSAxMjoxMSwgUGF1bCBEdXJyYW50IHdyb3RlOg0K
PiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBSb2dlciBQYXUgTW9u
bmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiA+PiBTZW50OiAyNSBKdWx5IDIwMTkgMTA6MjMN
Cj4gPj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+DQo+ID4+IENj
OiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz47IFdlaSBMaXUNCj4gPHdsQHhlbi5vcmc+Ow0KPiA+PiBLb25y
YWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBHZW9yZ2UgRHVubGFw
IDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBBbmRyZXcNCj4gPj4gQ29vcGVyIDxBbmRyZXcu
Q29vcGVyM0BjaXRyaXguY29tPjsgSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+
OyBUaW0gKFhlbi5vcmcpDQo+IDx0aW1AeGVuLm9yZz47DQo+ID4+IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+
IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggMS82XSBkb21haW46IHN0YXNoIHhlbl9k
b21jdGxfY3JlYXRlZG9tYWluIGZsYWdzIGluIHN0cnVjdCBkb21haW4NCj4gPj4NCj4gPj4gT24g
VHVlLCBKdWwgMjMsIDIwMTkgYXQgMDU6MDY6MDRQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdyb3Rl
Og0KPiA+Pj4gVGhlc2UgYXJlIGNhbm9uaWNhbCBzb3VyY2Ugb2YgZGF0YSB1c2VkIHRvIHNldCB2
YXJpb3VzIG90aGVyIGZsYWdzLiBJZg0KPiA+Pj4gdGhleSBhcmUgYXZhaWxhYmxlIGRpcmVjdGx5
IGluIHN0cnVjdCBkb21haW4gdGhlbiB0aGUgb3RoZXIgZmxhZ3MgYXJlIG5vDQo+ID4+PiBsb25n
ZXIgbmVlZGVkLg0KPiA+Pj4NCj4gPj4+IFRoaXMgcGF0Y2ggc2ltcGx5IGNvcGllcyB0aGUgZmxh
Z3MgaW50byBhIG5ldyAnY3JlYXRlZmxhZ3MnIGZpZWxkIGluDQo+ID4+PiBzdHJ1Y3QgZG9tYWlu
LiBTdWJzZXF1ZW50IHBhdGNoZXMgd2lsbCBkbyB0aGUgcmVsYXRlZCBjbGVhbi11cCB3b3JrLg0K
PiA+Pg0KPiA+PiBUaGFua3MhDQo+ID4+DQo+ID4+IEp1c3Qgb25lIG5hbWluZyBjb21tZW50ICh3
aGljaCBpcyBzdWJqZWN0IHRvIHRhc3RlIEkgZ3Vlc3MpLg0KPiA+Pg0KPiA+Pj4gZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgNCj4g
Pj4+IGluZGV4IGI0MGM4ZmQxMzguLmVkYWUzNzJjMmIgMTAwNjQ0DQo+ID4+PiAtLS0gYS94ZW4v
aW5jbHVkZS94ZW4vc2NoZWQuaA0KPiA+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgN
Cj4gPj4+IEBAIC0zMDgsNiArMzA4LDcgQEAgZW51bSBndWVzdF90eXBlIHsNCj4gPj4+DQo+ID4+
PiAgIHN0cnVjdCBkb21haW4NCj4gPj4+ICAgew0KPiA+Pj4gKyAgICB1bnNpZ25lZCBpbnQgICAg
IGNyZWF0ZWZsYWdzOw0KPiA+Pg0KPiA+PiBDYW4geW91IG5hbWUgdGhpcyBqdXN0IGZsYWdzIG9y
IG9wdGlvbnMgb3Igc29tZSBzdWNoICh3aXRob3V0IHRoZQ0KPiA+PiBjcmVhdGUgcHJlZml4KS4g
SU1PIGFkZGluZyB0aGUgY3JlYXRlIHByZWZpeCBtYWtlcyBpdCBsb29rIGxpa2UgYQ0KPiA+PiBm
aWVsZCBvbmx5IHVzZWQgZHVyaW5nIGRvbWFpbiBjcmVhdGlvbiwgd2hpbGUgaXQncyBub3QgdGhl
IGNhc2UuDQo+ID4NCj4gPiBJIGd1ZXNzIG5hbWluZyBpdCBzaW1wbHkgJ2ZsYWdzJyB3b3VsZCBi
ZSBvayBjb3VwbGVkIHdpdGggYSBjb21tZW50DQo+ID4gaW4gdGhlIGhlYWRlciBzdGF0aW5nIHRo
YXQgdGhlIGZpZWxkIGlzIG1lcmVseSBhIGNvcHkgb2YgdGhlIGRvbWFpbg0KPiA+IGNyZWF0ZSBm
bGFncy4gQW55b25lIGVsc2UgZ290IG9waW5pb25zIG9uIHRoaXM/DQo+IA0KPiBXZSB1c2UgImZs
YWdzIiB0b28gb2Z0ZW4gaW1vLiBXaGF0IGFib3V0ICJvcHRpb25zIiBhcyBzdWdnZXN0ZWQgYnkN
Cj4gUm9nZXIsIG9yICJzZXR0aW5ncyI/DQoNCkFscmlnaHQsIGxldCdzIGdvIHdpdGggJ29wdGlv
bnMnIHRoZW4uDQoNCiAgUGF1bA0KDQo+IA0KPiBKYW4NCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=

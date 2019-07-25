Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C38274B4C
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 12:14:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqaiV-0008RO-Nh; Thu, 25 Jul 2019 10:11:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=owr5=VW=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hqaiU-0008RI-Oa
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 10:11:18 +0000
X-Inumbo-ID: 895fb058-aec4-11e9-829b-e70aafdc4373
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 895fb058-aec4-11e9-829b-e70aafdc4373;
 Thu, 25 Jul 2019 10:11:15 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /1pZZ4Vg4P4N3/akmMGyahuq0KfNtRu1Qp++xa3KdC9g+iVZ6XuenOFA3oNajajvldlOsmwbaO
 kORUEf5DSU0A35lACxVf4W9bd3FnwywUj3uh5CdNPDBM/eXtQRCassW6nsvidnTtyvyJKMuumV
 Gdpuk1JClHFvAUB4O2oVSIZwmt6knvGhHXslOzmGsX2tYTIpQp9qiIeWEy/7MATXcCQ7ofaYld
 a4X+HQqY71NHMSPhnW/lTAshgdqb61xo4v3tTxSfzVRIc4KJGuCq2WblahnkCTgTrQFSXIMm5r
 Zc8=
X-SBRS: 2.7
X-MesageID: 3431099
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3431099"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH 1/6] domain: stash xen_domctl_createdomain
 flags in struct domain
Thread-Index: AQHVQXCNE/ZRWIsbn0ecXdUI0phs+Kba8J0AgAAuXaA=
Date: Thu, 25 Jul 2019 10:11:10 +0000
Message-ID: <f19d582bd08c41a79cfe04bf72b8ef37@AMSPEX02CL03.citrite.net>
References: <20190723160609.2177-1-paul.durrant@citrix.com>
 <20190723160609.2177-2-paul.durrant@citrix.com>
 <20190725092242.m675tevc5wudzaw5@Air-de-Roger>
In-Reply-To: <20190725092242.m675tevc5wudzaw5@Air-de-Roger>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4gU2VudDogMjUgSnVseSAyMDE5IDEwOjIzCj4gVG86IFBhdWwg
RHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PjsgV2VpIExpdSA8d2xAeGVuLm9yZz47Cj4gS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQu
d2lsa0BvcmFjbGUuY29tPjsgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29t
PjsgQW5kcmV3Cj4gQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgSWFuIEphY2tz
b24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz47
Cj4gSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIDEvNl0gZG9t
YWluOiBzdGFzaCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiBmbGFncyBpbiBzdHJ1Y3QgZG9tYWlu
Cj4gCj4gT24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDU6MDY6MDRQTSArMDEwMCwgUGF1bCBEdXJy
YW50IHdyb3RlOgo+ID4gVGhlc2UgYXJlIGNhbm9uaWNhbCBzb3VyY2Ugb2YgZGF0YSB1c2VkIHRv
IHNldCB2YXJpb3VzIG90aGVyIGZsYWdzLiBJZgo+ID4gdGhleSBhcmUgYXZhaWxhYmxlIGRpcmVj
dGx5IGluIHN0cnVjdCBkb21haW4gdGhlbiB0aGUgb3RoZXIgZmxhZ3MgYXJlIG5vCj4gPiBsb25n
ZXIgbmVlZGVkLgo+ID4KPiA+IFRoaXMgcGF0Y2ggc2ltcGx5IGNvcGllcyB0aGUgZmxhZ3MgaW50
byBhIG5ldyAnY3JlYXRlZmxhZ3MnIGZpZWxkIGluCj4gPiBzdHJ1Y3QgZG9tYWluLiBTdWJzZXF1
ZW50IHBhdGNoZXMgd2lsbCBkbyB0aGUgcmVsYXRlZCBjbGVhbi11cCB3b3JrLgo+IAo+IFRoYW5r
cyEKPiAKPiBKdXN0IG9uZSBuYW1pbmcgY29tbWVudCAod2hpY2ggaXMgc3ViamVjdCB0byB0YXN0
ZSBJIGd1ZXNzKS4KPiAKPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBi
L3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCj4gPiBpbmRleCBiNDBjOGZkMTM4Li5lZGFlMzcyYzJi
IDEwMDY0NAo+ID4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKPiA+ICsrKyBiL3hlbi9p
bmNsdWRlL3hlbi9zY2hlZC5oCj4gPiBAQCAtMzA4LDYgKzMwOCw3IEBAIGVudW0gZ3Vlc3RfdHlw
ZSB7Cj4gPgo+ID4gIHN0cnVjdCBkb21haW4KPiA+ICB7Cj4gPiArICAgIHVuc2lnbmVkIGludCAg
ICAgY3JlYXRlZmxhZ3M7Cj4gCj4gQ2FuIHlvdSBuYW1lIHRoaXMganVzdCBmbGFncyBvciBvcHRp
b25zIG9yIHNvbWUgc3VjaCAod2l0aG91dCB0aGUKPiBjcmVhdGUgcHJlZml4KS4gSU1PIGFkZGlu
ZyB0aGUgY3JlYXRlIHByZWZpeCBtYWtlcyBpdCBsb29rIGxpa2UgYQo+IGZpZWxkIG9ubHkgdXNl
ZCBkdXJpbmcgZG9tYWluIGNyZWF0aW9uLCB3aGlsZSBpdCdzIG5vdCB0aGUgY2FzZS4KCkkgZ3Vl
c3MgbmFtaW5nIGl0IHNpbXBseSAnZmxhZ3MnIHdvdWxkIGJlIG9rIGNvdXBsZWQgd2l0aCBhIGNv
bW1lbnQgaW4gdGhlIGhlYWRlciBzdGF0aW5nIHRoYXQgdGhlIGZpZWxkIGlzIG1lcmVseSBhIGNv
cHkgb2YgdGhlIGRvbWFpbiBjcmVhdGUgZmxhZ3MuIEFueW9uZSBlbHNlIGdvdCBvcGluaW9ucyBv
biB0aGlzPwoKICBQYXVsCgo+IAo+IFRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB9511E51D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 15:00:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iflSs-00010i-P6; Fri, 13 Dec 2019 13:58:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GgWl=2D=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iflSr-00010c-Hy
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 13:58:41 +0000
X-Inumbo-ID: aa508a03-1db0-11ea-8f0c-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa508a03-1db0-11ea-8f0c-12813bfff9fa;
 Fri, 13 Dec 2019 13:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576245520;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/DY5reNwSRT+C4FT7AtIBApOU5aVP02ORNYmNYDBT9c=;
 b=JIT1nMe580xuP/6JTQ15nBT+njxta/+6c65C0a1B29OVZUVSchHiTJfp
 Iatem9uMBmOhIA6Ix19XJIn3oshJZlspjBP0U0dxKQyvfkc4fiv3DWfHG
 xC/Si62cslIFOiA00LNEqmb6azFnWxA0OcVTpqLN/ljzbfwj/yA+UjnNa U=;
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
IronPort-SDR: SBKcaLHdM51DRuKMV18atOuM2YMiUfT0bh0KljEBG6Dg5ZAJndL8e0UEq9DLxFddUsZsSEtmBe
 x4SRF1KnGimyL3sGPWkUUviKgm/S5/atzKahT5MScFvBa+rP2So/uTyoOODrE+oP1XkYr+dyUj
 2qFP/9uZYcaAfLIDuoUxK5BhE5/Pib0iY2WxdEEj7mghvslTV+sooftOVgSiMTqjRNX5PKgqTT
 f9dPIITomDyYVuErm80/jim1a+gQzJkfXC43j6UEBCG/T14cLOBC87LIGaUyvm4+JvfMeLC4g3
 9Zw=
X-SBRS: 2.7
X-MesageID: 10059950
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; d="scan'208";a="10059950"
From: George Dunlap <George.Dunlap@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Thread-Topic: [PATCH 2/4] x86/mm: Implement common put_data_pages for
 put_page_from_l[23]e
Thread-Index: AQHVsRIc7vW8E7np+0OhnNRGrecSVKe22eOAgAEuCoA=
Date: Fri, 13 Dec 2019 13:58:38 +0000
Message-ID: <050BE227-674B-46F6-A685-337C495E057A@citrix.com>
References: <20191212173203.1692762-1-george.dunlap@citrix.com>
 <20191212173203.1692762-3-george.dunlap@citrix.com>
 <adebcf25-51d5-3f10-0910-e4fbabea8583@citrix.com>
In-Reply-To: <adebcf25-51d5-3f10-0910-e4fbabea8583@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3601.0.10)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <C6E975B1D049014EBA9C5501824327C0@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/4] x86/mm: Implement common put_data_pages
 for put_page_from_l[23]e
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gRGVjIDEyLCAyMDE5LCBhdCA3OjU3IFBNLCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDEyLzEyLzIwMTkgMTc6MzIsIEdl
b3JnZSBEdW5sYXAgd3JvdGU6DQo+PiBCb3RoIHB1dF9wYWdlX2Zyb21fbDJlIGFuZCBwdXRfcGFn
ZV9mcm9tX2wzZSBoYW5kbGUgaGF2aW5nIHN1cGVycGFnZQ0KPj4gZW50cmllcyBieSBsb29waW5n
IG92ZXIgZWFjaCBwYWdlIGFuZCAicHV0Ii1pbmcgZWFjaCBvbmUgaW5kaXZpZHVhbGx5Lg0KPj4g
QXMgd2l0aCBwdXR0aW5nIHBhZ2UgdGFibGUgZW50cmllcywgdGhpcyBjb2RlIGlzIGZ1bmN0aW9u
YWxseQ0KPj4gaWRlbnRpY2FsLCBidXQgZm9yIHNvbWUgcmVhc29uIGRpZmZlcmVudC4gIE1vcmVv
dmVyLCB0aGVyZSBpcyBhbHJlYWR5DQo+PiBhIGNvbW1vbiBmdW5jdGlvbiwgcHV0X2RhdGFfcGFn
ZSgpLCB0byBoYW5kbGUgYXV0b21hdGljYWxseSBzd2FwcGluZw0KPj4gYmV0d2VlbiBwdXRfcGFn
ZSgpIChmb3IgcmVhZC1vbmx5IHBhZ2VzKSBvciBwdXRfcGFnZV9hbmRfdHlwZSgpIChmb3INCj4+
IHJlYWQtd3JpdGUgcGFnZXMpLg0KPj4gDQo+PiBSZXBsYWNlIHRoaXMgd2l0aCBwdXRfZGF0YV9w
YWdlcygpIChwbHVyYWwpLCB3aGljaCBkb2VzIHRoZSBlbnRpcmUNCj4+IGxvb3AsIGFzIHdlbGwg
YXMgdGhlIHB1dF9wYWdlIC8gcHV0X3BhZ2VfYW5kX3R5cGUgc3dpdGNoLg0KPj4gDQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+DQo+PiAt
LS0NCj4+IE5CIHRoYXQgSSd2ZSB1c2VkIHRoZSAic2ltcGxlIGZvciBsb29wIiB2ZXJzaW9uIHRv
IG1ha2UgaXQgZWFzeSB0byBzZWUNCj4+IHdoYXQncyBnb2luZyBvbiwgcmF0aGVyIHRoYW4gdGhl
ICJkbyB7IH0gd2hpbGUoKSIgdmVyc2lvbiB3aGljaCB1c2VzICYNCj4+IGFuZCBjb21wYXJlIHRv
IHplcm8gcmF0aGVyIHRoYW4gY29tcGFyaW5nIHRvIHRoZSBtYXguDQo+IA0KPiBTbyB3aGlsZSBJ
IHRoaW5rIHRoZSBjaGFuZ2UgaXMgYW4gaW1wcm92ZW1lbnQsIGFuZCBhcmUgZmluZSBhcw0KPiBw
cmVzZW50ZWQsIEknbSAtMSB0b3dhcmRzIGl0IG92ZXJhbGwuDQo+IA0KPiBJIGFtIGdvaW5nIHRv
IG9uY2UgYWdhaW4gZXhwcmVzcyBteSBmaXJtIG9waW5pb24gdGhhdCB0aGUgcmVtYWluaW5nIHVz
ZQ0KPiBvZiBQViBzdXBlcnBhZ2VzIGRvIGZhciBtb3JlIGhhcm0gdGhhbiBnb29kLCBhbmQgc2hv
dWxkIGJlIHJlbW92ZWQNCj4gY29tcGxldGVseS4NCj4gDQo+IFdlIGNvbnN0cnVjdCBkb20wIHdp
dGggc29tZSBzdXBlcnBhZ2VzIGZvciBpdHMgcDJtIGFuZC9vciBpbml0cmQuDQo+IA0KPiBUaGlz
IHR1cm5lZCBvdXQgdG8gYmUgdGhlIGlzc3VlIGJlaGluZCBwdi1sMXRmIGJyZWFraW5nIGZvciBk
b20wIChjL3MNCj4gOTZmNmVlMTVhZDdjKSwgYW5kIHdoeSB3ZSBoYWQgdG8gc2hpcCBYU0EtMjcz
IGluIGFuIGluc2VjdXJlDQo+IGNvbmZpZ3VyYXRpb24gKGFuZCBJJ2QgbGlrZSB0byBwb2ludCBv
dXQgdGhhdCBYZW4gaXMgc3RpbGwgaW4gYW4NCj4gaW5zZWN1cmUgY29uZmlndXJhdGlvbiBieSBk
ZWZhdWx0LikNCj4gDQo+IFRoZXJlIGlzIGEgc3RpbGwtb3V0c3RhbmRpbmcgaXNzdWUgd2l0aCBn
cmFudCBtYXAgYnkgbGluZWFyIGFkZHJlc3Mgb3Zlcg0KPiBhIHN1cGVycGFnZSB3aGVyZSB0aGlu
Z3MgbWFsZnVuY3Rpb24sIGFuZCB0aGUgb25seSByZWFzb24gdGhpcyBkb2Vzbid0DQo+IGhhdmUg
YW4gWFNBIGlzIHRoYXQgaXQgaXMgYmVsaWV2ZWQgdG8gYmUgcmVzdHJpY3RlZCB0byBkb20wIG9u
bHkuDQo+IA0KPiBGaW5hbGx5LCBhbiBMM19TSElGVCBsb29wIGlzIGEgbG9uZyBydW5uaW5nIG9w
ZXJhdGlvbiB3aGljaCB3ZSBjYW4ndCBwdXQNCj4gYSBjb250aW51YXRpb24gaW50byB0aGUgbWlk
ZGxlIG9mLCBhbmQgSSBiZXQgdGhlcmUgYXJlIGZ1biB0aGluZ3Mgd2hpY2gNCj4gY2FuIGJlIGRv
bmUgdGhlcmUgaW4gdGhlIGdlbmVyYWwgY2FzZS4NCj4gDQo+IFNlZWluZyBhcyBQViBndWVzdHMg
ZGVjb21wcmVzcyBhbmQgZnJlZSB0aGUgaW5pdHJkLCBhbmQgcmVwb3NpdGlvbnMgdGhlDQo+IHAy
bSwgbm9uZSBvZiB0aGVzZSBzdXBlcnBhZ2VzIHRlbmQgdG8gc3Vydml2ZSBwb3N0IGJvb3QsIHNv
IEkgYW0NCj4gY3VycmVudGx5IHVuY29udmluY2VkIHRoYXQgYSBwZXJmIGltcHJvdmVtZW50IHdv
dWxkIGJlIGFueXRoaW5nIGJ1dA0KPiBtYXJnaW5hbC4NCj4gDQo+IEkgY2VydGFpbmx5IGRvbid0
IHRoaW5rIGl0IGlzIHdvcnRoIHRoZSBjb21wbGV4aXR5IGFuZCBjb3JuZXIgY2FzZXMgaXQNCj4g
Y2F1c2VzIGlzIFhlbi4NCg0KVGhhdCBhbGwgc291bmRzIHJlYXNvbmFibGUsIGJ1dCBJIGRvbuKA
mXQgcmVhbGx5IGtub3cgYW55dGhpbmcgYWJvdXQgUFYgc3VwZXJwYWdlcyBpbiBYZW4gYXQgdGhl
IG1vbWVudCAoaW4gZmFjdCBJIHNvcnQgb2Ygd29uZGVyZWQgd2hhdCB0aGlzIGNvZGUgd2FzIGFi
b3V0KS4NCg0KSeKAmWQgcmVjb21tZW5kIHRha2luZyB0aGlzIHBhdGNoIGFzLWlzLCBhbmQg4oCc
c29tZW9uZeKAnSBjYW4gcHV0IGl0IG9uIHRoZWlyIGxpc3QgdG8gZ2V0IHJpZCBvZiB0aGUgUFYg
c3VwZXJwYWdlcyBsYXRlci4gIFRoZSBhbHRlcm5hdGUgaXMgSSBkcm9wIHRoaXMgcGF0Y2ggZnJv
bSB0aGUgc2VyaWVzIGFuZCDigJxzb21lb25lIiBwdXRzIHRoZSBQViBzdXBlcnBhZ2UgcmVtb3Zh
bCBvbiB0aGVpciBsaXN0IHRvIGRvIGxhdGVyLg0KDQooTXkgbWluZCBpcyBhbHNvIGludm9sdW50
YXJpbHkgY2h1cm5pbmcgdGhyb3VnaCBvcHRpb25zIHRvIHJlZ3VsYXJpemUgc3VwZXJwYWdlIHBy
b21vdGlvbiBhbmQgZGVtb3Rpb24uKQ0KDQogLUdlb3JnZQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs

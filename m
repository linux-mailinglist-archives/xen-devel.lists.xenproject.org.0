Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1B385676
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 01:29:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvVKl-0002ct-Kx; Wed, 07 Aug 2019 23:27:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=besu=WD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hvVKk-0002co-F8
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 23:27:06 +0000
X-Inumbo-ID: dd66265e-b96a-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dd66265e-b96a-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 23:27:04 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WFXb8TYJ6vJS/RWJYXEMY7xF4CB9KAh2+8L+ZopPzWA1y/mRBN6syCpe/0LV0vqw2MgaakuwTy
 +ekn1yDwwwrVkWWWdqOsaHJ2Lb+vaxl2y9CFwM1eMsaus+qDZobnsFxOT5y4a5BUrmLnkK2Dof
 n2WwRaoQ09Pj5q0JAXdYAbL96THIgrWf2iWjveSt2gZyM/lImAmN/WEHOoOmvX4k+U0i/z7THF
 xu2Z0wkmfzeY2Ca0erTtB0r2ju+0bSEo9mE4zCo7icjcwGwwdhngTRCwqzq3U3JmEZy0Cs3rOk
 uis=
X-SBRS: 2.7
X-MesageID: 4000584
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,358,1559534400"; 
   d="scan'208";a="4000584"
To: Hans van Kranenburg <hans@knorrie.org>, Xen-devel
 <xen-devel@lists.xenproject.org>
References: <20190807194143.1351-1-andrew.cooper3@citrix.com>
 <79b02f4c-f9a6-ec7d-2c3c-f30d14d4891b@knorrie.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <3a9f720b-ab76-37f1-0063-d63905fdbee3@citrix.com>
Date: Thu, 8 Aug 2019 00:25:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <79b02f4c-f9a6-ec7d-2c3c-f30d14d4891b@knorrie.org>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] docs/sphinx: Introduction
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
Cc: Lars Kurth <lars.kurth@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDgvMjAxOSAyMzo0OSwgSGFucyB2YW4gS3JhbmVuYnVyZyB3cm90ZToKPiBIaSwgKGRy
b3BwZWQgbW9zdCBvZiB0aGUgQ2M6KQo+Cj4gT24gOC83LzE5IDk6NDEgUE0sIEFuZHJldyBDb29w
ZXIgd3JvdGU6Cj4+IFB1dCB0b2dldGhlciBhbiBpbnRyb2R1Y3Rpb24gcGFnZSBmb3IgdGhlIFNw
aGlueC9SU1QgZG9jcywgYWxvbmcgd2l0aCBhCj4+IGdsb3NzYXJ5IHdoaWNoIHdpbGwgYWNjdW11
bGF0ZSBvdmVyIHRpbWUuCj4+IFsuLi5dCj4gSSd2ZSBiZWVuIHVzaW5nIFhlbiBmb3IgMTMrIHll
YXJzIG5vdywgc28gSSdtIG5vdCByZWFsbHkgYWJsZSB0byBwcm92aWRlCj4gZmVlZGJhY2sgYWJv
dXQgaG93IHNvbWVvbmUgbmV3IHRvIGl0IHdvdWxkIGV4cGVyaWVuY2UgdGhpbmdzLgo+Cj4gQnV0
LCBJIHRoaW5rIHRoZXJlJ3Mgc29tZSBmZWVkYmFjayBJIGNhbiBwcm92aWRlLgo+Cj4gVGhlIGZp
cnN0IHBhZ2UsIGFkbWluLWd1aWRlL2ludHJvZHVjdGlvbiBpcyB2ZXJ5IHdlbGwgd3JpdHRlbiwg
aXQncwo+IHNob3J0IGFuZCBpdCBzZXRzIGEgdmVyeSBnb29kIGZyYW1lIG9mIHJlZmVyZW5jZS4g
S2VlcCBpdCBsaWtlIHRoaXMuCgpJIHRoaW5rIHRoZXJlIGFyZSBhIGZldyBvdGhlciB0aGluZ3Mg
aXQgc2hvdWxkIGNvdmVyLsKgIEEgdmVyeSBicmllZgpoaXN0b3J5IG9mIFhlbidzIG1ham9yIG1p
bGVzdG9uZXMsIGJ1dCBJIHdhcyBwbGFubmluZyB0byBrZWVwIHRoYXQgdG8gYQpwYXJhZ3JhcGgg
b2YgdHdvLsKgIChXaGVuIFhlbiBzdGFydGVkLCBQViBndWVzdHMgYmVpbmcgbW9kaWZpZWQgdG8g
a25vdwphYm91dCBYZW4sIEhWTSBndWVzdHMgd2l0aCBoYXJkd2FyZSB2aXJ0IHNvIHdlIGNvdWxk
IHJ1biB3aW5kb3dzLCB0aGVuCmV4cGFuZGluZyBpbnRvIEFSTSArIGhhcmR3YXJlIHZpcnQpLgoK
PiBXaGVuIHdyaXRpbmcgZG9jdW1lbnRhdGlvbiwgeW91J3JlIG5vdCBvbmx5IHByb3ZpZGluZyBp
bmZvcm1hdGlvbi4gWW91Cj4gY2FuICJzdGVlciIgYSBsb3Qgb2YgdGhpbmdzLiBCeSBjb25zY2lv
dXNseSBkZWNpZGluZyBhYm91dCB0aGUgZXhhY3QKPiB0ZWNobmljYWwgbGV2ZWwgb2Ygc3R1ZmYg
dGhhdCB5b3UgcHJvdmlkZSBvbiB0aGUgImZyb250IHBhZ2UiLCB5b3UnbGwKPiBhdXRvbWF0aWNh
bGx5IGNhdXNlIGEgc2VsZWN0aW9uIG9mIGF1ZGllbmNlIHRoYXQgeW91IHdhbnQgdG8gc3RheSBv
cgo+IHdhbnQgdG8gYnJvd3NlL3NjYXJlIGF3YXkgYmVjYXVzZSBpdCdzIG5vdCBmb3IgdGhlbS4K
Pgo+IEFuZCwgSSB0aGluayB0aGlzIGZpcnN0IGludHJvZHVjdGlvbiBwYWdlIGV4YWN0bHkgZG9l
cyB0aGF0LCBidXQgSSB0aGlzCj4gaXMgd2hlcmUgSSdtIG9mIGNvdXJzZSBiaWFzZWQuCgoiZG9l
cyBleGFjdGx5IHRoYXQiID0+IHlvdSBtZWFuIHNjYXJlIHBlb3BsZSBhd2F5PyA6KQoKWWVzIC0g
Z2V0dGluZyB0aGUgcmlnaHQgbGV2ZWwgb2YgZGV0YWlsIGhlcmUgaXMgY3JpdGljYWwsIGFuZCBp
cyBnb2luZwp0byBuZWVkIG91dHNpZGUgZmVlZGJhY2suCgo+IEkgdGhpbmsgaXQgd2lsbCAid29y
ayIgZm9yIGEgbmV3IHVzZXIgd2hvCj4gYWxyZWFkeSBrbm93cyB3aGF0IGEgTklDIGFuZCBhIEtl
cm5lbCBpcywgYW5kIGl0IHdpbGwgd29yayBmb3IgYW4KPiBpbnRlcmVzdGVkIGRldmVsb3Blciwg
bG9va2luZyB0byBoZWxwIGZpZ3VyaW5nIG91dCB0byBnZXQgaXQgcnVubmluZyBvbgo+ICR3aGF0
ZXZlciBoYXJkd2FyZSBub3QgZnVsbHkgc3VwcG9ydGVkLgo+Cj4gVGhlIG90aGVyIHBhZ2VzIGFs
cmVhZHkgYXZhaWxhYmxlIHNlZW0gdG8gYmUgZGV2ZWxvcGVyIGRvY3VtZW50YXRpb24KPiBpbnN0
ZWFkIG9mIHVzZXIgZG9jdW1lbnRhdGlvbi4KCkl0IGlzIGEgcmFuZG9tIG1peCBvZiBzbWFsbCB0
YXNrcyB3aGljaCBJJ3ZlIG1hbmFnZWQgdG8gZ2V0IGRvbmUgaW4gbXkKZGlzdGluY3RseSBuZWdh
dGl2ZSBmcmVlIHRpbWUuCgpUaGUgZm9jdXMgaXMgZmlyc3QgYW5kIGZvcmVtb3N0IG9uIGhpZ2gt
cXVhbGl0eSBkb2N1bWVudGF0aW9uLCBhbmQgSSBhbQpmdWxseSBleHBlY3RpbmcgdG8gaGF2ZSB0
byBzaHVmZmxlIHRoZSBleGFjdCBzdHJ1Y3R1cmUgYW5kIGxheW91dCBhcyBpdApnYWlucyBtb3Jl
IGNvbnRlbnQgYW5kIGl0IGlzIGVhc2llciB0byBzcG90IHdoZXJlIHRoZSBsb2dpY2FsIGRpdmlz
aW9ucyBsaWUuCgpGb3Igbm93LCB0aGUgcGFyYWdyYXBocyBvbiB0aGUgZnJvbnQgcGFnZSBhcmUg
bXkgYmVzdCBndWVzdGltYXRlIG9mIGhvdwp0byBzdHJ1Y3R1cmUgaXQsIGJ1dCB0aGV5IGFyZSBi
eSBubyBtZWFucyBzZXQgaW4gc3RvbmUuCgo+IE9uZSBvZiB0aGUgdGhpbmdzIG9uIG15IHdpc2hs
aXN0IGlzIHRvIGhlbHAgY2xlYW5pbmcgdXAgdGhlIGVuZCB1c2VyCj4gZG9jdW1lbnRhdGlvbiBm
b3IgWGVuLiBYZW4gaXRzZWxmIGhhcyBhIHdpa2kgd2l0aCBhIGxvdCBvZiBob3JyaWJsZQo+IG91
dGRhdGVkIGluZm9ybWF0aW9uLCB0aGVyZSdzIGEgRGViaWFuIHdpa2kgd2l0aCBldmVuIG1vcmUg
aG9ycmlibGUKPiBvdXRhdGVkIGluZm9ybWF0aW9uLCBhbmQgc28gb24uIEFzIGEgbmV3IHVzZXIs
IHlvdSBjb21wbGV0ZWx5IGdldCBsb3N0Cj4gYmVjYXVzZSB5b3UgaGF2ZSBubyBpZGVhIHdoYXQn
cyBzdGlsbCByZWxldmFudCBvciBub3QuIEl0J3MgYSBzaGFtZSB0aGF0Cj4gd2UgbG9zZSBwb3Rl
bnRpYWwgbmV3IHVzZXJzIGZvciB3aGljaCB0aGUgcHJvZHVjdCB3b3VsZCBiZSBhIGdvb2QgZml0
Cj4gYmVjYXVzZSBvZiB0aGF0Lgo+Cj4gKFdpdGggYSBncm91cCBvZiBtb3RpdmF0ZWQgcGVvcGxl
LCBhIGZldyB3aXRoIHRlY2huaWNhbCBrbm93bGVkZ2UgYW5kIGEKPiBmZXcgd2l0aCBkZWNlbnQg
dGVjaC4gd3JpdGVyIHNraWxscyB3ZSBjb3VsZCBkbyBhICJzcHJpbnQiIGdldHRpbmcgc29tZQo+
IGJpZyBoYW1tZXJzIGFuZCBjaGFpbnNhd3Mgb3V0IHRvIGRvIHNvbWUgaHVnZSBzcHJpbmcgY2xl
YW5pbmcgYW5kCj4gcmVzdHJ1Y3R1cmUgaXQuKSBBIHdpa2kgaXMgYSBncmVhdCBzb2x1dGlvbiBm
b3Igc2hvcnQtdGVybSBsb3ctYmFycmllcgo+IGdhdGhlcmluZyBvZiBpbmZvcm1hdGlvbiBieSBh
bnlvbmUsIGJ1dCBpbiB0aGUgbG9uZyB0ZXJtIGl0J3MganVzdCBhIGJpZwo+IGFjY3VtdWxhdGlv
biBvZiBjcnVmdCB3aXRob3V0IGEgY2xlYXIgbWFpbnRhaW5lci4KPgo+IEluc3RlYWQgb2YgZnVs
bHkgc3RhcnRpbmcgdG8gaGlqYWNrIHRoaXMgdGhyZWFkIG5vdywgbXkgbGFzdCBmZWVkYmFjawo+
IHdvdWxkIGJlOiBpbiB5b3VyIGdpdCBjb21taXQgbWVzc2FnZSwgeW91IGRvbid0IG1lbnRpb24g
d2hhdCB5b3VyIHRhcmdldAo+IGF1ZGllbmNlIGlzLiBJJ20gaW50ZXJlc3RlZCB0byBoZWFyIHdo
YXQgaXQgaXMuCgpUaGlzIHBhZ2UgaXMgYWltZWQgYXQgcGVvcGxlIHdobyBoYXZlIG5vIGtub3ds
ZWRnZSBvZiBYZW4uwqAgSSBkb24ndApleHBlY3QgcGVvcGxlIHdobyByb3V0aW5lbHkgd29yayBv
biBYZW4gdG8gcmVhZCBpdCBtb3JlIHRoYW4gb25jZS4KCkhvd2V2ZXIsIEkgYWxzbyBkb24ndCB0
aGluayB0aGF0IGhlcmUgaXMgYW4gYXBwcm9wcmlhdGUgcGxhY2UgdG8gY292ZXIKIm15IGZpcnN0
IGludHJvZHVjdGlvbiB0byBhIGNvbXB1dGVyIi7CoCBJZiB3ZSB3ZXJlIHRvIGFpbSBhdCB0aGF0
IGxldmVsLApub29uZSB3b3VsZCByZWFkIGl0IC0gaXRzIHRvbyBoaWdoIGxldmVsIGZvciBhbnlv
bmUgd2hvIGtub3dzIHdoYXQgYQprZXJuZWwgaXMsIGFuZCBYZW4gaXMgZmFyIHRvbyBuaWNoZSBm
b3IgYW55b25lIHdobyBkb2Vzbid0IGtub3cgd2hhdCBhCmtlcm5lbCBpcyB0byBmaW5kLgoKQWdh
aW4sIEkgd291bGQgd2VsY29tZSBmZWVkYmFjayBoZXJlIG9uIGV4YWN0bHkgd2hhdCBsZXZlbCB3
ZSBzaG91bGQgYWltCiJteSBmaXJzdCBpbnRyb2R1Y3Rpb24gdG8gWGVuIiBhdC4KCkFzIGZvciB0
aGUgbG9uZ3Rlcm0gZ29hbCBvZiB0aGUgZG9jcywgSSBkbyBzdGFuZCBieSBteSBpbml0aWFsIGd1
ZXN0aW1hdGUuCgoxKSBUaGUgYWRtaW4gZ3VpZGUgZm9yIHBlb3BsZSB3aG8gYXJlbid0IHByb2dy
YW1tZXJzIGJ1dCB3YW50IHRvIHJ1biBhClhlbiBzeXN0ZW0uCjIpIFRoZSBndWVzdCBndWlkZSBm
b3IgcGVvcGxlIHdhbnRpbmcgdG8gZGV2ZWxvcCBhZ2FpbnN0IG91ciBBQkkvQVBJcy4KMykgVGhl
IGRldmVsb3BlciBndWlkZSBmb3IgcGVvcGxlIGhhY2tpbmcgb24gdGhlIGNvbnRlbnQgb2YgeGVu
LmdpdAoKMiBhbmQgMyBoYXZlIGEgZmFpciBvdmVybGFwLCBidXQgSSB0aGluayBpdCBpcyBpbXBv
cnRhbnQgdG8ga2VlcCB0aGVtCmRpc3RpbmN0LsKgIDIgd2lsbCBpbmNsdWRlIHRoaW5ncyBsaWtl
IGh5cGVyY2FsbCBhbmQgbGlicmFyeSBBUEkvQUJJCnJlZmVyZW5jZXMsIHdoZXJlYXMgMyBpcyB0
aGUgb25seSBwbGFjZSBJJ2QgZXhwZWN0IHRvIHNlZSBpbmZvcm1hdGlvbiBvbgpob3cgWGVuIGRv
ZXMgbWVtb3J5IG1hbmFnZW1lbnQsIG9yIGJyZWFrZG93bnMgb2YgaG93IHRoZSBib290IHBhdGhz
CndvcmssIGV0Yy4KCkFzIEkgc2FpZCAtIGV2ZXJ5dGhpbmcgaXMgc3ViamVjdCB0byBpbXByb3Zl
bWVudCBhcyB0aGUgY29udGVudCBncm93cy7CoApJIGNhcmUgZmFyIG1vcmUgdGhhdCB3ZSBlbmQg
dXAgd2l0aCBoaWdoIHF1YWxpdHksIGNvaGVyZW50CmRvY3VtZW50YXRpb24sIHRoYW4gaXQgZW5k
aW5nIHVwIGxvb2tpbmcgZXhhY3RseSBhcyBJIHByZWRpY3RlZCBhdCBzb21lCnBvaW50IGluIHRo
ZSBwYXN0LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==

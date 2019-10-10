Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD21D2917
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 14:17:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIXJj-0005hf-Hv; Thu, 10 Oct 2019 12:13:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t5VA=YD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iIXJi-0005ha-OO
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 12:13:14 +0000
X-Inumbo-ID: 54f75ae4-eb57-11e9-8c93-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54f75ae4-eb57-11e9-8c93-bc764e2007e4;
 Thu, 10 Oct 2019 12:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570709594;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QbFBIB8h5vDRmh/2pjCg6vvaiRxylk93ufhijJBsJ50=;
 b=QSHDtkuGG9p6N4M1C0ayYBRwOibfphBkj2S8hpt7xGe301Y4AgZEGrvN
 poGXp0Ln1YpPj7OHUue878gF26PDbvbaLP5g5O3zKRKsyZc98unpBX6ua
 R9uwFbdyEgqQcF9IHx6oC0tUqMq7agpECFCCBXxThak1EoSgCBaGp6L6W 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: O5f4rQ7S3Kn4hAGJkC76G5ukpqzsLEYhtf6F19U4/N9P208rSVmN/3USCFwAbTOoxnokFNi8ix
 nlgwrjBpYI6w+ybqjQQJt/jzBeuVMNob2xWG5ECylUW23aIjogAuoI4nHWqfbzd6/10yoSUflD
 mdiAWZwOs0waB0l8duH6mcW0yhY3l6KxME2yDTmPl7SZ+qrhNqdQ3BqkKSiJZ+EWEId4x3DukF
 BkWpSYL/CpNe/+G6l8mOhWEKPpnnf5OB8eeIt36UYiWB4Pd1emzTsV2bgpgTaCm+2ZR23dIPEV
 4aQ=
X-SBRS: 2.7
X-MesageID: 6708739
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,280,1566878400"; 
   d="scan'208";a="6708739"
Date: Thu, 10 Oct 2019 14:13:02 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191010121302.GF1389@Air-de-Roger.citrite.net>
References: <20191010113345.6867-1-roger.pau@citrix.com>
 <20191010113345.6867-2-roger.pau@citrix.com>
 <b1e9fac5-a476-638c-e550-c179146ecf7f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b1e9fac5-a476-638c-e550-c179146ecf7f@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 1/2] x2APIC: translate IO-APIC entries
 when enabling the IOMMU
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDE6NTQ6MDZQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTAuMTAuMjAxOSAxMzozMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gV2hl
biBpbnRlcnJ1cHQgcmVtYXBwaW5nIGlzIGVuYWJsZWQgYXMgcGFydCBvZiBlbmFibGluZyB4MkFQ
SUMgdGhlCj4gCj4gUGVyaGFwcyAidW5tYXNrZWQiIGluc3RlYWQgb2YgInRoZSI/Cj4gCj4gPiBJ
Ty1BUElDIGVudHJpZXMgYWxzbyBuZWVkIHRvIGJlIHRyYW5zbGF0ZWQgdG8gdGhlIG5ldyBmb3Jt
YXQgYW5kIGFkZGVkCj4gPiB0byB0aGUgaW50ZXJydXB0IHJlbWFwcGluZyB0YWJsZS4KPiA+IAo+
ID4gVGhpcyBwcmV2ZW50cyBJT01NVSBpbnRlcnJ1cHQgcmVtYXBwaW5nIGZhdWx0cyB3aGVuIGJv
b3Rpbmcgb24KPiA+IGhhcmR3YXJlIHRoYXQgaGFzIHVubWFza2VkIElPLUFQSUMgcGlucy4KPiAK
PiBCdXQgaW4gdGhlIGVuZCBpdCBvbmx5IHBhcGVycyBvdmVyIHdoYXRldmVyIHRoZSBzcHVyaW91
cyBpbnRlcnJ1cHRzCj4gcmVzdWx0IGZvcm0sIGRvZXNuJ3QgaXQ/IFdoaWNoIGlzbid0IHRvIHNh
eSB0aGlzIGlzbid0IGFuCj4gaW1wcm92ZW1lbnQuIENhbGxpbmcgb3V0IHRoZSBFeHRJbnQgY2Fz
ZSBoZXJlIG1heSBiZSB3b3J0aHdoaWxlIGFzCj4gd2VsbCwgYXMgd291bGQgYmUgcG9pbnRpbmcg
b3V0IHRoYXQgdGhpcyBjYXNlIHN0aWxsIHdvbid0IHdvcmsgb24KPiBBTUQgSU9NTVVzLgoKQnV0
IHRoZSBmaXggZm9yIHRoZSBFeHRJTlQgQU1EIGlzc3VlIHNob3VsZCBiZSBkb25lIGluCmFtZF9p
b21tdV9pb2FwaWNfdXBkYXRlX2lyZSB0aGVuLCBzbyB0aGF0IGl0IGNhbiBwcm9wZXJseSBoYW5k
bGUKRXh0SU5UIGRlbGl2ZXJ5IG1vZGUsIG5vdCB0byB0aGlzIHBhcnQgb2YgdGhlIGNvZGUuIEkg
d2lsbCBsb29rCmludG8gaXQsIGJ1dCBJIHRoaW5rIGl0J3Mga2luZCBvZiB0YW5nZW50aWFsIHRv
IHRoZSBpc3N1ZSBoZXJlLgoKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9hcGljLmMKPiA+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9hcGljLmMKPiA+IEBAIC01MTUsNyArNTE1LDcgQEAgc3RhdGljIHZvaWQg
cmVzdW1lX3gyYXBpYyh2b2lkKQo+ID4gICAgICBpb21tdV9lbmFibGVfeDJhcGljKCk7Cj4gPiAg
ICAgIF9fZW5hYmxlX3gyYXBpYygpOwo+ID4gIAo+ID4gLSAgICByZXN0b3JlX0lPX0FQSUNfc2V0
dXAoaW9hcGljX2VudHJpZXMpOwo+ID4gKyAgICByZXN0b3JlX0lPX0FQSUNfc2V0dXAoaW9hcGlj
X2VudHJpZXMsIHRydWUpOwo+ID4gICAgICB1bm1hc2tfODI1OUEoKTsKPiA+ICAKPiA+ICBvdXQ6
Cj4gPiBAQCAtOTYxLDcgKzk2MSwxMiBAQCB2b2lkIF9faW5pdCB4MmFwaWNfYnNwX3NldHVwKHZv
aWQpCj4gPiAgICAgICAgICBwcmludGsoIlN3aXRjaGVkIHRvIEFQSUMgZHJpdmVyICVzXG4iLCBn
ZW5hcGljLm5hbWUpOwo+ID4gIAo+ID4gIHJlc3RvcmVfb3V0Ogo+ID4gLSAgICByZXN0b3JlX0lP
X0FQSUNfc2V0dXAoaW9hcGljX2VudHJpZXMpOwo+ID4gKyAgICAvKgo+ID4gKyAgICAgKiBOQjog
ZG8gbm90IHVzZSByYXcgbW9kZSB3aGVuIHJlc3RvcmluZyBlbnRyaWVzIGlmIHRoZSBpb21tdSBo
YXMgYmVlbgo+ID4gKyAgICAgKiBlbmFibGVkIGR1cmluZyB0aGUgcHJvY2VzcywgYmVjYXVzZSB0
aGUgZW50cmllcyBuZWVkIHRvIGJlIHRyYW5zbGF0ZWQKPiA+ICsgICAgICogYW5kIGFkZGVkIHRv
IHRoZSByZW1hcHBpbmcgdGFibGUgaW4gdGhhdCBjYXNlLgo+ID4gKyAgICAgKi8KPiA+ICsgICAg
cmVzdG9yZV9JT19BUElDX3NldHVwKGlvYXBpY19lbnRyaWVzLCAheDJhcGljX2VuYWJsZWQpOwo+
IAo+IEhvdyBpcyB0aGlzIGRpZmZlcmVudCBpbiB0aGUgcmVzdW1lX3gyYXBpYygpIGNhc2U/IFRo
ZSBJT01NVSBnZXRzCj4gZW5hYmxlZCBpbiB0aGUgY291cnNlIG9mIHRoYXQgYXMgd2VsbC4gSS5l
LiBJJ2QgZXhwZWN0IHlvdSB3YW50Cj4gdG8gcGFzcyAiZmFsc2UiIHRoZXJlLCBub3QgInRydWUi
LgoKSW4gdGhlIHJlc3VtZV94MmFwaWMgY2FzZSBpbnRlcnJ1cHQgcmVtYXBwaW5nIHNob3VsZCBh
bHJlYWR5IGJlCmVuYWJsZWQgb3Igbm90LCBidXQgdGhhdCBmdW5jdGlvbiBpcyBub3QgZ29pbmcg
dG8gZW5hYmxlIGludGVycnVwdApyZW1hcHBpbmcgaWYgaXQgd2Fzbid0IGVuYWJsZWQgYmVmb3Jl
LCBoZW5jZSB0aGUgSU8tQVBJQyBlbnRyaWVzCnNob3VsZCBhbHJlYWR5IGJlIHVzaW5nIHRoZSBp
bnRlcnJ1cHQgcmVtYXBwaW5nIHRhYmxlIGFuZCBubwp0cmFuc2xhdGlvbiBpcyBuZWVkZWQuCgo+
IEFsc28gaG93IHdvdWxkICJ4MmFwaWNfZW5hYmxlZCIgcmVmbGVjdCB0aGUgdHJhbnNpdGlvbj8g
SXQgbWF5Cj4gaGF2ZSBiZWVuICJ0cnVlIiBhbHJlYWR5IGJlZm9yZSBlbnRlcmluZyB0aGUgZnVu
Y3Rpb24gaGVyZS4KCklmIHgyYXBpY19lbmFibGVkID09IHRydWUgYXQgdGhlIHBvaW50IHdoZXJl
IHJlc3RvcmVfSU9fQVBJQ19zZXR1cAppcyBjYWxsZWQgaW50ZXJydXB0IHJlbWFwcGluZyBtdXN0
IGJlIGVuYWJsZWQsIGJlY2F1c2UgQUZBSUNUIGF0IHRoaXMKcG9pbnQgaXQncyBub3QgcG9zc2li
bGUgdG8gaGF2ZSB4MmFwaWNfZW5hYmxlZCA9PSB0cnVlIGFuZCBpbnRlcnJ1cHQKcmVtYXBwaW5n
IGRpc2FibGVkLgoKVGhlIGlzc3VlIEkgY2FuIHNlZSBoZXJlIGlzIHdoYXQgaGFwcGVucyBpZiBp
bnRlcnJ1cHQgcmVtYXBwaW5nIHdhcwphbHJlYWR5IGVuYWJsZWQgYnkgdGhlIGhhcmR3YXJlLCBh
bmQgZW50cmllcyBpbiB0aGUgSU8tQVBJQyBhcmUKYWxyZWFkeSB1c2luZyB0aGUgcmVtYXBwaW5n
IHRhYmxlLiBJIHdvdWxkIGhhdmUgdG8gbG9vayBpbnRvIGhvdyB0bwpkZXRlY3QgdGhhdCBjYXNl
IHByb3Blcmx5LCBidXQgSSB0aGluayB0aGUgcHJvcG9zZWQgY2hhbmdlIGlzIGFuCmltcHJvdmVt
ZW50IG92ZXJhbGwuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==

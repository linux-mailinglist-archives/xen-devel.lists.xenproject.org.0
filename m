Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF0183D9C
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 01:07:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv8W1-0006pz-Ve; Tue, 06 Aug 2019 23:05:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/mMd=WC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hv8W0-0006pu-Qz
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 23:05:12 +0000
X-Inumbo-ID: a4742f48-b89e-11e9-a5bd-5fca68483637
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a4742f48-b89e-11e9-a5bd-5fca68483637;
 Tue, 06 Aug 2019 23:05:11 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA5E320717;
 Tue,  6 Aug 2019 23:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565132711;
 bh=50L4OKQzeFdnSx5IvgIQIg4aldRXIggQmKQOACDiXnk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=pqy51cgpJlwUzdDgQLSBIVug06qvQCYklViWJImvzHb85UENip2KYbBOfpC7nBVaN
 oB+0me3vSKwn/D3ZUkK5m3wNDopQ/yQchqI02wRDTVonNJnEb5AUFfuq/iNLJX97dZ
 fXOmc6+wLs0kMTrXdZJv/enJI+Hu9bbdWhO29Wis=
Date: Tue, 6 Aug 2019 16:05:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5D09E75D0200007800239874@prv1-mh.provo.novell.com>
Message-ID: <alpine.DEB.2.21.1908061604010.2451@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1906181618130.2072@sstabellini-ThinkPad-T480s>
 <20190618232019.26425-1-sstabellini@kernel.org>
 <5D09E75D0200007800239874@prv1-mh.provo.novell.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 1/5] xen: add a p2mt parameter to
 map_mmio_regions
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefanos@xilinx.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxOSBKdW4gMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+IE9uIDE5LjA2LjE5
IGF0IDAxOjIwLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBBZGQgYSBwMm10
IHBhcmFtZXRlciB0byBtYXBfbW1pb19yZWdpb25zLCBwYXNzIHAybV9tbWlvX2RpcmVjdF9kZXYg
b24KPiA+IEFSTSBhbmQgcDJtX21taW9fZGlyZWN0IG9uIHg4NiAtLSBubyBjaGFuZ2VzIGluIGJl
aGF2aW9yLiBPbiB4ODYsCj4gPiBpbnRyb2R1Y2UgYSBtYWNybyB0byBzdHJpcCBhd2F5IHRoZSBs
YXN0IHBhcmFtZXRlciBhbmQgcmVuYW1lIHRoZQo+ID4gZXhpc3RpbmcgaW1wbGVtZW50YXRpb24g
b2YgbWFwX21taW9fcmVnaW9ucyB0byBfX21hcF9tbWlvX3JlZ2lvbnMuCj4gPiBVc2UgX19tYXBf
bW1pb19yZWdpb25zIGluIHZwY2kgYXMgaXQgaXMgeDg2LW9ubHkgdG9kYXkuCj4gPiAKPiA+IE9u
IEFSTSwgZ2l2ZW4gdGhlIHNpbWlsYXJpdHkgYmV0d2VlbiBtYXBfbW1pb19yZWdpb25zIGFmdGVy
IHRoZSBjaGFuZ2UKPiA+IGFuZCBtYXBfcmVnaW9uc19wMm10LCByZW1vdmUgdW4vbWFwX3JlZ2lv
bnNfcDJtdC4gQWxzbyBhZGQgYW4gQVNTRVJUIHRvCj4gPiBjaGVjayB0aGF0IG9ubHkgcDJtX21t
aW9fKiB0eXBlcyBhcmUgcGFzc2VkIHRvIGl0Lgo+ID4gCj4gPiBBbHNvIGZpeCB0aGUgc3R5bGUg
b2YgdGhlIGNvbW1lbnQgb24gdG9wIG9mIG1hcF9tbWlvX3JlZ2lvbnMgc2luY2Ugd2UKPiA+IGFy
ZSBhdCBpdC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVm
YW5vc0B4aWxpbnguY29tPgo+ID4gQ0M6IEpCZXVsaWNoQHN1c2UuY29tIAo+ID4gQ0M6IGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20gCj4gPiAtLS0KPiA+IENoYW5nZXMgaW4gdjM6Cj4gPiAtIGNv
ZGUgc3R5bGUKPiA+IC0gaW50cm9kdWNlIF9fbWFwX21taW9fcmVnaW9ucyBvbiB4ODYKPiAKPiBO
by4gQXQgdGhlIHZlcnkgbGVhc3QgdGhlIG5hbWUgaXMgYmFkbHkgY2hvc2VuOiBUaGVyZSBzaG91
bGRuJ3QgYmUKPiBuZXcgbmFtZSBzcGFjZSB2aW9sYXRpb25zLiBCdXQgLi4uCj4gCj4gPiAtLS0g
YS94ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oCj4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2
L3AybS5oCj4gPiBAQCAtMTAwMCw2ICsxMDAwLDE0IEBAIHN0YXRpYyBpbmxpbmUgaW50IHAybV9l
bnRyeV9tb2RpZnkoc3RydWN0IHAybV9kb21haW4gKnAybSwgcDJtX3R5cGVfdCBudCwKPiA+ICAg
ICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4gIAo+ID4gKy8qIHg4NiBkb2Vzbid0IHVzZSB0aGUgcDJt
dCBwYXJhbWV0ZXIsIGp1c3Qgc3RyaXAgaXQgYXdheSAqLwo+ID4gKyNkZWZpbmUgbWFwX21taW9f
cmVnaW9ucyhkLCBzdGFydF9nZm4sIG5yLCBtZm4sIHAybXQpIFwKPiA+ICsgICAgICAgICAgICBf
X21hcF9tbWlvX3JlZ2lvbnMoZCwgc3RhcnRfZ2ZuLCBuciwgbWZuKQo+ID4gK2ludCBfX21hcF9t
bWlvX3JlZ2lvbnMoc3RydWN0IGRvbWFpbiAqZCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IGdmbl90IHN0YXJ0X2dmbiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgbnIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBtZm5fdCBtZm4pOwo+ID4gKwo+IAo+
IC4uLiBleGNlcHQgZm9yIHRoaXMgcGVyaGFwcyBub3QgYmVpbmcgZXZlcnlvbmUncyB0YXN0ZSwg
aXMgdGhlcmUKPiBhbnl0aGluZyB3cm9uZyB3aXRoIGp1c3QKPiAKPiAvKiB4ODYgZG9lc24ndCB1
c2UgdGhlIHAybXQgcGFyYW1ldGVyLCBqdXN0IHN0cmlwIGl0IGF3YXkgKi8KPiAjZGVmaW5lIG1h
cF9tbWlvX3JlZ2lvbnMoZCwgc3RhcnRfZ2ZuLCBuciwgbWZuLCBwMm10KSBcCj4gICAgICAgICAg
ICAgbWFwX21taW9fcmVnaW9ucyhkLCBzdGFydF9nZm4sIG5yLCBtZm4pCj4gCj4gKHBsYWNlZCBh
aGVhZCBvZiB0aGUgcDJtLWNvbW1vbi5oIGluY2x1c2lvbiBwb2ludCwgc3VjaCB0aGF0Cj4gdGhl
IG92ZXJyaWRlIHdvdWxkIGFsc28gYWZmZWN0IHRoZSBkZWNsYXJhdGlvbik/CgpJIGNvdWxkbid0
IGdvIHdpdGggdGhpcyBzdWdnZXN0aW9uIGJlY2F1c2UgdGhlbiB1c2FnZXMgb2YKbWFwX21taW9f
cmVnaW9ucyB1bmRlciBhcmNoL3g4NiB3b3VsZCBmYWlsIHRvIGNvbXBpbGUgdW5sZXNzIGFkanVz
dGVkCmJ5IGFkZGluZyBvbmUgdXNlbGVzcyBhcmd1bWVudCwgYXMgdGhlIG1hY3JvIHdvdWxkbid0
IGFwcGx5IGNvcnJlY3RseS4KCgo+IFRoZSBuZXh0IGJlc3QgKGltbykgc29sdXRpb24gd291bGQg
YmUgdG8gdXRpbGl6ZSB0aGUgZmFjdCB0aGF0IHRoZQo+IGZ1bmN0aW9uIGlzIG1pcy1uYW1lZCBy
aWdodCBub3cgYW55d2F5OiBUaGVyZSdzIG5vIHBvaW50IGZvciB0aGUKPiBwbHVyYWwgaW4gaXRz
IG5hbWUgYWZhaWNzLiBIZW5jZSB0aGUgYWxpYXNpbmcgYWJvdmUgY291bGQgYWxzbwo+IGdvIGJl
dHdlZW4gbWFwX21taW9fcmVnaW9ucygpIGFuZCBtYXBfbW1pb19yZWdpb24oKSwKCkkgd2VudCB3
aXRoIHRoaXMgc3VnZ2VzdGlvbiwgYmFzaWNhbGx5IEkgcmVuYW1lZCBfX21hcF9tbWlvX3JlZ2lv
bnMgdG8KbWFwX21taW9fcmVnaW9uLgoKCj4gZGVwZW5kaW5nIG9uIHdoZXRoZXIgeW91J2Qgd2Fu
dCB0byBhZGp1c3QgdGhlICJjb21tb24iIG5hbWUKPiBhdCB0aGUgc2FtZSB0aW1lIChidXQgaWYg
eW91IGRpZCBzbywgdGhlbiBwZXJoYXBzIHRoZSB1bm1hcAo+IGZ1bmN0aW9uIHNob3VsZCBnZXQg
cmVuYW1lZCB0b28pLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==

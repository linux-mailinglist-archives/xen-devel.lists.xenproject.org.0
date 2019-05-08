Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D434179B0
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 14:47:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOLwe-00040U-Gk; Wed, 08 May 2019 12:45:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOLwc-00040P-OW
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 12:45:10 +0000
X-Inumbo-ID: 1ae4635c-718f-11e9-bf8d-6f721c536310
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ae4635c-718f-11e9-bf8d-6f721c536310;
 Wed, 08 May 2019 12:45:06 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 08 May 2019 06:45:04 -0600
Message-Id: <5CD2CF4E020000780022CCA3@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 08 May 2019 06:45:02 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Marek Marczykowski" <marmarek@invisiblethingslab.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <dfffbc1faf0884df46f5568cdcf9fa8c2340ae2b.1557154206.git-series.marmarek@invisiblethingslab.com>
 <7c7a7dcc-ff17-feb7-1e88-96c31b0e72a7@suse.com>
 <20190506153211.GV1502@mail-itl>
 <5CD14B6E020000780022C646@prv1-mh.provo.novell.com>
 <20190507153825.GA1502@mail-itl>
 <5CD1AE5D020000780022C9AF@prv1-mh.provo.novell.com>
 <20190507164311.GB1502@mail-itl>
 <5CD2A765020000780022CBBC@prv1-mh.provo.novell.com>
 <20190508120656.GC1502@mail-itl>
In-Reply-To: <20190508120656.GC1502@mail-itl>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 4/5] xen: fix handling framebuffer located
 above 4GB
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA4LjA1LjE5IGF0IDE0OjA2LCA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4gd3JvdGU6Cj4gT24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDM6NTQ6NDVBTSAtMDYwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+ID4+PiBPbiAwNy4wNS4xOSBhdCAxODo0MywgPG1hcm1hcmVrQGlu
dmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+PiA+IE9uIFR1ZSwgTWF5IDA3LCAyMDE5IGF0
IDEwOjEyOjEzQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiA+PiBCdXQgd2hhdCdzIHdy
b25nIHdpdGggYmFja3BvcnRpbmcgeW91ciBjaGFuZ2UgYXMgaXM/Cj4+ID4gCj4+ID4gSWYgdGhp
cyBjb21taXQgd291bGQgYmUgYmFja3BvcnRlZCwgd2hhdCB2YWx1ZSB5b3UnZCBwdXQgaW4gdGhh
dCAjaWZkZWY/Cj4+IAo+PiBJJ2Qga2VlcCBpdCBhcyBpcy4gVGhlIGZpZWxkIGFkZGl0aW9uIGhh
cHBlbnMgZm9yIDQuMTMuIEFuZCBhcyB5b3Ugc2F5IC4uLgo+PiAKPj4gPiBBbHNvLCBvbmUgbWF5
IGFyZ3VlIHRoYXQgQUJJIGNoYW5nZXMgc2hvdWxkIG5vdCBiZSBiYWNrcG9ydGVkLi4uIEJ1dAo+
PiA+IHNpbmNlIHRoZXJlIGlzIGNsZWFyIGFuZCBpbmRlcGVuZGVudCBvZiB4ZW4gdmVyc2lvbiBt
ZXRob2Qgb2YgZGV0ZWN0aW5nCj4+ID4gaXQsIEkgZG9uJ3QgdGhpbmsgdGhpcyB3b3VsZCBiZSBh
IGJpZyBpc3N1ZSBoZXJlLgo+PiAKPj4gLi4uIHRoZXJlJ3Mgbm90IHJlYWxseSBhbnkgaXNzdWUg
d2l0aCBzdXJmYWNpbmcgdGhpcyBhbHNvIGluIG9sZGVyCj4+IHZlcnNpb25zLgo+IAo+IFlvdSBt
ZWFuIHRvIGtlZXAgaXQgd2l0aG91dCAjaWZkZWYgdGhlbj8gSSdtIG5vdCBmb2xsb3dpbmcuLi4g
SWYgeW91IGFkZAo+ICNpZmRlZiBfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fID49IDB4MDAwNDBk
MDAgdGhlcmUsIHRoZSBmaWVsZCB3b24ndCBiZQo+IGF2YWlsYWJsZSBpbiBYZW4gPCA0LjEzLiBX
aGljaCBlZmZlY3RpdmVseSBtZWFucyB0aGUgcGF0Y2ggY2FuJ3QgYmUKPiBiYWNrcG9ydGVkIGFz
IGl0IHdvbid0IGNvbXBpbGUgd2l0aCBYZW4gPCA0LjEzLiBOb3RlIGFsc28gdGhhdCB0aGlzCj4g
c3RydWN0dXJlIGlzIHRoZSBwbGFjZSB0aGF0IFhlbiB1c2UgdG8ga2VlcCB0aGF0IGluZm9ybWF0
aW9uIGludGVybmFsbHkKPiAoeGVuX3ZnYV9jb25zb2xlX2luZm8gaXMgYW5vdGhlciBuYW1lIGZv
ciBkb20wX3ZnYV9jb25zb2xlX2luZm8pLCBpdAo+IGlzbid0IG9ubHkgYWJvdXQgcGFzc2luZyB0
aGlzIGluZm9ybWF0aW9uIHRvIGRvbTAuCgpIbW0sIHllcywgSSd2ZSBiZWVuIG1peGluZyB1cCB0
aGluZ3MuIEl0IHdvdWxkIG5lZWQgdG8gaGF2ZQoifHwgZGVmaW5lZChfX1hFTl9fKSIgYWRkZWQg
dGhlcmUuCgo+IE1heWJlIGFkZCAjaWZkZWYgX19YRU5fSU5URVJGQUNFX1ZFUlNJT05fXyA+PSAw
eDAwMDQwYTAwLCBhcyB0aGUgb2xkZXN0Cj4gZnVsbHkgc3VwcG9ydGVkIHZlcnNpb24/IFRoaXMg
d2lsbCBtaXRpZ2F0ZSBvbmUgb2YgdGhlIGlzc3VlcyB3aXRoIHRoZQo+IGxhY2sgb2YgI2lmZGVm
IChwb3RlbnRpYWwgY29uZmxpY3Qgd2l0aCBnYmxfY2FwcyB3aXRoCj4gX19YRU5fSU5URVJGQUNF
X1ZFUlNJT05fXyA8IDB4MDAwMzAyMDYpLgoKVGhhdCdzIG5vdCBhbiBvcHRpb24gaW1vLCBhcyBv
bmx5IHNvbWUgbWlub3IgdmVyc2lvbnMgb2YgdGhvc2UKbWFqb3Igb25lcyB3b3VsZCBzdXBwb3J0
IHRoZSBuZXcgZmllbGQuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==

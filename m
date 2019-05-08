Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6780617584
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 11:58:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOJHr-0005Om-Ic; Wed, 08 May 2019 09:54:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOJHp-0005Oa-9y
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 09:54:53 +0000
X-Inumbo-ID: 52ec232e-7177-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 52ec232e-7177-11e9-843c-bc764e045a96;
 Wed, 08 May 2019 09:54:52 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 08 May 2019 03:54:50 -0600
Message-Id: <5CD2A765020000780022CBBC@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 08 May 2019 03:54:45 -0600
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
In-Reply-To: <20190507164311.GB1502@mail-itl>
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

Pj4+IE9uIDA3LjA1LjE5IGF0IDE4OjQzLCA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4gd3JvdGU6Cj4gT24gVHVlLCBNYXkgMDcsIDIwMTkgYXQgMTA6MTI6MTNBTSAtMDYwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+ID4+PiBPbiAwNy4wNS4xOSBhdCAxNzozOCwgPG1hcm1hcmVrQGlu
dmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+PiA+IFdoYXQgZG8geW91IHRoaW5rIGFib3V0
IGFkZGluZyBzb21ldGhpbmcgdGhhdCBjb3VsZCBiZSBiYWNrcG9ydGVkPwo+PiA+IFhlbiBpcyBx
dWl0ZSBpbnNpc3RlbnQgb24gaW5pdGlhbGl6aW5nIGZyYW1lYnVmZmVyLCBldmVuIHdpdGgKPj4g
PiBjb25zb2xlPWNvbTEgb3IgY29uc29sZT1ub25lLiBXaGljaCBtZWFucywgdGhlcmUgaXMgbm8g
d29ya2Fyb3VuZCBmb3IKPj4gPiB0aGlzIHByb2JsZW0uCj4+IAo+PiBXaGVuIHRoZSBzeXN0ZW0g
aXMgaW4gYSBzaW1wbGUgdGV4dCBtb2RlIHRoZSAvYmFzZXZpZGVvIG9wdGlvbiBvZgo+PiB4ZW4u
ZWZpIG91Z2h0IHRvIGhlbHAsIGJ1dCBpZiBpdCdzIGluIGFuIExGQi1iYXNlZCBtb2RlIGFscmVh
ZHkgKHdoaWNoCj4+IGlzIHRoZSBjYXNlIG9uIHRoZSBzeXN0ZW1zIEkgaGF2ZSkgdGhlbiBpbmRl
ZWQgSSBjYW4ndCBzZWUgYW55Cj4+IHdvcmthcm91bmQuCj4+IAo+PiA+IE1heWJlLCBhcyBhIGZp
cnN0IHN0ZXAsIGEgY2hhbmdlIHRoYXQgYWJvcnQgZnJhbWVidWZmZXIgaW5pdGlhbGl6YXRpb24K
Pj4gPiBpZiBsZmJfYmFzZSA9PSAwIChJIGFzc3VtZSB0aGlzIGlzIG5ldmVyIHZhbGlkIHZhbHVl
IGhlcmUsIHJpZ2h0Pyk/Cj4+IAo+PiBZZXMsIHRoYXQgd291bGQgYmUgYW4gb3B0aW9uLiBCdXQg
aXQgd291bGQgaGVscCBvbmx5IGluIHlvdXIgc3BlY2lmaWMKPj4gY2FzZSwgbm90IGlmIHRoZSB0
cnVuY2F0aW9uIHJlc3VsdHMgaW4gYSBub24temVybyB2YWx1ZS4gSSBndWVzcyB3ZSdkCj4+IGJl
dHRlciBhdm9pZCBmaWxsaW5nIHRoZSBzdHJ1Y3R1cmUgaWYgd2UnZCB0cnVuY2F0ZSB0aGUgdmFs
dWUuCj4gCj4gWWVzLCBJIHdhcyB0aGlua2luZyBhYm91dCBzZXR0aW5nIGxmYl9iYXNlPTAgZXhw
bGljaXRseSBpZiBpdCB3b3VsZAo+IG92ZXJmbG93IG90aGVyd2lzZS4KPiAKPj4gQnV0IHdoYXQn
cyB3cm9uZyB3aXRoIGJhY2twb3J0aW5nIHlvdXIgY2hhbmdlIGFzIGlzPwo+IAo+IElmIHRoaXMg
Y29tbWl0IHdvdWxkIGJlIGJhY2twb3J0ZWQsIHdoYXQgdmFsdWUgeW91J2QgcHV0IGluIHRoYXQg
I2lmZGVmPwoKSSdkIGtlZXAgaXQgYXMgaXMuIFRoZSBmaWVsZCBhZGRpdGlvbiBoYXBwZW5zIGZv
ciA0LjEzLiBBbmQgYXMgeW91IHNheSAuLi4KCj4gQWxzbywgb25lIG1heSBhcmd1ZSB0aGF0IEFC
SSBjaGFuZ2VzIHNob3VsZCBub3QgYmUgYmFja3BvcnRlZC4uLiBCdXQKPiBzaW5jZSB0aGVyZSBp
cyBjbGVhciBhbmQgaW5kZXBlbmRlbnQgb2YgeGVuIHZlcnNpb24gbWV0aG9kIG9mIGRldGVjdGlu
Zwo+IGl0LCBJIGRvbid0IHRoaW5rIHRoaXMgd291bGQgYmUgYSBiaWcgaXNzdWUgaGVyZS4KCi4u
LiB0aGVyZSdzIG5vdCByZWFsbHkgYW55IGlzc3VlIHdpdGggc3VyZmFjaW5nIHRoaXMgYWxzbyBp
biBvbGRlcgp2ZXJzaW9ucy4KCj4+ID4gSWYgbm90LCB0aGVuIGF0IGxlYXN0IGFib3J0IGJvb3Qg
d2hlbiB0ZXh0IGNvbnNvbGUgaXMgc3RpbGwgdGhlcmUKPj4gPiAoYmxleGl0IGJlZm9yZSBlZmlf
ZXhpdF9ib290KS4gQW55IHByZWZlcmVuY2U/Cj4+IAo+PiBXaGF0J3Mgd3Jvbmcgd2l0aCB0aGUg
dGV4dCBjb25zb2xlIHN0aWxsIGFjdGl2ZT8gT3IgbWF5YmUgSSdtCj4+IG1pc3VuZGVyc3RhbmRp
bnQgeW91IG1ha2UuLi4KPiAKPiBBcyBzb29uIGFzIHlvdSBjYWxsIEV4aXRCb290U2VydmljZXMo
KSwgeW91IGNhbid0IHVzZQo+IFNJTVBMRV9URVhUX09VVFBVVF9JTlRFUkZBQ0UgYW55bW9yZS4g
V2hpY2ggbWVhbnMgaWYgYSkgZnJhbWVidWZmZXIKPiBhZGRyZXNzIGRpZG4ndCBmaXQsIGFuZCBi
KSB5b3UgY2FsbGVkIEV4aXRCb290U2VydmljZXMoKSBhbHJlYWR5LCB5b3UKPiBkb24ndCBoYXZl
IGFueSBtZWFucyB0byB0ZWxsIHRoZSB1c2VyIHdoYXQgaXMgd3JvbmcuIE90aGVyIHRoYW4gc2Vy
aWFsCj4gY29uc29sZSBvZiBjb3Vyc2UsIGlmIHlvdSdyZSBsdWNreSBlbm91Z2ggdG8gaGF2ZSBv
bmUuIFNvIHRoZSBpZGVhIHdhcwo+IHRvIHJlcG9ydCB0aGUgcHJvYmxlbSBiZWZvcmUgRXhpdEJv
b3RTZXJ2aWNlcygpLgoKT2gsIHNvIGJlICJ0ZXh0IGNvbnNvbGUiIHlvdSBtZWFudCB0aGUgRUZJ
IGludGVyZmFjZSwgbm90IGEKY29uc29sZSBpbiB0ZXh0IG1vZGUgKHdoaWNoIHdlIGNhbiBkcml2
ZSkuIEZhaWxpbmcgdG8gYm9vdCBpbgpzdWNoIGEgY2FzZSBzZWVtcyB3b3JzZSB0byBtZSB0aGFu
IGJvb3RpbmcgZWZmZWN0aXZlbHkKaGVhZGxlc3MuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

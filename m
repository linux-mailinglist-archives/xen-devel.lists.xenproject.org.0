Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0433117BCED
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 13:39:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jACD4-0005a7-9i; Fri, 06 Mar 2020 12:36:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jACD2-0005a2-5X
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 12:36:08 +0000
X-Inumbo-ID: 0cc2ea30-5fa7-11ea-8eb5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0cc2ea30-5fa7-11ea-8eb5-bc764e2007e4;
 Fri, 06 Mar 2020 12:36:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 99098AEDE;
 Fri,  6 Mar 2020 12:36:05 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>,
 "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <20200225095357.3923-1-pdurrant@amazon.com>
 <20200225095357.3923-3-pdurrant@amazon.com>
 <2653c2cf-9add-dd0c-03e5-36d951ee621e@suse.com>
 <132bb159fcf049ae87e402537ccc7d2a@EX13D32EUC003.ant.amazon.com>
 <b9bb89e1-1490-c3e6-11b6-f6944750a791@suse.com>
 <f361c33b-1fdd-d296-edb3-3dbe8d0bc18b@xen.org>
 <7170eda8579cc4c9e6a899980a87e0eb0e9c71cd.camel@amazon.co.uk>
 <7de58cb0-d8b5-ea86-f573-151356edbb79@suse.com>
 <d14b125acb6f22db084d889b4b1abcf5e5b1815e.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bc28ea41-0d13-4182-db2e-9eeaf4408e3b@suse.com>
Date: Fri, 6 Mar 2020 13:36:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d14b125acb6f22db084d889b4b1abcf5e5b1815e.camel@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] domain: use PGC_extra domheap page for
 shared_info
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDMuMjAyMCAxMzoyMCwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IE9uIEZyaSwgMjAy
MC0wMy0wNiBhdCAxMjozNyArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBGb3IgbGl2ZSB1
cGRhdGUgd2UgbmVlZCB0byBnaXZlIGEgcmVnaW9uIG9mIG1lbW9yeSB0byB0aGUgbmV3IFhlbiB3
aGljaAo+Pj4gaXQgY2FuIHVzZSBmb3IgaXRzIGJvb3QgYWxsb2NhdG9yLCBiZWZvcmUgaXQncyBo
YW5kbGVkIGFueSBvZiB0aGUgbGl2ZQo+Pj4gdXBkYXRlIHJlY29yZHMgYW5kIGJlZm9yZSBpdCBr
bm93cyB3aGljaCAqb3RoZXIqIG1lbW9yeSBpcyBzdGlsbAo+Pj4gYXZhaWxhYmxlIGZvciB1c2Uu
Cj4+Pgo+Pj4gSW4gb3JkZXIgdG8gZG8gdGhhdCwgdGhlIG9yaWdpbmFsIFhlbiBoYXMgdG8gZW5z
dXJlIHRoYXQgaXQgKmRvZXNuJ3QqCj4+PiB1c2UgYW55IG9mIHRoYXQgbWVtb3J5IHJlZ2lvbiBm
b3IgZG9tYWluLW93bmVkIHBhZ2VzIHdoaWNoIHdvdWxkIG5lZWQKPj4+IHRvIGJlIHByZXNlcnZl
ZC4KPj4+Cj4+PiBTbyBmYXIgaW4gdGhlIHBhdGNoZXMgSSd2ZSBwb3N0ZWQgdXBzdHJlYW0gSSBo
YXZlIGNoZWF0ZWQsIGFuZCBzaW1wbHkKPj4+ICpub3QqIGFkZGVkIHRoZW0gdG8gdGhlIG1haW4g
aGVhcC4gQW55dGhpbmcgYWxsb2NhdGVkIGJlZm9yZQo+Pj4gZW5kX2Jvb3RfYWxsb2NhdG9yKCkg
aXMgZmluZSBiZWNhdXNlIGl0IGlzICJlcGhlbWVyYWwiIHRvIHRoZSBmaXJzdCBYZW4KPj4+IGFu
ZCBkb2Vzbid0IG5lZWQgdG8gYmUgcHJlc2VydmVkIChpdCdzIG1vc3RseSBmcmFtZSB0YWJsZXMg
YW5kIGEgZmV3Cj4+PiBQVEUgcGFnZXMpLgo+Pj4KPj4+IFBhdWwncyB3b3JrIGlzIG1ha2luZyBp
dCBwb3NzaWJsZSB0byB1c2UgdGhvc2UgcGFnZXMgYXMgeGVuaGVhcCBwYWdlcywKPj4+IHNhZmUg
aW4gdGhlIGtub3dsZWRnZSB0aGF0IHRoZXkgKndvbid0KiBlbmQgdXAgYmVpbmcgbWFwcGVkIHRv
IGRvbWFpbnMsCj4+PiBhbmQgd29uJ3QgbmVlZCB0byBiZSBwcmVzZXJ2ZWQgYWNyb3NzIGxpdmUg
dXBkYXRlLgo+Pgo+PiBJJ3ZlIHN0YXJ0ZWQgbG9va2luZyBhdCB0aGUgbGF0ZXN0IHZlcnNpb24g
b2YgUGF1bCdzIHNlcmllcywgYnV0IEknbQo+PiBzdGlsbCBzdHJ1Z2dsaW5nIHRvIHNlZSB0aGUg
cGljdHVyZTogVGhlcmUncyBubyB0cnVlIGRpc3RpbmN0aW9uCj4+IGJldHdlZW4gWGVuIGhlYXAg
YW5kIGRvbWFpbiBoZWFwIG9uIHg4Ni02NCAoZXhjZXB0IG9uIHZlcnkgbGFyZ2UKPj4gc3lzdGVt
cykuIFRoZXJlZm9yZSBpdCBpcyB1bmNsZWFyIHRvIG1lIHdoYXQgInRob3NlIHBhZ2VzIiBpcyBh
Y3R1YWxseQo+PiByZWZlcnJpbmcgdG8gYWJvdmUuIFN1cmVseSBuZXcgWGVuIGNhbid0IGJlIGdp
dmVuIGFueSBwYWdlcyBpbiB1c2UKPj4gX2luIGFueSB3YXlfIGJ5IG9sZCBYZW4sIG5vIG1hdHRl
ciB3aGV0aGVyIGl0J3Mgb25lcyBhc3NpZ25lZCB0bwo+PiBkb21haW5zLCBvciBvbmVzIHVzZWQg
aW50ZXJuYWxseSB0byAob2xkKSBYZW4uCj4gCj4gSG0sIEknbSBub3Qgc3VyZSBteSBwcmV2aW91
cyByZXNwb25zZSBhY3R1YWxseSBhbnN3ZXJlZCB5b3VyIHF1ZXN0aW9uOwo+IHNvcnJ5LCBJJ3Zl
IGJlZW4gYXdheSBhbGwgd2VlayBzbyBpdCdzIHN0aWxsIE1vbmRheSBtb3JuaW5nIGluIG15IGhl
YWQKPiByaWdodCBub3cuIExldCBtZSB0cnkgYWdhaW4uLi4KPiAKPiBXaGF0IEkgc2FpZCBqdXN0
IG5vdyBpcyB0cnVlLiBUaGUgbmV3IFhlbiBjYW4gdXNlIGFueXRoaW5nIHRoYXQgaXNuJ3QKPiBh
Y3R1YWxseSBvd25lZCBieSBkb21haW5zLCBidXQgb2xkIFhlbiBpcyBkZWFkIGFuZCBhbnkgb2Yg
aXRzIG93bgo+IGludGVybmFsIGFsbG9jYXRpb25zLCBYZW4gcGFnZSB0YWJsZXMgYW5kIGRhdGEg
c3RydWN0dXJlcyAoaS5lLiBtb3N0IG9mCj4gd2hhdCBpdCBhbGxvY2F0ZWQgb24gaXRzIHhlbmhl
YXApIGhhdmUgZGllZCB3aXRoIGl0IGFuZCB0aG9zZSBwYWdlcyBhcmUKPiBjb25zaWRlcmVkICdm
cmVlJyBieSB0aGUgbmV3IFhlbi4KPiAKPiBUaGVvcmV0aWNhbGx5LCBpdCB3b3VsZCBiZSBwb3Nz
aWJsZSBmb3IgdGhlIG5ldyBYZW4gdG8gZ28gZGlyZWN0bHkgdG8KPiB0aGF0IHN0YXRlLiBUaGUg
bGl2ZSB1cGRhdGUgZGF0YSBjb3VsZCBiZSBwcm9jZXNzZWQgKmVhcmx5KiBpbiB0aGUgbmV3Cj4g
WGVuIGJlZm9yZSB0aGUgYm9vdCBhbGxvY2F0b3IgaXMgZXZlbiBydW5uaW5nLCBhbmQgbmV3IFhl
biBjb3VsZCBwcmltZQo+IGl0cyBib290IGFsbG9jYXRvciB3aXRoIHRoZSBtZW1vcnkgcmFuZ2Vz
IHRoYXQgaGFwcGVuIHRvIGJlIGF2YWlsYWJsZQo+IGFjY29yZGluZyB0byB0aGUgY3JpdGVyaWEg
b3V0bGluZWQgYWJvdmUuCj4gCj4gT3VyIGluaXRpYWwgaW1wbGVtZW50YXRpb24gZGlkIHRoYXQs
IGluIGZhY3QuIEl0IHdhcyBjb21wbGV4IGluIGVhcmx5Cj4gYm9vdCwgYW5kIGl0IGRpZG4ndCBz
Y2FsZSB0byBtb3JlIHRoYW4gNTEyIHNlcGFyYXRlIGZyZWUgcmFuZ2VzIGJlY2F1c2UKPiB0aGUg
Ym9vdCBhbGxvY2F0b3IgcGFuaWNzIGlmIGl0IGhhcyBtb3JlIGZyZWUgcmVnaW9ucyB0aGFuIHRo
YXQuCj4gCj4gVGhhdCdzIHdoeSB3ZSBzZXR0bGVkIG9uIHRoZSBtb2RlbCBvZiByZXNlcnZpbmcg
YSBzcGVjaWZpYyByZWdpb24gZm9yCj4gdGhlIG5ldyBYZW4gdG8gdXNlIGZvciBpdHMgYm9vdCBh
bGxvY2F0b3IuIE9sZCBYZW4gcHJvbWlzZXMgdGhhdCBpdAo+IHdvbid0IHB1dCBhbnl0aGluZyBp
bnRvIHRoYXQgcmVnaW9uIHRoYXQgbmVlZHMgdG8gYmUgcHJlc2VydmVkIG92ZXIKPiBrZXhlYywg
YW5kIHRoZW4gdGhlIHN0YXJ0dXAgcHJvY2VzcyBmb3IgdGhlIG5ldyBYZW4gaXMgbXVjaCBzaW1w
bGVyOyBpdAo+IGNhbiB1c2UgdGhhdCBjb250aWd1b3VzIHJlZ2lvbiBmb3IgaXRzIGJvb3QgYWxs
b2NhdGlvbnMgYW5kIHRoZW4KPiBwcm9jZXNzIHRoZSBsaXZlIHVwZGF0ZSBkYXRhIGluIGEgYmV0
dGVyIGVudmlyb25tZW50IG9uY2UgdGhpbmdzIGxpa2UKPiB2bWFwKCkgYXJlIGFscmVhZHkgYXZh
aWxhYmxlIFRoZW4gKmZpbmFsbHkqIGl0IGNhbiBhZGQgdGhlIHJlc3Qgb2YgdGhlCj4gc3lzdGVt
IG1lbW9yeSB0aGF0ICppc24ndCogdXNlZCBieSBydW5uaW5nIGRvbWFpbnMsIGludG8gdGhlIGJ1
ZGR5Cj4gYWxsb2NhdG9yLgo+IAo+IFNvIHRoaXMgcmVxdWlyZXMgb2xkIFhlbiB0byBwcm9taXNl
IHRoYXQgaXQgKndvbid0KiBwdXQgYW55dGhpbmcgaW50bwo+IHRoYXQgcmVnaW9uIG9mIHJlc2Vy
dmVkIGJvb3RtZW0gKGFrYSAidGhvc2UgcGFnZXMiKSwgdGhhdCBuZWVkcyB0byBiZQo+IHByZXNl
cnZlZCBhY3Jvc3Mga2V4ZWMuIFRoYXQgcHJvbWlzZSBpcyAqbW9zdGx5KiBlcXVpdmFsZW50IHRv
ICJ3aWxsCj4gb25seSBhbGxvY2F0ZSB4ZW5oZWFwIHBhZ2VzIGZyb20gdGhvc2UgcGFnZXMiLi4u
IGV4Y2VwdCBmb3IgdGhlIGZhY3QKPiB0aGF0IHNvbWV0aW1lcyB3ZSBhbGxvY2F0ZSBhIHBhZ2Ug
ZnJvbSB0aGUgeGVuaGVhcCBhbmQgc2hhcmUgaXQgdG8KPiBkb21haW5zLgo+IAo+IFRodXMsICJk
b24ndCBkbyB0aGF0IHRoZW4iLCBhbmQgVEhFTiB3ZSBjYW4gc2F5IHRoYXQgaXQncyBPSyBmb3IK
PiB4ZW5oZWFwIGFsbG9jYXRpb25zIHRvIGNvbWUgZnJvbSB0aGUgcmVzZXJ2ZWQgYm9vdG1lbSBy
ZWdpb24sIGJ1dCBub3QKPiBkb21oZWFwIGFsbG9jYXRpb25zLgoKT2gsIHNvIHJlYWxseSB0aGlz
IGlzIGFuIG9wdGltaXphdGlvbiB0byBhbGxvdyB0aGUgbWVtb3J5IHJhbmdlIHRvCm5vdCByZW1h
aW4gdW51c2VkIGFsdG9nZXRoZXIgYnkgIm9sZCIgWGVuLCBpLmUuIHVubGlrZSB0aGUga2V4ZWMK
cmFuZ2UuIEFuZCBvZiBjb3Vyc2UgdGhpcyBtZWFucyB5b3UncmUgaW50ZW5kaW5nIHRvIChhdCBs
ZWFzdApwYXJ0aWFsbHkpIHJlc3VycmVjdCB0aGUgZGlzdGluY3Rpb24gYmV0d2VlbiBkb21oZWFw
IGFuZCB4ZW5oZWFwLAp3aGljaCBpc24ndCBzYWlkIGFueXdoZXJlIGluIFBhdWwncyBzZXJpZXMs
IEkgZG9uJ3QgdGhpbmsuIElmIHRoaXMKaXMgYSBzdWZmaWNpZW50bHkgY29ycmVjdCB1bmRlcnN0
YW5kaW5nIG9mIG1pbmUsIHRoZW4gb24gb25lIGhhbmQKSSBzdGFydCBzZWVpbmcgdGhlIHBvaW50
IG9mIHRoZSBjb252ZXJzaW9uIFBhdWwgd2FudHMgdG8gbWFrZSwgYnV0Cm90b2ggdGhpcyB0aGVu
IGZlZWxzIGEgbGl0dGxlIGxpa2UgbWFraW5nIHRoZSAybmQgc3RlcCBiZWZvcmUgdGhlCjFzdC4K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

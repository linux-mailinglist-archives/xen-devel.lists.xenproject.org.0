Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B6C17BBD4
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 12:39:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jABIC-0007jP-St; Fri, 06 Mar 2020 11:37:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jABIB-0007jK-5H
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 11:37:23 +0000
X-Inumbo-ID: d77e332a-5f9e-11ea-a7af-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d77e332a-5f9e-11ea-a7af-12813bfff9fa;
 Fri, 06 Mar 2020 11:37:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8D0D2B2BA;
 Fri,  6 Mar 2020 11:37:20 +0000 (UTC)
To: "Woodhouse, David" <dwmw@amazon.co.uk>,
 "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <20200225095357.3923-1-pdurrant@amazon.com>
 <20200225095357.3923-3-pdurrant@amazon.com>
 <2653c2cf-9add-dd0c-03e5-36d951ee621e@suse.com>
 <132bb159fcf049ae87e402537ccc7d2a@EX13D32EUC003.ant.amazon.com>
 <b9bb89e1-1490-c3e6-11b6-f6944750a791@suse.com>
 <f361c33b-1fdd-d296-edb3-3dbe8d0bc18b@xen.org>
 <7170eda8579cc4c9e6a899980a87e0eb0e9c71cd.camel@amazon.co.uk>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7de58cb0-d8b5-ea86-f573-151356edbb79@suse.com>
Date: Fri, 6 Mar 2020 12:37:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7170eda8579cc4c9e6a899980a87e0eb0e9c71cd.camel@amazon.co.uk>
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

T24gMjYuMDIuMjAyMCAxNzo1MywgV29vZGhvdXNlLCBEYXZpZCB3cm90ZToKPiBPbiBXZWQsIDIw
MjAtMDItMjYgYXQgMTY6MTIgKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gKCtEYXZpZCkK
Pj4KPj4gT24gMjYvMDIvMjAyMCAxNToyMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBPbiAyNi4w
Mi4yMDIwIDE1OjA1LCBEdXJyYW50LCBQYXVsIHdyb3RlOgo+Pj4+PiBGcm9tOiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Pj4+IFNlbnQ6IDI2IEZlYnJ1YXJ5IDIwMjAgMTM6NTgK
Pj4+Pj4KPj4+Pj4gT24gMjUuMDIuMjAyMCAxMDo1MywgUGF1bCBEdXJyYW50IHdyb3RlOgo+Pj4+
Pj4gVGhlcmUncyBubyBwYXJ0aWN1bGFyIHJlYXNvbiBzaGFyZWRfaW5mbyBuZWVkIHVzZSBhIHhl
bmhlYXAgcGFnZS4gSXQncwo+Pj4+Pj4gb25seSBwdXJwb3NlIGlzIHRvIGJlIG1hcHBlZCBieSB0
aGUgZ3Vlc3Qgc28gdXNlIGEgUEdDX2V4dHJhIGRvbWhlYXAKPj4+Pj4KPj4+Pj4gcGFnZQo+Pj4+
Pj4gaW5zdGVhZC4KPj4+Pj4KPj4+Pj4gU2luY2UgdGhlIGNvdmVyIGxldHRlciBhbHNvIGRvZXNu
J3QgZ2l2ZSBhbnkgYmFja2dyb3VuZCAtIGlzIHRoZXJlIGEKPj4+Pj4gcHJvYmxlbSB3aXRoIHRo
ZSBjdXJyZW50IGFycmFuZ2VtZW50cz8gQXJlIHRoZXJlIGFueSBmdXJ0aGVyIHBsYW5zCj4+Pj4+
IGRlcGVuZGluZyBvbiB0aGlzIGJlaW5nIGNoYW5nZWQ/IE9yIGlzIHRoaXMgc2ltcGx5ICJsZXQn
cyBkbyBpdAo+Pj4+PiBiZWNhdXNlIG5vdyB3ZSBjYW4iPwo+Pj4+Pgo+Pj4+Cj4+Pj4gVGhlIGdl
bmVyYWwgZGlyZWN0aW9uIGlzIHRvIGdldCByaWQgb2Ygc2hhcmVkIHhlbmhlYXAgcGFnZXMuIEtu
b3dpbmcKPj4+PiB0aGF0IGEgeGVuaGVhcCBwYWdlIGlzIG5vdCBzaGFyZWQgd2l0aCBhIGd1ZXN0
IG1ha2VzIGRlYWxpbmcgd2l0aAo+Pj4+IGxpdmUgdXBkYXRlIG11Y2ggZWFzaWVyLAo+Pj4KPj4+
IEkgbWF5IG5vdCBiZSBzZWVpbmcgZW5vdWdoIG9mIHRoZSBvdmVyYWxsIHBpY3R1cmUsIGJ1dCBp
dCB3b3VsZCBzZWVtCj4+PiB0byBtZSB0aGF0IHRoZSBzcGVjaWFsIHRyZWF0bWVudCBvZiBzaGFy
ZWQgWGVuIGhlYXAgcGFnZXMgd291bGQgdGhlbgo+Pj4gYmUgcmVwbGFjZWQgYnkgc3BlY2lhbCB0
cmVhdG1lbnQgb2YgUEdDX2V4dHJhIG9uZXMuCj4+Cj4+IEkgaGF2ZSBiZWVuIHdvcmtpbmcgb24g
TGl2ZXVwZGF0ZSBmb3IgdGhlIHBhc3QgY291cGxlIG1vbnRocyBhbmQgSSBkb24ndCAKPj4gICBy
ZWFsbHkgc2VlIGhvdyB0aGlzIGlzIGdvaW5nIHRvIG1ha2UgbGl2ZXVwZGF0ZSBlYXNpZXIuIFdl
IHdpbGwgc3RpbGwgCj4+IG5lZWQgdG8gc2F2ZSB0aGUgZXh0cmEgZmxhZ3MgYW5kIGV4dHJhIHJl
Y29yZHMgZm9yIGVhY2ggc3Vic3lzdGVtIHVzaW5nIAo+PiB0aGVtIChlLmcgZ3JhbnQtdGFibGVz
KS4KPj4KPj4gSSBoYXZlIENDZWQgRGF2aWQgdG8gc2VlIGlmIGhlIGhhcyBhIGRpZmZlcmVudCBv
cGluaW9uLgo+IAo+IEZvciBsaXZlIHVwZGF0ZSB3ZSBuZWVkIHRvIGdpdmUgYSByZWdpb24gb2Yg
bWVtb3J5IHRvIHRoZSBuZXcgWGVuIHdoaWNoCj4gaXQgY2FuIHVzZSBmb3IgaXRzIGJvb3QgYWxs
b2NhdG9yLCBiZWZvcmUgaXQncyBoYW5kbGVkIGFueSBvZiB0aGUgbGl2ZQo+IHVwZGF0ZSByZWNv
cmRzIGFuZCBiZWZvcmUgaXQga25vd3Mgd2hpY2ggKm90aGVyKiBtZW1vcnkgaXMgc3RpbGwKPiBh
dmFpbGFibGUgZm9yIHVzZS4KPiAKPiBJbiBvcmRlciB0byBkbyB0aGF0LCB0aGUgb3JpZ2luYWwg
WGVuIGhhcyB0byBlbnN1cmUgdGhhdCBpdCAqZG9lc24ndCoKPiB1c2UgYW55IG9mIHRoYXQgbWVt
b3J5IHJlZ2lvbiBmb3IgZG9tYWluLW93bmVkIHBhZ2VzIHdoaWNoIHdvdWxkIG5lZWQKPiB0byBi
ZSBwcmVzZXJ2ZWQuCj4gCj4gU28gZmFyIGluIHRoZSBwYXRjaGVzIEkndmUgcG9zdGVkIHVwc3Ry
ZWFtIEkgaGF2ZSBjaGVhdGVkLCBhbmQgc2ltcGx5Cj4gKm5vdCogYWRkZWQgdGhlbSB0byB0aGUg
bWFpbiBoZWFwLiBBbnl0aGluZyBhbGxvY2F0ZWQgYmVmb3JlCj4gZW5kX2Jvb3RfYWxsb2NhdG9y
KCkgaXMgZmluZSBiZWNhdXNlIGl0IGlzICJlcGhlbWVyYWwiIHRvIHRoZSBmaXJzdCBYZW4KPiBh
bmQgZG9lc24ndCBuZWVkIHRvIGJlIHByZXNlcnZlZCAoaXQncyBtb3N0bHkgZnJhbWUgdGFibGVz
IGFuZCBhIGZldwo+IFBURSBwYWdlcykuCj4gCj4gUGF1bCdzIHdvcmsgaXMgbWFraW5nIGl0IHBv
c3NpYmxlIHRvIHVzZSB0aG9zZSBwYWdlcyBhcyB4ZW5oZWFwIHBhZ2VzLAo+IHNhZmUgaW4gdGhl
IGtub3dsZWRnZSB0aGF0IHRoZXkgKndvbid0KiBlbmQgdXAgYmVpbmcgbWFwcGVkIHRvIGRvbWFp
bnMsCj4gYW5kIHdvbid0IG5lZWQgdG8gYmUgcHJlc2VydmVkIGFjcm9zcyBsaXZlIHVwZGF0ZS4K
CkkndmUgc3RhcnRlZCBsb29raW5nIGF0IHRoZSBsYXRlc3QgdmVyc2lvbiBvZiBQYXVsJ3Mgc2Vy
aWVzLCBidXQgSSdtCnN0aWxsIHN0cnVnZ2xpbmcgdG8gc2VlIHRoZSBwaWN0dXJlOiBUaGVyZSdz
IG5vIHRydWUgZGlzdGluY3Rpb24KYmV0d2VlbiBYZW4gaGVhcCBhbmQgZG9tYWluIGhlYXAgb24g
eDg2LTY0IChleGNlcHQgb24gdmVyeSBsYXJnZQpzeXN0ZW1zKS4gVGhlcmVmb3JlIGl0IGlzIHVu
Y2xlYXIgdG8gbWUgd2hhdCAidGhvc2UgcGFnZXMiIGlzIGFjdHVhbGx5CnJlZmVycmluZyB0byBh
Ym92ZS4gU3VyZWx5IG5ldyBYZW4gY2FuJ3QgYmUgZ2l2ZW4gYW55IHBhZ2VzIGluIHVzZQpfaW4g
YW55IHdheV8gYnkgb2xkIFhlbiwgbm8gbWF0dGVyIHdoZXRoZXIgaXQncyBvbmVzIGFzc2lnbmVk
IHRvCmRvbWFpbnMsIG9yIG9uZXMgdXNlZCBpbnRlcm5hbGx5IHRvIChvbGQpIFhlbi4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

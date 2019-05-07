Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E4B16477
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 15:23:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO01g-0004vK-Vi; Tue, 07 May 2019 13:20:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qCYz=TH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hO01f-0004vE-Ok
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 13:20:55 +0000
X-Inumbo-ID: f132b84e-70ca-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id f132b84e-70ca-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 13:20:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3369480D;
 Tue,  7 May 2019 06:20:54 -0700 (PDT)
Received: from [10.37.8.6] (unknown [10.37.8.6])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 69E353F238;
 Tue,  7 May 2019 06:20:52 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <alpine.DEB.2.10.1905031347520.3722@sstabellini-ThinkPad-X260>
 <1556916614-21512-3-git-send-email-sstabellini@kernel.org>
 <5CCFF915020000780022C158@prv1-mh.provo.novell.com>
 <4d68ea2c-ee87-6ae4-41d5-502bf475bdb4@arm.com>
 <5CD1367C020000780022C597@prv1-mh.provo.novell.com>
 <f9deae17-e925-9a4f-1eb1-443b428e0525@arm.com>
 <5CD15163020000780022C68B@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <09b11a6c-84b2-259b-7d1f-975f25e18e55@arm.com>
Date: Tue, 7 May 2019 14:20:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CD15163020000780022C68B@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/3] xen/arm: fix mask calculation in
 init_pdx
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA1LzcvMTkgMTA6MzUgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA3LjA1
LjE5IGF0IDEwOjU5LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiBPbiA1LzcvMTkg
ODo0MCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAwNi4wNS4xOSBhdCAxNzoyNiwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+PiBPbiA1LzYvMTkgMTA6MDYgQU0sIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+PiBPbiAwMy4wNS4xOSBhdCAyMjo1MCwgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+Pj4gKyAgICBtYXNrID0gcGR4X2luaXRfbWFzaygx
VUxMIDw8IChNQVhfT1JERVIgKyBQQUdFX1NISUZUKSk7Cj4+Pj4+Cj4+Pj4+IFBBR0VfU0laRSA8
PCBNQVhfT1JERVI/Cj4+Pj4KPj4+PiBIbW1tLCBJIGFtIG5vdCBlbnRpcmVseSBjb252aW5jZSB0
aGlzIHdpbGwgZ2l2ZSB0aGUgY29ycmVjdCB2YWx1ZQo+Pj4+IGJlY2F1c2UgUEFHRV9TSVpFIGlz
IGRlZmluZWQgYXMgKF9BQygxLCBMKSA8PCBQQUdFX1NISUZULgo+Pj4KPj4+IE9oLCBpbmRlZWQs
IGZvciBhbiBhYnN0cmFjdCAzMi1iaXQgYXJjaCB0aGlzIHdvdWxkIGRlLWdlbmVyYXRlLCBkdWUK
Pj4+IHRvIE1BWF9PUkRFUiBiZWluZyAyMC4gTmV2ZXJ0aGVsZXNzIEkgdGhpbmsgdGhlIGV4cHJl
c3Npb24gdXNlZAo+Pj4gaW52aXRlcyBmb3IgImNsZWFuaW5nIHVwIiAobWFraW5nIHRoZSBzYW1l
IG1pc3Rha2UgSSd2ZSBtYWRlKSwgYW5kCj4+PiBzaW5jZSB0aGlzIGlzIGluIEFybS1zcGVjaWZp
YyBjb2RlICh3aGVyZSBNQVhfT1JERVIgaXMgMTgpIEkgdGhpbmsgaXQKPj4+IHdvdWxkIHN0aWxs
IGJlIGJldHRlciB0byB1c2UgdGhlIHN1Z2dlc3RlZCBhbHRlcm5hdGl2ZS4KPj4KPj4gVGhlIGNv
bW1lbnQgb24gdG9wIG9mIFBBR0VfU0laRSBpbiBhc20teDg2L3BhZ2UuaCBsZWFkcyB0byB0aGlu
ayB0aGF0Cj4+IFBBR0VfU0laRSBzaG91bGQgdXNlIHNpZ25lZCBxdWFudGl0aWVzLiBTbyBJIGFt
IG5vdCBzdXJlIHdoZXRoZXIgaXQgaXMKPj4gc2FmZSB0byBzd2l0Y2ggdG8gVUwgaGVyZS4KPiAK
PiBJdCdzIG5vdCAoYXQgbGVhc3Qgd2hlbiBrZWVwaW5nIHBhc3QgeDg2LTMyIGluIHRoZSBwaWN0
dXJlKTogRXh0ZW5kaW5nCj4gdG8gdW5zaWduZWQgbG9uZyBsb25nIHdvcmtzIGRpZmZlcmVudGx5
IHdoZW4gdGhlIHR5cGUgaXMgInVuc2lnbmVkIGxvbmciLgo+IFRoaXMgbWF0dGVycyB3aGVuIHVz
aW5nIHRoaW5ncyBsaWtlIH4oUEFHRV9TSVpFIC0gMSkuCj4gCj4+IElmIHdlIGtlZXAgUEFHRV9T
SVpFIGFzIHNpZ25lZCBxdWFudGl0aWVzLCB0aGVuIEkgd291bGQgcmF0aGVyIG5vdCB1c2VkCj4+
IHlvdXIgc3VnZ2VzdGlvbiBiZWNhdXNlIHRoaXMgbWF5IGludHJvZHVjZSBidWdneSBjb2RlIGlm
IE1BWF9PUkRFUiBpcwo+PiBldmVyIHVwZGF0ZWQgb24gQXJtLgo+IAo+IEEgQlVJTERfQlVHX09O
KCkgY291bGQgaGVscCBwcmV2ZW50IHRoaXMuCgpHb29kIHBvaW50LgoKPiAKPj4+Pj4gSSB3b25k
ZXIgd2hldGhlciBwZHhfaW5pdF9tYXNrKCkgaXRzZWxmIHdvdWxkbid0IGJldHRlciBhcHBseSB0
aGlzCj4+Pj4+IChsb3dlcikgY2FwCj4+Pj4KPj4+PiBEbyB5b3UgbWVhbiBhbHdheXMgcmV0dXJu
aW5nIChQQUdFX1NJWkUgPDwgTUFYX09SREVSKSBvciBjYXBwaW5nIHRoZQo+Pj4+IGluaXQgbWFz
az8KPj4+Pgo+Pj4+IE5vdGUgdGhhdCB0aGUgbGF0ZXIgd2lsbCBub3QgcHJvZHVjZSB0aGUgc2Ft
ZSBiZWhhdmlvciBhcyB0aGlzIHBhdGNoLgo+Pj4KPj4+IFNpbmNlIEknbSBub3Qgc3VyZSBJIHVu
ZGVyc3RhbmQgd2hhdCB5b3UgbWVhbiB3aXRoICJjYXBwaW5nIHRoZQo+Pj4gaW5pdCBtYXNrIiwg
SSdtIGFsc28gdW5jZXJ0YWluIHdoYXQgYWx0ZXJuYXRpdmUgYmVoYXZpb3IgeW91J3JlCj4+PiB0
aGlua2luZyBvZi4gV2hhdCBJJ20gc3VnZ2VzdGluZyBpcwo+Pj4KPj4+IHU2NCBfX2luaXQgcGR4
X2luaXRfbWFzayh1NjQgYmFzZV9hZGRyKQo+Pj4gewo+Pj4gICAgICAgcmV0dXJuIGZpbGxfbWFz
ayhtYXgoYmFzZV9hZGRyLCAodWludDY0X3QpUEFHRV9TSVpFIDw8IE1BWF9PUkRFUikgLSAxKTsK
Pj4+IH0KPj4KPj4gQXMgSSBwb2ludGVkIG91dCBpbiB0aGUgb3JpZ2luYWwgdGhyZWFkLCB0aGVy
ZSBhcmUgYSBjb3VwbGUgb2YgaXNzdWVzCj4+IHdpdGggdGhpcyBzdWdnZXN0aW9uOgo+PiAJMSkg
YmFua3MgYXJlIG5vdCBvcmRlcmVkIG9uIEFybSwgc28gdGhlIHBkeCBtYXNrIG1heSBnZXQgaW5p
dGlhbGl6ZWQKPj4gd2l0aCBhIGhpZ2hlciBiYW5rIGFkZHJlc3MgcHJldmVudGluZyB0aGUgUERY
IGNvbXByZXNzaW9uIHRvIHdvcmsKPiAKPiBUaGlzIGlzIG9ydGhvZ29uYWwgdG8gbXkgc3VnZ2Vz
dGlvbiBoZXJlLiBJdCdzIHVwIHRvIEFybSBjb2RlIHRvCj4gY2FsbCB0aGUgZnVuY3Rpb24gd2l0
aCB0aGUgbG93ZXN0IGJhbmsncyBiYXNlIGFkZHJlc3MgaW5zdGVhZCBvZgo+IHRoZSBmaXJzdCBv
bmUuID4KPj4gCTIpIHRoZSBQRFggd2lsbCBub3QgYmUgYWJsZSB0byBjb21wcmVzcyBhbnkgYml0
cyBiZXR3ZWVuIDAgYW5kIHRoZSBNU0IKPj4gMScgaW4gdGhlIGJhc2VfYWRkci4gSW4gb3RoZXIg
d29yZCwgZm9yIGEgYmFzZSBhZGRyZXNzIDB4MjAwMDAwMDAwCj4+ICg4R0IpLCB0aGUgaW5pdGlh
bCBtYXNrIHdpbGwgYmUgIDB4MWZmZmZmZmZmLiBJIGFtIGF3YXJlIG9mIHNvbWUKPj4gcGxhdGZv
cm1zIHdpdGggc29tZSBpbnRlcmVzdGluZyBmaXJzdCBiYW5rIGJhc2UgYWRkcmVzcyAoaS5lIGFi
b3ZlIDRHQikuCj4gCj4gV2VsbCwgd2UnZCBiZWVuIHRoZXJlIGJlZm9yZTogTW9yZSAiaW50ZXJl
c3RpbmciIGxheW91dHMgbWF5Cj4gaW5kZWVkIHJlcXVpcmUgYWRqdXN0bWVudHMgdG8gdGhlIGxv
Z2ljLiBUaGUgcGFydGljdWxhciBjYXNlCj4gd2UndmUgYmVlbiB0YWxraW5nIGFib3V0IHdhcyB0
aGVyZSBub3QgYmVpbmcgX2FueV8gUkFNCj4gYmVsb3cgYSBjZXJ0YWluIGJvdW5kYXJ5LgpZZXMg
dGhpcyBpcyB1bnJlbGF0ZWQgdG8gdGhlIGNhc2UgU3RlZmFubyBpcyB0cnlpbmcgdG8gZml4LCBo
b3dldmVyIApTdGVmYW5vICYgSSBoYXZlIGFsc28gYmVlbiBkaXNjdXNzaW5nIG9mIG90aGVyIHBv
dGVudGlhbCBpc3N1ZXMgd2l0aCBQRFguCgpJIHdvdWxkIHJhdGhlciB0cnkgdG8gYWRkcmVzcyB0
aGUgbW9zdCBpbXBvcnRhbnQvY29uY2VybmluZyBvbmUgYXQgdGhlIApzYW1lIHRpbWUuIFN0ZWZh
bm8ncyBwYXRjaCBpcyBhY3R1YWxseSBmaXhpbmcgYWxsIHRoZSBrbm93biBpc3N1ZXMgd2l0aCAK
UERYIG9uIEFybS4KCj4+IDIpIGlzIG5vdCBvdmVybHkgY3JpdGljYWwsIGJ1dCBJIHRoaW5rIDEp
IHNob3VsZCBiZSBhZGRyZXNzZWQuCj4+Cj4+IEF0IGxlYXN0IG9uIEFybSwgSSBkb24ndCBzZWUg
YW55IHJlYWwgdmFsdWUgdG8gaW5pdGlhbGl6ZSB0aGUgUERYIG1hc2sKPj4gd2l0aCBhIGJhc2Ug
YWRkcmVzcy4gSSB3b3VsZCBiZSBtb3JlIGtlZW4gdG8gaW1wbGVtZW50IHBkeF9pbml0X21hc2so
KSBhczoKPj4KPj4gcmV0dXJuIGZpbGxfbWFzaygoKHVpbnQ2NF90KVBBR0VfU0laRSA8PCBNQVhf
T1JERVIgLSAxKTsKPiAKPiBCdXQgKGJlc2lkZXMgdGhlIG1pc3NpbmcgY2xvc2luZyBwYXJlbnRo
ZXNlKSB0aGF0J3Mgbm90IHdoYXQgeDg2IHdhbnRzLgoKQ291bGQgeW91IHJlbWluZCBtZSB3aHk/
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

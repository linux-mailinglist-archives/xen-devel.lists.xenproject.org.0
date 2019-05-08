Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 075D917CEF
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 17:16:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOOFs-0002FW-3a; Wed, 08 May 2019 15:13:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOOFq-0002FQ-EL
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 15:13:10 +0000
X-Inumbo-ID: c8d9b30e-71a3-11e9-af5d-3787a23aabe9
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8d9b30e-71a3-11e9-af5d-3787a23aabe9;
 Wed, 08 May 2019 15:13:08 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 08 May 2019 09:13:06 -0600
Message-Id: <5CD2F1FC020000780022CE7E@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 08 May 2019 09:13:00 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <george.dunlap@citrix.com>
References: <5CCA94F9020000780022B02A@prv1-mh.provo.novell.com>
 <32a5db38-530f-1e6b-cbbd-f21ad687b149@citrix.com>
 <5CD2E037020000780022CE2D@prv1-mh.provo.novell.com>
 <c35f9967-214f-bea0-bea4-73148adb585f@citrix.com>
In-Reply-To: <c35f9967-214f-bea0-bea4-73148adb585f@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/mm: subsume set_gpfn_from_mfn() into
 guest_physmap_add_entry()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA4LjA1LjE5IGF0IDE2OjU5LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiA1LzgvMTkgMjo1NyBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA3LjA1
LjE5IGF0IDE4OjE1LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPj4+IE9uIDUv
Mi8xOSA3OjU4IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBUaGlzIGlzIHdoYXQgYm90aCBj
YWxsZXJzIG9mIGd1ZXN0X3BoeXNtYXBfYWRkX3BhZ2UoKSBpbiBtZW1vcnkuYyB3YW50Cj4+Pj4g
KGZvciB0aGUgIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZSgpIGNhc2UpLCBhbmQgaXQgaXMgYWxzbyB3
aGF0IGJvdGgKPj4+PiBjYWxsZXJzIGluIGdudHRhYl90cmFuc2ZlcigpIG5lZWQgKGJ1dCBoYXZl
IGJlZW4gbGFja2luZykuIFRoZSBvdGhlcgo+Pj4+ICh4ODYtc3BlY2lmaWMpIGNhbGxlcnMgYXJl
IGFsbCBIVk0tb25seSwgYW5kIGhlbmNlIHVuYWZmZWN0ZWQgYnkgdGhpcwo+Pj4+IGNoYW5nZS4K
Pj4+Cj4+PiBTb3JyeSwgd2hhdCdzIGdvaW5nIG9uIGhlcmU/Cj4+IAo+PiBJIGd1ZXNzIHRoYXQn
cyBhIEphbi13cm90ZS1hbi11bnBhcnNhYmxlLWRlc2NyaXB0aW9uLW9uY2UtYWdhaW4KPj4gcXVl
c3Rpb24/Cj4gCj4gU29ydCBvZiwgeWVzLiA6LSkgIEl0J3Mgbm90IHVucGFyc2FibGU7IGl0J3Mg
anVzdCBtaXNzaW5nIHNvbWUgaW5mb3JtYXRpb24uCj4gCj4+IDEpIFRoZSB0d28gY2FsbGVycyBp
biBjb21tb24vbWVtb3J5LmMgY3VycmVudGx5IGNhbGwgc2V0X2dwZm5fZnJvbV9tZm4oKQo+PiB0
aGVtc2VsdmVzLCBzbyBtb3ZpbmcgdGhlIGNhbGwgaW50byBndWVzdF9waHlzbWFwX2FkZF9wYWdl
KCkgaGVscHMKPj4gdGlkeSB0aGVpciBjb2RlLgo+PiAKPj4gMikgVGhlIHR3byBjYWxsZXJzIGlu
IGNvbW1vbi9ncmFudF90YWJsZS5jIGZhaWwgdG8gbWFrZSB0aGF0IGNhbGwgYWxvbmdzaWRlCj4+
IHRoZSBvbmUgdG8gZ3Vlc3RfcGh5c21hcF9hZGRfcGFnZSgpLCBzbyB3aWxsIGFjdHVhbGx5IGdl
dCBmaXhlZCBieSB0aGUKPj4gY2hhbmdlLgo+PiAKPj4gMykgT3RoZXIgY2FsbGVycyBhcmUgSFZN
IG9ubHkgYW5kIGFyZSBoZW5jZSB1bmFmZmVjdGVkIGJ5IGEgY2hhbmdlIHRvCj4+IHRoZSBmdW5j
dGlvbidzICFwYWdpbmdfbW9kZV90cmFuc2xhdGUoKSBwYXJ0Lgo+IAo+IFJpZ2h0LiAgSSB0aGlu
ayBJIHdvdWxkIGhhdmUgd3JpdHRlbiBzb21ldGhpbmcgbGlrZSB0aGlzOgoKV2VsbCwgSSBjYW4g
Y2VydGFpbmx5IHVzZSB5b3VyIHN1Z2dlc3RlZCB0ZXh0LCBidXQgZm9yIG5vdyBJCndhcyBtZWFu
aW5nIHRvIHBlcmhhcHMgdXNlIHRoZSB0ZXh0IGZyb20gbXkgZWFybGllciByZXBseSBhcwpyZXBs
YWNlbWVudCwgaWYgdGhhdCdzIGRlZW1lZCBiZXR0ZXIgdGhhbiB0aGUgb3JpZ2luYWwuIEp1c3QK
bGV0IG1lIGtub3cuCgpKYW4KCj4gODwtLS0KPiAKPiBXaGVuIGdpdmluZyBvd25lcnNoaXAgb2Yg
YSBwYWdlIHRvIGEgUFYgZ3Vlc3QsIGEgbnVtYmVyIG9mIHRoaW5ncyBuZWVkCj4gdG8gYmUgZG9u
ZSwgaW5jbHVkaW5nIGFkZGluZyB0aGUgcGFnZSBpbnRvIHRoZSBJT01NVSBpZiBhcHByb3ByaWF0
ZSwgYW5kCj4gdXBkYXRpbmcgdGhlIG0ycC4gIEF0IHRoZSBtb21lbnQgdGhpcyBpcyBkb25lIGJ5
IGNhbGxpbmcKPiBndWVzdF9waHlzbWFwX2FkZF9lbnRyeSgpIGFuZCBzZXRfZ3Bmbl9mcm9tX21m
bigpIHNlcGFyYXRlbHkuCj4gCj4gVW5mb3J0dW5hdGVseSwgdGhpcyBkdXBsaWNhdGlvbiBsZWFk
cyB0byBtaXN0YWtlczogZ250dGFiX3RyYW5zZmVyKCkKPiBjYWxscyBndWVzdF9waHlzbWFwX2Fk
ZF9lbnRyeSgpIGJ1dCBmYWlscyB0byBjYWxsIHNldF9ncGZuX2Zyb21fbWZuKCkuCj4gCj4gU2lu
Y2UgZ3Vlc3RfcGh5c21hcF9hZGRfZW50cnkoKSBpcyBhbHJlYWR5IHNwZWNpYWwtY2FzaW5nIFBW
IGd1ZXN0cywKPiBtb3ZlIHNldF9ncGZuX2Zyb21fbWZuKCkgaW50byB0aGF0IGZ1bmN0aW9uLgo+
IAo+IC0tLT44Cj4gCj4gSSBoYXZlIGEgdGVjaG5pY2FsIHF1ZXN0aW9uIGFib3V0IHRoZSBwYXRj
aDsgSSdsbCByZXBseSBpbmxpbmUgdG8gdGhlCj4gcGF0Y2ggaXRzZWxmLgo+IAo+ICAtR2Vvcmdl
CgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

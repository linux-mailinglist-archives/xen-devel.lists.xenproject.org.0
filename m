Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA41B189FB
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 14:47:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOiPa-0000hF-Id; Thu, 09 May 2019 12:44:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOiPY-0000h5-5O
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 12:44:32 +0000
X-Inumbo-ID: 3046f73b-7258-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3046f73b-7258-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 12:44:30 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 09 May 2019 06:44:29 -0600
Message-Id: <5CD420AD020000780022D27F@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 09 May 2019 06:44:29 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <george.dunlap@citrix.com>
References: <5CCA94F9020000780022B02A@prv1-mh.provo.novell.com>
 <64365dfd-3324-7b2d-f8d9-8600627f467f@citrix.com>
 <5CD2F2C2020000780022CE81@prv1-mh.provo.novell.com>
 <fb0740c4-4707-5da7-8555-d1bf2cb1e155@citrix.com>
In-Reply-To: <fb0740c4-4707-5da7-8555-d1bf2cb1e155@citrix.com>
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

Pj4+IE9uIDA4LjA1LjE5IGF0IDE3OjQ1LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiA1LzgvMTkgNDoxNiBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA4LjA1
LjE5IGF0IDE3OjA4LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPj4+IE9uIDUv
Mi8xOSA3OjU4IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYv
bW0vcDJtLmMKPj4+PiArKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPj4+PiBAQCAtODQxLDE1
ICs4NDEsMTkgQEAgZ3Vlc3RfcGh5c21hcF9hZGRfZW50cnkoc3RydWN0IGRvbWFpbiAqZAo+Pj4+
ICAgICAgICAgICAqIGFueSBndWVzdC1yZXF1ZXN0ZWQgdHlwZSBjaGFuZ2VzIHN1Y2NlZWQgYW5k
IHJlbW92ZSB0aGUgSU9NTVUKPj4+PiAgICAgICAgICAgKiBlbnRyeSkuCj4+Pj4gICAgICAgICAg
ICovCj4+Pj4gLSAgICAgICAgaWYgKCAhbmVlZF9pb21tdV9wdF9zeW5jKGQpIHx8IHQgIT0gcDJt
X3JhbV9ydyApCj4+Pj4gKyAgICAgICAgaWYgKCB0ICE9IHAybV9yYW1fcncgKQo+Pj4+ICAgICAg
ICAgICAgICByZXR1cm4gMDsKPj4+Cj4+PiBTbywgeW91IHNlZW0gdG8gYmUgY2xhaW1pbmcgdGhh
dCB0aGUgb25seSB3YXkgdG8gZ2V0IGhlcmUgaXMgdmlhCj4+PiBndWVzdF9waHlzbWFwX2FkZF9w
YWdlKCksCj4+IAo+PiBXZWxsLCBJJ20gbm90ICJjbGFpbWluZyIgYW55dGhpbmcgaGVyZSwgSSdt
IGp1c3QgbW9kaWZ5aW5nIGV4aXN0aW5nCj4+IGNvZGUgKGFuZCBubyBtb3JlIHRoYW4gd2hhdCBm
aXRzIHVuZGVyIHRoaXMgcGF0Y2gncyB0aXRsZSkuCj4gCj4gTm90IGhlcmUsIGJ1dCBpbiB0aGUg
b3RoZXIgZW1haWwuCj4gCj4gQnV0IGxvb2tpbmcgYXQgaXQgLS0gaXQgbG9va3MgbGlrZSBvbiB4
ODYsIGd1ZXN0X3BoeXNtYXBfYWRkX2VudHJ5KCkgaXMKPiBhY3R1YWxseSBjYWxsZWQgZnJvbSAq
ZXhhY3RseSogdHdvIGxvY2F0aW9uczoKPiBodm0vZ3JhbnRfdGFibGUuYzpjcmVhdGVfZ3JhbnRf
cDJtX21hcHBpbmcoKSwgYW5kCj4gcDJtLmg6Z3Vlc3RfcGh5c21hcF9hZGRfcGFnZSgpLgo+IAo+
IFdoaWNoIHNvcnQgb2YgbWFrZXMgbWUgd29uZGVyIGlmIGl0IG1pZ2h0IG5vdCBiZSBiZXR0ZXIg
dG8gYWRkIHRoZSBQVgo+IGNvbmRpdGlvbmFsIHRvIGd1ZXN0X3BoeXNtYXBfYWRkX3BhZ2UoKSBp
bnN0ZWFkLCBhbmQgbGVhdmUKPiBndWVzdF9waHlzbWFwX2FkZF9lbnRyeSgpIGFzIGVudGlyZWx5
IEhWTS4KClllcywgSSB0aGluayBJJ2xsIGRvIHRoaXMuCgo+Pj4gd2hpY2ggd2lsbCBhbHdheXMg
Y2FsbCB0aGlzIGZ1bmN0aW9uIHdpdGgKPj4+IHAybV9yYW1fcncuICBTbyB0aGVuIHdoYXQncyB0
aGUgcG9pbnQgb2YgdGhpcyBjb25kaXRpb25hbCBhdCBhbGwKPj4+IGFueW1vcmU/ICBXb3VsZCBp
dCBiZSBiZXR0ZXIgdG8gYWRkIGFuIEFTU0VSVCh0ID09IHAybV9yYW1fcncpIGhlcmU/Cj4+Pgo+
Pj4gQW5kIGlmIHdlIGV2ZXIgKmRvKiBnZXQgaGVyZSB3aXRoIHQgPT0gcDJtX3JhbV9ydywgZG8g
d2UgcmVhbGx5IG5vdCB3YW50Cj4+PiB0byBjYWxsIHNldF9ncGZuX2Zyb21fbWZuKCk/Cj4+IAo+
PiBUaGlua2luZyBhYm91dCBlLmcuIHAybV9ncmFudF9tYXBfKiBJIHdvdWxkbid0IHdhbnQgdG8g
YWRkIHRoZQo+PiBzdWdnZXN0ZWQgQVNTRVJUKCksIGFuZCB0aGUgTTJQIGRvZXNuJ3Qgd2FudCB1
cGRhdGluZyBpbiB0aGF0Cj4+IGNhc2UgZWl0aGVyLgo+IAo+IFNvcnJ5LCBkbyB5b3UgdGhpbmsg
cDJtX2dyYW50X21hcF8qIGlzIG1vcmUgbGlrZWx5IHNvbWVob3cgdGhhbgo+IHAybV9yYW1fcm8/
ICBJdCBsb29rcyB2ZXJ5IG11Y2ggbGlrZSBuZWl0aGVyIG9uZSBzaG91bGQgZXZlciBoYXBwZW4u
IFRoZQo+IHB1cnBvc2Ugb2YgaGF2aW5nIGFuIEFTU0VSVCgpIHRoZXJlIGlzIHRvIGFsZXJ0IGRl
dmVsb3BlcnMgbWFraW5nIHN1Y2ggYQo+IGZ1bmRhbWVudGFsIGNoYW5nZSB0byB0aGUgZmFjdCB0
aGF0IHRoZXkgbmVlZCB0byB0aGluayBjYXJlZnVsbHkgYWJvdXQKPiB3aGF0IHNob3VsZCBoYXBw
ZW4gaW4gdGhhdCBjYXNlLgoKTGV0J3MgZmFjZSBpdCAtIHAybSB0eXBlcyBhcmUgYSBIVk0gY29u
Y2VwdCBvbmx5IGFueXdheS4gQnV0IHRoaXMKZGlzY3Vzc2lvbiBiZWNvbWVzIG1vb3QgKGFmYWlj
dCkgd2l0aCB0aGUgY2hhbmdlIGFib3ZlIGFueXdheS4KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

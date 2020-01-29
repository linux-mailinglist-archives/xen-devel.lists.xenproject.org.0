Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F189714CC16
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 15:06:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwnx0-0002SB-5k; Wed, 29 Jan 2020 14:04:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LL5N=3S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwnwy-0002S6-RX
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 14:04:12 +0000
X-Inumbo-ID: 399645da-42a0-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 399645da-42a0-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 14:04:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 19F62ADAB;
 Wed, 29 Jan 2020 14:04:11 +0000 (UTC)
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <cover.1580148227.git.tamas.lengyel@intel.com>
 <fcf622c778b440f4ef2a0cbe707e018216a3aaab.1580148227.git.tamas.lengyel@intel.com>
 <a74262f0-0417-7a74-de07-b1c36a7d76ab@suse.com>
 <CABfawhmiyEj8-YhphMDyErGN2RXSb=zhFN8WG-pREeHT1mPzDg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f43ea7e3-f244-b07c-423f-5c2c81f49ed5@suse.com>
Date: Wed, 29 Jan 2020 15:04:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CABfawhmiyEj8-YhphMDyErGN2RXSb=zhFN8WG-pREeHT1mPzDg@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 7/9] xen/mem_access: Use
 __get_gfn_type_access in set_mem_access
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDEuMjAyMCAxNDo1MywgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFdlZCwgSmFu
IDI5LCAyMDIwIGF0IDY6MTAgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90
ZToKPj4KPj4gT24gMjcuMDEuMjAyMCAxOTowNiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4g
VXNlIF9fZ2V0X2dmbl90eXBlX2FjY2VzcyBpbnN0ZWFkIG9mIHAybS0+Z2V0X2VudHJ5IHRvIHRy
aWdnZXIgcGFnZS1mb3JraW5nCj4+PiB3aGVuIHRoZSBtZW1fYWNjZXNzIHBlcm1pc3Npb24gaXMg
YmVpbmcgc2V0IG9uIGEgcGFnZSB0aGF0IGhhcyBub3QgeWV0IGJlZW4KPj4+IGNvcGllZCBvdmVy
IGZyb20gdGhlIHBhcmVudC4KPj4KPj4gWW91IHRhbGtpbmcgb2YgcGFnZS1mb3JraW5nIGhlcmUs
IGRvbid0IHlvdSBtZWFuIC4uLgo+Pgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9hY2Nl
c3MuYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYwo+Pj4gQEAgLTMwMywx
MSArMzAzLDEwIEBAIHN0YXRpYyBpbnQgc2V0X21lbV9hY2Nlc3Moc3RydWN0IGRvbWFpbiAqZCwg
c3RydWN0IHAybV9kb21haW4gKnAybSwKPj4+ICAgICAgQVNTRVJUKCFhcDJtKTsKPj4+ICAjZW5k
aWYKPj4+ICAgICAgewo+Pj4gLSAgICAgICAgbWZuX3QgbWZuOwo+Pj4gICAgICAgICAgcDJtX2Fj
Y2Vzc190IF9hOwo+Pj4gICAgICAgICAgcDJtX3R5cGVfdCB0Owo+Pj4gLQo+Pj4gLSAgICAgICAg
bWZuID0gcDJtLT5nZXRfZW50cnkocDJtLCBnZm4sICZ0LCAmX2EsIDAsIE5VTEwsIE5VTEwpOwo+
Pj4gKyAgICAgICAgbWZuX3QgbWZuID0gX19nZXRfZ2ZuX3R5cGVfYWNjZXNzKHAybSwgZ2ZuX3go
Z2ZuKSwgJnQsICZfYSwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBQMk1fQUxMT0MsIE5VTEwsIGZhbHNlKTsKPj4KPj4gLi4uIFAyTV9VTlNIQVJFIGhlcmU/
Cj4gCj4gTm8sIFAyTV9VTlNIQVJFIGlzIG9ubHkgcmVxdWlyZWQgaWYgeW91IGFyZSBkb2luZyBh
IG1lbW9yeSB3cml0ZS4KPiBTZXR0aW5nIG1lbW9yeSBhY2Nlc3MgcGVybWlzc2lvbnMgaXMgbm90
IGEgbWVtb3J5IHdyaXRlLCBzbyBpdCdzCj4gc3VmZmljaWVudCB0byBqdXN0IGFsbG9jYXRlIHRo
ZSBwMm0gZW50cnkuIFAyTV9BTExPQ0FURSBhbHNvCj4gZW5jb21wYXNzZXMgZm9ya2luZyB0aGUg
ZW50cnkgaWYgdGhlcmUgaXMgYSBwYXJlbnQgVk0uCgpBaCwgSSBzZWUuIEFuZCBoZW5jZQpSZXZp
ZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKPj4gQWxzbyBzaG91bGRu
J3QgeW91IGhhdmUgQ2MtZWQgUGV0cmUgYW5kIEFsZXhhbmRydSBvbiB0aGlzIHBhdGNoCj4+IChm
b3IgdGhlaXIgUjogZW50cmllcykgYW5kIGF0IGxlYXN0IEdlb3JnZSAocGVyaGFwcyBhbHNvIEFu
ZHJldwo+PiBhbmQgbWUpIHRvIGdldCBhbiBhY2ssIHNlZWluZyB0aGF0IHlvdSdyZSB0aGUgb25s
eSBtYWludGFpbmVyCj4+IG9mIHRoZSBmaWxlPwo+IAo+IEkndmUgcmFuIC4vYWRkX21haW50YWlu
ZXJzLnBsIG9uIHRoZSBwYXRjaGVzLCBub3Qgc3VyZSB3aHkgbm9vbmUgZWxzZSBnb3QgQ0MtZC4K
Ckl0IG5vdCBwaWNraW5nIHVwIFI6IGVudHJpZXMgd291bGQgc2VlbSBsaWtlIGEgYnVnIHRvIG1l
LiBJdCBub3QKa25vd2luZyBvZiBuZXN0aW5nIG9mIG1haW50YWluZXJzaGlwIGlzIGVudGlyZWx5
IGV4cGVjdGVkIChvcgplbHNlIGl0IHdvdWxkIGFsc28gbmVlZCB0byBrbm93IHRoYXQgaXQncyAt
IGluIHRoaXMgY2FzZSAtIHlvdQp3aG8gaXMgaW52b2tpbmcgaXQpLgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

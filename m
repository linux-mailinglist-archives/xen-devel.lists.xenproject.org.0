Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB50158D36
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 12:08:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1TLD-0008CN-2Z; Tue, 11 Feb 2020 11:04:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lVjU=37=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j1TLB-0008CI-F9
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 11:04:29 +0000
X-Inumbo-ID: 4515e8e8-4cbe-11ea-852a-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4515e8e8-4cbe-11ea-852a-bc764e2007e4;
 Tue, 11 Feb 2020 11:04:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BEF65B385;
 Tue, 11 Feb 2020 11:04:26 +0000 (UTC)
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <cover.1581362050.git.tamas.lengyel@intel.com>
 <cf992d6e4dd09acc48afb42d43be4a900baee189.1581362050.git.tamas.lengyel@intel.com>
 <f620590a-147b-eeb8-707c-72cac10753bd@suse.com>
 <CABfawhn6Z3BO6JTEDzcR9TUYaOLQHv1KLOHv1LHXy-5Bw5QSog@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6be1e66b-9c0b-9dc6-2062-dda74ad2ccc8@suse.com>
Date: Tue, 11 Feb 2020 12:04:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CABfawhn6Z3BO6JTEDzcR9TUYaOLQHv1KLOHv1LHXy-5Bw5QSog@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v8 1/5] x86/p2m: Allow p2m_get_page_from_gfn
 to return shared entries
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDIuMjAyMCAxMToyOSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFR1ZSwgRmVi
IDExLCAyMDIwIGF0IDI6MTcgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90
ZToKPj4KPj4gT24gMTAuMDIuMjAyMCAyMDoyMSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4g
VGhlIG93bmVyIGRvbWFpbiBvZiBzaGFyZWQgcGFnZXMgaXMgZG9tX2NvdywgdXNlIHRoYXQgZm9y
IGdldF9wYWdlCj4+PiBvdGhlcndpc2UgdGhlIGZ1bmN0aW9uIGZhaWxzIHRvIHJldHVybiB0aGUg
Y29ycmVjdCBwYWdlIHVuZGVyIHNvbWUKPj4+IHNpdHVhdGlvbnMuIFRoZSBjaGVjayBpZiBkb21f
Y293IHNob3VsZCBiZSB1c2VkIHdhcyBvbmx5IHBlcmZvcm1lZCBpbgo+Pj4gYSBzdWJzZXQgb2Yg
dXNlLWNhc2VzLiBGaXhpbmcgdGhlIGVycm9yIGFuZCBzaW1wbGlmeWluZyB0aGUgZXhpc3Rpbmcg
Y2hlY2sKPj4+IHNpbmNlIHdlIGNhbid0IGhhdmUgYW55IHNoYXJlZCBlbnRyaWVzIHdpdGggZG9t
X2NvdyBiZWluZyBOVUxMLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8
dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+Cj4+Cj4+IEkgZmluZCBpdCBxdWl0ZSBkaXNhcHBvaW50
aW5nIHRoYXQgdGhlIGJsYW5rIGxpbmVzIHJlcXVlc3RlZCB0byBiZQo+PiBhZGRlZCAuLi4KPj4K
Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L21t
L3AybS5jCj4+PiBAQCAtNTc0LDExICs1NzQsMTIgQEAgc3RydWN0IHBhZ2VfaW5mbyAqcDJtX2dl
dF9wYWdlX2Zyb21fZ2ZuKAo+Pj4gICAgICAgICAgICAgICAgICBpZiAoIGZkb20gPT0gTlVMTCAp
Cj4+PiAgICAgICAgICAgICAgICAgICAgICBwYWdlID0gTlVMTDsKPj4+ICAgICAgICAgICAgICB9
Cj4+PiAtICAgICAgICAgICAgZWxzZSBpZiAoICFnZXRfcGFnZShwYWdlLCBwMm0tPmRvbWFpbikg
JiYKPj4+IC0gICAgICAgICAgICAgICAgICAgICAgLyogUGFnZSBjb3VsZCBiZSBzaGFyZWQgKi8K
Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgKCFkb21fY293IHx8ICFwMm1faXNfc2hhcmVkKCp0
KSB8fAo+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgIWdldF9wYWdlKHBhZ2UsIGRvbV9jb3cp
KSApCj4+PiAtICAgICAgICAgICAgICAgIHBhZ2UgPSBOVUxMOwo+Pj4gKyAgICAgICAgICAgIGVs
c2UKPj4+ICsgICAgICAgICAgICB7Cj4+PiArICAgICAgICAgICAgICAgIHN0cnVjdCBkb21haW4g
KmQgPSAhcDJtX2lzX3NoYXJlZCgqdCkgPyBwMm0tPmRvbWFpbiA6IGRvbV9jb3c7Cj4+PiArICAg
ICAgICAgICAgICAgIGlmICggIWdldF9wYWdlKHBhZ2UsIGQpICkKPj4KPj4gLi4gYWJvdmUgaGVy
ZSBhbmQgLi4uCj4+Cj4+PiBAQCAtNTk0LDggKzU5NSw5IEBAIHN0cnVjdCBwYWdlX2luZm8gKnAy
bV9nZXRfcGFnZV9mcm9tX2dmbigKPj4+ICAgICAgbWZuID0gZ2V0X2dmbl90eXBlX2FjY2Vzcyhw
Mm0sIGdmbl94KGdmbiksIHQsIGEsIHEsIE5VTEwpOwo+Pj4gICAgICBpZiAoIHAybV9pc19yYW0o
KnQpICYmIG1mbl92YWxpZChtZm4pICkKPj4+ICAgICAgewo+Pj4gKyAgICAgICAgc3RydWN0IGRv
bWFpbiAqZCA9ICFwMm1faXNfc2hhcmVkKCp0KSA/IHAybS0+ZG9tYWluIDogZG9tX2NvdzsKPj4+
ICAgICAgICAgIHBhZ2UgPSBtZm5fdG9fcGFnZShtZm4pOwo+Pgo+PiAuLi4gYWJvdmUgaGVyZSBz
dGlsbCBoYXZlbid0IGFwcGVhcmVkLiBObyBtYXR0ZXIgdGhhdCBpdCdzIGVhc3kgdG8KPj4gZG8g
c28gd2hpbGUgY29tbWl0dGluZywgd2hlbiB5b3Ugc2VuZCBhIG5ldyB2ZXJzaW9uIHlvdSBzaG91
bGQKPj4gcmVhbGx5IGFkZHJlc3Mgc3VjaCByZW1hcmtzIHlvdXJzZWxmLCBJIHRoaW5rLgo+IAo+
IE5vdGVkLiBJIGhhdmVuJ3QgYWRkcmVzc2VkIGl0IHNpbmNlIGl0IGFwcGVhcmVkIHRvIG1lIHRo
YXQgdGhpcyBwYXRjaAo+IGhhcyBiZWVuIHJlYWR5IHRvIGdvIGluIGZvciBsaWtlIDMgcmV2aXNp
b25zIGFscmVhZHkgYXMtaXMgZ2l2ZW4gdGhlCj4gYmxhbmstbGluZXMgd2VyZSBub24tYmxvY2tl
cnMuCgpUaGUgcGF0Y2ggY29udGludWVzIHRvIGxhY2sgYSBtYWludGFpbmVyIGFjay4gSGVuY2Ug
aXQgaGFzbid0IGJlZW4KcmVhZHkgdG8gZ28gaW4gYXQgYW55IHBvaW50IGluIHRpbWUuCgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

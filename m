Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBDC1459A6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 17:21:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuIgo-0001ba-WA; Wed, 22 Jan 2020 16:17:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q9GK=3L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuIgm-0001bV-S7
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 16:17:08 +0000
X-Inumbo-ID: 9d9eca2a-3d32-11ea-aecd-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d9eca2a-3d32-11ea-aecd-bc764e2007e4;
 Wed, 22 Jan 2020 16:16:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3A16BADE2;
 Wed, 22 Jan 2020 16:16:58 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20200121120009.1767-1-pdurrant@amazon.com>
 <20200121120009.1767-4-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8cbb41bd-760e-1428-157b-4bdc64d1aa76@suse.com>
Date: Wed, 22 Jan 2020 17:17:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200121120009.1767-4-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/3] x86 / vmx: use a 'normal' domheap page
 for APIC_DEFAULT_PHYS_BASE
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDEuMjAyMCAxMzowMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IHZteF9hbGxvY192bGFw
aWNfbWFwcGluZygpIGN1cnJlbnRseSBjb250YWlucyBzb21lIHZlcnkgb2RkIGxvb2tpbmcgY29k
ZQo+IHRoYXQgYWxsb2NhdGVzIGEgTUVNRl9ub19vd25lciBkb21oZWFwIHBhZ2UgYW5kIHRoZW4g
c2hhcmVzIHdpdGggdGhlIGd1ZXN0Cj4gYXMgaWYgaXQgd2VyZSBhIHhlbmhlYXAgcGFnZS4gVGhp
cyB0aGVuIHJlcXVpcmVzIHZteF9mcmVlX3ZsYXBpY19tYXBwaW5nKCkKPiB0byBjYWxsIGEgc3Bl
Y2lhbCBmdW5jdGlvbiBpbiB0aGUgbW0gY29kZTogZnJlZV9zaGFyZWRfZG9taGVhcF9wYWdlKCku
Cj4gCj4gQnkgdXNpbmcgYSAnbm9ybWFsJyBkb21oZWFwIHBhZ2UgKGkuZS4gYnkgbm90IHBhc3Np
bmcgTUVNRl9ub19vd25lciB0bwo+IGFsbG9jX2RvbWhlYXBfcGFnZSgpKSwgdGhlIG9kZCBsb29r
aW5nIGNvZGUgaW4gdm14X2FsbG9jX3ZsYXBpY19tYXBwaW5nKCkKPiBjYW4gc2ltcGx5IHVzZSBn
ZXRfcGFnZV9hbmRfdHlwZSgpIHRvIHNldCB1cCBhIHdyaXRhYmxlIG1hcHBpbmcgYmVmb3JlCj4g
aW5zZXJ0aW9uIGluIHRoZSBQMk0gYW5kIHZteF9mcmVlX3ZsYXBpY19tYXBwaW5nKCkgY2FuIHNp
bXBseSByZWxlYXNlIHRoZQo+IHBhZ2UgdXNpbmcgcHV0X3BhZ2VfYWxsb2NfcmVmKCkgZm9sbG93
ZWQgYnkgcHV0X3BhZ2VfYW5kX3R5cGUoKS4gVGhpcwo+IHRoZW4gYWxsb3dzIGZyZWVfc2hhcmVk
X2RvbWhlYXBfcGFnZSgpIHRvIGJlIHB1cmdlZC4KPiAKPiBUaGVyZSBpcywgaG93ZXZlciwgc29t
ZSBmYWxsLW91dCBmcm9tIHRoaXMgc2ltcGxpZmljYXRpb246Cj4gCj4gLSBhbGxvY19kb21oZWFw
X3BhZ2UoKSB3aWxsIG5vdyBjYWxsIGFzc2lnbl9wYWdlcygpIGFuZCBydW4gaW50byB0aGUgZmFj
dAo+ICAgdGhhdCAnbWF4X3BhZ2VzJyBpcyBub3Qgc2V0IHVudGlsIHNvbWUgdGltZSBhZnRlciBk
b21haW5fY3JlYXRlKCkuIFRvCj4gICBhdm9pZCBhbiBhbGxvY2F0aW9uIGZhaWx1cmUsIGFzc2ln
bl9wYWdlcygpIGlzIG1vZGlmaWVkIHRvIGlnbm9yZSB0aGUKPiAgIG1heF9wYWdlcyBsaW1pdCBp
ZiAnY3JlYXRpb25fZmluaXNoZWQnIGlzIGZhbHNlLiBUaGF0IHZhbHVlIGlzIG5vdCBzZXQKPiAg
IHRvIHRydWUgdW50aWwgZG9tYWluX3VucGF1c2VfYnlfc3lzdGVtY29udHJvbGxlcigpIGlzIGNh
bGxlZCwgYW5kIHRodXMKPiAgIHRoZSBndWVzdCBjYW5ub3QgcnVuIChhbmQgaGVuY2UgY2F1c2Ug
bWVtb3J5IGFsbG9jYXRpb24pIHVudGlsCj4gICBjcmVhdGlvbl9maW5pc2hlZCBpcyBzZXQgdG8g
dHJ1ZS4KCkJ1dCB0aGlzIGNoZWNrIGlzIGFsc28gdG8gZ3VhcmQgYWdhaW5zdCB0aGUgdG9vbCBz
dGFjayAob3IgcG9zc2libHkKdGhlIGNvbnRyb2xsaW5nIHN0dWJkb20pIHRvIGNhdXNlIGV4Y2Vz
cyBhbGxvY2F0aW9uLiBJIGRvbid0IHRoaW5rCnRoZSBjaGVja2luZyBzaG91bGQgYmUgdW5kZXJt
aW5lZCBsaWtlIHRoaXMgKGFuZCBzZWUgYWxzbyBiZWxvdykuCgpTaW5jZSBjZXJ0YWlubHkgeW91
J3ZlIGxvb2tlZCBpbnRvIHRoaXMgd2hpbGUgY3JlYXRpbmcgdGhlIHBhdGNoLApjb3VsZCB5b3Ug
cmVtaW5kIG1lIHdoeSBpdCBpcyB0aGF0IHRoaXMgcGFnZSBuZWVkcyB0byBiZSBvd25lZCAoYXMK
aW4gaXRzIG93bmVyIGZpZWxkIHNldCBhY2NvcmRpbmdseSkgYnkgdGhlIGd1ZXN0PyBJdCdzIGEg
aGVscGVyCnBhZ2Ugb25seSwgYWZ0ZXIgYWxsLgoKPiBAQCAtMzAzNCwxMiArMzAzNCwyMiBAQCBz
dGF0aWMgaW50IHZteF9hbGxvY192bGFwaWNfbWFwcGluZyhzdHJ1Y3QgZG9tYWluICpkKQo+ICAg
ICAgaWYgKCAhY3B1X2hhc192bXhfdmlydHVhbGl6ZV9hcGljX2FjY2Vzc2VzICkKPiAgICAgICAg
ICByZXR1cm4gMDsKPiAgCj4gLSAgICBwZyA9IGFsbG9jX2RvbWhlYXBfcGFnZShkLCBNRU1GX25v
X293bmVyKTsKPiArICAgIHBnID0gYWxsb2NfZG9taGVhcF9wYWdlKGQsIDApOwoKRGlkIHlvdSBj
b25zaWRlciBwYXNzaW5nIE1FTUZfbm9fcmVmY291bnQgaGVyZSwgdG8gYXZvaWQgdGhlCmZpZGRs
aW5nIHdpdGggYXNzaWduX3BhZ2VzKCk/IFRoYXQnbGwgaW4gcGFydGljdWxhciBhbHNvCmF2b2lk
IC4uLgoKPiAtLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+ICsrKyBiL3hlbi9jb21tb24v
cGFnZV9hbGxvYy5jCj4gQEAgLTIyNjksNyArMjI2OSw4IEBAIGludCBhc3NpZ25fcGFnZXMoCj4g
IAo+ICAgICAgaWYgKCAhKG1lbWZsYWdzICYgTUVNRl9ub19yZWZjb3VudCkgKQo+ICAgICAgewo+
IC0gICAgICAgIGlmICggdW5saWtlbHkoKGQtPnRvdF9wYWdlcyArICgxIDw8IG9yZGVyKSkgPiBk
LT5tYXhfcGFnZXMpICkKPiArICAgICAgICBpZiAoIHVubGlrZWx5KChkLT50b3RfcGFnZXMgKyAo
MSA8PCBvcmRlcikpID4gZC0+bWF4X3BhZ2VzKSAmJgo+ICsgICAgICAgICAgICAgZC0+Y3JlYXRp
b25fZmluaXNoZWQgKQo+ICAgICAgICAgIHsKPiAgICAgICAgICAgICAgZ3ByaW50ayhYRU5MT0df
SU5GTywgIk92ZXItYWxsb2NhdGlvbiBmb3IgZG9tYWluICV1OiAiCj4gICAgICAgICAgICAgICAg
ICAgICAgIiV1ID4gJXVcbiIsIGQtPmRvbWFpbl9pZCwKCi4uLiBpbnZva2luZyBkb21haW5fYWRq
dXN0X3RvdF9wYWdlcygpIHJpZ2h0IGJlbG93IGhlcmUsIHdoaWNoCmlzIHdyb25nIGZvciBoZWxw
ZXIgcGFnZXMgbGlrZSB0aGlzIG9uZSAoYXMgaXQgcmVkdWNlcyB0aGUKYW1vdW50IHRoZSBkb21h
aW4gaXMgYWN0dWFsbHkgcGVybWl0dGVkIHRvIGFsbG9jYXRlKS4KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6116144DA8
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 09:26:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuBJG-0006T9-3b; Wed, 22 Jan 2020 08:24:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q9GK=3L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuBJF-0006T2-B4
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 08:24:21 +0000
X-Inumbo-ID: 963b73f6-3cf0-11ea-bbed-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 963b73f6-3cf0-11ea-bbed-12813bfff9fa;
 Wed, 22 Jan 2020 08:24:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D3B79B2D4;
 Wed, 22 Jan 2020 08:24:16 +0000 (UTC)
To: Wei Xu <xuwei5@hisilicon.com>
References: <5E26C935.9080107@hisilicon.com>
 <c15dab3d-3c25-4d14-506a-a6859a5dd99b@suse.com>
 <5E27E466.50109@hisilicon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e5082f00-ad1a-ab2b-bc1f-b58714d08a02@suse.com>
Date: Wed, 22 Jan 2020 09:24:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <5E27E466.50109@hisilicon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] arm/acpi: Add __acpi_unmap_table function
 for ARM
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Linuxarm <linuxarm@huawei.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, xen-devel@lists.xenproject.org,
 Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDEuMjAyMCAwNjo1NywgV2VpIFh1IHdyb3RlOgo+IE9uIDIwMjAvMS8yMSAxOTowMiwg
SmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIxLjAxLjIwMjAgMTA6NDksIFdlaSBYdSB3cm90ZToK
Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL2FjcGkvb3NsLmMKPj4+ICsrKyBiL3hlbi9kcml2ZXJzL2Fj
cGkvb3NsLmMKPj4+IEBAIC0xMTQsNiArMTE0LDggQEAgdm9pZCBhY3BpX29zX3VubWFwX21lbW9y
eSh2b2lkIF9faW9tZW0gKiB2aXJ0LCBhY3BpX3NpemUgc2l6ZSkKPj4+ICAgCQlyZXR1cm47Cj4+
PiAgIAl9Cj4+PiAgIAo+Pj4gKwlfX2FjcGlfdW5tYXBfdGFibGUodmlydCwgc2l6ZSk7Cj4+PiAr
Cj4+PiAgIAlpZiAoc3lzdGVtX3N0YXRlID49IFNZU19TVEFURV9ib290KQo+Pj4gICAJCXZ1bm1h
cCgodm9pZCAqKSgodW5zaWduZWQgbG9uZyl2aXJ0ICYgUEFHRV9NQVNLKSk7Cj4+Cj4+IEhvdyBj
YW4gaXQgcG9zc2libHkgYmUgY29ycmVjdCB0byBjYWxsIGJvdGggdnVubWFwKCkgYW5kIHlvdXIg
bmV3Cj4+IGZ1bmN0aW9uPyBBbmQgaG93IGlzIHRoaXMsIGhhdmluZyBqc3V0IGFuIEFybSBpbXBs
ZW1lbnRhdGlvbiwKPj4gZ29pbmcgdG8gY29tcGlsZSBmb3IgeDg2PyBTZWVpbmcgdGhhdCB4ODYg
Z2V0cyBhd2F5IHdpdGhvdXQgdGhpcywKPj4gbWF5IEkgc3VnZ2VzdCB0aGF0IHlvdSBsb29rIGF0
IHRoZSB4ODYgY29kZSB0byBzZWUgd2h5IHRoYXQgaXMsCj4+IGFuZCB0aGVuIGNvbnNpZGVyIHdo
ZXRoZXIgdGhlIHNhbWUgbW9kZWwgbWFrZXMgc2Vuc2UgZm9yIEFybT8gQW5kCj4+IGlmIGl0IGRv
ZXNuJ3QsIGNoZWNrIHdoZXRoZXIgdGhlIG5ldyBBcm0gbW9kZWwgd291bGQgbWFrZSBzZW5zZQo+
PiB0byBhbHNvIHVzZSBvbiB4ODY/Cj4+Cj4gCj4gU29ycnksIEkgdGhvdWdodCBhY3BpX29zX3Vu
bWFwX21lbW9yeSBpcyBzcGVjaWZpYyBmb3IgQVJNLgo+IEp1c3Qgbm93IEkgY2hlY2tlZCBtYXBf
cGFnZXNfdG9feGVuIGluIGFyY2gveDg2L21tLmMgYW5kIGRpZCBub3QgZmluZCBhbnkgcGxhY2UK
PiB0byBmb3JiaWQgdGhlIG1vZGlmaWNhdGlvbiBvZiBhIG1hcHBpbmcuIE1heWJlIGNsZWFyaW5n
IG1hcHBpbmcgYmVmb3JlIG1vZGlmaWNhdGlvbgo+IGlzIG5vdCBuZWNlc3NhcnkgZm9yIFg4Ni4g
RG8geW91IHRoaW5rIGlzIGl0IE9LIHRvIGFkZCBhIGVtcHR5IHN0dWIgZnVuY3Rpb24KPiBmb3Ig
dGhlIG90aGVyIGNhc2VzIGV4Y2VwdCBBUk0gYW5kIGludm9rZSBpdCBhZnRlciB2dW5tYXAgYXMg
Zm9sbG93aW5nPwoKTm8uIFRoaXMgaXMgc3RpbGwgZG9pbmcgdHdvIHVubWFwcyB3aGVuIHN5c3Rl
bV9zdGF0ZSA+PSBTWVNfU1RBVEVfYm9vdC4KQXQgdGhlIHZlcnkgbGVhc3QgdGhpcyBuZWVkIHRv
IGdvIGluIGFuICJlbHNlIiBibG9jayB0byB0aGUgZXhpc3RpbmcKaWYoKS4gVGhlcmUgYWxzbyBz
aG91bGRuJ3QgYmUgYSBibGFua2V0IGVtcHR5IHN0dWIgZnVuY3Rpb24uIEV2ZW4gb24KeDg2IGl0
IHdvdWxkIGJlIF9iZXR0ZXJfIChhbGJlaXQgbm90IHN0cmljdGx5IG5lZWRlZCkgaWYgdGhlIHVu
bWFwCmluZGVlZCB6YXBwZWQgdGhlIGZpeG1hcCBtYXBwaW5ncy4gQW5kIGZvciBwb3RlbnRpYWwg
ZnV0dXJlIHBvcnRzIGl0CndvdWxkIGJlIG91dHJpZ2h0IGRhbmdlcm91cyB0byBoYXZlIHN1Y2gg
YW4gZW1wdHkgc3R1Yi4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==

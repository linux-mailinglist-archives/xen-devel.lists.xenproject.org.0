Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 286C1C098A
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 18:26:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDt2n-0003SK-Hm; Fri, 27 Sep 2019 16:24:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tE9W=XW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDt2m-0003SF-C0
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 16:24:32 +0000
X-Inumbo-ID: 487260a2-e143-11e9-967f-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 487260a2-e143-11e9-967f-12813bfff9fa;
 Fri, 27 Sep 2019 16:24:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 373BE1000;
 Fri, 27 Sep 2019 09:24:30 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 694633F534;
 Fri, 27 Sep 2019 09:24:29 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-5-julien.grall@arm.com> <87v9te7y1m.fsf@epam.com>
 <bbb73576-a2ae-16d8-5147-34a584721e7c@arm.com> <87r2419am7.fsf@epam.com>
 <df6b891c-2670-47d9-ae0d-223161edc225@arm.com> <87muep984i.fsf@epam.com>
 <8bc36926-a00f-d20b-c3b2-12491ed576de@arm.com> <87lfu995w9.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <4c8524cc-7186-c4f4-d09d-20c7a534c900@arm.com>
Date: Fri, 27 Sep 2019 17:24:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87lfu995w9.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 04/10] xen/arm: Ensure the SSBD
 workaround is re-enabled right after exiting a guest
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNy8wOS8yMDE5IDE1OjIxLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiAKPiBK
dWxpZW4gR3JhbGwgd3JpdGVzOgo+IAo+PiBPbiAyNy8wOS8yMDE5IDE0OjMzLCBWb2xvZHlteXIg
QmFiY2h1ayB3cm90ZToKPj4+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4+Pj4gT24gMjcvMDkvMjAx
OSAxMzozOSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Pj4+IEp1bGllbiBHcmFsbCB3cml0
ZXM6Cj4+Pj4+PiBPbiAyNy8wOS8yMDE5IDEyOjU2LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToK
Pj4+Pj4+PiBKdWxpZW4gR3JhbGwgd3JpdGVzOgo+Pj4+PiBPciBtYXliZSwgd2Ugc2hvdWxkIG5v
dCBzcGxpdCB0aGUgZnVuY3Rpb24gYXQgYWxsPyBJbnN0ZWFkLCB3ZSBlbmFibGUKPj4+Pj4gaW50
ZXJydXB0cyByaWdodCBpbiB0aGUgbWlkZGxlIG9mIGl0Lgo+Pj4+Cj4+Pj4gSSB0aG91Z2h0IGFi
b3V0IHRoaXMgYnV0IEkgZGlkbid0IG11Y2ggbGlrZSB0aGUgcmVzdWx0aW5nIGNvZGUuCj4+Pj4K
Pj4+PiBUaGUgaW5zdHJ1Y3Rpb24gdG8gdW5tYXNrIGludGVycnVwdHMgcmVxdWlyZXMgdG8gdGFr
ZSBhbiBpbW1lZGlhdGUKPj4+PiAoaW5kaWNhdGVzIHdoaWNoIGludGVycnVwdHMgdG8gdW5tYXNr
KS4gQXMgbm90IGFsbCB0aGUgdHJhcHMgcmVxdWlyZQo+Pj4+IHRvIHVubWFzayB0aGUgc2FtZSBp
bnRlcnJ1cHRzLCB3ZSB3b3VsZCBlbmQgdXAgdG8gaGF2ZSB0byBhIGJ1bmNoIG9mCj4+Pj4gaWYg
aW4gdGhlIGNvZGUgdG8gc2VsZWN0IHRoZSByaWdodCB1bm1hc2tpbmcuCj4+PiBBaCwgeWVzLCB0
aGlzIGlzIHRoZSBwcm9ibGVtLiBXZSBjYW4gcHJvdmlkZSBjYWxsYmFjayB0bwo+Pj4gZW50ZXJf
aHlwZXJ2aXNvcl9mcm9tX2d1ZXN0KCkuCj4+Cj4+IEkgYW0gbm90IHN1cmUgd2hhdCB5b3UgbWVh
biBieSB0aGlzLiBEbyB5b3UgbWVhbiBhIGNhbGxiYWNrIHRoYXQgd2lsbAo+PiB1bm1hc2sgdGhl
IGludGVycnVwdHM/Cj4gWWVzLiBZb3UgY2FuIHBhc3MgZnVuY3Rpb24gcG9pbnRlciB0byBlbnRl
cl9oeXBlcnZpc29yX2Zyb21fZ3Vlc3QoKS4gVG8KPiBhIGZ1bmN0aW9uLCB0aGF0IHdpbGwgdW5t
YXNrIHRoZSBpbnRlcnJ1cHRzLiBJJ20gc3VyZSB0aGF0IGd1ZXN0X3ZlY3Rvcgo+IG1hY3JvIGNh
biBnZW5lcmF0ZSBpdCBmb3IgeW91LiBTb21ldGhpbmcgbGlrZSB0aGlzOgo+IAo+ICAgICAgICAg
IC5tYWNybyAgZ3Vlc3RfdmVjdG9yIGNvbXBhdCwgaWZsYWdzLCB0cmFwLCBzYXZlX3gwX3gxPTEK
PiAgICAgICAgICBlbnRyeSAgIGh5cD0wLCBjb21wYXQ9XGNvbXBhdCwgc2F2ZV94MF94MT1cc2F2
ZV94MF94MQo+ICAgICAgICAgIC8qCj4gICAgICAgICAgICogVGhlIHZTRXJyb3Igd2lsbCBiZSBj
aGVja2VkIHdoaWxlIFNLSVBfU1lOQ0hST05JWkVfU0VSUk9SX0VOVFJZX0VYSVQKPiAgICAgICAg
ICAgKiBpcyBub3Qgc2V0LiBJZiBhIHZTRXJyb3IgdG9vayBwbGFjZSwgdGhlIGluaXRpYWwgZXhj
ZXB0aW9uIHdpbGwgYmUKPiAgICAgICAgICAgKiBza2lwcGVkLiBFeGl0IEFTQVAKPiAgICAgICAg
ICAgKi8KPiAgICAgICAgICBBTFRFUk5BVElWRSgiYmwgY2hlY2tfcGVuZGluZ192c2Vycm9yOyBj
Ym56IHgwLCAxZiIsCj4gICAgICAgICAgICAgICAgICAgICAgIm5vcDsgbm9wIiwKPiAgICAgICAg
ICAgICAgICAgICAgICBTS0lQX1NZTkNIUk9OSVpFX1NFUlJPUl9FTlRSWV9FWElUKQo+ICAgICAg
ICAgIGxkciAgICAgeDAsID0xZgo+ICAgICAgICAgIGJsICAgICAgZW50ZXJfaHlwZXJ2aXNvcl9m
cm9tX2d1ZXN0Cj4gICAgICAgICAgbW92ICAgICB4MCwgc3AKPiAgICAgICAgICBibCAgICAgIGRv
X3RyYXBfXHRyYXAKPiAgICAgICAgICBiICAgICAgIDFmCj4gMjoKPiAgICAgICAgICBtc3IgICAg
IGRhaWZjbHIsIFxpZmxhZ3MKPiAgICAgICAgICByZXQKPiAxOgo+ICAgICAgICAgIGV4aXQgICAg
aHlwPTAsIGNvbXBhdD1cY29tcGF0Cj4gICAgICAgICAgLmVuZG0KClRCSCwgSSBkb24ndCBzZWUg
d2hhdCdzIHRoZSBwb2ludCB5b3UgYXJlIHRyeWluZyB0byBtYWtlIGhlcmUuIFllcywgdGhlcmUg
YXJlIAptYW55IHdheSB0byB3cml0ZSBhIGNvZGUgYW5kIHBvc3NpYmlsaXR5IHRvIG1ha2Ugb25l
IGZ1bmN0aW9uLiBZb3UgY291bGQgYWxzbyAKY3JlYXRlIGEgc2tlbGV0b24gbWFjcm8gZm9yIGVu
dGVyX2h5cGVydmlzb3JfZnJvbV9ndWVzdCBhbmQgZ2VuZXJhdGUgTiBvZiB0aGVtIAoob25lIHBl
ciBzZXQgb2YgdW5tYXNrIGludGVycnVwdHMpIGFuZCBjYWxsIHRoZW0uCgpCdXQgYXJlIHRoZXkg
cmVhbGx5IHdvcnRoIGl0PwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

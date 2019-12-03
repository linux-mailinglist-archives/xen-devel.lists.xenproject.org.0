Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64587110029
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 15:31:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic9AQ-0007SL-0I; Tue, 03 Dec 2019 14:28:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zSMg=ZZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ic9AO-0007SG-Vf
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 14:28:41 +0000
X-Inumbo-ID: 334d589c-15d9-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 334d589c-15d9-11ea-a55d-bc764e2007e4;
 Tue, 03 Dec 2019 14:28:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AE8EABA13;
 Tue,  3 Dec 2019 14:28:39 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1575057677-13839-1-git-send-email-igor.druzhinin@citrix.com>
 <47063d30-dd6a-2528-21f3-0bc7e7951b34@suse.com>
 <3e83ed09-823a-5533-b04d-ca09d7b5016f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <21107177-aee4-e3ff-f4c2-8f2f23c70755@suse.com>
Date: Tue, 3 Dec 2019 15:28:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <3e83ed09-823a-5533-b04d-ca09d7b5016f@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/AMD: unbreak CPU hotplug on
 AMD systems without RstrFpErrPtrs
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
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org, wl@xen.org,
 roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMTIuMjAxOSAxNToyMSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMDMvMTIvMjAx
OSAxMDowOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI5LjExLjIwMTkgMjE6MDEsIElnb3Ig
RHJ1emhpbmluIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS9jb21tb24uYwo+Pj4g
KysrIGIveGVuL2FyY2gveDg2L2NwdS9jb21tb24uYwo+Pj4gQEAgLTU0LDcgKzU0LDcgQEAgc3Rh
dGljIHVuc2lnbmVkIGludCBmb3JjZWRfY2Fwc1tOQ0FQSU5UU107Cj4+PiAgCj4+PiAgREVGSU5F
X1BFUl9DUFUoYm9vbCwgZnVsbF9nZHRfbG9hZGVkKTsKPj4+ICAKPj4+IC12b2lkIF9faW5pdCBz
ZXR1cF9jbGVhcl9jcHVfY2FwKHVuc2lnbmVkIGludCBjYXApCj4+PiArdm9pZCBzZXR1cF9jbGVh
cl9jcHVfY2FwKHVuc2lnbmVkIGludCBjYXApCj4+PiAgewo+Pj4gIAljb25zdCB1aW50MzJfdCAq
ZGZzOwo+Pj4gIAl1bnNpZ25lZCBpbnQgaTsKPj4+IEBAIC04Myw3ICs4Myw3IEBAIHZvaWQgX19p
bml0IHNldHVwX2NsZWFyX2NwdV9jYXAodW5zaWduZWQgaW50IGNhcCkKPj4+ICAJfQo+Pj4gIH0K
Pj4+ICAKPj4+IC12b2lkIF9faW5pdCBzZXR1cF9mb3JjZV9jcHVfY2FwKHVuc2lnbmVkIGludCBj
YXApCj4+PiArdm9pZCBzZXR1cF9mb3JjZV9jcHVfY2FwKHVuc2lnbmVkIGludCBjYXApCj4+PiAg
ewo+Pj4gIAlpZiAoX190ZXN0X2FuZF9zZXRfYml0KGNhcCwgZm9yY2VkX2NhcHMpKQo+Pj4gIAkJ
cmV0dXJuOwo+Pgo+PiBUaGUgdHdvIGZ1bmN0aW9ucyBhcmUgZGVsaWJlcmF0ZWx5IF9faW5pdCwg
YXMgYW55IGNhbGwgdG8gdGhlbQo+PiBwb3N0LWluaXQgaXMgbm90IGdvaW5nIHRvIHRha2Ugc3lz
dGVtLXdpZGUgZWZmZWN0LiBUaGVzZSBmdW5jdGlvbnMKPj4gc2hvdWxkIHJlYWxseSBiZSBfX2lu
aXRfcHJlc21wLCBpZiB3ZSBoYWQgc29tZXRoaW5nIGxpa2UgdGhpcy4gTm8KPj4gdXNlIG9mIHRo
ZW0gb24gYW4gQVAgYm9vdCBwYXRoIGlzIGdvaW5nIHRvIGFmZmVjdCB0aGUgQlNQLCBhbmQKPj4g
aGVuY2Ugd2lsbCBsZWF2ZSB0aGUgc3lzdGVtIGluIGFuIGluY29uc2lzdGVudCBzdGF0ZS4KPiAK
PiBPbiBzZWNvbmQgdGhvdWdodCwgbG9va2luZyBhdCBob3cgbWFueSBwbGFjZXMgYWN0dWFsbHkg
Y2FsbCAKPiBzZXR1cF97Zm9yY2UsY2xlYXJ9X2NwdV9jYXAoKSBvbiBBUCBpbml0IHBhdGggaXQg
c3RpbGwgbWFrZXMgc2Vuc2UKPiB0byBrZWVwIHRoZSB2MSBhcHByb2FjaCBhcyBvdGhlcndpc2Ug
d2Ugd2lsbCBoYXZlIHRvIG1hbnVhbGx5IHdvcmthcm91bmQKPiBldmVyeSBzaW5nbGUgcGxhY2Ug
d2hlcmUgaXQgaGFwcGVucy4KCldoaWxlIG5vdCBhbGwgb2YgdGhlIG90aGVyIHVzZXMgb2YgdGhl
IGZ1bmN0aW9ucyBoYXBwZW4gZnJvbSBfX2luaXQKZnVuY3Rpb25zLCBhbGwgb2YgdGhlbSBhcmUg
dW5yZWFjaGFibGUgb24gQVBzIGFmYWljdCAtIEkndmUganVzdApnb25lIHRocm91Z2ggYWxsIGlu
c3RhbmNlcy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==

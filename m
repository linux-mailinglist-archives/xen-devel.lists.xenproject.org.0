Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 427ABD8F4C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 13:23:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKhKx-0004ne-DH; Wed, 16 Oct 2019 11:19:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GHfa=YJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iKhKv-0004nZ-VU
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 11:19:26 +0000
X-Inumbo-ID: cf494b46-f006-11e9-93b0-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id cf494b46-f006-11e9-93b0-12813bfff9fa;
 Wed, 16 Oct 2019 11:19:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90E841570;
 Wed, 16 Oct 2019 04:19:24 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E85DB3F6C4;
 Wed, 16 Oct 2019 04:19:23 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190921100836.21396-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1910021820560.2691@sstabellini-ThinkPad-T480s>
 <8519f342-2140-6740-9765-0b10d70f52e9@arm.com>
 <1ead1d4a-842f-2c35-ce30-6b67da226e6d@arm.com>
Message-ID: <4c40ec62-2138-e2a5-269b-682a19ef69e2@arm.com>
Date: Wed, 16 Oct 2019 12:19:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1ead1d4a-842f-2c35-ce30-6b67da226e6d@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RESEND][PATCH for-4.13] xen/arm: mm: Clear boot
 pagetables before bringing-up each secondary CPU
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpBcmdoIGZvcmdvdCBhZ2Fpbi4gTWF5YmUgdGhlIDNyZCB3aWxsIGJlIGJldHRlcj8KClNv
cnJ5IGZvciB0aGUgbm9pc2UuCgpDaGVlcnMsCgpPbiAxNS8xMC8yMDE5IDE3OjM2LCBKdWxpZW4g
R3JhbGwgd3JvdGU6Cj4gSGksCj4gCj4gSSBhY3R1YWxseSBmb3Jnb3QgdG8gQ0MgSnVlcmdlbi4g
Tm8gd29uZGVyIHdoeSBJIGhhZCBubyBhbnN3ZXIgOiguCj4gCj4gQ2hlZXJzLAo+IAo+IE9uIDEw
LzEwLzE5IDM6NTEgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gK0p1ZXJnZW4KPj4KPj4gT24g
MDMvMTAvMjAxOSAwMjoyMiwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4gT24gU2F0LCAy
MSBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IEF0IHRoZSBtb21lbnQsIGJvb3Qg
cGFnZXRhYmxlcyBhcmUgb25seSBjbGVhcmVkIG9uY2UgYXQgYm9vdC4gVGhpcyBtZWFucwo+Pj4+
IHdoZW4gYm9vdGluZyBDUFUyIChhbmQgb253YXJkcykgdGhlbiBib290IHBhZ2V0YWJsZXMgd2ls
bCBub3QgYmUKPj4+PiBjbGVhcmVkLgo+Pj4+Cj4+Pj4gVG8ga2VlcCB0aGUgaW50ZXJmYWNlIGV4
YWN0bHkgdGhlIHNhbWUgZm9yIGFsbCBzZWNvbmRhcnkgQ1BVLCB0aGUgYm9vdAo+Pj4+IHBhZ2V0
YWJsZXMgYXJlIG5vdyBjbGVhcmVkIGJlZm9yZSBicmluZ2luZy11cCBlYWNoIHNlY29uZGFyeSBD
UFUuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPgo+Pj4KPj4+IFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+Cj4+Pgo+Pj4KPj4+PiAtLS0KPj4+PiDCoCB4ZW4vYXJjaC9hcm0vbW0u
YyB8IDI3ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+Pj4+IMKgIDEgZmlsZSBjaGFuZ2Vk
LCAxOCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS9tbS5jIGIveGVuL2FyY2gvYXJtL21tLmMKPj4+PiBpbmRleCAxMTI5ZGMy
OGM4Li5lMTRlZTc2ZmY4IDEwMDY0NAo+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9tbS5jCj4+Pj4g
KysrIGIveGVuL2FyY2gvYXJtL21tLmMKPj4+PiBAQCAtNzA0LDggKzcwNCwyMCBAQCB2b2lkIF9f
aW5pdCBzZXR1cF9wYWdldGFibGVzKHVuc2lnbmVkIGxvbmcgCj4+Pj4gYm9vdF9waHlzX29mZnNl
dCkKPj4+PiDCoMKgwqDCoMKgIHN3aXRjaF90dGJyKHR0YnIpOwo+Pj4+IC3CoMKgwqAgLyogQ2xl
YXIgdGhlIGNvcHkgb2YgdGhlIGJvb3QgcGFnZXRhYmxlcy4gRWFjaCBzZWNvbmRhcnkgQ1BVCj4+
Pj4gLcKgwqDCoMKgICogcmVidWlsZHMgdGhlc2UgaXRzZWxmIChzZWUgaGVhZC5TKSAqLwo+Pj4+
ICvCoMKgwqAgeGVuX3B0X2VuZm9yY2Vfd254KCk7Cj4+Pj4gKwo+Pj4+ICsjaWZkZWYgQ09ORklH
X0FSTV8zMgo+Pj4+ICvCoMKgwqAgcGVyX2NwdSh4ZW5fcGd0YWJsZSwgMCkgPSBjcHUwX3BndGFi
bGU7Cj4+Pj4gK8KgwqDCoCBwZXJfY3B1KHhlbl9kb21tYXAsIDApID0gY3B1MF9kb21tYXA7Cj4+
Pj4gKyNlbmRpZgo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+ICtzdGF0aWMgdm9pZCBjbGVhcl9ib290X3Bh
Z2V0YWJsZXModm9pZCkKPj4+PiArewo+Pj4+ICvCoMKgwqAgLyoKPj4+PiArwqDCoMKgwqAgKiBD
bGVhciB0aGUgY29weSBvZiB0aGUgYm9vdCBwYWdldGFibGVzLiBFYWNoIHNlY29uZGFyeSBDUFUK
Pj4+PiArwqDCoMKgwqAgKiByZWJ1aWxkcyB0aGVzZSBpdHNlbGYgKHNlZSBoZWFkLlMpCj4+Pj4g
K8KgwqDCoMKgICovCj4+Pj4gwqDCoMKgwqDCoCBjbGVhcl90YWJsZShib290X3BndGFibGUpOwo+
Pj4+IMKgICNpZmRlZiBDT05GSUdfQVJNXzY0Cj4+Pj4gwqDCoMKgwqDCoCBjbGVhcl90YWJsZShi
b290X2ZpcnN0KTsKPj4+PiBAQCAtNzEzLDE4ICs3MjUsMTMgQEAgdm9pZCBfX2luaXQgc2V0dXBf
cGFnZXRhYmxlcyh1bnNpZ25lZCBsb25nIAo+Pj4+IGJvb3RfcGh5c19vZmZzZXQpCj4+Pj4gwqAg
I2VuZGlmCj4+Pj4gwqDCoMKgwqDCoCBjbGVhcl90YWJsZShib290X3NlY29uZCk7Cj4+Pj4gwqDC
oMKgwqDCoCBjbGVhcl90YWJsZShib290X3RoaXJkKTsKPj4+PiAtCj4+Pj4gLcKgwqDCoCB4ZW5f
cHRfZW5mb3JjZV93bngoKTsKPj4+PiAtCj4+Pj4gLSNpZmRlZiBDT05GSUdfQVJNXzMyCj4+Pj4g
LcKgwqDCoCBwZXJfY3B1KHhlbl9wZ3RhYmxlLCAwKSA9IGNwdTBfcGd0YWJsZTsKPj4+PiAtwqDC
oMKgIHBlcl9jcHUoeGVuX2RvbW1hcCwgMCkgPSBjcHUwX2RvbW1hcDsKPj4+PiAtI2VuZGlmCj4+
Pj4gwqAgfQo+Pj4+IMKgICNpZmRlZiBDT05GSUdfQVJNXzY0Cj4+Pj4gwqAgaW50IGluaXRfc2Vj
b25kYXJ5X3BhZ2V0YWJsZXMoaW50IGNwdSkKPj4+PiDCoCB7Cj4+Pj4gK8KgwqDCoCBjbGVhcl9i
b290X3BhZ2V0YWJsZXMoKTsKPj4+PiArCj4+Pj4gwqDCoMKgwqDCoCAvKiBTZXQgaW5pdF90dGJy
IGZvciB0aGlzIENQVSBjb21pbmcgdXAuIEFsbCBDUHVzIHNoYXJlIGEgc2luZ2xlIHNldG9mCj4+
Pj4gwqDCoMKgwqDCoMKgICogcGFnZXRhYmxlcywgYnV0IHJld3JpdGUgaXQgZWFjaCB0aW1lIGZv
ciBjb25zaXN0ZW5jeSB3aXRoIDMyIGJpdC4gKi8KPj4+PiDCoMKgwqDCoMKgIGluaXRfdHRiciA9
ICh1aW50cHRyX3QpIHhlbl9wZ3RhYmxlICsgcGh5c19vZmZzZXQ7Cj4+Pj4gQEAgLTc2Nyw2ICs3
NzQsOCBAQCBpbnQgaW5pdF9zZWNvbmRhcnlfcGFnZXRhYmxlcyhpbnQgY3B1KQo+Pj4+IMKgwqDC
oMKgwqAgcGVyX2NwdSh4ZW5fcGd0YWJsZSwgY3B1KSA9IGZpcnN0Owo+Pj4+IMKgwqDCoMKgwqAg
cGVyX2NwdSh4ZW5fZG9tbWFwLCBjcHUpID0gZG9taGVhcDsKPj4+PiArwqDCoMKgIGNsZWFyX2Jv
b3RfcGFnZXRhYmxlcygpOwo+Pj4+ICsKPj4+PiDCoMKgwqDCoMKgIC8qIFNldCBpbml0X3R0YnIg
Zm9yIHRoaXMgQ1BVIGNvbWluZyB1cCAqLwo+Pj4+IMKgwqDCoMKgwqAgaW5pdF90dGJyID0gX19w
YShmaXJzdCk7Cj4+Pj4gwqDCoMKgwqDCoCBjbGVhbl9kY2FjaGUoaW5pdF90dGJyKTsKPj4+PiAt
LSAKPj4+PiAyLjExLjAKPj4+Pgo+Pgo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

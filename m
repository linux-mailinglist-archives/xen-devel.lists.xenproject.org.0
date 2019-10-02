Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C409C9032
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 19:49:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFiiT-0003TE-Dj; Wed, 02 Oct 2019 17:47:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2BXq=X3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFiiS-0003T8-I4
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 17:47:08 +0000
X-Inumbo-ID: a5618fe8-e53c-11e9-bf31-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id a5618fe8-e53c-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 17:47:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 781D51000;
 Wed,  2 Oct 2019 10:47:04 -0700 (PDT)
Received: from [10.37.10.48] (unknown [10.37.10.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A01723F706;
 Wed,  2 Oct 2019 10:47:03 -0700 (PDT)
To: xen-devel@lists.xenproject.org
References: <20190921100836.21396-1-julien.grall@arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e881db02-b6cf-6634-0e2c-5f79c9325881@arm.com>
Date: Wed, 2 Oct 2019 18:47:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190921100836.21396-1-julien.grall@arm.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGluZy4KCk9uIDkvMjEvMTkgMTE6MDggQU0sIEp1bGllbiBHcmFsbCB3cm90ZToKPiBBdCB0aGUg
bW9tZW50LCBib290IHBhZ2V0YWJsZXMgYXJlIG9ubHkgY2xlYXJlZCBvbmNlIGF0IGJvb3QuIFRo
aXMgbWVhbnMKPiB3aGVuIGJvb3RpbmcgQ1BVMiAoYW5kIG9ud2FyZHMpIHRoZW4gYm9vdCBwYWdl
dGFibGVzIHdpbGwgbm90IGJlCj4gY2xlYXJlZC4KPiAKPiBUbyBrZWVwIHRoZSBpbnRlcmZhY2Ug
ZXhhY3RseSB0aGUgc2FtZSBmb3IgYWxsIHNlY29uZGFyeSBDUFUsIHRoZSBib290Cj4gcGFnZXRh
YmxlcyBhcmUgbm93IGNsZWFyZWQgYmVmb3JlIGJyaW5naW5nLXVwIGVhY2ggc2Vjb25kYXJ5IENQ
VS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
Pgo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL21tLmMgfCAyNyArKysrKysrKysrKysrKysrKystLS0t
LS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5j
Cj4gaW5kZXggMTEyOWRjMjhjOC4uZTE0ZWU3NmZmOCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9h
cm0vbW0uYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9tbS5jCj4gQEAgLTcwNCw4ICs3MDQsMjAgQEAg
dm9pZCBfX2luaXQgc2V0dXBfcGFnZXRhYmxlcyh1bnNpZ25lZCBsb25nIGJvb3RfcGh5c19vZmZz
ZXQpCj4gICAKPiAgICAgICBzd2l0Y2hfdHRicih0dGJyKTsKPiAgIAo+IC0gICAgLyogQ2xlYXIg
dGhlIGNvcHkgb2YgdGhlIGJvb3QgcGFnZXRhYmxlcy4gRWFjaCBzZWNvbmRhcnkgQ1BVCj4gLSAg
ICAgKiByZWJ1aWxkcyB0aGVzZSBpdHNlbGYgKHNlZSBoZWFkLlMpICovCj4gKyAgICB4ZW5fcHRf
ZW5mb3JjZV93bngoKTsKPiArCj4gKyNpZmRlZiBDT05GSUdfQVJNXzMyCj4gKyAgICBwZXJfY3B1
KHhlbl9wZ3RhYmxlLCAwKSA9IGNwdTBfcGd0YWJsZTsKPiArICAgIHBlcl9jcHUoeGVuX2RvbW1h
cCwgMCkgPSBjcHUwX2RvbW1hcDsKPiArI2VuZGlmCj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIGNs
ZWFyX2Jvb3RfcGFnZXRhYmxlcyh2b2lkKQo+ICt7Cj4gKyAgICAvKgo+ICsgICAgICogQ2xlYXIg
dGhlIGNvcHkgb2YgdGhlIGJvb3QgcGFnZXRhYmxlcy4gRWFjaCBzZWNvbmRhcnkgQ1BVCj4gKyAg
ICAgKiByZWJ1aWxkcyB0aGVzZSBpdHNlbGYgKHNlZSBoZWFkLlMpCj4gKyAgICAgKi8KPiAgICAg
ICBjbGVhcl90YWJsZShib290X3BndGFibGUpOwo+ICAgI2lmZGVmIENPTkZJR19BUk1fNjQKPiAg
ICAgICBjbGVhcl90YWJsZShib290X2ZpcnN0KTsKPiBAQCAtNzEzLDE4ICs3MjUsMTMgQEAgdm9p
ZCBfX2luaXQgc2V0dXBfcGFnZXRhYmxlcyh1bnNpZ25lZCBsb25nIGJvb3RfcGh5c19vZmZzZXQp
Cj4gICAjZW5kaWYKPiAgICAgICBjbGVhcl90YWJsZShib290X3NlY29uZCk7Cj4gICAgICAgY2xl
YXJfdGFibGUoYm9vdF90aGlyZCk7Cj4gLQo+IC0gICAgeGVuX3B0X2VuZm9yY2Vfd254KCk7Cj4g
LQo+IC0jaWZkZWYgQ09ORklHX0FSTV8zMgo+IC0gICAgcGVyX2NwdSh4ZW5fcGd0YWJsZSwgMCkg
PSBjcHUwX3BndGFibGU7Cj4gLSAgICBwZXJfY3B1KHhlbl9kb21tYXAsIDApID0gY3B1MF9kb21t
YXA7Cj4gLSNlbmRpZgo+ICAgfQo+ICAgCj4gICAjaWZkZWYgQ09ORklHX0FSTV82NAo+ICAgaW50
IGluaXRfc2Vjb25kYXJ5X3BhZ2V0YWJsZXMoaW50IGNwdSkKPiAgIHsKPiArICAgIGNsZWFyX2Jv
b3RfcGFnZXRhYmxlcygpOwo+ICsKPiAgICAgICAvKiBTZXQgaW5pdF90dGJyIGZvciB0aGlzIENQ
VSBjb21pbmcgdXAuIEFsbCBDUHVzIHNoYXJlIGEgc2luZ2xlIHNldG9mCj4gICAgICAgICogcGFn
ZXRhYmxlcywgYnV0IHJld3JpdGUgaXQgZWFjaCB0aW1lIGZvciBjb25zaXN0ZW5jeSB3aXRoIDMy
IGJpdC4gKi8KPiAgICAgICBpbml0X3R0YnIgPSAodWludHB0cl90KSB4ZW5fcGd0YWJsZSArIHBo
eXNfb2Zmc2V0Owo+IEBAIC03NjcsNiArNzc0LDggQEAgaW50IGluaXRfc2Vjb25kYXJ5X3BhZ2V0
YWJsZXMoaW50IGNwdSkKPiAgICAgICBwZXJfY3B1KHhlbl9wZ3RhYmxlLCBjcHUpID0gZmlyc3Q7
Cj4gICAgICAgcGVyX2NwdSh4ZW5fZG9tbWFwLCBjcHUpID0gZG9taGVhcDsKPiAgIAo+ICsgICAg
Y2xlYXJfYm9vdF9wYWdldGFibGVzKCk7Cj4gKwo+ICAgICAgIC8qIFNldCBpbml0X3R0YnIgZm9y
IHRoaXMgQ1BVIGNvbWluZyB1cCAqLwo+ICAgICAgIGluaXRfdHRiciA9IF9fcGEoZmlyc3QpOwo+
ICAgICAgIGNsZWFuX2RjYWNoZShpbml0X3R0YnIpOwo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

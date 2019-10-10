Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5308CD2D0A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 16:57:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIZmp-0004CQ-9N; Thu, 10 Oct 2019 14:51:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=njQE=YD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iIZmn-0004CJ-Ih
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 14:51:25 +0000
X-Inumbo-ID: 6e7579cc-eb6d-11e9-a531-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 6e7579cc-eb6d-11e9-a531-bc764e2007e4;
 Thu, 10 Oct 2019 14:51:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B73FB337;
 Thu, 10 Oct 2019 07:51:24 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A06B3F6C4;
 Thu, 10 Oct 2019 07:51:24 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190921100836.21396-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1910021820560.2691@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8519f342-2140-6740-9765-0b10d70f52e9@arm.com>
Date: Thu, 10 Oct 2019 15:51:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910021820560.2691@sstabellini-ThinkPad-T480s>
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
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

K0p1ZXJnZW4KCk9uIDAzLzEwLzIwMTkgMDI6MjIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToK
PiBPbiBTYXQsIDIxIFNlcCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEF0IHRoZSBtb21l
bnQsIGJvb3QgcGFnZXRhYmxlcyBhcmUgb25seSBjbGVhcmVkIG9uY2UgYXQgYm9vdC4gVGhpcyBt
ZWFucwo+PiB3aGVuIGJvb3RpbmcgQ1BVMiAoYW5kIG9ud2FyZHMpIHRoZW4gYm9vdCBwYWdldGFi
bGVzIHdpbGwgbm90IGJlCj4+IGNsZWFyZWQuCj4+Cj4+IFRvIGtlZXAgdGhlIGludGVyZmFjZSBl
eGFjdGx5IHRoZSBzYW1lIGZvciBhbGwgc2Vjb25kYXJ5IENQVSwgdGhlIGJvb3QKPj4gcGFnZXRh
YmxlcyBhcmUgbm93IGNsZWFyZWQgYmVmb3JlIGJyaW5naW5nLXVwIGVhY2ggc2Vjb25kYXJ5IENQ
VS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNv
bT4KPiAKPiBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPgo+IAo+IAo+PiAtLS0KPj4gICB4ZW4vYXJjaC9hcm0vbW0uYyB8IDI3ICsrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCsp
LCA5IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94
ZW4vYXJjaC9hcm0vbW0uYwo+PiBpbmRleCAxMTI5ZGMyOGM4Li5lMTRlZTc2ZmY4IDEwMDY0NAo+
PiAtLS0gYS94ZW4vYXJjaC9hcm0vbW0uYwo+PiArKysgYi94ZW4vYXJjaC9hcm0vbW0uYwo+PiBA
QCAtNzA0LDggKzcwNCwyMCBAQCB2b2lkIF9faW5pdCBzZXR1cF9wYWdldGFibGVzKHVuc2lnbmVk
IGxvbmcgYm9vdF9waHlzX29mZnNldCkKPj4gICAKPj4gICAgICAgc3dpdGNoX3R0YnIodHRicik7
Cj4+ICAgCj4+IC0gICAgLyogQ2xlYXIgdGhlIGNvcHkgb2YgdGhlIGJvb3QgcGFnZXRhYmxlcy4g
RWFjaCBzZWNvbmRhcnkgQ1BVCj4+IC0gICAgICogcmVidWlsZHMgdGhlc2UgaXRzZWxmIChzZWUg
aGVhZC5TKSAqLwo+PiArICAgIHhlbl9wdF9lbmZvcmNlX3dueCgpOwo+PiArCj4+ICsjaWZkZWYg
Q09ORklHX0FSTV8zMgo+PiArICAgIHBlcl9jcHUoeGVuX3BndGFibGUsIDApID0gY3B1MF9wZ3Rh
YmxlOwo+PiArICAgIHBlcl9jcHUoeGVuX2RvbW1hcCwgMCkgPSBjcHUwX2RvbW1hcDsKPj4gKyNl
bmRpZgo+PiArfQo+PiArCj4+ICtzdGF0aWMgdm9pZCBjbGVhcl9ib290X3BhZ2V0YWJsZXModm9p
ZCkKPj4gK3sKPj4gKyAgICAvKgo+PiArICAgICAqIENsZWFyIHRoZSBjb3B5IG9mIHRoZSBib290
IHBhZ2V0YWJsZXMuIEVhY2ggc2Vjb25kYXJ5IENQVQo+PiArICAgICAqIHJlYnVpbGRzIHRoZXNl
IGl0c2VsZiAoc2VlIGhlYWQuUykKPj4gKyAgICAgKi8KPj4gICAgICAgY2xlYXJfdGFibGUoYm9v
dF9wZ3RhYmxlKTsKPj4gICAjaWZkZWYgQ09ORklHX0FSTV82NAo+PiAgICAgICBjbGVhcl90YWJs
ZShib290X2ZpcnN0KTsKPj4gQEAgLTcxMywxOCArNzI1LDEzIEBAIHZvaWQgX19pbml0IHNldHVw
X3BhZ2V0YWJsZXModW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0KQo+PiAgICNlbmRpZgo+
PiAgICAgICBjbGVhcl90YWJsZShib290X3NlY29uZCk7Cj4+ICAgICAgIGNsZWFyX3RhYmxlKGJv
b3RfdGhpcmQpOwo+PiAtCj4+IC0gICAgeGVuX3B0X2VuZm9yY2Vfd254KCk7Cj4+IC0KPj4gLSNp
ZmRlZiBDT05GSUdfQVJNXzMyCj4+IC0gICAgcGVyX2NwdSh4ZW5fcGd0YWJsZSwgMCkgPSBjcHUw
X3BndGFibGU7Cj4+IC0gICAgcGVyX2NwdSh4ZW5fZG9tbWFwLCAwKSA9IGNwdTBfZG9tbWFwOwo+
PiAtI2VuZGlmCj4+ICAgfQo+PiAgIAo+PiAgICNpZmRlZiBDT05GSUdfQVJNXzY0Cj4+ICAgaW50
IGluaXRfc2Vjb25kYXJ5X3BhZ2V0YWJsZXMoaW50IGNwdSkKPj4gICB7Cj4+ICsgICAgY2xlYXJf
Ym9vdF9wYWdldGFibGVzKCk7Cj4+ICsKPj4gICAgICAgLyogU2V0IGluaXRfdHRiciBmb3IgdGhp
cyBDUFUgY29taW5nIHVwLiBBbGwgQ1B1cyBzaGFyZSBhIHNpbmdsZSBzZXRvZgo+PiAgICAgICAg
KiBwYWdldGFibGVzLCBidXQgcmV3cml0ZSBpdCBlYWNoIHRpbWUgZm9yIGNvbnNpc3RlbmN5IHdp
dGggMzIgYml0LiAqLwo+PiAgICAgICBpbml0X3R0YnIgPSAodWludHB0cl90KSB4ZW5fcGd0YWJs
ZSArIHBoeXNfb2Zmc2V0Owo+PiBAQCAtNzY3LDYgKzc3NCw4IEBAIGludCBpbml0X3NlY29uZGFy
eV9wYWdldGFibGVzKGludCBjcHUpCj4+ICAgICAgIHBlcl9jcHUoeGVuX3BndGFibGUsIGNwdSkg
PSBmaXJzdDsKPj4gICAgICAgcGVyX2NwdSh4ZW5fZG9tbWFwLCBjcHUpID0gZG9taGVhcDsKPj4g
ICAKPj4gKyAgICBjbGVhcl9ib290X3BhZ2V0YWJsZXMoKTsKPj4gKwo+PiAgICAgICAvKiBTZXQg
aW5pdF90dGJyIGZvciB0aGlzIENQVSBjb21pbmcgdXAgKi8KPj4gICAgICAgaW5pdF90dGJyID0g
X19wYShmaXJzdCk7Cj4+ICAgICAgIGNsZWFuX2RjYWNoZShpbml0X3R0YnIpOwo+PiAtLSAKPj4g
Mi4xMS4wCj4+CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

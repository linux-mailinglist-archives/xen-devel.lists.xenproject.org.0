Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E74D7BF9
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:39:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPoD-0006vv-4U; Tue, 15 Oct 2019 16:36:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dEpp=YI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iKPoB-0006vq-0D
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:36:27 +0000
X-Inumbo-ID: ee28cef8-ef69-11e9-9397-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ee28cef8-ef69-11e9-9397-12813bfff9fa;
 Tue, 15 Oct 2019 16:36:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79812337;
 Tue, 15 Oct 2019 09:36:25 -0700 (PDT)
Received: from [10.37.13.17] (unknown [10.37.13.17])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C897B3F68E;
 Tue, 15 Oct 2019 09:36:24 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190921100836.21396-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1910021820560.2691@sstabellini-ThinkPad-T480s>
 <8519f342-2140-6740-9765-0b10d70f52e9@arm.com>
Message-ID: <1ead1d4a-842f-2c35-ce30-6b67da226e6d@arm.com>
Date: Tue, 15 Oct 2019 17:36:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8519f342-2140-6740-9765-0b10d70f52e9@arm.com>
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

SGksCgpJIGFjdHVhbGx5IGZvcmdvdCB0byBDQyBKdWVyZ2VuLiBObyB3b25kZXIgd2h5IEkgaGFk
IG5vIGFuc3dlciA6KC4KCkNoZWVycywKCk9uIDEwLzEwLzE5IDM6NTEgUE0sIEp1bGllbiBHcmFs
bCB3cm90ZToKPiArSnVlcmdlbgo+IAo+IE9uIDAzLzEwLzIwMTkgMDI6MjIsIFN0ZWZhbm8gU3Rh
YmVsbGluaSB3cm90ZToKPj4gT24gU2F0LCAyMSBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3Rl
Ogo+Pj4gQXQgdGhlIG1vbWVudCwgYm9vdCBwYWdldGFibGVzIGFyZSBvbmx5IGNsZWFyZWQgb25j
ZSBhdCBib290LiBUaGlzIG1lYW5zCj4+PiB3aGVuIGJvb3RpbmcgQ1BVMiAoYW5kIG9ud2FyZHMp
IHRoZW4gYm9vdCBwYWdldGFibGVzIHdpbGwgbm90IGJlCj4+PiBjbGVhcmVkLgo+Pj4KPj4+IFRv
IGtlZXAgdGhlIGludGVyZmFjZSBleGFjdGx5IHRoZSBzYW1lIGZvciBhbGwgc2Vjb25kYXJ5IENQ
VSwgdGhlIGJvb3QKPj4+IHBhZ2V0YWJsZXMgYXJlIG5vdyBjbGVhcmVkIGJlZm9yZSBicmluZ2lu
Zy11cCBlYWNoIHNlY29uZGFyeSBDUFUuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4KPj4gUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPj4KPj4KPj4+IC0tLQo+Pj4gwqAgeGVu
L2FyY2gvYXJtL21tLmMgfCAyNyArKysrKysrKysrKysrKysrKystLS0tLS0tLS0KPj4+IMKgIDEg
ZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jCj4+PiBpbmRl
eCAxMTI5ZGMyOGM4Li5lMTRlZTc2ZmY4IDEwMDY0NAo+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL21t
LmMKPj4+ICsrKyBiL3hlbi9hcmNoL2FybS9tbS5jCj4+PiBAQCAtNzA0LDggKzcwNCwyMCBAQCB2
b2lkIF9faW5pdCBzZXR1cF9wYWdldGFibGVzKHVuc2lnbmVkIGxvbmcgCj4+PiBib290X3BoeXNf
b2Zmc2V0KQo+Pj4gwqDCoMKgwqDCoCBzd2l0Y2hfdHRicih0dGJyKTsKPj4+IC3CoMKgwqAgLyog
Q2xlYXIgdGhlIGNvcHkgb2YgdGhlIGJvb3QgcGFnZXRhYmxlcy4gRWFjaCBzZWNvbmRhcnkgQ1BV
Cj4+PiAtwqDCoMKgwqAgKiByZWJ1aWxkcyB0aGVzZSBpdHNlbGYgKHNlZSBoZWFkLlMpICovCj4+
PiArwqDCoMKgIHhlbl9wdF9lbmZvcmNlX3dueCgpOwo+Pj4gKwo+Pj4gKyNpZmRlZiBDT05GSUdf
QVJNXzMyCj4+PiArwqDCoMKgIHBlcl9jcHUoeGVuX3BndGFibGUsIDApID0gY3B1MF9wZ3RhYmxl
Owo+Pj4gK8KgwqDCoCBwZXJfY3B1KHhlbl9kb21tYXAsIDApID0gY3B1MF9kb21tYXA7Cj4+PiAr
I2VuZGlmCj4+PiArfQo+Pj4gKwo+Pj4gK3N0YXRpYyB2b2lkIGNsZWFyX2Jvb3RfcGFnZXRhYmxl
cyh2b2lkKQo+Pj4gK3sKPj4+ICvCoMKgwqAgLyoKPj4+ICvCoMKgwqDCoCAqIENsZWFyIHRoZSBj
b3B5IG9mIHRoZSBib290IHBhZ2V0YWJsZXMuIEVhY2ggc2Vjb25kYXJ5IENQVQo+Pj4gK8KgwqDC
oMKgICogcmVidWlsZHMgdGhlc2UgaXRzZWxmIChzZWUgaGVhZC5TKQo+Pj4gK8KgwqDCoMKgICov
Cj4+PiDCoMKgwqDCoMKgIGNsZWFyX3RhYmxlKGJvb3RfcGd0YWJsZSk7Cj4+PiDCoCAjaWZkZWYg
Q09ORklHX0FSTV82NAo+Pj4gwqDCoMKgwqDCoCBjbGVhcl90YWJsZShib290X2ZpcnN0KTsKPj4+
IEBAIC03MTMsMTggKzcyNSwxMyBAQCB2b2lkIF9faW5pdCBzZXR1cF9wYWdldGFibGVzKHVuc2ln
bmVkIGxvbmcgCj4+PiBib290X3BoeXNfb2Zmc2V0KQo+Pj4gwqAgI2VuZGlmCj4+PiDCoMKgwqDC
oMKgIGNsZWFyX3RhYmxlKGJvb3Rfc2Vjb25kKTsKPj4+IMKgwqDCoMKgwqAgY2xlYXJfdGFibGUo
Ym9vdF90aGlyZCk7Cj4+PiAtCj4+PiAtwqDCoMKgIHhlbl9wdF9lbmZvcmNlX3dueCgpOwo+Pj4g
LQo+Pj4gLSNpZmRlZiBDT05GSUdfQVJNXzMyCj4+PiAtwqDCoMKgIHBlcl9jcHUoeGVuX3BndGFi
bGUsIDApID0gY3B1MF9wZ3RhYmxlOwo+Pj4gLcKgwqDCoCBwZXJfY3B1KHhlbl9kb21tYXAsIDAp
ID0gY3B1MF9kb21tYXA7Cj4+PiAtI2VuZGlmCj4+PiDCoCB9Cj4+PiDCoCAjaWZkZWYgQ09ORklH
X0FSTV82NAo+Pj4gwqAgaW50IGluaXRfc2Vjb25kYXJ5X3BhZ2V0YWJsZXMoaW50IGNwdSkKPj4+
IMKgIHsKPj4+ICvCoMKgwqAgY2xlYXJfYm9vdF9wYWdldGFibGVzKCk7Cj4+PiArCj4+PiDCoMKg
wqDCoMKgIC8qIFNldCBpbml0X3R0YnIgZm9yIHRoaXMgQ1BVIGNvbWluZyB1cC4gQWxsIENQdXMg
c2hhcmUgYSAKPj4+IHNpbmdsZSBzZXRvZgo+Pj4gwqDCoMKgwqDCoMKgICogcGFnZXRhYmxlcywg
YnV0IHJld3JpdGUgaXQgZWFjaCB0aW1lIGZvciBjb25zaXN0ZW5jeSB3aXRoIDMyIAo+Pj4gYml0
LiAqLwo+Pj4gwqDCoMKgwqDCoCBpbml0X3R0YnIgPSAodWludHB0cl90KSB4ZW5fcGd0YWJsZSAr
IHBoeXNfb2Zmc2V0Owo+Pj4gQEAgLTc2Nyw2ICs3NzQsOCBAQCBpbnQgaW5pdF9zZWNvbmRhcnlf
cGFnZXRhYmxlcyhpbnQgY3B1KQo+Pj4gwqDCoMKgwqDCoCBwZXJfY3B1KHhlbl9wZ3RhYmxlLCBj
cHUpID0gZmlyc3Q7Cj4+PiDCoMKgwqDCoMKgIHBlcl9jcHUoeGVuX2RvbW1hcCwgY3B1KSA9IGRv
bWhlYXA7Cj4+PiArwqDCoMKgIGNsZWFyX2Jvb3RfcGFnZXRhYmxlcygpOwo+Pj4gKwo+Pj4gwqDC
oMKgwqDCoCAvKiBTZXQgaW5pdF90dGJyIGZvciB0aGlzIENQVSBjb21pbmcgdXAgKi8KPj4+IMKg
wqDCoMKgwqAgaW5pdF90dGJyID0gX19wYShmaXJzdCk7Cj4+PiDCoMKgwqDCoMKgIGNsZWFuX2Rj
YWNoZShpbml0X3R0YnIpOwo+Pj4gLS0gCj4+PiAyLjExLjAKPj4+Cj4gCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

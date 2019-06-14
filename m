Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E32BF46B77
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 23:03:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbtJJ-0001ES-22; Fri, 14 Jun 2019 21:00:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PuWx=UN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hbtJI-0001EN-7E
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 21:00:32 +0000
X-Inumbo-ID: 71abf3d8-8ee7-11e9-ad01-3343cbec5e0c
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71abf3d8-8ee7-11e9-ad01-3343cbec5e0c;
 Fri, 14 Jun 2019 21:00:31 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 36D32217D6;
 Fri, 14 Jun 2019 21:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560546030;
 bh=i/nNkzgs8e15egpl1wP3yTiHUIwU0TrLf2P72hsmAm8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=C2oMMpluy0qvEp2GAf73bXgTLvNJSdf4huehsoms/YMI3cRWXvAewB1Jh3qwbRE/h
 YnKCKSHjmnHgUQWBxCdYy8fk0eLCM+HbEvH6mxYU1xx6mGzdyQ/eO/VTww0cMV/Mq+
 dA6xyvz5WYOp7zJjuHsMEEeGDxJi8txlC29oG3No=
Date: Fri, 14 Jun 2019 14:00:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190614175144.20046-7-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906141400060.2072@sstabellini-ThinkPad-T480s>
References: <20190614175144.20046-1-julien.grall@arm.com>
 <20190614175144.20046-7-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART3 v3 6/9] xen/arm: mm: Use {,
 un}map_domain_page() to map/unmap Xen page-tables
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAxNCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEN1cnJlbnRseSwgdGhl
IHZpcnR1YWwgYWRkcmVzcyBvZiB0aGUgM3JkIGxldmVsIHBhZ2UtdGFibGVzIGlzIG9idGFpbmVk
Cj4gdXNpbmcgbWZuX3RvX3ZpcnQoKS4KPiAKPiBPbiBBcm0zMiwgbWZuX3RvX3ZpcnQgY2FuIG9u
bHkgd29yayBvbiB4ZW5oZWFwIHBhZ2UuIFdoaWxlIGluIHRoZW9yeQo+IGFsbCB0aGUgcGFnZS10
YWJsZXMgdXBkYXRlZCB3aWxsIHJlc2lkZSBpbiB4ZW5oZWFwLCBpbiBwcmFjdGljZSB0aGUKPiBw
YWdlLXRhYmxlcyBjb3ZlcmluZyBYZW4gbWVtb3J5IChlLmcgeGVuX21hcHBpbmcpIGlzIHBhcnQg
b2YgWGVuIGJpbmFyeS4KPiAKPiBGdXJ0aGVybW9yZSwgYSBmb2xsb3ctdXAgY2hhbmdlIHdpbGwg
dXBkYXRlIHhlbl9wdF91cGRhdGVfZW50cnkoKSB0bwo+IHdhbGsgYWxsIHRoZSBsZXZlbHMgYW5k
IHRoZXJlZm9yZSBiZSBtb3JlIGdlbmVyaWMuIFNvbWUgb2YgdGhlCj4gcGFnZS10YWJsZXMgd2ls
bCBhbHNvIHBhcnQgb2YgWGVuIG1lbW9yeSBhbmQgdGhlcmVmb3JlIHdpbGwgbm90IGJlCj4gcmVh
Y2hhYmxlIHVzaW5nIG1mbl90b192aXJ0KCkuCj4gCj4gVGhlIGVhc2llc3Qgd2F5IHRvIHJlYWNo
IHRob3NlIHBhZ2VzIGlzIHRvIHVzZSB7LCB1bn1tYXBfZG9tYWluX3BhZ2UoKS4KPiBXaGlsZSBv
biBhcm0zMiB0aGlzIG1lYW5zIGFuIGV4dHJhIG1hcHBpbmcgaW4gdGhlIG5vcm1hbCBjYXNlcywg
dGhpcyBpcyBub3QKPiB2ZXJ5IGltcG9ydGFudCBhcyB4ZW4gcGFnZS10YWJsZXMgYXJlIG5vdCB1
cGRhdGVkIG9mdGVuLgo+IAo+IEluIG9yZGVyIHRvIGFsbG93IGZ1dHVyZSBjaGFuZ2UgaW4gdGhl
IHdheSBYZW4gcGFnZS10YWJsZXMgYXJlIG1hcHBlZCwKPiB0d28gbmV3IGhlbHBlcnMgYXJlIGlu
dHJvZHVjZWQgdG8gbWFwL3VubWFwIHRoZSBwYWdlLXRhYmxlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IFJldmlld2VkLWJ5OiBBbmRy
aWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+IAo+IC0tLQo+ICAgICBDaGFuZ2Vz
IGluIHYzOgo+ICAgICAgICAgLSBGaXggdHlwbyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UKPiAgICAg
ICAgIC0gQWRkIFN0ZWZhbm8ncyBhY2tlZC1ieQoKSXQgZGlkbid0IHN0aWNrLCBzbzoKCkFja2Vk
LWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cgo6LSkKCgo+
IAo+ICAgICBDaGFuZ2VzIGluIHYyOgo+ICAgICAgICAgLSBBZGQgQW5kcmlpJ3MgcmV2aWV3ZWQt
YnkKPiAtLS0KPiAgeGVuL2FyY2gvYXJtL21tLmMgfCAyNiArKysrKysrKysrKysrKysrKysrKysr
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwo+
IGluZGV4IDNmNmQwZTI5ZDUuLmMzZGQyYzA4YmEgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJt
L21tLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vbW0uYwo+IEBAIC05NDcsNiArOTQ3LDE2IEBAIHN0
YXRpYyBpbnQgY3JlYXRlX3hlbl90YWJsZShscGFlX3QgKmVudHJ5KQo+ICAgICAgcmV0dXJuIDA7
Cj4gIH0KPiAgCj4gK3N0YXRpYyBscGFlX3QgKnhlbl9tYXBfdGFibGUobWZuX3QgbWZuKQo+ICt7
Cj4gKyAgICByZXR1cm4gbWFwX2RvbWFpbl9wYWdlKG1mbik7Cj4gK30KPiArCj4gK3N0YXRpYyB2
b2lkIHhlbl91bm1hcF90YWJsZShjb25zdCBscGFlX3QgKnRhYmxlKQo+ICt7Cj4gKyAgICB1bm1h
cF9kb21haW5fcGFnZSh0YWJsZSk7Cj4gK30KPiArCj4gIC8qIFNhbml0eSBjaGVjayBvZiB0aGUg
ZW50cnkgKi8KPiAgc3RhdGljIGJvb2wgeGVuX3B0X2NoZWNrX2VudHJ5KGxwYWVfdCBlbnRyeSwg
bWZuX3QgbWZuLCB1bnNpZ25lZCBpbnQgZmxhZ3MpCj4gIHsKPiBAQCAtMTAxNiw2ICsxMDI2LDcg
QEAgc3RhdGljIGJvb2wgeGVuX3B0X2NoZWNrX2VudHJ5KGxwYWVfdCBlbnRyeSwgbWZuX3QgbWZu
LCB1bnNpZ25lZCBpbnQgZmxhZ3MpCj4gIHN0YXRpYyBpbnQgeGVuX3B0X3VwZGF0ZV9lbnRyeSh1
bnNpZ25lZCBsb25nIGFkZHIsIG1mbl90IG1mbiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGludCBmbGFncykKPiAgewo+ICsgICAgaW50IHJjOwo+ICAgICAgbHBh
ZV90IHB0ZSwgKmVudHJ5Owo+ICAgICAgbHBhZV90ICp0aGlyZCA9IE5VTEw7Cj4gIAo+IEBAIC0x
MDM0LDE1ICsxMDQ1LDE3IEBAIHN0YXRpYyBpbnQgeGVuX3B0X3VwZGF0ZV9lbnRyeSh1bnNpZ25l
ZCBsb25nIGFkZHIsIG1mbl90IG1mbiwKPiAgCj4gICAgICBCVUdfT04oIWxwYWVfaXNfdmFsaWQo
KmVudHJ5KSk7Cj4gIAo+IC0gICAgdGhpcmQgPSBtZm5fdG9fdmlydChscGFlX2dldF9tZm4oKmVu
dHJ5KSk7Cj4gKyAgICB0aGlyZCA9IHhlbl9tYXBfdGFibGUobHBhZV9nZXRfbWZuKCplbnRyeSkp
Owo+ICAgICAgZW50cnkgPSAmdGhpcmRbdGhpcmRfdGFibGVfb2Zmc2V0KGFkZHIpXTsKPiAgCj4g
KyAgICByYyA9IC1FSU5WQUw7Cj4gICAgICBpZiAoICF4ZW5fcHRfY2hlY2tfZW50cnkoKmVudHJ5
LCBtZm4sIGZsYWdzKSApCj4gLSAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKyAgICAgICAgZ290
byBvdXQ7Cj4gIAo+ICAgICAgLyogSWYgd2UgYXJlIG9ubHkgcG9wdWxhdGluZyBwYWdlLXRhYmxl
LCB0aGVuIHdlIGFyZSBkb25lLiAqLwo+ICsgICAgcmMgPSAwOwo+ICAgICAgaWYgKCBmbGFncyAm
IF9QQUdFX1BPUFVMQVRFICkKPiAtICAgICAgICByZXR1cm4gMDsKPiArICAgICAgICBnb3RvIG91
dDsKPiAgCj4gICAgICAvKiBXZSBhcmUgcmVtb3ZpbmcgdGhlIHBhZ2UgKi8KPiAgICAgIGlmICgg
IShmbGFncyAmIF9QQUdFX1BSRVNFTlQpICkKPiBAQCAtMTA2Nyw3ICsxMDgwLDEyIEBAIHN0YXRp
YyBpbnQgeGVuX3B0X3VwZGF0ZV9lbnRyeSh1bnNpZ25lZCBsb25nIGFkZHIsIG1mbl90IG1mbiwK
PiAgCj4gICAgICB3cml0ZV9wdGUoZW50cnksIHB0ZSk7Cj4gIAo+IC0gICAgcmV0dXJuIDA7Cj4g
KyAgICByYyA9IDA7Cj4gKwo+ICtvdXQ6Cj4gKyAgICB4ZW5fdW5tYXBfdGFibGUodGhpcmQpOwo+
ICsKPiArICAgIHJldHVybiByYzsKPiAgfQo+ICAKPiAgc3RhdGljIERFRklORV9TUElOTE9DSyh4
ZW5fcHRfbG9jayk7Cj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs

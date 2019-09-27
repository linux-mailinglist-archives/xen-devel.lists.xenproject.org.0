Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13276C050C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 14:20:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDpBG-0004vM-OT; Fri, 27 Sep 2019 12:17:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tE9W=XW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDpBF-0004vH-CA
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 12:17:01 +0000
X-Inumbo-ID: b3351d6c-e120-11e9-b588-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id b3351d6c-e120-11e9-b588-bc764e2007e4;
 Fri, 27 Sep 2019 12:16:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16552337;
 Fri, 27 Sep 2019 05:16:57 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 770373F67D;
 Fri, 27 Sep 2019 05:16:56 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-4-julien.grall@arm.com> <871rw29d4s.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <aa4d64a4-98bf-d248-fc2e-c00bc1c76a91@arm.com>
Date: Fri, 27 Sep 2019 13:16:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <871rw29d4s.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 03/10] xen/arm: traps: Rework
 entry/exit from the guest path
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
 Stefano Stabellini <sstabellini@kernel.org>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMDkvMjAxOSAxMjo0NSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gCj4gSnVsaWVu
LAoKSGkuLi4KCj4gSnVsaWVuIEdyYWxsIHdyaXRlczoKPiAKPj4gQXQgdGhlIG1vbWVudCwgZW50
ZXJfaHlwZXJ2aXNvcl9oZWFkKCkgYW5kIGxlYXZlX2h5cGVydmlzb3JfdGFpbCgpIGFyZQo+PiB1
c2VkIHRvIGRlYWwgd2l0aCBhY3Rpb25zIHRvIGJlIGRvbmUgYmVmb3JlL2FmdGVyIGFueSBndWVz
dCByZXF1ZXN0IGlzCj4+IGhhbmRsZWQuCj4+Cj4+IFdoaWxlIHRoZXkgYXJlIG1lYW50IHRvIHdv
cmsgaW4gcGFpciwgdGhlIGZvcm1lciBpcyBjYWxsZWQgZm9yIG1vc3Qgb2YKPj4gdGhlIHRyYXBz
LCBpbmNsdWRpbmcgdHJhcHMgZnJvbSB0aGUgc2FtZSBleGNlcHRpb24gbGV2ZWwgKGkuZS4KPj4g
aHlwZXJ2aXNvcikgd2hpbHN0IHRoZSBsYXR0ZXIgd2lsbCBvbmx5IGJlIGNhbGxlZCB3aGVuIHJl
dHVybmluZyB0byB0aGUKPj4gZ3Vlc3QuCj4+Cj4+IEFzIHBvaW50ZWQgb3V0LCB0aGUgZW50ZXJf
aHlwZXJ2aXNvcl9oZWFkKCkgaXMgbm90IGNhbGxlZCBmcm9tIGFsbCB0aGUKPj4gdHJhcHMsIHNv
IHRoaXMgbWFrZXMgcG90ZW50aWFsbHkgZGlmZmljdWx0IHRvIGV4dGVuZCBpdCBmb3IgdGhlIGRl
YWxpbmcKPj4gd2l0aCBzYW1lIGV4Y2VwdGlvbiBsZXZlbC4KPj4KPj4gRnVydGhlcm1vcmUsIHNv
bWUgYXNzZW1ibHkgb25seSBwYXRoIHdpbGwgcmVxdWlyZSB0byBjYWxsCj4+IGVudGVyX2h5cGVy
dmlzb3JfdGFpbCgpLiBTbyB0aGUgZnVuY3Rpb24gaXMgbm93IGRpcmVjdGx5IGNhbGwgYnkKPj4g
YXNzZW1ibHkgaW4gZm9yIGd1ZXN0IHZlY3RvciBvbmx5LiBUaGlzIG1lYW5zIHRoYXQgdGhlIGNo
ZWNrIHdoZXRoZXIgd2UKPj4gYXJlIGNhbGxlZCBpbiBhIGd1ZXN0IHRyYXAgY2FuIG5vdyBiZSBy
ZW1vdmVkLgo+Pgo+PiBUYWtlIHRoZSBvcHBvcnR1bml0eSB0byByZW5hbWUgZW50ZXJfaHlwZXJ2
aXNvcl90YWlsKCkgYW5kCj4+IGxlYXZlX2h5cGVydmlzb3JfdGFpbCgpIHRvIHNvbWV0aGluZyBt
b3JlIG1lYW5pbmdmdWwgYW5kIGRvY3VtZW50IHRoZW0uCj4+IFRoaXMgc2hvdWxkIGhlbHAgZXZl
cnlvbmUgdG8gdW5kZXJzdGFuZCB0aGUgcHVycG9zZSBvZiB0aGUgdHdvCj4+IGZ1bmN0aW9ucy4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
Pj4KPj4gLS0tCj4+Cj4+IEkgaGF2ZW4ndCBkb25lIHRoZSAzMi1iaXRzIHBhcnQgeWV0LiBJIHdh
bnRlZCB0byBnYXRoZXIgZmVlZGJhY2sgYmVmb3JlCj4+IGxvb2tpbmcgaW4gZGV0YWlscyBob3cg
dG8gaW50ZWdyYXRlIHRoYXQgd2l0aCBBcm0zMi4KPiBJJ20gbG9va2luZyBhdCBwYXRjaGVzIG9u
ZSBieSBvbmUgYW5kIGl0IGlzIGxvb2tpbmcgb2theSBzbyBmYXIuCj4gCj4gCj4+IC0tLQo+PiAg
IHhlbi9hcmNoL2FybS9hcm02NC9lbnRyeS5TIHwgIDQgKystCj4+ICAgeGVuL2FyY2gvYXJtL3Ry
YXBzLmMgICAgICAgfCA3MSArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCAzOCBkZWxldGlv
bnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9lbnRyeS5TIGIveGVu
L2FyY2gvYXJtL2FybTY0L2VudHJ5LlMKPj4gaW5kZXggNDBkOWYzZWM4Yy4uOWVhZmFlNTE2YiAx
MDA2NDQKPj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMKPj4gKysrIGIveGVuL2Fy
Y2gvYXJtL2FybTY0L2VudHJ5LlMKPj4gQEAgLTE0Nyw3ICsxNDcsNyBAQAo+Pgo+PiAgICAgICAg
ICAgLmlmIFxoeXAgPT0gMCAgICAgICAgIC8qIEd1ZXN0IG1vZGUgKi8KPj4KPj4gLSAgICAgICAg
YmwgICAgICBsZWF2ZV9oeXBlcnZpc29yX3RhaWwgLyogRGlzYWJsZXMgaW50ZXJydXB0cyBvbiBy
ZXR1cm4gKi8KPj4gKyAgICAgICAgYmwgICAgICBsZWF2ZV9oeXBlcnZpc29yX3RvX2d1ZXN0IC8q
IERpc2FibGVzIGludGVycnVwdHMgb24gcmV0dXJuICovCj4+Cj4+ICAgICAgICAgICBleGl0X2d1
ZXN0IFxjb21wYXQKPj4KPj4gQEAgLTE3NSw2ICsxNzUsOCBAQAo+PiAgICAgICAgICAgICAgICAg
ICAgICAgU0tJUF9TWU5DSFJPTklaRV9TRVJST1JfRU5UUllfRVhJVCkKPj4gICAgICAgICAgIG1z
ciAgICAgZGFpZmNsciwgXGlmbGFncwo+PiAgICAgICAgICAgbW92ICAgICB4MCwgc3AKPiBMb29r
cyBsaWtlIHRoaXMgbW92IGNhbiBiZSByZW1vdmVkIChzZWUgY29tbWVuZCBiZWxvdykuCj4gCj4+
ICsgICAgICAgIGJsICAgICAgZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1ZXN0Cj4+ICsgICAgICAg
IG1vdiAgICAgeDAsIHNwCj4+ICAgICAgICAgICBibCAgICAgIGRvX3RyYXBfXHRyYXAKPj4gICAx
Ogo+PiAgICAgICAgICAgZXhpdCAgICBoeXA9MCwgY29tcGF0PVxjb21wYXQKPj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS90cmFwcy5jIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKPj4gaW5kZXgg
YTNiOTYxYmQwNi4uMjBiYTM0ZWM5MSAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gvYXJtL3RyYXBz
LmMKPj4gKysrIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKPj4gQEAgLTIwMDYsNDcgKzIwMDYsNDYg
QEAgc3RhdGljIGlubGluZSBib29sIG5lZWRzX3NzYmRfZmxpcChzdHJ1Y3QgdmNwdSAqdikKPj4g
ICAgICAgICAgICAgICAgY3B1X3JlcXVpcmVfc3NiZF9taXRpZ2F0aW9uKCk7Cj4+ICAgfQo+Pgo+
PiAtc3RhdGljIHZvaWQgZW50ZXJfaHlwZXJ2aXNvcl9oZWFkKHN0cnVjdCBjcHVfdXNlcl9yZWdz
ICpyZWdzKQo+PiArLyoKPj4gKyAqIEFjdGlvbnMgdGhhdCBuZWVkcyB0byBiZSBkb25lIGFmdGVy
IGV4aXRpbmcgdGhlIGd1ZXN0IGFuZCBiZWZvcmUgYW55Cj4+ICsgKiByZXF1ZXN0IGZyb20gaXQg
aXMgaGFuZGxlZC4KPiBNYXliZSBpdCBpcyBtZSBvbmx5LCBidXQgdGhlIHBocmFzaW5nIGlzIGNv
bmZ1c2luZy4gSSBoYWQgdG8gcmVhZCBpdCB0d28KPiB0aW1lcyBiZWZvcmUgSSBnZXQgaXQuIFdo
YXQgYWJvdXQgIkFjdGlvbnMgdGhhdCBuZWVkcyB0byBiZSBkb25lIHdoZW4KPiByYWlzaW5nIGV4
Y2VwdGlvbiBsZXZlbCI/IE9yIG1heWJlICJBY3Rpb25zIHRoYXQgbmVlZHMgdG8gYmUgZG9uZSB3
aGVuCj4gc3dpdGNoaW5nIGZyb20gZ3Vlc3QgdG8gaHlwZXJ2aXNvciBtb2RlIiA/CgpJcyBpdCBh
IHN1Z2dlc3Rpb24gdG8gcmVwbGFjZSB0aGUgZnVsbCBzZW50ZW5jZSBvciBqdXN0IHRoZSBmaXJz
dCBiZWZvcmUgKGkuZS4gCmJlZm9yZSAnYW5kJyk/Cgo+IAo+PiArICovCj4+ICt2b2lkIGVudGVy
X2h5cGVydmlzb3JfZnJvbV9ndWVzdChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKPiBXaXRo
IHRoZSBndWVzdF9tb2RlKHJlZ3MpIGNoZWNrIHJlbW92YWwgLCB0aGlzIGZ1bmN0aW9uIGRvZXMg
bm90IHVzZSByZWdzCj4gYW55bW9yZS4KCkkgaGF2ZSBuZWFybHkgZG9uZSBpdCB3aGlsZSB3b3Jr
aW5nIG9uIHRoZSBzZXJpZXMsIGJ1dCB0aGVuIEkgdGhvdWdodCB0aGF0IGl0IAp3b3VsZCBiZSBi
ZXR0ZXIga2VlcCBhbGwgdGhlIGZ1bmN0aW9ucyBjYWxsZWQgZnJvbSB0aGUgZW50cnkgcGF0aCBp
biBhc3NlbWJseSAKc2ltaWxhci4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

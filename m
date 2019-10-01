Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A90C43CE
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 00:22:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFQUC-0001lN-3c; Tue, 01 Oct 2019 22:19:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JHuc=X2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFQUA-0001lI-Io
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 22:19:10 +0000
X-Inumbo-ID: 7d19b18a-e499-11e9-bf31-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 7d19b18a-e499-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 22:19:09 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A87E52054F;
 Tue,  1 Oct 2019 22:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569968348;
 bh=rhN1ZUfVHRSI4KNy9O5AvyjmUsUA2wSsdi+5iv+mgg8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=HyHwedpZqp3q+73UT5UshAOKXoUKA1Dr8/E9AzuPQwW7ByNIUwwiQ8/0TtueTrnPu
 GCHj9AlNezE66CSuwMopFe6NP7qG6atLCxJQrzKrScAjbYhI0EBABN6sYawhWuzW+r
 JxQik5iCW8iJ/+7KjVy9cvwcs8xOsX1Z+gXWpIfg=
Date: Tue, 1 Oct 2019 15:19:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190926183808.11630-10-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1910011518240.2943@sstabellini-ThinkPad-T480s>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-10-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 09/10] xen/arm: asm: Replace
 use of ALTERNATIVE with alternative_if
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, andrii.anisov@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyNiBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFVzaW5nIGFsdGVybmF0
aXZlX2lmIG1ha2VzIHRoZSBjb2RlIGEgYml0IG1vcmUgc3RyZWFtbGluZWQuCj4gCj4gVGFrZSB0
aGUgb3Bwb3J0dW5pdHkgdG8gdXNlIHRoZSBuZXcgYXV0by1ub3AgaW5mcmFzdHJ1Y3R1cmUgdG8g
YXZvaWQKPiBjb3VudGluZyB0aGUgbnVtYmVyIG9mIG5vcCBpbiB0aGUgZWxzZSBwYXJ0IGZvciBh
cmNoL2FybS9hcm02NC9lbnRyeS5TCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAKPiAtLS0KPiAgICAgVGhpcyBpcyBwcmV0dHkgbXVjaCBh
IG1hdHRlciBvZiB0YXN0ZSwgYnV0IGF0IGxlYXN0IGZvciBhcm02NCB0aGlzCj4gICAgIGFsbG93
cyB1cyB0byB1c2UgdGhlIGF1dG8tbm9wIGluZnJhc3RydWN0dXJlLiBTbyB0aGUgYXJtMzIgaXMg
bW9yZQo+ICAgICB0byBrZWVwIGlubGluZSB3aXRoIGFybTY0Lgo+IC0tLQo+ICB4ZW4vYXJjaC9h
cm0vYXJtMzIvZW50cnkuUyB8IDkgKysrKysrLS0tCj4gIHhlbi9hcmNoL2FybS9hcm02NC9lbnRy
eS5TIHwgOCArKysrKy0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDYg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm0zMi9lbnRyeS5T
IGIveGVuL2FyY2gvYXJtL2FybTMyL2VudHJ5LlMKPiBpbmRleCAwYjRjZDE5YWJkLi4xNDI4Y2Qz
NTgzIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9lbnRyeS5TCj4gKysrIGIveGVu
L2FyY2gvYXJtL2FybTMyL2VudHJ5LlMKPiBAQCAtNjUsOSArNjUsMTIgQEAgc2F2ZV9ndWVzdF9y
ZWdzOgo+ICAgICAgICAgICAqIElmIHRoZSBTS0lQX1NZTkNIUk9OSVpFX1NFUlJPUl9FTlRSWV9F
WElUIGhhcyBiZWVuIHNldCBpbiB0aGUgY3B1Cj4gICAgICAgICAgICogZmVhdHVyZSwgdGhlIGNo
ZWNraW5nIG9mIHBlbmRpbmcgU0Vycm9ycyB3aWxsIGJlIHNraXBwZWQuCj4gICAgICAgICAgICov
Cj4gLSAgICAgICAgQUxURVJOQVRJVkUoIm5vcCIsCj4gLSAgICAgICAgICAgICAgICAgICAgImIg
c2tpcF9jaGVjayIsCj4gLSAgICAgICAgICAgICAgICAgICAgU0tJUF9TWU5DSFJPTklaRV9TRVJS
T1JfRU5UUllfRVhJVCkKPiArICAgICAgICBhbHRlcm5hdGl2ZV9pZiBTS0lQX1NZTkNIUk9OSVpF
X1NFUlJPUl9FTlRSWV9FWElUCj4gKyAgICAgICAgbm9wCj4gKyAgICAgICAgYWx0ZXJuYXRpdmVf
ZWxzZQo+ICsgICAgICAgIGIgICBza2lwX2NoZWNrCj4gKyAgICAgICAgYWx0ZXJuYXRpdmVfZW5k
aWYKClRoaXMgY291bGQgYmUgd3JpdHRlbiBhczoKCmFsdGVybmF0aXZlX2lmX25vdCBTS0lQX1NZ
TkNIUk9OSVpFX1NFUlJPUl9FTlRSWV9FWElUCmIgICBza2lwX2NoZWNrCmFsdGVybmF0aXZlX2Vs
c2Vfbm9wX2VuZGlmCgoKPiAgICAgICAgICAvKgo+ICAgICAgICAgICAqIFN0YXJ0IHRvIGNoZWNr
IHBlbmRpbmcgdmlydHVhbCBhYm9ydCBpbiB0aGUgZ2FwIG9mIEd1ZXN0IC0+IEhZUAo+ICAgICAg
ICAgICAqIHdvcmxkIHN3aXRjaC4KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2Vu
dHJ5LlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUwo+IGluZGV4IDQ1OGQxMmYxODguLjkx
Y2Y2ZWU2ZjQgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMKPiArKysg
Yi94ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUwo+IEBAIC0xNzAsOSArMTcwLDExIEBACj4gICAg
ICAgICAgICogaXMgbm90IHNldC4gSWYgYSB2U0Vycm9yIHRvb2sgcGxhY2UsIHRoZSBpbml0aWFs
IGV4Y2VwdGlvbiB3aWxsIGJlCj4gICAgICAgICAgICogc2tpcHBlZC4gRXhpdCBBU0FQCj4gICAg
ICAgICAgICovCj4gLSAgICAgICAgQUxURVJOQVRJVkUoImJsIGNoZWNrX3BlbmRpbmdfdnNlcnJv
cjsgY2JueiB4MCwgMWYiLAo+IC0gICAgICAgICAgICAgICAgICAgICJub3A7IG5vcCIsCj4gLSAg
ICAgICAgICAgICAgICAgICAgU0tJUF9TWU5DSFJPTklaRV9TRVJST1JfRU5UUllfRVhJVCkKPiAr
ICAgICAgICBhbHRlcm5hdGl2ZV9pZiBTS0lQX1NZTkNIUk9OSVpFX1NFUlJPUl9FTlRSWV9FWElU
Cj4gKyAgICAgICAgYmwgICAgICBjaGVja19wZW5kaW5nX3ZzZXJyb3IKPiArICAgICAgICBjYm56
ICAgIHgwLCAxZgo+ICsgICAgICAgIGFsdGVybmF0aXZlX2Vsc2Vfbm9wX2VuZGlmCj4gKwo+ICAg
ICAgICAgIG1vdiAgICAgeDAsIHNwCj4gICAgICAgICAgYmwgICAgICBlbnRlcl9oeXBlcnZpc29y
X2Zyb21fZ3Vlc3Rfbm9pcnEKPiAgICAgICAgICBtc3IgICAgIGRhaWZjbHIsIFxpZmxhZ3MKPiAt
LSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=

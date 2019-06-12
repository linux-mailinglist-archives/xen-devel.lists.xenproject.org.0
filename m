Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 589FF431AF
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 00:35:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbBno-0005mf-5a; Wed, 12 Jun 2019 22:33:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yIha=UL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hbBnm-0005ma-Rw
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 22:33:06 +0000
X-Inumbo-ID: 0b522785-8d62-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0b522785-8d62-11e9-8980-bc764e045a96;
 Wed, 12 Jun 2019 22:33:05 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F302208C2;
 Wed, 12 Jun 2019 22:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560378784;
 bh=g074DWK8DHYzHg8Ny6w/LwMJFXxWZUFF2FdA+lC4Zyg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ZnuCVEilKeMuZDCt/cZ3H8D8UuToMYkAxxcIMygTjMus3dEBXCav7LAQZGOcXXk52
 2DA+jD6klFtchzfJHlMGdT7YJFbZsoRO7adrtKWYBvS6tJJj/Nyvc0IvTqcX7D6cKE
 izzAi3IRTtDGaUNeHn7KGaXW9NzMXa0CVdfI+vW4=
Date: Wed, 12 Jun 2019 15:33:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190514123125.29086-12-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906121528260.13737@sstabellini-ThinkPad-T480s>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-12-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART3 v2 11/12] xen/arm: mm: Don't
 open-code Xen PT update in {set, clear}_fixmap()
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

T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IHtzZXQsIGNsZWFyfV9m
aXhtYXAoKSBhcmUgY3VycmVudGx5IG9wZW4tY29kaW5nIHVwZGF0ZSB0byB0aGUgWGVuCj4gcGFn
ZS10YWJsZXMuIFRoaXMgY2FuIGJlIGF2b2lkZWQgYnkgdXNpbmcgdGhlIGdlbmVyaWMgaGVscGVy
cwo+IG1hcF9wYWdlc190b194ZW4oKSBhbmQgZGVzdHJveV94ZW5fbWFwcGluZ3MoKS4KPiAKPiBC
b3RoIGZ1bmN0aW9uIGFyZSBub3QgbWVhbnQgdG8gZmFpbCBmb3IgZml4bWFwLCBoZW5jZSB0aGUg
QlVHX09OKCkKPiBjaGVja2luZyB0aGUgcmV0dXJuLgoKQlVHX09OIGNyYXNoZXMgdGhlIGh5cGVy
dmlzb3IgZXZlbiBpbiBub24tREVCVUcgYnVpbGRzLiBXb3VsZCBhbiBBU1NFUlQKYmUgYSBiZXR0
ZXIgY2hvaWNlPwoKVGhlIGNoYW5nZXMgaW4gdGhpcyBwYXRjaCBjaGVja3Mgb3V0IE9LLgoKCj4g
U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBSZXZp
ZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KPiAKPiAtLS0K
PiAgICAgQ2hhbmdlcyBpbiB2MjoKPiAgICAgICAgIC0gQWRkIEFuZHJpaSdzIHJldmlld2VkLWJ5
Cj4gLS0tCj4gIHhlbi9hcmNoL2FybS9tbS5jIHwgMTYgKysrKysrKystLS0tLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jCj4gaW5kZXggOWE0MDc1
NGY0NC4uMjNjYTYxZThmMCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vbW0uYwo+ICsrKyBi
L3hlbi9hcmNoL2FybS9tbS5jCj4gQEAgLTM0OCwxOSArMzQ4LDE5IEBAIHN0YXRpYyBpbmxpbmUg
bHBhZV90IG1mbl90b194ZW5fZW50cnkobWZuX3QgbWZuLCB1bnNpZ25lZCBhdHRyKQo+ICAvKiBN
YXAgYSA0ayBwYWdlIGluIGEgZml4bWFwIGVudHJ5ICovCj4gIHZvaWQgc2V0X2ZpeG1hcCh1bnNp
Z25lZCBtYXAsIG1mbl90IG1mbiwgdW5zaWduZWQgaW50IGZsYWdzKQo+ICB7Cj4gLSAgICBscGFl
X3QgcHRlID0gbWZuX3RvX3hlbl9lbnRyeShtZm4sIFBBR0VfQUlfTUFTSyhmbGFncykpOwo+IC0g
ICAgcHRlLnB0LnRhYmxlID0gMTsgLyogNGsgbWFwcGluZ3MgYWx3YXlzIGhhdmUgdGhpcyBiaXQg
c2V0ICovCj4gLSAgICBwdGUucHQueG4gPSAxOwo+IC0gICAgd3JpdGVfcHRlKHhlbl9maXhtYXAg
KyB0aGlyZF90YWJsZV9vZmZzZXQoRklYTUFQX0FERFIobWFwKSksIHB0ZSk7Cj4gLSAgICBmbHVz
aF94ZW5fdGxiX3JhbmdlX3ZhKEZJWE1BUF9BRERSKG1hcCksIFBBR0VfU0laRSk7Cj4gKyAgICBp
bnQgcmVzOwo+ICsKPiArICAgIHJlcyA9IG1hcF9wYWdlc190b194ZW4oRklYTUFQX0FERFIobWFw
KSwgbWZuLCAxLCBmbGFncyk7Cj4gKyAgICBCVUdfT04ocmVzICE9IDApOwo+ICB9Cj4gIAo+ICAv
KiBSZW1vdmUgYSBtYXBwaW5nIGZyb20gYSBmaXhtYXAgZW50cnkgKi8KPiAgdm9pZCBjbGVhcl9m
aXhtYXAodW5zaWduZWQgbWFwKQo+ICB7Cj4gLSAgICBscGFlX3QgcHRlID0gezB9Owo+IC0gICAg
d3JpdGVfcHRlKHhlbl9maXhtYXAgKyB0aGlyZF90YWJsZV9vZmZzZXQoRklYTUFQX0FERFIobWFw
KSksIHB0ZSk7Cj4gLSAgICBmbHVzaF94ZW5fdGxiX3JhbmdlX3ZhKEZJWE1BUF9BRERSKG1hcCks
IFBBR0VfU0laRSk7Cj4gKyAgICBpbnQgcmVzOwo+ICsKPiArICAgIHJlcyA9IGRlc3Ryb3lfeGVu
X21hcHBpbmdzKEZJWE1BUF9BRERSKG1hcCksIEZJWE1BUF9BRERSKG1hcCkgKyBQQUdFX1NJWkUp
Owo+ICsgICAgQlVHX09OKHJlcyAhPSAwKTsKPiAgfQo+ICAKPiAgLyogQ3JlYXRlIFhlbidzIG1h
cHBpbmdzIG9mIG1lbW9yeS4KPiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

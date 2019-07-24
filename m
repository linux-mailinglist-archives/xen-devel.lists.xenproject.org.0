Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA268732AB
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 17:25:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqJ6E-0004Z8-JI; Wed, 24 Jul 2019 15:22:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xcQv=VV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hqJ6D-0004Z3-7F
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 15:22:37 +0000
X-Inumbo-ID: dd3c623c-ae26-11e9-88fa-b3ec1067459b
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd3c623c-ae26-11e9-88fa-b3ec1067459b;
 Wed, 24 Jul 2019 15:22:35 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 09010217D4;
 Wed, 24 Jul 2019 15:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563981755;
 bh=S8dJIyMt0wvYjI/KLlIOl1g2F1ulIJlM/BBP7x/T2ec=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=DejBLGzg9pLDDTZmU0j8CQxAEAjNlq4KDl/dEd+9f6nZL//EOkiPbESxo1Sd/CgWD
 czmehutATx177QNQWU43HnWQY5EjeCRvXUnTbmMglG5zVWNXXcgg61mDSQD7SF2AGu
 KMx+pI8xrkiZtNlMhqdJid7PDvWFwmsmQ/SKeSt0=
Date: Wed, 24 Jul 2019 08:22:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <1a509d9b-0e7d-01c5-5d13-542f53c55949@arm.com>
Message-ID: <alpine.DEB.2.21.1907240820040.7102@sstabellini-ThinkPad-T480s>
References: <20190718115714.634-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1907231654530.7102@sstabellini-ThinkPad-T480s>
 <1a509d9b-0e7d-01c5-5d13-542f53c55949@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm64: Correctly compute the virtual
 address in maddr_to_virt()
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyNCBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMjQvMDcvMjAxOSAwMToxNywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24g
VGh1LCAxOCBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBXaXRoIHRoYXQsIHRo
ZSBwYXRjaCAxMTkxMTU2MzYxICJ4ZW4vYXJtOiBmaXggbWFzayBjYWxjdWxhdGlvbiBpbgo+ID4g
PiBwZHhfaW5pdF9tYXNrIiBjb3VsZCBiZSByZS1pbnN0YXRlZC4KPiA+ID4gLS0tCj4gPiA+ICAg
eGVuL2FyY2gvYXJtL21tLmMgICAgICAgIHwgMiArKwo+ID4gPiAgIHhlbi9pbmNsdWRlL2FzbS1h
cm0vbW0uaCB8IDYgKysrKy0tCj4gPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwo+ID4gPiBpbmRleCA0NDI1OGFkODljLi5lMWNkZWFh
ZjJmIDEwMDY0NAo+ID4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vbW0uYwo+ID4gPiArKysgYi94ZW4v
YXJjaC9hcm0vbW0uYwo+ID4gPiBAQCAtMTY1LDYgKzE2NSw3IEBAIG1mbl90IHhlbmhlYXBfbWZu
X2VuZCBfX3JlYWRfbW9zdGx5Owo+ID4gPiAgIHZhZGRyX3QgeGVuaGVhcF92aXJ0X2VuZCBfX3Jl
YWRfbW9zdGx5Owo+ID4gPiAgICNpZmRlZiBDT05GSUdfQVJNXzY0Cj4gPiA+ICAgdmFkZHJfdCB4
ZW5oZWFwX3ZpcnRfc3RhcnQgX19yZWFkX21vc3RseTsKPiA+ID4gK3Vuc2lnbmVkIGxvbmcgeGVu
aGVhcF9iYXNlX3BkeCBfX3JlYWRfbW9zdGx5Owo+ID4gPiAgICNlbmRpZgo+ID4gPiAgICAgdW5z
aWduZWQgbG9uZyBmcmFtZXRhYmxlX2Jhc2VfcGR4IF9fcmVhZF9tb3N0bHk7Cj4gPiA+IEBAIC03
OTYsNiArNzk3LDcgQEAgdm9pZCBfX2luaXQgc2V0dXBfeGVuaGVhcF9tYXBwaW5ncyh1bnNpZ25l
ZCBsb25nCj4gPiA+IGJhc2VfbWZuLAo+ID4gPiAgICAgICBpZiAoIG1mbl9lcSh4ZW5oZWFwX21m
bl9zdGFydCwgSU5WQUxJRF9NRk4pICkKPiA+ID4gICAgICAgewo+ID4gPiAgICAgICAgICAgeGVu
aGVhcF9tZm5fc3RhcnQgPSBfbWZuKGJhc2VfbWZuKTsKPiA+ID4gKyAgICAgICAgeGVuaGVhcF9i
YXNlX3BkeCA9IG1mbl90b19wZHgoX21mbihiYXNlX21mbikpOwo+ID4gPiAgICAgICAgICAgeGVu
aGVhcF92aXJ0X3N0YXJ0ID0gRElSRUNUTUFQX1ZJUlRfU1RBUlQgKwo+ID4gPiAgICAgICAgICAg
ICAgIChiYXNlX21mbiAtIG1mbikgKiBQQUdFX1NJWkU7Cj4gPiA+ICAgICAgIH0KPiA+IAo+ID4g
SSBjYW4gc2VlIHRoYXQgdGhpcyB3b3VsZCB3b3JrLCBidXQgd291bGRuJ3QgaXQgYmUgYSBiZXR0
ZXIgZml0IHRvIHNldAo+ID4geGVuaGVhcF9iYXNlX3BkeCBpbiB4ZW4vYXJjaC9hcm0vc2V0dXAu
YzpzZXR1cF9tbSwgd2hlcmUgd2UgYWxyZWFkeSBzZXQ6Cj4gPiAKPiA+IAo+ID4gICAgICB4ZW5o
ZWFwX3ZpcnRfZW5kID0gWEVOSEVBUF9WSVJUX1NUQVJUICsgcmFtX2VuZCAtIHJhbV9zdGFydDsK
PiA+ICAgICAgeGVuaGVhcF9tZm5fc3RhcnQgPSBtYWRkcl90b19tZm4ocmFtX3N0YXJ0KTsKPiA+
ICAgICAgeGVuaGVhcF9tZm5fZW5kID0gbWFkZHJfdG9fbWZuKHJhbV9lbmQpOwo+ID4gCj4gPiBP
ciBpdCB0b28gbGF0ZSBieSB0aGVuPwo+IAo+IFllcyBzZXR1cF94ZW5oZWFwX21hcHBpbmdzKCkg
aXMgdXNpbmcgX19tZm5fdG9fdmlydCgpIHRoYXQgd2lsbCBjYWxsCj4gbWFkZHJfdG9fdmlydCgp
LiBTbyB3ZSBuZWVkIHRvIHNldHVwIHhlbmhlYW1fYmFzZV9zdGFydCBlYXJsaWVyLgoKT0sgdGhl
bjoKClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+CgoKPiBUQkgsIHRoaXMgMyB2YXJpYWJsZXMgc2hvdWxkIGJlIHNldCB3aXRoaW4geGVuaGVh
cCBhcyBpdCBtYWtlcyBjbGVhcmVyIGhvdwo+IHRoZXkgYXJlIGNvbXB1dGVkLiBBY3R1YWxseSwg
eGVuaGVhbV9tZm5fc3RhcnQgd2lsbCBiZSBvdmVyaWRkZW4sIHRoYW5rZnVsbHkKPiB0aGUgbmV3
IGFuZCBvbGQgdmFsdWVzIGFyZSBleGFjdGx5IHRoZSBzYW1lLi4uCj4gCj4gSSBoYXZlIHBsYW4g
dG8gcmV3cml0ZSB0aGUgeGVuaGVhcCBjb2RlIGFzIHRoZXJlIGFyZSBmZXcgcHJvYmxlbXMgd2l0
aCBpdDoKPiAgIDEpIENoaWNrZW4gYW5kIGVnZ3MgcHJvYmxlbSB3aXRoIHRoZSBhbGxvY19ib290
X3BhZ2VzKC4uLikuIFdlIG1heSBuZWVkIHRvCj4gYWxsb2NhdGUgbWVtb3J5IHdoaWxlIGRvaW5n
IHRoZSB4ZW5oZWFwIG1hcHBpbmcgYnV0IHBhZ2UgYXJlIG5vdCBnaXZlbiB0byB0aGUKPiBhbGxv
Y2F0b3IgdW50aWwgbGF0ZS4gQnV0IGlmIHlvdSBnaXZlIHRvIHRoZSBhbGxvY2F0b3IgdGhlIHBh
Z2UgYW5kIGl0IGlzIG5vdAo+IHlldCB1bm1hcCwgdGhlbiB5b3Ugd291bGQgcmVjZWl2ZSBhIGRh
dGEgYWJvcnQuCj4gICAyKSBXZSBhcmUgbWFwcGluZyBhbGwgdGhlIFJBTXMsIGluY2x1ZGUgcmVz
ZXJ2ZWQtbWVtb3J5IG1hcmtlZCBuby1tYXAuIFRoaXMKPiBtYXkgcmVzdWx0IHRvIGNhY2hpbmcg
cHJvYmxlbSBsYXRlciBvbi4KPiAgIDMpIFdlIGFyZSB1c2luZyAxR0IgbWFwcGluZywgaG93ZXZl
ciBpZiB0aGUgUkFNIGlzIGxlc3MgdGhhbiBhIDFHQiwgd2Ugd2lsbAo+IGVuZC11cCB0byBjb3Zl
ciBub24tUkFNLiBXaXRoIGJhZCBsdWNrLCB0aGlzIG1heSBjb3ZlciBkZXZpY2UgbWVtb3J5IGxl
YWRpbmcKPiB0byBpbnRlcmVzdGluZyByZXN1bHQuIEFGQUlLLCB0aGUgUlBJNCBoYXMgdGhpcyBl
eGFjdCB1c2UgY2FzZS4KClRoYW5rcyBmb3IgdGhlIHdyaXRlLXVwLCBJIHdhc24ndCBhd2FyZSBv
ZiBhbGwgdGhlIGlzc3Vlcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=

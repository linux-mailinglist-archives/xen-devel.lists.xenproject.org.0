Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E74A29FC
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 00:45:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3T71-0000to-81; Thu, 29 Aug 2019 22:41:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/L5Q=WZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i3T6z-0000ti-5K
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 22:41:49 +0000
X-Inumbo-ID: 2ee5b3cf-caae-11e9-ae74-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ee5b3cf-caae-11e9-ae74-12813bfff9fa;
 Thu, 29 Aug 2019 22:41:48 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6846D21874;
 Thu, 29 Aug 2019 22:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567118507;
 bh=zVuq7UiFIvES2V8FNzXq+zN3VeqnlIDeBuJ9TC/EqHQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=01g0xDT1GOKWzl8KJpALY9PNSe+2ZwSXIuKKWTkED0X8lgSA65Bl88vOV55gJMkv5
 fm/KMz4qjv1wktgJ2HStodSXuMPPdrMSdxXnb0SXhjdvaAxrcKzx+PRIBrSURCsm5+
 z9PyWIKWOk7Fw8ooI3Sb2GNkwAggegQQjDPJR5v0=
Date: Thu, 29 Aug 2019 15:41:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20190826121944.515-3-hch@lst.de>
Message-ID: <alpine.DEB.2.21.1908281419010.8175@sstabellini-ThinkPad-T480s>
References: <20190826121944.515-1-hch@lst.de> <20190826121944.515-3-hch@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 02/11] xen/arm: use dev_is_dma_coherent
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyNiBBdWcgMjAxOSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gVXNlIHRoZSBk
bWEtbm9uY29oZXJlbnQgZGV2X2lzX2RtYV9jb2hlcmVudCBoZWxwZXIgaW5zdGVhZCBvZiB0aGUg
aG9tZQo+IGdyb3duIHZhcmlhbnQuICBOb3RlIHRoYXQgYm90aCBhcmUgYWx3YXlzIGluaXRpYWxp
emVkIHRvIHRoZSBzYW1lCj4gdmFsdWUgaW4gYXJjaF9zZXR1cF9kbWFfb3BzLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IFJldmlld2VkLWJ5OiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKUmV2aWV3ZWQtYnk6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCgo+IC0tLQo+ICBhcmNoL2FybS9p
bmNsdWRlL2FzbS9kbWEtbWFwcGluZy5oICAgfCAgNiAtLS0tLS0KPiAgYXJjaC9hcm0veGVuL21t
LmMgICAgICAgICAgICAgICAgICAgIHwgMTIgKysrKysrLS0tLS0tCj4gIGFyY2gvYXJtNjQvaW5j
bHVkZS9hc20vZG1hLW1hcHBpbmcuaCB8ICA5IC0tLS0tLS0tLQo+ICAzIGZpbGVzIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gv
YXJtL2luY2x1ZGUvYXNtL2RtYS1tYXBwaW5nLmggYi9hcmNoL2FybS9pbmNsdWRlL2FzbS9kbWEt
bWFwcGluZy5oCj4gaW5kZXggZGJhOTM1NWUyNDg0Li5iZGQ4MGRkYmNhMzQgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9hcm0vaW5jbHVkZS9hc20vZG1hLW1hcHBpbmcuaAo+ICsrKyBiL2FyY2gvYXJtL2lu
Y2x1ZGUvYXNtL2RtYS1tYXBwaW5nLmgKPiBAQCAtOTEsMTIgKzkxLDYgQEAgc3RhdGljIGlubGlu
ZSBkbWFfYWRkcl90IHZpcnRfdG9fZG1hKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqYWRkcikK
PiAgfQo+ICAjZW5kaWYKPiAgCj4gLS8qIGRvIG5vdCB1c2UgdGhpcyBmdW5jdGlvbiBpbiBhIGRy
aXZlciAqLwo+IC1zdGF0aWMgaW5saW5lIGJvb2wgaXNfZGV2aWNlX2RtYV9jb2hlcmVudChzdHJ1
Y3QgZGV2aWNlICpkZXYpCj4gLXsKPiAtCXJldHVybiBkZXYtPmFyY2hkYXRhLmRtYV9jb2hlcmVu
dDsKPiAtfQo+IC0KPiAgLyoqCj4gICAqIGFybV9kbWFfYWxsb2MgLSBhbGxvY2F0ZSBjb25zaXN0
ZW50IG1lbW9yeSBmb3IgRE1BCj4gICAqIEBkZXY6IHZhbGlkIHN0cnVjdCBkZXZpY2UgcG9pbnRl
ciwgb3IgTlVMTCBmb3IgSVNBIGFuZCBFSVNBLWxpa2UgZGV2aWNlcwo+IGRpZmYgLS1naXQgYS9h
cmNoL2FybS94ZW4vbW0uYyBiL2FyY2gvYXJtL3hlbi9tbS5jCj4gaW5kZXggZDMzYjc3ZTlhZGQz
Li45MDU3NGQ4OWQwZDQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0veGVuL21tLmMKPiArKysgYi9h
cmNoL2FybS94ZW4vbW0uYwo+IEBAIC0xLDYgKzEsNiBAQAo+ICAvLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMC1vbmx5Cj4gICNpbmNsdWRlIDxsaW51eC9jcHUuaD4KPiAtI2luY2x1
ZGUgPGxpbnV4L2RtYS1tYXBwaW5nLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9kbWEtbm9uY29oZXJl
bnQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2dmcC5oPgo+ICAjaW5jbHVkZSA8bGludXgvaGlnaG1l
bS5oPgo+ICAjaW5jbHVkZSA8bGludXgvZXhwb3J0Lmg+Cj4gQEAgLTk5LDcgKzk5LDcgQEAgdm9p
ZCBfX3hlbl9kbWFfbWFwX3BhZ2Uoc3RydWN0IGRldmljZSAqaHdkZXYsIHN0cnVjdCBwYWdlICpw
YWdlLAo+ICAJICAgICBkbWFfYWRkcl90IGRldl9hZGRyLCB1bnNpZ25lZCBsb25nIG9mZnNldCwg
c2l6ZV90IHNpemUsCj4gIAkgICAgIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpciwgdW5zaWdu
ZWQgbG9uZyBhdHRycykKPiAgewo+IC0JaWYgKGlzX2RldmljZV9kbWFfY29oZXJlbnQoaHdkZXYp
KQo+ICsJaWYgKGRldl9pc19kbWFfY29oZXJlbnQoaHdkZXYpKQo+ICAJCXJldHVybjsKPiAgCWlm
IChhdHRycyAmIERNQV9BVFRSX1NLSVBfQ1BVX1NZTkMpCj4gIAkJcmV0dXJuOwo+IEBAIC0xMTIs
NyArMTEyLDcgQEAgdm9pZCBfX3hlbl9kbWFfdW5tYXBfcGFnZShzdHJ1Y3QgZGV2aWNlICpod2Rl
diwgZG1hX2FkZHJfdCBoYW5kbGUsCj4gIAkJdW5zaWduZWQgbG9uZyBhdHRycykKPiAgCj4gIHsK
PiAtCWlmIChpc19kZXZpY2VfZG1hX2NvaGVyZW50KGh3ZGV2KSkKPiArCWlmIChkZXZfaXNfZG1h
X2NvaGVyZW50KGh3ZGV2KSkKPiAgCQlyZXR1cm47Cj4gIAlpZiAoYXR0cnMgJiBETUFfQVRUUl9T
S0lQX0NQVV9TWU5DKQo+ICAJCXJldHVybjsKPiBAQCAtMTIzLDcgKzEyMyw3IEBAIHZvaWQgX194
ZW5fZG1hX3VubWFwX3BhZ2Uoc3RydWN0IGRldmljZSAqaHdkZXYsIGRtYV9hZGRyX3QgaGFuZGxl
LAo+ICB2b2lkIF9feGVuX2RtYV9zeW5jX3NpbmdsZV9mb3JfY3B1KHN0cnVjdCBkZXZpY2UgKmh3
ZGV2LAo+ICAJCWRtYV9hZGRyX3QgaGFuZGxlLCBzaXplX3Qgc2l6ZSwgZW51bSBkbWFfZGF0YV9k
aXJlY3Rpb24gZGlyKQo+ICB7Cj4gLQlpZiAoaXNfZGV2aWNlX2RtYV9jb2hlcmVudChod2Rldikp
Cj4gKwlpZiAoZGV2X2lzX2RtYV9jb2hlcmVudChod2RldikpCj4gIAkJcmV0dXJuOwo+ICAJX194
ZW5fZG1hX3BhZ2VfZGV2X3RvX2NwdShod2RldiwgaGFuZGxlLCBzaXplLCBkaXIpOwo+ICB9Cj4g
QEAgLTEzMSw3ICsxMzEsNyBAQCB2b2lkIF9feGVuX2RtYV9zeW5jX3NpbmdsZV9mb3JfY3B1KHN0
cnVjdCBkZXZpY2UgKmh3ZGV2LAo+ICB2b2lkIF9feGVuX2RtYV9zeW5jX3NpbmdsZV9mb3JfZGV2
aWNlKHN0cnVjdCBkZXZpY2UgKmh3ZGV2LAo+ICAJCWRtYV9hZGRyX3QgaGFuZGxlLCBzaXplX3Qg
c2l6ZSwgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyKQo+ICB7Cj4gLQlpZiAoaXNfZGV2aWNl
X2RtYV9jb2hlcmVudChod2RldikpCj4gKwlpZiAoZGV2X2lzX2RtYV9jb2hlcmVudChod2Rldikp
Cj4gIAkJcmV0dXJuOwo+ICAJX194ZW5fZG1hX3BhZ2VfY3B1X3RvX2Rldihod2RldiwgaGFuZGxl
LCBzaXplLCBkaXIpOwo+ICB9Cj4gQEAgLTE1OSw3ICsxNTksNyBAQCBib29sIHhlbl9hcmNoX25l
ZWRfc3dpb3RsYihzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gIAkgKiBtZW1vcnkgYW5kIHdlIGFyZSBu
b3QgYWJsZSB0byBmbHVzaCB0aGUgY2FjaGUuCj4gIAkgKi8KPiAgCXJldHVybiAoIWh5cGVyY2Fs
bF9jZmx1c2ggJiYgKHhlbl9wZm4gIT0gYmZuKSAmJgo+IC0JCSFpc19kZXZpY2VfZG1hX2NvaGVy
ZW50KGRldikpOwo+ICsJCSFkZXZfaXNfZG1hX2NvaGVyZW50KGRldikpOwo+ICB9Cj4gIAo+ICBp
bnQgeGVuX2NyZWF0ZV9jb250aWd1b3VzX3JlZ2lvbihwaHlzX2FkZHJfdCBwc3RhcnQsIHVuc2ln
bmVkIGludCBvcmRlciwKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9kbWEt
bWFwcGluZy5oIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9kbWEtbWFwcGluZy5oCj4gaW5kZXgg
YmRjYjA5MjJhNDBjLi42NzI0MzI1NWE4NTggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9pbmNs
dWRlL2FzbS9kbWEtbWFwcGluZy5oCj4gKysrIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9kbWEt
bWFwcGluZy5oCj4gQEAgLTE4LDE0ICsxOCw1IEBAIHN0YXRpYyBpbmxpbmUgY29uc3Qgc3RydWN0
IGRtYV9tYXBfb3BzICpnZXRfYXJjaF9kbWFfb3BzKHN0cnVjdCBidXNfdHlwZSAqYnVzKQo+ICAJ
cmV0dXJuIE5VTEw7Cj4gIH0KPiAgCj4gLS8qCj4gLSAqIERvIG5vdCB1c2UgdGhpcyBmdW5jdGlv
biBpbiBhIGRyaXZlciwgaXQgaXMgb25seSBwcm92aWRlZCBmb3IKPiAtICogYXJjaC9hcm0vbW0v
eGVuLmMsIHdoaWNoIGlzIHVzZWQgYnkgYXJtNjQgYXMgd2VsbC4KPiAtICovCj4gLXN0YXRpYyBp
bmxpbmUgYm9vbCBpc19kZXZpY2VfZG1hX2NvaGVyZW50KHN0cnVjdCBkZXZpY2UgKmRldikKPiAt
ewo+IC0JcmV0dXJuIGRldi0+ZG1hX2NvaGVyZW50Owo+IC19Cj4gLQo+ICAjZW5kaWYJLyogX19L
RVJORUxfXyAqLwo+ICAjZW5kaWYJLyogX19BU01fRE1BX01BUFBJTkdfSCAqLwo+IC0tIAo+IDIu
MjAuMQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

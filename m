Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B294184B
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 00:39:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hapN3-0001Pv-4V; Tue, 11 Jun 2019 22:36:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Cq/=UK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hapN2-0001Pq-3T
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 22:36:00 +0000
X-Inumbo-ID: 48588d65-8c99-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 48588d65-8c99-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 22:35:58 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C312F21734;
 Tue, 11 Jun 2019 22:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560292558;
 bh=/4imqgwM/SVg6skG9TL+mjL/OIYrcaImhIra8zJ0hOM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=dZZ62NuYVB1qOWgYsCnU2QxPb0fLLj5zBAikT8DEVKzN9CCJ3zYEM/NDNOLq2YIZN
 y8A2ydR5hhwGLrEhsoU8p0MZgcVN8cjRzQURPSyKqJEU7kS8gx81CpXAdOuNjkojqo
 w7n81Of/ybcRsIjXVckUcNAqa5BCf9fo50HP8qww=
Date: Tue, 11 Jun 2019 15:35:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190514123125.29086-6-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906111526300.13737@sstabellini-ThinkPad-T480s>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-6-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART3 v2 05/12] xen/arm: mm: Introduce
 _PAGE_PRESENT and _PAGE_POPULATE
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

T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IHRoZSBmbGFncyBhcmUgbm90IGVub3VnaCB0byBkZXNjcmliZSB3aGF0IGtpbmQgb2YgdXBkYXRl
Cj4gd2lsbCBkb25lIG9uIHRoZSBWQSByYW5nZS4gVGhleSBuZWVkIHRvIGJlIHVzZWQgaW4gY29u
anVuY3Rpb24gd2l0aCB0aGUKPiBlbnVtIHhlbm1hcF9vcGVyYXRpb24uCj4gCj4gSXQgd291bGQg
YmUgbW9yZSBjb252ZW5pZW50IHRvIGhhdmUgYWxsIHRoZSBpbmZvcm1hdGlvbiBmb3IgdGhlIHVw
ZGF0ZQo+IGluIGEgc2luZ2xlIHBsYWNlLgo+IAo+IFR3byBuZXcgZmxhZ3MgYXJlIGFkZGVkIHRv
IHJlbW92ZSB0aGUgcmVsaWVuY2Ugb24geGVubWFwX29wZXJhdGlvbjoKPiAgICAgLSBfUEFHRV9Q
UkVTRU5UOiBJbmRpY2F0ZSB3aGV0aGVyIHdlIGFyZSBhZGRpbmcvcmVtb3ZpbmcgdGhlIG1hcHBp
bmcKPiAgICAgLSBfUEFHRV9QT1BVTEFURTogSW5kaWNhdGUgd2hldGhlciB3ZSBvbmx5IHBvcHVs
YXRlIHBhZ2UtdGFibGVzCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNv
dkBlcGFtLmNvbT4KCkxvb2tpbmcgYWhlYWQgaW4gdGhpcyBzZXJpZXMsIEkga25vdyB0aGF0IHRo
aXMgaXMgZG9uZSBzbyB0aGF0IGxhdGVyIG9uCnlvdSBjYW4gcmVtb3ZlIGVudW0geGVubWFwX29w
ZXJhdGlvbi4gQnV0IHdoYXQgaXMgdGhlIGVuZCBnb2FsPyBXaHkgZG8Kd2Ugd2FudCB0byByZW1v
dmUgZW51bSB4ZW5tYXBfb3BlcmF0aW9uPyBJIGd1ZXNzIGl0IGlzIHRvIG1ha2UgdGhlIGNvZGUK
bW9yZSByZXVzYWJsZT8KCgo+IC0tLQo+ICAgICBDaGFuZ2VzIGluIHYyOgo+ICAgICAgICAgLSBB
ZGQgQW5kcmlpJ3MgcmV2aWV3ZWQtYnkKPiAtLS0KPiAgeGVuL2FyY2gvYXJtL21tLmMgICAgICAg
ICAgfCAyICstCj4gIHhlbi9pbmNsdWRlL2FzbS1hcm0vcGFnZS5oIHwgOSArKysrKysrLS0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbS5jIGIveGVuL2FyY2gvYXJtL21tLmMKPiBpbmRleCA5
ZGUyYTExNTBmLi4yMTkyZGVkZTU1IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9tbS5jCj4g
KysrIGIveGVuL2FyY2gvYXJtL21tLmMKPiBAQCAtMTA4Myw3ICsxMDgzLDcgQEAgaW50IG1hcF9w
YWdlc190b194ZW4odW5zaWduZWQgbG9uZyB2aXJ0LAo+ICAKPiAgaW50IHBvcHVsYXRlX3B0X3Jh
bmdlKHVuc2lnbmVkIGxvbmcgdmlydCwgdW5zaWduZWQgbG9uZyBucl9tZm5zKQo+ICB7Cj4gLSAg
ICByZXR1cm4geGVuX3B0X3VwZGF0ZShSRVNFUlZFLCB2aXJ0LCBJTlZBTElEX01GTiwgbnJfbWZu
cywgMCk7Cj4gKyAgICByZXR1cm4geGVuX3B0X3VwZGF0ZShSRVNFUlZFLCB2aXJ0LCBJTlZBTElE
X01GTiwgbnJfbWZucywgX1BBR0VfUE9QVUxBVEUpOwo+ICB9Cj4gIAo+ICBpbnQgZGVzdHJveV94
ZW5fbWFwcGluZ3ModW5zaWduZWQgbG9uZyB2LCB1bnNpZ25lZCBsb25nIGUpCj4gZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vcGFnZS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9wYWdl
LmgKPiBpbmRleCAyYmNkYjBmMWE1Li5jYWYyZmFjMWZmIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNs
dWRlL2FzbS1hcm0vcGFnZS5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9wYWdlLmgKPiBA
QCAtNzYsNiArNzYsOCBAQAo+ICAgKgo+ICAgKiBbMDoyXSBNZW1vcnkgQXR0cmlidXRlIEluZGV4
Cj4gICAqIFszOjRdIFBlcm1pc3Npb24gZmxhZ3MKPiArICogWzVdICAgUHJlc2VudCBiaXQKPiAr
ICogWzZdICAgUG9wdWxhdGUgcGFnZSB0YWJsZQoKWzVdIGlzIHByZXR0eSBjbGVhci4gQXMgYSBu
aXQsIEkgd291bGQgcHJvYmFibHkgd3JpdGU6CgogWzVdIFBhZ2UgUHJlc2VudAoKYmVjYXVzZSB0
aGVyZSBpcyBubyBuZWVkIHRvIHNheSAiYml0IiwgdGhlIFs1XSBtZWFucyBpdCBpcyBhIGJpdC4K
T3RoZXJ3aXNlLCBzb21ldGhpbmcgbGlrZSB0aGUgZm9sbG93aW5nOgoKIFs1XSBQcmVzZW50IGlu
IG1lbW9yeQoKYnV0IGl0J3MgdW5pbXBvcnRhbnQuCgpJdCdzIFs2XSB0aGF0IHdlIG1pZ2h0IHdh
bnQgdG8gZXhwbGFpbiBhIGJpdCBiZXR0ZXI6IGlmIHdlIHNheSAiUG9wdWxhdGUKcGFnZSB0YWJs
ZSIgdGhlbiBldmVyeSB0aW1lIHdlIHdhbnQgdGhlIFhlbiBwYWdldGFibGUgdG8gYmUgcG9wdWxh
dGVkIHdlCndvdWxkIG5lZWQgdG8gcGFzcyBfUEFHRV9QT1BVTEFURSwgZXZlbiB3aGVuIHRoZSBw
YWdlIGlzIHByZXNlbnQgaW4KbWVtb3J5LiBEbyB5b3Ugc2VlIHdoYXQgSSBtZWFuPyBJIGFtIG5v
dCBlbnRpcmVseSBzdXJlIGhvdyB0byBtYWtlIGl0CmNsZWFyZXIuIE1heWJlOgoKIFs2XSBPbmx5
IHBvcHVsYXRlIHBhZ2UgdGFibGVzCgoiT25seSIgYmVpbmcgdGhlIGtleSB3b3JkLgoKCj4gICAq
Lwo+ICAjZGVmaW5lIFBBR0VfQUlfTUFTSyh4KSAoKHgpICYgMHg3VSkKPiAgCj4gQEAgLTg2LDEy
ICs4OCwxNSBAQAo+ICAjZGVmaW5lIFBBR0VfWE5fTUFTSyh4KSAoKCh4KSA+PiBfUEFHRV9YTl9C
SVQpICYgMHgxVSkKPiAgI2RlZmluZSBQQUdFX1JPX01BU0soeCkgKCgoeCkgPj4gX1BBR0VfUk9f
QklUKSAmIDB4MVUpCj4gIAo+ICsjZGVmaW5lIF9QQUdFX1BSRVNFTlQgICAgKDFVIDw8IDUpCj4g
KyNkZWZpbmUgX1BBR0VfUE9QVUxBVEUgICAoMVUgPDwgNikKPiArCj4gIC8qCj4gICAqIF9QQUdF
X0RFVklDRSBhbmQgX1BBR0VfTk9STUFMIGFyZSBjb252ZW5pZW5jZSBkZWZpbmVzLiBUaGV5IGFy
ZSBub3QKPiAgICogbWVhbnQgdG8gYmUgdXNlZCBvdXRzaWRlIG9mIHRoaXMgaGVhZGVyLgo+ICAg
Ki8KPiAtI2RlZmluZSBfUEFHRV9ERVZJQ0UgICAgX1BBR0VfWE4KPiAtI2RlZmluZSBfUEFHRV9O
T1JNQUwgICAgTVRfTk9STUFMCj4gKyNkZWZpbmUgX1BBR0VfREVWSUNFICAgIChfUEFHRV9YTnxf
UEFHRV9QUkVTRU5UKQo+ICsjZGVmaW5lIF9QQUdFX05PUk1BTCAgICAoTVRfTk9STUFMfF9QQUdF
X1BSRVNFTlQpCj4gIAo+ICAjZGVmaW5lIFBBR0VfSFlQRVJWSVNPUl9STyAgICAgIChfUEFHRV9O
T1JNQUx8X1BBR0VfUk98X1BBR0VfWE4pCj4gICNkZWZpbmUgUEFHRV9IWVBFUlZJU09SX1JYICAg
ICAgKF9QQUdFX05PUk1BTHxfUEFHRV9STykKPiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

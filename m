Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F56E4889E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 18:15:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcuG1-0004JK-Lx; Mon, 17 Jun 2019 16:13:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7cdP=UQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hcuG0-0004J7-9X
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 16:13:20 +0000
X-Inumbo-ID: d1bc51a3-911a-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d1bc51a3-911a-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 16:13:18 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A8C43208C0;
 Mon, 17 Jun 2019 16:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560787998;
 bh=WA5c9iulOrWKZC8nW/LSFI3RRwdwSMrmm9TPJb30RtA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=esXlFkxzVe8OeQHrYcltCZb0SHCfcXUzCjMFDK71KIBrBw3fcKKyw2awU7xkaBWXi
 P5Cb/zukHo9q+8f0j6PjgLmzy+ue2MPDNoYGSY07b+AfBWMs3q8jtU1/STDRzL1f9Q
 s1Ucv1S7DZW1BS21uQS90ptCfj9qWOGZzb5QSKLE=
Date: Mon, 17 Jun 2019 09:13:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <20190617132946.2817440-1-arnd@arndb.de>
Message-ID: <alpine.DEB.2.21.1906170913080.2072@sstabellini-ThinkPad-T480s>
References: <20190617132946.2817440-1-arnd@arndb.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] swiotlb: fix phys_addr_t overflow warning
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, iommu@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>, Jesper Dangaard Brouer <brouer@redhat.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxNyBKdW4gMjAxOSwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBPbiBhcmNoaXRlY3R1
cmVzIHRoYXQgaGF2ZSBhIGxhcmdlciBkbWFfYWRkcl90IHRoYW4gcGh5c19hZGRyX3QsCj4gdGhl
IHN3aW90bGJfdGJsX21hcF9zaW5nbGUoKSBmdW5jdGlvbiB0cnVuY2F0ZXMgaXRzIHJldHVybiBj
b2RlCj4gaW4gdGhlIGZhaWx1cmUgcGF0aCwgbWFraW5nIGl0IGltcG9zc2libGUgdG8gaWRlbnRp
ZnkgdGhlIGVycm9yCj4gbGF0ZXIsIGFzIHdlIGNvbXBhcmUgdG8gdGhlIG9yaWdpbmFsIHZhbHVl
Ogo+IAo+IGtlcm5lbC9kbWEvc3dpb3RsYi5jOjU1MTo5OiBlcnJvcjogaW1wbGljaXQgY29udmVy
c2lvbiBmcm9tICdkbWFfYWRkcl90JyAoYWthICd1bnNpZ25lZCBsb25nIGxvbmcnKSB0byAncGh5
c19hZGRyX3QnIChha2EgJ3Vuc2lnbmVkIGludCcpIGNoYW5nZXMgdmFsdWUgZnJvbSAxODQ0Njc0
NDA3MzcwOTU1MTYxNSB0byA0Mjk0OTY3Mjk1IFstV2Vycm9yLC1XY29uc3RhbnQtY29udmVyc2lv
bl0KPiAgICAgICAgIHJldHVybiBETUFfTUFQUElOR19FUlJPUjsKPiAKPiBVc2UgYW4gZXhwbGlj
aXQgdHlwZWNhc3QgaGVyZSB0byBjb252ZXJ0IGl0IHRvIHRoZSBuYXJyb3dlciB0eXBlLAo+IGFu
ZCB1c2UgdGhlIHNhbWUgZXhwcmVzc2lvbiBpbiB0aGUgZXJyb3IgaGFuZGxpbmcgbGF0ZXIuCj4g
Cj4gRml4ZXM6IGI5MDdlMjA1MDhkMCAoInN3aW90bGI6IHJlbW92ZSBTV0lPVExCX01BUF9FUlJP
UiIpCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCkFja2Vk
LWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgoKPiAtLS0K
PiBJIHN0aWxsIHRoaW5rIHRoYXQgcmV2ZXJ0aW5nIHRoZSBvcmlnaW5hbCBjb21taXQgd291bGQg
aGF2ZQo+IHByb3ZpZGVkIGNsZWFyZXIgc2VtYW50aWNzIGZvciB0aGlzIGNvcm5lciBjYXNlLCBi
dXQgYXQgbGVhc3QKPiB0aGlzIHBhdGNoIHJlc3RvcmVzIHRoZSBjb3JyZWN0IGJlaGF2aW9yLgo+
IC0tLQo+ICBkcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jIHwgMiArLQo+ICBrZXJuZWwvZG1hL3N3
aW90bGIuYyAgICAgIHwgNCArKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9zd2lvdGxiLXhl
bi5jIGIvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYwo+IGluZGV4IGQ1M2YzNDkzYTZiOS4uY2Zi
ZTQ2Nzg1YTNiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMKPiArKysg
Yi9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jCj4gQEAgLTQwMiw3ICs0MDIsNyBAQCBzdGF0aWMg
ZG1hX2FkZHJfdCB4ZW5fc3dpb3RsYl9tYXBfcGFnZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVj
dCBwYWdlICpwYWdlLAo+ICAKPiAgCW1hcCA9IHN3aW90bGJfdGJsX21hcF9zaW5nbGUoZGV2LCBz
dGFydF9kbWFfYWRkciwgcGh5cywgc2l6ZSwgZGlyLAo+ICAJCQkJICAgICBhdHRycyk7Cj4gLQlp
ZiAobWFwID09IERNQV9NQVBQSU5HX0VSUk9SKQo+ICsJaWYgKG1hcCA9PSAocGh5c19hZGRyX3Qp
RE1BX01BUFBJTkdfRVJST1IpCj4gIAkJcmV0dXJuIERNQV9NQVBQSU5HX0VSUk9SOwo+ICAKPiAg
CWRldl9hZGRyID0geGVuX3BoeXNfdG9fYnVzKG1hcCk7Cj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9k
bWEvc3dpb3RsYi5jIGIva2VybmVsL2RtYS9zd2lvdGxiLmMKPiBpbmRleCBlOTA2ZWYyZTYzMTUu
LmEzYmU2NTE5NzNhZCAxMDA2NDQKPiAtLS0gYS9rZXJuZWwvZG1hL3N3aW90bGIuYwo+ICsrKyBi
L2tlcm5lbC9kbWEvc3dpb3RsYi5jCj4gQEAgLTU0OCw3ICs1NDgsNyBAQCBwaHlzX2FkZHJfdCBz
d2lvdGxiX3RibF9tYXBfc2luZ2xlKHN0cnVjdCBkZXZpY2UgKmh3ZGV2LAo+ICAJaWYgKCEoYXR0
cnMgJiBETUFfQVRUUl9OT19XQVJOKSAmJiBwcmludGtfcmF0ZWxpbWl0KCkpCj4gIAkJZGV2X3dh
cm4oaHdkZXYsICJzd2lvdGxiIGJ1ZmZlciBpcyBmdWxsIChzejogJXpkIGJ5dGVzKSwgdG90YWwg
JWx1IChzbG90cyksIHVzZWQgJWx1IChzbG90cylcbiIsCj4gIAkJCSBzaXplLCBpb190bGJfbnNs
YWJzLCB0bXBfaW9fdGxiX3VzZWQpOwo+IC0JcmV0dXJuIERNQV9NQVBQSU5HX0VSUk9SOwo+ICsJ
cmV0dXJuIChwaHlzX2FkZHJfdClETUFfTUFQUElOR19FUlJPUjsKPiAgZm91bmQ6Cj4gIAlpb190
bGJfdXNlZCArPSBuc2xvdHM7Cj4gIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZpb190bGJfbG9j
aywgZmxhZ3MpOwo+IEBAIC02NjYsNyArNjY2LDcgQEAgYm9vbCBzd2lvdGxiX21hcChzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHBoeXNfYWRkcl90ICpwaHlzLCBkbWFfYWRkcl90ICpkbWFfYWRkciwKPiAg
CS8qIE9oIHdlbGwsIGhhdmUgdG8gYWxsb2NhdGUgYW5kIG1hcCBhIGJvdW5jZSBidWZmZXIuICov
Cj4gIAkqcGh5cyA9IHN3aW90bGJfdGJsX21hcF9zaW5nbGUoZGV2LCBfX3BoeXNfdG9fZG1hKGRl
diwgaW9fdGxiX3N0YXJ0KSwKPiAgCQkJKnBoeXMsIHNpemUsIGRpciwgYXR0cnMpOwo+IC0JaWYg
KCpwaHlzID09IERNQV9NQVBQSU5HX0VSUk9SKQo+ICsJaWYgKCpwaHlzID09IChwaHlzX2FkZHJf
dClETUFfTUFQUElOR19FUlJPUikKPiAgCQlyZXR1cm4gZmFsc2U7Cj4gIAo+ICAJLyogRW5zdXJl
IHRoYXQgdGhlIGFkZHJlc3MgcmV0dXJuZWQgaXMgRE1BJ2JsZSAqLwo+IC0tIAo+IDIuMjAuMAo+
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

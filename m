Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7CFD9755
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 18:28:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKm5M-0005o1-HM; Wed, 16 Oct 2019 16:23:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eWLc=YJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iKm5L-0005nw-55
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 16:23:39 +0000
X-Inumbo-ID: 4eec788a-f031-11e9-a531-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4eec788a-f031-11e9-a531-bc764e2007e4;
 Wed, 16 Oct 2019 16:23:38 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 554EF2168B;
 Wed, 16 Oct 2019 16:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571243017;
 bh=dW9C6lPgBn5vqKbyWnkFj3+FYlA7YnuVTsiVjamr2Us=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Gj4aevfu2w4Nj3JrPdDQ0lxfbNf/iBi4e8xo9+pxXGptxgZa84NEe/1xJ79hiWo+l
 K0HsHlRgKy+8weU4zFlYjLqvCRoD/+hS95D4K/Auoz5qDUzLUOBIUs2/XR3nBGH5fZ
 KKI5b33t5+5lmGX2JsdvCpYGmkvvzHp7uWamjpkY=
Date: Wed, 16 Oct 2019 09:23:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20191016111251.29214-1-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1910160923220.30080@sstabellini-ThinkPad-T480s>
References: <20191016111251.29214-1-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: setup: Calculate
 correctly the size of Xen
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxNiBPY3QgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBjdXJyZW50IHNp
emUgb2YgWGVuIGlzIGNvbXB1dGVkIHVzaW5nIF9lbmQgLSBfc3RhcnQgKyAxLiBIb3dldmVyLAo+
IF9lbmQgaXMgcG9pbnRpbmcgb25lIHBhc3QgdGhlIGVuZCBvZiBYZW4sIHNvIHRoZSBzaXplIG9m
IFhlbiBpcwo+IG9mZi1ieS1vbmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+CgoKPiAtLS0KPiAgeGVuL2FyY2gvYXJtL3NldHVwLmMgfCAy
ICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc2V0dXAuYyBiL3hlbi9hcmNoL2FybS9zZXR1cC5j
Cj4gaW5kZXggNzA1YTkxN2FiZi4uNTFkMzIxMDZiNyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9h
cm0vc2V0dXAuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCj4gQEAgLTgxOSw3ICs4MTks
NyBAQCB2b2lkIF9faW5pdCBzdGFydF94ZW4odW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0
LAo+ICAgICAgLyogUmVnaXN0ZXIgWGVuJ3MgbG9hZCBhZGRyZXNzIGFzIGEgYm9vdCBtb2R1bGUu
ICovCj4gICAgICB4ZW5fYm9vdG1vZHVsZSA9IGFkZF9ib290X21vZHVsZShCT09UTU9EX1hFTiwK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAocGFkZHJfdCkodWludHB0cl90KShfc3Rh
cnQgKyBib290X3BoeXNfb2Zmc2V0KSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAo
cGFkZHJfdCkodWludHB0cl90KShfZW5kIC0gX3N0YXJ0ICsgMSksIGZhbHNlKTsKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAocGFkZHJfdCkodWludHB0cl90KShfZW5kIC0gX3N0YXJ0
KSwgZmFsc2UpOwo+ICAgICAgQlVHX09OKCF4ZW5fYm9vdG1vZHVsZSk7Cj4gIAo+ICAgICAgZmR0
X3NpemUgPSBib290X2ZkdF9pbmZvKGRldmljZV90cmVlX2ZsYXR0ZW5lZCwgZmR0X3BhZGRyKTsK
PiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=

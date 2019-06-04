Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE1234F7D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 20:02:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYDiT-0003fR-Lb; Tue, 04 Jun 2019 17:59:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cmcs=UD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hYDiS-0003fH-8n
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 17:59:20 +0000
X-Inumbo-ID: 797d5f63-86f2-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 797d5f63-86f2-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 17:59:19 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E6632075B;
 Tue,  4 Jun 2019 17:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559671158;
 bh=p8u1vlGLWyDQOp9W1kTr3i18fshJKtSi2DwMnb5XfnQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=KlsBL0bQFK7npCeycjSa1MJVoqgs2tjvZxutGtgmHN55i6kDAW6KAm0pF1gOc+7It
 BvuBGeLjiI7hYmlKshRs9KDuUrOd/sDU7ZLffnuE4nAjIAi2JKvImNV8X6EkTsnPfo
 dagLBxHrU/T48XWwHE2rW7gp/Zg58e6FxWf8qDmM=
Date: Tue, 4 Jun 2019 10:59:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190514122456.28559-20-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906041055180.14041@sstabellini-ThinkPad-T480s>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-20-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 19/19] xen/arm: Pair call
 to set_fixmap with call to clear_fixmap in copy_from_paddr
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
IHNldF9maXhtYXAgbWF5IHJlcGxhY2UgYSB2YWxpZCBlbnRyeSB3aXRob3V0IGZvbGxvd2luZwo+
IHRoZSBicmVhay1iZWZvcmUtbWFrZSBzZXF1ZW5jZS4gVGhpcyBtYXkgcmVzdWx0IHRvIFRMQiBj
b25mbGljdCBhYm9ydC4KPiAKPiBSYXRoZXIgdGhhbiBkZWFsaW5nIHdpdGggQnJlYWstQmVmb3Jl
LU1ha2UgaW4gc2V0X2ZpeG1hcCwgZXZlcnkgY2FsbCB0bwo+IHNldF9maXhtYXAgaXMgcGFpcmVk
IHdpdGggYSBjYWxsIHRvIGNsZWFyX2ZpeG1hcC4KCkl0IGlzIG5vdCBldmVyeSBjYWxsIHRvIHNl
dF9maXhtYXA6IGl0IGlzIGV2ZXJ5IGNhbGwgdG8Kc2V0X2ZpeG1hcChGSVhNQVBfTUlTQywgLi4u
CgpQbGVhc2UgY2xhcmlmeSwgdGhlbiB5b3UgY2FuIGFkZAoKUmV2aWV3ZWQtYnk6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCgo+IFNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJpaSBB
bmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cj4KPiAtLS0KPiAgICAgQ2hhbmdlcyBpbiB2
MjoKPiAgICAgICAgIC0gQWRkIEFuZHJpaSdzIHJldmlld2VkLWJ5Cj4gLS0tCj4gIHhlbi9hcmNo
L2FybS9rZXJuZWwuYyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2tlcm5lbC5jIGIv
eGVuL2FyY2gvYXJtL2tlcm5lbC5jCj4gaW5kZXggZTNmZmRiMmZhMS4uMzg5YmVmMmFmYSAxMDA2
NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0va2VybmVsLmMKPiArKysgYi94ZW4vYXJjaC9hcm0va2Vy
bmVsLmMKPiBAQCAtNTgsMTMgKzU4LDEyIEBAIHZvaWQgX19pbml0IGNvcHlfZnJvbV9wYWRkcih2
b2lkICpkc3QsIHBhZGRyX3QgcGFkZHIsIHVuc2lnbmVkIGxvbmcgbGVuKQo+ICAgICAgICAgIHNl
dF9maXhtYXAoRklYTUFQX01JU0MsIG1hZGRyX3RvX21mbihwYWRkciksIFBBR0VfSFlQRVJWSVNP
Ul9XQyk7Cj4gICAgICAgICAgbWVtY3B5KGRzdCwgc3JjICsgcywgbCk7Cj4gICAgICAgICAgY2xl
YW5fZGNhY2hlX3ZhX3JhbmdlKGRzdCwgbCk7Cj4gKyAgICAgICAgY2xlYXJfZml4bWFwKEZJWE1B
UF9NSVNDKTsKPiAgCj4gICAgICAgICAgcGFkZHIgKz0gbDsKPiAgICAgICAgICBkc3QgKz0gbDsK
PiAgICAgICAgICBsZW4gLT0gbDsKPiAgICAgIH0KPiAtCj4gLSAgICBjbGVhcl9maXhtYXAoRklY
TUFQX01JU0MpOwo+ICB9Cj4gIAo+ICBzdGF0aWMgdm9pZCBfX2luaXQgcGxhY2VfbW9kdWxlcyhz
dHJ1Y3Qga2VybmVsX2luZm8gKmluZm8sCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

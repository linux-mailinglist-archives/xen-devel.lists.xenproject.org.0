Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F099CC64A
	for <lists+xen-devel@lfdr.de>; Sat,  5 Oct 2019 01:13:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGWhq-0002Wu-KC; Fri, 04 Oct 2019 23:09:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Z5s=X5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iGWho-0002W8-St
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 23:09:48 +0000
X-Inumbo-ID: 0f6e11ca-e6fc-11e9-80e3-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f6e11ca-e6fc-11e9-80e3-bc764e2007e4;
 Fri, 04 Oct 2019 23:09:48 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 16D3221D81;
 Fri,  4 Oct 2019 23:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570230587;
 bh=NTT9BZoNTyxmi2wjFfJZ8/AglDBPcv+c0SqXYG7zFUI=;
 h=Date:From:To:cc:Subject:From;
 b=y99pA7Y/rd53KA+AaXkAI002jx2Gmq8AFsElWUw4TK1J2xk+Se1HhvI2Tu6PnRuJI
 LGQ79845YcjoKS67RlIi5EHUtSu0+kBZnFrrU0h+O7gNl07Y3Lqnwx27CBfljVob1J
 AXS/G23t2nLUHXPQSwux5s+TqBHv9apyUK2UHO2Q=
Date: Fri, 4 Oct 2019 16:09:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
Message-ID: <alpine.DEB.2.21.1910041601170.30844@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13] xen/arm: fix duplicate memory node in
 DT
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
Cc: jgross@suse.com, oleksandr_tyshchenko@epam.com, sstabellini@kernel.org,
 julien@xen.org, Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiByZXNlcnZlZC1tZW1vcnkgcmVnaW9ucyBhcmUgcHJlc2VudCBpbiB0aGUgaG9zdCBkZXZp
Y2UgdHJlZSwgZG9tMAppcyBzdGFydGVkIHdpdGggbXVsdGlwbGUgbWVtb3J5IG5vZGVzLiBFYWNo
IG1lbW9yeSBub2RlIHNob3VsZCBoYXZlIGEKdW5pcXVlIG5hbWUsIGJ1dCB0b2RheSB0aGV5IGFy
ZSBhbGwgY2FsbGVkICJtZW1vcnkiIGxlYWRpbmcgdG8gTGludXgKcHJpbnRpbmcgdGhlIGZvbGxv
d2luZyB3YXJuaW5nIGF0IGJvb3Q6CgogIE9GOiBEdXBsaWNhdGUgbmFtZSBpbiBiYXNlLCByZW5h
bWVkIHRvICJtZW1vcnkjMSIKClRoaXMgcGF0Y2ggZml4ZXMgdGhlIHByb2JsZW0gYnkgYXBwZW5k
aW5nIGEgIkA8dW5pdC1hZGRyZXNzPiIgdG8gdGhlCm5hbWUsIGFzIHBlciB0aGUgRGV2aWNlIFRy
ZWUgc3BlY2lmaWNhdGlvbiwgd2hlcmUgPHVuaXQtYWRkcmVzcz4gbWF0Y2hlcwp0aGUgYmFzZSBv
ZiBhZGRyZXNzIG9mIHRoZSBmaXJzdCByZWdpb24uCgpSZXBvcnRlZC1ieTogT2xla3NhbmRyIFR5
c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgpTaWduZWQtb2ZmLWJ5OiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxpbnguY29tPgoKLS0tCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2Rv
bWFpbl9idWlsZC5jCmluZGV4IDkyMWIwNTQ1MjAuLmE0YzA3ZGIzODMgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL2FybS9kb21haW5fYnVpbGQuYworKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxk
LmMKQEAgLTY0NiwxNiArNjQ2LDIyIEBAIHN0YXRpYyBpbnQgX19pbml0IG1ha2VfbWVtb3J5X25v
ZGUoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwKICAgICBpbnQgcmVzLCBpOwogICAgIGludCByZWdf
c2l6ZSA9IGFkZHJjZWxscyArIHNpemVjZWxsczsKICAgICBpbnQgbnJfY2VsbHMgPSByZWdfc2l6
ZSAqIG1lbS0+bnJfYmFua3M7CisgICAgLyogUGxhY2Vob2xkZXIgZm9yIG1lbW9yeUAgKyBhIDMy
LWJpdCBudW1iZXIgKyBcMCAqLworICAgIGNoYXIgYnVmWzE4XTsKICAgICBfX2JlMzIgcmVnW05S
X01FTV9CQU5LUyAqIDQgLyogV29yc3QgY2FzZSBhZGRyY2VsbHMgKyBzaXplY2VsbHMgKi9dOwog
ICAgIF9fYmUzMiAqY2VsbHM7CiAKICAgICBCVUdfT04obnJfY2VsbHMgPj0gQVJSQVlfU0laRShy
ZWcpKTsKKyAgICAvKiBOb3RoaW5nIHRvIGRvICovCisgICAgaWYgKCBtZW0tPm5yX2JhbmtzID09
IDAgKQorICAgICAgICByZXR1cm4gMDsKIAogICAgIGR0X2RwcmludGsoIkNyZWF0ZSBtZW1vcnkg
bm9kZSAocmVnIHNpemUgJWQsIG5yIGNlbGxzICVkKVxuIiwKICAgICAgICAgICAgICAgIHJlZ19z
aXplLCBucl9jZWxscyk7CiAKICAgICAvKiBlUEFQUiAzLjQgKi8KLSAgICByZXMgPSBmZHRfYmVn
aW5fbm9kZShmZHQsICJtZW1vcnkiKTsKKyAgICBzbnByaW50ZihidWYsIHNpemVvZihidWYpLCAi
bWVtb3J5QCUiUFJJeDY0LCBtZW0tPmJhbmtbMF0uc3RhcnQpOworICAgIHJlcyA9IGZkdF9iZWdp
bl9ub2RlKGZkdCwgYnVmKTsKICAgICBpZiAoIHJlcyApCiAgICAgICAgIHJldHVybiByZXM7CiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

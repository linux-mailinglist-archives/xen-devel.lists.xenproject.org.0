Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE21DC905C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 20:03:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFivr-0005Hc-Sr; Wed, 02 Oct 2019 18:00:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2BXq=X3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFivq-0005HQ-4x
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 18:00:58 +0000
X-Inumbo-ID: 93b0929d-e53e-11e9-971c-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 93b0929d-e53e-11e9-971c-12813bfff9fa;
 Wed, 02 Oct 2019 18:00:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A25F15A1;
 Wed,  2 Oct 2019 11:00:54 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 613563F706;
 Wed,  2 Oct 2019 11:00:53 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  2 Oct 2019 19:00:43 +0100
Message-Id: <20191002180047.17144-3-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191002180047.17144-1-julien.grall@arm.com>
References: <20191002180047.17144-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH for-4.13 2/6] xen/arm64: bitops: Match the
 register size with the value size in flsl
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
Cc: Artem_Mygaiev@epam.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2xhbmcgaXMgcGlja2llciB0aGFuIEdDQyBmb3IgdGhlIHJlZ2lzdGVyIHNpemUgaW4gYXNtIHN0
YXRlbWVudC4gSXQgZXhwZWN0cwp0aGUgcmVnaXN0ZXIgc2l6ZSB0byBtYXRjaCB0aGUgdmFsdWUg
c2l6ZS4KClRoZSBpbnN0cnVjdGlvbiBjbHogaXMgZXhwZWN0aW5nIHRoZSB0d28gb3BlcmFuZHMg
dG8gYmUgdGhlIHNhbWUgc2l6ZQooaS5lIDMyLWJpdCBvciA2NC1iaXQpLiBBcyB0aGUgZmxzbCBm
dW5jdGlvbiBpcyBkZWFsaW5nIHdpdGggNjQtYml0CnZhbHVlLCB3ZSBuZWVkIHRvIG1ha2UgdGhl
IGRlc3RpbmF0aW9uIHZhcmlhYmxlIDY0LWJpdCBhcyB3ZWxsLgoKV2hpbGUgYXQgaXQsIGFkZCBh
IG5ld2xpbmUgYmVmb3JlIHRoZSByZXR1cm4gc3RhdGVtZW50LgoKTm90ZSB0aGF0IHRoZSByZXR1
cm4gdHlwZSBvZiBmbHNsIGlzIG5vdCB1cGRhdGVkIGJlY2F1c2UgdGhlIHJlc3VsdCB3aWxsCmFs
d2F5cyBiZSBzbWFsbGVyIHRoYW4gNjQgYW5kIHRoZXJlZm9yZSBmaXQgaW4gMzItYml0LgoKU2ln
bmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0tLQogICAg
Q2hhbmdlcyBpbiB2MjoKICAgICAgICAtIFVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gZXhw
bGFpbiB3aHkgdGhlIHJldHVybiB0eXBlIGlzCiAgICAgICAgbm90IG1vZGlmaWVkCi0tLQogeGVu
L2luY2x1ZGUvYXNtLWFybS9hcm02NC9iaXRvcHMuaCB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUv
YXNtLWFybS9hcm02NC9iaXRvcHMuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJtNjQvYml0b3Bz
LmgKaW5kZXggNmNjMjI0YWQxMy4uZDg1YTQ5YmNhNCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUv
YXNtLWFybS9hcm02NC9iaXRvcHMuaAorKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0L2Jp
dG9wcy5oCkBAIC0yNCwxMiArMjQsMTMgQEAgc3RhdGljIC8qX18qL2Fsd2F5c19pbmxpbmUgdW5z
aWduZWQgbG9uZyBfX2Zmcyh1bnNpZ25lZCBsb25nIHdvcmQpCiAKIHN0YXRpYyBpbmxpbmUgaW50
IGZsc2wodW5zaWduZWQgbG9uZyB4KQogewotICAgICAgICBpbnQgcmV0OworICAgICAgICB1aW50
NjRfdCByZXQ7CiAKICAgICAgICAgaWYgKF9fYnVpbHRpbl9jb25zdGFudF9wKHgpKQogICAgICAg
ICAgICAgICAgcmV0dXJuIGdlbmVyaWNfZmxzbCh4KTsKIAogICAgICAgICBhc20oImNselx0JTAs
ICUxIiA6ICI9ciIgKHJldCkgOiAiciIgKHgpKTsKKwogICAgICAgICByZXR1cm4gQklUU19QRVJf
TE9ORyAtIHJldDsKIH0KIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==

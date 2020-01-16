Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C1413E390
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 18:02:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is8VX-0006Wp-Lj; Thu, 16 Jan 2020 17:00:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rOD0=3F=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1is8VW-0006Wc-B9
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 17:00:34 +0000
X-Inumbo-ID: b51a2291-3881-11ea-8781-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b51a2291-3881-11ea-8781-12813bfff9fa;
 Thu, 16 Jan 2020 17:00:33 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5E9DB22525;
 Thu, 16 Jan 2020 17:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194033;
 bh=f/u8zFAjCNc6rmpGCQzhfg7rSXfsqqu01yrugzFPqnU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mhAK8F9zNRfWD3lqS9+U//x/26on7daYc7kU3/vfSUu6fqkOawI1gmiZZ+akS4Fzd
 F0Fjcio953FuUZi5Vw0yQ2zYhVLN05UL3egu2swPm7z3EBeGS+cUCVJAe2rl24T/XA
 R0pSOIn4/KHwHn3Nnrg/xZsKUPVP1zcDE/lnuI94=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 16 Jan 2020 11:51:01 -0500
Message-Id: <20200116165940.10720-35-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116165940.10720-1-sashal@kernel.org>
References: <20200116165940.10720-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [Xen-devel] [PATCH AUTOSEL 4.19 152/671] drm/xen-front: Fix mmap
 attributes for display buffers
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
Cc: Sasha Levin <sashal@kernel.org>, xen-devel@lists.xenproject.org,
 Julien Grall <julien.grall@arm.com>, dri-devel@lists.freedesktop.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPgoKWyBVcHN0cmVhbSBjb21taXQgMjRkZWQyOTJhNWMyZWQ0NzZmMDFjNzdmZWU2NWY4
MzIwNTUyY2QyNyBdCgpXaGVuIEdFTSBiYWNraW5nIHN0b3JhZ2UgaXMgYWxsb2NhdGVkIHRob3Nl
IGFyZSBub3JtYWwgcGFnZXMsCnNvIHRoZXJlIGlzIG5vIHBvaW50IHVzaW5nIHBncHJvdF93cml0
ZWNvbWJpbmUgd2hpbGUgbW1hcGluZy4KVGhpcyBmaXhlcyBtaXNtYXRjaCBvZiBidWZmZXIgcGFn
ZXMnIG1lbW9yeSBhdHRyaWJ1dGVzIGJldHdlZW4KdGhlIGZyb250ZW5kIGFuZCBiYWNrZW5kIHdo
aWNoIG1heSBjYXVzZSBzY3JlZW4gYXJ0aWZhY3RzLgoKRml4ZXM6IGM1NzViN2VlYjg5ZiAoImRy
bS94ZW4tZnJvbnQ6IEFkZCBzdXBwb3J0IGZvciBYZW4gUFYgZGlzcGxheSBmcm9udGVuZCIpCgpT
aWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hj
aGVua29AZXBhbS5jb20+ClN1Z2dlc3RlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4KQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ckxp
bms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDEy
OTE1MDQyMi4xOTg2Ny0xLWFuZHIyMDAwQGdtYWlsLmNvbQpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBM
ZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJt
X2Zyb250X2dlbS5jIHwgMTMgKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
bi94ZW5fZHJtX2Zyb250X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250
X2dlbS5jCmluZGV4IGM4NWJmZTc1NzFjYi4uODAyNjYyODM5ZTdlIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlbi94ZW5fZHJtX2Zyb250X2dlbS5jCkBAIC0yMzYsOCArMjM2LDE0IEBAIHN0YXRpYyBpbnQg
Z2VtX21tYXBfb2JqKHN0cnVjdCB4ZW5fZ2VtX29iamVjdCAqeGVuX29iaiwKIAl2bWEtPnZtX2Zs
YWdzICY9IH5WTV9QRk5NQVA7CiAJdm1hLT52bV9mbGFncyB8PSBWTV9NSVhFRE1BUDsKIAl2bWEt
PnZtX3Bnb2ZmID0gMDsKLQl2bWEtPnZtX3BhZ2VfcHJvdCA9Ci0JCQlwZ3Byb3Rfd3JpdGVjb21i
aW5lKHZtX2dldF9wYWdlX3Byb3Qodm1hLT52bV9mbGFncykpOworCS8qCisJICogQWNjb3JkaW5n
IHRvIFhlbiBvbiBBUk0gQUJJICh4ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaCk6CisJICog
YWxsIG1lbW9yeSB3aGljaCBpcyBzaGFyZWQgd2l0aCBvdGhlciBlbnRpdGllcyBpbiB0aGUgc3lz
dGVtCisJICogKGluY2x1ZGluZyB0aGUgaHlwZXJ2aXNvciBhbmQgb3RoZXIgZ3Vlc3RzKSBtdXN0
IHJlc2lkZSBpbiBtZW1vcnkKKwkgKiB3aGljaCBpcyBtYXBwZWQgYXMgTm9ybWFsIElubmVyIFdy
aXRlLUJhY2sgT3V0ZXIgV3JpdGUtQmFjaworCSAqIElubmVyLVNoYXJlYWJsZS4KKwkgKi8KKwl2
bWEtPnZtX3BhZ2VfcHJvdCA9IHZtX2dldF9wYWdlX3Byb3Qodm1hLT52bV9mbGFncyk7CiAKIAkv
KgogCSAqIHZtX29wZXJhdGlvbnNfc3RydWN0LmZhdWx0IGhhbmRsZXIgd2lsbCBiZSBjYWxsZWQg
aWYgQ1BVIGFjY2VzcwpAQCAtMjgzLDggKzI4OSw5IEBAIHZvaWQgKnhlbl9kcm1fZnJvbnRfZ2Vt
X3ByaW1lX3ZtYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpnZW1fb2JqKQogCWlmICgheGVuX29i
ai0+cGFnZXMpCiAJCXJldHVybiBOVUxMOwogCisJLyogUGxlYXNlIHNlZSBjb21tZW50IGluIGdl
bV9tbWFwX29iaiBvbiBtYXBwaW5nIGFuZCBhdHRyaWJ1dGVzLiAqLwogCXJldHVybiB2bWFwKHhl
bl9vYmotPnBhZ2VzLCB4ZW5fb2JqLT5udW1fcGFnZXMsCi0JCSAgICBWTV9NQVAsIHBncHJvdF93
cml0ZWNvbWJpbmUoUEFHRV9LRVJORUwpKTsKKwkJICAgIFZNX01BUCwgUEFHRV9LRVJORUwpOwog
fQogCiB2b2lkIHhlbl9kcm1fZnJvbnRfZ2VtX3ByaW1lX3Z1bm1hcChzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKmdlbV9vYmosCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

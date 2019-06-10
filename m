Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 616BF3AE8F
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 07:12:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haCXT-0005VG-0n; Mon, 10 Jun 2019 05:08:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y1/0=UJ=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1haCXS-0005VB-4P
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 05:08:10 +0000
X-Inumbo-ID: b962caf4-8b3d-11e9-8980-bc764e045a96
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b962caf4-8b3d-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 05:08:07 +0000 (UTC)
Received: from localhost.localdomain (61.161.186.150) by
 mxnavi-mail.mxnavi.com (116.90.87.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Mon, 10 Jun 2019 13:04:53 +0800
From: Baodong Chen <chenbaodong@mxnavi.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 10 Jun 2019 13:07:54 +0800
Message-ID: <1560143274-10547-1-git-send-email-chenbaodong@mxnavi.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: [Xen-devel] [PATCH] xen/arm: vtimer: fix return value to void for
 virt_timer_[save|restore]
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
Cc: Baodong Chen <chenbaodong@mxnavi.com>, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG9yaWdpbmFsIHR5cGUgaXMgaW50IGFuZCBub3QgdXNlZCBhdCBhbGwgc28gZml4IHRvIHZv
aWQuCgpTaWduZWQtb2ZmLWJ5OiBCYW9kb25nIENoZW4gPGNoZW5iYW9kb25nQG14bmF2aS5jb20+
Ci0tLQogeGVuL2FyY2gvYXJtL3Z0aW1lci5jICAgICAgICB8IDYgKystLS0tCiB4ZW4vaW5jbHVk
ZS9hc20tYXJtL3Z0aW1lci5oIHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdnRpbWVyLmMg
Yi94ZW4vYXJjaC9hcm0vdnRpbWVyLmMKaW5kZXggYzk5ZGQyMy4uZTZhZWJkYSAxMDA2NDQKLS0t
IGEveGVuL2FyY2gvYXJtL3Z0aW1lci5jCisrKyBiL3hlbi9hcmNoL2FybS92dGltZXIuYwpAQCAt
MTM2LDcgKzEzNiw3IEBAIHZvaWQgdmNwdV90aW1lcl9kZXN0cm95KHN0cnVjdCB2Y3B1ICp2KQog
ICAgIGtpbGxfdGltZXIoJnYtPmFyY2gucGh5c190aW1lci50aW1lcik7CiB9CiAKLWludCB2aXJ0
X3RpbWVyX3NhdmUoc3RydWN0IHZjcHUgKnYpCit2b2lkIHZpcnRfdGltZXJfc2F2ZShzdHJ1Y3Qg
dmNwdSAqdikKIHsKICAgICBBU1NFUlQoIWlzX2lkbGVfdmNwdSh2KSk7CiAKQEAgLTE0OSwxMCAr
MTQ5LDkgQEAgaW50IHZpcnRfdGltZXJfc2F2ZShzdHJ1Y3QgdmNwdSAqdikKICAgICAgICAgc2V0
X3RpbWVyKCZ2LT5hcmNoLnZpcnRfdGltZXIudGltZXIsIHRpY2tzX3RvX25zKHYtPmFyY2gudmly
dF90aW1lci5jdmFsICsKICAgICAgICAgICAgICAgICAgIHYtPmRvbWFpbi0+YXJjaC52aXJ0X3Rp
bWVyX2Jhc2Uub2Zmc2V0IC0gYm9vdF9jb3VudCkpOwogICAgIH0KLSAgICByZXR1cm4gMDsKIH0K
IAotaW50IHZpcnRfdGltZXJfcmVzdG9yZShzdHJ1Y3QgdmNwdSAqdikKK3ZvaWQgdmlydF90aW1l
cl9yZXN0b3JlKHN0cnVjdCB2Y3B1ICp2KQogewogICAgIEFTU0VSVCghaXNfaWRsZV92Y3B1KHYp
KTsKIApAQCAtMTYzLDcgKzE2Miw2IEBAIGludCB2aXJ0X3RpbWVyX3Jlc3RvcmUoc3RydWN0IHZj
cHUgKnYpCiAgICAgV1JJVEVfU1lTUkVHNjQodi0+ZG9tYWluLT5hcmNoLnZpcnRfdGltZXJfYmFz
ZS5vZmZzZXQsIENOVFZPRkZfRUwyKTsKICAgICBXUklURV9TWVNSRUc2NCh2LT5hcmNoLnZpcnRf
dGltZXIuY3ZhbCwgQ05UVl9DVkFMX0VMMCk7CiAgICAgV1JJVEVfU1lTUkVHMzIodi0+YXJjaC52
aXJ0X3RpbWVyLmN0bCwgQ05UVl9DVExfRUwwKTsKLSAgICByZXR1cm4gMDsKIH0KIAogc3RhdGlj
IGJvb2wgdnRpbWVyX2NudHBfY3RsKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCB1aW50MzJf
dCAqciwgYm9vbCByZWFkKQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS92dGltZXIu
aCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vdnRpbWVyLmgKaW5kZXggOTFkODhiMy4uOWQ0ZmI0YyAx
MDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS92dGltZXIuaAorKysgYi94ZW4vaW5jbHVk
ZS9hc20tYXJtL3Z0aW1lci5oCkBAIC0yNCw4ICsyNCw4IEBAIGV4dGVybiBpbnQgZG9tYWluX3Z0
aW1lcl9pbml0KHN0cnVjdCBkb21haW4gKmQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgeGVuX2FyY2hfZG9tYWluY29uZmlnICpjb25maWcpOwogZXh0ZXJuIGludCB2Y3B1
X3Z0aW1lcl9pbml0KHN0cnVjdCB2Y3B1ICp2KTsKIGV4dGVybiBib29sIHZ0aW1lcl9lbXVsYXRl
KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCB1bmlvbiBoc3IgaHNyKTsKLWV4dGVybiBpbnQg
dmlydF90aW1lcl9zYXZlKHN0cnVjdCB2Y3B1ICp2KTsKLWV4dGVybiBpbnQgdmlydF90aW1lcl9y
ZXN0b3JlKHN0cnVjdCB2Y3B1ICp2KTsKK2V4dGVybiB2b2lkIHZpcnRfdGltZXJfc2F2ZShzdHJ1
Y3QgdmNwdSAqdik7CitleHRlcm4gdm9pZCB2aXJ0X3RpbWVyX3Jlc3RvcmUoc3RydWN0IHZjcHUg
KnYpOwogZXh0ZXJuIHZvaWQgdmNwdV90aW1lcl9kZXN0cm95KHN0cnVjdCB2Y3B1ICp2KTsKIHZv
aWQgdnRpbWVyX3VwZGF0ZV9pcnFzKHN0cnVjdCB2Y3B1ICp2KTsKIAotLSAKMi43LjQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

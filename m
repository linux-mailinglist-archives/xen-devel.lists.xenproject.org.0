Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 847FF6C985
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 08:55:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho0HH-0003iG-27; Thu, 18 Jul 2019 06:52:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6kuv=VP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ho0HF-0003i7-Ai
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 06:52:29 +0000
X-Inumbo-ID: 9ac8f834-a928-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9ac8f834-a928-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 06:52:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E1D4BAE47;
 Thu, 18 Jul 2019 06:52:26 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Date: Thu, 18 Jul 2019 08:52:22 +0200
Message-Id: <20190718065222.31310-3-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190718065222.31310-1-jgross@suse.com>
References: <20190718065222.31310-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 2/2] xen/gntdev: switch from kcalloc() to
 kvcalloc()
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
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2l0aCBzdWZmaWNpZW50IG1hbnkgcGFnZXMgdG8gbWFwIGdudGRldiBjYW4gcmVhY2ggb3JkZXIg
OSBhbGxvY2F0aW9uCnNpemVzLiBBcyB0aGVyZSBpcyBubyBuZWVkIHRvIGhhdmUgcGh5c2ljYWxs
eSBjb250aWd1b3VzIGJ1ZmZlcnMgc3dpdGNoCnRvIGt2Y2FsbG9jKCkgaW4gb3JkZXIgdG8gYXZv
aWQgZmFpbGluZyBhbGxvY2F0aW9ucy4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9nbnRkZXYuYyB8IDMwICsrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDE1
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2dudGRldi5jIGIvZHJpdmVy
cy94ZW4vZ250ZGV2LmMKaW5kZXggMjNlMjFhOWFlZGY3Li45NjFhYTc3ODMxMmIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMveGVuL2dudGRldi5jCisrKyBiL2RyaXZlcnMveGVuL2dudGRldi5jCkBAIC0x
MTUsMTQgKzExNSwxNCBAQCBzdGF0aWMgdm9pZCBnbnRkZXZfZnJlZV9tYXAoc3RydWN0IGdudGRl
dl9ncmFudF9tYXAgKm1hcCkKIAkJZ250dGFiX2ZyZWVfcGFnZXMobWFwLT5jb3VudCwgbWFwLT5w
YWdlcyk7CiAKICNpZmRlZiBDT05GSUdfWEVOX0dSQU5UX0RNQV9BTExPQwotCWtmcmVlKG1hcC0+
ZnJhbWVzKTsKKwlrdmZyZWUobWFwLT5mcmFtZXMpOwogI2VuZGlmCi0Ja2ZyZWUobWFwLT5wYWdl
cyk7Ci0Ja2ZyZWUobWFwLT5ncmFudHMpOwotCWtmcmVlKG1hcC0+bWFwX29wcyk7Ci0Ja2ZyZWUo
bWFwLT51bm1hcF9vcHMpOwotCWtmcmVlKG1hcC0+a21hcF9vcHMpOwotCWtmcmVlKG1hcC0+a3Vu
bWFwX29wcyk7CisJa3ZmcmVlKG1hcC0+cGFnZXMpOworCWt2ZnJlZShtYXAtPmdyYW50cyk7CisJ
a3ZmcmVlKG1hcC0+bWFwX29wcyk7CisJa3ZmcmVlKG1hcC0+dW5tYXBfb3BzKTsKKwlrdmZyZWUo
bWFwLT5rbWFwX29wcyk7CisJa3ZmcmVlKG1hcC0+a3VubWFwX29wcyk7CiAJa2ZyZWUobWFwKTsK
IH0KIApAQCAtMTM2LDEyICsxMzYsMTIgQEAgc3RydWN0IGdudGRldl9ncmFudF9tYXAgKmdudGRl
dl9hbGxvY19tYXAoc3RydWN0IGdudGRldl9wcml2ICpwcml2LCBpbnQgY291bnQsCiAJaWYgKE5V
TEwgPT0gYWRkKQogCQlyZXR1cm4gTlVMTDsKIAotCWFkZC0+Z3JhbnRzICAgID0ga2NhbGxvYyhj
b3VudCwgc2l6ZW9mKGFkZC0+Z3JhbnRzWzBdKSwgR0ZQX0tFUk5FTCk7Ci0JYWRkLT5tYXBfb3Bz
ICAgPSBrY2FsbG9jKGNvdW50LCBzaXplb2YoYWRkLT5tYXBfb3BzWzBdKSwgR0ZQX0tFUk5FTCk7
Ci0JYWRkLT51bm1hcF9vcHMgPSBrY2FsbG9jKGNvdW50LCBzaXplb2YoYWRkLT51bm1hcF9vcHNb
MF0pLCBHRlBfS0VSTkVMKTsKLQlhZGQtPmttYXBfb3BzICA9IGtjYWxsb2MoY291bnQsIHNpemVv
ZihhZGQtPmttYXBfb3BzWzBdKSwgR0ZQX0tFUk5FTCk7Ci0JYWRkLT5rdW5tYXBfb3BzID0ga2Nh
bGxvYyhjb3VudCwgc2l6ZW9mKGFkZC0+a3VubWFwX29wc1swXSksIEdGUF9LRVJORUwpOwotCWFk
ZC0+cGFnZXMgICAgID0ga2NhbGxvYyhjb3VudCwgc2l6ZW9mKGFkZC0+cGFnZXNbMF0pLCBHRlBf
S0VSTkVMKTsKKwlhZGQtPmdyYW50cyAgICA9IGt2Y2FsbG9jKGNvdW50LCBzaXplb2YoYWRkLT5n
cmFudHNbMF0pLCBHRlBfS0VSTkVMKTsKKwlhZGQtPm1hcF9vcHMgICA9IGt2Y2FsbG9jKGNvdW50
LCBzaXplb2YoYWRkLT5tYXBfb3BzWzBdKSwgR0ZQX0tFUk5FTCk7CisJYWRkLT51bm1hcF9vcHMg
PSBrdmNhbGxvYyhjb3VudCwgc2l6ZW9mKGFkZC0+dW5tYXBfb3BzWzBdKSwgR0ZQX0tFUk5FTCk7
CisJYWRkLT5rbWFwX29wcyAgPSBrdmNhbGxvYyhjb3VudCwgc2l6ZW9mKGFkZC0+a21hcF9vcHNb
MF0pLCBHRlBfS0VSTkVMKTsKKwlhZGQtPmt1bm1hcF9vcHMgPSBrdmNhbGxvYyhjb3VudCwgc2l6
ZW9mKGFkZC0+a3VubWFwX29wc1swXSksIEdGUF9LRVJORUwpOworCWFkZC0+cGFnZXMgICAgID0g
a3ZjYWxsb2MoY291bnQsIHNpemVvZihhZGQtPnBhZ2VzWzBdKSwgR0ZQX0tFUk5FTCk7CiAJaWYg
KE5VTEwgPT0gYWRkLT5ncmFudHMgICAgfHwKIAkgICAgTlVMTCA9PSBhZGQtPm1hcF9vcHMgICB8
fAogCSAgICBOVUxMID09IGFkZC0+dW5tYXBfb3BzIHx8CkBAIC0xNjAsOCArMTYwLDggQEAgc3Ry
dWN0IGdudGRldl9ncmFudF9tYXAgKmdudGRldl9hbGxvY19tYXAoc3RydWN0IGdudGRldl9wcml2
ICpwcml2LCBpbnQgY291bnQsCiAJaWYgKGRtYV9mbGFncyAmIChHTlRERVZfRE1BX0ZMQUdfV0Mg
fCBHTlRERVZfRE1BX0ZMQUdfQ09IRVJFTlQpKSB7CiAJCXN0cnVjdCBnbnR0YWJfZG1hX2FsbG9j
X2FyZ3MgYXJnczsKIAotCQlhZGQtPmZyYW1lcyA9IGtjYWxsb2MoY291bnQsIHNpemVvZihhZGQt
PmZyYW1lc1swXSksCi0JCQkJICAgICAgR0ZQX0tFUk5FTCk7CisJCWFkZC0+ZnJhbWVzID0ga3Zj
YWxsb2MoY291bnQsIHNpemVvZihhZGQtPmZyYW1lc1swXSksCisJCQkJICAgICAgIEdGUF9LRVJO
RUwpOwogCQlpZiAoIWFkZC0+ZnJhbWVzKQogCQkJZ290byBlcnI7CiAKLS0gCjIuMTYuNAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

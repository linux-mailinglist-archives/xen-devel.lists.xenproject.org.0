Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E15EDF2D3C
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 12:17:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSflY-0001Vp-1M; Thu, 07 Nov 2019 11:15:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GKzt=Y7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iSflW-0001Vk-NC
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 11:15:50 +0000
X-Inumbo-ID: f3ccbdea-014f-11ea-a1c1-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3ccbdea-014f-11ea-a1c1-12813bfff9fa;
 Thu, 07 Nov 2019 11:15:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BEBBDB3EB;
 Thu,  7 Nov 2019 11:15:48 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Date: Thu,  7 Nov 2019 12:15:46 +0100
Message-Id: <20191107111546.26579-3-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191107111546.26579-1-jgross@suse.com>
References: <20191107111546.26579-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 2/2] xen/gntdev: switch from kcalloc() to
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
cm9zc0BzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVr
c2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9nbnRkZXYuYyB8
IDMxICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBp
bnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9n
bnRkZXYuYyBiL2RyaXZlcnMveGVuL2dudGRldi5jCmluZGV4IDA1NzhkMzY5ZTUzNy4uZjFiYzBk
MjY5ZTEyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9nbnRkZXYuYworKysgYi9kcml2ZXJzL3hl
bi9nbnRkZXYuYwpAQCAtMTEzLDE0ICsxMTMsMTQgQEAgc3RhdGljIHZvaWQgZ250ZGV2X2ZyZWVf
bWFwKHN0cnVjdCBnbnRkZXZfZ3JhbnRfbWFwICptYXApCiAJCWdudHRhYl9mcmVlX3BhZ2VzKG1h
cC0+Y291bnQsIG1hcC0+cGFnZXMpOwogCiAjaWZkZWYgQ09ORklHX1hFTl9HUkFOVF9ETUFfQUxM
T0MKLQlrZnJlZShtYXAtPmZyYW1lcyk7CisJa3ZmcmVlKG1hcC0+ZnJhbWVzKTsKICNlbmRpZgot
CWtmcmVlKG1hcC0+cGFnZXMpOwotCWtmcmVlKG1hcC0+Z3JhbnRzKTsKLQlrZnJlZShtYXAtPm1h
cF9vcHMpOwotCWtmcmVlKG1hcC0+dW5tYXBfb3BzKTsKLQlrZnJlZShtYXAtPmttYXBfb3BzKTsK
LQlrZnJlZShtYXAtPmt1bm1hcF9vcHMpOworCWt2ZnJlZShtYXAtPnBhZ2VzKTsKKwlrdmZyZWUo
bWFwLT5ncmFudHMpOworCWt2ZnJlZShtYXAtPm1hcF9vcHMpOworCWt2ZnJlZShtYXAtPnVubWFw
X29wcyk7CisJa3ZmcmVlKG1hcC0+a21hcF9vcHMpOworCWt2ZnJlZShtYXAtPmt1bm1hcF9vcHMp
OwogCWtmcmVlKG1hcCk7CiB9CiAKQEAgLTEzNCwxMiArMTM0LDEzIEBAIHN0cnVjdCBnbnRkZXZf
Z3JhbnRfbWFwICpnbnRkZXZfYWxsb2NfbWFwKHN0cnVjdCBnbnRkZXZfcHJpdiAqcHJpdiwgaW50
IGNvdW50LAogCWlmIChOVUxMID09IGFkZCkKIAkJcmV0dXJuIE5VTEw7CiAKLQlhZGQtPmdyYW50
cyAgICA9IGtjYWxsb2MoY291bnQsIHNpemVvZihhZGQtPmdyYW50c1swXSksIEdGUF9LRVJORUwp
OwotCWFkZC0+bWFwX29wcyAgID0ga2NhbGxvYyhjb3VudCwgc2l6ZW9mKGFkZC0+bWFwX29wc1sw
XSksIEdGUF9LRVJORUwpOwotCWFkZC0+dW5tYXBfb3BzID0ga2NhbGxvYyhjb3VudCwgc2l6ZW9m
KGFkZC0+dW5tYXBfb3BzWzBdKSwgR0ZQX0tFUk5FTCk7Ci0JYWRkLT5rbWFwX29wcyAgPSBrY2Fs
bG9jKGNvdW50LCBzaXplb2YoYWRkLT5rbWFwX29wc1swXSksIEdGUF9LRVJORUwpOwotCWFkZC0+
a3VubWFwX29wcyA9IGtjYWxsb2MoY291bnQsIHNpemVvZihhZGQtPmt1bm1hcF9vcHNbMF0pLCBH
RlBfS0VSTkVMKTsKLQlhZGQtPnBhZ2VzICAgICA9IGtjYWxsb2MoY291bnQsIHNpemVvZihhZGQt
PnBhZ2VzWzBdKSwgR0ZQX0tFUk5FTCk7CisJYWRkLT5ncmFudHMgICAgPSBrdmNhbGxvYyhjb3Vu
dCwgc2l6ZW9mKGFkZC0+Z3JhbnRzWzBdKSwgR0ZQX0tFUk5FTCk7CisJYWRkLT5tYXBfb3BzICAg
PSBrdmNhbGxvYyhjb3VudCwgc2l6ZW9mKGFkZC0+bWFwX29wc1swXSksIEdGUF9LRVJORUwpOwor
CWFkZC0+dW5tYXBfb3BzID0ga3ZjYWxsb2MoY291bnQsIHNpemVvZihhZGQtPnVubWFwX29wc1sw
XSksIEdGUF9LRVJORUwpOworCWFkZC0+a21hcF9vcHMgID0ga3ZjYWxsb2MoY291bnQsIHNpemVv
ZihhZGQtPmttYXBfb3BzWzBdKSwgR0ZQX0tFUk5FTCk7CisJYWRkLT5rdW5tYXBfb3BzID0ga3Zj
YWxsb2MoY291bnQsCisJCQkJICAgc2l6ZW9mKGFkZC0+a3VubWFwX29wc1swXSksIEdGUF9LRVJO
RUwpOworCWFkZC0+cGFnZXMgICAgID0ga3ZjYWxsb2MoY291bnQsIHNpemVvZihhZGQtPnBhZ2Vz
WzBdKSwgR0ZQX0tFUk5FTCk7CiAJaWYgKE5VTEwgPT0gYWRkLT5ncmFudHMgICAgfHwKIAkgICAg
TlVMTCA9PSBhZGQtPm1hcF9vcHMgICB8fAogCSAgICBOVUxMID09IGFkZC0+dW5tYXBfb3BzIHx8
CkBAIC0xNTgsOCArMTU5LDggQEAgc3RydWN0IGdudGRldl9ncmFudF9tYXAgKmdudGRldl9hbGxv
Y19tYXAoc3RydWN0IGdudGRldl9wcml2ICpwcml2LCBpbnQgY291bnQsCiAJaWYgKGRtYV9mbGFn
cyAmIChHTlRERVZfRE1BX0ZMQUdfV0MgfCBHTlRERVZfRE1BX0ZMQUdfQ09IRVJFTlQpKSB7CiAJ
CXN0cnVjdCBnbnR0YWJfZG1hX2FsbG9jX2FyZ3MgYXJnczsKIAotCQlhZGQtPmZyYW1lcyA9IGtj
YWxsb2MoY291bnQsIHNpemVvZihhZGQtPmZyYW1lc1swXSksCi0JCQkJICAgICAgR0ZQX0tFUk5F
TCk7CisJCWFkZC0+ZnJhbWVzID0ga3ZjYWxsb2MoY291bnQsIHNpemVvZihhZGQtPmZyYW1lc1sw
XSksCisJCQkJICAgICAgIEdGUF9LRVJORUwpOwogCQlpZiAoIWFkZC0+ZnJhbWVzKQogCQkJZ290
byBlcnI7CiAKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=

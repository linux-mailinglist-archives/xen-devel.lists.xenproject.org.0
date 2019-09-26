Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D35A8BF964
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 20:42:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDYep-0002PQ-Cp; Thu, 26 Sep 2019 18:38:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOM6=XV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDYen-0002PG-QK
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 18:38:25 +0000
X-Inumbo-ID: ce82bf0a-e08c-11e9-97fb-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id ce82bf0a-e08c-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 18:38:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E9AB15A2;
 Thu, 26 Sep 2019 11:38:17 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8727F3F67D;
 Thu, 26 Sep 2019 11:38:16 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 26 Sep 2019 19:38:02 +0100
Message-Id: <20190926183808.11630-5-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190926183808.11630-1-julien.grall@arm.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH RFC for-4.13 04/10] xen/arm: Ensure the SSBD
 workaround is re-enabled right after exiting a guest
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
Cc: Andrii Anisov <andrii_anisov@epam.com>, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, andrii.anisov@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgdGhlIG1vbWVudCwgU1NCRCB3b3JrYXJvdW5kIGlzIHJlLWVuYWJsZWQgZm9yIFhlbiBhZnRl
ciBpbnRlcnJ1cHRzCmFyZSB1bm1hc2tlZC4gVGhpcyBtZWFucyB3ZSBtYXkgZW5kIHVwIHRvIGV4
ZWN1dGUgc29tZSBwYXJ0IG9mIHRoZQpoeXBlcnZpc29yIGlmIGFuIGludGVycnVwdCBpcyByZWNl
aXZlZCBiZWZvcmUgdGhlIHdvcmthcm91bmQgaXMKcmUtZW5hYmxlZC4KCkFzIHRoZSByZXN0IG9m
IGVudGVyX2h5cGVydmlzb3JfZnJvbV9ndWVzdCgpIGRvZXMgbm90IHJlcXVpcmUgdG8gaGF2ZQpp
bnRlcnJ1cHRzIG1hc2tlZCwgdGhlIGZ1bmN0aW9uIGlzIG5vdyBzcGxpdCBpbiB0d28gcGFydHM6
CiAgICAxKSBlbnRlcl9oeXBlcnZpc29yX2Zyb21fZ3Vlc3Rfbm9pcnEoKSBjYWxsZWQgd2l0aCBp
bnRlcnJ1cHRzCiAgICAgICBtYXNrZWQuCiAgICAyKSBlbnRlcl9oeXBlcnZpc29yX2Zyb21fZ3Vl
c3QoKSBjYWxsZWQgd2l0aCBpbnRlcnJ1cHRzIHVubWFza2VkLgoKTm90ZSB0aGF0IHdoaWxlIGVu
dGVyX2h5cGVydmlzb3JfZnJvbV9ndWVzdF9ub2lycSgpIGRvZXMgbm90IHVzZSB0aGUKb24tc3Rh
Y2sgY29udGV4dCByZWdpc3RlcnMsIGl0IGlzIHN0aWxsIHBhc3NlZCBhcyBwYXJhbWV0ZXIgdG8g
bWF0Y2ggdGhlCnJlc3Qgb2YgdGhlIEMgZnVuY3Rpb25zIGNhbGxlZCBmcm9tIHRoZSBlbnRyeSBw
YXRoLgoKRml4ZXM6IGE3ODk4ZTRjNTkgKCJ4ZW4vYXJtOiBBZGQgQVJDSF9XT1JLQVJPVU5EXzIg
c3VwcG9ydCBmb3IgZ3Vlc3RzIikKUmVwb3J0ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9h
bmlzb3ZAZXBhbS5jb20+ClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+CgotLS0KCk5vdGUgdGhlIEFybTMyIGNvZGUgaGFzIG5vdCBiZWVuIGNoYW5nZWQg
eWV0LiBJIGFtIGFsc28gb3BlbiBvbiB0dXJuCmJvdGggZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1
ZXN0X25vaXJxKCkgYW5kIGVudGVyX2h5cGVydmlzb3JfZnJvbSgpCnRvIGZ1bmN0aW9ucyBub3Qg
dGFraW5nIGFueSBwYXJhbWV0ZXJzLgotLS0KIHhlbi9hcmNoL2FybS9hcm02NC9lbnRyeS5TIHwg
IDIgKysKIHhlbi9hcmNoL2FybS90cmFwcy5jICAgICAgIHwgMTYgKysrKysrKysrKysrKy0tLQog
MiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9lbnRyeS5TIGIveGVuL2FyY2gvYXJtL2FybTY0L2Vu
dHJ5LlMKaW5kZXggOWVhZmFlNTE2Yi4uNDU4ZDEyZjE4OCAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
YXJtL2FybTY0L2VudHJ5LlMKKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMKQEAgLTE3
Myw2ICsxNzMsOCBAQAogICAgICAgICBBTFRFUk5BVElWRSgiYmwgY2hlY2tfcGVuZGluZ192c2Vy
cm9yOyBjYm56IHgwLCAxZiIsCiAgICAgICAgICAgICAgICAgICAgICJub3A7IG5vcCIsCiAgICAg
ICAgICAgICAgICAgICAgIFNLSVBfU1lOQ0hST05JWkVfU0VSUk9SX0VOVFJZX0VYSVQpCisgICAg
ICAgIG1vdiAgICAgeDAsIHNwCisgICAgICAgIGJsICAgICAgZW50ZXJfaHlwZXJ2aXNvcl9mcm9t
X2d1ZXN0X25vaXJxCiAgICAgICAgIG1zciAgICAgZGFpZmNsciwgXGlmbGFncwogICAgICAgICBt
b3YgICAgIHgwLCBzcAogICAgICAgICBibCAgICAgIGVudGVyX2h5cGVydmlzb3JfZnJvbV9ndWVz
dApkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RyYXBzLmMgYi94ZW4vYXJjaC9hcm0vdHJhcHMu
YwppbmRleCAyMGJhMzRlYzkxLi41ODQ4ZGQ4Mzk5IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0v
dHJhcHMuYworKysgYi94ZW4vYXJjaC9hcm0vdHJhcHMuYwpAQCAtMjAwNywxNiArMjAwNywyNiBA
QCBzdGF0aWMgaW5saW5lIGJvb2wgbmVlZHNfc3NiZF9mbGlwKHN0cnVjdCB2Y3B1ICp2KQogfQog
CiAvKgotICogQWN0aW9ucyB0aGF0IG5lZWRzIHRvIGJlIGRvbmUgYWZ0ZXIgZXhpdGluZyB0aGUg
Z3Vlc3QgYW5kIGJlZm9yZSBhbnkKLSAqIHJlcXVlc3QgZnJvbSBpdCBpcyBoYW5kbGVkLgorICog
QWN0aW9ucyB0aGF0IG5lZWRzIHRvIGJlIGRvbmUgYWZ0ZXIgZXhpdGluZyB0aGUgZ3Vlc3QgYW5k
IGJlZm9yZSB0aGUKKyAqIGludGVycnVwdHMgYXJlIHVubWFza2VkLgogICovCi12b2lkIGVudGVy
X2h5cGVydmlzb3JfZnJvbV9ndWVzdChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKK3ZvaWQg
ZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1ZXN0X25vaXJxKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpy
ZWdzKQogewogICAgIHN0cnVjdCB2Y3B1ICp2ID0gY3VycmVudDsKIAogICAgIC8qIElmIHRoZSBn
dWVzdCBoYXMgZGlzYWJsZWQgdGhlIHdvcmthcm91bmQsIGJyaW5nIGl0IGJhY2sgb24uICovCiAg
ICAgaWYgKCBuZWVkc19zc2JkX2ZsaXAodikgKQogICAgICAgICBhcm1fc21jY2NfMV8xX3NtYyhB
Uk1fU01DQ0NfQVJDSF9XT1JLQVJPVU5EXzJfRklELCAxLCBOVUxMKTsKK30KKworLyoKKyAqIEFj
dGlvbnMgdGhhdCBuZWVkcyB0byBiZSBkb25lIGFmdGVyIGV4aXRpbmcgdGhlIGd1ZXN0IGFuZCBi
ZWZvcmUgYW55CisgKiByZXF1ZXN0IGZyb20gaXQgaXMgaGFuZGxlZC4gRGVwZW5kaW5nIG9uIHRo
ZSBleGNlcHRpb24gdHJhcCwgdGhpcyBtYXkKKyAqIGJlIGNhbGxlZCB3aXRoIGludGVycnVwdHMg
dW5tYXNrZWQuCisgKi8KK3ZvaWQgZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1ZXN0KHN0cnVjdCBj
cHVfdXNlcl9yZWdzICpyZWdzKQoreworICAgIHN0cnVjdCB2Y3B1ICp2ID0gY3VycmVudDsKIAog
ICAgIC8qCiAgICAgICogSWYgd2UgcGVuZGVkIGEgdmlydHVhbCBhYm9ydCwgcHJlc2VydmUgaXQg
dW50aWwgaXQgZ2V0cyBjbGVhcmVkLgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

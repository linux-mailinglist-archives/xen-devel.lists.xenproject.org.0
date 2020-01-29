Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6296614CA55
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 13:07:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwm6T-0005ec-Cm; Wed, 29 Jan 2020 12:05:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mEHh=3S=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iwm6S-0005dw-4q
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 12:05:52 +0000
X-Inumbo-ID: a9328176-428f-11ea-889e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9328176-428f-11ea-889e-12813bfff9fa;
 Wed, 29 Jan 2020 12:05:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2507EB14B;
 Wed, 29 Jan 2020 12:05:37 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Wed, 29 Jan 2020 13:05:23 +0100
Message-Id: <20200129120531.6891-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129120531.6891-1-tzimmermann@suse.de>
References: <20200129120531.6891-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 07/15] drm/ili9225: Remove sending of vblank
 event
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, xen-devel@lists.xenproject.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGF0b21pYyBoZWxwZXJzIGF1dG9tYXRpY2FsbHkgc2VuZCBvdXQgZmFrZSBWQkxBTksgZXZl
bnRzIGlmIG5vCnZibGFua2luZyBoYXMgYmVlbiBpbml0aWFsaXplZC4gUmVtb3ZlIHRoZSBzZW5k
aW5nIGNvZGUgZnJvbSB0aGUKZHJpdmVyLgoKdjQ6CgkqIHNlcGFyYXRlIGNvbW1pdCBmcm9tIGNv
cmUgdmJsYW5rIGNoYW5nZXMKClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPgpBY2tlZC1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5j
b20+ClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS90aW55L2lsaTkyMjUuYyB8IDkgLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGlu
eS9pbGk5MjI1LmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9pbGk5MjI1LmMKaW5kZXggYzY2YWNj
NTY2YzJiLi44MDJmYjhkZGUxYjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55L2ls
aTkyMjUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9pbGk5MjI1LmMKQEAgLTI2LDcgKzI2
LDYgQEAKICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIuaD4KICNpbmNs
dWRlIDxkcm0vZHJtX21pcGlfZGJpLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9yZWN0Lmg+Ci0jaW5j
bHVkZSA8ZHJtL2RybV92YmxhbmsuaD4KIAogI2RlZmluZSBJTEk5MjI1X0RSSVZFUl9SRUFEX0NP
REUJMHgwMAogI2RlZmluZSBJTEk5MjI1X0RSSVZFUl9PVVRQVVRfQ09OVFJPTAkweDAxCkBAIC0x
NjUsMTggKzE2NCwxMCBAQCBzdGF0aWMgdm9pZCBpbGk5MjI1X3BpcGVfdXBkYXRlKHN0cnVjdCBk
cm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwKIAkJCQlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRl
ICpvbGRfc3RhdGUpCiB7CiAJc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqc3RhdGUgPSBwaXBlLT5w
bGFuZS5zdGF0ZTsKLQlzdHJ1Y3QgZHJtX2NydGMgKmNydGMgPSAmcGlwZS0+Y3J0YzsKIAlzdHJ1
Y3QgZHJtX3JlY3QgcmVjdDsKIAogCWlmIChkcm1fYXRvbWljX2hlbHBlcl9kYW1hZ2VfbWVyZ2Vk
KG9sZF9zdGF0ZSwgc3RhdGUsICZyZWN0KSkKIAkJaWxpOTIyNV9mYl9kaXJ0eShzdGF0ZS0+ZmIs
ICZyZWN0KTsKLQotCWlmIChjcnRjLT5zdGF0ZS0+ZXZlbnQpIHsKLQkJc3Bpbl9sb2NrX2lycSgm
Y3J0Yy0+ZGV2LT5ldmVudF9sb2NrKTsKLQkJZHJtX2NydGNfc2VuZF92YmxhbmtfZXZlbnQoY3J0
YywgY3J0Yy0+c3RhdGUtPmV2ZW50KTsKLQkJc3Bpbl91bmxvY2tfaXJxKCZjcnRjLT5kZXYtPmV2
ZW50X2xvY2spOwotCQljcnRjLT5zdGF0ZS0+ZXZlbnQgPSBOVUxMOwotCX0KIH0KIAogc3RhdGlj
IHZvaWQgaWxpOTIyNV9waXBlX2VuYWJsZShzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUg
KnBpcGUsCi0tIAoyLjI1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs

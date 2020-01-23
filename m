Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4220414647E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 10:24:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuYgm-00065W-HC; Thu, 23 Jan 2020 09:22:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WyYo=3M=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iuYgk-00064F-Tg
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 09:22:10 +0000
X-Inumbo-ID: be165810-3dc1-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be165810-3dc1-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 09:21:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AB51AB21F;
 Thu, 23 Jan 2020 09:21:30 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Thu, 23 Jan 2020 10:21:19 +0100
Message-Id: <20200123092123.28368-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123092123.28368-1-tzimmermann@suse.de>
References: <20200123092123.28368-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 11/15] drm/st7586: Remove sending of vblank
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
Cc: xen-devel@lists.xenproject.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGF0b21pYyBoZWxwZXJzIGF1dG9tYXRpY2FsbHkgc2VuZCBvdXQgZmFrZSBWQkxBTksgZXZl
bnRzIGlmIG5vCnZibGFua2luZyBoYXMgYmVlbiBpbml0aWFsaXplZC4gUmVtb3ZlIHRoZSBzZW5k
aW5nIGNvZGUgZnJvbSB0aGUKZHJpdmVyLgoKdjQ6CgkqIHNlcGFyYXRlIGNvbW1pdCBmcm9tIGNv
cmUgdmJsYW5rIGNoYW5nZXMKClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPgpBY2tlZC1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Rpbnkvc3Q3NTg2LmMgfCA5IC0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3Rpbnkvc3Q3NTg2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9zdDc1ODYuYwppbmRleCAwNjBj
Yzc1NjE5NGYuLjllZjU1OWRkMzE5MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkv
c3Q3NTg2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc3Q3NTg2LmMKQEAgLTIzLDcgKzIz
LDYgQEAKICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIuaD4KICNpbmNs
dWRlIDxkcm0vZHJtX21pcGlfZGJpLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9yZWN0Lmg+Ci0jaW5j
bHVkZSA8ZHJtL2RybV92YmxhbmsuaD4KIAogLyogY29udHJvbGxlci1zcGVjaWZpYyBjb21tYW5k
cyAqLwogI2RlZmluZSBTVDc1ODZfRElTUF9NT0RFX0dSQVkJMHgzOApAQCAtMTU5LDE4ICsxNTgs
MTAgQEAgc3RhdGljIHZvaWQgc3Q3NTg2X3BpcGVfdXBkYXRlKHN0cnVjdCBkcm1fc2ltcGxlX2Rp
c3BsYXlfcGlwZSAqcGlwZSwKIAkJCSAgICAgICBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpvbGRf
c3RhdGUpCiB7CiAJc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqc3RhdGUgPSBwaXBlLT5wbGFuZS5z
dGF0ZTsKLQlzdHJ1Y3QgZHJtX2NydGMgKmNydGMgPSAmcGlwZS0+Y3J0YzsKIAlzdHJ1Y3QgZHJt
X3JlY3QgcmVjdDsKIAogCWlmIChkcm1fYXRvbWljX2hlbHBlcl9kYW1hZ2VfbWVyZ2VkKG9sZF9z
dGF0ZSwgc3RhdGUsICZyZWN0KSkKIAkJc3Q3NTg2X2ZiX2RpcnR5KHN0YXRlLT5mYiwgJnJlY3Qp
OwotCi0JaWYgKGNydGMtPnN0YXRlLT5ldmVudCkgewotCQlzcGluX2xvY2tfaXJxKCZjcnRjLT5k
ZXYtPmV2ZW50X2xvY2spOwotCQlkcm1fY3J0Y19zZW5kX3ZibGFua19ldmVudChjcnRjLCBjcnRj
LT5zdGF0ZS0+ZXZlbnQpOwotCQlzcGluX3VubG9ja19pcnEoJmNydGMtPmRldi0+ZXZlbnRfbG9j
ayk7Ci0JCWNydGMtPnN0YXRlLT5ldmVudCA9IE5VTEw7Ci0JfQogfQogCiBzdGF0aWMgdm9pZCBz
dDc1ODZfcGlwZV9lbmFibGUoc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlLAot
LSAKMi4yNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

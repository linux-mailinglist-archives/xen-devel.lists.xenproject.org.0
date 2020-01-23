Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 165A8146479
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 10:23:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuYgc-0005uy-ES; Thu, 23 Jan 2020 09:22:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WyYo=3M=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iuYga-0005td-Th
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 09:22:00 +0000
X-Inumbo-ID: bcf5d758-3dc1-11ea-b833-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bcf5d758-3dc1-11ea-b833-bc764e2007e4;
 Thu, 23 Jan 2020 09:21:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C2188B213;
 Thu, 23 Jan 2020 09:21:28 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Thu, 23 Jan 2020 10:21:15 +0100
Message-Id: <20200123092123.28368-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123092123.28368-1-tzimmermann@suse.de>
References: <20200123092123.28368-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 07/15] drm/ili9225: Remove sending of vblank
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
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RpbnkvaWxpOTIyNS5jIHwgOSAtLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS90aW55L2lsaTkyMjUuYyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L2lsaTkyMjUuYwppbmRleCBj
NjZhY2M1NjZjMmIuLjgwMmZiOGRkZTFiNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rp
bnkvaWxpOTIyNS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L2lsaTkyMjUuYwpAQCAtMjYs
NyArMjYsNiBAQAogI2luY2x1ZGUgPGRybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5oPgog
I2luY2x1ZGUgPGRybS9kcm1fbWlwaV9kYmkuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3JlY3QuaD4K
LSNpbmNsdWRlIDxkcm0vZHJtX3ZibGFuay5oPgogCiAjZGVmaW5lIElMSTkyMjVfRFJJVkVSX1JF
QURfQ09ERQkweDAwCiAjZGVmaW5lIElMSTkyMjVfRFJJVkVSX09VVFBVVF9DT05UUk9MCTB4MDEK
QEAgLTE2NSwxOCArMTY0LDEwIEBAIHN0YXRpYyB2b2lkIGlsaTkyMjVfcGlwZV91cGRhdGUoc3Ry
dWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlLAogCQkJCXN0cnVjdCBkcm1fcGxhbmVf
c3RhdGUgKm9sZF9zdGF0ZSkKIHsKIAlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpzdGF0ZSA9IHBp
cGUtPnBsYW5lLnN0YXRlOwotCXN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9ICZwaXBlLT5jcnRjOwog
CXN0cnVjdCBkcm1fcmVjdCByZWN0OwogCiAJaWYgKGRybV9hdG9taWNfaGVscGVyX2RhbWFnZV9t
ZXJnZWQob2xkX3N0YXRlLCBzdGF0ZSwgJnJlY3QpKQogCQlpbGk5MjI1X2ZiX2RpcnR5KHN0YXRl
LT5mYiwgJnJlY3QpOwotCi0JaWYgKGNydGMtPnN0YXRlLT5ldmVudCkgewotCQlzcGluX2xvY2tf
aXJxKCZjcnRjLT5kZXYtPmV2ZW50X2xvY2spOwotCQlkcm1fY3J0Y19zZW5kX3ZibGFua19ldmVu
dChjcnRjLCBjcnRjLT5zdGF0ZS0+ZXZlbnQpOwotCQlzcGluX3VubG9ja19pcnEoJmNydGMtPmRl
di0+ZXZlbnRfbG9jayk7Ci0JCWNydGMtPnN0YXRlLT5ldmVudCA9IE5VTEw7Ci0JfQogfQogCiBz
dGF0aWMgdm9pZCBpbGk5MjI1X3BpcGVfZW5hYmxlKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlf
cGlwZSAqcGlwZSwKLS0gCjIuMjQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=

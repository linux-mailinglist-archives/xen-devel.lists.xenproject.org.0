Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FF714CA5F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 13:08:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwm6K-0005Zo-IQ; Wed, 29 Jan 2020 12:05:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mEHh=3S=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iwm6I-0005Zb-4B
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 12:05:42 +0000
X-Inumbo-ID: a8404d86-428f-11ea-889e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8404d86-428f-11ea-889e-12813bfff9fa;
 Wed, 29 Jan 2020 12:05:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9EB15ACA4;
 Wed, 29 Jan 2020 12:05:35 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Wed, 29 Jan 2020 13:05:20 +0100
Message-Id: <20200129120531.6891-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129120531.6891-1-tzimmermann@suse.de>
References: <20200129120531.6891-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 04/15] drm/bochs: Remove sending of vblank
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
LS0KIGRyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19rbXMuYyB8IDkgLS0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
Ym9jaHMvYm9jaHNfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfa21zLmMKaW5k
ZXggM2YwMDA2YzI0NzBkLi5mZjI3NWZhZWU4OGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9ib2Nocy9ib2Noc19rbXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfa21z
LmMKQEAgLTcsNyArNyw2IEBACiAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+CiAj
aW5jbHVkZSA8ZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJt
L2RybV9wcm9iZV9oZWxwZXIuaD4KLSNpbmNsdWRlIDxkcm0vZHJtX3ZibGFuay5oPgogCiAjaW5j
bHVkZSAiYm9jaHMuaCIKIApAQCAtNTcsMTYgKzU2LDggQEAgc3RhdGljIHZvaWQgYm9jaHNfcGlw
ZV91cGRhdGUoc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlLAogCQkJICAgICAg
c3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqb2xkX3N0YXRlKQogewogCXN0cnVjdCBib2Noc19kZXZp
Y2UgKmJvY2hzID0gcGlwZS0+Y3J0Yy5kZXYtPmRldl9wcml2YXRlOwotCXN0cnVjdCBkcm1fY3J0
YyAqY3J0YyA9ICZwaXBlLT5jcnRjOwogCiAJYm9jaHNfcGxhbmVfdXBkYXRlKGJvY2hzLCBwaXBl
LT5wbGFuZS5zdGF0ZSk7Ci0KLQlpZiAoY3J0Yy0+c3RhdGUtPmV2ZW50KSB7Ci0JCXNwaW5fbG9j
a19pcnEoJmNydGMtPmRldi0+ZXZlbnRfbG9jayk7Ci0JCWRybV9jcnRjX3NlbmRfdmJsYW5rX2V2
ZW50KGNydGMsIGNydGMtPnN0YXRlLT5ldmVudCk7Ci0JCWNydGMtPnN0YXRlLT5ldmVudCA9IE5V
TEw7Ci0JCXNwaW5fdW5sb2NrX2lycSgmY3J0Yy0+ZGV2LT5ldmVudF9sb2NrKTsKLQl9CiB9CiAK
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGVfZnVuY3MgYm9jaHNf
cGlwZV9mdW5jcyA9IHsKLS0gCjIuMjUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=

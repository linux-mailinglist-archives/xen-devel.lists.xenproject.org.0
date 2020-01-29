Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F16B14CA5E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 13:08:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwm6Y-0005hb-OW; Wed, 29 Jan 2020 12:05:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mEHh=3S=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iwm6X-0005gs-4q
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 12:05:57 +0000
X-Inumbo-ID: a97af47e-428f-11ea-889e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a97af47e-428f-11ea-889e-12813bfff9fa;
 Wed, 29 Jan 2020 12:05:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A047CB17A;
 Wed, 29 Jan 2020 12:05:37 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Wed, 29 Jan 2020 13:05:24 +0100
Message-Id: <20200129120531.6891-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129120531.6891-1-tzimmermann@suse.de>
References: <20200129120531.6891-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 08/15] drm/mipi-dbi: Remove sending of vblank
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
LS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kYmkuYyB8IDkgLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X21pcGlfZGJpLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZGJpLmMKaW5kZXggMjdmZTgx
YTUzYzg4Li41NThiYWY5ODlmNWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWlw
aV9kYmkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZGJpLmMKQEAgLTI0LDcgKzI0
LDYgQEAKICNpbmNsdWRlIDxkcm0vZHJtX21vZGVzLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wcm9i
ZV9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3JlY3QuaD4KLSNpbmNsdWRlIDxkcm0vZHJt
X3ZibGFuay5oPgogI2luY2x1ZGUgPHZpZGVvL21pcGlfZGlzcGxheS5oPgogCiAjZGVmaW5lIE1J
UElfREJJX01BWF9TUElfUkVBRF9TUEVFRCAyMDAwMDAwIC8qIDJNSHogKi8KQEAgLTMxMiwxOCAr
MzExLDEwIEBAIHZvaWQgbWlwaV9kYmlfcGlwZV91cGRhdGUoc3RydWN0IGRybV9zaW1wbGVfZGlz
cGxheV9waXBlICpwaXBlLAogCQkJICBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpvbGRfc3RhdGUp
CiB7CiAJc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqc3RhdGUgPSBwaXBlLT5wbGFuZS5zdGF0ZTsK
LQlzdHJ1Y3QgZHJtX2NydGMgKmNydGMgPSAmcGlwZS0+Y3J0YzsKIAlzdHJ1Y3QgZHJtX3JlY3Qg
cmVjdDsKIAogCWlmIChkcm1fYXRvbWljX2hlbHBlcl9kYW1hZ2VfbWVyZ2VkKG9sZF9zdGF0ZSwg
c3RhdGUsICZyZWN0KSkKIAkJbWlwaV9kYmlfZmJfZGlydHkoc3RhdGUtPmZiLCAmcmVjdCk7Ci0K
LQlpZiAoY3J0Yy0+c3RhdGUtPmV2ZW50KSB7Ci0JCXNwaW5fbG9ja19pcnEoJmNydGMtPmRldi0+
ZXZlbnRfbG9jayk7Ci0JCWRybV9jcnRjX3NlbmRfdmJsYW5rX2V2ZW50KGNydGMsIGNydGMtPnN0
YXRlLT5ldmVudCk7Ci0JCXNwaW5fdW5sb2NrX2lycSgmY3J0Yy0+ZGV2LT5ldmVudF9sb2NrKTsK
LQkJY3J0Yy0+c3RhdGUtPmV2ZW50ID0gTlVMTDsKLQl9CiB9CiBFWFBPUlRfU1lNQk9MKG1pcGlf
ZGJpX3BpcGVfdXBkYXRlKTsKIAotLSAKMi4yNS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==

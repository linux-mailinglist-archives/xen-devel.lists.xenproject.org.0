Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2429D14CA54
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 13:07:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwm6j-0005su-TG; Wed, 29 Jan 2020 12:06:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mEHh=3S=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iwm6h-0005qI-5C
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 12:06:07 +0000
X-Inumbo-ID: ab4da116-428f-11ea-889e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab4da116-428f-11ea-889e-12813bfff9fa;
 Wed, 29 Jan 2020 12:05:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B0242B1EB;
 Wed, 29 Jan 2020 12:05:40 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Wed, 29 Jan 2020 13:05:30 +0100
Message-Id: <20200129120531.6891-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129120531.6891-1-tzimmermann@suse.de>
References: <20200129120531.6891-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 14/15] drm/virtio: Remove sending of vblank
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
LS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kaXNwbGF5LmMgfCA4IC0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdmlydGlvL3ZpcnRncHVfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92
aXJ0Z3B1X2Rpc3BsYXkuYwppbmRleCAwOTY2MjA4ZWMzMGQuLmVjZjRiYTdjYzMyYiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rpc3BsYXkuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZGlzcGxheS5jCkBAIC0zMCw3ICszMCw2IEBACiAj
aW5jbHVkZSA8ZHJtL2RybV9mb3VyY2MuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9mcmFtZWJ1
ZmZlcl9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgotI2luY2x1
ZGUgPGRybS9kcm1fdmJsYW5rLmg+CiAKICNpbmNsdWRlICJ2aXJ0Z3B1X2Rydi5oIgogCkBAIC0x
MjEsMTMgKzEyMCw2IEBAIHN0YXRpYyBpbnQgdmlydGlvX2dwdV9jcnRjX2F0b21pY19jaGVjayhz
dHJ1Y3QgZHJtX2NydGMgKmNydGMsCiBzdGF0aWMgdm9pZCB2aXJ0aW9fZ3B1X2NydGNfYXRvbWlj
X2ZsdXNoKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAkJCQkJIHN0cnVjdCBkcm1fY3J0Y19zdGF0
ZSAqb2xkX3N0YXRlKQogewotCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Ci0KLQlzcGluX2xvY2tfaXJx
c2F2ZSgmY3J0Yy0+ZGV2LT5ldmVudF9sb2NrLCBmbGFncyk7Ci0JaWYgKGNydGMtPnN0YXRlLT5l
dmVudCkKLQkJZHJtX2NydGNfc2VuZF92YmxhbmtfZXZlbnQoY3J0YywgY3J0Yy0+c3RhdGUtPmV2
ZW50KTsKLQljcnRjLT5zdGF0ZS0+ZXZlbnQgPSBOVUxMOwotCXNwaW5fdW5sb2NrX2lycXJlc3Rv
cmUoJmNydGMtPmRldi0+ZXZlbnRfbG9jaywgZmxhZ3MpOwogfQogCiBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRybV9jcnRjX2hlbHBlcl9mdW5jcyB2aXJ0aW9fZ3B1X2NydGNfaGVscGVyX2Z1bmNzID0g
ewotLSAKMi4yNS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==

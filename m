Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7695514CA56
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 13:07:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwm6d-0005lt-Ul; Wed, 29 Jan 2020 12:06:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mEHh=3S=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iwm6c-0005kK-53
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 12:06:02 +0000
X-Inumbo-ID: a9cae98e-428f-11ea-889e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9cae98e-428f-11ea-889e-12813bfff9fa;
 Wed, 29 Jan 2020 12:05:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2B839B191;
 Wed, 29 Jan 2020 12:05:38 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Wed, 29 Jan 2020 13:05:25 +0100
Message-Id: <20200129120531.6891-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129120531.6891-1-tzimmermann@suse.de>
References: <20200129120531.6891-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 09/15] drm/qxl: Remove sending of vblank event
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
LS0KIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rpc3BsYXkuYyB8IDE0IC0tLS0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3F4bC9xeGxfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZGlzcGxh
eS5jCmluZGV4IDE2ZDczYjIyZjNmNS4uYWI0ZjhkZDAwNDAwIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vcXhsL3F4bF9kaXNwbGF5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxf
ZGlzcGxheS5jCkBAIC0zMSw3ICszMSw2IEBACiAjaW5jbHVkZSA8ZHJtL2RybV9nZW1fZnJhbWVi
dWZmZXJfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wbGFuZV9oZWxwZXIuaD4KICNpbmNs
dWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgotI2luY2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+
CiAKICNpbmNsdWRlICJxeGxfZHJ2LmgiCiAjaW5jbHVkZSAicXhsX29iamVjdC5oIgpAQCAtMzcy
LDE5ICszNzEsNiBAQCBzdGF0aWMgdm9pZCBxeGxfY3J0Y191cGRhdGVfbW9uaXRvcnNfY29uZmln
KHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIHN0YXRpYyB2b2lkIHF4bF9jcnRjX2F0b21pY19mbHVz
aChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJCQkJICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm9s
ZF9jcnRjX3N0YXRlKQogewotCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBjcnRjLT5kZXY7Ci0J
c3RydWN0IGRybV9wZW5kaW5nX3ZibGFua19ldmVudCAqZXZlbnQ7Ci0JdW5zaWduZWQgbG9uZyBm
bGFnczsKLQotCWlmIChjcnRjLT5zdGF0ZSAmJiBjcnRjLT5zdGF0ZS0+ZXZlbnQpIHsKLQkJZXZl
bnQgPSBjcnRjLT5zdGF0ZS0+ZXZlbnQ7Ci0JCWNydGMtPnN0YXRlLT5ldmVudCA9IE5VTEw7Ci0K
LQkJc3Bpbl9sb2NrX2lycXNhdmUoJmRldi0+ZXZlbnRfbG9jaywgZmxhZ3MpOwotCQlkcm1fY3J0
Y19zZW5kX3ZibGFua19ldmVudChjcnRjLCBldmVudCk7Ci0JCXNwaW5fdW5sb2NrX2lycXJlc3Rv
cmUoJmRldi0+ZXZlbnRfbG9jaywgZmxhZ3MpOwotCX0KLQogCXF4bF9jcnRjX3VwZGF0ZV9tb25p
dG9yc19jb25maWcoY3J0YywgImZsdXNoIik7CiB9CiAKLS0gCjIuMjUuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

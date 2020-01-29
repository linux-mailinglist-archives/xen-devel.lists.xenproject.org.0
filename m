Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BA414CA5B
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 13:08:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwm6E-0005ZI-VU; Wed, 29 Jan 2020 12:05:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mEHh=3S=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iwm6D-0005Z9-74
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 12:05:37 +0000
X-Inumbo-ID: a840e9e2-428f-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a840e9e2-428f-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 12:05:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B113AAD03;
 Wed, 29 Jan 2020 12:05:34 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Wed, 29 Jan 2020 13:05:18 +0100
Message-Id: <20200129120531.6891-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129120531.6891-1-tzimmermann@suse.de>
References: <20200129120531.6891-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 02/15] drm/arc: Remove sending of vblank event
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
LS0KIGRyaXZlcnMvZ3B1L2RybS9hcmMvYXJjcGd1X2NydGMuYyB8IDE2IC0tLS0tLS0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXJjL2FyY3BndV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJjL2FyY3BndV9j
cnRjLmMKaW5kZXggOGFlMWUxZjk3YTczLi5iZTdjMjljZWMzMTggMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hcmMvYXJjcGd1X2NydGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJjL2Fy
Y3BndV9jcnRjLmMKQEAgLTksNyArOSw2IEBACiAjaW5jbHVkZSA8ZHJtL2RybV9kZXZpY2UuaD4K
ICNpbmNsdWRlIDxkcm0vZHJtX2ZiX2NtYV9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2dl
bV9jbWFfaGVscGVyLmg+Ci0jaW5jbHVkZSA8ZHJtL2RybV92YmxhbmsuaD4KICNpbmNsdWRlIDxk
cm0vZHJtX3BsYW5lX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+
CiAjaW5jbHVkZSA8bGludXgvY2xrLmg+CkBAIC0xMzgsMjQgKzEzNyw5IEBAIHN0YXRpYyB2b2lk
IGFyY19wZ3VfY3J0Y19hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJCQkg
ICAgICB+QVJDUEdVX0NUUkxfRU5BQkxFX01BU0spOwogfQogCi1zdGF0aWMgdm9pZCBhcmNfcGd1
X2NydGNfYXRvbWljX2JlZ2luKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKLQkJCQkgICAgICBzdHJ1
Y3QgZHJtX2NydGNfc3RhdGUgKnN0YXRlKQotewotCXN0cnVjdCBkcm1fcGVuZGluZ192Ymxhbmtf
ZXZlbnQgKmV2ZW50ID0gY3J0Yy0+c3RhdGUtPmV2ZW50OwotCi0JaWYgKGV2ZW50KSB7Ci0JCWNy
dGMtPnN0YXRlLT5ldmVudCA9IE5VTEw7Ci0KLQkJc3Bpbl9sb2NrX2lycSgmY3J0Yy0+ZGV2LT5l
dmVudF9sb2NrKTsKLQkJZHJtX2NydGNfc2VuZF92YmxhbmtfZXZlbnQoY3J0YywgZXZlbnQpOwot
CQlzcGluX3VubG9ja19pcnEoJmNydGMtPmRldi0+ZXZlbnRfbG9jayk7Ci0JfQotfQotCiBzdGF0
aWMgY29uc3Qgc3RydWN0IGRybV9jcnRjX2hlbHBlcl9mdW5jcyBhcmNfcGd1X2NydGNfaGVscGVy
X2Z1bmNzID0gewogCS5tb2RlX3ZhbGlkCT0gYXJjX3BndV9jcnRjX21vZGVfdmFsaWQsCiAJLm1v
ZGVfc2V0X25vZmIJPSBhcmNfcGd1X2NydGNfbW9kZV9zZXRfbm9mYiwKLQkuYXRvbWljX2JlZ2lu
CT0gYXJjX3BndV9jcnRjX2F0b21pY19iZWdpbiwKIAkuYXRvbWljX2VuYWJsZQk9IGFyY19wZ3Vf
Y3J0Y19hdG9taWNfZW5hYmxlLAogCS5hdG9taWNfZGlzYWJsZQk9IGFyY19wZ3VfY3J0Y19hdG9t
aWNfZGlzYWJsZSwKIH07Ci0tIAoyLjI1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

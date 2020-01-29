Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E77814CA59
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 13:08:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwm6o-0005yr-9e; Wed, 29 Jan 2020 12:06:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mEHh=3S=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iwm6m-0005wr-4n
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 12:06:12 +0000
X-Inumbo-ID: ab00daf2-428f-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab00daf2-428f-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 12:05:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 351F3B1E1;
 Wed, 29 Jan 2020 12:05:40 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Wed, 29 Jan 2020 13:05:29 +0100
Message-Id: <20200129120531.6891-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129120531.6891-1-tzimmermann@suse.de>
References: <20200129120531.6891-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 13/15] drm/vboxvideo: Remove sending of
 vblank event
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
LS0KIGRyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9tb2RlLmMgfCAxMiAtLS0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfbW9kZS5jIGIvZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRl
by92Ym94X21vZGUuYwppbmRleCAxOTYxMjEzMmM4YTMuLjhiN2YwMDVjNGQyMCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X21vZGUuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vdmJveHZpZGVvL3Zib3hfbW9kZS5jCkBAIC0xOCw3ICsxOCw2IEBACiAjaW5jbHVkZSA8
ZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wbGFu
ZV9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgotI2luY2x1ZGUg
PGRybS9kcm1fdmJsYW5rLmg+CiAKICNpbmNsdWRlICJoZ3NtaV9jaGFubmVscy5oIgogI2luY2x1
ZGUgInZib3hfZHJ2LmgiCkBAIC0yMjYsMTcgKzIyNSw2IEBAIHN0YXRpYyB2b2lkIHZib3hfY3J0
Y19hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiBzdGF0aWMgdm9pZCB2Ym94
X2NydGNfYXRvbWljX2ZsdXNoKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAkJCQkgICBzdHJ1Y3Qg
ZHJtX2NydGNfc3RhdGUgKm9sZF9jcnRjX3N0YXRlKQogewotCXN0cnVjdCBkcm1fcGVuZGluZ192
YmxhbmtfZXZlbnQgKmV2ZW50OwotCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Ci0KLQlpZiAoY3J0Yy0+
c3RhdGUgJiYgY3J0Yy0+c3RhdGUtPmV2ZW50KSB7Ci0JCWV2ZW50ID0gY3J0Yy0+c3RhdGUtPmV2
ZW50OwotCQljcnRjLT5zdGF0ZS0+ZXZlbnQgPSBOVUxMOwotCi0JCXNwaW5fbG9ja19pcnFzYXZl
KCZjcnRjLT5kZXYtPmV2ZW50X2xvY2ssIGZsYWdzKTsKLQkJZHJtX2NydGNfc2VuZF92Ymxhbmtf
ZXZlbnQoY3J0YywgZXZlbnQpOwotCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZjcnRjLT5kZXYt
PmV2ZW50X2xvY2ssIGZsYWdzKTsKLQl9CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Ny
dGNfaGVscGVyX2Z1bmNzIHZib3hfY3J0Y19oZWxwZXJfZnVuY3MgPSB7Ci0tIAoyLjI1LjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

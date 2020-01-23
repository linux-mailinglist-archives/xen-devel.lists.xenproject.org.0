Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5663514647D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 10:23:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuYgh-000608-S1; Thu, 23 Jan 2020 09:22:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WyYo=3M=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iuYgf-0005yb-Sv
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 09:22:05 +0000
X-Inumbo-ID: bd869cac-3dc1-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd869cac-3dc1-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 09:21:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 35DAEB21D;
 Thu, 23 Jan 2020 09:21:30 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Thu, 23 Jan 2020 10:21:18 +0100
Message-Id: <20200123092123.28368-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123092123.28368-1-tzimmermann@suse.de>
References: <20200123092123.28368-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 10/15] drm/repaper: Remove sending of vblank
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
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RpbnkvcmVwYXBlci5jIHwgOSAtLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS90aW55L3JlcGFwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L3JlcGFwZXIuYwppbmRleCA3
NmQxNzkyMDA3NzUuLjE4MzQ4NDU5NWFlYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rp
bnkvcmVwYXBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L3JlcGFwZXIuYwpAQCAtMzMs
NyArMzMsNiBAQAogI2luY2x1ZGUgPGRybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5oPgog
I2luY2x1ZGUgPGRybS9kcm1fbW9kZXMuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3JlY3QuaD4KLSNp
bmNsdWRlIDxkcm0vZHJtX3ZibGFuay5oPgogI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVy
Lmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5oPgogCkBAIC04NTYsMTgg
Kzg1NSwxMCBAQCBzdGF0aWMgdm9pZCByZXBhcGVyX3BpcGVfdXBkYXRlKHN0cnVjdCBkcm1fc2lt
cGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwKIAkJCQlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpvbGRf
c3RhdGUpCiB7CiAJc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqc3RhdGUgPSBwaXBlLT5wbGFuZS5z
dGF0ZTsKLQlzdHJ1Y3QgZHJtX2NydGMgKmNydGMgPSAmcGlwZS0+Y3J0YzsKIAlzdHJ1Y3QgZHJt
X3JlY3QgcmVjdDsKIAogCWlmIChkcm1fYXRvbWljX2hlbHBlcl9kYW1hZ2VfbWVyZ2VkKG9sZF9z
dGF0ZSwgc3RhdGUsICZyZWN0KSkKIAkJcmVwYXBlcl9mYl9kaXJ0eShzdGF0ZS0+ZmIpOwotCi0J
aWYgKGNydGMtPnN0YXRlLT5ldmVudCkgewotCQlzcGluX2xvY2tfaXJxKCZjcnRjLT5kZXYtPmV2
ZW50X2xvY2spOwotCQlkcm1fY3J0Y19zZW5kX3ZibGFua19ldmVudChjcnRjLCBjcnRjLT5zdGF0
ZS0+ZXZlbnQpOwotCQlzcGluX3VubG9ja19pcnEoJmNydGMtPmRldi0+ZXZlbnRfbG9jayk7Ci0J
CWNydGMtPnN0YXRlLT5ldmVudCA9IE5VTEw7Ci0JfQogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0
IGRybV9zaW1wbGVfZGlzcGxheV9waXBlX2Z1bmNzIHJlcGFwZXJfcGlwZV9mdW5jcyA9IHsKLS0g
CjIuMjQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

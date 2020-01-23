Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBD3146472
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 10:23:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuYgB-0005Yf-R3; Thu, 23 Jan 2020 09:21:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WyYo=3M=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iuYg9-0005Xo-MP
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 09:21:33 +0000
X-Inumbo-ID: bbc3cea9-3dc1-11ea-bdea-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bbc3cea9-3dc1-11ea-bdea-12813bfff9fa;
 Thu, 23 Jan 2020 09:21:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 46D01B14A;
 Thu, 23 Jan 2020 09:21:28 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Thu, 23 Jan 2020 10:21:14 +0100
Message-Id: <20200123092123.28368-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123092123.28368-1-tzimmermann@suse.de>
References: <20200123092123.28368-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 06/15] drm/gm12u320: Remove sending of vblank
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
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RpbnkvZ20xMnUzMjAuYyB8IDkgLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdGlueS9nbTEydTMyMC5jIGIvZHJpdmVycy9ncHUvZHJtL3RpbnkvZ20xMnUzMjAuYwppbmRl
eCA5NGZiMWY1OTM1NjQuLmE0ODE3MzQ0MWFlMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3RpbnkvZ20xMnUzMjAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9nbTEydTMyMC5jCkBA
IC0yMiw3ICsyMiw2IEBACiAjaW5jbHVkZSA8ZHJtL2RybV9tb2Rlc2V0X2hlbHBlcl92dGFibGVz
Lmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJt
X3NpbXBsZV9rbXNfaGVscGVyLmg+Ci0jaW5jbHVkZSA8ZHJtL2RybV92YmxhbmsuaD4KIAogc3Rh
dGljIGJvb2wgZWNvX21vZGU7CiBtb2R1bGVfcGFyYW0oZWNvX21vZGUsIGJvb2wsIDA2NDQpOwpA
QCAtNjEwLDE4ICs2MDksMTAgQEAgc3RhdGljIHZvaWQgZ20xMnUzMjBfcGlwZV91cGRhdGUoc3Ry
dWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlLAogCQkJCSBzdHJ1Y3QgZHJtX3BsYW5l
X3N0YXRlICpvbGRfc3RhdGUpCiB7CiAJc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqc3RhdGUgPSBw
aXBlLT5wbGFuZS5zdGF0ZTsKLQlzdHJ1Y3QgZHJtX2NydGMgKmNydGMgPSAmcGlwZS0+Y3J0YzsK
IAlzdHJ1Y3QgZHJtX3JlY3QgcmVjdDsKIAogCWlmIChkcm1fYXRvbWljX2hlbHBlcl9kYW1hZ2Vf
bWVyZ2VkKG9sZF9zdGF0ZSwgc3RhdGUsICZyZWN0KSkKIAkJZ20xMnUzMjBfZmJfbWFya19kaXJ0
eShwaXBlLT5wbGFuZS5zdGF0ZS0+ZmIsICZyZWN0KTsKLQotCWlmIChjcnRjLT5zdGF0ZS0+ZXZl
bnQpIHsKLQkJc3Bpbl9sb2NrX2lycSgmY3J0Yy0+ZGV2LT5ldmVudF9sb2NrKTsKLQkJZHJtX2Ny
dGNfc2VuZF92YmxhbmtfZXZlbnQoY3J0YywgY3J0Yy0+c3RhdGUtPmV2ZW50KTsKLQkJY3J0Yy0+
c3RhdGUtPmV2ZW50ID0gTlVMTDsKLQkJc3Bpbl91bmxvY2tfaXJxKCZjcnRjLT5kZXYtPmV2ZW50
X2xvY2spOwotCX0KIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlf
cGlwZV9mdW5jcyBnbTEydTMyMF9waXBlX2Z1bmNzID0gewotLSAKMi4yNC4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

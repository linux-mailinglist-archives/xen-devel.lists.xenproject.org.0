Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D7014CA50
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 13:07:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwm6Z-0005i3-4G; Wed, 29 Jan 2020 12:05:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mEHh=3S=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iwm6X-0005gr-4o
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 12:05:57 +0000
X-Inumbo-ID: aa171750-428f-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa171750-428f-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 12:05:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A7771B1B1;
 Wed, 29 Jan 2020 12:05:38 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Wed, 29 Jan 2020 13:05:26 +0100
Message-Id: <20200129120531.6891-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129120531.6891-1-tzimmermann@suse.de>
References: <20200129120531.6891-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 10/15] drm/repaper: Remove sending of vblank
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
LS0KIGRyaXZlcnMvZ3B1L2RybS90aW55L3JlcGFwZXIuYyB8IDkgLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGlu
eS9yZXBhcGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9yZXBhcGVyLmMKaW5kZXggNzZkMTc5
MjAwNzc1Li4xODM0ODQ1OTVhZWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55L3Jl
cGFwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9yZXBhcGVyLmMKQEAgLTMzLDcgKzMz
LDYgQEAKICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIuaD4KICNpbmNs
dWRlIDxkcm0vZHJtX21vZGVzLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9yZWN0Lmg+Ci0jaW5jbHVk
ZSA8ZHJtL2RybV92YmxhbmsuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgog
I2luY2x1ZGUgPGRybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIuaD4KIApAQCAtODU2LDE4ICs4NTUs
MTAgQEAgc3RhdGljIHZvaWQgcmVwYXBlcl9waXBlX3VwZGF0ZShzdHJ1Y3QgZHJtX3NpbXBsZV9k
aXNwbGF5X3BpcGUgKnBpcGUsCiAJCQkJc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqb2xkX3N0YXRl
KQogewogCXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnN0YXRlID0gcGlwZS0+cGxhbmUuc3RhdGU7
Ci0Jc3RydWN0IGRybV9jcnRjICpjcnRjID0gJnBpcGUtPmNydGM7CiAJc3RydWN0IGRybV9yZWN0
IHJlY3Q7CiAKIAlpZiAoZHJtX2F0b21pY19oZWxwZXJfZGFtYWdlX21lcmdlZChvbGRfc3RhdGUs
IHN0YXRlLCAmcmVjdCkpCiAJCXJlcGFwZXJfZmJfZGlydHkoc3RhdGUtPmZiKTsKLQotCWlmIChj
cnRjLT5zdGF0ZS0+ZXZlbnQpIHsKLQkJc3Bpbl9sb2NrX2lycSgmY3J0Yy0+ZGV2LT5ldmVudF9s
b2NrKTsKLQkJZHJtX2NydGNfc2VuZF92YmxhbmtfZXZlbnQoY3J0YywgY3J0Yy0+c3RhdGUtPmV2
ZW50KTsKLQkJc3Bpbl91bmxvY2tfaXJxKCZjcnRjLT5kZXYtPmV2ZW50X2xvY2spOwotCQljcnRj
LT5zdGF0ZS0+ZXZlbnQgPSBOVUxMOwotCX0KIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1f
c2ltcGxlX2Rpc3BsYXlfcGlwZV9mdW5jcyByZXBhcGVyX3BpcGVfZnVuY3MgPSB7Ci0tIAoyLjI1
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

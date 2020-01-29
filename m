Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA79D14CA52
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 13:07:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwm6O-0005az-GK; Wed, 29 Jan 2020 12:05:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mEHh=3S=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iwm6N-0005ab-4L
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 12:05:47 +0000
X-Inumbo-ID: a9045314-428f-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9045314-428f-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 12:05:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9DCC0AFDC;
 Wed, 29 Jan 2020 12:05:36 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Wed, 29 Jan 2020 13:05:22 +0100
Message-Id: <20200129120531.6891-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129120531.6891-1-tzimmermann@suse.de>
References: <20200129120531.6891-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 06/15] drm/gm12u320: Remove sending of vblank
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
LS0KIGRyaXZlcnMvZ3B1L2RybS90aW55L2dtMTJ1MzIwLmMgfCA5IC0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rp
bnkvZ20xMnUzMjAuYyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L2dtMTJ1MzIwLmMKaW5kZXggOTRm
YjFmNTkzNTY0Li5hNDgxNzM0NDFhZTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55
L2dtMTJ1MzIwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RpbnkvZ20xMnUzMjAuYwpAQCAtMjIs
NyArMjIsNiBAQAogI2luY2x1ZGUgPGRybS9kcm1fbW9kZXNldF9oZWxwZXJfdnRhYmxlcy5oPgog
I2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9zaW1w
bGVfa21zX2hlbHBlci5oPgotI2luY2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+CiAKIHN0YXRpYyBi
b29sIGVjb19tb2RlOwogbW9kdWxlX3BhcmFtKGVjb19tb2RlLCBib29sLCAwNjQ0KTsKQEAgLTYx
MCwxOCArNjA5LDEwIEBAIHN0YXRpYyB2b2lkIGdtMTJ1MzIwX3BpcGVfdXBkYXRlKHN0cnVjdCBk
cm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwKIAkJCQkgc3RydWN0IGRybV9wbGFuZV9zdGF0
ZSAqb2xkX3N0YXRlKQogewogCXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnN0YXRlID0gcGlwZS0+
cGxhbmUuc3RhdGU7Ci0Jc3RydWN0IGRybV9jcnRjICpjcnRjID0gJnBpcGUtPmNydGM7CiAJc3Ry
dWN0IGRybV9yZWN0IHJlY3Q7CiAKIAlpZiAoZHJtX2F0b21pY19oZWxwZXJfZGFtYWdlX21lcmdl
ZChvbGRfc3RhdGUsIHN0YXRlLCAmcmVjdCkpCiAJCWdtMTJ1MzIwX2ZiX21hcmtfZGlydHkocGlw
ZS0+cGxhbmUuc3RhdGUtPmZiLCAmcmVjdCk7Ci0KLQlpZiAoY3J0Yy0+c3RhdGUtPmV2ZW50KSB7
Ci0JCXNwaW5fbG9ja19pcnEoJmNydGMtPmRldi0+ZXZlbnRfbG9jayk7Ci0JCWRybV9jcnRjX3Nl
bmRfdmJsYW5rX2V2ZW50KGNydGMsIGNydGMtPnN0YXRlLT5ldmVudCk7Ci0JCWNydGMtPnN0YXRl
LT5ldmVudCA9IE5VTEw7Ci0JCXNwaW5fdW5sb2NrX2lycSgmY3J0Yy0+ZGV2LT5ldmVudF9sb2Nr
KTsKLQl9CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGVf
ZnVuY3MgZ20xMnUzMjBfcGlwZV9mdW5jcyA9IHsKLS0gCjIuMjUuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

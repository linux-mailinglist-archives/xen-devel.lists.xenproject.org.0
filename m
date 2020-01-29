Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF8414CA5A
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 13:08:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwm6d-0005lJ-Gf; Wed, 29 Jan 2020 12:06:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mEHh=3S=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iwm6c-0005kJ-4N
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 12:06:02 +0000
X-Inumbo-ID: aa66570c-428f-11ea-a933-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa66570c-428f-11ea-a933-bc764e2007e4;
 Wed, 29 Jan 2020 12:05:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2EF1BB1C6;
 Wed, 29 Jan 2020 12:05:39 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Wed, 29 Jan 2020 13:05:27 +0100
Message-Id: <20200129120531.6891-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129120531.6891-1-tzimmermann@suse.de>
References: <20200129120531.6891-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 11/15] drm/st7586: Remove sending of vblank
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
LS0KIGRyaXZlcnMvZ3B1L2RybS90aW55L3N0NzU4Ni5jIHwgOSAtLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90aW55
L3N0NzU4Ni5jIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc3Q3NTg2LmMKaW5kZXggMDYwY2M3NTYx
OTRmLi45ZWY1NTlkZDMxOTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55L3N0NzU4
Ni5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L3N0NzU4Ni5jCkBAIC0yMyw3ICsyMyw2IEBA
CiAjaW5jbHVkZSA8ZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmg+CiAjaW5jbHVkZSA8
ZHJtL2RybV9taXBpX2RiaS5oPgogI2luY2x1ZGUgPGRybS9kcm1fcmVjdC5oPgotI2luY2x1ZGUg
PGRybS9kcm1fdmJsYW5rLmg+CiAKIC8qIGNvbnRyb2xsZXItc3BlY2lmaWMgY29tbWFuZHMgKi8K
ICNkZWZpbmUgU1Q3NTg2X0RJU1BfTU9ERV9HUkFZCTB4MzgKQEAgLTE1OSwxOCArMTU4LDEwIEBA
IHN0YXRpYyB2b2lkIHN0NzU4Nl9waXBlX3VwZGF0ZShzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5
X3BpcGUgKnBpcGUsCiAJCQkgICAgICAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqb2xkX3N0YXRl
KQogewogCXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnN0YXRlID0gcGlwZS0+cGxhbmUuc3RhdGU7
Ci0Jc3RydWN0IGRybV9jcnRjICpjcnRjID0gJnBpcGUtPmNydGM7CiAJc3RydWN0IGRybV9yZWN0
IHJlY3Q7CiAKIAlpZiAoZHJtX2F0b21pY19oZWxwZXJfZGFtYWdlX21lcmdlZChvbGRfc3RhdGUs
IHN0YXRlLCAmcmVjdCkpCiAJCXN0NzU4Nl9mYl9kaXJ0eShzdGF0ZS0+ZmIsICZyZWN0KTsKLQot
CWlmIChjcnRjLT5zdGF0ZS0+ZXZlbnQpIHsKLQkJc3Bpbl9sb2NrX2lycSgmY3J0Yy0+ZGV2LT5l
dmVudF9sb2NrKTsKLQkJZHJtX2NydGNfc2VuZF92YmxhbmtfZXZlbnQoY3J0YywgY3J0Yy0+c3Rh
dGUtPmV2ZW50KTsKLQkJc3Bpbl91bmxvY2tfaXJxKCZjcnRjLT5kZXYtPmV2ZW50X2xvY2spOwot
CQljcnRjLT5zdGF0ZS0+ZXZlbnQgPSBOVUxMOwotCX0KIH0KIAogc3RhdGljIHZvaWQgc3Q3NTg2
X3BpcGVfZW5hYmxlKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwKLS0gCjIu
MjUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

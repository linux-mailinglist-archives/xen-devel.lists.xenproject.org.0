Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BBD146471
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 10:23:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuYgG-0005b1-Fo; Thu, 23 Jan 2020 09:21:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WyYo=3M=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iuYgE-0005aR-MQ
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 09:21:38 +0000
X-Inumbo-ID: bcf6823e-3dc1-11ea-bdea-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bcf6823e-3dc1-11ea-bdea-12813bfff9fa;
 Thu, 23 Jan 2020 09:21:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3F11BB215;
 Thu, 23 Jan 2020 09:21:29 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Thu, 23 Jan 2020 10:21:16 +0100
Message-Id: <20200123092123.28368-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123092123.28368-1-tzimmermann@suse.de>
References: <20200123092123.28368-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 08/15] drm/mipi-dbi: Remove sending of vblank
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
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5jIHwgOSAtLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fbWlwaV9kYmkuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kYmkuYwppbmRleCAx
NmJmZjFiZTRiOGEuLjEzYjc1M2NiM2Y2NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9taXBpX2RiaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kYmkuYwpAQCAtMjQs
NyArMjQsNiBAQAogI2luY2x1ZGUgPGRybS9kcm1fbW9kZXMuaD4KICNpbmNsdWRlIDxkcm0vZHJt
X3Byb2JlX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fcmVjdC5oPgotI2luY2x1ZGUgPGRy
bS9kcm1fdmJsYW5rLmg+CiAjaW5jbHVkZSA8dmlkZW8vbWlwaV9kaXNwbGF5Lmg+CiAKICNkZWZp
bmUgTUlQSV9EQklfTUFYX1NQSV9SRUFEX1NQRUVEIDIwMDAwMDAgLyogMk1IeiAqLwpAQCAtMjk5
LDE4ICsyOTgsMTAgQEAgdm9pZCBtaXBpX2RiaV9waXBlX3VwZGF0ZShzdHJ1Y3QgZHJtX3NpbXBs
ZV9kaXNwbGF5X3BpcGUgKnBpcGUsCiAJCQkgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm9sZF9z
dGF0ZSkKIHsKIAlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpzdGF0ZSA9IHBpcGUtPnBsYW5lLnN0
YXRlOwotCXN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9ICZwaXBlLT5jcnRjOwogCXN0cnVjdCBkcm1f
cmVjdCByZWN0OwogCiAJaWYgKGRybV9hdG9taWNfaGVscGVyX2RhbWFnZV9tZXJnZWQob2xkX3N0
YXRlLCBzdGF0ZSwgJnJlY3QpKQogCQltaXBpX2RiaV9mYl9kaXJ0eShzdGF0ZS0+ZmIsICZyZWN0
KTsKLQotCWlmIChjcnRjLT5zdGF0ZS0+ZXZlbnQpIHsKLQkJc3Bpbl9sb2NrX2lycSgmY3J0Yy0+
ZGV2LT5ldmVudF9sb2NrKTsKLQkJZHJtX2NydGNfc2VuZF92YmxhbmtfZXZlbnQoY3J0YywgY3J0
Yy0+c3RhdGUtPmV2ZW50KTsKLQkJc3Bpbl91bmxvY2tfaXJxKCZjcnRjLT5kZXYtPmV2ZW50X2xv
Y2spOwotCQljcnRjLT5zdGF0ZS0+ZXZlbnQgPSBOVUxMOwotCX0KIH0KIEVYUE9SVF9TWU1CT0wo
bWlwaV9kYmlfcGlwZV91cGRhdGUpOwogCi0tIAoyLjI0LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E522A146473
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 10:23:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuYg6-0005Xf-GD; Thu, 23 Jan 2020 09:21:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WyYo=3M=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iuYg4-0005Xa-UR
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 09:21:28 +0000
X-Inumbo-ID: bbc3cea8-3dc1-11ea-bdea-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bbc3cea8-3dc1-11ea-bdea-12813bfff9fa;
 Thu, 23 Jan 2020 09:21:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 52279B204;
 Thu, 23 Jan 2020 09:21:27 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Thu, 23 Jan 2020 10:21:12 +0100
Message-Id: <20200123092123.28368-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123092123.28368-1-tzimmermann@suse.de>
References: <20200123092123.28368-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 04/15] drm/bochs: Remove sending of vblank
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
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5jIHwgOSAtLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9ib2Nocy9ib2Noc19rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19rbXMu
YwppbmRleCAzZjAwMDZjMjQ3MGQuLmZmMjc1ZmFlZTg4ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2No
c19rbXMuYwpAQCAtNyw3ICs3LDYgQEAKICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIu
aD4KICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIuaD4KICNpbmNsdWRl
IDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgotI2luY2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+CiAK
ICNpbmNsdWRlICJib2Nocy5oIgogCkBAIC01NywxNiArNTYsOCBAQCBzdGF0aWMgdm9pZCBib2No
c19waXBlX3VwZGF0ZShzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsCiAJCQkg
ICAgICBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpvbGRfc3RhdGUpCiB7CiAJc3RydWN0IGJvY2hz
X2RldmljZSAqYm9jaHMgPSBwaXBlLT5jcnRjLmRldi0+ZGV2X3ByaXZhdGU7Ci0Jc3RydWN0IGRy
bV9jcnRjICpjcnRjID0gJnBpcGUtPmNydGM7CiAKIAlib2Noc19wbGFuZV91cGRhdGUoYm9jaHMs
IHBpcGUtPnBsYW5lLnN0YXRlKTsKLQotCWlmIChjcnRjLT5zdGF0ZS0+ZXZlbnQpIHsKLQkJc3Bp
bl9sb2NrX2lycSgmY3J0Yy0+ZGV2LT5ldmVudF9sb2NrKTsKLQkJZHJtX2NydGNfc2VuZF92Ymxh
bmtfZXZlbnQoY3J0YywgY3J0Yy0+c3RhdGUtPmV2ZW50KTsKLQkJY3J0Yy0+c3RhdGUtPmV2ZW50
ID0gTlVMTDsKLQkJc3Bpbl91bmxvY2tfaXJxKCZjcnRjLT5kZXYtPmV2ZW50X2xvY2spOwotCX0K
IH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZV9mdW5jcyBi
b2Noc19waXBlX2Z1bmNzID0gewotLSAKMi4yNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==

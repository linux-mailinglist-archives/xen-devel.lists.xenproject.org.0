Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B602D146474
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 10:23:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuYgX-0005pp-26; Thu, 23 Jan 2020 09:21:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WyYo=3M=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iuYgV-0005oy-T4
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 09:21:55 +0000
X-Inumbo-ID: bc6685bc-3dc1-11ea-b833-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc6685bc-3dc1-11ea-b833-bc764e2007e4;
 Thu, 23 Jan 2020 09:21:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C48B6B206;
 Thu, 23 Jan 2020 09:21:27 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Thu, 23 Jan 2020 10:21:13 +0100
Message-Id: <20200123092123.28368-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123092123.28368-1-tzimmermann@suse.de>
References: <20200123092123.28368-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 05/15] drm/cirrus: Remove sending of vblank
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
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJydXMuYyB8IDggLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9jaXJydXMvY2lycnVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jCmluZGV4
IDI0OGM5Zjc2NWM0NS4uYTkxZmIwZDcyODJjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
Y2lycnVzL2NpcnJ1cy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMKQEAg
LTM4LDcgKzM4LDYgQEAKICNpbmNsdWRlIDxkcm0vZHJtX21vZGVzZXRfaGVscGVyX3Z0YWJsZXMu
aD4KICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1f
c2ltcGxlX2ttc19oZWxwZXIuaD4KLSNpbmNsdWRlIDxkcm0vZHJtX3ZibGFuay5oPgogCiAjZGVm
aW5lIERSSVZFUl9OQU1FICJjaXJydXMiCiAjZGVmaW5lIERSSVZFUl9ERVNDICJxZW11IGNpcnJ1
cyB2Z2EiCkBAIC00MzQsMTMgKzQzMyw2IEBAIHN0YXRpYyB2b2lkIGNpcnJ1c19waXBlX3VwZGF0
ZShzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsCiAKIAlpZiAoZHJtX2F0b21p
Y19oZWxwZXJfZGFtYWdlX21lcmdlZChvbGRfc3RhdGUsIHN0YXRlLCAmcmVjdCkpCiAJCWNpcnJ1
c19mYl9ibGl0X3JlY3QocGlwZS0+cGxhbmUuc3RhdGUtPmZiLCAmcmVjdCk7Ci0KLQlpZiAoY3J0
Yy0+c3RhdGUtPmV2ZW50KSB7Ci0JCXNwaW5fbG9ja19pcnEoJmNydGMtPmRldi0+ZXZlbnRfbG9j
ayk7Ci0JCWRybV9jcnRjX3NlbmRfdmJsYW5rX2V2ZW50KGNydGMsIGNydGMtPnN0YXRlLT5ldmVu
dCk7Ci0JCWNydGMtPnN0YXRlLT5ldmVudCA9IE5VTEw7Ci0JCXNwaW5fdW5sb2NrX2lycSgmY3J0
Yy0+ZGV2LT5ldmVudF9sb2NrKTsKLQl9CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3Np
bXBsZV9kaXNwbGF5X3BpcGVfZnVuY3MgY2lycnVzX3BpcGVfZnVuY3MgPSB7Ci0tIAoyLjI0LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

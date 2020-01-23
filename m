Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE2C146475
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 10:23:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuYgQ-0005iu-7v; Thu, 23 Jan 2020 09:21:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WyYo=3M=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iuYgO-0005hv-Mz
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 09:21:48 +0000
X-Inumbo-ID: c0e4f06a-3dc1-11ea-bdea-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0e4f06a-3dc1-11ea-bdea-12813bfff9fa;
 Thu, 23 Jan 2020 09:21:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A6B82B253;
 Thu, 23 Jan 2020 09:21:31 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Thu, 23 Jan 2020 10:21:21 +0100
Message-Id: <20200123092123.28368-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123092123.28368-1-tzimmermann@suse.de>
References: <20200123092123.28368-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 13/15] drm/vboxvideo: Remove sending of
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
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X21vZGUuYyB8IDEyIC0tLS0t
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9tb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmJv
eHZpZGVvL3Zib3hfbW9kZS5jCmluZGV4IDE5NjEyMTMyYzhhMy4uOGI3ZjAwNWM0ZDIwIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfbW9kZS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9tb2RlLmMKQEAgLTE4LDcgKzE4LDYgQEAKICNpbmNs
dWRlIDxkcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJt
X3BsYW5lX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+Ci0jaW5j
bHVkZSA8ZHJtL2RybV92YmxhbmsuaD4KIAogI2luY2x1ZGUgImhnc21pX2NoYW5uZWxzLmgiCiAj
aW5jbHVkZSAidmJveF9kcnYuaCIKQEAgLTIyNiwxNyArMjI1LDYgQEAgc3RhdGljIHZvaWQgdmJv
eF9jcnRjX2F0b21pY19kaXNhYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIHN0YXRpYyB2b2lk
IHZib3hfY3J0Y19hdG9taWNfZmx1c2goc3RydWN0IGRybV9jcnRjICpjcnRjLAogCQkJCSAgIHN0
cnVjdCBkcm1fY3J0Y19zdGF0ZSAqb2xkX2NydGNfc3RhdGUpCiB7Ci0Jc3RydWN0IGRybV9wZW5k
aW5nX3ZibGFua19ldmVudCAqZXZlbnQ7Ci0JdW5zaWduZWQgbG9uZyBmbGFnczsKLQotCWlmIChj
cnRjLT5zdGF0ZSAmJiBjcnRjLT5zdGF0ZS0+ZXZlbnQpIHsKLQkJZXZlbnQgPSBjcnRjLT5zdGF0
ZS0+ZXZlbnQ7Ci0JCWNydGMtPnN0YXRlLT5ldmVudCA9IE5VTEw7Ci0KLQkJc3Bpbl9sb2NrX2ly
cXNhdmUoJmNydGMtPmRldi0+ZXZlbnRfbG9jaywgZmxhZ3MpOwotCQlkcm1fY3J0Y19zZW5kX3Zi
bGFua19ldmVudChjcnRjLCBldmVudCk7Ci0JCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmNydGMt
PmRldi0+ZXZlbnRfbG9jaywgZmxhZ3MpOwotCX0KIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBk
cm1fY3J0Y19oZWxwZXJfZnVuY3MgdmJveF9jcnRjX2hlbHBlcl9mdW5jcyA9IHsKLS0gCjIuMjQu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

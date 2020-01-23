Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC23146476
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 10:23:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuYgD-0005ZZ-5Y; Thu, 23 Jan 2020 09:21:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WyYo=3M=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iuYgB-0005Z6-VK
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 09:21:35 +0000
X-Inumbo-ID: bb467eee-3dc1-11ea-b833-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb467eee-3dc1-11ea-b833-bc764e2007e4;
 Thu, 23 Jan 2020 09:21:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 564A2B1FB;
 Thu, 23 Jan 2020 09:21:26 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Thu, 23 Jan 2020 10:21:10 +0100
Message-Id: <20200123092123.28368-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123092123.28368-1-tzimmermann@suse.de>
References: <20200123092123.28368-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 02/15] drm/arc: Remove sending of vblank event
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
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FyYy9hcmNwZ3VfY3J0Yy5jIHwgMTYgLS0tLS0tLS0t
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hcmMvYXJjcGd1X2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcmMvYXJj
cGd1X2NydGMuYwppbmRleCA4YWUxZTFmOTdhNzMuLmJlN2MyOWNlYzMxOCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FyYy9hcmNwZ3VfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
cmMvYXJjcGd1X2NydGMuYwpAQCAtOSw3ICs5LDYgQEAKICNpbmNsdWRlIDxkcm0vZHJtX2Rldmlj
ZS5oPgogI2luY2x1ZGUgPGRybS9kcm1fZmJfY21hX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9k
cm1fZ2VtX2NtYV9oZWxwZXIuaD4KLSNpbmNsdWRlIDxkcm0vZHJtX3ZibGFuay5oPgogI2luY2x1
ZGUgPGRybS9kcm1fcGxhbmVfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxw
ZXIuaD4KICNpbmNsdWRlIDxsaW51eC9jbGsuaD4KQEAgLTEzOCwyNCArMTM3LDkgQEAgc3RhdGlj
IHZvaWQgYXJjX3BndV9jcnRjX2F0b21pY19kaXNhYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywK
IAkJCSAgICAgIH5BUkNQR1VfQ1RSTF9FTkFCTEVfTUFTSyk7CiB9CiAKLXN0YXRpYyB2b2lkIGFy
Y19wZ3VfY3J0Y19hdG9taWNfYmVnaW4oc3RydWN0IGRybV9jcnRjICpjcnRjLAotCQkJCSAgICAg
IHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqc3RhdGUpCi17Ci0Jc3RydWN0IGRybV9wZW5kaW5nX3Zi
bGFua19ldmVudCAqZXZlbnQgPSBjcnRjLT5zdGF0ZS0+ZXZlbnQ7Ci0KLQlpZiAoZXZlbnQpIHsK
LQkJY3J0Yy0+c3RhdGUtPmV2ZW50ID0gTlVMTDsKLQotCQlzcGluX2xvY2tfaXJxKCZjcnRjLT5k
ZXYtPmV2ZW50X2xvY2spOwotCQlkcm1fY3J0Y19zZW5kX3ZibGFua19ldmVudChjcnRjLCBldmVu
dCk7Ci0JCXNwaW5fdW5sb2NrX2lycSgmY3J0Yy0+ZGV2LT5ldmVudF9sb2NrKTsKLQl9Ci19Ci0K
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2NydGNfaGVscGVyX2Z1bmNzIGFyY19wZ3VfY3J0Y19o
ZWxwZXJfZnVuY3MgPSB7CiAJLm1vZGVfdmFsaWQJPSBhcmNfcGd1X2NydGNfbW9kZV92YWxpZCwK
IAkubW9kZV9zZXRfbm9mYgk9IGFyY19wZ3VfY3J0Y19tb2RlX3NldF9ub2ZiLAotCS5hdG9taWNf
YmVnaW4JPSBhcmNfcGd1X2NydGNfYXRvbWljX2JlZ2luLAogCS5hdG9taWNfZW5hYmxlCT0gYXJj
X3BndV9jcnRjX2F0b21pY19lbmFibGUsCiAJLmF0b21pY19kaXNhYmxlCT0gYXJjX3BndV9jcnRj
X2F0b21pY19kaXNhYmxlLAogfTsKLS0gCjIuMjQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3040146482
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 10:24:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuYgw-0006F0-DB; Thu, 23 Jan 2020 09:22:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WyYo=3M=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iuYgu-0006Dz-Tb
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 09:22:20 +0000
X-Inumbo-ID: c0b4220a-3dc1-11ea-8e9a-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0b4220a-3dc1-11ea-8e9a-bc764e2007e4;
 Thu, 23 Jan 2020 09:21:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 268DFB254;
 Thu, 23 Jan 2020 09:21:32 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Thu, 23 Jan 2020 10:21:22 +0100
Message-Id: <20200123092123.28368-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123092123.28368-1-tzimmermann@suse.de>
References: <20200123092123.28368-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 14/15] drm/virtio: Remove sending of vblank
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
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rpc3BsYXkuYyB8IDggLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmly
dGlvL3ZpcnRncHVfZGlzcGxheS5jCmluZGV4IDA5NjYyMDhlYzMwZC4uZWNmNGJhN2NjMzJiIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZGlzcGxheS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kaXNwbGF5LmMKQEAgLTMwLDcgKzMwLDYg
QEAKICNpbmNsdWRlIDxkcm0vZHJtX2ZvdXJjYy5oPgogI2luY2x1ZGUgPGRybS9kcm1fZ2VtX2Zy
YW1lYnVmZmVyX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+Ci0j
aW5jbHVkZSA8ZHJtL2RybV92YmxhbmsuaD4KIAogI2luY2x1ZGUgInZpcnRncHVfZHJ2LmgiCiAK
QEAgLTEyMSwxMyArMTIwLDYgQEAgc3RhdGljIGludCB2aXJ0aW9fZ3B1X2NydGNfYXRvbWljX2No
ZWNrKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIHN0YXRpYyB2b2lkIHZpcnRpb19ncHVfY3J0Y19h
dG9taWNfZmx1c2goc3RydWN0IGRybV9jcnRjICpjcnRjLAogCQkJCQkgc3RydWN0IGRybV9jcnRj
X3N0YXRlICpvbGRfc3RhdGUpCiB7Ci0JdW5zaWduZWQgbG9uZyBmbGFnczsKLQotCXNwaW5fbG9j
a19pcnFzYXZlKCZjcnRjLT5kZXYtPmV2ZW50X2xvY2ssIGZsYWdzKTsKLQlpZiAoY3J0Yy0+c3Rh
dGUtPmV2ZW50KQotCQlkcm1fY3J0Y19zZW5kX3ZibGFua19ldmVudChjcnRjLCBjcnRjLT5zdGF0
ZS0+ZXZlbnQpOwotCWNydGMtPnN0YXRlLT5ldmVudCA9IE5VTEw7Ci0Jc3Bpbl91bmxvY2tfaXJx
cmVzdG9yZSgmY3J0Yy0+ZGV2LT5ldmVudF9sb2NrLCBmbGFncyk7CiB9CiAKIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZHJtX2NydGNfaGVscGVyX2Z1bmNzIHZpcnRpb19ncHVfY3J0Y19oZWxwZXJfZnVu
Y3MgPSB7Ci0tIAoyLjI0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs

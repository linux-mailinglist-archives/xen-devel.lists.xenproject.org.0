Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F740146481
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 10:24:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuYgr-0006Ad-To; Thu, 23 Jan 2020 09:22:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WyYo=3M=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iuYgp-00069H-UZ
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 09:22:15 +0000
X-Inumbo-ID: be165810-3dc1-11ea-b833-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be165810-3dc1-11ea-b833-bc764e2007e4;
 Thu, 23 Jan 2020 09:21:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2E471B221;
 Thu, 23 Jan 2020 09:21:31 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Thu, 23 Jan 2020 10:21:20 +0100
Message-Id: <20200123092123.28368-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123092123.28368-1-tzimmermann@suse.de>
References: <20200123092123.28368-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 12/15] drm/udl: Don't set struct
 drm_crtc_state.no_vblank explictly
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

QXMgdWRsIGRvZXMgbm90IGluaXRpYWxpemUgdmJsYW5raW5nLCBhdG9taWMgaGVscGVycyBpbml0
aWFsaXplIHRoZQp2YWx1ZSBvZiBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUubm9fdmJsYW5rIHRvIGJl
IHRydWUuIE5vIG5lZWQgdG8gc2V0Cml0IGZyb20gd2l0aGluIHRoZSBkcml2ZXIuCgpTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQWNrZWQtYnk6
IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS91
ZGwvdWRsX21vZGVzZXQuYyB8IDExIC0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5j
IGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jCmluZGV4IDIyYWYxNzk1OTA1My4u
ZDU5ZWJhYzcwYjE1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jCkBAIC0zNzUsOCArMzc1
LDYgQEAgdWRsX3NpbXBsZV9kaXNwbGF5X3BpcGVfZW5hYmxlKHN0cnVjdCBkcm1fc2ltcGxlX2Rp
c3BsYXlfcGlwZSAqcGlwZSwKIAljaGFyICp3cnB0cjsKIAlpbnQgY29sb3JfZGVwdGggPSBVRExf
Q09MT1JfREVQVEhfMTZCUFA7CiAKLQljcnRjX3N0YXRlLT5ub192YmxhbmsgPSB0cnVlOwotCiAJ
YnVmID0gKGNoYXIgKil1ZGwtPm1vZGVfYnVmOwogCiAJLyogVGhpcyBmaXJzdCBzZWN0aW9uIGhh
cyB0byBkbyB3aXRoIHNldHRpbmcgdGhlIGJhc2UgYWRkcmVzcyBvbiB0aGUKQEAgLTQyOCwxNCAr
NDI2LDYgQEAgdWRsX3NpbXBsZV9kaXNwbGF5X3BpcGVfZGlzYWJsZShzdHJ1Y3QgZHJtX3NpbXBs
ZV9kaXNwbGF5X3BpcGUgKnBpcGUpCiAJdWRsX3N1Ym1pdF91cmIoZGV2LCB1cmIsIGJ1ZiAtIChj
aGFyICopdXJiLT50cmFuc2Zlcl9idWZmZXIpOwogfQogCi1zdGF0aWMgaW50Ci11ZGxfc2ltcGxl
X2Rpc3BsYXlfcGlwZV9jaGVjayhzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUs
Ci0JCQkgICAgICBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZSwKLQkJCSAgICAg
IHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSkKLXsKLQlyZXR1cm4gMDsKLX0KLQog
c3RhdGljIHZvaWQKIHVkbF9zaW1wbGVfZGlzcGxheV9waXBlX3VwZGF0ZShzdHJ1Y3QgZHJtX3Np
bXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsCiAJCQkgICAgICAgc3RydWN0IGRybV9wbGFuZV9zdGF0
ZSAqb2xkX3BsYW5lX3N0YXRlKQpAQCAtNDU3LDcgKzQ0Nyw2IEBAIHN0cnVjdCBkcm1fc2ltcGxl
X2Rpc3BsYXlfcGlwZV9mdW5jcyB1ZGxfc2ltcGxlX2Rpc3BsYXlfcGlwZV9mdW5jcyA9IHsKIAku
bW9kZV92YWxpZCA9IHVkbF9zaW1wbGVfZGlzcGxheV9waXBlX21vZGVfdmFsaWQsCiAJLmVuYWJs
ZSA9IHVkbF9zaW1wbGVfZGlzcGxheV9waXBlX2VuYWJsZSwKIAkuZGlzYWJsZSA9IHVkbF9zaW1w
bGVfZGlzcGxheV9waXBlX2Rpc2FibGUsCi0JLmNoZWNrID0gdWRsX3NpbXBsZV9kaXNwbGF5X3Bp
cGVfY2hlY2ssCiAJLnVwZGF0ZSA9IHVkbF9zaW1wbGVfZGlzcGxheV9waXBlX3VwZGF0ZSwKIAku
cHJlcGFyZV9mYiA9IGRybV9nZW1fZmJfc2ltcGxlX2Rpc3BsYXlfcGlwZV9wcmVwYXJlX2ZiLAog
fTsKLS0gCjIuMjQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CEB146488
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 10:24:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuYh1-0006Jv-NT; Thu, 23 Jan 2020 09:22:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WyYo=3M=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iuYgz-0006Ib-U8
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 09:22:25 +0000
X-Inumbo-ID: c0b5f8aa-3dc1-11ea-8e9a-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0b5f8aa-3dc1-11ea-8e9a-bc764e2007e4;
 Thu, 23 Jan 2020 09:21:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9CF6DB257;
 Thu, 23 Jan 2020 09:21:32 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Thu, 23 Jan 2020 10:21:23 +0100
Message-Id: <20200123092123.28368-16-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123092123.28368-1-tzimmermann@suse.de>
References: <20200123092123.28368-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 15/15] drm/xen: Explicitly disable automatic
 sending of vblank event
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
bnRzIGlmIG5vCnZibGFua2luZyBoYXMgYmVlbiBpbml0aWFsaXplZC4gVGhpcyB3b3VsZCBhcHBs
eSB0byB4ZW4sIGJ1dCB4ZW4gaGFzCml0cyBvd24gdmJsYW5rIGxvZ2ljLiBUbyBhdm9pZCBpbnRl
cmZlcmluZyB3aXRoIHRoZSBhdG9taWMgaGVscGVycywKZGlzYWJsZSBhdXRvbWF0aWMgdmJsYW5r
IGV2ZW50cyBleHBsaWN0bHkuCgp2NDoKCSogc2VwYXJhdGUgY29tbWl0IGZyb20gY29yZSB2Ymxh
bmsgY2hhbmdlcwoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+CkFja2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfa21zLmMgfCAxMyArKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4v
eGVuX2RybV9mcm9udF9rbXMuYwppbmRleCA0ZjM0YzUyMDgxODAuLmVmZGU0NTYxODM2ZiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYwpAQCAtMjIwLDYgKzIyMCwxOCBA
QCBzdGF0aWMgYm9vbCBkaXNwbGF5X3NlbmRfcGFnZV9mbGlwKHN0cnVjdCBkcm1fc2ltcGxlX2Rp
c3BsYXlfcGlwZSAqcGlwZSwKIAlyZXR1cm4gZmFsc2U7CiB9CiAKK3N0YXRpYyBpbnQgZGlzcGxh
eV9jaGVjayhzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsCisJCQkgc3RydWN0
IGRybV9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUsCisJCQkgc3RydWN0IGRybV9jcnRjX3N0YXRl
ICpjcnRjX3N0YXRlKQoreworCS8qIE1ha2Ugc3VyZSB0aGF0IERSTSBoZWxwZXJzIGRvbid0IHNl
bmQgVkJMQU5LIGV2ZW50cworCSAqIGF1dG9tYXRpY2FsbHkuIFhlbiBoYXMgaXQncyBvd24gbG9n
aWMgdG8gZG8gc28uCisJICovCisJY3J0Y19zdGF0ZS0+bm9fdmJsYW5rID0gZmFsc2U7CisKKwly
ZXR1cm4gMDsKK30KKwogc3RhdGljIHZvaWQgZGlzcGxheV91cGRhdGUoc3RydWN0IGRybV9zaW1w
bGVfZGlzcGxheV9waXBlICpwaXBlLAogCQkJICAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqb2xk
X3BsYW5lX3N0YXRlKQogewpAQCAtMjg0LDYgKzI5Niw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGVfZnVuY3MgZGlzcGxheV9mdW5jcyA9IHsKIAkuZW5hYmxl
ID0gZGlzcGxheV9lbmFibGUsCiAJLmRpc2FibGUgPSBkaXNwbGF5X2Rpc2FibGUsCiAJLnByZXBh
cmVfZmIgPSBkcm1fZ2VtX2ZiX3NpbXBsZV9kaXNwbGF5X3BpcGVfcHJlcGFyZV9mYiwKKwkuY2hl
Y2sgPSBkaXNwbGF5X2NoZWNrLAogCS51cGRhdGUgPSBkaXNwbGF5X3VwZGF0ZSwKIH07CiAKLS0g
CjIuMjQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

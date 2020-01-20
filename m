Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEE7142A8A
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 13:24:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itW3H-0001BA-Uz; Mon, 20 Jan 2020 12:21:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nhcu=3J=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1itW3F-0001Aw-Q8
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 12:21:05 +0000
X-Inumbo-ID: 4effbb73-3b7f-11ea-b95e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4effbb73-3b7f-11ea-b95e-12813bfff9fa;
 Mon, 20 Jan 2020 12:20:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BEAB6AD46;
 Mon, 20 Jan 2020 12:20:54 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Mon, 20 Jan 2020 13:20:48 +0100
Message-Id: <20200120122051.25178-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200120122051.25178-1-tzimmermann@suse.de>
References: <20200120122051.25178-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 1/4] drm: Add drm_crtc_has_vblank()
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

VGhlIG5ldyBpbnRlcmZhY2UgZHJtX2NydGNfaGFzX3ZibGFuaygpIHJldHVybiB0cnVlIGlmIHZi
bGFua2luZyBoYXMKYmVlbiBpbml0aWFsaXplZCBmb3IgYSBjZXJ0YWluIENSVEMsIG9yIGZhbHNl
IG90aGVyd2lzZS4gVGhpcyBmdW5jdGlvbgp3aWxsIGJlIHVzZWZ1bCBmb3IgaW5pdGlhbGl6aW5n
IENSVEMgc3RhdGUuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jIHwgMjEgKysrKysr
KysrKysrKysrKysrKysrCiBpbmNsdWRlL2RybS9kcm1fdmJsYW5rLmggICAgIHwgIDEgKwogMiBm
aWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV92YmxhbmsuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKaW5kZXggMTY1
OWIxM2IxNzhjLi5jMjAxMDI4OTk0MTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
dmJsYW5rLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwpAQCAtNTAxLDYgKzUw
MSwyNyBAQCBpbnQgZHJtX3ZibGFua19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2ln
bmVkIGludCBudW1fY3J0Y3MpCiB9CiBFWFBPUlRfU1lNQk9MKGRybV92YmxhbmtfaW5pdCk7CiAK
Ky8qKgorICogZHJtX2NydGNfaGFzX3ZibGFuayAtIHRlc3QgaWYgdmJsYW5raW5nIGhhcyBiZWVu
IGluaXRpYWxpemVkIGZvcgorICogICAgICAgICAgICAgICAgICAgICAgIGEgQ1JUQworICogQGNy
dGM6IHRoZSBDUlRDCisgKgorICogRHJpdmVycyBtYXkgY2FsbCB0aGlzIGZ1bmN0aW9uIHRvIHRl
c3QgaWYgdmJsYW5rIHN1cHBvcnQgaXMKKyAqIGluaXRpYWxpemVkIGZvciBhIENSVEMuIEZvciBt
b3N0IGhhcmR3YXJlIHRoaXMgbWVhbnMgdGhhdCB2YmxhbmtpbmcKKyAqIGNhbiBhbHNvIGJlIGVu
YWJsZWQgb24gdGhlIENSVEMuCisgKgorICogUmV0dXJuczoKKyAqIFRydWUgaWYgdmJsYW5raW5n
IGhhcyBiZWVuIGluaXRpYWxpemVkIGZvciB0aGUgZ2l2ZW4gQ1JUQywgZmFsc2UKKyAqIG90aGVy
d2lzZS4KKyAqLworYm9vbCBkcm1fY3J0Y19oYXNfdmJsYW5rKGNvbnN0IHN0cnVjdCBkcm1fY3J0
YyAqY3J0YykKK3sKKwlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gY3J0Yy0+ZGV2OworCisJcmV0
dXJuIGNydGMtPmluZGV4IDwgZGV2LT5udW1fY3J0Y3M7Cit9CitFWFBPUlRfU1lNQk9MKGRybV9j
cnRjX2hhc192YmxhbmspOworCiAvKioKICAqIGRybV9jcnRjX3ZibGFua193YWl0cXVldWUgLSBn
ZXQgdmJsYW5rIHdhaXRxdWV1ZSBmb3IgdGhlIENSVEMKICAqIEBjcnRjOiB3aGljaCBDUlRDJ3Mg
dmJsYW5rIHdhaXRxdWV1ZSB0byByZXRyaWV2ZQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJt
X3ZibGFuay5oIGIvaW5jbHVkZS9kcm0vZHJtX3ZibGFuay5oCmluZGV4IGMxNmM0NDA1MmIzZC4u
NTMxYTZiYzEyYjdlIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fdmJsYW5rLmgKKysrIGIv
aW5jbHVkZS9kcm0vZHJtX3ZibGFuay5oCkBAIC0yMDYsNiArMjA2LDcgQEAgc3RydWN0IGRybV92
YmxhbmtfY3J0YyB7CiB9OwogCiBpbnQgZHJtX3ZibGFua19pbml0KHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsIHVuc2lnbmVkIGludCBudW1fY3J0Y3MpOworYm9vbCBkcm1fY3J0Y19oYXNfdmJsYW5r
KGNvbnN0IHN0cnVjdCBkcm1fY3J0YyAqY3J0Yyk7CiB1NjQgZHJtX2NydGNfdmJsYW5rX2NvdW50
KHN0cnVjdCBkcm1fY3J0YyAqY3J0Yyk7CiB1NjQgZHJtX2NydGNfdmJsYW5rX2NvdW50X2FuZF90
aW1lKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAkJCQkgICBrdGltZV90ICp2Ymxhbmt0aW1lKTsK
LS0gCjIuMjQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

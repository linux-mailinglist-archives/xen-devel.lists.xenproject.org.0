Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 816E114CA58
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 13:08:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwm6j-0005sG-Cj; Wed, 29 Jan 2020 12:06:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mEHh=3S=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iwm6h-0005qG-4j
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 12:06:07 +0000
X-Inumbo-ID: aab5bbb2-428f-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aab5bbb2-428f-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 12:05:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AC3C5B1C8;
 Wed, 29 Jan 2020 12:05:39 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Wed, 29 Jan 2020 13:05:28 +0100
Message-Id: <20200129120531.6891-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129120531.6891-1-tzimmermann@suse.de>
References: <20200129120531.6891-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 12/15] drm/udl: Don't set struct
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, xen-devel@lists.xenproject.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXMgdWRsIGRvZXMgbm90IGluaXRpYWxpemUgdmJsYW5raW5nLCBhdG9taWMgaGVscGVycyBpbml0
aWFsaXplIHRoZQp2YWx1ZSBvZiBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUubm9fdmJsYW5rIHRvIGJl
IHRydWUuIE5vIG5lZWQgdG8gc2V0Cml0IGZyb20gd2l0aGluIHRoZSBkcml2ZXIuCgpTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQWNrZWQtYnk6
IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdWRsL3Vk
bF9tb2Rlc2V0LmMgfCAxMSAtLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21vZGVzZXQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS91ZGwvdWRsX21vZGVzZXQuYwppbmRleCAyMmFmMTc5NTkwNTMuLmQ1OWVi
YWM3MGIxNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21vZGVzZXQuYwpAQCAtMzc1LDggKzM3NSw2IEBA
IHVkbF9zaW1wbGVfZGlzcGxheV9waXBlX2VuYWJsZShzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5
X3BpcGUgKnBpcGUsCiAJY2hhciAqd3JwdHI7CiAJaW50IGNvbG9yX2RlcHRoID0gVURMX0NPTE9S
X0RFUFRIXzE2QlBQOwogCi0JY3J0Y19zdGF0ZS0+bm9fdmJsYW5rID0gdHJ1ZTsKLQogCWJ1ZiA9
IChjaGFyICopdWRsLT5tb2RlX2J1ZjsKIAogCS8qIFRoaXMgZmlyc3Qgc2VjdGlvbiBoYXMgdG8g
ZG8gd2l0aCBzZXR0aW5nIHRoZSBiYXNlIGFkZHJlc3Mgb24gdGhlCkBAIC00MjgsMTQgKzQyNiw2
IEBAIHVkbF9zaW1wbGVfZGlzcGxheV9waXBlX2Rpc2FibGUoc3RydWN0IGRybV9zaW1wbGVfZGlz
cGxheV9waXBlICpwaXBlKQogCXVkbF9zdWJtaXRfdXJiKGRldiwgdXJiLCBidWYgLSAoY2hhciAq
KXVyYi0+dHJhbnNmZXJfYnVmZmVyKTsKIH0KIAotc3RhdGljIGludAotdWRsX3NpbXBsZV9kaXNw
bGF5X3BpcGVfY2hlY2soc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlLAotCQkJ
ICAgICAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUsCi0JCQkgICAgICBzdHJ1
Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpCi17Ci0JcmV0dXJuIDA7Ci19Ci0KIHN0YXRp
YyB2b2lkCiB1ZGxfc2ltcGxlX2Rpc3BsYXlfcGlwZV91cGRhdGUoc3RydWN0IGRybV9zaW1wbGVf
ZGlzcGxheV9waXBlICpwaXBlLAogCQkJICAgICAgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm9s
ZF9wbGFuZV9zdGF0ZSkKQEAgLTQ1Nyw3ICs0NDcsNiBAQCBzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNw
bGF5X3BpcGVfZnVuY3MgdWRsX3NpbXBsZV9kaXNwbGF5X3BpcGVfZnVuY3MgPSB7CiAJLm1vZGVf
dmFsaWQgPSB1ZGxfc2ltcGxlX2Rpc3BsYXlfcGlwZV9tb2RlX3ZhbGlkLAogCS5lbmFibGUgPSB1
ZGxfc2ltcGxlX2Rpc3BsYXlfcGlwZV9lbmFibGUsCiAJLmRpc2FibGUgPSB1ZGxfc2ltcGxlX2Rp
c3BsYXlfcGlwZV9kaXNhYmxlLAotCS5jaGVjayA9IHVkbF9zaW1wbGVfZGlzcGxheV9waXBlX2No
ZWNrLAogCS51cGRhdGUgPSB1ZGxfc2ltcGxlX2Rpc3BsYXlfcGlwZV91cGRhdGUsCiAJLnByZXBh
cmVfZmIgPSBkcm1fZ2VtX2ZiX3NpbXBsZV9kaXNwbGF5X3BpcGVfcHJlcGFyZV9mYiwKIH07Ci0t
IAoyLjI1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

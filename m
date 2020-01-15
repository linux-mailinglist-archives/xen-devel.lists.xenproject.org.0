Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E97613C20C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 13:56:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iriA9-00014G-SF; Wed, 15 Jan 2020 12:52:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NEZB=3E=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iriA8-00014B-Ho
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 12:52:44 +0000
X-Inumbo-ID: e70e874c-3795-11ea-a985-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e70e874c-3795-11ea-a985-bc764e2007e4;
 Wed, 15 Jan 2020 12:52:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 91269AFFE;
 Wed, 15 Jan 2020 12:52:34 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Wed, 15 Jan 2020 13:52:25 +0100
Message-Id: <20200115125226.13843-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200115125226.13843-1-tzimmermann@suse.de>
References: <20200115125226.13843-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 3/4] drm/cirrus: Let DRM core send VBLANK
 events
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

SW4gZHJtX2F0b21pY19oZWxwZXJfZmFrZV92YmxhbmsoKSwgdGhlIERSTSBjb3JlIHNlbmRzIG91
dCBWQkxBTksKZXZlbnRzIGlmIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZS5ub192YmxhbmsgaXMgZW5h
YmxlZC4gUmVwbGFjZSBjaXJydXMnClZCTEFOSyBldmVudHMgd2l0aCB0aGUgRFJNIGNvcmUncyBm
dW5jdGlvbmFsaXR5LgoKdjI6CgkqIHNldCBzdHJ1Y3RfZHJtX2NydGNfc3RhdGUubm9fdmJsYW5r
IGluIGNpcnJ1c19waXBlX2NoZWNrKCkKClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVz
LmMgfCAxMCArKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jCmluZGV4IDI0OGM5Zjc2NWM0NS4uNWZm
MTVlOGEyYTBhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMKQEAgLTM4LDcgKzM4LDYgQEAKICNp
bmNsdWRlIDxkcm0vZHJtX21vZGVzZXRfaGVscGVyX3Z0YWJsZXMuaD4KICNpbmNsdWRlIDxkcm0v
ZHJtX3Byb2JlX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIu
aD4KLSNpbmNsdWRlIDxkcm0vZHJtX3ZibGFuay5oPgogCiAjZGVmaW5lIERSSVZFUl9OQU1FICJj
aXJydXMiCiAjZGVmaW5lIERSSVZFUl9ERVNDICJxZW11IGNpcnJ1cyB2Z2EiCkBAIC00MDQsNiAr
NDAzLDggQEAgc3RhdGljIGludCBjaXJydXNfcGlwZV9jaGVjayhzdHJ1Y3QgZHJtX3NpbXBsZV9k
aXNwbGF5X3BpcGUgKnBpcGUsCiB7CiAJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSBwbGFu
ZV9zdGF0ZS0+ZmI7CiAKKwljcnRjX3N0YXRlLT5ub192YmxhbmsgPSB0cnVlOworCiAJaWYgKCFm
YikKIAkJcmV0dXJuIDA7CiAJcmV0dXJuIGNpcnJ1c19jaGVja19zaXplKGZiLT53aWR0aCwgZmIt
PmhlaWdodCwgZmIpOwpAQCAtNDM0LDEzICs0MzUsNiBAQCBzdGF0aWMgdm9pZCBjaXJydXNfcGlw
ZV91cGRhdGUoc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlLAogCiAJaWYgKGRy
bV9hdG9taWNfaGVscGVyX2RhbWFnZV9tZXJnZWQob2xkX3N0YXRlLCBzdGF0ZSwgJnJlY3QpKQog
CQljaXJydXNfZmJfYmxpdF9yZWN0KHBpcGUtPnBsYW5lLnN0YXRlLT5mYiwgJnJlY3QpOwotCi0J
aWYgKGNydGMtPnN0YXRlLT5ldmVudCkgewotCQlzcGluX2xvY2tfaXJxKCZjcnRjLT5kZXYtPmV2
ZW50X2xvY2spOwotCQlkcm1fY3J0Y19zZW5kX3ZibGFua19ldmVudChjcnRjLCBjcnRjLT5zdGF0
ZS0+ZXZlbnQpOwotCQljcnRjLT5zdGF0ZS0+ZXZlbnQgPSBOVUxMOwotCQlzcGluX3VubG9ja19p
cnEoJmNydGMtPmRldi0+ZXZlbnRfbG9jayk7Ci0JfQogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0
IGRybV9zaW1wbGVfZGlzcGxheV9waXBlX2Z1bmNzIGNpcnJ1c19waXBlX2Z1bmNzID0gewotLSAK
Mi4yNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

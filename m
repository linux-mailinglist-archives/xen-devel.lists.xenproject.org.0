Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E90914CA51
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 13:07:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwm6F-0005ZO-99; Wed, 29 Jan 2020 12:05:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mEHh=3S=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iwm6D-0005Z8-8H
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 12:05:37 +0000
X-Inumbo-ID: a8404d84-428f-11ea-889e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8404d84-428f-11ea-889e-12813bfff9fa;
 Wed, 29 Jan 2020 12:05:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1FCC5AFCF;
 Wed, 29 Jan 2020 12:05:35 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Wed, 29 Jan 2020 13:05:19 +0100
Message-Id: <20200129120531.6891-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129120531.6891-1-tzimmermann@suse.de>
References: <20200129120531.6891-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 03/15] drm/ast: Don't set struct
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

QXMgYXN0IGRvZXMgbm90IGluaXRpYWxpemUgdmJsYW5raW5nLCBhdG9taWMgaGVscGVycyBpbml0
aWFsaXplIHRoZQp2YWx1ZSBvZiBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUubm9fdmJsYW5rIHRvIGJl
IHRydWUuIE5vIG5lZWQgdG8gc2V0Cml0IGZyb20gd2l0aGluIHRoZSBkcml2ZXIuCgpTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQWNrZWQtYnk6
IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXN0L2Fz
dF9tb2RlLmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9tb2RlLmMKaW5kZXggMzQ2MDhmMDQ5OWViLi43ODEwYTg0ZTdlOWUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9tb2RlLmMKQEAgLTgzMyw4ICs4MzMsNiBAQCBzdGF0aWMgdm9pZCBhc3RfY3J0Y19oZWxw
ZXJfYXRvbWljX2ZsdXNoKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAlzdHJ1Y3QgYXN0X3ZiaW9z
X21vZGVfaW5mbyAqdmJpb3NfbW9kZV9pbmZvOwogCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICph
ZGp1c3RlZF9tb2RlOwogCi0JY3J0Yy0+c3RhdGUtPm5vX3ZibGFuayA9IHRydWU7Ci0KIAlhc3Rf
c3RhdGUgPSB0b19hc3RfY3J0Y19zdGF0ZShjcnRjLT5zdGF0ZSk7CiAKIAlmb3JtYXQgPSBhc3Rf
c3RhdGUtPmZvcm1hdDsKLS0gCjIuMjUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=

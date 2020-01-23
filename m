Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7BD146478
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 10:23:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuYgR-0005kM-KJ; Thu, 23 Jan 2020 09:21:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WyYo=3M=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iuYgQ-0005jt-SS
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 09:21:50 +0000
X-Inumbo-ID: bb7dcd22-3dc1-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb7dcd22-3dc1-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 09:21:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D3591B201;
 Thu, 23 Jan 2020 09:21:26 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Thu, 23 Jan 2020 10:21:11 +0100
Message-Id: <20200123092123.28368-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123092123.28368-1-tzimmermann@suse.de>
References: <20200123092123.28368-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 03/15] drm/ast: Don't set struct
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

QXMgYXN0IGRvZXMgbm90IGluaXRpYWxpemUgdmJsYW5raW5nLCBhdG9taWMgaGVscGVycyBpbml0
aWFsaXplIHRoZQp2YWx1ZSBvZiBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUubm9fdmJsYW5rIHRvIGJl
IHRydWUuIE5vIG5lZWQgdG8gc2V0Cml0IGZyb20gd2l0aGluIHRoZSBkcml2ZXIuCgpTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQWNrZWQtYnk6
IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
c3QvYXN0X21vZGUuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hc3QvYXN0X21vZGUuYwppbmRleCAzNDYwOGYwNDk5ZWIuLjc4MTBhODRlN2U5ZSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hc3QvYXN0X21vZGUuYwpAQCAtODMzLDggKzgzMyw2IEBAIHN0YXRpYyB2b2lkIGFzdF9jcnRj
X2hlbHBlcl9hdG9taWNfZmx1c2goc3RydWN0IGRybV9jcnRjICpjcnRjLAogCXN0cnVjdCBhc3Rf
dmJpb3NfbW9kZV9pbmZvICp2Ymlvc19tb2RlX2luZm87CiAJc3RydWN0IGRybV9kaXNwbGF5X21v
ZGUgKmFkanVzdGVkX21vZGU7CiAKLQljcnRjLT5zdGF0ZS0+bm9fdmJsYW5rID0gdHJ1ZTsKLQog
CWFzdF9zdGF0ZSA9IHRvX2FzdF9jcnRjX3N0YXRlKGNydGMtPnN0YXRlKTsKIAogCWZvcm1hdCA9
IGFzdF9zdGF0ZS0+Zm9ybWF0OwotLSAKMi4yNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==

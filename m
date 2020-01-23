Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F4225146470
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 10:23:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuYgK-0005e1-Cu; Thu, 23 Jan 2020 09:21:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WyYo=3M=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iuYgJ-0005dZ-Mv
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 09:21:43 +0000
X-Inumbo-ID: bd873e32-3dc1-11ea-bdea-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd873e32-3dc1-11ea-bdea-12813bfff9fa;
 Thu, 23 Jan 2020 09:21:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AF965B21C;
 Thu, 23 Jan 2020 09:21:29 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Thu, 23 Jan 2020 10:21:17 +0100
Message-Id: <20200123092123.28368-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123092123.28368-1-tzimmermann@suse.de>
References: <20200123092123.28368-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 09/15] drm/qxl: Remove sending of vblank event
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
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZGlzcGxheS5jIHwgMTQgLS0tLS0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcXhsL3F4bF9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9k
aXNwbGF5LmMKaW5kZXggMTZkNzNiMjJmM2Y1Li5hYjRmOGRkMDA0MDAgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rpc3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcXhs
L3F4bF9kaXNwbGF5LmMKQEAgLTMxLDcgKzMxLDYgQEAKICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9m
cmFtZWJ1ZmZlcl9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3BsYW5lX2hlbHBlci5oPgog
I2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+Ci0jaW5jbHVkZSA8ZHJtL2RybV92Ymxh
bmsuaD4KIAogI2luY2x1ZGUgInF4bF9kcnYuaCIKICNpbmNsdWRlICJxeGxfb2JqZWN0LmgiCkBA
IC0zNzIsMTkgKzM3MSw2IEBAIHN0YXRpYyB2b2lkIHF4bF9jcnRjX3VwZGF0ZV9tb25pdG9yc19j
b25maWcoc3RydWN0IGRybV9jcnRjICpjcnRjLAogc3RhdGljIHZvaWQgcXhsX2NydGNfYXRvbWlj
X2ZsdXNoKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAkJCQkgIHN0cnVjdCBkcm1fY3J0Y19zdGF0
ZSAqb2xkX2NydGNfc3RhdGUpCiB7Ci0Jc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGNydGMtPmRl
djsKLQlzdHJ1Y3QgZHJtX3BlbmRpbmdfdmJsYW5rX2V2ZW50ICpldmVudDsKLQl1bnNpZ25lZCBs
b25nIGZsYWdzOwotCi0JaWYgKGNydGMtPnN0YXRlICYmIGNydGMtPnN0YXRlLT5ldmVudCkgewot
CQlldmVudCA9IGNydGMtPnN0YXRlLT5ldmVudDsKLQkJY3J0Yy0+c3RhdGUtPmV2ZW50ID0gTlVM
TDsKLQotCQlzcGluX2xvY2tfaXJxc2F2ZSgmZGV2LT5ldmVudF9sb2NrLCBmbGFncyk7Ci0JCWRy
bV9jcnRjX3NlbmRfdmJsYW5rX2V2ZW50KGNydGMsIGV2ZW50KTsKLQkJc3Bpbl91bmxvY2tfaXJx
cmVzdG9yZSgmZGV2LT5ldmVudF9sb2NrLCBmbGFncyk7Ci0JfQotCiAJcXhsX2NydGNfdXBkYXRl
X21vbml0b3JzX2NvbmZpZyhjcnRjLCAiZmx1c2giKTsKIH0KIAotLSAKMi4yNC4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

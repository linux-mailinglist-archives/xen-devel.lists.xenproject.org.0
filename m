Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC5323462E
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:51:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1UVR-0001LN-3F; Fri, 31 Jul 2020 12:51:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YcXq=BK=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1k1UVP-0001HZ-IN
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:51:23 +0000
X-Inumbo-ID: 85a1fed4-d32c-11ea-8e30-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85a1fed4-d32c-11ea-8e30-bc764e2007e4;
 Fri, 31 Jul 2020 12:51:16 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id w14so2461070ljj.4
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2020 05:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hf2m1CaACgkl3i0FS0MjmjyDubimZdTD8G//CB5QIMY=;
 b=WpFdItwLmE1h/jcPKXj3mRmyaF+TKN3FWkbAvN9i01/b/GBnQQrfqTYPD3KkCl+HER
 4a3yBnoP8xZ1+beeiIJ9vfMIpoL/Uq0aKjRgj9n3gDAB35PWSD+52cvI8qsbw9MMxnde
 Ogk+jE2mX/g7LFVkGpGWoSr7sD8Yog+cmIHDyOr5lEBZFzgPS2kU4Fuv8LCiEtAMJi4Y
 V/MPagzOAVhsCHI/ruYoFU5NgrrL0yQ5Bln8moUVlTyOMw3rTQ7cCkra3lYcATWDogf/
 jBRFwFf8eSKHB5WoChdB5jL9GonvtcReyID4iSV0w2pPa3lh5NAPcP/9Jan5UaU8YB8u
 zvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hf2m1CaACgkl3i0FS0MjmjyDubimZdTD8G//CB5QIMY=;
 b=RJZCsqxpB8QfWIPrCYKglcsmcc1xPHjmXRfzyP/iUY3y1jf8roz+bnPSwk6Sdd/Lyc
 aAe4+GaKQjHmkkIySG1ksaaptDbuUdGR3KUb5QOHU3XDHtU6xx4bLMfoo6OVHYOmkbD6
 GTxSsCznE2QB8ZEwhKxwnPUd/lUix0XcpMgXD2Q6zimusCOCiSXwCWNlDA+90uLTbHXR
 V+IlSYzGY7Bh9mzSKWyAItReYx/7J10Ou3TBWeICmFh0V2nLiqCHfRmOOqvJO5J0k4/O
 VQHcTD0b3ucIoL2og30CwIhOo+/qDAIxxSK/Eq3SIJQgNIfKmnE/P7aNZgQ6/5C+sJHa
 Wduw==
X-Gm-Message-State: AOAM533zcSdaJZqFa8ZBPpTF1z1MvMH7wxKZAeR1jfrlKU7tCjIuTd45
 1+juv/Kzql2JIqWfdXJCo1OlgSJy5pA=
X-Google-Smtp-Source: ABdhPJyAr3EgNy6m0bxN5SP4DJ54ompCgY6CBLlI16M8yY4FlCVLhiNPKf3qPH+txZ2PmAgUTW2prA==
X-Received: by 2002:a2e:9e43:: with SMTP id g3mr1932560ljk.309.1596199875447; 
 Fri, 31 Jul 2020 05:51:15 -0700 (PDT)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id s2sm1923362lfs.4.2020.07.31.05.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 05:51:14 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 2/6] drm/xen-front: Fix misused IS_ERR_OR_NULL checks
Date: Fri, 31 Jul 2020 15:51:05 +0300
Message-Id: <20200731125109.18666-3-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731125109.18666-1-andr2000@gmail.com>
References: <20200731125109.18666-1-andr2000@gmail.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, sstabellini@kernel.org,
 dan.carpenter@oracle.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

The patch c575b7eeb89f: "drm/xen-front: Add support for Xen PV
display frontend" from Apr 3, 2018, leads to the following static
checker warning:

	drivers/gpu/drm/xen/xen_drm_front_gem.c:140 xen_drm_front_gem_create()
	warn: passing zero to 'ERR_CAST'

drivers/gpu/drm/xen/xen_drm_front_gem.c
   133  struct drm_gem_object *xen_drm_front_gem_create(struct drm_device *dev,
   134                                                  size_t size)
   135  {
   136          struct xen_gem_object *xen_obj;
   137
   138          xen_obj = gem_create(dev, size);
   139          if (IS_ERR_OR_NULL(xen_obj))
   140                  return ERR_CAST(xen_obj);

Fix this and the rest of misused places with IS_ERR_OR_NULL in the
driver.

Fixes:  c575b7eeb89f: "drm/xen-front: Add support for Xen PV display frontend"

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/xen/xen_drm_front.c     | 4 ++--
 drivers/gpu/drm/xen/xen_drm_front_gem.c | 8 ++++----
 drivers/gpu/drm/xen/xen_drm_front_kms.c | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 3e660fb111b3..88db2726e8ce 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -400,8 +400,8 @@ static int xen_drm_drv_dumb_create(struct drm_file *filp,
 	args->size = args->pitch * args->height;
 
 	obj = xen_drm_front_gem_create(dev, args->size);
-	if (IS_ERR_OR_NULL(obj)) {
-		ret = PTR_ERR_OR_ZERO(obj);
+	if (IS_ERR(obj)) {
+		ret = PTR_ERR(obj);
 		goto fail;
 	}
 
diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index f0b85e094111..4ec8a49241e1 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -83,7 +83,7 @@ static struct xen_gem_object *gem_create(struct drm_device *dev, size_t size)
 
 	size = round_up(size, PAGE_SIZE);
 	xen_obj = gem_create_obj(dev, size);
-	if (IS_ERR_OR_NULL(xen_obj))
+	if (IS_ERR(xen_obj))
 		return xen_obj;
 
 	if (drm_info->front_info->cfg.be_alloc) {
@@ -117,7 +117,7 @@ static struct xen_gem_object *gem_create(struct drm_device *dev, size_t size)
 	 */
 	xen_obj->num_pages = DIV_ROUND_UP(size, PAGE_SIZE);
 	xen_obj->pages = drm_gem_get_pages(&xen_obj->base);
-	if (IS_ERR_OR_NULL(xen_obj->pages)) {
+	if (IS_ERR(xen_obj->pages)) {
 		ret = PTR_ERR(xen_obj->pages);
 		xen_obj->pages = NULL;
 		goto fail;
@@ -136,7 +136,7 @@ struct drm_gem_object *xen_drm_front_gem_create(struct drm_device *dev,
 	struct xen_gem_object *xen_obj;
 
 	xen_obj = gem_create(dev, size);
-	if (IS_ERR_OR_NULL(xen_obj))
+	if (IS_ERR(xen_obj))
 		return ERR_CAST(xen_obj);
 
 	return &xen_obj->base;
@@ -194,7 +194,7 @@ xen_drm_front_gem_import_sg_table(struct drm_device *dev,
 
 	size = attach->dmabuf->size;
 	xen_obj = gem_create_obj(dev, size);
-	if (IS_ERR_OR_NULL(xen_obj))
+	if (IS_ERR(xen_obj))
 		return ERR_CAST(xen_obj);
 
 	ret = gem_alloc_pages_array(xen_obj, size);
diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
index 78096bbcd226..ef11b1e4de39 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
@@ -60,7 +60,7 @@ fb_create(struct drm_device *dev, struct drm_file *filp,
 	int ret;
 
 	fb = drm_gem_fb_create_with_funcs(dev, filp, mode_cmd, &fb_funcs);
-	if (IS_ERR_OR_NULL(fb))
+	if (IS_ERR(fb))
 		return fb;
 
 	gem_obj = fb->obj[0];
-- 
2.17.1



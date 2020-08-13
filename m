Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB29B2433F8
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 08:22:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k66cT-0002B7-HV; Thu, 13 Aug 2020 06:21:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7cFh=BX=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1k66cR-00025f-61
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 06:21:43 +0000
X-Inumbo-ID: 8ddc9c75-aeb6-4b75-a122-e52647d5a2af
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ddc9c75-aeb6-4b75-a122-e52647d5a2af;
 Thu, 13 Aug 2020 06:21:23 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 185so4895523ljj.7
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2020 23:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ic1tOm+qheUq6zWKsHFH8/lisv9bz4c0DNj333ORfFc=;
 b=O9T+cO7yS6RByinXxGlmLnMuw8UB7Uq04JQ4MQH8ZaRBOREswU+LwInwis5NeFpWMP
 6b4afB4V0u8+vl74/ktAUqv/5NLckdOirqGtDWy0DnfLDzw0F9uS9oFATKIZak9LD0cR
 EIe1i7j7ul/9h7WHFujo40DWgSI49tHQOpChP2CPy1NIu2Q0p4IeMhjKIPe7GW9sQJzq
 d5c/3lf54qiYjopAmeFXxgIvsdX3ue0RCxavzsT6hs7ZHte2Ni4c0+gpVNyxj8MAJSIz
 jWGfGy0Vt9wMXRy75BmyDOX3dfHEFPWVj3RohotOBYiovpXcbaa+zZho0FsfhquQPZ8v
 IpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ic1tOm+qheUq6zWKsHFH8/lisv9bz4c0DNj333ORfFc=;
 b=D9Wt5NU+eRaCf2UCGiyIoC6I1ZaRb49WLNY+/ButAJL8bzHtKytug3+FgmEyGhM55c
 S+08QL3pUryhpJa1IZmsnBCvS7D9aI29f4pdWklNUFh6D3GTAfRb3Nlt1miIy/5IZwKo
 2SnynZxmAf7G9qSGF9okac2D8a5D+Jwc86BlDe/4WH+5Vw8/XBX/jTy31df4wlhFT3tB
 5SQ9HyLsAykFTHu8tUMUIkYilkA5ApIfRw5ADgV0SfmrOviG47bNuKlAJto+zLH3NsFE
 OvXwJ+MJht5vFcMlQq2qf3cgTyJQbvQrB3LJ5xpYfYe8HTWxjIvDbE2r5eBRP3M4J/R8
 6iGQ==
X-Gm-Message-State: AOAM53167P9qQfZyOPwOBqRw+o1sYk1V5rxJvAi/qdCsjXufCb6yAMR+
 agAXUZ3DnUhv27cjuIbwVxdpf4P45Yw=
X-Google-Smtp-Source: ABdhPJyX+MvFXLa7uDXAhUUkCxsqv4e8xQyC/os7RXs2QYFFoTANe4fzaGRUHzioE6sQe5EkReoukQ==
X-Received: by 2002:a2e:8144:: with SMTP id t4mr1368074ljg.100.1597299682024; 
 Wed, 12 Aug 2020 23:21:22 -0700 (PDT)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id f14sm964060lfd.2.2020.08.12.23.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 23:21:21 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 airlied@linux.ie, daniel@ffwll.ch
Cc: sstabellini@kernel.org, dan.carpenter@oracle.com,
 intel-gfx@lists.freedesktop.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v2 5/5] drm/xen-front: Pass dumb buffer data offset to the
 backend
Date: Thu, 13 Aug 2020 09:21:13 +0300
Message-Id: <20200813062113.11030-6-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813062113.11030-1-andr2000@gmail.com>
References: <20200813062113.11030-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

While importing a dmabuf it is possible that the data of the buffer
is put with offset which is indicated by the SGT offset.
Respect the offset value and forward it to the backend.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/xen/xen_drm_front.c     | 6 ++++--
 drivers/gpu/drm/xen/xen_drm_front.h     | 2 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c | 3 ++-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 51818e76facd..3dd56794593a 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -157,7 +157,8 @@ int xen_drm_front_mode_set(struct xen_drm_front_drm_pipeline *pipeline,
 
 int xen_drm_front_dbuf_create(struct xen_drm_front_info *front_info,
 			      u64 dbuf_cookie, u32 width, u32 height,
-			      u32 bpp, u64 size, struct page **pages)
+			      u32 bpp, u64 size, u32 offset,
+			      struct page **pages)
 {
 	struct xen_drm_front_evtchnl *evtchnl;
 	struct xen_drm_front_dbuf *dbuf;
@@ -194,6 +195,7 @@ int xen_drm_front_dbuf_create(struct xen_drm_front_info *front_info,
 	req->op.dbuf_create.gref_directory =
 			xen_front_pgdir_shbuf_get_dir_start(&dbuf->shbuf);
 	req->op.dbuf_create.buffer_sz = size;
+	req->op.dbuf_create.data_ofs = offset;
 	req->op.dbuf_create.dbuf_cookie = dbuf_cookie;
 	req->op.dbuf_create.width = width;
 	req->op.dbuf_create.height = height;
@@ -408,7 +410,7 @@ static int xen_drm_drv_dumb_create(struct drm_file *filp,
 	ret = xen_drm_front_dbuf_create(drm_info->front_info,
 					xen_drm_front_dbuf_to_cookie(obj),
 					args->width, args->height, args->bpp,
-					args->size,
+					args->size, 0,
 					xen_drm_front_gem_get_pages(obj));
 	if (ret)
 		goto fail_backend;
diff --git a/drivers/gpu/drm/xen/xen_drm_front.h b/drivers/gpu/drm/xen/xen_drm_front.h
index f92c258350ca..54486d89650e 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.h
+++ b/drivers/gpu/drm/xen/xen_drm_front.h
@@ -145,7 +145,7 @@ int xen_drm_front_mode_set(struct xen_drm_front_drm_pipeline *pipeline,
 
 int xen_drm_front_dbuf_create(struct xen_drm_front_info *front_info,
 			      u64 dbuf_cookie, u32 width, u32 height,
-			      u32 bpp, u64 size, struct page **pages);
+			      u32 bpp, u64 size, u32 offset, struct page **pages);
 
 int xen_drm_front_fb_attach(struct xen_drm_front_info *front_info,
 			    u64 dbuf_cookie, u64 fb_cookie, u32 width,
diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index 4ec8a49241e1..39ff95b75357 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -210,7 +210,8 @@ xen_drm_front_gem_import_sg_table(struct drm_device *dev,
 
 	ret = xen_drm_front_dbuf_create(drm_info->front_info,
 					xen_drm_front_dbuf_to_cookie(&xen_obj->base),
-					0, 0, 0, size, xen_obj->pages);
+					0, 0, 0, size, sgt->sgl->offset,
+					xen_obj->pages);
 	if (ret < 0)
 		return ERR_PTR(ret);
 
-- 
2.17.1



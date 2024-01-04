Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE10824872
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 19:54:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661883.1031645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLSr3-0005qI-Do; Thu, 04 Jan 2024 18:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661883.1031645; Thu, 04 Jan 2024 18:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLSr3-0005o5-A8; Thu, 04 Jan 2024 18:54:09 +0000
Received: by outflank-mailman (input) for mailman id 661883;
 Thu, 04 Jan 2024 18:54:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NKvI=IO=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1rLSr2-0005nz-AE
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 18:54:08 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a31ba564-ab32-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 19:54:07 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a28e6392281so92053866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 10:54:06 -0800 (PST)
Received: from EPUAKYIW03DD.. ([91.123.150.198])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a170906305500b00a2699b0fd49sm13966430ejd.86.2024.01.04.10.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 10:54:05 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a31ba564-ab32-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704394446; x=1704999246; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jKANwIhqa+LvmlQt2znhD615O1LJ668Njt6YHHfEb+I=;
        b=c7mCVOiiseVvh46CRE6azdsILwdIstpNV/8Zmp0FybiYBvWgFZ/AqMgK/fZmK7pjgX
         72ZQQJoIK4gUXmYMYGpHK93t9/x9CBFazDOF8N7CoCtmGTPPJLKLMDfOEx7pMuNvZyWp
         eU/ZJnVNvz4bvU5qG5MaW2DsBlSwS1xc0vsD+ja+W9hITQycdn5KOMOMlpko2KKHP6L0
         qQsu7jJiZSb+oB3Sy5pL3geEJbWj0HoBwEN9bxocHYR0VKCeh+NwOI5gyvYOMutDjr+l
         GbbizCEaV8bhAY2MC23KRrZmJRbS8qRCcsNkB49BItPUM0YiTBnjHVU/Ai9KOxhELSjm
         6ZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704394446; x=1704999246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jKANwIhqa+LvmlQt2znhD615O1LJ668Njt6YHHfEb+I=;
        b=s4nmLyYqUtLuciuY5dslNTXzjhHzGewbco4rIOwnn2Svqw6LnDnI3vN1QdXsr+Pgh+
         6nqBI4clJEHWdB0qY06AhIlOKFBnfo+EHsgPmauWER6i5bhzSDvWtqivYpmpQravATQC
         lcjfetgDH5yfvai8V+F6PTqG7zrMqcDHCjYMb59pWYcD6VhuVxwX/HnD21kwLcJ7oOho
         vFmj71DmzsAY4zc8wqyJ6oTmvaNdsqoMpAVJva8iAddB7LQ0KDKF6RYuCm7B2rLN/VIZ
         iAmz6j4oX+cihN0MuCw15tK8mKnbtsbMqsR4WfTTp0ZtjlQ0j1z/R3ogQcbW41MICDJH
         TOiA==
X-Gm-Message-State: AOJu0Yw1/z/oO73l+1P2192K9MtaDZcv0vspfi5bmQ3oVbWtoZ3KRVuE
	kb8OHtpleIR0xjlOtn+jetRwW+irAb0=
X-Google-Smtp-Source: AGHT+IFhdU/VMhwpjMnGX2lcnofrQbURePzE/VM+99mptm3emNVixnMZdqIgEEfDKwqVyqXeZhYK+g==
X-Received: by 2002:a17:906:f810:b0:a23:44e8:81b with SMTP id kh16-20020a170906f81000b00a2344e8081bmr562135ejb.73.1704394445767;
        Thu, 04 Jan 2024 10:54:05 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/gntdev: Fix the abuse of underlying struct page in DMA-buf import
Date: Thu,  4 Jan 2024 20:53:27 +0200
Message-Id: <20240104185327.177376-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

DO NOT access the underlying struct page of an sg table exported
by DMA-buf in dmabuf_imp_to_refs(), this is not allowed.
Please see drivers/dma-buf/dma-buf.c:mangle_sg_table() for details.

Fortunately, here (for special Xen device) we can avoid using
pages and calculate gfns directly from dma addresses provided by
the sg table.

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Please note, I didn't manage to test the patch against the latest master branch
on real HW (patch was only build tested there). Patch was tested on Arm64
guests using Linux v5.10.41 from vendor's BSP, this is the environment where
running this use-case is possible and to which I have an access (Xen PV display
with zero-copy and backend domain as a buffer provider - be-alloc=1, so dma-buf
import part was involved). A little bit old, but the dma-buf import code
in gntdev-dmabuf.c hasn't been changed much since that time, all context
remains allmost the same according to my code inspection.
---
---
 drivers/xen/gntdev-dmabuf.c | 42 +++++++++++++++----------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
index 4440e626b797..0dde49fca9a5 100644
--- a/drivers/xen/gntdev-dmabuf.c
+++ b/drivers/xen/gntdev-dmabuf.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-direct.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
@@ -50,7 +51,7 @@ struct gntdev_dmabuf {
 
 	/* Number of pages this buffer has. */
 	int nr_pages;
-	/* Pages of this buffer. */
+	/* Pages of this buffer (only for dma-buf export). */
 	struct page **pages;
 };
 
@@ -484,7 +485,7 @@ static int dmabuf_exp_from_refs(struct gntdev_priv *priv, int flags,
 /* DMA buffer import support. */
 
 static int
-dmabuf_imp_grant_foreign_access(struct page **pages, u32 *refs,
+dmabuf_imp_grant_foreign_access(unsigned long *gfns, u32 *refs,
 				int count, int domid)
 {
 	grant_ref_t priv_gref_head;
@@ -507,7 +508,7 @@ dmabuf_imp_grant_foreign_access(struct page **pages, u32 *refs,
 		}
 
 		gnttab_grant_foreign_access_ref(cur_ref, domid,
-						xen_page_to_gfn(pages[i]), 0);
+						gfns[i], 0);
 		refs[i] = cur_ref;
 	}
 
@@ -529,7 +530,6 @@ static void dmabuf_imp_end_foreign_access(u32 *refs, int count)
 
 static void dmabuf_imp_free_storage(struct gntdev_dmabuf *gntdev_dmabuf)
 {
-	kfree(gntdev_dmabuf->pages);
 	kfree(gntdev_dmabuf->u.imp.refs);
 	kfree(gntdev_dmabuf);
 }
@@ -549,12 +549,6 @@ static struct gntdev_dmabuf *dmabuf_imp_alloc_storage(int count)
 	if (!gntdev_dmabuf->u.imp.refs)
 		goto fail;
 
-	gntdev_dmabuf->pages = kcalloc(count,
-				       sizeof(gntdev_dmabuf->pages[0]),
-				       GFP_KERNEL);
-	if (!gntdev_dmabuf->pages)
-		goto fail;
-
 	gntdev_dmabuf->nr_pages = count;
 
 	for (i = 0; i < count; i++)
@@ -576,7 +570,8 @@ dmabuf_imp_to_refs(struct gntdev_dmabuf_priv *priv, struct device *dev,
 	struct dma_buf *dma_buf;
 	struct dma_buf_attachment *attach;
 	struct sg_table *sgt;
-	struct sg_page_iter sg_iter;
+	struct sg_dma_page_iter sg_iter;
+	unsigned long *gfns;
 	int i;
 
 	dma_buf = dma_buf_get(fd);
@@ -624,26 +619,23 @@ dmabuf_imp_to_refs(struct gntdev_dmabuf_priv *priv, struct device *dev,
 
 	gntdev_dmabuf->u.imp.sgt = sgt;
 
-	/* Now convert sgt to array of pages and check for page validity. */
+	gfns = kcalloc(count, sizeof(*gfns), GFP_KERNEL);
+	if (!gfns)
+		goto fail_unmap;
+
+	/* Now convert sgt to array of gfns without accessing underlying pages. */
 	i = 0;
-	for_each_sgtable_page(sgt, &sg_iter, 0) {
-		struct page *page = sg_page_iter_page(&sg_iter);
-		/*
-		 * Check if page is valid: this can happen if we are given
-		 * a page from VRAM or other resources which are not backed
-		 * by a struct page.
-		 */
-		if (!pfn_valid(page_to_pfn(page))) {
-			ret = ERR_PTR(-EINVAL);
-			goto fail_unmap;
-		}
+	for_each_sgtable_dma_page(sgt, &sg_iter, 0) {
+		dma_addr_t addr = sg_page_iter_dma_address(&sg_iter);
+		unsigned long pfn = bfn_to_pfn(XEN_PFN_DOWN(dma_to_phys(dev, addr)));
 
-		gntdev_dmabuf->pages[i++] = page;
+		gfns[i++] = pfn_to_gfn(pfn);
 	}
 
-	ret = ERR_PTR(dmabuf_imp_grant_foreign_access(gntdev_dmabuf->pages,
+	ret = ERR_PTR(dmabuf_imp_grant_foreign_access(gfns,
 						      gntdev_dmabuf->u.imp.refs,
 						      count, domid));
+	kfree(gfns);
 	if (IS_ERR(ret))
 		goto fail_end_access;
 
-- 
2.34.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DADD8263C8
	for <lists+xen-devel@lfdr.de>; Sun,  7 Jan 2024 11:36:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662627.1032689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMQV3-0001g5-UD; Sun, 07 Jan 2024 10:35:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662627.1032689; Sun, 07 Jan 2024 10:35:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMQV3-0001eV-RN; Sun, 07 Jan 2024 10:35:25 +0000
Received: by outflank-mailman (input) for mailman id 662627;
 Sun, 07 Jan 2024 10:35:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oAu3=IR=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1rMQV2-0001eP-Ra
 for xen-devel@lists.xenproject.org; Sun, 07 Jan 2024 10:35:24 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7656d3eb-ad48-11ee-98ef-6d05b1d4d9a1;
 Sun, 07 Jan 2024 11:35:23 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a28b0207c1dso64181566b.3
 for <xen-devel@lists.xenproject.org>; Sun, 07 Jan 2024 02:35:23 -0800 (PST)
Received: from EPUAKYIW03DD.. ([91.123.150.198])
 by smtp.gmail.com with ESMTPSA id
 lk16-20020a170906cb1000b00a26afb7fd54sm2930074ejb.15.2024.01.07.02.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 02:35:21 -0800 (PST)
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
X-Inumbo-ID: 7656d3eb-ad48-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704623722; x=1705228522; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ghpvrm/3AEBdzbWk8YZiHGiX3pwaQb2AEZTDUC3tmOs=;
        b=ZNw59H7OjKe6neVRTDjKHjLkJ1BmzlzDHfvU3aH0JSTKNtNnmMOPM5eBoTNjcxU8VS
         AfuwY7dxp0KYRwjGzhHVgkODUkd+cjmFACFefKXKppXWGzdWZgoDO3ZSZtYLtVqBuT+Y
         28/r6+CUCx+KwR62SuiGwjc1ernPoPo9ZaennAewWefmgxwWPUkAjeU+M7kNMVRX0W7N
         BXKdBkq/1IYQwN0cO+Ob6VsuNoXYmap89bN5Vn8A0xp+wbJ9ClTc2GbwAGdeJ9aYaPL4
         cz8DcMP5e/7LRw0moZb1Jf2JLZgvH3zBXD9eut+8sAyJXa0gzASVpPQy+dZosE7fxMNC
         qmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704623722; x=1705228522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ghpvrm/3AEBdzbWk8YZiHGiX3pwaQb2AEZTDUC3tmOs=;
        b=ZALxLe8gkHmNqTNN6qu7mrobOXRV5/Kfew99Zbrn0tiANc6I4/wPelaG25XEDtHnzp
         kz5l2tFvKvWKyGT8EBn3qQA7mLeTHv8w0YNTRz2IjurhrqnB0KHI6//cfjhDxHHdJ84/
         fdYglhg/sNqkhXnqBJODwmv/Gl8qEe72ap7UmGp9dNUNpJi1d67PGE99KdRHD0Y9LkrV
         c21AORju5vnf6BjrAeYpdZYaZZaysraJPIVHcRQewRWCSNWk4tASpTMzzzfXiS6oteZI
         LhW6BbUg4qnFP7aJeHwf9O1EXyP1pE4/5xZ9+UTsoPmk67iIPT692rQXdhnNNvz2FXoN
         1UtQ==
X-Gm-Message-State: AOJu0YweBUd3CLXJ03UAQ/0ouVvTUZU7DuugRGnt9sTGwQWtU0mbZkwD
	k33GDCWdr7fziDahuhhnxU2AFwTKgtA=
X-Google-Smtp-Source: AGHT+IEgl8h6+zpl6SUHiSqK5XScqK44QOXbHAyVzXhGtFSD7Qn2O6AOXZtqoHyFcj41HGl+ut3zuw==
X-Received: by 2002:a17:906:711b:b0:a27:32a0:b836 with SMTP id x27-20020a170906711b00b00a2732a0b836mr999374ejj.40.1704623721850;
        Sun, 07 Jan 2024 02:35:21 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] xen/gntdev: Fix the abuse of underlying struct page in DMA-buf import
Date: Sun,  7 Jan 2024 12:34:26 +0200
Message-Id: <20240107103426.2038075-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Please note, I didn't manage to test the patch against the latest master branch
on real HW (patch was only build tested there). Patch was tested on Arm64
guests using Linux v5.10.41 from vendor's BSP, this is the environment where
running this use-case is possible and to which I have an access (Xen PV display
with zero-copy and backend domain as a buffer provider - be-alloc=1, so dma-buf
import part was involved). A little bit old, but the dma-buf import code
in gntdev-dmabuf.c hasn't been changed much since that time, all context
remains allmost the same according to my code inspection.

  v2:
   - add R-b and A-b
   - fix build warning noticed by kernel test robot by initializing
     "ret" in case of error
     https://lore.kernel.org/oe-kbuild-all/202401062122.it6zvLG0-lkp@intel.com/
---
---
 drivers/xen/gntdev-dmabuf.c | 44 ++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
index 4440e626b797..272c0ab01ef5 100644
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
@@ -624,26 +619,25 @@ dmabuf_imp_to_refs(struct gntdev_dmabuf_priv *priv, struct device *dev,
 
 	gntdev_dmabuf->u.imp.sgt = sgt;
 
-	/* Now convert sgt to array of pages and check for page validity. */
+	gfns = kcalloc(count, sizeof(*gfns), GFP_KERNEL);
+	if (!gfns) {
+		ret = ERR_PTR(-ENOMEM);
+		goto fail_unmap;
+	}
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



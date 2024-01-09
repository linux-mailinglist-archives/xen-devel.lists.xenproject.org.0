Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C9F828CA4
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 19:32:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664904.1035027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNGtD-0005a0-PD; Tue, 09 Jan 2024 18:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664904.1035027; Tue, 09 Jan 2024 18:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNGtD-0005XY-MQ; Tue, 09 Jan 2024 18:31:51 +0000
Received: by outflank-mailman (input) for mailman id 664904;
 Tue, 09 Jan 2024 18:31:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XP49=IT=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1rNGtC-0005XS-CB
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 18:31:50 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58faa396-af1d-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 19:31:47 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40d60c49ee7so37393115e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 10:31:47 -0800 (PST)
Received: from EPUAKYIW03DD.. ([91.123.150.198])
 by smtp.gmail.com with ESMTPSA id
 j17-20020adfea51000000b0033660f75d08sm2998540wrn.116.2024.01.09.10.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 10:31:45 -0800 (PST)
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
X-Inumbo-ID: 58faa396-af1d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704825107; x=1705429907; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9XFtGICw0ZOYP1KaZFQnHRK8o8vGVTmy1dPmwlRy2FE=;
        b=OiFgjurBcRnNjEkIpyAgnV+ABCcmuDAKOkzdVEEm7Vu9q73IX/o78vaqJLwUgu5gZ0
         JtI+W8qfHVokCu3O3QyhcfZiPnWheJEaLhv7NL7w50jYfTFw+G5DHjvffnR5rmaU0qfW
         rMZQb/cLsEor83tD0aVGgfNpva8TYAlB6oeeY4BTSAUg4a6Kw8niXucMaPGeb2LVv+FP
         jukRZL4wtHZBj8mLMQEvl3n44f4UFMbq4FfGDM/HZdsu/9bicc056W33PMDGZBpce5K1
         tdrhg6iglqwxod7gAhFxYKj00u2Kbh3k7+st09dnIpqra9KDOdSQTjbSWpTcARuVYSKF
         uCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704825107; x=1705429907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XFtGICw0ZOYP1KaZFQnHRK8o8vGVTmy1dPmwlRy2FE=;
        b=Sl0xo7M9LqA/SmLx9VJ8RcFTVdbCF0OKpw1VRO9y4MmmQnbNMp1BPan5vPKReqYeCq
         EWbbdBbj+yic8l3/y79qjndjZSre0A0ceCatzHO3ixRqitSj8sfci6AdjgpT1pTy0523
         sdlvnCz+bYzQPnMQNBUju055u7JxFkUE9AjsPUKRDw6CqcogUqoD74cOM6mKToLxzDIe
         oDhFnfOmAlKt34CvOUCDylnIrOJ9OK7lS65RXySCK30WYhKCm5BhRt03K1+cezVR9Ier
         SxCaEl4S1jgylImgvM5bLp6fhT75PGG3klU8BZNng1R9PEunLk7YdGFxDW33XR3SpJd6
         lepg==
X-Gm-Message-State: AOJu0YymLldvk7vCKdnB53cvoOp5AJlcrul7HzxN0cJdmsLHmHhmPgoS
	6id6UZ5QxYlBoC8eTdAc9g3ITbhGjBA=
X-Google-Smtp-Source: AGHT+IFZ4AzApNWClmEutZip6HiuDvW/c+sSPmo7DJau1xq5iTK1B1Ps9CIi7CX59E4NeJQg4oPg4w==
X-Received: by 2002:adf:f605:0:b0:336:c5e2:fc9e with SMTP id t5-20020adff605000000b00336c5e2fc9emr838902wrp.35.1704825106616;
        Tue, 09 Jan 2024 10:31:46 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3] xen/gntdev: Fix the abuse of underlying struct page in DMA-buf import
Date: Tue,  9 Jan 2024 20:31:25 +0200
Message-Id: <20240109183125.2654368-1-olekstysh@gmail.com>
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
Acked-by: Daniel Vetter <daniel@ffwll.ch>
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

  V2:
   - add R-b and A-b
   - fix build warning noticed by kernel test robot by initializing
     "ret" in case of error
     https://lore.kernel.org/oe-kbuild-all/202401062122.it6zvLG0-lkp@intel.com/

  V3:
   - add A-b
   - add in-code comment
---
---
 drivers/xen/gntdev-dmabuf.c | 50 ++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
index 4440e626b797..42adc2c1e06b 100644
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
@@ -624,26 +619,31 @@ dmabuf_imp_to_refs(struct gntdev_dmabuf_priv *priv, struct device *dev,
 
 	gntdev_dmabuf->u.imp.sgt = sgt;
 
-	/* Now convert sgt to array of pages and check for page validity. */
+	gfns = kcalloc(count, sizeof(*gfns), GFP_KERNEL);
+	if (!gfns) {
+		ret = ERR_PTR(-ENOMEM);
+		goto fail_unmap;
+	}
+
+	/*
+	 * Now convert sgt to array of gfns without accessing underlying pages.
+	 * It is not allowed to access the underlying struct page of an sg table
+	 * exported by DMA-buf, but since we deal with special Xen dma device here
+	 * (not a normal physical one) look at the dma addresses in the sg table
+	 * and then calculate gfns directly from them.
+	 */
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



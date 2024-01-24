Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 997CD83ABC5
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 15:30:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671014.1044136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSeFY-00084i-UC; Wed, 24 Jan 2024 14:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671014.1044136; Wed, 24 Jan 2024 14:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSeFY-00082C-R0; Wed, 24 Jan 2024 14:29:08 +0000
Received: by outflank-mailman (input) for mailman id 671014;
 Wed, 24 Jan 2024 14:29:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RVUo=JC=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1rSeFX-000826-S9
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 14:29:07 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb8ce1a0-bac4-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 15:29:04 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9B3D6CE3131;
 Wed, 24 Jan 2024 14:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AB0C433A6;
 Wed, 24 Jan 2024 14:28:49 +0000 (UTC)
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
X-Inumbo-ID: eb8ce1a0-bac4-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706106530;
	bh=6FfN1GzAtURfOQTJtQ8dKYe9y+zDqRTWUeydka0I57o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QEzV0nwRM9NUaAdv4p65JnRWWLrKcd05SQ9dz4qwf/H7X3Gnkx58CR6WDE9YFxbeu
	 QLEknnCQRqFoytqS9iD0wLFCcXX4/AgJ5ABqZOBwIxZtMp+F4zm0uKJPZ6gj2Y7Pu+
	 mL9bXzi6rOubl7qoOvovBIRlNa7kSIbjL3stkqOQq4f9URhe+1NWxVcErXiBAVSE4y
	 FrK6Z6FUDQpHWWhB0457PKa4OiIEsHQx6S4ekOttMiu60Pkc9HFxNcXVcqFNkUab0s
	 BosGAm2rjzi2XDHR8ubekdoxQxEqF9XuGSZ/eYhgsAY8cZ6LDfmnL1H/QCGfM+PDR/
	 RD+sGkicI/iNw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 6.7 11/13] xen/gntdev: Fix the abuse of underlying struct page in DMA-buf import
Date: Wed, 24 Jan 2024 09:28:04 -0500
Message-ID: <20240124142820.1283206-11-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124142820.1283206-1-sashal@kernel.org>
References: <20240124142820.1283206-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.1
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

[ Upstream commit 2d2db7d40254d5fb53b11ebd703cd1ed0c5de7a1 ]

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
Acked-by: Daniel Vetter <daniel@ffwll.ch>
Link: https://lore.kernel.org/r/20240107103426.2038075-1-olekstysh@gmail.com
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
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
2.43.0



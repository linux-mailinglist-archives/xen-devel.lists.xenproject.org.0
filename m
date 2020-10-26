Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F69299BCB
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 00:53:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12588.32758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXCIf-0005Bs-9v; Mon, 26 Oct 2020 23:53:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12588.32758; Mon, 26 Oct 2020 23:53:17 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXCIf-0005BT-6p; Mon, 26 Oct 2020 23:53:17 +0000
Received: by outflank-mailman (input) for mailman id 12588;
 Mon, 26 Oct 2020 23:53:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lBFa=EB=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1kXCId-0005BL-DT
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 23:53:15 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8cdd4db8-6b51-46da-a296-c15c1e9f3f43;
 Mon, 26 Oct 2020 23:53:13 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D86B722202;
 Mon, 26 Oct 2020 23:53:11 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=lBFa=EB=kernel.org=sashal@srs-us1.protection.inumbo.net>)
	id 1kXCId-0005BL-DT
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 23:53:15 +0000
X-Inumbo-ID: 8cdd4db8-6b51-46da-a296-c15c1e9f3f43
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8cdd4db8-6b51-46da-a296-c15c1e9f3f43;
	Mon, 26 Oct 2020 23:53:13 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D86B722202;
	Mon, 26 Oct 2020 23:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603756392;
	bh=j8+aveAqrJQEVzbm2fQkpi44naYHrixzixT0DdUmo5A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hMDjDuYtIUSPBB9B21/4bfkTHLyW6e8q+6pzDlVwQZtGtKTsoUYGPD0YYYZmihC5U
	 l4AXo+sqP6cf37YCIqdwqF0VwUmATsw0NAqs9E51pAneZNAFjYXnlryUjmpDmHsqU6
	 ZP6YauC5AYL556Q9tQ3qmDbCROVimmHwqRP0ncT0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 5.8 054/132] xen: gntdev: fix common struct sg_table related issues
Date: Mon, 26 Oct 2020 19:50:46 -0400
Message-Id: <20201026235205.1023962-54-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026235205.1023962-1-sashal@kernel.org>
References: <20201026235205.1023962-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Marek Szyprowski <m.szyprowski@samsung.com>

[ Upstream commit d1749eb1ab85e04e58c29e58900e3abebbdd6e82 ]

The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg() function
returns the number of the created entries in the DMA address space.
However the subsequent calls to the dma_sync_sg_for_{device,cpu}() and
dma_unmap_sg must be called with the original number of the entries
passed to the dma_map_sg().

struct sg_table is a common structure used for describing a non-contiguous
memory buffer, used commonly in the DRM and graphics subsystems. It
consists of a scatterlist with memory pages and DMA addresses (sgl entry),
as well as the number of scatterlist entries: CPU pages (orig_nents entry)
and DMA mapped pages (nents entry).

It turned out that it was a common mistake to misuse nents and orig_nents
entries, calling DMA-mapping functions with a wrong number of entries or
ignoring the number of mapped entries returned by the dma_map_sg()
function.

To avoid such issues, lets use a common dma-mapping wrappers operating
directly on the struct sg_table objects and use scatterlist page
iterators where possible. This, almost always, hides references to the
nents and orig_nents entries, making the code robust, easier to follow
and copy/paste safe.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/xen/gntdev-dmabuf.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
index b1b6eebafd5de..4c13cbc99896a 100644
--- a/drivers/xen/gntdev-dmabuf.c
+++ b/drivers/xen/gntdev-dmabuf.c
@@ -247,10 +247,9 @@ static void dmabuf_exp_ops_detach(struct dma_buf *dma_buf,
 
 		if (sgt) {
 			if (gntdev_dmabuf_attach->dir != DMA_NONE)
-				dma_unmap_sg_attrs(attach->dev, sgt->sgl,
-						   sgt->nents,
-						   gntdev_dmabuf_attach->dir,
-						   DMA_ATTR_SKIP_CPU_SYNC);
+				dma_unmap_sgtable(attach->dev, sgt,
+						  gntdev_dmabuf_attach->dir,
+						  DMA_ATTR_SKIP_CPU_SYNC);
 			sg_free_table(sgt);
 		}
 
@@ -288,8 +287,8 @@ dmabuf_exp_ops_map_dma_buf(struct dma_buf_attachment *attach,
 	sgt = dmabuf_pages_to_sgt(gntdev_dmabuf->pages,
 				  gntdev_dmabuf->nr_pages);
 	if (!IS_ERR(sgt)) {
-		if (!dma_map_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
-				      DMA_ATTR_SKIP_CPU_SYNC)) {
+		if (dma_map_sgtable(attach->dev, sgt, dir,
+				    DMA_ATTR_SKIP_CPU_SYNC)) {
 			sg_free_table(sgt);
 			kfree(sgt);
 			sgt = ERR_PTR(-ENOMEM);
@@ -633,7 +632,7 @@ dmabuf_imp_to_refs(struct gntdev_dmabuf_priv *priv, struct device *dev,
 
 	/* Now convert sgt to array of pages and check for page validity. */
 	i = 0;
-	for_each_sg_page(sgt->sgl, &sg_iter, sgt->nents, 0) {
+	for_each_sgtable_page(sgt, &sg_iter, 0) {
 		struct page *page = sg_page_iter_page(&sg_iter);
 		/*
 		 * Check if page is valid: this can happen if we are given
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE9BA33A55
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 09:56:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887230.1296772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiV0i-00008b-Fn; Thu, 13 Feb 2025 08:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887230.1296772; Thu, 13 Feb 2025 08:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiV0i-00005B-C0; Thu, 13 Feb 2025 08:55:52 +0000
Received: by outflank-mailman (input) for mailman id 887230;
 Thu, 13 Feb 2025 08:55:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YDip=VE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tiV0g-0008Vs-Q4
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 08:55:50 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 518d49b8-e9e8-11ef-b3ef-695165c68f79;
 Thu, 13 Feb 2025 09:55:48 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DA9FF1FBAA;
 Thu, 13 Feb 2025 08:55:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9EB01137DB;
 Thu, 13 Feb 2025 08:55:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id G3hNJZKzrWcJdgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 13 Feb 2025 08:55:46 +0000
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
X-Inumbo-ID: 518d49b8-e9e8-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1739436947; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5roWTjW+RnJz72UMkoQG0UFH3GgE3qHAOCHBzpPQNeA=;
	b=MQyTHHh5vUOEGZpbG10NkPrZFDPNgDK9dtuo4Tva8KNikzMhp8LfojnVGJ0RYI/qE4HiVf
	8Vz2UOz9xkbgG2AQIBE7WOkxcQ72JO+LQB4izZbu+g7H4OY36bN0Ve8w/MQuWwWRHOgE8t
	F8Qq/p2PCtw8MjiL5DF5nEXYLOxgp6c=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1739436946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5roWTjW+RnJz72UMkoQG0UFH3GgE3qHAOCHBzpPQNeA=;
	b=CCQRalYxu3fSyIQ1BlZYGQvIsj3ZC/bYV+G30yTRsLllQEMMLXJS4otXsEdjzCwccghlWq
	K1DYdyPg4m2xIUykGpcgXIjSju4/BJS5IEraQvxOa5Fy0Agdjsjfnwjs2SqwgbaRimmBbV
	6m87dlOGUhQrBeIRBKiDJjugPIKKK98=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	Jan Vejvalka <jan.vejvalka@lfmotol.cuni.cz>
Subject: [PATCH v2 1/2] xen/swiotlb: relax alignment requirements
Date: Thu, 13 Feb 2025 09:55:37 +0100
Message-ID: <20250213085538.17060-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213085538.17060-1-jgross@suse.com>
References: <20250213085538.17060-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

When mapping a buffer for DMA via .map_page or .map_sg DMA operations,
there is no need to check the machine frames to be aligned according
to the mapped areas size. All what is needed in these cases is that the
buffer is contiguous at machine level.

So carve out the alignment check from range_straddles_page_boundary()
and move it to a helper called by xen_swiotlb_alloc_coherent() and
xen_swiotlb_free_coherent() directly.

Fixes: 9f40ec84a797 ("xen/swiotlb: add alignment check for dma buffers")
Reported-by: Jan Vejvalka <jan.vejvalka@lfmotol.cuni.cz>
Tested-by: Jan Vejvalka <jan.vejvalka@lfmotol.cuni.cz>
Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 drivers/xen/swiotlb-xen.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index a337edcf8faf..26c62e0d34e9 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -74,19 +74,21 @@ static inline phys_addr_t xen_dma_to_phys(struct device *dev,
 	return xen_bus_to_phys(dev, dma_to_phys(dev, dma_addr));
 }
 
+static inline bool range_requires_alignment(phys_addr_t p, size_t size)
+{
+	phys_addr_t algn = 1ULL << (get_order(size) + PAGE_SHIFT);
+	phys_addr_t bus_addr = pfn_to_bfn(XEN_PFN_DOWN(p)) << XEN_PAGE_SHIFT;
+
+	return IS_ALIGNED(p, algn) && !IS_ALIGNED(bus_addr, algn);
+}
+
 static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
 {
 	unsigned long next_bfn, xen_pfn = XEN_PFN_DOWN(p);
 	unsigned int i, nr_pages = XEN_PFN_UP(xen_offset_in_page(p) + size);
-	phys_addr_t algn = 1ULL << (get_order(size) + PAGE_SHIFT);
 
 	next_bfn = pfn_to_bfn(xen_pfn);
 
-	/* If buffer is physically aligned, ensure DMA alignment. */
-	if (IS_ALIGNED(p, algn) &&
-	    !IS_ALIGNED((phys_addr_t)next_bfn << XEN_PAGE_SHIFT, algn))
-		return 1;
-
 	for (i = 1; i < nr_pages; i++)
 		if (pfn_to_bfn(++xen_pfn) != ++next_bfn)
 			return 1;
@@ -156,7 +158,8 @@ xen_swiotlb_alloc_coherent(struct device *dev, size_t size,
 
 	*dma_handle = xen_phys_to_dma(dev, phys);
 	if (*dma_handle + size - 1 > dma_mask ||
-	    range_straddles_page_boundary(phys, size)) {
+	    range_straddles_page_boundary(phys, size) ||
+	    range_requires_alignment(phys, size)) {
 		if (xen_create_contiguous_region(phys, order, fls64(dma_mask),
 				dma_handle) != 0)
 			goto out_free_pages;
@@ -182,7 +185,8 @@ xen_swiotlb_free_coherent(struct device *dev, size_t size, void *vaddr,
 	size = ALIGN(size, XEN_PAGE_SIZE);
 
 	if (WARN_ON_ONCE(dma_handle + size - 1 > dev->coherent_dma_mask) ||
-	    WARN_ON_ONCE(range_straddles_page_boundary(phys, size)))
+	    WARN_ON_ONCE(range_straddles_page_boundary(phys, size) ||
+			 range_requires_alignment(phys, size)))
 	    	return;
 
 	if (TestClearPageXenRemapped(virt_to_page(vaddr)))
-- 
2.43.0



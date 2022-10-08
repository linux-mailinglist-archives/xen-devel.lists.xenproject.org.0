Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9C15F85C1
	for <lists+xen-devel@lfdr.de>; Sat,  8 Oct 2022 17:11:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418540.663391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohBTJ-0007ob-GX; Sat, 08 Oct 2022 15:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418540.663391; Sat, 08 Oct 2022 15:10:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohBTJ-0007lr-Cs; Sat, 08 Oct 2022 15:10:37 +0000
Received: by outflank-mailman (input) for mailman id 418540;
 Sat, 08 Oct 2022 15:10:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0eQj=2J=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ohBTH-0007Gm-Nd
 for xen-devel@lists.xenproject.org; Sat, 08 Oct 2022 15:10:35 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5be7e6b9-471b-11ed-9377-c1cf23e5d27e;
 Sat, 08 Oct 2022 17:10:35 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id k2so16892019ejr.2
 for <xen-devel@lists.xenproject.org>; Sat, 08 Oct 2022 08:10:34 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 l25-20020a50d6d9000000b0045723aa48ccsm3523119edj.93.2022.10.08.08.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Oct 2022 08:10:33 -0700 (PDT)
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
X-Inumbo-ID: 5be7e6b9-471b-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJfFnZUElo4fDCQOc+GUeP/mNGH0ahT8QNQddIgzFpg=;
        b=g8aEsBuSKZ+1up29Gc0SivPAU0QfBvEDsDLSm/BA/WXxN1bgp6/ngqfrbqm2DWVHLw
         XY8BXGqopp6EWzVAt9v4zmoAu6Jbpj0rLDLEU7d1IjG38hYiQitRNR61MMREM0lqONMW
         WNOejInVh1VNU8xCdlu2gGUxtnyeyDK/he9Y7VJw4AK7iugU2I1s3KutVEVcLuoghSY2
         NQAW8eDDrLuM9/t3Aiccabh+YNbgX+hG6puCWDK/Shdi8LAkwVk2JbYaZOTgHfs+ZJfh
         gOjpzeOjYWGMgF5upe3h1GLGqIuLRi8laVdgMnKu5jjdzeB4pIQZ6Qi90e0vj9Sza4WE
         +h4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJfFnZUElo4fDCQOc+GUeP/mNGH0ahT8QNQddIgzFpg=;
        b=hEYWh3R8sttSys3sLTB7E4+O+MULcoAXYmqveqHJy7zBRch0d8i7BFCkZURD5YRB3n
         BhvQmZpiWOeCxfshMatJjExFN6qlEhd0ZXUNCmCplAF5/jQobwYhoKhZbY8WT+MATd8k
         QZNYKZr7Qv2XIK2xvHh0jJa3BlJqaRQzId540Vv+v46E79rTZY0vfbPfNqIZrwYl7uRy
         CjK2yXo27MeV0iG0/3p64LZp7Wx8gw8VGoyXQGHkSnMyQabJk60wnGmaKSPeov+wYIWq
         e0MDZ5HRwFDOyrW+KWaggtkJssM6rKWfH9k4AsfN8gPoojGOVDduQL5YI1rGbHTRrwSG
         8ydw==
X-Gm-Message-State: ACrzQf3c3izN2t3/au0b/cN48zx8a2g7sThd8/hWKMtya7axk7NHIv4X
	32WySRqKBwQeFtxazF8DT/B1jaB1b4w=
X-Google-Smtp-Source: AMsMyM4cQnfbv1dRZ3p5BrDqTgfEyct+5Knto6fqk5S+UPZWC9Wybbx5bOvo/nRGWvYlCvM7hU59hA==
X-Received: by 2002:a17:907:802:b0:781:8017:b2df with SMTP id wv2-20020a170907080200b007818017b2dfmr8109754ejb.606.1665241834228;
        Sat, 08 Oct 2022 08:10:34 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>
Subject: [PATCH V2 2/2] xen/virtio: Convert PAGE_SIZE/PAGE_SHIFT/PFN_UP to Xen counterparts
Date: Sat,  8 Oct 2022 18:10:13 +0300
Message-Id: <20221008151013.2537826-3-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221008151013.2537826-1-olekstysh@gmail.com>
References: <20221008151013.2537826-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Currently, a grant ref is always based on the Xen page granularity
(4KB), and guest commonly uses the same page granularity.
But the guest may use a different page granularity (i.e 64KB).
So adopt the code to be able to deal with it.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Cc: Juergen Gross <jgross@suse.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>

Changes V1 -> V2:
   - update commit description
   - rebase
   - use xen_offset_in_page() in xen_grant_dma_map(unmap)_page()

Previous discussion is at:
https://lore.kernel.org/xen-devel/20221006120912.1948459-1-olekstysh@gmail.com/
---
 drivers/xen/grant-dma-ops.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index 1d018e3a68a0..aff0f95ed954 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -31,12 +31,12 @@ static DEFINE_XARRAY_FLAGS(xen_grant_dma_devices, XA_FLAGS_LOCK_IRQ);
 
 static inline dma_addr_t grant_to_dma(grant_ref_t grant)
 {
-	return XEN_GRANT_DMA_ADDR_OFF | ((dma_addr_t)grant << PAGE_SHIFT);
+	return XEN_GRANT_DMA_ADDR_OFF | ((dma_addr_t)grant << XEN_PAGE_SHIFT);
 }
 
 static inline grant_ref_t dma_to_grant(dma_addr_t dma)
 {
-	return (grant_ref_t)((dma & ~XEN_GRANT_DMA_ADDR_OFF) >> PAGE_SHIFT);
+	return (grant_ref_t)((dma & ~XEN_GRANT_DMA_ADDR_OFF) >> XEN_PAGE_SHIFT);
 }
 
 static struct xen_grant_dma_data *find_xen_grant_dma_data(struct device *dev)
@@ -79,7 +79,7 @@ static void *xen_grant_dma_alloc(struct device *dev, size_t size,
 				 unsigned long attrs)
 {
 	struct xen_grant_dma_data *data;
-	unsigned int i, n_pages = PFN_UP(size);
+	unsigned int i, n_pages = XEN_PFN_UP(size);
 	unsigned long pfn;
 	grant_ref_t grant;
 	void *ret;
@@ -91,14 +91,14 @@ static void *xen_grant_dma_alloc(struct device *dev, size_t size,
 	if (unlikely(data->broken))
 		return NULL;
 
-	ret = alloc_pages_exact(n_pages * PAGE_SIZE, gfp);
+	ret = alloc_pages_exact(n_pages * XEN_PAGE_SIZE, gfp);
 	if (!ret)
 		return NULL;
 
 	pfn = virt_to_pfn(ret);
 
 	if (gnttab_alloc_grant_reference_seq(n_pages, &grant)) {
-		free_pages_exact(ret, n_pages * PAGE_SIZE);
+		free_pages_exact(ret, n_pages * XEN_PAGE_SIZE);
 		return NULL;
 	}
 
@@ -116,7 +116,7 @@ static void xen_grant_dma_free(struct device *dev, size_t size, void *vaddr,
 			       dma_addr_t dma_handle, unsigned long attrs)
 {
 	struct xen_grant_dma_data *data;
-	unsigned int i, n_pages = PFN_UP(size);
+	unsigned int i, n_pages = XEN_PFN_UP(size);
 	grant_ref_t grant;
 
 	data = find_xen_grant_dma_data(dev);
@@ -138,7 +138,7 @@ static void xen_grant_dma_free(struct device *dev, size_t size, void *vaddr,
 
 	gnttab_free_grant_reference_seq(grant, n_pages);
 
-	free_pages_exact(vaddr, n_pages * PAGE_SIZE);
+	free_pages_exact(vaddr, n_pages * XEN_PAGE_SIZE);
 }
 
 static struct page *xen_grant_dma_alloc_pages(struct device *dev, size_t size,
@@ -168,9 +168,9 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
 					 unsigned long attrs)
 {
 	struct xen_grant_dma_data *data;
-	unsigned long dma_offset = offset_in_page(offset),
-			pfn_offset = PFN_DOWN(offset);
-	unsigned int i, n_pages = PFN_UP(dma_offset + size);
+	unsigned long dma_offset = xen_offset_in_page(offset),
+			pfn_offset = XEN_PFN_DOWN(offset);
+	unsigned int i, n_pages = XEN_PFN_UP(dma_offset + size);
 	grant_ref_t grant;
 	dma_addr_t dma_handle;
 
@@ -203,8 +203,8 @@ static void xen_grant_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
 				     unsigned long attrs)
 {
 	struct xen_grant_dma_data *data;
-	unsigned long offset = dma_handle & (PAGE_SIZE - 1);
-	unsigned int i, n_pages = PFN_UP(offset + size);
+	unsigned long dma_offset = xen_offset_in_page(dma_handle);
+	unsigned int i, n_pages = XEN_PFN_UP(dma_offset + size);
 	grant_ref_t grant;
 
 	if (WARN_ON(dir == DMA_NONE))
-- 
2.25.1



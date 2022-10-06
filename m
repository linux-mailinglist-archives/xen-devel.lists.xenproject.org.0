Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C7F5F65CA
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 14:10:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416846.661539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogPgt-00042N-LM; Thu, 06 Oct 2022 12:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416846.661539; Thu, 06 Oct 2022 12:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogPgt-0003zU-IF; Thu, 06 Oct 2022 12:09:27 +0000
Received: by outflank-mailman (input) for mailman id 416846;
 Thu, 06 Oct 2022 12:09:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y3UN=2H=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ogPgr-0003zN-Tu
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 12:09:25 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7e9c613-456f-11ed-964a-05401a9f4f97;
 Thu, 06 Oct 2022 14:09:24 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id g27so2463112edf.11
 for <xen-devel@lists.xenproject.org>; Thu, 06 Oct 2022 05:09:24 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 ky9-20020a170907778900b0073ddff7e432sm10353101ejc.14.2022.10.06.05.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 05:09:23 -0700 (PDT)
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
X-Inumbo-ID: b7e9c613-456f-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oezV6p4Pg66UTbe9c4t+yatYSFzeOtShFiSFXQ54qSo=;
        b=MeQbriyUIPiZobQp0WSRTktwRu3/jvvxRk0i5QonnBoZz/pZhqwGuso5KHD2on7YKW
         Bv2+dvIzSMJ2SSzqOu5+kjQ9HxQwQ7winQxJFoCQkzJM8qs9ANi7b5sOH0t9hBeFLfdH
         pMHVSPkaE+q1TXxG4SuI3OC3E3Dp5gbVjMXUxHv8CBsobEXsQJuC5Io7/APoyyw+rJGW
         +kprM4KhMvt85TFiAoqIXjIECj/zvFOUDNY8VB2LSRLB6azOjUdTsYfRq6QLnFY3Itpt
         FZAFkZYAvb5Uoi1+DnAIfy7thdere2eOKT+ZSFmbuBEF5E9S5lOcTfc1vvMkMTqz2poC
         pP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oezV6p4Pg66UTbe9c4t+yatYSFzeOtShFiSFXQ54qSo=;
        b=rPLG0ffFKJ0zh799wZxK+XFu06INyMtCdrh/TfnIBosKUQO0IpNT4M+ojxe8KFNc06
         xnICidtaMXcr/Iqc55iks2vd/39EuNCuUEmPoji3QiMay/NLp5Theh0QIkkBv3W2a8ew
         3cVaSHqQYSv2Ta2MRnTuChS6jhvUtDmVMoLi16OLINXBql860eQibuAimrR+B/5mbewh
         zKfghdVDxywh52O42K73puUW6dVpD/bjDEQAjisUR53f7XJAtQqJOmk6UpVdR9fyma4H
         V+IPysyTieP0FZ5w4Du6N1G7SmWXyJIDuK5mmbeQGe0ImgIi8BV2hzdkCaW2m5iTn8nb
         VazQ==
X-Gm-Message-State: ACrzQf0Z6gj0MZ6ONluppDxIQ6+h2RUvy6ZBGMoC4oI9HdnONET75kvY
	qa1rZ1NdoLvliwKouGEEzcQIrVnq9KM=
X-Google-Smtp-Source: AMsMyM7aU33Z5R0VlNLsXaNenVyARndTDobGsMO0OEwiDyF02B/9haEMaDcT/T5Xqho8omvVAWaV7g==
X-Received: by 2002:aa7:d614:0:b0:458:f796:f86a with SMTP id c20-20020aa7d614000000b00458f796f86amr4256860edr.294.1665058163906;
        Thu, 06 Oct 2022 05:09:23 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>
Subject: [PATCH] xen/virtio: Convert PAGE_SIZE/PAGE_SHIFT/PFN_UP to Xen counterparts
Date: Thu,  6 Oct 2022 15:09:12 +0300
Message-Id: <20221006120912.1948459-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Although XEN_PAGE_SIZE is equal to PAGE_SIZE (4KB) for now, it would
be more correct to use Xen specific #define-s as XEN_PAGE_SIZE can
be changed at some point in the future.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Cc: Juergen Gross <jgross@suse.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>

As it was proposed at:
https://lore.kernel.org/xen-devel/20221005174823.1800761-1-olekstysh@gmail.com/

Should go in only after that series.
---
 drivers/xen/grant-dma-ops.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index c66f56d24013..5392fdc25dca 100644
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
@@ -168,7 +168,7 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
 					 unsigned long attrs)
 {
 	struct xen_grant_dma_data *data;
-	unsigned int i, n_pages = PFN_UP(offset + size);
+	unsigned int i, n_pages = XEN_PFN_UP(offset + size);
 	grant_ref_t grant;
 	dma_addr_t dma_handle;
 
@@ -200,8 +200,8 @@ static void xen_grant_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
 				     unsigned long attrs)
 {
 	struct xen_grant_dma_data *data;
-	unsigned long offset = dma_handle & (PAGE_SIZE - 1);
-	unsigned int i, n_pages = PFN_UP(offset + size);
+	unsigned long offset = dma_handle & ~XEN_PAGE_MASK;
+	unsigned int i, n_pages = XEN_PFN_UP(offset + size);
 	grant_ref_t grant;
 
 	if (WARN_ON(dir == DMA_NONE))
-- 
2.25.1



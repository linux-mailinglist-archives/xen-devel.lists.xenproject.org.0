Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B8345A5CF
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 15:37:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229645.397117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpWur-0006iv-1e; Tue, 23 Nov 2021 14:37:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229645.397117; Tue, 23 Nov 2021 14:37:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpWuq-0006g9-Tx; Tue, 23 Nov 2021 14:37:00 +0000
Received: by outflank-mailman (input) for mailman id 229645;
 Tue, 23 Nov 2021 14:36:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PpN+=QK=gmail.com=ltykernel@srs-se1.protection.inumbo.net>)
 id 1mpWup-0006Ps-88
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 14:36:59 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfb13703-4c6a-11ec-9787-a32c541c8605;
 Tue, 23 Nov 2021 15:36:58 +0100 (CET)
Received: by mail-pl1-x62e.google.com with SMTP id u11so17250882plf.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Nov 2021 06:36:58 -0800 (PST)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:1:af65:c3d4:6df:5a8b])
 by smtp.gmail.com with ESMTPSA id j13sm11926127pfc.151.2021.11.23.06.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 06:36:56 -0800 (PST)
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
X-Inumbo-ID: cfb13703-4c6a-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QpP/dVmOy5UI+0bbwin5PnSriAWO01VAYDyEmLKe5Fk=;
        b=Tns3ImBlGwbXQEnuXBDpy3hfX/I57KzAQqzM3rfc/vmFboVTSl/I6VWtckE0lrNt9f
         9o0hG/IsvIqRXsVDJbm9KcQ491JrNXQNp5gLdD/ePiEHl32ytjY9MFvU/nXa0CKrfIL9
         NhvqWfjcpDbShn56ZLrJVZd0maDUipkSoZtT8lZpz0DsD5IlZB4rsMuH6DkT7kLsWa2T
         qnZHRJS1wKCoPc+cxZhcwYsqCV4QcXrRxBLsG67ibI0aEf+xl101z94jp0ZDHru7b+mC
         LjCXAjCKBarnhztxXaod+KRBPc77VtIyPBL3hDRuKpWjn9GSug0LMVfy7qo5aZN7XV/W
         bC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QpP/dVmOy5UI+0bbwin5PnSriAWO01VAYDyEmLKe5Fk=;
        b=tbEVRfoWR99EV2O1TiTe/twQ3PkNI6C3vzjV9c5AR3+OQZxma+0sP1XER91MgKmvcw
         a5ZisU3Y/Jt57HAWytOySi0Z0nYMSuqiGDW6H1rMkABOUj9fFVvHt7zSMy3iTLK18otN
         VrVaaPC2+jL9d/L8phHacvg9ji+qgTjvhxRuOMyheOHgGrErWIrdA49QzW5Rc2252Rr3
         at6Fr+XUa0WWIxsS/jfW+t8+31EgHac7NNDYca/o1n5ivvy3mZDwqs/rffn0TO0vRrjq
         gHF+yqIyFwSYRufhziTAxbqtoEnvT4niMhhPRvhMd8RwD3rTIJoFY/Pm3Gk01fuTLYlL
         6tMw==
X-Gm-Message-State: AOAM530pdBf1mkQtt3F8N+9wHR9/xrod1FRUGhLdEDaq2Kd9mGpoL2aQ
	8nJTbUsw1ZcPHUz4XjEQJD0=
X-Google-Smtp-Source: ABdhPJwD/E686Op6vkRlhXfD+ipZl5W4QS/7JsYfB5j69XU4jttPeJXYmrrgxGuPk3lE+qDj7Iz0QA==
X-Received: by 2002:a17:90a:7086:: with SMTP id g6mr3595594pjk.34.1637678217055;
        Tue, 23 Nov 2021 06:36:57 -0800 (PST)
From: Tianyu Lan <ltykernel@gmail.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	peterz@infradead.org,
	jgross@suse.com,
	sstabellini@kernel.org,
	boris.ostrovsky@oracle.com,
	kys@microsoft.com,
	haiyangz@microsoft.com,
	sthemmin@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	joro@8bytes.org,
	will@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	Tianyu.Lan@microsoft.com,
	thomas.lendacky@amd.com,
	xen-devel@lists.xenproject.org,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	brijesh.singh@amd.com,
	konrad.wilk@oracle.com,
	parri.andrea@gmail.com,
	dave.hansen@intel.com
Subject: [PATCH V2 2/6] dma-mapping: Add vmap/vunmap_noncontiguous() callback in dma ops
Date: Tue, 23 Nov 2021 09:30:33 -0500
Message-Id: <20211123143039.331929-3-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123143039.331929-1-ltykernel@gmail.com>
References: <20211123143039.331929-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

Hyper-V netvsc driver needs to allocate noncontiguous DMA memory and
remap it into unencrypted address space before sharing with host. Add
vmap/vunmap_noncontiguous() callback and handle the remap in the Hyper-V
dma ops callback.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 include/linux/dma-map-ops.h |  3 +++
 kernel/dma/mapping.c        | 18 ++++++++++++++----
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 0d5b06b3a4a6..f7b9958ca20a 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -27,6 +27,9 @@ struct dma_map_ops {
 			unsigned long attrs);
 	void (*free_noncontiguous)(struct device *dev, size_t size,
 			struct sg_table *sgt, enum dma_data_direction dir);
+	void *(*vmap_noncontiguous)(struct device *dev, size_t size,
+			struct sg_table *sgt);
+	void (*vunmap_noncontiguous)(struct device *dev, void *addr);
 	int (*mmap)(struct device *, struct vm_area_struct *,
 			void *, dma_addr_t, size_t, unsigned long attrs);
 
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 9478eccd1c8e..7fd751d866cc 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -674,8 +674,14 @@ void *dma_vmap_noncontiguous(struct device *dev, size_t size,
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
 
-	if (ops && ops->alloc_noncontiguous)
-		return vmap(sgt_handle(sgt)->pages, count, VM_MAP, PAGE_KERNEL);
+	if (ops) {
+		if (ops->vmap_noncontiguous)
+			return ops->vmap_noncontiguous(dev, size, sgt);
+		else if (ops->alloc_noncontiguous)
+			return vmap(sgt_handle(sgt)->pages, count, VM_MAP,
+				    PAGE_KERNEL);
+	}
+
 	return page_address(sg_page(sgt->sgl));
 }
 EXPORT_SYMBOL_GPL(dma_vmap_noncontiguous);
@@ -684,8 +690,12 @@ void dma_vunmap_noncontiguous(struct device *dev, void *vaddr)
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
-	if (ops && ops->alloc_noncontiguous)
-		vunmap(vaddr);
+	if (ops) {
+		if (ops->vunmap_noncontiguous)
+			ops->vunmap_noncontiguous(dev, vaddr);
+		else if (ops->alloc_noncontiguous)
+			vunmap(vaddr);
+	}
 }
 EXPORT_SYMBOL_GPL(dma_vunmap_noncontiguous);
 
-- 
2.25.1



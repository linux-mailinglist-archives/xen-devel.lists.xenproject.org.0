Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5713F9D9C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 19:22:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173823.317192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJfYP-0005UM-QV; Fri, 27 Aug 2021 17:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173823.317192; Fri, 27 Aug 2021 17:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJfYP-0005Rq-L4; Fri, 27 Aug 2021 17:22:09 +0000
Received: by outflank-mailman (input) for mailman id 173823;
 Fri, 27 Aug 2021 17:22:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=brRM=NS=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mJfYN-00016Q-Nw
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 17:22:07 +0000
Received: from mail-pl1-x634.google.com (unknown [2607:f8b0:4864:20::634])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb8ffdf7-506e-44c6-affc-63f9c055b5d3;
 Fri, 27 Aug 2021 17:21:44 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id j2so4364855pll.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Aug 2021 10:21:44 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:36:ef50:8fcd:44d1:eb17])
 by smtp.gmail.com with ESMTPSA id f5sm7155015pjo.23.2021.08.27.10.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 10:21:43 -0700 (PDT)
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
X-Inumbo-ID: bb8ffdf7-506e-44c6-affc-63f9c055b5d3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QzDpud8qjO7DGAwSDqVcLhrCIaPCA+FlLB1tYtC1F1E=;
        b=lzOMpy7gjTg0QsI9X1B0zDEO5w8A3tTHDaA3Newvm7Dl3CUxrum/hXz2a9YiW/zbl9
         DWBNfsfAuWLVXW+6052ehJsSra7WuCaqDcfvuVRm/H1XSNDcmZV21gls+k03o8B15EvO
         WllzL/XxkMvOhuAI1ingj47d+lIZ1gqKkC9D8tlfwvTv21qcSq6y1ob7HKk5txM1NLLs
         ZHs1WkgWMZEeRaubjxDUO3RgjimMTGd3vjBVskF/18NptrHuYNJudZP4Ttd3US16Hi3t
         /3kG52lIvLDBHlCYO8E/XcfFGifWx7bIZTkC4gv5hSXuX9FWgCaJwm8f8Mjy2h7PQgiL
         HXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QzDpud8qjO7DGAwSDqVcLhrCIaPCA+FlLB1tYtC1F1E=;
        b=DSRQMfk3XapHI27ROmtXvxOmpI5JbCA8ZsM+wZbafCMB0oHjUKQbIdxnhxQr6QqVFb
         tQvB/tftBKAL847a4CjiC+MVgmS6DzlUCz05LmEzm6Tvbk5ONsk0FYIteHh+EQ2ZlOwU
         jSzcmyxLOCh7jQJL7i7yQa5lyWtWrLogGl0RrvRADgnVl/wWOhzC8RBVPZA6x69Brvj/
         VfM3ou8eQdtsfG2neAr5NV97/Hg1Cw8G5YggXd21iaw+i648eAoceI9Mycsf4zUnNE36
         rIRoCRCcGganK7SWIfv1C7q7KdtSaEdpWHlVd/ut6XHDq2o1tCO7utROTPclkkLPiZZp
         qBfQ==
X-Gm-Message-State: AOAM531u9sjO6Z4ItkQI/2edLIE2DkkswNk6X+rZ35tWNwCIKyjMIf3/
	h1aQfk/KwTsxLjD8lpTRhJI=
X-Google-Smtp-Source: ABdhPJyGYNb/dCSEWaVblCRuQOF/Z6LafmEQvufqDOpzfIgc7L3h2vFfPqAmiAB3tW+rcK6DfA1aiQ==
X-Received: by 2002:a17:902:bf49:b0:136:7033:8963 with SMTP id u9-20020a170902bf4900b0013670338963mr9726914pls.75.1630084904216;
        Fri, 27 Aug 2021 10:21:44 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	sthemmin@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	konrad.wilk@oracle.com,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	joro@8bytes.org,
	davem@davemloft.net,
	kuba@kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	brijesh.singh@amd.com,
	thomas.lendacky@amd.com,
	Tianyu.Lan@microsoft.com,
	pgonda@google.com,
	martin.b.radev@gmail.com,
	akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com,
	rppt@kernel.org,
	hannes@cmpxchg.org,
	aneesh.kumar@linux.ibm.com,
	krish.sadhukhan@oracle.com,
	saravanand@fb.com,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	rientjes@google.com,
	ardb@kernel.org,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	parri.andrea@gmail.com,
	dave.hansen@intel.com
Subject: [PATCH V4 09/13] DMA: Add dma_map_decrypted/dma_unmap_encrypted() function
Date: Fri, 27 Aug 2021 13:21:07 -0400
Message-Id: <20210827172114.414281-10-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210827172114.414281-1-ltykernel@gmail.com>
References: <20210827172114.414281-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

In Hyper-V Isolation VM with AMD SEV, swiotlb boucne buffer
needs to be mapped into address space above vTOM and so
introduce dma_map_decrypted/dma_unmap_encrypted() to map/unmap
bounce buffer memory. The platform can populate man/unmap callback
in the dma memory decrypted ops. The swiotlb bounce buffer
PA will be returned to driver and used for DMA address. The new
mapped virtual address is just to acess bounce buffer in the
swiotlb code. PAs passed to DMA API still have backing struct page.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 include/linux/dma-map-ops.h |  9 +++++++++
 kernel/dma/mapping.c        | 22 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 0d53a96a3d64..01d60a024e45 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -71,6 +71,11 @@ struct dma_map_ops {
 	unsigned long (*get_merge_boundary)(struct device *dev);
 };
 
+struct dma_memory_decrypted_ops {
+	void *(*map)(void *addr, unsigned long size);
+	void (*unmap)(void *addr);
+};
+
 #ifdef CONFIG_DMA_OPS
 #include <asm/dma-mapping.h>
 
@@ -374,6 +379,10 @@ static inline void debug_dma_dump_mappings(struct device *dev)
 }
 #endif /* CONFIG_DMA_API_DEBUG */
 
+void *dma_map_decrypted(void *addr, unsigned long size);
+int dma_unmap_decrypted(void *addr, unsigned long size);
+
 extern const struct dma_map_ops dma_dummy_ops;
+extern struct dma_memory_decrypted_ops dma_memory_generic_decrypted_ops;
 
 #endif /* _LINUX_DMA_MAP_OPS_H */
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 2b06a809d0b9..6fb150dc1750 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -13,11 +13,13 @@
 #include <linux/of_device.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
+#include <asm/set_memory.h>
 #include "debug.h"
 #include "direct.h"
 
 bool dma_default_coherent;
 
+struct dma_memory_decrypted_ops dma_memory_generic_decrypted_ops;
 /*
  * Managed DMA API
  */
@@ -736,3 +738,23 @@ unsigned long dma_get_merge_boundary(struct device *dev)
 	return ops->get_merge_boundary(dev);
 }
 EXPORT_SYMBOL_GPL(dma_get_merge_boundary);
+
+void *dma_map_decrypted(void *addr, unsigned long size)
+{
+	if (set_memory_decrypted((unsigned long)addr,
+				 size / PAGE_SIZE))
+		return NULL;
+
+	if (dma_memory_generic_decrypted_ops.map)
+		return dma_memory_generic_decrypted_ops.map(addr, size);
+	else
+		return addr;
+}
+
+int dma_unmap_encrypted(void *addr, unsigned long size)
+{
+	if (dma_memory_generic_decrypted_ops.unmap)
+		dma_memory_generic_decrypted_ops.unmap(addr);
+
+	return set_memory_encrypted((unsigned long)addr, size / PAGE_SIZE);
+}
-- 
2.25.1



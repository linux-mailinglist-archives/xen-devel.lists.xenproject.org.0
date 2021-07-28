Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5BF3D9132
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 16:54:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161610.296684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8kwS-0006wq-FZ; Wed, 28 Jul 2021 14:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161610.296684; Wed, 28 Jul 2021 14:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8kwS-0006tr-Ak; Wed, 28 Jul 2021 14:53:52 +0000
Received: by outflank-mailman (input) for mailman id 161610;
 Wed, 28 Jul 2021 14:53:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=si+Y=MU=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1m8kwQ-0002W0-Q5
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 14:53:50 +0000
Received: from mail-pl1-x62c.google.com (unknown [2607:f8b0:4864:20::62c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id caea6084-847c-49f8-a00a-2b631b3bfcbd;
 Wed, 28 Jul 2021 14:53:30 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id n10so3010650plf.4
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jul 2021 07:53:30 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:0:3823:141e:6d51:f0ad])
 by smtp.gmail.com with ESMTPSA id n134sm277558pfd.89.2021.07.28.07.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 07:53:29 -0700 (PDT)
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
X-Inumbo-ID: caea6084-847c-49f8-a00a-2b631b3bfcbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fRYEBTeqaJZ2nuhpRxylpNXV0HYL+RYR+rak5A96Ekw=;
        b=sig9nFz8eF+R0264OvGZWIOLFWHbYjYEwR2pu5Gx18nTH1XR1cSX7qthexUthkJGnF
         pJ3gnLUuVZV82sVUwcehqWiFsrDdsp1tZqg/jE/39e470wf89bUSF5Q65P+BWFm5oA6l
         tdiu0+NkRbrdrY5sf+SlZYMVQQRnay/soDyBm9yR+3Sk7hPDtBJcXtSKp6bbcAlin5vP
         TxrwmdY7JJpG3nMN0Kpik8j7JBNr1h1zSYFRfmYey7tr/PqG3AfyBn5BZzutMLEWs9dk
         Q8BFOoHDdjXEgX/RmQsfZ/nngsOe/X2TpZTA23wyhqE+8CwnuHHe28EpNrXDO0BWSkNE
         89qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fRYEBTeqaJZ2nuhpRxylpNXV0HYL+RYR+rak5A96Ekw=;
        b=iSff11AjMloSoGUAY+Q6TcmGDBSoYIyqYUEOQbcLu3/i7jIr+c2fMsFPUVBrKlFJC/
         yTGh23QuqfvLgxPxiLxPvxw3cv/VMSYTa/mTkehugXoNOXY7euepjvcA9kkI9n/e8mcS
         B2UOUvs1XBqjHJtklbM2wXAzdtxP/rhyrQtfSvDJfTcpPpzDDwnPE3h3Gb59OTWuED0y
         phIlOkf3fdc9V2wIsaQ01wbhqPZH2K+ZWr9QyjAji9uHIZklpIGU56EHwClnajr6y/Hx
         kg8vCNj9hzUJJZLJfq1pyzXCLlJHxM7bENOuX4Zt4apzuN9QV255f0LNz9o8qYEBWiP2
         jc9A==
X-Gm-Message-State: AOAM532MCIvE5qk1UQnibecBpvez9c9W+iL/DZgTV2RUO7Wsh/i9gU5C
	u2KiPMsNiPZBYkFd1Mido8c=
X-Google-Smtp-Source: ABdhPJw5OcxnrbSJBNvT8e2xeKUOHmvmo/7aRU5B5UYJ8E3STm6ku1q9/sANkCbS99R2obrk00cckA==
X-Received: by 2002:a17:90b:385:: with SMTP id ga5mr6922305pjb.183.1627484010063;
        Wed, 28 Jul 2021 07:53:30 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	sthemmin@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
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
	will@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	arnd@arndb.de,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	thomas.lendacky@amd.com,
	brijesh.singh@amd.com,
	ardb@kernel.org,
	Tianyu.Lan@microsoft.com,
	rientjes@google.com,
	martin.b.radev@gmail.com,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	kirill.shutemov@linux.intel.com,
	aneesh.kumar@linux.ibm.com,
	krish.sadhukhan@oracle.com,
	saravanand@fb.com,
	xen-devel@lists.xenproject.org,
	pgonda@google.com,
	david@redhat.com,
	keescook@chromium.org,
	hannes@cmpxchg.org,
	sfr@canb.auug.org.au,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	anparri@microsoft.com
Subject: [PATCH 09/13] DMA: Add dma_map_decrypted/dma_unmap_encrypted() function
Date: Wed, 28 Jul 2021 10:52:24 -0400
Message-Id: <20210728145232.285861-10-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728145232.285861-1-ltykernel@gmail.com>
References: <20210728145232.285861-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

In Hyper-V Isolation VM with AMD SEV, swiotlb boucne buffer
needs to be mapped into address space above vTOM and so
introduce dma_map_decrypted/dma_unmap_encrypted() to map/unmap
bounce buffer memory. The platform can populate man/unmap callback
in the dma memory decrypted ops.

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



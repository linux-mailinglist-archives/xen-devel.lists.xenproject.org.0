Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F4D3E4B91
	for <lists+xen-devel@lfdr.de>; Mon,  9 Aug 2021 19:57:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165136.301858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD9WU-0004jy-A1; Mon, 09 Aug 2021 17:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165136.301858; Mon, 09 Aug 2021 17:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD9WU-0004hf-4S; Mon, 09 Aug 2021 17:57:14 +0000
Received: by outflank-mailman (input) for mailman id 165136;
 Mon, 09 Aug 2021 17:57:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD4O=NA=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mD9WS-0000Aq-2T
 for xen-devel@lists.xenproject.org; Mon, 09 Aug 2021 17:57:12 +0000
Received: from mail-pj1-x1034.google.com (unknown [2607:f8b0:4864:20::1034])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60695c2f-9ef7-4655-bef2-fdc8136d411f;
 Mon, 09 Aug 2021 17:56:46 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id j1so29235990pjv.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Aug 2021 10:56:46 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:2:106e:6ed1:5da1:2ac4])
 by smtp.gmail.com with ESMTPSA id x14sm20589708pfa.127.2021.08.09.10.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 10:56:46 -0700 (PDT)
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
X-Inumbo-ID: 60695c2f-9ef7-4655-bef2-fdc8136d411f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PA42IhHl11PQF+ziOZyqqkyOZi1yWIuNrwvqLKrflPI=;
        b=h/75TBkZzgYxlqy+5bEldf+iKBjJjuhF9/Luw6D8+gOXVqnAuffjZyZ8csnCHDNkaP
         TBTvI5UGDLYZrsK4GmYd4KQc+RdWgrfqYrfbFj4qldX8+cUJjwg+jP8IXuDHZJNZVkMx
         dqt2tJ9id7Atn6XSeMLFGDJd1i/ItPabnc2w1Ou3dfKiAut9APiCcAttSlaxhKd7OD/O
         LOEDuYsC/sv3oUNGHz6aktEyuu3eBzTJBZiHW3J5x/IjafBs1g2Y/KGYNhEkna86o9xN
         FAWDsRYmSWvZzVnsYGN53JtMkrKJ/gW510NPFotXeN7Wa7z/uT9Mf7pgcf/x7yOe62Mi
         h8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PA42IhHl11PQF+ziOZyqqkyOZi1yWIuNrwvqLKrflPI=;
        b=XCmUvGKUZfSWQEvCA6K+UY0VSl9F1n3WD9qdz2BEILH0ToJUSBW1Tg3tO+XKbnzAu1
         zedmeI5qGQTjMO1pW6vczUpd3/nrhxP9Xf6eZNeGJsi2sHs1GbWiooTgL3V/zEI/1v3r
         WVkbZVsJM8b27x7X1yRowcfMTNJklLsXiVLlMgFQDbpYeMEl+DLG0cogN5Ij02LA3CpD
         M10AvcrTY950D3VyoNQOtkRBmfITAC87ltiY91wFYOmDrtIfg3/Ykt7ynL+Z5IGl3AWh
         byvkTBJk5kyx4kwl0AXi0q+ovo5PCtdYK9KX9RY1C1sRPON+LEQV4sD5fvJz+dVNDxKC
         8iug==
X-Gm-Message-State: AOAM531KqHsjj0njPjIV+2b3am3D3LrSSrzZTkoUWRwIf26VOtoBP+LO
	QW0dE4VWH0r6BVRrR3RBlUo=
X-Google-Smtp-Source: ABdhPJz2DoChBqY2+CqrU5gCYpuDqXcBgTbb8ssn2WkHPgcTXqW+Ddha4uJTbpahTSBY5KgKQGNxrQ==
X-Received: by 2002:a17:902:8f87:b029:12c:dda2:39bf with SMTP id z7-20020a1709028f87b029012cdda239bfmr21283718plo.59.1628531806316;
        Mon, 09 Aug 2021 10:56:46 -0700 (PDT)
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
	pgonda@google.com,
	martin.b.radev@gmail.com,
	akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com,
	rppt@kernel.org,
	sfr@canb.auug.org.au,
	saravanand@fb.com,
	krish.sadhukhan@oracle.com,
	aneesh.kumar@linux.ibm.com,
	xen-devel@lists.xenproject.org,
	rientjes@google.com,
	hannes@cmpxchg.org,
	tj@kernel.org,
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
Subject: [PATCH V3 09/13] DMA: Add dma_map_decrypted/dma_unmap_encrypted() function
Date: Mon,  9 Aug 2021 13:56:13 -0400
Message-Id: <20210809175620.720923-10-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809175620.720923-1-ltykernel@gmail.com>
References: <20210809175620.720923-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

In Hyper-V Isolation VM with AMD SEV, swiotlb boucne buffer
needs to be mapped into address space above vTOM and so
introduce dma_map_decrypted/dma_unmap_encrypted() to map/unmap
bounce buffer memory. The platform can populate man/unmap callback
in the dma memory decrypted ops.
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



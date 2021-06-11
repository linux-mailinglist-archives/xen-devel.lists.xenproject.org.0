Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BB83A4511
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 17:28:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140424.259496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrj4Z-00014S-SA; Fri, 11 Jun 2021 15:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140424.259496; Fri, 11 Jun 2021 15:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrj4Z-00011x-Oa; Fri, 11 Jun 2021 15:27:51 +0000
Received: by outflank-mailman (input) for mailman id 140424;
 Fri, 11 Jun 2021 15:27:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9xgm=LF=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lrj4Y-0000x4-5C
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 15:27:50 +0000
Received: from mail-pf1-x42b.google.com (unknown [2607:f8b0:4864:20::42b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f162781a-b49c-423c-8c95-ddddc34592aa;
 Fri, 11 Jun 2021 15:27:49 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id k15so4734129pfp.6
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jun 2021 08:27:49 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:33c8:8e01:1161:6797])
 by smtp.gmail.com with UTF8SMTPSA id m2sm5324723pjf.24.2021.06.11.08.27.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 08:27:48 -0700 (PDT)
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
X-Inumbo-ID: f162781a-b49c-423c-8c95-ddddc34592aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z3csfjTdnaGEbW5Yiu81rOYxUROdkDuu0pkC+1dIGAc=;
        b=IkC7yFFhO8hIfNYdMdJ54k4hExWD/qoffPbEBXy7aMHVEBwdwVaaywxk2mt0G3QZuk
         kHNUXds8Y0K0b8H58qwuxnw/8yQrewipm9rVIDVGn4pqLKNyquN2PKy3qJ+VVeLcukCR
         pIHcSWbnGwWNwrAuGd/5jq088bjDa5bnVis6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z3csfjTdnaGEbW5Yiu81rOYxUROdkDuu0pkC+1dIGAc=;
        b=KA9klA5mR5qncIBnTh7mnelRCzMZUMiV+L/GETlHNJkVDtIE3Wad9499a/cg5cuhlM
         RFrpACfheNbSSvXajC7mzSUNcmzjmY59zljBRBYTOmq3Au614C8o1LB918SU7vFTHVKK
         fWeDBYFfqVC5JDtQdlbmJeQsl8AAZqvg2DYiCfy8U5LTwpbXt3DdV8O8fE52cSCnXZo7
         OYPc221IyoEfr7WAp/sl6swqHIUeER6NAH4SydKPAmlO7/YRIffk5wXL/yxGUu5zKkAM
         ggcetl/DjOKIp3lLcGzYsz2GW/dhBcIbLbVwqIzqSUc4l/+4RG74mbvqbRwtsNwTh31I
         O3pw==
X-Gm-Message-State: AOAM531MsIg0/Tb2BFrF7OVPmf73qNHTXjo0SI8cvfrYcoZgMpPPIbfl
	c0rmKYxMkuu2wzOqpgzs1jpDqg==
X-Google-Smtp-Source: ABdhPJyj9WektlHINHWsfATaExSaFcZYhgD+NDtqPb5EwrK4uHwBuEuhV53c0IRLlzaKiXoj5cmzYw==
X-Received: by 2002:aa7:84c7:0:b029:2e9:2d18:54a5 with SMTP id x7-20020aa784c70000b02902e92d1854a5mr8750291pfn.44.1623425268566;
        Fri, 11 Jun 2021 08:27:48 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	mpe@ellerman.id.au,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: benh@kernel.crashing.org,
	paulus@samba.org,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	sstabellini@kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	grant.likely@arm.com,
	xypron.glpk@gmx.de,
	Thierry Reding <treding@nvidia.com>,
	mingo@kernel.org,
	bauerman@linux.ibm.com,
	peterz@infradead.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	heikki.krogerus@linux.intel.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	linux-devicetree <devicetree@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	xen-devel@lists.xenproject.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	Jim Quinlan <james.quinlan@broadcom.com>,
	tfiga@chromium.org,
	bskeggs@redhat.com,
	bhelgaas@google.com,
	chris@chris-wilson.co.uk,
	tientzu@chromium.org,
	daniel@ffwll.ch,
	airlied@linux.ie,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	jani.nikula@linux.intel.com,
	jxgao@google.com,
	joonas.lahtinen@linux.intel.com,
	linux-pci@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	matthew.auld@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v9 04/14] swiotlb: Add restricted DMA pool initialization
Date: Fri, 11 Jun 2021 23:26:49 +0800
Message-Id: <20210611152659.2142983-5-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611152659.2142983-1-tientzu@chromium.org>
References: <20210611152659.2142983-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the initialization function to create restricted DMA pools from
matching reserved-memory nodes.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/swiotlb.h |  3 +-
 kernel/dma/Kconfig      | 14 ++++++++
 kernel/dma/swiotlb.c    | 75 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 008125ccd509..ec0c01796c8a 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -72,7 +72,8 @@ extern enum swiotlb_force swiotlb_force;
  *		range check to see if the memory was in fact allocated by this
  *		API.
  * @nslabs:	The number of IO TLB blocks (in groups of 64) between @start and
- *		@end. This is command line adjustable via setup_io_tlb_npages.
+ *		@end. For default swiotlb, this is command line adjustable via
+ *		setup_io_tlb_npages.
  * @used:	The number of used IO TLB block.
  * @list:	The free list describing the number of free entries available
  *		from each index.
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 77b405508743..3e961dc39634 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -80,6 +80,20 @@ config SWIOTLB
 	bool
 	select NEED_DMA_MAP_STATE
 
+config DMA_RESTRICTED_POOL
+	bool "DMA Restricted Pool"
+	depends on OF && OF_RESERVED_MEM
+	select SWIOTLB
+	help
+	  This enables support for restricted DMA pools which provide a level of
+	  DMA memory protection on systems with limited hardware protection
+	  capabilities, such as those lacking an IOMMU.
+
+	  For more information see
+	  <Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt>
+	  and <kernel/dma/swiotlb.c>.
+	  If unsure, say "n".
+
 #
 # Should be selected if we can mmap non-coherent mappings to userspace.
 # The only thing that is really required is a way to set an uncached bit
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 29b950ab1351..c4a071d6a63f 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -39,6 +39,13 @@
 #ifdef CONFIG_DEBUG_FS
 #include <linux/debugfs.h>
 #endif
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/slab.h>
+#endif
 
 #include <asm/io.h>
 #include <asm/dma.h>
@@ -688,3 +695,71 @@ static int __init swiotlb_create_default_debugfs(void)
 late_initcall(swiotlb_create_default_debugfs);
 
 #endif
+
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
+				    struct device *dev)
+{
+	struct io_tlb_mem *mem = rmem->priv;
+	unsigned long nslabs = rmem->size >> IO_TLB_SHIFT;
+
+	/*
+	 * Since multiple devices can share the same pool, the private data,
+	 * io_tlb_mem struct, will be initialized by the first device attached
+	 * to it.
+	 */
+	if (!mem) {
+		mem = kzalloc(struct_size(mem, slots, nslabs), GFP_KERNEL);
+		if (!mem)
+			return -ENOMEM;
+
+		swiotlb_init_io_tlb_mem(mem, rmem->base, nslabs, false, true);
+
+		rmem->priv = mem;
+
+		if (IS_ENABLED(CONFIG_DEBUG_FS)) {
+			mem->debugfs =
+				debugfs_create_dir(rmem->name, debugfs_dir);
+			swiotlb_create_debugfs_files(mem);
+		}
+	}
+
+	dev->dma_io_tlb_mem = mem;
+
+	return 0;
+}
+
+static void rmem_swiotlb_device_release(struct reserved_mem *rmem,
+					struct device *dev)
+{
+	dev->dma_io_tlb_mem = io_tlb_default_mem;
+}
+
+static const struct reserved_mem_ops rmem_swiotlb_ops = {
+	.device_init = rmem_swiotlb_device_init,
+	.device_release = rmem_swiotlb_device_release,
+};
+
+static int __init rmem_swiotlb_setup(struct reserved_mem *rmem)
+{
+	unsigned long node = rmem->fdt_node;
+
+	if (of_get_flat_dt_prop(node, "reusable", NULL) ||
+	    of_get_flat_dt_prop(node, "linux,cma-default", NULL) ||
+	    of_get_flat_dt_prop(node, "linux,dma-default", NULL) ||
+	    of_get_flat_dt_prop(node, "no-map", NULL))
+		return -EINVAL;
+
+	if (PageHighMem(pfn_to_page(PHYS_PFN(rmem->base)))) {
+		pr_err("Restricted DMA pool must be accessible within the linear mapping.");
+		return -EINVAL;
+	}
+
+	rmem->ops = &rmem_swiotlb_ops;
+	pr_info("Reserved memory: created restricted DMA pool at %pa, size %ld MiB\n",
+		&rmem->base, (unsigned long)rmem->size / SZ_1M);
+	return 0;
+}
+
+RESERVEDMEM_OF_DECLARE(dma, "restricted-dma-pool", rmem_swiotlb_setup);
+#endif /* CONFIG_DMA_RESTRICTED_POOL */
-- 
2.32.0.272.g935e593368-goog



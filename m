Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BC346526C
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 17:03:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236087.409499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msS4f-0003B7-OU; Wed, 01 Dec 2021 16:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236087.409499; Wed, 01 Dec 2021 16:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msS4f-000357-Im; Wed, 01 Dec 2021 16:03:13 +0000
Received: by outflank-mailman (input) for mailman id 236087;
 Wed, 01 Dec 2021 16:03:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kkHa=QS=gmail.com=ltykernel@srs-se1.protection.inumbo.net>)
 id 1msS4e-0002Sl-6Y
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 16:03:12 +0000
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [2607:f8b0:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dff247e-52c0-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 17:03:11 +0100 (CET)
Received: by mail-pg1-x52a.google.com with SMTP id q16so24060421pgq.10
 for <xen-devel@lists.xenproject.org>; Wed, 01 Dec 2021 08:03:11 -0800 (PST)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:f:7fe9:3f1e:749e:5d26])
 by smtp.gmail.com with ESMTPSA id i193sm260316pfe.87.2021.12.01.08.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 08:03:09 -0800 (PST)
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
X-Inumbo-ID: 2dff247e-52c0-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wLAMPbpvKAZWRaOKURSZPZh3xKYj1Gt4MyClJOtgAw8=;
        b=QjTveNx4o5sgvmndH3bJITARz8VJfsr1N9XKDmWcLplouYsETdeAeVcMpTV5aL3RQc
         2Jbn1oE35+qrcZwO4MalG+vERTCir+RSo0cd6L5S6+ezjh9cOLpUmD94JFl3amTFgm5H
         GjCvjzVQEsrITTX50/38gC5ji5ccibs6LQnngjDJ7uJqC+GFq2dO66zseU8vSnFLFWhB
         492cwd2890tpGX8E2ksQAkURiM3+p+SmLfr/WT9HIYXSBPLSlIiguoogcrNSSOyiGvOv
         J+FjWE5u4IcpeznTj19LSiRN4ZQ4wkgR96nodqYpoXAGMncYd9kVEyh4dcZ+SRwE88Nr
         J/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wLAMPbpvKAZWRaOKURSZPZh3xKYj1Gt4MyClJOtgAw8=;
        b=cBs9lToqUkvzmnel3MaZngW2kj+97yi5VXl+W55Ru65al01xmZrTpN3yGkQrfbIAuv
         Q5m1mANBRDI4Nl/wcnFquT7z1Ns6oVOb2Y/Z6hC4d1i/kA1EJ3eedCsaUJqM3KYUDiM+
         M2NvwmNhNII4uUx1ei3U8sFdDsOnUV/hUYfOOswWfZR2YxUaTTDYvOeru5AHFBTAWgVN
         GmU7GLSZ/aBITMM/QPpe1BguS9D5A4doNWUb7wy81QXbG9NFepPZB5/lZUUB9kJRGd0v
         HPwgssbDjkA2/2sMC9oZMhJHcygS7MZjVTOrH7McdeQk7xA2NdGM+Yrbq9ruLbD4P4xT
         Ch/A==
X-Gm-Message-State: AOAM531f/qcxII/UGPN+DRdvKCmRudnJZ/RHtCMjjuEgEyRADmBSZOuZ
	idEDdTh5bHwog3mfvq5Y7o4=
X-Google-Smtp-Source: ABdhPJwCOrEjcXULS6IsRuHQYw88ti0kK9hc/beS0BPepNxz/EDJIwT27gio08ZRg1Vj4i4WW4qECg==
X-Received: by 2002:a63:904a:: with SMTP id a71mr5401908pge.528.1638374589720;
        Wed, 01 Dec 2021 08:03:09 -0800 (PST)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	sthemmin@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	boris.ostrovsky@oracle.com,
	joro@8bytes.org,
	will@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	arnd@arndb.de,
	hch@infradead.org,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	Tianyu.Lan@microsoft.com,
	thomas.lendacky@amd.com,
	xen-devel@lists.xenproject.org,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	brijesh.singh@amd.com,
	konrad.wilk@oracle.com,
	hch@lst.de,
	parri.andrea@gmail.com,
	dave.hansen@intel.com
Subject: [PATCH V3 3/5] hyperv/IOMMU: Enable swiotlb bounce buffer for Isolation VM
Date: Wed,  1 Dec 2021 11:02:54 -0500
Message-Id: <20211201160257.1003912-4-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201160257.1003912-1-ltykernel@gmail.com>
References: <20211201160257.1003912-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

hyperv Isolation VM requires bounce buffer support to copy
data from/to encrypted memory and so enable swiotlb force
mode to use swiotlb bounce buffer for DMA transaction.

In Isolation VM with AMD SEV, the bounce buffer needs to be
accessed via extra address space which is above shared_gpa_boundary
(E.G 39 bit address line) reported by Hyper-V CPUID ISOLATION_CONFIG.
The access physical address will be original physical address +
shared_gpa_boundary. The shared_gpa_boundary in the AMD SEV SNP
spec is called virtual top of memory(vTOM). Memory addresses below
vTOM are automatically treated as private while memory above
vTOM is treated as shared.

Hyper-V initalizes swiotlb bounce buffer and default swiotlb
needs to be disabled. pci_swiotlb_detect_override() and
pci_swiotlb_detect_4gb() enable the default one. To override
the setting, hyperv_swiotlb_detect() needs to run before
these detect functions which depends on the pci_xen_swiotlb_
init(). Make pci_xen_swiotlb_init() depends on the hyperv_swiotlb
_detect() to keep the order.

Swiotlb bounce buffer code calls set_memory_decrypted()
to mark bounce buffer visible to host and map it in extra
address space via memremap. Populate the shared_gpa_boundary
(vTOM) via swiotlb_unencrypted_base variable.

The map function memremap() can't work in the early place
hyperv_iommu_swiotlb_init() and so call swiotlb_update_mem_attributes()
in the hyperv_iommu_swiotlb_later_init().

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 arch/x86/xen/pci-swiotlb-xen.c |  3 +-
 drivers/hv/vmbus_drv.c         |  3 ++
 drivers/iommu/hyperv-iommu.c   | 56 ++++++++++++++++++++++++++++++++++
 include/linux/hyperv.h         |  8 +++++
 4 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/pci-swiotlb-xen.c b/arch/x86/xen/pci-swiotlb-xen.c
index 46df59aeaa06..30fd0600b008 100644
--- a/arch/x86/xen/pci-swiotlb-xen.c
+++ b/arch/x86/xen/pci-swiotlb-xen.c
@@ -4,6 +4,7 @@
 
 #include <linux/dma-map-ops.h>
 #include <linux/pci.h>
+#include <linux/hyperv.h>
 #include <xen/swiotlb-xen.h>
 
 #include <asm/xen/hypervisor.h>
@@ -91,6 +92,6 @@ int pci_xen_swiotlb_init_late(void)
 EXPORT_SYMBOL_GPL(pci_xen_swiotlb_init_late);
 
 IOMMU_INIT_FINISH(pci_xen_swiotlb_detect,
-		  NULL,
+		  hyperv_swiotlb_detect,
 		  pci_xen_swiotlb_init,
 		  NULL);
diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 392c1ac4f819..0a64ccfafb8b 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -33,6 +33,7 @@
 #include <linux/random.h>
 #include <linux/kernel.h>
 #include <linux/syscore_ops.h>
+#include <linux/dma-map-ops.h>
 #include <clocksource/hyperv_timer.h>
 #include "hyperv_vmbus.h"
 
@@ -2078,6 +2079,7 @@ struct hv_device *vmbus_device_create(const guid_t *type,
 	return child_device_obj;
 }
 
+static u64 vmbus_dma_mask = DMA_BIT_MASK(64);
 /*
  * vmbus_device_register - Register the child device
  */
@@ -2118,6 +2120,7 @@ int vmbus_device_register(struct hv_device *child_device_obj)
 	}
 	hv_debug_add_dev_dir(child_device_obj);
 
+	child_device_obj->device.dma_mask = &vmbus_dma_mask;
 	return 0;
 
 err_kset_unregister:
diff --git a/drivers/iommu/hyperv-iommu.c b/drivers/iommu/hyperv-iommu.c
index e285a220c913..dd729d49a1eb 100644
--- a/drivers/iommu/hyperv-iommu.c
+++ b/drivers/iommu/hyperv-iommu.c
@@ -13,14 +13,20 @@
 #include <linux/irq.h>
 #include <linux/iommu.h>
 #include <linux/module.h>
+#include <linux/hyperv.h>
+#include <linux/io.h>
 
 #include <asm/apic.h>
 #include <asm/cpu.h>
 #include <asm/hw_irq.h>
 #include <asm/io_apic.h>
+#include <asm/iommu.h>
+#include <asm/iommu_table.h>
 #include <asm/irq_remapping.h>
 #include <asm/hypervisor.h>
 #include <asm/mshyperv.h>
+#include <asm/swiotlb.h>
+#include <linux/dma-direct.h>
 
 #include "irq_remapping.h"
 
@@ -337,4 +343,54 @@ static const struct irq_domain_ops hyperv_root_ir_domain_ops = {
 	.free = hyperv_root_irq_remapping_free,
 };
 
+static void __init hyperv_iommu_swiotlb_init(void)
+{
+	unsigned long hyperv_io_tlb_size;
+	void *hyperv_io_tlb_start;
+
+	/*
+	 * Allocate Hyper-V swiotlb bounce buffer at early place
+	 * to reserve large contiguous memory.
+	 */
+	hyperv_io_tlb_size = swiotlb_size_or_default();
+	hyperv_io_tlb_start = memblock_alloc(hyperv_io_tlb_size, PAGE_SIZE);
+
+	if (!hyperv_io_tlb_start)
+		pr_warn("Fail to allocate Hyper-V swiotlb buffer.\n");
+
+	swiotlb_init_with_tbl(hyperv_io_tlb_start,
+			      hyperv_io_tlb_size >> IO_TLB_SHIFT, true);
+}
+
+int __init hyperv_swiotlb_detect(void)
+{
+	if (!hypervisor_is_type(X86_HYPER_MS_HYPERV))
+		return 0;
+
+	if (!hv_is_isolation_supported())
+		return 0;
+
+	/*
+	 * Enable swiotlb force mode in Isolation VM to
+	 * use swiotlb bounce buffer for dma transaction.
+	 */
+	if (hv_isolation_type_snp())
+		swiotlb_unencrypted_base = ms_hyperv.shared_gpa_boundary;
+	swiotlb_force = SWIOTLB_FORCE;
+	return 1;
+}
+
+static void __init hyperv_iommu_swiotlb_later_init(void)
+{
+	/*
+	 * Swiotlb bounce buffer needs to be mapped in extra address
+	 * space. Map function doesn't work in the early place and so
+	 * call swiotlb_update_mem_attributes() here.
+	 */
+	swiotlb_update_mem_attributes();
+}
+
+IOMMU_INIT_FINISH(hyperv_swiotlb_detect,
+		  NULL, hyperv_iommu_swiotlb_init,
+		  hyperv_iommu_swiotlb_later_init);
 #endif
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index b823311eac79..1f037e114dc8 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -1726,6 +1726,14 @@ int hyperv_write_cfg_blk(struct pci_dev *dev, void *buf, unsigned int len,
 int hyperv_reg_block_invalidate(struct pci_dev *dev, void *context,
 				void (*block_invalidate)(void *context,
 							 u64 block_mask));
+#if IS_ENABLED(CONFIG_HYPERV)
+int __init hyperv_swiotlb_detect(void);
+#else
+static inline int __init hyperv_swiotlb_detect(void)
+{
+	return 0;
+}
+#endif
 
 struct hyperv_pci_block_ops {
 	int (*read_block)(struct pci_dev *dev, void *buf, unsigned int buf_len,
-- 
2.25.1



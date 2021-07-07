Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B75E53BEB24
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 17:42:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152456.281679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19gh-0000dS-Bk; Wed, 07 Jul 2021 15:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152456.281679; Wed, 07 Jul 2021 15:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19gh-0000Yb-55; Wed, 07 Jul 2021 15:42:11 +0000
Received: by outflank-mailman (input) for mailman id 152456;
 Wed, 07 Jul 2021 15:42:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hxnL=L7=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1m19ai-0000vf-Li
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 15:36:00 +0000
Received: from mail-pf1-x42e.google.com (unknown [2607:f8b0:4864:20::42e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19862674-945a-422a-8f4e-5732b1ceaeca;
 Wed, 07 Jul 2021 15:35:28 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id x16so2477304pfa.13
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jul 2021 08:35:28 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:0:6b7f:cf3e:bbf2:d229])
 by smtp.gmail.com with ESMTPSA id y11sm21096877pfo.160.2021.07.07.08.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:35:27 -0700 (PDT)
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
X-Inumbo-ID: 19862674-945a-422a-8f4e-5732b1ceaeca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uSViD25AWGJ6J+QgAwUoKBubGeqJPy/dkYcV0Fzox+c=;
        b=hxtJfit4Ppjmah6XFuSxBgEgKz4f338nj5l+EvxtZhggrVRUinn9AOrQHtV3DDZKcM
         Ej5ATK6iOzTsbjVivb/g+9BTMQWADu3EwiqxqN0N034NnjHVc5RFaWjZZi8FrmBMNjDc
         kTVnavRihE+IY8ODngcmJiywHcuNcHf6IcItZHfq52OJ3mn628/zSiJ1ZgbxaWVOUSz0
         Bsu309dV76TSTZYXHHmFastBrfBKRfU/I05CMDCuXl3O9z1Cu5af5rOCjJWqoHIbc7yU
         FHWKIg6ac9HX4tS5ngN1//k6dwB1ZObR8FLS5h0F4YZI3QaLm7LWUf48h70wjoQGvKbN
         Okyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uSViD25AWGJ6J+QgAwUoKBubGeqJPy/dkYcV0Fzox+c=;
        b=HO5JWDOL0N9JZ/957z4iJA/U3TkP3N7DNjZEOj2jxjlCg1wasgpzSUgjaHJL8unN89
         bAhyOqnKPEbJbbKgNO5lhUGqz5yISVJg2Mal+kQODEdRqS4ZqlBCJPYsmxbDMDg6KiIF
         TiCuX3RrdFV2uTv8EWoUMfGTgH7qqUSV6xS5/5cc9mQrVwgLCR7n7hoQUQ6PFP74o40j
         gWMGlKH4Bty45/fZDTVGZ6f8L2/xbBQNFdBOwIuRpHdLsXGP8ijIKbe3KMZSWn36PEWu
         7PtkwCyTKzjsHg32rHF6v04UimSzPq6aEiKg7kuHOBpJGbYn0bALWcRHJKSzj38D68S1
         1F5A==
X-Gm-Message-State: AOAM532J2SWUoYbEqSq7jjpnLdgO0sPp6wyIlUen3FaK78f9S0AS5TPj
	aSlCfFBh7Ubmv1BX1rYV+PU=
X-Google-Smtp-Source: ABdhPJxV4DDJMJ1p4O1TlHaSs9jPf4KD9VnkCZ6P4EFyDuvhbptUFuslKTwEut8HFiRhRRaysKUCzA==
X-Received: by 2002:a63:4b23:: with SMTP id y35mr26837209pga.179.1625672128224;
        Wed, 07 Jul 2021 08:35:28 -0700 (PDT)
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
	rppt@kernel.org,
	akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com,
	Tianyu.Lan@microsoft.com,
	thomas.lendacky@amd.com,
	ardb@kernel.org,
	nramas@linux.microsoft.com,
	robh@kernel.org,
	keescook@chromium.org,
	rientjes@google.com,
	pgonda@google.com,
	martin.b.radev@gmail.com,
	hannes@cmpxchg.org,
	saravanand@fb.com,
	krish.sadhukhan@oracle.com,
	xen-devel@lists.xenproject.org,
	tj@kernel.org,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	brijesh.singh@amd.com,
	anparri@microsoft.com
Subject: [RFC PATCH V4 09/12] HV/IOMMU: Enable swiotlb bounce buffer for Isolation VM
Date: Wed,  7 Jul 2021 11:34:50 -0400
Message-Id: <20210707153456.3976348-10-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210707153456.3976348-1-ltykernel@gmail.com>
References: <20210707153456.3976348-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

Hyper-V Isolation VM requires bounce buffer support to copy
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

Swiotlb bounce buffer code calls set_memory_decrypted_map()
to mark bounce buffer visible to host and map it in extra
address space.

Hyper-V initalizes swiotlb bounce buffer and default swiotlb
needs to be disabled. pci_swiotlb_detect_override() and
pci_swiotlb_detect_4gb() enable the default one. To override
the setting, hyperv_swiotlb_detect() needs to run before
these detect functions which depends on the pci_xen_swiotlb_
init(). Make pci_xen_swiotlb_init() depends on the hyperv_swiotlb
_detect() to keep the order.

The map function vmap_pfn() can't work in the early place
hyperv_iommu_swiotlb_init() and so initialize swiotlb bounce
buffer in the hyperv_iommu_swiotlb_later_init().

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 arch/x86/xen/pci-swiotlb-xen.c |  3 +-
 drivers/hv/vmbus_drv.c         |  3 ++
 drivers/iommu/hyperv-iommu.c   | 62 ++++++++++++++++++++++++++++++++++
 include/linux/hyperv.h         |  1 +
 4 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/pci-swiotlb-xen.c b/arch/x86/xen/pci-swiotlb-xen.c
index 54f9aa7e8457..43bd031aa332 100644
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
index 92cb3f7d21d9..5e3bb76d4dee 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -23,6 +23,7 @@
 #include <linux/cpu.h>
 #include <linux/sched/task_stack.h>
 
+#include <linux/dma-map-ops.h>
 #include <linux/delay.h>
 #include <linux/notifier.h>
 #include <linux/ptrace.h>
@@ -2080,6 +2081,7 @@ struct hv_device *vmbus_device_create(const guid_t *type,
 	return child_device_obj;
 }
 
+static u64 vmbus_dma_mask = DMA_BIT_MASK(64);
 /*
  * vmbus_device_register - Register the child device
  */
@@ -2120,6 +2122,7 @@ int vmbus_device_register(struct hv_device *child_device_obj)
 	}
 	hv_debug_add_dev_dir(child_device_obj);
 
+	child_device_obj->device.dma_mask = &vmbus_dma_mask;
 	return 0;
 
 err_kset_unregister:
diff --git a/drivers/iommu/hyperv-iommu.c b/drivers/iommu/hyperv-iommu.c
index e285a220c913..d7ea8e05b991 100644
--- a/drivers/iommu/hyperv-iommu.c
+++ b/drivers/iommu/hyperv-iommu.c
@@ -13,14 +13,22 @@
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
+#include <linux/dma-map-ops.h>
+#include <linux/dma-direct.h>
+#include <linux/set_memory.h>
 
 #include "irq_remapping.h"
 
@@ -36,6 +44,8 @@
 static cpumask_t ioapic_max_cpumask = { CPU_BITS_NONE };
 static struct irq_domain *ioapic_ir_domain;
 
+static unsigned long hyperv_io_tlb_start, hyperv_io_tlb_size;
+
 static int hyperv_ir_set_affinity(struct irq_data *data,
 		const struct cpumask *mask, bool force)
 {
@@ -337,4 +347,56 @@ static const struct irq_domain_ops hyperv_root_ir_domain_ops = {
 	.free = hyperv_root_irq_remapping_free,
 };
 
+void __init hyperv_iommu_swiotlb_init(void)
+{
+	unsigned long bytes;
+	void *vstart;
+
+	/*
+	 * Allocate Hyper-V swiotlb bounce buffer at early place
+	 * to reserve large contiguous memory.
+	 */
+	hyperv_io_tlb_size = 200 * 1024 * 1024;
+	hyperv_io_tlb_start = memblock_alloc_low(PAGE_ALIGN(hyperv_io_tlb_size),
+						 HV_HYP_PAGE_SIZE);
+
+	if (!hyperv_io_tlb_start) {
+		pr_warn("Fail to allocate Hyper-V swiotlb buffer.\n");
+		return;
+	}
+}
+
+int __init hyperv_swiotlb_detect(void)
+{
+	if (hypervisor_is_type(X86_HYPER_MS_HYPERV)
+	    && hv_is_isolation_supported()) {
+		/*
+		 * Enable swiotlb force mode in Isolation VM to
+		 * use swiotlb bounce buffer for dma transaction.
+		 */
+		swiotlb_force = SWIOTLB_FORCE;
+		return 1;
+	}
+
+	return 0;
+}
+
+void __init hyperv_iommu_swiotlb_later_init(void)
+{
+	void *hyperv_io_tlb_remap;
+	int ret;
+
+	/*
+	 * Swiotlb bounce buffer needs to be mapped in extra address
+	 * space. Map function doesn't work in the early place and so
+	 * call swiotlb_late_init_with_tbl() here.
+	 */
+	swiotlb_late_init_with_tbl(hyperv_io_tlb_start,
+				   hyperv_io_tlb_size >> IO_TLB_SHIFT);
+}
+
+IOMMU_INIT_FINISH(hyperv_swiotlb_detect,
+		  NULL, hyperv_iommu_swiotlb_init,
+		  hyperv_iommu_swiotlb_later_init);
+
 #endif
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index 06eccaba10c5..babbe19f57e2 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -1759,6 +1759,7 @@ int hyperv_write_cfg_blk(struct pci_dev *dev, void *buf, unsigned int len,
 int hyperv_reg_block_invalidate(struct pci_dev *dev, void *context,
 				void (*block_invalidate)(void *context,
 							 u64 block_mask));
+int __init hyperv_swiotlb_detect(void);
 
 struct hyperv_pci_block_ops {
 	int (*read_block)(struct pci_dev *dev, void *buf, unsigned int buf_len,
-- 
2.25.1



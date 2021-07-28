Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B603D915B
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 16:56:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161641.296708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8kyi-0000wg-A6; Wed, 28 Jul 2021 14:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161641.296708; Wed, 28 Jul 2021 14:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8kyi-0000uK-6p; Wed, 28 Jul 2021 14:56:12 +0000
Received: by outflank-mailman (input) for mailman id 161641;
 Wed, 28 Jul 2021 14:56:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=si+Y=MU=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1m8kwf-0002W0-QT
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 14:54:05 +0000
Received: from mail-pj1-x1030.google.com (unknown [2607:f8b0:4864:20::1030])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b789a6f-3217-48bf-9c36-bcf2610749da;
 Wed, 28 Jul 2021 14:53:35 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso10456227pjb.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jul 2021 07:53:35 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:0:3823:141e:6d51:f0ad])
 by smtp.gmail.com with ESMTPSA id n134sm277558pfd.89.2021.07.28.07.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 07:53:34 -0700 (PDT)
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
X-Inumbo-ID: 9b789a6f-3217-48bf-9c36-bcf2610749da
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qzKwcvVxhca+ciJXqg2U8rozm2nSDx+vDxmGytYMFV8=;
        b=GFuVrx3l5pZLm7DeD09JNxJc3JkwdPBsDYP6JO873zFO4XMaIgVpNG/+WnOETKVtlY
         m//je+3k3RFHUddjBm0pO6wsDR0v8tDSjlTNdabGQhBaYE/QmhtzACKofhAuxSjK5RZQ
         a9RVmPr8+9jibtDYFMsOe0DZ0UvDQ/qIBlFczmN179r7qv1WKZ68P6JibJNeXK2MJfMX
         Sclrix9Bced5k2g6C76vFA2OCMBX1PEDh5DZT3RicuRM6O9ReK9XFn+n9XnpC6vFDCM9
         GWJYFJqK9kpg2ISP1Z5IOjZTYuASDNkUkIq5IL2nXb7/q2S0EKYvEh1kjrR6EX6Z06I7
         /V4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qzKwcvVxhca+ciJXqg2U8rozm2nSDx+vDxmGytYMFV8=;
        b=OMSdsdjYGm65LN3tP/vPGU6JwCgbk0/xxKXWdRmYd3QgPrkjmDtY6cfoQrUZLK+Lkq
         KkQZfjliFKy7nGYyuCAgA1HohRuvnixj0HDHh1vr0GA1iKSM1IAFctffCNNn4vifnRsM
         nTHKl9uTbMy1BXl5nhh5sBBN7/cX9qDK6JRjFzIIqu0m5R9yJaO9Rq1UIp0zRNniU5tZ
         RMYDQ40SU+ys6FpHPb00y4dAhLuAnscZxUDFfyaAZrqxPzuFeg1NDuNOxcn/sS5BdPwY
         rrwpN4C3p2aFI+4dGWDqtJr4TDdDi/tdoAXLlAyKR8THUc2GINEShQHcRNcr4rstu6rT
         Z55Q==
X-Gm-Message-State: AOAM530OlZ7xAMYeMcvKgLIoSk06u/461IBk+JQuHBZIdJTz4YabrmwD
	ckfT9xIeca3Coo+fJiqKwag=
X-Google-Smtp-Source: ABdhPJxp/Z+0x7njF0HYKpDRe1xQUzsvfMQucpsS0v4OrFXzODEQULJTIW6YK80P2I/aGYtZMapg7Q==
X-Received: by 2002:a17:902:b40b:b029:12b:997f:5677 with SMTP id x11-20020a170902b40bb029012b997f5677mr143577plr.11.1627484014488;
        Wed, 28 Jul 2021 07:53:34 -0700 (PDT)
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
Subject: [PATCH 11/13] HV/IOMMU: Enable swiotlb bounce buffer for Isolation VM
Date: Wed, 28 Jul 2021 10:52:26 -0400
Message-Id: <20210728145232.285861-12-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728145232.285861-1-ltykernel@gmail.com>
References: <20210728145232.285861-1-ltykernel@gmail.com>
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

Swiotlb bounce buffer code calls dma_map_decrypted()
to mark bounce buffer visible to host and map it in extra
address space. Populate dma memory decrypted ops with hv
map/unmap function.

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
 arch/x86/hyperv/ivm.c           | 28 ++++++++++++++
 arch/x86/include/asm/mshyperv.h |  2 +
 arch/x86/xen/pci-swiotlb-xen.c  |  3 +-
 drivers/hv/vmbus_drv.c          |  3 ++
 drivers/iommu/hyperv-iommu.c    | 65 +++++++++++++++++++++++++++++++++
 include/linux/hyperv.h          |  1 +
 6 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/arch/x86/hyperv/ivm.c b/arch/x86/hyperv/ivm.c
index 13bab7f07085..9fbb5cbf3321 100644
--- a/arch/x86/hyperv/ivm.c
+++ b/arch/x86/hyperv/ivm.c
@@ -266,3 +266,31 @@ int hv_set_mem_enc(unsigned long addr, int numpages, bool enc)
 			enc ? VMBUS_PAGE_NOT_VISIBLE
 			: VMBUS_PAGE_VISIBLE_READ_WRITE);
 }
+
+/*
+ * hv_map_memory - map memory to extra space in the AMD SEV-SNP Isolation VM.
+ */
+void *hv_map_memory(void *addr, unsigned long size)
+{
+	unsigned long *pfns = kcalloc(size / HV_HYP_PAGE_SIZE,
+				      sizeof(unsigned long), GFP_KERNEL);
+	void *vaddr;
+	int i;
+
+	if (!pfns)
+		return (unsigned long)NULL;
+
+	for (i = 0; i < size / HV_HYP_PAGE_SIZE; i++)
+		pfns[i] = virt_to_hvpfn(addr + i * HV_HYP_PAGE_SIZE) +
+			(ms_hyperv.shared_gpa_boundary >> HV_HYP_PAGE_SHIFT);
+
+	vaddr = vmap_pfn(pfns, size / HV_HYP_PAGE_SIZE,	PAGE_KERNEL_IO);
+	kfree(pfns);
+
+	return vaddr;
+}
+
+void hv_unmap_memory(void *addr)
+{
+	vunmap(addr);
+}
diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
index 8bf26e6e7055..b815ec0bc36d 100644
--- a/arch/x86/include/asm/mshyperv.h
+++ b/arch/x86/include/asm/mshyperv.h
@@ -249,6 +249,8 @@ int hv_map_ioapic_interrupt(int ioapic_id, bool level, int vcpu, int vector,
 int hv_unmap_ioapic_interrupt(int ioapic_id, struct hv_interrupt_entry *entry);
 int hv_mark_gpa_visibility(u16 count, const u64 pfn[], u32 visibility);
 int hv_set_mem_enc(unsigned long addr, int numpages, bool enc);
+void *hv_map_memory(void *addr, unsigned long size);
+void hv_unmap_memory(void *addr);
 void hv_sint_wrmsrl_ghcb(u64 msr, u64 value);
 void hv_sint_rdmsrl_ghcb(u64 msr, u64 *value);
 void hv_signal_eom_ghcb(void);
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
index 57bbbaa4e8f7..f068e22a5636 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -23,6 +23,7 @@
 #include <linux/cpu.h>
 #include <linux/sched/task_stack.h>
 
+#include <linux/dma-map-ops.h>
 #include <linux/delay.h>
 #include <linux/notifier.h>
 #include <linux/panic_notifier.h>
@@ -2081,6 +2082,7 @@ struct hv_device *vmbus_device_create(const guid_t *type,
 	return child_device_obj;
 }
 
+static u64 vmbus_dma_mask = DMA_BIT_MASK(64);
 /*
  * vmbus_device_register - Register the child device
  */
@@ -2121,6 +2123,7 @@ int vmbus_device_register(struct hv_device *child_device_obj)
 	}
 	hv_debug_add_dev_dir(child_device_obj);
 
+	child_device_obj->device.dma_mask = &vmbus_dma_mask;
 	return 0;
 
 err_kset_unregister:
diff --git a/drivers/iommu/hyperv-iommu.c b/drivers/iommu/hyperv-iommu.c
index e285a220c913..089617085a69 100644
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
@@ -337,4 +347,59 @@ static const struct irq_domain_ops hyperv_root_ir_domain_ops = {
 	.free = hyperv_root_irq_remapping_free,
 };
 
+void __init hyperv_iommu_swiotlb_init(void)
+{
+	unsigned long bytes;
+
+	/*
+	 * Allocate Hyper-V swiotlb bounce buffer at early place
+	 * to reserve large contiguous memory.
+	 */
+	hyperv_io_tlb_size = 256 * 1024 * 1024;
+	hyperv_io_tlb_start =
+		(unsigned long)memblock_alloc_low(
+				  PAGE_ALIGN(hyperv_io_tlb_size),
+				  HV_HYP_PAGE_SIZE);
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
+
+		dma_memory_generic_decrypted_ops.map = hv_map_memory;
+		dma_memory_generic_decrypted_ops.unmap = hv_unmap_memory;
+		return 1;
+	}
+
+	return 0;
+}
+
+void __init hyperv_iommu_swiotlb_later_init(void)
+{
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



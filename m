Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6159463F513
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 17:18:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451021.708608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0mG5-0003DL-8z; Thu, 01 Dec 2022 16:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451021.708608; Thu, 01 Dec 2022 16:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0mG5-0003BB-66; Thu, 01 Dec 2022 16:17:57 +0000
Received: by outflank-mailman (input) for mailman id 451021;
 Thu, 01 Dec 2022 16:17:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ShmB=37=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1p0mG3-0002as-R2
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 16:17:55 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b5fbf219-7193-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 17:17:54 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB3DCD6E;
 Thu,  1 Dec 2022 08:18:00 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 289A73F73B;
 Thu,  1 Dec 2022 08:17:53 -0800 (PST)
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
X-Inumbo-ID: b5fbf219-7193-11ed-91b6-6bf2151ebd3b
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 17/21] xen/arm: vsmmuv3: Alloc virq for virtual SMMUv3
Date: Thu,  1 Dec 2022 16:02:41 +0000
Message-Id: <1eb767c65e4ca07c6d10c7dc2cdb514535a4b484.1669888522.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669888522.git.rahul.singh@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alloc and reserve virq for event queue and global error to send event to
guests. Also Modify the libxl to accomadate the new define virq.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 tools/libs/light/libxl_arm.c           | 24 ++++++++++++++++++++++--
 xen/arch/arm/domain_build.c            | 11 +++++++++++
 xen/drivers/passthrough/arm/vsmmu-v3.c | 10 ++++++++++
 3 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 00fcbd466c..f2bb7d40dc 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -66,8 +66,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
 {
     uint32_t nr_spis = 0;
     unsigned int i;
-    uint32_t vuart_irq, virtio_irq = 0;
-    bool vuart_enabled = false, virtio_enabled = false;
+    uint32_t vuart_irq, virtio_irq = 0, vsmmu_irq = 0;
+    bool vuart_enabled = false, virtio_enabled = false, vsmmu_enabled = false;
     uint64_t virtio_mmio_base = GUEST_VIRTIO_MMIO_BASE;
     uint32_t virtio_mmio_irq = GUEST_VIRTIO_MMIO_SPI_FIRST;
 
@@ -81,6 +81,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         vuart_enabled = true;
     }
 
+    if (d_config->num_pcidevs || d_config->b_info.device_tree) {
+        nr_spis += (GUEST_VSMMU_SPI - 32) + 1;
+        vsmmu_irq = GUEST_VSMMU_SPI;
+        vsmmu_enabled = true;
+    }
+
     for (i = 0; i < d_config->num_disks; i++) {
         libxl_device_disk *disk = &d_config->disks[i];
 
@@ -136,6 +142,11 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
             return ERROR_FAIL;
         }
 
+        if (vsmmu_enabled && irq == vsmmu_irq) {
+            LOG(ERROR, "Physical IRQ %u conflicting with vSMMUv3 SPI\n", irq);
+            return ERROR_FAIL;
+        }
+
         if (irq < 32)
             continue;
 
@@ -837,6 +848,7 @@ static int make_vsmmuv3_node(libxl__gc *gc, void *fdt,
 {
     int res;
     const char *name = GCSPRINTF("iommu@%llx", GUEST_VSMMUV3_BASE);
+    gic_interrupt intr;
 
     res = fdt_begin_node(fdt, name);
     if (res) return res;
@@ -855,6 +867,14 @@ static int make_vsmmuv3_node(libxl__gc *gc, void *fdt,
     res = fdt_property_cell(fdt, "#iommu-cells", 1);
     if (res) return res;
 
+    res = fdt_property_string(fdt, "interrupt-names", "combined");
+    if (res) return res;
+
+    set_interrupt(intr, GUEST_VSMMU_SPI, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
+
+    res = fdt_property_interrupts(gc, fdt, &intr, 1);
+    if (res) return res;
+
     res = fdt_end_node(fdt);
     if (res) return res;
 
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 29f00b18ec..8e85fb7854 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2329,6 +2329,7 @@ static int __init make_vsmmuv3_node(const struct kernel_info *kinfo)
     char buf[24];
     __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
     __be32 *cells;
+    gic_interrupt_t intr;
     void *fdt = kinfo->fdt;
 
     snprintf(buf, sizeof(buf), "iommu@%llx", GUEST_VSMMUV3_BASE);
@@ -2359,6 +2360,16 @@ static int __init make_vsmmuv3_node(const struct kernel_info *kinfo)
     if ( res )
         return res;
 
+    res = fdt_property_string(fdt, "interrupt-names", "combined");
+    if ( res )
+        return res;
+
+    set_interrupt(intr, GUEST_VSMMU_SPI, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
+
+    res = fdt_property_interrupts(kinfo, &intr, 1);
+    if ( res )
+        return res;
+
     res = fdt_end_node(fdt);
 
     return res;
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
index 031c1f74b6..b280b70da0 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -728,6 +728,7 @@ static const struct mmio_handler_ops vsmmuv3_mmio_handler = {
 static int vsmmuv3_init_single(struct domain *d, paddr_t addr,
                                paddr_t size, uint32_t virq)
 {
+    int ret;
     struct virt_smmu *smmu;
 
     smmu = xzalloc(struct virt_smmu);
@@ -743,12 +744,21 @@ static int vsmmuv3_init_single(struct domain *d, paddr_t addr,
 
     spin_lock_init(&smmu->cmd_queue_lock);
 
+    ret = vgic_reserve_virq(d, virq);
+    if ( !ret )
+        goto out;
+
     register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);
 
     /* Register the vIOMMU to be able to clean it up later. */
     list_add_tail(&smmu->viommu_list, &d->arch.viommu_list);
 
     return 0;
+
+out:
+    xfree(smmu);
+    vgic_free_virq(d, virq);
+    return ret;
 }
 
 int domain_vsmmuv3_init(struct domain *d)
-- 
2.25.1



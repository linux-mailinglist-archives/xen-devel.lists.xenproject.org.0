Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F15246D916
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 18:00:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242521.419449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv0Il-0007oF-6e; Wed, 08 Dec 2021 17:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242521.419449; Wed, 08 Dec 2021 17:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv0Il-0007li-1L; Wed, 08 Dec 2021 17:00:19 +0000
Received: by outflank-mailman (input) for mailman id 242521;
 Wed, 08 Dec 2021 17:00:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ity+=QZ=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mv0Ik-0007YL-4C
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 17:00:18 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5174d5e4-5848-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 18:00:17 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id k37so6876994lfv.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Dec 2021 09:00:17 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b14sm302767lfs.174.2021.12.08.09.00.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Dec 2021 09:00:16 -0800 (PST)
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
X-Inumbo-ID: 5174d5e4-5848-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=81m5aay7mqcIHbcdPLJDtuGC8d74B9O4SgnireXM5ns=;
        b=hzyD77kPTFC66YBPoae4G3/pYUiXGuzXjN58wQsDPhHzfL31T8VTyzC5v0+kwmRl5P
         orm9pBoax8V/VIx9m7YbANRtMun60PNArlU5ibbnagzv4RX3b5PVL/J/tbPo/Tlwp0Oq
         Vt2Jp8Ng1T2fxl9/+NU2rVteHgdLFqli6fMX09rahqDVkA6WeCtRJu+pi2VEJn3PZ1yr
         vvk05MOWuPhayMOYkDN3UQiTHUyQOD4OsSGmLSkncfvAqo72R440ZphGsKY8GaFFkarj
         P0oY69awUd22tJ87eRorAU9mgMk4AOVBKWzd8Sg3fp3kW9ee7iFxWOKuN6tdxa5a32/N
         n7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=81m5aay7mqcIHbcdPLJDtuGC8d74B9O4SgnireXM5ns=;
        b=DqVxua6wAqFtxHO4SQ6k+VUOKBmR0WPdRFGKRSCVk+hFdqlssufLskK+Frr9EaSY61
         MtJe8RlHtkf59z7RJGIFw5wPmfrX4tKokIqafb/qSD4ngYw2wSqZP8M8lgNKJo27Z9FW
         6qYErfZbnXNWEjKnyfEvwyU38sFfWmBJRK/3PVTm6oeYpr59kdp2BxRvLy8PBkFYxWZQ
         XqG456+HzX/BqpUrTKio4xK1KbzmfOEyj814Wum5WUzbwyh/dG/74iWYBkryeiPHQQfa
         dY232hKjYB/mE6Lbvkcwkl4lcu/bzj6/1zTq2hEITwrvNLWNZIblEhQZ8UQ7l900Cgt0
         xjEQ==
X-Gm-Message-State: AOAM531YyfqRuZ+d0/dPLA69mKrcyhpDlUyLMasGQAK2ja24EkMuBPYV
	LVp06oGuke3SScmdj1DGkspQbeuFQF0=
X-Google-Smtp-Source: ABdhPJxfg7yYPHPLVOrdDVKMyGznmP3ycTTFsYf7nAmX+EfDot50U/ibX44L6Sy2BUcFIswNA8UlOw==
X-Received: by 2002:ac2:4e61:: with SMTP id y1mr616845lfs.459.1638982816400;
        Wed, 08 Dec 2021 09:00:16 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH V6 2/2] libxl: Introduce basic virtio-mmio support on Arm
Date: Wed,  8 Dec 2021 18:59:44 +0200
Message-Id: <1638982784-14390-3-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1638982784-14390-1-git-send-email-olekstysh@gmail.com>
References: <1638982784-14390-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Julien Grall <julien.grall@arm.com>

This patch introduces helpers to allocate Virtio MMIO params
(IRQ and memory region) and create specific device node in
the Guest device-tree with allocated params. In order to deal
with multiple Virtio devices, reserve corresponding ranges.
For now, we reserve 1MB for memory regions and 10 SPIs.

As these helpers should be used for every Virtio device attached
to the Guest, call them for Virtio disk(s).

Please note, with statically allocated Virtio IRQs there is
a risk of a clash with a physical IRQs of passthrough devices.
For the first version, it's fine, but we should consider allocating
the Virtio IRQs automatically. Thankfully, we know in advance which
IRQs will be used for passthrough to be able to choose non-clashed
ones.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - was squashed with:
     "[RFC PATCH V1 09/12] libxl: Handle virtio-mmio irq in more correct way"
     "[RFC PATCH V1 11/12] libxl: Insert "dma-coherent" property into virtio-mmio device node"
     "[RFC PATCH V1 12/12] libxl: Fix duplicate memory node in DT"
   - move VirtIO MMIO #define-s to xen/include/public/arch-arm.h

Changes V1 -> V2:
   - update the author of a patch

Changes V2 -> V3:
   - no changes

Changes V3 -> V4:
   - no changes

Changes V4 -> V5:
   - split the changes, change the order of the patches
   - drop an extra "virtio" configuration option
   - update patch description
   - use CONTAINER_OF instead of own implementation
   - reserve ranges for Virtio MMIO params and put them
     in correct location
   - create helpers to allocate Virtio MMIO params, add
     corresponding sanity-сhecks
   - add comment why MMIO size 0x200 is chosen
   - update debug print
   - drop Wei's T-b

Changes V5 -> V6:
   - rebase on current staging
---
 tools/libs/light/libxl_arm.c  | 131 +++++++++++++++++++++++++++++++++++++++++-
 xen/include/public/arch-arm.h |   7 +++
 2 files changed, 136 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index eef1de0..d475249 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -8,6 +8,56 @@
 #include <assert.h>
 #include <xen/device_tree_defs.h>
 
+/*
+ * There is no clear requirements for the total size of Virtio MMIO region.
+ * The size of control registers is 0x100 and device-specific configuration
+ * registers starts at the offset 0x100, however it's size depends on the device
+ * and the driver. Pick the biggest known size at the moment to cover most
+ * of the devices (also consider allowing the user to configure the size via
+ * config file for the one not conforming with the proposed value).
+ */
+#define VIRTIO_MMIO_DEV_SIZE   xen_mk_ullong(0x200)
+
+static uint64_t virtio_mmio_base;
+static uint32_t virtio_mmio_irq;
+
+static void init_virtio_mmio_params(void)
+{
+    virtio_mmio_base = GUEST_VIRTIO_MMIO_BASE;
+    virtio_mmio_irq = GUEST_VIRTIO_MMIO_SPI_FIRST;
+}
+
+static uint64_t alloc_virtio_mmio_base(libxl__gc *gc)
+{
+    uint64_t base = virtio_mmio_base;
+
+    /* Make sure we have enough reserved resources */
+    if ((virtio_mmio_base + VIRTIO_MMIO_DEV_SIZE >
+        GUEST_VIRTIO_MMIO_BASE + GUEST_VIRTIO_MMIO_SIZE)) {
+        LOG(ERROR, "Ran out of reserved range for Virtio MMIO BASE 0x%"PRIx64"\n",
+            virtio_mmio_base);
+        return 0;
+    }
+    virtio_mmio_base += VIRTIO_MMIO_DEV_SIZE;
+
+    return base;
+}
+
+static uint32_t alloc_virtio_mmio_irq(libxl__gc *gc)
+{
+    uint32_t irq = virtio_mmio_irq;
+
+    /* Make sure we have enough reserved resources */
+    if (virtio_mmio_irq > GUEST_VIRTIO_MMIO_SPI_LAST) {
+        LOG(ERROR, "Ran out of reserved range for Virtio MMIO IRQ %u\n",
+            virtio_mmio_irq);
+        return 0;
+    }
+    virtio_mmio_irq++;
+
+    return irq;
+}
+
 static const char *gicv_to_string(libxl_gic_version gic_version)
 {
     switch (gic_version) {
@@ -26,8 +76,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
 {
     uint32_t nr_spis = 0;
     unsigned int i;
-    uint32_t vuart_irq;
-    bool vuart_enabled = false;
+    uint32_t vuart_irq, virtio_irq = 0;
+    bool vuart_enabled = false, virtio_enabled = false;
 
     /*
      * If pl011 vuart is enabled then increment the nr_spis to allow allocation
@@ -39,6 +89,35 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         vuart_enabled = true;
     }
 
+    /*
+     * Virtio MMIO params are non-unique across the whole system and must be
+     * initialized for every new guest.
+     */
+    init_virtio_mmio_params();
+    for (i = 0; i < d_config->num_disks; i++) {
+        libxl_device_disk *disk = &d_config->disks[i];
+
+        if (disk->virtio) {
+            disk->base = alloc_virtio_mmio_base(gc);
+            if (!disk->base)
+                return ERROR_FAIL;
+
+            disk->irq = alloc_virtio_mmio_irq(gc);
+            if (!disk->irq)
+                return ERROR_FAIL;
+
+            if (virtio_irq < disk->irq)
+                virtio_irq = disk->irq;
+            virtio_enabled = true;
+
+            LOG(DEBUG, "Allocate Virtio MMIO params for Vdev %s: IRQ %u BASE 0x%"PRIx64,
+                disk->vdev, disk->irq, disk->base);
+        }
+    }
+
+    if (virtio_enabled)
+        nr_spis += (virtio_irq - 32) + 1;
+
     for (i = 0; i < d_config->b_info.num_irqs; i++) {
         uint32_t irq = d_config->b_info.irqs[i];
         uint32_t spi;
@@ -58,6 +137,13 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
             return ERROR_FAIL;
         }
 
+        /* The same check as for vpl011 */
+        if (virtio_enabled &&
+           (irq >= GUEST_VIRTIO_MMIO_SPI_FIRST && irq <= virtio_irq)) {
+            LOG(ERROR, "Physical IRQ %u conflicting with Virtio MMIO IRQ range\n", irq);
+            return ERROR_FAIL;
+        }
+
         if (irq < 32)
             continue;
 
@@ -787,6 +873,39 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
     return 0;
 }
 
+
+static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
+                                 uint64_t base, uint32_t irq)
+{
+    int res;
+    gic_interrupt intr;
+    /* Placeholder for virtio@ + a 64-bit number + \0 */
+    char buf[24];
+
+    snprintf(buf, sizeof(buf), "virtio@%"PRIx64, base);
+    res = fdt_begin_node(fdt, buf);
+    if (res) return res;
+
+    res = fdt_property_compat(gc, fdt, 1, "virtio,mmio");
+    if (res) return res;
+
+    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                            1, base, VIRTIO_MMIO_DEV_SIZE);
+    if (res) return res;
+
+    set_interrupt(intr, irq, 0xf, DT_IRQ_TYPE_EDGE_RISING);
+    res = fdt_property_interrupts(gc, fdt, &intr, 1);
+    if (res) return res;
+
+    res = fdt_property(fdt, "dma-coherent", NULL, 0);
+    if (res) return res;
+
+    res = fdt_end_node(fdt);
+    if (res) return res;
+
+    return 0;
+}
+
 static const struct arch_info *get_arch_info(libxl__gc *gc,
                                              const struct xc_dom_image *dom)
 {
@@ -988,6 +1107,7 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
     size_t fdt_size = 0;
     int pfdt_size = 0;
     libxl_domain_build_info *const info = &d_config->b_info;
+    unsigned int i;
 
     const libxl_version_info *vers;
     const struct arch_info *ainfo;
@@ -1094,6 +1214,13 @@ next_resize:
         if (d_config->num_pcidevs)
             FDT( make_vpci_node(gc, fdt, ainfo, dom) );
 
+        for (i = 0; i < d_config->num_disks; i++) {
+            libxl_device_disk *disk = &d_config->disks[i];
+
+            if (disk->virtio)
+                FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq) );
+        }
+
         if (pfdt)
             FDT( copy_partial_fdt(gc, fdt, pfdt) );
 
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 94b3151..6dc55df 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -398,6 +398,10 @@ typedef uint64_t xen_callback_t;
 
 /* Physical Address Space */
 
+/* Virtio MMIO mappings */
+#define GUEST_VIRTIO_MMIO_BASE   xen_mk_ullong(0x02000000)
+#define GUEST_VIRTIO_MMIO_SIZE   xen_mk_ullong(0x00100000)
+
 /*
  * vGIC mappings: Only one set of mapping is used by the guest.
  * Therefore they can overlap.
@@ -484,6 +488,9 @@ typedef uint64_t xen_callback_t;
 
 #define GUEST_VPL011_SPI        32
 
+#define GUEST_VIRTIO_MMIO_SPI_FIRST   33
+#define GUEST_VIRTIO_MMIO_SPI_LAST    43
+
 /* PSCI functions */
 #define PSCI_cpu_suspend 0
 #define PSCI_cpu_off     1
-- 
2.7.4



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5065E549B12
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 20:06:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348445.574692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0oRk-0000gs-4E; Mon, 13 Jun 2022 18:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348445.574692; Mon, 13 Jun 2022 18:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0oRk-0000f2-0j; Mon, 13 Jun 2022 18:05:52 +0000
Received: by outflank-mailman (input) for mailman id 348445;
 Mon, 13 Jun 2022 18:05:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WHVA=WU=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1o0oRi-0000PT-Az
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 18:05:50 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 748dca5f-eb43-11ec-8901-93a377f238d6;
 Mon, 13 Jun 2022 20:05:49 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id g25so7095280ljm.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jun 2022 11:05:49 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 x18-20020a2e7c12000000b00253ceefb668sm1038104ljc.60.2022.06.13.11.05.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jun 2022 11:05:48 -0700 (PDT)
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
X-Inumbo-ID: 748dca5f-eb43-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8/no4G5povAlYKWryYqoB/uPXMjWMWIBagnDt/np9cE=;
        b=R2rMeqb4WT9b1A8q0cO0SmAaBv4lW1i950DDICNzrseqBRtGrFmk3WtJa+I68ATIvG
         BhvZhig8lDoO9j5S5QapC3nEtyf4BTJDY65n8fltE0tamlHC9XcWI4hSvh+yUtnJVV9C
         exq7o+RspBLP0tWXv6yaotLCclVK+TUNp1qxW4NL9dHKM0wMIxjLcuKq71DF2i9GSvw0
         kPNsVv1mwDM3hMAomApIrloIXSskIZbCVSF9UwJ/vhLFEC6LFLWOYJ0APNqXwqMp9mzO
         cJgbmBuoLWxBiJXxr4jMKviq512TiFHXcTLvRp4gblvgY93tFyig7eEESpw1+QMGqVKN
         rTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8/no4G5povAlYKWryYqoB/uPXMjWMWIBagnDt/np9cE=;
        b=F0LpOe+cVHreI95XbUKjZSMH1G9Gh7KN/kuPGXxQ0Lcly5t4dxnacgi5gDVM7qA4Uc
         trdG6+Yn9EKKvSMVRwf17vFCevXo+rLQAhY3t3hGzo/9nzI96CoWIQus/JziJIwN+CWm
         rXm1x9nW83dDCe+J6KNi/ll+gUA1nIP0qlq3pErlAw9lqYf/aXfGPR8ty1ggSKDXUwo/
         RhJZLjTjYZRLO1Qba2W88MttECwmgmabBHahYaVil7g0IlCvHuUZw+bEeeT0azU1zZxY
         Uv8pB5v77tper7ZABkHrajMOVYFIJTCaMM9bPlZiEhhry4f6CtbXPUdroh3kUUa7mTsN
         5fuQ==
X-Gm-Message-State: AJIora+5uzSXpuX0OCxzDF57UfWj+M98hh/6Ii17Hp27gwZCLkOhODOJ
	UFZLyHOLl58Xizck7CqurLZGQne04Z0=
X-Google-Smtp-Source: AGRyM1vJyps2rHLh2ex6qoGbpQqG17M8OB/GkpE3XgkGPtMShLtj/QjdZiVmmyT0AHYj/desaT4erQ==
X-Received: by 2002:a2e:81c3:0:b0:255:7dee:862e with SMTP id s3-20020a2e81c3000000b002557dee862emr413459ljg.424.1655143548520;
        Mon, 13 Jun 2022 11:05:48 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH V10 2/3] libxl: Introduce basic virtio-mmio support on Arm
Date: Mon, 13 Jun 2022 21:05:21 +0300
Message-Id: <1655143522-14356-3-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1655143522-14356-1-git-send-email-olekstysh@gmail.com>
References: <1655143522-14356-1-git-send-email-olekstysh@gmail.com>
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
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
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

Changes V6 -> V7:
   - rebase on current staging
   - add T-b and R-b tags
   - update according to the recent changes to
     "libxl: Add support for Virtio disk configuration"

Changes V7 -> V8:
   - drop T-b and R-b tags
   - make virtio_mmio_base/irq global variables to be local in
     libxl__arch_domain_prepare_config() and initialize them at
     the beginning of the function, then rework alloc_virtio_mmio_base/irq()
     to take a pointer to virtio_mmio_base/irq variables as an argument
   - update according to the recent changes to
     "libxl: Add support for Virtio disk configuration"

Changes V8 -> V9:
   - Stefano already gave his Reviewed-by, I dropped it due to the changes
   - remove the second set of parentheses for check in alloc_virtio_mmio_base()
   - clarify the updating of "nr_spis" right after num_disks loop in
     libxl__arch_domain_prepare_config() and add a comment on top of it
   - use GCSPRINTF() instead of using a buffer of a static size
     calculated by hand in make_virtio_mmio_node()

Changes V9 -> V10:
   - add Stefano's and Anthony's R-b
---
 tools/libs/light/libxl_arm.c  | 121 +++++++++++++++++++++++++++++++++++++++++-
 xen/include/public/arch-arm.h |   7 +++
 2 files changed, 126 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index eef1de0..9be9b2a 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -8,6 +8,46 @@
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
+static uint64_t alloc_virtio_mmio_base(libxl__gc *gc, uint64_t *virtio_mmio_base)
+{
+    uint64_t base = *virtio_mmio_base;
+
+    /* Make sure we have enough reserved resources */
+    if (base + VIRTIO_MMIO_DEV_SIZE >
+        GUEST_VIRTIO_MMIO_BASE + GUEST_VIRTIO_MMIO_SIZE) {
+        LOG(ERROR, "Ran out of reserved range for Virtio MMIO BASE 0x%"PRIx64"\n",
+            base);
+        return 0;
+    }
+    *virtio_mmio_base += VIRTIO_MMIO_DEV_SIZE;
+
+    return base;
+}
+
+static uint32_t alloc_virtio_mmio_irq(libxl__gc *gc, uint32_t *virtio_mmio_irq)
+{
+    uint32_t irq = *virtio_mmio_irq;
+
+    /* Make sure we have enough reserved resources */
+    if (irq > GUEST_VIRTIO_MMIO_SPI_LAST) {
+        LOG(ERROR, "Ran out of reserved range for Virtio MMIO IRQ %u\n", irq);
+        return 0;
+    }
+    (*virtio_mmio_irq)++;
+
+    return irq;
+}
+
 static const char *gicv_to_string(libxl_gic_version gic_version)
 {
     switch (gic_version) {
@@ -26,8 +66,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
 {
     uint32_t nr_spis = 0;
     unsigned int i;
-    uint32_t vuart_irq;
-    bool vuart_enabled = false;
+    uint32_t vuart_irq, virtio_irq = 0;
+    bool vuart_enabled = false, virtio_enabled = false;
+    uint64_t virtio_mmio_base = GUEST_VIRTIO_MMIO_BASE;
+    uint32_t virtio_mmio_irq = GUEST_VIRTIO_MMIO_SPI_FIRST;
 
     /*
      * If pl011 vuart is enabled then increment the nr_spis to allow allocation
@@ -39,6 +81,35 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         vuart_enabled = true;
     }
 
+    for (i = 0; i < d_config->num_disks; i++) {
+        libxl_device_disk *disk = &d_config->disks[i];
+
+        if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
+            disk->base = alloc_virtio_mmio_base(gc, &virtio_mmio_base);
+            if (!disk->base)
+                return ERROR_FAIL;
+
+            disk->irq = alloc_virtio_mmio_irq(gc, &virtio_mmio_irq);
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
+    /*
+     * Every virtio-mmio device uses one emulated SPI. If Virtio devices are
+     * present, make sure that we allocate enough SPIs for them.
+     * The resulting "nr_spis" needs to cover the highest possible SPI.
+     */
+    if (virtio_enabled)
+        nr_spis = max(nr_spis, virtio_irq - 32 + 1);
+
     for (i = 0; i < d_config->b_info.num_irqs; i++) {
         uint32_t irq = d_config->b_info.irqs[i];
         uint32_t spi;
@@ -58,6 +129,13 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
             return ERROR_FAIL;
         }
 
+        /* The same check as for vpl011 */
+        if (virtio_enabled &&
+            (irq >= GUEST_VIRTIO_MMIO_SPI_FIRST && irq <= virtio_irq)) {
+            LOG(ERROR, "Physical IRQ %u conflicting with Virtio MMIO IRQ range\n", irq);
+            return ERROR_FAIL;
+        }
+
         if (irq < 32)
             continue;
 
@@ -787,6 +865,37 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
     return 0;
 }
 
+
+static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
+                                 uint64_t base, uint32_t irq)
+{
+    int res;
+    gic_interrupt intr;
+    const char *name = GCSPRINTF("virtio@%"PRIx64, base);
+
+    res = fdt_begin_node(fdt, name);
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
@@ -988,6 +1097,7 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
     size_t fdt_size = 0;
     int pfdt_size = 0;
     libxl_domain_build_info *const info = &d_config->b_info;
+    unsigned int i;
 
     const libxl_version_info *vers;
     const struct arch_info *ainfo;
@@ -1094,6 +1204,13 @@ next_resize:
         if (d_config->num_pcidevs)
             FDT( make_vpci_node(gc, fdt, ainfo, dom) );
 
+        for (i = 0; i < d_config->num_disks; i++) {
+            libxl_device_disk *disk = &d_config->disks[i];
+
+            if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO)
+                FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq) );
+        }
+
         if (pfdt)
             FDT( copy_partial_fdt(gc, fdt, pfdt) );
 
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index ab05fe1..c8b6058 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -407,6 +407,10 @@ typedef uint64_t xen_callback_t;
 
 /* Physical Address Space */
 
+/* Virtio MMIO mappings */
+#define GUEST_VIRTIO_MMIO_BASE   xen_mk_ullong(0x02000000)
+#define GUEST_VIRTIO_MMIO_SIZE   xen_mk_ullong(0x00100000)
+
 /*
  * vGIC mappings: Only one set of mapping is used by the guest.
  * Therefore they can overlap.
@@ -493,6 +497,9 @@ typedef uint64_t xen_callback_t;
 
 #define GUEST_VPL011_SPI        32
 
+#define GUEST_VIRTIO_MMIO_SPI_FIRST   33
+#define GUEST_VIRTIO_MMIO_SPI_LAST    43
+
 /* PSCI functions */
 #define PSCI_cpu_suspend 0
 #define PSCI_cpu_off     1
-- 
2.7.4



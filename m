Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A29238CE5C
	for <lists+xen-devel@lfdr.de>; Fri, 21 May 2021 21:47:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131363.245567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lkB6D-0003zA-P5; Fri, 21 May 2021 19:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131363.245567; Fri, 21 May 2021 19:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lkB6D-0003wu-LJ; Fri, 21 May 2021 19:46:21 +0000
Received: by outflank-mailman (input) for mailman id 131363;
 Fri, 21 May 2021 19:46:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=08+4=KQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1lkB6C-0003wW-5J
 for xen-devel@lists.xenproject.org; Fri, 21 May 2021 19:46:20 +0000
Received: from mail-lj1-x22e.google.com (unknown [2a00:1450:4864:20::22e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d4f6e20-0052-4c6a-8046-39a492ce9546;
 Fri, 21 May 2021 19:46:14 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id w15so25277282ljo.10
 for <xen-devel@lists.xenproject.org>; Fri, 21 May 2021 12:46:14 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id y15sm737337lje.74.2021.05.21.12.46.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 May 2021 12:46:12 -0700 (PDT)
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
X-Inumbo-ID: 6d4f6e20-0052-4c6a-8046-39a492ce9546
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UV26yBYRduGdA999eGiqvy5axNutGBZWQtuLH3UYFSw=;
        b=XAbkZ/mn4AotI/fpObiQKsd8oKwoS3HaGffQgZQo0e6xeLQU4J2NTlBoq4Z1deOLBA
         3WjEj8HidH4cCnoDSsYXY64ezGwFPAs6oB1rRO4RzCZDMXSkuzMLV7lfPh3kewuxKsb7
         sE2BD7uyL2k/gxphJQXyZ8thw2hJF0puOgB0UdNXF/w+R/AiIa+WCnd6jCHpYogHvQyu
         tnJ1Qfdu3/kfXksm7BE+nqDrJc4kF+SGpCCTQ/3xjjGQ0kRp/DwpPIqPzTUEsTCTmvRs
         YgqCKjt8RsXB0YNMbPDkXH0xDbhDEoYbtDBdsN1WKAWVj2k5hkB1je4umxenL0LaLS0P
         AWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UV26yBYRduGdA999eGiqvy5axNutGBZWQtuLH3UYFSw=;
        b=qXhTON0ft77So1whFTCNgDzHto5tjWz0Fg1LwY2YWn56it6UDy8KaU8Z5mXnYEDi3m
         lgb23AvT3dXkIItbSBappCzsfK3+h9xrJCEvsV3uLiSJXsTcydwuLkELdBUK+koPxvFU
         YZl1lJyShBvWvdS3IuVW+LZA/ugds6VnW1QvY4WOLQjFxJxo+2tTjWskOx+oQeWUphtu
         ug3ABmyRTz1wK6wX5J98ScYiErJeatgy7PN+WD2f+6hUTBKMNATG3/XwdhHvILFHw51m
         I/c3IPSKb6UoTYya5vk+2ya2SU7wh1G68xYj3iQ4Q07XJUgFYY8DuKxKlfSrYEkEEYP4
         QPQA==
X-Gm-Message-State: AOAM531DUAMltied/BpeO1GV6M0nNoMhxfYelYM5ds4vcSwwWSqdvZJ+
	rTCzE95bavLV+DIPrvOwUdhToTLvEqa9kQ==
X-Google-Smtp-Source: ABdhPJxxBzNmjkT17vRcYiIVRBFNMMAFsZMz8cKn3Jn8kSAPp6fEHG5UPbOhKlD+iqbDMau24JwobA==
X-Received: by 2002:a2e:860f:: with SMTP id a15mr7916860lji.3.1621626372916;
        Fri, 21 May 2021 12:46:12 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Chen <Wei.Chen@arm.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Kaly Xin <Kaly.Xin@arm.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [RESEND PATCH V5 2/2] libxl: Introduce basic virtio-mmio support on Arm
Date: Fri, 21 May 2021 22:46:01 +0300
Message-Id: <1621626361-29076-3-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621626361-29076-1-git-send-email-olekstysh@gmail.com>
References: <1621626361-29076-1-git-send-email-olekstysh@gmail.com>
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
---
---
 tools/libs/light/libxl_arm.c  | 133 +++++++++++++++++++++++++++++++++++++++++-
 xen/include/public/arch-arm.h |   7 +++
 2 files changed, 138 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index e2901f1..a9f15ce 100644
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
 
@@ -660,6 +746,38 @@ static int make_vpl011_uart_node(libxl__gc *gc, void *fdt,
     return 0;
 }
 
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
@@ -860,10 +978,14 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_build_info *info,
     int rc, res;
     size_t fdt_size = 0;
     int pfdt_size = 0;
+    unsigned int i;
 
     const libxl_version_info *vers;
     const struct arch_info *ainfo;
 
+    libxl_domain_config *d_config =
+        CONTAINER_OF(info, libxl_domain_config, b_info);
+
     vers = libxl_get_version_info(CTX);
     if (vers == NULL) return ERROR_FAIL;
 
@@ -963,6 +1085,13 @@ next_resize:
         if (info->tee == LIBXL_TEE_TYPE_OPTEE)
             FDT( make_optee_node(gc, fdt) );
 
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
index 713fd65..1c02248 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -394,6 +394,10 @@ typedef uint64_t xen_callback_t;
 
 /* Physical Address Space */
 
+/* Virtio MMIO mappings */
+#define GUEST_VIRTIO_MMIO_BASE   xen_mk_ullong(0x02000000)
+#define GUEST_VIRTIO_MMIO_SIZE   xen_mk_ullong(0x00100000)
+
 /*
  * vGIC mappings: Only one set of mapping is used by the guest.
  * Therefore they can overlap.
@@ -458,6 +462,9 @@ typedef uint64_t xen_callback_t;
 
 #define GUEST_VPL011_SPI        32
 
+#define GUEST_VIRTIO_MMIO_SPI_FIRST   33
+#define GUEST_VIRTIO_MMIO_SPI_LAST    43
+
 /* PSCI functions */
 #define PSCI_cpu_suspend 0
 #define PSCI_cpu_off     1
-- 
2.7.4



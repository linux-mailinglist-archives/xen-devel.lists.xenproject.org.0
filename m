Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C504F9C76
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 20:22:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301745.515016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nctEU-0004kk-AI; Fri, 08 Apr 2022 18:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301745.515016; Fri, 08 Apr 2022 18:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nctEU-0004hX-7F; Fri, 08 Apr 2022 18:21:18 +0000
Received: by outflank-mailman (input) for mailman id 301745;
 Fri, 08 Apr 2022 18:21:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cJw0=US=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nctET-0004ck-Dn
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 18:21:17 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad485c6d-b768-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 20:21:15 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id d29so14080177wra.10
 for <xen-devel@lists.xenproject.org>; Fri, 08 Apr 2022 11:21:15 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm24084701wry.102.2022.04.08.11.21.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Apr 2022 11:21:14 -0700 (PDT)
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
X-Inumbo-ID: ad485c6d-b768-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wu3IDi2V7jgskHzubEp1kqQM4PIE1W72Wqr7diNZVBU=;
        b=mvLdi8gO4Vc531vdXWU7xo8B9vi0k4DfZDcYZas01eEXLI19TbQicOYt2/JgWvAX1O
         Xby65uDuLs+XCpfMqSgggYC3kNiqadGvgVEkYppxR3sCIElV4J40qbSYA+qEYioGEUsg
         Iu4Bbo0JKVyjWcoYM+lbwnwOHYVRA2y4TkvMBHVlmUaCPoH9lsD4+5jSLIE5YD9D/Frp
         EUAejeXEA6f3SmFJidujMWqFE0DRMStfLGKLrQ6NFJQghNrzay5Hbz8ehGE0H9aU2JOJ
         XDC0GicU8txQy+HQZyiZQgvvGu+ua+xYjNTJcgNK+1xtEvFSL8BUxsUHDzuBJyqwTbb1
         urkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wu3IDi2V7jgskHzubEp1kqQM4PIE1W72Wqr7diNZVBU=;
        b=k3EcvPK6LyEt/dNwfPBREoIC8uTeAdzQtyV3gXIJmloDm0cxpplkZyHjtWL02p3uB6
         7CBUE4IPoENncRjjA6sT1m9ylMI4Xi/aFimDWchsCuIAMR1VSdaOmeTOzUaSbWGqLQ4y
         oX8upjZz4zX41IIQ1W/VpsTpTzVALIR0c8UT0zkEmAMkSh68deYsDB7OYMdd3+dSygrn
         0wsuhqiNB1lUeFoN0x46h9n+qOqj38epYvhb+dGi8rC5yDDRpVgvpro3wj7jUM+bqIBO
         glJh2E9vYlHIo8iW8Fh7/hOxKwg2YyfDKOZ0o6upolYrY61K6nNG9zwlWXJbQ8XxsonN
         HcEw==
X-Gm-Message-State: AOAM530N7VBTQkqTZlt2XsNsju8ak8myseI/qZKymUT3fG3t4kWxGv+z
	3SOGD1C9YNu5A85CHzXyjFbzEsM1ZdM=
X-Google-Smtp-Source: ABdhPJzaK4J55tGqs9WU9lgrCWQB+2TncGu24+eYVqkgClefoHyTxWUNymfR+XbClUdJ6hhzxaz/Wg==
X-Received: by 2002:a5d:47a7:0:b0:203:d1b4:8f6 with SMTP id 7-20020a5d47a7000000b00203d1b408f6mr16038103wrb.36.1649442074700;
        Fri, 08 Apr 2022 11:21:14 -0700 (PDT)
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
	Jiamei Xie <Jiamei.Xie@arm.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH V7 2/2] libxl: Introduce basic virtio-mmio support on Arm
Date: Fri,  8 Apr 2022 21:21:05 +0300
Message-Id: <1649442065-8332-3-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1649442065-8332-1-git-send-email-olekstysh@gmail.com>
References: <1649442065-8332-1-git-send-email-olekstysh@gmail.com>
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
Tested-by: Jiamei Xie <Jiamei.xie@arm.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
---
@Jiamei, @Henry I decided to leave your T-b and R-b tags with the minor
change I made, are you still happy with that?

s/if (disk->virtio)/if (disk->protocol == LIBXL_DISK_PROTOCOL_VIRTIO_MMIO)

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
---
 tools/libs/light/libxl_arm.c  | 131 +++++++++++++++++++++++++++++++++++++++++-
 xen/include/public/arch-arm.h |   7 +++
 2 files changed, 136 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index eef1de0..8132a47 100644
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
+        if (disk->protocol == LIBXL_DISK_PROTOCOL_VIRTIO_MMIO) {
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
+            if (disk->protocol == LIBXL_DISK_PROTOCOL_VIRTIO_MMIO)
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



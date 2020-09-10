Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1207D2650BA
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 22:26:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGT9I-0005I2-RN; Thu, 10 Sep 2020 20:26:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQLO=CT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kGT6c-0004JK-UX
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 20:23:42 +0000
X-Inumbo-ID: 74d81ee3-8538-48d3-8bad-d83b221620a9
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74d81ee3-8538-48d3-8bad-d83b221620a9;
 Thu, 10 Sep 2020 20:22:50 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id b19so9841742lji.11
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 13:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vIh85/sY7iA5XbRTrm6qXjVZ3yochyyyRjYvVf5mUh4=;
 b=sVYFNClxwi23fyBQ9weHBSlHWXYZxbctgqBfVMnldvla5fLZKRU4J5WDjA9aze7GG9
 i2qFOojewtu8gVPfuUSBrzSE2lWRSlFS6kZXSnvGEbFcz4sU5f865pdKulEeC3h4NFms
 SFxx6Y0sUW8JPjV15Z0R1iJ7GSf7b2xWg8QvKkKjRcG0gcbELihm0L5jO5EZ8s9NjSAQ
 WWvjOme5Gp8tICiMLPAb3duiqcKh+L/KEzdpiA14tg8t6xhWWj7+IWjxiBjXUZlNc4RZ
 xQd0oUKU3JwNzmeKsHAPBo8OfmzquB9JBCLlX2K2YKibGkppFLtuEjMlvBqvV49xzm51
 JCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vIh85/sY7iA5XbRTrm6qXjVZ3yochyyyRjYvVf5mUh4=;
 b=GHzqtxgbqPUsqo/MAnsfp6tMGuSxNnat/6ror3zsMw5kC57g2fPmq+QkAQXRa9vdOo
 wbdRzXNSSj9BohFSo7L9d+T1RYrPJfzZ+vIe1bfFY6CGp5nwvsXtFSYH4OykxillS5us
 Ce5heerUD5Gb/FkEPVCRv78bcwq2iNT0SP6ToHTH/S0uFrurbTVhgCLkB5kID0Fp89wK
 Box4vIYkluacTQra+8fMVkEuoXMZrA3tpHyb3TiD0X/vSl3ispKk+Las12tj0FOVYPjn
 +nAB3alNwB/2alFVMwEJfB1KN/cgqVFC0tuZ0E8lVfe5WAbYPcsaLphyif5c148aqdOq
 KcoQ==
X-Gm-Message-State: AOAM532yIQFKHQVigOuAp3UeDrNX3SAMcnUszoVWkqhCBk1Q3wjR041Z
 cCpvPJb3tmoDlahk+/Dw3AW1g6cUiPEU+Q==
X-Google-Smtp-Source: ABdhPJxTXyT4hkM39TOk7RHO6ponOIk03ssk3lVpKqX/u2jpSPbe2InFlycXGrb7r2LgNZz9zMfC7w==
X-Received: by 2002:a2e:9410:: with SMTP id i16mr5635457ljh.443.1599769368798; 
 Thu, 10 Sep 2020 13:22:48 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u5sm1584375lfq.17.2020.09.10.13.22.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Sep 2020 13:22:47 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
Subject: [PATCH V1 15/16] libxl: Introduce basic virtio-mmio support on Arm
Date: Thu, 10 Sep 2020 23:22:09 +0300
Message-Id: <1599769330-17656-16-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch creates specific device node in the Guest device-tree
with allocated MMIO range and SPI interrupt if specific 'virtio'
property is present in domain config.

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
---
---
 tools/libxl/libxl_arm.c       | 58 +++++++++++++++++++++++++++++++++++++++++--
 tools/libxl/libxl_types.idl   |  1 +
 tools/xl/xl_parse.c           |  1 +
 xen/include/public/arch-arm.h |  5 ++++
 4 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/tools/libxl/libxl_arm.c b/tools/libxl/libxl_arm.c
index 34f8a29..36139d9 100644
--- a/tools/libxl/libxl_arm.c
+++ b/tools/libxl/libxl_arm.c
@@ -27,8 +27,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
 {
     uint32_t nr_spis = 0;
     unsigned int i;
-    uint32_t vuart_irq;
-    bool vuart_enabled = false;
+    uint32_t vuart_irq, virtio_irq;
+    bool vuart_enabled = false, virtio_enabled = false;
 
     /*
      * If pl011 vuart is enabled then increment the nr_spis to allow allocation
@@ -40,6 +40,17 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         vuart_enabled = true;
     }
 
+    /*
+     * XXX: Handle properly virtio
+     * A proper solution would be the toolstack to allocate the interrupts
+     * used by each virtio backend and let the backend now which one is used
+     */
+    if (libxl_defbool_val(d_config->b_info.arch_arm.virtio)) {
+        nr_spis += (GUEST_VIRTIO_MMIO_SPI - 32) + 1;
+        virtio_irq = GUEST_VIRTIO_MMIO_SPI;
+        virtio_enabled = true;
+    }
+
     for (i = 0; i < d_config->b_info.num_irqs; i++) {
         uint32_t irq = d_config->b_info.irqs[i];
         uint32_t spi;
@@ -59,6 +70,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
             return ERROR_FAIL;
         }
 
+        /* The same check as for vpl011 */
+        if (virtio_enabled && irq == virtio_irq) {
+            LOG(ERROR, "Physical IRQ %u conflicting with virtio SPI\n", irq);
+            return ERROR_FAIL;
+        }
+
         if (irq < 32)
             continue;
 
@@ -659,6 +676,39 @@ static int make_vpl011_uart_node(libxl__gc *gc, void *fdt,
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
+                            1, base, GUEST_VIRTIO_MMIO_SIZE);
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
+
+}
+
 static const struct arch_info *get_arch_info(libxl__gc *gc,
                                              const struct xc_dom_image *dom)
 {
@@ -962,6 +1012,9 @@ next_resize:
         if (info->tee == LIBXL_TEE_TYPE_OPTEE)
             FDT( make_optee_node(gc, fdt) );
 
+        if (libxl_defbool_val(info->arch_arm.virtio))
+            FDT( make_virtio_mmio_node(gc, fdt, GUEST_VIRTIO_MMIO_BASE, GUEST_VIRTIO_MMIO_SPI) );
+
         if (pfdt)
             FDT( copy_partial_fdt(gc, fdt, pfdt) );
 
@@ -1179,6 +1232,7 @@ void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
 {
     /* ACPI is disabled by default */
     libxl_defbool_setdefault(&b_info->acpi, false);
+    libxl_defbool_setdefault(&b_info->arch_arm.virtio, false);
 
     if (b_info->type != LIBXL_DOMAIN_TYPE_PV)
         return;
diff --git a/tools/libxl/libxl_types.idl b/tools/libxl/libxl_types.idl
index 9d3f05f..b054bf9 100644
--- a/tools/libxl/libxl_types.idl
+++ b/tools/libxl/libxl_types.idl
@@ -639,6 +639,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
 
 
     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
+                               ("virtio", libxl_defbool),
                                ("vuart", libxl_vuart_type),
                               ])),
     # Alternate p2m is not bound to any architecture or guest type, as it is
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 61b4ef7..b8306aa 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2579,6 +2579,7 @@ skip_usbdev:
     }
 
     xlu_cfg_get_defbool(config, "dm_restrict", &b_info->dm_restrict, 0);
+    xlu_cfg_get_defbool(config, "virtio", &b_info->arch_arm.virtio, 0);
 
     if (c_info->type == LIBXL_DOMAIN_TYPE_HVM) {
         if (!xlu_cfg_get_string (config, "vga", &buf, 0)) {
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index c365b1b..be7595f 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -464,6 +464,11 @@ typedef uint64_t xen_callback_t;
 #define PSCI_cpu_on      2
 #define PSCI_migrate     3
 
+/* VirtIO MMIO definitions */
+#define GUEST_VIRTIO_MMIO_BASE  xen_mk_ullong(0x02000000)
+#define GUEST_VIRTIO_MMIO_SIZE  xen_mk_ullong(0x200)
+#define GUEST_VIRTIO_MMIO_SPI   33
+
 #endif
 
 #ifndef __ASSEMBLY__
-- 
2.7.4



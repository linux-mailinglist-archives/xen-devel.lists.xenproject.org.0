Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F84B2F3C02
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 22:59:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66084.117294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRgr-0003km-IE; Tue, 12 Jan 2021 21:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66084.117294; Tue, 12 Jan 2021 21:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRgr-0003iu-2S; Tue, 12 Jan 2021 21:59:01 +0000
Received: by outflank-mailman (input) for mailman id 66084;
 Tue, 12 Jan 2021 21:58:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OoN1=GP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kzRdN-0002PK-K6
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 21:55:25 +0000
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa162e05-41c1-4320-b83f-51adccf96237;
 Tue, 12 Jan 2021 21:53:30 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id 91so10067wrj.7
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 13:53:17 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 138sm6574053wma.41.2021.01.12.13.53.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Jan 2021 13:53:16 -0800 (PST)
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
X-Inumbo-ID: aa162e05-41c1-4320-b83f-51adccf96237
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sScU+5oicaGgW9qBRRGxQ8d8IF93O73wsVAs5ty06UA=;
        b=q0vahR7/hPCvHtl56HNnZkTbeu7dlQAE1RoHbqvupatJM826lo6eLq39sKNxAjep5n
         Fuzmf+yrmXL7dL3tZ9RoqDnzBsiokBaZlygyZgNTVK48qRXIIyA5msQjtB6bM4eNERq+
         fdayKLiqsv/w12039DKs2YrVxGN6idxmXAAEpcDSbS+yGsaUiJDFIMLdHJdzCrxHX9UE
         hhnGCwapV/AbuBIPjTjz5XW1JbfrsaSlUdezqXWq/53OlSMnFrz1QQ09DoLrWapWdcn3
         TG2OsA13Jihf5DbOgXcN7Y/t+kvmFC8Wqy1m/twNYFUHs0D/fJsurslDRyZus1jDfUDo
         5MVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sScU+5oicaGgW9qBRRGxQ8d8IF93O73wsVAs5ty06UA=;
        b=BqYUFBcLrNkDEC5UHtfDWwfDLKnPxktIz3pr7YTalKU6tIyLrc64LZNSbG8xX7kLTO
         DemZiYcwRWvA/j4TlkvRIlyQwv0DUZ6aJ6qg6lw3+1uld/5d64vj+5oAkXC+zvDtVQ94
         NRSH2Tv++IfxnJamIQzQeVTj/zlTcsFkAm2maoptw9UAx0d0YleH6x9iQwYvrS7gXMHZ
         JlDc9w8eUfbBzeCDjICji3cShOMI8K5LuwBJetsq7FfS69lDhIxSrzeg2TOImzWpb3SE
         4WdrmptftuXU40Cvq40SBFefJLtpnvV2emQurM4DlLH8Q4wNcfNoJefIjboFg4dq3A/F
         Py5g==
X-Gm-Message-State: AOAM532tTZ89aizLlpJgXNKIDrs3D0YN3rNfuomJyOVcGWVLbLJ0Z98L
	SGpDXlJRkbJeOKN6Wobx2iBuVim4Y8G+BQ==
X-Google-Smtp-Source: ABdhPJy/iUFLQb6aiqG+w2JoMlszFzTv57QWfhopC1ianIyG5901PZpbjQNM0YEZWCzBovGmfr5xRw==
X-Received: by 2002:adf:dc87:: with SMTP id r7mr784130wrj.305.1610488396744;
        Tue, 12 Jan 2021 13:53:16 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH V4 23/24] libxl: Introduce basic virtio-mmio support on Arm
Date: Tue, 12 Jan 2021 23:52:31 +0200
Message-Id: <1610488352-18494-24-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>

From: Julien Grall <julien.grall@arm.com>

This patch creates specific device node in the Guest device-tree
with allocated MMIO range and SPI interrupt if specific 'virtio'
property is present in domain config.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

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
---
 tools/libs/light/libxl_arm.c     | 58 ++++++++++++++++++++++++++++++++++++++--
 tools/libs/light/libxl_types.idl |  1 +
 tools/xl/xl_parse.c              |  1 +
 xen/include/public/arch-arm.h    |  5 ++++
 4 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 66e8a06..588ee5a 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -26,8 +26,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
 {
     uint32_t nr_spis = 0;
     unsigned int i;
-    uint32_t vuart_irq;
-    bool vuart_enabled = false;
+    uint32_t vuart_irq, virtio_irq;
+    bool vuart_enabled = false, virtio_enabled = false;
 
     /*
      * If pl011 vuart is enabled then increment the nr_spis to allow allocation
@@ -39,6 +39,17 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
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
@@ -58,6 +69,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
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
 
@@ -658,6 +675,39 @@ static int make_vpl011_uart_node(libxl__gc *gc, void *fdt,
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
@@ -961,6 +1011,9 @@ next_resize:
         if (info->tee == LIBXL_TEE_TYPE_OPTEE)
             FDT( make_optee_node(gc, fdt) );
 
+        if (libxl_defbool_val(info->arch_arm.virtio))
+            FDT( make_virtio_mmio_node(gc, fdt, GUEST_VIRTIO_MMIO_BASE, GUEST_VIRTIO_MMIO_SPI) );
+
         if (pfdt)
             FDT( copy_partial_fdt(gc, fdt, pfdt) );
 
@@ -1178,6 +1231,7 @@ void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
 {
     /* ACPI is disabled by default */
     libxl_defbool_setdefault(&b_info->acpi, false);
+    libxl_defbool_setdefault(&b_info->arch_arm.virtio, false);
 
     if (b_info->type != LIBXL_DOMAIN_TYPE_PV)
         return;
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 0532473..839df86 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -640,6 +640,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
 
 
     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
+                               ("virtio", libxl_defbool),
                                ("vuart", libxl_vuart_type),
                               ])),
     # Alternate p2m is not bound to any architecture or guest type, as it is
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 4ebf396..2a3364b 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2581,6 +2581,7 @@ skip_usbdev:
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



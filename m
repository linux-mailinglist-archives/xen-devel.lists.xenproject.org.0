Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 769DA4600BB
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 18:52:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234023.406235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr1rl-0005by-S5; Sat, 27 Nov 2021 17:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234023.406235; Sat, 27 Nov 2021 17:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr1rl-0005L7-6e; Sat, 27 Nov 2021 17:52:01 +0000
Received: by outflank-mailman (input) for mailman id 234023;
 Sat, 27 Nov 2021 17:51:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BaOL=QO=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mr1ri-0004Ih-I1
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 17:51:58 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b70fe854-4faa-11ec-976b-d102b41d0961;
 Sat, 27 Nov 2021 18:51:57 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id u3so32562717lfl.2
 for <xen-devel@lists.xenproject.org>; Sat, 27 Nov 2021 09:51:57 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f18sm827075ljc.104.2021.11.27.09.51.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Nov 2021 09:51:56 -0800 (PST)
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
X-Inumbo-ID: b70fe854-4faa-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6dW0OZmNRebStbQFMM32RwjBwDJFFmt3LTZQMfVizWw=;
        b=jh3p8yv6Z9HWUYrl8v0MV5RoXvgJriZ2SQ2qUyEfV8MJudGYyjYZBc0LdjhjSL1KaZ
         o51oKlE9EwthkSnIoTFUL0o93rFZCfUMART9dX3OVg02SjdVZIpOpot0LHUlVPl4K5Sp
         TdeKGLW2ad186m7TUrnHpRR4ECAThtY9iQqR7NRQIVCvSxgr1LFTpnatN9njbwLY+L9z
         11o31+2JvQxupWl8nRXzJjz2YIA+AE9sqCO0riZx10KMtG/O9Z0dStqNiHReyQo+gTRI
         /O4i+Y2d4khjyg+2jOM05RDiai99QIaHpaKH1K0uTLd6LkVh30LR/GNW2JrJSjPO/T+W
         F0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6dW0OZmNRebStbQFMM32RwjBwDJFFmt3LTZQMfVizWw=;
        b=fza3qQHP9TeWsxHCy6kvCfCTnkBx+x3uHsMSrPcCdL67xQUPJbr414e0cGlrbys2SV
         nLIJVqUPX3/4jBEOeLwMktcw1L96tAgcM8bEzZT/tnqpw3BYL/BdFx5VaWt4fjraOIS9
         i7WerYdCwDwV2qlIhdWW2U1RI2YkDO49UcBf3BZSPy+gHMzHn0yzVHdeovqyHbY4jmTd
         ijL4ESESrSY+mpB1RRiwK0qJM9oSxnn5T350ZceFd2ZKehWIAIHPI2q+F0ph6b2bzHBC
         2Vbf0OVk1cDWUCCGPXh0cnxR3vuY8yb5L4g8+yRv/9B/0dCMG2xKmAEUHdaMXov8saXd
         vbFQ==
X-Gm-Message-State: AOAM5309c2/PdOju1A701HHCfzyIlm4R/PffDnJTdTVaxCGw9wEPlgIO
	xZT7QaFBJP7BLdL+gmaniXHvE/YSLXM=
X-Google-Smtp-Source: ABdhPJw/TZIsXkeZbL/imr/4eb3AnmQ0TJreSbrco2NPGdcPdHSUB5wq92oMDcimEGE0Ps3+nKgwaQ==
X-Received: by 2002:ac2:4c0b:: with SMTP id t11mr37847197lfq.520.1638035517101;
        Sat, 27 Nov 2021 09:51:57 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 07/10] iommu/ipmmu-vmsa: Add Renesas R8A779F0 (R-Car S4) support
Date: Sat, 27 Nov 2021 19:51:42 +0200
Message-Id: <1638035505-16931-8-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Based on the following commit from the Renesas BSP:
7003b9f732cffdc778fceb4bffb05ebb4540f726
located at:
https://github.com/renesas-rcar/linux-bsp/tree/v5.10.41/rcar-5.1.3.rc5

Original commit message:
 commit 7003b9f732cffdc778fceb4bffb05ebb4540f726
 Author: Nam Nguyen <nam.nguyen.yh@renesas.com>
 Date:   Thu Feb 4 11:05:37 2021 +0700

  iommu/ipmmu-vmsa: Add Renesas R8A779F0 (R-Car S4) support

  Adding IPMMU support for Renesas R8A779F0 R-Car S4.

  Suggested by: Hai Pham <hai.pham.ud@renesas.com>
  Signed-off-by: Nam Nguyen <nam.nguyen.yh@renesas.com>

**********

The R-Car S4 is an automotive System-on-Chip (SoC) for Car
Server/Communication Gateway and is one of the first products
in Renesas’ 4th-generation R-Car Family.

The integrated IOMMU HW is also VMSA-compatible and supports
stage 2 translation table format, therefore can be used with
current driver with slight modifications (thanks to the prereq
work).

In the context of Xen driver the main differences between Gen3
and S4 are the following:
- HW capacity was enlarged to support up to 16 IPMMU contexts
  (sets of page table) and up to 64 micro-TLBs per IPMMU device
- the memory mapped registers have different bases and offsets

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/drivers/passthrough/Kconfig          |  6 +--
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 74 +++++++++++++++++++++++++-------
 2 files changed, 61 insertions(+), 19 deletions(-)

diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
index 09505aa..e1cb678 100644
--- a/xen/drivers/passthrough/Kconfig
+++ b/xen/drivers/passthrough/Kconfig
@@ -25,14 +25,14 @@ config ARM_SMMU_V3
 	 the ARM SMMUv3 architecture.
 
 config IPMMU_VMSA
-	bool "Renesas IPMMU-VMSA found in R-Car Gen3 SoCs"
+	bool "Renesas IPMMU-VMSA found in R-Car Gen3/S4 SoCs"
 	depends on ARM_64
 	---help---
 	  Support for implementations of the Renesas IPMMU-VMSA found
-	  in R-Car Gen3 SoCs.
+	  in R-Car Gen3/S4 SoCs.
 
 	  Say Y here if you are using newest R-Car Gen3 SoCs revisions
-	  (H3 ES3.0, M3-W+, etc) which IPMMU hardware supports stage 2
+	  (H3 ES3.0, M3-W+, etc) or S4 SoCs which IPMMU hardware supports stage 2
 	  translation table format and is able to use CPU's P2M table as is.
 
 endif
diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index d8f96fc..8dfdae8 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -1,15 +1,15 @@
 /*
  * xen/drivers/passthrough/arm/ipmmu-vmsa.c
  *
- * Driver for the Renesas IPMMU-VMSA found in R-Car Gen3 SoCs.
+ * Driver for the Renesas IPMMU-VMSA found in R-Car Gen3/S4 SoCs.
  *
  * The IPMMU-VMSA is VMSA-compatible I/O Memory Management Unit (IOMMU)
  * which provides address translation and access protection functionalities
  * to processing units and interconnect networks.
  *
  * Please note, current driver is supposed to work only with newest
- * R-Car Gen3 SoCs revisions which IPMMU hardware supports stage 2 translation
- * table format and is able to use CPU's P2M table as is.
+ * R-Car Gen3/S4 SoCs revisions which IPMMU hardware supports stage 2
+ * translation table format and is able to use CPU's P2M table as is.
  *
  * Based on Linux's IPMMU-VMSA driver from Renesas BSP:
  *    drivers/iommu/ipmmu-vmsa.c
@@ -20,9 +20,9 @@
  * and Xen's SMMU driver:
  *    xen/drivers/passthrough/arm/smmu.c
  *
- * Copyright (C) 2014-2019 Renesas Electronics Corporation
+ * Copyright (C) 2014-2021 Renesas Electronics Corporation
  *
- * Copyright (C) 2016-2019 EPAM Systems Inc.
+ * Copyright (C) 2016-2021 EPAM Systems Inc.
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms and conditions of the GNU General Public
@@ -68,12 +68,18 @@
     dev_print(dev, XENLOG_ERR, fmt, ## __VA_ARGS__)
 
 /*
- * R-Car Gen3 SoCs make use of up to 8 IPMMU contexts (sets of page table) and
- * these can be managed independently. Each context is mapped to one Xen domain.
+ * R-Car Gen3/S4 SoCs make use of up to 16 IPMMU contexts (sets of page table)
+ * and these can be managed independently. Each context is mapped to one Xen
+ * domain.
  */
-#define IPMMU_CTX_MAX     8U
-/* R-Car Gen3 SoCs make use of up to 48 micro-TLBs per IPMMU device. */
-#define IPMMU_UTLB_MAX    48U
+#define IPMMU_CTX_MAX     16U
+/* R-Car Gen3/S4 SoCs make use of up to 64 micro-TLBs per IPMMU device. */
+#define IPMMU_UTLB_MAX    64U
+
+enum ipmmu_reg_layout {
+    IPMMU_REG_LAYOUT_RCAR_GEN3 = 0,
+    IPMMU_REG_LAYOUT_RCAR_S4,
+};
 
 /* IPMMU context supports IPA size up to 40 bit. */
 #define IPMMU_MAX_P2M_IPA_BITS    40
@@ -110,8 +116,12 @@ struct ipmmu_features {
     unsigned int number_of_contexts;
     unsigned int num_utlbs;
     unsigned int ctx_offset_base;
+    unsigned int ctx_offset_base_2;
     unsigned int ctx_offset_stride;
+    unsigned int ctx_offset_stride_adj;
     unsigned int utlb_offset_base;
+    unsigned int imuctr_ttsel_mask;
+    enum ipmmu_reg_layout reg_layout;
 };
 
 /* Root/Cache IPMMU device's information */
@@ -211,7 +221,6 @@ static DEFINE_SPINLOCK(ipmmu_devices_lock);
 #define IMUCTR0(n)             (0x0300 + ((n) * 16))
 #define IMUCTR32(n)            (0x0600 + (((n) - 32) * 16))
 #define IMUCTR_TTSEL_MMU(n)    ((n) << 4)
-#define IMUCTR_TTSEL_MASK      (15 << 4)
 #define IMUCTR_TTSEL_SHIFT     4
 #define IMUCTR_FLUSH           (1 << 1)
 #define IMUCTR_MMUEN           (1 << 0)
@@ -316,8 +325,15 @@ static void ipmmu_write(struct ipmmu_vmsa_device *mmu, uint32_t offset,
 static unsigned int ipmmu_ctx_reg(struct ipmmu_vmsa_device *mmu,
                                   unsigned int context_id, uint32_t reg)
 {
+    if ( mmu->features->reg_layout == IPMMU_REG_LAYOUT_RCAR_S4 &&
+         context_id >= 8 )
+        return mmu->features->ctx_offset_base_2 +
+            (context_id - 8) * mmu->features->ctx_offset_stride +
+            context_id * mmu->features->ctx_offset_stride_adj + reg;
+
     return mmu->features->ctx_offset_base +
-        context_id * mmu->features->ctx_offset_stride + reg;
+        context_id * mmu->features->ctx_offset_stride +
+        context_id * mmu->features->ctx_offset_stride_adj + reg;
 }
 
 static uint32_t ipmmu_ctx_read(struct ipmmu_vmsa_device *mmu,
@@ -448,7 +464,8 @@ static int ipmmu_utlb_enable(struct ipmmu_vmsa_domain *domain,
     {
         unsigned int context_id;
 
-        context_id = (imuctr & IMUCTR_TTSEL_MASK) >> IMUCTR_TTSEL_SHIFT;
+        context_id = (imuctr & mmu->features->imuctr_ttsel_mask) >>
+            IMUCTR_TTSEL_SHIFT;
         if ( domain->context_id != context_id )
         {
             dev_err(mmu->dev, "Micro-TLB %u already assigned to IPMMU context %u\n",
@@ -738,8 +755,23 @@ static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
     .number_of_contexts = 8,
     .num_utlbs = 48,
     .ctx_offset_base = 0,
+    .ctx_offset_base_2 = 0,
     .ctx_offset_stride = 0x40,
+    .ctx_offset_stride_adj = 0,
     .utlb_offset_base = 0,
+    .imuctr_ttsel_mask = (15 << 4),
+};
+
+static const struct ipmmu_features ipmmu_features_rcar_s4 = {
+    .number_of_contexts = 16,
+    .num_utlbs = 64,
+    .ctx_offset_base = 0x10000,
+    .ctx_offset_base_2 = 0x10800,
+    .ctx_offset_stride = 0x40,
+    .ctx_offset_stride_adj = 0x1000,
+    .utlb_offset_base = 0x3000,
+    .imuctr_ttsel_mask = (31 << 4),
+    .reg_layout = IPMMU_REG_LAYOUT_RCAR_S4,
 };
 
 static void ipmmu_device_reset(struct ipmmu_vmsa_device *mmu)
@@ -751,11 +783,12 @@ static void ipmmu_device_reset(struct ipmmu_vmsa_device *mmu)
         ipmmu_ctx_write(mmu, i, IMCTR, 0);
 }
 
-/* R-Car Gen3 SoCs product and cut information. */
+/* R-Car Gen3/S4 SoCs product and cut information. */
 #define RCAR_PRODUCT_MASK    0x00007F00
 #define RCAR_PRODUCT_H3      0x00004F00
 #define RCAR_PRODUCT_M3W     0x00005200
 #define RCAR_PRODUCT_M3N     0x00005500
+#define RCAR_PRODUCT_S4      0x00005A00
 #define RCAR_CUT_MASK        0x000000FF
 #define RCAR_CUT_VER30       0x00000020
 
@@ -803,6 +836,10 @@ static __init bool ipmmu_stage2_supported(void)
         stage2_supported = true;
         break;
 
+    case RCAR_PRODUCT_S4:
+        stage2_supported = true;
+        break;
+
     default:
         printk(XENLOG_ERR "ipmmu: Unsupported SoC version\n");
         break;
@@ -831,6 +868,10 @@ static const struct dt_device_match ipmmu_dt_match[] __initconst =
         .compatible = "renesas,ipmmu-r8a77961",
         .data = &ipmmu_features_rcar_gen3,
     },
+    {
+        .compatible = "renesas,ipmmu-r8a779f0",
+        .data = &ipmmu_features_rcar_s4,
+    },
     { /* sentinel */ },
 };
 
@@ -845,6 +886,7 @@ static int ipmmu_probe(struct dt_device_node *node)
     const struct dt_device_match *match;
     struct ipmmu_vmsa_device *mmu;
     uint64_t addr, size;
+    uint32_t reg;
     int irq, ret;
 
     mmu = xzalloc(struct ipmmu_vmsa_device);
@@ -930,8 +972,8 @@ static int ipmmu_probe(struct dt_device_node *node)
          * Use stage 2 translation table format when stage 2 translation
          * enabled.
          */
-        ipmmu_write(mmu, IMSAUXCTLR,
-                    ipmmu_read(mmu, IMSAUXCTLR) | IMSAUXCTLR_S2PTE);
+        reg = IMSAUXCTLR + mmu->features->ctx_offset_stride_adj;
+        ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) | IMSAUXCTLR_S2PTE);
 
         dev_info(&node->dev, "IPMMU context 0 is reserved\n");
         set_bit(0, mmu->ctx);
-- 
2.7.4



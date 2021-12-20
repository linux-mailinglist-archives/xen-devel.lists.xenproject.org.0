Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BC147B4EC
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 22:16:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249999.430561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzQ1B-00077x-CC; Mon, 20 Dec 2021 21:16:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249999.430561; Mon, 20 Dec 2021 21:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzQ1A-0006sE-GB; Mon, 20 Dec 2021 21:16:24 +0000
Received: by outflank-mailman (input) for mailman id 249999;
 Mon, 20 Dec 2021 21:16:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gYK=RF=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mzQ17-0005IB-KY
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 21:16:21 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13d17607-61da-11ec-85d3-df6b77346a89;
 Mon, 20 Dec 2021 22:16:20 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id a37so18017962ljq.13
 for <xen-devel@lists.xenproject.org>; Mon, 20 Dec 2021 13:16:20 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b35sm635132lfv.209.2021.12.20.13.16.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Dec 2021 13:16:19 -0800 (PST)
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
X-Inumbo-ID: 13d17607-61da-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qvpXNTLTS2Ou2xoiYRMuZM4a44G4SigTrlNi3wejEhU=;
        b=f4oJF2gkVGsK6/9ewRqi+f5aAOA1Nb1HZ8Q04mKakwVTxo62yuJLYRYDebhnjBSZcx
         GIlAslICYpPvlevexgjuP4Ar64EhJZ7U+pIeHTQDvR1m7i0Dmv/R3AV26YqzjvPLdAt0
         Dl8gdT6iXKtLSVIwlAKH9YXHIzc9b61vZrPC5hEQPO2KXk26Ix7KtRMJS0q6HVZIHB1q
         98lNyRZXUK0y23oqhTOJXN8t5p8mEL5tQN9Ms3SfqFpZMTI3XCqvQug5kQOxPyfBXRao
         VYyJVi7hR/BXOausPApKYjuWxS+Dq+Ka+yIrUM32SDTKj8ofNhqRZtDPiREKFc/9jSk/
         +RJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qvpXNTLTS2Ou2xoiYRMuZM4a44G4SigTrlNi3wejEhU=;
        b=pNvYMXpecA7F+ll9zstPr48ra3OEGE6CCYoS5LS178ufaUo49mDl0ljOis4FXPUR2o
         9xdlmM2k6c8kfHKelopr0aWZAje942LHsHzPOzJVSvp0TQPkMwc+Pioga61mc0h00oB8
         +w8cnXtZVaCn31ZLtBYNHiYHmTXOvQPrcMQhrSGMwoFTl3gtANI+gDo/heJYSszXWO+K
         7csa1uCvnNAI9siQDPAIryHtzz1JBzyzO2uY7cBOPkZrZKCmKnYnSEXanNaJxHPH4+DV
         LROdNwTmi9cLfds4g3LytzHrdkXK6fj6h9nqP2BiAh/ZgpBeASDPZGWGTzPYuKSBo//D
         CUBw==
X-Gm-Message-State: AOAM5329SApkWWV4hfDd0flPlFxT8qx3ZI8einM4BrueFRUmhSFUtqJb
	XN6wU0GLlHDYnK8/VeufR0LsXep3+gA=
X-Google-Smtp-Source: ABdhPJxWPezQF6NbeQ18VRNYks8+OCfDkLbPeHBRDUAWe/GGifNO9f82mjeawDjmJjCu/EpwKVrHsQ==
X-Received: by 2002:a2e:a482:: with SMTP id h2mr15951927lji.87.1640034979903;
        Mon, 20 Dec 2021 13:16:19 -0800 (PST)
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
Subject: [PATCH V2 07/10] iommu/ipmmu-vmsa: Add Renesas R8A779F0 (R-Car S4) support
Date: Mon, 20 Dec 2021 23:15:54 +0200
Message-Id: <1640034957-19764-8-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
References: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Based on the following Linux upsteam commit:
7a62ced8ebd0e1b692c9dc4781a8d4ddb0f74792

Original commit message:
 commit 7a62ced8ebd0e1b692c9dc4781a8d4ddb0f74792
 Author: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
 Date:   Tue Sep 7 17:30:20 2021 +0900

  iommu/ipmmu-vmsa: Add support for r8a779a0

  Add support for r8a779a0 (R-Car V3U). The IPMMU hardware design
  of this SoC differs than others. So, add a new ipmmu_features for it.

  Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
  Link: https://lore.kernel.org/r/20210907083020.907648-3-yoshihiro.shimoda.uh@renesas.com
  Signed-off-by: Joerg Roedel <jroedel@suse.de>

**********

The R-Car S4 is an automotive System-on-Chip (SoC) for Car
Server/Communication Gateway and is one of the first products
in Renesas’ 4th-generation R-Car Family.

The integrated IOMMU HW is also VMSA-compatible and supports
stage 2 translation table format, therefore can be used with
current driver with slight modifications (thanks to the prereq
work).

In the context of Xen driver the main differences between Gen3
and Gen4 are the following:
- HW capacity was enlarged to support up to 16 IPMMU contexts
  (sets of page table) and up to 64 micro-TLBs per IPMMU device
- the memory mapped registers have different bases and offsets

Please note that Linux upstream doesn't support R-Car S4 SoC
yet unlike Renesas BSP [1], but it was decided to reuse upstream
patch for R-Car V3U anyway as the IPMMU HW settings are similar.

[1]
7003b9f732cf iommu/ipmmu-vmsa: Add Renesas R8A779F0 (R-Car S4) support
https://github.com/renesas-rcar/linux-bsp/tree/v5.10.41/rcar-5.1.3.rc5

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Changes V1 -> V2:
   - base on the Linux upsteam patch instead of BSP's one
   - update patch description and comments in code
   - replace ipmmu_features_rcar_s4 with ipmmu_features_rcar_gen4
   - introduce control_offset_base field
---
 xen/drivers/passthrough/Kconfig          |  6 +--
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 63 +++++++++++++++++++++++---------
 2 files changed, 49 insertions(+), 20 deletions(-)

diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
index 09505aa..479d7de 100644
--- a/xen/drivers/passthrough/Kconfig
+++ b/xen/drivers/passthrough/Kconfig
@@ -25,14 +25,14 @@ config ARM_SMMU_V3
 	 the ARM SMMUv3 architecture.
 
 config IPMMU_VMSA
-	bool "Renesas IPMMU-VMSA found in R-Car Gen3 SoCs"
+	bool "Renesas IPMMU-VMSA found in R-Car Gen3/Gen4 SoCs"
 	depends on ARM_64
 	---help---
 	  Support for implementations of the Renesas IPMMU-VMSA found
-	  in R-Car Gen3 SoCs.
+	  in R-Car Gen3/Gen4 SoCs.
 
 	  Say Y here if you are using newest R-Car Gen3 SoCs revisions
-	  (H3 ES3.0, M3-W+, etc) which IPMMU hardware supports stage 2
+	  (H3 ES3.0, M3-W+, etc) or Gen4 SoCs which IPMMU hardware supports stage 2
 	  translation table format and is able to use CPU's P2M table as is.
 
 endif
diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index d8f96fc..14848ce 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -1,15 +1,15 @@
 /*
  * xen/drivers/passthrough/arm/ipmmu-vmsa.c
  *
- * Driver for the Renesas IPMMU-VMSA found in R-Car Gen3 SoCs.
+ * Driver for the Renesas IPMMU-VMSA found in R-Car Gen3/Gen4 SoCs.
  *
  * The IPMMU-VMSA is VMSA-compatible I/O Memory Management Unit (IOMMU)
  * which provides address translation and access protection functionalities
  * to processing units and interconnect networks.
  *
  * Please note, current driver is supposed to work only with newest
- * R-Car Gen3 SoCs revisions which IPMMU hardware supports stage 2 translation
- * table format and is able to use CPU's P2M table as is.
+ * R-Car Gen3/Gen4 SoCs revisions which IPMMU hardware supports stage 2
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
@@ -68,12 +68,13 @@
     dev_print(dev, XENLOG_ERR, fmt, ## __VA_ARGS__)
 
 /*
- * R-Car Gen3 SoCs make use of up to 8 IPMMU contexts (sets of page table) and
- * these can be managed independently. Each context is mapped to one Xen domain.
+ * R-Car Gen3/Gen4 SoCs make use of up to 16 IPMMU contexts (sets of page table)
+ * and these can be managed independently. Each context is mapped to one Xen
+ * domain.
  */
-#define IPMMU_CTX_MAX     8U
-/* R-Car Gen3 SoCs make use of up to 48 micro-TLBs per IPMMU device. */
-#define IPMMU_UTLB_MAX    48U
+#define IPMMU_CTX_MAX     16U
+/* R-Car Gen3/Gen4 SoCs make use of up to 64 micro-TLBs per IPMMU device. */
+#define IPMMU_UTLB_MAX    64U
 
 /* IPMMU context supports IPA size up to 40 bit. */
 #define IPMMU_MAX_P2M_IPA_BITS    40
@@ -112,6 +113,8 @@ struct ipmmu_features {
     unsigned int ctx_offset_base;
     unsigned int ctx_offset_stride;
     unsigned int utlb_offset_base;
+    unsigned int control_offset_base;
+    unsigned int imuctr_ttsel_mask;
 };
 
 /* Root/Cache IPMMU device's information */
@@ -211,7 +214,6 @@ static DEFINE_SPINLOCK(ipmmu_devices_lock);
 #define IMUCTR0(n)             (0x0300 + ((n) * 16))
 #define IMUCTR32(n)            (0x0600 + (((n) - 32) * 16))
 #define IMUCTR_TTSEL_MMU(n)    ((n) << 4)
-#define IMUCTR_TTSEL_MASK      (15 << 4)
 #define IMUCTR_TTSEL_SHIFT     4
 #define IMUCTR_FLUSH           (1 << 1)
 #define IMUCTR_MMUEN           (1 << 0)
@@ -316,8 +318,12 @@ static void ipmmu_write(struct ipmmu_vmsa_device *mmu, uint32_t offset,
 static unsigned int ipmmu_ctx_reg(struct ipmmu_vmsa_device *mmu,
                                   unsigned int context_id, uint32_t reg)
 {
-    return mmu->features->ctx_offset_base +
-        context_id * mmu->features->ctx_offset_stride + reg;
+    unsigned int base = mmu->features->ctx_offset_base;
+
+    if ( context_id > 7 )
+        base += 0x800 - 8 * 0x40;
+
+    return base + context_id * mmu->features->ctx_offset_stride + reg;
 }
 
 static uint32_t ipmmu_ctx_read(struct ipmmu_vmsa_device *mmu,
@@ -448,7 +454,8 @@ static int ipmmu_utlb_enable(struct ipmmu_vmsa_domain *domain,
     {
         unsigned int context_id;
 
-        context_id = (imuctr & IMUCTR_TTSEL_MASK) >> IMUCTR_TTSEL_SHIFT;
+        context_id = (imuctr & mmu->features->imuctr_ttsel_mask) >>
+            IMUCTR_TTSEL_SHIFT;
         if ( domain->context_id != context_id )
         {
             dev_err(mmu->dev, "Micro-TLB %u already assigned to IPMMU context %u\n",
@@ -740,6 +747,18 @@ static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
     .ctx_offset_base = 0,
     .ctx_offset_stride = 0x40,
     .utlb_offset_base = 0,
+    .control_offset_base = 0,
+    .imuctr_ttsel_mask = (15 << 4),
+};
+
+static const struct ipmmu_features ipmmu_features_rcar_gen4 = {
+    .number_of_contexts = 16,
+    .num_utlbs = 64,
+    .ctx_offset_base = 0x10000,
+    .ctx_offset_stride = 0x1040,
+    .utlb_offset_base = 0x3000,
+    .control_offset_base = 0x1000,
+    .imuctr_ttsel_mask = (31 << 4),
 };
 
 static void ipmmu_device_reset(struct ipmmu_vmsa_device *mmu)
@@ -751,11 +770,12 @@ static void ipmmu_device_reset(struct ipmmu_vmsa_device *mmu)
         ipmmu_ctx_write(mmu, i, IMCTR, 0);
 }
 
-/* R-Car Gen3 SoCs product and cut information. */
+/* R-Car Gen3/Gen4 SoCs product and cut information. */
 #define RCAR_PRODUCT_MASK    0x00007F00
 #define RCAR_PRODUCT_H3      0x00004F00
 #define RCAR_PRODUCT_M3W     0x00005200
 #define RCAR_PRODUCT_M3N     0x00005500
+#define RCAR_PRODUCT_S4      0x00005A00
 #define RCAR_CUT_MASK        0x000000FF
 #define RCAR_CUT_VER30       0x00000020
 
@@ -803,6 +823,10 @@ static __init bool ipmmu_stage2_supported(void)
         stage2_supported = true;
         break;
 
+    case RCAR_PRODUCT_S4:
+        stage2_supported = true;
+        break;
+
     default:
         printk(XENLOG_ERR "ipmmu: Unsupported SoC version\n");
         break;
@@ -831,6 +855,10 @@ static const struct dt_device_match ipmmu_dt_match[] __initconst =
         .compatible = "renesas,ipmmu-r8a77961",
         .data = &ipmmu_features_rcar_gen3,
     },
+    {
+        .compatible = "renesas,ipmmu-r8a779f0",
+        .data = &ipmmu_features_rcar_gen4,
+    },
     { /* sentinel */ },
 };
 
@@ -845,6 +873,7 @@ static int ipmmu_probe(struct dt_device_node *node)
     const struct dt_device_match *match;
     struct ipmmu_vmsa_device *mmu;
     uint64_t addr, size;
+    uint32_t reg;
     int irq, ret;
 
     mmu = xzalloc(struct ipmmu_vmsa_device);
@@ -930,8 +959,8 @@ static int ipmmu_probe(struct dt_device_node *node)
          * Use stage 2 translation table format when stage 2 translation
          * enabled.
          */
-        ipmmu_write(mmu, IMSAUXCTLR,
-                    ipmmu_read(mmu, IMSAUXCTLR) | IMSAUXCTLR_S2PTE);
+        reg = IMSAUXCTLR + mmu->features->control_offset_base;
+        ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) | IMSAUXCTLR_S2PTE);
 
         dev_info(&node->dev, "IPMMU context 0 is reserved\n");
         set_bit(0, mmu->ctx);
-- 
2.7.4



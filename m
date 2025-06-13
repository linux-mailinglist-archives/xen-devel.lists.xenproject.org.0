Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B731AD91D9
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:49:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014629.1392769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6eO-0007ry-Es; Fri, 13 Jun 2025 15:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014629.1392769; Fri, 13 Jun 2025 15:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6eO-0007oL-Az; Fri, 13 Jun 2025 15:49:04 +0000
Received: by outflank-mailman (input) for mailman id 1014629;
 Fri, 13 Jun 2025 15:49:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44KY=Y4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uQ6eM-0006ch-CV
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:49:02 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecfe9b31-486d-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 17:49:01 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6086502e750so4366643a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 08:49:01 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec8979563sm144821766b.158.2025.06.13.08.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 08:48:59 -0700 (PDT)
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
X-Inumbo-ID: ecfe9b31-486d-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749829741; x=1750434541; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHqoFErtd8yGkd2BNMISXV9hdJ8jkEDcMnHOQfMkP38=;
        b=ValZsef9zYQ8EFFrdUBB3BK4DTEV1Csx211FpR3iTKnXk2g1hnfuaq7qLb29BkPxM+
         yQf/5I0BciM039Ju9Sj0UpimKsmumgtjtzMnncxWVPeNr2yJiPhtIAUnXoxcYedkEFqq
         NmTNhfdPfEshaiSxmKLIBRhh0Lhf68lbatWrUGf33Ha1zt3OCPLY+TWJS8YDZEAUm0gO
         lvb6JixYAKT8uG/C9U5rMf/1xvHiOxsyZkFMCfQEcMfilrUMIN1CHKv5LEb/8SEBTh8C
         Wyie7/LGE3/4pjD7q07NeKI6uwZ9U6nAbk5hZMyf7niskKAhN5J/QkUh/rrg2itE7AwU
         zDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749829741; x=1750434541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHqoFErtd8yGkd2BNMISXV9hdJ8jkEDcMnHOQfMkP38=;
        b=Jb7gjSxwCuf+cwIudaVYdfu5wX2gF1gqgzOXRo3czqa7FjdIQOlNGoI1Z0Rushzbl8
         jyiwyDiX38zfC8JMeCwQAIOcGNmHuKUvzIGveh8zGVGhOhV0QRZTOADVsErf46KiaH+M
         wH52fiVi80DpSITkptxXroBAzec8yKGpFPnUHsAD1e3z2sJsUKbufDDCGbopVhvh/Bps
         CLtwg0uulqm/vVzE8rx7fuDoGzT5PuSETGSXYAEftRqRYwqysv8KaCATPugWvkZi0Mw/
         yYFHCJeZ5CivIfDQnf2wJtG5qwClo89G9cy/xwdWpXhPMZIBL9FbYzx7j2xeTloYpCh+
         r9vg==
X-Gm-Message-State: AOJu0YyBQ9eevJjWFuq+EECzj4ZvKYhubq5/pkYbQg4TIIgeobPWQCHd
	j3wD9KqPhPRSixljIIQGXnTiIEZD6IFeGQjsdLC527O/tKlp7a/dUq8LajQ2ZQ==
X-Gm-Gg: ASbGnctwDHihdRHiF1NnWbW+CC0y/IMHpiGt+sF455yDDoAmiwEyZpeNYvK0tf5yiwy
	wxKAwdT6jiYnodV7BE3UJIZakyA5iThehR/dKOq5/7kkMiZrvJw1NPDFz0lOwNHSTdO1cs3fEc3
	9sCLnh3urnFOBHuxY7gWSviQ596zhIBRggrI5ol5KIxkD/kRAGe9Jg3aJBrtdNi3T3hAQRSJKtS
	ewtgJ+Nf3eqm/3W1hZTNbb3+QgxVsYuDNLKjHR3pezH+VDbVTbVKH5NAKVUhYjp62O35PTrz55t
	/G2M17JIAnCQDVPcRMcmkpT6IIF4Uq63e3J/nE6jpXsmJ+D03mdyg9CJKejB93bUbRuymIKYYBB
	YMaQpfwLJvnWAmO0P0gBy8bxrDvva
X-Google-Smtp-Source: AGHT+IGCcBBwT8scCSkun7lleqBfm9R+4Munlim3AIUheOwZ0XdMjQiskEEtE7O8rPLmyuXV4BAhqw==
X-Received: by 2002:a17:907:7fa6:b0:ade:5ba:40e1 with SMTP id a640c23a62f3a-adec4ed1766mr357284666b.0.1749829740130;
        Fri, 13 Jun 2025 08:49:00 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Romain Caritey <Romain.Caritey@microchip.com>
Subject: [PATCH v5 4/9] xen/riscv: aplic_init() implementation
Date: Fri, 13 Jun 2025 17:48:43 +0200
Message-ID: <cfbfe119b2b19339c66edbe37f2165649b12741a.1749825782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749825782.git.oleksii.kurochko@gmail.com>
References: <cover.1749825782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

aplic_init() function does the following few things:
 - checks that IMSIC in device tree node  ( by checking msi-parent property
   in APLIC node ) is present as current one implmenetaion of AIA is
   supported only MSI method.
 - initialize IMSIC based on IMSIC device tree node
 - Read value of APLIC's paddr start/end and size.
 - Map aplic.regs
 - Setup APLIC initial state interrupts (disable all interrupts, set
   interrupt type and default priority, confgifure APLIC domaincfg) by
   calling aplic_init_hw_interrutps().

aplic_init() is based on the code from [1] and [2].

Since Microchip originally developed aplic.c, an internal discussion with
them led to the decision to use the MIT license.

[1] https://gitlab.com/xen-project/people/olkur/xen/-/commit/7cfb4bd4748ca268142497ac5c327d2766fb342d
[2] https://gitlab.com/xen-project/people/olkur/xen/-/commit/392a531bfad39bf4656ce8128e004b241b8b3f3e

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5:
 - Fix a typo in panic massege in aplic_init(): s/Failded/Failed.
 - Correct size check: (!IS_ALIGNED(size, KB(4)) && (size < KB(16))) ->
   (!IS_ALIGNED(size, KB(4)) || (size < KB(16))).
 - Avoid wrapping format strings across lines.
---
Changes in V4:
 - s/ASM__RISCV_PRIV_APLIC_H/ASM_RISCV_PRIV_APLIC_H
 - Drop APLIC_MAX_NUM_WIRED_IRQ_SOURCES and use ARRAY_SIZE(aplic.regs->sourcecfg).
 - Don't use 'else if' for the case when the earlier if() ends in an
   unconditional control flow change.
 - Use const for aplic_ops and drop __ro_after_init.
 - Add checks of APLIC's memory-mapped control region physical address and
   size.
 - s/ASM__RISCV__APLIC_H/ASM_RISCV_APLIC_H.
 - Use unsigned int in defintion of APLIC_DOMAINCFG_IE and APLIC_DOMAINCFG_DM.
 - set aplic_info.num_irqs to ARRAY_SIZE(aplic.regs->sourcecfg) if DT node
   provides too much.
 - Add some constraints for aplic.paddr_start and aplic.size.
---
Changes in V3:
 - Correct the comment on top of aplic-priv.h:
     xen/arch/riscv/aplic.h -> .../aplic-priv.h
 - Add __iomem for regs member of aplic_priv structure.
 - [aplic_init_hw_interrupts] Use ~0U instead of -1U in aplic_init_hw_interrupts()
   to disable all interrupts.
 - [aplic_init_hw_interrupts] Start 'i' (for-cycle variable) from 0, not from 1.
 - [aplic_init()] Declare imsic_node as pointer-to-const.
 - Use decimal for arrays in struct aplic_regs.
 - [aplic_init()] Check that aplic_info.num_irqs are less then 1023.
 - [aplic_init()] Drop out check of IMSIC's node interrupt-extended property
   from aplic_init().
---
Changes in V2:
 - use __ro_after_init for aplic_ops.
 - s/nr_irqs/num_irqs.
 - s/dt_processor_hartid/dt_processor_cpuid.
 - Drop confusing comment in aplic_init_hw_interrupts().
 - Code style fixes.
 - Drop years for Copyright.
 - Revert changes which drop nr_irq define from asm/irq.h,
   it shouldn't be, at least, part of this patch.
 - Drop paddr_enf from struct aplic_regs. It is enough to have pair
   (paddr_start, size).
 - Make  struct aplic_priv of asm/aplic.h private by moving it to
   riscv/aplic-priv.h.
 - Add the comment above the initialization of APLIC's target register.
 - use writel() to access APLIC's registers.
 - use 'unsinged int' for local variable i in aplic_init_hw_interrupts.
 - Add the check that all modes in interrupts-extended property of
   imsic node are equal. And drop rc != EOVERFLOW when interrupts-extended
   property is read.
 - Add cf_check to aplic_init().
 - Fix a cycle of clrie register initialization in aplic_init_hw_interrupts().
   Previous implementation leads to out-of-boundary.
 - Declare member num_irqs in struct intc_info as it is used by APLIC code.
---
 xen/arch/riscv/aplic-priv.h        |  34 ++++++++++
 xen/arch/riscv/aplic.c             | 103 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/aplic.h |  64 ++++++++++++++++++
 xen/arch/riscv/include/asm/intc.h  |   3 +
 4 files changed, 204 insertions(+)
 create mode 100644 xen/arch/riscv/aplic-priv.h
 create mode 100644 xen/arch/riscv/include/asm/aplic.h

diff --git a/xen/arch/riscv/aplic-priv.h b/xen/arch/riscv/aplic-priv.h
new file mode 100644
index 0000000000..7ed1ab8f4b
--- /dev/null
+++ b/xen/arch/riscv/aplic-priv.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * xen/arch/riscv/aplic-priv.h
+ *
+ * Private part of aplic.h header.
+ *
+ * RISC-V Advanced Platform-Level Interrupt Controller support
+ *
+ * Copyright (c) Microchip.
+ * Copyright (c) Vates.
+ */
+
+#ifndef ASM_RISCV_PRIV_APLIC_H
+#define ASM_RISCV_PRIV_APLIC_H
+
+#include <xen/types.h>
+
+#include <asm/aplic.h>
+#include <asm/imsic.h>
+
+struct aplic_priv {
+    /* base physical address and size */
+    paddr_t paddr_start;
+    size_t  size;
+
+    /* registers */
+    volatile struct aplic_regs __iomem *regs;
+
+    /* imsic configuration */
+    const struct imsic_config *imsic_cfg;
+};
+
+#endif /* ASM_RISCV_PRIV_APLIC_H */
diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 10ae81f7ac..cc3e299212 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -9,19 +9,118 @@
  * Copyright (c) 2024-2025 Vates
  */
 
+#include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/irq.h>
+#include <xen/mm.h>
 #include <xen/sections.h>
 #include <xen/types.h>
+#include <xen/vmap.h>
+
+#include "aplic-priv.h"
 
 #include <asm/device.h>
+#include <asm/imsic.h>
 #include <asm/intc.h>
+#include <asm/riscv_encoding.h>
+
+#define APLIC_DEFAULT_PRIORITY  1
+
+static struct aplic_priv aplic;
 
 static struct intc_info __ro_after_init aplic_info = {
     .hw_version = INTC_APLIC,
 };
 
+static void __init aplic_init_hw_interrupts(void)
+{
+    unsigned int i;
+
+    /* Disable all interrupts */
+    for ( i = 0; i < ARRAY_SIZE(aplic.regs->clrie); i++)
+        writel(~0U, &aplic.regs->clrie[i]);
+
+    /* Set interrupt type and default priority for all interrupts */
+    for ( i = 0; i < aplic_info.num_irqs; i++ )
+    {
+        writel(0, &aplic.regs->sourcecfg[i]);
+        /*
+         * Low bits of target register contains Interrupt Priority bits which
+         * can't be zero according to AIA spec.
+         * Thereby they are initialized to APLIC_DEFAULT_PRIORITY.
+         */
+        writel(APLIC_DEFAULT_PRIORITY, &aplic.regs->target[i]);
+    }
+
+    writel(APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM, &aplic.regs->domaincfg);
+}
+
+static int __init cf_check aplic_init(void)
+{
+    dt_phandle imsic_phandle;
+    const __be32 *prop;
+    uint64_t size, paddr;
+    const struct dt_device_node *imsic_node;
+    const struct dt_device_node *node = aplic_info.node;
+    int rc;
+
+    /* Check for associated imsic node */
+    if ( !dt_property_read_u32(node, "msi-parent", &imsic_phandle) )
+        panic("%s: IDC mode not supported\n", node->full_name);
+
+    imsic_node = dt_find_node_by_phandle(imsic_phandle);
+    if ( !imsic_node )
+        panic("%s: unable to find IMSIC node\n", node->full_name);
+
+    rc = imsic_init(imsic_node);
+    if ( rc == IRQ_M_EXT )
+        /* Machine mode imsic node, ignore this aplic node */
+        return 0;
+
+    if ( rc )
+        panic("%s: Failed to initialize IMSIC\n", node->full_name);
+
+    /* Find out number of interrupt sources */
+    if ( !dt_property_read_u32(node, "riscv,num-sources",
+                               &aplic_info.num_irqs) )
+        panic("%s: failed to get number of interrupt sources\n",
+              node->full_name);
+
+    if ( aplic_info.num_irqs > ARRAY_SIZE(aplic.regs->sourcecfg) )
+        aplic_info.num_irqs = ARRAY_SIZE(aplic.regs->sourcecfg);
+
+    prop = dt_get_property(node, "reg", NULL);
+    dt_get_range(&prop, node, &paddr, &size);
+    if ( !paddr )
+        panic("%s: first MMIO resource not found\n", node->full_name);
+
+    if ( !IS_ALIGNED(paddr, KB(4)) )
+        panic("%s: paddr of memory-mapped control region should be 4Kb aligned:%#lx\n",
+              __func__, paddr);
+
+    if ( !IS_ALIGNED(size, KB(4)) || (size < KB(16)) )
+        panic("%s: memory-mapped control region should be a multiple of 4 KiB in size and the smallest valid control is 16Kb: %#lx\n",
+              __func__, size);
+
+    aplic.paddr_start = paddr;
+    aplic.size = size;
+
+    aplic.regs = ioremap(paddr, size);
+    if ( !aplic.regs )
+        panic("%s: unable to map\n", node->full_name);
+
+    /* Setup initial state APLIC interrupts */
+    aplic_init_hw_interrupts();
+
+    return 0;
+}
+
+static const struct intc_hw_operations aplic_ops = {
+    .info                = &aplic_info,
+    .init                = aplic_init,
+};
+
 static int cf_check aplic_irq_xlate(const uint32_t *intspec,
                                     unsigned int intsize,
                                     unsigned int *out_hwirq,
@@ -53,8 +152,12 @@ static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
 
     aplic_info.node = node;
 
+    aplic.imsic_cfg = imsic_get_config();
+
     dt_irq_xlate = aplic_irq_xlate;
 
+    register_intc_ops(&aplic_ops);
+
     return 0;
 }
 
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
new file mode 100644
index 0000000000..fea95d4369
--- /dev/null
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * xen/arch/riscv/asm/include/aplic.h
+ *
+ * RISC-V Advanced Platform-Level Interrupt Controller support
+ *
+ * Copyright (c) Microchip.
+ */
+
+#ifndef ASM_RISCV_APLIC_H
+#define ASM_RISCV_APLIC_H
+
+#include <xen/types.h>
+
+#include <asm/imsic.h>
+
+#define APLIC_DOMAINCFG_IE      BIT(8, U)
+#define APLIC_DOMAINCFG_DM      BIT(2, U)
+
+struct aplic_regs {
+    uint32_t domaincfg;
+    uint32_t sourcecfg[1023];
+    uint8_t _reserved1[3008];
+
+    uint32_t mmsiaddrcfg;
+    uint32_t mmsiaddrcfgh;
+    uint32_t smsiaddrcfg;
+    uint32_t smsiaddrcfgh;
+    uint8_t _reserved2[48];
+
+    uint32_t setip[32];
+    uint8_t _reserved3[92];
+
+    uint32_t setipnum;
+    uint8_t _reserved4[32];
+
+    uint32_t in_clrip[32];
+    uint8_t _reserved5[92];
+
+    uint32_t clripnum;
+    uint8_t _reserved6[32];
+
+    uint32_t setie[32];
+    uint8_t _reserved7[92];
+
+    uint32_t setienum;
+    uint8_t _reserved8[32];
+
+    uint32_t clrie[32];
+    uint8_t _reserved9[92];
+
+    uint32_t clrienum;
+    uint8_t _reserved10[32];
+
+    uint32_t setipnum_le;
+    uint32_t setipnum_be;
+    uint8_t _reserved11[4088];
+
+    uint32_t genmsi;
+    uint32_t target[1023];
+};
+
+#endif /* ASM_RISCV_APLIC_H */
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 434c9d0781..3c4b211f58 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -19,6 +19,9 @@ struct irq_desc;
 struct intc_info {
     enum intc_version hw_version;
     const struct dt_device_node *node;
+
+    /* number of irqs */
+    unsigned int num_irqs;
 };
 
 struct intc_hw_operations {
-- 
2.49.0



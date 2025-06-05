Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0895EACF398
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 17:59:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007086.1386391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNCzy-0007ny-0E; Thu, 05 Jun 2025 15:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007086.1386391; Thu, 05 Jun 2025 15:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNCzx-0007fr-O2; Thu, 05 Jun 2025 15:59:21 +0000
Received: by outflank-mailman (input) for mailman id 1007086;
 Thu, 05 Jun 2025 15:59:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EkoY=YU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uNCzw-0007U9-M1
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 15:59:20 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a179f57-4226-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 17:59:19 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-606741e8e7cso2019511a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 08:59:19 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60566c2aba9sm10443034a12.2.2025.06.05.08.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 08:59:18 -0700 (PDT)
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
X-Inumbo-ID: 0a179f57-4226-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749139159; x=1749743959; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+NDKY61Cx6ldBPjIJ5Kx3dRaGdPkQgKXL4UjKAuxu0=;
        b=cr0mJdRqHpmassbITEm8jhiCPBEvyHw4ovZl/YDJsOCDnOUKxH27UpO3c7OoLqXg1h
         x1MGd715svVpn6lJB0OAj8wfOQGoDl8qht2R4tgsJk5IPZJmbRBnTEpJpg/8JSLEb/cm
         hjSLETXkjkfLsIFyLCHchfhc7xVYJvmXnE7bj5TAlL/AYi5wjBdJRV0Uyvpse9PwpZnH
         SBzsQOORHYBgvAjFxC+Bi0rznZ9GR7JLKIL84lWCDoi+Oue3/w+74Uyu8XCyUS4Ype7u
         XwHgMe+naJfPGg//q7I2uZ78ybA9PzDZceeUVC1gMTLqLLWDre0HxdwhnzGUHYKtEb7P
         7HhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749139159; x=1749743959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+NDKY61Cx6ldBPjIJ5Kx3dRaGdPkQgKXL4UjKAuxu0=;
        b=qri6j9kpO2sUqX25t3eHnxbJ5DbxQtpPh3c7fV3Lkh9OG3N2zP0IY4bvIWFX6Yjj3v
         C1Ce9xKRNTs176GIICZDwcJ8NkXP8s7/7zKXEu3Z8RT/YX1DJSj6yPDapPxp0Le8JSTG
         dq0F+jo0LFxnYbDG7FLZ+jLP8w/VkbVXMJJuhA/bvg/jrGjGynQlB1OjZz4pzfOdeIIO
         GA07niUofmRF+DwaIftHgcobiur8xDDcyuwKTIp+Ustowb1cNv/qSVxExMcMkMShJikf
         wceTMGinQyhtWL3iETHMQN1xmi3zc6OIvTZygbnpGcqO/aCCWXZWf+IQ+CFmAVWsyQe4
         KgkQ==
X-Gm-Message-State: AOJu0YydROQ6n7VErQCbbY8C0tXLdDmIHDHz80JLLHfVZ1y8v/YqCbwy
	aAiBL1Csd1+6aPcM8RIBPvA8UI2CtNZ9VjTxUM4GJ60H+3EtI6gHK8+Q4YXqdw==
X-Gm-Gg: ASbGnctPgkyyGgKrTOOlSq+hxUcgexUfDNbcL1K6Brp6D/QhOTGzny1XPCJXlV1RaSa
	PVbrkG/d1xrmC4IeUWuAjDGKrNKRUeHlfbba5rotK8vakoJsm/5Et8JnYCD6pRQXaYA6PRbJEwH
	T0zKIyOkelt2GucfbfwEcAplop2W+d9YkarkJ4nJCATp4Xy16AmF25ZD+tkiW2V6cUmzqMNxMrF
	n3KdZESVO6HGh5d/9W0K2vAGiDSVidFCBR8IZt1B69US5JDJLDbm94wAsHCgRcF2/m8LU4W6RFa
	QjjpKh2qb1OpD2r87pIHq99o+1X5yOfuahBoRkpYaboNLo0nXkSOUuhIIPzMJfFD/Xor6iAWHyd
	c/Cp7r9JkNNoAHgJjJA==
X-Google-Smtp-Source: AGHT+IFdBRqxzcs9BcNRaTjie4zaFJ0i9l3AgwmNLIf6sMWzwEUJQ2+TZPnc+YtLV0ejVORY1IiycA==
X-Received: by 2002:a05:6402:524d:b0:607:206f:a2e with SMTP id 4fb4d7f45d1cf-607206f0fd4mr3803925a12.32.1749139158540;
        Thu, 05 Jun 2025 08:59:18 -0700 (PDT)
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
Subject: [PATCH v4 4/9] xen/riscv: aplic_init() implementation
Date: Thu,  5 Jun 2025 17:59:00 +0200
Message-ID: <1913a653568d51ed630dbbda1e1364b41aa5db89.1749121437.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749121437.git.oleksii.kurochko@gmail.com>
References: <cover.1749121437.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/aplic.c             | 104 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/aplic.h |  64 ++++++++++++++++++
 xen/arch/riscv/include/asm/intc.h  |   3 +
 4 files changed, 205 insertions(+)
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
index 10ae81f7ac..04964dc998 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -9,19 +9,119 @@
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
+        panic("%s: Failded to initialize IMSIC\n", node->full_name);
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
+        panic("%s: paddr of memory-mapped control region should be 4Kb "
+              "aligned:%#lx\n", __func__, paddr);
+
+    if ( !IS_ALIGNED(size, KB(4)) && (size < KB(16)) )
+        panic("%s: memory-mapped control region should be a multiple of 4 KiB "
+              "in size and the smallest valid control is 16Kb: %#lx\n",
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
@@ -53,8 +153,12 @@ static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
 
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



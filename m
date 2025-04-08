Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0A9A810E2
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 17:57:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942513.1341726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BKU-00073c-Md; Tue, 08 Apr 2025 15:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942513.1341726; Tue, 08 Apr 2025 15:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BKU-0006pW-Ai; Tue, 08 Apr 2025 15:57:38 +0000
Received: by outflank-mailman (input) for mailman id 942513;
 Tue, 08 Apr 2025 15:57:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4Vq=W2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u2BKR-0004Yr-PD
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 15:57:35 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fe81a6b-1492-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 17:57:35 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5e5cded3e2eso8998947a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 08:57:35 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7c018556bsm929934566b.156.2025.04.08.08.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 08:57:33 -0700 (PDT)
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
X-Inumbo-ID: 2fe81a6b-1492-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744127854; x=1744732654; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qs/V9bH5HfCVD/a2CF4cR56cAvFz6TnsciyGeIqgJxk=;
        b=RdC84H7L9m2g99RTxVjKF/mbFE+KpDYvXwX2eSqmawPsDqIfKXk3uA3CjYXdV49eYg
         8FFFpZxuo4aJ69novGTx5ZvPGjHqgIslYBHI4qeUNqZBC1KezQOj68791urR/40cN/xg
         x6ZJRdWMK4E6TSD+qe3btCeHXVcD/NXXdn980RevAiu9vXAvI0nDMYK5IRzG77T4K170
         ZlKCvj9oGxS6GXWgLfuvKKiCocUUIqP6rDDMfOMnF/rm/QkjBUDJGUsxJVGnZIVAMv14
         X44tjKAsRyJV7r7Zl6NgS+gcCbaMYBDLrIrP+n1NExOBCb/SNSf0c+Nz3ruEtPVOcGd8
         jKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127854; x=1744732654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qs/V9bH5HfCVD/a2CF4cR56cAvFz6TnsciyGeIqgJxk=;
        b=uEiLROtcbRbQ2n4OoqSIbPnu4rim0ZpTFRdgkVhwITQ7jIM1lZIMBFhGctgBmmHQQ8
         rZFYUJtVMEORwd9VE8Uz0JgrRJpDrg/MGlBGhQDye4P732BqVTUM8tkmtteyNcCbWxdl
         TKn2ko4I4Tn5k/koOux/yFRga3Aq7JpMcRGGt0DwAa8ayvWDBkYfFDH4YtN175iIy3uK
         uOTV2adLMnyCLbACWCcbuwQ9Ssn/OHJYs9yQy8sYc8ccaRran4lyIXnY2swI+H7qyARZ
         HG2W78RWUwxAxoX8VwOolgzR39qCyCHQrwyz8ZL5s1P0HAG/j3HwHudBBYIDoCj51+Rt
         /Wbg==
X-Gm-Message-State: AOJu0YzLKnNtAqjgZQXsEnAMN3lWuZ3SPVziUs9cr/Mn5b7okL7U8WXE
	SQuXLCdneUBeEFrffX9ql9ShpwmokeXrLnjBvM+aNqXZar9z9rnQXrxxHw==
X-Gm-Gg: ASbGncuxnYKLHhshopm1Dp1Q3Agkkl1RFdLsWddlvRbP1Mj4HvIBujz669AiKUAWAQN
	pS+3sDR0CFUr6bnXMDjnf3qoFLd3seDUsk9noia2GnFCnmMNXBQtY9jc1g9qYqZ6xwRczbrQoGZ
	5Va8XwbyFiP8EgUfnW2nKBZMneSwKMXqNJRsvHS7A1Hug/tm7VZiuVP0WogCFSjL/eMO62ght7c
	vQTdwisfjrhQE/r+nVXoofZx40a8eO//MhQNqs4zipQ0bfdPKPwnsCcH4ovTN/V2khK4CBM5LPm
	jHuzCThA+PaYojr+xiwM6H3PnE87744YrzypuF2ahTZMChj6aMRddDXL/a8Z7R5szU1dRbNFV4X
	+UhF2NrOlGDJefGuLBJ41a+gW
X-Google-Smtp-Source: AGHT+IH+3EweEJgBkf1lttSk7L5OsPOi7EG3brnsFTKjOXpiyfN2/5t9qu/jwSxpPD5AeEF7mZxXDA==
X-Received: by 2002:a17:907:1b03:b0:abf:6ec7:65e9 with SMTP id a640c23a62f3a-ac7e761e34amr1185527266b.43.1744127854164;
        Tue, 08 Apr 2025 08:57:34 -0700 (PDT)
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
Subject: [PATCH v1 09/14] xen/riscv: aplic_init() implementation
Date: Tue,  8 Apr 2025 17:57:14 +0200
Message-ID: <1d023045be49ae93d41d552f9c9a79972fa4e84b.1744126720.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744126720.git.oleksii.kurochko@gmail.com>
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/aplic.c             | 97 ++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/aplic.h | 77 ++++++++++++++++++++++++
 xen/arch/riscv/include/asm/intc.h  |  3 +
 xen/arch/riscv/include/asm/irq.h   |  1 -
 4 files changed, 177 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/riscv/include/asm/aplic.h

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 6dc040af6f..d1aa835c3e 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -9,19 +9,112 @@
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
 
+#include <asm/aplic.h>
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
+    int i;
+
+    /* Disable all interrupts */
+    for ( i = 0; i <= aplic_info.nr_irqs; i += 32 )
+        aplic.regs->clrie[i] = -1U;
+
+    /* Set interrupt type and default priority for all interrupts */
+    for ( i = 1; i <= aplic_info.nr_irqs; i++ )
+    {
+        aplic.regs->sourcecfg[i - 1] = 0;
+        aplic.regs->target[i - 1] = APLIC_DEFAULT_PRIORITY;
+    }
+
+    /* Clear APLIC domaincfg */
+    aplic.regs->domaincfg = APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM;
+}
+
+static int __init aplic_init(void)
+{
+    int rc;
+    dt_phandle imsic_phandle;
+    uint32_t irq_range[2];
+    const __be32 *prop;
+    uint64_t size, paddr;
+    struct dt_device_node *imsic_node;
+    const struct dt_device_node *node = aplic_info.node;
+
+    /* check for associated imsic node */
+    rc = dt_property_read_u32(node, "msi-parent", &imsic_phandle);
+    if ( !rc )
+        panic("%s: IDC mode not supported\n", node->full_name);
+
+    imsic_node = dt_find_node_by_phandle(imsic_phandle);
+    if ( !imsic_node )
+        panic("%s: unable to find IMSIC node\n", node->full_name);
+
+    /* check imsic mode */
+    rc = dt_property_read_u32_array(imsic_node, "interrupts-extended",
+                                    irq_range, ARRAY_SIZE(irq_range));
+    if ( rc && (rc != -EOVERFLOW) )
+        panic("%s: unable to find interrupt-extended in %s node\n",
+               node->full_name, imsic_node->full_name);
+
+    if ( irq_range[1] == IRQ_M_EXT )
+        /* machine mode imsic node, ignore this aplic node */
+        return 0;
+
+    rc = imsic_init(imsic_node);
+    if ( rc )
+        panic("%s: Failded to initialize IMSIC\n", node->full_name);
+
+    /* Find out number of interrupt sources */
+    rc = dt_property_read_u32(node, "riscv,num-sources", &aplic_info.nr_irqs);
+    if ( !rc )
+        panic("%s: failed to get number of interrupt sources\n",
+              node->full_name);
+
+    prop = dt_get_property(node, "reg", NULL);
+    dt_get_range(&prop, node, &paddr, &size);
+    if ( !paddr )
+        panic("%s: first MMIO resource not found\n", node->full_name);
+
+    aplic.paddr_start = paddr;
+    aplic.paddr_end = paddr + size;
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
+static const struct intc_hw_operations __ro_after_init aplic_ops = {
+    .info                = &aplic_info,
+    .init                = aplic_init,
+};
+
 static int aplic_irq_xlate(const uint32_t *intspec, unsigned int intsize,
                            unsigned int *out_hwirq,
                            unsigned int *out_type)
@@ -52,8 +145,12 @@ static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
 
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
index 0000000000..94b3d0b616
--- /dev/null
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * xen/arch/riscv/aplic.h
+ *
+ * RISC-V Advanced Platform-Level Interrupt Controller support
+ *
+ * Copyright (c) 2023 Microchip.
+ */
+
+#ifndef ASM__RISCV__APLIC_H
+#define ASM__RISCV__APLIC_H
+
+#include <xen/types.h>
+
+#include <asm/imsic.h>
+
+#define APLIC_DOMAINCFG_IE      BIT(8, UL)
+#define APLIC_DOMAINCFG_DM      BIT(2, UL)
+
+struct aplic_regs {
+    uint32_t domaincfg;
+    uint32_t sourcecfg[1023];
+    uint8_t _reserved1[0xBC0];
+
+    uint32_t mmsiaddrcfg;
+    uint32_t mmsiaddrcfgh;
+    uint32_t smsiaddrcfg;
+    uint32_t smsiaddrcfgh;
+    uint8_t _reserved2[0x30];
+
+    uint32_t setip[32];
+    uint8_t _reserved3[92];
+
+    uint32_t setipnum;
+    uint8_t _reserved4[0x20];
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
+struct aplic_priv {
+    /* base physical address and size */
+    paddr_t paddr_start;
+    paddr_t paddr_end;
+    size_t  size;
+
+    /* registers */
+    volatile struct aplic_regs *regs;
+
+    /* imsic configuration */
+    const struct imsic_config *imsic_cfg;
+};
+
+#endif /* ASM__RISCV__APLIC_H */
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 0d498b10f4..db53caa07b 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -15,6 +15,9 @@ enum intc_version {
 struct intc_info {
     enum intc_version hw_version;
     const struct dt_device_node *node;
+
+    /* number of irqs */
+    unsigned int nr_irqs;
 };
 
 struct intc_hw_operations {
diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
index ff1c95e0be..163a478d78 100644
--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -27,7 +27,6 @@
 #define IRQ_TYPE_INVALID        DT_IRQ_TYPE_INVALID
 
 /* TODO */
-#define nr_irqs 0U
 #define nr_static_irqs 0
 #define arch_hwdom_irqs(domid) 0U
 
-- 
2.49.0



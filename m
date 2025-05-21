Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66380ABFAA6
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 18:04:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992148.1376016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvR-0006yG-Qd; Wed, 21 May 2025 16:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992148.1376016; Wed, 21 May 2025 16:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvR-0006tl-D1; Wed, 21 May 2025 16:04:13 +0000
Received: by outflank-mailman (input) for mailman id 992148;
 Wed, 21 May 2025 16:04:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hkAn=YF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uHlvO-0004Wm-VJ
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 16:04:10 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a8be89b-365d-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 18:04:09 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-601dd3dfc1fso7608387a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 09:04:09 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d502736sm9152513a12.25.2025.05.21.09.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 09:04:07 -0700 (PDT)
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
X-Inumbo-ID: 3a8be89b-365d-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747843448; x=1748448248; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKcUbC/dKhBrMOeG2SxpSs0jn1vZOvnDoHWCS0RyMFk=;
        b=bRAzbqywdICG7bHhE/Wha1OgQQN8P1SxHxCHnIBCciTgF+VM5CV0aRYlCKuJ2tO0J5
         /PVnYMuaAKFl1cBgcyCu41klJvdQq5MthGe7FmH0mvRtL7tFlj1MXLl9ExnapDkBOaQ/
         PJUCiKyIcwzxGqOZppsIEmBgmoHXLLoNLi7eTSF9p0stVbJ5PzRs7fl+JRphxfihDU3D
         yMdyg6ZRFQbJxHReLWKgaKOCC/o+6DatkoVTB2D3sI/nyOa0kh0t2+geBD0LgqPcZCeE
         dcmxF6HD1O8tN2JC4yr2Y5QskrpIx7VoiT2Nay2gnmOx54082r9IPsQEuZARpL5rBX7n
         1LNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747843448; x=1748448248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKcUbC/dKhBrMOeG2SxpSs0jn1vZOvnDoHWCS0RyMFk=;
        b=Le6Cjm6UpMid5NpARsBN7jyr/ifwS7Q+JRU6HU/s2Xta5//LZaHDIBZFuHcOTOuHEQ
         wevEa4DgA7O0/Icxs4oe5+LE0tvhyubn6m/sOfQK93PiclS+TfXamuoQ7y2pPrBWBNfe
         PxcOhUPiQ0Duuieg0xGF1xqYWU75HJXEuNv/jzSLvXq7uy3T0WSO/OvZ127ikxcjhmcE
         dtbzXHoZcnUdXQGTHKVgzs6K7y7Gk/FaveXJ3aavw1WkTOaECCHD62MUeGNFCrcmmwnv
         0LzRHkeCM6S6BcicxCGD6Fe0hJiX1LOHp2vpoUh77Mf6Zkq5im+xLar48FLhT6Tlo3Wc
         SSDg==
X-Gm-Message-State: AOJu0Yx9hndV1SMunNH8X5HQhmGgaehap0meU1VYltWpDnW8YiNEUFfA
	LQ59ie3VDV3ixWMJnjL2sranjPny+Ov5Ih2LND9RzQdDNQ/EOeZ04f3DnE7XQg==
X-Gm-Gg: ASbGncuwz+Cd3S6NgQqFTVPFYJ9ys3GOMSfrmPdoD+RVNBvLzNqOhaeiWOUSNqJm6TE
	BwVI/vQjub9ZNtXWEx8I2Voem4uIqi4CUbRU9zo5dmvfD9sOAEDwlKgPyaKSDpXNpuZUYIOA4+X
	OxOJjySM14dkFOPsBnmYERTuQqpudev5+X68Zuu+PzZ7fsjQVeLqSW/nYMz2EAhMyTZD+q0WDQP
	BqvVS3+dEfnGgVDbZrSwKOlhAE1UewQFtMP6szsmpYan6f6XoaWjYqu9mX6XQtQDZYqQ6ssQpXW
	ZkGNvl9gDw1Nq3wAul6Pk3qntM4YuWzjTvvGdS9eB5kUFQRgg6RWnvuOGjB62WtpSyaspCmElvf
	3qEX7WspkTTBJncJD7RXj+wesXWIN
X-Google-Smtp-Source: AGHT+IFnhWduam6EWVj1qtA4Elrpl3Pnd4GfLJCKTcqpUoTLlF4c6X0S6IiJ1qtH5S1Du0QBil0EHA==
X-Received: by 2002:a05:6402:354a:b0:602:3cf1:44a6 with SMTP id 4fb4d7f45d1cf-6023cf149b7mr2474889a12.28.1747843448056;
        Wed, 21 May 2025 09:04:08 -0700 (PDT)
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
Subject: [PATCH v3 09/14] xen/riscv: aplic_init() implementation
Date: Wed, 21 May 2025 18:03:49 +0200
Message-ID: <cf642d2ce83fdd9f32638b1c45ad5fef26d4992b.1747843009.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747843009.git.oleksii.kurochko@gmail.com>
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/aplic-priv.h        | 34 +++++++++++
 xen/arch/riscv/aplic.c             | 98 ++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/aplic.h | 64 +++++++++++++++++++
 xen/arch/riscv/include/asm/intc.h  |  3 +
 4 files changed, 199 insertions(+)
 create mode 100644 xen/arch/riscv/aplic-priv.h
 create mode 100644 xen/arch/riscv/include/asm/aplic.h

diff --git a/xen/arch/riscv/aplic-priv.h b/xen/arch/riscv/aplic-priv.h
new file mode 100644
index 0000000000..e5f9f5fd90
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
+#ifndef ASM__RISCV_PRIV_APLIC_H
+#define ASM__RISCV_PRIV_APLIC_H
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
+#endif /* ASM__RISCV_PRIV_APLIC_H */
diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 10ae81f7ac..069d157723 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -9,19 +9,113 @@
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
+/* The maximum number of wired interrupt sources supported by APLIC domain. */
+#define APLIC_MAX_NUM_WIRED_IRQ_SOURCES 1023
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
+    else if ( rc )
+        panic("%s: Failded to initialize IMSIC\n", node->full_name);
+
+    /* Find out number of interrupt sources */
+    if ( !dt_property_read_u32(node, "riscv,num-sources",
+                               &aplic_info.num_irqs) )
+        panic("%s: failed to get number of interrupt sources\n",
+              node->full_name);
+
+    if ( aplic_info.num_irqs > APLIC_MAX_NUM_WIRED_IRQ_SOURCES )
+        panic("%s: too big number of riscv,num-source: %u\n",
+               __func__, aplic_info.num_irqs);
+
+    prop = dt_get_property(node, "reg", NULL);
+    dt_get_range(&prop, node, &paddr, &size);
+    if ( !paddr )
+        panic("%s: first MMIO resource not found\n", node->full_name);
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
+static struct intc_hw_operations __ro_after_init aplic_ops = {
+    .info                = &aplic_info,
+    .init                = aplic_init,
+};
+
 static int cf_check aplic_irq_xlate(const uint32_t *intspec,
                                     unsigned int intsize,
                                     unsigned int *out_hwirq,
@@ -53,8 +147,12 @@ static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
 
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
index 0000000000..fef5f90a61
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
+#endif /* ASM__RISCV__APLIC_H */
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 860737f965..f3bbd281fa 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -17,6 +17,9 @@ struct irq_desc;
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



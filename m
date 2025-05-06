Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B58AACBCF
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 19:03:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977776.1364746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLhd-0007BV-Jl; Tue, 06 May 2025 17:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977776.1364746; Tue, 06 May 2025 17:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLhd-00079X-GR; Tue, 06 May 2025 17:03:33 +0000
Received: by outflank-mailman (input) for mailman id 977776;
 Tue, 06 May 2025 17:03:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/GUx=XW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uCLWd-00058E-A5
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:52:11 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71f6a8f8-2a9a-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 18:52:07 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ac2bb7ca40bso1018488766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:52:07 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891a3cb9sm740295366b.60.2025.05.06.09.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:52:06 -0700 (PDT)
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
X-Inumbo-ID: 71f6a8f8-2a9a-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746550327; x=1747155127; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIRZTc0vLBatCko0zk/UXfbMtR+m+ezQ4Ux4TBsMyjQ=;
        b=Ar0NsDHSl4LX9nmusY/YTa1ITEZJIc4Rz3h76qPk+j/F3A6/oAGsVmMp8RFn9E2muL
         5mCCkTrunm7DsjSnnexzqx7P57Lo0mlbS2vUD4Cla1NcnZYlvEthe46YEsjDR2hBcMs6
         U/uXs/agEBJ7EEnV4tBYYJqLlvfJ2lFKe30oYWQceYYYeP3JV8TM15h403e3WPS/A4oa
         x9LVDAXEU3mP3PdrhssXca1KQPY0tfKjwxdIhZsuTory+82olFcVOnmmj0zp2zJ9zkBE
         Nga9O00DgDQbbFOuYr8N4HkHnlALDvorr8kD1pGOSUYqZeI7bGC/EIsribj0jOWibtAg
         AQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550327; x=1747155127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZIRZTc0vLBatCko0zk/UXfbMtR+m+ezQ4Ux4TBsMyjQ=;
        b=R/H+sWQsiuk1wLDmcPbmQB54MWNrmQEqrHNuOs0w6TTZQAzjxgD3OS8twDWRuP4P/G
         8Ulz4sqYIDN8e1mHQQCTX2mnMJGs/S5rVIPui3lpqKsujSFOneCNoMuZkYjMCrwujYoJ
         oeyro1tsC/ZLNw8t1DZk7V3y/MbfDHccxg2pIb4uhLh9ZOC6N01Ai0Q0ZNxa0rRg6e0g
         MGDMCN4jcopSdbAWPN5jk7XPznTyhnJzNQCRBUKJ26/jG/Tz9MVTcX1BpQA13N8errX1
         C9fUOFpDBTtv+Nz5ouXugjd5Jld3o49wKgq0/jSqda88vsRFS+yVgMb7nnwg42aZEebc
         ButA==
X-Gm-Message-State: AOJu0YxXvsDocdrZL+zr3AYhwuUx83I1c7OgmlA7U3kyK4+rABwGKyq+
	IBKLo3UGwC4BEyjY8DTco9wXN66Fc4A13oBIO9DaBvErs+E/X8tC6hx58w==
X-Gm-Gg: ASbGncu2XiwZW1m4nHJhc1Z6y2WKgzB6HMc7SfaS4+WZMYwFmyPDBKl1mLCRGsXXR5X
	FmLThuKtAEEysTMTTnnH58xJrgebYyaKgsJNN3LD4aaG1eL9Z36kSWz4h1foneqzvSMNSCCOFll
	B2UjKw6MfSDmk+vtXItr+mAk3gzmeuLDyII2b3LHORJh+D5sCv8CrZ5gasS2JgSfJGSJ9HcRPyR
	RQbNz2qOspzojG11/9g0GGP2CFjI6lrFtGjOuZ6gn66E4cfFTwq0QKrF3cz58ZhBsVSM8xKxj1w
	7W9Xwomj2mliktBc5V5I1ISg0SeLCbB1pqU1RnG5DcjFXSLhRD3Y0p77acK9ffCVGtPV6vAP+RO
	6zdxsnBIGkpIMuZy3px19
X-Google-Smtp-Source: AGHT+IFL3eXemXbrwhyJqd+wyul2UXQ2sa9GN9ToBu2ZpXUyWxeG/kGZi6BZ3DFnaC4TQOqn9yQOrg==
X-Received: by 2002:a17:907:8d87:b0:ad1:e7f2:b94e with SMTP id a640c23a62f3a-ad1e8bcc880mr23868866b.18.1746550326504;
        Tue, 06 May 2025 09:52:06 -0700 (PDT)
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
Subject: [PATCH v2 11/16] xen/riscv: aplic_init() implementation
Date: Tue,  6 May 2025 18:51:41 +0200
Message-ID: <9129b10432dfc7ff8ba451842204342171da7dc1.1746530883.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746530883.git.oleksii.kurochko@gmail.com>
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/aplic-priv.h        |  34 +++++++++
 xen/arch/riscv/aplic.c             | 106 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/aplic.h |  64 +++++++++++++++++
 xen/arch/riscv/include/asm/intc.h  |   3 +
 4 files changed, 207 insertions(+)
 create mode 100644 xen/arch/riscv/aplic-priv.h
 create mode 100644 xen/arch/riscv/include/asm/aplic.h

diff --git a/xen/arch/riscv/aplic-priv.h b/xen/arch/riscv/aplic-priv.h
new file mode 100644
index 0000000000..8a208dba8a
--- /dev/null
+++ b/xen/arch/riscv/aplic-priv.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * xen/arch/riscv/aplic.h
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
+    volatile struct aplic_regs *regs;
+
+    /* imsic configuration */
+    const struct imsic_config *imsic_cfg;
+};
+
+#endif /* ASM__RISCV_PRIV_APLIC_H */
diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 10ae81f7ac..797e5df020 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -9,19 +9,121 @@
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
+        writel(-1U, &aplic.regs->clrie[i]);
+
+    /* Set interrupt type and default priority for all interrupts */
+    for ( i = 1; i <= aplic_info.num_irqs; i++ )
+    {
+        writel(0, &aplic.regs->sourcecfg[i - 1]);
+        /*
+         * Low bits of target register contains Interrupt Priority bits which
+         * can't be zero according to AIA spec.
+         * Thereby they are initialized to APLIC_DEFAULT_PRIORITY.
+         */
+        writel(APLIC_DEFAULT_PRIORITY, &aplic.regs->target[i - 1]);
+    }
+
+    writel(APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM, &aplic.regs->domaincfg);
+}
+
+static int __init cf_check aplic_init(void)
+{
+    int rc;
+    dt_phandle imsic_phandle;
+    uint32_t irq_range[num_possible_cpus() * 2];
+    const __be32 *prop;
+    uint64_t size, paddr;
+    struct dt_device_node *imsic_node;
+    const struct dt_device_node *node = aplic_info.node;
+
+    /* Check for associated imsic node */
+    rc = dt_property_read_u32(node, "msi-parent", &imsic_phandle);
+    if ( !rc )
+        panic("%s: IDC mode not supported\n", node->full_name);
+
+    imsic_node = dt_find_node_by_phandle(imsic_phandle);
+    if ( !imsic_node )
+        panic("%s: unable to find IMSIC node\n", node->full_name);
+
+    rc = dt_property_read_u32_array(imsic_node, "interrupts-extended",
+                                    irq_range, ARRAY_SIZE(irq_range));
+    if ( rc )
+        panic("%s: unable to find interrupt-extended in %s node\n",
+              __func__, imsic_node->full_name);
+
+    if ( irq_range[1] == IRQ_M_EXT )
+        /* Machine mode imsic node, ignore this aplic node */
+        return 0;
+
+    for ( unsigned int i = 0; i < ARRAY_SIZE(irq_range); i += 2 )
+    {
+        if ( irq_range[i + 1] != irq_range[1] )
+            panic("%s: mode[%d] != %d\n", __func__, i + 1, irq_range[1]);
+    }
+
+    rc = imsic_init(imsic_node);
+    if ( rc )
+        panic("%s: Failded to initialize IMSIC\n", node->full_name);
+
+    /* Find out number of interrupt sources */
+    rc = dt_property_read_u32(node, "riscv,num-sources", &aplic_info.num_irqs);
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
@@ -53,8 +155,12 @@ static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
 
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
index 0000000000..6221030a68
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
+#endif /* ASM__RISCV__APLIC_H */
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index e72d5fd9d3..2d55d74a2e 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -17,6 +17,9 @@ enum intc_version {
 struct intc_info {
     enum intc_version hw_version;
     const struct dt_device_node *node;
+
+    /* number of irqs */
+    unsigned int num_irqs;
 };
 
 struct irq_desc;
-- 
2.49.0



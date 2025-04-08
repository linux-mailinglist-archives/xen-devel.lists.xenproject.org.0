Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D88A810E8
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 17:57:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942511.1341716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BKT-0006eQ-6B; Tue, 08 Apr 2025 15:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942511.1341716; Tue, 08 Apr 2025 15:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BKS-0006XF-RF; Tue, 08 Apr 2025 15:57:36 +0000
Received: by outflank-mailman (input) for mailman id 942511;
 Tue, 08 Apr 2025 15:57:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4Vq=W2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u2BKQ-0004Yr-Sf
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 15:57:35 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f53f27d-1492-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 17:57:34 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ac28e66c0e1so874035966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 08:57:34 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7c018556bsm929934566b.156.2025.04.08.08.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 08:57:32 -0700 (PDT)
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
X-Inumbo-ID: 2f53f27d-1492-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744127853; x=1744732653; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/3dao7nIwQTt2SEejDxKzt5Yw5IJNGsAcfMnIvzhVs=;
        b=kSWvFXs3y6DjB4CFA/rpOIdh9YOUQtRPc6SoXoJk6Ze81yT5TTKUh81DzhFHevI795
         0btX8pLXam9GXuYvYn8l8wOywHlqTLjsSznCcWH9pv8HuIVmzNtQYSHsmvJoNprKn1mS
         4i4MrI/9m7I6e+dkd6p3jD8uaJrN1nzkr+GFRTORwjX8QN1/2Kit6irt1rXwDd+AOVeL
         wRKYeE2ROql8CeGwBe867w3RPNwjBUotWkuVi97obdT0+G6agUFb7TsOlIt5+I4aA4fQ
         EO0Bud7GdWwADHpXSxrfz7bzz8mgrie6t7fc/lETcUiZHxptk8lzzBlNSehtAW5I47Co
         MzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127853; x=1744732653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/3dao7nIwQTt2SEejDxKzt5Yw5IJNGsAcfMnIvzhVs=;
        b=DlzWVD2sBJnaAfWlaPxNuyS0ZOVnwmYA8+x/FBE1YjOOGROraYJRIaIBQXqSJRnkxc
         pk4YkssaHL0sI7X7TMAuZQXG3icX0hjtEQViWyhjoA9q34nbCvH2kcx9U25UZx0lrLjP
         Os/YyYDWLOGL95eph7j5YwCq1fq4kzTbKT2M4ichEAPqGSke464bSiqe17waRJGwxZQG
         Zg9S2v/VBboDeet+0zxaBx9vdNq+9li+wVdRBqQ3C44+x4zNBLJa4H5hHaWpzWYSfOR3
         lewlVATJiXTDaldlTtUUYT+LZnVZFhR+VTf7AvmmxBCgRQ8N9TasE3H4lvUGLB2UnOfJ
         dt3A==
X-Gm-Message-State: AOJu0YyUK2ow666GIsiXas9yySnjJocnXJNbvDuB4QtEo9/PBPM4DinL
	eLCYFfyUqYESJylD50P0WustRO95W1Vflonqh5FZG6sb44H0sVLglA5MHA==
X-Gm-Gg: ASbGnctCGMuCzqMlGPx2Zr5t2BZ2/gfMiq+jO3fLQdvXJRePIt6RLgDvQlayhzLnhYC
	c2yTZyyUjzy1UVxs4/rml2xpVGSh17wTXQEF8B5yR/jwxtnhaXpTLXSgyScZ0NCwPJ8DKQ4LggK
	nF0jbKMjXvMoWonujzHRhiCYCkfiNp+ND97GbGnmjYQ+XJ5gEvB5SNPuJXw37WLGCyCtTJcee2z
	CJelfpuwAfhlYvIjeXHfvhCeYfFv2uwkxzmcMdi1WSBXhjT6gZDGslwOE3Ms4hH1YIdPSS8LCPZ
	jSgfZTdadbTqedXrao5UZgwMXd8dqewIl1MNH8tFJQ9NmRixZ5odbMbVdim+T9PwMSKiYiXOGbb
	KOUMq2oBqvLZTruURNBpMgshw
X-Google-Smtp-Source: AGHT+IFwUUIkpfovoMDrPcqwhafTmBhx2g+D+hqeENK4vIZ7x9JFl5bRBtLOBsCJtqT3stqYNhsraA==
X-Received: by 2002:a17:907:2d2b:b0:ac2:fd70:dda3 with SMTP id a640c23a62f3a-ac7d6d73905mr1303765366b.35.1744127853058;
        Tue, 08 Apr 2025 08:57:33 -0700 (PDT)
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
Subject: [PATCH v1 08/14] xen/riscv: imsic_init() implementation
Date: Tue,  8 Apr 2025 17:57:13 +0200
Message-ID: <09e0fcd64f97062441a68102ead520b818150fe9.1744126720.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744126720.git.oleksii.kurochko@gmail.com>
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imsic_init() is introduced to parse device tree node, which has the following
bindings [2], and based on the parsed information update IMSIC configuration
which is stored in imsic_cfg.

The following helpers are introduces for imsic_init() usage:
  - imsic_parse_node() parses IMSIC node from DTS
  - imsic_get_parent_hartid() returns the hart ( CPU ) ID of the given device
    tree node.

This patch is based on the code from [1].

Since Microchip originally developed imsic.{c,h}, an internal discussion with
them led to the decision to use the MIT license.

[1] https://gitlab.com/xen-project/people/olkur/xen/-/commit/0b1a94f2bc3bb1a81cd26bb75f0bf578f84cb4d4
[2] https://elixir.bootlin.com/linux/v6.12/source/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Makefile            |   1 +
 xen/arch/riscv/imsic.c             | 286 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/imsic.h |  66 +++++++
 3 files changed, 353 insertions(+)
 create mode 100644 xen/arch/riscv/imsic.c
 create mode 100644 xen/arch/riscv/include/asm/imsic.h

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 457e8e88a4..baa499a72d 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -2,6 +2,7 @@ obj-y += aplic.o
 obj-y += cpufeature.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += entry.o
+obj-y += imsic.o
 obj-y += intc.o
 obj-y += irq.o
 obj-y += mm.o
diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
new file mode 100644
index 0000000000..99def9af2d
--- /dev/null
+++ b/xen/arch/riscv/imsic.c
@@ -0,0 +1,286 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * xen/arch/riscv/imsic.c
+ *
+ * RISC-V Incoming MSI Controller support
+ *
+ * (c) 2023 Microchip Technology Inc.
+ * (c) 2024 Vates
+ */
+
+#include <xen/const.h>
+#include <xen/device_tree.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/macros.h>
+#include <xen/xmalloc.h>
+
+#include <asm/imsic.h>
+
+static struct imsic_config imsic_cfg;
+
+const struct imsic_config *imsic_get_config(void)
+{
+    return &imsic_cfg;
+}
+
+static int __init imsic_get_parent_hartid(struct dt_device_node *node,
+                                          unsigned int index,
+                                          unsigned long *hartid)
+{
+    int res;
+    unsigned long hart;
+    struct dt_phandle_args args;
+
+    /* Try the new-style interrupts-extended first */
+    res = dt_parse_phandle_with_args(node, "interrupts-extended",
+                                     "#interrupt-cells", index, &args);
+    if ( !res )
+    {
+        res = riscv_of_processor_hartid(args.np->parent, &hart);
+        if ( res < 0 )
+            return -EINVAL;
+
+        *hartid = hart;
+    }
+    return res;
+}
+
+
+static int imsic_parse_node(struct dt_device_node *node,
+                     unsigned int *nr_parent_irqs)
+{
+    int rc;
+    unsigned int tmp;
+    paddr_t base_addr;
+
+    /* Find number of parent interrupts */
+    *nr_parent_irqs = dt_number_of_irq(node);
+    if ( !*nr_parent_irqs )
+    {
+        printk(XENLOG_ERR "%s: no parent irqs available\n", node->name);
+        return -ENOENT;
+    }
+
+    /* Find number of guest index bits in MSI address */
+    rc = dt_property_read_u32(node, "riscv,guest-index-bits",
+                              &imsic_cfg.guest_index_bits);
+    if ( !rc )
+        imsic_cfg.guest_index_bits = 0;
+    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT;
+    if ( tmp < imsic_cfg.guest_index_bits )
+    {
+        printk(XENLOG_ERR "%s: guest index bits too big\n", node->name);
+        return -ENOENT;
+    }
+
+    /* Find number of HART index bits */
+    rc = dt_property_read_u32(node, "riscv,hart-index-bits",
+                              &imsic_cfg.hart_index_bits);
+    if ( !rc )
+    {
+        /* Assume default value */
+        imsic_cfg.hart_index_bits = fls(*nr_parent_irqs);
+        if ( BIT(imsic_cfg.hart_index_bits, UL) < *nr_parent_irqs )
+            imsic_cfg.hart_index_bits++;
+    }
+    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT -
+          imsic_cfg.guest_index_bits;
+    if ( tmp < imsic_cfg.hart_index_bits )
+    {
+        printk(XENLOG_ERR "%s: HART index bits too big\n", node->name);
+        return -ENOENT;
+    }
+
+    /* Find number of group index bits */
+    rc = dt_property_read_u32(node, "riscv,group-index-bits",
+                              &imsic_cfg.group_index_bits);
+    if ( !rc )
+        imsic_cfg.group_index_bits = 0;
+    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT -
+          imsic_cfg.guest_index_bits - imsic_cfg.hart_index_bits;
+    if ( tmp < imsic_cfg.group_index_bits )
+    {
+        printk(XENLOG_ERR "%s: group index bits too big\n", node->name);
+        return -ENOENT;
+    }
+
+    /* Find first bit position of group index */
+    tmp = IMSIC_MMIO_PAGE_SHIFT * 2;
+    rc = dt_property_read_u32(node, "riscv,group-index-shift",
+                              &imsic_cfg.group_index_shift);
+    if ( !rc )
+        imsic_cfg.group_index_shift = tmp;
+    if ( imsic_cfg.group_index_shift < tmp )
+    {
+        printk(XENLOG_ERR "%s: group index shift too small\n", node->name);
+        return -ENOENT;
+    }
+    tmp = imsic_cfg.group_index_bits + imsic_cfg.group_index_shift - 1;
+    if ( tmp >= BITS_PER_LONG )
+    {
+        printk(XENLOG_ERR "%s: group index shift too big\n", node->name);
+        return -EINVAL;
+    }
+
+    /* Find number of interrupt identities */
+    rc = dt_property_read_u32(node, "riscv,num-ids", &imsic_cfg.nr_ids);
+    if ( !rc )
+    {
+        printk(XENLOG_ERR "%s: number of interrupt identities not found\n",
+               node->name);
+        return -ENOENT;
+    }
+
+    if ( (imsic_cfg.nr_ids < IMSIC_MIN_ID) ||
+         (imsic_cfg.nr_ids >= IMSIC_MAX_ID) ||
+         ((imsic_cfg.nr_ids & IMSIC_MIN_ID) != IMSIC_MIN_ID) )
+    {
+        printk(XENLOG_ERR "%s: invalid number of interrupt identities\n",
+               node->name);
+        return -EINVAL;
+    }
+
+    /* Compute base address */
+    imsic_cfg.nr_mmios = 0;
+    rc = dt_device_get_address(node, imsic_cfg.nr_mmios, &base_addr, NULL);
+    if (rc)
+    {
+        printk(XENLOG_ERR "%s: first MMIO resource not found\n", node->name);
+        return -EINVAL;
+    }
+
+    imsic_cfg.base_addr = base_addr;
+    imsic_cfg.base_addr &= ~(BIT(imsic_cfg.guest_index_bits +
+                   imsic_cfg.hart_index_bits +
+                   IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
+    imsic_cfg.base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
+                   imsic_cfg.group_index_shift);
+
+    /* Find number of MMIO register sets */
+    imsic_cfg.nr_mmios++;
+    while ( !dt_device_get_address(node, imsic_cfg.nr_mmios, &base_addr, NULL) )
+        imsic_cfg.nr_mmios++;
+
+    return 0;
+}
+
+int __init imsic_init(struct dt_device_node *node)
+{
+    int rc;
+    unsigned long reloff, hartid;
+    uint32_t nr_parent_irqs, index, nr_handlers = 0;
+    paddr_t base_addr;
+
+    /* Parse IMSIC node */
+    rc = imsic_parse_node(node, &nr_parent_irqs);
+    if ( rc )
+        return rc;
+
+    /* Allocate MMIO resource array */
+    imsic_cfg.mmios = xzalloc_array(struct imsic_mmios, imsic_cfg.nr_mmios);
+    if ( !imsic_cfg.mmios )
+        return -ENOMEM;
+
+    /* check MMIO register sets */
+    for ( int i = 0; i < imsic_cfg.nr_mmios; i++ )
+    {
+        rc = dt_device_get_address(node, i, &imsic_cfg.mmios[i].base_addr,
+                                   &imsic_cfg.mmios[i].size);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "%s:  unable to parse MMIO regset %d\n",
+                   node->name, i);
+            goto imsic_init_err;
+        }
+
+        base_addr = imsic_cfg.mmios[i].base_addr;
+        base_addr &= ~(BIT(imsic_cfg.guest_index_bits +
+                   imsic_cfg.hart_index_bits +
+                   IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
+        base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
+                   imsic_cfg.group_index_shift);
+        if ( base_addr != imsic_cfg.base_addr )
+        {
+            rc = -EINVAL;
+            printk(XENLOG_ERR "%s: address mismatch for regset %d\n",
+                   node->name, i);
+            goto imsic_init_err;
+        }
+    }
+
+    /* Configure handlers for target CPUs */
+    for ( int i = 0; i < nr_parent_irqs; i++ )
+    {
+        rc = imsic_get_parent_hartid(node, i, &hartid);
+        if ( rc )
+        {
+            printk(XENLOG_WARNING "%s: hart ID for parent irq%d not found\n",
+                   node->name, i);
+            continue;
+        }
+
+        if ( hartid > NR_CPUS )
+        {
+            printk(XENLOG_WARNING "%s: unsupported hart ID=%lu for parent irq%d\n",
+                   node->name, hartid, i);
+            continue;
+        }
+
+        /* Find MMIO location of MSI page */
+        index = imsic_cfg.nr_mmios;
+        reloff = i * BIT(imsic_cfg.guest_index_bits, UL) * IMSIC_MMIO_PAGE_SZ;
+        for ( int j = 0; imsic_cfg.nr_mmios; j++ )
+        {
+            if ( reloff < imsic_cfg.mmios[j].size )
+            {
+                index = j;
+                break;
+            }
+
+            /*
+             * MMIO region size may not be aligned to
+             * BIT(global->guest_index_bits) * IMSIC_MMIO_PAGE_SZ
+             * if holes are present.
+             */
+            reloff -= ROUNDUP(imsic_cfg.mmios[j].size,
+                BIT(imsic_cfg.guest_index_bits, UL) * IMSIC_MMIO_PAGE_SZ);
+        }
+
+        if ( index >= imsic_cfg.nr_mmios )
+        {
+            printk(XENLOG_WARNING "%s: MMIO not found for parent irq%d\n",
+                   node->name, i);
+            continue;
+        }
+
+        if ( !IS_ALIGNED(imsic_cfg.msi[hartid].base_addr + reloff, PAGE_SIZE) )
+        {
+            printk(XENLOG_WARNING "%s: MMIO address 0x%lx is not aligned on a page\n",
+                   node->name, imsic_cfg.msi[hartid].base_addr + reloff);
+            imsic_cfg.msi[hartid].offset = 0;
+            imsic_cfg.msi[hartid].base_addr = 0;
+            continue;
+        }
+
+        imsic_cfg.mmios[index].harts[hartid] = true;
+        imsic_cfg.msi[hartid].base_addr = imsic_cfg.mmios[index].base_addr;
+        imsic_cfg.msi[hartid].offset = reloff;
+        nr_handlers++;
+    }
+
+    if ( !nr_handlers )
+    {
+        printk(XENLOG_ERR "%s: No CPU handlers found\n", node->name);
+        rc = -ENODEV;
+        goto imsic_init_err;
+    }
+
+    return 0;
+
+imsic_init_err:
+    xfree(imsic_cfg.mmios);
+
+    return rc;
+}
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
new file mode 100644
index 0000000000..126e651863
--- /dev/null
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * xen/arch/riscv/imsic.h
+ *
+ * RISC-V Incoming MSI Controller support
+ *
+ * (c) 2023 Microchip Technology Inc.
+ */
+
+#ifndef ASM__RISCV__IMSIC_H
+#define ASM__RISCV__IMSIC_H
+
+#include <xen/types.h>
+
+#define IMSIC_MMIO_PAGE_SHIFT   12
+#define IMSIC_MMIO_PAGE_SZ      (1UL << IMSIC_MMIO_PAGE_SHIFT)
+
+#define IMSIC_MIN_ID            63
+#define IMSIC_MAX_ID            2048
+
+struct imsic_msi {
+    paddr_t base_addr;
+    unsigned long offset;
+};
+
+struct imsic_mmios {
+    paddr_t base_addr;
+    unsigned long size;
+    bool harts[NR_CPUS];
+};
+
+struct imsic_config {
+    /* base address */
+    paddr_t base_addr;
+
+    /* Bits representing Guest index, HART index, and Group index */
+    unsigned int guest_index_bits;
+    unsigned int hart_index_bits;
+    unsigned int group_index_bits;
+    unsigned int group_index_shift;
+
+    /* imsic phandle */
+    unsigned int phandle;
+
+    /* number of parent irq */
+    unsigned int nr_parent_irqs;
+
+    /* number off interrupt identities */
+    unsigned int nr_ids;
+
+    /* mmios */
+    unsigned int nr_mmios;
+    struct imsic_mmios *mmios;
+
+    /* MSI */
+    struct imsic_msi msi[NR_CPUS];
+};
+
+struct dt_device_node;
+int imsic_init(struct dt_device_node *n);
+
+struct imsic_config;
+const struct imsic_config *imsic_get_config(void);
+
+#endif /* ASM__RISCV__IMSIC_H */
-- 
2.49.0



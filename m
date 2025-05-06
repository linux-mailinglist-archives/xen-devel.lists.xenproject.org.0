Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD5AAACB8C
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 18:52:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977630.1364671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWc-0007ir-U4; Tue, 06 May 2025 16:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977630.1364671; Tue, 06 May 2025 16:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWc-0007bF-I5; Tue, 06 May 2025 16:52:10 +0000
Received: by outflank-mailman (input) for mailman id 977630;
 Tue, 06 May 2025 16:52:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/GUx=XW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uCLWa-00058E-9S
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:52:08 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71566546-2a9a-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 18:52:06 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-acacb8743a7so11043266b.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:52:06 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891a3cb9sm740295366b.60.2025.05.06.09.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:52:05 -0700 (PDT)
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
X-Inumbo-ID: 71566546-2a9a-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746550326; x=1747155126; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maZIYenpt/TgC9UOWWJvY9Qazh2LoZdUwAXjgu0Aocs=;
        b=mK2u8zQX+bU2Y/wbgmnMxQklpobGwCtD+VxGVI51DYUCuUO77PR/vZL8EHiEzPcsWI
         3dvU4wy9WzkU3kHFK+L6/S1+h3d03j5kVjPEvunQSj5fDc0DBxbDxcpUH6yrD7+lRQwc
         DMnRlB0Tiu0Fevyh56v+yOVMjpnszhTGgTpzBNujtvUbGvZ3tLmNt81ILPfnOMqScKJi
         g8gBGjjUX2cv3g3Xkq7IZOQbVOVVxQbRZKGQF0EhrEwtgPXjlT9a6mlDVa/mXWOaegtM
         gYiM3EMdiP9D7eK94cs3PGozt+vx+gIhfg1KTumXriHtMeJUWYf4TixoXxwKljlBPWQu
         KxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550326; x=1747155126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=maZIYenpt/TgC9UOWWJvY9Qazh2LoZdUwAXjgu0Aocs=;
        b=fDSeQKcsi8Cw5ZJiBko4Q3qFh6gEP0ytKxOLUCHLzDejkC7pFZN7bPTNk9NkHoqhA9
         WDFNmTzocqr62SSRzWGP8m7WOJ26d8cDTGBvoDfb1gRLWHu3ky88FjJf9fO6yR5EItCZ
         Or6PiubCH7eJ3Gxc/+eHegZVC90F9NClWzl28cl7whAvRsCRo8/mku7EszAFovEN2Gur
         +R49DTskHMfJTs/USwvutYdBn3ffb46mfYTyfGMu1fAvqntXLdStk/DiYb6s2VqQJhBX
         cSZxk5naeLAv1jk1IKi7rmZmwg+kz/0yloOx6Rur/qmvAG5HzghhJbuqiWyclBN/Ejvn
         /TzA==
X-Gm-Message-State: AOJu0YzCYUBMUl/WcailxD6/rRMdSUSnrKWSv4DDYFsKlryA9oVEIgxj
	pIC7+El/XQpVqMTvN8CyHUlRfsqnL6MifHHtf8OxJjz+/Q82jpOKgd2WqA==
X-Gm-Gg: ASbGncuurOWnjC1Mwxh8sGKiutGK5zlA3JWglJaXr1LSMRkche2p31g462msWsdwqlS
	psJsgW/0ge/OquoQCMP8Y61mesO8j0sKmuqdy9RyIq4e428g3QbKIUyWc6DAcowMbOLZ/ZPrY2f
	KibLCyUMI8K2KneaisjLPh1MMCM4ht7rLApMdSwy8faD6UfD5f/6eokTW7kAyTBGjwecaoHVBcQ
	VT10QYC4nC8ml5Bh/RbsrCKgTHryv8yseax1fSapZ50paMVlKFleRJj0f4+EmbwxFek5kLGU/w3
	HDKVPYu/vZFKwyMwCnP69u0Dy4Y637F3SFNacglKAkCqmvJEPIyi+baGq7VeeyWi1L8W7iknYgM
	h2E8t0lpZVQ==
X-Google-Smtp-Source: AGHT+IH4c8fyVlUG1/9uOe655VcD6jWKV4hFGibis0LHxfaSmfsFm6d5cT/HapGyiJPpZFECSfaM+Q==
X-Received: by 2002:a17:907:c70c:b0:acb:aa43:e82d with SMTP id a640c23a62f3a-ad1e7c4a0f3mr46544366b.3.1746550325511;
        Tue, 06 May 2025 09:52:05 -0700 (PDT)
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
Subject: [PATCH v2 10/16] xen/riscv: imsic_init() implementation
Date: Tue,  6 May 2025 18:51:40 +0200
Message-ID: <f7588e93d0ddacc29ce5d89b2855624f82d6baa9.1746530883.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746530883.git.oleksii.kurochko@gmail.com>
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imsic_init() is introduced to parse device tree node, which has the following
bindings [2], and based on the parsed information update IMSIC configuration
which is stored in imsic_cfg.

The following helpers are introduces for imsic_init() usage:
  - imsic_parse_node() parses IMSIC node from DTS
  - imsic_get_parent_cpuid() returns the hart ( CPU ) ID of the given device
    tree node.

This patch is based on the code from [1].

Since Microchip originally developed imsic.{c,h}, an internal discussion with
them led to the decision to use the MIT license.

[1] https://gitlab.com/xen-project/people/olkur/xen/-/commit/0b1a94f2bc3bb1a81cd26bb75f0bf578f84cb4d4
[2] https://elixir.bootlin.com/linux/v6.12/source/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Drop years in copyrights.
 - s/riscv_of_processor_hartid/dt_processor_cpuid.
 - s/imsic_get_parent_hartid/imsic_get_parent_cpuid.
   Rename argument hartid to cpuid.
   Make node argument const.
   Return res instead of -EINVAL for the failure case of dt_processor_cpuid().
   Drop local variable hart and use cpuid argument instead.
   Drop useless return res;
 - imsic_parse_node() changes:
   - Make node argument const.
   - Check the return value of dt_property_read_u32() directly instead of
     saving it to rc variable.
   - Update tmp usage, use short form "-=".
   - Update a check (imsic_cfg.nr_ids >= IMSIC_MAX_ID) to (imsic_cfg.nr_ids > IMSIC_MAX_ID)
     as IMSIC_MAX_ID is changed to maximum valid value, not just the firsr out-of-range.
   - Use `rc` to return value instead of explicitly use -EINVAL.
   - Use do {} while() to find number of MMIO register sets.
 - Set IMSIC_MAX_ID to 2047 (maximum possible IRQ number).
 - imsic_init() changes:
   - Use unsigned int in for's expression1.
   - s/xfree/XFEE.
   - Allocate msi and cpus array dynamically.
 - Drop forward declaration before declaration of imsic_get_config() in asm/imsic.h
   as it is not used as parameter type.
 - Align declaration of imisic_init with defintion.
 - s/harts/cpus in imisic_mmios.
   Also, change type from bool harts[NR_CPUS] to unsigned long *cpus.
 - Allocate msi member of imsic_config dynamically to save some memory.
 - Code style fixes.
 - Update the commit message.
---
 xen/arch/riscv/Makefile            |   1 +
 xen/arch/riscv/imsic.c             | 286 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/imsic.h |  65 +++++++
 3 files changed, 352 insertions(+)
 create mode 100644 xen/arch/riscv/imsic.c
 create mode 100644 xen/arch/riscv/include/asm/imsic.h

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index a1c145c506..e2b8aa42c8 100644
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
index 0000000000..43d0c92cbd
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
+ * (c) Microchip Technology Inc.
+ * (c) Vates
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
+/* Callers aren't expected to changed imsic_cfg so return const. */
+const struct imsic_config *imsic_get_config(void)
+{
+    return &imsic_cfg;
+}
+
+static int __init imsic_get_parent_cpuid(const struct dt_device_node *node,
+                                         unsigned int index,
+                                         unsigned long *cpuid)
+{
+    int res;
+    struct dt_phandle_args args;
+
+    res = dt_parse_phandle_with_args(node, "interrupts-extended",
+                                     "#interrupt-cells", index, &args);
+    if ( !res )
+        res = dt_processor_cpuid(args.np->parent, cpuid);
+
+    return res;
+}
+
+static int imsic_parse_node(const struct dt_device_node *node,
+                            unsigned int *nr_parent_irqs)
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
+    if ( !dt_property_read_u32(node, "riscv,guest-index-bits",
+                               &imsic_cfg.guest_index_bits) )
+        imsic_cfg.guest_index_bits = 0;
+    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT;
+    if ( tmp < imsic_cfg.guest_index_bits )
+    {
+        printk(XENLOG_ERR "%s: guest index bits too big\n", node->name);
+        return -ENOENT;
+    }
+
+    /* Find number of HART index bits */
+    if ( !dt_property_read_u32(node, "riscv,hart-index-bits",
+                               &imsic_cfg.hart_index_bits) )
+    {
+        /* Assume default value */
+        imsic_cfg.hart_index_bits = fls(*nr_parent_irqs);
+        if ( BIT(imsic_cfg.hart_index_bits, UL) < *nr_parent_irqs )
+            imsic_cfg.hart_index_bits++;
+    }
+    tmp -= imsic_cfg.guest_index_bits;
+    if ( tmp < imsic_cfg.hart_index_bits )
+    {
+        printk(XENLOG_ERR "%s: HART index bits too big\n", node->name);
+        return -ENOENT;
+    }
+
+    /* Find number of group index bits */
+    if ( !dt_property_read_u32(node, "riscv,group-index-bits",
+                               &imsic_cfg.group_index_bits) )
+        imsic_cfg.group_index_bits = 0;
+    tmp -= imsic_cfg.hart_index_bits;
+    if ( tmp < imsic_cfg.group_index_bits )
+    {
+        printk(XENLOG_ERR "%s: group index bits too big\n", node->name);
+        return -ENOENT;
+    }
+
+    /* Find first bit position of group index */
+    tmp = IMSIC_MMIO_PAGE_SHIFT * 2;
+    if ( !dt_property_read_u32(node, "riscv,group-index-shift",
+                               &imsic_cfg.group_index_shift) )
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
+    if ( !dt_property_read_u32(node, "riscv,num-ids", &imsic_cfg.nr_ids) )
+    {
+        printk(XENLOG_ERR "%s: number of interrupt identities not found\n",
+               node->name);
+        return -ENOENT;
+    }
+
+    if ( (imsic_cfg.nr_ids < IMSIC_MIN_ID) ||
+         (imsic_cfg.nr_ids > IMSIC_MAX_ID) ||
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
+    if ( rc )
+    {
+        printk(XENLOG_ERR "%s: first MMIO resource not found\n", node->name);
+        return rc;
+    }
+
+    imsic_cfg.base_addr = base_addr;
+    imsic_cfg.base_addr &= ~(BIT(imsic_cfg.guest_index_bits +
+                           imsic_cfg.hart_index_bits +
+                           IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
+    imsic_cfg.base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
+                           imsic_cfg.group_index_shift);
+
+    /* Find number of MMIO register sets */
+    do {
+        imsic_cfg.nr_mmios++;
+    } while ( !dt_device_get_address(node, imsic_cfg.nr_mmios, &base_addr, NULL) );
+
+    return 0;
+}
+
+int __init imsic_init(const struct dt_device_node *node)
+{
+    int rc;
+    unsigned long reloff, cpuid;
+    uint32_t nr_parent_irqs, index, nr_handlers = 0;
+    paddr_t base_addr;
+    unsigned int nr_mmios;
+
+    /* Parse IMSIC node */
+    rc = imsic_parse_node(node, &nr_parent_irqs);
+    if ( rc )
+        return rc;
+
+    nr_mmios = imsic_cfg.nr_mmios;
+
+    /* Allocate MMIO resource array */
+    imsic_cfg.mmios = xzalloc_array(struct imsic_mmios, nr_mmios);
+    if ( !imsic_cfg.mmios )
+        return -ENOMEM;
+
+    imsic_cfg.msi = xzalloc_array(struct imsic_msi, nr_parent_irqs);
+    if ( !imsic_cfg.msi )
+        return -ENOMEM;
+
+    /* Check MMIO register sets */
+    for ( unsigned int i = 0; i < nr_mmios; i++ )
+    {
+        imsic_cfg.mmios[i].cpus = xzalloc_array(unsigned long,
+                                                BITS_TO_LONGS(nr_parent_irqs));
+        if ( !imsic_cfg.mmios[i].cpus )
+            return -ENOMEM;
+
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
+                     imsic_cfg.hart_index_bits +
+                     IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
+        base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
+                     imsic_cfg.group_index_shift);
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
+    for ( unsigned int i = 0; i < nr_parent_irqs; i++ )
+    {
+        rc = imsic_get_parent_cpuid(node, i, &cpuid);
+        if ( rc )
+        {
+            printk(XENLOG_WARNING "%s: cpu ID for parent irq%d not found\n",
+                   node->name, i);
+            continue;
+        }
+
+        if ( cpuid >= num_possible_cpus() )
+        {
+            printk(XENLOG_WARNING "%s: unsupported cpu ID=%lu for parent irq%d\n",
+                   node->name, cpuid, i);
+            continue;
+        }
+
+        /* Find MMIO location of MSI page */
+        index = nr_mmios;
+        reloff = i * BIT(imsic_cfg.guest_index_bits, UL) * IMSIC_MMIO_PAGE_SZ;
+        for ( unsigned int j = 0; nr_mmios; j++ )
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
+        if ( index >= nr_mmios )
+        {
+            printk(XENLOG_WARNING "%s: MMIO not found for parent irq%d\n",
+                   node->name, i);
+            continue;
+        }
+
+        if ( !IS_ALIGNED(imsic_cfg.msi[cpuid].base_addr + reloff, PAGE_SIZE) )
+        {
+            printk(XENLOG_WARNING "%s: MMIO address 0x%lx is not aligned on a page\n",
+                   node->name, imsic_cfg.msi[cpuid].base_addr + reloff);
+            imsic_cfg.msi[cpuid].offset = 0;
+            imsic_cfg.msi[cpuid].base_addr = 0;
+            continue;
+        }
+
+        bitmap_set(imsic_cfg.mmios[index].cpus, cpuid, 1);
+        imsic_cfg.msi[cpuid].base_addr = imsic_cfg.mmios[index].base_addr;
+        imsic_cfg.msi[cpuid].offset = reloff;
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
+ imsic_init_err:
+    for ( unsigned int i = 0; i < nr_mmios; i++ )
+        XFREE(imsic_cfg.mmios[i].cpus);
+    XFREE(imsic_cfg.mmios);
+    XFREE(imsic_cfg.msi);
+
+    return rc;
+}
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
new file mode 100644
index 0000000000..ed51cac780
--- /dev/null
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -0,0 +1,65 @@
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
+#define IMSIC_MAX_ID            2047
+
+struct imsic_msi {
+    paddr_t base_addr;
+    unsigned long offset;
+};
+
+struct imsic_mmios {
+    paddr_t base_addr;
+    unsigned long size;
+    unsigned long *cpus;
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
+    struct imsic_msi *msi;
+};
+
+struct dt_device_node;
+int imsic_init(const struct dt_device_node *node);
+
+const struct imsic_config *imsic_get_config(void);
+
+#endif /* ASM__RISCV__IMSIC_H */
-- 
2.49.0



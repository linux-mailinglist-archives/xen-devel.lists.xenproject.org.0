Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D5FABFAA3
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 18:04:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992145.1375992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvP-0006Iw-0W; Wed, 21 May 2025 16:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992145.1375992; Wed, 21 May 2025 16:04:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvO-0006Dn-NZ; Wed, 21 May 2025 16:04:10 +0000
Received: by outflank-mailman (input) for mailman id 992145;
 Wed, 21 May 2025 16:04:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hkAn=YF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uHlvM-0004XB-SI
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 16:04:08 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39ee49e9-365d-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 18:04:08 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6020ff8d51dso3589015a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 09:04:08 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d502736sm9152513a12.25.2025.05.21.09.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 09:04:06 -0700 (PDT)
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
X-Inumbo-ID: 39ee49e9-365d-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747843447; x=1748448247; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cc8l2Phl1PBhhKkspy5jt6XpbCX7rExH1ZYHyLm8/NQ=;
        b=N1MLx6RxP7AkqrnrH7lZkpidMIgAreAcihrQ65uxal+X+m/SUwL9rpEkbGTgqdZN0q
         4A3qrtezsdWP4Cdu84o4C0GDubPFtve0H37obqZmSCxwROBwE7wSoBFJ3Nn1GXId7AP3
         9AUaKfV9wqc7G0ZO3UvqS6wmqFRQq9grmA5qgRtL9AxeAnYpxjj2eL9kJ7OYmynAvDxB
         2Ln4zLKOBneOxgIMRmVdniUNIIDY67gUh7SL8L70qu2HX5PvNe9zwWO5GkrhkVgPp6qJ
         xXYfN4zGh3Rlg3uisS2JOo2QQfaydh0nt6BHaoyYfQglEXT0lXGuUkUYocOjbryyE839
         miqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747843447; x=1748448247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cc8l2Phl1PBhhKkspy5jt6XpbCX7rExH1ZYHyLm8/NQ=;
        b=NrK41HV5yK8C9c9uFFNBkJNwlBe8w/6usEdZ2LRDDhFHJWKTVJj6mm0bHjEedgYbsm
         /HI9WbA/qXfHBDIljbc2/WjbmkB7pqwmKWD0da8KT03J6bF/NCZs7MN6XyZUPZxLo1YD
         RhYI0aVdlCk8M+JnngxXj6ntLndGWZ+zoG9qhfHLh8PdWYkeneWn5AfG9WNG6VASfBCT
         Uj6CiNiADPVX8iGqlkKmHch48GcLey3gt9wNRfIBCrPYQ4ussmkEE2N+HKLgD7iByeSX
         pKmhfRNIijNOBsPDiIJmhwdOKLYd0Mfii5r+QBEOqOvYDUQt++MQvCzV6QlJ5qMMLMSt
         LjzQ==
X-Gm-Message-State: AOJu0YzVHz9bhdD82BHJpTHYny7kJqmafIhKdMTOdxie8eVQ77YUJysH
	C83h5g3aAQQ7D2G6PuhYM9IUipFquktJVa7bJaodn4B+mPEOc3SLmb0GVIy0WA==
X-Gm-Gg: ASbGncsWnwrGj86gAHZnU4v5yjHELh2rGhsjm6uQaya0Eo6A71vLw+8kvyZlSO7ZBGX
	XZWEhn1qkmUJIWDFMkOpla1bEJWuqUCvOw2obaksuhiT2CpnpXgxeNDpgGAmOIYf5aWEX10yOox
	/cWIv49wPfeMOG0RK9LWqX5oWXdEC585pKJeNfN/szBywzm7qq11U00/iaA3gIDxF1rhxMMVYz6
	VVjcY1198CzTSyw7F2BWo+nX4oSJpLbahBypOL8rQhg0uKgXLktyI/ebyO0oDBPUPz+C/8VY/Nd
	5t6Y8U+8vehGDHvjQ0X0ZC+Kr/AFyzYm2mZX9iTh+pdyLMneONW98Rw6vB1lKILpRSULHOnx+30
	lFzLnUwPIEtbqM+ixYw==
X-Google-Smtp-Source: AGHT+IF3zpE/Xa94QmEbfYkiHcCAgo23PQYL1rTzXWKouOVfuI8YHMTDFCnxVaKwgu3PbCbfMspbhw==
X-Received: by 2002:a05:6402:3495:b0:602:4405:776f with SMTP id 4fb4d7f45d1cf-60244057906mr1590265a12.31.1747843447034;
        Wed, 21 May 2025 09:04:07 -0700 (PDT)
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
Subject: [PATCH v3 08/14] xen/riscv: imsic_init() implementation
Date: Wed, 21 May 2025 18:03:48 +0200
Message-ID: <421dad1bbd014a2d7ff588af088eadbd56345dbe.1747843009.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747843009.git.oleksii.kurochko@gmail.com>
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
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
Changes in V3:
 - Drop year in imsic.h in copyrights.
 - Correct identation in imsic_parse_node() and imsic_init()
   where for imsic_cfg.base_addr a mask is applied.
 - Use unsigned int istead of uint32_t for local variable nr_parent_irqs,
   index, nr_handlers in imsic_init().
 - Fix a leakage of ealiers successfull allocations in case if imsic_init()
   returns with an error.
 - Excess blank in printk() message: "%s: unable to parse MMIO regset %d\n".
 - Introduce hartid_to_cpuid() and use it in the check:
     if ( hardid_to_cpuid(cpuid) >= num_possible_cpus() )
   in imsic_init().
 - Use "%u" for unsigned int in printk(...).
 - Fix for loop condition: nr_mmios -> "j < nr_mmios".
 - [imsic_init()] Drop usage of j in nested loop. It is enough to have only
   index.
 - Change 0x%lx to %#lx for formatting of an address in printk().
 - [imsic_init()] Rename local variable cpuid to hartid.
 - s/imsic_get_parent_cpuid/imsic_get_parent_hartid, s/cpuid/hartid for an
   imsic_get_parent_hartid()'s argument.
 - Declare cpus member of struct imsic_mmios as cpumask_t.
 - [imsic_init()] Allocate imsic_mmios.cpus by using of alloc_cpumask_var().
 - [imsic_init()] Use cpumask_set_cpu() instead of bitmap_set().
 - [imsic_parse_node()] add check for correctness of "interrupt-extended" property.
 - [imsic_parse_node()] Use dt_node_name() or dt_full_node_name() instead of
   derefence of struct dt_node.
 - [imsic_parse_node()] Add cleanup label and update 'rc = XXX; goto cleanup'
   instead of 'return rc' as now we have to cleanup dynamically allocated irq_range
   array.
 - Add comments above imsic_init() and imsic_parse_node().
 - s/xen/arch/riscv/imsic.h/xen/arch/riscv/include/asm/imsic.h in the comment of
   imsic.h.
---
Changes in V2:
 - Drop years in copyrights.
 - s/riscv_of_processor_hartid/dt_processor_cpuid.
 - s/imsic_get_parent_hartid/imsic_get_parent_hartid.
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
 xen/arch/riscv/imsic.c             | 354 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/imsic.h |  65 ++++++
 xen/arch/riscv/include/asm/smp.h   |  13 ++
 4 files changed, 433 insertions(+)
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
index 0000000000..9f8b492e97
--- /dev/null
+++ b/xen/arch/riscv/imsic.c
@@ -0,0 +1,354 @@
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
+#include <xen/bitops.h>
+#include <xen/const.h>
+#include <xen/cpumask.h>
+#include <xen/device_tree.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/macros.h>
+#include <xen/smp.h>
+#include <xen/spinlock.h>
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
+static int __init imsic_get_parent_hartid(const struct dt_device_node *node,
+                                          unsigned int index,
+                                          unsigned long *hartid)
+{
+    int res;
+    struct dt_phandle_args args;
+
+    res = dt_parse_phandle_with_args(node, "interrupts-extended",
+                                     "#interrupt-cells", index, &args);
+    if ( !res )
+        res = dt_processor_hartid(args.np->parent, hartid);
+
+    return res;
+}
+
+/*
+ * Parses IMSIC DT node.
+ *
+ * Returns 0 if initialization is successful, a negative value on failure,
+ * or IRQ_M_EXT if the IMSIC node corresponds to a machine-mode IMSIC,
+ * which should be ignored by the hypervisor.
+ */
+static int imsic_parse_node(const struct dt_device_node *node,
+                            unsigned int *nr_parent_irqs)
+{
+    int rc;
+    unsigned int tmp;
+    paddr_t base_addr;
+    uint32_t *irq_range;
+
+    *nr_parent_irqs = dt_number_of_irq(node);
+    if ( !*nr_parent_irqs )
+        panic("%s: irq_num can be 0. Check %s node\n", __func__,
+              dt_node_full_name(node));
+
+    irq_range = xzalloc_array(uint32_t, *nr_parent_irqs * 2);
+    if ( !irq_range )
+        panic("%s: irq_range[] allocation failed\n", __func__);
+
+    if ( (rc = dt_property_read_u32_array(node, "interrupts-extended",
+                                    irq_range, *nr_parent_irqs * 2)) )
+        panic("%s: unable to find interrupt-extended in %s node: %d\n",
+              __func__, dt_node_full_name(node), rc);
+
+    if ( irq_range[1] == IRQ_M_EXT )
+    {
+        /* Machine mode imsic node, ignore it. */
+        rc = IRQ_M_EXT;
+        goto cleanup;
+    }
+
+    /* Check that interrupts-extended property is well-formed. */
+    for ( unsigned int i = 2; i < (*nr_parent_irqs * 2); i += 2 )
+    {
+        if ( irq_range[i + 1] != irq_range[1] )
+            panic("%s: mode[%d] != %d\n", __func__, i + 1, irq_range[1]);
+    }
+
+    if ( !dt_property_read_u32(node, "riscv,guest-index-bits",
+                               &imsic_cfg.guest_index_bits) )
+        imsic_cfg.guest_index_bits = 0;
+    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT;
+    if ( tmp < imsic_cfg.guest_index_bits )
+    {
+        printk(XENLOG_ERR "%s: guest index bits too big\n",
+               dt_node_name(node));
+        rc = -ENOENT;
+        goto cleanup;
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
+        printk(XENLOG_ERR "%s: HART index bits too big\n",
+               dt_node_name(node));
+        rc = -ENOENT;
+        goto cleanup;
+    }
+
+    /* Find number of group index bits */
+    if ( !dt_property_read_u32(node, "riscv,group-index-bits",
+                               &imsic_cfg.group_index_bits) )
+        imsic_cfg.group_index_bits = 0;
+    tmp -= imsic_cfg.hart_index_bits;
+    if ( tmp < imsic_cfg.group_index_bits )
+    {
+        printk(XENLOG_ERR "%s: group index bits too big\n",
+               dt_node_name(node));
+        rc = -ENOENT;
+        goto cleanup;
+    }
+
+    /* Find first bit position of group index */
+    tmp = IMSIC_MMIO_PAGE_SHIFT * 2;
+    if ( !dt_property_read_u32(node, "riscv,group-index-shift",
+                               &imsic_cfg.group_index_shift) )
+        imsic_cfg.group_index_shift = tmp;
+    if ( imsic_cfg.group_index_shift < tmp )
+    {
+        printk(XENLOG_ERR "%s: group index shift too small\n",
+               dt_node_name(node));
+        rc = -ENOENT;
+        goto cleanup;
+    }
+    tmp = imsic_cfg.group_index_bits + imsic_cfg.group_index_shift - 1;
+    if ( tmp >= BITS_PER_LONG )
+    {
+        printk(XENLOG_ERR "%s: group index shift too big\n",
+               dt_node_name(node));
+        rc = -EINVAL;
+        goto cleanup;
+    }
+
+    /* Find number of interrupt identities */
+    if ( !dt_property_read_u32(node, "riscv,num-ids", &imsic_cfg.nr_ids) )
+    {
+        printk(XENLOG_ERR "%s: number of interrupt identities not found\n",
+               node->name);
+        rc = -ENOENT;
+        goto cleanup;
+    }
+
+    if ( (imsic_cfg.nr_ids < IMSIC_MIN_ID) ||
+         (imsic_cfg.nr_ids > IMSIC_MAX_ID) ||
+         ((imsic_cfg.nr_ids & IMSIC_MIN_ID) != IMSIC_MIN_ID) )
+    {
+        printk(XENLOG_ERR "%s: invalid number of interrupt identities\n",
+               node->name);
+        rc = -EINVAL;
+        goto cleanup;
+    }
+
+    /* Compute base address */
+    imsic_cfg.nr_mmios = 0;
+    rc = dt_device_get_address(node, imsic_cfg.nr_mmios, &base_addr, NULL);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "%s: first MMIO resource not found: %d\n",
+               dt_node_name(node), rc);
+        goto cleanup;
+    }
+
+    imsic_cfg.base_addr = base_addr;
+    imsic_cfg.base_addr &= ~(BIT(imsic_cfg.guest_index_bits +
+                                 imsic_cfg.hart_index_bits +
+                                 IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
+    imsic_cfg.base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
+                             imsic_cfg.group_index_shift);
+
+    /* Find number of MMIO register sets */
+    do {
+        imsic_cfg.nr_mmios++;
+    } while ( !dt_device_get_address(node, imsic_cfg.nr_mmios, &base_addr, NULL) );
+
+ cleanup:
+    xfree(irq_range);
+
+    return rc;
+}
+
+/*
+ * Initialize the imsic_cfg structure based on the IMSIC DT node.
+ *
+ * Returns 0 if initialization is successful, a negative value on failure,
+ * or IRQ_M_EXT if the IMSIC node corresponds to a machine-mode IMSIC,
+ * which should be ignored by the hypervisor.
+ */
+int __init imsic_init(const struct dt_device_node *node)
+{
+    int rc;
+    unsigned long reloff, hartid;
+    unsigned int nr_parent_irqs, index, nr_handlers = 0;
+    paddr_t base_addr;
+    unsigned int nr_mmios;
+
+    /* Parse IMSIC node */
+    rc = imsic_parse_node(node, &nr_parent_irqs);
+    /*
+     * If machine mode imsic node => ignore it.
+     * If rc < 0 => parsing of IMSIC DT node failed.
+     */
+    if ( (rc == IRQ_M_EXT) || rc )
+        return rc;
+
+    nr_mmios = imsic_cfg.nr_mmios;
+
+    /* Allocate MMIO resource array */
+    imsic_cfg.mmios = xzalloc_array(struct imsic_mmios, nr_mmios);
+    if ( !imsic_cfg.mmios )
+    {
+        rc = -ENOMEM;
+        goto imsic_init_err;
+    }
+
+    imsic_cfg.msi = xzalloc_array(struct imsic_msi, nr_parent_irqs);
+    if ( !imsic_cfg.msi )
+    {
+        rc = -ENOMEM;
+        goto imsic_init_err;
+    }
+
+    /* Check MMIO register sets */
+    for ( unsigned int i = 0; i < nr_mmios; i++ )
+    {
+        if ( !alloc_cpumask_var(&imsic_cfg.mmios[i].cpus) )
+        {
+            rc = -ENOMEM;
+            goto imsic_init_err;
+        }
+
+        rc = dt_device_get_address(node, i, &imsic_cfg.mmios[i].base_addr,
+                                   &imsic_cfg.mmios[i].size);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "%s: unable to parse MMIO regset %u\n",
+                   node->name, i);
+            goto imsic_init_err;
+        }
+
+        base_addr = imsic_cfg.mmios[i].base_addr;
+        base_addr &= ~(BIT(imsic_cfg.guest_index_bits +
+                           imsic_cfg.hart_index_bits +
+                           IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
+        base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
+                       imsic_cfg.group_index_shift);
+        if ( base_addr != imsic_cfg.base_addr )
+        {
+            rc = -EINVAL;
+            printk(XENLOG_ERR "%s: address mismatch for regset %u\n",
+                   node->name, i);
+            goto imsic_init_err;
+        }
+    }
+
+    /* Configure handlers for target CPUs */
+    for ( unsigned int i = 0; i < nr_parent_irqs; i++ )
+    {
+        unsigned long xen_cpuid;
+
+        rc = imsic_get_parent_hartid(node, i, &hartid);
+        if ( rc )
+        {
+            printk(XENLOG_WARNING "%s: cpu ID for parent irq%u not found\n",
+                   node->name, i);
+            continue;
+        }
+
+        xen_cpuid = hartid_to_cpuid(hartid);
+
+        if ( xen_cpuid >= num_possible_cpus() )
+        {
+            printk(XENLOG_WARNING "%s: unsupported cpu ID=%lu for parent irq%u\n",
+                   node->name, hartid, i);
+            continue;
+        }
+
+        /* Find MMIO location of MSI page */
+        reloff = i * BIT(imsic_cfg.guest_index_bits, UL) * IMSIC_MMIO_PAGE_SZ;
+        for ( index = 0; index < nr_mmios; index++ )
+        {
+            if ( reloff < imsic_cfg.mmios[index].size )
+                break;
+
+            /*
+             * MMIO region size may not be aligned to
+             * BIT(global->guest_index_bits) * IMSIC_MMIO_PAGE_SZ
+             * if holes are present.
+             */
+            reloff -= ROUNDUP(imsic_cfg.mmios[index].size,
+                BIT(imsic_cfg.guest_index_bits, UL) * IMSIC_MMIO_PAGE_SZ);
+        }
+
+        if ( index == nr_mmios )
+        {
+            printk(XENLOG_WARNING "%s: MMIO not found for parent irq%u\n",
+                   node->name, i);
+            continue;
+        }
+
+        if ( !IS_ALIGNED(imsic_cfg.msi[xen_cpuid].base_addr + reloff, PAGE_SIZE) )
+        {
+            printk(XENLOG_WARNING "%s: MMIO address %#lx is not aligned on a page\n",
+                   node->name, imsic_cfg.msi[xen_cpuid].base_addr + reloff);
+            imsic_cfg.msi[xen_cpuid].offset = 0;
+            imsic_cfg.msi[xen_cpuid].base_addr = 0;
+            continue;
+        }
+
+        cpumask_set_cpu(xen_cpuid, imsic_cfg.mmios[index].cpus);
+
+        imsic_cfg.msi[xen_cpuid].base_addr = imsic_cfg.mmios[index].base_addr;
+        imsic_cfg.msi[xen_cpuid].offset = reloff;
+
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
+        free_cpumask_var(imsic_cfg.mmios[i].cpus);
+    XFREE(imsic_cfg.mmios);
+    XFREE(imsic_cfg.msi);
+
+    return rc;
+}
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
new file mode 100644
index 0000000000..0d17881884
--- /dev/null
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * xen/arch/riscv/include/asm/imsic.h
+ *
+ * RISC-V Incoming MSI Controller support
+ *
+ * (c) Microchip Technology Inc.
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
+    cpumask_var_t cpus;
+};
+
+struct imsic_config {
+    /* Base address */
+    paddr_t base_addr;
+
+    /* Bits representing Guest index, HART index, and Group index */
+    unsigned int guest_index_bits;
+    unsigned int hart_index_bits;
+    unsigned int group_index_bits;
+    unsigned int group_index_shift;
+
+    /* IMSIC phandle */
+    unsigned int phandle;
+
+    /* Number of parent irq */
+    unsigned int nr_parent_irqs;
+
+    /* Number off interrupt identities */
+    unsigned int nr_ids;
+
+    /* MMIOs */
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
diff --git a/xen/arch/riscv/include/asm/smp.h b/xen/arch/riscv/include/asm/smp.h
index eb58b6576b..33ee5ec06b 100644
--- a/xen/arch/riscv/include/asm/smp.h
+++ b/xen/arch/riscv/include/asm/smp.h
@@ -3,6 +3,7 @@
 #define ASM__RISCV__SMP_H
 
 #include <xen/cpumask.h>
+#include <xen/macros.h>
 #include <xen/percpu.h>
 
 #include <asm/current.h>
@@ -18,6 +19,18 @@ static inline unsigned long cpuid_to_hartid(unsigned long cpuid)
     return pcpu_info[cpuid].hart_id;
 }
 
+static inline unsigned long hartid_to_cpuid(unsigned long hartid)
+{
+    for ( unsigned int cpuid = 0; cpuid < ARRAY_SIZE(pcpu_info); cpuid++ )
+    {
+        if ( hartid == cpuid_to_hartid(cpuid) )
+            return cpuid;
+    }
+
+    /* hartid isn't valid for some reason */
+    return NR_CPUS;
+}
+
 static inline void set_cpuid_to_hartid(unsigned long cpuid,
                                        unsigned long hartid)
 {
-- 
2.49.0



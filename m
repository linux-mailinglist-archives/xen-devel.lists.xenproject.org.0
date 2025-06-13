Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E981AD91DB
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:49:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014628.1392759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6eM-0007Y6-3g; Fri, 13 Jun 2025 15:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014628.1392759; Fri, 13 Jun 2025 15:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6eM-0007VW-0l; Fri, 13 Jun 2025 15:49:02 +0000
Received: by outflank-mailman (input) for mailman id 1014628;
 Fri, 13 Jun 2025 15:49:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44KY=Y4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uQ6eK-0006ch-Hs
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:49:00 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebd2ca60-486d-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 17:48:59 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-adb2bb25105so386965866b.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 08:48:59 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec8979563sm144821766b.158.2025.06.13.08.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 08:48:57 -0700 (PDT)
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
X-Inumbo-ID: ebd2ca60-486d-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749829739; x=1750434539; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VTyeRYiX1XAnb1TXldryqy45I1dShILwiINfWUEwjw=;
        b=Tqh7beHqqh+HD3UO5WEo3kFDSPdHvhg3IGiChLBw5yMlnb66FEQ/j5PU20vLy/c6zw
         Ib+abtLBhIfrzqEwXFC1RIeovJvsz+uInouuH84XCNVfniDEVW+OhNBDkdUQLthcX8wq
         IywDXk7avR/ZLMDZlI8852/ytVhbvdNHcmLEl7nqeQPttWQmgB+OOxmZyxzHxosbl+8H
         IjSicg3q2rKP/cAQ9tE+dwk/DBDcSGOONRSJSlt15ehTogTPsXaDR1UJ850R2PPEqqic
         LNPDL3aWlnEhnvuK1YN2fi3wGEm1w/OfsA42I4hqYP9IZr0tVfkc10x2vl4r3JoLkO0M
         uDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749829739; x=1750434539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/VTyeRYiX1XAnb1TXldryqy45I1dShILwiINfWUEwjw=;
        b=MHZG4Dna9XLCaORGQ2xAwwoq5ftAI4a+qtMTNj1s9nywKq1/K0m44G+MKqWSRcLQoy
         9NxMi/Rr/ae90bW/7jRaS33gpwd5PJQ3pv1U1wsndoJLj1p4v/vQoEWNYOoQ2bJNz1hG
         opAYUfZyQivHsF9pbxthKUYks2vh0Ia4WcPmwOSpj3gGVBKBCOGZ5iE1NPDBcTyeUhe0
         FXClmHINV4chcFmHWW1iMu7eemUtTl/rJYRgtF5ju5IBfS6uG0dLrvD1xnfp92n1HIlg
         h+tNUqlfBnQNtGWLe+Y1uBdo+kKASD9ZhSRtzLqONpUo0x3jPViBvwZJtCFgeC0BJLjm
         JhOQ==
X-Gm-Message-State: AOJu0Yz58+ZfbHa/N69cK9LiQaF0HW/ZnZqHNr9fRGWFRaDCQKec5jdi
	2gJgqw5Tc68bj49/A5bWgUBVHhqAEeVxT9CN/caQ+aPmWBRZyNnQzDqLMGF+uA==
X-Gm-Gg: ASbGncuNOhhXH3ym0PbnvCSfIAkhdUCFiOKwjzd3GKJVt0EKdSxGK8+T4W7N2CyOIZd
	nvzUIC2/w3GrQSWSf9+G6e+reQ+RYNjqZoXh+SHkDdDNM4SuBYvc1mTyfIrt8DZIwKJQIHE7VwU
	euwUtZPfw5ux8Ffop2x8sakW+QBD3U/Q2vMl1BJ++F0IhsBh6lAjyGRvAX2FO2lcGhn8oDabMyM
	+b3cKCzbYT5S9ePNjbHRyOQEpcfgoZkJvIQzvT31ngjEQfGGDrZxK4Pi4tQ2N/SSLnQP/+nDyHo
	68kDsHzdcKrpforMfg5rL4Wransp1w2T2fDqpExx7pzdQl9D2Ng0pBLxUp0OjrAREiwh3cT+a8L
	7bXZUmfBstaMJ+258zi7Bd8ymwp5PFXVCzxd6fVs=
X-Google-Smtp-Source: AGHT+IENIi8UeIHZvwcgJduAhJBy0le6i0KrHqUNkX1UFOCEiPLPvL+kCeSNzX62ppVGNFfyI0OBSw==
X-Received: by 2002:a17:907:9623:b0:ad5:a29c:efed with SMTP id a640c23a62f3a-adec5cb0022mr351587066b.33.1749829738153;
        Fri, 13 Jun 2025 08:48:58 -0700 (PDT)
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
Subject: [PATCH v5 3/9] xen/riscv: imsic_init() implementation
Date: Fri, 13 Jun 2025 17:48:42 +0200
Message-ID: <0b366c5b7c8d34a98c8ec4bedf1f00b070a6fae1.1749825782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749825782.git.oleksii.kurochko@gmail.com>
References: <cover.1749825782.git.oleksii.kurochko@gmail.com>
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
Changes in V5:
 - Drop trailing underscore for an argument of IMSIC_HART_SIZE macros.
 - Avoid wrapping format strings across lines.
 - Use 'unsigned int' for cpu variable inside imsic_init().
 - Use IMSIC_HART_SIZE() instead of open-code it.
 - s/msi[cpu].base_addr /mmios[].base_addr for the check which checks
   that MMIO addres is properly aligned.
 - s/XFREE/xvfree.
 - Drop zero-ing of  msi[cpu].{offset,base_addr} as msi[]  is zero-ed
   when is allocated and cpu id can't be found twice.
 - Add check to vefiry that CPU won't be found twice in interrupt-extended
   property of IMSIC node.
---
Changes in V4:
 - s/expected/intended in the comment above imsic_get_config().
 - [imsic_parse_node()] s/irq_num can be 0/irq_num can't be 0 in panic()
   message.
 - [imsic_parse_node()] Move "if ( irq_range[1] == IRQ_M_EXT )" after 'for loop'
   which checks interrupts-extended property.
 - [imsic_parse_node()] s/%d/%u for logging unsigned values.
 - [imsic_parse_node()] drop redundant check "(imsic_cfg.nr_ids & IMSIC_MIN_ID) != IMSIC_MIN_ID)".
 - [imsic_parse_node()] free irq_range much earlier and simlify error paths.
 - [imsic_parse_node()] s/-EINVAL/-ENOENT in the case of incorrect value for
   riscv,group-index-shift and id number.
 - [[imsic_parse_node()] s/xzalloc_array/xvzalloc_array.
 - s/xen_cpuid/cpu.
 - Identation fix.
 - use IMSIC_MMIO_PAGE_SZ instead of PAGE_SZ to check if interrupt file base
   addr is properly aligned.
 - s/ASM__RISCV__IMSIC_H/ASM_RISCV_IMSIC_H.
 - Drop *mmios from struct imsic_cfg as it is used only by imsic_init().
 - Drop cpus[] form struct imsic_mmios as it isn't really used.
 - Update declaration of hartid_to_cpuid() to return unsigned int instead of
   NR_CPUs as processor_id is in range [0, NR_CPUS) and NR_CPUs is less then
   unsigned int.
 - Calculate hart_index_bits as fls(*nr_parent_irqs - 1) to cover the case if
   nr_parent_irqs is a power of two.
 - Check an MMIO's size for IMSIC node.
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
 xen/arch/riscv/imsic.c             | 369 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/imsic.h |  55 +++++
 xen/arch/riscv/include/asm/smp.h   |  13 +
 4 files changed, 438 insertions(+)
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
index 0000000000..e7f06950de
--- /dev/null
+++ b/xen/arch/riscv/imsic.c
@@ -0,0 +1,369 @@
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
+#include <xen/xvmalloc.h>
+
+#include <asm/imsic.h>
+
+#define IMSIC_HART_SIZE(guest_bits) (BIT(guest_bits, U) * IMSIC_MMIO_PAGE_SZ)
+
+struct imsic_mmios {
+    paddr_t base_addr;
+    unsigned long size;
+};
+
+static struct imsic_config imsic_cfg;
+
+/* Callers aren't intended to changed imsic_cfg so return const. */
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
+                            unsigned int *nr_parent_irqs,
+                            unsigned int *nr_mmios)
+{
+    int rc;
+    unsigned int tmp;
+    paddr_t base_addr;
+    uint32_t *irq_range;
+
+    *nr_parent_irqs = dt_number_of_irq(node);
+    if ( !*nr_parent_irqs )
+        panic("%s: irq_num can't be 0. Check %s node\n", __func__,
+              dt_node_full_name(node));
+
+    irq_range = xvzalloc_array(uint32_t, *nr_parent_irqs * 2);
+    if ( !irq_range )
+        panic("%s: irq_range[] allocation failed\n", __func__);
+
+    if ( (rc = dt_property_read_u32_array(node, "interrupts-extended",
+                                    irq_range, *nr_parent_irqs * 2)) )
+        panic("%s: unable to find interrupt-extended in %s node: %d\n",
+              __func__, dt_node_full_name(node), rc);
+
+    /* Check that interrupts-extended property is well-formed. */
+    for ( unsigned int i = 2; i < (*nr_parent_irqs * 2); i += 2 )
+    {
+        if ( irq_range[i + 1] != irq_range[1] )
+            panic("%s: mode[%u] != %u\n", __func__, i + 1, irq_range[1]);
+    }
+
+    if ( irq_range[1] == IRQ_M_EXT )
+    {
+        /* Machine mode imsic node, ignore it. */
+        xfree(irq_range);
+
+        return IRQ_M_EXT;
+    }
+
+    xfree(irq_range);
+
+    if ( !dt_property_read_u32(node, "riscv,guest-index-bits",
+                               &imsic_cfg.guest_index_bits) )
+        imsic_cfg.guest_index_bits = 0;
+    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT;
+    if ( tmp < imsic_cfg.guest_index_bits )
+    {
+        printk(XENLOG_ERR "%s: guest index bits too big\n",
+               dt_node_name(node));
+        return -ENOENT;
+    }
+
+    /* Find number of HART index bits */
+    if ( !dt_property_read_u32(node, "riscv,hart-index-bits",
+                               &imsic_cfg.hart_index_bits) )
+        /* Assume default value */
+        imsic_cfg.hart_index_bits = fls(*nr_parent_irqs - 1);
+    tmp -= imsic_cfg.guest_index_bits;
+    if ( tmp < imsic_cfg.hart_index_bits )
+    {
+        printk(XENLOG_ERR "%s: HART index bits too big\n",
+               dt_node_name(node));
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
+        printk(XENLOG_ERR "%s: group index bits too big\n",
+               dt_node_name(node));
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
+        printk(XENLOG_ERR "%s: group index shift too small\n",
+               dt_node_name(node));
+        return -ENOENT;
+    }
+    tmp = imsic_cfg.group_index_bits + imsic_cfg.group_index_shift - 1;
+    if ( tmp >= BITS_PER_LONG )
+    {
+        printk(XENLOG_ERR "%s: group index shift too big\n",
+               dt_node_name(node));
+        return -ENOENT;
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
+         (imsic_cfg.nr_ids > IMSIC_MAX_ID) )
+    {
+        printk(XENLOG_ERR "%s: invalid number of interrupt identities\n",
+               node->name);
+        return -ENOENT;
+    }
+
+    /* Compute base address */
+    *nr_mmios = 0;
+    rc = dt_device_get_address(node, *nr_mmios, &base_addr, NULL);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "%s: first MMIO resource not found: %d\n",
+               dt_node_name(node), rc);
+        return rc;
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
+        (*nr_mmios)++;
+    } while ( !dt_device_get_address(node, *nr_mmios, &base_addr, NULL) );
+
+    return 0;
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
+    struct imsic_mmios *mmios;
+    struct imsic_msi *msi = NULL;
+
+    /* Parse IMSIC node */
+    rc = imsic_parse_node(node, &nr_parent_irqs, &nr_mmios);
+    /*
+     * If machine mode imsic node => ignore it.
+     * If rc < 0 => parsing of IMSIC DT node failed.
+     */
+    if ( (rc == IRQ_M_EXT) || (rc < 0) )
+        return rc;
+
+    /* Allocate MMIO resource array */
+    mmios = xvzalloc_array(struct imsic_mmios, nr_mmios);
+    if ( !mmios )
+    {
+        rc = -ENOMEM;
+        goto imsic_init_err;
+    }
+
+    msi = xvzalloc_array(struct imsic_msi, nr_parent_irqs);
+    if ( !msi )
+    {
+        rc = -ENOMEM;
+        goto imsic_init_err;
+    }
+
+    /* Check MMIO register sets */
+    for ( unsigned int i = 0; i < nr_mmios; i++ )
+    {
+        unsigned int guest_bits = imsic_cfg.guest_index_bits;
+        unsigned long expected_mmio_size =
+            IMSIC_HART_SIZE(guest_bits) * nr_parent_irqs;
+
+        rc = dt_device_get_address(node, i, &mmios[i].base_addr,
+                                   &mmios[i].size);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "%s: unable to parse MMIO regset %u\n",
+                   node->name, i);
+            goto imsic_init_err;
+        }
+
+        base_addr = mmios[i].base_addr;
+        base_addr &= ~(BIT(guest_bits +
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
+
+        if ( mmios[i].size != expected_mmio_size )
+        {
+            rc = -EINVAL;
+            printk(XENLOG_ERR "%s: IMSIC MMIO size is incorrect %ld, expected MMIO size: %ld\n",
+                   node->name, mmios[i].size, expected_mmio_size);
+            goto imsic_init_err;
+        }
+    }
+
+    /* Configure handlers for target CPUs */
+    for ( unsigned int i = 0; i < nr_parent_irqs; i++ )
+    {
+        unsigned int cpu;
+
+        rc = imsic_get_parent_hartid(node, i, &hartid);
+        if ( rc )
+        {
+            printk(XENLOG_WARNING "%s: cpu ID for parent irq%u not found\n",
+                   node->name, i);
+            continue;
+        }
+
+        cpu = hartid_to_cpuid(hartid);
+
+        /*
+         * If .base_addr is not 0, it indicates that the CPU has already been
+         * found.
+         * In this case, skip re-initialization to avoid duplicate setup.
+         * Also, print a warning message to signal that the DTS should be
+         * reviewed for possible duplication.
+         */
+        if ( msi[cpu].base_addr )
+        {
+            printk("%s: cpu%d is found twice in interrupts-extended prop\n",
+                  node->name, cpu);
+            continue;
+        }
+
+        if ( cpu >= num_possible_cpus() )
+        {
+            printk(XENLOG_WARNING "%s: unsupported hart ID=%#lx for parent irq%u\n",
+                   node->name, hartid, i);
+            continue;
+        }
+
+        /* Find MMIO location of MSI page */
+        reloff = i * IMSIC_HART_SIZE(imsic_cfg.guest_index_bits);
+        for ( index = 0; index < nr_mmios; index++ )
+        {
+            if ( reloff < mmios[index].size )
+                break;
+
+            /*
+             * MMIO region size may not be aligned to
+             * IMSIC_HART_SIZE(guest_index_bits) if
+             * holes are present.
+             */
+            reloff -= ROUNDUP(mmios[index].size,
+                      IMSIC_HART_SIZE(imsic_cfg.guest_index_bits));
+        }
+
+        if ( index == nr_mmios )
+        {
+            printk(XENLOG_WARNING "%s: MMIO not found for parent irq%u\n",
+                   node->name, i);
+            continue;
+        }
+
+        if ( !IS_ALIGNED(mmios[cpu].base_addr + reloff,
+                         IMSIC_MMIO_PAGE_SZ) )
+        {
+            printk(XENLOG_WARNING "%s: MMIO address %#lx is not aligned on a page\n",
+                   node->name, msi[cpu].base_addr + reloff);
+            continue;
+        }
+
+        msi[cpu].base_addr = mmios[index].base_addr;
+        msi[cpu].offset = reloff;
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
+    imsic_cfg.msi = msi;
+
+    xvfree(mmios);
+
+    return 0;
+
+ imsic_init_err:
+    xvfree(mmios);
+    xvfree(msi);
+
+    return rc;
+}
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
new file mode 100644
index 0000000000..9cd12365b1
--- /dev/null
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -0,0 +1,55 @@
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
+#ifndef ASM_RISCV_IMSIC_H
+#define ASM_RISCV_IMSIC_H
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
+    /* MSI */
+    const struct imsic_msi *msi;
+};
+
+struct dt_device_node;
+int imsic_init(const struct dt_device_node *node);
+
+const struct imsic_config *imsic_get_config(void);
+
+#endif /* ASM_RISCV_IMSIC_H */
diff --git a/xen/arch/riscv/include/asm/smp.h b/xen/arch/riscv/include/asm/smp.h
index eb58b6576b..57c8baa06c 100644
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
 
+static inline unsigned int hartid_to_cpuid(unsigned long hartid)
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45215AACB8D
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 18:52:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977634.1364686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWg-0008NR-D2; Tue, 06 May 2025 16:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977634.1364686; Tue, 06 May 2025 16:52:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWg-0008JA-1s; Tue, 06 May 2025 16:52:14 +0000
Received: by outflank-mailman (input) for mailman id 977634;
 Tue, 06 May 2025 16:52:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/GUx=XW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uCLWe-0005Fd-8j
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:52:12 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73440c83-2a9a-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 18:52:09 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ac7bd86f637so10578166b.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:52:09 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891a3cb9sm740295366b.60.2025.05.06.09.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:52:08 -0700 (PDT)
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
X-Inumbo-ID: 73440c83-2a9a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746550329; x=1747155129; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7bqlD3yclmWFqpbOVCYxhfG+qpphXcgJLBRlpTHTwc=;
        b=eKGWsUnVd+Ex20oQoSDrFW7fhwEW8/GzwJ13goRggxL6z1dod4OExVZcaZO2DfNzlj
         R0Pnt0c2cV5muGXKH3qzG/PzJ6oSBRNxJu6tHBu1f9PSf71LsLsi4v4A38FHz6LUe6j2
         eSZ4svlrZfTrdp+C/rFF4+Jw/raXCAShPgKCCdAR5sMIy9ZXIyqt/Ltxu/hwqKFJWkAx
         eZRvijg7z/nH6DrJPtMohqpDvjpmtmuG1I54bjxi/4BRXrwaK3W6U4gTgLIf+tc2I2GE
         hDpn8AuOzXdo2mGDPgpNVN2DCjEVHnYfboLn5DYUOFjU4QK/GQX29xsp1+6Sibpaox49
         gjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550329; x=1747155129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X7bqlD3yclmWFqpbOVCYxhfG+qpphXcgJLBRlpTHTwc=;
        b=iasI+n2WpwHkCLU+8JcglhuP1t1cfOGmx2cACV7f8TlwiNy70R/qKQJmaweyKKt5rR
         zHg0yR3CnnHDuMKxI52xuOJmHHTqg4rIAy5INScFhTM43kkqKLK2FlQlb+QVL4JyUhv7
         vP6jU0RZ6P36HN19vUTrzfjjXfo18Kd2tzYX64tkJXRtLS4Rwyx3fHBn/OKFAG5Xyeax
         gSVEkrRkxo8AfQNORJIoN+aGs1JmhxvDUrHuuAg0uUwX9B7k/btFglw00nIQJI7TfGJs
         6hjR3yCuYM6FLae/EV4oMdRpIth+4eZGjEfNuESG1rXgG4ujJCQsTSsuY6pbFxF8lJch
         56Iw==
X-Gm-Message-State: AOJu0Yyw7ssVs7aT+/aFUWZAp0soD6Su3oYTK8x1l5tpnq77h20CkGUe
	qOOJX0i94og/J0qhMXfGcaOPw8QRgXPUqixmX6vEf0Lx/fkSKUOlHQqlAg==
X-Gm-Gg: ASbGncu0/5kqTaup4mckqklcOGr2zDAsN9N7M+ON5KjfCLMRQUwcWoJgwRawgBnyBk0
	6atfUfd1hGrBeEwb015qXjqH7kNbUyFmKzN/CqxlYT9J+/jnUiXEKAAdjfDNOzQtAWxAkJ8ImbQ
	94nV2RVY0NuhHeXJ4kWcKphTYZUeGsLJ4JgPVeph0lRAFGvBL15yehXJ9/8szQyok2QPnfF/pxW
	YFQ4XRc52ChW9IjceO8MxUF35tS95QQSx87J4HK6oMtGKdMxgrVVICsPXaLEZTzCItvt8ICVNoq
	yRRk6azggnKhZ9NevllySVQNKTrQrtj7UPnTEL/WkdHG+iQR1jyqqHQBBrks54vSm4sDQ5Ysd0h
	WQyfiEDm2Mg==
X-Google-Smtp-Source: AGHT+IEhOkmb1jx5SbHyCixof/ixiFhHkrZcmMEWR17iWutqxnDffklvb69FO1Cyzua5DT/DhmiwsA==
X-Received: by 2002:a17:907:7d89:b0:ac7:334d:3217 with SMTP id a640c23a62f3a-ad1e78046b4mr52040866b.12.1746550328483;
        Tue, 06 May 2025 09:52:08 -0700 (PDT)
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
Subject: [PATCH v2 13/16] xen/riscv: implementation of aplic and imsic operations
Date: Tue,  6 May 2025 18:51:43 +0200
Message-ID: <37d309520a0adb8bb3f4e51a985a2d56b669ba9e.1746530883.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746530883.git.oleksii.kurochko@gmail.com>
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=all
Content-Transfer-Encoding: 8bit

Introduce interrupt controller descriptor for host APLIC to describe
the low-lovel hardare. It includes implementation of the following functions:
 - aplic_irq_startup()
 - aplic_irq_enable()
 - aplic_irq_disable()
 - aplic_set_irq_affinity()

As APLIC is used in MSI mode it requires to enable/disable interrupts not
only for APLIC but also for IMSIC. Thereby for the purpose of
aplic_irq_{enable,disable}() it is introduced imsic_irq_{enable,disable)().

For the purpose of aplic_set_irq_affinity() aplic_get_cpu_from_mask() is
introduced to get hart id.

Also, introduce additional interrupt controller h/w operations and
host_irq_type for APLIC:
 - aplic_host_irq_type

Patch is based on the code from [1].

[1] https://gitlab.com/xen-project/people/olkur/xen/-/commit/7390e2365828b83e27ead56b03114a56e3699dd5

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Move imsic_ids_local_delivery() and connected to it parts to the current
   patch to fix compilation issue. Also, add __init for
   imsic_ids_local_delivery().
 - Move introduction of aplic_set_irq_type() and aplic_set_irq_priority()
   to patch [PATCH v1 12/14] xen/riscv: implement setup_irq() where they
   really started to be used.
 - Update the commit message.
 - Drop is_used variable for imsic_cfg and use (aplic.regs->domaincfg & APLIC_DOMAINCFG_DM) instead.
 - Use writel() to write to APLIC regs.
 - Drop aplic_irq_shutdown() and use aplic_irq_disable explicitly.
 - Drop local variable cpu in aplic_get_cpu_from_mask():
   Use cpu_online_map instead of cpu_possible_map.
   Remame possible_mask to mask.
 - Code style fixes.
 - Move spin_lock(&aplic.lock) down before write to the register in aplic_set_irq_affinity.
 - Make aplic_host_irq_type const.
 - imsic_local_eix_update() updates:
   - move unsigned long isel, ireg; to inner loop.
   - Drop unnecessary parentheses.
   - Optimize inner loop of ireg's setting.
 - Drop aplic_irq_ack() and aplic_host_irq_end() as they do nothing.
 - Rename s/hwirq/irq.
 - Add explanatory comment to imsic_irq_enable() about why there is not -1 for IRQ in
   comparison with APLIC's sourcecfg.
 - Use IMSIC_MMIO_PAGE_SHIFT instead of constant 12 in aplic_set_irq_affinity().
 - s/aplic_host_irq_type/aplic_xen_irq_type
 - Drop set/clear of IRQ_DISABLED bit in aplic_{enable,disable}() as guest will always
   first request an interrupt and then only an interrupt will be enabled.
   (for example, in Arm, the physical interrupts would be enabled when the
   interrupt is initially routed. This could lead to problem because the guest
   will usually boot with interrupt disabled.)
---
 xen/arch/riscv/aplic-priv.h        |   4 +
 xen/arch/riscv/aplic.c             | 113 +++++++++++++++++++++++++++++
 xen/arch/riscv/imsic.c             | 104 ++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/aplic.h |   4 +-
 xen/arch/riscv/include/asm/imsic.h |  18 +++++
 5 files changed, 242 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/aplic-priv.h b/xen/arch/riscv/aplic-priv.h
index 8a208dba8a..a6cfed4ee0 100644
--- a/xen/arch/riscv/aplic-priv.h
+++ b/xen/arch/riscv/aplic-priv.h
@@ -14,6 +14,7 @@
 #ifndef ASM__RISCV_PRIV_APLIC_H
 #define ASM__RISCV_PRIV_APLIC_H
 
+#include <xen/spinlock.h>
 #include <xen/types.h>
 
 #include <asm/aplic.h>
@@ -27,6 +28,9 @@ struct aplic_priv {
     /* registers */
     volatile struct aplic_regs *regs;
 
+    /* lock */
+    spinlock_t lock;
+
     /* imsic configuration */
     const struct imsic_config *imsic_cfg;
 };
diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 797e5df020..e2bee7ad23 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -15,6 +15,7 @@
 #include <xen/irq.h>
 #include <xen/mm.h>
 #include <xen/sections.h>
+#include <xen/spinlock.h>
 #include <xen/types.h>
 #include <xen/vmap.h>
 
@@ -23,6 +24,7 @@
 #include <asm/device.h>
 #include <asm/imsic.h>
 #include <asm/intc.h>
+#include <asm/io.h>
 #include <asm/riscv_encoding.h>
 
 #define APLIC_DEFAULT_PRIORITY  1
@@ -119,9 +121,118 @@ static int __init cf_check aplic_init(void)
     return 0;
 }
 
+static void aplic_irq_enable(struct irq_desc *desc)
+{
+    unsigned long flags;
+
+    /*
+     * TODO: Currently, APLIC is supported only with MSI interrupts.
+     *       If APLIC without MSI interrupts is required in the future,
+     *       this function will need to be updated accordingly.
+     */
+    ASSERT(readl(&aplic.regs->domaincfg) & APLIC_DOMAINCFG_DM);
+
+    ASSERT(spin_is_locked(&desc->lock));
+
+    spin_lock_irqsave(&aplic.lock, flags);
+
+    /* Enable interrupt in IMSIC */
+    imsic_irq_enable(desc->irq);
+
+    /* Enable interrupt in APLIC */
+    writel(desc->irq, &aplic.regs->setienum);
+
+    spin_unlock_irqrestore(&aplic.lock, flags);
+}
+
+static void aplic_irq_disable(struct irq_desc *desc)
+{
+    unsigned long flags;
+
+    /*
+     * TODO: Currently, APLIC is supported only with MSI interrupts.
+     *       If APLIC without MSI interrupts is required in the future,
+     *       this function will need to be updated accordingly.
+     */
+    ASSERT(readl(&aplic.regs->domaincfg) & APLIC_DOMAINCFG_DM);
+
+    ASSERT(spin_is_locked(&desc->lock));
+
+    spin_lock_irqsave(&aplic.lock, flags);
+
+    /* disable interrupt in APLIC */
+    writel(desc->irq, &aplic.regs->clrienum);
+
+    /* disable interrupt in IMSIC */
+    imsic_irq_disable(desc->irq);
+
+    spin_unlock_irqrestore(&aplic.lock, flags);
+}
+
+static unsigned int aplic_irq_startup(struct irq_desc *desc)
+{
+    aplic_irq_enable(desc);
+
+    return 0;
+}
+
+static unsigned int aplic_get_cpu_from_mask(const cpumask_t *cpumask)
+{
+    cpumask_t mask;
+
+    cpumask_and(&mask, cpumask, &cpu_online_map);
+
+    return cpumask_any(&mask);
+}
+
+static void aplic_set_irq_affinity(struct irq_desc *desc, const cpumask_t *mask)
+{
+    unsigned int cpu;
+    uint64_t group_index, base_ppn;
+    uint32_t hhxw, lhxw ,hhxs, value;
+    const struct imsic_config *imsic = aplic.imsic_cfg;
+
+    /*
+     * TODO: Currently, APLIC is supported only with MSI interrupts.
+     *       If APLIC without MSI interrupts is required in the future,
+     *       this function will need to be updated accordingly.
+     */
+    ASSERT(readl(&aplic.regs->domaincfg) & APLIC_DOMAINCFG_DM);
+
+    ASSERT(!cpumask_empty(mask));
+
+    cpu = cpuid_to_hartid(aplic_get_cpu_from_mask(mask));
+    hhxw = imsic->group_index_bits;
+    lhxw = imsic->hart_index_bits;
+    hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
+    base_ppn = imsic->msi[cpu].base_addr >> IMSIC_MMIO_PAGE_SHIFT;
+
+    /* Update hart and EEID in the target register */
+    group_index = (base_ppn >> (hhxs + IMSIC_MMIO_PAGE_SHIFT)) & (BIT(hhxw, UL) - 1);
+    value = desc->irq;
+    value |= cpu << APLIC_TARGET_HART_IDX_SHIFT;
+    value |= group_index << (lhxw + APLIC_TARGET_HART_IDX_SHIFT) ;
+
+    spin_lock(&aplic.lock);
+
+    writel(value, &aplic.regs->target[desc->irq - 1]);
+
+    spin_unlock(&aplic.lock);
+}
+
+static const hw_irq_controller aplic_xen_irq_type = {
+    .typename     = "aplic",
+    .startup      = aplic_irq_startup,
+    .shutdown     = aplic_irq_disable,
+    .enable       = aplic_irq_enable,
+    .disable      = aplic_irq_disable,
+    .set_affinity = aplic_set_irq_affinity,
+};
+
 static struct intc_hw_operations __ro_after_init aplic_ops = {
     .info                = &aplic_info,
     .init                = aplic_init,
+    .host_irq_type       = &aplic_xen_irq_type,
 };
 
 static int cf_check aplic_irq_xlate(const uint32_t *intspec,
@@ -159,6 +270,8 @@ static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
 
     dt_irq_xlate = aplic_irq_xlate;
 
+    spin_lock_init(&aplic.lock);
+
     register_intc_ops(&aplic_ops);
 
     return 0;
diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 43d0c92cbd..70316d2e97 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -9,17 +9,116 @@
  * (c) Vates
  */
 
+#include <xen/bitops.h>
 #include <xen/const.h>
 #include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/macros.h>
+#include <xen/spinlock.h>
 #include <xen/xmalloc.h>
 
 #include <asm/imsic.h>
 
+#define IMSIC_DISABLE_EIDELIVERY    0
+#define IMSIC_ENABLE_EIDELIVERY     1
+#define IMSIC_DISABLE_EITHRESHOLD   1
+#define IMSIC_ENABLE_EITHRESHOLD    0
+
 static struct imsic_config imsic_cfg;
 
+#define imsic_csr_write(c, v)   \
+do {                            \
+    csr_write(CSR_SISELECT, c); \
+    csr_write(CSR_SIREG, v);    \
+} while (0)
+
+#define imsic_csr_set(c, v)     \
+do {                            \
+    csr_write(CSR_SISELECT, c); \
+    csr_set(CSR_SIREG, v);      \
+} while (0)
+
+#define imsic_csr_clear(c, v)   \
+do {                            \
+    csr_write(CSR_SISELECT, c); \
+    csr_clear(CSR_SIREG, v);    \
+} while (0)
+
+void __init imsic_ids_local_delivery(bool enable)
+{
+    if ( enable )
+    {
+        imsic_csr_write(IMSIC_EITHRESHOLD, IMSIC_ENABLE_EITHRESHOLD);
+        imsic_csr_write(IMSIC_EIDELIVERY, IMSIC_ENABLE_EIDELIVERY);
+    }
+    else
+    {
+        imsic_csr_write(IMSIC_EITHRESHOLD, IMSIC_DISABLE_EITHRESHOLD);
+        imsic_csr_write(IMSIC_EIDELIVERY, IMSIC_DISABLE_EIDELIVERY);
+    }
+}
+
+static void imsic_local_eix_update(unsigned long base_id, unsigned long num_id,
+                                   bool pend, bool val)
+{
+    unsigned long id = base_id, last_id = base_id + num_id;
+
+    while ( id < last_id )
+    {
+        unsigned long isel, ireg;
+        unsigned long start_id = id & (__riscv_xlen - 1);
+        unsigned long chunk = __riscv_xlen - start_id;
+        unsigned long count = (last_id - id < chunk) ? last_id - id : chunk;
+
+        isel = id / __riscv_xlen;
+        isel *= __riscv_xlen / IMSIC_EIPx_BITS;
+        isel += pend ? IMSIC_EIP0 : IMSIC_EIE0;
+
+        ireg = GENMASK(start_id + count - 1, start_id);
+
+        id += count;
+
+        if ( val )
+            imsic_csr_set(isel, ireg);
+        else
+            imsic_csr_clear(isel, ireg);
+    }
+}
+
+void imsic_irq_enable(unsigned int irq)
+{
+    unsigned long flags;
+
+    spin_lock_irqsave(&imsic_cfg.lock, flags);
+    /*
+     * There is no irq - 1 here (look at aplic_set_irq_type()) because:
+     * From the spec:
+     *   When an interrupt file supports distinct interrupt identities,
+     *   valid identity numbers are between 1 and inclusive. The identity
+     *   numbers within this range are said to be implemented by the interrupt
+     *   file; numbers outside this range are not implemented. The number zero
+     *   is never a valid interrupt identity.
+     *   ...
+     *   Bit positions in a valid eiek register that don’t correspond to a
+     *   supported interrupt identity (such as bit 0 of eie0) are read-only zeros.
+     *
+     * So in EIx registers interrupt i corresponds to bit i in comparison wiht
+     * APLIC's sourcecfg which starts from 0. (l)
+     */
+    imsic_local_eix_update(irq, 1, false, true);
+    spin_unlock_irqrestore(&imsic_cfg.lock, flags);
+}
+
+void imsic_irq_disable(unsigned int irq)
+{
+    unsigned long flags;
+
+    spin_lock_irqsave(&imsic_cfg.lock, flags);
+    imsic_local_eix_update(irq, 1, false, false);
+    spin_unlock_irqrestore(&imsic_cfg.lock, flags);
+}
+
 /* Callers aren't expected to changed imsic_cfg so return const. */
 const struct imsic_config *imsic_get_config(void)
 {
@@ -274,6 +373,11 @@ int __init imsic_init(const struct dt_device_node *node)
         goto imsic_init_err;
     }
 
+    spin_lock_init(&imsic_cfg.lock);
+
+    /* Enable local interrupt delivery */
+    imsic_ids_local_delivery(true);
+
     return 0;
 
  imsic_init_err:
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index 6221030a68..dc4ccbb9aa 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: MIT */
 
 /*
- * xen/arch/riscv/asm/include/aplic.h
+ * xen/arch/riscv/aplic.h
  *
  * RISC-V Advanced Platform-Level Interrupt Controller support
  *
@@ -18,6 +18,8 @@
 #define APLIC_DOMAINCFG_IE      BIT(8, UL)
 #define APLIC_DOMAINCFG_DM      BIT(2, UL)
 
+#define APLIC_TARGET_HART_IDX_SHIFT 18
+
 struct aplic_regs {
     uint32_t domaincfg;
     uint32_t sourcecfg[1023];
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index ed51cac780..1d6ab4d685 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -11,6 +11,7 @@
 #ifndef ASM__RISCV__IMSIC_H
 #define ASM__RISCV__IMSIC_H
 
+#include <xen/spinlock.h>
 #include <xen/types.h>
 
 #define IMSIC_MMIO_PAGE_SHIFT   12
@@ -19,6 +20,15 @@
 #define IMSIC_MIN_ID            63
 #define IMSIC_MAX_ID            2047
 
+#define IMSIC_EIDELIVERY        0x70
+
+#define IMSIC_EITHRESHOLD       0x72
+
+#define IMSIC_EIP0              0x80
+#define IMSIC_EIPx_BITS         32
+
+#define IMSIC_EIE0              0xC0
+
 struct imsic_msi {
     paddr_t base_addr;
     unsigned long offset;
@@ -55,6 +65,9 @@ struct imsic_config {
 
     /* MSI */
     struct imsic_msi *msi;
+
+    /* lock */
+    spinlock_t lock;
 };
 
 struct dt_device_node;
@@ -62,4 +75,9 @@ int imsic_init(const struct dt_device_node *node);
 
 const struct imsic_config *imsic_get_config(void);
 
+void imsic_irq_enable(unsigned int hwirq);
+void imsic_irq_disable(unsigned int hwirq);
+
+void imsic_ids_local_delivery(bool enable);
+
 #endif /* ASM__RISCV__IMSIC_H */
-- 
2.49.0



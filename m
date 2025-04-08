Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1A4A81122
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 18:01:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942606.1341756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BOF-0004jg-Cj; Tue, 08 Apr 2025 16:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942606.1341756; Tue, 08 Apr 2025 16:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BOF-0004ga-7a; Tue, 08 Apr 2025 16:01:31 +0000
Received: by outflank-mailman (input) for mailman id 942606;
 Tue, 08 Apr 2025 16:01:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4Vq=W2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u2BKW-0004Yq-Jf
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 15:57:40 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30a2b2f0-1492-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 17:57:36 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ac29af3382dso936870166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 08:57:36 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7c018556bsm929934566b.156.2025.04.08.08.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 08:57:34 -0700 (PDT)
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
X-Inumbo-ID: 30a2b2f0-1492-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744127855; x=1744732655; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obosTziijTFYXfPLbOAwqyMHx7uiRBVtztO5FdIKDt0=;
        b=WTecgZ75a8WNbXJ4hgvY9ID1Hs5jEjE/lJzgKv7ikrrSjl1SeDFDG14YKzlAISkhCX
         P26IEAlpsPnuow0Oui6GPe6qHtFpRx6B75FaKkmSyWMoF1LJka7lFUxASvPWmR3yD/Cx
         vFyI2BsXXJNXoQQJvrtxwrVubJITjmBd1lp4Xe61SQe4tKvPsg0604Vq5vpr35IV7QLD
         5WBRDL5mQMoPMk1pDqpWiztjBRJShbHDfG1fZl7T8XqJ2yOZ2UbKrVR1FIwZiAVI9F/w
         f8LTr1QV0rB45O+O5qZUFgK7Qb2rnJiUIvGfaD8UyMnhgHUqSSfpWYUelCB1dLh+nS5w
         gRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127855; x=1744732655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=obosTziijTFYXfPLbOAwqyMHx7uiRBVtztO5FdIKDt0=;
        b=KEiTAQpmWcSpcQoVoi3lJ0rgSpypYJc6/YBRqnDC47iCNjUBmiPfHXIsaSzNwn22uS
         fzHsSIsT4koco61/AhzlVo+0SOd9RQizmOfcCPr3Ie9Vt1VOcQ+SkMGninV0i+FuHZJR
         nrTUi2GkiOEvxuQ4v4BJSZ6234XYtZhAcjgS9p9XBvpW6Ib4FjaaeEhRnzTDwNVFs7+m
         pWcbV6SSppn0h3dshmlMR97CfYrpQiofMHO2pMTM4PpedznVtoQitAH/nXoLLP2lxrxL
         bv9QYuYXAjezfLtt8kiSwntvMs1EQvq7eL2uq77v7lftA4aT9PuGiylICeISdttkSbFb
         lWQw==
X-Gm-Message-State: AOJu0Yx4Laz8P1v5nka0ZCPzvWePg1Z5HFtDJDiEvcJk7fx1WQUOX4Pc
	pSIcGHjc4/lt+mO6VchYDcUweyL0XBQ3Cv4h25NtYVLwij8RqnyEkJCTvA==
X-Gm-Gg: ASbGnctUFOMTA+PikQd6582BsnDomEfClj3ljVDWbJSI8Xp/VZ0fIUlP9jiBuWsd+0v
	YekJu7Jrcsn/KHJrSidFD0IT1FTMH5UyNowZuYG1Y80sEyjQO4qD4SxvEyt62T/xqWpHjReofp0
	uXqIw62kpLoeSmULzh6n3TxhWQjixXFuGHD62ldBlh2rd+K/z9+TCwDKyYrp+pWXwnp5XhYaudY
	y3wp9vv9kUgTrQ6V9UQfvJJdGjyaHnH+xHiKOo0VyjQn/HeNw76tgH559yHGuuyv54fJuefAMKP
	ZqMM/AzhN9GAc9JMBeiHQsP8bwuUMVj6eS5DvkyIj8NJFryzoNanCpekG6TEKCzubqwHNx1xmlU
	Ihe02CkwAEQkIYw==
X-Google-Smtp-Source: AGHT+IEGspGPs+MME//LE3RWoyJqDPz+WYmt7DGj67vMc+ReaBhJ3Bcm6MIfxc1z+iw9GyXf45JObA==
X-Received: by 2002:a17:907:724f:b0:ac2:cdcb:6a85 with SMTP id a640c23a62f3a-ac7d6d2b3f4mr1436812166b.22.1744127855300;
        Tue, 08 Apr 2025 08:57:35 -0700 (PDT)
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
Subject: [PATCH v1 10/14] xen/riscv: implementation of aplic and imsic operations
Date: Tue,  8 Apr 2025 17:57:15 +0200
Message-ID: <74a07ed7c596bbcf581010685e01bfdfa19164f5.1744126720.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744126720.git.oleksii.kurochko@gmail.com>
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce interrupt controller descriptor for host APLIC to describe
the low-lovel hardare. It includes implementation of the following functions:
 - aplic_irq_startup()
 - aplic_irq_shutdown()
 - aplic_irq_enable()
 - aplic_irq_disable()
 - aplic_irq_ack()
 - aplic_host_irq_end()
 - aplic_set_irq_affinity()

As APLIC is used in MSI mode it requires to enable/disable interrupts not
only for APLIC but also for IMSIC. Thereby for the purpose of
aplic_irq_{enable,disable}() it is introduced imsic_irq_{enable,disable)().

For the purpose of aplic_set_irq_affinity() aplic_get_cpu_from_mask() is
introduced to get hart id.

Also, introduce additional interrupt controller h/w operations and
host_irq_type for APLIC:
 - aplic_host_irq_type
 - aplic_set_irq_priority()
 - aplic_set_irq_type()

Patch is based on the code from [1].

[1] https://gitlab.com/xen-project/people/olkur/xen/-/commit/7390e2365828b83e27ead56b03114a56e3699dd5

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/aplic.c             | 169 ++++++++++++++++++++++++++++-
 xen/arch/riscv/imsic.c             |  63 +++++++++++
 xen/arch/riscv/include/asm/aplic.h |  12 ++
 xen/arch/riscv/include/asm/imsic.h |  15 +++
 4 files changed, 258 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index d1aa835c3e..4b60cb9a77 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -15,6 +15,7 @@
 #include <xen/irq.h>
 #include <xen/mm.h>
 #include <xen/sections.h>
+#include <xen/spinlock.h>
 #include <xen/types.h>
 #include <xen/vmap.h>
 
@@ -110,9 +111,173 @@ static int __init aplic_init(void)
     return 0;
 }
 
-static const struct intc_hw_operations __ro_after_init aplic_ops = {
+static void aplic_set_irq_type(struct irq_desc *desc, unsigned int type)
+{
+    unsigned int irq = desc->irq - 1;
+
+    spin_lock(&aplic.lock);
+    switch(type) {
+        case IRQ_TYPE_EDGE_RISING:
+            aplic.regs->sourcecfg[irq] = APLIC_SOURCECFG_SM_EDGE_RISE;
+            break;
+        case IRQ_TYPE_EDGE_FALLING:
+            aplic.regs->sourcecfg[irq] = APLIC_SOURCECFG_SM_EDGE_FALL;
+            break;
+        case IRQ_TYPE_LEVEL_HIGH:
+            aplic.regs->sourcecfg[irq] = APLIC_SOURCECFG_SM_LEVEL_HIGH;
+            break;
+        case IRQ_TYPE_LEVEL_LOW:
+            aplic.regs->sourcecfg[irq] = APLIC_SOURCECFG_SM_LEVEL_LOW;
+            break;
+        default:
+            aplic.regs->sourcecfg[irq] = APLIC_SOURCECFG_SM_INACTIVE;
+            break;
+    }
+    spin_unlock(&aplic.lock);
+}
+
+static void aplic_set_irq_priority(struct irq_desc *desc,
+                                   unsigned int priority)
+{
+    /* No priority, do nothing */
+}
+
+static void aplic_irq_enable(struct irq_desc *desc)
+{
+    unsigned long flags;
+
+    /*
+     * TODO: Currently, APLIC is supported only with MSI interrupts.
+     *       If APLIC without MSI interrupts is required in the future,
+     *       this function will need to be updated accordingly.
+     */
+    ASSERT(aplic.imsic_cfg->is_used);
+
+    ASSERT(spin_is_locked(&desc->lock));
+
+    spin_lock_irqsave(&aplic.lock, flags);
+
+    clear_bit(_IRQ_DISABLED, &desc->status);
+
+    /* enable interrupt in IMSIC */
+    imsic_irq_enable(desc->irq);
+
+    /* enable interrupt in APLIC */
+    aplic.regs->setienum = desc->irq;
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
+    ASSERT(aplic.imsic_cfg->is_used);
+
+    ASSERT(spin_is_locked(&desc->lock));
+
+    spin_lock_irqsave(&aplic.lock, flags);
+
+    set_bit(_IRQ_DISABLED, &desc->status);
+
+    /* disable interrupt in APLIC */
+    aplic.regs->clrienum = desc->irq;
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
+static void aplic_irq_shutdown(struct irq_desc *desc)
+{
+    aplic_irq_disable(desc);
+}
+
+static void aplic_irq_ack(struct irq_desc *desc)
+{
+    /* nothing to do */
+}
+
+static void aplic_host_irq_end(struct irq_desc *desc)
+{
+    /* nothing to do */
+}
+
+static unsigned int aplic_get_cpu_from_mask(const cpumask_t *cpumask)
+{
+    unsigned int cpu;
+    cpumask_t possible_mask;
+
+    cpumask_and(&possible_mask, cpumask, &cpu_possible_map);
+    cpu = cpumask_any(&possible_mask);
+
+    return cpu;
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
+    ASSERT(aplic.imsic_cfg->is_used);
+
+    ASSERT(!cpumask_empty(mask));
+
+    spin_lock(&aplic.lock);
+
+    cpu = cpuid_to_hartid(aplic_get_cpu_from_mask(mask));
+    hhxw = imsic->group_index_bits;
+    lhxw = imsic->hart_index_bits;
+    hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
+    base_ppn = imsic->msi[cpu].base_addr >> IMSIC_MMIO_PAGE_SHIFT;
+
+    /* update hart and EEID in the target register */
+    group_index = (base_ppn >> (hhxs + 12)) & (BIT(hhxw, UL) - 1);
+    value = desc->irq;
+    value |= cpu << APLIC_TARGET_HART_IDX_SHIFT;
+    value |= group_index << (lhxw + APLIC_TARGET_HART_IDX_SHIFT) ;
+    aplic.regs->target[desc->irq - 1] = value;
+
+    spin_unlock(&aplic.lock);
+}
+
+static hw_irq_controller aplic_host_irq_type = {
+    .typename     = "aplic",
+    .startup      = aplic_irq_startup,
+    .shutdown     = aplic_irq_shutdown,
+    .enable       = aplic_irq_enable,
+    .disable      = aplic_irq_disable,
+    .ack          = aplic_irq_ack,
+    .end          = aplic_host_irq_end,
+    .set_affinity = aplic_set_irq_affinity,
+};
+
+static const struct intc_hw_operations aplic_ops = {
     .info                = &aplic_info,
     .init                = aplic_init,
+    .host_irq_type       = &aplic_host_irq_type,
+    .set_irq_priority    = aplic_set_irq_priority,
+    .set_irq_type        = aplic_set_irq_type,
 };
 
 static int aplic_irq_xlate(const uint32_t *intspec, unsigned int intsize,
@@ -149,6 +314,8 @@ static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
 
     dt_irq_xlate = aplic_irq_xlate;
 
+    spin_lock_init(&aplic.lock);
+
     register_intc_ops(&aplic_ops);
 
     return 0;
diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 99def9af2d..8198d008ef 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -14,12 +14,68 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/macros.h>
+#include <xen/spinlock.h>
 #include <xen/xmalloc.h>
 
 #include <asm/imsic.h>
 
 static struct imsic_config imsic_cfg;
 
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
+static void imsic_local_eix_update(unsigned long base_id, unsigned long num_id,
+                                   bool pend, bool val)
+{
+    unsigned long i, isel, ireg;
+    unsigned long id = base_id, last_id = base_id + num_id;
+
+    while ( id < last_id )
+    {
+        isel = id / __riscv_xlen;
+        isel *= __riscv_xlen / IMSIC_EIPx_BITS;
+        isel += (pend) ? IMSIC_EIP0 : IMSIC_EIE0;
+
+        ireg = 0;
+        for ( i = id & (__riscv_xlen - 1);
+              (id < last_id) && (i < __riscv_xlen);
+              i++, id++ )
+            ireg |= (1 << i);
+
+        if ( val )
+            imsic_csr_set(isel, ireg);
+        else
+            imsic_csr_clear(isel, ireg);
+    }
+}
+
+void imsic_irq_enable(unsigned int hwirq)
+{
+    unsigned long flags;
+
+    spin_lock_irqsave(&imsic_cfg.lock, flags);
+    imsic_local_eix_update(hwirq, 1, false, true);
+    spin_unlock_irqrestore(&imsic_cfg.lock, flags);
+}
+
+void imsic_irq_disable(unsigned int hwirq)
+{
+    unsigned long flags;
+
+    spin_lock_irqsave(&imsic_cfg.lock, flags);
+    imsic_local_eix_update(hwirq, 1, false, false);
+    spin_unlock_irqrestore(&imsic_cfg.lock, flags);
+}
+
 const struct imsic_config *imsic_get_config(void)
 {
     return &imsic_cfg;
@@ -277,6 +333,13 @@ int __init imsic_init(struct dt_device_node *node)
         goto imsic_init_err;
     }
 
+    spin_lock_init(&imsic_cfg.lock);
+
+    /* Enable local interrupt delivery */
+    imsic_ids_local_delivery(true);
+
+    imsic_cfg.is_used = true;
+
     return 0;
 
 imsic_init_err:
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index 94b3d0b616..ce858663a9 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -18,6 +18,15 @@
 #define APLIC_DOMAINCFG_IE      BIT(8, UL)
 #define APLIC_DOMAINCFG_DM      BIT(2, UL)
 
+#define APLIC_SOURCECFG_SM_INACTIVE     0x0
+#define APLIC_SOURCECFG_SM_DETACH       0x1
+#define APLIC_SOURCECFG_SM_EDGE_RISE    0x4
+#define APLIC_SOURCECFG_SM_EDGE_FALL    0x5
+#define APLIC_SOURCECFG_SM_LEVEL_HIGH   0x6
+#define APLIC_SOURCECFG_SM_LEVEL_LOW    0x7
+
+#define APLIC_TARGET_HART_IDX_SHIFT 18
+
 struct aplic_regs {
     uint32_t domaincfg;
     uint32_t sourcecfg[1023];
@@ -70,6 +79,9 @@ struct aplic_priv {
     /* registers */
     volatile struct aplic_regs *regs;
 
+    /* lock */
+    spinlock_t lock;
+
     /* imsic configuration */
     const struct imsic_config *imsic_cfg;
 };
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 126e651863..d2c0178529 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -11,6 +11,7 @@
 #ifndef ASM__RISCV__IMSIC_H
 #define ASM__RISCV__IMSIC_H
 
+#include <xen/spinlock.h>
 #include <xen/types.h>
 
 #define IMSIC_MMIO_PAGE_SHIFT   12
@@ -19,6 +20,11 @@
 #define IMSIC_MIN_ID            63
 #define IMSIC_MAX_ID            2048
 
+#define IMSIC_EIP0              0x80
+#define IMSIC_EIPx_BITS         32
+
+#define IMSIC_EIE0              0xC0
+
 struct imsic_msi {
     paddr_t base_addr;
     unsigned long offset;
@@ -55,6 +61,12 @@ struct imsic_config {
 
     /* MSI */
     struct imsic_msi msi[NR_CPUS];
+
+    /* a check that IMSIC is used */
+    bool is_used;
+
+    /* lock */
+    spinlock_t lock;
 };
 
 struct dt_device_node;
@@ -63,4 +75,7 @@ int imsic_init(struct dt_device_node *n);
 struct imsic_config;
 const struct imsic_config *imsic_get_config(void);
 
+void imsic_irq_enable(unsigned int hwirq);
+void imsic_irq_disable(unsigned int hwirq);
+
 #endif /* ASM__RISCV__IMSIC_H */
-- 
2.49.0



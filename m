Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F569AD91D7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:49:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014631.1392790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6eS-0008SR-Fr; Fri, 13 Jun 2025 15:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014631.1392790; Fri, 13 Jun 2025 15:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6eS-0008PR-Ax; Fri, 13 Jun 2025 15:49:08 +0000
Received: by outflank-mailman (input) for mailman id 1014631;
 Fri, 13 Jun 2025 15:49:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44KY=Y4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uQ6eQ-0006cn-Mp
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:49:06 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eeedc302-486d-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 17:49:04 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-60179d8e65fso4105643a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 08:49:04 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec8979563sm144821766b.158.2025.06.13.08.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 08:49:03 -0700 (PDT)
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
X-Inumbo-ID: eeedc302-486d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749829744; x=1750434544; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/DsIO3qh5Ntrrl6zJ6YNrhw7LFSUgr7qK7gHk29IDc=;
        b=VPp97P1smG4CK7K+VOcY6AupL664WNnn37ifzRD9lhnUSYtXcmhrw/T1QutJ8tQ+C6
         Z1IuWuBvv1++oYNoTKcrOt14xT1bgKFo2ZyY2Wh+8IeBohPoUuQY6jBAChNIP39dgMOP
         dtMyabKPs3DDZ7pnzQup3KOl0Q8IuXLS0YfSRNLWDdG14/pIcyoNbTzmzMHjJNaq2tLM
         KUaefwL88J1pFesCrG3gd+ZXNwCS6PJBPsSGVAqMUtjDRQ8jM6LbkAcOxGN5aH+yQkv3
         uTu26WIW+rIsq3jPAYhluYw3H8gp8YXJLDfRC8hPWKmBuhTKwMoLhZbK9LgESe0E5xUY
         wKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749829744; x=1750434544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/DsIO3qh5Ntrrl6zJ6YNrhw7LFSUgr7qK7gHk29IDc=;
        b=iJ24cnX6Nqf0JqJjCGbwyVhRJw0FGnzaYGaDtUzHUKxvyTuV/bqLrd/2gA6yEJbmok
         iIJjXf5hjbsY3CvP67wqcxsPJbFxi0XR7fOVXX8/Vj/WAi3oOzDxcCuqz9g6CGg9SQiX
         fNyLkMbOaR3jxDTu6v/9Js3oVbZCmeLEjXWFSoTuuPFyScgBla27urPzCpjWWIMNoq6L
         90ER+envSM3zfjvL/a9Bf9gaHOuUmyPueshrUVD75fcxBWu1Tr6rSVo3xFdbiYP3AkaX
         c7rysHCPxTKerMmWWRP6KjftSl8UvnGCvsD7sNk5to6LRO99Y0PtMKQzfg0xhiOmm9my
         Npnw==
X-Gm-Message-State: AOJu0YxBl28c52f6Ud7dGiUGpR6XT47EI6KEj+AFCYTTwCblkPaKGatA
	m9LvomdHc6Y06pKZZszqsFquBnRPECUmc5mneplkpHX22zdhZ5YRJEIYHcf/ew==
X-Gm-Gg: ASbGncsP1HA7dHdSFwtJnfbOPD8LSmgsrUi6a27eo43cL5nKuye9ymYV9+fi8vU/K3y
	XE5MC1wKKeR3nKISJgcyXFh4ul+7dVSXLTJkml2oS0J2DK+e3vCZaDQp0aUkwqd67z7tDInGJIZ
	O64CuQ7n7T8Z6djZlJNu+j8EjHJTWndEjX98W1HId0jDgVIyA0O3ce9VM8u9Ap96Yu3YtlyB5Ot
	7AUsePIlZpoKWqlKiHQiaBLxMGfc9Dc9S4HMWR8aao63DePhd6KVFiAhKUBklzu/kDKqV248Psj
	c+UjaM9gzxPeLlwxFhiJ8GPH9OFkmHaBF7lR6QhMUAQ17WeM+KRzn6yJwERTcpheWbuITFdMDUa
	Me0Iaf/JaUtnUQvSMhEGHux+11wFd
X-Google-Smtp-Source: AGHT+IGlilzWBOcrIk6xEzKjUhSp6Kry2hvDfxLl3QVs8wBkT2joe9NOgm6f8whQnW4t8+ONJnpuMw==
X-Received: by 2002:a17:907:7e8e:b0:ade:3015:534e with SMTP id a640c23a62f3a-adec5454bddmr368512266b.14.1749829743631;
        Fri, 13 Jun 2025 08:49:03 -0700 (PDT)
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
Subject: [PATCH v5 6/9] xen/riscv: implementation of aplic and imsic operations
Date: Fri, 13 Jun 2025 17:48:45 +0200
Message-ID: <47ca7a83e6320547378bb8bc690f5309a6eaf53c.1749825782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749825782.git.oleksii.kurochko@gmail.com>
References: <cover.1749825782.git.oleksii.kurochko@gmail.com>
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in V4:
 - Code style fixes.
 - Add cf_check for hook functions.
 - Use min() macros instead of open-coding it in imsic_local_eix_update().
 - Update the comment above ASSERT() in imsic_irq_disable():
   s/aplic_irq_enable/aplic_irq_disable.
 - Add an explanatory comment above initializing of hhxs in
   aplic_set_irq_affinity().
---
Changes in V3:
 - Update the lock above lock member of struct aplic_priv and imsic_config struct.
 - Use spin_{un}lock() in aplic_irq_{enable,disable}() as it is IRQ-safe.
   Also drop local variable 'flags'.
 - Add ASSERT(spin_is_locked(&desc->lock)) to aplic_set_irq_affinity() and
   aplic_set_irq_type().
 - Use an initializer instead of spin_lock_init() for aplic.lock.
 - Drop "(l)" in the comment in imsic_irq_enable() as it doesn't point to
   anything.
 - Use ASSERT(!local_irq_is_enabled()) + spin_lock() in imsic_irq_{enable,disable}().
 - Use an initializer instead of spin_lock_init() for imsic_config.lock.
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
 xen/arch/riscv/aplic.c             | 123 ++++++++++++++++++++++++++++-
 xen/arch/riscv/imsic.c             | 122 +++++++++++++++++++++++++++-
 xen/arch/riscv/include/asm/aplic.h |   2 +
 xen/arch/riscv/include/asm/imsic.h |  18 +++++
 5 files changed, 267 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/aplic-priv.h b/xen/arch/riscv/aplic-priv.h
index 7ed1ab8f4b..d377a7ac67 100644
--- a/xen/arch/riscv/aplic-priv.h
+++ b/xen/arch/riscv/aplic-priv.h
@@ -14,6 +14,7 @@
 #ifndef ASM_RISCV_PRIV_APLIC_H
 #define ASM_RISCV_PRIV_APLIC_H
 
+#include <xen/spinlock.h>
 #include <xen/types.h>
 
 #include <asm/aplic.h>
@@ -27,6 +28,9 @@ struct aplic_priv {
     /* registers */
     volatile struct aplic_regs __iomem *regs;
 
+    /* lock to protect access to APLIC's registers */
+    spinlock_t lock;
+
     /* imsic configuration */
     const struct imsic_config *imsic_cfg;
 };
diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index cc3e299212..f3f4a44649 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -15,6 +15,7 @@
 #include <xen/irq.h>
 #include <xen/mm.h>
 #include <xen/sections.h>
+#include <xen/spinlock.h>
 #include <xen/types.h>
 #include <xen/vmap.h>
 
@@ -23,11 +24,14 @@
 #include <asm/device.h>
 #include <asm/imsic.h>
 #include <asm/intc.h>
+#include <asm/io.h>
 #include <asm/riscv_encoding.h>
 
 #define APLIC_DEFAULT_PRIORITY  1
 
-static struct aplic_priv aplic;
+static struct aplic_priv aplic = {
+    .lock = SPIN_LOCK_UNLOCKED,
+};
 
 static struct intc_info __ro_after_init aplic_info = {
     .hw_version = INTC_APLIC,
@@ -116,9 +120,126 @@ static int __init cf_check aplic_init(void)
     return 0;
 }
 
+static void cf_check aplic_irq_enable(struct irq_desc *desc)
+{
+    /*
+     * TODO: Currently, APLIC is supported only with MSI interrupts.
+     *       If APLIC without MSI interrupts is required in the future,
+     *       this function will need to be updated accordingly.
+     */
+    ASSERT(readl(&aplic.regs->domaincfg) & APLIC_DOMAINCFG_DM);
+
+    ASSERT(spin_is_locked(&desc->lock));
+
+    spin_lock(&aplic.lock);
+
+    /* Enable interrupt in IMSIC */
+    imsic_irq_enable(desc->irq);
+
+    /* Enable interrupt in APLIC */
+    writel(desc->irq, &aplic.regs->setienum);
+
+    spin_unlock(&aplic.lock);
+}
+
+static void cf_check aplic_irq_disable(struct irq_desc *desc)
+{
+    /*
+     * TODO: Currently, APLIC is supported only with MSI interrupts.
+     *       If APLIC without MSI interrupts is required in the future,
+     *       this function will need to be updated accordingly.
+     */
+    ASSERT(readl(&aplic.regs->domaincfg) & APLIC_DOMAINCFG_DM);
+
+    ASSERT(spin_is_locked(&desc->lock));
+
+    spin_lock(&aplic.lock);
+
+    /* disable interrupt in APLIC */
+    writel(desc->irq, &aplic.regs->clrienum);
+
+    /* disable interrupt in IMSIC */
+    imsic_irq_disable(desc->irq);
+
+    spin_unlock(&aplic.lock);
+}
+
+static unsigned int cf_check aplic_irq_startup(struct irq_desc *desc)
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
+static void cf_check aplic_set_irq_affinity(struct irq_desc *desc, const cpumask_t *mask)
+{
+    unsigned int cpu;
+    uint64_t group_index, base_ppn;
+    uint32_t hhxw, lhxw, hhxs, value;
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
+    ASSERT(spin_is_locked(&desc->lock));
+
+    cpu = cpuid_to_hartid(aplic_get_cpu_from_mask(mask));
+    hhxw = imsic->group_index_bits;
+    lhxw = imsic->hart_index_bits;
+    /*
+     * Although this variable is used only once in the calculation of
+     * group_index, and it might seem that hhxs could be defined as:
+     *   hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT;
+     * and then the addition of IMSIC_MMIO_PAGE_SHIFT could be omitted
+     * when calculating the group index.
+     * It was done intentionally this way to follow the formula from
+     * the AIA specification for calculating the MSI address.
+     */
+    hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
+    base_ppn = imsic->msi[cpu].base_addr >> IMSIC_MMIO_PAGE_SHIFT;
+
+    /* Update hart and EEID in the target register */
+    group_index = (base_ppn >> (hhxs + IMSIC_MMIO_PAGE_SHIFT)) &
+                  (BIT(hhxw, UL) - 1);
+    value = desc->irq;
+    value |= cpu << APLIC_TARGET_HART_IDX_SHIFT;
+    value |= group_index << (lhxw + APLIC_TARGET_HART_IDX_SHIFT);
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
 static const struct intc_hw_operations aplic_ops = {
     .info                = &aplic_info,
     .init                = aplic_init,
+    .host_irq_type       = &aplic_xen_irq_type,
 };
 
 static int cf_check aplic_irq_xlate(const uint32_t *intspec,
diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index e7f06950de..674c9b7b41 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -29,7 +29,124 @@ struct imsic_mmios {
     unsigned long size;
 };
 
-static struct imsic_config imsic_cfg;
+static struct imsic_config imsic_cfg = {
+    .lock = SPIN_LOCK_UNLOCKED,
+};
+
+#define IMSIC_DISABLE_EIDELIVERY    0
+#define IMSIC_ENABLE_EIDELIVERY     1
+#define IMSIC_DISABLE_EITHRESHOLD   1
+#define IMSIC_ENABLE_EITHRESHOLD    0
+
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
+        unsigned long count = min(last_id - id, chunk);
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
+    /*
+    * The only caller of imsic_irq_enable() is aplic_irq_enable(), which
+    * already runs with IRQs disabled. Therefore, there's no need to use
+    * spin_lock_irqsave() in this function.
+    *
+    * This ASSERT is added as a safeguard: if imsic_irq_enable() is ever
+    * called from a context where IRQs are not disabled,
+    * spin_lock_irqsave() should be used instead of spin_lock().
+    */
+    ASSERT(!local_irq_is_enabled());
+
+    spin_lock(&imsic_cfg.lock);
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
+     * APLIC's sourcecfg which starts from 0.
+     */
+    imsic_local_eix_update(irq, 1, false, true);
+    spin_unlock(&imsic_cfg.lock);
+}
+
+void imsic_irq_disable(unsigned int irq)
+{
+   /*
+    * The only caller of imsic_irq_disable() is aplic_irq_disable(), which
+    * already runs with IRQs disabled. Therefore, there's no need to use
+    * spin_lock_irqsave() in this function.
+    *
+    * This ASSERT is added as a safeguard: if imsic_irq_disable() is ever
+    * called from a context where IRQs are not disabled,
+    * spin_lock_irqsave() should be used instead of spin_lock().
+    */
+    ASSERT(!local_irq_is_enabled());
+
+    spin_lock(&imsic_cfg.lock);
+    imsic_local_eix_update(irq, 1, false, false);
+    spin_unlock(&imsic_cfg.lock);
+}
 
 /* Callers aren't intended to changed imsic_cfg so return const. */
 const struct imsic_config *imsic_get_config(void)
@@ -355,6 +472,9 @@ int __init imsic_init(const struct dt_device_node *node)
         goto imsic_init_err;
     }
 
+    /* Enable local interrupt delivery */
+    imsic_ids_local_delivery(true);
+
     imsic_cfg.msi = msi;
 
     xvfree(mmios);
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index fea95d4369..c3f00238f2 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -18,6 +18,8 @@
 #define APLIC_DOMAINCFG_IE      BIT(8, U)
 #define APLIC_DOMAINCFG_DM      BIT(2, U)
 
+#define APLIC_TARGET_HART_IDX_SHIFT 18
+
 struct aplic_regs {
     uint32_t domaincfg;
     uint32_t sourcecfg[1023];
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 9cd12365b1..378e49d933 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -11,6 +11,7 @@
 #ifndef ASM_RISCV_IMSIC_H
 #define ASM_RISCV_IMSIC_H
 
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
@@ -45,6 +55,9 @@ struct imsic_config {
 
     /* MSI */
     const struct imsic_msi *msi;
+
+    /* Lock to protect access to IMSIC's stuff */
+    spinlock_t lock;
 };
 
 struct dt_device_node;
@@ -52,4 +65,9 @@ int imsic_init(const struct dt_device_node *node);
 
 const struct imsic_config *imsic_get_config(void);
 
+void imsic_irq_enable(unsigned int hwirq);
+void imsic_irq_disable(unsigned int hwirq);
+
+void imsic_ids_local_delivery(bool enable);
+
 #endif /* ASM_RISCV_IMSIC_H */
-- 
2.49.0



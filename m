Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B66AABFAA5
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 18:04:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992149.1376022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvS-00077p-JJ; Wed, 21 May 2025 16:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992149.1376022; Wed, 21 May 2025 16:04:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvS-00072R-7M; Wed, 21 May 2025 16:04:14 +0000
Received: by outflank-mailman (input) for mailman id 992149;
 Wed, 21 May 2025 16:04:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hkAn=YF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uHlvP-0004XB-QR
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 16:04:11 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bc76172-365d-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 18:04:11 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6021b8b2c5fso3307443a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 09:04:11 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d502736sm9152513a12.25.2025.05.21.09.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 09:04:09 -0700 (PDT)
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
X-Inumbo-ID: 3bc76172-365d-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747843450; x=1748448250; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQhS3BCzqDqg/tB23NlNGRPRQsd4AUHRLO+Tv6cvfi0=;
        b=WQn63EhU0CmO3pzuTz5HFjGVWoQARQ4/YzRrI1wfng+c8iiZ+jKAvhgow4favUB+Td
         nBrT8cIEqmc6h5oo6zpvCoP+YytFRhx1GFx6bQCYjvXpuFpKAQt83OVBneywuBBZ3h65
         mipQVUGt949HHYpNkTOHueAvyLlXgrWtoY2EuImrdvtaWLpW0cSte2pK9YymYI/OkU1L
         H1zVs+9Z6luqB5pid5oEHHtWjkTNPJ1b1nsIBi74oR4ZIZReVVlSc5O4uCDzFvIS3fZa
         yfvha6dEnu9n+7mNwlMHPYmwEep/NuPl7VKXiIUzrDv/uQth66FTK2RVaB/Xg4N+HCgL
         rtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747843450; x=1748448250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQhS3BCzqDqg/tB23NlNGRPRQsd4AUHRLO+Tv6cvfi0=;
        b=hTTIDti3cEbg/RFeX3aNZzPl1NnSWx/5h/CJ3EvmhGqsHrnPqkO1BzWXSOmS2vrqtc
         ihRLk4GZpcwwyByLIjsBSLq76ntLiK0fChvT4NrfwRsWChuN5PhKH7OReEzicN5y9eoD
         JLnwi5UOeERPGMC+9zWe4g+KCVIKAwCH9g/mx6bIC2EfWcNKO9ZV4TQUItEto1h7S01P
         SieTwjj/yrPy1naJ+5ywLK08EKiBCYwqzuSyCJOIZNgw3Wo7/Lslgufjnd59Cf+/LGS9
         DmDWsUXEFGxN9dPZxKgilvCg/F35NB9LXtULRtXZPzYqAWmJ6B1D9FX/KfZPLAXck7eN
         LeBA==
X-Gm-Message-State: AOJu0YyrqGs5crVMZoB/KkMvcVHOEUU9p6mihK5oypLxIw5FSFzaM99m
	qK/b6N7LkP4LEXPXFT/h0fgWzidKiBNMqXepynYX7rj0xZMiS+bBJS5FQ7k7zA==
X-Gm-Gg: ASbGncuDSpy/L7nuO7/+FUkfv/rfUlAItdbh5ogl1IHZErZfVILBfjcB/GJm+RU4zbR
	42nGIT1riP3+k6zdlIjKKi+5KqrC0jhYPiXgPvNmrFvuDDnSYxp+px2gRG1s1Zk+onpnvpwLwj5
	V8HsrumgezdgakCAgQTMavJ3BVsIal+x6xujLTs8gMIkzsHzTxw0rGdcfGUgARgkj8CKOm6e561
	5Lva6nTLnVlqzp9JZ4lrQONLP99Oq+EJnkfxJwtXblnxbGx82ZESrqzE6HA+GD1qf8NlBvDO0Gd
	2omm7gty7xJrHnJ6uI6u9BPiJdlEGc5Xa/AXz+PWYmpF+bhMWjlBKlI8waN8+5IZoHohrZJa9U1
	PM3mxrRNct1zPjSlf5mUUDSgQkjNh
X-Google-Smtp-Source: AGHT+IH39hYXIb36NxukRyZ0FCD1/8tPv5jNWN5kwqUkL9wUQ22UAZbcM9Ko8f8ZYyCtnPPOxjlYpg==
X-Received: by 2002:a05:6402:90a:b0:5fb:1cbb:9390 with SMTP id 4fb4d7f45d1cf-60090185bbamr17736230a12.33.1747843450125;
        Wed, 21 May 2025 09:04:10 -0700 (PDT)
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
Subject: [PATCH v3 11/14] xen/riscv: implementation of aplic and imsic operations
Date: Wed, 21 May 2025 18:03:51 +0200
Message-ID: <33f0952f0d05e4fe8fff926df31987e006c6eacf.1747843009.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747843009.git.oleksii.kurochko@gmail.com>
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 xen/arch/riscv/aplic.c             | 113 +++++++++++++++++++++++++-
 xen/arch/riscv/imsic.c             | 122 ++++++++++++++++++++++++++++-
 xen/arch/riscv/include/asm/aplic.h |   2 +
 xen/arch/riscv/include/asm/imsic.h |  18 +++++
 5 files changed, 257 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/aplic-priv.h b/xen/arch/riscv/aplic-priv.h
index e5f9f5fd90..cd7db2a9d2 100644
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
     volatile struct aplic_regs __iomem *regs;
 
+    /* lock to protect access to APLIC's registers */
+    spinlock_t lock;
+
     /* imsic configuration */
     const struct imsic_config *imsic_cfg;
 };
diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 069d157723..f48937ccc6 100644
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
@@ -30,7 +32,9 @@
 /* The maximum number of wired interrupt sources supported by APLIC domain. */
 #define APLIC_MAX_NUM_WIRED_IRQ_SOURCES 1023
 
-static struct aplic_priv aplic;
+static struct aplic_priv aplic = {
+    .lock = SPIN_LOCK_UNLOCKED,
+};
 
 static struct intc_info __ro_after_init aplic_info = {
     .hw_version = INTC_APLIC,
@@ -111,9 +115,116 @@ static int __init cf_check aplic_init(void)
     return 0;
 }
 
+static void aplic_irq_enable(struct irq_desc *desc)
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
+static void aplic_irq_disable(struct irq_desc *desc)
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
+    ASSERT(spin_is_locked(&desc->lock));
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
diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 9f8b492e97..2d139943c5 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -22,7 +22,124 @@
 
 #include <asm/imsic.h>
 
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
+    * The only caller of imsic_irq_disable() is aplic_irq_enable(), which
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
 
 /* Callers aren't expected to changed imsic_cfg so return const. */
 const struct imsic_config *imsic_get_config(void)
@@ -342,6 +459,9 @@ int __init imsic_init(const struct dt_device_node *node)
         goto imsic_init_err;
     }
 
+    /* Enable local interrupt delivery */
+    imsic_ids_local_delivery(true);
+
     return 0;
 
  imsic_init_err:
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index fef5f90a61..a814a36a82 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -18,6 +18,8 @@
 #define APLIC_DOMAINCFG_IE      BIT(8, UL)
 #define APLIC_DOMAINCFG_DM      BIT(2, UL)
 
+#define APLIC_TARGET_HART_IDX_SHIFT 18
+
 struct aplic_regs {
     uint32_t domaincfg;
     uint32_t sourcecfg[1023];
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 0d17881884..a0eba55f99 100644
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
+    /* Lock to protect access to IMSIC's stuff */
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



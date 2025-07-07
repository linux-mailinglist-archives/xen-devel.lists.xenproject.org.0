Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AEEAFAF22
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 11:02:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035346.1407622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYhji-0003T7-At; Mon, 07 Jul 2025 09:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035346.1407622; Mon, 07 Jul 2025 09:02:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYhji-0003Qa-6S; Mon, 07 Jul 2025 09:02:06 +0000
Received: by outflank-mailman (input) for mailman id 1035346;
 Mon, 07 Jul 2025 09:02:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ItPy=ZU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uYhjg-0002Us-7J
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 09:02:04 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c813108-5b11-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 11:02:03 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ae0b2ead33cso529556766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 02:02:03 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6b04d30sm662892766b.133.2025.07.07.02.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 02:02:01 -0700 (PDT)
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
X-Inumbo-ID: 0c813108-5b11-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751878922; x=1752483722; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Im3v+G5iueOyoCsC7RxF/TFrJwRh3zoea7PHoujND38=;
        b=N/Ov3hdmFBzaZPBZZGIl/h+nJcW2dabWpQZQSRWAIqiAaiFd/0yn5lGKilCudE92gc
         zfWl45a2pKenZFGcojEnrv2Q1KGjoUpFA58dKh40LL8Ww9c0z8TpLeRfX5f19AkD8u/k
         +DB0Lrb+1Z02P/pRpxRwh8g1QWKAuUPQLByqzQEJcws+RmE8EvOyCgQeUMaJCkoP+Wbi
         OCJVqnU1ltu/QmeQWNheO2WvDCYFhNA/Vzmf9wv+EjDxWIE4Y57z1iNU6PQQHTQS1Jez
         /J44c05uSlzrcb7YoDbcq1W3hB577DEg5rH7zAUEymyvY1FiL3CQf6rouEoBh0qVbXjo
         jQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751878922; x=1752483722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Im3v+G5iueOyoCsC7RxF/TFrJwRh3zoea7PHoujND38=;
        b=ur4sw6nstlBd6rzAkVOARh03uci+h6b77TTkxMtSo1uTtGzlPJ0KKOrWDReT+vdUZz
         vdGQ4NMfr4W5DjoLPctjNcMb6fgfPLAF7hO+AUeJlcuDU8lBIcV0TrjSSbz9cCwGt56l
         iPGwQpvnG8XihDFwM0Jk1vxGm+uvxKq5GLznKU1wZ8hEm3l9CU54kTY2Jqngc1KQBJqW
         gTHp6moGXSG/uRyjBvZr8ROReHofO49+RrJdXXBBeJw3etryPd+K197bjt9XyCIn8ZLD
         JyOzVnpx//xaPlc19yJ9gViM1y9GW/GCliz/YWmzv/6dHmXC67T/Y5J1pd/SwHTMFbZl
         0w/g==
X-Gm-Message-State: AOJu0YxYbG7zqkIMo/TD8qB7TMw1eyGSpt753ayUgi7SaM8Y55Jtblvi
	2/I2czJVwI4/MdmPahjp5MKQiGqra4EyAC/yJNDokmzIbJ9HKtavXY0JmA9bRQ==
X-Gm-Gg: ASbGnctOlysqIpZPiJUzORwniTkukIUuPvueoAGakT/UxkWRJVl08PqolZoELKzII4w
	dihmDu+lgtR3Q13pLaDdy8Ir+9nGeyTq3MswHV1h7J1LmHOQ/gNiS3E04lzKxwpxO1VD4CFhQYd
	B+sGGQHNJ97t5D95ML/kKUVWXJ+xdRf5L7nmyiYUCatxuNqhyqccDbd41xsOlZ8Y60bnTYrmG0C
	ByI5SpdZF3a2q2DBPEAm/pgQ0dklNq1co+HZfOnVoKZV5KDqXPoZlji80e/BUzr8S+os+nNLFDw
	Vcd05OpqHZu+pgtLpPW35BFQKXgzxQtwdcgMFi9lFj9SG4O5ZeJ0jqoPoyHRNk0/8A8WKDUseTz
	SKaeUrp6YRIsH/OoYmpgx59bHiw==
X-Google-Smtp-Source: AGHT+IEXxKcFsLgu1QF9SR3JAxnJoesOHSHj42NsNatJcZxEqL2WxuisDxS1PG5VuPnRSGgRJFRqpg==
X-Received: by 2002:a17:907:fd89:b0:ae3:bd94:2a0d with SMTP id a640c23a62f3a-ae3f801e360mr1327336666b.6.1751878921793;
        Mon, 07 Jul 2025 02:02:01 -0700 (PDT)
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
Subject: [PATCH v6 4/7] xen/riscv: implementation of aplic and imsic operations
Date: Mon,  7 Jul 2025 11:01:40 +0200
Message-ID: <99a7b9bff768ba5612a317959d6424e7f2e65fae.1751876912.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1751876912.git.oleksii.kurochko@gmail.com>
References: <cover.1751876912.git.oleksii.kurochko@gmail.com>
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
Changes in V6:
 - Fix code style issue: start multi-word comments with a capital letter.
 - Align properly comment in imsic_irq_enable().
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
index 71792bbf76..b70e353ae4 100644
--- a/xen/arch/riscv/aplic-priv.h
+++ b/xen/arch/riscv/aplic-priv.h
@@ -14,6 +14,7 @@
 #ifndef ASM_RISCV_PRIV_APLIC_H
 #define ASM_RISCV_PRIV_APLIC_H
 
+#include <xen/spinlock.h>
 #include <xen/types.h>
 
 #include <asm/aplic.h>
@@ -27,6 +28,9 @@ struct aplic_priv {
     /* Registers */
     volatile struct aplic_regs __iomem *regs;
 
+    /* Lock to protect access to APLIC's registers */
+    spinlock_t lock;
+
     /* IMSIC configuration */
     const struct imsic_config *imsic_cfg;
 };
diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 0b0101ebc1..edf4db3113 100644
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
+    /* Disable interrupt in APLIC */
+    writel(desc->irq, &aplic.regs->clrienum);
+
+    /* Disable interrupt in IMSIC */
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
index 63f4233035..a4460576f6 100644
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
+     * The only caller of imsic_irq_enable() is aplic_irq_enable(), which
+     * already runs with IRQs disabled. Therefore, there's no need to use
+     * spin_lock_irqsave() in this function.
+     *
+     * This ASSERT is added as a safeguard: if imsic_irq_enable() is ever
+     * called from a context where IRQs are not disabled,
+     * spin_lock_irqsave() should be used instead of spin_lock().
+     */
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
index 1388a977e6..7d811d3522 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -18,6 +18,8 @@
 #define APLIC_DOMAINCFG_IE      BIT(8, U)
 #define APLIC_DOMAINCFG_DM      BIT(2, U)
 
+#define APLIC_TARGET_HART_IDX_SHIFT 18
+
 struct aplic_regs {
     uint32_t domaincfg;         /* 0x0000 */
     uint32_t sourcecfg[1023];   /* 0x0004 */
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
2.50.0



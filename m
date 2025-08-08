Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A04DBB1EF75
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 22:23:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075026.1437532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTcg-0007a8-Qh; Fri, 08 Aug 2025 20:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075026.1437532; Fri, 08 Aug 2025 20:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTcg-0007TE-Dr; Fri, 08 Aug 2025 20:23:30 +0000
Received: by outflank-mailman (input) for mailman id 1075026;
 Fri, 08 Aug 2025 20:23:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukTce-0005tW-4N
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 20:23:28 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8acc2793-7495-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 22:23:27 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b79bdc9a7dso1424472f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 13:23:27 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075047fsm103989805e9.1.2025.08.08.13.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 13:23:26 -0700 (PDT)
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
X-Inumbo-ID: 8acc2793-7495-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754684607; x=1755289407; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2avIK78ICYjlmOagbLqWHEpOkiTfdHUyKFlDzZ7jHg=;
        b=UilhFhEJbZhZC2zsnafjD+jqAqgNRJG33GuL6VCyNO9dUH07xHbaMsAHUchk52HodJ
         fHItsT9Cg8dE5FyPPyv0fLcYjt0GQkjDdSG+dzi5MLC/x3ODRIThhmloT9OddiKNijVs
         6tSzJql/blKWEyRPeBZ8nHUF8AIgNiMfZ1uXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754684607; x=1755289407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2avIK78ICYjlmOagbLqWHEpOkiTfdHUyKFlDzZ7jHg=;
        b=gHJv0RyNNnlIMRxkY0B8mRrtf8CriM15oOQRtwxr52DOyiOMvJwhWNmc/9dZ2NTyEQ
         P3Ym/IOPF+ZHSmCRLqyZ7rFePf3Mg2maX0jr2hRc1nnye2u7S6GurN25WxUBnRpzKlhe
         g1cMgOLgB+s+ZX6Cf2P2c8+g8t9tjZCy7psTqzexRlivBdGQY1DnBBpS2zdheHs+4fzf
         tCUalZH5hi2Ap0vouhWooZY1TPKaIzV6HP8KBEHki92+mBJgYubYhsAIhcbr/esxPIsA
         jrA067/vdDkaPdwK4g57yJh9DU2GoYNB4/0zAWpMahl2Pg8vijxtqFLYfN31a4m+1myO
         90DQ==
X-Gm-Message-State: AOJu0YzWrwfDb3OHWDksLgE2FtKbSiyJdvwZSlFLhYTQcRRR6YI9a12i
	v2uhAPP5GhRw8rgmZH84zJ4BZiq5H2UgdWqIUdLYgNrs2THXMwe5cw8bPZJqDQc3enbt+YeYUwx
	HJe4nzJI=
X-Gm-Gg: ASbGncvYAdrAJksvMqo+kSkGDB79R432BJt9KL8aeJNI4oqEB6gcMkZuYrpjyNDCyzz
	8lXMTuvqos6UeLtOZPFR5hR4CU7miV23ikKGwgHf/RNt6TsvX2yhU6tY55fSWdmoJERpmPWqWiq
	WYZy3ptzAKd7sOukAEX7mXgOuiKxELviEOPTx+dFCNfEUVle1Y4DPfPQqU4q5VYA9utxKg87N1I
	PqmGiGss8Kg77KFoPaYiyQ9L11KHOqI7BkOcVqUyTnlxO8/BAeLGaNmKMbQk8EtAIpQrrZSFQql
	q8GeBz2O1b2nW3gOzW15dE8LaO9i53fdBtvHyCyMySqjysFS3cIJ79nfsNrQRX54eNth0BthEW/
	qMt6lOld3jjO+f9YpOhQOV4D1O1eB7b7z0wYM//ail0Sb/H6euPf+rZZMIOVNtiWbyhktt+qoDI
	TP1daxaSCtDOw=
X-Google-Smtp-Source: AGHT+IFhsUqtMUd00xT8YcU446osfo1/oRuXTXfsZYBCQBDf1L75TZHaWK6AXiKPj7YHi0QESLC+PQ==
X-Received: by 2002:a05:6000:2408:b0:3b8:d1d9:70ba with SMTP id ffacd0b85a97d-3b900b7517dmr3549077f8f.32.1754684606743;
        Fri, 08 Aug 2025 13:23:26 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 09/22] x86/traps: Move load_system_tables() into traps-setup.c
Date: Fri,  8 Aug 2025 21:23:01 +0100
Message-Id: <20250808202314.1045968-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Switch it to Xen coding style and fix MISRA violations.  Make it static as
there are no external caller now.

Since commit a35816b5cae8 ("x86/traps: Introduce early_traps_init() and
simplify setup"), load_system_tables() is called later on the BSP, so the
SYS_STATE_early_boot check can be dropped from the safety BUG_ON().

Move the BUILD_BUG_ON() into build_assertions(), and introduce an
endof_field() helper to make the expression clearer.

Swap wrmsrl(MSR_ISST, ...) for wrmsrns().  No serialisation is needed at this
point.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/common.c         | 118 --------------------------
 xen/arch/x86/include/asm/system.h |   1 -
 xen/arch/x86/traps-setup.c        | 132 ++++++++++++++++++++++++++++++
 xen/include/xen/macros.h          |   2 +
 4 files changed, 134 insertions(+), 119 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index cdc41248d4e9..da05015578aa 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -843,124 +843,6 @@ void print_cpu_info(unsigned int cpu)
 
 static cpumask_t cpu_initialized;
 
-/*
- * Sets up system tables and descriptors.
- *
- * - Sets up TSS with stack pointers, including ISTs
- * - Inserts TSS selector into regular and compat GDTs
- * - Loads GDT, IDT, TR then null LDT
- * - Sets up IST references in the IDT
- */
-void load_system_tables(void)
-{
-	unsigned int i, cpu = smp_processor_id();
-	unsigned long stack_bottom = get_stack_bottom(),
-		stack_top = stack_bottom & ~(STACK_SIZE - 1);
-	/*
-	 * NB: define tss_page as a local variable because clang 3.5 doesn't
-	 * support using ARRAY_SIZE against per-cpu variables.
-	 */
-	struct tss_page *tss_page = &this_cpu(tss_page);
-	idt_entry_t *idt = this_cpu(idt);
-
-	/* The TSS may be live.	 Disuade any clever optimisations. */
-	volatile struct tss64 *tss = &tss_page->tss;
-	seg_desc_t *gdt =
-		this_cpu(gdt) - FIRST_RESERVED_GDT_ENTRY;
-
-	const struct desc_ptr gdtr = {
-		.base = (unsigned long)gdt,
-		.limit = LAST_RESERVED_GDT_BYTE,
-	};
-	const struct desc_ptr idtr = {
-		.base = (unsigned long)idt,
-		.limit = sizeof(bsp_idt) - 1,
-	};
-
-	/*
-	 * Set up the TSS.  Warning - may be live, and the NMI/#MC must remain
-	 * valid on every instruction boundary.  (Note: these are all
-	 * semantically ACCESS_ONCE() due to tss's volatile qualifier.)
-	 *
-	 * rsp0 refers to the primary stack.  #MC, NMI, #DB and #DF handlers
-	 * each get their own stacks.  No IO Bitmap.
-	 */
-	tss->rsp0 = stack_bottom;
-	tss->ist[IST_MCE - 1] = stack_top + (1 + IST_MCE) * PAGE_SIZE;
-	tss->ist[IST_NMI - 1] = stack_top + (1 + IST_NMI) * PAGE_SIZE;
-	tss->ist[IST_DB  - 1] = stack_top + (1 + IST_DB)  * PAGE_SIZE;
-	tss->ist[IST_DF  - 1] = stack_top + (1 + IST_DF)  * PAGE_SIZE;
-	tss->bitmap = IOBMP_INVALID_OFFSET;
-
-	/* All other stack pointers poisioned. */
-	for ( i = IST_MAX; i < ARRAY_SIZE(tss->ist); ++i )
-		tss->ist[i] = 0x8600111111111111ul;
-	tss->rsp1 = 0x8600111111111111ul;
-	tss->rsp2 = 0x8600111111111111ul;
-
-	/*
-	 * Set up the shadow stack IST.  Used entries must point at the
-	 * supervisor stack token.  Unused entries are poisoned.
-	 *
-	 * This IST Table may be live, and the NMI/#MC entries must
-	 * remain valid on every instruction boundary, hence the
-	 * volatile qualifier.
-	 */
-	if (cpu_has_xen_shstk) {
-		volatile uint64_t *ist_ssp = tss_page->ist_ssp;
-		unsigned long
-			mce_ssp = stack_top + (IST_MCE * IST_SHSTK_SIZE) - 8,
-			nmi_ssp = stack_top + (IST_NMI * IST_SHSTK_SIZE) - 8,
-			db_ssp  = stack_top + (IST_DB  * IST_SHSTK_SIZE) - 8,
-			df_ssp  = stack_top + (IST_DF  * IST_SHSTK_SIZE) - 8;
-
-		ist_ssp[0] = 0x8600111111111111ul;
-		ist_ssp[IST_MCE] = mce_ssp;
-		ist_ssp[IST_NMI] = nmi_ssp;
-		ist_ssp[IST_DB]	 = db_ssp;
-		ist_ssp[IST_DF]	 = df_ssp;
-		for ( i = IST_DF + 1; i < ARRAY_SIZE(tss_page->ist_ssp); ++i )
-			ist_ssp[i] = 0x8600111111111111ul;
-
-		if (IS_ENABLED(CONFIG_XEN_SHSTK) && rdssp() != SSP_NO_SHSTK) {
-			/*
-			 * Rewrite supervisor tokens when shadow stacks are
-			 * active.  This resets any busy bits left across S3.
-			 */
-			wrss(mce_ssp, _p(mce_ssp));
-			wrss(nmi_ssp, _p(nmi_ssp));
-			wrss(db_ssp,  _p(db_ssp));
-			wrss(df_ssp,  _p(df_ssp));
-		}
-
-		wrmsrl(MSR_ISST, (unsigned long)ist_ssp);
-	}
-
-	_set_tssldt_desc(gdt + TSS_ENTRY, (unsigned long)tss,
-			 sizeof(*tss) - 1, SYS_DESC_tss_avail);
-	if ( IS_ENABLED(CONFIG_PV32) )
-		_set_tssldt_desc(
-			this_cpu(compat_gdt) - FIRST_RESERVED_GDT_ENTRY + TSS_ENTRY,
-			(unsigned long)tss, sizeof(*tss) - 1, SYS_DESC_tss_busy);
-
-	per_cpu(full_gdt_loaded, cpu) = false;
-	lgdt(&gdtr);
-	lidt(&idtr);
-	ltr(TSS_SELECTOR);
-	lldt(0);
-
-	enable_each_ist(idt);
-
-	/*
-	 * Bottom-of-stack must be 16-byte aligned!
-	 *
-	 * Defer checks until exception support is sufficiently set up.
-	 */
-	BUILD_BUG_ON((sizeof(struct cpu_info) -
-		      sizeof(struct cpu_user_regs)) & 0xf);
-	BUG_ON(system_state != SYS_STATE_early_boot && (stack_bottom & 0xf));
-}
-
 static void skinit_enable_intr(void)
 {
 	uint64_t val;
diff --git a/xen/arch/x86/include/asm/system.h b/xen/arch/x86/include/asm/system.h
index 57446c5b465c..3cdc56e4ba6d 100644
--- a/xen/arch/x86/include/asm/system.h
+++ b/xen/arch/x86/include/asm/system.h
@@ -256,7 +256,6 @@ static inline int local_irq_is_enabled(void)
 #define BROKEN_ACPI_Sx          0x0001
 #define BROKEN_INIT_AFTER_S1    0x0002
 
-void load_system_tables(void);
 void subarch_percpu_traps_init(void);
 
 #endif
diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
index 8ca379c9e4cb..13b8fcf0ba51 100644
--- a/xen/arch/x86/traps-setup.c
+++ b/xen/arch/x86/traps-setup.c
@@ -7,6 +7,7 @@
 
 #include <asm/idt.h>
 #include <asm/msr.h>
+#include <asm/shstk.h>
 #include <asm/system.h>
 #include <asm/traps.h>
 
@@ -19,6 +20,124 @@ boolean_param("ler", opt_ler);
 
 void nocall entry_PF(void);
 
+/*
+ * Sets up system tables and descriptors for IDT devliery.
+ *
+ * - Sets up TSS with stack pointers, including ISTs
+ * - Inserts TSS selector into regular and compat GDTs
+ * - Loads GDT, IDT, TR then null LDT
+ * - Sets up IST references in the IDT
+ */
+static void load_system_tables(void)
+{
+    unsigned int i, cpu = smp_processor_id();
+    unsigned long stack_bottom = get_stack_bottom(),
+        stack_top = stack_bottom & ~(STACK_SIZE - 1);
+    /*
+     * NB: define tss_page as a local variable because clang 3.5 doesn't
+     * support using ARRAY_SIZE against per-cpu variables.
+     */
+    struct tss_page *tss_page = &this_cpu(tss_page);
+    idt_entry_t *idt = this_cpu(idt);
+
+    /* The TSS may be live.  Disuade any clever optimisations. */
+    volatile struct tss64 *tss = &tss_page->tss;
+    seg_desc_t *gdt =
+        this_cpu(gdt) - FIRST_RESERVED_GDT_ENTRY;
+
+    const struct desc_ptr gdtr = {
+        .base = (unsigned long)gdt,
+        .limit = LAST_RESERVED_GDT_BYTE,
+    };
+    const struct desc_ptr idtr = {
+        .base = (unsigned long)idt,
+        .limit = sizeof(bsp_idt) - 1,
+    };
+
+    /*
+     * Set up the TSS.  Warning - may be live, and the NMI/#MC must remain
+     * valid on every instruction boundary.  (Note: these are all
+     * semantically ACCESS_ONCE() due to tss's volatile qualifier.)
+     *
+     * rsp0 refers to the primary stack.  #MC, NMI, #DB and #DF handlers
+     * each get their own stacks.  No IO Bitmap.
+     */
+    tss->rsp0 = stack_bottom;
+    tss->ist[IST_MCE - 1] = stack_top + (1 + IST_MCE) * PAGE_SIZE;
+    tss->ist[IST_NMI - 1] = stack_top + (1 + IST_NMI) * PAGE_SIZE;
+    tss->ist[IST_DB  - 1] = stack_top + (1 + IST_DB)  * PAGE_SIZE;
+    tss->ist[IST_DF  - 1] = stack_top + (1 + IST_DF)  * PAGE_SIZE;
+    tss->bitmap = IOBMP_INVALID_OFFSET;
+
+    /* All other stack pointers poisioned. */
+    for ( i = IST_MAX; i < ARRAY_SIZE(tss->ist); ++i )
+        tss->ist[i] = 0x8600111111111111UL;
+    tss->rsp1 = 0x8600111111111111UL;
+    tss->rsp2 = 0x8600111111111111UL;
+
+    /*
+     * Set up the shadow stack IST.  Used entries must point at the
+     * supervisor stack token.  Unused entries are poisoned.
+     *
+     * This IST Table may be live, and the NMI/#MC entries must
+     * remain valid on every instruction boundary, hence the
+     * volatile qualifier.
+     */
+    if ( cpu_has_xen_shstk )
+    {
+        volatile uint64_t *ist_ssp = tss_page->ist_ssp;
+        unsigned long
+            mce_ssp = stack_top + (IST_MCE * IST_SHSTK_SIZE) - 8,
+            nmi_ssp = stack_top + (IST_NMI * IST_SHSTK_SIZE) - 8,
+            db_ssp  = stack_top + (IST_DB  * IST_SHSTK_SIZE) - 8,
+            df_ssp  = stack_top + (IST_DF  * IST_SHSTK_SIZE) - 8;
+
+        ist_ssp[0] = 0x8600111111111111UL;
+        ist_ssp[IST_MCE] = mce_ssp;
+        ist_ssp[IST_NMI] = nmi_ssp;
+        ist_ssp[IST_DB]  = db_ssp;
+        ist_ssp[IST_DF]  = df_ssp;
+        for ( i = IST_DF + 1; i < ARRAY_SIZE(tss_page->ist_ssp); ++i )
+            ist_ssp[i] = 0x8600111111111111UL;
+
+        if ( IS_ENABLED(CONFIG_XEN_SHSTK) && rdssp() != SSP_NO_SHSTK )
+        {
+            /*
+             * Rewrite supervisor tokens when shadow stacks are
+             * active.  This resets any busy bits left across S3.
+             */
+            wrss(mce_ssp, _p(mce_ssp));
+            wrss(nmi_ssp, _p(nmi_ssp));
+            wrss(db_ssp,  _p(db_ssp));
+            wrss(df_ssp,  _p(df_ssp));
+        }
+
+        wrmsrns(MSR_ISST, (unsigned long)ist_ssp);
+    }
+
+    _set_tssldt_desc(gdt + TSS_ENTRY, (unsigned long)tss,
+                     sizeof(*tss) - 1, SYS_DESC_tss_avail);
+    if ( IS_ENABLED(CONFIG_PV32) )
+        _set_tssldt_desc(
+            this_cpu(compat_gdt) - FIRST_RESERVED_GDT_ENTRY + TSS_ENTRY,
+            (unsigned long)tss, sizeof(*tss) - 1, SYS_DESC_tss_busy);
+
+    per_cpu(full_gdt_loaded, cpu) = false;
+    lgdt(&gdtr);
+    lidt(&idtr);
+    ltr(TSS_SELECTOR);
+    lldt(0);
+
+    enable_each_ist(idt);
+
+    /*
+     * tss->rsp0 must be 16-byte aligned.
+     *
+     * Defer checks until exception support is sufficiently set up.
+     */
+    BUG_ON(stack_bottom & 15);
+}
+
 static void __init init_ler(void)
 {
     unsigned int msr = 0;
@@ -139,3 +258,16 @@ void asmlinkage ap_early_traps_init(void)
 {
     load_system_tables();
 }
+
+static void __init __maybe_unused build_assertions(void)
+{
+    /*
+     * This is best-effort (it doesn't cover some padding corner cases), but
+     * is preforable to hitting the check at boot time.
+     *
+     * tss->rsp0, pointing at the end of cpu_info.guest_cpu_user_regs, must be
+     * 16-byte aligned.
+     */
+    BUILD_BUG_ON((sizeof(struct cpu_info) -
+                  endof_field(struct cpu_info, guest_cpu_user_regs)) & 15);
+}
diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
index cd528fbdb127..726ba221e0d8 100644
--- a/xen/include/xen/macros.h
+++ b/xen/include/xen/macros.h
@@ -102,6 +102,8 @@
  */
 #define sizeof_field(type, member) sizeof(((type *)NULL)->member)
 
+#define endof_field(type, member) (offsetof(type, member) + sizeof_field(type, member))
+
 /* Cast an arbitrary integer to a pointer. */
 #define _p(x) ((void *)(unsigned long)(x))
 
-- 
2.39.5



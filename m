Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2899A4275F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 17:07:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895266.1303880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmazF-0004IV-Pv; Mon, 24 Feb 2025 16:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895266.1303880; Mon, 24 Feb 2025 16:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmazF-0004Al-JN; Mon, 24 Feb 2025 16:07:17 +0000
Received: by outflank-mailman (input) for mailman id 895266;
 Mon, 24 Feb 2025 16:07:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=48j1=VP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tmazE-0003oc-81
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 16:07:16 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69aa6914-f2c9-11ef-9aae-95dc52dad729;
 Mon, 24 Feb 2025 17:07:14 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43996e95114so29965215e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2025 08:07:14 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02d6837sm109356675e9.13.2025.02.24.08.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 08:07:13 -0800 (PST)
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
X-Inumbo-ID: 69aa6914-f2c9-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740413234; x=1741018034; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUi6pKL3e9xeVB/CncS3c+2qCjypXGx2npChE0Akb54=;
        b=rOuIda2i799s+HoNehUDP8k0fKE68mlJmbD5m6gML4nEssjwSkC2OTKHl4IVRcIe8f
         IEttbc0EkBNIijyKw8mUtUYIhe4wcvUaD2c5vLJOMnb7zItF4g7cauN7zR42H0mvGuur
         0wWmezHocDUioWMg02I5mM0FRCnAS83+KtWC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740413234; x=1741018034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dUi6pKL3e9xeVB/CncS3c+2qCjypXGx2npChE0Akb54=;
        b=s8NdxZxs5H1L/6Da0nubDk2ToeskOWd7chWSmszCWFrUi/bhC0p72pTc7DLqqSHQil
         mAuCgPuuxeG1ers2mC5nQh931n97FDPJ3b5WdiGZhOxmDSLGkRQHlTPZqABMLiZ8h6NR
         b1r/y5y5UUey7q+r7TBV9f18ZkQVmvqWkOwfN3VeF4hcWXO0uN32szuV77EfqCgYUJHh
         xfuM/PtZSiaC9iyu3lhfSWT1KOV1Rnh95lQMAoojbWOVdgVX8dEy9ehQY3gQLg/K/SsP
         fAiMrEXVlePCU4ryTKSGr5rkUdJYe7CgelXx51zcyPf5qAg4/G8FmUnOws1WoA0B6Udg
         /w9A==
X-Gm-Message-State: AOJu0YyOvmsD26L4rUbChpAcKbbpppPlYA4qqKmd0+ZNMuJZppA3MhNI
	Q/y+9Aek1mAXHdaWwQ2X5VS3mTqs43zWmtINPwvTl6MDtGOPivZArJzzu4rfmqe+qtzPIYQ4HNu
	b
X-Gm-Gg: ASbGncvErsRHFvm17L+TRAWGV55BSCLmBKsJcYVlXPm1kZaOUmNICIS6Vo500fthsnA
	aBDT3Lh1XHmzC6vDMds3tXuFgYZ82cC77V/4YMnV2qlO9u1vudON0r/9VEi8lAIoa33AzMPtsh9
	L/MB96X+6JZShIGXVPnG+a4fDCmjlXl4t+/OqBh0M23eBkxj6Jq74rPSKJdtaQQ+yAnd8Whw3i/
	TvQUM9CpHwOodAr/xvtzgHKrsAHl5qGubsYqSC4bXGhMEtM5TIHeZ12yrUJjXO9v1aNXHBuwtyD
	VZiq1e1PMih3DA7tVmQ1FBVDGQBnBiBQZwhBEXwzKwXneT5gj5ype55zEBPWUKKIp94aXkDjxim
	FFY8A2g==
X-Google-Smtp-Source: AGHT+IHX7Sg9NJ7ohj/WDwSXwXLQWp5SKxysy3acQu2aZl4OpPeHGStggRDZd/PupW6RyOJ+IwEUMA==
X-Received: by 2002:a05:600c:4683:b0:439:8523:36cc with SMTP id 5b1f17b1804b1-43ab07ab212mr6475695e9.11.1740413233846;
        Mon, 24 Feb 2025 08:07:13 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/8] x86/IDT: Rename X86_NR_VECTORS to X86_IDT_VECTORS
Date: Mon, 24 Feb 2025 16:05:04 +0000
Message-Id: <20250224160509.1117847-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Observant readers may have noticed that the FRED spec has another 8 bits of
space reserved immediately following the vector field.

Make the existing constant more precise.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vlapic.c               |  4 ++--
 xen/arch/x86/hvm/vmx/intr.c             |  4 ++--
 xen/arch/x86/hvm/vmx/vmcs.c             |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c              |  6 +++---
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  4 ++--
 xen/arch/x86/include/asm/irq.h          |  4 ++--
 xen/arch/x86/include/asm/x86-defns.h    |  2 +-
 xen/arch/x86/io_apic.c                  |  2 +-
 xen/arch/x86/irq.c                      | 12 ++++++------
 xen/arch/x86/pv/callback.c              |  4 ++--
 xen/arch/x86/pv/domain.c                |  4 ++--
 xen/arch/x86/traps.c                    |  4 ++--
 xen/arch/x86/x86_64/entry.S             |  2 +-
 13 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 3363926b487b..91fc45716514 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -72,7 +72,7 @@ static void vlapic_do_init(struct vlapic *vlapic);
 static int vlapic_find_highest_vector(const void *bitmap)
 {
     const uint32_t *word = bitmap;
-    unsigned int word_offset = X86_NR_VECTORS / 32;
+    unsigned int word_offset = X86_IDT_VECTORS / 32;
 
     /* Work backwards through the bitmap (first 32-bit word in every four). */
     while ( (word_offset != 0) && (word[(--word_offset)*4] == 0) )
@@ -665,7 +665,7 @@ int guest_rdmsr_x2apic(const struct vcpu *v, uint32_t msr, uint64_t *val)
         REG(LVT0)  | REG(LVT1) | REG(LVTERR)  | REG(TMICT)   |
         REG(TMCCT) | REG(TDCR) |
 #undef REG
-#define REGBLOCK(x) (((1UL << (X86_NR_VECTORS / 32)) - 1) << (APIC_ ## x >> 4))
+#define REGBLOCK(x) (((1UL << (X86_IDT_VECTORS / 32)) - 1) << (APIC_ ## x >> 4))
         REGBLOCK(ISR) | REGBLOCK(TMR) | REGBLOCK(IRR)
 #undef REGBLOCK
     };
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index 1a4dfb499bcd..91b407e6bcc2 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -356,7 +356,7 @@ void asmlinkage vmx_intr_assist(void)
                 {
                     word = (const void *)&vlapic->regs->data[APIC_IRR];
                     printk(XENLOG_ERR "vIRR:");
-                    for ( i = X86_NR_VECTORS / 32; i-- ; )
+                    for ( i = X86_IDT_VECTORS / 32; i-- ; )
                         printk(" %08x", word[i*4]);
                     printk("\n");
                 }
@@ -366,7 +366,7 @@ void asmlinkage vmx_intr_assist(void)
                 {
                     word = (const void *)&pi_desc->pir;
                     printk(XENLOG_ERR " PIR:");
-                    for ( i = X86_NR_VECTORS / 32; i-- ; )
+                    for ( i = X86_IDT_VECTORS / 32; i-- ; )
                         printk(" %08x", word[i]);
                     printk("\n");
                 }
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 0136830ebcb7..20ab2d0f266f 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1219,7 +1219,7 @@ static int construct_vmcs(struct vcpu *v)
         unsigned int i;
 
         /* EOI-exit bitmap */
-        bitmap_zero(v->arch.hvm.vmx.eoi_exit_bitmap, X86_NR_VECTORS);
+        bitmap_zero(v->arch.hvm.vmx.eoi_exit_bitmap, X86_IDT_VECTORS);
         for ( i = 0; i < ARRAY_SIZE(v->arch.hvm.vmx.eoi_exit_bitmap); ++i )
             __vmwrite(EOI_EXIT_BITMAP(i), 0);
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index eee1d4b47a13..ff0ea9cf0e1d 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2199,7 +2199,7 @@ static void cf_check vmx_process_isr(int isr, struct vcpu *v)
      * is acceptable because the subsequent interrupts will set up the eoi
      * bitmap correctly.
      */
-    for ( i = 0x10; i < X86_NR_VECTORS; ++i )
+    for ( i = 0x10; i < X86_IDT_VECTORS; ++i )
         if ( vlapic_test_vector(i, &vlapic->regs->data[APIC_IRR]) ||
              vlapic_test_vector(i, &vlapic->regs->data[APIC_ISR]) )
             set_bit(i, v->arch.hvm.vmx.eoi_exit_bitmap);
@@ -2316,7 +2316,7 @@ static void cf_check vmx_sync_pir_to_irr(struct vcpu *v)
 {
     struct vlapic *vlapic = vcpu_vlapic(v);
     unsigned int group, i;
-    DECLARE_BITMAP(pending_intr, X86_NR_VECTORS);
+    DECLARE_BITMAP(pending_intr, X86_IDT_VECTORS);
 
     if ( !pi_test_and_clear_on(&v->arch.hvm.vmx.pi_desc) )
         return;
@@ -2324,7 +2324,7 @@ static void cf_check vmx_sync_pir_to_irr(struct vcpu *v)
     for ( group = 0; group < ARRAY_SIZE(pending_intr); group++ )
         pending_intr[group] = pi_get_pir(&v->arch.hvm.vmx.pi_desc, group);
 
-    bitmap_for_each ( i, pending_intr, X86_NR_VECTORS )
+    bitmap_for_each ( i, pending_intr, X86_IDT_VECTORS )
         vlapic_set_vector(i, &vlapic->regs->data[APIC_IRR]);
 }
 
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index e1d339814143..bfb234101154 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -71,7 +71,7 @@ struct vmx_msr_bitmap {
 };
 
 struct pi_desc {
-    DECLARE_BITMAP(pir, X86_NR_VECTORS);
+    DECLARE_BITMAP(pir, X86_IDT_VECTORS);
     union {
         struct {
             u16     on     : 1,  /* bit 256 - Outstanding Notification */
@@ -138,7 +138,7 @@ struct vmx_vcpu {
     unsigned int         host_msr_count;
 
     unsigned long        eoi_exitmap_changed;
-    DECLARE_BITMAP(eoi_exit_bitmap, X86_NR_VECTORS);
+    DECLARE_BITMAP(eoi_exit_bitmap, X86_IDT_VECTORS);
     struct pi_desc       pi_desc;
 
     unsigned long        host_cr0;
diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index 354868ba31ab..f9ed5dc86cb3 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -23,7 +23,7 @@ extern unsigned int nr_irqs;
 #define LEGACY_VECTOR(irq)          ((irq) + FIRST_LEGACY_VECTOR)
 
 typedef struct {
-    DECLARE_BITMAP(_bits, X86_NR_VECTORS);
+    DECLARE_BITMAP(_bits, X86_IDT_VECTORS);
 } vmask_t;
 
 struct irq_desc;
@@ -96,7 +96,7 @@ struct arch_irq_desc {
 
 #define IRQ_VECTOR_UNASSIGNED (-1)
 
-typedef int vector_irq_t[X86_NR_VECTORS];
+typedef int vector_irq_t[X86_IDT_VECTORS];
 DECLARE_PER_CPU(vector_irq_t, vector_irq);
 
 extern bool opt_noirqbalance;
diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index 2493ec277f58..61b0cea8f37c 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -155,7 +155,7 @@
 #define X86_INVPCID_ALL_INCL_GLOBAL 2
 #define X86_INVPCID_ALL_NON_GLOBAL  3
 
-#define X86_NR_VECTORS 256
+#define X86_IDT_VECTORS 256
 
 /* Exception Vectors */
 #define X86_EXC_DE             0 /* Divide Error */
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 68680c102f58..776dd57720a2 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -101,7 +101,7 @@ static void share_vector_maps(unsigned int src, unsigned int dst)
         return;
 
     bitmap_or(vector_map[src]->_bits, vector_map[src]->_bits,
-              vector_map[dst]->_bits, X86_NR_VECTORS);
+              vector_map[dst]->_bits, X86_IDT_VECTORS);
 
     for (pin = 0; pin < nr_ioapic_entries[dst]; ++pin) {
         int irq = apic_pin_2_gsi_irq(dst, pin);
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index ff3ac832f4b9..f35894577bb0 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -51,7 +51,7 @@ static vmask_t global_used_vector_map;
 
 struct irq_desc __read_mostly *irq_desc = NULL;
 
-static DECLARE_BITMAP(used_vectors, X86_NR_VECTORS);
+static DECLARE_BITMAP(used_vectors, X86_IDT_VECTORS);
 
 static DEFINE_SPINLOCK(vector_lock);
 
@@ -155,7 +155,7 @@ static int __init _bind_irq_vector(struct irq_desc *desc, int vector,
     cpumask_t online_mask;
     int cpu;
 
-    BUG_ON((unsigned)vector >= X86_NR_VECTORS);
+    BUG_ON((unsigned)vector >= X86_IDT_VECTORS);
 
     cpumask_and(&online_mask, cpu_mask, &cpu_online_map);
     if (cpumask_empty(&online_mask))
@@ -423,7 +423,7 @@ int __init init_irq_data(void)
     struct irq_desc *desc;
     int irq, vector;
 
-    for ( vector = 0; vector < X86_NR_VECTORS; ++vector )
+    for ( vector = 0; vector < X86_IDT_VECTORS; ++vector )
         this_cpu(vector_irq)[vector] = INT_MIN;
 
     irq_desc = xzalloc_array(struct irq_desc, nr_irqs);
@@ -745,7 +745,7 @@ void setup_vector_irq(unsigned int cpu)
     unsigned int irq, vector;
 
     /* Clear vector_irq */
-    for ( vector = 0; vector < X86_NR_VECTORS; ++vector )
+    for ( vector = 0; vector < X86_IDT_VECTORS; ++vector )
         per_cpu(vector_irq, cpu)[vector] = INT_MIN;
     /* Mark the inuse vectors */
     for ( irq = 0; irq < nr_irqs; ++irq )
@@ -972,7 +972,7 @@ uint8_t alloc_hipriority_vector(void)
     return next++;
 }
 
-static void (*direct_apic_vector[X86_NR_VECTORS])(void);
+static void (*direct_apic_vector[X86_IDT_VECTORS])(void);
 void set_direct_apic_vector(uint8_t vector, void (*handler)(void))
 {
     BUG_ON(direct_apic_vector[vector] != NULL);
@@ -2572,7 +2572,7 @@ static void cf_check dump_irqs(unsigned char key)
 
     process_pending_softirqs();
     printk("Direct vector information:\n");
-    for ( i = FIRST_DYNAMIC_VECTOR; i < X86_NR_VECTORS; ++i )
+    for ( i = FIRST_DYNAMIC_VECTOR; i < X86_IDT_VECTORS; ++i )
         if ( direct_apic_vector[i] )
             printk("   %#02x -> %ps()\n", i, direct_apic_vector[i]);
 
diff --git a/xen/arch/x86/pv/callback.c b/xen/arch/x86/pv/callback.c
index caec4fb16fab..38b819b56626 100644
--- a/xen/arch/x86/pv/callback.c
+++ b/xen/arch/x86/pv/callback.c
@@ -347,7 +347,7 @@ long do_set_trap_table(XEN_GUEST_HANDLE_PARAM(const_trap_info_t) traps)
     /* If no table is presented then clear the entire virtual IDT. */
     if ( guest_handle_is_null(traps) )
     {
-        memset(dst, 0, X86_NR_VECTORS * sizeof(*dst));
+        memset(dst, 0, X86_IDT_VECTORS * sizeof(*dst));
         return 0;
     }
 
@@ -393,7 +393,7 @@ int compat_set_trap_table(XEN_GUEST_HANDLE(trap_info_compat_t) traps)
     /* If no table is presented then clear the entire virtual IDT. */
     if ( guest_handle_is_null(traps) )
     {
-        memset(dst, 0, X86_NR_VECTORS * sizeof(*dst));
+        memset(dst, 0, X86_IDT_VECTORS * sizeof(*dst));
         return 0;
     }
 
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 7aef628f55be..9334da1dab93 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -312,9 +312,9 @@ int pv_vcpu_initialise(struct vcpu *v)
     if ( rc )
         return rc;
 
-    BUILD_BUG_ON(X86_NR_VECTORS * sizeof(*v->arch.pv.trap_ctxt) >
+    BUILD_BUG_ON(X86_IDT_VECTORS * sizeof(*v->arch.pv.trap_ctxt) >
                  PAGE_SIZE);
-    v->arch.pv.trap_ctxt = xzalloc_array(struct trap_info, X86_NR_VECTORS);
+    v->arch.pv.trap_ctxt = xzalloc_array(struct trap_info, X86_IDT_VECTORS);
     if ( !v->arch.pv.trap_ctxt )
     {
         rc = -ENOMEM;
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 1a53bb4aa481..a8a4fdaeb59c 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -2196,7 +2196,7 @@ static void __init init_ler(void)
     setup_force_cpu_cap(X86_FEATURE_XEN_LBR);
 }
 
-extern void (*const autogen_entrypoints[X86_NR_VECTORS])(void);
+extern void (*const autogen_entrypoints[X86_IDT_VECTORS])(void);
 void __init trap_init(void)
 {
     unsigned int vector;
@@ -2206,7 +2206,7 @@ void __init trap_init(void)
 
     pv_trap_init();
 
-    for ( vector = 0; vector < X86_NR_VECTORS; ++vector )
+    for ( vector = 0; vector < X86_IDT_VECTORS; ++vector )
     {
         if ( autogen_entrypoints[vector] )
         {
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 40d094d5b2ee..d866e626257b 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -1243,7 +1243,7 @@ DATA(autogen_entrypoints, 8)
 FUNC_LOCAL(autogen_stubs, 0) /* Automatically generated stubs. */
 
         vec = 0
-        .rept X86_NR_VECTORS
+        .rept X86_IDT_VECTORS
 
         /* Common interrupts, heading towards do_IRQ(). */
 #if defined(CONFIG_PV32)
-- 
2.39.5



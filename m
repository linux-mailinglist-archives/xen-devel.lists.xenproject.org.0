Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50787A42761
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 17:07:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895269.1303916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmazI-0005Dx-RE; Mon, 24 Feb 2025 16:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895269.1303916; Mon, 24 Feb 2025 16:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmazI-00059j-Lm; Mon, 24 Feb 2025 16:07:20 +0000
Received: by outflank-mailman (input) for mailman id 895269;
 Mon, 24 Feb 2025 16:07:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=48j1=VP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tmazH-0004jn-43
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 16:07:19 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ae2e851-f2c9-11ef-9897-31a8f345e629;
 Mon, 24 Feb 2025 17:07:16 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4399d14334aso40333825e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2025 08:07:16 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02d6837sm109356675e9.13.2025.02.24.08.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 08:07:15 -0800 (PST)
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
X-Inumbo-ID: 6ae2e851-f2c9-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740413236; x=1741018036; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2a7RbY8QCk2TLWrBIf90b/zkqmEwNcD5m6KQuSVDFjw=;
        b=XWq1RrcLg1mXapKJ3HOY9ZtJaXZuRZweNc8OPZYEy2FFLrdc/qv6IPOjoTFUHBtI5H
         lVt4n4+4jZcMMfr7GEAA3+pk/idpcqcyQmImi6UiGw8MGRlitL1UFXJnBpXS0T/tXZ8g
         +a2XSkgHwNPl0kYI447M+2iGXN73j71KfbN8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740413236; x=1741018036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2a7RbY8QCk2TLWrBIf90b/zkqmEwNcD5m6KQuSVDFjw=;
        b=w6D8cu8S7xBvgD2ZMaqFrhV/Ru4JTVpxpcvIq/0ILmYx6gJYpAfPN7/Itrf9cmE0pH
         6B4IPxTJgkB1sR8a67yHiLLyz3fgSi1ki21h8aX0oFs47uEt0VJdDXnamDAg806HY/DC
         zLK0J3gSz8PlsKIx+MK1N7gs7JhPwpLrGDtvirHi4wgVlmfatO6UpjOg9u/0CefwCcsK
         SN4M5lUmNpWhWNnm17v5rp9qrsqaW3X/FXhuiQzRQ1xBvG6r5MPNIBqyOIPPRPcRqr8L
         pf553zsCFV7a8WRRAYeTHSjkXe9ks1x7SWlCcrxpV6SQI7NREjHNgDZ/J/ciBMnA1W7y
         fraQ==
X-Gm-Message-State: AOJu0YzXJn+XPDJLDiPS245z6XONm2pP4FF+3CEPngiyAf4SX9Rh1ZMb
	1sx4HlWRhYgyDnWnNqCo0FSGaYqKFVeVIY/NGq6UgmoHHH6cPkT6CqCC1eLT/Rw6c8H+IBrr48q
	j
X-Gm-Gg: ASbGncvZ/fsj0m3xBLbJVDYu0nf7zVSjaBGpnCCAmsEkD2aXWwD1eRoBatp/OxPvICA
	sZP6oenBA5BRYgcYp/Q11XiVfTEyIq1gkUTtM4bL1uTD5qIzcvi2bEYmRGMM9FFuTGfjzx0QXPK
	G5g4ygk33qzOpGL6xoL0kesThfSCwEUcM0szWOg96O65DxS4IxCO+F8xjzyCdUToBvYXbs3Ifon
	T9Cy2/QVSssfd8v5Hk/+0eNEfJs3Kw8+WVM3WWsfdQKR4x5tqj/RXe9q4pM03u/PZ8GiY6RyL0/
	/9GU9cMgvJHP0fplyt/mh9ppvU9EpoZlCrYq9NM9ozov+iYVVt41Rwx81mJVHM4J7AkdDNpmxra
	faGrqRg==
X-Google-Smtp-Source: AGHT+IEsnlgH0FFKo3AtBbyCmD1GiyDttxMH48OUHaofyJ8Q5l0+Fpaqz7EH7SSw8KYzD1j2UHH7Pw==
X-Received: by 2002:a05:600c:4451:b0:439:8bb1:14b1 with SMTP id 5b1f17b1804b1-439ae1e8c88mr126527155e9.11.1740413235852;
        Mon, 24 Feb 2025 08:07:15 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 5/8] x86/IDT: Make idt_tables[] be per_cpu(idt)
Date: Mon, 24 Feb 2025 16:05:06 +0000
Message-Id: <20250224160509.1117847-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This can be a plain per_cpu() variable, and __read_mostly seeing as it's
allocated once and never touched again.

This removes a NR_CPU's sized structure, and improves NUMA locality of access
for both the the VT-x and SVM context switch paths.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/common.c      |  5 +++--
 xen/arch/x86/crash.c           |  8 ++++----
 xen/arch/x86/domain.c          |  2 +-
 xen/arch/x86/hvm/svm/svm.c     |  4 ++--
 xen/arch/x86/hvm/vmx/vmcs.c    |  2 +-
 xen/arch/x86/include/asm/idt.h |  3 ++-
 xen/arch/x86/machine_kexec.c   |  7 +++++--
 xen/arch/x86/smpboot.c         | 14 +++++++-------
 xen/arch/x86/traps-init.c      |  2 ++
 xen/arch/x86/traps.c           |  5 +----
 10 files changed, 28 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index e8b355ebcf36..b83dbc5dfbba 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -819,6 +819,7 @@ void load_system_tables(void)
 	 * support using ARRAY_SIZE against per-cpu variables.
 	 */
 	struct tss_page *tss_page = &this_cpu(tss_page);
+        idt_entry_t *idt = this_cpu(idt);
 
 	/* The TSS may be live.	 Disuade any clever optimisations. */
 	volatile struct tss64 *tss = &tss_page->tss;
@@ -830,7 +831,7 @@ void load_system_tables(void)
 		.limit = LAST_RESERVED_GDT_BYTE,
 	};
 	const struct desc_ptr idtr = {
-		.base = (unsigned long)idt_tables[cpu],
+		.base = (unsigned long)idt,
 		.limit = sizeof(bsp_idt) - 1,
 	};
 
@@ -914,7 +915,7 @@ void load_system_tables(void)
 	ltr(TSS_SELECTOR);
 	lldt(0);
 
-	enable_each_ist(idt_tables[cpu]);
+	enable_each_ist(idt);
 
 	/*
 	 * Bottom-of-stack must be 16-byte aligned!
diff --git a/xen/arch/x86/crash.c b/xen/arch/x86/crash.c
index 5f7d7b392a1f..1e4b0eeff21b 100644
--- a/xen/arch/x86/crash.c
+++ b/xen/arch/x86/crash.c
@@ -63,7 +63,7 @@ static int noreturn cf_check do_nmi_crash(
          * This update is safe from a security point of view, as this
          * pcpu is never going to try to sysret back to a PV vcpu.
          */
-        set_ist(&idt_tables[cpu][X86_EXC_MC], IST_NONE);
+        set_ist(&per_cpu(idt, cpu)[X86_EXC_MC], IST_NONE);
 
         kexec_crash_save_cpu();
         __stop_this_cpu();
@@ -120,6 +120,7 @@ static void nmi_shootdown_cpus(void)
 {
     unsigned long msecs;
     unsigned int cpu = smp_processor_id();
+    idt_entry_t *idt = this_cpu(idt);
 
     disable_lapic_nmi_watchdog();
     local_irq_disable();
@@ -133,9 +134,8 @@ static void nmi_shootdown_cpus(void)
      * Disable IST for MCEs to avoid stack corruption race conditions, and
      * change the NMI handler to a nop to avoid deviation from this codepath.
      */
-    _set_gate_lower(&idt_tables[cpu][X86_EXC_NMI],
-                    SYS_DESC_irq_gate, 0, &trap_nop);
-    set_ist(&idt_tables[cpu][X86_EXC_MC], IST_NONE);
+    _set_gate_lower(&idt[X86_EXC_NMI], SYS_DESC_irq_gate, 0, &trap_nop);
+    set_ist(&idt[X86_EXC_MC], IST_NONE);
 
     set_nmi_callback(do_nmi_crash);
     smp_send_nmi_allbutself();
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index d3db76833f3c..a42fa5480593 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -116,7 +116,7 @@ void play_dead(void)
     local_irq_disable();
 
     /* Change the NMI handler to a nop (see comment below). */
-    _set_gate_lower(&idt_tables[cpu][X86_EXC_NMI], SYS_DESC_irq_gate, 0,
+    _set_gate_lower(&this_cpu(idt)[X86_EXC_NMI], SYS_DESC_irq_gate, 0,
                     &trap_nop);
 
     /*
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index ea78da4f4210..4eac89964f61 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -915,7 +915,7 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
     svm_vmload_pa(per_cpu(host_vmcb, cpu));
 
     /* Resume use of ISTs now that the host TR is reinstated. */
-    enable_each_ist(idt_tables[cpu]);
+    enable_each_ist(per_cpu(idt, cpu));
 
     /*
      * Possibly clear previous guest selection of SSBD if set.  Note that
@@ -944,7 +944,7 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
      * Cannot use ISTs for NMI/#MC/#DF while we are running with the guest TR.
      * But this doesn't matter: the IST is only req'd to handle SYSCALL/SYSRET.
      */
-    disable_each_ist(idt_tables[cpu]);
+    disable_each_ist(per_cpu(idt, cpu));
 
     svm_restore_dr(v);
 
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 20ab2d0f266f..e47a6e1542b7 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -917,7 +917,7 @@ static void vmx_set_host_env(struct vcpu *v)
 
     __vmwrite(HOST_GDTR_BASE,
               (unsigned long)(this_cpu(gdt) - FIRST_RESERVED_GDT_ENTRY));
-    __vmwrite(HOST_IDTR_BASE, (unsigned long)idt_tables[cpu]);
+    __vmwrite(HOST_IDTR_BASE, (unsigned long)per_cpu(idt, cpu));
 
     __vmwrite(HOST_TR_BASE, (unsigned long)&per_cpu(tss_page, cpu).tss);
 
diff --git a/xen/arch/x86/include/asm/idt.h b/xen/arch/x86/include/asm/idt.h
index 29d1a7dfbc63..3e3acdfa7930 100644
--- a/xen/arch/x86/include/asm/idt.h
+++ b/xen/arch/x86/include/asm/idt.h
@@ -3,6 +3,7 @@
 #define X86_ASM_IDT_H
 
 #include <xen/bug.h>
+#include <xen/percpu.h>
 #include <xen/types.h>
 
 #include <asm/x86-defns.h>
@@ -30,7 +31,7 @@ typedef union {
 } idt_entry_t;
 
 extern idt_entry_t bsp_idt[X86_IDT_VECTORS];
-extern idt_entry_t *idt_tables[];
+DECLARE_PER_CPU(idt_entry_t *, idt);
 
 /*
  * Set the Interrupt Stack Table used by a particular IDT entry.  Typically
diff --git a/xen/arch/x86/machine_kexec.c b/xen/arch/x86/machine_kexec.c
index f775e526d59b..35fa5c82e9c2 100644
--- a/xen/arch/x86/machine_kexec.c
+++ b/xen/arch/x86/machine_kexec.c
@@ -170,9 +170,12 @@ void machine_kexec(struct kexec_image *image)
      */
     for ( i = 0; i < nr_cpu_ids; i++ )
     {
-        if ( idt_tables[i] == NULL )
+        idt_entry_t *idt = per_cpu(idt, i);
+
+        if ( !idt )
             continue;
-        _update_gate_addr_lower(&idt_tables[i][X86_EXC_MC], &trap_nop);
+
+        _update_gate_addr_lower(&idt[X86_EXC_MC], &trap_nop);
     }
 
     /* Reset CPUID masking and faulting to the host's default. */
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index dc65f9e45269..4e9f9ac4b2ee 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -863,7 +863,7 @@ int setup_cpu_root_pgt(unsigned int cpu)
         rc = clone_mapping(__va(__pa(stack_base[cpu])) + off, rpt);
 
     if ( !rc )
-        rc = clone_mapping(idt_tables[cpu], rpt);
+        rc = clone_mapping(per_cpu(idt, cpu), rpt);
     if ( !rc )
     {
         struct tss_page *ptr = &per_cpu(tss_page, cpu);
@@ -1009,7 +1009,7 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
     if ( remove )
     {
         FREE_XENHEAP_PAGE(per_cpu(gdt, cpu));
-        FREE_XENHEAP_PAGE(idt_tables[cpu]);
+        FREE_XENHEAP_PAGE(per_cpu(idt, cpu));
 
         if ( stack_base[cpu] )
         {
@@ -1076,12 +1076,12 @@ static int cpu_smpboot_alloc(unsigned int cpu)
     gdt[PER_CPU_GDT_ENTRY - FIRST_RESERVED_GDT_ENTRY].a = cpu;
 #endif
 
-    if ( idt_tables[cpu] == NULL )
-        idt_tables[cpu] = alloc_xenheap_pages(0, memflags);
-    if ( idt_tables[cpu] == NULL )
+    if ( per_cpu(idt, cpu) == NULL )
+        per_cpu(idt, cpu) = alloc_xenheap_pages(0, memflags);
+    if ( per_cpu(idt, cpu) == NULL )
         goto out;
-    memcpy(idt_tables[cpu], bsp_idt, sizeof(bsp_idt));
-    disable_each_ist(idt_tables[cpu]);
+    memcpy(per_cpu(idt, cpu), bsp_idt, sizeof(bsp_idt));
+    disable_each_ist(per_cpu(idt, cpu));
 
     for ( stub_page = 0, i = cpu & ~(STUBS_PER_PAGE - 1);
           i < nr_cpu_ids && i <= (cpu | (STUBS_PER_PAGE - 1)); ++i )
diff --git a/xen/arch/x86/traps-init.c b/xen/arch/x86/traps-init.c
index b172ea933607..ae600526cbe3 100644
--- a/xen/arch/x86/traps-init.c
+++ b/xen/arch/x86/traps-init.c
@@ -7,3 +7,5 @@
 
 idt_entry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
     bsp_idt[X86_IDT_VECTORS];
+
+DEFINE_PER_CPU_READ_MOSTLY(idt_entry_t *, idt);
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index f7965b3ffa50..aa3ed658def6 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -102,9 +102,6 @@ DEFINE_PER_CPU_READ_MOSTLY(seg_desc_t *, compat_gdt);
 DEFINE_PER_CPU_READ_MOSTLY(l1_pgentry_t, compat_gdt_l1e);
 #endif
 
-/* Pointer to the IDT of every CPU. */
-idt_entry_t *idt_tables[NR_CPUS] __read_mostly;
-
 /*
  * The TSS is smaller than a page, but we give it a full page to avoid
  * adjacent per-cpu data leaking via Meltdown when XPTI is in use.
@@ -2149,7 +2146,7 @@ void __init init_idt_traps(void)
     enable_each_ist(bsp_idt);
 
     /* CPU0 uses the master IDT. */
-    idt_tables[0] = bsp_idt;
+    this_cpu(idt) = bsp_idt;
 
     this_cpu(gdt) = boot_gdt;
     if ( IS_ENABLED(CONFIG_PV32) )
-- 
2.39.5



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42348A4F20E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 01:05:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901603.1309581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpcFt-0001Tg-56; Wed, 05 Mar 2025 00:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901603.1309581; Wed, 05 Mar 2025 00:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpcFt-0001QL-1h; Wed, 05 Mar 2025 00:04:57 +0000
Received: by outflank-mailman (input) for mailman id 901603;
 Wed, 05 Mar 2025 00:04:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pOX7=VY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tpcFr-0000xS-JF
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 00:04:55 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76f6f4c9-f955-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 01:04:53 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43bcc85ba13so10074555e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 16:04:53 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd435300esm476005e9.29.2025.03.04.16.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 16:04:51 -0800 (PST)
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
X-Inumbo-ID: 76f6f4c9-f955-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741133093; x=1741737893; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9sXR4B00rxpeLjY91mpMAUDngW7ntyXOjzmffpsYzw=;
        b=I0UVJyXQJFP1KBct7B+ZN3hSUoFFqN9gmBWQQG5BiSJPEzCMcNX7ivYBZFMM5VjPGK
         tgKOaBKvz1zGxifJGVqHpddac/HCM/8NRDrd2qo6irOmn7jyFhlONOYdb/iIheb39bDm
         AUOcrbAHn119VReS4uuksfUNwaUCWadk3hieo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741133093; x=1741737893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9sXR4B00rxpeLjY91mpMAUDngW7ntyXOjzmffpsYzw=;
        b=rnaMHaSf/9V9d576As1o6Hja8QjthOP0YykVMy7Tgueuhn8X+TV4GrhZJpZ4Pe/kEl
         FQxoGe9ie/kgrXl/dtWUEjs6qoub5jet5XaVpNhPZOFblymkCB2d6Z3BBUNgyH0+8m0a
         +4FZjpmQEwn6PvWLp4E2YORP4Qm+Se24XuAOXQdM+tGZZ4O6eKpCzvEgYl+GxVy8jSl/
         zKV5vTiHDV6HlY2OrejXorEHPWXuOAQIlMedSbltK0IM8/H9Qi0nTAS9m2yEuOhc1D5O
         yAvoY1CCIQ1HCH1oedGbObd7w+uUJt9bTnGnZWJEwE1lPPknrVeZqhRegh/Vbvn16HQ5
         2IXw==
X-Gm-Message-State: AOJu0Yz87yPx9VOJZkGlNTGJVWWCaiuiAeJvWBlSgUE45HqkAkLv0sQN
	VpBU13qospdDg/EPl2HWRGuO70NYEms8MvPy/l9zdB0/CltKDU6/lMg8xXIpNQKEn1XoJHb8no/
	0
X-Gm-Gg: ASbGncs7U759FXSkeZO/6/jkGJxSWN+xHUvod4+FzJqV4p/XwqXnD+vixADBWLJj+GD
	P45P3VT9dycVB7vF5tJY+x3KAvDwbUOd+AggpHGrBxhLP04qJuLud+b/VCUwbIeXCSHabDi6bDy
	ZjM9zv97O5bpCdwZIkEv4o3xM/zlPX4apgsGKSEJXFkB7grZALcfRP7CIIzD9yLbft+eZtT1B7M
	nuWq/gN5Jt1jq+C7vHMZsXBFVL9Dta70PdItcCuBCc3KR8R18JUyqbQpEQknGBXyB0rxQJgxrwP
	dL65BOtC4JcTnQEQ3q70oIPF5yCAi+NE/F6V1xsPXM00edx1WCuqclnOiBpqmGQVSKSU5ghnK+P
	/Esfm8nam2F0KHAuFlRzeKbKM
X-Google-Smtp-Source: AGHT+IHP+0uT8dgdZWC1xPVMkBTXEOsWpSy7NrucFWSAtnUNkWxStcFnToWHa9k0gv2T8km+QHaALQ==
X-Received: by 2002:a05:600c:190d:b0:43b:cf9c:6ffc with SMTP id 5b1f17b1804b1-43bd298a59emr5646735e9.12.1741133092806;
        Tue, 04 Mar 2025 16:04:52 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 2/5] x86/IDT: Make idt_tables[] be per_cpu(idt)
Date: Wed,  5 Mar 2025 00:02:44 +0000
Message-Id: <20250305000247.2772029-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250305000247.2772029-1-andrew.cooper3@citrix.com>
References: <20250305000247.2772029-1-andrew.cooper3@citrix.com>
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
 xen/arch/x86/traps-setup.c     |  2 ++
 xen/arch/x86/traps.c           |  5 +----
 10 files changed, 28 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index e8b355ebcf36..e8d4ca3203be 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -819,6 +819,7 @@ void load_system_tables(void)
 	 * support using ARRAY_SIZE against per-cpu variables.
 	 */
 	struct tss_page *tss_page = &this_cpu(tss_page);
+	idt_entry_t *idt = this_cpu(idt);
 
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
index f00368f28c86..d795798d3eca 100644
--- a/xen/arch/x86/include/asm/idt.h
+++ b/xen/arch/x86/include/asm/idt.h
@@ -3,6 +3,7 @@
 #define X86_ASM_IDT_H
 
 #include <xen/bug.h>
+#include <xen/percpu.h>
 
 #include <asm/x86-defns.h>
 
@@ -29,7 +30,7 @@ typedef union {
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
diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
index b172ea933607..ae600526cbe3 100644
--- a/xen/arch/x86/traps-setup.c
+++ b/xen/arch/x86/traps-setup.c
@@ -7,3 +7,5 @@
 
 idt_entry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
     bsp_idt[X86_IDT_VECTORS];
+
+DEFINE_PER_CPU_READ_MOSTLY(idt_entry_t *, idt);
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 7a68996b02f7..d52840848d30 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -98,9 +98,6 @@ DEFINE_PER_CPU_READ_MOSTLY(seg_desc_t *, compat_gdt);
 DEFINE_PER_CPU_READ_MOSTLY(l1_pgentry_t, compat_gdt_l1e);
 #endif
 
-/* Pointer to the IDT of every CPU. */
-idt_entry_t *idt_tables[NR_CPUS] __read_mostly;
-
 /*
  * The TSS is smaller than a page, but we give it a full page to avoid
  * adjacent per-cpu data leaking via Meltdown when XPTI is in use.
@@ -1939,7 +1936,7 @@ void __init init_idt_traps(void)
     enable_each_ist(bsp_idt);
 
     /* CPU0 uses the master IDT. */
-    idt_tables[0] = bsp_idt;
+    this_cpu(idt) = bsp_idt;
 
     this_cpu(gdt) = boot_gdt;
     if ( IS_ENABLED(CONFIG_PV32) )
-- 
2.39.5



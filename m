Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DE8B1EF77
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 22:23:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075029.1437564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTck-0000AK-Ts; Fri, 08 Aug 2025 20:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075029.1437564; Fri, 08 Aug 2025 20:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTck-0008QO-Fl; Fri, 08 Aug 2025 20:23:34 +0000
Received: by outflank-mailman (input) for mailman id 1075029;
 Fri, 08 Aug 2025 20:23:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukTch-0005tJ-BX
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 20:23:31 +0000
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bc4cbd6-7495-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 22:23:29 +0200 (CEST)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-4563cfac2d2so21412155e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 13:23:29 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075047fsm103989805e9.1.2025.08.08.13.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 13:23:27 -0700 (PDT)
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
X-Inumbo-ID: 8bc4cbd6-7495-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754684608; x=1755289408; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYSlQMm9Cg/ibksse8IJEEki/WS5Q2289Zk24bEsFVE=;
        b=O+MWar/pr97dbrLMpDU6MvM5coRi3QBfY2a261nJsuo319lXp3m1QfAGZ/3K58WeV/
         p7FrFTBJxahO5llVQcRfu6MwyV6Iju8t/eBHtIZwHtTSlo0O06UaLd5GXMV3Milffy17
         yn+O2E/JhDR4NuFdGjnCrOk1yXTl5+umwMLxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754684608; x=1755289408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYSlQMm9Cg/ibksse8IJEEki/WS5Q2289Zk24bEsFVE=;
        b=AYFbBJZa1qIy57hUzT7dC47j6ZLP/+N6bpB2xau9EGxb/2zbBB1THUIdXkKjg9wpOm
         OzMcj0SImCeRy5QMf8a+mviZD1f7zuSQRYe2UJeZSO1m9dITOiCJDwNxOzm9SFX65H3S
         O8AIR9bpRVnFHo/AonzkwQSI7a5d2k9p7FAitn5LR8d9q3e/onA1pWjr25sub85bcfYx
         +wFX+4RCimmjAkRZBdl/2A1907b7QR9XE3rAd5ySuNz+n3I7YH+7yQN1bUHiqp/duP85
         vStIc/ggi/XHpx0yEf9e2M5/RLmbzpW39ccdfUzhdv5jiUoFFrmHa188g/KxLw1e8cBO
         NQ6g==
X-Gm-Message-State: AOJu0YxEA7Sc8hCkakM9M4Z7KxbHfiAvFCR3h/FCSgCiJqu7uEvz5SDr
	TSESKd01gtmcx5PquUq6O3/6YpHKsyfzraZsDEqLSUqqcI5yuRBvcIUcVQrpbNRmDboIsZhb9F+
	PH6l645VSGg==
X-Gm-Gg: ASbGncsqBeds1hCYM4QgjB9XU0S9uhigvabn4mBy2SRcysiRbOUeXAOxjf16fkkzKZN
	Wq+WGVuuWvO5cnJkP+e8wweabeWL4rJhc6eZRuaMp6wj9FJioCGWzciAk5xWq3D27tQ+xKgx47i
	ilz4Y1g4j2nXM+cUMwtqR+krQUUrJg+vvoETZ/GXXqz5HLXufM+6oJ7AL9Ms7qvPwE2/dgxgmiU
	8HUJ/sZPH5uvRCo3Btj0qvi1KfyiJteGMRKF2V2C14q+C1QJZF2wahVUMi5ucEvV7RMl5aqsq4R
	HxD3YxhYUqfGlNKQgU6XnBQ9d0g8G3+48gAcmJI9Qofu40ZwGaiSBA9RazTrK92ickvAWXsKvnD
	AWbnOBXXZQ5H6tP8qscKJWeaNdbwr7aSVPrXjieTnStAixlPGYOvx91K5UOxOXL01OEe4S6hACr
	M8tRcVVux/bk4=
X-Google-Smtp-Source: AGHT+IHhtFes+Q8CMqJAxDSkbc1Og9KmkGx4Itl9VotfFtVd/SioKsjGcSsC8M31fmd9tARYk80H8w==
X-Received: by 2002:a05:600c:4e91:b0:453:6ca:16b1 with SMTP id 5b1f17b1804b1-459f4f144e5mr37960055e9.26.1754684608285;
        Fri, 08 Aug 2025 13:23:28 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 11/22] x86/traps: Fold x86_64/traps.c into traps.c
Date: Fri,  8 Aug 2025 21:23:03 +0100
Message-Id: <20250808202314.1045968-12-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's now just the double fault handler and various state dumping functions.

Swap u64 for uint64_t, and fix a few other minor style issues.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/traps.c         | 291 +++++++++++++++++++++++++++++++
 xen/arch/x86/x86_64/Makefile |   1 -
 xen/arch/x86/x86_64/traps.c  | 322 -----------------------------------
 3 files changed, 291 insertions(+), 323 deletions(-)
 delete mode 100644 xen/arch/x86/x86_64/traps.c

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 238d923dd188..ab8ff36acfe6 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -26,6 +26,7 @@
 #include <xen/sched.h>
 #include <xen/softirq.h>
 #include <xen/trace.h>
+#include <xen/version.h>
 #include <xen/watchdog.h>
 
 #include <asm/apic.h>
@@ -87,6 +88,272 @@ const unsigned int nmi_cpu;
 #define stack_words_per_line 4
 #define ESP_BEFORE_EXCEPTION(regs) ((unsigned long *)(regs)->rsp)
 
+struct extra_state
+{
+    unsigned long cr0, cr2, cr3, cr4;
+    unsigned long fsb, gsb, gss;
+    uint16_t ds, es, fs, gs;
+};
+
+static void print_xen_info(void)
+{
+    char taint_str[TAINT_STRING_MAX_LEN];
+
+    printk("----[ Xen-%d.%d%s  x86_64  %s  %s ]----\n",
+           xen_major_version(), xen_minor_version(), xen_extra_version(),
+           xen_build_info(), print_tainted(taint_str));
+}
+
+enum context {
+    CTXT_hypervisor,
+    CTXT_pv_guest,
+    CTXT_hvm_guest,
+};
+
+static void read_registers(struct extra_state *state)
+{
+    state->cr0 = read_cr0();
+    state->cr2 = read_cr2();
+    state->cr3 = read_cr3();
+    state->cr4 = read_cr4();
+
+    state->fsb = read_fs_base();
+    state->gsb = read_gs_base();
+    state->gss = read_gs_shadow();
+
+    asm ( "mov %%ds, %0" : "=m" (state->ds) );
+    asm ( "mov %%es, %0" : "=m" (state->es) );
+    asm ( "mov %%fs, %0" : "=m" (state->fs) );
+    asm ( "mov %%gs, %0" : "=m" (state->gs) );
+}
+
+static void get_hvm_registers(struct vcpu *v, struct cpu_user_regs *regs,
+                              struct extra_state *state)
+{
+    struct segment_register sreg;
+
+    state->cr0 = v->arch.hvm.guest_cr[0];
+    state->cr2 = v->arch.hvm.guest_cr[2];
+    state->cr3 = v->arch.hvm.guest_cr[3];
+    state->cr4 = v->arch.hvm.guest_cr[4];
+
+    hvm_get_segment_register(v, x86_seg_cs, &sreg);
+    regs->cs = sreg.sel;
+
+    hvm_get_segment_register(v, x86_seg_ds, &sreg);
+    state->ds = sreg.sel;
+
+    hvm_get_segment_register(v, x86_seg_es, &sreg);
+    state->es = sreg.sel;
+
+    hvm_get_segment_register(v, x86_seg_fs, &sreg);
+    state->fs = sreg.sel;
+    state->fsb = sreg.base;
+
+    hvm_get_segment_register(v, x86_seg_gs, &sreg);
+    state->gs = sreg.sel;
+    state->gsb = sreg.base;
+
+    hvm_get_segment_register(v, x86_seg_ss, &sreg);
+    regs->ss = sreg.sel;
+
+    state->gss = hvm_get_reg(v, MSR_SHADOW_GS_BASE);
+}
+
+static void _show_registers(
+    const struct cpu_user_regs *regs, const struct extra_state *state,
+    enum context context, const struct vcpu *v)
+{
+    static const char *const context_names[] = {
+        [CTXT_hypervisor] = "hypervisor",
+        [CTXT_pv_guest]   = "pv guest",
+        [CTXT_hvm_guest]  = "hvm guest",
+    };
+
+    printk("RIP:    %04x:[<%016lx>]", regs->cs, regs->rip);
+    if ( context == CTXT_hypervisor )
+        printk(" %pS", _p(regs->rip));
+    printk("\nRFLAGS: %016lx   ", regs->rflags);
+    if ( (context == CTXT_pv_guest) && v && v->vcpu_info_area.map )
+        printk("EM: %d   ", !!vcpu_info(v, evtchn_upcall_mask));
+    printk("CONTEXT: %s", context_names[context]);
+    if ( v && !is_idle_vcpu(v) )
+        printk(" (%pv)", v);
+
+    printk("\nrax: %016lx   rbx: %016lx   rcx: %016lx\n",
+           regs->rax, regs->rbx, regs->rcx);
+    printk("rdx: %016lx   rsi: %016lx   rdi: %016lx\n",
+           regs->rdx, regs->rsi, regs->rdi);
+    printk("rbp: %016lx   rsp: %016lx   r8:  %016lx\n",
+           regs->rbp, regs->rsp, regs->r8);
+    printk("r9:  %016lx   r10: %016lx   r11: %016lx\n",
+           regs->r9,  regs->r10, regs->r11);
+    printk("r12: %016lx   r13: %016lx   r14: %016lx\n",
+           regs->r12, regs->r13, regs->r14);
+    printk("r15: %016lx   cr0: %016lx   cr4: %016lx\n",
+           regs->r15, state->cr0, state->cr4);
+    printk("cr3: %016lx   cr2: %016lx\n", state->cr3, state->cr2);
+    printk("fsb: %016lx   gsb: %016lx   gss: %016lx\n",
+           state->fsb, state->gsb, state->gss);
+    printk("ds: %04x   es: %04x   fs: %04x   gs: %04x   ss: %04x   cs: %04x\n",
+           state->ds, state->es, state->fs,
+           state->gs, regs->ss, regs->cs);
+}
+
+void show_registers(const struct cpu_user_regs *regs)
+{
+    struct cpu_user_regs fault_regs = *regs;
+    struct extra_state fault_state;
+    enum context context;
+    struct vcpu *v = system_state >= SYS_STATE_smp_boot ? current : NULL;
+
+    if ( guest_mode(regs) && is_hvm_vcpu(v) )
+    {
+        get_hvm_registers(v, &fault_regs, &fault_state);
+        context = CTXT_hvm_guest;
+    }
+    else
+    {
+        read_registers(&fault_state);
+
+        if ( guest_mode(regs) )
+        {
+            context = CTXT_pv_guest;
+            fault_state.cr2 = arch_get_cr2(v);
+        }
+        else
+        {
+            context = CTXT_hypervisor;
+        }
+    }
+
+    print_xen_info();
+    printk("CPU:    %d\n", smp_processor_id());
+    _show_registers(&fault_regs, &fault_state, context, v);
+
+    if ( ler_msr && !guest_mode(regs) )
+    {
+        uint64_t from, to;
+
+        rdmsrl(ler_msr, from);
+        rdmsrl(ler_msr + 1, to);
+
+        /* Upper bits may store metadata.  Re-canonicalise for printing. */
+        printk("ler: from %016"PRIx64" [%ps]\n",
+               from, _p(canonicalise_addr(from)));
+        printk("       to %016"PRIx64" [%ps]\n",
+               to, _p(canonicalise_addr(to)));
+    }
+}
+
+void vcpu_show_registers(struct vcpu *v)
+{
+    const struct cpu_user_regs *regs = &v->arch.user_regs;
+    struct cpu_user_regs aux_regs;
+    struct extra_state state;
+    enum context context;
+
+    if ( is_hvm_vcpu(v) )
+    {
+        aux_regs = *regs;
+        get_hvm_registers(v, &aux_regs, &state);
+        regs = &aux_regs;
+        context = CTXT_hvm_guest;
+    }
+    else
+    {
+        bool kernel = guest_kernel_mode(v, regs);
+        unsigned long gsb, gss;
+
+        state.cr0 = v->arch.pv.ctrlreg[0];
+        state.cr2 = arch_get_cr2(v);
+        state.cr3 = pagetable_get_paddr(kernel
+                                        ? v->arch.guest_table
+                                        : v->arch.guest_table_user);
+        state.cr4 = v->arch.pv.ctrlreg[4];
+
+        gsb = v->arch.pv.gs_base_user;
+        gss = v->arch.pv.gs_base_kernel;
+        if ( kernel )
+            SWAP(gsb, gss);
+
+        state.fsb = v->arch.pv.fs_base;
+        state.gsb = gsb;
+        state.gss = gss;
+
+        state.ds = v->arch.pv.ds;
+        state.es = v->arch.pv.es;
+        state.fs = v->arch.pv.fs;
+        state.gs = v->arch.pv.gs;
+
+        context = CTXT_pv_guest;
+    }
+
+    _show_registers(regs, &state, context, v);
+}
+
+void show_page_walk(unsigned long addr)
+{
+    unsigned long pfn, mfn = read_cr3() >> PAGE_SHIFT;
+    l4_pgentry_t l4e, *l4t;
+    l3_pgentry_t l3e, *l3t;
+    l2_pgentry_t l2e, *l2t;
+    l1_pgentry_t l1e, *l1t;
+
+    printk("Pagetable walk from %016lx:\n", addr);
+    if ( !is_canonical_address(addr) )
+        return;
+
+    l4t = map_domain_page(_mfn(mfn));
+    l4e = l4t[l4_table_offset(addr)];
+    unmap_domain_page(l4t);
+    mfn = l4e_get_pfn(l4e);
+    pfn = mfn_valid(_mfn(mfn)) && machine_to_phys_mapping_valid ?
+          get_gpfn_from_mfn(mfn) : INVALID_M2P_ENTRY;
+    printk(" L4[0x%03lx] = %"PRIpte" %016lx\n",
+           l4_table_offset(addr), l4e_get_intpte(l4e), pfn);
+    if ( !(l4e_get_flags(l4e) & _PAGE_PRESENT) ||
+         !mfn_valid(_mfn(mfn)) )
+        return;
+
+    l3t = map_domain_page(_mfn(mfn));
+    l3e = l3t[l3_table_offset(addr)];
+    unmap_domain_page(l3t);
+    mfn = l3e_get_pfn(l3e);
+    pfn = mfn_valid(_mfn(mfn)) && machine_to_phys_mapping_valid ?
+          get_gpfn_from_mfn(mfn) : INVALID_M2P_ENTRY;
+    printk(" L3[0x%03lx] = %"PRIpte" %016lx%s\n",
+           l3_table_offset(addr), l3e_get_intpte(l3e), pfn,
+           (l3e_get_flags(l3e) & _PAGE_PSE) ? " (PSE)" : "");
+    if ( !(l3e_get_flags(l3e) & _PAGE_PRESENT) ||
+         (l3e_get_flags(l3e) & _PAGE_PSE) ||
+         !mfn_valid(_mfn(mfn)) )
+        return;
+
+    l2t = map_domain_page(_mfn(mfn));
+    l2e = l2t[l2_table_offset(addr)];
+    unmap_domain_page(l2t);
+    mfn = l2e_get_pfn(l2e);
+    pfn = mfn_valid(_mfn(mfn)) && machine_to_phys_mapping_valid ?
+          get_gpfn_from_mfn(mfn) : INVALID_M2P_ENTRY;
+    printk(" L2[0x%03lx] = %"PRIpte" %016lx%s\n",
+           l2_table_offset(addr), l2e_get_intpte(l2e), pfn,
+           (l2e_get_flags(l2e) & _PAGE_PSE) ? " (PSE)" : "");
+    if ( !(l2e_get_flags(l2e) & _PAGE_PRESENT) ||
+         (l2e_get_flags(l2e) & _PAGE_PSE) ||
+         !mfn_valid(_mfn(mfn)) )
+        return;
+
+    l1t = map_domain_page(_mfn(mfn));
+    l1e = l1t[l1_table_offset(addr)];
+    unmap_domain_page(l1t);
+    mfn = l1e_get_pfn(l1e);
+    pfn = mfn_valid(_mfn(mfn)) && machine_to_phys_mapping_valid ?
+          get_gpfn_from_mfn(mfn) : INVALID_M2P_ENTRY;
+    printk(" L1[0x%03lx] = %"PRIpte" %016lx\n",
+           l1_table_offset(addr), l1e_get_intpte(l1e), pfn);
+}
+
 void show_code(const struct cpu_user_regs *regs)
 {
     unsigned char insns_before[8] = {}, insns_after[16] = {};
@@ -762,6 +1029,30 @@ const char *vector_name(unsigned int vec)
     return (vec < ARRAY_SIZE(names) && names[vec][0]) ? names[vec] : "???";
 }
 
+void asmlinkage do_double_fault(struct cpu_user_regs *regs)
+{
+    unsigned int cpu;
+    struct extra_state state;
+
+    console_force_unlock();
+
+    asm ( "lsll %[sel], %[limit]" : [limit] "=r" (cpu)
+                                  : [sel] "r" (PER_CPU_SELECTOR) );
+
+    /* Find information saved during fault and dump it to the console. */
+    printk("*** DOUBLE FAULT ***\n");
+    print_xen_info();
+
+    read_registers(&state);
+
+    printk("CPU:    %d\n", cpu);
+    _show_registers(regs, &state, CTXT_hypervisor, NULL);
+    show_code(regs);
+    show_stack_overflow(cpu, regs);
+
+    panic("DOUBLE FAULT -- system shutdown\n");
+}
+
 /*
  * This is called for faults at very unexpected times (e.g., when interrupts
  * are disabled). In such situations we can't do much that is safe. We try to
diff --git a/xen/arch/x86/x86_64/Makefile b/xen/arch/x86/x86_64/Makefile
index 472b2bab523d..f20763088740 100644
--- a/xen/arch/x86/x86_64/Makefile
+++ b/xen/arch/x86/x86_64/Makefile
@@ -1,7 +1,6 @@
 obj-$(CONFIG_PV32) += compat/
 
 obj-bin-y += entry.o
-obj-y += traps.o
 obj-$(CONFIG_KEXEC) += machine_kexec.o
 obj-y += pci.o
 obj-y += acpi_mmcfg.o
diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
deleted file mode 100644
index 81e64466e47e..000000000000
--- a/xen/arch/x86/x86_64/traps.c
+++ /dev/null
@@ -1,322 +0,0 @@
-#include <xen/console.h>
-#include <xen/errno.h>
-#include <xen/guest_access.h>
-#include <xen/hypercall.h>
-#include <xen/init.h>
-#include <xen/irq.h>
-#include <xen/lib.h>
-#include <xen/mm.h>
-#include <xen/sched.h>
-#include <xen/shutdown.h>
-#include <xen/symbols.h>
-#include <xen/version.h>
-#include <xen/watchdog.h>
-
-#include <asm/current.h>
-#include <asm/endbr.h>
-#include <asm/event.h>
-#include <asm/flushtlb.h>
-#include <asm/hvm/hvm.h>
-#include <asm/msr.h>
-#include <asm/nmi.h>
-#include <asm/page.h>
-#include <asm/shared.h>
-#include <asm/stubs.h>
-#include <asm/traps.h>
-
-struct extra_state
-{
-    unsigned long cr0, cr2, cr3, cr4;
-    unsigned long fsb, gsb, gss;
-    uint16_t ds, es, fs, gs;
-};
-
-static void print_xen_info(void)
-{
-    char taint_str[TAINT_STRING_MAX_LEN];
-
-    printk("----[ Xen-%d.%d%s  x86_64  %s  %s ]----\n",
-           xen_major_version(), xen_minor_version(), xen_extra_version(),
-           xen_build_info(), print_tainted(taint_str));
-}
-
-enum context { CTXT_hypervisor, CTXT_pv_guest, CTXT_hvm_guest };
-
-static void read_registers(struct extra_state *state)
-{
-    state->cr0 = read_cr0();
-    state->cr2 = read_cr2();
-    state->cr3 = read_cr3();
-    state->cr4 = read_cr4();
-
-    state->fsb = read_fs_base();
-    state->gsb = read_gs_base();
-    state->gss = read_gs_shadow();
-
-    asm ( "mov %%ds, %0" : "=m" (state->ds) );
-    asm ( "mov %%es, %0" : "=m" (state->es) );
-    asm ( "mov %%fs, %0" : "=m" (state->fs) );
-    asm ( "mov %%gs, %0" : "=m" (state->gs) );
-}
-
-static void get_hvm_registers(struct vcpu *v, struct cpu_user_regs *regs,
-                              struct extra_state *state)
-{
-    struct segment_register sreg;
-
-    state->cr0 = v->arch.hvm.guest_cr[0];
-    state->cr2 = v->arch.hvm.guest_cr[2];
-    state->cr3 = v->arch.hvm.guest_cr[3];
-    state->cr4 = v->arch.hvm.guest_cr[4];
-
-    hvm_get_segment_register(v, x86_seg_cs, &sreg);
-    regs->cs = sreg.sel;
-
-    hvm_get_segment_register(v, x86_seg_ds, &sreg);
-    state->ds = sreg.sel;
-
-    hvm_get_segment_register(v, x86_seg_es, &sreg);
-    state->es = sreg.sel;
-
-    hvm_get_segment_register(v, x86_seg_fs, &sreg);
-    state->fs = sreg.sel;
-    state->fsb = sreg.base;
-
-    hvm_get_segment_register(v, x86_seg_gs, &sreg);
-    state->gs = sreg.sel;
-    state->gsb = sreg.base;
-
-    hvm_get_segment_register(v, x86_seg_ss, &sreg);
-    regs->ss = sreg.sel;
-
-    state->gss = hvm_get_reg(v, MSR_SHADOW_GS_BASE);
-}
-
-static void _show_registers(
-    const struct cpu_user_regs *regs, const struct extra_state *state,
-    enum context context, const struct vcpu *v)
-{
-    static const char *const context_names[] = {
-        [CTXT_hypervisor] = "hypervisor",
-        [CTXT_pv_guest]   = "pv guest",
-        [CTXT_hvm_guest]  = "hvm guest"
-    };
-
-    printk("RIP:    %04x:[<%016lx>]", regs->cs, regs->rip);
-    if ( context == CTXT_hypervisor )
-        printk(" %pS", _p(regs->rip));
-    printk("\nRFLAGS: %016lx   ", regs->rflags);
-    if ( (context == CTXT_pv_guest) && v && v->vcpu_info_area.map )
-        printk("EM: %d   ", !!vcpu_info(v, evtchn_upcall_mask));
-    printk("CONTEXT: %s", context_names[context]);
-    if ( v && !is_idle_vcpu(v) )
-        printk(" (%pv)", v);
-
-    printk("\nrax: %016lx   rbx: %016lx   rcx: %016lx\n",
-           regs->rax, regs->rbx, regs->rcx);
-    printk("rdx: %016lx   rsi: %016lx   rdi: %016lx\n",
-           regs->rdx, regs->rsi, regs->rdi);
-    printk("rbp: %016lx   rsp: %016lx   r8:  %016lx\n",
-           regs->rbp, regs->rsp, regs->r8);
-    printk("r9:  %016lx   r10: %016lx   r11: %016lx\n",
-           regs->r9,  regs->r10, regs->r11);
-    printk("r12: %016lx   r13: %016lx   r14: %016lx\n",
-           regs->r12, regs->r13, regs->r14);
-    printk("r15: %016lx   cr0: %016lx   cr4: %016lx\n",
-           regs->r15, state->cr0, state->cr4);
-    printk("cr3: %016lx   cr2: %016lx\n", state->cr3, state->cr2);
-    printk("fsb: %016lx   gsb: %016lx   gss: %016lx\n",
-           state->fsb, state->gsb, state->gss);
-    printk("ds: %04x   es: %04x   fs: %04x   gs: %04x   "
-           "ss: %04x   cs: %04x\n",
-           state->ds, state->es, state->fs,
-           state->gs, regs->ss, regs->cs);
-}
-
-void show_registers(const struct cpu_user_regs *regs)
-{
-    struct cpu_user_regs fault_regs = *regs;
-    struct extra_state fault_state;
-    enum context context;
-    struct vcpu *v = system_state >= SYS_STATE_smp_boot ? current : NULL;
-
-    if ( guest_mode(regs) && is_hvm_vcpu(v) )
-    {
-        get_hvm_registers(v, &fault_regs, &fault_state);
-        context = CTXT_hvm_guest;
-    }
-    else
-    {
-        read_registers(&fault_state);
-
-        if ( guest_mode(regs) )
-        {
-            context = CTXT_pv_guest;
-            fault_state.cr2 = arch_get_cr2(v);
-        }
-        else
-        {
-            context = CTXT_hypervisor;
-        }
-    }
-
-    print_xen_info();
-    printk("CPU:    %d\n", smp_processor_id());
-    _show_registers(&fault_regs, &fault_state, context, v);
-
-    if ( ler_msr && !guest_mode(regs) )
-    {
-        u64 from, to;
-
-        rdmsrl(ler_msr, from);
-        rdmsrl(ler_msr + 1, to);
-
-        /* Upper bits may store metadata.  Re-canonicalise for printing. */
-        printk("ler: from %016"PRIx64" [%ps]\n",
-               from, _p(canonicalise_addr(from)));
-        printk("       to %016"PRIx64" [%ps]\n",
-               to, _p(canonicalise_addr(to)));
-    }
-}
-
-void vcpu_show_registers(struct vcpu *v)
-{
-    const struct cpu_user_regs *regs = &v->arch.user_regs;
-    struct cpu_user_regs aux_regs;
-    struct extra_state state;
-    enum context context;
-
-    if ( is_hvm_vcpu(v) )
-    {
-        aux_regs = *regs;
-        get_hvm_registers(v, &aux_regs, &state);
-        regs = &aux_regs;
-        context = CTXT_hvm_guest;
-    }
-    else
-    {
-        bool kernel = guest_kernel_mode(v, regs);
-        unsigned long gsb, gss;
-
-        state.cr0 = v->arch.pv.ctrlreg[0];
-        state.cr2 = arch_get_cr2(v);
-        state.cr3 = pagetable_get_paddr(kernel
-                                        ? v->arch.guest_table
-                                        : v->arch.guest_table_user);
-        state.cr4 = v->arch.pv.ctrlreg[4];
-
-        gsb = v->arch.pv.gs_base_user;
-        gss = v->arch.pv.gs_base_kernel;
-        if ( kernel )
-            SWAP(gsb, gss);
-
-        state.fsb = v->arch.pv.fs_base;
-        state.gsb = gsb;
-        state.gss = gss;
-
-        state.ds = v->arch.pv.ds;
-        state.es = v->arch.pv.es;
-        state.fs = v->arch.pv.fs;
-        state.gs = v->arch.pv.gs;
-
-        context = CTXT_pv_guest;
-    }
-
-    _show_registers(regs, &state, context, v);
-}
-
-void show_page_walk(unsigned long addr)
-{
-    unsigned long pfn, mfn = read_cr3() >> PAGE_SHIFT;
-    l4_pgentry_t l4e, *l4t;
-    l3_pgentry_t l3e, *l3t;
-    l2_pgentry_t l2e, *l2t;
-    l1_pgentry_t l1e, *l1t;
-
-    printk("Pagetable walk from %016lx:\n", addr);
-    if ( !is_canonical_address(addr) )
-        return;
-
-    l4t = map_domain_page(_mfn(mfn));
-    l4e = l4t[l4_table_offset(addr)];
-    unmap_domain_page(l4t);
-    mfn = l4e_get_pfn(l4e);
-    pfn = mfn_valid(_mfn(mfn)) && machine_to_phys_mapping_valid ?
-          get_gpfn_from_mfn(mfn) : INVALID_M2P_ENTRY;
-    printk(" L4[0x%03lx] = %"PRIpte" %016lx\n",
-           l4_table_offset(addr), l4e_get_intpte(l4e), pfn);
-    if ( !(l4e_get_flags(l4e) & _PAGE_PRESENT) ||
-         !mfn_valid(_mfn(mfn)) )
-        return;
-
-    l3t = map_domain_page(_mfn(mfn));
-    l3e = l3t[l3_table_offset(addr)];
-    unmap_domain_page(l3t);
-    mfn = l3e_get_pfn(l3e);
-    pfn = mfn_valid(_mfn(mfn)) && machine_to_phys_mapping_valid ?
-          get_gpfn_from_mfn(mfn) : INVALID_M2P_ENTRY;
-    printk(" L3[0x%03lx] = %"PRIpte" %016lx%s\n",
-           l3_table_offset(addr), l3e_get_intpte(l3e), pfn,
-           (l3e_get_flags(l3e) & _PAGE_PSE) ? " (PSE)" : "");
-    if ( !(l3e_get_flags(l3e) & _PAGE_PRESENT) ||
-         (l3e_get_flags(l3e) & _PAGE_PSE) ||
-         !mfn_valid(_mfn(mfn)) )
-        return;
-
-    l2t = map_domain_page(_mfn(mfn));
-    l2e = l2t[l2_table_offset(addr)];
-    unmap_domain_page(l2t);
-    mfn = l2e_get_pfn(l2e);
-    pfn = mfn_valid(_mfn(mfn)) && machine_to_phys_mapping_valid ?
-          get_gpfn_from_mfn(mfn) : INVALID_M2P_ENTRY;
-    printk(" L2[0x%03lx] = %"PRIpte" %016lx%s\n",
-           l2_table_offset(addr), l2e_get_intpte(l2e), pfn,
-           (l2e_get_flags(l2e) & _PAGE_PSE) ? " (PSE)" : "");
-    if ( !(l2e_get_flags(l2e) & _PAGE_PRESENT) ||
-         (l2e_get_flags(l2e) & _PAGE_PSE) ||
-         !mfn_valid(_mfn(mfn)) )
-        return;
-
-    l1t = map_domain_page(_mfn(mfn));
-    l1e = l1t[l1_table_offset(addr)];
-    unmap_domain_page(l1t);
-    mfn = l1e_get_pfn(l1e);
-    pfn = mfn_valid(_mfn(mfn)) && machine_to_phys_mapping_valid ?
-          get_gpfn_from_mfn(mfn) : INVALID_M2P_ENTRY;
-    printk(" L1[0x%03lx] = %"PRIpte" %016lx\n",
-           l1_table_offset(addr), l1e_get_intpte(l1e), pfn);
-}
-
-void asmlinkage noreturn do_double_fault(struct cpu_user_regs *regs)
-{
-    unsigned int cpu;
-    struct extra_state state;
-
-    console_force_unlock();
-
-    asm ( "lsll %[sel], %[limit]" : [limit] "=r" (cpu)
-                                  : [sel] "r" (PER_CPU_SELECTOR) );
-
-    /* Find information saved during fault and dump it to the console. */
-    printk("*** DOUBLE FAULT ***\n");
-    print_xen_info();
-
-    read_registers(&state);
-
-    printk("CPU:    %d\n", cpu);
-    _show_registers(regs, &state, CTXT_hypervisor, NULL);
-    show_code(regs);
-    show_stack_overflow(cpu, regs);
-
-    panic("DOUBLE FAULT -- system shutdown\n");
-}
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */
-- 
2.39.5



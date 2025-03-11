Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44086A5D178
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 22:13:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909298.1316297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6uD-0000oe-W9; Tue, 11 Mar 2025 21:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909298.1316297; Tue, 11 Mar 2025 21:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6uD-0000mG-Rw; Tue, 11 Mar 2025 21:12:53 +0000
Received: by outflank-mailman (input) for mailman id 909298;
 Tue, 11 Mar 2025 21:12:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isYZ=V6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ts6uB-0008V9-T0
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 21:12:51 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96898c2d-febd-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 22:12:50 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso37356815e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 14:12:50 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfba9sm19480872f8f.39.2025.03.11.14.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 14:12:48 -0700 (PDT)
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
X-Inumbo-ID: 96898c2d-febd-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741727569; x=1742332369; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3tUvTAv3blqytxViw6Vvd9NJKdvVm3sZY5QDWdB8lnM=;
        b=iL/AhS5u/a8tlcYimgK2oHOuYGIjbPkDKm1TC8UnNVOwGkJvdpgLDhLezZnIXw3+xz
         /Wn7+QvbgUJvFXnz6fsk8UEL5OTfUHbHmbaMd556Evd3Rvqm7FzF7/9gKx1nmYhGAbTz
         Uyl6OGK84IFbEjIoul10Fq4aIevCDLwJ2wc4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741727569; x=1742332369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3tUvTAv3blqytxViw6Vvd9NJKdvVm3sZY5QDWdB8lnM=;
        b=HImng6Olq4ld6l2sVEJADauDXPbUMyFv/dQgxnj89hLyClFg2OgpXayu92UTcn3pMp
         dUtzOt+WuD/GOI9liOFgvPcoxlm/VGBFNIrcB8uBEN/raQcdZvH3/MOvbgqbjYNDEE1v
         y2tKTnxUc/aYFLfaNkEct3T2YUdrN68mA1hOw15rDLFSvhvxS8t0fb6lA4Gx4pv34d9H
         g0yUeZERPkxJ5Ug86rnTHi3FIrHyt+dYLHLiv5Ct1A4QGZVJFokSSaJb4Uo4QTX/7zNn
         7c6fJllVbHtz4cfIQPdgokzzW3ZklW1lKS6C9LW4rpW9LVu86uCdcwiPUC9UfbRdZ6cF
         hfVg==
X-Gm-Message-State: AOJu0Ywgs0MNM3bKg4lSZeYrSIi8ftzbBk9j0NahSFLF+X6LP04sn+j6
	Q5aYS2x5T4GwRI37hvFae3PlyNQevrBRkLsP+91PfYGMX1uZnSaotM4+RUwUqE7pkbsdCxxdNg8
	I
X-Gm-Gg: ASbGncsOogRdUp4qwEpPwaJ6/pDgRhOeJyGY6Uw2San8NKLHg2S0mLOKxymdz9P8NC1
	KmYzLcafnIt4lfKR1vZ2lBeCT9r6D9e429RlQM5C/2UJCdqPTW792pdIIVWeFrBoqw3Of4wfEbn
	cpxz2wY+oaBT2YxAq70e1+/yCAkC+vtrRKGA3/b+JA43t9JRvI9TFmUJ1BnWID2I6IoLay5kGpu
	18s9ZYsRUDJy/oPSvLgfMm3RJn01WPOtRjcAcJwinQVJQNjWYkkaEyuIv97UqTjfeI9iCZttMa2
	/bPUN0IWeMCmENQ/a7eZ7ET2eFuqq160Vw7mTGfFTffjas68qYL4Ox+6/qMQeB3zHXjglQCYJ16
	nHB5sL8NPC0oMSI8nlxbDjXKP
X-Google-Smtp-Source: AGHT+IHDtuMEgcwGjelrzYRwcrT2OmMihNokulS7s+soekb61kdamUYko2fDPfbSIEcFLf335JFhLw==
X-Received: by 2002:a05:6000:18a3:b0:391:2df9:772d with SMTP id ffacd0b85a97d-39132d3bad8mr17084750f8f.13.1741727569105;
        Tue, 11 Mar 2025 14:12:49 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/8] x86/traps: Rework register state printing to use a struct
Date: Tue, 11 Mar 2025 21:10:37 +0000
Message-Id: <20250311211043.3629696-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
References: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... in preference to the crs[8] array.  This avoids abusing crs[5..7] for the
fs/gs bases, giving them proper named fields instead, and avoids storage for
cr1 which is unused in the x86 architecture.

In show_registers(), remove a redundant read_cr2().  read_registers() already
did the same, and it is only the PV path which needs to override with
arch_get_cr2().

In vcpu_show_registers(), express the gsb/gss decision using SWAP().  The
determination is going to get even more complicated under FRED.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/x86_64/traps.c | 96 +++++++++++++++++++++----------------
 1 file changed, 54 insertions(+), 42 deletions(-)

diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
index ac0fafd72d31..01b4f0623282 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -23,6 +23,11 @@
 #include <asm/shared.h>
 #include <asm/traps.h>
 
+struct extra_state
+{
+    unsigned long cr0, cr2, cr3, cr4;
+    unsigned long fsb, gsb, gss;
+};
 
 static void print_xen_info(void)
 {
@@ -35,28 +40,29 @@ static void print_xen_info(void)
 
 enum context { CTXT_hypervisor, CTXT_pv_guest, CTXT_hvm_guest };
 
-/* (ab)use crs[5..7] for fs/gs bases. */
-static void read_registers(struct cpu_user_regs *regs, unsigned long crs[8])
+static void read_registers(struct cpu_user_regs *regs, struct extra_state *state)
 {
-    crs[0] = read_cr0();
-    crs[2] = read_cr2();
-    crs[3] = read_cr3();
-    crs[4] = read_cr4();
+    state->cr0 = read_cr0();
+    state->cr2 = read_cr2();
+    state->cr3 = read_cr3();
+    state->cr4 = read_cr4();
+
     read_sregs(regs);
-    crs[5] = read_fs_base();
-    crs[6] = read_gs_base();
-    crs[7] = read_gs_shadow();
+
+    state->fsb = read_fs_base();
+    state->gsb = read_gs_base();
+    state->gss = read_gs_shadow();
 }
 
 static void get_hvm_registers(struct vcpu *v, struct cpu_user_regs *regs,
-                              unsigned long crs[8])
+                              struct extra_state *state)
 {
     struct segment_register sreg;
 
-    crs[0] = v->arch.hvm.guest_cr[0];
-    crs[2] = v->arch.hvm.guest_cr[2];
-    crs[3] = v->arch.hvm.guest_cr[3];
-    crs[4] = v->arch.hvm.guest_cr[4];
+    state->cr0 = v->arch.hvm.guest_cr[0];
+    state->cr2 = v->arch.hvm.guest_cr[2];
+    state->cr3 = v->arch.hvm.guest_cr[3];
+    state->cr4 = v->arch.hvm.guest_cr[4];
 
     hvm_get_segment_register(v, x86_seg_cs, &sreg);
     regs->cs = sreg.sel;
@@ -69,20 +75,20 @@ static void get_hvm_registers(struct vcpu *v, struct cpu_user_regs *regs,
 
     hvm_get_segment_register(v, x86_seg_fs, &sreg);
     regs->fs = sreg.sel;
-    crs[5] = sreg.base;
+    state->fsb = sreg.base;
 
     hvm_get_segment_register(v, x86_seg_gs, &sreg);
     regs->gs = sreg.sel;
-    crs[6] = sreg.base;
+    state->gsb = sreg.base;
 
     hvm_get_segment_register(v, x86_seg_ss, &sreg);
     regs->ss = sreg.sel;
 
-    crs[7] = hvm_get_reg(v, MSR_SHADOW_GS_BASE);
+    state->gss = hvm_get_reg(v, MSR_SHADOW_GS_BASE);
 }
 
 static void _show_registers(
-    const struct cpu_user_regs *regs, unsigned long crs[8],
+    const struct cpu_user_regs *regs, const struct extra_state *state,
     enum context context, const struct vcpu *v)
 {
     static const char *const context_names[] = {
@@ -112,10 +118,10 @@ static void _show_registers(
     printk("r12: %016lx   r13: %016lx   r14: %016lx\n",
            regs->r12, regs->r13, regs->r14);
     printk("r15: %016lx   cr0: %016lx   cr4: %016lx\n",
-           regs->r15, crs[0], crs[4]);
-    printk("cr3: %016lx   cr2: %016lx\n", crs[3], crs[2]);
+           regs->r15, state->cr0, state->cr4);
+    printk("cr3: %016lx   cr2: %016lx\n", state->cr3, state->cr2);
     printk("fsb: %016lx   gsb: %016lx   gss: %016lx\n",
-           crs[5], crs[6], crs[7]);
+           state->fsb, state->gsb, state->gss);
     printk("ds: %04x   es: %04x   fs: %04x   gs: %04x   "
            "ss: %04x   cs: %04x\n",
            regs->ds, regs->es, regs->fs,
@@ -125,34 +131,33 @@ static void _show_registers(
 void show_registers(const struct cpu_user_regs *regs)
 {
     struct cpu_user_regs fault_regs = *regs;
-    unsigned long fault_crs[8];
+    struct extra_state fault_state;
     enum context context;
     struct vcpu *v = system_state >= SYS_STATE_smp_boot ? current : NULL;
 
     if ( guest_mode(regs) && is_hvm_vcpu(v) )
     {
-        get_hvm_registers(v, &fault_regs, fault_crs);
+        get_hvm_registers(v, &fault_regs, &fault_state);
         context = CTXT_hvm_guest;
     }
     else
     {
-        read_registers(&fault_regs, fault_crs);
+        read_registers(&fault_regs, &fault_state);
 
         if ( guest_mode(regs) )
         {
             context = CTXT_pv_guest;
-            fault_crs[2] = arch_get_cr2(v);
+            fault_state.cr2 = arch_get_cr2(v);
         }
         else
         {
             context = CTXT_hypervisor;
-            fault_crs[2] = read_cr2();
         }
     }
 
     print_xen_info();
     printk("CPU:    %d\n", smp_processor_id());
-    _show_registers(&fault_regs, fault_crs, context, v);
+    _show_registers(&fault_regs, &fault_state, context, v);
 
     if ( ler_msr && !guest_mode(regs) )
     {
@@ -173,34 +178,41 @@ void vcpu_show_registers(struct vcpu *v)
 {
     const struct cpu_user_regs *regs = &v->arch.user_regs;
     struct cpu_user_regs aux_regs;
+    struct extra_state state;
     enum context context;
-    unsigned long crs[8];
 
     if ( is_hvm_vcpu(v) )
     {
         aux_regs = *regs;
-        get_hvm_registers(v, &aux_regs, crs);
+        get_hvm_registers(v, &aux_regs, &state);
         regs = &aux_regs;
         context = CTXT_hvm_guest;
     }
     else
     {
         bool kernel = guest_kernel_mode(v, regs);
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
 
-        crs[0] = v->arch.pv.ctrlreg[0];
-        crs[2] = arch_get_cr2(v);
-        crs[3] = pagetable_get_paddr(kernel ?
-                                     v->arch.guest_table :
-                                     v->arch.guest_table_user);
-        crs[4] = v->arch.pv.ctrlreg[4];
-        crs[5] = v->arch.pv.fs_base;
-        crs[6 + !kernel] = v->arch.pv.gs_base_kernel;
-        crs[7 - !kernel] = v->arch.pv.gs_base_user;
+        state.fsb = v->arch.pv.fs_base;
+        state.gsb = gsb;
+        state.gss = gss;
 
         context = CTXT_pv_guest;
     }
 
-    _show_registers(regs, crs, context, v);
+    _show_registers(regs, &state, context, v);
 }
 
 void show_page_walk(unsigned long addr)
@@ -268,7 +280,7 @@ void show_page_walk(unsigned long addr)
 void asmlinkage do_double_fault(struct cpu_user_regs *regs)
 {
     unsigned int cpu;
-    unsigned long crs[8];
+    struct extra_state state;
 
     console_force_unlock();
 
@@ -279,10 +291,10 @@ void asmlinkage do_double_fault(struct cpu_user_regs *regs)
     printk("*** DOUBLE FAULT ***\n");
     print_xen_info();
 
-    read_registers(regs, crs);
+    read_registers(regs, &state);
 
     printk("CPU:    %d\n", cpu);
-    _show_registers(regs, crs, CTXT_hypervisor, NULL);
+    _show_registers(regs, &state, CTXT_hypervisor, NULL);
     show_code(regs);
     show_stack_overflow(cpu, regs);
 
-- 
2.39.5



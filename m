Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66592A5D17B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 22:13:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909302.1316331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6uH-0001eG-BW; Tue, 11 Mar 2025 21:12:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909302.1316331; Tue, 11 Mar 2025 21:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6uH-0001a1-4O; Tue, 11 Mar 2025 21:12:57 +0000
Received: by outflank-mailman (input) for mailman id 909302;
 Tue, 11 Mar 2025 21:12:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isYZ=V6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ts6uF-0008V9-Ct
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 21:12:55 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98957bdf-febd-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 22:12:53 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43bb6b0b898so51036345e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 14:12:53 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfba9sm19480872f8f.39.2025.03.11.14.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 14:12:52 -0700 (PDT)
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
X-Inumbo-ID: 98957bdf-febd-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741727573; x=1742332373; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFrngM1TgUNgBBj30oxGvF9xc2D1FyOkZS0ffbcsnNo=;
        b=ZCmh4i4JgAKTo1LHKdU6uMR9gNlEoE8oBaT53eeKw20Se9LYK3B9FEO412staOOBgT
         fLaFItscMaVoGKKoZOJktK+2wJwqTF9kQrQUt+OJkZnOP3kSRJ3+PAbRva2yJMM3ADKI
         cP1BCgT3LpoOnvT0lSKJhU7U2naJPYuplq67Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741727573; x=1742332373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HFrngM1TgUNgBBj30oxGvF9xc2D1FyOkZS0ffbcsnNo=;
        b=r64FFSn55FZuZjEF+T96U0lBJmnrHi/vdeHsGeGusGIF8KzzL8oD2tpJXU4amZbyqn
         JuEcW/caAar7ikqdhfzKkojE7c4OGSirWy4WJQFfFZAaUfvFxon3DvonuBXi5/aecoqb
         hQF0uRHn8fVuyEvbqC7gtjb/ZyT0a5EOLREoe4YzvxZ6b5+YOO5+4JRfp3Uhas5w1R/K
         8vK+iZRHPCMv8+JjWMCVPIlP3ssBdYjcD2B/33NqjDCNlxd44LRyWNyFYGUI2z525W5m
         k/xKviBqn10CVKB6wIDITrUj/3j5hK/JHhBer65HLKGs9kmWdigtBA2jmMUVe/2VYPXU
         btkg==
X-Gm-Message-State: AOJu0YxzWnqalK50v2E28C0C6xyn+Uenc8a3efAb/XtlRmjbZ/s2LB/Z
	ko0KEXMjUIkWNDaKz0vG1obISWsmlkBu53VGMFKAWHMn0iYO4neq8IRZELdxC6pACLmHwWyfbGI
	R
X-Gm-Gg: ASbGncvrfiL546OWVZxWYJutbdDL8WHSVyMbKyGyZkT0is517Rbzb5zQru94jMMO1eS
	FOzTeFkdrcA4fGdSMOY+4qt1I9AQry9PSF6+wdPxKqjV61nWGxBnLNhIxq9BU5wmI2vWs7gIbHi
	RY7ns0za9dTganjHk2QyEYXTAV3+tiqLIsGACF2vwT4xIpoNNs0FJUmdPOzeRd3k59hsJ77k5wm
	P2PiR6W/2itRdmvBDXH4xYCVWc0pdIncuPsqk2lk/tsl8uOi0rBIqlKATlQXoxcrteWhzCxYF1u
	Y8LB5vMWK6/WCPlTB/BFqCuMFfn/TwgQfLRVYTTFWxf494Yt8KR2EjecH/Z20AJ9AW7SGMQmPun
	kUDmA5/r26tGJjOYnmBd7XGuO
X-Google-Smtp-Source: AGHT+IHLu90I7Oxb9f9B2V1ljG4U7asaIi+yb+uqAksLnpE42DOph4w9vUxKd6hge8kToyDbSdwnEg==
X-Received: by 2002:a05:6000:1885:b0:390:fbdd:994d with SMTP id ffacd0b85a97d-39264694d6bmr6113045f8f.27.1741727572721;
        Tue, 11 Mar 2025 14:12:52 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 6/8] x86/pv: Store the data segment selectors outside of cpu_user_regs
Date: Tue, 11 Mar 2025 21:10:41 +0000
Message-Id: <20250311211043.3629696-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
References: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to support FRED, we're going to have to remove the {ds..gs} fields
from struct cpu_user_regs.  This will impact v->arch.user_regs.

These fields are unused for HVM guests, but for PV hold the selector values
when the vCPU is scheduled out.

Introduce new fields for the selectors in struct pv_vcpu, and update:

 * {save,load}_segments(), context switching
 * arch_{set,set}_info_guest(), hypercalls
 * vcpu_show_registers(), diagnostics
 * dom0_construct(), PV dom0

to use the new storage.  This removes the final user of read_sregs() so drop
it too.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/domain.c             | 70 +++++++++++++++----------------
 xen/arch/x86/domctl.c             | 16 +++----
 xen/arch/x86/include/asm/domain.h |  2 +
 xen/arch/x86/include/asm/regs.h   |  8 ----
 xen/arch/x86/pv/dom0_build.c      |  6 ++-
 xen/arch/x86/x86_64/traps.c       |  8 ++--
 6 files changed, 53 insertions(+), 57 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index bc0816c71495..e9c331be6f63 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1211,10 +1211,10 @@ int arch_set_info_guest(
         v->arch.user_regs.rflags            = c.nat->user_regs.rflags;
         v->arch.user_regs.rsp               = c.nat->user_regs.rsp;
         v->arch.user_regs.ss                = c.nat->user_regs.ss;
-        v->arch.user_regs.es                = c.nat->user_regs.es;
-        v->arch.user_regs.ds                = c.nat->user_regs.ds;
-        v->arch.user_regs.fs                = c.nat->user_regs.fs;
-        v->arch.user_regs.gs                = c.nat->user_regs.gs;
+        v->arch.pv.es                       = c.nat->user_regs.es;
+        v->arch.pv.ds                       = c.nat->user_regs.ds;
+        v->arch.pv.fs                       = c.nat->user_regs.fs;
+        v->arch.pv.gs                       = c.nat->user_regs.gs;
 
         if ( is_pv_domain(d) )
             memcpy(v->arch.pv.trap_ctxt, c.nat->trap_ctxt,
@@ -1238,10 +1238,10 @@ int arch_set_info_guest(
         v->arch.user_regs.eflags            = c.cmp->user_regs.eflags;
         v->arch.user_regs.esp               = c.cmp->user_regs.esp;
         v->arch.user_regs.ss                = c.cmp->user_regs.ss;
-        v->arch.user_regs.es                = c.cmp->user_regs.es;
-        v->arch.user_regs.ds                = c.cmp->user_regs.ds;
-        v->arch.user_regs.fs                = c.cmp->user_regs.fs;
-        v->arch.user_regs.gs                = c.cmp->user_regs.gs;
+        v->arch.pv.es                       = c.nat->user_regs.es;
+        v->arch.pv.ds                       = c.nat->user_regs.ds;
+        v->arch.pv.fs                       = c.nat->user_regs.fs;
+        v->arch.pv.gs                       = c.nat->user_regs.gs;
 
         if ( is_pv_domain(d) )
         {
@@ -1729,7 +1729,6 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
  */
 static void load_segments(struct vcpu *n)
 {
-    struct cpu_user_regs *uregs = &n->arch.user_regs;
     unsigned long gsb = 0, gss = 0;
     bool compat = is_pv_32bit_vcpu(n);
     bool all_segs_okay = true, fs_gs_done = false;
@@ -1762,7 +1761,7 @@ static void load_segments(struct vcpu *n)
         if ( !(n->arch.flags & TF_kernel_mode) )
             SWAP(gsb, gss);
 
-        if ( using_svm() && (uregs->fs | uregs->gs) <= 3 )
+        if ( using_svm() && (n->arch.pv.fs | n->arch.pv.gs) <= 3 )
             fs_gs_done = svm_load_segs(n->arch.pv.ldt_ents, LDT_VIRT_START(n),
                                        n->arch.pv.fs_base, gsb, gss);
     }
@@ -1771,12 +1770,12 @@ static void load_segments(struct vcpu *n)
     {
         load_LDT(n);
 
-        TRY_LOAD_SEG(fs, uregs->fs);
-        TRY_LOAD_SEG(gs, uregs->gs);
+        TRY_LOAD_SEG(fs, n->arch.pv.fs);
+        TRY_LOAD_SEG(gs, n->arch.pv.gs);
     }
 
-    TRY_LOAD_SEG(ds, uregs->ds);
-    TRY_LOAD_SEG(es, uregs->es);
+    TRY_LOAD_SEG(ds, n->arch.pv.ds);
+    TRY_LOAD_SEG(es, n->arch.pv.es);
 
     if ( !fs_gs_done && !compat )
     {
@@ -1829,13 +1828,13 @@ static void load_segments(struct vcpu *n)
             }
 
             if ( ret |
-                 put_guest(rflags,      esp - 1) |
-                 put_guest(cs_and_mask, esp - 2) |
-                 put_guest(regs->eip,   esp - 3) |
-                 put_guest(uregs->gs,   esp - 4) |
-                 put_guest(uregs->fs,   esp - 5) |
-                 put_guest(uregs->es,   esp - 6) |
-                 put_guest(uregs->ds,   esp - 7) )
+                 put_guest(rflags,        esp - 1) |
+                 put_guest(cs_and_mask,   esp - 2) |
+                 put_guest(regs->eip,     esp - 3) |
+                 put_guest(n->arch.pv.gs, esp - 4) |
+                 put_guest(n->arch.pv.fs, esp - 5) |
+                 put_guest(n->arch.pv.es, esp - 6) |
+                 put_guest(n->arch.pv.ds, esp - 7) )
                 domain_crash(n->domain,
                              "Error creating compat failsafe callback frame\n");
 
@@ -1861,17 +1860,17 @@ static void load_segments(struct vcpu *n)
         cs_and_mask = (unsigned long)regs->cs |
             ((unsigned long)vcpu_info(n, evtchn_upcall_mask) << 32);
 
-        if ( put_guest(regs->ss,    rsp -  1) |
-             put_guest(regs->rsp,   rsp -  2) |
-             put_guest(rflags,      rsp -  3) |
-             put_guest(cs_and_mask, rsp -  4) |
-             put_guest(regs->rip,   rsp -  5) |
-             put_guest(uregs->gs,   rsp -  6) |
-             put_guest(uregs->fs,   rsp -  7) |
-             put_guest(uregs->es,   rsp -  8) |
-             put_guest(uregs->ds,   rsp -  9) |
-             put_guest(regs->r11,   rsp - 10) |
-             put_guest(regs->rcx,   rsp - 11) )
+        if ( put_guest(regs->ss,      rsp -  1) |
+             put_guest(regs->rsp,     rsp -  2) |
+             put_guest(rflags,        rsp -  3) |
+             put_guest(cs_and_mask,   rsp -  4) |
+             put_guest(regs->rip,     rsp -  5) |
+             put_guest(n->arch.pv.gs, rsp -  6) |
+             put_guest(n->arch.pv.fs, rsp -  7) |
+             put_guest(n->arch.pv.es, rsp -  8) |
+             put_guest(n->arch.pv.ds, rsp -  9) |
+             put_guest(regs->r11,     rsp - 10) |
+             put_guest(regs->rcx,     rsp - 11) )
             domain_crash(n->domain,
                          "Error creating failsafe callback frame\n");
 
@@ -1900,9 +1899,10 @@ static void load_segments(struct vcpu *n)
  */
 static void save_segments(struct vcpu *v)
 {
-    struct cpu_user_regs *regs = &v->arch.user_regs;
-
-    read_sregs(regs);
+    asm ( "mov %%ds, %0" : "=m" (v->arch.pv.ds) );
+    asm ( "mov %%es, %0" : "=m" (v->arch.pv.es) );
+    asm ( "mov %%fs, %0" : "=m" (v->arch.pv.fs) );
+    asm ( "mov %%gs, %0" : "=m" (v->arch.pv.gs) );
 
     if ( !is_pv_32bit_vcpu(v) )
     {
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 7ab9e9176b58..833fcbd4bbb6 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1414,10 +1414,10 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
         c.nat->user_regs.rflags            = v->arch.user_regs.rflags;
         c.nat->user_regs.rsp               = v->arch.user_regs.rsp;
         c.nat->user_regs.ss                = v->arch.user_regs.ss;
-        c.nat->user_regs.es                = v->arch.user_regs.es;
-        c.nat->user_regs.ds                = v->arch.user_regs.ds;
-        c.nat->user_regs.fs                = v->arch.user_regs.fs;
-        c.nat->user_regs.gs                = v->arch.user_regs.gs;
+        c.nat->user_regs.es                = v->arch.pv.es;
+        c.nat->user_regs.ds                = v->arch.pv.ds;
+        c.nat->user_regs.fs                = v->arch.pv.fs;
+        c.nat->user_regs.gs                = v->arch.pv.gs;
 
         if ( is_pv_domain(d) )
             memcpy(c.nat->trap_ctxt, v->arch.pv.trap_ctxt,
@@ -1441,10 +1441,10 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
         c.cmp->user_regs.eflags            = v->arch.user_regs.eflags;
         c.cmp->user_regs.esp               = v->arch.user_regs.esp;
         c.cmp->user_regs.ss                = v->arch.user_regs.ss;
-        c.cmp->user_regs.es                = v->arch.user_regs.es;
-        c.cmp->user_regs.ds                = v->arch.user_regs.ds;
-        c.cmp->user_regs.fs                = v->arch.user_regs.fs;
-        c.cmp->user_regs.gs                = v->arch.user_regs.gs;
+        c.cmp->user_regs.es                = v->arch.pv.es;
+        c.cmp->user_regs.ds                = v->arch.pv.ds;
+        c.cmp->user_regs.fs                = v->arch.pv.fs;
+        c.cmp->user_regs.gs                = v->arch.pv.gs;
 
         if ( is_pv_domain(d) )
         {
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 5fc1d1e5d01a..7fa409cb3055 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -546,6 +546,8 @@ struct pv_vcpu
     bool syscall32_disables_events;
     bool sysenter_disables_events;
 
+    uint16_t ds, es, fs, gs;
+
     /*
      * 64bit segment bases.
      *
diff --git a/xen/arch/x86/include/asm/regs.h b/xen/arch/x86/include/asm/regs.h
index 4f2f06b60161..c05b9207c281 100644
--- a/xen/arch/x86/include/asm/regs.h
+++ b/xen/arch/x86/include/asm/regs.h
@@ -41,12 +41,4 @@
     __sel;                                           \
 })
 
-static inline void read_sregs(struct cpu_user_regs *regs)
-{
-    asm ( "mov %%ds, %0" : "=m" (regs->ds) );
-    asm ( "mov %%es, %0" : "=m" (regs->es) );
-    asm ( "mov %%fs, %0" : "=m" (regs->fs) );
-    asm ( "mov %%gs, %0" : "=m" (regs->gs) );
-}
-
 #endif /* __X86_REGS_H__ */
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 96e28c7b6a77..bcaacc7586c0 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -1020,8 +1020,10 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
      *  [rAX,rBX,rCX,rDX,rDI,rBP,R8-R15 are zero]
      */
     regs = &v->arch.user_regs;
-    regs->ds = regs->es = regs->fs = regs->gs =
-               (compat ? FLAT_COMPAT_KERNEL_DS : FLAT_KERNEL_DS);
+    v->arch.pv.ds = (compat ? FLAT_COMPAT_KERNEL_DS : FLAT_KERNEL_DS);
+    v->arch.pv.es = (compat ? FLAT_COMPAT_KERNEL_DS : FLAT_KERNEL_DS);
+    v->arch.pv.fs = (compat ? FLAT_COMPAT_KERNEL_DS : FLAT_KERNEL_DS);
+    v->arch.pv.gs = (compat ? FLAT_COMPAT_KERNEL_DS : FLAT_KERNEL_DS);
     regs->ss = (compat ? FLAT_COMPAT_KERNEL_SS : FLAT_KERNEL_SS);
     regs->cs = (compat ? FLAT_COMPAT_KERNEL_CS : FLAT_KERNEL_CS);
     regs->rip = parms.virt_entry;
diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
index 23622cdb1440..cb06f99021d1 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -219,10 +219,10 @@ void vcpu_show_registers(struct vcpu *v)
         state.gsb = gsb;
         state.gss = gss;
 
-        state.ds = v->arch.user_regs.ds;
-        state.es = v->arch.user_regs.es;
-        state.fs = v->arch.user_regs.fs;
-        state.gs = v->arch.user_regs.gs;
+        state.ds = v->arch.pv.ds;
+        state.es = v->arch.pv.es;
+        state.fs = v->arch.pv.fs;
+        state.gs = v->arch.pv.gs;
 
         context = CTXT_pv_guest;
     }
-- 
2.39.5



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FF6B1D676
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 13:17:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072834.1435811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujycP-0003X0-C7; Thu, 07 Aug 2025 11:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072834.1435811; Thu, 07 Aug 2025 11:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujycP-0003Ru-7h; Thu, 07 Aug 2025 11:17:09 +0000
Received: by outflank-mailman (input) for mailman id 1072834;
 Thu, 07 Aug 2025 11:17:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LYnK=2T=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ujycN-00030Z-Jp
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 11:17:07 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ab40a4d-7380-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 13:17:02 +0200 (CEST)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-458b2d9dba5so5633235e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 04:17:02 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5c84b8csm45456435e9.4.2025.08.07.04.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 04:17:00 -0700 (PDT)
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
X-Inumbo-ID: 0ab40a4d-7380-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754565421; x=1755170221; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dL2YvSztXVd/Fab5v2hd2sS7i1yVeJls/PSnVnUMirw=;
        b=umUj4Las8LHB4nu85ypm4PpH052nZGtOEJ5zQrfl8IIoeMTK85diBzTaxMobyiYU0M
         kXAQVqZUdaGjitaHg+agQr3TuPYkOMXwHFY9n5OaVaYjpKjE7KZoqQE1Awnm9zUQwueq
         EijVthjo9wLJ1bJ2LpyGTMA0iE7P6ZcMcayzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754565421; x=1755170221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dL2YvSztXVd/Fab5v2hd2sS7i1yVeJls/PSnVnUMirw=;
        b=Z9Wc5OcP7ZFXYdbzsdTbGOLtn0XHNi31Rs//C+GyKW2knvxMg0jjvZ/ZKZVTeyWl+7
         OJjgmWp+n/6NLSqqIdJm2HGyz5VeChcU4tfrHbPtQQdRJMEcrKPPeoO2i5Iveul0S88p
         EMzG94UgfATvNZsAjsm5aKuvPS6ZiR7A3LA/zVMwo5WEMD4D60LG3I2hrJf1Wao7HJsq
         lr8cltBq2yvYGDCEc1w6oHeMl7BewOJbuUv+Pd3/8Ee59CIGk3NzYMWrrxN6UAS2bb/D
         GfPW137UlVaVIS5u1y+4CAcTzw7x1HtY7MmayK72NOpDU0dbTOHDPFj2PIna2NytEqPX
         uAwA==
X-Gm-Message-State: AOJu0Yz+X78U68Eq1vhSvR/s4B3EU8rZF8rX2FaU4If1uYetNFjZW0uI
	ECN1zbpdLb2/+oRao68Ma3GrqIQIG0D9OmMANUxPVkd5E3YExrzlVmdN7W7YsBbUHOjnJHzDGXy
	GBV+nnK9zFg==
X-Gm-Gg: ASbGncvcc1enndQa1PAQpNvZebE0LG+EIqwcYosP9hjSz3yD44Fcp+cs0ZXYfnfYULo
	Q1PaQQ0Ny7MSiE2OcjeTkPDqHxQCwNI54pL6ZSTI9SNMuwkxwqOP2aRXSa/SKM73hRoF6rtSX+P
	0Vl5nLDjjWDb/g9LgmUnetY0ZyJW8bk4DbVWOCDX58WuDXIBXzWCKsWP0Kyjv5WhkAhfxGWQbzS
	SjDnkMriXPT/npYrowWVM5ai7EsfQhUskpPt6iFcutFEFKvSPwnG6VCLIgJO8gLbAoThZdg0RWI
	OAKvoBC/GkIN4vVOKB9nHStvEMMRjtxdJWHRz4TeOGDX5CsTDzWdO/YGqR/K/hAku7oeznavxki
	AgfWLjrsROpxLP8xQJgP1vz/fmNj08dIO55u54jD/6fG4BQ1FoXBrF2chSOtXbgc75bqUk0Bk/F
	Cx
X-Google-Smtp-Source: AGHT+IGWE4tTGGHjLdAwv6JpciHuz5qoT7XvVZfUijtwN1vJQdLXauax63tQQfhZAl6wuse/OyybKA==
X-Received: by 2002:a05:600c:1554:b0:456:18cf:66b5 with SMTP id 5b1f17b1804b1-459e70eecadmr54586005e9.22.1754565421168;
        Thu, 07 Aug 2025 04:17:01 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 2/4] x86/pv: Store the data segment selectors outside of cpu_user_regs
Date: Thu,  7 Aug 2025 12:16:55 +0100
Message-Id: <20250807111657.201849-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250807111657.201849-1-andrew.cooper3@citrix.com>
References: <20250807111657.201849-1-andrew.cooper3@citrix.com>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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
index 56111eac3d94..a4ee8ff6ef0e 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1246,10 +1246,10 @@ int arch_set_info_guest(
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
@@ -1271,10 +1271,10 @@ int arch_set_info_guest(
         v->arch.user_regs.eflags            = c.cmp->user_regs.eflags;
         v->arch.user_regs.esp               = c.cmp->user_regs.esp;
         v->arch.user_regs.ss                = c.cmp->user_regs.ss;
-        v->arch.user_regs.es                = c.cmp->user_regs.es;
-        v->arch.user_regs.ds                = c.cmp->user_regs.ds;
-        v->arch.user_regs.fs                = c.cmp->user_regs.fs;
-        v->arch.user_regs.gs                = c.cmp->user_regs.gs;
+        v->arch.pv.es                       = c.cmp->user_regs.es;
+        v->arch.pv.ds                       = c.cmp->user_regs.ds;
+        v->arch.pv.fs                       = c.cmp->user_regs.fs;
+        v->arch.pv.gs                       = c.cmp->user_regs.gs;
 
         if ( is_pv_domain(d) )
         {
@@ -1762,7 +1762,6 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
  */
 static void load_segments(struct vcpu *n)
 {
-    struct cpu_user_regs *uregs = &n->arch.user_regs;
     unsigned long gsb = 0, gss = 0;
     bool compat = is_pv_32bit_vcpu(n);
     bool all_segs_okay = true, fs_gs_done = false;
@@ -1796,7 +1795,7 @@ static void load_segments(struct vcpu *n)
         if ( !(n->arch.flags & TF_kernel_mode) )
             SWAP(gsb, gss);
 
-        if ( using_svm() && (uregs->fs | uregs->gs) <= 3 )
+        if ( using_svm() && (n->arch.pv.fs | n->arch.pv.gs) <= 3 )
             fs_gs_done = svm_load_segs(n->arch.pv.ldt_ents, LDT_VIRT_START(n),
                                        n->arch.pv.fs_base, gsb, gss);
     }
@@ -1805,12 +1804,12 @@ static void load_segments(struct vcpu *n)
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
@@ -1863,13 +1862,13 @@ static void load_segments(struct vcpu *n)
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
 
@@ -1895,17 +1894,17 @@ static void load_segments(struct vcpu *n)
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
 
@@ -1934,9 +1933,10 @@ static void load_segments(struct vcpu *n)
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
index 28fec0e12dbb..3e94af51a795 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1412,10 +1412,10 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
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
@@ -1437,10 +1437,10 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
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
index 8c0dea12a526..c31e74c6fa9b 100644
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
index 60b0d7b8735b..ce9b028276a1 100644
--- a/xen/arch/x86/include/asm/regs.h
+++ b/xen/arch/x86/include/asm/regs.h
@@ -44,12 +44,4 @@
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
index c37bea945431..21158ce1812e 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -1012,8 +1012,10 @@ static int __init dom0_construct(const struct boot_domain *bd)
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
index 8460a4a1ae59..29ac5a14ca3f 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -220,10 +220,10 @@ void vcpu_show_registers(struct vcpu *v)
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC12B3A3A0
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:11:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099145.1453047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureH1-0005v3-D6; Thu, 28 Aug 2025 15:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099145.1453047; Thu, 28 Aug 2025 15:10:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureH1-0005sO-9b; Thu, 28 Aug 2025 15:10:47 +0000
Received: by outflank-mailman (input) for mailman id 1099145;
 Thu, 28 Aug 2025 15:10:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ureCq-00035A-M8
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:06:28 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91cee1a5-8420-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 17:06:27 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45b7d485173so3264665e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:06:27 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm78394535e9.5.2025.08.28.08.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 08:06:24 -0700 (PDT)
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
X-Inumbo-ID: 91cee1a5-8420-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756393586; x=1756998386; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c80DOGuq8CPTWDIJ0qD4mtXdtGhG3XkzJOyU46644UY=;
        b=BPEd304GUE1uVIQ23kc8xBUVMVc3v8OFxN7DQLBNojYtqw6PcNyZp32D/yHTgMzY2/
         5n5uBpW0SbH3fG4h78ylW7qNYoVCbhCQwAE8inV70MPMqobGdq6RwfSKboAEuQHybbY4
         DHxeZPdNVqYrXdEG/Wtf+I1bN6vGNzAjgBcmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393586; x=1756998386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c80DOGuq8CPTWDIJ0qD4mtXdtGhG3XkzJOyU46644UY=;
        b=mmc8L1aCvZC1t9R/jQH+3C9i8krByO8kIbO6DuBtEWsS77j4SilcgBDqF3KK3GMHFR
         FPHw6MsYPknqB/QRaQ5EK8b0ch0Pb/n33qJsy+onWtV+OqzvxHJ/is0DcOnsIObLejZR
         bS62HY2Sgy8eGyr9wdZZZ737qXA3taZju4W4WnzzP53/FfwSuYbmXoGSUJYp3pTsp/qW
         wus3dhKtT+P0YQ6fgvMO26oVyvA4c5+OOx97gzv1EO/t9GzsKPNI0ZDzNXnJWB0Ik/nF
         eNtmdgHUsJseY3pc0lQidkgAKDryJbKeaQD8qKMbC3TvJ/KJWU5RWSqoRYkxe1IX3Ilm
         NzyQ==
X-Gm-Message-State: AOJu0Ywo/yfs/X2OvyWLK1+DhI7pVthA00dWSvoMYbC45NiDyHzSjtb9
	y6LndrhLp4aMCNPQEIBDpE8zdrCww2ATtrqRalcWiyeZjgB9O+4sXsFlXyWUupaop/Eqr5XbYLo
	E0rfy
X-Gm-Gg: ASbGncsCC9DTEjHVnSTpUMfUIaFhXKo7psd73efpN6zohQp5TutqaW2yeXFBNlw+hDc
	gQoN0fDb8ZXpg/nIqSQvJOFLvAZdPUuOOEHOWQO6Nhbf5DNl/AGwTkgyBskRhHG8oaYWzUgJoDc
	q8vuyU3uATxjfPKD3Hlz8no9/CjdrVzdONSAHdHRFg8uY+lk3XvTJeK+MRSUoJjvIyKeUdXv0sw
	IsoIAkx2P7S8a5NY7+72+b1qD+z1qtnA2qucOAlpoE2KnrNYQXChoS4KlJoKGjkkDUfZcV8L0E8
	6dfMBPaOxXfyGht7wa7EITCxlz2PbVVdfsxRgkJD9r8WDAXspOpmbins8GWUFOpOkAOvyV49Hak
	ULxOs63d6La/0OtA+yWwMDmwVFt4frOMM3cw1OQcIOaSHDAtLo3RP34/JEMi0vVlomBSifI+9da
	4gWITu/MHXLVw=
X-Google-Smtp-Source: AGHT+IHUFasaK56jScMDuhEnUt52GbGlkRE4OxBQO+dhONEeL5IJ4iJgXFm4HUfslJuRdZOFX47vhg==
X-Received: by 2002:a05:600c:1d1f:b0:45b:7ce0:fb8a with SMTP id 5b1f17b1804b1-45b7ce0fc25mr15400215e9.35.1756393585694;
        Thu, 28 Aug 2025 08:06:25 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 22/23] x86/pv: System call handling in FRED mode
Date: Thu, 28 Aug 2025 16:04:08 +0100
Message-Id: <20250828150409.901315-23-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828150409.901315-1-andrew.cooper3@citrix.com>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Under FRED, entry_from_pv() handles everything, even system calls.  This means
more of our logic is written in C now, rather than assembly.

In order to facilitate this, introduce pv_inject_callback(), which reuses
struct trap_bounce infrastructure to inject the syscall/sysenter callbacks.
This in turns requires some !PV compatibility for pv_inject_callback() and
pv_hypercall() which can both be ASSERT_UNREACHABLE().

For each of INT $N, SYSCALL and SYSENTER, FRED gives us interrupted context
which was previously lost.  As the guest can't see FRED, Xen has to lose state
in the same way to maintain the prior behaviour.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * New
---
 xen/arch/x86/include/asm/domain.h    |   5 ++
 xen/arch/x86/include/asm/hypercall.h |   5 ++
 xen/arch/x86/pv/traps.c              |  33 +++++++++
 xen/arch/x86/traps.c                 | 107 +++++++++++++++++++++++++++
 4 files changed, 150 insertions(+)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 5df8c7825333..b374decccc9c 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -712,11 +712,16 @@ int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx);
 
 #ifdef CONFIG_PV
 void pv_inject_event(const struct x86_event *event);
+void pv_inject_callback(unsigned int type);
 #else
 static inline void pv_inject_event(const struct x86_event *event)
 {
     ASSERT_UNREACHABLE();
 }
+static inline void pv_inject_callback(unsigned int type)
+{
+    ASSERT_UNREACHABLE();
+}
 #endif
 
 static inline void pv_inject_hw_exception(unsigned int vector, int errcode)
diff --git a/xen/arch/x86/include/asm/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
index f6e9e2313b3c..1010332a47e9 100644
--- a/xen/arch/x86/include/asm/hypercall.h
+++ b/xen/arch/x86/include/asm/hypercall.h
@@ -20,6 +20,11 @@
 
 #ifdef CONFIG_PV
 void pv_hypercall(struct cpu_user_regs *regs);
+#else
+static inline void pv_hypercall(struct cpu_user_regs *regs)
+{
+    ASSERT_UNREACHABLE();
+}
 #endif
 
 void pv_ring1_init_hypercall_page(void *ptr);
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index c3c0976c440f..e7314d8703d9 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -19,6 +19,8 @@
 #include <asm/shared.h>
 #include <asm/traps.h>
 
+#include <public/callback.h>
+
 void pv_inject_event(const struct x86_event *event)
 {
     struct vcpu *curr = current;
@@ -95,6 +97,37 @@ void pv_inject_event(const struct x86_event *event)
     }
 }
 
+void pv_inject_callback(unsigned int type)
+{
+    struct vcpu *curr = current;
+    struct trap_bounce *tb = &curr->arch.pv.trap_bounce;
+    unsigned long rip = 0;
+    bool irq = false;
+
+    ASSERT(is_pv_64bit_vcpu(curr));
+
+    switch ( type )
+    {
+    case CALLBACKTYPE_syscall:
+        rip = curr->arch.pv.syscall_callback_eip;
+        irq = curr->arch.pv.vgc_flags & VGCF_syscall_disables_events;
+        break;
+
+    case CALLBACKTYPE_syscall32:
+        rip = curr->arch.pv.syscall32_callback_eip;
+        irq = curr->arch.pv.syscall32_disables_events;
+        break;
+
+    case CALLBACKTYPE_sysenter:
+        rip = curr->arch.pv.sysenter_callback_eip;
+        irq = curr->arch.pv.sysenter_disables_events;
+        break;
+    }
+
+    tb->flags = TBF_EXCEPTION | (irq ? TBF_INTERRUPT : 0);
+    tb->eip = rip;
+}
+
 /*
  * Called from asm to set up the MCE trapbounce info.
  * Returns false no callback is set up, else true.
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index e10b4e771824..9211067cd688 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -18,6 +18,7 @@
 #include <xen/delay.h>
 #include <xen/domain_page.h>
 #include <xen/guest_access.h>
+#include <xen/hypercall.h>
 #include <xen/init.h>
 #include <xen/mm.h>
 #include <xen/paging.h>
@@ -52,6 +53,8 @@
 #include <asm/uaccess.h>
 #include <asm/xenoprof.h>
 
+#include <public/callback.h>
+
 /*
  * opt_nmi: one of 'ignore', 'dom0', or 'fatal'.
  *  fatal:  Xen prints diagnostic message and then hangs.
@@ -2266,6 +2269,7 @@ void asmlinkage check_ist_exit(const struct cpu_user_regs *regs, bool ist_exit)
 void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
 {
     struct fred_info *fi = cpu_regs_fred_info(regs);
+    struct vcpu *curr = current;
     uint8_t type = regs->fred_ss.type;
     uint8_t vec = regs->fred_ss.vector;
 
@@ -2305,6 +2309,27 @@ void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
 
     switch ( type )
     {
+    case X86_ET_SW_INT:
+        /*
+         * INT $3/4 are indistinguishable from INT3/INTO under IDT, and are
+         * permitted by Xen without the guest kernel having a choice.  Let
+         * them fall through into X86_ET_HW_EXC, as #BP in particular needs
+         * handling by do_int3() in case an external debugger is attached.
+         */
+        if ( vec != X86_EXC_BP && vec != X86_EXC_OF )
+        {
+            const struct trap_info *ti = &curr->arch.pv.trap_ctxt[vec];
+
+            if ( permit_softint(TI_GET_DPL(ti), curr, regs) )
+                pv_inject_sw_interrupt(vec);
+            else
+            {
+                regs->rip -= 2;
+                pv_inject_hw_exception(X86_EXC_GP, (vec << 3) | X86_XEC_IDT);
+            }
+            break;
+        }
+        fallthrough;
     case X86_ET_HW_EXC:
     case X86_ET_PRIV_SW_EXC:
     case X86_ET_SW_EXC:
@@ -2335,6 +2360,88 @@ void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
         }
         break;
 
+    case X86_ET_OTHER:
+        switch ( regs->fred_ss.vector )
+        {
+        case 1: /* SYSCALL */
+        {
+            /*
+             * FRED delivery preserves the interrupted %cs/%ss, but previously
+             * SYSCALL lost the interrupted selectors, and SYSRET forced the
+             * use of the ones in MSR_STAR.
+             *
+             * The guest isn't aware of FRED, so recreate the legacy
+             * behaviour, including the guess of instruction length for
+             * faults.
+             *
+             * The non-FRED SYSCALL path sets TRAP_syscall in entry_vector to
+             * signal that SYSRET can be used, but this isn't relevant in FRED
+             * mode.
+             *
+             * When setting the selectors, clear all upper metadata again for
+             * backwards compatibility.  In particular fred_ss.swint becomes
+             * pend_DB on ERETx, and nothing else in the pv_hypercall() would
+             * clean up.
+             */
+            bool l = regs->fred_ss.l;
+
+            regs->ssx = l ? FLAT_KERNEL_SS   : FLAT_USER_SS32;
+            regs->csx = l ? FLAT_KERNEL_CS64 : FLAT_USER_CS32;
+
+            if ( guest_kernel_mode(curr, regs) )
+                pv_hypercall(regs);
+            else if ( (l ? curr->arch.pv.syscall_callback_eip
+                         : curr->arch.pv.syscall32_callback_eip) == 0 )
+            {
+                regs->rip -= 2;
+                pv_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
+            }
+            else
+            {
+                /*
+                 * The PV ABI, given no virtual SYSCALL_MASK, hardcodes that
+                 * DF is cleared.  Other flags are handled in the same way as
+                 * interrupts and exceptions in create_bounce_frame().
+                 */
+                regs->eflags &= ~X86_EFLAGS_DF;
+                pv_inject_callback(l ? CALLBACKTYPE_syscall
+                                     : CALLBACKTYPE_syscall32);
+            }
+            break;
+        }
+
+        case 2: /* SYSENTER */
+            /*
+             * FRED delivery preserves the interrupted state, but previously
+             * SYSENTER discarded almost everything.
+             *
+             * The guest isn't aware of FRED, so recreate the legacy
+             * behaviour, including the guess of instruction length for
+             * faults.
+             *
+             * When setting the selectors, clear all upper metadata.  In
+             * particular fred_ss.swint becomes pend_DB on ERETx.
+             */
+            regs->ssx = FLAT_USER_SS;
+            regs->rsp = 0;
+            regs->eflags &= ~(X86_EFLAGS_VM | X86_EFLAGS_IF);
+            regs->csx = 3;
+            regs->rip = 0;
+
+            if ( !curr->arch.pv.sysenter_callback_eip )
+            {
+                regs->rip -= 2;
+                pv_inject_hw_exception(X86_EXC_GP, 0);
+            }
+            else
+                pv_inject_callback(CALLBACKTYPE_sysenter);
+            break;
+
+        default:
+            goto fatal;
+        }
+        break;
+
     default:
         goto fatal;
     }
-- 
2.39.5



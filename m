Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B73BB85D4
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 00:56:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1137010.1473483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4oh8-0005HY-AG; Fri, 03 Oct 2025 22:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1137010.1473483; Fri, 03 Oct 2025 22:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4oh8-0005Gk-4Q; Fri, 03 Oct 2025 22:56:10 +0000
Received: by outflank-mailman (input) for mailman id 1137010;
 Fri, 03 Oct 2025 22:56:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WVFT=4M=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4ofF-0004mK-Ax
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 22:54:13 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddf65ebb-a0ab-11f0-9809-7dc792cee155;
 Sat, 04 Oct 2025 00:54:07 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46e504975dbso16982345e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 15:54:07 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6bbesm9616571f8f.12.2025.10.03.15.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 15:54:06 -0700 (PDT)
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
X-Inumbo-ID: ddf65ebb-a0ab-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759532046; x=1760136846; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2jmA55hxQIRybSi+QXhuQx18AD/+63g0N2r29v59ko=;
        b=sXKezuC96MrzHZ8kG8R3AkqnGnDqmT+nIOunz5rWDOuQLoX6hD11yw8vQ1wDLlFJA+
         nOj2xLT19aIcSUu21koaSEhlb41aw3uTJtQRrSbqT9fXSN3rWmo5kcfov9G0T6tpZr8E
         GaNYLAl55infnT1JpmZXNKF5rGrxsPrZV5H1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759532046; x=1760136846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2jmA55hxQIRybSi+QXhuQx18AD/+63g0N2r29v59ko=;
        b=e7okFuMY9oLoKCScmg/4ISxvR0pOdi1LWj4iZGeQUItzfu5R9w/kPBDXJWx7jD+Vq5
         pX91DyOfNzDMMmGhD5aSD+Dx2/6LbmgJRdaDX1whAQjzT4zYhb5H34uJLc9Wd1m+Q24S
         /p/ejD1srUkUg7YARsMU9+Iw2B2k4A3e7HSeszJ7RMnQu5OhCwMzmowVoZudjPn5AP52
         ZP8yuDagHx+gttw/Q1D4Ug1s56ImcRkLIZA3g+ohkteVAPPKbJyTj+O+BCH7aYw6Pebz
         M0Ytr/YF+xjKPbq/O+M8esvjIKPGZXp3C9bnX/cF7xp6dMmMr9XID/Sm/AGFPqR7QVM/
         rS3w==
X-Gm-Message-State: AOJu0YyDgC1Y/FGA5EmD726S0MzWsAwVtqBHPaThzRejsK6Fc6Hu0xa2
	i0pQV6yzZSZ/v6vHyobXqxkc47ZERuSDQj2/bZeQbA75du43f39LWek0XSYZuJF4f0WmnCqPE5Y
	XUttalx7xow==
X-Gm-Gg: ASbGncvzQVjGRggkuloUeJm8qkEI4VNSahDAlpqeZuHTReaKa02MIVtJ1wcOlhu4Kha
	r/8XBuQfkEKZXpwpJ9caloCaJX5hPPUFgnCch9YuHauupKU9RHQ177hj4lxyNAA3De56cHOZAUY
	UajxRdb7sKx8lxvRQ8W/hch54itEaHKuezWf8G2+OwNt9i8e+a87q/rIhU10aYM6kEFZDquTaSE
	qTtTN1+K4Q9IQVi0RnIFtB3aI+Uu6ilG4889oOcl6CocffY2Pse/Wxup+hSIZ66x7yUgPxQs62B
	N4yjo2NIf3fKJ8J25szoXWaTp18iSj+l8CSuEDfXdc0aSq8OYMFkCpvGAmh2u3VyEDmGk48UmGW
	LZ0lD7G7vZYWHE4iNvxixjv8WgIC7dQL0D7Q4tw4DgA2F/fWALN5SrBh889vlLdeHe/PtIH9Gzi
	CUHRtVGlqdj/dMYKqENy4dRiLjzNn9+80=
X-Google-Smtp-Source: AGHT+IER8+bmuMbdjcD97+5cotGEKUK5WaBZmZaquXW1IzNe26x9Hzq0KqVwDRfOBxcOXNEFRJ9Dog==
X-Received: by 2002:a05:6000:616:b0:3ec:ea73:a94d with SMTP id ffacd0b85a97d-425671c0be5mr2758662f8f.37.1759532046511;
        Fri, 03 Oct 2025 15:54:06 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 21/22] x86/pv: System call handling in FRED mode
Date: Fri,  3 Oct 2025 23:53:33 +0100
Message-Id: <20251003225334.2123667-22-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
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

v3:
 * Simplify DCE handling.
 * Add ASSERT_UNREACHABLE() to pv_inject_callback().
 * Adjust comment for X86_ET_SW_INT

v2:
 * New
---
 xen/arch/x86/include/asm/domain.h    |   2 +
 xen/arch/x86/include/asm/hypercall.h |   2 -
 xen/arch/x86/pv/traps.c              |  39 ++++++++++
 xen/arch/x86/traps.c                 | 110 +++++++++++++++++++++++++++
 4 files changed, 151 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 5df8c7825333..828f42c3e448 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -710,6 +710,8 @@ void arch_vcpu_regs_init(struct vcpu *v);
 struct vcpu_hvm_context;
 int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx);
 
+void pv_inject_callback(unsigned int type);
+
 #ifdef CONFIG_PV
 void pv_inject_event(const struct x86_event *event);
 #else
diff --git a/xen/arch/x86/include/asm/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
index f6e9e2313b3c..ded3c24d40e2 100644
--- a/xen/arch/x86/include/asm/hypercall.h
+++ b/xen/arch/x86/include/asm/hypercall.h
@@ -18,9 +18,7 @@
 
 #define __HYPERVISOR_paging_domctl_cont __HYPERVISOR_arch_1
 
-#ifdef CONFIG_PV
 void pv_hypercall(struct cpu_user_regs *regs);
-#endif
 
 void pv_ring1_init_hypercall_page(void *ptr);
 void pv_ring3_init_hypercall_page(void *ptr);
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index c3c0976c440f..00de03412639 100644
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
@@ -95,6 +97,43 @@ void pv_inject_event(const struct x86_event *event)
     }
 }
 
+void pv_inject_callback(unsigned int type)
+{
+    struct vcpu *curr = current;
+    struct trap_bounce *tb = &curr->arch.pv.trap_bounce;
+    unsigned long rip;
+    bool irq;
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
+
+    default:
+        ASSERT_UNREACHABLE();
+        rip = 0;
+        irq = false;
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
index 955cff32d75f..5f89928d8128 100644
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
@@ -2267,6 +2270,7 @@ void asmlinkage check_ist_exit(const struct cpu_user_regs *regs, bool ist_exit)
 void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
 {
     struct fred_info *fi = cpu_regs_fred_info(regs);
+    struct vcpu *curr = current;
     uint8_t type = regs->fred_ss.type;
     uint8_t vec = regs->fred_ss.vector;
 
@@ -2306,6 +2310,30 @@ void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
 
     switch ( type )
     {
+    case X86_ET_SW_INT:
+        /*
+         * For better or worse, Xen writes IDT vectors 3 and 4 with DPL3 (so
+         * INT3/INTO work), making INT $3/4 indistinguishable, and the guest
+         * choice of DPL for these vectors is ignored.
+         *
+         * Have them fall through into X86_ET_HW_EXC, as #BP in particular
+         * needs handling by do_int3() in case an external debugger is
+         * attached.
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
@@ -2335,6 +2363,88 @@ void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
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



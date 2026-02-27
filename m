Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGSYJPQlommM0QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 479EB1BEF3C
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243153.1543239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw74u-0003Np-EN; Fri, 27 Feb 2026 23:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243153.1543239; Fri, 27 Feb 2026 23:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw74t-0003AJ-NW; Fri, 27 Feb 2026 23:16:59 +0000
Received: by outflank-mailman (input) for mailman id 1243153;
 Fri, 27 Feb 2026 23:16:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gz2F=A7=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vw74r-0001Do-1S
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 23:16:57 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 666569d4-1432-11f1-9ccf-f158ae23cfc8;
 Sat, 28 Feb 2026 00:16:52 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-43991cc3155so2439113f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Feb 2026 15:16:52 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c70e8e8sm9680306f8f.10.2026.02.27.15.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 15:16:51 -0800 (PST)
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
X-Inumbo-ID: 666569d4-1432-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1772234212; x=1772839012; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGrbegNxX52Qprjc9LHURGzyjTJEjBVjNc2DvWM4rPE=;
        b=cfR24MA2ZraMNZhxpjRXI0EIbZ8NDwIT124BCWEKOOxIpVODXNVfm7sqWxnY215+SB
         c9eTPTVUImIkeuhweszpCcqS3M9Xw1mC7mzexbtADsS31Fjb+cXZJ4OeEG7rmNpT3SUX
         uBRZsySD3IPaexCOHGFdiX0OrEEdQEFmYh/ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772234212; x=1772839012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XGrbegNxX52Qprjc9LHURGzyjTJEjBVjNc2DvWM4rPE=;
        b=TyGAYADbd++/NH1gXaEmYlw7vAUL2z/WxPH/tNVxnPjnFnL9qyrBCe7ejbjbKOIUk2
         ekpCy8pakF0Xoy3YSIOHfgSOekoDlNVzXyycbtDkf2q4ldzhXHiH+obqzbQQipZud4Kf
         ssOeqe4zxo7Pexosf0poovHUv4hQdkQa0LQ4YmXqr6qcw6sz6P4+X5XXrdkjhiYRY7J/
         qumSZkgJSO68ru0/jayaoNisvk6PJYV7DR8fFQNpXhG9P5tfo1shKl5KpqSylr/zgDgx
         /sMtyJ98qe+MISByUcOAPRBKGIiONIeSh0CHA977jI0Z+5zRxbvRIpDV9hr75zzDxmgu
         yl0g==
X-Gm-Message-State: AOJu0YxIIe/ytVrI9jSYpvy/iDPrQ6J/E+bFIgxu2Jdrvaxmv2ZPb61Y
	jmTp7v+dDPXpbhYYuZVOkXyKIde0HR3mFFdEEqy56lnjSc0CW5tz6DfzFmorq2LX6gBFDy8gxli
	Pe/azSH3Y0w==
X-Gm-Gg: ATEYQzyPiaMOoCLw84T75GywpbfjHVYkFwjH6Irtf4gIH3NOzv27anX6qR5zPi62HbC
	HTdYDnRAIfDLZMGRTu3GgSeKLa+H46OLCAZsA1hHSNP1n0QfVo0h7BZdkVs6EpS7CkrYK2HIi+y
	9jQSlKNpoyvUeQR84YEoiNxdu0AesfS0F1PI+/AzRofCkvw7alhi+puYwKRsvlToBO7BB/nK6Fi
	QcyGNSBrMLuP9+OnRAafsQdJFOZV8WLaVstiNHpQ8vSCmFnWjvQMBR732P/MOfDUEntimTUSl5N
	UBmzh88iINf2bJXOwpj8kakfar2j41Di5ti6Sok4XoMjsR+Nmnl2VPQrh5v570j4KWkvlXRj0ME
	awTQaJ1C944J8pDPoeGc6ehBhIukGsH5SSQ8gopQIuYzy2sNTnQAsUOCNo007nq0w7TqaKsAxhX
	EkyzI8rXMtRXFoxL4LM/ZOOmyB75rW6JGrzq9PpbOwsY4Ig9MfnJLxps3cx1qxRtDKRNV6XOM=
X-Received: by 2002:a05:6000:2482:b0:439:852f:c9e0 with SMTP id ffacd0b85a97d-4399de21f73mr7666076f8f.47.1772234211529;
        Fri, 27 Feb 2026 15:16:51 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 12/14] x86/pv: System call handling in FRED mode
Date: Fri, 27 Feb 2026 23:16:34 +0000
Message-Id: <20260227231636.3955109-13-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:dkim,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 479EB1BEF3C
X-Rspamd-Action: no action

Under FRED, entry_from_pv() handles everything, even system call instructions.
This means more of our logic is written in C now, rather than assembly.

In order to facilitate this, introduce pv_inject_callback(), which reuses
struct trap_bounce infrastructure to inject the syscall/sysenter callbacks.
This in turns requires some !PV compatibility for pv_inject_callback() and
pv_hypercall() which can both be ASSERT_UNREACHABLE().

For each of INT $N, SYSCALL and SYSENTER, FRED gives us interrupted context
which was previously lost.  As the guest can't see FRED, Xen has to lose state
in the same way to maintain the prior behaviour.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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
 xen/arch/x86/pv/traps.c              |  39 ++++++++
 xen/arch/x86/traps.c                 | 131 +++++++++++++++++++++++++++
 4 files changed, 172 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 94b0cf7f1d95..ad7f6adb2cb9 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -725,6 +725,8 @@ void arch_vcpu_regs_init(struct vcpu *v);
 struct vcpu_hvm_context;
 int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx);
 
+void pv_inject_callback(unsigned int type);
+
 #ifdef CONFIG_PV
 void pv_inject_event(const struct x86_event *event);
 #else
diff --git a/xen/arch/x86/include/asm/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
index bf2f0e169aef..d042a61d1702 100644
--- a/xen/arch/x86/include/asm/hypercall.h
+++ b/xen/arch/x86/include/asm/hypercall.h
@@ -18,9 +18,7 @@
 
 #define __HYPERVISOR_paging_domctl_cont __HYPERVISOR_arch_1
 
-#ifdef CONFIG_PV
 void pv_hypercall(struct cpu_user_regs *regs);
-#endif
 
 void pv_ring1_init_hypercall_page(void *p);
 void pv_ring3_init_hypercall_page(void *p);
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index b0395b99145a..c863ab9d372a 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -20,6 +20,8 @@
 #include <asm/shared.h>
 #include <asm/traps.h>
 
+#include <public/callback.h>
+
 void pv_inject_event(const struct x86_event *event)
 {
     struct vcpu *curr = current;
@@ -96,6 +98,43 @@ void pv_inject_event(const struct x86_event *event)
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
index 2f40f628cbff..e2c35a046e6b 100644
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
@@ -51,6 +52,8 @@
 #include <asm/traps.h>
 #include <asm/uaccess.h>
 
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
 
@@ -2309,6 +2313,38 @@ void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
 
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
+         *
+         * As the event type is provided, INT $N instructions don't need #GP
+         * tricks to spot, and INT $0x80 doesn't need a fastpath.  As the
+         * guest is necessary PV64, INT $0x82 has no special meaning either.
+         *
+         * When converting to a fault, hardware finally gives us enough
+         * information to account for prefixes, so provide the more correct
+         * behaviour rather than assuming the instruction was two bytes long.
+         */
+        if ( vec != X86_EXC_BP && vec != X86_EXC_OF )
+        {
+            const struct trap_info *ti = &curr->arch.pv.trap_ctxt[vec];
+
+            if ( permit_softint(TI_GET_DPL(ti), curr, regs) )
+                pv_inject_sw_interrupt(vec);
+            else
+            {
+                regs->rip -= regs->fred_ss.insnlen;
+                pv_inject_hw_exception(X86_EXC_GP, (vec << 3) | X86_XEC_IDT);
+            }
+            break;
+        }
+        fallthrough;
     case X86_ET_HW_EXC:
     case X86_ET_PRIV_SW_EXC:
     case X86_ET_SW_EXC:
@@ -2338,6 +2374,101 @@ void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
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
+             * behaviour.
+             *
+             * The non-FRED SYSCALL path sets TRAP_syscall in entry_vector to
+             * signal that SYSRET can be used, but this isn't relevant in FRED
+             * mode.
+             *
+             * When setting the selectors, clear all upper metadata again for
+             * backwards compatibility.  In particular fred_ss.swint becomes
+             * pend_DB on ERETx, and nothing else in the pv_hypercall() would
+             * clean up.
+             *
+             * When converting to a fault, hardware finally gives us enough
+             * information to account for prefixes, so provide the more
+             * correct behaviour rather than assuming the instruction was two
+             * bytes long.
+             */
+            bool l = regs->fred_ss.l;
+            unsigned int len = regs->fred_ss.insnlen;
+
+            regs->ssx = l ? FLAT_KERNEL_SS   : FLAT_USER_SS32;
+            regs->csx = l ? FLAT_KERNEL_CS64 : FLAT_USER_CS32;
+
+            if ( guest_kernel_mode(curr, regs) )
+                pv_hypercall(regs);
+            else if ( (l ? curr->arch.pv.syscall_callback_eip
+                         : curr->arch.pv.syscall32_callback_eip) == 0 )
+            {
+                regs->rip -= len;
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
+        {
+            /*
+             * FRED delivery preserves the interrupted state, but previously
+             * SYSENTER discarded almost everything.
+             *
+             * The guest isn't aware of FRED, so recreate the legacy
+             * behaviour.
+             *
+             * When setting the selectors, clear all upper metadata.  In
+             * particular fred_ss.swint becomes pend_DB on ERETx.
+             *
+             * When converting to a fault, hardware finally gives us enough
+             * information to account for prefixes, so provide the more
+             * correct behaviour rather than assuming the instruction was two
+             * bytes long.
+             */
+            unsigned int len = regs->fred_ss.insnlen;
+
+            regs->ssx = FLAT_USER_SS;
+            regs->rsp = 0;
+            regs->eflags &= ~(X86_EFLAGS_VM | X86_EFLAGS_IF);
+            regs->csx = 3;
+            regs->rip = 0;
+
+            if ( !curr->arch.pv.sysenter_callback_eip )
+            {
+                regs->rip -= len;
+                pv_inject_hw_exception(X86_EXC_GP, 0);
+            }
+            else
+                pv_inject_callback(CALLBACKTYPE_sysenter);
+            break;
+        }
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E10F2787411
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 17:26:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590156.922279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZCDt-0004Xx-G6; Thu, 24 Aug 2023 15:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590156.922279; Thu, 24 Aug 2023 15:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZCDt-0004UD-Cd; Thu, 24 Aug 2023 15:26:13 +0000
Received: by outflank-mailman (input) for mailman id 590156;
 Thu, 24 Aug 2023 15:26:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hMLV=EJ=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qZCDs-0003YM-Ek
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 15:26:12 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d9cad5c-4292-11ee-8783-cb3800f73035;
 Thu, 24 Aug 2023 17:26:11 +0200 (CEST)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1bdca7cc28dso176295ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Aug 2023 08:26:11 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 t16-20020a170902e85000b001b8b07bc600sm12819845plg.186.2023.08.24.08.26.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Aug 2023 08:26:09 -0700 (PDT)
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
X-Inumbo-ID: 8d9cad5c-4292-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692890770; x=1693495570;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/1mAzmxduItOcOXjk5tVfVO4/BIEpE+srfvyqZde6DM=;
        b=jRDD6G+NO60XKeecExSozEAq1ydufrBwiOdDcBLn2btijgrHPqPHYENZMQ5HwW+FSO
         7yE3wlipfHjVpxol6VJsE/gwGNeFvUMo2KPDuOe0UTKZTRNM69wWqiAxrQ0YQsB841JM
         Pc/ELNozaitRF0M/XY8qx76Zjkyq9+/ldgB8ak2WY+wWTvbggH0ZbTZmcZMTi5CE1rNB
         eZrtp6fxLil5cj96EAoJXSiJt4QVg5Walo2LsCeASBU9BonPX4cicRBKySRZuN9T+hcL
         eZA3afYKtKoDvG2tg6fr7VgNPvHZYA/CrTwaUBqXDK/wxTVJ2ZAf1xtnWB4V6qIjd4Kt
         pEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692890770; x=1693495570;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/1mAzmxduItOcOXjk5tVfVO4/BIEpE+srfvyqZde6DM=;
        b=UoOMiegTBmokoqtZcpaFRhBaDDSupz3PeZS/3f9yrvmtN44lD9w7zWesDgDe3Ezhlq
         XWry3ZnTfUSK8pq1GSESmDMkgMpOb33I2msiUI1rtFJge4dwKL2LyLgEsi7l1rfGRVkP
         Xa7LAn8Q5kY+O7H1MRCT1jmnJbM0zcrnEoBoeo6dNZ5bxpj6qu64LJy4pWthTHJOHdxb
         BTxk7ZPpq3HLfI4bO5VUXjDmUNsEyYCFfxc3wBeFr0rOP1Ak8eb+r7c/C7mv1ATwOZcy
         spTiVG81/k0vg9ydk+whqJR+auXvPh/zja1YzPDuVBqAPVnqlkztchn1YXarR8mk2WqE
         F8Hg==
X-Gm-Message-State: AOJu0YwrSVnTNkdrlM71qJU1npmE62LyK2QY1gIhxEGDKLQwHuqBcuC0
	+HLdaO89IjuhfTBKjtsQueQ=
X-Google-Smtp-Source: AGHT+IE3V8hySplXb36ES/mbjMR9s0LKyvFQGRwbIyj1CLVqIshylo4q15cZ78OZJtZYrBR1xNBXFg==
X-Received: by 2002:a17:902:f7cd:b0:1c0:ceab:e9bd with SMTP id h13-20020a170902f7cd00b001c0ceabe9bdmr868023plw.25.1692890769751;
        Thu, 24 Aug 2023 08:26:09 -0700 (PDT)
Message-ID: <e01c71ad-cbc8-11c1-ce51-58931021193d@gmail.com>
Date: Fri, 25 Aug 2023 00:26:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: [PATCH v2 3/8] x86/emul: Add pending_dbg field to x86_event
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
Content-Language: en-US
In-Reply-To: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andrew Cooper <andrew.cooper3@citrix.com>

All #DB exceptions result in an update of %dr6, but this isn't captured in
Xen's handling.

PV guests generally work by modifying %dr6 before raising #DB, whereas HVM
guests do nothing and have a single-step special case in the lowest levels of
{vmx,svm}_inject_event().  All of this is buggy, but in particular, task
switches with the trace flag never end up signalling BT in %dr6.

To begin resolving this issue, add a new pending_dbg field to x86_event
(unioned with cr2 to avoid taking any extra space), and introduce
{pv,hvm}_inject_debug_exn() helpers to replace the current callers using
{pv,hvm}_inject_hw_exception().

A key property is that pending_dbg is taken with positive polarity to deal
with RTM sensibly.  Most callers pass in a constant, but callers passing in a
hardware %dr6 value need to xor the value with X86_DR6_DEFAULT to flip the
polarity of RTM and reserved fields.

For PV guests, move the ad-hoc updating of %dr6 into pv_inject_event().  This
in principle breaks the handing of RTM in do_debug(), but PV guests can't
actually enable MSR_DEBUGCTL.RTM yet, so this doesn't matter in practice.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
[ jinoh: Rebase onto staging, forward declare struct vcpu ]
Signed-off-by: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Tim Deegan <tim@xen.org>
CC: Tamas K Lengyel <tamas@tklengyel.com>
CC: Alexandru Isaila <aisaila@bitdefender.com>
CC: Petre Pircalabu <ppircalabu@bitdefender.com>

v1 -> v2: [S-o-b fixes. More details below.]

- Update DR6 for gdbsx when trapped in PV guest kernel mode
---
 xen/arch/x86/hvm/emulate.c             |  3 ++-
 xen/arch/x86/hvm/hvm.c                 |  2 +-
 xen/arch/x86/hvm/svm/svm.c             |  9 ++++++---
 xen/arch/x86/hvm/vmx/vmx.c             | 13 ++++++++-----
 xen/arch/x86/include/asm/debugreg.h    |  3 +++
 xen/arch/x86/include/asm/domain.h      | 12 ++++++++++++
 xen/arch/x86/include/asm/hvm/hvm.h     | 15 ++++++++++++++-
 xen/arch/x86/mm/shadow/multi.c         |  5 +++--
 xen/arch/x86/pv/emul-priv-op.c         | 11 +++++------
 xen/arch/x86/pv/emulate.c              |  6 ++----
 xen/arch/x86/pv/ro-page-fault.c        |  3 ++-
 xen/arch/x86/pv/traps.c                | 16 ++++++++++++----
 xen/arch/x86/traps.c                   | 10 +++++-----
 xen/arch/x86/x86_emulate/x86_emulate.h |  5 ++++-
 14 files changed, 79 insertions(+), 34 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 9b6e4c8bc6..129403ad90 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -16,6 +16,7 @@
 #include <xen/paging.h>
 #include <xen/trace.h>
 #include <xen/vm_event.h>
+#include <asm/debugreg.h>
 #include <asm/event.h>
 #include <asm/i387.h>
 #include <asm/xstate.h>
@@ -2673,7 +2674,7 @@ static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
     }
 
     if ( hvmemul_ctxt->ctxt.retire.singlestep )
-        hvm_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
+        hvm_inject_debug_exn(X86_DR6_BS);
 
     new_intr_shadow = hvmemul_ctxt->intr_shadow;
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index c726947ccb..f795ef9bc7 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3234,7 +3234,7 @@ void hvm_task_switch(
     }
 
     if ( (tss.trace & 1) && !exn_raised )
-        hvm_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
+        hvm_inject_debug_exn(X86_DR6_BT);
 
  out:
     hvm_unmap_entry(optss_desc);
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index beb076ea8d..3d0402cb10 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -96,7 +96,7 @@ void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len)
     curr->arch.hvm.svm.vmcb->int_stat.intr_shadow = 0;
 
     if ( regs->eflags & X86_EFLAGS_TF )
-        hvm_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
+        hvm_inject_debug_exn(X86_DR6_BS);
 }
 
 static void cf_check svm_cpu_down(void)
@@ -2755,7 +2755,10 @@ void svm_vmexit_handler(void)
                 goto unexpected_exit_type;
             if ( !rc )
                 hvm_inject_exception(X86_EXC_DB,
-                                     trap_type, insn_len, X86_EVENT_NO_EC);
+                                     trap_type, insn_len, X86_EVENT_NO_EC,
+                                     exit_reason == VMEXIT_ICEBP ? 0 :
+                                     /* #DB - Hardware already updated dr6. */
+                                     vmcb_get_dr6(vmcb) ^ X86_DR6_DEFAULT);
         }
         else
             domain_pause_for_debugger();
@@ -2785,7 +2788,7 @@ void svm_vmexit_handler(void)
            if ( !rc )
                hvm_inject_exception(X86_EXC_BP,
                                     X86_EVENTTYPE_SW_EXCEPTION,
-                                    insn_len, X86_EVENT_NO_EC);
+                                    insn_len, X86_EVENT_NO_EC, 0 /* N/A */);
         }
         break;
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 1edc7f1e91..9c92d2be92 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3068,7 +3068,7 @@ void update_guest_eip(void)
     }
 
     if ( regs->eflags & X86_EFLAGS_TF )
-        hvm_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
+        hvm_inject_debug_exn(X86_DR6_BS);
 }
 
 static void cf_check vmx_fpu_dirty_intercept(void)
@@ -3911,7 +3911,7 @@ static int vmx_handle_eoi_write(void)
  * It is the callers responsibility to ensure that this function is only used
  * in the context of an appropriate vmexit.
  */
-static void vmx_propagate_intr(unsigned long intr)
+static void vmx_propagate_intr(unsigned long intr, unsigned long pending_dbg)
 {
     struct x86_event event = {
         .vector = MASK_EXTR(intr, INTR_INFO_VECTOR_MASK),
@@ -3935,6 +3935,9 @@ static void vmx_propagate_intr(unsigned long intr)
     else
         event.insn_len = 0;
 
+    if ( event.vector == X86_EXC_DB )
+        event.pending_dbg = pending_dbg;
+
     hvm_inject_event(&event);
 }
 
@@ -4300,7 +4303,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
                 if ( rc < 0 )
                     goto exit_and_crash;
                 if ( !rc )
-                    vmx_propagate_intr(intr_info);
+                    vmx_propagate_intr(intr_info, exit_qualification);
             }
             else
                 domain_pause_for_debugger();
@@ -4321,7 +4324,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
                 if ( rc < 0 )
                     goto exit_and_crash;
                 if ( !rc )
-                    vmx_propagate_intr(intr_info);
+                    vmx_propagate_intr(intr_info, 0 /* N/A */);
             }
             else
             {
@@ -4361,7 +4364,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
             break;
         case X86_EXC_AC:
             HVMTRACE_1D(TRAP, vector);
-            vmx_propagate_intr(intr_info);
+            vmx_propagate_intr(intr_info, 0 /* N/A */);
             break;
         case X86_EXC_NMI:
             if ( MASK_EXTR(intr_info, INTR_INFO_INTR_TYPE_MASK) !=
diff --git a/xen/arch/x86/include/asm/debugreg.h b/xen/arch/x86/include/asm/debugreg.h
index 74344555d2..f83b1b96ec 100644
--- a/xen/arch/x86/include/asm/debugreg.h
+++ b/xen/arch/x86/include/asm/debugreg.h
@@ -75,6 +75,9 @@
     asm volatile ( "mov %%db" #reg ",%0" : "=r" (__val) );  \
     __val;                                                  \
 })
+
+struct vcpu;
+
 long set_debugreg(struct vcpu *, unsigned int reg, unsigned long value);
 void activate_debugregs(const struct vcpu *);
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index c2d9fc333b..eba11adf33 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -729,6 +729,18 @@ static inline void pv_inject_hw_exception(unsigned int vector, int errcode)
     pv_inject_event(&event);
 }
 
+static inline void pv_inject_debug_exn(unsigned long pending_dbg)
+{
+    struct x86_event event = {
+        .vector      = X86_EXC_DB,
+        .type        = X86_EVENTTYPE_HW_EXCEPTION,
+        .error_code  = X86_EVENT_NO_EC,
+        .pending_dbg = pending_dbg,
+    };
+
+    pv_inject_event(&event);
+}
+
 static inline void pv_inject_page_fault(int errcode, unsigned long cr2)
 {
     const struct x86_event event = {
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 6d53713fc3..43989f1681 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -503,13 +503,14 @@ hvm_get_cpl(struct vcpu *v)
 
 static inline void hvm_inject_exception(
     unsigned int vector, unsigned int type,
-    unsigned int insn_len, int error_code)
+    unsigned int insn_len, int error_code, unsigned long extra)
 {
     struct x86_event event = {
         .vector = vector,
         .type = type,
         .insn_len = insn_len,
         .error_code = error_code,
+        .cr2 = extra, /* Any union field will do. */
     };
 
     hvm_inject_event(&event);
@@ -526,6 +527,18 @@ static inline void hvm_inject_hw_exception(unsigned int vector, int errcode)
     hvm_inject_event(&event);
 }
 
+static inline void hvm_inject_debug_exn(unsigned long pending_dbg)
+{
+    struct x86_event event = {
+        .vector      = X86_EXC_DB,
+        .type        = X86_EVENTTYPE_HW_EXCEPTION,
+        .error_code  = X86_EVENT_NO_EC,
+        .pending_dbg = pending_dbg,
+    };
+
+    hvm_inject_event(&event);
+}
+
 static inline void hvm_inject_page_fault(int errcode, unsigned long cr2)
 {
     struct x86_event event = {
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index cf74fdf5dd..6056626912 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -15,6 +15,7 @@
 #include <xen/perfc.h>
 #include <xen/domain_page.h>
 #include <xen/iocap.h>
+#include <asm/debugreg.h>
 #include <xsm/xsm.h>
 #include <asm/page.h>
 #include <asm/current.h>
@@ -2788,7 +2789,7 @@ static int cf_check sh_page_fault(
 #endif
 
     if ( emul_ctxt.ctxt.retire.singlestep )
-        hvm_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
+        hvm_inject_debug_exn(X86_DR6_BS);
 
 #if GUEST_PAGING_LEVELS == 3 /* PAE guest */
     /*
@@ -2829,7 +2830,7 @@ static int cf_check sh_page_fault(
                 TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_EMULATION_LAST_FAILED);
 
                 if ( emul_ctxt.ctxt.retire.singlestep )
-                    hvm_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
+                    hvm_inject_debug_exn(X86_DR6_BS);
 
                 break; /* Don't emulate again if we failed! */
             }
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 142bc4818c..72d0514e74 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -1360,12 +1360,11 @@ int pv_emulate_privileged_op(struct cpu_user_regs *regs)
     case X86EMUL_OKAY:
         if ( ctxt.ctxt.retire.singlestep )
             ctxt.bpmatch |= DR_STEP;
-        if ( ctxt.bpmatch )
-        {
-            curr->arch.dr6 |= ctxt.bpmatch | DR_STATUS_RESERVED_ONE;
-            if ( !(curr->arch.pv.trap_bounce.flags & TBF_EXCEPTION) )
-                pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
-        }
+
+        if ( ctxt.bpmatch &&
+             !(curr->arch.pv.trap_bounce.flags & TBF_EXCEPTION) )
+            pv_inject_debug_exn(ctxt.bpmatch);
+
         /* fall through */
     case X86EMUL_RETRY:
         return EXCRET_fault_fixed;
diff --git a/xen/arch/x86/pv/emulate.c b/xen/arch/x86/pv/emulate.c
index e7a1c0a2cc..aa8af96c30 100644
--- a/xen/arch/x86/pv/emulate.c
+++ b/xen/arch/x86/pv/emulate.c
@@ -71,11 +71,9 @@ void pv_emul_instruction_done(struct cpu_user_regs *regs, unsigned long rip)
 {
     regs->rip = rip;
     regs->eflags &= ~X86_EFLAGS_RF;
+
     if ( regs->eflags & X86_EFLAGS_TF )
-    {
-        current->arch.dr6 |= DR_STEP | DR_STATUS_RESERVED_ONE;
-        pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
-    }
+        pv_inject_debug_exn(X86_DR6_BS);
 }
 
 uint64_t pv_get_reg(struct vcpu *v, unsigned int reg)
diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index cad28ef928..50c37fbd25 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -9,6 +9,7 @@
  */
 
 #include <asm/pv/trace.h>
+#include <asm/debugreg.h>
 #include <asm/shadow.h>
 
 #include "emulate.h"
@@ -390,7 +391,7 @@ int pv_ro_page_fault(unsigned long addr, struct cpu_user_regs *regs)
         /* Fallthrough */
     case X86EMUL_OKAY:
         if ( ctxt.retire.singlestep )
-            pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
+            pv_inject_debug_exn(X86_DR6_BS);
 
         /* Fallthrough */
     case X86EMUL_RETRY:
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 74f333da7e..4f5641a47c 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -13,6 +13,7 @@
 #include <xen/softirq.h>
 
 #include <asm/pv/trace.h>
+#include <asm/debugreg.h>
 #include <asm/shared.h>
 #include <asm/traps.h>
 #include <irq_vectors.h>
@@ -50,9 +51,9 @@ void pv_inject_event(const struct x86_event *event)
     tb->cs    = ti->cs;
     tb->eip   = ti->address;
 
-    if ( event->type == X86_EVENTTYPE_HW_EXCEPTION &&
-         vector == X86_EXC_PF )
+    switch ( vector | -(event->type == X86_EVENTTYPE_SW_INTERRUPT) )
     {
+    case X86_EXC_PF:
         curr->arch.pv.ctrlreg[2] = event->cr2;
         arch_set_cr2(curr, event->cr2);
 
@@ -62,9 +63,16 @@ void pv_inject_event(const struct x86_event *event)
             error_code |= PFEC_user_mode;
 
         trace_pv_page_fault(event->cr2, error_code);
-    }
-    else
+        break;
+
+    case X86_EXC_DB:
+        curr->arch.dr6 |= event->pending_dbg;
+        /* Fallthrough */
+
+    default:
         trace_pv_trap(vector, regs->rip, use_error_code, error_code);
+        break;
+    }
 
     if ( use_error_code )
     {
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index a898e1f2d7..e2acfbcb9e 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1989,17 +1989,17 @@ void do_debug(struct cpu_user_regs *regs)
         return;
     }
 
-    /* Save debug status register where guest OS can peek at it */
-    v->arch.dr6 |= (dr6 & ~X86_DR6_DEFAULT);
-    v->arch.dr6 &= (dr6 | ~X86_DR6_DEFAULT);
-
     if ( guest_kernel_mode(v, regs) && v->domain->debugger_attached )
     {
+        /* Save debug status register where gdbsx can peek at it */
+        v->arch.dr6 |= (dr6 & ~X86_DR6_DEFAULT);
+        v->arch.dr6 &= (dr6 | ~X86_DR6_DEFAULT);
+
         domain_pause_for_debugger();
         return;
     }
 
-    pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
+    pv_inject_debug_exn(dr6 ^ X86_DR6_DEFAULT);
 }
 
 void do_entry_CP(struct cpu_user_regs *regs)
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index 698750267a..e348e3c1d3 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -78,7 +78,10 @@ struct x86_event {
     uint8_t       type;         /* X86_EVENTTYPE_* */
     uint8_t       insn_len;     /* Instruction length */
     int32_t       error_code;   /* X86_EVENT_NO_EC if n/a */
-    unsigned long cr2;          /* Only for X86_EXC_PF h/w exception */
+    union {
+        unsigned long cr2;         /* #PF */
+        unsigned long pending_dbg; /* #DB (new DR6 bits, positive polarity) */
+    };
 };
 
 /*
-- 
2.41.0



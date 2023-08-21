Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47463782DA1
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 17:57:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587666.919033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY7HI-0007qQ-88; Mon, 21 Aug 2023 15:57:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587666.919033; Mon, 21 Aug 2023 15:57:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY7HI-0007oS-5C; Mon, 21 Aug 2023 15:57:16 +0000
Received: by outflank-mailman (input) for mailman id 587666;
 Mon, 21 Aug 2023 15:57:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0mH9=EG=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qY7HH-0007T4-Dh
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 15:57:15 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64b76b61-403b-11ee-8782-cb3800f73035;
 Mon, 21 Aug 2023 17:57:14 +0200 (CEST)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1bf0b24d925so20967405ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Aug 2023 08:57:14 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 f9-20020a170902ce8900b001ae0a4b1d3fsm7191686plg.153.2023.08.21.08.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Aug 2023 08:57:11 -0700 (PDT)
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
X-Inumbo-ID: 64b76b61-403b-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692633432; x=1693238232;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hSh7CjYmh4pzgCRYpqWLhaZZ/JE6zO58mEjCpiQd2qI=;
        b=f76C1e8xFy+qyoOxihP2DN4q0r9qi06GSdUr8g9MSCelkUNXFBjGQ6tIMjsy5uh+rZ
         zGJjr1vxNSO1fXU3CNqmO+rIUkphjLiSra6DbmiPHfrDnecvnPJqmCGbVnEcdOl6MEDP
         xExA6UKPcrkr+wf0j5vGKSyvccA9K9Z+cQjmi8oo3wgGMUIgZybVii7ttSui7ig4HVER
         JB2UFK2KReg3YmdHyOag1zoEf9gjYHGbYiUQ0jU0jxKRbUQxmjisy8nQBJSnAU29VapZ
         klCzlI4tWqsx8CrGYmj+4CSyfXxn64vHGWkUsKFH2ZpCHDKVEo8t3QIrKQ/BrMX8XqE2
         hJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692633432; x=1693238232;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hSh7CjYmh4pzgCRYpqWLhaZZ/JE6zO58mEjCpiQd2qI=;
        b=LY/XLpq92NFEsJCv9+W8BODtdfdgWtE3/wp2wyYXNibBWkVs7asH0NzLOBdk2xDW5S
         K+Qtnpp81p82SGbwdE9NOTqxmIViOjKi8xmdMhVFuvxjzFzc13yfLXiRdfBVWDl2mcJQ
         Va6yuKDSjccdvzOP1sO90d+X6vNFT5ZYaMUjdcCwC9bf8QIpornJKBxUPVuQ5XY7H/MY
         gdZ8h1fWusQORGKHYw9RBBFBt/yteLu+HfsOLEYI2AGc5SqkmHyqsZH0fC7Y76HDHBho
         eYY/thSz4irbq+XEyJaNgPhjGHYLKoVz7kidd3W074p6GYuhBpVKWci+VpMRKMg1kCe6
         F90A==
X-Gm-Message-State: AOJu0YwB82J7AKz3lM+4NL7JqD0Wk/WI8mMkpdSa4Br4MwC6NE6Am1RT
	kMZdVcRP0mgSIC4PYO68/NdwZC0kHBAmSA==
X-Google-Smtp-Source: AGHT+IGRQ+QsQ9szgfNdvXXaxuwNTqett1/4eESHiEzQvtoF2kdaWBk+HuAZFyNgb48bAI7hq0cqlQ==
X-Received: by 2002:a17:902:dac2:b0:1bb:99d3:6a53 with SMTP id q2-20020a170902dac200b001bb99d36a53mr5646803plx.20.1692633432525;
        Mon, 21 Aug 2023 08:57:12 -0700 (PDT)
Message-ID: <aa422104-be1b-dd6e-8c02-00b90ef2e64c@gmail.com>
Date: Tue, 22 Aug 2023 00:57:07 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: [PATCH 3/5] x86/hvm: RFC - PROBABLY BROKEN - Defer all
 debugging/monitor actions to {svm,vmx}_inject_event()
To: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <5fa229fc-9514-abc6-5e72-2447a2c637d0@gmail.com>
Content-Language: en-US
In-Reply-To: <5fa229fc-9514-abc6-5e72-2447a2c637d0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andrew Cooper <andrew.cooper3@citrix.com>

Currently, there is a lot of functionality in the #DB intercepts, and some
repeated functionality in the *_inject_event() logic.

The gdbsx code is implemented at both levels (albeit differently for #BP,
which is presumably due to the fact that the old emulator behaviour used to be
to move %rip forwards for traps), while the monitor behaviour only exists at
the intercept level.

Updating of %dr6 is implemented (buggily) at both levels, but having it at
both levels is problematic to implement correctly.

Rearrange the logic to have nothing interesting at the intercept level, and
everything implemented at the injection level.  Amongst other things, this
means that the monitor subsystem will pick up debug actions from emulated
events.

Signed-off-by: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Razvan Cojocaru <rcojocaru@bitdefender.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>

This is RFC because it probably breaks introspection, as injection replies
from the introspection engine will (probably, but I haven't confirmed) trigger
new monitor events.

First of all, monitoring emulated debug events is a change in behaviour,
although IMO it is more of a bugfix than a new feature.  Also, similar changes
will happen to other monitored events as we try to unify the
intercept/emulation paths.

As for the recursive triggering of monitor events, I was considering extending
the monitor infrastructure to have a "in monitor reply" boolean which causes
hvm_monitor_debug() to ignore the recursive request.

Does this plan sound ok, or have I missed something more subtle with monitor
handling?
---
 xen/arch/x86/hvm/svm/svm.c | 126 ++++++++++++++++++++-----------------
 xen/arch/x86/hvm/vmx/vmx.c | 102 +++++++++++++-----------------
 2 files changed, 110 insertions(+), 118 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index ac3123c56f..bd3adde0ec 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1328,19 +1328,50 @@ static void cf_check svm_inject_event(const struct x86_event *event)
     switch ( _event.vector | -(_event.type == X86_EVENTTYPE_SW_INTERRUPT) )
     {
     case X86_EXC_DB:
-        if ( regs->eflags & X86_EFLAGS_TF )
-        {
-            __restore_debug_registers(vmcb, curr);
-            vmcb_set_dr6(vmcb, vmcb_get_dr6(vmcb) | DR_STEP);
-        }
+        /*
+         * On AMD hardware, a #DB exception:
+         *  1) Merges new status bits into %dr6
+         *  2) Clears %dr7.gd and MSR_DEBUGCTL.{LBR,BTF}
+         *
+         * Item 1 is done by hardware before a #DB intercepted vmexit, but we
+         * may end up here from emulation so have to repeat it ourselves.
+         * Item 2 is done by hardware when injecting a #DB exception.
+         */
+        __restore_debug_registers(vmcb, curr);
+        vmcb_set_dr6(vmcb, vmcb_get_dr6(vmcb) | _event.pending_dbg);
+
         /* fall through */
     case X86_EXC_BP:
         if ( curr->domain->debugger_attached )
         {
             /* Debug/Int3: Trap to debugger. */
+            if ( _event.vector == X86_EXC_BP )
+            {
+                /* N.B. Can't use __update_guest_eip() for risk of recusion. */
+                regs->rip += _event.insn_len;
+                regs->eflags &= ~X86_EFLAGS_RF;
+                curr->arch.gdbsx_vcpu_event = X86_EXC_BP;
+            }
+
             domain_pause_for_debugger();
             return;
         }
+        else
+        {
+            int rc = hvm_monitor_debug(regs->rip,
+                                       _event.vector == X86_EXC_DB
+                                       ? HVM_MONITOR_DEBUG_EXCEPTION
+                                       : HVM_MONITOR_SOFTWARE_BREAKPOINT,
+                                       _event.type, _event.insn_len,
+                                       _event.pending_dbg);
+            if ( rc < 0 )
+            {
+                gprintk(XENLOG_ERR, "Monitor debug error %d\n", rc);
+                return svm_crash_or_fault(curr);
+            }
+            if ( rc )
+                return; /* VCPU paused.  Wait for monitor. */
+        }
         break;
 
     case X86_EXC_PF:
@@ -2730,67 +2761,46 @@ void svm_vmexit_handler(void)
 
     case VMEXIT_ICEBP:
     case VMEXIT_EXCEPTION_DB:
-        if ( !v->domain->debugger_attached )
+    case VMEXIT_EXCEPTION_BP:
+    {
+        unsigned int vec, type, len, extra;
+
+        switch ( exit_reason )
         {
-            unsigned int trap_type;
+        case VMEXIT_ICEBP:
+            vec   = X86_EXC_DB;
+            type  = X86_EVENTTYPE_PRI_SW_EXCEPTION;
+            len   = svm_get_insn_len(v, INSTR_ICEBP);
+            extra = 0;
+            break;
 
-            if ( likely(exit_reason != VMEXIT_ICEBP) )
-            {
-                trap_type = X86_EVENTTYPE_HW_EXCEPTION;
-                insn_len = 0;
-            }
-            else
-            {
-                trap_type = X86_EVENTTYPE_PRI_SW_EXCEPTION;
-                insn_len = svm_get_insn_len(v, INSTR_ICEBP);
+        case VMEXIT_EXCEPTION_DB:
+            vec   = X86_EXC_DB;
+            type  = X86_EVENTTYPE_HW_EXCEPTION;
+            len   = 0;
+            /* #DB - Hardware has already updated %dr6 for us. */
+            extra = vmcb_get_dr6(vmcb) ^ X86_DR6_DEFAULT;
+            break;
 
-                if ( !insn_len )
-                    break;
-            }
+        case VMEXIT_EXCEPTION_BP:
+            vec   = X86_EXC_BP;
+            type  = X86_EVENTTYPE_SW_EXCEPTION;
+            len   = svm_get_insn_len(v, INSTR_INT3);
+            extra = 0; /* N/A */
+            break;
 
-            rc = hvm_monitor_debug(regs->rip,
-                                   HVM_MONITOR_DEBUG_EXCEPTION,
-                                   trap_type, insn_len, 0);
-            if ( rc < 0 )
-                goto unexpected_exit_type;
-            if ( !rc )
-                hvm_inject_exception(X86_EXC_DB,
-                                     trap_type, insn_len, X86_EVENT_NO_EC,
-                                     exit_reason == VMEXIT_ICEBP ? 0 :
-                                     /* #DB - Hardware already updated dr6. */
-                                     vmcb_get_dr6(vmcb) ^ X86_DR6_DEFAULT);
+        default:
+            ASSERT_UNREACHABLE();
+            goto unexpected_exit_type;
         }
-        else
-            domain_pause_for_debugger();
-        break;
 
-    case VMEXIT_EXCEPTION_BP:
-        insn_len = svm_get_insn_len(v, INSTR_INT3);
-
-        if ( insn_len == 0 )
-             break;
+        /* svm_get_insn_len() failure.  #GP queued up. */
+        if ( type >= X86_EVENTTYPE_SW_INTERRUPT && !len )
+            break;
 
-        if ( v->domain->debugger_attached )
-        {
-            /* AMD Vol2, 15.11: INT3, INTO, BOUND intercepts do not update RIP. */
-            __update_guest_eip(regs, insn_len);
-            current->arch.gdbsx_vcpu_event = X86_EXC_BP;
-            domain_pause_for_debugger();
-        }
-        else
-        {
-           rc = hvm_monitor_debug(regs->rip,
-                                  HVM_MONITOR_SOFTWARE_BREAKPOINT,
-                                  X86_EVENTTYPE_SW_EXCEPTION,
-                                  insn_len, 0);
-           if ( rc < 0 )
-               goto unexpected_exit_type;
-           if ( !rc )
-               hvm_inject_exception(X86_EXC_BP,
-                                    X86_EVENTTYPE_SW_EXCEPTION,
-                                    insn_len, X86_EVENT_NO_EC, 0 /* N/A */);
-        }
+        hvm_inject_exception(vec, type, len, X86_EVENT_NO_EC, extra);
         break;
+    }
 
     case VMEXIT_EXCEPTION_NM:
         svm_fpu_dirty_intercept();
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 716115332b..65166348f1 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2018,15 +2018,21 @@ static void cf_check vmx_inject_event(const struct x86_event *event)
     unsigned long intr_info;
     struct vcpu *curr = current;
     struct x86_event _event = *event;
+    struct cpu_user_regs *regs = guest_cpu_user_regs();
 
     switch ( _event.vector | -(_event.type == X86_EVENTTYPE_SW_INTERRUPT) )
     {
     case X86_EXC_DB:
-        if ( guest_cpu_user_regs()->eflags & X86_EFLAGS_TF )
-        {
-            __restore_debug_registers(curr);
-            write_debugreg(6, read_debugreg(6) | DR_STEP);
-        }
+        /*
+         * On Intel hardware, a #DB exception:
+         *  1) Merges new status bits into %dr6
+         *  2) Clears %dr7.gd and MSR_DEBUGCTL.LBR
+         *
+         * All actions are left up to the hypervisor to perform.
+         */
+        __restore_debug_registers(curr);
+        write_debugreg(6, read_debugreg(6) | event->pending_dbg);
+
         if ( !nestedhvm_vcpu_in_guestmode(curr) ||
              !nvmx_intercepts_exception(curr, X86_EXC_DB, _event.error_code) )
         {
@@ -2037,16 +2043,39 @@ static void cf_check vmx_inject_event(const struct x86_event *event)
             __vmread(GUEST_IA32_DEBUGCTL, &val);
             __vmwrite(GUEST_IA32_DEBUGCTL, val & ~IA32_DEBUGCTLMSR_LBR);
         }
-        if ( cpu_has_monitor_trap_flag )
-            break;
+
         /* fall through */
     case X86_EXC_BP:
         if ( curr->domain->debugger_attached )
         {
             /* Debug/Int3: Trap to debugger. */
+            if ( _event.vector == X86_EXC_BP )
+            {
+                /* N.B. Can't use __update_guest_eip() for risk of recusion. */
+                regs->rip += _event.insn_len;
+                regs->eflags &= ~X86_EFLAGS_RF;
+                curr->arch.gdbsx_vcpu_event = X86_EXC_BP;
+            }
+
             domain_pause_for_debugger();
             return;
         }
+        else
+        {
+            int rc = hvm_monitor_debug(regs->rip,
+                                       _event.vector == X86_EXC_DB
+                                       ? HVM_MONITOR_DEBUG_EXCEPTION
+                                       : HVM_MONITOR_SOFTWARE_BREAKPOINT,
+                                       _event.type, _event.insn_len, 0);
+            if ( rc < 0 )
+            {
+                gprintk(XENLOG_ERR, "Monitor debug error %d\n", rc);
+                domain_crash(curr->domain);
+                return;
+            }
+            if ( rc )
+                return; /* VCPU paused.  Wait for monitor. */
+        }
         break;
 
     case X86_EXC_PF:
@@ -4242,14 +4271,8 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         switch ( vector )
         {
         case X86_EXC_DB:
-            /*
-             * Updates DR6 where debugger can peek (See 3B 23.2.1,
-             * Table 23-1, "Exit Qualification for Debug Exceptions").
-             */
             __vmread(EXIT_QUALIFICATION, &exit_qualification);
             HVMTRACE_1D(TRAP_DEBUG, exit_qualification);
-            __restore_debug_registers(v);
-            write_debugreg(6, exit_qualification | DR_STATUS_RESERVED_ONE);
 
             /*
              * Work around SingleStep + STI/MovSS VMEntry failures.
@@ -4286,53 +4309,15 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
                 }
             }
 
-            if ( !v->domain->debugger_attached )
-            {
-                unsigned long insn_len = 0;
-                int rc;
-                unsigned long trap_type = MASK_EXTR(intr_info,
-                                                    INTR_INFO_INTR_TYPE_MASK);
-
-                if ( trap_type >= X86_EVENTTYPE_SW_INTERRUPT )
-                    __vmread(VM_EXIT_INSTRUCTION_LEN, &insn_len);
-
-                rc = hvm_monitor_debug(regs->rip,
-                                       HVM_MONITOR_DEBUG_EXCEPTION,
-                                       trap_type, insn_len, 0);
-
-                if ( rc < 0 )
-                    goto exit_and_crash;
-                if ( !rc )
-                    vmx_propagate_intr(intr_info, exit_qualification);
-            }
-            else
-                domain_pause_for_debugger();
+            vmx_propagate_intr(intr_info, exit_qualification);
             break;
+
         case X86_EXC_BP:
+        case X86_EXC_AC:
             HVMTRACE_1D(TRAP, vector);
-            if ( !v->domain->debugger_attached )
-            {
-                unsigned long insn_len;
-                int rc;
-
-                __vmread(VM_EXIT_INSTRUCTION_LEN, &insn_len);
-                rc = hvm_monitor_debug(regs->rip,
-                                       HVM_MONITOR_SOFTWARE_BREAKPOINT,
-                                       X86_EVENTTYPE_SW_EXCEPTION,
-                                       insn_len, 0);
-
-                if ( rc < 0 )
-                    goto exit_and_crash;
-                if ( !rc )
-                    vmx_propagate_intr(intr_info, 0 /* N/A */);
-            }
-            else
-            {
-                update_guest_eip(); /* Safe: INT3 */
-                v->arch.gdbsx_vcpu_event = X86_EXC_BP;
-                domain_pause_for_debugger();
-            }
+            vmx_propagate_intr(intr_info, 0 /* N/A */);
             break;
+
         case X86_EXC_NM:
             HVMTRACE_1D(TRAP, vector);
             vmx_fpu_dirty_intercept();
@@ -4362,10 +4347,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
 
             hvm_inject_page_fault(regs->error_code, exit_qualification);
             break;
-        case X86_EXC_AC:
-            HVMTRACE_1D(TRAP, vector);
-            vmx_propagate_intr(intr_info, 0 /* N/A */);
-            break;
+
         case X86_EXC_NMI:
             if ( MASK_EXTR(intr_info, INTR_INFO_INTR_TYPE_MASK) !=
                  X86_EVENTTYPE_NMI )
-- 
2.41.0



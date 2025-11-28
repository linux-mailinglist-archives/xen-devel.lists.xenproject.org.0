Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AAFC92D42
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 18:48:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175058.1499973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP2ZJ-0006Or-Ua; Fri, 28 Nov 2025 17:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175058.1499973; Fri, 28 Nov 2025 17:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP2ZJ-0006MG-Ru; Fri, 28 Nov 2025 17:47:41 +0000
Received: by outflank-mailman (input) for mailman id 1175058;
 Fri, 28 Nov 2025 17:47:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=61/n=6E=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vP2ZI-0006MA-4o
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 17:47:40 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54578bc9-cc82-11f0-9d18-b5c5bf9af7f9;
 Fri, 28 Nov 2025 18:47:38 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so21108635e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Nov 2025 09:47:38 -0800 (PST)
Received: from localhost.localdomain (host-92-29-237-183.as13285.net.
 [92.29.237.183]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47905303963sm96254665e9.7.2025.11.28.09.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 09:47:36 -0800 (PST)
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
X-Inumbo-ID: 54578bc9-cc82-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764352057; x=1764956857; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T9qkCujzjSOURjliy/HsoacPhW5hlsUW2K2Kz9vNsjo=;
        b=nqNL1oDsYBTcfmjJx2aeU1au1w6ScqKlt9gvGrg04100GTH0/KnNKSosHxiAA6BfHi
         EXmVjTc6t3NBxhKyjGLiFFpQaL3yeesla45caGDCP65csSDQOMm5O3g+/ZGo3JsjAu6j
         jNSM3A3xvNVz1UEw3bu66hM7/cVWiV01e6kVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764352057; x=1764956857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9qkCujzjSOURjliy/HsoacPhW5hlsUW2K2Kz9vNsjo=;
        b=vOsGCZXPucdMoV8LgHKOlOmUcF5yQl6TaccZQkXiiLi/bOZo5IweXUUT6NtnThWRsK
         2d9t6+wu2Iwa6MgkRf278KJNjuTkNiqGa0yAbbUWuM13M4nH3+FzoWFeMq3o31i1x4vc
         naQv1vKVtEPRrsPokRqh+nHmKJkgQGbsdezfYRJEkQon2pQwKXtcpG61EbQGlxW2RDiG
         jDFat0umgc4U7YlsIhHNUNvb/gTA+gDHMluazKubi3gZYwVYkV2W6DZHBqMwY+AGapi5
         0aCdR+6yc1bfRNac1dyM0O7xCh08Mx76qL+qixscNPKap1TIBvbpVFERob1uQBJ1CSVq
         ldqw==
X-Gm-Message-State: AOJu0YxvZspWB4SA0Cpzui5UjY9MeE9slkHlqiFX78JeIo9RxpbbQRet
	Oymo7l2PSqmGCU+dndfK5KSGOjFhoHH1YMGDkRPpnk4pYOVAedEC/VOpBA9mC3kiHvHPYaZCJyi
	xxgeV
X-Gm-Gg: ASbGncsvGzp0JGMsmQHpeLJ5xnemh1CasBJSiS1eN+sdDSIac3cUrLsoc23SW5FYcGQ
	NHNbZKmgxasb7wIjqprVSYFx2Gb5XzAVDNJCOygoEeJtEmhysHBX1JYVVFHQg1gqJ1+ly76tYWz
	EfFSGEFy1RVWmWK5undjiA8DX2t4ISj4KH5C5r6U4mfX0VGLfV689ddkjcpNMKCKy0uNt5DBWBA
	SiM9YJ9KsdGAN7PkfzlcwKLIii7l0+LgtiPi7jSikUtSkCRvOIa5VlFai47iOnwBJ71lP4Z7Dnu
	NEZOLpXf6WftmPedDrhH5R3UlaoQOcdWaucgdxMw59rLvC3UerDQe1nHdnMU+GMUORTrIBuEjpx
	BXn9eChW/biupw9gFgEE7LwrULQ6pHxaLpLOjZpIm4EAopH3keptW6sm12zf39v7XCZhUFKLhRL
	SXAlibrdnDZudUiea4IT8kxaltR0KeUJrUsMsyUTiVoKbBgSjFuuLUVo3YYwBL/w==
X-Google-Smtp-Source: AGHT+IECVoSdMR5CRk+uQKpZcF6cZ93jXy8aVcSWSLecJkYc5dkBfwtFsixRHtIMKDiHcOn/JgLs0w==
X-Received: by 2002:a05:600c:4ece:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-477c115db0cmr312848735e9.31.1764352057316;
        Fri, 28 Nov 2025 09:47:37 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/hvm: Unilaterally inject #UD for unknown VMExits
Date: Fri, 28 Nov 2025 17:47:35 +0000
Message-Id: <20251128174735.1238055-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While we do this for unknown user mode exits, crashing for supervisor mode
exits is unhelpful.  Intel in particular expect the unknown case to be #UD
because they do introduce new instructions with new VMEXIT_* codes without
other enablement controls.  e.g. MSRLIST, USER_MSR, MSR_IMM, but AMD have
RDPRU and SKINIT as examples too.

A guest which gets its CPUID checks wrong can trigger the VMExit, and the
VMexit handler would need to emulate the CPUID check and #UD anyway.  This
would be a guest bug, and giving it an exception is the right course of
action.

Drop the "#UD or crash" semantics and make it exclusively #UD.  Rename the
lables to match the changed semantics.  Fold the cases which were plain #UD's
too.

One case that was wrong beforehand was EPT_MISCONFIG.  Failing to resolve is
always a Xen bug, and not even necesserily due to the instruction under %rip.
Convert it to be an unconditional domain_crash() with applicable diagnostic
information.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/svm/svm.c | 29 +++++++++--------------------
 xen/arch/x86/hvm/vmx/vmx.c | 26 +++++++++++---------------
 2 files changed, 20 insertions(+), 35 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 2d7c598ffe99..637b47084c25 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -66,15 +66,6 @@ static bool amd_erratum383_found __read_mostly;
 static uint64_t osvw_length, osvw_status;
 static DEFINE_SPINLOCK(osvw_lock);
 
-/* Only crash the guest if the problem originates in kernel mode. */
-static void svm_crash_or_fault(struct vcpu *v)
-{
-    if ( vmcb_get_cpl(v->arch.hvm.svm.vmcb) )
-        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
-    else
-        domain_crash(v->domain);
-}
-
 void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len)
 {
     struct vcpu *curr = current;
@@ -85,7 +76,7 @@ void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len)
     if ( unlikely(inst_len > MAX_INST_LEN) )
     {
         gdprintk(XENLOG_ERR, "Bad instruction length %u\n", inst_len);
-        svm_crash_or_fault(curr);
+        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
         return;
     }
 
@@ -2872,7 +2863,7 @@ void asmlinkage svm_vmexit_handler(void)
          * task switch.  Decode under %rip to find its length.
          */
         if ( insn_len < 0 && (insn_len = svm_get_task_switch_insn_len()) == 0 )
-            goto crash_or_fault;
+            goto inject_ud;
 
         hvm_task_switch(vmcb->ei.task_switch.sel,
                         vmcb->ei.task_switch.iret ? TSW_iret :
@@ -2984,13 +2975,6 @@ void asmlinkage svm_vmexit_handler(void)
         svm_vmexit_do_rdtsc(regs, exit_reason == VMEXIT_RDTSCP);
         break;
 
-    case VMEXIT_MONITOR:
-    case VMEXIT_MWAIT:
-    case VMEXIT_SKINIT:
-    case VMEXIT_RDPRU:
-        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
-        break;
-
     case VMEXIT_VMRUN:
         svm_vmexit_do_vmrun(regs, v, regs->rax);
         break;
@@ -3083,8 +3067,13 @@ void asmlinkage svm_vmexit_handler(void)
         gprintk(XENLOG_ERR, "Unexpected vmexit: reason %#"PRIx64", "
                 "exitinfo1 %#"PRIx64", exitinfo2 %#"PRIx64"\n",
                 exit_reason, vmcb->exitinfo1, vmcb->exitinfo2);
-    crash_or_fault:
-        svm_crash_or_fault(v);
+        fallthrough;
+    case VMEXIT_MONITOR:
+    case VMEXIT_MWAIT:
+    case VMEXIT_SKINIT:
+    case VMEXIT_RDPRU:
+    inject_ud:
+        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
         break;
     }
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 6b407226c44c..1af5861ef921 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4337,7 +4337,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
         __vmread(EXIT_QUALIFICATION, &exit_qualification);
         rc = hvm_monitor_vmexit(exit_reason, exit_qualification);
         if ( rc < 0 )
-            goto exit_and_crash;
+            goto unexpected_vmexit;
         if ( rc )
             return;
     }
@@ -4490,7 +4490,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
                                        trap_type, insn_len, 0);
 
                 if ( rc < 0 )
-                    goto exit_and_crash;
+                    goto unexpected_vmexit;
                 if ( !rc )
                     vmx_propagate_intr(intr_info);
             }
@@ -4511,7 +4511,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
                                        insn_len, 0);
 
                 if ( rc < 0 )
-                    goto exit_and_crash;
+                    goto unexpected_vmexit;
                 if ( !rc )
                     vmx_propagate_intr(intr_info);
             }
@@ -4557,7 +4557,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
         case X86_EXC_NMI:
             if ( MASK_EXTR(intr_info, INTR_INFO_INTR_TYPE_MASK) !=
                  X86_ET_NMI )
-                goto exit_and_crash;
+                goto unexpected_vmexit;
             TRACE(TRC_HVM_NMI);
             /* Already handled above. */
             break;
@@ -4571,7 +4571,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
             break;
         default:
             TRACE(TRC_HVM_TRAP, vector);
-            goto exit_and_crash;
+            goto unexpected_vmexit;
         }
         break;
     }
@@ -4627,7 +4627,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
          * rc > 0 paused waiting for response, work here is done
          */
         if ( rc < 0 )
-            goto exit_and_crash;
+            goto unexpected_vmexit;
         if ( !rc )
             update_guest_eip(); /* Safe: CPUID */
         break;
@@ -4773,7 +4773,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
 
         rc = hvm_monitor_io(io_qual.port, bytes, io_qual.in, io_qual.str);
         if ( rc < 0 )
-            goto exit_and_crash;
+            goto unexpected_vmexit;
         if ( rc )
             break;
 
@@ -4820,7 +4820,8 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
 
         __vmread(GUEST_PHYSICAL_ADDRESS, &gpa);
         if ( !ept_handle_misconfig(gpa) )
-            goto exit_and_crash;
+            domain_crash(v->domain,
+                         "Unhandled EPT_MISCONFIG, gpa %#"PRIpaddr"\n", gpa);
         break;
     }
 
@@ -4902,14 +4903,9 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
     case EXIT_REASON_INVPCID:
     /* fall through */
     default:
-    exit_and_crash:
+    unexpected_vmexit:
         gprintk(XENLOG_ERR, "Unexpected vmexit: reason %lu\n", exit_reason);
-
-        if ( vmx_get_cpl() )
-            hvm_inject_hw_exception(X86_EXC_UD,
-                                    X86_EVENT_NO_EC);
-        else
-            domain_crash(v->domain);
+        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
         break;
     }
 

base-commit: 117a46287427db2a6f5fe219eb2031d7ca39b603
-- 
2.39.5



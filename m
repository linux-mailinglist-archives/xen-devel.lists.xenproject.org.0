Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A087A952EE4
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 15:16:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778062.1188129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seaKt-0001gh-Cg; Thu, 15 Aug 2024 13:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778062.1188129; Thu, 15 Aug 2024 13:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seaKt-0001cW-6m; Thu, 15 Aug 2024 13:16:15 +0000
Received: by outflank-mailman (input) for mailman id 778062;
 Thu, 15 Aug 2024 13:16:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZnf=PO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1seaKq-0000wd-W5
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 13:16:12 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a0060eb-5b08-11ef-8776-851b0ebba9a2;
 Thu, 15 Aug 2024 15:16:10 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7a81bd549eso88666866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 06:16:10 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383947151sm100868666b.161.2024.08.15.06.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2024 06:16:08 -0700 (PDT)
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
X-Inumbo-ID: 8a0060eb-5b08-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1723727769; x=1724332569; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tKJRp+XTy2g8P71m3miHWyYMM1xvQ876gmk/7YMzdE=;
        b=kkHMg/wKYI7u+77Z9pyvXCQ7Ua1Wvy2sH7QI8MkFuH6GIxe7Pdeb+XEXNlwZ5HqCVw
         4o2z28rep87dIJRiwYFuLfEFm7u9LK2quGxlUdsI02VV4xZjmbC7gU/DeNVgOn52SM/G
         Z4LxKE22qHwsNGQ15K7qT6S1tybfSTbJG+WzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723727769; x=1724332569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tKJRp+XTy2g8P71m3miHWyYMM1xvQ876gmk/7YMzdE=;
        b=mMsE2AWh8ehhvDJrvaDw30EaIIeyflL9Ylo1tFXxFTi7mgOLBTRZtXXecACjg50ur1
         f6tt9jNYOpfu7M7skoA4RY9n0KvWdSnvkdevqf3KqVYvgSj2la3cgsc7mOk0DK88RBZL
         WcKFUyffGEQ1W1fTIinYiTTqp0feFvuLGcWoViyLqZbq2L5ClSt0I/e7nJRGLEYEL+rg
         acQUWpXd02gt9uDC0FA+VwbSk9MUmaXlAZ8fhZqRo8gIV32hMr0OUVge8YR9n3HlWKKT
         KQgyENuOWqTbbLkVzSf5r0Af0plLSmJdQJvTbALsiiduU2WpECzYoN+CwupzS+XtnoPm
         fX4w==
X-Gm-Message-State: AOJu0Yx45pM54tB5Z7cU2VjQbG2ur1/DYWKPqx067gIB6dPL+gbf197J
	L4LsGGsEf4n9mhV3/TUZ7LgzyIA1/SDHF0fyOoOO+8tui2mL0VCJoiLRoduE5hhCfHrLKMlRu28
	r
X-Google-Smtp-Source: AGHT+IFC2pxB3ToqW0cMxLgozW3zl6w8bhllIPKTxNCmtTNehROADP+qNKSEMriajnZOgj0y5Q1qEQ==
X-Received: by 2002:a17:907:f1de:b0:a7a:b43e:86cf with SMTP id a640c23a62f3a-a8366c359cemr467716966b.27.1723727769460;
        Thu, 15 Aug 2024 06:16:09 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 2/3] x86/pv: Fix merging of new status bits into %dr6
Date: Thu, 15 Aug 2024 14:15:59 +0100
Message-Id: <20240815131600.4037415-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240815131600.4037415-1-andrew.cooper3@citrix.com>
References: <20240815131600.4037415-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All #DB exceptions result in an update of %dr6, but this isn't captured in
Xen's handling, and is buggy everywhere.

To begin resolving this issue, add a new pending_dbg field to x86_event
(unioned with cr2 to avoid taking any extra space), and introduce
pv_inject_debug_exn() helpers to replace the current callers using
pv_inject_hw_exception().

Push the adjustment of v->arch.dr6 into pv_inject_event(), and use the new
x86_merge_dr6() rather than the current incorrect logic.

A key property is that pending_dbg is taken with positive polarity to deal
with RTM/BLD sensibly.  Most callers pass in a constant, but callers passing
in a hardware %dr6 value need to XOR the value with X86_DR6_DEFAULT to flip to
positive polarity.

This fixes the behaviour of the breakpoint status bits; specifically that any
left pending are discarded when a new #DB is raised.  In principle it would
fix RTM/BLD too, except PV guests can't turn these capabilities on to start
with.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v2:
 * Rebase (~6y worth)
 * Split PV changes out of joint HVM patch.
---
 xen/arch/x86/include/asm/domain.h      | 12 ++++++++++++
 xen/arch/x86/pv/emul-priv-op.c         |  5 +----
 xen/arch/x86/pv/emulate.c              |  6 ++----
 xen/arch/x86/pv/ro-page-fault.c        |  2 +-
 xen/arch/x86/pv/traps.c                | 16 ++++++++++++----
 xen/arch/x86/traps.c                   |  2 +-
 xen/arch/x86/x86_emulate/x86_emulate.h |  5 ++++-
 7 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index bca3258d69ac..90c959996914 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -731,6 +731,18 @@ static inline void pv_inject_hw_exception(unsigned int vector, int errcode)
     pv_inject_event(&event);
 }
 
+static inline void pv_inject_debug_exn(unsigned int pending_dbg)
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
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index aa11ecadaac0..3be02d85f2fe 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -1366,10 +1366,7 @@ int pv_emulate_privileged_op(struct cpu_user_regs *regs)
             ctxt.bpmatch |= DR_STEP;
 
         if ( ctxt.bpmatch )
-        {
-            curr->arch.dr6 |= ctxt.bpmatch | DR_STATUS_RESERVED_ONE;
-            pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
-        }
+            pv_inject_debug_exn(ctxt.bpmatch);
 
         /* fall through */
     case X86EMUL_RETRY:
diff --git a/xen/arch/x86/pv/emulate.c b/xen/arch/x86/pv/emulate.c
index e7a1c0a2cc4f..aa8af96c30f3 100644
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
index cad28ef928ad..73c9f7578a87 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -390,7 +390,7 @@ int pv_ro_page_fault(unsigned long addr, struct cpu_user_regs *regs)
         /* Fallthrough */
     case X86EMUL_OKAY:
         if ( ctxt.retire.singlestep )
-            pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
+            pv_inject_debug_exn(X86_DR6_BS);
 
         /* Fallthrough */
     case X86EMUL_RETRY:
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 83e84e276233..5a7341abf068 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -12,6 +12,7 @@
 #include <xen/lib.h>
 #include <xen/softirq.h>
 
+#include <asm/debugreg.h>
 #include <asm/pv/trace.h>
 #include <asm/shared.h>
 #include <asm/traps.h>
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
+        curr->arch.dr6 = x86_merge_dr6(curr->domain->arch.cpu_policy,
+                                       curr->arch.dr6, event->pending_dbg);
+        fallthrough;
+    default:
         trace_pv_trap(vector, regs->rip, use_error_code, error_code);
+        break;
+    }
 
     if ( use_error_code )
     {
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 521ed4dd816d..06e4e3e9af90 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -2030,7 +2030,7 @@ void asmlinkage do_debug(struct cpu_user_regs *regs)
         return;
     }
 
-    pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
+    pv_inject_debug_exn(0 /* N/A, already merged */);
 }
 
 void asmlinkage do_entry_CP(struct cpu_user_regs *regs)
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index d92be69d84d9..e8a0e572284c 100644
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
2.39.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5D0780F85
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 17:47:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586416.917664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX1gy-0005v4-FP; Fri, 18 Aug 2023 15:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586416.917664; Fri, 18 Aug 2023 15:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX1gy-0005sU-Cc; Fri, 18 Aug 2023 15:47:16 +0000
Received: by outflank-mailman (input) for mailman id 586416;
 Fri, 18 Aug 2023 15:47:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9btj=ED=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qX1gw-0005WD-Tc
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 15:47:14 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fed8f25-3dde-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 17:47:14 +0200 (CEST)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bd9b4f8e0eso8036285ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Aug 2023 08:47:14 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 x19-20020a170902ea9300b001b8b0ac2258sm1936083plb.174.2023.08.18.08.47.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 08:47:11 -0700 (PDT)
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
X-Inumbo-ID: 7fed8f25-3dde-11ee-877e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692373633; x=1692978433;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djtTkadKsD4CONvDQuXhksDL4gNlsVo29HPt0IPnNF4=;
        b=OJ0/M2acxRmMUy0VRoHu5fSKWHh+FyuWJh10aZeHCfjueL9yxNygxC/kcOOfVehYji
         rDZtOXy0oLCv51mOwtGLsTwt3ribruEKr7jphDTXRaecRbU29AddnDq8jwkEoCy4C75G
         UNd9BxUAxts+MaQKDcZ5kFT9gqORNoPSzQUkrUTXIsIzyzKsO5DUtyJ6JnQS6Tw8/wI6
         YsIZLtNYLu9+F6uk9fO12XQWmMiqqeXriaA9ZY2eio0fI0PboRW+hlKC8ZR6m+hh5Uhi
         /3yeqsG/8rt0RJLIk1RjPa1Z87y00doL1BnYB7aSSWH77Njsm+iNDqwO7bvfxnAFm/4x
         hJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692373633; x=1692978433;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=djtTkadKsD4CONvDQuXhksDL4gNlsVo29HPt0IPnNF4=;
        b=FzEPOR8RQ+3N1J4ELzVwQe8UQuHA4om/uRnCUTKuPjtBjp5TCrJEwo65/Iu29zz6N1
         QGWsj0jW1rx64Ja7Gh0HdEGaLsZW5gwbYNlLbnsxYfx4krnMkFYWWtf7dv+b3Q/sP/Q9
         xuQELvkAz4x8rMWz+S74QNm4RqPo4rozjaGtnPAIt9syu7i1U2ObPv4zZOrg1PlAhWgC
         vIMLK0tKo6qeHwUtXgRcS2Pe+Y+uv1L41KEgCwH4M+3F8NPw892clsQfsqT8ISzqChvr
         Qty00AK5Ti2NIi75lFEBxA/djPJ08JoQJgUMliQsX++2TqkZZdTrqptB3jAQD6j3Wt4h
         vU1w==
X-Gm-Message-State: AOJu0Yy3ZMnzfiFg9ixIyW98eTaTOWG+XuV4KtdlZ3snJwVm61cikC6q
	VaDmBhHHY14SU5XjG3axhMY=
X-Google-Smtp-Source: AGHT+IHqy1TH7bzZekJKUHcP0iJmdUhe/OYKWuwUM06BtmA9yw8Kgbc5hJMHzUiMUdqGAITyzFbYlg==
X-Received: by 2002:a17:903:234f:b0:1bf:1:a4a8 with SMTP id c15-20020a170903234f00b001bf0001a4a8mr3653078plh.25.1692373632717;
        Fri, 18 Aug 2023 08:47:12 -0700 (PDT)
Message-ID: <a677e1cb-3a81-b42c-25c1-ab2b07d8996a@gmail.com>
Date: Sat, 19 Aug 2023 00:47:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: [PATCH 3/6] x86: don't assume #DB is always caused by singlestep if
 EFLAGS.TF is set
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
References: <ca40fdab-fbe4-8679-9f7c-194d54a7ef34@gmail.com>
Content-Language: en-US
In-Reply-To: <ca40fdab-fbe4-8679-9f7c-194d54a7ef34@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Today, when a HVM (or PVH) guest triggers a hardware breakpoint while
EFLAGS.TF is set, Xen incorrectly assumes that this is a single stepping
exception and sets DR_STEP in dr6 in addition to DR_TRAP<n>.

This causes problems with Linux HW breakpoint handler, which ignores
DR_TRAP<n> bits when DR_STEP is set.  This prevents user-mode debuggers
from recognizing hardware breakpoints if EFLAGS.TF is set.

Fix this by not setting DR_STEP in {vmx,svm}_inject_event, unless the
emulator explicitly signals the single-stepping mode via the newly added
"singlestep" boolean field of struct x86_event.

Fixes: 8b831f4189 ("x86: single step after instruction emulation")
Signed-off-by: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
 xen/arch/x86/hvm/emulate.c             |  3 ++-
 xen/arch/x86/hvm/svm/svm.c             |  6 +++---
 xen/arch/x86/hvm/vmx/vmx.c             |  6 +++---
 xen/arch/x86/include/asm/hvm/hvm.h     | 12 ++++++++++++
 xen/arch/x86/mm/shadow/multi.c         |  5 +++--
 xen/arch/x86/x86_emulate/x86_emulate.h |  4 +++-
 6 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 9b6e4c8bc61b..5ad372466e1d 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -26,6 +26,7 @@
 #include <asm/hvm/support.h>
 #include <asm/iocap.h>
 #include <asm/vm_event.h>
+#include <asm/debugreg.h>
 
 struct hvmemul_cache
 {
@@ -2673,7 +2674,7 @@ static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
     }
 
     if ( hvmemul_ctxt->ctxt.retire.singlestep )
-        hvm_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
+        hvm_inject_debug_exception(DR_STEP);
 
     new_intr_shadow = hvmemul_ctxt->intr_shadow;
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index d5e8cb0722ca..f25d6a53f092 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -96,7 +96,7 @@ void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len)
     curr->arch.hvm.svm.vmcb->int_stat.intr_shadow = 0;
 
     if ( regs->eflags & X86_EFLAGS_TF )
-        hvm_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
+        hvm_inject_debug_exception(DR_STEP);
 }
 
 static void cf_check svm_cpu_down(void)
@@ -1328,10 +1328,10 @@ static void cf_check svm_inject_event(const struct x86_event *event)
     switch ( _event.vector | -(_event.type == X86_EVENTTYPE_SW_INTERRUPT) )
     {
     case X86_EXC_DB:
-        if ( regs->eflags & X86_EFLAGS_TF )
+        if ( event->extra )
         {
             __restore_debug_registers(vmcb, curr);
-            vmcb_set_dr6(vmcb, vmcb_get_dr6(vmcb) | DR_STEP);
+            vmcb_set_dr6(vmcb, vmcb_get_dr6(vmcb) | event->extra);
         }
         /* fall through */
     case X86_EXC_BP:
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 8823ca13e55d..1795b9479cf9 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2022,10 +2022,10 @@ static void cf_check vmx_inject_event(const struct x86_event *event)
     switch ( _event.vector | -(_event.type == X86_EVENTTYPE_SW_INTERRUPT) )
     {
     case X86_EXC_DB:
-        if ( guest_cpu_user_regs()->eflags & X86_EFLAGS_TF )
+        if ( event->extra )
         {
             __restore_debug_registers(curr);
-            write_debugreg(6, read_debugreg(6) | DR_STEP);
+            write_debugreg(6, read_debugreg(6) | event->extra);
         }
         if ( !nestedhvm_vcpu_in_guestmode(curr) ||
              !nvmx_intercepts_exception(curr, X86_EXC_DB, _event.error_code) )
@@ -3068,7 +3068,7 @@ void update_guest_eip(void)
     }
 
     if ( regs->eflags & X86_EFLAGS_TF )
-        hvm_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
+        hvm_inject_debug_exception(DR_STEP);
 }
 
 static void cf_check vmx_fpu_dirty_intercept(void)
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index f3f6310ab684..6a0b9e3ff01e 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -538,6 +538,18 @@ static inline void hvm_inject_page_fault(int errcode, unsigned long cr2)
     hvm_inject_event(&event);
 }
 
+static inline void hvm_inject_debug_exception(unsigned long pending_dbg)
+{
+    struct x86_event event = {
+        .vector = X86_EXC_DB,
+        .type = X86_EVENTTYPE_HW_EXCEPTION,
+        .error_code = X86_EVENT_NO_EC,
+        .extra = pending_dbg,
+    };
+
+    hvm_inject_event(&event);
+}
+
 static inline bool hvm_event_pending(const struct vcpu *v)
 {
     return alternative_call(hvm_funcs.event_pending, v);
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index cf74fdf5dda6..365af5169750 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -24,6 +24,7 @@
 #include <asm/hvm/cacheattr.h>
 #include <asm/mtrr.h>
 #include <asm/guest_pt.h>
+#include <asm/debugreg.h>
 #include <public/sched.h>
 #include "private.h"
 #include "types.h"
@@ -2788,7 +2789,7 @@ static int cf_check sh_page_fault(
 #endif
 
     if ( emul_ctxt.ctxt.retire.singlestep )
-        hvm_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
+        hvm_inject_debug_exception(DR_STEP);
 
 #if GUEST_PAGING_LEVELS == 3 /* PAE guest */
     /*
@@ -2829,7 +2830,7 @@ static int cf_check sh_page_fault(
                 TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_EMULATION_LAST_FAILED);
 
                 if ( emul_ctxt.ctxt.retire.singlestep )
-                    hvm_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
+                    hvm_inject_debug_exception(DR_STEP);
 
                 break; /* Don't emulate again if we failed! */
             }
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index bad957f9bcb2..868a64ab20e6 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -78,7 +78,9 @@ struct x86_event {
     uint8_t       type;         /* X86_EVENTTYPE_* */
     uint8_t       insn_len;     /* Instruction length */
     int32_t       error_code;   /* X86_EVENT_NO_EC if n/a */
-    unsigned long extra;        /* CR2 if X86_EXC_PF h/w exception */
+
+    /* Type-specific extra data (%cr2 for #PF, pending_dbg for #DB) */
+    unsigned long extra;
 };
 
 /*
-- 
2.41.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF16D780F84
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 17:47:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586414.917655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX1gs-0005ZM-4g; Fri, 18 Aug 2023 15:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586414.917655; Fri, 18 Aug 2023 15:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX1gs-0005Wj-1s; Fri, 18 Aug 2023 15:47:10 +0000
Received: by outflank-mailman (input) for mailman id 586414;
 Fri, 18 Aug 2023 15:47:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9btj=ED=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qX1gr-00054Q-29
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 15:47:09 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bb83a46-3dde-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 17:47:07 +0200 (CEST)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1bc8a2f71eeso8232065ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Aug 2023 08:47:07 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 n9-20020a170902e54900b001bde65894d5sm1927812plf.109.2023.08.18.08.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 08:47:04 -0700 (PDT)
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
X-Inumbo-ID: 7bb83a46-3dde-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692373626; x=1692978426;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YufZI707Ujs7/EHXRSsM3OL/ONxDf9+knc8Qd0VFQb0=;
        b=ANvSuiNqMBOnMC7iWNij8pcQeyH6Aq0GtjMwfSJfuoHrl20GNw17WE+HCJXD53wHQO
         nDEg73h7OH5WYWVlubU28uDNluBJMc5FXzMZQGiufj0+kXHUvtFGlb3U4m5DsuRA8gvV
         Ax5YN4FUXAIM+o4p8fgIbOzEegzgjWwlfLLuhp5l4Dcx6k0c3awjpNpPqAjcdmXM4diX
         7+uYd+zy23CnK/oy88yVy+cymM/7hY95K6YsZXeFxbnLFw5oHtyPKkaRffonZbvZNBji
         IE84Nphrrk7Nn3zzGEyHK8ummAECI4iP2FjhkB0nb/51u2oje0beB4zebwKgFseLwFu5
         tXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692373626; x=1692978426;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YufZI707Ujs7/EHXRSsM3OL/ONxDf9+knc8Qd0VFQb0=;
        b=PPk8OA5+H+cMM1f1RlrjIQEINl//WURnR1+ah/+0iiZrGfbNTwmSHKRdS3p2rO1pyA
         YIKgfbaEdV0VSTZBnFMbZaVdAUX5A2GJkm8xXRFB78abe2vjfZjOhEQ9cIy36XPfXk6v
         5QBmuKrSoNCeXwyp1iBn7I24Gaz28mV8eV7EDGDz3iysBi5NBqRnAzZQyTROm8etwOL1
         BfdZLu8Zt1Wd/3fUK52dXJQe3CEa6G1C11d4xjA3NSbXc8kYQud7kFyclRUsGtBiYNR1
         IucA29QAlBZdYmRJVC66I/myi9PHNpwEKMTejVyz9dNRsTPnzR3ymgcbogYjK13eSXJw
         Dlxw==
X-Gm-Message-State: AOJu0YxMrScyqKFM8l9zAV16Gv8Zv7NhAPO2fe/RqDUAAQGbf0bNLn0g
	ZNV8KidZNXUgCy/Hhc7D8VI=
X-Google-Smtp-Source: AGHT+IHzLF0b96EvpA38KVA9ROOq938j//LDF2HFOhNJI+AGqrjTGq9l4olg7IfGeLyyFwf8BwheMg==
X-Received: by 2002:a17:902:b7c4:b0:1bf:c59:c944 with SMTP id v4-20020a170902b7c400b001bf0c59c944mr2775991plz.22.1692373625690;
        Fri, 18 Aug 2023 08:47:05 -0700 (PDT)
Message-ID: <0a5b5331-a77a-6dc7-a822-638be6ce598d@gmail.com>
Date: Sat, 19 Aug 2023 00:46:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: [PATCH 2/6] x86emul: rename field 'cr2' of struct x86_event to
 'extra'
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

XEN_DMOP_inject_event() copies the 'cr2' argument to struct x86_event.
'cr2' is overladed to mean pending_dbg for a debug trap, but consumers
of struct x86_event always interpret it as CR2.

Clarify the role of the 'cr2' field by renaming it to 'extra', in
preparation for an upcoming patch that uses it to actually populate dr6.

Signed-off-by: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
 xen/arch/x86/hvm/dm.c                  | 2 +-
 xen/arch/x86/hvm/hvm.c                 | 4 ++--
 xen/arch/x86/hvm/svm/nestedsvm.c       | 2 +-
 xen/arch/x86/hvm/svm/svm.c             | 8 ++++----
 xen/arch/x86/hvm/vmx/vmx.c             | 2 +-
 xen/arch/x86/include/asm/domain.h      | 2 +-
 xen/arch/x86/include/asm/hvm/hvm.h     | 2 +-
 xen/arch/x86/pv/traps.c                | 8 ++++----
 xen/arch/x86/x86_emulate/x86_emulate.h | 4 ++--
 9 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index 462691f91d3c..48a0c09f7af3 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -314,7 +314,7 @@ static int inject_event(struct domain *d,
     v->arch.hvm.inject_event.type = data->type;
     v->arch.hvm.inject_event.insn_len = data->insn_len;
     v->arch.hvm.inject_event.error_code = data->error_code;
-    v->arch.hvm.inject_event.cr2 = data->cr2;
+    v->arch.hvm.inject_event.extra = data->cr2;
     smp_wmb();
     v->arch.hvm.inject_event.vector = data->vector;
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 48a77524f198..1abdec35257b 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -507,7 +507,7 @@ static bool hvm_get_pending_event(struct vcpu *v, struct x86_event *info)
 
     if ( info->type == X86_EVENTTYPE_HW_EXCEPTION &&
          info->vector == X86_EXC_PF )
-        info->cr2 = v->arch.hvm.guest_cr[2];
+        info->extra = v->arch.hvm.guest_cr[2];
 
     return true;
 }
@@ -548,7 +548,7 @@ void hvm_do_resume(struct vcpu *v)
         if ( hvm_get_pending_event(v, &info) )
         {
             hvm_monitor_interrupt(info.vector, info.type, info.error_code,
-                                  info.cr2);
+                                  info.extra);
             v->arch.monitor.next_interrupt_enabled = false;
         }
     }
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index a09b6abaaeaf..9bd2a304ac01 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -842,7 +842,7 @@ int cf_check nsvm_vcpu_vmexit_event(
     ASSERT(vcpu_nestedhvm(v).nv_vvmcx != NULL);
 
     nestedsvm_vmexit_defer(v, VMEXIT_EXCEPTION_DE + event->vector,
-                           event->error_code, event->cr2);
+                           event->error_code, event->extra);
     return NESTEDHVM_VMEXIT_DONE;
 }
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 01dd592d9b83..d5e8cb0722ca 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1252,7 +1252,7 @@ static void svm_emul_swint_injection(struct x86_event *event)
         {
             fault = X86_EXC_PF;
             ec = pfinfo.ec;
-            event->cr2 = pfinfo.linear;
+            event->extra = pfinfo.linear;
         }
 
         goto raise_exception;
@@ -1345,8 +1345,8 @@ static void cf_check svm_inject_event(const struct x86_event *event)
 
     case X86_EXC_PF:
         ASSERT(_event.type == X86_EVENTTYPE_HW_EXCEPTION);
-        curr->arch.hvm.guest_cr[2] = _event.cr2;
-        vmcb_set_cr2(vmcb, _event.cr2);
+        curr->arch.hvm.guest_cr[2] = _event.extra;
+        vmcb_set_cr2(vmcb, _event.extra);
         break;
     }
 
@@ -1430,7 +1430,7 @@ static void cf_check svm_inject_event(const struct x86_event *event)
     if ( _event.vector == X86_EXC_PF &&
          _event.type == X86_EVENTTYPE_HW_EXCEPTION )
         HVMTRACE_LONG_2D(PF_INJECT, _event.error_code,
-                         TRC_PAR_LONG(_event.cr2));
+                         TRC_PAR_LONG(_event.extra));
     else
         HVMTRACE_2D(INJ_EXC, _event.vector, _event.error_code);
 }
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 7ec44018d4ed..8823ca13e55d 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2051,7 +2051,7 @@ static void cf_check vmx_inject_event(const struct x86_event *event)
 
     case X86_EXC_PF:
         ASSERT(_event.type == X86_EVENTTYPE_HW_EXCEPTION);
-        curr->arch.hvm.guest_cr[2] = _event.cr2;
+        curr->arch.hvm.guest_cr[2] = _event.extra;
         break;
     }
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index c2d9fc333be5..0e445cff5c08 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -735,7 +735,7 @@ static inline void pv_inject_page_fault(int errcode, unsigned long cr2)
         .vector = X86_EXC_PF,
         .type = X86_EVENTTYPE_HW_EXCEPTION,
         .error_code = errcode,
-        .cr2 = cr2,
+        .extra = cr2,
     };
 
     pv_inject_event(&event);
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 6d53713fc3a9..f3f6310ab684 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -532,7 +532,7 @@ static inline void hvm_inject_page_fault(int errcode, unsigned long cr2)
         .vector = X86_EXC_PF,
         .type = X86_EVENTTYPE_HW_EXCEPTION,
         .error_code = errcode,
-        .cr2 = cr2,
+        .extra = cr2,
     };
 
     hvm_inject_event(&event);
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 74f333da7e1c..e5c9734b8204 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -53,15 +53,15 @@ void pv_inject_event(const struct x86_event *event)
     if ( event->type == X86_EVENTTYPE_HW_EXCEPTION &&
          vector == X86_EXC_PF )
     {
-        curr->arch.pv.ctrlreg[2] = event->cr2;
-        arch_set_cr2(curr, event->cr2);
+        curr->arch.pv.ctrlreg[2] = event->extra;
+        arch_set_cr2(curr, event->extra);
 
         /* Re-set error_code.user flag appropriately for the guest. */
         error_code &= ~PFEC_user_mode;
         if ( !guest_kernel_mode(curr, regs) )
             error_code |= PFEC_user_mode;
 
-        trace_pv_page_fault(event->cr2, error_code);
+        trace_pv_page_fault(event->extra, error_code);
     }
     else
         trace_pv_trap(vector, regs->rip, use_error_code, error_code);
@@ -82,7 +82,7 @@ void pv_inject_event(const struct x86_event *event)
                 vector, vector_name(vector), error_code);
 
         if ( vector == X86_EXC_PF )
-            show_page_walk(event->cr2);
+            show_page_walk(event->extra);
     }
 }
 
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index 698750267a90..bad957f9bcb2 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -78,7 +78,7 @@ struct x86_event {
     uint8_t       type;         /* X86_EVENTTYPE_* */
     uint8_t       insn_len;     /* Instruction length */
     int32_t       error_code;   /* X86_EVENT_NO_EC if n/a */
-    unsigned long cr2;          /* Only for X86_EXC_PF h/w exception */
+    unsigned long extra;        /* CR2 if X86_EXC_PF h/w exception */
 };
 
 /*
@@ -831,7 +831,7 @@ static inline void x86_emul_pagefault(
     ctxt->event.vector = X86_EXC_PF;
     ctxt->event.type = X86_EVENTTYPE_HW_EXCEPTION;
     ctxt->event.error_code = error_code;
-    ctxt->event.cr2 = cr2;
+    ctxt->event.extra = cr2;
 
     ctxt->event_pending = true;
 }
-- 
2.41.0



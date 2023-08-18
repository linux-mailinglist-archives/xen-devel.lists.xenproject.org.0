Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1303D780F88
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 17:47:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586426.917695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX1hK-0007K1-AU; Fri, 18 Aug 2023 15:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586426.917695; Fri, 18 Aug 2023 15:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX1hK-0007G5-6b; Fri, 18 Aug 2023 15:47:38 +0000
Received: by outflank-mailman (input) for mailman id 586426;
 Fri, 18 Aug 2023 15:47:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9btj=ED=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qX1hJ-0005WD-Ae
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 15:47:37 +0000
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [2607:f8b0:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d49504b-3dde-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 17:47:36 +0200 (CEST)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6887ccba675so895641b3a.3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Aug 2023 08:47:36 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 i23-20020aa787d7000000b0064d47cd116esm1696837pfo.161.2023.08.18.08.47.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 08:47:34 -0700 (PDT)
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
X-Inumbo-ID: 8d49504b-3dde-11ee-877e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692373655; x=1692978455;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muARqwg7J0jXaBR6Kw/+0enh70UHMI8H+VpfrjX65HY=;
        b=GI4X1ZXl15ePzbLTKA3KP6YAaayNEue6osptafFWdlUkZcD0++bgp22YZZRYsR1EV4
         EX5UHl0dqumQ2fgQeX5j38N9KYJzS3l/8OiqopCoZtCJfuTm3gccPSt4N2LyfYnumEM/
         yt0OpGEQHkW2FfRTgyMMfafYaFHsPYy/FFptlbb/nLqYYAREqHE28Qxi7qDS4KH/EG3L
         2CO4durEoJicjPsce8weecxG4pRDYpiKkNCk6OOoN3B8pg5XsOdSymcduzvzAe+Ekxl9
         QNP6cySDtGu86iTvlkrAQY9Hf1DR3LsqvjXkoQHlOhc2OOe3F9HgcVWRsL2SRHDXMGHk
         WsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692373655; x=1692978455;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=muARqwg7J0jXaBR6Kw/+0enh70UHMI8H+VpfrjX65HY=;
        b=EmOUzVb7Kd1o5JiOFh8Q9yV0gBYjev2zuUDNqSD5nUa5F9SSNbDAvyZi5UXEQmshGR
         NQ0fsx/CZ6DdVkXL4vRnS0ExJ1Pt6QEdn8lYvhZy681LCD7GffqUu4FrsAH1VUVOAHmp
         M9yFylH82KidIyO1UdUz5bbifowz+cEEMK4la8ALxFZpLGXowj9RugfHlqnDFawFHtsv
         pBCUeCV/D60xcBK/ElpomoMLTwtLMo/pd4V81I3lQUP3lNJOM9Op8rVhfIfo32eb+Ucp
         dYr8JdLALgy3tWZpXxQnaogPLACOLC3o+NwJKHnwaPGJlZSgYe0/NsPk4ZqzRyhmi1ui
         35aA==
X-Gm-Message-State: AOJu0YxxGjnFYlpjHYjDb21f+0/gOm8/0LN5YqTZIpt8Wt5/rPc5prm8
	KXyApP7kw7cuqA6SIAb1dls=
X-Google-Smtp-Source: AGHT+IFrEcSVZ5bF+25U50HXbWsCwjKMl5JjVl/wXApRgYbnKFmtiSaPsksLQzNm96WXHXvxM0L9RA==
X-Received: by 2002:a05:6a00:1acc:b0:687:5763:ef27 with SMTP id f12-20020a056a001acc00b006875763ef27mr3062865pfv.33.1692373655118;
        Fri, 18 Aug 2023 08:47:35 -0700 (PDT)
Message-ID: <231aa9dc-ca45-491f-26d2-72b4365219a6@gmail.com>
Date: Sat, 19 Aug 2023 00:47:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: [PATCH 6/6] x86/debug: actually plumb pending_dbg through the monitor
 and devicemodel interfaces
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

Commit 21867648033d ("x86/debug: Plumb pending_dbg through the monitor
and devicemodel interfaces") introduced pending_dbg, but did not
actually populate or use the field.

Signed-off-by: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
 xen/arch/x86/hvm/svm/svm.c | 34 +++++++++++++++++++++++++++++++---
 xen/arch/x86/hvm/vmx/vmx.c | 32 ++++++++++++++++++++++++--------
 2 files changed, 55 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index f25d6a53f092..139be9902dae 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2422,6 +2422,14 @@ static bool cf_check svm_get_pending_event(
     info->type = vmcb->event_inj.type;
     info->error_code = vmcb->event_inj.ec;
 
+    if ( info->type == X86_EVENTTYPE_HW_EXCEPTION &&
+         info->vector == X86_EXC_DB )
+    {
+        unsigned long dr6 = v->arch.hvm.flag_dr_dirty ?
+                            vmcb_get_dr6(vmcb) : v->arch.dr6;
+        info->extra = dr6 & ~DR_STATUS_RESERVED_ONE;
+    }
+
     return true;
 }
 
@@ -2733,16 +2741,28 @@ void svm_vmexit_handler(void)
         if ( !v->domain->debugger_attached )
         {
             unsigned int trap_type;
+            unsigned long exit_pending_dbg;
 
             if ( likely(exit_reason != VMEXIT_ICEBP) )
             {
                 trap_type = X86_EVENTTYPE_HW_EXCEPTION;
                 insn_len = 0;
+
+                __restore_debug_registers(vmcb, v);
+
+                /*
+                 * NOTE: This is slightly wrong; old bits in dr6 are not
+                 * automatically cleared by CPU on #DB, so it's not exactly
+                 * equivalent to PENDING_DBG_EXCEPTIONS in semantics.
+                 */
+                exit_pending_dbg = vmcb_get_dr6(vmcb) & ~DR_STATUS_RESERVED_ONE;
+                vmcb_set_dr6(vmcb, DR_STATUS_RESERVED_ONE);
             }
             else
             {
                 trap_type = X86_EVENTTYPE_PRI_SW_EXCEPTION;
                 insn_len = svm_get_insn_len(v, INSTR_ICEBP);
+                exit_pending_dbg = 0;
 
                 if ( !insn_len )
                     break;
@@ -2750,12 +2770,20 @@ void svm_vmexit_handler(void)
 
             rc = hvm_monitor_debug(regs->rip,
                                    HVM_MONITOR_DEBUG_EXCEPTION,
-                                   trap_type, insn_len, 0);
+                                   trap_type, insn_len, exit_pending_dbg);
             if ( rc < 0 )
                 goto unexpected_exit_type;
             if ( !rc )
-                hvm_inject_exception(X86_EXC_DB,
-                                     trap_type, insn_len, X86_EVENT_NO_EC);
+            {
+                if (trap_type == X86_EVENTTYPE_HW_EXCEPTION)
+                {
+                    /* Updates DR6 where debugger can peek. */
+                    hvm_inject_debug_exception(exit_pending_dbg);
+                }
+                else
+                    hvm_inject_exception(X86_EXC_DB,
+                                         trap_type, insn_len, X86_EVENT_NO_EC);
+            }
         }
         else
             domain_pause_for_debugger();
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 1795b9479cf9..63411b62cb94 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2469,6 +2469,14 @@ static bool cf_check vmx_get_pending_event(
     info->type = MASK_EXTR(intr_info, INTR_INFO_INTR_TYPE_MASK);
     info->error_code = error_code;
 
+    if ( info->type == X86_EVENTTYPE_HW_EXCEPTION &&
+         info->vector == X86_EXC_DB )
+    {
+        unsigned long dr6 = v->arch.hvm.flag_dr_dirty ?
+                            read_debugreg(6) : v->arch.dr6;
+        info->extra = dr6 & ~DR_STATUS_RESERVED_ONE;
+    }
+
     return true;
 }
 
@@ -4240,13 +4248,11 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         {
         case X86_EXC_DB:
             /*
-             * Updates DR6 where debugger can peek (See 3B 23.2.1,
-             * Table 23-1, "Exit Qualification for Debug Exceptions").
+             * See 3B 23.2.1, Table 23-1, "Exit Qualification for Debug
+             * Exceptions".
              */
             __vmread(EXIT_QUALIFICATION, &exit_qualification);
             HVMTRACE_1D(TRAP_DEBUG, exit_qualification);
-            __restore_debug_registers(v);
-            write_debugreg(6, exit_qualification | DR_STATUS_RESERVED_ONE);
 
             /*
              * Work around SingleStep + STI/MovSS VMEntry failures.
@@ -4285,22 +4291,32 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
 
             if ( !v->domain->debugger_attached )
             {
-                unsigned long insn_len = 0;
+                unsigned long exit_pending_dbg = 0, insn_len = 0;
                 int rc;
                 unsigned long trap_type = MASK_EXTR(intr_info,
                                                     INTR_INFO_INTR_TYPE_MASK);
 
-                if ( trap_type >= X86_EVENTTYPE_SW_INTERRUPT )
+                if ( trap_type == X86_EVENTTYPE_HW_EXCEPTION )
+                    exit_pending_dbg = exit_qualification;
+                else if ( trap_type >= X86_EVENTTYPE_SW_INTERRUPT )
                     __vmread(VM_EXIT_INSTRUCTION_LEN, &insn_len);
 
                 rc = hvm_monitor_debug(regs->rip,
                                        HVM_MONITOR_DEBUG_EXCEPTION,
-                                       trap_type, insn_len, 0);
+                                       trap_type, insn_len, exit_pending_dbg);
 
                 if ( rc < 0 )
                     goto exit_and_crash;
                 if ( !rc )
-                    vmx_propagate_intr(intr_info);
+                {
+                    if ( trap_type == X86_EVENTTYPE_HW_EXCEPTION )
+                    {
+                        /* Updates DR6 where debugger can peek. */
+                        hvm_inject_debug_exception(exit_pending_dbg);
+                    }
+                    else
+                        vmx_propagate_intr(intr_info);
+                }
             }
             else
                 domain_pause_for_debugger();
-- 
2.41.0



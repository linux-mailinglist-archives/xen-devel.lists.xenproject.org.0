Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AD8780F87
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 17:47:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586420.917685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX1hA-0006cj-1y; Fri, 18 Aug 2023 15:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586420.917685; Fri, 18 Aug 2023 15:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX1h9-0006Zi-UJ; Fri, 18 Aug 2023 15:47:27 +0000
Received: by outflank-mailman (input) for mailman id 586420;
 Fri, 18 Aug 2023 15:47:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9btj=ED=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qX1h8-0005WD-FL
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 15:47:26 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86cf8867-3dde-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 17:47:25 +0200 (CEST)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1bdb7b0c8afso7835985ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Aug 2023 08:47:25 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 s15-20020a170902ea0f00b001bbc8d65de0sm1943507plg.67.2023.08.18.08.47.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 08:47:23 -0700 (PDT)
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
X-Inumbo-ID: 86cf8867-3dde-11ee-877e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692373644; x=1692978444;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UQOAr2es15lGNIQkp28TBH1fdCufuHHrfjqiigg570=;
        b=nJKjzEqTQmvgKRLNwxm5vRYBizrbO2NCA6BcKPVlXia+kIz0VShaLrmTiIe0rpFU3g
         3UeiBahNIgZ15SWSYY1ll2IUZTokVKAK5NTH4pY1V3xeO45QWIKZKz6k0zHRb58jMFO8
         BWyoiM3IzY9ziljVDVP8feuJ4q8+xXNeAPXNTwO27hyZwfDu7RgyJjcJ4E3fjgNU/Chc
         by10w7y4mKNlkeyZkUitaRPmk3mgQ92NpK310yQ7Iv5bLLJEJdExI97Yeu1d+TG/iW/C
         yrvoTZL4uulQrB2KCZI32fuKRwQ3Iqb3dVEncbmOXmYOVeyHH7apKMQIQ1Ew9HV60oIf
         +LFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692373644; x=1692978444;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+UQOAr2es15lGNIQkp28TBH1fdCufuHHrfjqiigg570=;
        b=jaEO4fjCoSnpEsxTvwf+qAH3SwG5RPfimiaa7KuAWI0UVou+r/zcrd73BstXALx5E9
         01zg5YMZzFZV6rufC4MATNzhOH/r71U9D80xKl33oN+Tj/LzKwM9djLIr3LZNJhZnbMG
         MTvBkylfExquqpg403uXS3D3XAfMt9+sZSro5pKOt10g3keABiwMrYmuDh1/iJwNBl0p
         VyWh0Sa9PlJ8DnaQMj2sf3fYNd79siThk+/Kk0HwkmYdKmIX320k5k3EjMtd7Nx8xBit
         QRtKsUvF6YieyXifrGXhYcWqqljMlAC3d5snR4kZcxMxU++JOOei/AjD4qAIcIRzZX9v
         b+cQ==
X-Gm-Message-State: AOJu0YwHNrK0R0uqGqVf19L0lVmVCSt41o7d6pWAoXlWYeTntG004ITz
	H7x//nT2PlN0Qp53Q6tBf38=
X-Google-Smtp-Source: AGHT+IHfVY3KfelMtXzv0+WXeFdg+/KO8mkApg3yj5eWvyPb8Q6pcMAOuzfzXqLpugaz/ClRAD8UJw==
X-Received: by 2002:a17:903:486:b0:1bd:a22a:d40a with SMTP id jj6-20020a170903048600b001bda22ad40amr2493815plb.2.1692373644336;
        Fri, 18 Aug 2023 08:47:24 -0700 (PDT)
Message-ID: <5c1cd2ca-880a-72d4-e586-3d0838adf8eb@gmail.com>
Date: Sat, 19 Aug 2023 00:47:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: [PATCH 5/6] x86/pv: factor out single-step debug trap injection
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

Add pv_inject_debug_exception() helper and use it wherever
applicable.

This helper corresponds to hvm_inject_debug_exception() in HVM.

Signed-off-by: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
 xen/arch/x86/include/asm/domain.h | 12 ++++++++++++
 xen/arch/x86/pv/emulate.c         |  5 +----
 xen/arch/x86/pv/ro-page-fault.c   |  5 +----
 xen/arch/x86/pv/traps.c           | 10 ++++++++++
 4 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 0e445cff5c08..cfeb63da6cd6 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -741,6 +741,18 @@ static inline void pv_inject_page_fault(int errcode, unsigned long cr2)
     pv_inject_event(&event);
 }
 
+static inline void pv_inject_debug_exception(unsigned long pending_dbg)
+{
+    const struct x86_event event = {
+        .vector = X86_EXC_DB,
+        .type = X86_EVENTTYPE_HW_EXCEPTION,
+        .error_code = X86_EVENT_NO_EC,
+        .extra = pending_dbg,
+    };
+
+    pv_inject_event(&event);
+}
+
 static inline void pv_inject_sw_interrupt(unsigned int vector)
 {
     const struct x86_event event = {
diff --git a/xen/arch/x86/pv/emulate.c b/xen/arch/x86/pv/emulate.c
index e7a1c0a2cc4f..865b05337192 100644
--- a/xen/arch/x86/pv/emulate.c
+++ b/xen/arch/x86/pv/emulate.c
@@ -72,10 +72,7 @@ void pv_emul_instruction_done(struct cpu_user_regs *regs, unsigned long rip)
     regs->rip = rip;
     regs->eflags &= ~X86_EFLAGS_RF;
     if ( regs->eflags & X86_EFLAGS_TF )
-    {
-        current->arch.dr6 |= DR_STEP | DR_STATUS_RESERVED_ONE;
-        pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
-    }
+        pv_inject_debug_exception(DR_STEP);
 }
 
 uint64_t pv_get_reg(struct vcpu *v, unsigned int reg)
diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index 238bfbeb4ac4..9c6042cab3b2 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -391,10 +391,7 @@ int pv_ro_page_fault(unsigned long addr, struct cpu_user_regs *regs)
         /* Fallthrough */
     case X86EMUL_OKAY:
         if ( ctxt.retire.singlestep )
-        {
-            current->arch.dr6 |= DR_STEP | DR_STATUS_RESERVED_ONE;
-            pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
-        }
+            pv_inject_debug_exception(DR_STEP);
 
         /* Fallthrough */
     case X86EMUL_RETRY:
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index e5c9734b8204..4cf31558ac2f 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -15,6 +15,7 @@
 #include <asm/pv/trace.h>
 #include <asm/shared.h>
 #include <asm/traps.h>
+#include <asm/debugreg.h>
 #include <irq_vectors.h>
 
 void pv_inject_event(const struct x86_event *event)
@@ -64,7 +65,16 @@ void pv_inject_event(const struct x86_event *event)
         trace_pv_page_fault(event->extra, error_code);
     }
     else
+    {
+        if ( event->type == X86_EVENTTYPE_HW_EXCEPTION &&
+             vector == X86_EXC_DB )
+        {
+            if ( event->extra )
+                curr->arch.dr6 |= event->extra | DR_STATUS_RESERVED_ONE;
+        }
+
         trace_pv_trap(vector, regs->rip, use_error_code, error_code);
+    }
 
     if ( use_error_code )
     {
-- 
2.41.0



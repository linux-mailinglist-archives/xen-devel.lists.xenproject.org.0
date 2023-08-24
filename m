Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BC478744B
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 17:33:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590194.922324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZCL8-0008Mr-9A; Thu, 24 Aug 2023 15:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590194.922324; Thu, 24 Aug 2023 15:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZCL8-0008JK-5m; Thu, 24 Aug 2023 15:33:42 +0000
Received: by outflank-mailman (input) for mailman id 590194;
 Thu, 24 Aug 2023 15:33:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hMLV=EJ=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qZCEJ-0003YM-VV
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 15:26:39 +0000
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [2001:4860:4864:20::29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e525a6d-4292-11ee-8783-cb3800f73035;
 Thu, 24 Aug 2023 17:26:39 +0200 (CEST)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1c4d1274f33so4412027fac.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Aug 2023 08:26:39 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 gl2-20020a17090b120200b0026b3f76a063sm1735715pjb.44.2023.08.24.08.26.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Aug 2023 08:26:37 -0700 (PDT)
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
X-Inumbo-ID: 9e525a6d-4292-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692890798; x=1693495598;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3yasWEsOzbtqamQXtcf1AnAlMMSzY4rI+7mOlE8sio=;
        b=Bt/5mQABq3gqvQG3RRu7NPiWfWDN243Zud6w45o9lcVYDjbTwxFZBJiG18Y2wDko3d
         Mvt1n06s7lSjccbgGoLU8LqxEW15zCtb9Nd6p1dedyu7g5sjTs+oVDIef47P8GKRieEp
         eHWfJI1CSLFiIakSS0shd/lzD/GTlTtwgdInnBWZuOjeNB66ME0QObU4QwOmtyedFLgR
         l7oyiskF76ZqPc8aQAMEBACqh7Zq1f3M18H63v1kq3p0vCLgiGnILiEnVGmcfNfLWMyS
         bOpa2FQC7HYVL4jwDHYL37SJrn2hoDuwIhiIJEBKEOVWgjjGXseq9PSf9+iLRjTtWElF
         FgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692890798; x=1693495598;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3yasWEsOzbtqamQXtcf1AnAlMMSzY4rI+7mOlE8sio=;
        b=Inw3n0MOc2JVMDgnHhe8gcnlNNDbQEGIir5Hw9fuo/LEsGv0iKypyDoSmrqtbf0aBe
         rh95p7aJnBiDT64wzL/+CIpelUcdsVLmxhy+OoHyBfkuMmnbHR6jE3UkU9af3Fo74Cqo
         38zgTdCsr1Qa6hk8CxkmmJw6Wke/9csaF7nPID5n7N3dnn4vHsQl+Dy24VBMWWOzGzpf
         QaPG03+lzjmZCpayKfJFjdbXQp6CXux171Q7dmX+A0nkldGiTHL+RvPEQ21N33pm1bey
         3Y8niSnAa5jbWduCZ5RLAnA0pr69fLwk8zNfiIy+2fqjz7gWxaFRRBamNkkAsMgwRt8P
         7iGA==
X-Gm-Message-State: AOJu0YxsH8YutS6X9gCM/30Yuat9DAAoKVO4NmVYfQ0/k6ZLATEsL6Es
	+7EiwYTIMGFlhyoV4TlkU9k=
X-Google-Smtp-Source: AGHT+IFrkM3/wbFcD/cDrZgMAWrFIqbjiI+5Z8hgmKilG98CbMOCfQ2feVuAqDJiGTuOcvXlRwH3PQ==
X-Received: by 2002:a05:6870:171e:b0:1be:feb0:33fb with SMTP id h30-20020a056870171e00b001befeb033fbmr84033oae.4.1692890797864;
        Thu, 24 Aug 2023 08:26:37 -0700 (PDT)
Message-ID: <d021b32d-51d9-13c4-42a0-2263b29e2aa6@gmail.com>
Date: Fri, 25 Aug 2023 00:26:33 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: [PATCH v2 8/8] x86/dbg: Cleanup of legacy dr6 constants
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
Content-Language: en-US
In-Reply-To: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andrew Cooper <andrew.cooper3@citrix.com>

Replace the few remaining uses with X86_DR6_* constants.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
[ jinoh: Rebase onto staging ]
Signed-off-by: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

v1 -> v2: [S-o-b fixes.]
---
 xen/arch/x86/hvm/vmx/vmx.c          |  2 +-
 xen/arch/x86/include/asm/debugreg.h | 20 --------------------
 xen/arch/x86/pv/emul-priv-op.c      |  2 +-
 xen/arch/x86/traps.c                |  2 +-
 4 files changed, 3 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 377f33d632..814f48ce83 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4290,7 +4290,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
 
                     __vmread(GUEST_PENDING_DBG_EXCEPTIONS, &pending_dbg);
                     __vmwrite(GUEST_PENDING_DBG_EXCEPTIONS,
-                              pending_dbg | DR_STEP);
+                              pending_dbg | X86_DR6_BS);
                 }
             }
 
diff --git a/xen/arch/x86/include/asm/debugreg.h b/xen/arch/x86/include/asm/debugreg.h
index 5fdd25d238..edff379d49 100644
--- a/xen/arch/x86/include/asm/debugreg.h
+++ b/xen/arch/x86/include/asm/debugreg.h
@@ -3,26 +3,6 @@
 
 #include <asm/x86-defns.h>
 
-/* Indicate the register numbers for a number of the specific
-   debug registers.  Registers 0-3 contain the addresses we wish to trap on */
-
-#define DR_FIRSTADDR 0
-#define DR_LASTADDR  3
-#define DR_STATUS    6
-#define DR_CONTROL   7
-
-/* Define a few things for the status register.  We can use this to determine
-   which debugging register was responsible for the trap.  The other bits
-   are either reserved or not of interest to us. */
-
-#define DR_TRAP0        (0x1)           /* db0 */
-#define DR_TRAP1        (0x2)           /* db1 */
-#define DR_TRAP2        (0x4)           /* db2 */
-#define DR_TRAP3        (0x8)           /* db3 */
-#define DR_STEP         (0x4000)        /* single-step */
-#define DR_SWITCH       (0x8000)        /* task switch */
-#define DR_NOT_RTM      (0x10000)       /* clear: #BP inside RTM region */
-
 /* Now define a bunch of things for manipulating the control register.
    The top two bytes of the control register consist of 4 fields of 4
    bits - each field corresponds to one of the four debug registers,
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 72d0514e74..78a1f4aff7 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -1359,7 +1359,7 @@ int pv_emulate_privileged_op(struct cpu_user_regs *regs)
     {
     case X86EMUL_OKAY:
         if ( ctxt.ctxt.retire.singlestep )
-            ctxt.bpmatch |= DR_STEP;
+            ctxt.bpmatch |= X86_DR6_BS;
 
         if ( ctxt.bpmatch &&
              !(curr->arch.pv.trap_bounce.flags & TBF_EXCEPTION) )
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index e2acfbcb9e..ae0a4a1c1e 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1955,7 +1955,7 @@ void do_debug(struct cpu_user_regs *regs)
          * If however we do, safety measures need to be enacted.  Use a big
          * hammer and clear all debug settings.
          */
-        if ( dr6 & (DR_TRAP3 | DR_TRAP2 | DR_TRAP1 | DR_TRAP0) )
+        if ( dr6 & X86_DR6_BP_MASK )
         {
             unsigned int bp, dr7 = read_debugreg(7);
 
-- 
2.41.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85429782DA3
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 17:57:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587669.919054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY7HP-0008Vq-RM; Mon, 21 Aug 2023 15:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587669.919054; Mon, 21 Aug 2023 15:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY7HP-0008Sn-O2; Mon, 21 Aug 2023 15:57:23 +0000
Received: by outflank-mailman (input) for mailman id 587669;
 Mon, 21 Aug 2023 15:57:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0mH9=EG=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qY7HN-0007T4-Tu
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 15:57:21 +0000
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [2607:f8b0:4864:20::1035])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69179f1c-403b-11ee-8782-cb3800f73035;
 Mon, 21 Aug 2023 17:57:21 +0200 (CEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-26b1adbd655so1683174a91.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Aug 2023 08:57:21 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 gk10-20020a17090b118a00b00263f5ac814esm8006442pjb.38.2023.08.21.08.57.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Aug 2023 08:57:19 -0700 (PDT)
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
X-Inumbo-ID: 69179f1c-403b-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692633440; x=1693238240;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3h0/4vMhdc6NEPPkooWDGkHtRbVMqlbYe751/Lp+iP4=;
        b=mWSIgkZCck934AGqU7WG5KHhLW1pQeWfoIFz9a8LxWINvtYpDgE5Q8y2TeurJRSTPY
         raCgRIOVqQwYPS233mfh3hKSeUfKsb8aIZ+3bUA8ih1/kr/Q3Oz9JMh9duY6XGdQmLGM
         NztUs7Z9AnrPMslcb8ZlW2YSYQ+z6na9/jT1k0dmYDjV0zO/oNxrp5y23PjSgBAko2h+
         Zh8xVhnSwfmcuDd1sQ1EA2a87/qfKrrKtBCLosBfVMnHzHlHcipUAQzE304HdX+NoyqI
         mvtRcj2NiAAv+nELIuSAFokQF7y8Bm3BbyuC9edejyKfp15f+sJRcNJZYX2hw2FW0KNq
         nEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692633440; x=1693238240;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3h0/4vMhdc6NEPPkooWDGkHtRbVMqlbYe751/Lp+iP4=;
        b=A8makKs7xIKEzecC2850zwNJ3cpCZO+5+jhebGxa45/3tguk/ItMMz57kVWIxdeq3v
         1Z5r9W/9MLnVdeofjIK9yuLXnUyZhWEDpnhGcXDH0uH56frS28LREs8Rd4kbwd0Av8UP
         iaOeh5JTgW37A7U2yJLYaIyxKwfcLk+zDbjEKgiFvkZ1KwEd5bi/f8hhh9pYDHeK2yD2
         HqcVc1oZJwU80bOK8mDop40mDkF2XH43TKdx5THk7pktKSPC4GXfzSaH4fUj1eS4U/Fe
         gVm2EnRahcnOXwxGLhtWhWTWoUkFwa9m8RDZGZNXBrPb9t4zcW8F8QBFSsq8RtqEOs7g
         A+1g==
X-Gm-Message-State: AOJu0YwSYwHQCZe9MmGB59QrJzLqBZjDNH/sOgDMU7f2O2Ua75nI81wg
	xMj+xuyFelUmyxSAAc8J2YRnhsP/e3QdWg==
X-Google-Smtp-Source: AGHT+IFAEAp8qN0zy425H2mzixp+DP/gF9uDNT86EnfWADBY6jmQA7seN41nIAGrKeijPlLJrWveTw==
X-Received: by 2002:a17:90a:c691:b0:262:ecd9:ed09 with SMTP id n17-20020a17090ac69100b00262ecd9ed09mr4460482pjt.33.1692633440024;
        Mon, 21 Aug 2023 08:57:20 -0700 (PDT)
Message-ID: <f2ba8f0e-db04-8b1f-d349-526fdb7a1ede@gmail.com>
Date: Tue, 22 Aug 2023 00:57:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: [PATCH 5/5] x86/dbg: Cleanup of legacy dr6 constants
To: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5fa229fc-9514-abc6-5e72-2447a2c637d0@gmail.com>
Content-Language: en-US
In-Reply-To: <5fa229fc-9514-abc6-5e72-2447a2c637d0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andrew Cooper <andrew.cooper3@citrix.com>

Replace the few remaining uses with X86_DR6_* constants.

Signed-off-by: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vmx/vmx.c          |  2 +-
 xen/arch/x86/include/asm/debugreg.h | 17 -----------------
 xen/arch/x86/pv/emul-priv-op.c      |  2 +-
 xen/arch/x86/traps.c                |  2 +-
 4 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 1fd902ed74..43b57a444e 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4306,7 +4306,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
 
                     __vmread(GUEST_PENDING_DBG_EXCEPTIONS, &pending_dbg);
                     __vmwrite(GUEST_PENDING_DBG_EXCEPTIONS,
-                              pending_dbg | DR_STEP);
+                              pending_dbg | X86_DR6_BS);
                 }
             }
 
diff --git a/xen/arch/x86/include/asm/debugreg.h b/xen/arch/x86/include/asm/debugreg.h
index fd32846397..1061fdaaae 100644
--- a/xen/arch/x86/include/asm/debugreg.h
+++ b/xen/arch/x86/include/asm/debugreg.h
@@ -1,15 +1,6 @@
 #ifndef _X86_DEBUGREG_H
 #define _X86_DEBUGREG_H
 
-
-/* Indicate the register numbers for a number of the specific
-   debug registers.  Registers 0-3 contain the addresses we wish to trap on */
-
-#define DR_FIRSTADDR 0
-#define DR_LASTADDR  3
-#define DR_STATUS    6
-#define DR_CONTROL   7
-
 /*
  * DR6 status bits.
  *   N.B. For backwards compatibility, X86_DR6_RTM has inverted polarity.
@@ -31,14 +22,6 @@
 
 #define X86_DR6_DEFAULT         0xffff0ff0  /* Default %dr6 value. */
 
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
index 640b60e0e5..829741ff78 100644
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



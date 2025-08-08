Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0E4B1F15C
	for <lists+xen-devel@lfdr.de>; Sat,  9 Aug 2025 01:50:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075335.1437734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukWq0-0006SK-WC; Fri, 08 Aug 2025 23:49:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075335.1437734; Fri, 08 Aug 2025 23:49:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukWq0-0006Qt-TO; Fri, 08 Aug 2025 23:49:28 +0000
Received: by outflank-mailman (input) for mailman id 1075335;
 Fri, 08 Aug 2025 23:49:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukWpy-0006Qn-Oh
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 23:49:26 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fa78546-74b2-11f0-a324-13f23c93f187;
 Sat, 09 Aug 2025 01:49:24 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b79bd3b1f7so1302703f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 16:49:24 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3b95desm31287588f8f.20.2025.08.08.16.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 16:49:22 -0700 (PDT)
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
X-Inumbo-ID: 4fa78546-74b2-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754696963; x=1755301763; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QLw1MS9Yw991F1kr3BalCx2KYqxD20VN1RIVcE4BH8=;
        b=Rt9s+pHBBBKNEBBR20uTulcChOhnQyxEHwq0SJ/WpdKxUQNKZu/I3/jndNzCVHJHXp
         cYh6eNMJZPC6s7KUqdyvcWPpXcQq0VJ7T34MEtg28yxzhFg/2vXI6ZuggvxF65HplhVK
         8hLoHbASS1ZO6pUl0Oa/Os47oQpMeK1Yqhs+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754696963; x=1755301763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/QLw1MS9Yw991F1kr3BalCx2KYqxD20VN1RIVcE4BH8=;
        b=fmXnBn2sSU/DpcjEtAIfX27TP6t1Sck1E/d4kDGdedPxnzm/JZ7bMfY/WvhDZIRMdo
         GIBMMxfu3XfFLMMdSXedssYU2uE6RFGFNgdItkoit0EYGFZvz14p6WRAUtWgjhPs5Pm3
         ty8A9X7dF74MV8qDxdu9z9HYbSj2ZBYEj0qUKrVhQkXFrvT8C9mranEbDc7wb3yrW9gH
         Nbix6R5NrbVH6DLki5lZ4jwYk40NPqICahJRMDVtuOz7wj4ZAxDJ1NIYVbeGvSSbiMsw
         VFAYTcsiQQYPC65+DV84HHARN/SqoSLWMy1t7FZFWgeqCuEAh8S0hqcSG1525phFTdtw
         PzIg==
X-Gm-Message-State: AOJu0YxaiSiIGKK4rx//YtEVvFj8/gX1+uW3t5/rLJMFXwcfF4ER+m/3
	phe3i/JzjKJohcJmZOTj8lcCUHMqhrewtiuInFpD4XfwwkNM8bOIdKjl5hMHqYjiwjV+Kd+qNTK
	3UmN40v4=
X-Gm-Gg: ASbGnctaLpHwepFADZ5OnkP+L+EzU2DvqcufuehDJgRjJleRHRTLMlD/ex/Etxx7Vsp
	5uqpfG3rQF7jcMZPTidGmxIFZQn+R7sNFeiuJ44ZM7btk5BjNI3y874DKNLM9qINHq2gxmlFsHV
	IhshGbE3Shhm36cjWnREU7oh+muGTQs+w2ZIxFR62WnD4EJkMGr3t4h4FoUa7TehnF/fMD3t0mI
	ciPssKTtUjzd9+eah2paxdxUJFR+9C23iClt7hABTSDkcZ5c6h6yK6YL9j6t6WvKyhzhID4AvgS
	VbcbeelO/nqLNCYV54/l0uWUlVvWZKKQDaYexNu9Hrg3IWHL3ubOAiEx4CJYKX01O1AlTh3+zTT
	lHF8ys0FxBjPTUjOiRbLxtLn6YYfg0ntnileCGH1lM0WqFr0HEbJCnyTPjGjcXj5sUg5J7D1e/6
	TO
X-Google-Smtp-Source: AGHT+IF/7kyzaFIg1l+Xvl2Bk/rf229iF8VlwI/rAIRYEKzqF9JkfLPQphoOBPo0Rh1qmBoZRw/I8Q==
X-Received: by 2002:a5d:5846:0:b0:3a4:dc2a:924e with SMTP id ffacd0b85a97d-3b90093e6famr3713949f8f.6.1754696963506;
        Fri, 08 Aug 2025 16:49:23 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 23/22] x86/vmx: Adjust NMI handling for FRED
Date: Sat,  9 Aug 2025 00:49:20 +0100
Message-Id: <20250808234920.1214924-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Handling NMIs in VT-x is awkward.  It turns out that using INT $2 happens to
be correct for IDT delivery, and can be made to be correct under FRED too.

Xen can now boot in FRED mode and run PVH dom0 even with the watchdog enabled.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vmx/vmx.c | 14 ++++++++++++--
 xen/arch/x86/traps.c       | 16 +++++++++++++++-
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index cb82d52ef035..577a5e2d59c6 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4209,8 +4209,18 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
              ((intr_info & INTR_INFO_INTR_TYPE_MASK) ==
               MASK_INSR(X86_ET_NMI, INTR_INFO_INTR_TYPE_MASK)) )
         {
-            do_nmi(regs);
-            enable_nmis();
+            /*
+             * If we exited because of an NMI, NMIs are blocked in hardware,
+             * but software is expected to invoke the handler.
+             *
+             * Use INT $2.  Combined with the current state, it is the correct
+             * architectural state for the NMI handler, and the IRET on the
+             * way back out will unblock NMIs.
+             *
+             * In FRED mode, we can spot this trick and cause the ERETS to
+             * unblock NMIs too.
+             */
+            asm ("int $2");
         }
         break;
     case EXIT_REASON_MCE_DURING_VMENTRY:
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index f58e6dcf13b7..16dd335cadb2 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -2285,8 +2285,22 @@ void asmlinkage entry_from_xen(struct cpu_user_regs *regs)
         do_nmi(regs);
         break;
 
-    case X86_ET_HW_EXC:
     case X86_ET_SW_INT:
+        if ( regs->fred_ss.vector == 2 )
+        {
+            /*
+             * Explicit request from the the VMExit handler.  Rewrite the FRED
+             * frame to look like it was a real NMI, and go around again.
+             */
+            regs->fred_ss.swint = false;
+            regs->fred_ss.nmi = true;
+            regs->fred_ss.type = X86_ET_NMI;
+            regs->fred_ss.insnlen = 0;
+
+            return entry_from_xen(regs);
+        }
+        fallthrough;
+    case X86_ET_HW_EXC:
     case X86_ET_PRIV_SW_EXC:
     case X86_ET_SW_EXC:
         switch ( regs->fred_ss.vector )
-- 
2.39.5



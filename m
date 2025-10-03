Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52623BB85AF
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 00:54:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136899.1473404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4oey-0007K3-LM; Fri, 03 Oct 2025 22:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136899.1473404; Fri, 03 Oct 2025 22:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4oey-0007DL-EM; Fri, 03 Oct 2025 22:53:56 +0000
Received: by outflank-mailman (input) for mailman id 1136899;
 Fri, 03 Oct 2025 22:53:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WVFT=4M=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4oex-0004mK-8j
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 22:53:55 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5ca6ebc-a0ab-11f0-9809-7dc792cee155;
 Sat, 04 Oct 2025 00:53:53 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3ece0e4c5faso2105650f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 15:53:53 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6bbesm9616571f8f.12.2025.10.03.15.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 15:53:52 -0700 (PDT)
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
X-Inumbo-ID: d5ca6ebc-a0ab-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759532033; x=1760136833; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rsyv3/4unrxbc8sHsEgG2iBwBu0kpsuEgiqdDx6AJzc=;
        b=EkfUfAZNQ78Fd9GI7O90cVNNnNV7w0Xz3nQmlA6oTD3aQGrKSmn1oNxONsNC/TylrO
         0rFcKB0HE0UdeYaVQ5czicXyvzqgBh80ayifyGRSImca23syEpFMdnefh6fiOgiIPz/8
         ShGNGUctVGHFow66ZP11PJJPAIT5hp0JPWWGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759532033; x=1760136833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rsyv3/4unrxbc8sHsEgG2iBwBu0kpsuEgiqdDx6AJzc=;
        b=iOGLdu6XnKB7H+DArfgtkGD+dMbugom26ovX2kRQu0l+CI9tC5dpDNHBvxmdyUkxS7
         sUmUCA19D2KRhOgFi4wtX8uf154hYPowvcZyNQLpFr19Y8EfxV3RS18IRLl7LHjakbP7
         j1/e/wpMI9h4VSWZcEtbMSCO9ucfqDSh+5IQA30AeIdjmlSciISKrY3hWeR74j8bplLb
         ZtIH2xLByaNCkZUweF2Cx+6QignIwunD467nYAv9bBBaXIgcX8X6EyuYl7obMevALxk7
         TbnMU7twQSaskQZ3POzqyhcCsRyAWslGaW0dBRs7qmHDPzppoEiOB3IZ2F7pOKVowDac
         mKzA==
X-Gm-Message-State: AOJu0Yz13tYufoW02BF4OnV7sXyXPDupyaTvDZOvOs+NXtgf3d47Sn1p
	jd+b5wIFvKsG6KZMSX3iByDSuzL2HndPYnXwmOMEh0r5I/N6gTYS55uboz2bqOY5lLdY54biZe1
	3/Osc3lI9EQ==
X-Gm-Gg: ASbGnctTI894TLEFJMma1e5ObMmDp8D8JiWKmQsS5SeQIf+eso4iu8oaRWp0LvjE27n
	+FHZ3T0dzq05upuLnY7Hf5X9bcBvGQXwDjQoefmzhRv/9uSUXSMBB555wrmhDDUP1LqGyy9vd8P
	nNtgnXKehESQWJjX+WszFDHm1yo95MREd0womiUyQpHV99sw5SyjbkdsI7eL8l4EayPKlGWEeaw
	Gg05XGC0fPaXWClp+k/H90mDaEKxyC9y47Wd0FVOYEbj9awQevJSqtX4YfkiRWxaYOt+zvSREIO
	Wfq/xsmWrBRjMozdUgAUfE7mxlJ17kypDBmGxRV34LP27EiIu7uIcKrNfZSPTem08X2SZ2kyOQz
	F3R/q1+1v1OS37FaBUS9tBU7plf+455WrfaxQiOnq2dtT7cdTovDqIysC99R6XmVNPfOfpAAnus
	wRtRQBIduxfB+/0Qrkk4MA
X-Google-Smtp-Source: AGHT+IFvkhniiJ9rxsEE2yAcXOAtoH4okjipJNVJVXijQTjiM/jBeJ/8ns7VaCTWv46AXmbPQLwwRg==
X-Received: by 2002:a05:6000:43c6:10b0:415:7c56:30d9 with SMTP id ffacd0b85a97d-4256714d65dmr2765837f8f.23.1759532032710;
        Fri, 03 Oct 2025 15:53:52 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 10/22] x86/traps: Make an IDT-specific #PF helper
Date: Fri,  3 Oct 2025 23:53:22 +0100
Message-Id: <20251003225334.2123667-11-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

FRED provides %cr2 in the the stack frame, avoiding the need to read %cr2
manually.

Rename do_page_fault() to handle_PF(), and update it to take cr2, still named
addr for consistency.

Introduce a new handle_PF_IDT() which reads %cr2 and conditionally re-enables
interrupts.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * New
---
 xen/arch/x86/traps.c        | 26 ++++++++++++++------------
 xen/arch/x86/x86_64/entry.S |  2 +-
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 3fd0f5709a52..d42973660db0 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1670,21 +1670,10 @@ static int fixup_page_fault(unsigned long addr, struct cpu_user_regs *regs)
     return 0;
 }
 
-void asmlinkage do_page_fault(struct cpu_user_regs *regs)
+static void handle_PF(struct cpu_user_regs *regs, unsigned long addr /* cr2 */)
 {
-    unsigned long addr;
     unsigned int error_code;
 
-    addr = read_cr2();
-
-    /*
-     * Don't re-enable interrupts if we were running an IRQ-off region when
-     * we hit the page fault, or we'll break that code.
-     */
-    ASSERT(!local_irq_is_enabled());
-    if ( regs->flags & X86_EFLAGS_IF )
-        local_irq_enable();
-
     /* fixup_page_fault() might change regs->error_code, so cache it here. */
     error_code = regs->error_code;
 
@@ -1745,6 +1734,19 @@ void asmlinkage do_page_fault(struct cpu_user_regs *regs)
     pv_inject_page_fault(regs->error_code, addr);
 }
 
+/*
+ * When using IDT delivery, it is our responsibility to read %cr2.
+ */
+void asmlinkage handle_PF_IDT(struct cpu_user_regs *regs)
+{
+    unsigned long addr = read_cr2();
+
+    if ( regs->flags & X86_EFLAGS_IF )
+        local_irq_enable();
+
+    handle_PF(regs, addr);
+}
+
 /*
  * Early #PF handler to print CR2, error code, and stack.
  *
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 789687488c5f..c02245ac064c 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -871,7 +871,7 @@ handle_exception_saved:
          * reading %cr2. Otherwise a page fault in the nested interrupt handler
          * would corrupt %cr2.
          */
-        DISPATCH(X86_EXC_PF, do_page_fault)
+        DISPATCH(X86_EXC_PF, handle_PF_IDT)
 
         /* Only re-enable IRQs if they were active before taking the fault */
         testb $X86_EFLAGS_IF >> 8, UREGS_eflags + 1(%rsp)
-- 
2.39.5



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5C9B3A39E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:10:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099146.1453057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureH2-00069B-OZ; Thu, 28 Aug 2025 15:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099146.1453057; Thu, 28 Aug 2025 15:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureH2-00067i-KZ; Thu, 28 Aug 2025 15:10:48 +0000
Received: by outflank-mailman (input) for mailman id 1099146;
 Thu, 28 Aug 2025 15:10:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ureCU-00035A-Ad
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:06:06 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8499c332-8420-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 17:06:04 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45b79ec2fbeso6064855e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:06:04 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm78394535e9.5.2025.08.28.08.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 08:06:03 -0700 (PDT)
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
X-Inumbo-ID: 8499c332-8420-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756393564; x=1756998364; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oinKrjQdYUcRvt6fT6/XeocW4MeJM2zndzH0mNM5NI=;
        b=SijzbCZrMnvrVgsYqe9mXQ1UfCvjKvbGt5ZPg2MQAMY15LnViXWVbfbO3WKjHbCr0O
         7YHLV+2iVbPINjwr0ARPYa7B/O7/XXtevJjpnAj3oO8O/bnwZL1tc+toeeovd2tVCqsS
         6K/FdDp4aYmuBWiUkkcGGIkpWaOv6ksrhPJM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393564; x=1756998364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3oinKrjQdYUcRvt6fT6/XeocW4MeJM2zndzH0mNM5NI=;
        b=UNbhEccSbl/bBdffzOtmaLA8pvlNk4uG6EXDHTc4PTRHdXGVIs6pAz9KI3+9CVDS7D
         jQrZzwcvuTplwj+I2g+Pv6knL5RMLQT14x1fq+OA8AwOKL0BqBjl8lsAirT3F0cEwV3r
         QrNHshyI8WHvzdaiqF1yFYgYXSQHT5AeAvV3e6toYWNKdXZqFPdrv5PoDTZpbR5ceqIJ
         dxA8voMFQwQcnBVUs6X1ANj1spO+9n49xqH6xQf3hT1N8jL6dGwWixHBjOGYgAMKGA1+
         69dNHnM394scRBMPi0fKTibAKaf/OmujVMEESqz1WwYBacq/Kb1rACEhYVGI8xpbFb2L
         GE0g==
X-Gm-Message-State: AOJu0Yxd41n5BGrnvy/cqV4+zPSetnv1ez79EOxt3EDD8VQm+LoxDUwS
	VJ7mQ9SjVun/gILxk1ihyxrxpCG+0UHu/mDErHVGBL/7TvtQXd+MvgGjZeHXpi9p6egQchCPOvp
	SI9KH
X-Gm-Gg: ASbGnctrEti9qvDgMEgpsrz+ZJT+OOQdtXBtLnYuCqFjxC7b4GT9JNSvYYY2AY5S4dL
	dFPyG4ht1JN3ekxHf9pelEc+W0+Y3ZpIvLDhUqpwrv0uRVke+vXoYcs2wkOlES0rCNBarefLuyM
	4NG5QOsHUpGWRTQUGBQoxMs8Lznyvpv4MVygHUwIRXL5uKW00VJ9FTugXKF+IaDu10Zvl6kYLTI
	13d2zcubB4ysufzZDLVHSwx5+oXxgWIRmGdkMaxRmRM2inPUw/nS4XoBbRQYe5/je17OTp6cuom
	+fyn6kX2kU/RxeGbQrCGB6GNck/W2HEuSRQAWweQtuEXL7nYfoPigS8Yt7hDBsSp4+DHbP9NCd3
	A+oJoB+5lvI3KDdDdwJpkoU8eK+C+1oFyn4LMd0GOWAFR6Dopnw686oxp3A7jU4+AszbKbZUSye
	iv
X-Google-Smtp-Source: AGHT+IHDTEoKNAOXhRhKSKxrjU5qG48yI9E+MjaVBQpEEcJGPR4F8Ob0cGzg1BSxM3ny2Nv/ouqDyA==
X-Received: by 2002:a05:600c:c48f:b0:459:dfa8:b854 with SMTP id 5b1f17b1804b1-45b5fbee605mr132566925e9.5.1756393563755;
        Thu, 28 Aug 2025 08:06:03 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 11/23] x86/traps: Make an IDT-specific #PF helper
Date: Thu, 28 Aug 2025 16:03:57 +0100
Message-Id: <20250828150409.901315-12-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828150409.901315-1-andrew.cooper3@citrix.com>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
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
index 0372f1c386a8..c11d72d47027 100644
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 080B06A1B71
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 12:35:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500949.772528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVWM6-0007ch-0p; Fri, 24 Feb 2023 11:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500949.772528; Fri, 24 Feb 2023 11:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVWM5-0007Wd-TR; Fri, 24 Feb 2023 11:35:13 +0000
Received: by outflank-mailman (input) for mailman id 500949;
 Fri, 24 Feb 2023 11:35:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdiI=6U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVWM4-0007Ri-Gr
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 11:35:12 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ca96701-b437-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 12:35:12 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id h9so13753925ljq.2
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 03:35:12 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.108.92.nat.umts.dynamic.t-mobile.pl. [46.204.108.92])
 by smtp.gmail.com with ESMTPSA id
 a25-20020a05651c031900b00295a8d1ecc7sm50489ljp.18.2023.02.24.03.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 03:35:11 -0800 (PST)
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
X-Inumbo-ID: 4ca96701-b437-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEV0XXkwftLh/YYhu2PWBtw6xma6pefn5J7iR2uA1b8=;
        b=L3mCGaEwgUnEZk8uJDMAAGvHR0buasQ8IhDhO15TIhAmXamcOJV1NS2r9Zk6dO4XT2
         Oq4KS5euJxgy/5Tx4G0ojC4iNMUWGbsczmHfURnPCFpt5HoNV4FQGf8tVtqsphK2Tgvd
         SmrCr3pkR+SgHdSDq8GzYEKqiKMhs7/Fm80v56SdOpxB02rGtbYkHeqcW29yOBZAxbam
         k5I+G3/3n7KEgtLDeKTwCPQv+URHCgzU//eqbbfyH/oztfsiz12ONrftYxpR7urg/wSC
         eaT3+GejRSw7IBaSaOhELaiF9rL1mxTqC8dVpb+ok0GtYXT7klBA1NTEpnRBi7My/70u
         l1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEV0XXkwftLh/YYhu2PWBtw6xma6pefn5J7iR2uA1b8=;
        b=a1oDHuTjNaD3tXi+hgPhL1j0HpZFtPekojYA/G2/+SyS9MkpEQKdJ9l680sCRayGcf
         Az78IZY334bCeCM6zz4wtzPEaflniZfGwYHOGvAywfM8HC/5h1dohC5y1agqXv/nb7ov
         DHSNhz/7D9PGYRLckr+j1ZfSOHlDCKgXClIylqfJ6hpn8pPr/eHHWwBz0qus4C53X3fH
         MXTaXx45/UzahPXYtZfx+Jn2L0btm56f0ZrW2Jg5xXDxR86B7h76/whetCsDKYuJrowD
         OjhUW13sNS9+sbo9wmmg2Is2OqZ+A5uCHuGlqqczwWe8xPbLpoN6YYASetiubE3KRyfH
         JMKw==
X-Gm-Message-State: AO0yUKWmODUfkcYxoGmJrSniJogHnflkLV3pkUqMglhfAum+czxTFJTJ
	7JF1dgOpcBPy99z5LGpM3EyBRiCXBdE=
X-Google-Smtp-Source: AK7set+4UsiLENwc9Yu3xAUF6hHU3jFibegHt+1QqE3NwHASdq0D9Wrbl2xtm0BO70wAZ2lAdhQRvw==
X-Received: by 2002:a05:651c:a0e:b0:293:4cfe:ad31 with SMTP id k14-20020a05651c0a0e00b002934cfead31mr9704967ljq.14.1677238511687;
        Fri, 24 Feb 2023 03:35:11 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v4 1/5] xen/riscv: introduce decode_cause() stuff
Date: Fri, 24 Feb 2023 13:35:01 +0200
Message-Id: <397e6741438a8b125dc53945a74a58246fac4faf.1677237653.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1677237653.git.oleksii.kurochko@gmail.com>
References: <cover.1677237653.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces stuff needed to decode a reason of an
exception.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
  - fix string in decode_reserved_interrupt_cause()
---
Changes in V3:
  - Nothing changed
---
Changes in V2:
  - Make decode_trap_cause() more optimization friendly.
  - Merge the pathc which introduces do_unexpected_trap() to the current one.
---
 xen/arch/riscv/traps.c | 87 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 86 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index ccd3593f5a..29b1a0dfae 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -4,10 +4,95 @@
  *
  * RISC-V Trap handlers
  */
+
+#include <xen/errno.h>
+#include <xen/lib.h>
+
+#include <asm/csr.h>
+#include <asm/early_printk.h>
 #include <asm/processor.h>
 #include <asm/traps.h>
 
-void do_trap(struct cpu_user_regs *cpu_regs)
+static const char *decode_trap_cause(unsigned long cause)
+{
+    static const char *const trap_causes[] = {
+        [CAUSE_MISALIGNED_FETCH] = "Instruction Address Misaligned",
+        [CAUSE_FETCH_ACCESS] = "Instruction Access Fault",
+        [CAUSE_ILLEGAL_INSTRUCTION] = "Illegal Instruction",
+        [CAUSE_BREAKPOINT] = "Breakpoint",
+        [CAUSE_MISALIGNED_LOAD] = "Load Address Misaligned",
+        [CAUSE_LOAD_ACCESS] = "Load Access Fault",
+        [CAUSE_MISALIGNED_STORE] = "Store/AMO Address Misaligned",
+        [CAUSE_STORE_ACCESS] = "Store/AMO Access Fault",
+        [CAUSE_USER_ECALL] = "Environment Call from U-Mode",
+        [CAUSE_SUPERVISOR_ECALL] = "Environment Call from S-Mode",
+        [CAUSE_MACHINE_ECALL] = "Environment Call from M-Mode",
+        [CAUSE_FETCH_PAGE_FAULT] = "Instruction Page Fault",
+        [CAUSE_LOAD_PAGE_FAULT] = "Load Page Fault",
+        [CAUSE_STORE_PAGE_FAULT] = "Store/AMO Page Fault",
+        [CAUSE_FETCH_GUEST_PAGE_FAULT] = "Instruction Guest Page Fault",
+        [CAUSE_LOAD_GUEST_PAGE_FAULT] = "Load Guest Page Fault",
+        [CAUSE_VIRTUAL_INST_FAULT] = "Virtualized Instruction Fault",
+        [CAUSE_STORE_GUEST_PAGE_FAULT] = "Guest Store/AMO Page Fault",
+    };
+
+    if ( cause < ARRAY_SIZE(trap_causes) && trap_causes[cause] )
+        return trap_causes[cause];
+    return "UNKNOWN";
+}
+
+const char *decode_reserved_interrupt_cause(unsigned long irq_cause)
+{
+    switch ( irq_cause )
+    {
+    case IRQ_M_SOFT:
+        return "M-mode Software Interrupt";
+    case IRQ_M_TIMER:
+        return "M-mode TIMER Interrupt";
+    case IRQ_M_EXT:
+        return "M-mode External Interrupt";
+    default:
+        return "UNKNOWN IRQ type";
+    }
+}
+
+const char *decode_interrupt_cause(unsigned long cause)
+{
+    unsigned long irq_cause = cause & ~CAUSE_IRQ_FLAG;
+
+    switch ( irq_cause )
+    {
+    case IRQ_S_SOFT:
+        return "Supervisor Software Interrupt";
+    case IRQ_S_TIMER:
+        return "Supervisor Timer Interrupt";
+    case IRQ_S_EXT:
+        return "Supervisor External Interrupt";
+    default:
+        return decode_reserved_interrupt_cause(irq_cause);
+    }
+}
+
+const char *decode_cause(unsigned long cause)
+{
+    if ( cause & CAUSE_IRQ_FLAG )
+        return decode_interrupt_cause(cause);
+
+    return decode_trap_cause(cause);
+}
+
+static void do_unexpected_trap(const struct cpu_user_regs *regs)
 {
+    unsigned long cause = csr_read(CSR_SCAUSE);
+
+    early_printk("Unhandled exception: ");
+    early_printk(decode_cause(cause));
+    early_printk("\n");
+
     die();
 }
+
+void do_trap(struct cpu_user_regs *cpu_regs)
+{
+    do_unexpected_trap(cpu_regs);
+}
-- 
2.39.0



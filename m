Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E62CD6BD284
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 15:40:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510651.788748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcola-0007Nu-Gp; Thu, 16 Mar 2023 14:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510651.788748; Thu, 16 Mar 2023 14:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcola-0007JL-Ay; Thu, 16 Mar 2023 14:39:42 +0000
Received: by outflank-mailman (input) for mailman id 510651;
 Thu, 16 Mar 2023 14:39:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NB6E=7I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcolY-0006WA-H7
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 14:39:40 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61e69eac-c408-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 15:39:39 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id cy23so8471774edb.12
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 07:39:40 -0700 (PDT)
Received: from fedora.. (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 q16-20020a1709060e5000b008b980c3e013sm3970187eji.179.2023.03.16.07.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 07:39:39 -0700 (PDT)
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
X-Inumbo-ID: 61e69eac-c408-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678977579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwhZUEDbU03FgtZvxsT8dmiRdPOC/MCr+LKArTSUuK0=;
        b=LfCilxI99YjO1HEPhb9/5Iip+mUoAlN/FaC4RdMQLB1L7MweN8Y0FYUIgEuTj8lQ9D
         A7LZThJfxU43bPO/EFOOzPXyNC8DpsiB/qIoGH4KmUy5PZE2aHZqyyVCM0suNpEscGq6
         XYH1trmXu66/0Zh/dyZJYOUoZ/qEdbYpC/SmNY9yXp2Kj50K2gBSVXmYCFKI9++cOeCA
         oC+P6xoC/lFSoms266G4CvwNac21sXBfuEn2nyLnhy7ZzCJFt6acWBd87iqteL2ew+e7
         dnALpvuSIiKmciecZrGsLb39wf8eZi5aAR7lDUfrmUV+b+DrZ8MTrzh7fRDoHKsjHzkz
         ApgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678977579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwhZUEDbU03FgtZvxsT8dmiRdPOC/MCr+LKArTSUuK0=;
        b=3TPWYrcyNRa4g0nME061OxNhAloKw3ZZ3zf75knKrEELncxhXRsl+rHS4omE1loqkn
         hOrAa0u6l6z2YzpG9UsGqipyxLKrWTuDZTQ3GLYeIf5epDDnmeOTRw6gbAzJscSmfxOy
         GJXa4vauTh+54rwmIrL0SXvKJa+jwubZVFI+iMvsbGr6845Zxl2V5+cPY7Fri9XbqR3f
         T3/a1H5VCm8Ql6bZy8kOSeBY8sqihMH5qXLk2P7jNpaWTr8yYp3nSZ+huAnsl/3qU0fH
         9sYnP4/40fYfBg5oWOJCljUDcDeLTog0ERCcrJAdpfR+DwR/MlcuB28Kkl1rCsCS7oOK
         xp1A==
X-Gm-Message-State: AO0yUKVr/JqygDLbHDaKCsdwtkwrf/B6NMcPUuZmJiA3Ut7/PoB98vWD
	ZTswymlpZoGpbXuWu/X9ZawoDGzVQJ5fgA==
X-Google-Smtp-Source: AK7set+Vrw/c5buXIsbsEI62JvWFHhRvEkwkzgagKamP974RO2D+8gf004qYvaTQBzeTEN/ggAfbsw==
X-Received: by 2002:a17:907:dab:b0:92f:b290:78c with SMTP id go43-20020a1709070dab00b0092fb290078cmr6091041ejc.21.1678977579482;
        Thu, 16 Mar 2023 07:39:39 -0700 (PDT)
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
Subject: [PATCH v5 4/7] xen/riscv: introduce decode_cause() stuff
Date: Thu, 16 Mar 2023 16:39:26 +0200
Message-Id: <8c7b4a5d328be8b1cd2aa99c8d9a7883e4969600.1678976127.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678976127.git.oleksii.kurochko@gmail.com>
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces stuff needed to decode a reason of an
exception.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5:
  - Remove <xen/error.h> from riscv/traps/c as nothing would require
    inclusion.
  - decode_reserved_interrupt_cause(), decode_interrupt_cause(), decode_cause, do_unexpected_trap()
    were made as static they are expected to be used only in traps.c
  - use LINK_TO_LOAD() for addresses which can be linker time relative.
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
index ccd3593f5a..8a1529e0c5 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -4,10 +4,95 @@
  *
  * RISC-V Trap handlers
  */
+
+#include <xen/lib.h>
+
+#include <asm/boot-info.h>
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
+static const char *decode_reserved_interrupt_cause(unsigned long irq_cause)
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
+static const char *decode_interrupt_cause(unsigned long cause)
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
+static const char *decode_cause(unsigned long cause)
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
+    early_printk(LINK_TO_LOAD(decode_cause(cause)));
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
2.39.2



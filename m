Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA67B67E7A2
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 15:00:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485597.752995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGm-00032a-DM; Fri, 27 Jan 2023 13:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485597.752995; Fri, 27 Jan 2023 13:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGm-0002pZ-4a; Fri, 27 Jan 2023 13:59:56 +0000
Received: by outflank-mailman (input) for mailman id 485597;
 Fri, 27 Jan 2023 13:59:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhsa=5Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pLPGj-0000nM-Nc
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 13:59:53 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df587b6a-9e4a-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 14:59:53 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id h16so5020282wrz.12
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 05:59:53 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 d3-20020adfe2c3000000b002bc7fcf08ddsm3971131wrj.103.2023.01.27.05.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 05:59:52 -0800 (PST)
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
X-Inumbo-ID: df587b6a-9e4a-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFyYyPwBn9OgtucWxezUDT/W93gze1yZbOtcpEyG5FI=;
        b=nEzGY4RrpxaVb3ZuCObP2TewcA8p1mMJ8Te3uzA2J2GNVDnNgSG729cegKOCYy2hCI
         jG2w9WFh5suUgQxLGGixYNQfFFgte3H9QT/T2Wsu3r8bzLXK4rmP0jm65MgnMWP2QpgW
         1uvlHG6NjR0v70WT8unlJe9g7E5t8VzDJL7K6C7sW7vu+Dl/SeTElfioXB4PT48siwwi
         EFIPj1P5tl9Xm+BHD0A5PsS2GvCWoDAQyS9mfDrAs1uI75gkck1EL+Sd/GkJEO4scvHL
         IFsnasEz8djaJdWlFNj7W2kDj2DraF+pcB5BFschBSrgKpoic9NBNDKZYv1iwkoEQ/9j
         2Quw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iFyYyPwBn9OgtucWxezUDT/W93gze1yZbOtcpEyG5FI=;
        b=6xcu4uMbdKU0uLQ3w29KFyOk78qfnCmV/wv/RII5TVoNvD4kELZbx11hlZkE9s7SJE
         pqUvWBbap4Ru6WocEt+f+u+slUW2w+TgeeCBrCZui859zoXyGG5triT6usaCbPwQi7ua
         VBnF5uDXL0EAYhHi7rpmOq56hbOWkG5IgSEPEFLCu9eMuasP3cFNMzuseCLJ/7ribAWE
         HJeko6AaCZEyimTp06vxRdkZ1Pdle89/ukdmDpfL5J9whlooogO/bEctdB1uSGAo08LZ
         s9s7LUj9kw6xvItCY1jJUoGg4fsZuVEuhpCVkQAo+mt2dqXRttTX96d6i3nQZ+0e8uJg
         QzhA==
X-Gm-Message-State: AFqh2krBvu3vKLWuuHmvGIdTeL5M4ZNZXDfTyAba5OQtLtKWzddaki6N
	gu/envEDfhl6ghnmzwueulFo+NuJkV8=
X-Google-Smtp-Source: AMrXdXv4349AKuNWUMaghthp68QWPvH7Xes8fNq4qne42EPmK/TeGCJXxAtyuuS5aqMs+d4CEEC6IA==
X-Received: by 2002:a5d:6548:0:b0:2bd:f645:19dc with SMTP id z8-20020a5d6548000000b002bdf64519dcmr32348410wrv.68.1674827992465;
        Fri, 27 Jan 2023 05:59:52 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 09/14] xen/riscv: introduce decode_cause() stuff
Date: Fri, 27 Jan 2023 15:59:14 +0200
Message-Id: <5deb64dcb85d5ddef33c9a1adc9c50ddaadc5d5a.1674818705.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674818705.git.oleksii.kurochko@gmail.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces stuff needed to decode a reason of an
exception.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
  - Make decode_trap_cause() more optimization friendly.
  - Merge the pathc which introduces do_unexpected_trap() to the current one.
---
 xen/arch/riscv/traps.c | 85 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index ccd3593f5a..f2a1e1ffcf 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -4,10 +4,93 @@
  *
  * RISC-V Trap handlers
  */
+#include <asm/csr.h>
+#include <asm/early_printk.h>
 #include <asm/processor.h>
 #include <asm/traps.h>
+#include <xen/errno.h>
+#include <xen/lib.h>
 
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
+        return "M-mode TIMER Interrupt";
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



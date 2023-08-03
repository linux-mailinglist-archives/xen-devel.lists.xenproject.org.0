Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D19DB76E7CF
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 14:05:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576307.902302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRX5A-0003Ze-1n; Thu, 03 Aug 2023 12:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576307.902302; Thu, 03 Aug 2023 12:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRX59-0003SP-PY; Thu, 03 Aug 2023 12:05:31 +0000
Received: by outflank-mailman (input) for mailman id 576307;
 Thu, 03 Aug 2023 12:05:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DEIV=DU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qRX57-0002sb-Qy
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 12:05:29 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0976e245-31f6-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 14:05:29 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fe463420fbso1494136e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Aug 2023 05:05:29 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 e22-20020ac25476000000b004fdfefdf4acsm3304557lfn.39.2023.08.03.05.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 05:05:26 -0700 (PDT)
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
X-Inumbo-ID: 0976e245-31f6-11ee-b268-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691064328; x=1691669128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STtKrHA1Sag04TDET++CsZtqnaGprv3A+LtpFHsKLZ0=;
        b=Z0jMj2MbtzzeO2TkiK5IxBi2JLOcWaT3c8iXqSjMnwrOGXZUxChrwf3fJ6Njq9NcVg
         dRPhoo+l+mJa19wEcxQjU64qTTKCIR8LjyxLYOZpuGEcBwcxJzLogBH7tZhR+fBHizdW
         FmLkSwomBCgO9l7RqQcN9+WlhoMFMj5mHy7ib5Iit0e2JMzv+CF/muG6vYSt5ZE3ibcU
         9spL5V5yElrnhTAlTr0VY2VWfPSYWwt4eke7C56tgnVY8AAAZGF7zM2wXeeQyI2JQu+F
         hOBIUvJQ8pJHT4KgzwFIu7+j7mGfJ99g2UPQXBYwfo2oRIuL53pJDx6g6jQbq/Yup80D
         Vv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691064328; x=1691669128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STtKrHA1Sag04TDET++CsZtqnaGprv3A+LtpFHsKLZ0=;
        b=FHhHILzsQ6yrf0ogRkFl8Z9kMFVZziWB08aFbDB6BZH5TXUyyCNiRIU+ChW2K1no6p
         fEEyT4ZZC2BGejUVujmMfuaS9u3x6rkeTagQ2QTsXP+yLi0WbigKdu+WJzgQ3npB4vgH
         CPt5NonHCBcZnfjWW9AJY1ZqFmIa7ygSqMX18X5nVxEFDlAyRcBmWMz36NE5tB57j5/L
         4/wt6llg3wY9mOPyp+zGKARqCiWR3KWhHVAlAdcbREK7jQyIXOJEQZGw0bTIn4bbDi7L
         SstIhBHiZgRvfNmXL1WxVgJYyZJBRryH8Nbn7HwLGewA6ugEUNcttFScY83gQxObwY70
         3c/g==
X-Gm-Message-State: ABy/qLbY8Wz8RklVU0kExmBABzt4ZV5j+VPwZdtpa4tnVTOgzFrpCRL/
	92wbOolBDu6L3oycsO8sfT9Xo1dkfgA=
X-Google-Smtp-Source: APBJJlHvs7TfwdJjxWn0f+qWGjUj7YUnxmhAGYG0gOXVrOItVzjirQEsu0ZTFkM/slG5jIGyujl5Gg==
X-Received: by 2002:a05:6512:4003:b0:4f8:7055:6f7e with SMTP id br3-20020a056512400300b004f870556f7emr6298170lfb.44.1691064327475;
        Thu, 03 Aug 2023 05:05:27 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v7 3/6] xen/riscv: introduce decode_cause() stuff
Date: Thu,  3 Aug 2023 15:05:19 +0300
Message-ID: <25e8e5c5826199ad6f91fb5106472917765d8260.1691063432.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1691063432.git.oleksii.kurochko@gmail.com>
References: <cover.1691063432.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces stuff needed to decode a reason of an
exception.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V7:
 - Nothing changed. Only rebase.
---
Changes in V6:
 - Remove usage of LINK_TO_LOAD() due to the MMU being enabled first.
 - Change early_printk() to printk()
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
 xen/arch/riscv/traps.c | 84 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index ccd3593f5a..ea1012e83e 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -4,10 +4,92 @@
  *
  * RISC-V Trap handlers
  */
+
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
+    printk("Unhandled exception: %s\n", decode_cause(cause));
+
     die();
 }
+
+void do_trap(struct cpu_user_regs *cpu_regs)
+{
+    do_unexpected_trap(cpu_regs);
+}
-- 
2.41.0



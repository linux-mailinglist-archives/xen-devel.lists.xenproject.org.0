Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE5C7791F0
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 16:33:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582506.912329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUTCJ-0005YI-G3; Fri, 11 Aug 2023 14:33:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582506.912329; Fri, 11 Aug 2023 14:33:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUTCJ-0005Sz-CW; Fri, 11 Aug 2023 14:33:03 +0000
Received: by outflank-mailman (input) for mailman id 582506;
 Fri, 11 Aug 2023 14:33:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zNma=D4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qUTCI-0004v5-5k
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 14:33:02 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f88d3af2-3853-11ee-8613-37d641c3527e;
 Fri, 11 Aug 2023 16:32:59 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fe27849e6aso3261494e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Aug 2023 07:33:00 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 q2-20020ac25a02000000b004fe07f06337sm753453lfn.53.2023.08.11.07.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 07:32:59 -0700 (PDT)
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
X-Inumbo-ID: f88d3af2-3853-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691764380; x=1692369180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUcu2qxnQUPl60o9J+2YFJhCdL460tY2JEgoa99A+hs=;
        b=kpmGNC0rGdvqjEnckQmthWRufVqIFbkXrlV1X8NxCthx0hq5FHxZabpthDdNBYljYB
         BE2b4op30+CS9s6+msN5L4Qs85H43tMFlRvdX5UQLrX3ABo9B8bKQJczO1phoEw+gH1G
         yupgxEROaEzYvhy84SMLfwOT9EBlu84M11LSFqq3c6sUDMqUOv+faXSXcHhrAcxMpftL
         CVdPVTdvKjIflbyCY2LRVGueomS7UjvHGpZdY+IS7k36s1fwqEY0h3XL1QKkkwkJ0b7Z
         YzMI8FBjed9DITZiNZ1wzFJI9dKDC20mlpAYoY9GenR0TzTuOymF+DF/vMRd9QJ0MdbU
         9D0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691764380; x=1692369180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUcu2qxnQUPl60o9J+2YFJhCdL460tY2JEgoa99A+hs=;
        b=P24XaqRIDpVqe70esv2MgjtJQjkvl8joO3NUpVJQ/ihXF/CFWpQmDNCYiH/BBvjWXC
         KEAc4DPdoadtKHgPEjOBzRKhhLjLNFfFZjPd6/yxJ8BtnlIiIUSnVgMfNE87FVI3aZvz
         XoGdhU8Ml+2irn6IHcpz8qa2X7VUqvjSYx0qcdUNPvBT1bDbSn5bY5JyCuYVEYfce0mD
         BlDroRY6eI/FXrI/kbMTWS8hb493bp7M/Zq3w/FqAhlYr19XJQ5uHMSe9fO22xwdgYwu
         wOJSKuZC9bNQpJbk2jQTUQ4cTMJdJe0DLQ0a5swew5BWsCechGI/1jQo7MLIUpglneA8
         chDw==
X-Gm-Message-State: AOJu0YyV7qUVluFU13ezcSQCXWdL1UfDuLBu8JpP/w+eFjU2IL/LMgrb
	7RiISImK2Ffte92fUNaQ/ZVJOnY6Q+o=
X-Google-Smtp-Source: AGHT+IG3DDqQ/ltjvGgtw/Whl2OwvjMojKAXkZMmzPqYsbf0lTo9FGVz+/HNzm7xePWRhZRr93Tuig==
X-Received: by 2002:ac2:5205:0:b0:4fe:e8f:e216 with SMTP id a5-20020ac25205000000b004fe0e8fe216mr1486152lfl.39.1691764379572;
        Fri, 11 Aug 2023 07:32:59 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v8 3/6] xen/riscv: introduce decode_cause() stuff
Date: Fri, 11 Aug 2023 17:32:52 +0300
Message-ID: <c181786ff264f07e13068dde239ef65e220a41b3.1691763757.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1691763757.git.oleksii.kurochko@gmail.com>
References: <cover.1691763757.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces stuff needed to decode a reason of an
exception.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V8:
  - fix typo in return string from decode_reserved_interrupt_cause
  - add Acked-by: Alistair Francis <alistair.francis@wdc.com>
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
index ccd3593f5a..a2b63d579b 100644
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
+        return "M-mode Timer Interrupt";
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



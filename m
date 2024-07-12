Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0974092FE56
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 18:19:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758148.1167490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSIz9-0004aI-4M; Fri, 12 Jul 2024 16:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758148.1167490; Fri, 12 Jul 2024 16:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSIz8-0004WI-UI; Fri, 12 Jul 2024 16:19:02 +0000
Received: by outflank-mailman (input) for mailman id 758148;
 Fri, 12 Jul 2024 16:19:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Ov5=OM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sSIz7-00040X-IQ
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 16:19:01 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7209ec4a-406a-11ef-8776-851b0ebba9a2;
 Fri, 12 Jul 2024 18:18:59 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5854ac817afso2829789a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 09:18:59 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bb9604f7sm4669169a12.15.2024.07.12.09.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 09:18:58 -0700 (PDT)
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
X-Inumbo-ID: 7209ec4a-406a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720801139; x=1721405939; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnR0lQfCiZrZB2pYI/iZQqNx4LzjeoRWt1LANtUWrVY=;
        b=lSCp4Cc/PTWxq/7qRzPBu6lXm80ywlWCafTDm4hGd2XpeB51S/XEdKPYzaYiqngM7u
         BWVxoPZoriLXjLC+JGoWvhbgYvF6G1Bx2VaISOQRjL3Tt2B4qhQrE8Fi/M0EgFYMBNy6
         RG6O1xmGu7cgTE+btpGn/ZsLLZUMPVIZK7kn4SwfDP/QBmNPE36NyPcvsZWpumL+WQkq
         sWc42IraLHshVD12HEgN9jenoMgU0CamsE5476n5xIKM/x6dQIajLDap598f/Dden+16
         GADa+TbUdkWc3ATN3xI/vo0wMqUJ9MrpaXGNxuZUqjE42e0/4iSajG9gTmORuiBHewx3
         WIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720801139; x=1721405939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnR0lQfCiZrZB2pYI/iZQqNx4LzjeoRWt1LANtUWrVY=;
        b=aue5wtDYOyTNt77KCBkHq5RHqfX8LbNbLmy/hj3fEXVXYXwA87eN/T0VmT/3R4B6Ja
         xm/TP8ehAIv+KEH3RHizo+JbVDGqYAT4B+HXsDfc/5Og2t35PhJAMLNCuLXPNG0jHJAn
         cLe6NHsfSY68YgC3eUmyBv9cAKJNZg8NAs+3R4JKHOPR/K8bHpGpz+kzv0XNPlmKwgHl
         YdacDnEWUm15sBox96ndPrAminkpUfMyK/aintwGmuEMmG8TGcXyUCG+bHTsODwVDqhc
         4GyeChQhsBxzyBYXNJEJO1cTdBeP2fIjZyJ8Bp3ThpRkb1Yc1PFrjOmPCD+tm3p4DEvA
         u9Vg==
X-Gm-Message-State: AOJu0YzsLYrZVzbkETfomQ+DT3KKKvWo5eeFcSHH1po1s3cO3q9ORGMs
	X8nn0VRUDLO5NR0A6z2EYnBv1sZbkV30Zlx6vygzRcsK283GWWuUmtLy2C2o
X-Google-Smtp-Source: AGHT+IElo5yBxcnuOD1tObFjCmJxahwTzdOmlQV86IIWtIO8gilmED3rdM9dA0bKJmDVSjjZmP5iXg==
X-Received: by 2002:a50:d518:0:b0:585:437c:d7fc with SMTP id 4fb4d7f45d1cf-594bc7c7e61mr7402934a12.32.1720801138545;
        Fri, 12 Jul 2024 09:18:58 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v10 2/5] xen/riscv: introduce decode_cause() stuff
Date: Fri, 12 Jul 2024 18:18:51 +0200
Message-ID: <335b0b49720b3524b6c89c5ce62d3377a4bb1fb8.1720799487.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720799487.git.oleksii.kurochko@gmail.com>
References: <cover.1720799487.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces stuff needed to decode a reason of an
exception.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V10:
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V9:
 - This patch was reverted as breaks both release and randconfig builds.
   I don't see the failures now. ( probably it was because of printk usage
   which was not ready at that moment ).
 - drop inclusion of <asm/csr.h> and <asm/early_printk.h>
 - add <asm/riscv_encoding.h> for CAUSE_* in decode_trap_cause().
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
 xen/arch/riscv/traps.c | 80 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 5415cf8d90..37cec40dfa 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -9,13 +9,91 @@
 #include <xen/sched.h>
 
 #include <asm/processor.h>
+#include <asm/riscv_encoding.h>
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
 
+void do_trap(struct cpu_user_regs *cpu_regs)
+{
+    do_unexpected_trap(cpu_regs);
+}
+
 void vcpu_show_execution_state(struct vcpu *v)
 {
     BUG_ON("unimplemented");
-- 
2.45.2



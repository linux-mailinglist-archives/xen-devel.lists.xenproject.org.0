Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F54293B3B5
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 17:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764285.1174672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWdxg-0005qT-EF; Wed, 24 Jul 2024 15:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764285.1174672; Wed, 24 Jul 2024 15:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWdxg-0005gN-8k; Wed, 24 Jul 2024 15:31:28 +0000
Received: by outflank-mailman (input) for mailman id 764285;
 Wed, 24 Jul 2024 15:31:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fJNX=OY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWdxe-0005Od-VV
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 15:31:26 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c91e95c8-49d1-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 17:31:24 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2f01e9f53ebso26080041fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 08:31:24 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ef26f1bc4asm14240491fa.40.2024.07.24.08.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 08:31:22 -0700 (PDT)
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
X-Inumbo-ID: c91e95c8-49d1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721835084; x=1722439884; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56J2Umln9ekAx0H/k4L6hwTUoVJfEpVRZy78p69qzAA=;
        b=TM9Kz0hVSzv2cWqrhw/LUFZ2K4AFfGjTUEdSL9/UjLyI79bRCofPl2t/Zp68hq93M8
         WsVH9ajq73i4cJwe2lvEPyhhH1VXvfrAh71ep89CouOuI034O5ygHmZf3CcCrLozFLbn
         vyNc101BXQNWzGrfCESfXfFzTNzFeNRM78wxPP6svNHWiAhuuDnWh+ZrcPW7rkgJ9Cko
         2TZP8IOBHlvAkdIRmjylqbAu2HbUmh+76dRywtWuzW+rp2p10yn1gzdURpEQyN+p1Jjz
         Kg3ZqsaDVcxJzl37eMo+uZFv7k0bSP8YWGsJq3xG7RoQFGRDXSDc71jDsX+s+lMWJkwX
         ZMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721835084; x=1722439884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56J2Umln9ekAx0H/k4L6hwTUoVJfEpVRZy78p69qzAA=;
        b=KCjMVoDTeL7IOe55+V5wJYCj4d9jnxbjr35aEWnHaouJ8BiB7W+uDX4Ofe7L2T62kF
         fT9sAOA3t1c5tKRkENqkUA1/MBvKux7SB1nMwXdt/sJNZdx91BhbVQA/Cia2QCYzqlxs
         FJaFZ8HPlm+NTKFtjE9W9tSsOkuwyXcj4Ig0DbsPfg2sJts8UNggPUoqEqI0UikE6mhl
         3V2HdYhXoMMfbaIhJIpaFbb/e22aJFWCp8mw9zhQfdiyrG7VzA08LaDX6tdBBUyS5oCP
         jbeg47mu/WQ77WlWlEndzQJTEzSzVLLnzqnWexSNT7mkvcGkN1FwzlOcgBQImXPnxnxZ
         CtZg==
X-Gm-Message-State: AOJu0YxSlpClRgooC3dovsABtu7WWXmHVQAOe8jZXIk2fkjThPC8f+lb
	2bV8kB8Ju50LF13p74LTnsT7ijTQ/YRKqYyNw2qRQmn5oz1KKuhh3Eo5P1f0
X-Google-Smtp-Source: AGHT+IH9oAwGr69eOcDYaniQ9eUobwcMuu+2onf6MtRizoPSP06ODrFSCoaTHWWIZx6UK06SxpUSUQ==
X-Received: by 2002:a05:651c:b1e:b0:2ef:2c27:6680 with SMTP id 38308e7fff4ca-2f039c79ea1mr2186621fa.12.1721835083200;
        Wed, 24 Jul 2024 08:31:23 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v11 2/5] xen/riscv: introduce decode_cause() stuff
Date: Wed, 24 Jul 2024 17:31:16 +0200
Message-ID: <335b0b49720b3524b6c89c5ce62d3377a4bb1fb8.1721731887.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721731887.git.oleksii.kurochko@gmail.com>
References: <cover.1721731887.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces stuff needed to decode a reason of an
exception.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V11:
 - Nothing changed. Only rebase.
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



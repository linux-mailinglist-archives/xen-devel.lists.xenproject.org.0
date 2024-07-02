Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7072923C54
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 13:24:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752360.1160570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObc7-0001yk-B9; Tue, 02 Jul 2024 11:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752360.1160570; Tue, 02 Jul 2024 11:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObc7-0001sI-6u; Tue, 02 Jul 2024 11:23:59 +0000
Received: by outflank-mailman (input) for mailman id 752360;
 Tue, 02 Jul 2024 11:23:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Tas=OC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sObc6-0001mD-6q
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 11:23:58 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 926905be-3865-11ef-92e8-0d9d20120eaa;
 Tue, 02 Jul 2024 13:23:57 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ebec2f11b7so45956101fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 04:23:57 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee5161fb73sm16149981fa.33.2024.07.02.04.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 04:23:55 -0700 (PDT)
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
X-Inumbo-ID: 926905be-3865-11ef-92e8-0d9d20120eaa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719919436; x=1720524236; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BfiwtMm7MMPr/ZmXTaMofeIOTWuXGENJ246OGl6NYg=;
        b=dMtL2tnglFBNrmRoRv5TFaItaRMEjA3wu9lb4oKY/UIN3VlccZtqwE1V3CEz57zA8Q
         cc65CIiDCVV3HvRJasz10BW5XBbJV8xkgCVdxwWzrmpZfaA0trlXmSl5EeiUx75+zRxs
         aqXBAhcjwl0anf/OUbWoiQISUxaeY6qg1guodLbl2x7dZmdLiRd+N6mwUEbofJWKo2xi
         cB7eD35l9RX6GUgBHemd75lGpPyZ3wf+MuGboGqL0V7itCr6cYcL3XDym7MdbjhFfjTQ
         H/XIe3U+qe9wZ26pZvS102WqcEC5NkkrjtGWeWypPTgaOrthyGb5DUFECAxT6FnsoeA7
         nvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719919436; x=1720524236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6BfiwtMm7MMPr/ZmXTaMofeIOTWuXGENJ246OGl6NYg=;
        b=mcpy+DukeU32IaFekFATMQBRjXUUctkLo4PHMVcSHK1sdcavt4WvHvq5TdZS9+Rf5B
         fYLQ4Is+jajB71eZYePSG3RqUynrmxNEgeF/86FJVfoZUb7WubV4zocfHZKu5c9i7Y84
         Md8husjirQ/xLcFNlUzbohhbzRr90SkhWw91a1PQOI5M5ZqczdvslymTTv30i6LV8Mi9
         zAUsXQLyTdXzjcMiFSB9krL2ZVYfI494EsjYkFuQwzhm5RtXh41U6bXeiXZE/sgjT7Fp
         hTZxmyXuiSHCWAaG9ImVrTgsvLeuSah+cu4b1olYgwG5nliGD6DnXY0cExRuOiczd2zx
         qNjQ==
X-Gm-Message-State: AOJu0Yzc0a1Uop4NyTtzZnbigte+cXlUl6LkFTQDj9LlfDdbBVXbipng
	4ZzMRJtF9Ksv5qvDwXyMPHvU2Zg1/iLPl+ihpkUpsVl39WkGKiSymP26PynO
X-Google-Smtp-Source: AGHT+IE9KF4lKKQ4RhAW0d6YuxQEKRwjd6S/Nb4rUg3IYT13YDl7SwK6mzVEMwNlpXGw5adVrtjj4g==
X-Received: by 2002:a05:651c:1511:b0:2ec:4d82:9e93 with SMTP id 38308e7fff4ca-2ee5e6bcb43mr62237861fa.44.1719919436370;
        Tue, 02 Jul 2024 04:23:56 -0700 (PDT)
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
Subject: [PATCH v9 2/5] xen/riscv: introduce decode_cause() stuff
Date: Tue,  2 Jul 2024 13:23:47 +0200
Message-ID: <3b93bb33b42cb6e86a38cd95a098e60447666e2e.1719918148.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719918148.git.oleksii.kurochko@gmail.com>
References: <cover.1719918148.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces stuff needed to decode a reason of an
exception.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EC068DC0A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 15:47:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491195.760278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFZ-0006ey-0d; Tue, 07 Feb 2023 14:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491195.760278; Tue, 07 Feb 2023 14:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFY-0006Z1-Lv; Tue, 07 Feb 2023 14:47:12 +0000
Received: by outflank-mailman (input) for mailman id 491195;
 Tue, 07 Feb 2023 14:47:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pPPFW-0004Hz-6j
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 14:47:10 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bc4786e-a6f6-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 15:47:08 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id j25so10260650wrc.4
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 06:47:08 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.109.85.nat.umts.dynamic.t-mobile.pl. [46.204.109.85])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b002c3e94cb757sm5269743wrw.117.2023.02.07.06.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:47:07 -0800 (PST)
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
X-Inumbo-ID: 4bc4786e-a6f6-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWyN2AklZ+5udnDul9odmXqegN4DHlE2VSRiWyrifCk=;
        b=ocaxVvlYtFP008qmuBCn/r0eoVYyRMrmmcenV4lyrF8OElaW4XdvlMrx+yszOoiZdf
         Ql2uCW6a/XmmfBCYhNXzP4UP3tjLFdO2lZOeRM+AQCIA597VSiK1XQkuntVi54QsLcpg
         zoYTYZQIJb22Eo90typrTbaFXAyS0KHX+vsYOHh9t2VuxrywjleIt3N9vqoZKXrOQSBg
         AkqAUuoEZiPiA4BCVJftf3phbGObVDP6qsUZHdM+zUm1r6jRGGCp/Lk45cl8miibo5Wy
         2qNxGKPj2m6i8xa4/rywq0NndmT19XjHhKJyX3h2nd6rcdLe9LKm5U4ICdVIjpnm6K3i
         9ynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UWyN2AklZ+5udnDul9odmXqegN4DHlE2VSRiWyrifCk=;
        b=eqKGyu80pn0qVaM4gz4q2CIu685AqH2cF3+IATCUpem5s+PSEaHPOdE7iL2uOG1DJE
         Y6fSewm3w2RYfsTojjVaykZkh5kXMh5hdlhBZVhLuFhfc4BVbrnFagS/G3tUgqREnoTF
         J6TO60ryhZzsZghCRpDsu8BlUNKELg/GJ/nHlSMm5/Pm7T+BKL62SB7y33aLhADHLnjv
         YgXT49Ok2FWYpjq4Oc5Hk2TlqXZKAjs/Re7Fjtl1FhosZ0eR9gSaW9DI66NuMCJXXmJv
         hSx6YxtkmU6bKyQyz+6G1hX2EWbJUTWS4Kmdyq7XWn74J8R+RZzwnq8ysnZakay/Zmy0
         fANA==
X-Gm-Message-State: AO0yUKUrMHiq6765HHFfdWbWJPlL2FxRSPX/o7ZJyePn6rN/NMQzIqCj
	czQN6F+Os/q+I2pizqLDT0bQnJwpenk=
X-Google-Smtp-Source: AK7set8dhxnbXJj/Yc55LnNr+mWVMKyhsLBz++8X5Ub8Iyp/LGs9KzAIIqY4J88YsD5O3q6qurIfHQ==
X-Received: by 2002:adf:f485:0:b0:2c3:e297:8e4d with SMTP id l5-20020adff485000000b002c3e2978e4dmr2480852wro.6.1675781227718;
        Tue, 07 Feb 2023 06:47:07 -0800 (PST)
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
Subject: [PATCH v3 09/14] xen/riscv: introduce decode_cause() stuff
Date: Tue,  7 Feb 2023 16:46:44 +0200
Message-Id: <0198e2a5b572b9031eafe7cd1c85c6f9537b704c.1675779308.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675779308.git.oleksii.kurochko@gmail.com>
References: <cover.1675779308.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces stuff needed to decode a reason of an
exception.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
  - Nothing changed
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



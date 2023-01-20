Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EFA6757FA
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 16:00:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481861.747106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssL-00005Z-DA; Fri, 20 Jan 2023 15:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481861.747106; Fri, 20 Jan 2023 15:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssK-0008PA-KF; Fri, 20 Jan 2023 15:00:16 +0000
Received: by outflank-mailman (input) for mailman id 481861;
 Fri, 20 Jan 2023 15:00:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVut=5R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIssH-0006SQ-Dq
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 15:00:13 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23371b36-98d3-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 16:00:11 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id t5so5117565wrq.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jan 2023 07:00:11 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002bdbead763csm25349811wrf.95.2023.01.20.07.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:00:10 -0800 (PST)
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
X-Inumbo-ID: 23371b36-98d3-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oa0wgdXnZxM249MLdfrJG7qfiY3SAdUUZ8LhXWtM0Ic=;
        b=ZABVCYsyUwKcpQX/0rzLULBtNWpkV9f4/4PXMYrYkEgKk+mKZn/DNDloFJKUDTrixv
         Po36LgKBFSxolnriU06W0pe/TW3yjv8dxO0RLkHDxLXKyfcwtwFYfZ7aTYKt0eD95p6T
         7MINqvik3DYun61yVCym92uqCPZfh/fVQtS/HKpqV8TpkUCMBbtef+r4cHS6Ko8i5qef
         ukUJ1HY6Pti6D0kGKBKsCsCgiHtUS+FzSR6JEtntdKA4SsLCb7HONIDZfSYceVGi0/TV
         wASdlX+wR+hAOEs4Acc28rWr915dBjeqzLqvf0emA8noZjE1s91x7Bxq7DpuJb00pl3a
         VG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oa0wgdXnZxM249MLdfrJG7qfiY3SAdUUZ8LhXWtM0Ic=;
        b=yZCeN4MmUps7HohmDwzlNSRffXoCVYC7CFwYlL8jpk5/rC7hXfHW0tww+wWhp7t7ru
         mJnpwF8qZsoCXq5M59EYWqEaKjM4eYmSsA/pOCELhPp2zNcxkEnIuIGSIO1+NA9PeGSG
         YtFcXQjmv/GJJmcbrARTATJMOfB1k5Y4HuuuoRPhXcUGsxDwvYmzn43ZGMRjw6kZgn46
         S4iI8DFTcdpsTTVN8Q7w7nQhgTonx/5gLfM2Xp3YXBfK3ZlVN0JhJtePiBEhEzl9XOYg
         JQkqJOoFZrq+FLbuQfEXmk3jZDacb4lNUqegUVvkNkzON4vCfPF9LB+rIKmoqkUP/+C1
         8fzA==
X-Gm-Message-State: AFqh2komjlIdxNS2IDsBiAjZVSS6B9SFoTr5mnWSQ40EZ99+TNnD6J7w
	taCCJBWhtohJQUKPf5Pty/dGMPAhBwAAUw==
X-Google-Smtp-Source: AMrXdXuEs6tkrKfGNgQJxeUkzovrnpB0U2Hqnxd8SMBOuezNI2Q2tP5yjGlQzzQTreLtSGeScTUsOg==
X-Received: by 2002:a5d:4526:0:b0:2bc:839c:134d with SMTP id j6-20020a5d4526000000b002bc839c134dmr13159877wra.4.1674226810899;
        Fri, 20 Jan 2023 07:00:10 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 08/14] xen/riscv: introduce decode_cause() stuff
Date: Fri, 20 Jan 2023 16:59:48 +0200
Message-Id: <c798832ec19cb94c0a27e8cff8f5bd6d1aa6ae7e.1674226563.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674226563.git.oleksii.kurochko@gmail.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces stuff needed to decode a reason of an
exception.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/traps.c | 88 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 3201b851ef..dd64f053a5 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -4,8 +4,96 @@
  *
  * RISC-V Trap handlers
  */
+#include <asm/csr.h>
+#include <asm/early_printk.h>
 #include <asm/processor.h>
 #include <asm/traps.h>
+#include <xen/errno.h>
+
+const char *decode_trap_cause(unsigned long cause)
+{
+    switch ( cause )
+    {
+    case CAUSE_MISALIGNED_FETCH:
+        return "Instruction Address Misaligned";
+    case CAUSE_FETCH_ACCESS:
+        return "Instruction Access Fault";
+    case CAUSE_ILLEGAL_INSTRUCTION:
+        return "Illegal Instruction";
+    case CAUSE_BREAKPOINT:
+        return "Breakpoint";
+    case CAUSE_MISALIGNED_LOAD:
+        return "Load Address Misaligned";
+    case CAUSE_LOAD_ACCESS:
+        return "Load Access Fault";
+    case CAUSE_MISALIGNED_STORE:
+        return "Store/AMO Address Misaligned";
+    case CAUSE_STORE_ACCESS:
+        return "Store/AMO Access Fault";
+    case CAUSE_USER_ECALL:
+        return "Environment Call from U-Mode";
+    case CAUSE_SUPERVISOR_ECALL:
+        return "Environment Call from S-Mode";
+    case CAUSE_MACHINE_ECALL:
+        return "Environment Call from M-Mode";
+    case CAUSE_FETCH_PAGE_FAULT:
+        return "Instruction Page Fault";
+    case CAUSE_LOAD_PAGE_FAULT:
+        return "Load Page Fault";
+    case CAUSE_STORE_PAGE_FAULT:
+        return "Store/AMO Page Fault";
+    case CAUSE_FETCH_GUEST_PAGE_FAULT:
+        return "Instruction Guest Page Fault";
+    case CAUSE_LOAD_GUEST_PAGE_FAULT:
+        return "Load Guest Page Fault";
+    case CAUSE_VIRTUAL_INST_FAULT:
+        return "Virtualized Instruction Fault";
+    case CAUSE_STORE_GUEST_PAGE_FAULT:
+        return "Guest Store/AMO Page Fault";
+    default:
+        return "UNKNOWN";
+    }
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
 
 void __handle_exception(struct cpu_user_regs *cpu_regs)
 {
-- 
2.39.0



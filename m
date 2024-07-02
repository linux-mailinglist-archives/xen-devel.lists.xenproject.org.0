Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED047923C50
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 13:24:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752362.1160598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObcA-0002mR-QG; Tue, 02 Jul 2024 11:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752362.1160598; Tue, 02 Jul 2024 11:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObcA-0002kF-KG; Tue, 02 Jul 2024 11:24:02 +0000
Received: by outflank-mailman (input) for mailman id 752362;
 Tue, 02 Jul 2024 11:24:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Tas=OC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sObc9-0001m7-4r
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 11:24:01 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93ce3950-3865-11ef-aaf1-7f3abd7486c0;
 Tue, 02 Jul 2024 13:23:59 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ed5ac077f5so48545841fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 04:23:59 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee5161fb73sm16149981fa.33.2024.07.02.04.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 04:23:58 -0700 (PDT)
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
X-Inumbo-ID: 93ce3950-3865-11ef-aaf1-7f3abd7486c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719919439; x=1720524239; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hEIsWsvrlXl4/YcR0JMfIfMbkJsSh1CWtuRxJ27QKeY=;
        b=mjYufUq8+mgghRdUihQLdQ0QnbXlkHXJSv9e0o6nrDCYcw791Kzu3xKovS/0zeEXlj
         QJ33KUDfBCNjND+qW9OPqxrE4LOZ79vSbU1oKg77SNUNJk9sRCWi4xXUVsSsESvGH0v0
         cv5uEsgqAA/TDH+QthfLbWEui/PS5+G473IA7AUK1MTJxjucV/2KNbknhtHn3IP7g9E8
         Goa+7BMuSM69dXypYNLHvWqq+Y/3jpTolmXI1kbtJd2h2JkHXisnfNsYlEfyOaWVmLI+
         SYOev5peLkzXgp71KZu7H1YMCQDLU/HSXNkuvrhoo6WJAvaXoXXtryzS+nkT11vLhO+3
         uxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719919439; x=1720524239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hEIsWsvrlXl4/YcR0JMfIfMbkJsSh1CWtuRxJ27QKeY=;
        b=htoUUvAAzK91VDoqOvmMYOcPenriscTdSirenftkYN7iGHh9y5LB6FI9QylKt1xllw
         xkxK9IBFw+ljN22gdr88M8Y1BJKgdzkQW4iZr8cyuSBYGNmEQoufjmRj1PanAXWVH0B1
         ByAOpVK77Fd2MhjbtM7gNfLwr6uorKQgy2jfSERn5Zr/0NRfqiiAURkJlhAuujY7bxmo
         Pumx0wy+QoiiGowbcV7gLUy9m2qpdRdffnnXqGcjVoNTOWs4hY8fgJkBbHN1gVVTBO7J
         3gCUcpK4UdGuU6Xff0Rs6pzca+pNydFQlbuOuRLqGWnnP4nQ8U6GvIBS2kMlS8udJug0
         b1SQ==
X-Gm-Message-State: AOJu0YwljEgJRx7YDdUxhca8ie07DeZofp/RB6m4l03vDsCx4j5ciNWX
	r/DndHseimIsCV90EO9UTVfIQ+81m7CDldYIAZsdctBg8b2CqQwQYRsm7Jbp
X-Google-Smtp-Source: AGHT+IEClPxEScxTwOZDx/lM2//DicvvbS2F0zthvwNfRMHFUtUpJW46VjOET/t7OoKVDOZ/OVSDLQ==
X-Received: by 2002:a05:651c:893:b0:2ee:6277:a888 with SMTP id 38308e7fff4ca-2ee6277a9f3mr53920421fa.38.1719919438650;
        Tue, 02 Jul 2024 04:23:58 -0700 (PDT)
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
Subject: [PATCH v9 4/5] xen/riscv: enable GENERIC_BUG_FRAME
Date: Tue,  2 Jul 2024 13:23:49 +0200
Message-ID: <c51c485bac43b7589961aabec8af1b82d4673b94.1719918148.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719918148.git.oleksii.kurochko@gmail.com>
References: <cover.1719918148.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Kconfig |  1 +
 xen/arch/riscv/traps.c | 31 +++++++++++++++++++++++++++++++
 xen/common/bug.c       |  1 +
 3 files changed, 33 insertions(+)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index b4b354a778..74ad019fe7 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -5,6 +5,7 @@ config RISCV
 config RISCV_64
 	def_bool y
 	select 64BIT
+	select GENERIC_BUG_FRAME
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index cb18b30ff2..7ba16252fc 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -5,6 +5,7 @@
  * RISC-V Trap handlers
  */
 
+#include <xen/bug.h>
 #include <xen/lib.h>
 #include <xen/sched.h>
 
@@ -101,8 +102,38 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
     die();
 }
 
+static bool is_valid_bug_insn(uint32_t insn)
+{
+    return insn == BUG_INSN_32 ||
+           (insn & COMPRESSED_INSN_MASK) == BUG_INSN_16;
+}
+
+/* Should be used only on Xen code */
+static uint32_t read_instr(unsigned long pc)
+{
+    uint16_t instr16 = *(uint16_t *)pc;
+
+    ASSERT(is_kernel_text(pc + 1) || is_kernel_inittext(pc + 1));
+
+    if ( GET_INSN_LENGTH(instr16) == 2 )
+        return instr16;
+
+    ASSERT(is_kernel_text(pc + 3) || is_kernel_inittext(pc + 3));
+
+    return *(uint32_t *)pc;
+}
+
 void do_trap(struct cpu_user_regs *cpu_regs)
 {
+    register_t pc = cpu_regs->sepc;
+    uint32_t instr = read_instr(pc);
+
+    if ( ( is_valid_bug_insn(instr) ) && ( do_bug_frame(cpu_regs, pc) >= 0 ) )
+    {
+        cpu_regs->sepc += GET_INSN_LENGTH(instr);
+        return;
+    }
+
     do_unexpected_trap(cpu_regs);
 }
 
diff --git a/xen/common/bug.c b/xen/common/bug.c
index b7c5d8fd4d..75cb35fcfa 100644
--- a/xen/common/bug.c
+++ b/xen/common/bug.c
@@ -1,6 +1,7 @@
 #include <xen/bug.h>
 #include <xen/errno.h>
 #include <xen/kernel.h>
+#include <xen/lib.h>
 #include <xen/livepatch.h>
 #include <xen/string.h>
 #include <xen/types.h>
-- 
2.45.2



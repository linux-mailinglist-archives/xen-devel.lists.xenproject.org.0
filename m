Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA31968DC05
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 15:47:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491196.760285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFZ-0006la-KO; Tue, 07 Feb 2023 14:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491196.760285; Tue, 07 Feb 2023 14:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFZ-0006fP-8V; Tue, 07 Feb 2023 14:47:13 +0000
Received: by outflank-mailman (input) for mailman id 491196;
 Tue, 07 Feb 2023 14:47:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pPPFX-00043Z-6A
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 14:47:11 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d0ce107-a6f6-11ed-933c-83870f6b2ba8;
 Tue, 07 Feb 2023 15:47:10 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id d14so13781368wrr.9
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 06:47:10 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.109.85.nat.umts.dynamic.t-mobile.pl. [46.204.109.85])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b002c3e94cb757sm5269743wrw.117.2023.02.07.06.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:47:09 -0800 (PST)
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
X-Inumbo-ID: 4d0ce107-a6f6-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uc1iqmG0eDG1vQ8U+sIbLSUPJBA6OCCUXdQBV344qb4=;
        b=olvo1aH5RBZGUjokZv9RAKbsOsTDD+/kjMI6EjTxAZF/9s6xmssMG5Yp1p19tqmDSq
         J1ZEL34cKCWDSvONG1t6ZUMPJUHjlRsqFNaidownvwbiK0IVyzswUmBBTYSeD1F+hYKY
         z+xzh2RWPonGo7U6ZCZvYflS4I1ELFfsOhIO9riFSWazIOEEVI3DeVonkBEWCQUk2zf7
         EOiNvZxTOIlL58sD81K8pLzcrVEvvxbe6Ln8eG+UPtrpPqPyHhYUvP3QEeROM1TtDviA
         EQl6U/PrnpUn7ooJV7ng8oLPhhs7ocfPbPwZbxflFHPL/mBXBkTu8+0K5yopXUptwDy3
         Jb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uc1iqmG0eDG1vQ8U+sIbLSUPJBA6OCCUXdQBV344qb4=;
        b=cKisLwzTdZXoVClOoJO1snmDhnBAhfCYeW7QIbWtcGrGXMUjGmEz2AG/JY4WGRFHO+
         GS1YUzJw1PjSkK5+a/MktiJ/c1hqvL+LyOXZzpGXdHPR7LW7knLrhTLPnaJh07kGyB3h
         vxIrrnT0eToWlc2MPv4azLnfcQILvW6HTWXZUHVeCtKOSfZ6IxYoTVF0/EOi8ZZPb55o
         3wZwVbOZTzVfH30ov+kkk0R+4pIs7ujDATIgx3Gx0WdgCe5Vaj4phfNuA6cxK9bND8NS
         GzBgx1NWfNNLyngRPWlrQA6jHCqMoPl2LaMgDSxWOz7aiMQthZpEQwTSNOtv/4NUTuaP
         KiCg==
X-Gm-Message-State: AO0yUKVziIZeZegXfLUYJ7/OOVQ1Voa7+4ccn7yhLAAP2KwCF0+8G0AL
	7NgQHxsu5Eave7i4m67x1xbbdOR8bpc=
X-Google-Smtp-Source: AK7set+Eb+udgm23p1UXUtnSVXWgYWQE4l6PsivZ10ubuA6EA4/o8N3XEZ7hphV9varJkmI3sswzRQ==
X-Received: by 2002:adf:ec82:0:b0:2c3:e793:dc57 with SMTP id z2-20020adfec82000000b002c3e793dc57mr3284318wrn.10.1675781230114;
        Tue, 07 Feb 2023 06:47:10 -0800 (PST)
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
Subject: [PATCH v3 11/14] xen/riscv: introduce trap_init()
Date: Tue,  7 Feb 2023 16:46:46 +0200
Message-Id: <38c210192e8a4f32bb45765c4038cfc8f737aa78.1675779308.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675779308.git.oleksii.kurochko@gmail.com>
References: <cover.1675779308.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V3:
  - Nothing changed
---
Changes in V2:
  - Rename setup_trap_handler() to trap_init().
  - Add Reviewed-by to the commit message.
---
 xen/arch/riscv/include/asm/traps.h | 1 +
 xen/arch/riscv/setup.c             | 4 ++++
 xen/arch/riscv/traps.c             | 7 +++++++
 3 files changed, 12 insertions(+)

diff --git a/xen/arch/riscv/include/asm/traps.h b/xen/arch/riscv/include/asm/traps.h
index f3fb6b25d1..f1879294ef 100644
--- a/xen/arch/riscv/include/asm/traps.h
+++ b/xen/arch/riscv/include/asm/traps.h
@@ -7,6 +7,7 @@
 
 void do_trap(struct cpu_user_regs *cpu_regs);
 void handle_trap(void);
+void trap_init(void);
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index d09ffe1454..c8513ca4f8 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,7 +1,9 @@
 #include <xen/compile.h>
 #include <xen/init.h>
 
+#include <asm/csr.h>
 #include <asm/early_printk.h>
+#include <asm/traps.h>
 
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
@@ -11,6 +13,8 @@ void __init noreturn start_xen(void)
 {
     early_printk("Hello from C env\n");
 
+    trap_init();
+
     for ( ;; )
         asm volatile ("wfi");
 
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index f2a1e1ffcf..31ed63e3c1 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -11,6 +11,13 @@
 #include <xen/errno.h>
 #include <xen/lib.h>
 
+void trap_init(void)
+{
+    unsigned long addr = (unsigned long)&handle_trap;
+
+    csr_write(CSR_STVEC, addr);
+}
+
 static const char *decode_trap_cause(unsigned long cause)
 {
     static const char *const trap_causes[] = {
-- 
2.39.0



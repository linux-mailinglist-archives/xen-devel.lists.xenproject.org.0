Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C79A9662A64
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 16:47:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473749.734519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEuMf-0002FT-O3; Mon, 09 Jan 2023 15:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473749.734519; Mon, 09 Jan 2023 15:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEuMf-0002CK-L2; Mon, 09 Jan 2023 15:47:09 +0000
Received: by outflank-mailman (input) for mailman id 473749;
 Mon, 09 Jan 2023 15:47:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GnCm=5G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pEuMd-0001Ok-W7
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 15:47:08 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de4035cc-9034-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 16:47:05 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id gh17so21186770ejb.6
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 07:47:06 -0800 (PST)
Received: from 2a02.2378.102e.bce5.ip.kyivstar.net
 ([2a02:2378:102e:bce5:dfc0:9312:b994:6b21])
 by smtp.gmail.com with ESMTPSA id
 22-20020a170906311600b0082535e2da13sm3851561ejx.6.2023.01.09.07.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 07:47:05 -0800 (PST)
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
X-Inumbo-ID: de4035cc-9034-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4pVVB8xi310OysZICNFUHzxHNt1nf/1tEIawtEgWpc=;
        b=kNznxBbLQ/4OzsvHOcyh305lnTxgPvZLv3vD3O3+3t2rvt6aQlK2jR9FWI/YWgccMR
         VnOLnSUqE5mRKfrWnTx5LnR/uY5RTG19nJbjQfeRGpP0HroB+cNeuq8kvYvuzNEfB6Y7
         LZeBtMr4+OT/q2y9RcYnguf9AzjQTdSysXaxgLNDRiMHDFCmdoBu6CX3Wdx0bxeknvRh
         514Z27ruElHq0nZnD8Pjg8TwsRlmHZzzJq4Nz7TqjZixZRCcEg7ywvHVv1ofF6s/ImLU
         c+3L4nvMpi46mwBb/xzHI7WBKmzYuKFltG4gvld1iYtB+M7EE/5rMUt5glnSFpteonxa
         mjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4pVVB8xi310OysZICNFUHzxHNt1nf/1tEIawtEgWpc=;
        b=ypIV5VZkjbRbd6nY6erMjqjPBMsfvBzBnPeyzvti10vbBJLwmOk/zVd/Wg4KRLD9mG
         BCRvQ3Kuz1iDtcgvlpkfwWNzO3irgTAPT+1w+AkdQIJEV+fZRGha9z1z+pyGJTvI3buZ
         Lo1E1WgcfOB4NAmDV6UmrAMPWesXyIjIJ340S46tNwBMtew6rC2TDFNcR3HSbO5C1H7t
         1+CGFfWl3OGcN0NDT5s9wbFwGGjPRTi08LsNRtuxzLf529CCOM8c+6NJll9qipwm5bie
         hFYGPaXaQjCDOh/erx348I5nebmIgK3Ye6qv3nm1yTl+3nqyNfmE4wC7DFyPiEmcg0q0
         yXxg==
X-Gm-Message-State: AFqh2kpvM/1U/h//2TsdLUtO3mcgpfQ/4Zp5f+C/EtN+GnmNcsAHgPUO
	QueGCrR40cOxKUeXZ8x7QjBoSmYujhaIOg==
X-Google-Smtp-Source: AMrXdXt8ZBw2EErZkpU2Gr1NDyBk7nJqtVGI5o2yHEP4kiLKvjxrGf5Shm7rPDwNPBmK4Z4OloPCAQ==
X-Received: by 2002:a17:907:d604:b0:7ad:d62d:9d31 with SMTP id wd4-20020a170907d60400b007add62d9d31mr58787345ejc.67.1673279225854;
        Mon, 09 Jan 2023 07:47:05 -0800 (PST)
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
Subject: [PATCH v2 3/8] xen/riscv: introduce stack stuff
Date: Mon,  9 Jan 2023 17:46:50 +0200
Message-Id: <b253e61bebbc029c94b89389d81643f9587200b7.1673278109.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673278109.git.oleksii.kurochko@gmail.com>
References: <cover.1673278109.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces and sets up a stack in order to go to C environment

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
    - introduce STACK_SIZE define.
    - use consistent padding between instruction mnemonic and operand(s)
---
 xen/arch/riscv/Makefile             | 1 +
 xen/arch/riscv/include/asm/config.h | 2 ++
 xen/arch/riscv/riscv64/head.S       | 8 +++++++-
 xen/arch/riscv/setup.c              | 6 ++++++
 4 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/riscv/setup.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 248f2cbb3e..5a67a3f493 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_RISCV_64) += riscv64/
+obj-y += setup.o
 
 $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $< $@
diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 0370f865f3..bdd2237f01 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -43,6 +43,8 @@
 
 #define SMP_CACHE_BYTES (1 << 6)
 
+#define STACK_SIZE (PAGE_SIZE)
+
 #endif /* __RISCV_CONFIG_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 990edb70a0..c1f33a1934 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -1,4 +1,10 @@
         .section .text.header, "ax", %progbits
 
 ENTRY(start)
-        j  start
+        la      sp, cpu0_boot_stack
+        li      t0, STACK_SIZE
+        add     sp, sp, t0
+
+_start_hang:
+        wfi
+        j       _start_hang
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
new file mode 100644
index 0000000000..41ef4912bd
--- /dev/null
+++ b/xen/arch/riscv/setup.c
@@ -0,0 +1,6 @@
+#include <xen/init.h>
+#include <xen/compile.h>
+
+/* Xen stack for bringing up the first CPU. */
+unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
+    __aligned(STACK_SIZE);
-- 
2.38.1



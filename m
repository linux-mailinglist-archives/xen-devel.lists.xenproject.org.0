Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E93664460
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 16:18:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474744.736088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFGOA-00062Z-R7; Tue, 10 Jan 2023 15:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474744.736088; Tue, 10 Jan 2023 15:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFGOA-0005z7-MR; Tue, 10 Jan 2023 15:18:10 +0000
Received: by outflank-mailman (input) for mailman id 474744;
 Tue, 10 Jan 2023 15:18:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ek+I=5H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pFGO8-0005G6-L7
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 15:18:08 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc4704db-90f9-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 16:18:07 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id bt23so18918759lfb.5
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jan 2023 07:18:07 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 y19-20020a0565123f1300b00498fc3d4cfdsm2203396lfa.189.2023.01.10.07.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 07:18:06 -0800 (PST)
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
X-Inumbo-ID: fc4704db-90f9-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k39j5USYdhYFET9upYnjISkYGgRbZovPpm53v/syNJU=;
        b=K0+5gplvcbHPCg9qsE3dFmBBiOcnrjo7e6fXQMSMTGWGGAkkmvAC0kMBUKdVS2/g/U
         odrC33pI1EF18bSUdwqhQKOffPEh/O4yIR5P8EOrxbxTeK/jDhC8EqSvgqu6kuQaeke5
         14M5BY4Pmc4xSv3ceefcgEzduhQHIbbd9E7WXat//1mle4drpoRcN9dj3077OkcNEQPo
         6fYJyXpFSwlGVYBmZLNwdLk6u9Pzlr0YpLMtwxwQOjvBqI+HkfJ8Q9oFx1gH/PFUqRwP
         xhYSl/sWvt8fli6ksgToIm3RPkCvqF47ovfn/wqXcCfP0GQjsHG2UwzEWzxmH1orYIRo
         EnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k39j5USYdhYFET9upYnjISkYGgRbZovPpm53v/syNJU=;
        b=mP7fzz2MW/qWLlpjwZjRhZhmXMWDprpLQehnlXc6czbdVBoRnO0DRGlyhPe+BjbuVj
         0F6LUDUWb8wCFX6sN/dVeQtbPWrvnHqTm5RgAg/MvJjzA0TWJjQGks7hys6vU9AVIGam
         JLVrEvFvB8POwgOp0u8hJcA7i7oT/uhLRPlcH3q/zjNhGYxDhs6j2Nqi/p37Quncp7Bh
         +pa9Z3NeO0qt5M/jQyXKC4rd88DKRmTD/MrWDs/db+fSzaKHXemT793NQXIATUmIdu23
         Fh04BPUtyaLxEFDcVKL5JezKk2GA5VvjSDeU8hRrNtVwlOmEAws63jY1xbRUPa8dQPQC
         LmqA==
X-Gm-Message-State: AFqh2ko2X7k5DRI2zeWRRpebcawh/xYKCrVRhzaWfnpX/Sq/V9jNdnBY
	x5Szv3+MhWSjrjWFnpErV1kStT/gxmThqIFU
X-Google-Smtp-Source: AMrXdXv0v/qAB6MI2pI2Ns3onWDvlHjYdHBeV1ydTInGa27X5jo6bnrF+YFaC+5dYBGgv/vaRENlvA==
X-Received: by 2002:ac2:446b:0:b0:4b5:8504:feea with SMTP id y11-20020ac2446b000000b004b58504feeamr16675149lfl.24.1673363886777;
        Tue, 10 Jan 2023 07:18:06 -0800 (PST)
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
Subject: [PATCH v3 3/6] xen/riscv: introduce stack stuff
Date: Tue, 10 Jan 2023 17:17:56 +0200
Message-Id: <7d89e3811e6ea4f307862d6552ad7c7e58176518.1673362493.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673362493.git.oleksii.kurochko@gmail.com>
References: <cover.1673362493.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces and sets up a stack in order to go to C environment

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
    - reorder headers in alphabetical order
    - merge changes related to start_xen() function from "[PATCH v2 7/8]
      xen/riscv: print hello message from C env" to this patch
    - remove unneeded parentheses in definition of STACK_SIZE
---
Changes in V2:
    - introduce STACK_SIZE define.
    - use consistent padding between instruction mnemonic and operand(s)
---
 xen/arch/riscv/Makefile             |  1 +
 xen/arch/riscv/include/asm/config.h |  2 ++
 xen/arch/riscv/riscv64/head.S       |  6 +++++-
 xen/arch/riscv/setup.c              | 14 ++++++++++++++
 4 files changed, 22 insertions(+), 1 deletion(-)
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
index 0370f865f3..763a922a04 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -43,6 +43,8 @@
 
 #define SMP_CACHE_BYTES (1 << 6)
 
+#define STACK_SIZE PAGE_SIZE
+
 #endif /* __RISCV_CONFIG_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 990edb70a0..d444dd8aad 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -1,4 +1,8 @@
         .section .text.header, "ax", %progbits
 
 ENTRY(start)
-        j  start
+        la      sp, cpu0_boot_stack
+        li      t0, STACK_SIZE
+        add     sp, sp, t0
+
+        tail    start_xen
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
new file mode 100644
index 0000000000..13e24e2fe1
--- /dev/null
+++ b/xen/arch/riscv/setup.c
@@ -0,0 +1,14 @@
+#include <xen/compile.h>
+#include <xen/init.h>
+
+/* Xen stack for bringing up the first CPU. */
+unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
+    __aligned(STACK_SIZE);
+
+void __init noreturn start_xen(void)
+{
+    for ( ;; )
+        asm volatile ("wfi");
+
+    unreachable();
+}
-- 
2.38.1



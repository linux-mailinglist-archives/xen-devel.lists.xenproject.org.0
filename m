Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C806F71492A
	for <lists+xen-devel@lfdr.de>; Mon, 29 May 2023 14:14:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540609.842513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3bkj-0006mC-4n; Mon, 29 May 2023 12:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540609.842513; Mon, 29 May 2023 12:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3bki-0006hQ-VV; Mon, 29 May 2023 12:13:32 +0000
Received: by outflank-mailman (input) for mailman id 540609;
 Mon, 29 May 2023 12:13:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi1m=BS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q3bkh-0005DI-6A
 for xen-devel@lists.xenproject.org; Mon, 29 May 2023 12:13:31 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 388e07b9-fe1a-11ed-8611-37d641c3527e;
 Mon, 29 May 2023 14:13:29 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2af2451b3f1so33742581fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 May 2023 05:13:29 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z14-20020a2e964e000000b002ac87c15fd4sm2427762ljh.95.2023.05.29.05.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 05:13:27 -0700 (PDT)
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
X-Inumbo-ID: 388e07b9-fe1a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685362408; x=1687954408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YD5229mDIwkWy00dCe850+V9AEq/Mk9/bgvE344cjU=;
        b=TpzCdOknut6VDyJFWFVTwZjazt6GcrLBoZXZ77wvjfK4aVJ5kE1OhaT/+bJRKu25lt
         bdw4Nb3uqgPY83iObryh3p/gGP4Os9mAGLnnl5ervnCbr6/qJRUG1t/N4yc8itMRwU4Q
         Lj7wRdGPYIG1TBcvsjxpiZz1Z5WZ/SLmVfiiBtgEls4/1P3+aMC3fTp9bRw28egIj0Jz
         9V5iEcUY8G1zFevbcjIOqg98oPWPndMJwFpb0wNe+Mchw1ozKddBN4xW+3T25DkjaWkT
         s7C3vlqEE3n5b9YpR85vs4yrfFLXk39ReBBckDHC51g05h3khQjs6sB1mrr9BFhte+Ut
         PIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685362408; x=1687954408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0YD5229mDIwkWy00dCe850+V9AEq/Mk9/bgvE344cjU=;
        b=dm7sjlYwyF25vm7D/+SlDze8+NkcSGpZNNwZXxlWnx5USuA7gaDfS9dCrxHzArw4CJ
         3qlbz4rCNoPbibzaRRyOswgnzr9VomVzj1Ft/qAB6cnBO25nUNzq4NEmLSnd1RALu8aW
         gBvmSMLPb5xYqRo2Kpfu4r1+vLppb62WB51W/ZWRGWfyeGYxW4gOP3RWHgQDcU/+2o9k
         kiyB60B7Aq7cf/bHjN6l+0wzzkOQ9b6qJtQUKdBbAO2CUxB2QLi19RsrMkh0lgkVinor
         2qQJsRA8DCtD+CGSRmHvNVpTjn2C88sda37bHFCiHZ8q+b3zu7Yg2HAsjHlbj7aVQbd6
         h3Kg==
X-Gm-Message-State: AC+VfDyocQaQ8DLuFWSIusjSK0PjD6XUQ8pyZllhC0lfTAlvx9bYkua7
	hYOL/S40GvPbBeqlF3/q1jqqT2KdIhE=
X-Google-Smtp-Source: ACHHUZ7qWlQ0izumLBrxWGN4a1dMw2W/W9ZTX1VBQsZPtZd6SyEXM+BC9wFxToGEYSGFFfxny5MvVA==
X-Received: by 2002:a2e:2416:0:b0:2a8:ad36:f8ca with SMTP id k22-20020a2e2416000000b002a8ad36f8camr4249022ljk.14.1685362408351;
        Mon, 29 May 2023 05:13:28 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v6 6/6] xen/riscv: test basic handling stuff
Date: Mon, 29 May 2023 15:13:19 +0300
Message-Id: <90e4f333ded1a18e5c0e0b389580ed5d25e0272a.1685359848.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1685359848.git.oleksii.kurochko@gmail.com>
References: <cover.1685359848.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V6:
  - Nothing changed
---
Changes in V5:
  - Nothing changed
---
Changes in V4:
  - Add Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V3:
  - Nothing changed
---
Changes in V2:
  - Nothing changed
---
 xen/arch/riscv/setup.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 1cae0e5ccc..481d88249d 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,3 +1,4 @@
+#include <xen/bug.h>
 #include <xen/compile.h>
 #include <xen/init.h>
 
@@ -9,6 +10,20 @@
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
     __aligned(STACK_SIZE);
 
+static void test_run_in_exception(struct cpu_user_regs *regs)
+{
+    early_printk("If you see this message, ");
+    early_printk("run_in_exception_handler is most likely working\n");
+}
+
+static void test_macros_from_bug_h(void)
+{
+    run_in_exception_handler(test_run_in_exception);
+    WARN();
+    early_printk("If you see this message, ");
+    early_printk("WARN is most likely working\n");
+}
+
 void __init noreturn start_xen(unsigned long bootcpu_id,
                                paddr_t dtb_addr)
 {
@@ -28,6 +43,8 @@ void __init noreturn cont_after_mmu_is_enabled(void)
 {
     trap_init();
 
+    test_macros_from_bug_h();
+
     early_printk("All set up\n");
 
     for ( ;; )
-- 
2.40.1



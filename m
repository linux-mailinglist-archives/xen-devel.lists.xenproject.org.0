Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839557791F2
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 16:33:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582507.912346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUTCL-00067G-PQ; Fri, 11 Aug 2023 14:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582507.912346; Fri, 11 Aug 2023 14:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUTCL-00063x-Lo; Fri, 11 Aug 2023 14:33:05 +0000
Received: by outflank-mailman (input) for mailman id 582507;
 Fri, 11 Aug 2023 14:33:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zNma=D4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qUTCJ-0004v5-Us
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 14:33:03 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9bcacf7-3853-11ee-8613-37d641c3527e;
 Fri, 11 Aug 2023 16:33:01 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fe4f5290daso3197740e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Aug 2023 07:33:02 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 q2-20020ac25a02000000b004fe07f06337sm753453lfn.53.2023.08.11.07.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 07:33:01 -0700 (PDT)
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
X-Inumbo-ID: f9bcacf7-3853-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691764382; x=1692369182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFpMwQTvtWnzo8KwJdfRA9hSdfLNtSc3JC0W+s/e69Y=;
        b=P5p5421NCrEG8Ee6OjVvEtTzJqh/gZr4I11F/MVRGw8mylTa77oLnjMUivSurxOrm8
         kT0ZVuSdvBJwvF2rlVH5af9eQ6yYJqSeBkz+3Icxk9m3BjRV7TtlfpwK0UDA9dxw5yIc
         e1tFzdOx1oHhkmGSKU82xA1qfYNZxO+Tl0zsLAEI1sPphlXMout0wEXYInSp9p+T8Z27
         7WyStY3dW05+tRPeHp4HOB4YHsrb+OKa8n0GE2Gjwx7Gt2q10l6FBruaSaX+lv7RYyZe
         wUOZ6Zo2VUI/yD2PjkmRGLiTxVw7D48tdFcNLX/tYSQmKSC/vmK6s8gCJdtEqI2bXW2y
         4eXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691764382; x=1692369182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFpMwQTvtWnzo8KwJdfRA9hSdfLNtSc3JC0W+s/e69Y=;
        b=DcB+yDbDSF5/7i012olUijniCxstOR83N6qLsGp4/0ZAXykwRSsY4jopPfRvZPYOJS
         E6KYX99MKW83jm5ynfASoaizA7tJR7hmthRMQ4Yt2A32mQCa3dQRtlxet1IEnVF7RW6X
         BRm9uIz/N7saEZwIaSdP59Q2eic2ihFA1aTsVWnCRRQe/xqd1SbEVOI+37Sri57XHwyy
         he40WxapkySc/PQ+oBCE6buQyPmHB6M4kGYJvw9O/vjBcRd7Mg1iDqqqchxeMmVO2yWq
         RU4e9qodURbrs57Sc8O/5x5ZE8g6zB1FwJHfhw52VbzAhKgXuKKHaA5fZxe+zQY1EqWj
         jQQg==
X-Gm-Message-State: AOJu0YwRwZTjdaELR0clmiZed3dXjOS86yrWXOROCxBYia/ydVWmLaNE
	7/06096xX6g5RJlftUX7lmNJD6VkT/Q=
X-Google-Smtp-Source: AGHT+IG6Q6Ixn2L8rvE0G3xiM07jPib5otv7nMk8wxhac8f6YUd0iuw91E+NK5WgQy510PAzqLGYqw==
X-Received: by 2002:a05:6512:3d1d:b0:4f9:607a:6508 with SMTP id d29-20020a0565123d1d00b004f9607a6508mr1707605lfv.50.1691764381583;
        Fri, 11 Aug 2023 07:33:01 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v8 6/6] xen/riscv: test basic handling stuff
Date: Fri, 11 Aug 2023 17:32:55 +0300
Message-ID: <557ee932891edcfd189dfee006317094a9144f10.1691763757.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1691763757.git.oleksii.kurochko@gmail.com>
References: <cover.1691763757.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V8:
  - Nothing changed. Only rebase.
---
Changes in V6:
  - Nothing changed. Only rebase.
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
index abdd1669c6..ab83f84e67 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/bug.h>
 #include <xen/compile.h>
 #include <xen/init.h>
 
@@ -11,6 +12,20 @@
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
@@ -18,6 +33,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     trap_init();
 
+    test_macros_from_bug_h();
+
     early_printk("Hello from C env\n");
 
     early_printk("All set up\n");
-- 
2.41.0



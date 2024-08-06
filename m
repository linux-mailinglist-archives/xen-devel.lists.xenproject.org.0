Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A1F9495AA
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 18:38:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772987.1183450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbNCA-0000op-HH; Tue, 06 Aug 2024 16:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772987.1183450; Tue, 06 Aug 2024 16:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbNCA-0000n2-Ec; Tue, 06 Aug 2024 16:37:58 +0000
Received: by outflank-mailman (input) for mailman id 772987;
 Tue, 06 Aug 2024 16:37:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPS5=PF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sbNC8-0000K5-Uj
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 16:37:56 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b4ba3c8-5412-11ef-8776-851b0ebba9a2;
 Tue, 06 Aug 2024 18:37:55 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5a15692b6f6so1252416a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2024 09:37:55 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b839708c56sm6130442a12.2.2024.08.06.09.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 09:37:54 -0700 (PDT)
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
X-Inumbo-ID: 3b4ba3c8-5412-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722962274; x=1723567074; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/Zbn2a14GKs5tYnWS9wWhluQiN5HzX568Es6OXBxYc=;
        b=JauJaSg0YE2usxOhzKLqHnmdiqeB3HrrvOtlMVG36qmJgZwDFgWuDXzYsvlPdk4aNO
         bDmAXtRH0ck8WDOM284KPcKhmivSUAMNznXMO+jActgavG0dWjtbQrJI87XbWwQn4Qd6
         c1BtDZ5VgbY4rSLnMCQulVYlb0kvv2ichgv63ocO8mVsamHu4ZHedlIYXcgL0CCLN7Qw
         ALxtOY/D0zieUgODlFmXIB8m+/zW1109FOlrrTcDXwLpVtfyj0nU/di6/AqdRbNNXCVf
         Qs1wn4fQF2FszRMhS368nHA//pGpXYS4IuNN1agXTvgWneMxN0F7zrWBSHKk7M5bpSV6
         LU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722962274; x=1723567074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/Zbn2a14GKs5tYnWS9wWhluQiN5HzX568Es6OXBxYc=;
        b=HeJT7TtbT7ZSZQvyYZi8Zsc4q6d+1C31ipQavWknjoJ0+cnFtvzDJG8I+0HcLQ3Fx8
         Cp2bHths0IN/gL32iMMz5QpOyzQVR9qdlUiTv4lTxHYlpRNXlqNWwfVC0w1P3Bg/q2WQ
         /JRTFVTcdNz2t5mOTFlMCO9PEtq+ZktECYwIlJYID2VMWD43fuvWPX3qEzIixRVUkpBo
         +8dxPQE+68QtpTC0ioLs7/kzn42dBfhX6sqNBBFhQvnxOkpU36HmgTpGreWHF7AYOjoF
         0rJdCN2lTBO8e8KAtUiUa7ZbYCncCLD13v42hJzQcRFwOXU0lhXBBMerGT6scBOaMSTn
         GHJg==
X-Gm-Message-State: AOJu0Yweuff049nLvQnOxNM1qgHqYFIiqZGdFdOycqHQApFP2ClaknDt
	6dZPIJJmQ2QeFkYE57F9/rWXQLlA59O6Kv3tqucrrDrwyktmkR6h/JXusw==
X-Google-Smtp-Source: AGHT+IFJNqSE4REWswtsQjnFc/RMGzrgjPXR54oSr80O8g7PxeOx279jo2TGDHO/Ag890La0nFFmaw==
X-Received: by 2002:a05:6402:457:b0:59e:b95d:e769 with SMTP id 4fb4d7f45d1cf-5b7f36f3fdamr12422813a12.5.1722962274383;
        Tue, 06 Aug 2024 09:37:54 -0700 (PDT)
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
Subject: [PATCH v13 2/2] xen/riscv: test basic exception handling stuff
Date: Tue,  6 Aug 2024 18:37:50 +0200
Message-ID: <bd9ecafdd545009cebd8b7aa8a14a21325b35c0d.1722960083.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722960083.git.oleksii.kurochko@gmail.com>
References: <cover.1722960083.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce testing for macros in <xen/bug.h>

Wrap the testing in the SELF_TESTS configuration to avoid log
noise related to functionality testing
(specifically, macros from <xen/bug.h>) when CONFIG_SELF_TESTS
is disabled.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V13:
 - update the commit message.
---
Changes in V12:
 - Notrhing changed. Only rebase.
---
Changes in V11:
 - update the commit message.
---
Changes in V10:
 - wrap test_macros_from_bug_h() under "#ifdef CONFIG_SELF_TESTS"
 - update the commit title to: "xen/riscv: test basic exception handling stuff"
---
Changes in V9:
  - s/early_printk/printk as common code is now available
---
Changes in V5-V8:
  - Nothing changed. Only rebase.
---
Changes in V4:
  - Add Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V2-V3:
  - Nothing changed
---
 xen/arch/riscv/setup.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index a6a29a1508..4defad68f4 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -19,6 +19,22 @@ void arch_get_xen_caps(xen_capabilities_info_t *info)
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
     __aligned(STACK_SIZE);
 
+#ifdef CONFIG_SELF_TESTS
+static void test_run_in_exception(const struct cpu_user_regs *regs)
+{
+    printk("If you see this message, ");
+    printk("run_in_exception_handler is most likely working\n");
+}
+
+static void test_macros_from_bug_h(void)
+{
+    run_in_exception_handler(test_run_in_exception);
+    WARN();
+    printk("If you see this message, ");
+    printk("WARN is most likely working\n");
+}
+#endif
+
 void __init noreturn start_xen(unsigned long bootcpu_id,
                                paddr_t dtb_addr)
 {
@@ -26,6 +42,10 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     trap_init();
 
+#ifdef CONFIG_SELF_TESTS
+    test_macros_from_bug_h();
+#endif
+
     printk("All set up\n");
 
     for ( ;; )
-- 
2.45.2



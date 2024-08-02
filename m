Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5763945EE9
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 15:54:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771220.1181808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZsja-0003XR-8E; Fri, 02 Aug 2024 13:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771220.1181808; Fri, 02 Aug 2024 13:54:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZsja-0003Pn-3k; Fri, 02 Aug 2024 13:54:18 +0000
Received: by outflank-mailman (input) for mailman id 771220;
 Fri, 02 Aug 2024 13:54:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=14L3=PB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sZsjZ-00036y-6F
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 13:54:17 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b473272c-50d6-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 15:54:15 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ef2cce8be8so101593261fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 06:54:15 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f15e1ae4easm1684271fa.43.2024.08.02.06.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 06:54:13 -0700 (PDT)
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
X-Inumbo-ID: b473272c-50d6-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722606854; x=1723211654; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIOcN4PHeriEnZEntkfGwdQOvLPTgN17YwTpAAoCcJk=;
        b=Nv0ZTqmwLLUqoDpTMXFSV94/6g8FuGWi7+eOUz4aKaKCBdayDXWuk5X3sMRkRpymco
         +5ikDiWC8pCIAQR78nXK3uKrMrf6yV9vBd/wCpLS08+ogC0u+8HCpPf+KXVlD6XEiLLH
         88mqYOMYOSTEiahbrBfJGVN2u6Ea+5IUbNnHH9RDBMKfgC2tG0y/uhkWvCbg2v2TC2nL
         kLPe3EtYpYgOoOg0HjAcx5fp8lIAAKiE+Rk9DOkLIzsQH3QsHyI4gUKYj0LoG4TxYSzB
         Y5DRyq+frqMCe83pT6pGT3asv5vijmt1MkyeQ8R/MiQp4wTc6DGCclC8iN8MiXVswK7E
         GCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722606854; x=1723211654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wIOcN4PHeriEnZEntkfGwdQOvLPTgN17YwTpAAoCcJk=;
        b=N6eIBHJLjX0Ne581M8NRttPAsxnoKR+ZaSgi56VhjbER5TJitdLl4D2cj42KlhVUdA
         S5p7hOA8e36T0yKCVe+ujeDJobMehQdCY6N8dYqY29n5Orwa/6jF/XN91R4KUxbY8RM8
         Qpe1ozFBIvaw6RCzZGbL98I9skyVFULZSzmDLoCoEp5NyNEkZ+rG4aD23ucEDTbv33D2
         dWK9TwnqbWUh0zoh7liuaU+JhWB1k4ZiNxPB+RBMj6Pf1DMkuOtFTAWwAgfuuy1IqXlG
         wznComm84b2DDf00hZQqaoUN/97INKJm+/FA4tIT6eZAdDAKqje7h8V7pCbipdexskqZ
         P9cg==
X-Gm-Message-State: AOJu0YwgiOLn15QOuI9bfquPQa7Wbd2Npou6jKcYQIKVe/nYc8xpaCvj
	9YyDq0fa0gUr2yWpHZkhS+ZdT7Xy8hfjHmMSUDLs71gY0l/fN3sGryB2Aw==
X-Google-Smtp-Source: AGHT+IEANmQhPUVt4MoYximYaBpIi4QWwle/e/k966V3fREoWHOCp71fE3RGalCYB+bkOiMMtOb0uA==
X-Received: by 2002:a2e:884e:0:b0:2ef:2580:c0c6 with SMTP id 38308e7fff4ca-2f15aa9a091mr27091761fa.14.1722606854199;
        Fri, 02 Aug 2024 06:54:14 -0700 (PDT)
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
Subject: [PATCH v12 2/3] xen/riscv: test basic exception handling stuff
Date: Fri,  2 Aug 2024 15:54:08 +0200
Message-ID: <d76cb965066a9fb5ca23294777cbfb6d97c19099.1722605952.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722605952.git.oleksii.kurochko@gmail.com>
References: <cover.1722605952.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduces testing of some macros from <xen/bug.h>.

Also wraps this testing into SELF_TESTS config to not produce
a noise in the log related to functionality testing ( in the
current case, it is macros from xen/bug.h ) when CONFIG_SELF_TESTS
is disabled.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
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



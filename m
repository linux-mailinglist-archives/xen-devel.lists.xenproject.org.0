Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE7C93B3AF
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 17:32:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764287.1174700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWdxj-0006cp-2L; Wed, 24 Jul 2024 15:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764287.1174700; Wed, 24 Jul 2024 15:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWdxi-0006aS-Ux; Wed, 24 Jul 2024 15:31:30 +0000
Received: by outflank-mailman (input) for mailman id 764287;
 Wed, 24 Jul 2024 15:31:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fJNX=OY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWdxg-0005Od-Vc
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 15:31:28 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca1b5c54-49d1-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 17:31:26 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ee910d6a9eso10077391fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 08:31:26 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ef26f1bc4asm14240491fa.40.2024.07.24.08.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 08:31:24 -0700 (PDT)
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
X-Inumbo-ID: ca1b5c54-49d1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721835085; x=1722439885; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4O/hwQwHF6rfJLVATnZjtAz9ttGqfT93bsxm/gvlyso=;
        b=Fx02EhSWbV36Y2XPEQJhk4I3PD1/abDRG4Axwf3C9J3R/UkDK8tM/L+K3sUM/qJnoj
         2cYjw9B0lFsfi6HHaSccH8iJPwnHGFfInCHQjXcV6QECpZcCXeOC6Yu79HiUEU/6V0zz
         InFMCYbtJo8u9E1MjZ6BYIXxZ9CxbEhDuZlj18yxZowyrvUzuUBWzVR6jWBVINSCa6jM
         ORjmyMccpUlUmVMFtOQOZQJm2wNE/QwtCcWr+z8UseqSSXNuSYkte8/K6kelchcMIAED
         eWOAht0WGh0PJ0N2mY2hMfj+vRB3GH75JIz8B8ZPSiUdIa85hyxt+kTK1QZYCNriU10U
         ecww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721835085; x=1722439885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4O/hwQwHF6rfJLVATnZjtAz9ttGqfT93bsxm/gvlyso=;
        b=f99J9Kf15C1th2Qn3XXy0rtTCxAWAPYcCD6B3WyjnTQqlhbdAp6bUppC8J3goWHNWp
         BtBlIRV9e5UItRUZ5rtVZ7d0/S1CHFZkyKk/UU3fSl4MeT2DN0IEnIYr4qOFmodyqT6q
         ZbgQPJI5bneRzMp3zMX+1diU3jEZ3YFZ/mRB547yuqjKSNow2Lo1PzE12yhu9dJoQqQJ
         2/++dH0GnL/RmMnAtiOBO/Lhb+RdygL4FXWmoZYw/8krYtHYc8Js1lRMJPWLmr+xA1VX
         t7tCNUj47xzUkaORzIeR0j9KZsvi5AbBmGY8goUq2TdOCRxTi+9XLzt6HLb9SwJ7l6kd
         tz8w==
X-Gm-Message-State: AOJu0YyHQZ4ecA450fmPIePkzd6G5ZqePwoESKD8GAnfMS1quueliCfp
	x8SUNLMzPa9fCDbk+yJTPus49+FpfsuPbm3+VKJ8y76J/QKjO4wXuAbNrRxN
X-Google-Smtp-Source: AGHT+IFwW9NRyjYW7BQrQYvv6ZlUZAHMK5dZdh4otNlSjFLdBd76AEtDTO4J0u1G65gJH33NGBAHAg==
X-Received: by 2002:a2e:a4cd:0:b0:2ee:7c35:d892 with SMTP id 38308e7fff4ca-2f032d43da6mr6452101fa.17.1721835085036;
        Wed, 24 Jul 2024 08:31:25 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v11 5/5] xen/riscv: test basic exception handling stuff
Date: Wed, 24 Jul 2024 17:31:19 +0200
Message-ID: <c407999ca7a7fb2772cfa8ea4b9b312cf4366c4d.1721731887.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721731887.git.oleksii.kurochko@gmail.com>
References: <cover.1721731887.git.oleksii.kurochko@gmail.com>
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



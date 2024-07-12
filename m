Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E01D92FE58
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 18:19:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758150.1167514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSIzA-0005By-Ph; Fri, 12 Jul 2024 16:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758150.1167514; Fri, 12 Jul 2024 16:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSIzA-00059M-K9; Fri, 12 Jul 2024 16:19:04 +0000
Received: by outflank-mailman (input) for mailman id 758150;
 Fri, 12 Jul 2024 16:19:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Ov5=OM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sSIz9-00040X-Cw
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 16:19:03 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 735fa3bc-406a-11ef-8776-851b0ebba9a2;
 Fri, 12 Jul 2024 18:19:01 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-57cf8880f95so2742624a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 09:19:01 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bb9604f7sm4669169a12.15.2024.07.12.09.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 09:19:00 -0700 (PDT)
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
X-Inumbo-ID: 735fa3bc-406a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720801141; x=1721405941; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzcJTvhB72zFgLJxMtKt5ug3KrGpNPrgBrt3gVVkNwk=;
        b=UhqBj/IRC72ZvK1Ztt8doi9NeFNUeYS98PlZ8Hf6Poo+QZ9ctfk83AGU8J+8Gn88uV
         0+rqfjnI9gqKwL+wlqCTUR/dn0laMLBNuoqAHRbIENBK4X5aTBB/zWti6TBN19CGEckt
         igyaHVTkvuGN3QFfPo6Y7x2PBBAyuCL0U6uGoUD1tRQfxJKkY66RloD1PTUg0dh0e1ap
         sUcnesfWoGYiVZQUpq02f24bnYMP9dl6pJPJi5+FGeMw4c7T6Ow34kVqU1Po75QhxadN
         Baph5uH1bVQjThqjci7R/LRG+05+IRuk+oXu/GpgivtGZlG5e+YK5McyJS0HCmZDCwUV
         sYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720801141; x=1721405941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzcJTvhB72zFgLJxMtKt5ug3KrGpNPrgBrt3gVVkNwk=;
        b=o/vS0Tvnrz0sBeTEgy8XoyoOSYcyfq0OEDqPW/umqZvxODqUEG3+sr7mAYgu6yBL94
         5PTLHkkOoSBWjjUFxPLpX9hipGAEnAxY3RvVJcLF0MpHsxJG4623qVe6BrG/cODTzYL3
         gFXcOy4dNH7fXgrZjtUP3qyy49IHTL6GQB85m5sktoeLwtGgBJ7ol9l1rcBPuWzzpXlC
         ZFFl2ab7VrfzJKXugj8eFQ4OsJEANDGfvolTCj4VjXXnWoxRMrJZPYp7s9vg27gBDkB+
         6OrHOiVx3SEoOXREWLaeGQRljTVlbLwIColc5X3C8vZnNl991T0fVBZGBUtC9bb64Xus
         QmiA==
X-Gm-Message-State: AOJu0YzLd9uF/d6iYZlLVyEOw6t6aG+yqU4n5wiIVFoTOwhd8/ahT/Ux
	E3NstFmXRL1uZOiRFADXgRRpo6vymTdrz2kwOva7O2Yl7sikA42TT2btmMWc
X-Google-Smtp-Source: AGHT+IGPk9Dj8IhkgQmwNMU228dzBkvUapztG9fYL4a5yBBNhHL8kZxeHuVtgxzxK5Q9AvEqbtZSlA==
X-Received: by 2002:a05:6402:33d5:b0:57d:3ea:3862 with SMTP id 4fb4d7f45d1cf-594bc7c9133mr7535849a12.27.1720801141130;
        Fri, 12 Jul 2024 09:19:01 -0700 (PDT)
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
Subject: [PATCH v10 5/5] xen/riscv: test basic exception handling stuff
Date: Fri, 12 Jul 2024 18:18:54 +0200
Message-ID: <17ee34d97af4bebc87facf8576cee519ca26bf12.1720799487.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720799487.git.oleksii.kurochko@gmail.com>
References: <cover.1720799487.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V10:
 - wrap test_macros_from_bug_h() under "#ifdef CONFIG_SELF_TESTS"
 - update the commit title to: "xen/riscv: test basic exception handling stuff"
---
Changes in V9:
  - s/early_printk/printk as common code is now available
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



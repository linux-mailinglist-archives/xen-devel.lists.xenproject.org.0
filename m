Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F360393B3B1
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 17:32:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764284.1174662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWdxf-0005bb-TP; Wed, 24 Jul 2024 15:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764284.1174662; Wed, 24 Jul 2024 15:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWdxf-0005TO-NC; Wed, 24 Jul 2024 15:31:27 +0000
Received: by outflank-mailman (input) for mailman id 764284;
 Wed, 24 Jul 2024 15:31:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fJNX=OY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWdxe-0005Oj-Ab
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 15:31:26 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c94115f3-49d1-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 17:31:24 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2f035ae1083so7913341fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 08:31:24 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ef26f1bc4asm14240491fa.40.2024.07.24.08.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 08:31:23 -0700 (PDT)
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
X-Inumbo-ID: c94115f3-49d1-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721835084; x=1722439884; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVzv7Lf3WsrGUV8320pTvF4jrk7P38KxVVOYJq9PCXU=;
        b=jdnpYO8/Sl3NXW61FqfANxGv8Xk8Lt+Ba6u9PyyYbos8FMlEE/CjlyVK2a/PF9Ahg7
         eSQSIqDt0hJUfB2BrlNkxBq9q4YGfod4Ahfr4fxYZWF2u0KzfFsQDW/dzvTxEKkXlm80
         Bxrk8p/u3uk5CF6PKFoRkT80mQWTVpYbuBhQ9TJXKxMioec86yOZc3f0iZBhqbF2UIXO
         GuKY12WDFENnwJ67tj9LgLUXe9FGfJgNlbsO8fAM6zcjyN//7H8j9SZX7SexFaF10RZ3
         C2RXtmonO2UK1NsJiaHJ3S4hk59EyhEDq1pAknxieFgkPNn7x/DI6PkGDk8/+zF5biGc
         OvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721835084; x=1722439884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mVzv7Lf3WsrGUV8320pTvF4jrk7P38KxVVOYJq9PCXU=;
        b=NANxyPIVhHdt8coLIeDKkStZe5+9UDwdv/4k9w0UnUynNja0jRovaBlbek1/qLplkJ
         3+hXyTIdbe7O3hhVgPcIb68ytsKWZmZgJuhe1inHp0kEYlddeFEcLELSwoq4Qc6Ag4/5
         5rBpa8DW33ajF/Oy27DP0ZCd11rh5t/Ox/HIdgbfXORxyvOWwz6ndOyoc4td2S/OhCXD
         3NFCh5Nw3si6b5QHwGADKXGHB3/6OnmLp4vw1D92gq2J3BerJkwy3XRbhDxF2KfH8CqP
         rmsUZELmGnS+vh4gwgXLguZLc0zr3e2uokjn/I3aFZRcY5gA/i6BAYOIwFqA0QjI3dsx
         e88Q==
X-Gm-Message-State: AOJu0Yy2mVE8XzvNB7oVQ2H7FAj7ByoGBXBlMwH2agdAdJ1AIvSv8ttG
	22DQpk2QFryvkDDVrJzEhybVoUgStZ/Y1EnSD0RZj3yGkWQHhu7vhjdim462
X-Google-Smtp-Source: AGHT+IFTfVE2OSbKfPeAzMl0JaPOdVB8BEcT/RiMeGKr+zDRJDb13/LT83G1YiwAl8BTH0zdipBXBQ==
X-Received: by 2002:a2e:a4a3:0:b0:2ef:2e3f:35da with SMTP id 38308e7fff4ca-2f039dbfbf0mr1225811fa.45.1721835083784;
        Wed, 24 Jul 2024 08:31:23 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v11 3/5] xen/riscv: introduce trap_init()
Date: Wed, 24 Jul 2024 17:31:17 +0200
Message-ID: <e718fe9e83978efdd241d7c0d85d3644e030dd1e.1721731887.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721731887.git.oleksii.kurochko@gmail.com>
References: <cover.1721731887.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Note that trap_init() isn't declared with the __init attribute to
avoid removing __init when multi-CPU support for Xen is added.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V11:
  - update the commit message
  - add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V10:
  - update the commit message
---
Changes in V9:
 - drop inclusion of <asm/mm.h> in setup.c
 - drop #include <public/version.h>
 - ... <xen/bug.h>
 - introduce stub for
   void arch_get_xen_caps(xen_capabilities_info_t *info);

 - resolve rebase conflicts.
---
Changes in V8:
 - nothing changed. only rebase was done.
---
Changes in V7:
 - #define cast_to_bug_frame(addr) ((const struct bug_frame *)(addr)).
 - remove unnecessary comments in trap_init() function.
---
Changes in V6:
 - trap_init() is now called after enabling the MMU.
 - Add additional explanatory comments.
---
Changes in V5:
  - Nothing changed
---
Changes in V4:
  - Nothing changed
---
Changes in V3:
  - Nothing changed
---
Changes in V2:
  - Rename setup_trap_handler() to trap_init().
  - Add Reviewed-by to the commit message.
---
 xen/arch/riscv/include/asm/traps.h |  1 +
 xen/arch/riscv/setup.c             |  3 +++
 xen/arch/riscv/traps.c             | 12 ++++++++++++
 3 files changed, 16 insertions(+)

diff --git a/xen/arch/riscv/include/asm/traps.h b/xen/arch/riscv/include/asm/traps.h
index 3fef318478..c30118e095 100644
--- a/xen/arch/riscv/include/asm/traps.h
+++ b/xen/arch/riscv/include/asm/traps.h
@@ -9,6 +9,7 @@
 
 void do_trap(struct cpu_user_regs *cpu_regs);
 void handle_trap(void);
+void trap_init(void);
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index e3cb0866d5..a6a29a1508 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -8,6 +8,7 @@
 #include <public/version.h>
 
 #include <asm/early_printk.h>
+#include <asm/traps.h>
 
 void arch_get_xen_caps(xen_capabilities_info_t *info)
 {
@@ -23,6 +24,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 {
     remove_identity_mapping();
 
+    trap_init();
+
     printk("All set up\n");
 
     for ( ;; )
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 37cec40dfa..cb18b30ff2 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -12,6 +12,18 @@
 #include <asm/riscv_encoding.h>
 #include <asm/traps.h>
 
+/*
+ * Initialize the trap handling.
+ *
+ * The function is called after MMU is enabled.
+ */
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
2.45.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 055EB7358B2
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 15:35:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551092.860443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBF20-0001jV-LT; Mon, 19 Jun 2023 13:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551092.860443; Mon, 19 Jun 2023 13:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBF20-0001gR-GN; Mon, 19 Jun 2023 13:34:56 +0000
Received: by outflank-mailman (input) for mailman id 551092;
 Mon, 19 Jun 2023 13:34:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AnRR=CH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qBF1z-0000wG-2K
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 13:34:55 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1249333c-0ea6-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 15:34:52 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b475b54253so18176251fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jun 2023 06:34:52 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 f26-20020a2e9e9a000000b002adb0164258sm5222236ljk.112.2023.06.19.06.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 06:34:52 -0700 (PDT)
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
X-Inumbo-ID: 1249333c-0ea6-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687181692; x=1689773692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sORtZXgE060MfqgzUMWkg8dUi4XV3lqZfHNe2K/q7sI=;
        b=OR0omCmUNaVSa+ABBOx/mOMTZqtSrg6iAJ0Abk/76R1iFgfm8Frq9meARruSN+bmG0
         NHlQS33KVXMqdgY1V0vJxMgQ71srBSCBbX6JhzlwUhbIURabBcuCK3QcKg69GQKQA2qQ
         2LiusC94Q8PFXAycaXF2gXuujHRoZO0GzijoyHLgdpWbsf0uZONS1QqeRpJ6pDhXhRta
         8D5V83oHK62h5iZ7mxS/TG1D7/B1vrjcXWwbx/JEI8WutdZlCbE6RqgXmIaQ+7r3bJ/I
         jt8519iFNXlj+XAD+OndzCKjxpQQl44lgAyQPzMEXV+27YHmuuJMmLplQ4ctqg250ZsT
         jZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687181692; x=1689773692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sORtZXgE060MfqgzUMWkg8dUi4XV3lqZfHNe2K/q7sI=;
        b=Dm31vlox2de0hWddux2YxDjuoe5gv7Z7HLuImeLxZhPfGq7WV8oW1U3LO+L/bar5+P
         HS9Xg5o/VRs1swil0sFi1iCFimaDIdxDv8SUVkF3J7aXjVX0idbsCKdR05GcHrqTYvkV
         Wj8+HNTvMDgmQ+XAtf9BRKbpPGIA4l54NWVXBwBrFPZvXTBThQ0wlNJ4vGDvQ4l50X05
         mIeFlnjcWafoRgQJgYIPq1SOMkYCIXi9rT4o41npbz3Ent6sryCSQl1uSYU1SoByom2d
         3LYEXMlcLwm5vZDEZnY+Hzi0HdFypSyt6gWSdWWBQKVhKdfs+Fc5Bfc1vuPFqHselLsb
         /e4g==
X-Gm-Message-State: AC+VfDyL56HKCbFsG1jH1/gqJHBPgDm4lnVGf3b46rzNwydfQc4sBlXX
	50BtVxu57D9eu6A0S15661ree7RYRd4=
X-Google-Smtp-Source: ACHHUZ7RsJ0m8hdhaMr1HpFujvB18TcExNhz338pGRj9J7mC5H49DOpM8HXn7sen6S+9NG4lwYxjIA==
X-Received: by 2002:a2e:b603:0:b0:2b4:6d7e:4b08 with SMTP id r3-20020a2eb603000000b002b46d7e4b08mr2968830ljn.35.1687181692290;
        Mon, 19 Jun 2023 06:34:52 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 3/6] xen/riscv: introduce function for physical offset calculation
Date: Mon, 19 Jun 2023 16:34:44 +0300
Message-Id: <f84bdc5ad9f10f864d070f7581dce663ccc9cb53.1687178053.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1687178053.git.oleksii.kurochko@gmail.com>
References: <cover.1687178053.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function was introduced to calculate and save physical
offset before MMU is enabled because access to start() is
PC-relative and in case of linker_addr != load_addr it will
result in incorrect value in phys_offset.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
  - add __ro_after_init for phys_offset variable.
  - remove double blank lines.
  - add __init for calc_phys_offset().
  - update the commit message.
  - declaring variable phys_off as non static as it will be used in head.S.
---
 xen/arch/riscv/include/asm/mm.h |  2 ++
 xen/arch/riscv/mm.c             | 18 +++++++++++++++---
 xen/arch/riscv/riscv64/head.S   |  2 ++
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 64293eacee..996041ce81 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -11,4 +11,6 @@ void setup_initial_pagetables(void);
 void enable_mmu(void);
 void cont_after_mmu_is_enabled(void);
 
+void calc_phys_offset(void);
+
 #endif /* _ASM_RISCV_MM_H */
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 8ceed445cf..570033f17f 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -1,3 +1,4 @@
+#include <xen/cache.h>
 #include <xen/compiler.h>
 #include <xen/init.h>
 #include <xen/kernel.h>
@@ -19,9 +20,10 @@ struct mmu_desc {
 
 extern unsigned char cpu0_boot_stack[STACK_SIZE];
 
-#define PHYS_OFFSET ((unsigned long)_start - XEN_VIRT_START)
-#define LOAD_TO_LINK(addr) ((addr) - PHYS_OFFSET)
-#define LINK_TO_LOAD(addr) ((addr) + PHYS_OFFSET)
+unsigned long __ro_after_init phys_offset;
+
+#define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
+#define LINK_TO_LOAD(addr) ((unsigned long)(addr) + phys_offset)
 
 /*
  * It is expected that Xen won't be more then 2 MB.
@@ -273,3 +275,13 @@ void __init noreturn noinline enable_mmu()
     switch_stack_and_jump((unsigned long)cpu0_boot_stack + STACK_SIZE,
                           cont_after_mmu_is_enabled);
 }
+
+/*
+ * calc_phys_offset() should be used before MMU is enabled because access to
+ * start() is PC-relative and in case when load_addr != linker_addr phys_offset
+ * will have an incorrect value
+ */
+void __init calc_phys_offset(void)
+{
+    phys_offset = (unsigned long)start - XEN_VIRT_START;
+}
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 2c0304646a..850fbb58a7 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -29,6 +29,8 @@ ENTRY(start)
 
         jal     reset_stack
 
+        jal     calc_phys_offset
+
         tail    start_xen
 
         .section .text, "ax", %progbits
-- 
2.40.1



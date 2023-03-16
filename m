Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B97E6BD286
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 15:40:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510652.788761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcolc-0007s9-OU; Thu, 16 Mar 2023 14:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510652.788761; Thu, 16 Mar 2023 14:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcolc-0007pz-Jo; Thu, 16 Mar 2023 14:39:44 +0000
Received: by outflank-mailman (input) for mailman id 510652;
 Thu, 16 Mar 2023 14:39:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NB6E=7I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcolb-0006hg-7F
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 14:39:43 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62d3d3dc-c408-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 15:39:41 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id ek18so8572499edb.6
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 07:39:41 -0700 (PDT)
Received: from fedora.. (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 q16-20020a1709060e5000b008b980c3e013sm3970187eji.179.2023.03.16.07.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 07:39:40 -0700 (PDT)
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
X-Inumbo-ID: 62d3d3dc-c408-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678977581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+oNxTKcsx1V4FRFzCufKSsxTMBMI/DOdCYZTlMD0WU=;
        b=OH3IkYV0idjDWqvJYDmmV43va+dtXqyIM4tpTxwUbU6gSX28jZMbjvEl7q2by1s49w
         Grg/qo/bi8/O2PhNxTBva3I2G9vqCDoi4UsPF7BFQLW5J4o68ZRR1lUGnzNIUWP0RS9N
         4JDmQpOIIGWFVMKqLd0XITZBS0sT1UJhOEeN5eK15wdb4GpGk/LYzfAa6Q5BswX5sr0p
         KzOibXQLdAv1+yItdnXPj7jP7CmMC7GwnFB8XHyhdHrhdlP+Y9RgvOT+0GC3o5TZ75PC
         gajqhsqpyCoDv7japRrDgGU7Rf9cIkWCxM41qqaZsSKfSxxOfMCsVGlldcbAZPoQ/8iL
         pRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678977581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+oNxTKcsx1V4FRFzCufKSsxTMBMI/DOdCYZTlMD0WU=;
        b=B6VX7xLuOZTEM1qDetAfuK9OXFTO4IIs/leOIR05VAg0PSURW2DDMsxm63+mDmtfVN
         qAvxHwLGE6/OgXm74fofHkNJ9irJKJ8UfsjyJ+pcx4ODcxYkf2nlmaBVKpbvsWLR8QEy
         278+LLMGJho0mpgKprEc/rmdbRVLuuji6uOU5vlfhoLHKl1Jy7wPrhzK3cngfsrQifOo
         CZLLkq+kKdedYHPQSseBveR1vsjHS4thou/0NV5f71LONNhf6MJcNvqz5C+HEyLFAfUC
         sMYzv1m1beUO52WagJHivPUIKQARb9jdUtDr0EJCP/jehtoDjtflWtowYaUEjxevcb6f
         XTnQ==
X-Gm-Message-State: AO0yUKX4SbXrmeK/ew6Ch3zDp2bAAtP7xyUS0RRkhyAwaHVO+Sq2p+R0
	2YNMAc6nD3o/YJL+tpX/JQ0026C6XptNUg==
X-Google-Smtp-Source: AK7set94yAmmz9NW6r6NpoX2YsE+xbesnwj+czE9vNO9NPnxwu0LyVkJ20ICj5GIYnHciAFmB7rY8A==
X-Received: by 2002:a17:907:7283:b0:92f:e4c5:5a28 with SMTP id dt3-20020a170907728300b0092fe4c55a28mr5146754ejc.54.1678977581092;
        Thu, 16 Mar 2023 07:39:41 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v5 5/7] xen/riscv: introduce trap_init()
Date: Thu, 16 Mar 2023 16:39:27 +0200
Message-Id: <91b0284d20f530f2795a119ccb7436ee0b800256.1678976127.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678976127.git.oleksii.kurochko@gmail.com>
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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
 xen/arch/riscv/include/asm/traps.h | 1 +
 xen/arch/riscv/setup.c             | 5 +++++
 xen/arch/riscv/traps.c             | 7 +++++++
 3 files changed, 13 insertions(+)

diff --git a/xen/arch/riscv/include/asm/traps.h b/xen/arch/riscv/include/asm/traps.h
index f3fb6b25d1..f1879294ef 100644
--- a/xen/arch/riscv/include/asm/traps.h
+++ b/xen/arch/riscv/include/asm/traps.h
@@ -7,6 +7,7 @@
 
 void do_trap(struct cpu_user_regs *cpu_regs);
 void handle_trap(void);
+void trap_init(void);
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 36556eb779..b44d105b5f 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -3,7 +3,9 @@
 #include <xen/kernel.h>
 
 #include <asm/boot-info.h>
+#include <asm/csr.h>
 #include <asm/early_printk.h>
+#include <asm/traps.h>
 
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
@@ -32,7 +34,10 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     fill_boot_info();
 
+    trap_init();
+
     early_printk("All set up\n");
+
     for ( ;; )
         asm volatile ("wfi");
 
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 8a1529e0c5..581f34efbc 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -13,6 +13,13 @@
 #include <asm/processor.h>
 #include <asm/traps.h>
 
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
2.39.2



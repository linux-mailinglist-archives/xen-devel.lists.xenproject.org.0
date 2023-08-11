Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EF3779203
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 16:37:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582538.912356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUTGY-00089A-94; Fri, 11 Aug 2023 14:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582538.912356; Fri, 11 Aug 2023 14:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUTGY-00086s-5v; Fri, 11 Aug 2023 14:37:26 +0000
Received: by outflank-mailman (input) for mailman id 582538;
 Fri, 11 Aug 2023 14:37:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zNma=D4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qUTCH-00049h-VT
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 14:33:01 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9208269-3853-11ee-b284-6b7b168915f2;
 Fri, 11 Aug 2023 16:33:00 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fe1489ced6so3309330e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Aug 2023 07:33:00 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 q2-20020ac25a02000000b004fe07f06337sm753453lfn.53.2023.08.11.07.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 07:32:59 -0700 (PDT)
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
X-Inumbo-ID: f9208269-3853-11ee-b284-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691764380; x=1692369180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nt7soPoblldHqrs8iwJbMnbI3th3kHrjMiBeC6m3Zr4=;
        b=cMPfu9KZPOhHwuYJe5Ic3ZCC/qBC+8k5RNGZzZ0LNtY1oFu0pi7gqF/m7Mfrt6UpOk
         7rPXfc2BpnF7lwRF7OdnspLelDtF4YkDNBPRUY8zL78BhIjKNK1GHGg0B2zuesgCSojb
         EUEfWmlES0cKFY/W7HZU++baBk4b/PzDepRR/zTHVBQe6xicajFLpu/ZEUZhV6UY5vKT
         DbJP8BTX3k/Uti5DFwg432RKO+4CsBtiNQZaWNO5TN1nuj3hekiGB5jHn/ooXH2SWyUd
         48IH54Ds7M1IZH/5MqsQdjDB79qhl/1lZntlgoYsxe8yB1kv8AnWRk/TpEPhpznadYpo
         G5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691764380; x=1692369180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nt7soPoblldHqrs8iwJbMnbI3th3kHrjMiBeC6m3Zr4=;
        b=FZ/Y6Xs1jUoiZzI+EDymXfKQceLg5Y+meAW+IpTONUAap6G8g2VE8IFSEwUS56JHZ2
         hsmUNfFpw3Z69yFaKXyDlnt+27JGSr4jrdSzculmAP1XJLESY54TGrUuwni48vnJNjsM
         +cOWS7BSAyiVOOENzK2MXBvmPWKrdUAkNGuzuRLWOshe1XMS18ntDTIDXulZBMFSSSlT
         2nnf3jt2o4j1RZKDps499ZsJV/qiLJddgc8qBp/ynIItrw2J3dqZ5tbSR7b1MBYtfEiw
         gRIChDtovIBNNTnXtyw8RT8bN7s9Bn2QZcCDKqFSbD5tHKs7JL2RTfIqK3kF49V3kHBM
         oS4Q==
X-Gm-Message-State: AOJu0Yw5QjeKnMVlIv8C2cr/0KfC6tDvma2UfjhryG1LO2F31u+fIF+P
	xMEfOTVCfKvOnF+nWUlUca2hrVt0sb0=
X-Google-Smtp-Source: AGHT+IFLritZVFHFNIyx1qPpf3U57eldQaFfs/SVN+5U80NMv5bcu2V+pM3HV3sGy1NKrD/z2JjUyw==
X-Received: by 2002:a05:6512:2249:b0:4fb:8eec:ce49 with SMTP id i9-20020a056512224900b004fb8eecce49mr1870456lfu.31.1691764380132;
        Fri, 11 Aug 2023 07:33:00 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v8 4/6] xen/riscv: introduce trap_init()
Date: Fri, 11 Aug 2023 17:32:53 +0300
Message-ID: <e7e267e4d0032d45e03870c9778e68943d2e0edd.1691763757.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1691763757.git.oleksii.kurochko@gmail.com>
References: <cover.1691763757.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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
index 6593f601c1..abdd1669c6 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -5,6 +5,7 @@
 
 #include <asm/early_printk.h>
 #include <asm/mm.h>
+#include <asm/traps.h>
 
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
@@ -15,6 +16,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 {
     remove_identity_mapping();
 
+    trap_init();
+
     early_printk("Hello from C env\n");
 
     early_printk("All set up\n");
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index a2b63d579b..c1175668b6 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -12,6 +12,18 @@
 #include <asm/processor.h>
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
2.41.0



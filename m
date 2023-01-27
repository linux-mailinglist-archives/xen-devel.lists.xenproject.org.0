Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B2F67E7A3
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 15:00:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485599.753015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGp-0003kc-BI; Fri, 27 Jan 2023 13:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485599.753015; Fri, 27 Jan 2023 13:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGo-0003aT-Pk; Fri, 27 Jan 2023 13:59:58 +0000
Received: by outflank-mailman (input) for mailman id 485599;
 Fri, 27 Jan 2023 13:59:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhsa=5Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pLPGm-00023y-Cj
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 13:59:56 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e05a0442-9e4a-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 14:59:54 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id m7so5048865wru.8
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 05:59:54 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 d3-20020adfe2c3000000b002bc7fcf08ddsm3971131wrj.103.2023.01.27.05.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 05:59:53 -0800 (PST)
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
X-Inumbo-ID: e05a0442-9e4a-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ow2bkBFPte3lViXpinOUB5QNvNEMi29RCIxf21SF5TY=;
        b=SQ9/qh+TTheEDiNF2ViKLmE6RsZxhvokJSDTyyxL+oEz2Hch7XkqxYAmdVgl5sesS9
         hAlEv758aA4Ynlqu71BYzwQxFLhiwSgJxiP/KK35f6at9wkK/CDPva3WHxPycOXM6UUe
         d6XOt5n0Ts5Sf2wtMSeSpQJ6P3AKh0EwUHI79o/tARJr8UW+5SFuyBgtbd+Ff6Q1mA9D
         /XAD9XlEsvoOjDKYcyP7cUmwE7qsh3MnUnFEk6AM2ZCFzY77uKk1yIQNsKTj9wqZHrB7
         HMosOykw3R5agoEk7Dhnd0JUB6zAg5CWwaiBL7STGuaB7jG5B1dMdRMHo6YgaS+WYh7v
         yp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ow2bkBFPte3lViXpinOUB5QNvNEMi29RCIxf21SF5TY=;
        b=lsGKchNKLtB0/7Y3OZfw5rZl5nJKhpPibX/gv1eAIJYpDQyZiJpWTvMkHxQQyJXrox
         ln4CDMws/1euK3sOi1rzj8/y6kKnUyYeZgLD4CaEr1OXOPYg/y6LhM2x+DwleqiuuZas
         5tJIISY5BsLITwe+CX+y+2x2ggQFw1D5F8OAd6yfNXdXEDE6JlVWMMey1FT6IX2DGKh7
         12xfNW/MaG9zLyrvIyY5oa1TXV8X71GNEPSkOlFxJFTpXQ3frgdb5c4H8pa+TUa7E9cB
         4te0B5oxTYt3ZQe+T2cEQbUeiWypatfzeamo1DPhrDsQVwjlBQY5LZfJjOHLU/4TD3Hq
         wFJQ==
X-Gm-Message-State: AO0yUKUmzklT+yv8CQ11ZCuPQS9YHjWpvy3NFJw4lG8ZTrpmFpXTtyVL
	3yo+trC5m/PRtLTZWZzgLSi2ecmusTE=
X-Google-Smtp-Source: AK7set/6CfDjk8PEmrwzMqgVJa9okxetml0QJgUZWoN2e+jkCFDXF3imEgzKvHUOUVjN76HrLwCvSw==
X-Received: by 2002:adf:dd01:0:b0:2bf:c530:329e with SMTP id a1-20020adfdd01000000b002bfc530329emr5100646wrm.14.1674827994201;
        Fri, 27 Jan 2023 05:59:54 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 11/14] xen/riscv: introduce trap_init()
Date: Fri, 27 Jan 2023 15:59:16 +0200
Message-Id: <1081e7e12f50227a4e15171129a468420b613273.1674818705.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674818705.git.oleksii.kurochko@gmail.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V2:
  - Rename setup_trap_handler() to trap_init().
  - Add Reviewed-by to the commit message.
---
 xen/arch/riscv/include/asm/traps.h | 1 +
 xen/arch/riscv/setup.c             | 4 ++++
 xen/arch/riscv/traps.c             | 7 +++++++
 3 files changed, 12 insertions(+)

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
index d09ffe1454..c8513ca4f8 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,7 +1,9 @@
 #include <xen/compile.h>
 #include <xen/init.h>
 
+#include <asm/csr.h>
 #include <asm/early_printk.h>
+#include <asm/traps.h>
 
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
@@ -11,6 +13,8 @@ void __init noreturn start_xen(void)
 {
     early_printk("Hello from C env\n");
 
+    trap_init();
+
     for ( ;; )
         asm volatile ("wfi");
 
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index f2a1e1ffcf..31ed63e3c1 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -11,6 +11,13 @@
 #include <xen/errno.h>
 #include <xen/lib.h>
 
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
2.39.0



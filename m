Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC5E714930
	for <lists+xen-devel@lfdr.de>; Mon, 29 May 2023 14:14:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540607.842484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3bkg-0005vH-He; Mon, 29 May 2023 12:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540607.842484; Mon, 29 May 2023 12:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3bkg-0005n0-AV; Mon, 29 May 2023 12:13:30 +0000
Received: by outflank-mailman (input) for mailman id 540607;
 Mon, 29 May 2023 12:13:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi1m=BS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q3bkf-0005DI-5h
 for xen-devel@lists.xenproject.org; Mon, 29 May 2023 12:13:29 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 373c73be-fe1a-11ed-8611-37d641c3527e;
 Mon, 29 May 2023 14:13:26 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2af2b74d258so33764371fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 May 2023 05:13:26 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z14-20020a2e964e000000b002ac87c15fd4sm2427762ljh.95.2023.05.29.05.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 05:13:25 -0700 (PDT)
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
X-Inumbo-ID: 373c73be-fe1a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685362406; x=1687954406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfEaiOQUBCZEc9m9TcpbthmlviGr6gh0qCBn/DEmm+4=;
        b=T2UzzMCjI4y6qWUGyeniQt8VMvQpgboaSIZdZw0x1K5eOf1UZLucx1O6DAJg2vRMVd
         3+MH40pASrruXzh+CDny1F81oCfKe/f9L8HzA9tL5jJl1ODC6DwGNL79QXiTjpyhCSAj
         38wnNLObZ4aVUvQMuY5JytvfKRl0FqanO2nvTRZf4D/21Qcvg9R+T8IRyQSjlb2oTA8K
         hx7CWP1xtHp4AhT6FDVcxyrKqrljjCIot8geRQk6L8Ykl+dpHmcF1+oGAunc09D6BxWR
         OAGTscoHZTDmOnLcCLMtUO6VL5gBDu+aHhC/P1uZh8wUx32fCOKIFMT6dW8/UJbv+xPJ
         d7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685362406; x=1687954406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfEaiOQUBCZEc9m9TcpbthmlviGr6gh0qCBn/DEmm+4=;
        b=h4KtRcyFTiTZqT6a7I554or4cIcJIfwsP+Ny+9iPKDx7SnnnVThZcpG4gnmVjTwUs3
         +jXC6PPRzQaamX1G8zJsex5o9hVqYBnS2p8XluN6mZ7M6GUUiRlq9LOy7fyeuRFx4Nq6
         ry441QoVoO0eKYlNnU+g/3T8ziOeGLdzLylqGf4lO+gu69ViLgpVZ6J0OBA1KsL+nYOx
         UvkdM8wq6MA2mR3CJW0dgtPNsaxSindNpaQT31mBw8TK3RTks1uQlWd2nV7gXnAWLllw
         WC1P1I07pOnexJta+KRGxmcw46hv+CcXRMBEEm4MKLTu4obea01z6l9sl7dk/UnGDSHq
         Ea5Q==
X-Gm-Message-State: AC+VfDy/Nf65NALe3gPSVIEUCdyWPrnyxoD7lrJoIAvYyCesrao3sN7d
	eKZrev/1hc9ZcOI6RZw6MO/bK6qEBNA=
X-Google-Smtp-Source: ACHHUZ64pZrBI6bynejBHjG+p4XjvJ1GwyCqiLiS7raB5U4Qd6ZRbytGgFAO1fA2A6GAzNeTb1SnEQ==
X-Received: by 2002:a2e:b706:0:b0:2b0:497a:2029 with SMTP id j6-20020a2eb706000000b002b0497a2029mr4504061ljo.23.1685362406101;
        Mon, 29 May 2023 05:13:26 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v6 4/6] xen/riscv: introduce trap_init()
Date: Mon, 29 May 2023 15:13:17 +0300
Message-Id: <f4c4b711106283e26536105105892b93bb39ea3e.1685359848.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1685359848.git.oleksii.kurochko@gmail.com>
References: <cover.1685359848.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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
 xen/arch/riscv/traps.c             | 25 +++++++++++++++++++++++++
 3 files changed, 29 insertions(+)

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
index 845d18d86f..1cae0e5ccc 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -3,6 +3,7 @@
 
 #include <asm/early_printk.h>
 #include <asm/mm.h>
+#include <asm/traps.h>
 
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
@@ -25,6 +26,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
 void __init noreturn cont_after_mmu_is_enabled(void)
 {
+    trap_init();
+
     early_printk("All set up\n");
 
     for ( ;; )
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index ea1012e83e..48c1059954 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -12,6 +12,31 @@
 #include <asm/processor.h>
 #include <asm/traps.h>
 
+#define cast_to_bug_frame(addr) \
+    (const struct bug_frame *)(addr)
+
+/*
+ * Initialize the trap handling.
+ *
+ * The function is called after MMU is enabled.
+ */
+void trap_init(void)
+{
+    /*
+     * When the MMU is off, addr varialbe will be a physical address otherwise
+     * it would be a virtual address.
+     *
+     * It will work fine as:
+     *  - access to addr is PC-relative.
+     *  - -nopie is used. -nopie really suppresses the compiler emitting
+     *    code going through .got (which then indeed would mean using absolute
+     *    addresses).
+     */
+    unsigned long addr = (unsigned long)&handle_trap;
+
+    csr_write(CSR_STVEC, addr);
+}
+
 static const char *decode_trap_cause(unsigned long cause)
 {
     static const char *const trap_causes[] = {
-- 
2.40.1



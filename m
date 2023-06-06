Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2075C724D8C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 21:55:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544188.849800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6cm6-0003aW-Kp; Tue, 06 Jun 2023 19:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544188.849800; Tue, 06 Jun 2023 19:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6cm6-0003SR-GN; Tue, 06 Jun 2023 19:55:26 +0000
Received: by outflank-mailman (input) for mailman id 544188;
 Tue, 06 Jun 2023 19:55:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymfh=B2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q6cm5-0002er-1x
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 19:55:25 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 127d81b0-04a4-11ee-8611-37d641c3527e;
 Tue, 06 Jun 2023 21:55:22 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f6148f9679so5914935e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jun 2023 12:55:22 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j29-20020ac2551d000000b004f1383d57ecsm1563284lfk.202.2023.06.06.12.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 12:55:21 -0700 (PDT)
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
X-Inumbo-ID: 127d81b0-04a4-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686081322; x=1688673322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9dfuEcyOpcttJDizez0uwxVrhy0pEYRLPEtmcdqVH0=;
        b=cO8vQhjZKZBCx/OMXvcYedquJasxp/5/p/DIaMDSm2K3nQHlfOGDVpPnc9bY5HDhKK
         RPlE5am5L3iXLcij5OkzvzvNpdl3+Rfp2dKxUNFnGX0M7MsIGMKzOYS81zP8nygsuM80
         eBInYtgi+/j7NN3H0eNvGjBZuvc/AOJvzrufzepeZtMJCn97QH5d4Ivhhe9W6qWqwi2K
         qOVeKgRz8ptdjKNhpeeE35ZyZvPpf80CF8fEblojihRui3ViqhqnXkiG8u2+BxZH6Tnl
         Jkm6JAZzGhE0eSFNKEjDbgKuDc6GBj5eq1o8d2j2jh0XGcDQ4qvVnNvj/B7jHjFdZ/y7
         KmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686081322; x=1688673322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9dfuEcyOpcttJDizez0uwxVrhy0pEYRLPEtmcdqVH0=;
        b=Ivig9W9Wh5s+b122Y9EsCksV7KaME+9udVpCVVa1qxKyTkKPbfSQxwOeRz3qSBDvEQ
         xOE4udFdTU+h/62nBVighrfC2HA0GJcV0D057mrkyr8hAAViukyWXlNqRrKS/pUdbM9E
         OU4tyGCUJxzH/59Hi2gKu6ARGmmObio3fsu1rHLQ8VeXZtCeTd7HFRflr0WMJrLeAoNj
         cYk5Q+uSuDH3SqcrKnDq/xbLS0QfctHa2daoADWjgI3dplfDNUcxIugE93y8Z2C2/LxZ
         X+F5nWHSfjr9VLa+7MTczNPdhhN8nsQxJZ1lK41zhT26jnW9uNjOxfAn9iorMfDA7XuZ
         aarg==
X-Gm-Message-State: AC+VfDyPYfMd2xR2WvXZrwqFVCN0ye/vhTLTrgE4Yr4dL3yT1mxiBnxv
	WjJcH4H9NKXh1M+rWPEMT02zf4vsaLs=
X-Google-Smtp-Source: ACHHUZ4U3H6nveqzFxmohTnQISG3EbtKgdJoOK4rxT3Anq8lXoVZ8R0n4farW5PFO3Mkc81zgFmGhw==
X-Received: by 2002:ac2:46fc:0:b0:4f3:a91c:23d0 with SMTP id q28-20020ac246fc000000b004f3a91c23d0mr1668492lfo.31.1686081322050;
        Tue, 06 Jun 2023 12:55:22 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 4/8] xen/riscv: introduce function for physical offset calculation
Date: Tue,  6 Jun 2023 22:55:12 +0300
Message-Id: <d5971bce174c7bbae61c7e16337ef95c7f3d1f62.1686080337.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1686080337.git.oleksii.kurochko@gmail.com>
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function was introduced to not calculate and save physical
offset before MMU is enabled because access to start() is
PC-relative and in case of linker_addr != load_addr it will result
in incorrect value in phys_offset.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
index 8ceed445cf..c092897f9a 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -19,9 +19,11 @@ struct mmu_desc {
 
 extern unsigned char cpu0_boot_stack[STACK_SIZE];
 
-#define PHYS_OFFSET ((unsigned long)_start - XEN_VIRT_START)
-#define LOAD_TO_LINK(addr) ((addr) - PHYS_OFFSET)
-#define LINK_TO_LOAD(addr) ((addr) + PHYS_OFFSET)
+static unsigned long phys_offset;
+
+#define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
+#define LINK_TO_LOAD(addr) ((unsigned long)(addr) + phys_offset)
+
 
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
+void  calc_phys_offset(void)
+{
+    phys_offset = (unsigned long)start - XEN_VIRT_START;
+}
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 6fb7dd80fd..69f3a24987 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -29,6 +29,8 @@ ENTRY(start)
 
         jal     reset_stack
 
+        jal     calc_phys_offset
+
         tail    start_xen
 
 ENTRY(reset_stack)
-- 
2.40.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CED8724D8F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 21:55:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544192.849844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6cmB-0004mr-9w; Tue, 06 Jun 2023 19:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544192.849844; Tue, 06 Jun 2023 19:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6cmB-0004ji-12; Tue, 06 Jun 2023 19:55:31 +0000
Received: by outflank-mailman (input) for mailman id 544192;
 Tue, 06 Jun 2023 19:55:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymfh=B2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q6cm9-0002er-2M
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 19:55:29 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 144bf0ef-04a4-11ee-8611-37d641c3527e;
 Tue, 06 Jun 2023 21:55:25 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f62b552751so3270312e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jun 2023 12:55:25 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j29-20020ac2551d000000b004f1383d57ecsm1563284lfk.202.2023.06.06.12.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 12:55:24 -0700 (PDT)
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
X-Inumbo-ID: 144bf0ef-04a4-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686081325; x=1688673325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=adjWBIjLafrAFiXOiNb5AAc0fFbNojcht2Nhfx9j3rY=;
        b=lLlE/Lkij5rFq1/swnQoTR/UnZJQUo2DNCfhq+FuydN0XGEcQCBCzeQudJxwRbtqFw
         cCWF0IHBvJkM3Ja/hbU3SSXSR4MBwgkgywR49W0FC4ISBLfVF+XFFndNNg1QO3Z2VHyU
         tgrMW4wePwhSIllB7WAUJck6VNsXiC4CbFLMv3k8qf8olqIL/MWPQVdGGrarwAWRhEus
         F4ftcQrY7w6WeICbhEbeUGHCsfri9C+hvymcstaifuOOuSpejhre30mZ8L3dy8LLV76h
         n79zx4qAE/j8H/kF9IR0PCuleFACwzY7IAFvKMwfcwKDD0Xp573LTo2czdFY8MZ7iyM+
         8z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686081325; x=1688673325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=adjWBIjLafrAFiXOiNb5AAc0fFbNojcht2Nhfx9j3rY=;
        b=CwLEGPnjvnbRP0rv5HeNBgZSEqpMc44RQqANgKLoFytEsaBGvBghV6ISAlvTCPbkK9
         kI3uwgWeC/rQuuHDb6b0ENxv9BxP4m2aRj9RlXwMIKKmAJE/6Gq2CQISCeFgmtHAQ1OO
         806q603HICL+NTL30/OJLhloqD5/LuKCptxw87tjEtl5bp+7cpttVowUoH0k92u5Tz2d
         4k4ecsz7n9m5a486mNjlwKdKFPuueSwkO0BgRTyio/VG7bxNaLY40CnoKYNKUqZKR8DA
         oNLE6jKFvz/gqkzueBHN0X2bH0234a/62AGedRpicAK9PZlOzbtfdzBCb5zwUFPSnHow
         Jndg==
X-Gm-Message-State: AC+VfDxjvnXSbqSZO6BuskXKm5wKVA0381xJAcVe9qjVjTssCV0c2G4b
	gxasLrHzZ7ULhqy6JIDAOHEZbyuPRIY=
X-Google-Smtp-Source: ACHHUZ5S3DssVanCU7X8GAZ1N4I05W+hlWQgRzwYEaGaONJ5RY9mmFBjBatvPLclkbh7M3F93PaCVg==
X-Received: by 2002:a19:f809:0:b0:4f6:3677:54e with SMTP id a9-20020a19f809000000b004f63677054emr1178416lff.36.1686081325083;
        Tue, 06 Jun 2023 12:55:25 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 8/8] xen/riscv: move extern of cpu0_boot_stack to header
Date: Tue,  6 Jun 2023 22:55:16 +0300
Message-Id: <b521dd0be07ac630e0071c1651b6877961c2b656.1686080337.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1686080337.git.oleksii.kurochko@gmail.com>
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/mm.h | 2 ++
 xen/arch/riscv/mm.c             | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 3b04131628..fc3afa5521 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -8,6 +8,8 @@
 #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
 #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
 
+extern unsigned char cpu0_boot_stack[];
+
 void setup_initial_pagetables(void);
 
 void enable_mmu(void);
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index b50641a80e..56d3bbb422 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -19,8 +19,6 @@ struct mmu_desc {
     pte_t *pgtbl_base;
 };
 
-extern unsigned char cpu0_boot_stack[STACK_SIZE];
-
 static unsigned long phys_offset;
 
 #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
-- 
2.40.1



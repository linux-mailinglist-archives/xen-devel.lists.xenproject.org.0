Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CA17358B1
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 15:35:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551095.860473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBF23-0002UX-NS; Mon, 19 Jun 2023 13:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551095.860473; Mon, 19 Jun 2023 13:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBF23-0002Qc-Hf; Mon, 19 Jun 2023 13:34:59 +0000
Received: by outflank-mailman (input) for mailman id 551095;
 Mon, 19 Jun 2023 13:34:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AnRR=CH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qBF22-0000wG-2d
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 13:34:58 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13931462-0ea6-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 15:34:55 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b45e6e1b73so39972241fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jun 2023 06:34:55 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 f26-20020a2e9e9a000000b002adb0164258sm5222236ljk.112.2023.06.19.06.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 06:34:54 -0700 (PDT)
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
X-Inumbo-ID: 13931462-0ea6-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687181694; x=1689773694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+nQRuKJN5u5llfZLQokcA1AqsaluOe8xrZ2dOYYFlU=;
        b=IcjnYKnNhrFHWPDVKzhjiky1im4j8NA7VDhZVTZMDDywDb2b7PIBuZnmWwZAkYFZub
         XKa29BMrVjFyxuTtBW4yMDhYO3S9gDrnU4uD+2ya0VmH4ub5inzmSbrr/EAanncUl3zx
         Z35vq510+ztCwLilxyEQiOxCDDcIB6iKCLdtqn92wbqmWXzr7A8dtah+4sYBEPKoiXz+
         bhrRR3TH4vAixbxwjYSyy5ZtD6kGTCCSN5YUvdBnhQLMr4sY/cPBaNGoe3SLbIFiSfNV
         EWTD2yN0VrJgLRLleZXaadIq09oxDiX5pqECfh018w0Hfg/s0uOz5TD/S+peJUHqXnFr
         AbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687181694; x=1689773694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+nQRuKJN5u5llfZLQokcA1AqsaluOe8xrZ2dOYYFlU=;
        b=Qv5X1gz/yJTHomHs3gUA9YW3OwVpYVJjWjizDKCGVkDWzsXuLnHS3ZEEKlAxnt6Ipq
         e2qhhBBGEStQm34cQMAS5469OHqBzvA+X1DDy4oNt55RXeV2iEXBJVtoO17BudiQKW97
         /t1VPLNRtxVofcBm+DNlR2fG1vbAuoFDcqlaE/NOhc6OPui1R/QRrnZnHMxcWmMwkKug
         mhyekQ9/1q4zRggBcZPBZbAlEmidmuvCWOWeWlRsZZ3qQzsO50xpX/EoSgmimdjEa57/
         0L8OksXhMFms8y5u2hw9m4dBwqo5Uhpg6iwqQbb9CAThj6rNNrudWIDTPkqTVcPB1mxt
         XCXA==
X-Gm-Message-State: AC+VfDwEiFxo8WQOSNaZcxL8L3gb2k7oprG9MazPiAXCHBqtCV4fOZKl
	kCxY4KzxZTgMzkvTYc2cBGCDTmiAEoU=
X-Google-Smtp-Source: ACHHUZ4N4kcSEsgLuUYkpuO9tCKdB4apKqEk2SMLIh9nX6/fbfCsIDWTSakOgrEa9ycVLGBiYBG9Gg==
X-Received: by 2002:a2e:7003:0:b0:2b4:70b1:af01 with SMTP id l3-20020a2e7003000000b002b470b1af01mr2575846ljc.20.1687181694484;
        Mon, 19 Jun 2023 06:34:54 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 6/6] xen/riscv: move extern of cpu0_boot_stack to header
Date: Mon, 19 Jun 2023 16:34:47 +0300
Message-Id: <ce6fcda2899677cd241ff31cc4d915542475a05d.1687178053.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1687178053.git.oleksii.kurochko@gmail.com>
References: <cover.1687178053.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes in V2:
  - add Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>.
---
 xen/arch/riscv/include/asm/mm.h | 2 ++
 xen/arch/riscv/mm.c             | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 3f694a43ef..085eaab7fb 100644
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
index 663048c783..602b89aeed 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -20,8 +20,6 @@ struct mmu_desc {
     pte_t *pgtbl_base;
 };
 
-extern unsigned char cpu0_boot_stack[STACK_SIZE];
-
 unsigned long __ro_after_init phys_offset;
 
 #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
-- 
2.40.1



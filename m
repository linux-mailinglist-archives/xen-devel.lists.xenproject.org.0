Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D66A781CC36
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:29:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659612.1029322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhSt-0003y6-UN; Fri, 22 Dec 2023 15:29:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659612.1029322; Fri, 22 Dec 2023 15:29:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhSt-0003wE-Ro; Fri, 22 Dec 2023 15:29:31 +0000
Received: by outflank-mailman (input) for mailman id 659612;
 Fri, 22 Dec 2023 15:29:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDm-0007Ie-IX
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:54 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b81e5a7d-a0dc-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 16:13:53 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50e67e37661so1185022e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:53 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:52 -0800 (PST)
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
X-Inumbo-ID: b81e5a7d-a0dc-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258033; x=1703862833; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIctziQEpONFKZE794AYy1MUnDyOQ/io/VpH00G6+uw=;
        b=Pq69uNo9UmY8C/nDqOxqd9Lr074ks3H8e3ckjDuc1wdXcXG0dRa5eTQesDGtxLbpfj
         C++bGR4jJacsMilflGlf5gC2ta3Y9WcRRH03tgKwKHT+gRDW+iUA9Ap1H1jIUOjf9GI8
         yHn/BnL4tnYMvtD0VVbkxwxVxZu/HwDz9ToAJl8m2FZBg5pPxfErKJhJa/aDKbboKrDH
         Zuipyc4HyfpwHjSS+67SBbX4htSlV1iafRiz8uUKxQlI1cbjIRPQtzAjuPRcB/8isdjl
         tXJgz4fyG9YVN/gTOV2Zbfl0suHJD8G6vrSYrOkJmvsBrSof/THnR9A6LU1TqWYh5/+r
         JKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258033; x=1703862833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIctziQEpONFKZE794AYy1MUnDyOQ/io/VpH00G6+uw=;
        b=EUAtVIBMVQQifOTEvG3YylFd8tdVdPW/Z/x9ioULX6Aq8YJFsw7IDkWZ3d4KcyaPlZ
         7LTCZKoX7feFVo2jBB0f4pB50cEEey7g80l9eRVrMtKLhY13NwroBIT9VIBE996IHXp4
         YAOkD/nTqFRJ38EZ+jUgOmaWLTMWJLJL1026oRJ4zoy309dSsReA3glKY7+HMRiZhj4f
         6VnSclFqMwc9Ec11KzI5pPOWFXZGgOg+63t2B4plLas3t/CVK4cwbu7lqoJnBRUrCDlV
         LB3KzcRIkLHC4Ld3KOrcJnELabXgZ2aLRNg0LcXr78Zn1r+zbXyXiCobEYmK2oSzkCV+
         z3DA==
X-Gm-Message-State: AOJu0Yz9vCx7D9lwk7YtX6hCrXr7fkkrOokHVZ98/oSpMbVN5oV/wAgN
	CxPREFZafD9D/zCSGMECH1EVheJKcZY=
X-Google-Smtp-Source: AGHT+IGU38HlC5nYk6vnjGkSK+GHyHf2rC6zXqjN2QiH9rknKQBhCeW9LnhUCjN3t94czdDjLTn1YA==
X-Received: by 2002:a19:5f54:0:b0:50e:6878:a715 with SMTP id a20-20020a195f54000000b0050e6878a715mr720490lfj.48.1703258033079;
        Fri, 22 Dec 2023 07:13:53 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 29/34] xen/riscv: add minimal stuff to page.h to build full Xen
Date: Fri, 22 Dec 2023 17:13:13 +0200
Message-ID: <7aa26bdad9bf923fd57f7a90e41c049cab0cd5bd.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V3:
 - update the commit message
 - add implemetation of PAGE_HYPERVISOR macros
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
 - drop definition of pfn_to_addr, and paddr_to_pfn in <asm/mm.h>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/mm.h   |  3 ---
 xen/arch/riscv/include/asm/page.h | 22 ++++++++++++++++++++++
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 07c7a0abba..57026e134d 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -5,9 +5,6 @@
 
 #include <asm/page-bits.h>
 
-#define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
-#define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
-
 extern unsigned char cpu0_boot_stack[];
 
 void setup_initial_pagetables(void);
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 95074e29b3..85176702d5 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -6,6 +6,7 @@
 #ifndef __ASSEMBLY__
 
 #include <xen/const.h>
+#include <xen/bug.h>
 #include <xen/types.h>
 
 #include <asm/mm.h>
@@ -32,6 +33,10 @@
 #define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
 #define PTE_TABLE                   (PTE_VALID)
 
+#define PAGE_HYPERVISOR_RW          (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
+
+#define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
+
 /* Calculate the offsets into the pagetables for a given VA */
 #define pt_linear_offset(lvl, va)   ((va) >> XEN_PT_LEVEL_SHIFT(lvl))
 
@@ -46,6 +51,9 @@ typedef struct {
 #endif
 } pte_t;
 
+#define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
+#define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
+
 static inline pte_t paddr_to_pte(paddr_t paddr,
                                  unsigned int permissions)
 {
@@ -62,6 +70,20 @@ static inline bool pte_is_valid(pte_t p)
     return p.pte & PTE_VALID;
 }
 
+static inline void invalidate_icache(void)
+{
+    BUG();
+}
+
+#define clear_page(page) memset((void *)(page), 0, PAGE_SIZE)
+#define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
+
+/* TODO: Flush the dcache for an entire page. */
+static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
+{
+    BUG();
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PAGE_H */
-- 
2.43.0



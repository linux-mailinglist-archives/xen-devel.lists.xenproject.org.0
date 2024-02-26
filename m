Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD5C867EE5
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 18:39:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685706.1066955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewy-00049k-Or; Mon, 26 Feb 2024 17:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685706.1066955; Mon, 26 Feb 2024 17:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewy-0003vl-0z; Mon, 26 Feb 2024 17:39:36 +0000
Received: by outflank-mailman (input) for mailman id 685706;
 Mon, 26 Feb 2024 17:39:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiHA=KD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1reewv-0007pd-5F
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 17:39:33 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fff24c6b-d4cd-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 18:39:32 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d29111272eso8910981fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 09:39:32 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z8-20020a2e8e88000000b002d0ae22ff6fsm920883ljk.60.2024.02.26.09.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:39:31 -0800 (PST)
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
X-Inumbo-ID: fff24c6b-d4cd-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708969171; x=1709573971; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9b077YYDybYOLF6nhirG91sM1YPk52VLw2WhqDJoTFw=;
        b=ijh3xok3akSCLVg4cU/MXGrI/auLteGf0gukJGmG2KwbRx1ZUBOgw5A50F/f5szUjN
         LjLjR6n+iHRo/jjkWUz7s16VSzqkqbFO+phtsC19lTn87KaV6fYZXavUNdtaKOQrRva8
         K/wC6z3iKiKk6ebG8UWYSTT9VOyT/ve+kZ4dupB6xRggE+XnGn9YQPHJzijy/diaZt8G
         RUr1DQaR1OgosvGgOt0E809jS+tbv14Zttr3Fi+Iu9TRiPOOB6VeDIAm2UYBHyhUZfNP
         aBR/xuJN8W5M+qVT4IGUohqegizcQCtz6Q2xayvNln5IoFXrOX6e0Ly268oisJHbKrmP
         T5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969171; x=1709573971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9b077YYDybYOLF6nhirG91sM1YPk52VLw2WhqDJoTFw=;
        b=XrgqekOL4cb7REZlyYNhAhGqmoxp/Btz/NIkNrGcewqVGZN7hBdd0X2E3ZpHNweu7l
         UctFgzJmeT5l5A6WRYHWSzaCqWMLXecWRPnvuA7V9Afr/vBvn3h2Qu5ti2+wqOm6uyUs
         rAoyfSB4G3qjUJCISpbVE6z0LNBVYPhd+1ETWeAmxDNSJgYNXnEp+l7qyENx3Rf8kMFb
         hMlMSPx5US1JYGeqfjowD2yq8SuYC6gks0xokhj/hMkV8lzCngAMHMhbOYFU3pB/YDIE
         zqSt9WMZH5DTRjHogL4GsHOiyhajWh7KXwDexBnK4ChhZ5to1y2JxZL1Uvza1LB+Fo4T
         tj8g==
X-Gm-Message-State: AOJu0YyZ89sKIj2H35LDopc0tIKCyu67dYU4ER4dgF0s78ZmBSN0OKLC
	6cBqfh2iMi+oumedXhHZ+AeM3jVzmddMJQ3DqjRI6Jb6oeSRjcWl/Th6uu6b
X-Google-Smtp-Source: AGHT+IExD9nzqU4wd2o0hcsdcr2pP41prdAcVvY7g24eNfXaFQKHUfBCLoBlJhVtxI2wDJcq5z5S6A==
X-Received: by 2002:a2e:8507:0:b0:2d2:3e88:7c4f with SMTP id j7-20020a2e8507000000b002d23e887c4fmr4362942lji.43.1708969171177;
        Mon, 26 Feb 2024 09:39:31 -0800 (PST)
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
Subject: [PATCH v5 17/23] xen/riscv: add minimal stuff to page.h to build full Xen
Date: Mon, 26 Feb 2024 18:38:59 +0100
Message-ID: <ee58261d95c60f98527026f157eec5d73c4f0959.1708962629.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708962629.git.oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5:
 - Nothing changed. Only rebase.
---
Changes in V4:
---
 - Change message -> subject in "Changes in V3"
 - s/BUG/BUG_ON("...")
 - Do proper rebase ( pfn_to_paddr() and paddr_to_pfn() aren't removed ).
---
Changes in V3:
 - update the commit subject
 - add implemetation of PAGE_HYPERVISOR macros
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
 - drop definition of pfn_to_addr, and paddr_to_pfn in <asm/mm.h>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/page.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 95074e29b3..c831e16417 100644
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
 
@@ -62,6 +67,20 @@ static inline bool pte_is_valid(pte_t p)
     return p.pte & PTE_VALID;
 }
 
+static inline void invalidate_icache(void)
+{
+    BUG_ON("unimplemented");
+}
+
+#define clear_page(page) memset((void *)(page), 0, PAGE_SIZE)
+#define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
+
+/* TODO: Flush the dcache for an entire page. */
+static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
+{
+    BUG_ON("unimplemented");
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PAGE_H */
-- 
2.43.0



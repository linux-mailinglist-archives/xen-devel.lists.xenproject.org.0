Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7822A896C6F
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 12:30:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700433.1093617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxsm-00014N-5F; Wed, 03 Apr 2024 10:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700433.1093617; Wed, 03 Apr 2024 10:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxsm-000129-2V; Wed, 03 Apr 2024 10:30:16 +0000
Received: by outflank-mailman (input) for mailman id 700433;
 Wed, 03 Apr 2024 10:30:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YDNC=LI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rrxjP-0007Ob-CW
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 10:20:35 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce11a117-f1a3-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 12:20:33 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-515b43b39fdso688603e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 03:20:33 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 k33-20020a0565123da100b00516a18f9080sm1161237lfv.257.2024.04.03.03.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 03:20:32 -0700 (PDT)
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
X-Inumbo-ID: ce11a117-f1a3-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712139633; x=1712744433; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOFxxlMM2XVyiumTGNgKYGuXmzMjhW9yLsD9YmWeEMM=;
        b=WAJzJiNzdqALdIWtuoy3t6SjTRmWdiawQVH5GLKgn1NHBUyPEd7ApqfEtw55ahXyBL
         M8NC3yQKcwUp205JAN6GD4Jj0b/FVWovumBEcjVDZhgU+7yvJS1yx5MSLi754DfXDX8F
         L0dqmVQsyhYU19qySGe3t0hYgCwY0M0HnIWX8/kX1dtN92TB9NDzM1q00FJFQoFkTVVg
         4cq2OxsRn/dI7gZgoLuq3CZ8hoO1oumeQ13cDS2jo/IjainvgQTHuzTZKwUNF/hqCkoi
         PvcAqBQirxUt66R4dMtjeP6F2AGgXMzOtJiOMql/M3T3AoW40O3nYbnGwWqvSWl4hODa
         MbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712139633; x=1712744433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOFxxlMM2XVyiumTGNgKYGuXmzMjhW9yLsD9YmWeEMM=;
        b=Y6HgfnTzCl4zUrUkGCYtitViNzfWHrkoPN5qm6ZKiyCTOjUVHYmhY3xSx72Q56kPcO
         i43wctRmCM3duUR/m31jenXH8ePlnt7EDGYXbKGg/WXSuZHQWsV7ZXDQ2Tg7m90Lb1Od
         T5N/DP5M3Ts9kgAD8k+2vs+Frdtfjy1m9fTx3jcXZP7zzrHVF4QZhD7xkn0kqLuMUjvp
         wBeEN61+ofH1+VAx1T+uxh47dVxeAHUTvFWG9rZGZpEoD/2NCGX518eFc7FF28LRyWKH
         Of7leldcX7fsP3//OI0UTzwEZIRuZ3PdSXVC3toXco3jsta5X4cfBuOqP7uzwy9PZifi
         ETzg==
X-Gm-Message-State: AOJu0YwguDPMY9S7FAowPG4TdulQ9rfVdnvqNq1xj0fMg+hgItXoykde
	j6aJ2sI5ziqCO6o2l3Qugh1M1K4ENkS69bcJfktu+cHmg/VnFCo9jZKGSVMF
X-Google-Smtp-Source: AGHT+IH7VoZdsG2IgUcJ5Mvqk2ziaPkibv62IeZEojdnoe8C+/TkKPjQFNqYz3XeVt2F+G7WYgOwug==
X-Received: by 2002:a19:ca44:0:b0:513:dcd2:1267 with SMTP id h4-20020a19ca44000000b00513dcd21267mr752289lfj.23.1712139632738;
        Wed, 03 Apr 2024 03:20:32 -0700 (PDT)
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
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 14/19] xen/riscv: add minimal stuff to page.h to build full Xen
Date: Wed,  3 Apr 2024 12:20:07 +0200
Message-ID: <29c2ea39038ab7049baef9cbc426b718c341a724.1712137031.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712137031.git.oleksii.kurochko@gmail.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5-V7:
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



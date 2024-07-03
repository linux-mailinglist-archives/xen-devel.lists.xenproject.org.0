Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F3A92595D
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 12:43:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752892.1161152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOxS3-0004O4-Nd; Wed, 03 Jul 2024 10:43:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752892.1161152; Wed, 03 Jul 2024 10:43:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOxS3-0004I8-HB; Wed, 03 Jul 2024 10:43:03 +0000
Received: by outflank-mailman (input) for mailman id 752892;
 Wed, 03 Jul 2024 10:43:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mAj5=OD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sOxS1-0003zy-Lw
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 10:43:01 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03f34818-3929-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 12:42:59 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e38028so2460041a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 03:42:59 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72b92985desm414590066b.78.2024.07.03.03.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 03:42:58 -0700 (PDT)
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
X-Inumbo-ID: 03f34818-3929-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720003379; x=1720608179; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tu9SsKtiznAxphg8ImBUJ4LDe0odH7NePw+yOiQLnos=;
        b=TTRBC95WAVrH0I7uCBpXqM+UR19zPGL/AusvlzwnmULEZSMJmUlbldye7GWB4CWVVo
         sump2aF68JRVZV99vyHmesDAvbpfcnXPN1RpgBRehLiAb/6RfS4YXaISunN+gGx2R+vV
         krh87V23Y7syC+q6Hbxb+BXxlEVcZoR49bro2+7ZdWMVn5scjiQ5tbNI24s4ah6wLsCU
         XYHXmngcPRBzrYW7jRM+AdQZVFedpokTMpHPYgnGj3agRddTHZ2x9m5LHB2lglGlPIVg
         66iD0aLvD/Xpwvp8UYFXecs3jjbonTzyp0QoZ4u1Azxh0uqNwUSgC+nR9kqKGmB5hmoT
         Se8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720003379; x=1720608179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tu9SsKtiznAxphg8ImBUJ4LDe0odH7NePw+yOiQLnos=;
        b=Jk1vMJCKNeuc+DAVyDdZdIC3R8de/n0MqtzVGPZjE4M42H63xMosnQOQJniKDIT1DY
         ZaEfPQwQpz4c+Edm9lbZOFxQcvehB2k9WzxtXP+ml199RyXtlqpEZwHSBme7prAYtGuq
         7k5DmjgOljH0UNgHREvRhyKtpX2964YCn03aFM+ywosIzrhmXBTFtMhoUQ8srWwxTdD8
         HYDetBLGN/Lbl9LXXPMePmZN5T1Ie6grqRXZcmQ1GD/kB34FMgTLg9RUJ37QpwFk0Ts2
         b9Y6e2J3yP0kQlDhWqGQO+vpNkwS1qFw3pI6ub+wfTmz+cxAMvPU06qG+IGXyrSTj5Mv
         lcJg==
X-Gm-Message-State: AOJu0YzXN1yorC277OrfAy/xuApBmHvcYgH3whSrOyZvSSJKh2LoWeep
	cwyYrzY71xps8kwrppJy6TXntwIfcLhovI0g+qlUTWhtdAqoKAVEfb9g0/Iv
X-Google-Smtp-Source: AGHT+IGHFzWtbpQR0TiayLGdPj8/iujdHG2bgkx0p85h3ZkZ5gOHJEfMVe9W00emubq6I0kI9BvLEg==
X-Received: by 2002:a17:906:d9c6:b0:a6f:b400:4751 with SMTP id a640c23a62f3a-a751447b06cmr635791366b.22.1720003378604;
        Wed, 03 Jul 2024 03:42:58 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 4/5] xen/riscv: introduce device tree maping function
Date: Wed,  3 Jul 2024 12:42:50 +0200
Message-ID: <efd3e6a8c526d227f8db06779c65ffda42a695d6.1720002425.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720002425.git.oleksii.kurochko@gmail.com>
References: <cover.1720002425.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/config.h |  6 +++++
 xen/arch/riscv/include/asm/mm.h     |  2 ++
 xen/arch/riscv/mm.c                 | 37 +++++++++++++++++++++++++----
 3 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 50583aafdc..2395bafb91 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -74,6 +74,9 @@
 #error "unsupported RV_STAGE1_MODE"
 #endif
 
+#define XEN_SIZE                MB(2)
+#define XEN_VIRT_END            (XEN_VIRT_START + XEN_SIZE)
+
 #define DIRECTMAP_SLOT_END      509
 #define DIRECTMAP_SLOT_START    200
 #define DIRECTMAP_VIRT_START    SLOTN(DIRECTMAP_SLOT_START)
@@ -99,6 +102,9 @@
 #define VMAP_VIRT_START         SLOTN(VMAP_SLOT_START)
 #define VMAP_VIRT_SIZE          GB(1)
 
+#define BOOT_FDT_VIRT_START     XEN_VIRT_END
+#define BOOT_FDT_VIRT_SIZE      MB(4)
+
 #else
 #error "RV32 isn't supported"
 #endif
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 25af9e1aaa..d1db7ce098 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -255,4 +255,6 @@ static inline unsigned int arch_get_dma_bitsize(void)
     return 32; /* TODO */
 }
 
+void* early_fdt_map(paddr_t fdt_paddr);
+
 #endif /* _ASM_RISCV_MM_H */
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 7d09e781bf..ccc91f9a01 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/bootfdt.h>
 #include <xen/bug.h>
 #include <xen/compiler.h>
 #include <xen/init.h>
@@ -7,7 +8,9 @@
 #include <xen/macros.h>
 #include <xen/mm.h>
 #include <xen/pfn.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/sections.h>
+#include <xen/sizes.h>
 
 #include <asm/early_printk.h>
 #include <asm/csr.h>
@@ -20,7 +23,7 @@ struct mmu_desc {
     unsigned int pgtbl_count;
     pte_t *next_pgtbl;
     pte_t *pgtbl_base;
-};
+} mmu_desc = { CONFIG_PAGING_LEVELS, 0, NULL, 0 };
 
 static unsigned long __ro_after_init phys_offset;
 
@@ -39,9 +42,11 @@ static unsigned long __ro_after_init phys_offset;
  * isn't 2 MB aligned.
  *
  * CONFIG_PAGING_LEVELS page tables are needed for the identity mapping,
- * except that the root page table is shared with the initial mapping
+ * except that the root page table is shared with the initial mapping.
+ *
+ * CONFIG_PAGING_LEVELS page tables are needed for device tree mapping.
  */
-#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)
+#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 3 + 1 + 1)
 
 pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
 stage1_pgtbl_root[PAGETABLE_ENTRIES];
@@ -207,8 +212,6 @@ static bool __init check_pgtbl_mode_support(struct mmu_desc *mmu_desc,
  */
 void __init setup_initial_pagetables(void)
 {
-    struct mmu_desc mmu_desc = { CONFIG_PAGING_LEVELS, 0, NULL, NULL };
-
     /*
      * Access to _start, _end is always PC-relative thereby when access
      * them we will get load adresses of start and end of Xen.
@@ -296,6 +299,30 @@ unsigned long __init calc_phys_offset(void)
     return phys_offset;
 }
 
+void* __init early_fdt_map(paddr_t fdt_paddr)
+{
+    unsigned long dt_phys_base = fdt_paddr;
+    unsigned long dt_virt_base;
+    unsigned long dt_virt_size;
+
+    BUILD_BUG_ON(MIN_FDT_ALIGN < 8);
+    if ( !fdt_paddr || fdt_paddr % MIN_FDT_ALIGN || fdt_paddr % SZ_2M ||
+         fdt_totalsize(fdt_paddr) > BOOT_FDT_VIRT_SIZE )
+        return NULL;
+
+    BUILD_BUG_ON(BOOT_FDT_VIRT_START % SZ_2M);
+
+    dt_virt_base = BOOT_FDT_VIRT_START;
+    dt_virt_size = BOOT_FDT_VIRT_SIZE;
+
+    /* Map device tree */
+    setup_initial_mapping(&mmu_desc, dt_virt_base,
+                    dt_virt_base + dt_virt_size,
+                    dt_phys_base);
+
+    return (void *)dt_virt_base;
+}
+
 void put_page(struct page_info *page)
 {
     BUG_ON("unimplemented");
-- 
2.45.2



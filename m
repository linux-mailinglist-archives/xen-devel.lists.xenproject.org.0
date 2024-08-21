Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF42795A267
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 18:06:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781299.1190905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgnqw-0005YX-1c; Wed, 21 Aug 2024 16:06:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781299.1190905; Wed, 21 Aug 2024 16:06:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgnqv-0005OZ-Qu; Wed, 21 Aug 2024 16:06:29 +0000
Received: by outflank-mailman (input) for mailman id 781299;
 Wed, 21 Aug 2024 16:06:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Njk=PU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sgnqt-0003uu-WB
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 16:06:28 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 518bb267-5fd7-11ef-8776-851b0ebba9a2;
 Wed, 21 Aug 2024 18:06:26 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-53346132348so2053752e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2024 09:06:26 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5334c75a2cbsm18101e87.187.2024.08.21.09.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2024 09:06:24 -0700 (PDT)
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
X-Inumbo-ID: 518bb267-5fd7-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724256386; x=1724861186; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+WwxRSxk0qCYUDqFKxcxr8bTjqN9cnWLzbcX46CN8Q=;
        b=nfXcXXqZRgsY/pNqgs76Eq8QzdlIYiHPAu6UnbTNYlYOXYMlVbUcgHFfImms2V3ebB
         nP5te9gk9oZfTt+R2Y81mtHRqSsMrGx5xsQf+oPfya/gjxr7o4nodHzWQduifLONzieo
         apGKgL2dWD2xWXnaVVPKIwLCuf7ZSYPsVaV8ARWvM0NdAz7kNbM2E3+duwccaG0zSfkq
         qlC6V1yHH9lvxOr3y5qa1MjnvQZ+q03gD2y93wHiFkmPrmCLr6OTn27116tD4Z3dLvcX
         TiPm56vDjNtiGIVe6pU4UBwcCY1oDth1FgXONfr5OCMScHMk/9/XQ6aPA8TAtInxbvUS
         uTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724256386; x=1724861186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r+WwxRSxk0qCYUDqFKxcxr8bTjqN9cnWLzbcX46CN8Q=;
        b=XrDJuKG/AGd8srfOOZ9DPwziyuXYLmOgOkfVx/Q27kFX1WO6xS9TR07A/qeeiCdXKI
         Px0+dEtvNUuYTZ47Fh+wMBbqzGI7PlLZhJP/2jsjW2aGLavRgoOVfjGTfFNJJ5mhbK6V
         CmfGOFILsz/hTj0bHpbbmkFv3qJF1H2ChFHDqcpbZkVcS5gEQDoAb/k/zo3k5XO98juy
         aiLv92FzLdyXhyrI1WWIQ9GUO6hDnY2KHgeRCxey0Lb6tsjAcIbjbEaOuH5Vj/LpBqxE
         wNbmV7WgjL8kyy7puDGNy5BvToiNPL+rYQxrWZd/fvAQ1QWL2IO+c7mtzDNMPbLgspL0
         ax5A==
X-Gm-Message-State: AOJu0YzHjFw51JNiX+xem4TKMflq1/8vsAj09G9/QxJV9CTpx9l6DehG
	LJu/n9NDhxii9FymCgSfUa6WCE88iEqSnhxoFbWfkRbeKGRDhEID3ccxsA==
X-Google-Smtp-Source: AGHT+IFqxrXDaah+BbfdhrfjN9h4mYDI3oI4pO8J9A7mOr/p/0aQb2HnPhoznB6GwK1pSZzXIysnOw==
X-Received: by 2002:a05:6512:234e:b0:531:4c6d:b8ef with SMTP id 2adb3069b0e04-5334854a59fmr2037352e87.6.1724256384896;
        Wed, 21 Aug 2024 09:06:24 -0700 (PDT)
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
Subject: [PATCH v5 7/7] xen/riscv: introduce early_fdt_map()
Date: Wed, 21 Aug 2024 18:06:16 +0200
Message-ID: <4f6573d6b0d996b2c2bc4721de74e9bb51baec8c.1724256027.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1724256026.git.oleksii.kurochko@gmail.com>
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce function which allows to map FDT to Xen.

Also, initialization of device_tree_flattened happens using
early_fdt_map().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5:
 - drop usage of PTE_BLOCK for flag argument of map_pages_to_xen() in early_fdt_map()
   as block mapping is now default behaviour. Also PTE_BLOCK was dropped in the patch
   "xen/riscv: page table handling".
---
Changes in V4:
 - s/_PAGE_BLOCK/PTE_BLOCK
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>
 - unwarap two lines in panic() in case when device_tree_flattened is NULL
   so  grep-ing for any part of the message line will always produce a hit.
 - slightly update the commit message.
---
Changes in V3:
 - Code style fixes
 - s/SZ_2M/MB(2)
 - fix condition to check if early_fdt_map() in setup.c return NULL or not.
---
Changes in V2:
 - rework early_fdt_map to use map_pages_to_xen()
 - move call early_fdt_map() to C code after MMU is enabled.
---
 xen/arch/riscv/include/asm/mm.h |  2 ++
 xen/arch/riscv/mm.c             | 55 +++++++++++++++++++++++++++++++++
 xen/arch/riscv/setup.c          |  7 +++++
 3 files changed, 64 insertions(+)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index ce1557bb27..4b7b00b850 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -259,4 +259,6 @@ static inline unsigned int arch_get_dma_bitsize(void)
 
 void setup_fixmap_mappings(void);
 
+void *early_fdt_map(paddr_t fdt_paddr);
+
 #endif /* _ASM_RISCV_MM_H */
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index e8430def14..4a628aef83 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -1,13 +1,16 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/bootfdt.h>
 #include <xen/bug.h>
 #include <xen/compiler.h>
 #include <xen/init.h>
 #include <xen/kernel.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/macros.h>
 #include <xen/mm.h>
 #include <xen/pfn.h>
 #include <xen/sections.h>
+#include <xen/sizes.h>
 
 #include <asm/early_printk.h>
 #include <asm/csr.h>
@@ -369,3 +372,55 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
     BUG_ON("unimplemented");
     return -1;
 }
+
+void * __init early_fdt_map(paddr_t fdt_paddr)
+{
+    /* We are using 2MB superpage for mapping the FDT */
+    paddr_t base_paddr = fdt_paddr & XEN_PT_LEVEL_MAP_MASK(1);
+    paddr_t offset;
+    void *fdt_virt;
+    uint32_t size;
+    int rc;
+
+    /*
+     * Check whether the physical FDT address is set and meets the minimum
+     * alignment requirement. Since we are relying on MIN_FDT_ALIGN to be at
+     * least 8 bytes so that we always access the magic and size fields
+     * of the FDT header after mapping the first chunk, double check if
+     * that is indeed the case.
+     */
+    BUILD_BUG_ON(MIN_FDT_ALIGN < 8);
+    if ( !fdt_paddr || fdt_paddr % MIN_FDT_ALIGN )
+        return NULL;
+
+    /* The FDT is mapped using 2MB superpage */
+    BUILD_BUG_ON(BOOT_FDT_VIRT_START % MB(2));
+
+    rc = map_pages_to_xen(BOOT_FDT_VIRT_START, maddr_to_mfn(base_paddr),
+                          MB(2) >> PAGE_SHIFT,
+                          PAGE_HYPERVISOR_RO);
+    if ( rc )
+        panic("Unable to map the device-tree.\n");
+
+    offset = fdt_paddr % XEN_PT_LEVEL_SIZE(1);
+    fdt_virt = (void *)BOOT_FDT_VIRT_START + offset;
+
+    if ( fdt_magic(fdt_virt) != FDT_MAGIC )
+        return NULL;
+
+    size = fdt_totalsize(fdt_virt);
+    if ( size > BOOT_FDT_VIRT_SIZE )
+        return NULL;
+
+    if ( (offset + size) > MB(2) )
+    {
+        rc = map_pages_to_xen(BOOT_FDT_VIRT_START + MB(2),
+                              maddr_to_mfn(base_paddr + MB(2)),
+                              MB(2) >> PAGE_SHIFT,
+                              PAGE_HYPERVISOR_RO);
+        if ( rc )
+            panic("Unable to map the device-tree\n");
+    }
+
+    return fdt_virt;
+}
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index f147ba672f..c9a6909c91 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -2,6 +2,7 @@
 
 #include <xen/bug.h>
 #include <xen/compile.h>
+#include <xen/device_tree.h>
 #include <xen/init.h>
 #include <xen/mm.h>
 
@@ -56,6 +57,12 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     setup_fixmap_mappings();
 
+    device_tree_flattened = early_fdt_map(dtb_addr);
+    if ( !device_tree_flattened )
+        panic("Invalid device tree blob at physical address %#lx. The DTB must be 8-byte aligned and must not exceed %lld bytes in size.\n\n"
+              "Please check your bootloader.\n",
+              dtb_addr, BOOT_FDT_VIRT_SIZE);
+
     printk("All set up\n");
 
     for ( ;; )
-- 
2.46.0



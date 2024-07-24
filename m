Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E79693B3B7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 17:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764298.1174780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWdy9-00017v-PE; Wed, 24 Jul 2024 15:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764298.1174780; Wed, 24 Jul 2024 15:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWdy9-000148-Im; Wed, 24 Jul 2024 15:31:57 +0000
Received: by outflank-mailman (input) for mailman id 764298;
 Wed, 24 Jul 2024 15:31:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fJNX=OY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWdy7-0005Oj-33
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 15:31:55 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db1383a3-49d1-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 17:31:54 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ef1c12ae23so49923951fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 08:31:54 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ef2b568858sm13237311fa.35.2024.07.24.08.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 08:31:53 -0700 (PDT)
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
X-Inumbo-ID: db1383a3-49d1-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721835114; x=1722439914; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A07ZG27CUr7oIHQ1UgxonLp6epcHXS0L6tvykTUJZJg=;
        b=AnJUY6WFojC+AmQGEI+GUc3vSX26bDaFMnW+7bIPxXsGBWcTsdlR/HU1EQKeqzakZ8
         PTapD2Gf+0fm9mMWD+yb8iLbZS+IUgz6wowA4Cb/XvW6Dbq7IQFVfISU96FAj9yhAXBC
         rTh+TTuFuqDjTJeSImVqCj07wL0J8HFCY9YQ6kfQt5xe9etn603BmYANOSrmyxkBAAZY
         jOYlahjSuovUY9wp3Uwv4tAjnSCIW4Yya0jSSKXK7lSTg5Y+/cv+1rxF8Geg47rhFANc
         aW3Sk1WU0dOQBokBNU8xgs/3bEiRUcepvFWUKmoaYhUu3Mr+BUq5ktxoXqwmbs8D/Sgc
         eHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721835114; x=1722439914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A07ZG27CUr7oIHQ1UgxonLp6epcHXS0L6tvykTUJZJg=;
        b=rSoJGIwB1iOK1HYIYtp/ZLqOkMZzAImsbhGWPV4uQ2fKic7BbI/zZ83MOVX+D0ahmF
         z06z01EfY86OXiCI9UZw+D3JaY/nupQSeFQrZNDPRIv4GLi9M8Go1BRNuZtg7Mh5ByHG
         zGqw1QBRx22fg89/BDtVhTHhezBgw6Us7iZ9oeJFzPcLfwhK7XthCFzJ4DavaI04OVuz
         VDhmI3U4stPvkDJ8RkLLGgOSWBioKxILAzaHS7r6FWw+PYicKtQ94h0jq2S096Xs92WR
         cLuIJS42dgJ7UC1uA5vd0hTfw7yiJxCH3RhwCPcRXTEs1v4oj5BZ8XsiBVxS1SV2/Nvj
         SrMQ==
X-Gm-Message-State: AOJu0Yy64/qZWZaVDOveNvEDuBNj2/HBMNiH/0PqwXqtkFYHj70Wk3yT
	5wHRDVZxFVaGDDFXw1j17KVi6OGXSQ1iGx2w5t31d9z/j7cXfhr1A6zyOWNd
X-Google-Smtp-Source: AGHT+IHKr9lRaxusHvpeu6vtWMcM0TrPaCtck08FGRlrObEi34V5vGEu0lFgr4d2GB0xW+qdGgCU8w==
X-Received: by 2002:a2e:b536:0:b0:2ee:4c2e:3d3b with SMTP id 38308e7fff4ca-2f039c8aaa4mr1691831fa.4.1721835113854;
        Wed, 24 Jul 2024 08:31:53 -0700 (PDT)
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
Subject: [PATCH v3 9/9] xen/riscv: introduce early_fdt_map()
Date: Wed, 24 Jul 2024 17:31:40 +0200
Message-ID: <9b1d88b2ad6ba81e925fb4a560a2a2899b5e0b36.1721834549.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721834549.git.oleksii.kurochko@gmail.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce function which allows to map FDT to Xen.

Also, initialization of device_tree_flattened happens using early_fdt_map.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/setup.c          |  9 ++++++
 3 files changed, 66 insertions(+)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index a7550e77a7..56375bf833 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -259,4 +259,6 @@ static inline unsigned int arch_get_dma_bitsize(void)
 
 void setup_fixmap_mappings(void);
 
+void *early_fdt_map(paddr_t fdt_paddr);
+
 #endif /* _ASM_RISCV_MM_H */
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index ecb0f15fa8..3ca2cc1950 100644
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
@@ -388,3 +391,55 @@ inline pte_t mfn_to_xen_entry(mfn_t mfn, unsigned int access_bits)
 
     return pte;
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
+                          PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
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
+                              PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
+        if ( rc )
+            panic("Unable to map the device-tree\n");
+    }
+
+    return fdt_virt;
+}
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 497e273081..e5f32a142a 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -2,6 +2,7 @@
 
 #include <xen/bug.h>
 #include <xen/compile.h>
+#include <xen/device_tree.h>
 #include <xen/init.h>
 #include <xen/mm.h>
 
@@ -64,6 +65,14 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     setup_fixmap_mappings();
 
+    device_tree_flattened = early_fdt_map(dtb_addr);
+    if ( !device_tree_flattened )
+        panic("Invalid device tree blob at physical address %#lx.\n"
+              "The DTB must be 8-byte aligned and must not exceed %lld "
+              "bytes in size.\n\n"
+              "Please check your bootloader.\n",
+              dtb_addr, BOOT_FDT_VIRT_SIZE);
+
     printk("All set up\n");
 
     for ( ;; )
-- 
2.45.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB25A978549
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 17:58:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798305.1208547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp8gz-0003ST-05; Fri, 13 Sep 2024 15:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798305.1208547; Fri, 13 Sep 2024 15:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp8gy-0003NW-Sz; Fri, 13 Sep 2024 15:58:40 +0000
Received: by outflank-mailman (input) for mailman id 798305;
 Fri, 13 Sep 2024 15:58:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSyI=QL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sp8gw-0000AA-VZ
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 15:58:39 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd1cd72d-71e8-11ef-99a2-01e77a169b0f;
 Fri, 13 Sep 2024 17:58:16 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53654dbde59so3215303e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 08:58:16 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f9038e3sm2348008e87.187.2024.09.13.08.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:58:15 -0700 (PDT)
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
X-Inumbo-ID: fd1cd72d-71e8-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726243096; x=1726847896; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/ioVWfo+c25+X25ITa+H5O+IJ2AZFo+cHopUsdeVRk=;
        b=MZdk5U8UYb8p0ROO0SVbVVAoGDf7gs8VnjYcZFR4ItmD3F8v8wCMUheOitf1d3QkMF
         ouSD+S3mYWindOfkvwQB6iOwc/uOcVdPUXzqNPFcce+mdxTJcKJbibwHomKLWa2fazDp
         g88vFnOENVl8buc0JHGVl0ClnuC5Lbtqj5aSISafIKm9SXmpdtbFtHBGJZxxD4QYjZnK
         UEojevGjPO3Lf7+Z9aJFfMF1glebOBaGzaWwpnzi4p1VzgMi9X/KaHx8CbQLgGcJTV6K
         Q2GD3jTs+jlx44Wa8xh7BP62L3I2M5T6E+oJx89WSzxbNUkn0V0Dyww0FuHL4DkO+Bwa
         hbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726243096; x=1726847896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/ioVWfo+c25+X25ITa+H5O+IJ2AZFo+cHopUsdeVRk=;
        b=EhpuRuY8iAuwGdK5rQ0mlasTLQUJXesUUGqYiaTbO10OFRlME9544Kfua/EQwxecsz
         oELxfxBH8xmJU+8cSJ9ipllSpDCWWTxryp9sFhhs4kv+tkzyKscnBTwoI+L3g8Sn4qCR
         Xme+2P5LLNx/MkIxnFEuwViillWV/JbjYeRilCz4n+Ttspd/cJSaRpdezKvypZdSbhIu
         XfxhB25AIdCMHrlhb+Hzhx79XzlySTusjBV3Ibav21RiNH8yAxQuLD5xk+TmWBgHW8ce
         OFrUYEHp8EptcQ9qxak3P2ErV+ZcqOb1uysyAUJIFwXMdHKG2Uwk5dqgOSoHSpsQoHkL
         dBCA==
X-Gm-Message-State: AOJu0YwvrDFZd8/UXCaVbgKQ5KhTlggIZ3Vt3fMaQvCCeAbUohtkNdWz
	II9liBqOtcR0TUkWD3LjUXKNskGyff7bL290EOLVdUkEWZIpMj/DHZX/bw==
X-Google-Smtp-Source: AGHT+IG7IYI4VwgOMLP4Poeo2P8sp8gArtyVd6suZyTdMHCwIbh/u7kBtoUgT6sRevxjOaDNZ8EEpQ==
X-Received: by 2002:a05:6512:2814:b0:52f:336:e846 with SMTP id 2adb3069b0e04-5366b933140mr4457499e87.14.1726243095545;
        Fri, 13 Sep 2024 08:58:15 -0700 (PDT)
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
Subject: [PATCH v7 8/8] xen/riscv: introduce early_fdt_map()
Date: Fri, 13 Sep 2024 17:57:46 +0200
Message-ID: <c62e94a7ac9176cb10a552dc406c092a11a2c6e2.1726242605.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726242605.git.oleksii.kurochko@gmail.com>
References: <cover.1726242605.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce function which allows to map FDT to Xen.

Also, initialization of device_tree_flattened happens using
early_fdt_map().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V6-V7:
 - Nothing changed. Only rebase.
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
index e73248c035..2980e300c6 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -2,6 +2,7 @@
 
 #include <xen/bug.h>
 #include <xen/compile.h>
+#include <xen/device_tree.h>
 #include <xen/init.h>
 #include <xen/mm.h>
 #include <xen/shutdown.h>
@@ -57,6 +58,12 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     setup_fixmap_mappings();
 
+    device_tree_flattened = early_fdt_map(dtb_addr);
+    if ( !device_tree_flattened )
+        panic("Invalid device tree blob at physical address %#lx. The DTB must be 8-byte aligned and must not exceed %lld bytes in size.\n\n"
+              "Please check your bootloader.\n",
+              dtb_addr, BOOT_FDT_VIRT_SIZE);
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.46.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF517968C9A
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 19:01:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788313.1197877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slAQr-0004a7-MK; Mon, 02 Sep 2024 17:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788313.1197877; Mon, 02 Sep 2024 17:01:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slAQr-0004UW-HE; Mon, 02 Sep 2024 17:01:37 +0000
Received: by outflank-mailman (input) for mailman id 788313;
 Mon, 02 Sep 2024 17:01:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uz6k=QA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1slAQp-0002dz-Of
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 17:01:35 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02c19481-694d-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 19:01:35 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-53436e04447so4613699e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 10:01:35 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535408410f5sm1677618e87.211.2024.09.02.10.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 10:01:33 -0700 (PDT)
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
X-Inumbo-ID: 02c19481-694d-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725296494; x=1725901294; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5CqShvy1X+IfLQdEA3UCNoLebQ2CuAj+ldoJL6mxt8=;
        b=mU1Suh4jsBYEv5SD3rWCDPb6JGO/F762ZT9vypr0ATLyd65DxF2H+0advML8HCzUBJ
         cmTAVD9zFHr8KhLitoqe0lVKEDmpARyvTv6ddFNt7dt79r47CcUcvauRxF5VP2G2C+TW
         vyETS4Q2UrwOGkhgKQrXhvY3t+evj7x3byp2D9Oa1UJwGsZqCGBcUtj2hiWnJEwHhReL
         4DVX1dMTYVakxQTrJW5cQCfobWlH78EVqXZHWWqQ8eWKMB5EhlO8LoeRhbDe//S8P+A6
         eDQ6YKURD1t3YTvc+AK+8VbBRqZjF77wvaBRoIs5PMBnB1gjRF6mtj/ukUiAgOFmXTVn
         jufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725296494; x=1725901294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5CqShvy1X+IfLQdEA3UCNoLebQ2CuAj+ldoJL6mxt8=;
        b=dVN3yb1grV2x+E6r+4T+bcs9pH+Qjk1hVwibGnAm+y+LTabGU6XVrvCIDINCrjcOZt
         fIdPispaY4XFy2lEcH3HSltWiTATueoD2v/Xm74yS4z4eTGNgBCfgCwe0GgvTCyDOkX9
         y33Lw8VLOIxrOW7mUbQ15ltr+FLNKbeCXFlC5Ewk2y51oOn6XDQ5RkXodgTG854lYiav
         0rzL/QdbGWGh0mjxn3cfI2wxmhFSZcdNEOaxVg7QJhpNjiGmhYb2TPIATnx59taWsH31
         mI98bLDs9b9yBt57RpRtb+RXoLfcHJfI2/3oYKJjbZQcekgAVmSpZHnI2kap/oYTsiWg
         AXOw==
X-Gm-Message-State: AOJu0YzZS1jDWiq8fGTROP9YxDIE7a8EQYhS4glgSLAIqHG/BKWPnoVZ
	oEyBzGePxJGt2g/CKRF6fsbbGqpLKYV7eenLC9UsupnTiV4KE9poDKs1KA==
X-Google-Smtp-Source: AGHT+IGO4Q+xYcVNPAJ1D6gAcHW5VV+5SFTNWbhSH0Nd3J4SrL+XfdvqK4/FsJWLdYvoAfQXtsbDUg==
X-Received: by 2002:a05:6512:3085:b0:530:ad97:78ba with SMTP id 2adb3069b0e04-5353ebb01c6mr5488861e87.9.1725296493640;
        Mon, 02 Sep 2024 10:01:33 -0700 (PDT)
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
Subject: [PATCH v6 9/9] xen/riscv: introduce early_fdt_map()
Date: Mon,  2 Sep 2024 19:01:22 +0200
Message-ID: <b6ab362d36c8168233e403b33f496b0b485babbb.1725295716.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1725295716.git.oleksii.kurochko@gmail.com>
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce function which allows to map FDT to Xen.

Also, initialization of device_tree_flattened happens using
early_fdt_map().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V6:
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
index 164b9cfdd1..a671a5442b 100644
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



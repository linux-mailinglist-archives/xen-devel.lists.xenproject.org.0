Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF11988939
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 18:38:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806466.1217880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDzN-0000Va-4C; Fri, 27 Sep 2024 16:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806466.1217880; Fri, 27 Sep 2024 16:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDzN-0000Sz-04; Fri, 27 Sep 2024 16:38:41 +0000
Received: by outflank-mailman (input) for mailman id 806466;
 Fri, 27 Sep 2024 16:38:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xL9K=QZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1suDuT-0001aC-UI
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 16:33:37 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c35a461-7cee-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 18:33:32 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c5b9d2195eso2758619a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 09:33:32 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27d47a2sm150697966b.89.2024.09.27.09.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 09:33:31 -0700 (PDT)
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
X-Inumbo-ID: 3c35a461-7cee-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727454812; x=1728059612; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghl72hwaxwhJtVodRAQ4IqGk8w7bdQ1cXJih3Z6pDfI=;
        b=aJmNJ4bmjR1x27STdMBQx9CMBLQIQQGtNzyMZuDyfqLbc3QeSjojkmQ8kk+tZRFlrl
         Qbobq4JVaWnkZTHCsrCVX4qvvetK9C/7iS95GqYkbIAwauYE3K66Pac1DuZP00/lALQ2
         ScBGutzmQ4LxL0L7sFtr09lh/C6xfqFid6b7VAul0X2CAn0MIzibofPUcYlfOKJyqtX9
         hgM1NgpzPZekdFxWscRI/7GcOKKGd3KP7TQ2YzeuYSHVbE2dE0aP364+WCEeZJTkzTUl
         tfBV8HNu3/4KVfYGEQG3ihcewW8rYkFelWmKOE6NhcYifpLVnz3TdFfLp8vCyypvhWV9
         1Mcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727454812; x=1728059612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ghl72hwaxwhJtVodRAQ4IqGk8w7bdQ1cXJih3Z6pDfI=;
        b=ruTh7/1wrct3cPtL/JnijsI7ufxq/X/N+DDjDNKhYXqdEkhSxzndwv6IZsvD7KdA1F
         +ZPI0i1uAzDCAbgrvcyy8/pvrb0sD9sOss9rZ20dR9wxPAAX2tUoDzspBHVb43k78GK4
         vhU6vkr1pdknSavXgpgt+DHBL9zDNRv+QO5yhwQKzBMcN1y3ZUWAWeqsicG1yD4CxBaz
         ofHTzcSnae0KKIVliWxaFoAH+uxCag1Lo4U4uqp6wD09iK/HHxQGxKeo4nOF/ClstVBq
         I3JWdNW7WVIDQvTi+vNnkN7mxWeaPy9i2gdu0A4b6VHJ1GROBUYkx4gVhRDvwqkbm5bZ
         nwWg==
X-Gm-Message-State: AOJu0Yx5qUxLHzmn8JjiAova0hebdjM/UzRDoDaRVe9/HDQujcokNqAC
	rQJ/4Tp5KAVOXftXJbwV+jmBY7y3qRZe7gXszG8EdavkZ86UmylSWhZoAQ==
X-Google-Smtp-Source: AGHT+IFg4M+WfEDQE2Zk/Wh79VNEHm6x6c0tNkZGB1AmvmEqyvMOU0ctCqPpEzyJeQRLNVjYWdLLug==
X-Received: by 2002:a17:906:730d:b0:a7a:a0c2:8be9 with SMTP id a640c23a62f3a-a93c4908e28mr387347866b.18.1727454811793;
        Fri, 27 Sep 2024 09:33:31 -0700 (PDT)
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
Subject: [PATCH v8 7/7] xen/riscv: introduce early_fdt_map()
Date: Fri, 27 Sep 2024 18:33:19 +0200
Message-ID: <65c49e7aa25249cd94be3ce9b850d023c9dff731.1727449154.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727449154.git.oleksii.kurochko@gmail.com>
References: <cover.1727449154.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce function which allows to map FDT to Xen.

Also, initialization of device_tree_flattened happens using
early_fdt_map().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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
index c4fadd36c6..a316901fd4 100644
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
2.46.1



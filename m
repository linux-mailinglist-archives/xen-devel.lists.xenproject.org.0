Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D37394D47F
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 18:20:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774852.1185308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scSLP-00034c-33; Fri, 09 Aug 2024 16:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774852.1185308; Fri, 09 Aug 2024 16:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scSLO-000300-UR; Fri, 09 Aug 2024 16:19:58 +0000
Received: by outflank-mailman (input) for mailman id 774852;
 Fri, 09 Aug 2024 16:19:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k3r+=PI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1scSLO-0001ij-3j
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 16:19:58 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37776298-566b-11ef-8776-851b0ebba9a2;
 Fri, 09 Aug 2024 18:19:56 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52f04150796so2878963e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Aug 2024 09:19:56 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530de481f09sm1028479e87.285.2024.08.09.09.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 09:19:55 -0700 (PDT)
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
X-Inumbo-ID: 37776298-566b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723220396; x=1723825196; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZjU7tjw7yR1bbBEbhVz3zSJgKCsTCh3BPJUsr71Vos=;
        b=gZAKfx6AkDFwuKsdVdu31/JbZhQQNy+T6M+8tyWs3QYBpGVeC9PPsfQkbprYke8qk5
         RQ0kbkEjY5Cbg1gehKGmLpf77JjK3PzcD/FqFS4fXjYS+pCc44b9E4xl1burV1gxOewY
         rlgmr0VwRyHJuleHopx3Xh3UpylBc8iPfHmynfQD4fUAFOZ2KT6yHTnWogvI6f6YP/P7
         pOSKsRH9dvyISo/ppfnrvoKg/Ea0sFRHIpuO7Ri9fkTlay5jqWHWx3nfmN9O6RV0/NfD
         NoVc7RbnqvL1O1j1F8z3Zkgbs6eCLFkVZlIRwBTUISB0FFPCTHTB22AelMqv5TzWxpWd
         1jXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723220396; x=1723825196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tZjU7tjw7yR1bbBEbhVz3zSJgKCsTCh3BPJUsr71Vos=;
        b=pNog6Hdos8XVwFcuNW6j0SSQ4EuXbwRLSv4Aq2hpiu9yzT6eJ1U6wwPzsmCfPMxY0j
         VyjyJMP+znzIjahpYQYSMjL+lEZR8bMJXs/TRyuU/iY5EnH+hwx9R3wBCv1KaFMQnPnt
         NX9fmjxowx3G0VnJqLutEwN6JJu2/Kjfass9wt6m8c4VZBpskAhrH2RUSrhvGf1l0SLL
         uE/NxZOmERj6pHARjZTVziTUXa9c6+G40fL2/W0E2+dAIEEOueIOx5TVf9jPv850S2xw
         v12D+FRLu/pJwGp86sX1/V8hVwboC7yNK0a0L1cTUZroQDJz1N4D0/LVJ1A3icq5L1Tm
         7yDg==
X-Gm-Message-State: AOJu0YzBnzPE+lmHS7Kw/JDQrKeSxSSRdMwpbcXkXkXAj/NJiunVYnLL
	656wNZ3HRbGM+buJ599sWZyTYuZusazm89Ahe3wCGP5dhWhYOMP0nj6WfQ==
X-Google-Smtp-Source: AGHT+IEMfAmZNvQfwPOK0DuxWEaTHAqUzrKAEacRMR6M+Mqbr1p7KpJDBcoxFWmDl13+aARmZnM3mA==
X-Received: by 2002:a05:6512:ac6:b0:52e:9b68:d2d4 with SMTP id 2adb3069b0e04-530eea1dd3amr1501459e87.56.1723220395451;
        Fri, 09 Aug 2024 09:19:55 -0700 (PDT)
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
Subject: [PATCH v4 7/7] xen/riscv: introduce early_fdt_map()
Date: Fri,  9 Aug 2024 18:19:45 +0200
Message-ID: <98e304fe55e5420aadde60269b4ffb90d25ac39f.1723214540.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1723214540.git.oleksii.kurochko@gmail.com>
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce function which allows to map FDT to Xen.

Also, initialization of device_tree_flattened happens using
early_fdt_map().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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
index e8430def14..df4d22c112 100644
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
+                          PAGE_HYPERVISOR_RO | PTE_BLOCK);
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
+                              PAGE_HYPERVISOR_RO | PTE_BLOCK);
+        if ( rc )
+            panic("Unable to map the device-tree\n");
+    }
+
+    return fdt_virt;
+}
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index a49a8eee90..f7221a80d5 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -2,6 +2,7 @@
 
 #include <xen/bug.h>
 #include <xen/compile.h>
+#include <xen/device_tree.h>
 #include <xen/init.h>
 #include <xen/mm.h>
 
@@ -65,6 +66,12 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
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
2.45.2



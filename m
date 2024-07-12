Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E3892FE64
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 18:23:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758174.1167590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSJ39-0001GJ-E6; Fri, 12 Jul 2024 16:23:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758174.1167590; Fri, 12 Jul 2024 16:23:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSJ39-00013r-2W; Fri, 12 Jul 2024 16:23:11 +0000
Received: by outflank-mailman (input) for mailman id 758174;
 Fri, 12 Jul 2024 16:23:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Ov5=OM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sSJ37-00088h-44
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 16:23:09 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 063835e9-406b-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 18:23:08 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a77b60cafecso282128466b.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 09:23:08 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7ffa13sm358464966b.129.2024.07.12.09.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 09:23:07 -0700 (PDT)
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
X-Inumbo-ID: 063835e9-406b-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720801387; x=1721406187; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UuYdT22MRsxNj+m/qxvp3vMz0BQyhkZgd5tvMn3xWjA=;
        b=f9gEAq/JW4UpwcJ+aJR3cxPChdOMCQvo++QIIJ0v8VsIgAO2o+EeYFWTj+K/jjlzoa
         R/AyZISaxVXJSGqzwvZpBDPdWl7lJOuQJ7HXSLo6ExHnUxGSzsmfr9asuYBtbOCj5x43
         q7/rP2C/Wc37u/eWtcv6or02e9Twos48MQMZgRYW1EZ6NXaVJ5ywGaVJLRc7QnrhMQx9
         xFW8zek/ufO7bramMp2xIvgsmxENUN6o2TRD4iUTtS863CisiufVL1pjlkmm4LfTJsAC
         BMp6be54nLC2O59HKthqbUuDf14S0ZrH7TBTCxaNrXNF3oLu8AP0+Xv7aFYjd/CmxxQC
         eVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720801387; x=1721406187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UuYdT22MRsxNj+m/qxvp3vMz0BQyhkZgd5tvMn3xWjA=;
        b=wjs2OHbTDlw9UERxLQlhjGLgTFLBE6By/rlfzsE3Ww4wEOEZd3l69yWvBGh5zSR2c+
         DHzqL0benaJNu1dhoiXKxRK7mWocJXzleKl0muT7T9vMR2IQs5hqyxDer6aBsMaKVOhf
         LZniPqE4kFaq5FKduCwoxwVbLnT8clsYQp0kwrQH65Hu73cIUjZpcoFaZjjEENZFJGCr
         iGLuf7n3uq1l4CUcjUbXqA7Q4o9nguUkxfJOgLDLBlbD21nQLJxTioZggAM1wKTZfu8Y
         PGKyutb4GhOAeGO5JQrAdcHARlHcfpmgb2u8D0yC3/XY4SsjgMveqIR+V5tYjBsKOAOc
         NhOw==
X-Gm-Message-State: AOJu0YyRzJ69AeKEC1mgauYFuV7i8HLk0kcwqpVKBCDgUgPa1LapR2MR
	gGisdFwKAqHGTuNfyPhxZQJuR61t/sPyzPOw2/xVET5dnvamcE4K8iBFlBm4
X-Google-Smtp-Source: AGHT+IGg4tm4P/AvfgncRObckWKiXb1PdelnW1p4IDShZAQ1Vp7LmwSYxZ2krh9P2f1G2HU2QMYoTQ==
X-Received: by 2002:a17:907:7e9e:b0:a75:1069:5b94 with SMTP id a640c23a62f3a-a780b6b1838mr1083453766b.21.1720801387437;
        Fri, 12 Jul 2024 09:23:07 -0700 (PDT)
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
Subject: [PATCH v2 8/8] xen/riscv: introduce early_fdt_map()
Date: Fri, 12 Jul 2024 18:22:57 +0200
Message-ID: <4e4f94817fb3bba5f52336ea0b4491f7bc867d49.1720799926.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720799925.git.oleksii.kurochko@gmail.com>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce function which allows to map FDT to Xen.

Also, initialization of device_tree_flattened happens using early_fdt_map.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
index c54546c275..a12ef5bb63 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -266,4 +266,6 @@ static inline unsigned int arch_get_dma_bitsize(void)
 
 void setup_fixmap_mappings(void);
 
+void* early_fdt_map(paddr_t fdt_paddr);
+
 #endif /* _ASM_RISCV_MM_H */
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 44f36359c8..428c26b636 100644
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
@@ -435,3 +438,55 @@ inline pte_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr)
 
     return mfn_to_pte(mfn);
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
+    BUILD_BUG_ON(BOOT_FDT_VIRT_START % SZ_2M);
+
+    rc = map_pages_to_xen(BOOT_FDT_VIRT_START, maddr_to_mfn(base_paddr),
+                          SZ_2M >> PAGE_SHIFT,
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
+    if ( (offset + size) > SZ_2M )
+    {
+        rc = map_pages_to_xen(BOOT_FDT_VIRT_START + SZ_2M,
+                              maddr_to_mfn(base_paddr + SZ_2M),
+                              SZ_2M >> PAGE_SHIFT,
+                              PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
+        if ( rc )
+            panic("Unable to map the device-tree\n");
+    }
+
+    return fdt_virt;
+}
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 13f0e8c77d..21628b7300 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -2,6 +2,7 @@
 
 #include <xen/bug.h>
 #include <xen/compile.h>
+#include <xen/device_tree.h>
 #include <xen/init.h>
 #include <xen/mm.h>
 
@@ -48,6 +49,14 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     setup_fixmap_mappings();
 
+    device_tree_flattened = early_fdt_map(dtb_addr);
+    if ( device_tree_flattened )
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



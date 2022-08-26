Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D5D5A2809
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 14:52:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393761.632970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRYoK-0003fa-7l; Fri, 26 Aug 2022 12:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393761.632970; Fri, 26 Aug 2022 12:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRYoK-0003U6-2A; Fri, 26 Aug 2022 12:51:44 +0000
Received: by outflank-mailman (input) for mailman id 393761;
 Fri, 26 Aug 2022 12:51:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z28m=Y6=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1oRYoI-00013M-H9
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 12:51:42 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5106182-253d-11ed-9250-1f966e50362f;
 Fri, 26 Aug 2022 14:51:41 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id w20so1965831edd.10
 for <xen-devel@lists.xenproject.org>; Fri, 26 Aug 2022 05:51:41 -0700 (PDT)
Received: from carlo-ubuntu.. (hipert-gw1.mat.unimo.it. [155.185.5.1])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a1709063cb200b006ff0b457cdasm888812ejh.53.2022.08.26.05.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:51:40 -0700 (PDT)
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
X-Inumbo-ID: d5106182-253d-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=5ZYX74i6LNybppj1kPT1aVudjHbJkWqFfMxF9yVRhVY=;
        b=O5sRob496fZhG2BZn4uIt5GZ3ja7k1UqYhko8MlIjEUtXueOnpsv2F1pQFcbOF21vZ
         o4EYz5MBaf6XzranrszO0sqEhgTv1T9KU+fWWk1v6dYI09ydgcfOAnY1UPLYGeSxZYYn
         dz9MvRNFShUbxZW4x2310DD4jfKF7oZumLS0VBfTHIKwzIN48Xi2Xd7kRBtiB+4z3rsU
         P40X+M14muXCGKd+0PGo/3YMol84t3/2xoMtwuUrnZe5rnTXlB6wQ98vJWTZqLTN4RIQ
         3BhKh66ooKHwZ6wIc7Cy01dPbbZ3UIdaVvw2/XQEiZkF3HT/Z99x5+Usoz8edjxl5n0N
         kmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=5ZYX74i6LNybppj1kPT1aVudjHbJkWqFfMxF9yVRhVY=;
        b=nMQ0f1sqF7uhPtW9U3ubBAZL+yw5Xd96a9Gmyr7vjePGYH1eMMv7mhDMLsUhXQNdlL
         nMleuO5dgAH368l/xX71dvMM31eYSmlGa8yqO1JOymmOM/j9ml7HRyFN7Uqzn6k7I2zt
         FvKQlKyTb+vydn7UDGdjfnavWpJAkm7Kv9xsDRAEn14NxWJerz/o+khQK9D9cgkoyiH8
         /MCkWF0ASFtp2275Iq57xqIutoQDl/CpZ9K1zPMFuOYPc/cSvJGUY5kbR0PoSaHTa3ZE
         F/Vq8BzgiPHj+LUdeM5QKlgd/aP+KwQEP0RksZDxGL8TxnyLB14LFcEs/VZSgVpImL0N
         YQUg==
X-Gm-Message-State: ACgBeo2ZDlVNHd6JOj8hi3GNUrMsFVLVAiiGWYhbdhR51SNmmgJXU2nH
	sbB053hHfydN/ivOQW6flmUT+UFxc1cdAA==
X-Google-Smtp-Source: AA6agR53Q+BBK6cYj+MeqnJJqd2wgmTW0fOIWt3YkTx7Ek4v3VbQAc0emVnvQhW665dRlaNdmqwq9g==
X-Received: by 2002:a05:6402:1d51:b0:41f:cf6c:35a5 with SMTP id dz17-20020a0564021d5100b0041fcf6c35a5mr6911189edb.25.1661518301097;
        Fri, 26 Aug 2022 05:51:41 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	jbeulich@suse.com,
	julien@xen.org,
	stefano.stabellini@amd.com,
	wl@xen.org,
	marco.solieri@unimore.it,
	andrea.bastoni@minervasys.tech,
	lucmiccio@gmail.com,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH 09/12] Revert "xen/arm: mm: Initialize page-tables earlier"
Date: Fri, 26 Aug 2022 14:51:08 +0200
Message-Id: <20220826125111.152261-10-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

This reverts commit 3a5d341681af650825bbe3bee9be5d187da35080.

The cache coloring support will be configurable within the Xen command line,
but it will be initialized before the page-tables; this is necessary
for coloring the hypervisor itself beacuse we will create a specific
mapping for it that could be configured using some command line options.
In order to parse all the needed information from the device tree, we
need to revert the above commit and restore the previous order for
page-tables initialization.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 xen/arch/arm/mm.c    | 33 ++++++++++++++++++++-------------
 xen/arch/arm/setup.c |  4 ++--
 2 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index b42cddb1b4..1afa02b4af 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -368,6 +368,17 @@ static inline lpae_t pte_of_xenaddr(vaddr_t va)
     return mfn_to_xen_entry(maddr_to_mfn(ma), MT_NORMAL);
 }
 
+static void __init create_boot_mappings(unsigned long virt_offset,
+                                        mfn_t base_mfn)
+{
+    lpae_t pte;
+
+    pte = mfn_to_xen_entry(base_mfn, MT_NORMAL);
+    write_pte(&boot_second[second_table_offset(virt_offset)], pte);
+    flush_xen_tlb_local();
+}
+
+/* Map the FDT in the early boot page table */
 void * __init early_fdt_map(paddr_t fdt_paddr)
 {
     /* We are using 2MB superpage for mapping the FDT */
@@ -375,7 +386,6 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
     paddr_t offset;
     void *fdt_virt;
     uint32_t size;
-    int rc;
 
     /*
      * Check whether the physical FDT address is set and meets the minimum
@@ -391,12 +401,7 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
     /* The FDT is mapped using 2MB superpage */
     BUILD_BUG_ON(BOOT_FDT_VIRT_START % SZ_2M);
 
-    rc = map_pages_to_xen(BOOT_FDT_VIRT_START, maddr_to_mfn(base_paddr),
-                          SZ_2M >> PAGE_SHIFT,
-                          PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
-    if ( rc )
-        panic("Unable to map the device-tree.\n");
-
+    create_boot_mappings(BOOT_FDT_VIRT_START, maddr_to_mfn(base_paddr));
 
     offset = fdt_paddr % SECOND_SIZE;
     fdt_virt = (void *)BOOT_FDT_VIRT_START + offset;
@@ -410,12 +415,8 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
 
     if ( (offset + size) > SZ_2M )
     {
-        rc = map_pages_to_xen(BOOT_FDT_VIRT_START + SZ_2M,
-                              maddr_to_mfn(base_paddr + SZ_2M),
-                              SZ_2M >> PAGE_SHIFT,
-                              PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
-        if ( rc )
-            panic("Unable to map the device-tree\n");
+        create_boot_mappings(BOOT_FDT_VIRT_START + SZ_2M,
+                             maddr_to_mfn(base_paddr + SZ_2M));
     }
 
     return fdt_virt;
@@ -514,6 +515,12 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
     pte.pt.table = 1;
     xen_second[second_table_offset(FIXMAP_ADDR(0))] = pte;
 
+    /* ... DTB */
+    pte = boot_second[second_table_offset(BOOT_FDT_VIRT_START)];
+    xen_second[second_table_offset(BOOT_FDT_VIRT_START)] = pte;
+    pte = boot_second[second_table_offset(BOOT_FDT_VIRT_START + SZ_2M)];
+    xen_second[second_table_offset(BOOT_FDT_VIRT_START + SZ_2M)] = pte;
+
 #ifdef CONFIG_ARM_64
     ttbr = (uintptr_t) xen_pgtable + phys_offset;
 #else
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 611c93ad7d..bdfc05bf61 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -910,8 +910,6 @@ void __init start_xen(unsigned long boot_phys_offset,
     /* Initialize traps early allow us to get backtrace when an error occurred */
     init_traps();
 
-    setup_pagetables(boot_phys_offset);
-
     smp_clear_cpu_maps();
 
     device_tree_flattened = early_fdt_map(fdt_paddr);
@@ -938,6 +936,8 @@ void __init start_xen(unsigned long boot_phys_offset,
                              (paddr_t)(uintptr_t)(_end - _start + 1), false);
     BUG_ON(!xen_bootmodule);
 
+    setup_pagetables(boot_phys_offset);
+
     setup_mm();
 
     /* Parse the ACPI tables for possible boot-time configuration */
-- 
2.34.1



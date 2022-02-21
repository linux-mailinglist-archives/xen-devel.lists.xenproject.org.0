Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8EC4BD915
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 11:22:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275994.472082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5py-0006O7-2o; Mon, 21 Feb 2022 10:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275994.472082; Mon, 21 Feb 2022 10:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5px-0006HB-Lm; Mon, 21 Feb 2022 10:22:33 +0000
Received: by outflank-mailman (input) for mailman id 275994;
 Mon, 21 Feb 2022 10:22:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nM5pv-0005iU-7R
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 10:22:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM5pv-0002C8-37; Mon, 21 Feb 2022 10:22:31 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM5pu-00070b-S1; Mon, 21 Feb 2022 10:22:31 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=m0aLEbK54kAkQt7srRGP8ZDAT2HpX86Y4s8RUrJJBLI=; b=z3x1rDlnxMesdj9WXzr3h3/heK
	Dlu/SsDx31w1y3YKAWXT4NuufWw+g6cm5+XJ0yg4LlcZz9s7rslvsZ11GlZ+CLEj6zsSzm1sagUg8
	54huy996LvdrKXYXtDPp9Ouvc7TEzOy8rCyt+hSJVxKGKhBmI9Qoi4t60d2r6Cfm2Vrs=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <julien.grall@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 08/19] xen/arm: mm: Re-implement early_fdt_map() using map_pages_to_xen()
Date: Mon, 21 Feb 2022 10:22:07 +0000
Message-Id: <20220221102218.33785-9-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220221102218.33785-1-julien@xen.org>
References: <20220221102218.33785-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <julien.grall@arm.com>

Now that map_pages_to_xen() has been extended to support 2MB mappings,
we can replace the create_mappings() calls by map_pages_to_xen() calls.

The mapping can also be marked read-only has Xen as no business to
modify the host Device Tree.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - Add my AWS signed-off-by
        - Fix typo in the commit message
---
 xen/arch/arm/mm.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index f088a4b2de96..24de8dcb9042 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -559,6 +559,7 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
     paddr_t offset;
     void *fdt_virt;
     uint32_t size;
+    int rc;
 
     /*
      * Check whether the physical FDT address is set and meets the minimum
@@ -574,8 +575,12 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
     /* The FDT is mapped using 2MB superpage */
     BUILD_BUG_ON(BOOT_FDT_VIRT_START % SZ_2M);
 
-    create_mappings(xen_second, BOOT_FDT_VIRT_START, paddr_to_pfn(base_paddr),
-                    SZ_2M >> PAGE_SHIFT, SZ_2M);
+    rc = map_pages_to_xen(BOOT_FDT_VIRT_START, maddr_to_mfn(base_paddr),
+                          SZ_2M >> PAGE_SHIFT,
+                          PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
+    if ( rc )
+        panic("Unable to map the device-tree.\n");
+
 
     offset = fdt_paddr % SECOND_SIZE;
     fdt_virt = (void *)BOOT_FDT_VIRT_START + offset;
@@ -589,9 +594,12 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
 
     if ( (offset + size) > SZ_2M )
     {
-        create_mappings(xen_second, BOOT_FDT_VIRT_START + SZ_2M,
-                        paddr_to_pfn(base_paddr + SZ_2M),
-                        SZ_2M >> PAGE_SHIFT, SZ_2M);
+        rc = map_pages_to_xen(BOOT_FDT_VIRT_START + SZ_2M,
+                              maddr_to_mfn(base_paddr + SZ_2M),
+                              SZ_2M >> PAGE_SHIFT,
+                              PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
+        if ( rc )
+            panic("Unable to map the device-tree\n");
     }
 
     return fdt_virt;
-- 
2.32.0



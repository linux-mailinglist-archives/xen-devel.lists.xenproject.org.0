Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 140FA36A91E
	for <lists+xen-devel@lfdr.de>; Sun, 25 Apr 2021 22:13:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117307.223183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lal8J-0001jl-T6; Sun, 25 Apr 2021 20:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117307.223183; Sun, 25 Apr 2021 20:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lal8J-0001iD-Gq; Sun, 25 Apr 2021 20:13:35 +0000
Received: by outflank-mailman (input) for mailman id 117307;
 Sun, 25 Apr 2021 20:13:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lal8H-0001eY-IA
 for xen-devel@lists.xenproject.org; Sun, 25 Apr 2021 20:13:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lal8H-0000ow-92; Sun, 25 Apr 2021 20:13:33 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lal8H-0005m7-0N; Sun, 25 Apr 2021 20:13:33 +0000
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
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=BjS7PbV9YIvothNxojvfyxpwJGXVh+HIjQYc5MW8oEY=; b=5HLK2dyh1X7dCPn8EtxAG9MCg
	Bsj2Nv2kLQNEpk6BmPmNgnoREbSJ8Ey6254znwK/FVhZvMRRVfzwomElROXT24J4u34Avbssq+C0b
	NIrGT3Cae/S5MRKrG9thBQjGB4MOjLU4O0CUmtuFf5eWGgBQMki4bjoQEFLQw+9MHNe/c=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Wei.Chen@arm.com,
	Henry.Wang@arm.com,
	Penny.Zheng@arm.com,
	Bertrand.Marquis@arm.com,
	Julien Grall <julien.grall@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH RFCv2 07/15] xen/arm: mm: Re-implement early_fdt_map() using map_pages_to_xen()
Date: Sun, 25 Apr 2021 21:13:10 +0100
Message-Id: <20210425201318.15447-8-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210425201318.15447-1-julien@xen.org>
References: <20210425201318.15447-1-julien@xen.org>

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
index 2cbfbe25240e..8fac24d80086 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -558,6 +558,7 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
     paddr_t offset;
     void *fdt_virt;
     uint32_t size;
+    int rc;
 
     /*
      * Check whether the physical FDT address is set and meets the minimum
@@ -573,8 +574,12 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
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
@@ -588,9 +593,12 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
 
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
2.17.1



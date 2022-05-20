Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D3552EB9D
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 14:10:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333902.557869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1Sh-0006Zo-Nq; Fri, 20 May 2022 12:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333902.557869; Fri, 20 May 2022 12:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1Sh-0006Vv-KP; Fri, 20 May 2022 12:10:31 +0000
Received: by outflank-mailman (input) for mailman id 333902;
 Fri, 20 May 2022 12:10:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ns1Sf-0006BN-MN
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 12:10:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ns1Sf-0005oi-J4; Fri, 20 May 2022 12:10:29 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ns1Sf-0001lI-BC; Fri, 20 May 2022 12:10:29 +0000
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
	bh=cJm41f6bVbuh9BtVBTWvTK9jtgSvHumHceiTZgvegME=; b=kWMwtARSZEDeCPKM84SONgQCxm
	zSwLU3CORC3yppW+MV/MuXvyEq4yqQc09qGooh3xSJowT3/Rn+GB/LwJtWD53sn1o6CWX55Mvruh6
	ukX8KEqaHtb/wQ2WkfgC0bjMLOB4+SdMVpp/VEb0Z4Nlxd5fERjFys57PmV9G8P+Xy+Y=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <julien.grall@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>,
	Hongda Deng <Hongda.Heng@arm.com>
Subject: [PATCH 05/16] xen/arm: mm: Re-implement early_fdt_map() using map_pages_to_xen()
Date: Fri, 20 May 2022 13:09:26 +0100
Message-Id: <20220520120937.28925-6-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220520120937.28925-1-julien@xen.org>
References: <20220520120937.28925-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <julien.grall@arm.com>

Now that map_pages_to_xen() has been extended to support 2MB mappings,
we can replace the create_mappings() calls by map_pages_to_xen() calls.

The mapping can also be marked read-only as Xen should not modify
the host Device Tree during boot.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Hongda Deng <Hongda.Heng@arm.com>

---
    Changes in v4:
        - Fix typo in the commit message
        - Add Hongda's reviewed-by

    Changes in v2:
        - Add my AWS signed-off-by
        - Fix typo in the commit message
---
 xen/arch/arm/mm.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 64a79d45b38c..03f970e4d10b 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -574,6 +574,7 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
     paddr_t offset;
     void *fdt_virt;
     uint32_t size;
+    int rc;
 
     /*
      * Check whether the physical FDT address is set and meets the minimum
@@ -589,8 +590,12 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
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
@@ -604,9 +609,12 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
 
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



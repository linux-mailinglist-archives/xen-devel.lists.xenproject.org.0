Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC7752EBB7
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 14:14:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333987.557942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1Wn-0003Wk-9Y; Fri, 20 May 2022 12:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333987.557942; Fri, 20 May 2022 12:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1Wn-0003Po-3n; Fri, 20 May 2022 12:14:45 +0000
Received: by outflank-mailman (input) for mailman id 333987;
 Fri, 20 May 2022 12:14:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ns1Wl-0003NG-Od
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 12:14:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ns1Wl-0005wO-FC; Fri, 20 May 2022 12:14:43 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ns1So-0001lI-U1; Fri, 20 May 2022 12:10:39 +0000
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
	bh=mOn3zp5wUGYujSQe5FrNT0Pt6XF+4/RdAAfK0S+9m+Y=; b=cbG95IzqZm/2Lgg6aseyQY31Zd
	NlLO/aB0E6nWqkJ7QtRqxCA62EP19nQ6MA901oF2mCR+tRSTrLliDccxFa/oS1VwKUcvCTRrBnucP
	tocIDpjaz4VaPd1JbJPa7b2pUe2WURB4Tng+8mkJqFCcWVFFg3jhhUlmLd7qeihrrWSI=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 13/16] xen/arm32: setup: Move out the code to populate the boot allocator
Date: Fri, 20 May 2022 13:09:34 +0100
Message-Id: <20220520120937.28925-14-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220520120937.28925-1-julien@xen.org>
References: <20220520120937.28925-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

In a follow-up patch, we will want to populate the boot allocator
separately for arm64. The code will end up to be very similar to the one
on arm32. So move out the code in a new helper populate_boot_allocator().

For now the code is still protected by CONFIG_ARM_32 to avoid any build
failure on arm64.

Take the opportunity to replace mfn_add(xen_mfn_start, xenheap_pages) with
xenheap_mfn_end as they are equivalent.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

    Changes in v4:
        - Patch added
---
 xen/arch/arm/setup.c | 90 +++++++++++++++++++++++++-------------------
 1 file changed, 51 insertions(+), 39 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index d5d0792ed48a..3d5a2283d4ef 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -637,10 +637,58 @@ static void __init init_staticmem_pages(void)
 }
 
 #ifdef CONFIG_ARM_32
+/*
+ * Populate the boot allocator. All the RAM but the following regions
+ * will be added:
+ *  - Modules (e.g., Xen, Kernel)
+ *  - Reserved regions
+ *  - Xenheap
+ */
+static void __init populate_boot_allocator(void)
+{
+    unsigned int i;
+    const struct meminfo *banks = &bootinfo.mem;
+
+    for ( i = 0; i < banks->nr_banks; i++ )
+    {
+        const struct membank *bank = &banks->bank[i];
+        paddr_t bank_end = bank->start + bank->size;
+        paddr_t s, e;
+
+        s = bank->start;
+        while ( s < bank_end )
+        {
+            paddr_t n = bank_end;
+
+            e = next_module(s, &n);
+
+            if ( e == ~(paddr_t)0 )
+                e = n = bank_end;
+
+            /*
+             * Module in a RAM bank other than the one which we are
+             * not dealing with here.
+             */
+            if ( e > bank_end )
+                e = bank_end;
+
+            /* Avoid the xenheap */
+            if ( s < mfn_to_maddr(xenheap_mfn_end) &&
+                 mfn_to_maddr(xenheap_mfn_start) < e )
+            {
+                e = mfn_to_maddr(xenheap_mfn_start);
+                n = mfn_to_maddr(xenheap_mfn_end);
+            }
+
+            fw_unreserved_regions(s, e, init_boot_pages, 0);
+            s = n;
+        }
+    }
+}
+
 static void __init setup_mm(void)
 {
-    paddr_t ram_start, ram_end, ram_size;
-    paddr_t s, e;
+    paddr_t ram_start, ram_end, ram_size, e;
     unsigned long ram_pages;
     unsigned long heap_pages, xenheap_pages, domheap_pages;
     int i;
@@ -718,43 +766,7 @@ static void __init setup_mm(void)
     setup_xenheap_mappings((e >> PAGE_SHIFT) - xenheap_pages, xenheap_pages);
 
     /* Add non-xenheap memory */
-    for ( i = 0; i < bootinfo.mem.nr_banks; i++ )
-    {
-        paddr_t bank_start = bootinfo.mem.bank[i].start;
-        paddr_t bank_end = bank_start + bootinfo.mem.bank[i].size;
-
-        s = bank_start;
-        while ( s < bank_end )
-        {
-            paddr_t n = bank_end;
-
-            e = next_module(s, &n);
-
-            if ( e == ~(paddr_t)0 )
-            {
-                e = n = ram_end;
-            }
-
-            /*
-             * Module in a RAM bank other than the one which we are
-             * not dealing with here.
-             */
-            if ( e > bank_end )
-                e = bank_end;
-
-            /* Avoid the xenheap */
-            if ( s < mfn_to_maddr(mfn_add(xenheap_mfn_start, xenheap_pages))
-                 && mfn_to_maddr(xenheap_mfn_start) < e )
-            {
-                e = mfn_to_maddr(xenheap_mfn_start);
-                n = mfn_to_maddr(mfn_add(xenheap_mfn_start, xenheap_pages));
-            }
-
-            fw_unreserved_regions(s, e, init_boot_pages, 0);
-
-            s = n;
-        }
-    }
+    populate_boot_allocator();
 
     /* Frame table covers all of RAM region, including holes */
     setup_frametable_mappings(ram_start, ram_end);
-- 
2.32.0



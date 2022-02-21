Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3B74BD932
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 11:51:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276096.472216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6HY-0007kY-81; Mon, 21 Feb 2022 10:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276096.472216; Mon, 21 Feb 2022 10:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6HX-0007Xe-0X; Mon, 21 Feb 2022 10:51:03 +0000
Received: by outflank-mailman (input) for mailman id 276096;
 Mon, 21 Feb 2022 10:50:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nM6HS-0006Ri-Iv
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 10:50:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM6HR-0002lj-HW; Mon, 21 Feb 2022 10:50:57 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM5q4-00070b-Nt; Mon, 21 Feb 2022 10:22:40 +0000
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
	bh=KXQhE4JwQVSql4G63vu+dVWvMWK9F9ZJUhgjQV+fnpo=; b=kiUDonnWYV5KI6PTUUqj8ctYcz
	yYikeIAMlHznE+6xc4wdf0yKc0TZbzy6bNEGTfh5589ds+XgSxqAtBAJr4wSgfAHvvBqAU/MQVsF6
	+sxKmRbotqkUxiJTby08Z8odVirrLOxreHSVhkGJejjb6rzwln9QUJJmmgIRz236QGrY=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 17/19] xen/arm64: mm: Add memory to the boot allocator first
Date: Mon, 21 Feb 2022 10:22:16 +0000
Message-Id: <20220221102218.33785-18-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220221102218.33785-1-julien@xen.org>
References: <20220221102218.33785-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Currently, memory is added to the boot allocator after the xenheap
mappings are done. This will break if the first mapping is more than
512GB of RAM.

In addition to that, a follow-up patch will rework setup_xenheap_mappings()
to use smaller mappings (e.g. 2MB, 4KB). So it will be necessary to have
memory in the boot allocator earlier.

Only free memory (e.g. not reserved or modules) can be added to the boot
allocator. It might be possible that some regions (including the first
one) will have no free memory.

So we need to add all the free memory to the boot allocator first
and then add do the mappings.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v3:
        - Patch added
---
 xen/arch/arm/setup.c | 63 +++++++++++++++++++++++++++++---------------
 1 file changed, 42 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index d5d0792ed48a..777cf96639f5 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -767,30 +767,18 @@ static void __init setup_mm(void)
     init_staticmem_pages();
 }
 #else /* CONFIG_ARM_64 */
-static void __init setup_mm(void)
+static void __init populate_boot_allocator(void)
 {
-    paddr_t ram_start = ~0;
-    paddr_t ram_end = 0;
-    paddr_t ram_size = 0;
-    int bank;
-
-    init_pdx();
+    unsigned int i;
+    const struct meminfo *banks = &bootinfo.mem;
 
-    total_pages = 0;
-    for ( bank = 0 ; bank < bootinfo.mem.nr_banks; bank++ )
+    for ( i = 0; i < banks->nr_banks; i++ )
     {
-        paddr_t bank_start = bootinfo.mem.bank[bank].start;
-        paddr_t bank_size = bootinfo.mem.bank[bank].size;
-        paddr_t bank_end = bank_start + bank_size;
+        const struct membank *bank = &banks->bank[i];
+        paddr_t bank_end = bank->start + bank->size;
         paddr_t s, e;
 
-        ram_size = ram_size + bank_size;
-        ram_start = min(ram_start,bank_start);
-        ram_end = max(ram_end,bank_end);
-
-        setup_xenheap_mappings(bank_start>>PAGE_SHIFT, bank_size>>PAGE_SHIFT);
-
-        s = bank_start;
+        s = bank->start;
         while ( s < bank_end )
         {
             paddr_t n = bank_end;
@@ -798,9 +786,7 @@ static void __init setup_mm(void)
             e = next_module(s, &n);
 
             if ( e == ~(paddr_t)0 )
-            {
                 e = n = bank_end;
-            }
 
             if ( e > bank_end )
                 e = bank_end;
@@ -809,6 +795,41 @@ static void __init setup_mm(void)
             s = n;
         }
     }
+}
+
+static void __init setup_mm(void)
+{
+    const struct meminfo *banks = &bootinfo.mem;
+    paddr_t ram_start = ~0;
+    paddr_t ram_end = 0;
+    paddr_t ram_size = 0;
+    unsigned int i;
+
+    init_pdx();
+
+    /*
+     * We need some memory to allocate the page-tables used for the xenheap
+     * mappings. But some regions may contain memory already allocated
+     * for other uses (e.g. modules, reserved-memory...).
+     *
+     * For simplify add all the free regions in the boot allocator.
+     */
+    populate_boot_allocator();
+
+    total_pages = 0;
+
+    for ( i = 0; i < banks->nr_banks; i++ )
+    {
+        const struct membank *bank = &banks->bank[i];
+        paddr_t bank_end = bank->start + bank->size;
+
+        ram_size = ram_size + bank->size;
+        ram_start = min(ram_start, bank->start);
+        ram_end = max(ram_end, bank_end);
+
+        setup_xenheap_mappings(PFN_DOWN(bank->start),
+                               PFN_DOWN(bank->size));
+    }
 
     total_pages += ram_size >> PAGE_SHIFT;
 
-- 
2.32.0



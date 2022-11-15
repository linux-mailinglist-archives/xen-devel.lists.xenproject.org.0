Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1FE629009
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 03:53:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443653.698408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oum4j-000498-KJ; Tue, 15 Nov 2022 02:53:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443653.698408; Tue, 15 Nov 2022 02:53:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oum4j-00045W-GB; Tue, 15 Nov 2022 02:53:25 +0000
Received: by outflank-mailman (input) for mailman id 443653;
 Tue, 15 Nov 2022 02:53:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkVF=3P=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oum4i-0008Vs-1f
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 02:53:24 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id aa98c8b3-6490-11ed-8fd2-01056ac49cbb;
 Tue, 15 Nov 2022 03:53:22 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0A2111FB;
 Mon, 14 Nov 2022 18:53:27 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D27413F73B;
 Mon, 14 Nov 2022 18:53:18 -0800 (PST)
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
X-Inumbo-ID: aa98c8b3-6490-11ed-8fd2-01056ac49cbb
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v1 10/13] xen/arm: introduce "xen,offset" feature
Date: Tue, 15 Nov 2022 10:52:32 +0800
Message-Id: <20221115025235.1378931-11-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115025235.1378931-1-Penny.Zheng@arm.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We introduce "xen,offset" to handle the case where memory from the owner is
shared with multiple borrowers. Each borrower would have its own offset within
the region shared by the owner.

Add relative check when parsing static shared memory node, to make sure
that "xen,offset" could be only provided in borrower domain, and the value
must be smaller than size. And include according docs in booting.txt.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 docs/misc/arm/device-tree/booting.txt | 19 ++++++++++++++--
 xen/arch/arm/bootfdt.c                | 32 ++++++++++++++++++++++++++-
 2 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 287898ef03..183c41e3c2 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -577,6 +577,16 @@ communication.
     If not specified, the default value is "borrower" and owner is
     DOMID_IO, a system domain.
 
+- xen,offset (Optional)
+
+    A 64-bit integer specifying the offset within a shared memory region.
+    When "xen,offset" is provided, only partial shared memory will be
+    mapped to the borrower domain, starting at the offset and the size
+    being "size - offset".
+
+    "xen,offset" could be only provided in borrower domain, and the value
+    must be smaller than size.
+
 As an example:
 
 chosen {
@@ -660,6 +670,7 @@ chosen {
             xen,shm-id = "my-shared-mem-2";
             role = "borrower";
             xen,shared-mem = <0x90000000 0x20000000>;
+            xen,offset = <0x0 0x10000000>;
         };
 
         ......
@@ -686,5 +697,9 @@ address is not provided by user, Xen will automatically allocate 512MB
 from heap as static shared memory to be shared between DomU1 and DomU2.
 The automatically allocated static shared memory will get mapped at
 0x80000000 in DomU1 guest physical address space, and at 0x90000000 in DomU2
-guest physical address space. DomU1 is explicitly defined as the owner domain,
-and DomU2 is the borrower domain.
+guest physical address space.
+For borrower domain DomU2, only partial static shared memory region
+"my-shared-mem-2" gets mapped, starting at offset 0x10000000 with size of
+256MB.
+DomU1 is explicitly defined as the owner domain, and DomU2 is the borrower
+domain.
diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index efaf49fd56..e642e72f30 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -380,7 +380,7 @@ static int __init process_domain_node(const void *fdt, int node,
 static int __init process_shm_node(const void *fdt, int node,
                                    uint32_t address_cells, uint32_t size_cells)
 {
-    const struct fdt_property *prop, *prop_id, *prop_role;
+    const struct fdt_property *prop, *prop_id, *prop_role, *prop_offset;
     const __be32 *cell;
     paddr_t paddr, gaddr, size;
     struct meminfo *mem = &bootinfo.reserved_mem;
@@ -389,6 +389,7 @@ static int __init process_shm_node(const void *fdt, int node,
     int len;
     bool owner = false, paddr_assigned = true;
     const char *shm_id;
+    uint64_t offset;
 
     if ( address_cells < 1 || size_cells < 1 )
     {
@@ -464,6 +465,35 @@ static int __init process_shm_node(const void *fdt, int node,
         return -EINVAL;
     }
 
+    /*
+     * If "xen,offset" is provided, then only partial shared memory
+     * shall be mapped to borrower domain. The size will be
+     * "psize - offset".
+     * "xen,offset" is a 64-bit integer and an optional property
+     */
+    prop_offset = fdt_get_property(fdt, node, "xen,offset", NULL);
+    if ( prop_offset )
+    {
+        /*
+         * "xen,offset" could be only provided in borrower domain,
+         * and the offset must be smaller than size.
+         */
+        if ( prop_role && !strcmp(prop_role->data, "owner") )
+        {
+            printk("fdt: \"xen,offset\" could not be provided in owner domain\n");
+            return -EINVAL;
+        }
+
+        cell = (const __be32 *)prop_offset->data;
+        offset = dt_next_cell(2, &cell);
+
+        if ( offset >= size )
+        {
+            printk("fdt: invalid \"xen,offset\" value\n");
+            return -EINVAL;
+        }
+    }
+
     for ( i = 0; i < shm_mem->nr_banks; i++ )
     {
         /*
-- 
2.25.1



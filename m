Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C321B782217
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 06:01:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587209.918583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXw6f-00052Z-6h; Mon, 21 Aug 2023 04:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587209.918583; Mon, 21 Aug 2023 04:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXw6f-0004xV-3Q; Mon, 21 Aug 2023 04:01:33 +0000
Received: by outflank-mailman (input) for mailman id 587209;
 Mon, 21 Aug 2023 04:01:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Scea=EG=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qXw6d-0003GX-Bq
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 04:01:31 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 68b5c2a8-3fd7-11ee-8782-cb3800f73035;
 Mon, 21 Aug 2023 06:01:30 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C8461FB;
 Sun, 20 Aug 2023 21:02:10 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2488D3F7CE;
 Sun, 20 Aug 2023 21:01:26 -0700 (PDT)
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
X-Inumbo-ID: 68b5c2a8-3fd7-11ee-8782-cb3800f73035
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v3 6/8] xen/arm: remove shm holes for extended regions
Date: Mon, 21 Aug 2023 12:00:44 +0800
Message-Id: <20230821040046.2965665-7-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230821040046.2965665-1-Penny.Zheng@arm.com>
References: <20230821040046.2965665-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Static shared memory acts as reserved memory in guest, so it shall be
excluded from extended regions.

Extended regions are taken care of under three different scenarios:
normal DomU, direct-map domain with iommu on, and direct-map domain
with iommu off.

For normal DomU, we create a new function "remove_shm_holes_for_domU", to
firstly transfer original outputs into the format of "struct rangeset",
then use "remove_shm_from_rangeset" to remove static shm from them.

For direct-map domain with iommu on, after we get guest shm info from "kinfo",
we use "remove_shm_from_rangeset" to remove static shm.

For direct-map domain with iommu off, as static shm has already been taken
care of through reserved memory banks, we do nothing.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>

---
v1 -> v2:
- new commit
---
v2 -> v3:
- error out non-zero res before remove_shm_holes_for_domU
- rebase
---
 xen/arch/arm/domain_build.c | 97 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 687420956f..1ab41f823e 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1974,6 +1974,32 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
     return 0;
 }
 
+static int __init remove_shm_from_rangeset(const struct kernel_info *kinfo,
+                                           struct rangeset *rangeset)
+{
+    unsigned int i;
+
+    /* Remove static shared memory regions */
+    for ( i = 0; i < kinfo->shminfo.nr_banks; i++ )
+    {
+        struct membank membank = kinfo->shminfo.bank[i].membank;
+        paddr_t start, end;
+        int res;
+
+        start = membank.start;
+        end = membank.start + membank.size - 1;
+        res = rangeset_remove_range(rangeset, start, end);
+        if ( res )
+        {
+            printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
+                   start, end);
+            return -EINVAL;
+        }
+    }
+
+    return 0;
+}
+
 /*
  * Find the holes in the Host DT which can be exposed to Dom0 as extended
  * regions for the special memory mappings. In order to calculate regions
@@ -1982,6 +2008,8 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
  * - MMIO
  * - Host RAM
  * - PCI aperture
+ * - Static shared memory regions, which are described by special property
+ *   "xen,static-shm"
  */
 static int __init find_memory_holes(const struct kernel_info *kinfo,
                                     struct meminfo *ext_regions)
@@ -2058,6 +2086,14 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
         }
     }
 
+    /* Remove static shared memory regions */
+    if ( kinfo->shminfo.nr_banks != 0 )
+    {
+        res = remove_shm_from_rangeset(kinfo, mem_holes);
+        if ( res )
+            goto out;
+    }
+
     start = 0;
     end = (1ULL << p2m_ipa_bits) - 1;
     res = rangeset_report_ranges(mem_holes, PFN_DOWN(start), PFN_DOWN(end),
@@ -2073,6 +2109,62 @@ out:
     return res;
 }
 
+static int __init remove_shm_holes_for_domU(const struct kernel_info *kinfo,
+                                            struct meminfo *orig_ext)
+{
+    struct rangeset *guest_holes;
+    unsigned int i = 0, tail;
+    int res;
+    paddr_t start, end;
+
+    /* No static shared memory region. */
+    if ( kinfo->shminfo.nr_banks == 0 )
+        return 0;
+
+    dt_dprintk("Remove static shared memory holes for extended regions of DomU\n");
+
+    guest_holes = rangeset_new(NULL, NULL, 0);
+    if ( !guest_holes )
+        return -ENOMEM;
+
+    for ( ; i < orig_ext->nr_banks; i++ )
+    {
+        start = orig_ext->bank[i].start;
+        end = start + orig_ext->bank[i].size - 1;
+
+        res = rangeset_add_range(guest_holes, start, end);
+        if ( res )
+        {
+            printk(XENLOG_ERR "Failed to add: %#"PRIpaddr"->%#"PRIpaddr"\n",
+                   start, end);
+            goto out;
+        }
+    }
+
+    /* Remove static shared memory regions */
+    res = remove_shm_from_rangeset(kinfo, guest_holes);
+    if ( res )
+        goto out;
+
+    tail = orig_ext->nr_banks - 1;
+    start = orig_ext->bank[0].start;
+    end = orig_ext->bank[tail].start + orig_ext->bank[tail].size - 1;
+
+    /* Reset original extended regions to hold new value */
+    orig_ext->nr_banks = 0;
+    res = rangeset_report_ranges(guest_holes, start, end,
+                                 add_ext_regions, orig_ext);
+    if ( res )
+        orig_ext->nr_banks = 0;
+    else if ( !orig_ext->nr_banks )
+        res = -ENOENT;
+
+out:
+    rangeset_destroy(guest_holes);
+
+    return res;
+}
+
 static int __init find_domU_holes(const struct kernel_info *kinfo,
                                   struct meminfo *ext_regions)
 {
@@ -2100,7 +2192,10 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
         res = 0;
     }
 
-    return res;
+    if ( res )
+        return res;
+
+    return remove_shm_holes_for_domU(kinfo, ext_regions);
 }
 
 static int __init make_hypervisor_node(struct domain *d,
-- 
2.25.1



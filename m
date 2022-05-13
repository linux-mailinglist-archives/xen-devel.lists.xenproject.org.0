Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B618526C13
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 23:07:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328777.551923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npcVe-0004qQ-3O; Fri, 13 May 2022 21:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328777.551923; Fri, 13 May 2022 21:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npcVd-0004oI-Ub; Fri, 13 May 2022 21:07:37 +0000
Received: by outflank-mailman (input) for mailman id 328777;
 Fri, 13 May 2022 21:07:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xcQv=VV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1npcVc-0004Ds-86
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 21:07:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5c76f88-d300-11ec-aa76-f101dd46aeb6;
 Fri, 13 May 2022 23:07:35 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F35D061B8C;
 Fri, 13 May 2022 21:07:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E93E9C34113;
 Fri, 13 May 2022 21:07:32 +0000 (UTC)
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
X-Inumbo-ID: b5c76f88-d300-11ec-aa76-f101dd46aeb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652476053;
	bh=GuU6qA8FErbNr89RInOmtwTYqYZQ6Wfj7rcBSkqDOLM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=joTOzbHXgitRICE7cgCv5LKuhQy8XgxEVzOzpgQByljObJ7UL1PrxkQ1d/GGmJZM3
	 UuuxhP4TbQa7cR9D+DwzVqd6X+F7GYDXH4CZs/CQFVHpMuVKSfKvMAplr828YgrKPt
	 YSa8DIrV9WiqWPQBcs3R6KAaRp/wvjq1JJjnfwBDFsNj3KjUW1gVny9+Tyn/xG/2s2
	 t2X0Tn9kIvu3+L9ORb5o0466zbq1DPis+OwjKfm3ish36YGd+O9FbY47Mzu3mScV1g
	 LoS+mS8DfKQvPdzMOdsZ3DDi2WchhQ8q231PMpccAEB4n7PwOFKA3V/e3n/sRhod/l
	 eLJzOfUTyNzIw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jgross@suse.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v7 2/7] xen/arm: implement domU extended regions
Date: Fri, 13 May 2022 14:07:25 -0700
Message-Id: <20220513210730.679871-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2205131405550.3842@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205131405550.3842@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Implement extended regions for dom0less domUs. The implementation is
based on the libxl implementation.

Also update docs for the ext_regions command line option.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in v6:
- add reviewed-by
- address 2 NITs
- update docs

Changes in v5:
- print the domain
- coding style
- simplify the code in find_domU_holes
- return error if no regions allocated in find_domU_holes
- use ROUNDUP
- uint64_t/paddr_t
---
 docs/misc/xen-command-line.pandoc |  9 ++---
 xen/arch/arm/domain_build.c       | 60 ++++++++++++++++++++++++++-----
 2 files changed, 56 insertions(+), 13 deletions(-)
---
 docs/misc/xen-command-line.pandoc |  9 ++---
 xen/arch/arm/domain_build.c       | 60 ++++++++++++++++++++++++++-----
 2 files changed, 56 insertions(+), 13 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 1dc7e1ca07..881fe409ac 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1110,11 +1110,12 @@ to use the default.
 
 > Default : `true`
 
-Flag to enable or disable support for extended regions for Dom0.
+Flag to enable or disable support for extended regions for Dom0 and
+Dom0less DomUs.
 
-Extended regions are ranges of unused address space exposed to Dom0 as
-"safe to use" for special memory mappings. Disable if your board device
-tree is incomplete.
+Extended regions are ranges of unused address space exposed to the guest
+as "safe to use" for special memory mappings. Disable if your board
+device tree is incomplete.
 
 ### flask
 > `= permissive | enforcing | late | disabled`
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index aa777741bd..c4dd211b91 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -35,7 +35,10 @@
 static unsigned int __initdata opt_dom0_max_vcpus;
 integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
 
-/* If true, the extended regions support is enabled for dom0 */
+/*
+ * If true, the extended regions support is enabled for dom0 and
+ * dom0less domUs.
+ */
 static bool __initdata opt_ext_regions = true;
 boolean_param("ext_regions", opt_ext_regions);
 
@@ -1327,6 +1330,36 @@ out:
     return res;
 }
 
+static int __init find_domU_holes(const struct kernel_info *kinfo,
+                                  struct meminfo *ext_regions)
+{
+    unsigned int i;
+    paddr_t bankend;
+    const paddr_t bankbase[] = GUEST_RAM_BANK_BASES;
+    const paddr_t banksize[] = GUEST_RAM_BANK_SIZES;
+    int res = -ENOENT;
+
+    for ( i = 0; i < GUEST_RAM_BANKS; i++ )
+    {
+        struct membank *ext_bank = &(ext_regions->bank[ext_regions->nr_banks]);
+
+        ext_bank->start = ROUNDUP(bankbase[i] + kinfo->mem.bank[i].size, SZ_2M);
+
+        bankend = ~0ULL >> (64 - p2m_ipa_bits);
+        bankend = min(bankend, bankbase[i] + banksize[i] - 1);
+        if ( bankend > ext_bank->start )
+            ext_bank->size = bankend - ext_bank->start + 1;
+
+        /* 64MB is the minimum size of an extended region */
+        if ( ext_bank->size < MB(64) )
+            continue;
+        ext_regions->nr_banks++;
+        res = 0;
+    }
+
+    return res;
+}
+
 static int __init make_hypervisor_node(struct domain *d,
                                        const struct kernel_info *kinfo,
                                        int addrcells, int sizecells)
@@ -1363,12 +1396,13 @@ static int __init make_hypervisor_node(struct domain *d,
 
     if ( !opt_ext_regions )
     {
-        printk(XENLOG_INFO "The extended regions support is disabled\n");
+        printk(XENLOG_INFO "%pd: extended regions support is disabled\n", d);
         nr_ext_regions = 0;
     }
     else if ( is_32bit_domain(d) )
     {
-        printk(XENLOG_WARNING "The extended regions are only supported for 64-bit guest currently\n");
+        printk(XENLOG_WARNING
+               "%pd: extended regions not supported for 32-bit guests\n", d);
         nr_ext_regions = 0;
     }
     else
@@ -1377,13 +1411,21 @@ static int __init make_hypervisor_node(struct domain *d,
         if ( !ext_regions )
             return -ENOMEM;
 
-        if ( !is_iommu_enabled(d) )
-            res = find_unallocated_memory(kinfo, ext_regions);
+        if ( is_domain_direct_mapped(d) )
+        {
+            if ( !is_iommu_enabled(d) )
+                res = find_unallocated_memory(kinfo, ext_regions);
+            else
+                res = find_memory_holes(kinfo, ext_regions);
+        }
         else
-            res = find_memory_holes(kinfo, ext_regions);
+        {
+            res = find_domU_holes(kinfo, ext_regions);
+        }
 
         if ( res )
-            printk(XENLOG_WARNING "Failed to allocate extended regions\n");
+            printk(XENLOG_WARNING "%pd: failed to allocate extended regions\n",
+                   d);
         nr_ext_regions = ext_regions->nr_banks;
     }
 
@@ -1404,8 +1446,8 @@ static int __init make_hypervisor_node(struct domain *d,
         u64 start = ext_regions->bank[i].start;
         u64 size = ext_regions->bank[i].size;
 
-        printk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n",
-               i, start, start + size);
+        printk("%pd: extended region %d: %#"PRIx64"->%#"PRIx64"\n",
+               d, i, start, start + size);
 
         dt_child_set_range(&cells, addrcells, sizecells, start, size);
     }
-- 
2.25.1



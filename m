Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FE151B493
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 02:17:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321173.542096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmPB0-0007vF-Tr; Thu, 05 May 2022 00:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321173.542096; Thu, 05 May 2022 00:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmPB0-0007rd-KV; Thu, 05 May 2022 00:17:02 +0000
Received: by outflank-mailman (input) for mailman id 321173;
 Thu, 05 May 2022 00:17:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YLaE=VN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nmPAz-0007pt-2e
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 00:17:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae072064-cc08-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 02:17:00 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F25D861D48;
 Thu,  5 May 2022 00:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC20C385A5;
 Thu,  5 May 2022 00:16:57 +0000 (UTC)
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
X-Inumbo-ID: ae072064-cc08-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651709818;
	bh=Mwel9XZZFmkKqmMXTUSqunEUmjRMBAHXbPN0MGWNniE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X1CQfMiiba7mxvH99FxIL6s0zrb0Fc7+eSFMhhFjOj4c+F465u6+ZLvNmQySQfgud
	 AmoD7u+dD1zZ3W4t6HsqLBghxSkW3DIJwrF9lsNUxHHZxAojy6DeJFhlhb2eptpteU
	 P316kO1K/T06fU7OB99OohEKNqV1iP36NdJCOuURxJ+6CIh0ymwdeUIe2IzYjcNCda
	 /5KbvSzf7BBfccwe16Ms+X7H5GQQO+cM2pSalMM5Kz4+GYXOm5WRWdS5TV0mMUWQ/Y
	 kEdPoFtCHn6++6d8a8gcYoWHW8AorTyLUhJmVdTKZ7eH7M6ejWQzcKHvQ1TMaHnXd9
	 ANgNDKFjVlnpg==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jgross@suse.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	olekstysh@gmail.com
Subject: [PATCH v6 2/7] xen/arm: implement domU extended regions
Date: Wed,  4 May 2022 17:16:51 -0700
Message-Id: <20220505001656.395419-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Implement extended regions for dom0less domUs. The implementation is
based on the libxl implementation.

Also update docs for the ext_regions command line option.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
CC: olekstysh@gmail.com
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
index 1472ca4972..f22450b4b7 100644
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
 
@@ -1324,6 +1327,36 @@ out:
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
@@ -1360,12 +1393,13 @@ static int __init make_hypervisor_node(struct domain *d,
 
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
@@ -1374,13 +1408,21 @@ static int __init make_hypervisor_node(struct domain *d,
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
 
@@ -1401,8 +1443,8 @@ static int __init make_hypervisor_node(struct domain *d,
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



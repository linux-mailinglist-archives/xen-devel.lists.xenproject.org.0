Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CACA515634
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 22:57:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317703.537176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkXgJ-0007Xw-Nj; Fri, 29 Apr 2022 20:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317703.537176; Fri, 29 Apr 2022 20:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkXgJ-0007VW-I9; Fri, 29 Apr 2022 20:57:39 +0000
Received: by outflank-mailman (input) for mailman id 317703;
 Fri, 29 Apr 2022 20:57:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlFr=VH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nkXgI-0006w0-EP
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 20:57:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff3d3a40-c7fe-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 22:57:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8F3BE621D7;
 Fri, 29 Apr 2022 20:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1047C385AE;
 Fri, 29 Apr 2022 20:57:34 +0000 (UTC)
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
X-Inumbo-ID: ff3d3a40-c7fe-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651265855;
	bh=xYtT+6HeBjKFPCtYs7kjkhcpxb7ruFyZ0/KuV9mvqgI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VzCyC431VGEgRMAeJTo4H/YQpKqJQitqJvGPFJzWM0Nwpr2wqrcb1fuzxTRoaJk3g
	 glXXrff9lyuceNjIjfNeVYuXP4AM8+Kee00ocMsYXTV9tsX9PZPMV7yWS0Ao47TAKH
	 J/76RDLM4o8EZf8y4C8j2H0/C9yV+Nu9zokeMUhuwbsiaAkxKwQWA9neM56UeobIGS
	 30C5eRmTmrRzaN2nTj1uqg0AE8ZsAk/jj2J0S9snnSTCjtV6CNF2banTjHKEYkJIkQ
	 AHkuVrUDwus7KQ+9SDsfmEb07U8jCAUrmbPBGJ8drCi7R4Ed0vlEZm0q4oASruA1nY
	 vN9Yu1bP44d4Q==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jgross@suse.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v5 2/7] xen/arm: implement domU extended regions
Date: Fri, 29 Apr 2022 13:57:27 -0700
Message-Id: <20220429205732.2030094-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2204291354050.1947187@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2204291354050.1947187@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Implement extended regions for dom0less domUs. The implementation is
based on the libxl implementation.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v5:
- print the domain
- coding style
- simplify the code in find_domU_holes
- return error if no regions allocated in find_domU_holes
- use ROUNDUP
- uint64_t/paddr_t
---
 xen/arch/arm/domain_build.c | 56 +++++++++++++++++++++++++++++++------
 1 file changed, 48 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 8be01678de..34d3e5ce30 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1324,6 +1324,37 @@ out:
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
+        ext_bank->start = ROUNDUP(bankbase[i] + kinfo->mem.bank[i].size,
+                                  SZ_2M);
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
@@ -1360,12 +1391,13 @@ static int __init make_hypervisor_node(struct domain *d,
 
     if ( !opt_ext_regions )
     {
-        printk(XENLOG_INFO "The extended regions support is disabled\n");
+        printk(XENLOG_INFO "%pd: extended regions support is disabled\n", d);
         nr_ext_regions = 0;
     }
     else if ( is_32bit_domain(d) )
     {
-        printk(XENLOG_WARNING "The extended regions are only supported for 64-bit guest currently\n");
+        printk(XENLOG_WARNING "%pd: extended regions are only supported for 64-bit guest currently\n",
+               d);
         nr_ext_regions = 0;
     }
     else
@@ -1374,13 +1406,21 @@ static int __init make_hypervisor_node(struct domain *d,
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
 
@@ -1401,8 +1441,8 @@ static int __init make_hypervisor_node(struct domain *d,
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



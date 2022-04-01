Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D044EE570
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 02:39:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297155.506112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na5JY-0008TG-5X; Fri, 01 Apr 2022 00:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297155.506112; Fri, 01 Apr 2022 00:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na5JX-0008Pp-W8; Fri, 01 Apr 2022 00:38:55 +0000
Received: by outflank-mailman (input) for mailman id 297155;
 Fri, 01 Apr 2022 00:38:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yIha=UL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1na5JV-0007ot-Jh
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 00:38:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a09a9bd-b154-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 02:38:52 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 16DED618A9;
 Fri,  1 Apr 2022 00:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD37C340F3;
 Fri,  1 Apr 2022 00:38:50 +0000 (UTC)
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
X-Inumbo-ID: 1a09a9bd-b154-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648773530;
	bh=0OtIcFrEIw2wTkzpgYCWd4LgGMpb5c1u12rgi3DHK38=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KWikBJvm4a+e3wfh3njIghbLerNy6nw4RSt8iHiG8bOGESxipbVQy3Zpy9KdbY3/a
	 rhMGulC4chjFfoIhRAR5so1fAht0Cn6T2xlIM5uOY32dvRLDi4kfhFohiaNhksAU4t
	 iahVtefSe6bm44nSEOIAexzHIP97W8d7+AXsYqk273CFRdz/a2IcwmYRCqGuMEm89o
	 RhF7jnNGMMQ4WHjcyRUbPjdT3qCjqoeyyUpyAy4YyNf1+JxO+RKsj9JR9bEU175/wi
	 rl+63tkacU+wm9Fz5Tm3/7MGwZvSct2Vk1jIcl/SMGwdT7b/Irp0MryIfEIEy8EUQr
	 /nZZM+lC2OmhQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jgross@suse.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v4 2/9] xen/arm: implement domU extended regions
Date: Thu, 31 Mar 2022 17:38:40 -0700
Message-Id: <20220401003847.38393-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Implement extended regions for dom0less domUs. The implementation is
based on the libxl implementation.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/arch/arm/domain_build.c | 42 ++++++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 8be01678de..b6189b935d 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1324,6 +1324,35 @@ out:
     return res;
 }
 
+#define ALIGN_UP_TO_2MB(x)   (((x) + MB(2) - 1) & (~(MB(2) - 1)))
+
+static int __init find_domU_holes(const struct kernel_info *kinfo,
+                                  struct meminfo *ext_regions)
+{
+    unsigned int i;
+    uint64_t bankend[GUEST_RAM_BANKS];
+    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
+    const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
+
+    for ( i = 0; i < GUEST_RAM_BANKS; i++ )
+    {
+        ext_regions->bank[ext_regions->nr_banks].start =
+            ALIGN_UP_TO_2MB(bankbase[i] + kinfo->mem.bank[i].size);
+
+        bankend[i] = ~0ULL >> (64 - p2m_ipa_bits);
+        bankend[i] = min(bankend[i], bankbase[i] + banksize[i] - 1);
+        if (bankend[i] > ext_regions->bank[ext_regions->nr_banks].start)
+            ext_regions->bank[ext_regions->nr_banks].size =
+                bankend[i] - ext_regions->bank[ext_regions->nr_banks].start + 1;
+
+        /* 64MB is the minimum size of an extended region */
+        if ( ext_regions->bank[ext_regions->nr_banks].size < MB(64) )
+            continue;
+        ext_regions->nr_banks++;
+    }
+    return 0;
+}
+
 static int __init make_hypervisor_node(struct domain *d,
                                        const struct kernel_info *kinfo,
                                        int addrcells, int sizecells)
@@ -1374,10 +1403,17 @@ static int __init make_hypervisor_node(struct domain *d,
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
             printk(XENLOG_WARNING "Failed to allocate extended regions\n");
-- 
2.25.1



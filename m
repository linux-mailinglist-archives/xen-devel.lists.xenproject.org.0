Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E40C73A38
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 12:10:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166867.1493371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2YB-0004TU-L0; Thu, 20 Nov 2025 11:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166867.1493371; Thu, 20 Nov 2025 11:10:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2YB-0004JQ-9U; Thu, 20 Nov 2025 11:10:07 +0000
Received: by outflank-mailman (input) for mailman id 1166867;
 Thu, 20 Nov 2025 11:10:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MVa3=54=bounce.vates.tech=bounce-md_30504962.691ef70a.v1-518358f759774a67b695c403d1301a41@srs-se1.protection.inumbo.net>)
 id 1vM2Y9-0001P8-A8
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 11:10:05 +0000
Received: from mail128-17.atl41.mandrillapp.com
 (mail128-17.atl41.mandrillapp.com [198.2.128.17])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 761cd388-c601-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 12:10:03 +0100 (CET)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4dBwcB3knszCf9RNd
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 11:10:02 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 518358f759774a67b695c403d1301a41; Thu, 20 Nov 2025 11:10:02 +0000
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
X-Inumbo-ID: 761cd388-c601-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763637002; x=1763907002;
	bh=hTbgBPnZ4+R3igGlDozv+3Pws+sR6+GzT16fzmrSWCI=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=bAViuhfZH1RbhwQuqnOiQN/RLA/q3Yv/gHT8p9EwM/ohFbekiVmDwuChfbV3fZpLU
	 bJ9a4H6i70BveMoVdKshoXGCdc0spTTagw9ZrKXHgUj5uiuR0ULEV2Yu4nonuKfY5L
	 pCb21nW7as7zy6bAglVexOiGuavI1F1v+GFV/NwRZgBZDcqbYFFs1QAMhTJrJ0jbMm
	 sqnVqZJ9nqwQ9LXbaMWZqjBgrmdUk8V0dKouQhhmoUdyk9E4vWMrc0ID3GF6ip4A2g
	 gcTphcgRzhx/EDowHhk6gzlcGnFYOF9EJSFFd7PcCLKkv8S7n6BhJK352YVBzAv6pa
	 dRVT1HSp6lBbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763637002; x=1763897502; i=teddy.astie@vates.tech;
	bh=hTbgBPnZ4+R3igGlDozv+3Pws+sR6+GzT16fzmrSWCI=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=yYkFGdMli4ZwogOhffPELT0dthYz9sMnFjmERUKx4NWVci7+EM8xQZ+icP6Qf9xpw
	 14Iy/Zz87NoRzwbD5phFRv5rY+z7l+0lbrx9TiI2h4T+t2XM16tB76Z9CIDri8mFtD
	 dTxAdP8Repxkr5bWjlQOQ8oxTDbsGK44+08gwkWJEuL1Fm6i7+sbMhSCC7ML8W64fg
	 gvnXn8Ycf1K/DCkMDIezP5Mh11963dsOWta7cHFgwYQrfOkU89lIAJO6WTNXhjm6xL
	 lMFvSX5yzQpZr9dwIxkhISinWibFYJEgjONEYmcsNigcelnR2LwqJxVGnUcBp9Mg9a
	 I9tKAakhEM3gg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v7=2010/14]=20amd/iommu:=20Introduce=20lookup=20implementation?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763637001462
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Jason Andryuk" <jason.andryuk@amd.com>
Message-Id: <6bee56dd62ad755fdaa41b60fedcfd50082ac6ad.1763569135.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1763569135.git.teddy.astie@vates.tech>
References: <cover.1763569135.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.518358f759774a67b695c403d1301a41?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251120:md
Date: Thu, 20 Nov 2025 11:10:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

PV-IOMMU requires a lookup implementation to behave properly, provide one.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v7: introduced
---
 xen/drivers/passthrough/amd/iommu.h         |  2 +
 xen/drivers/passthrough/amd/iommu_map.c     | 90 +++++++++++++++++++++
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  1 +
 3 files changed, 93 insertions(+)

diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index 0bd0f15a72..de1442af1b 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -202,6 +202,8 @@ int __must_check cf_check amd_iommu_map_page(
 int __must_check cf_check amd_iommu_unmap_page(
     struct domain *d, dfn_t dfn, unsigned int order,
     unsigned int *flush_flags, struct iommu_context *ctx);
+int cf_check amd_iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
+                                   unsigned int *flags, struct iommu_context *ctx);
 int amd_iommu_reserve_domain_unity_map(struct domain *d, struct iommu_context *ctx,
                                        const struct ivrs_unity_map *map,
                                        unsigned int flag);
diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
index 01b36fdf4f..82f8eb85c8 100644
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -622,6 +622,96 @@ int cf_check amd_iommu_flush_iotlb_pages(
     return 0;
 }
 
+static int lookup_pagewalk(struct page_info *table, dfn_t dfn, unsigned long level,
+                           mfn_t *mfn, unsigned int *flags)
+{
+    int rc = 0;
+    union amd_iommu_pte entry, *pagetable;
+
+    pagetable = __map_domain_page(table);
+    if ( !pagetable )
+        return -ENOMEM;
+
+    entry = pagetable[pfn_to_pde_idx(dfn_x(dfn), level)];
+
+    if ( !entry.pr || WARN_ON(!entry.mfn) )
+    {
+        /* Missing mapping has no flag. */
+        *flags = 0;
+        rc = -ENOENT;
+        goto out;
+    }
+
+    /*
+     * AMD-Vi Specification, 2.2.3 I/O Page Tables for Host Translations
+     *
+     * Effective write permission is calculated using the IW(resp IR) bits in the DTE,
+     * the I/O PDEs, and the I/O PTE. At each step of the translation process,
+     * I/O write permission (IW) bits (resp IR) from fetched page table entries are
+     * logically ANDed into cumulative I/O write permissions for the translation
+     * including the IW (resp IR) bit in the DTE.
+     */
+
+    if ( !entry.ir )
+        *flags &= ~IOMMUF_readable;
+
+    if ( !entry.iw )
+        *flags &= ~IOMMUF_writable;
+
+    if ( entry.next_level )
+    {
+        /* Go to the next mapping */
+        if ( WARN_ON(entry.next_level >= level) )
+        {
+            rc = -EILSEQ;
+            goto out;
+        }
+
+        unmap_domain_page(pagetable);
+        return lookup_pagewalk(mfn_to_page(_mfn(entry.mfn)), dfn, entry.next_level,
+                               mfn, flags);
+    }
+    else
+    {
+        /*
+         * Terminal mapping (either superpage or PTE). Compute that by combining entry
+         * address with dfn (for taking account of sub-entry frames in case of a superpage).
+         */
+        *mfn = _mfn(entry.mfn |
+               (dfn_x(dfn) & ((1ULL << ((level - 1) * PTE_PER_TABLE_SHIFT)) - 1)));
+    }
+
+out:
+    unmap_domain_page(pagetable);
+    return rc;
+}
+
+int cf_check amd_iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
+                                   unsigned int *flags, struct iommu_context *ctx)
+{
+    struct page_info *root_table;
+    unsigned long level;
+
+    if ( ctx->opaque )
+        return -EOPNOTSUPP;
+
+    if ( !ctx->arch.amd.root_table )
+        return -ENOENT;
+
+    root_table = ctx->arch.amd.root_table;
+    level = dom_iommu(d)->arch.amd.paging_mode;
+
+    if ( dfn_x(dfn) >> (PTE_PER_TABLE_SHIFT * level) )
+        return -ENOENT;
+
+    /*
+     * We initially consider the page writable and readable, lookup_pagewalk will
+     * remove these flags if it is not actually the case.
+     */
+    *flags |= IOMMUF_writable | IOMMUF_readable;
+    return lookup_pagewalk(root_table, dfn, level, mfn, flags);
+}
+
 int amd_iommu_reserve_domain_unity_map(struct domain *d, struct iommu_context *ctx,
                                        const struct ivrs_unity_map *map,
                                        unsigned int flag)
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index 3c17d78caf..3d08a925d6 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -732,6 +732,7 @@ static const struct iommu_ops __initconst_cf_clobber _iommu_ops = {
     .suspend = amd_iommu_suspend,
     .resume = amd_iommu_resume,
     .crash_shutdown = amd_iommu_crash_shutdown,
+    .lookup_page = amd_iommu_lookup_page,
     .get_reserved_device_memory = amd_iommu_get_reserved_device_memory,
     .dump_page_tables = amd_dump_page_tables,
     .quiesce = amd_iommu_quiesce,
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



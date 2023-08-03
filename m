Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B01D76E58A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 12:23:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576177.902041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVUG-0004rH-9P; Thu, 03 Aug 2023 10:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576177.902041; Thu, 03 Aug 2023 10:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVUG-0004pR-62; Thu, 03 Aug 2023 10:23:20 +0000
Received: by outflank-mailman (input) for mailman id 576177;
 Thu, 03 Aug 2023 10:23:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYgs=DU=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qRVUF-0004Rp-Cw
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 10:23:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3c9bffb-31e7-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 12:23:18 +0200 (CEST)
Received: from beta.station (net-188-218-251-179.cust.vodafonedsl.it
 [188.218.251.179])
 by support.bugseng.com (Postfix) with ESMTPSA id 509D94EE0737;
 Thu,  3 Aug 2023 12:23:18 +0200 (CEST)
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
X-Inumbo-ID: c3c9bffb-31e7-11ee-b268-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH 01/13] AMD/IOMMU: address violations of MISRA C:2012 Rule 7.3
Date: Thu,  3 Aug 2023 12:22:16 +0200
Message-Id: <2af1f76d2c002dd9f0b01eebf7af516d86bfe91e.1691053438.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691053438.git.simone.ballarin@bugseng.com>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
states:
"The lowercase character 'l' shall not be used in a literal suffix".

Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.

The changes in this patch are mechanical.

Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/drivers/passthrough/amd/iommu_guest.c   | 2 +-
 xen/drivers/passthrough/amd/iommu_map.c     | 2 +-
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_guest.c b/xen/drivers/passthrough/amd/iommu_guest.c
index 47a912126a..80d289b8bf 100644
--- a/xen/drivers/passthrough/amd/iommu_guest.c
+++ b/xen/drivers/passthrough/amd/iommu_guest.c
@@ -87,7 +87,7 @@ static uint64_t dte_get_gcr3_table(const struct amd_iommu_dte *dte)
 static void dte_set_gcr3_table(struct amd_iommu_dte *dte, uint16_t dom_id,
                                uint64_t addr, bool gv, uint8_t glx)
 {
-#define GCR3_MASK(hi, lo) (((1ul << ((hi) + 1)) - 1) & ~((1ul << (lo)) - 1))
+#define GCR3_MASK(hi, lo) (((1UL << ((hi) + 1)) - 1) & ~((1UL << (lo)) - 1))
 
     /* I bit must be set when gcr3 is enabled */
     dte->i = true;
diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
index 993bac6f88..daa24a4858 100644
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -838,7 +838,7 @@ int cf_check amd_iommu_quarantine_init(struct pci_dev *pdev, bool scratch_page)
 {
     struct domain_iommu *hd = dom_iommu(dom_io);
     unsigned long end_gfn =
-        1ul << (DEFAULT_DOMAIN_ADDRESS_WIDTH - PAGE_SHIFT);
+        1UL << (DEFAULT_DOMAIN_ADDRESS_WIDTH - PAGE_SHIFT);
     unsigned int level = amd_iommu_get_paging_mode(end_gfn);
     unsigned int req_id = get_dma_requestor_id(pdev->seg, pdev->sbdf.bdf);
     const struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(pdev->seg);
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index 94e3775506..bea70db4b7 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -368,7 +368,7 @@ static int cf_check amd_iommu_domain_init(struct domain *d)
      */
     hd->arch.amd.paging_mode = max(amd_iommu_get_paging_mode(
             is_hvm_domain(d)
-            ? 1ul << (DEFAULT_DOMAIN_ADDRESS_WIDTH - PAGE_SHIFT)
+            ? 1UL << (DEFAULT_DOMAIN_ADDRESS_WIDTH - PAGE_SHIFT)
             : get_upper_mfn_bound() + 1),
         amd_iommu_min_paging_mode);
 
-- 
2.34.1



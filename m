Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED6479D17F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 15:00:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600460.936095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg2zK-0006S0-Rh; Tue, 12 Sep 2023 12:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600460.936095; Tue, 12 Sep 2023 12:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg2zK-0006P4-Ok; Tue, 12 Sep 2023 12:59:30 +0000
Received: by outflank-mailman (input) for mailman id 600460;
 Tue, 12 Sep 2023 12:59:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E4bD=E4=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qg2zJ-0006Oy-Pi
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 12:59:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 344ab5d9-516c-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 14:59:27 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-87-19-206-190.retail.telecomitalia.it [87.19.206.190])
 by support.bugseng.com (Postfix) with ESMTPSA id 8DF2C4EE0749;
 Tue, 12 Sep 2023 14:59:26 +0200 (CEST)
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
X-Inumbo-ID: 344ab5d9-516c-11ee-9b0d-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH] xen/IOMMU: address violations of MISRA C:2012 Rules 8.2 and 8.3
Date: Tue, 12 Sep 2023 14:59:19 +0200
Message-Id: <fa7f0000b77ed4930d3d1e5b97d6fd53a26b7390.1694427795.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names and make function declarations and
definitions consistent. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/drivers/passthrough/amd/iommu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index acbaad30d5..02111d23df 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -248,7 +248,7 @@ int __must_check cf_check amd_iommu_unmap_page(
     struct domain *d, dfn_t dfn, unsigned int order,
     unsigned int *flush_flags);
 int __must_check amd_iommu_alloc_root(struct domain *d);
-int amd_iommu_reserve_domain_unity_map(struct domain *domain,
+int amd_iommu_reserve_domain_unity_map(struct domain *d,
                                        const struct ivrs_unity_map *map,
                                        unsigned int flag);
 int amd_iommu_reserve_domain_unity_unmap(struct domain *d,
@@ -282,7 +282,7 @@ void amd_iommu_flush_all_pages(struct domain *d);
 void amd_iommu_flush_pages(struct domain *d, unsigned long dfn,
                            unsigned int order);
 void amd_iommu_flush_iotlb(u8 devfn, const struct pci_dev *pdev,
-                           uint64_t gaddr, unsigned int order);
+                           daddr_t daddr, unsigned int order);
 void amd_iommu_flush_device(struct amd_iommu *iommu, uint16_t bdf);
 void amd_iommu_flush_intremap(struct amd_iommu *iommu, uint16_t bdf);
 void amd_iommu_flush_all_caches(struct amd_iommu *iommu);
-- 
2.34.1



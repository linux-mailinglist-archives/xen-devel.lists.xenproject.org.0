Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0452C31B0CA
	for <lists+xen-devel@lfdr.de>; Sun, 14 Feb 2021 15:35:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84920.159191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBIUQ-0007CA-Kd; Sun, 14 Feb 2021 14:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84920.159191; Sun, 14 Feb 2021 14:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBIUQ-0007Bk-HS; Sun, 14 Feb 2021 14:35:10 +0000
Received: by outflank-mailman (input) for mailman id 84920;
 Sun, 14 Feb 2021 14:35:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lBIUO-0007Be-Q4
 for xen-devel@lists.xenproject.org; Sun, 14 Feb 2021 14:35:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lBIUO-0004DK-9b; Sun, 14 Feb 2021 14:35:08 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lBIUN-00057D-WE; Sun, 14 Feb 2021 14:35:08 +0000
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
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=m/LlNL0TamjvVVErh/pPovK2MwMDVTxbRIY3ju8BM/k=; b=4DbgDOufF2y1YcJUTFqmEFkZkM
	APBxrcLN5LfRljx07JdtnDU0WjYWeC11Cr2DMH+Xha6Ru0FegqY3c6RJHHCJW7LUqamltDQ9YgAso
	rigAa87oBUkROeFUb4djd9/CcFPFLVa2ZMqCCrdmrMdBrpEXkY3JT/BjKasggs6Iu+AI=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <Rahul.Singh@arm.com>
Subject: [PATCH] xen/iommu: arm: Don't insert an IOMMU mapping when the grantee and granter...
Date: Sun, 14 Feb 2021 14:35:04 +0000
Message-Id: <20210214143504.23099-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

... are the same.

When the IOMMU is enabled and the domain is direct mapped (e.g. Dom0),
Xen will insert a 1:1 mapping for each grant mapping in the P2M to
allow DMA.

This works quite well when the grantee and granter and not the same
because the GFN in the P2M should not be mapped. However, if they are
the same, we will overwrite the mapping. Worse, it will be completely
removed when the grant is unmapped.

As the domain is direct mapped, a 1:1 mapping should always present in
the P2M. This is not 100% guaranteed if the domain decides to mess with
the P2M. However, such domain would already end up in trouble as the
page would be soon be freed (when the last reference dropped).

Add an additional check in arm_iommu_{,un}map_page() to check whether
the page belongs to the domain. If it is belongs to it, then ignore the
request.

Note that we don't need to hold an extra reference on the page because
the grant code will already do it for us.

Reported-by: Rahul Singh <Rahul.Singh@arm.com>
Fixes: 552710b38863 ("xen/arm: grant: Add another entry to map MFN 1:1 in dom0 p2m")
Signed-off-by: Julien Grall <jgrall@amazon.com>

---

This is a candidate for 4.15. Without the patch, it would not be
possible to get the frontend and backend in the same domain (useful when
trying to map the guest block device in dom0).
---
 xen/drivers/passthrough/arm/iommu_helpers.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/xen/drivers/passthrough/arm/iommu_helpers.c b/xen/drivers/passthrough/arm/iommu_helpers.c
index a36e2b8e6c42..35a813308b8c 100644
--- a/xen/drivers/passthrough/arm/iommu_helpers.c
+++ b/xen/drivers/passthrough/arm/iommu_helpers.c
@@ -53,6 +53,17 @@ int __must_check arm_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
 
     t = (flags & IOMMUF_writable) ? p2m_iommu_map_rw : p2m_iommu_map_ro;
 
+    /*
+     * The granter and grantee can be the same domain. In normal
+     * condition, the 1:1 mapping should already present in the P2M so
+     * we want to avoid overwriting it.
+     *
+     * Note that there is no guarantee the 1:1 mapping will be present
+     * if the domain decides to mess with the P2M.
+     */
+    if ( page_get_owner(mfn_to_page(mfn)) == d )
+        return 0;
+
     /*
      * The function guest_physmap_add_entry replaces the current mapping
      * if there is already one...
@@ -71,6 +82,13 @@ int __must_check arm_iommu_unmap_page(struct domain *d, dfn_t dfn,
     if ( !is_domain_direct_mapped(d) )
         return -EINVAL;
 
+    /*
+     * When the granter and grantee are the same, we didn't insert a
+     * mapping. So ignore the unmap request.
+     */
+    if ( page_get_owner(mfn_to_page(_mfn(dfn_x(dfn)))) == d )
+        return 0;
+
     return guest_physmap_remove_page(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)), 0);
 }
 
-- 
2.17.1



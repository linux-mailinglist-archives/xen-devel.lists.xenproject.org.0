Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4118132619C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 11:57:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90207.170713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFanf-0003Gg-Og; Fri, 26 Feb 2021 10:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90207.170713; Fri, 26 Feb 2021 10:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFanf-0003GG-Kd; Fri, 26 Feb 2021 10:56:47 +0000
Received: by outflank-mailman (input) for mailman id 90207;
 Fri, 26 Feb 2021 10:56:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lFane-0003G6-3M
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 10:56:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFand-0001Q1-0d; Fri, 26 Feb 2021 10:56:45 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFanc-0007D9-L1; Fri, 26 Feb 2021 10:56:44 +0000
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
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=rKYi+qEerpdW0l9C/Ph4WyNn/j7ZcEQ39HY+quniLnM=; b=qmqpY3hlJJfHrB2Ax1D3efsBe
	yoN5ARL4gbcbIK5Dn9bBEsnTxyBAxbypT2+zuRR1UcrFCc0+Mfl9Dh+7XlsArwb2ceshWljLHAluA
	3X7ihp4IQxkw1KPLbwgWUZ/aW8GATDVM4c3uNTEoWRBOnogXSsCrF0jb+NQI+YIqmcPfY=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: hongyxia@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH for-4.15 v5 1/3] xen/iommu: x86: Don't try to free page tables is the IOMMU is not enabled
Date: Fri, 26 Feb 2021 10:56:38 +0000
Message-Id: <20210226105640.12037-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226105640.12037-1-julien@xen.org>
References: <20210226105640.12037-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

When using CONFIG_BIGMEM=y, the page_list cannot be accessed whilst it
is is unitialized. However, iommu_free_pgtables() will be called even if
the domain is not using an IOMMU.

Consequently, Xen will try to go through the page list and deference a
NULL pointer.

Bail out early if the domain is not using an IOMMU.

Fixes: 15bc9a1ef51c ("x86/iommu: add common page-table allocator")
Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v5:
        - Patch added. This was split from "xen/x86: iommu: Ignore
        IOMMU mapping requests when a domain is dying"
---
 xen/drivers/passthrough/x86/iommu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index cea1032b3d02..58a330e82247 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -267,6 +267,9 @@ int iommu_free_pgtables(struct domain *d)
     struct page_info *pg;
     unsigned int done = 0;
 
+    if ( !is_iommu_enabled(d) )
+        return 0;
+
     while ( (pg = page_list_remove_head(&hd->arch.pgtables.list)) )
     {
         free_domheap_page(pg);
-- 
2.17.1



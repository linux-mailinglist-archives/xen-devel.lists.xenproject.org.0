Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3F92E0CD7
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 16:43:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57961.101654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krjpC-0006dI-38; Tue, 22 Dec 2020 15:43:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57961.101654; Tue, 22 Dec 2020 15:43:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krjpB-0006cg-Vh; Tue, 22 Dec 2020 15:43:45 +0000
Received: by outflank-mailman (input) for mailman id 57961;
 Tue, 22 Dec 2020 15:43:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1krjpA-0006ab-72
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 15:43:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krjp9-0001pp-Qe; Tue, 22 Dec 2020 15:43:43 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krjp9-0002Vd-H1; Tue, 22 Dec 2020 15:43:43 +0000
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
	 bh=oGKgq5COKIk8NxpKicCWyg/HHbH44EXhBG+TPo1gMSg=; b=6F1sIpK8zXz525iNpH+YZy4J3
	7CHZgeRZybwOTkVZ61q5urpWMtfSXXpDnObgRW2hK+49+shv6uDJaRniyyRhf4yEUuRbZPWTVdrkD
	ZhrkwGNjSSbPUCzDwM4+4E6fhZ46DK1HNbyal5aytfHiXgVlbyIiiuGJC0FrLuObJsjOw=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: hongyxia@amazon.co.uk,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH for-4.15 2/4] xen/iommu: x86: Free the IOMMU page-tables with the pgtables.lock held
Date: Tue, 22 Dec 2020 15:43:36 +0000
Message-Id: <20201222154338.9459-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201222154338.9459-1-julien@xen.org>
References: <20201222154338.9459-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

The pgtables.lock is protecting access to the page list pgtables.list.
However, iommu_free_pgtables() will not held it. I guess it was assumed
that page-tables cannot be allocated while the domain is dying.

Unfortunately, there is no guarantee that iommu_map() will not be
called while a domain is dying (it looks like to be possible from
XEN_DOMCTL_memory_mapping). So it would be possible to be concurrently
allocate memory and free the page-tables.

Therefore, we need to held the lock when freeing the page tables.

There are more issues around the IOMMU page-allocator. They will be
handled in follow-up patches.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/drivers/passthrough/x86/iommu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index cea1032b3d02..779dbb5b98ba 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -267,13 +267,18 @@ int iommu_free_pgtables(struct domain *d)
     struct page_info *pg;
     unsigned int done = 0;
 
+    spin_lock(&hd->arch.pgtables.lock);
     while ( (pg = page_list_remove_head(&hd->arch.pgtables.list)) )
     {
         free_domheap_page(pg);
 
         if ( !(++done & 0xff) && general_preempt_check() )
+        {
+            spin_unlock(&hd->arch.pgtables.lock);
             return -ERESTART;
+        }
     }
+    spin_unlock(&hd->arch.pgtables.lock);
 
     return 0;
 }
-- 
2.17.1



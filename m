Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB963152CD
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 16:28:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83287.154608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9UwH-0007AV-V1; Tue, 09 Feb 2021 15:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83287.154608; Tue, 09 Feb 2021 15:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9UwH-00079F-LM; Tue, 09 Feb 2021 15:28:29 +0000
Received: by outflank-mailman (input) for mailman id 83287;
 Tue, 09 Feb 2021 15:28:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l9UwG-000782-A2
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 15:28:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9UwF-0000tx-0v; Tue, 09 Feb 2021 15:28:27 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9UwE-0007gX-OF; Tue, 09 Feb 2021 15:28:26 +0000
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
	 bh=eQ35EFoowuVBzEra1/WxradtagWIfRx9v97DQCn3iWk=; b=OuY2hFpKMrvSysnl6fveqTD+K
	UPI1TUVam8Z+5kdBgHnR+ofBqXwNJqiU5jyLcj66pWGqrmRA22nhV/8NKFJJVGsiLGhAGY2B8R5xg
	yfSWe8ystK1ZdQAx6Kg8q3GACzaaYP8Cy+4nkdfPyDc7pbUYQKGEkMY5UruU2L6727Pwc=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: hongyxia@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [for-4.15][PATCH v2 2/5] xen/iommu: Check if the IOMMU was initialized before tearing down
Date: Tue,  9 Feb 2021 15:28:13 +0000
Message-Id: <20210209152816.15792-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210209152816.15792-1-julien@xen.org>
References: <20210209152816.15792-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

is_iommu_enabled() will return true even if the IOMMU has not been
initialized (e.g. the ops are not set).

In the case of an early failure in arch_domain_init(), the function
iommu_destroy_domain() will be called even if the IOMMU is not
initialized.

This will result to dereference the ops which will be NULL and an host
crash.

Fix the issue by checking that ops has been set before accessing it.

Fixes: 71e617a6b8f6 ("use is_iommu_enabled() where appropriate...")
Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - Move the check in iommu_teardown() so we don't rely on
        arch_iommu_domain_init() to clean-up its allocation on failure.
        - Fix typo in the commit message
---
 xen/drivers/passthrough/iommu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 2358b6eb09f4..879d238bcd31 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -221,6 +221,13 @@ static void iommu_teardown(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
 
+    /*
+     * During early domain creation failure, we may reach here with the
+     * ops not yet initialized.
+     */
+    if ( !hd->platform_ops )
+        return;
+
     iommu_vcall(hd->platform_ops, teardown, d);
 }
 
-- 
2.17.1



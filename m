Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB2E2E0CD9
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 16:44:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57960.101639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krjpA-0006bZ-Pt; Tue, 22 Dec 2020 15:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57960.101639; Tue, 22 Dec 2020 15:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krjpA-0006av-Lc; Tue, 22 Dec 2020 15:43:44 +0000
Received: by outflank-mailman (input) for mailman id 57960;
 Tue, 22 Dec 2020 15:43:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1krjp9-0006aK-Ag
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 15:43:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krjp8-0001pi-Qq; Tue, 22 Dec 2020 15:43:42 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krjp8-0002Vd-H9; Tue, 22 Dec 2020 15:43:42 +0000
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
	 bh=+mBSW1/mVahokRFnfqlLHIzGDQdUfDu04JYjUwyK9PU=; b=Qp/G0A2gJEUTvBOWR3byyha/1
	bd8DT9cdnddbL/4W14DjPbG4qC1nxHQ5HPACtFDpIZ2JzFS7oSuoaS7PBf5Nou0z9L5Hb0URikLda
	KqSC3dQSiOSorCUdQE07hYlyY5WQ5f8uo2Lga71/V7zYUIFmcNJyiJpCSECv51XkytyjM=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: hongyxia@amazon.co.uk,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH for-4.15 1/4] xen/iommu: Check if the IOMMU was initialized before tearing down
Date: Tue, 22 Dec 2020 15:43:35 +0000
Message-Id: <20201222154338.9459-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201222154338.9459-1-julien@xen.org>
References: <20201222154338.9459-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

is_iommu_enabled() will return true even if the IOMMU has not been
initialized (e.g. the ops are not set).

In the case of an early failure in arch_domain_init(), the function
iommu_destroy_domain() will be called even if the IOMMU is initialized.

This will result to dereference the ops which will be NULL and an host
crash.

Fix the issue by checking that ops has been set before accessing it.
Note that we are assuming that arch_iommu_domain_init() will cleanup an
intermediate failure if it failed.

Fixes: 71e617a6b8f6 ("use is_iommu_enabled() where appropriate...")
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/drivers/passthrough/iommu.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 2358b6eb09f4..f976d5a0b0a5 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -226,7 +226,15 @@ static void iommu_teardown(struct domain *d)
 
 void iommu_domain_destroy(struct domain *d)
 {
-    if ( !is_iommu_enabled(d) )
+    struct domain_iommu *hd = dom_iommu(d);
+
+    /*
+     * In case of failure during the domain construction, it would be
+     * possible to reach this function with the IOMMU enabled but not
+     * yet initialized. We assume that hd->platforms will be non-NULL as
+     * soon as we start to initialize the IOMMU.
+     */
+    if ( !is_iommu_enabled(d) || !hd->platform_ops )
         return;
 
     iommu_teardown(d);
-- 
2.17.1



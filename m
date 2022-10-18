Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF00602E5E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 16:24:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425044.672809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oknVm-0006n6-Iq; Tue, 18 Oct 2022 14:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425044.672809; Tue, 18 Oct 2022 14:24:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oknVm-0006kE-Fg; Tue, 18 Oct 2022 14:24:06 +0000
Received: by outflank-mailman (input) for mailman id 425044;
 Tue, 18 Oct 2022 14:24:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L+Ts=2T=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oknVl-0006SO-4J
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 14:24:05 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 844bcd63-4ef0-11ed-8fd0-01056ac49cbb;
 Tue, 18 Oct 2022 16:24:03 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D14D1113E;
 Tue, 18 Oct 2022 07:24:09 -0700 (PDT)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 90AF63F792;
 Tue, 18 Oct 2022 07:24:01 -0700 (PDT)
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
X-Inumbo-ID: 844bcd63-4ef0-11ed-8fd0-01056ac49cbb
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 1/2] arm/p2m: Rework p2m_init()
Date: Tue, 18 Oct 2022 14:23:45 +0000
Message-Id: <20221018142346.52272-2-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221018142346.52272-1-Henry.Wang@arm.com>
References: <20221018142346.52272-1-Henry.Wang@arm.com>

From: Andrew Cooper <andrew.cooper3@citrix.com>

p2m_init() is mostly trivial initialisation, but has two fallible operations
which are on either side of the backpointer trigger for teardown to take
actions.

p2m_free_vmid() is idempotent with a failed p2m_alloc_vmid(), so rearrange
p2m_init() to perform all trivial setup, then set the backpointer, then
perform all fallible setup.

This will simplify a future bugfix which needs to add a third fallible
operation.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
v5 changes:
- Correct typo in commit message, add reviewed-by from Arm maintainers.
---
 xen/arch/arm/p2m.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index f17500ddf3..6826f63150 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1754,7 +1754,7 @@ void p2m_final_teardown(struct domain *d)
 int p2m_init(struct domain *d)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
-    int rc = 0;
+    int rc;
     unsigned int cpu;
 
     rwlock_init(&p2m->lock);
@@ -1763,11 +1763,6 @@ int p2m_init(struct domain *d)
     INIT_PAGE_LIST_HEAD(&d->arch.paging.p2m_freelist);
 
     p2m->vmid = INVALID_VMID;
-
-    rc = p2m_alloc_vmid(d);
-    if ( rc != 0 )
-        return rc;
-
     p2m->max_mapped_gfn = _gfn(0);
     p2m->lowest_mapped_gfn = _gfn(ULONG_MAX);
 
@@ -1783,8 +1778,6 @@ int p2m_init(struct domain *d)
     p2m->clean_pte = is_iommu_enabled(d) &&
         !iommu_has_feature(d, IOMMU_FEAT_COHERENT_WALK);
 
-    rc = p2m_alloc_table(d);
-
     /*
      * Make sure that the type chosen to is able to store the an vCPU ID
      * between 0 and the maximum of virtual CPUS supported as long as
@@ -1797,13 +1790,20 @@ int p2m_init(struct domain *d)
        p2m->last_vcpu_ran[cpu] = INVALID_VCPU_ID;
 
     /*
-     * Besides getting a domain when we only have the p2m in hand,
-     * the back pointer to domain is also used in p2m_teardown()
-     * as an end-of-initialization indicator.
+     * "Trivial" initialisation is now complete.  Set the backpointer so
+     * p2m_teardown() and friends know to do something.
      */
     p2m->domain = d;
 
-    return rc;
+    rc = p2m_alloc_vmid(d);
+    if ( rc )
+        return rc;
+
+    rc = p2m_alloc_table(d);
+    if ( rc )
+        return rc;
+
+    return 0;
 }
 
 /*
-- 
2.17.1



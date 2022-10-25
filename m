Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B16A60C7DC
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 11:21:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429682.680832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onG7n-0004ue-P5; Tue, 25 Oct 2022 09:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429682.680832; Tue, 25 Oct 2022 09:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onG7n-0004rj-L7; Tue, 25 Oct 2022 09:21:31 +0000
Received: by outflank-mailman (input) for mailman id 429682;
 Tue, 25 Oct 2022 09:21:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OBMn=22=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1onG7m-0004qz-PD
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 09:21:30 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 66dcda20-5446-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 11:21:27 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45ED6D6E;
 Tue, 25 Oct 2022 02:21:35 -0700 (PDT)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E9DD23F792;
 Tue, 25 Oct 2022 02:21:26 -0700 (PDT)
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
X-Inumbo-ID: 66dcda20-5446-11ed-8fd0-01056ac49cbb
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH for-4.14-to-4.16 1/2] arm/p2m: Rework p2m_init()
Date: Tue, 25 Oct 2022 09:21:11 +0000
Message-Id: <20221025092112.50168-2-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221025092112.50168-1-Henry.Wang@arm.com>
References: <20221025092112.50168-1-Henry.Wang@arm.com>

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
(cherry picked from commit: 3783e583319fa1ce75e414d851f0fde191a14753)
---
 xen/arch/arm/p2m.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 13b06c0fe4..2642d2748c 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1699,7 +1699,7 @@ void p2m_final_teardown(struct domain *d)
 int p2m_init(struct domain *d)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
-    int rc = 0;
+    int rc;
     unsigned int cpu;
 
     rwlock_init(&p2m->lock);
@@ -1708,11 +1708,6 @@ int p2m_init(struct domain *d)
     INIT_PAGE_LIST_HEAD(&d->arch.paging.p2m_freelist);
 
     p2m->vmid = INVALID_VMID;
-
-    rc = p2m_alloc_vmid(d);
-    if ( rc != 0 )
-        return rc;
-
     p2m->max_mapped_gfn = _gfn(0);
     p2m->lowest_mapped_gfn = _gfn(ULONG_MAX);
 
@@ -1728,8 +1723,6 @@ int p2m_init(struct domain *d)
     p2m->clean_pte = is_iommu_enabled(d) &&
         !iommu_has_feature(d, IOMMU_FEAT_COHERENT_WALK);
 
-    rc = p2m_alloc_table(d);
-
     /*
      * Make sure that the type chosen to is able to store the an vCPU ID
      * between 0 and the maximum of virtual CPUS supported as long as
@@ -1742,13 +1735,20 @@ int p2m_init(struct domain *d)
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



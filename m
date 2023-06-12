Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B40EF72CB16
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 18:12:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547349.854688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8k83-0001Rg-8I; Mon, 12 Jun 2023 16:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547349.854688; Mon, 12 Jun 2023 16:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8k83-0001Pk-3t; Mon, 12 Jun 2023 16:10:51 +0000
Received: by outflank-mailman (input) for mailman id 547349;
 Mon, 12 Jun 2023 16:10:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnHD=CA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1q8k81-0001Pa-AS
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 16:10:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0f2b3ab-093b-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 18:10:47 +0200 (CEST)
Received: from nico.bugseng.com (rm-19-57-179.service.infuturo.it
 [151.19.57.179])
 by support.bugseng.com (Postfix) with ESMTPSA id 3F3F14EE073E;
 Mon, 12 Jun 2023 18:10:46 +0200 (CEST)
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
X-Inumbo-ID: b0f2b3ab-093b-11ee-b232-6b7b168915f2
From: nicola.vetrini@bugseng.com
To: xen-devel@lists.xenproject.org
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [XEN PATCH] xen: fixed violations of MISRA C:2012 Rule 3.1
Date: Mon, 12 Jun 2023 18:10:35 +0200
Message-Id: <e139df541183df7c92b3bd73841cf1fb2851e054.1686575613.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

The xen sources contain several violations of Rule 3.1 from MISRA C:2012,
whose headline states:
"The character sequences '/*' and '//' shall not be used within a comment".

Most of the violations are due to the presence of links to webpages within
C-style comment blocks, such as:

xen/arch/arm/include/asm/smccc.h:37.1-41.3
/*
 * This file provides common defines for ARM SMC Calling Convention as
 * specified in
 * http://infocenter.arm.com/help/topic/com.arm.doc.den0028a/index.html
 */

In this case, we propose to deviate all of these occurrences with a
project deviation to be captured by a tool configuration.

There are, however, a few other violations that do not fall under this
category, namely:

1. in file "xen/arch/arm/include/asm/arm64/flushtlb.h" we propose to
avoid the usage of a nested comment;
2. in file "xen/common/xmalloc_tlsf.c" we propose to substitute the
commented-out if statement with a "#if 0 .. #endif;
3. in file "xen/include/xen/atomic.h" and
"xen/drivers/passthrough/arm/smmu-v3.c" we propose to split the C-style
comment containing the nested comment into two doxygen comments, clearly
identifying the second as a code sample. This can then be captured with a
project deviation by a tool configuration.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/arm/include/asm/arm64/flushtlb.h | 8 ++++----
 xen/common/xmalloc_tlsf.c                 | 7 ++++---
 xen/drivers/passthrough/arm/smmu-v3.c     | 9 ++++++---
 xen/include/xen/atomic.h                  | 5 ++++-
 4 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
index 3a9092b814..90ac3f9809 100644
--- a/xen/arch/arm/include/asm/arm64/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
@@ -4,10 +4,10 @@
 /*
  * Every invalidation operation use the following patterns:
  *
- * DSB ISHST        // Ensure prior page-tables updates have completed
- * TLBI...          // Invalidate the TLB
- * DSB ISH          // Ensure the TLB invalidation has completed
- * ISB              // See explanation below
+ * DSB ISHST        Ensure prior page-tables updates have completed
+ * TLBI...          Invalidate the TLB
+ * DSB ISH          Ensure the TLB invalidation has completed
+ * ISB              See explanation below
  *
  * ARM64_WORKAROUND_REPEAT_TLBI:
  * Modification of the translation table for a virtual address might lead to
diff --git a/xen/common/xmalloc_tlsf.c b/xen/common/xmalloc_tlsf.c
index 75bdf18c4e..ea6ec47a59 100644
--- a/xen/common/xmalloc_tlsf.c
+++ b/xen/common/xmalloc_tlsf.c
@@ -140,9 +140,10 @@ static inline void MAPPING_SEARCH(unsigned long *r, int *fl, int *sl)
         *fl = flsl(*r) - 1;
         *sl = (*r >> (*fl - MAX_LOG2_SLI)) - MAX_SLI;
         *fl -= FLI_OFFSET;
-        /*if ((*fl -= FLI_OFFSET) < 0) // FL will be always >0!
-         *fl = *sl = 0;
-         */
+#if 0
+        if ((*fl -= FLI_OFFSET) < 0) // FL will be always >0!
+        fl = *sl = 0;
+#endif
         *r &= ~t;
     }
 }
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 720aa69ff2..b1c536e7d9 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1045,15 +1045,18 @@ static int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
 	/*
 	 * Ensure that we've completed prior invalidation of the main TLBs
 	 * before we read 'nr_ats_masters' in case of a concurrent call to
-	 * arm_smmu_enable_ats():
+	 * arm_smmu_enable_ats().
+	 */
+	/**
+	 * Code sample: Ensures that we always see the incremented
+	 * 'nr_ats_masters' count if ATS was enabled at the PCI device before
+	 * completion of the TLBI.
 	 *
 	 *	// unmap()			// arm_smmu_enable_ats()
 	 *	TLBI+SYNC			atomic_inc(&nr_ats_masters);
 	 *	smp_mb();			[...]
 	 *	atomic_read(&nr_ats_masters);	pci_enable_ats() // writel()
 	 *
-	 * Ensures that we always see the incremented 'nr_ats_masters' count if
-	 * ATS was enabled at the PCI device before completion of the TLBI.
 	 */
 	smp_mb();
 	if (!atomic_read(&smmu_domain->nr_ats_masters))
diff --git a/xen/include/xen/atomic.h b/xen/include/xen/atomic.h
index 529213ebbb..829646dda0 100644
--- a/xen/include/xen/atomic.h
+++ b/xen/include/xen/atomic.h
@@ -71,7 +71,10 @@ static inline void _atomic_set(atomic_t *v, int i);
  * Returns the initial value in @v, hence succeeds when the return value
  * matches that of @old.
  *
- * Sample (tries atomic increment of v until the operation succeeds):
+ */
+/**
+ *
+ * Code sample: Tries atomic increment of v until the operation succeeds.
  *
  *  while(1)
  *  {
-- 
2.34.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 483115AB189
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 15:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397715.638381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6qL-0001YE-BZ; Fri, 02 Sep 2022 13:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397715.638381; Fri, 02 Sep 2022 13:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6qL-0001Vb-7W; Fri, 02 Sep 2022 13:36:21 +0000
Received: by outflank-mailman (input) for mailman id 397715;
 Fri, 02 Sep 2022 13:36:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Z99=ZF=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oU6qJ-0008PC-5c
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 13:36:19 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 38e5c633-2ac4-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 15:36:17 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9008EED1;
 Fri,  2 Sep 2022 06:36:23 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 474213F766;
 Fri,  2 Sep 2022 06:36:16 -0700 (PDT)
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
X-Inumbo-ID: 38e5c633-2ac4-11ed-934f-f50d60e1c1bd
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 03/10] xen/arm: smmuv3: Ensure queue is read after updating prod pointer
Date: Fri,  2 Sep 2022 14:34:55 +0100
Message-Id: <59c24309e2d8494edf414904fe9725b4e7387098.1662123432.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662123432.git.rahul.singh@arm.com>
References: <cover.1662123432.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhou Wang <wangzhou1@hisilicon.com>

Backport Linux commit a76a37777f2c. This is the clean backport without
any changes.

Reading the 'prod' MMIO register in order to determine whether or
not there is valid data beyond 'cons' for a given queue does not
provide sufficient dependency ordering, as the resulting access is
address dependent only on 'cons' and can therefore be speculated
ahead of time, potentially allowing stale data to be read by the
CPU.

Use readl() instead of readl_relaxed() when updating the shadow copy
of the 'prod' pointer, so that all speculated memory reads from the
corresponding queue can occur only from valid slots.

Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
Link: https://lore.kernel.org/r/1601281922-117296-1-git-send-email-wangzhou1@hisilicon.com
[will: Use readl() instead of explicit barrier. Update 'cons' side to match.]
Signed-off-by: Will Deacon <will@kernel.org>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git a76a37777f2c
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes in v2:
 - fix commit msg
 - add _iomb changes also from the origin patch
---
 xen/arch/arm/include/asm/system.h     |  1 +
 xen/drivers/passthrough/arm/smmu-v3.c | 11 +++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/system.h b/xen/arch/arm/include/asm/system.h
index 65d5c8e423..fe27cf8c5e 100644
--- a/xen/arch/arm/include/asm/system.h
+++ b/xen/arch/arm/include/asm/system.h
@@ -29,6 +29,7 @@
 #endif
 
 #define smp_wmb()       dmb(ishst)
+#define __iomb()        dmb(osh)
 
 #define smp_mb__before_atomic()    smp_mb()
 #define smp_mb__after_atomic()     smp_mb()
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 64d39bb4d3..cee13d1fc7 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -951,7 +951,7 @@ static void queue_sync_cons_out(struct arm_smmu_queue *q)
 	 * Ensure that all CPU accesses (reads and writes) to the queue
 	 * are complete before we update the cons pointer.
 	 */
-	mb();
+	__iomb();
 	writel_relaxed(q->llq.cons, q->cons_reg);
 }
 
@@ -963,8 +963,15 @@ static void queue_inc_cons(struct arm_smmu_ll_queue *q)
 
 static int queue_sync_prod_in(struct arm_smmu_queue *q)
 {
+	u32 prod;
 	int ret = 0;
-	u32 prod = readl_relaxed(q->prod_reg);
+
+	/*
+	 * We can't use the _relaxed() variant here, as we must prevent
+	 * speculative reads of the queue before we have determined that
+	 * prod has indeed moved.
+	 */
+	prod = readl(q->prod_reg);
 
 	if (Q_OVF(prod) != Q_OVF(q->llq.prod))
 		ret = -EOVERFLOW;
-- 
2.25.1



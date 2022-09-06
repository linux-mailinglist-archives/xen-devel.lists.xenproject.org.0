Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE7A5AF75E
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:51:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400460.642233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgTD-0000Vh-3Z; Tue, 06 Sep 2022 21:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400460.642233; Tue, 06 Sep 2022 21:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgTC-0000Q3-W5; Tue, 06 Sep 2022 21:50:58 +0000
Received: by outflank-mailman (input) for mailman id 400460;
 Tue, 06 Sep 2022 21:50:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lcW6=ZJ=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oVgIh-0000Cs-Jp
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:40:07 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d1d902db-2dca-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 12:01:04 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12FC3D6E;
 Tue,  6 Sep 2022 03:01:12 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C75AA3F534;
 Tue,  6 Sep 2022 03:01:04 -0700 (PDT)
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
X-Inumbo-ID: d1d902db-2dca-11ed-af93-0125da4c0113
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Zhou Wang <wangzhou1@hisilicon.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 03/10] xen/arm: smmuv3: Ensure queue is read after updating prod pointer
Date: Tue,  6 Sep 2022 10:55:50 +0100
Message-Id: <4404a056ba2dfc7ed2a69270dd2c28d0d343dfa3.1662455798.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662455798.git.rahul.singh@arm.com>
References: <cover.1662455798.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhou Wang <wangzhou1@hisilicon.com>

Backport Linux commit a76a37777f2c. Introduce __iomb() in the smmu-v3.c
file with other Linux compatibility definitions.

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
Changes in v4:
 - rename iomb() to __iomb()
Changes in v3:
 - rename __iomb() to iomb() and also move it from common file to
   smmu-v3.c file
Changes in v2:
 - fix commit msg
 - add __iomb changes also from the origin patch
---
 xen/drivers/passthrough/arm/smmu-v3.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 64d39bb4d3..229b9a4b0d 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -107,6 +107,8 @@ typedef paddr_t		dma_addr_t;
 typedef paddr_t		phys_addr_t;
 typedef unsigned int		gfp_t;
 
+#define __iomb()		dmb(osh)
+
 #define platform_device		device
 
 #define GFP_KERNEL		0
@@ -951,7 +953,7 @@ static void queue_sync_cons_out(struct arm_smmu_queue *q)
 	 * Ensure that all CPU accesses (reads and writes) to the queue
 	 * are complete before we update the cons pointer.
 	 */
-	mb();
+	__iomb();
 	writel_relaxed(q->llq.cons, q->cons_reg);
 }
 
@@ -963,8 +965,15 @@ static void queue_inc_cons(struct arm_smmu_ll_queue *q)
 
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



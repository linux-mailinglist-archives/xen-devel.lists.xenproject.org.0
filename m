Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2028459FC6F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 15:59:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392700.631235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQqul-00018G-6C; Wed, 24 Aug 2022 13:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392700.631235; Wed, 24 Aug 2022 13:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQqul-00015x-3W; Wed, 24 Aug 2022 13:59:27 +0000
Received: by outflank-mailman (input) for mailman id 392700;
 Wed, 24 Aug 2022 13:59:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EISj=Y4=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oQqqC-0003gl-K6
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 13:54:44 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 4e7af42d-23b4-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 15:54:43 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FF1D1042;
 Wed, 24 Aug 2022 06:54:47 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A1FA3FAF5;
 Wed, 24 Aug 2022 06:54:42 -0700 (PDT)
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
X-Inumbo-ID: 4e7af42d-23b4-11ed-bd2e-47488cf2e6aa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 03/10] xen/arm: smmuv3: Ensure queue is read after updating prod pointer
Date: Wed, 24 Aug 2022 14:53:07 +0100
Message-Id: <b6051a32c515da23ed2d83467e43e59fd55127dc.1661331102.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661331102.git.rahul.singh@arm.com>
References: <cover.1661331102.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Backport Linux commit a76a37777f2c936b1f046bfc0c5982c958b16bfe
"Ensure queue is read after updating prod pointer"

Original commit message:
    iommu/arm-smmu-v3: Ensure queue is read after updating prod pointer
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

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 64d39bb4d3..93891a0704 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
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



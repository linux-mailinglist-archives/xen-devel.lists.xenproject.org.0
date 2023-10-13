Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 099907C8893
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 17:25:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616677.958920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrK2I-0005ed-Do; Fri, 13 Oct 2023 15:25:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616677.958920; Fri, 13 Oct 2023 15:25:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrK2I-0005Zq-6E; Fri, 13 Oct 2023 15:25:10 +0000
Received: by outflank-mailman (input) for mailman id 616677;
 Fri, 13 Oct 2023 15:25:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1cw9=F3=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qrK2G-0002kj-64
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 15:25:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0359cd3-69dc-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 17:25:06 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.222.93])
 by support.bugseng.com (Postfix) with ESMTPSA id 6E65A4EE0744;
 Fri, 13 Oct 2023 17:25:05 +0200 (CEST)
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
X-Inumbo-ID: b0359cd3-69dc-11ee-9b0e-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Julien Grall <julien@xen.org>,
	Rahul Singh <rahul.singh@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <henry.wang@arm.com>
Subject: [XEN PATCH 10/10] arm/smmu: address violation of MISRA C:2012 Rule 8.2
Date: Fri, 13 Oct 2023 17:24:40 +0200
Message-Id: <199886f6ba1f2d5701eabd080b4f9723fc28f4b9.1697207038.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697207038.git.federico.serafini@bugseng.com>
References: <cover.1697207038.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names, no functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/drivers/passthrough/arm/smmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 71799064f8..11fc1d22ef 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -277,8 +277,8 @@ static void iommu_group_put(struct iommu_group *group)
 }
 
 static void iommu_group_set_iommudata(struct iommu_group *group,
-				      struct arm_smmu_master_cfg *cfg,
-				      void (*releasefn)(void *))
+                                      struct arm_smmu_master_cfg *cfg,
+                                      void (*releasefn)(void *data))
 {
 	/* TODO: Store the releasefn for the PCI */
 	ASSERT(releasefn == NULL);
@@ -2082,7 +2082,7 @@ static int arm_smmu_add_device(struct device *dev)
 	struct arm_smmu_device *smmu;
 	struct arm_smmu_master_cfg *cfg;
 	struct iommu_group *group;
-	void (*releasefn)(void *) = NULL;
+	void (*releasefn)(void *data) = NULL;
 	int ret;
 
 	smmu = find_smmu_for_device(dev);
-- 
2.34.1



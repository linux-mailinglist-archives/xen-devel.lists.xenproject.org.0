Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 149BC63F4BC
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 17:06:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450926.708465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0m4D-0002Zb-5l; Thu, 01 Dec 2022 16:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450926.708465; Thu, 01 Dec 2022 16:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0m4D-0002Wa-2D; Thu, 01 Dec 2022 16:05:41 +0000
Received: by outflank-mailman (input) for mailman id 450926;
 Thu, 01 Dec 2022 16:05:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ShmB=37=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1p0m4C-0001G4-0i
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 16:05:40 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id ff7e8dd5-7191-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 17:05:39 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31615ED1;
 Thu,  1 Dec 2022 08:05:45 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2E163F73B;
 Thu,  1 Dec 2022 08:05:37 -0800 (PST)
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
X-Inumbo-ID: ff7e8dd5-7191-11ed-8fd2-01056ac49cbb
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 03/21] xen/arm: smmuv3: Alloc io_domain for each device
Date: Thu,  1 Dec 2022 16:02:27 +0000
Message-Id: <9dcf6a14c77db281933c0a5a19a58b0454ce587c.1669888522.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669888522.git.rahul.singh@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In current implementation io_domain is allocated once for each xen
domain as Stage2 translation is common for all devices in same xen
domain.

Nested stage supports S1 and S2 configuration at the same time. Stage1
translation will be different for each device as linux kernel will
allocate page-table for each device.

Alloc io_domain for each device so that each device can have different
Stage-1 and Stage-2 configuration structure.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 866fe8de4d..9174d2dedd 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -2753,11 +2753,13 @@ static struct arm_smmu_device *arm_smmu_get_by_dev(struct device *dev)
 static struct iommu_domain *arm_smmu_get_domain(struct domain *d,
 				struct device *dev)
 {
+	unsigned long flags;
 	struct iommu_domain *io_domain;
 	struct arm_smmu_domain *smmu_domain;
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
 	struct arm_smmu_device *smmu = arm_smmu_get_by_dev(fwspec->iommu_dev);
+	struct arm_smmu_master *master;
 
 	if (!smmu)
 		return NULL;
@@ -2768,8 +2770,15 @@ static struct iommu_domain *arm_smmu_get_domain(struct domain *d,
 	 */
 	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
 		smmu_domain = to_smmu_domain(io_domain);
-		if (smmu_domain->smmu == smmu)
-			return io_domain;
+
+		spin_lock_irqsave(&smmu_domain->devices_lock, flags);
+		list_for_each_entry(master, &smmu_domain->devices, domain_head) {
+			if (master->dev == dev) {
+				spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
+				return io_domain;
+			}
+		}
+		spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
 	}
 	return NULL;
 }
-- 
2.25.1



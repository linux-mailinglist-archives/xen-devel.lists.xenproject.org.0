Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93749511C4E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 18:16:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315273.533741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njkKk-0007Ge-0k; Wed, 27 Apr 2022 16:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315273.533741; Wed, 27 Apr 2022 16:16:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njkKj-0007EO-Te; Wed, 27 Apr 2022 16:16:05 +0000
Received: by outflank-mailman (input) for mailman id 315273;
 Wed, 27 Apr 2022 16:16:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sRcl=VF=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1njkKi-0007EC-9I
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 16:16:04 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 556acb42-c645-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 18:16:03 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 827F8ED1;
 Wed, 27 Apr 2022 09:16:02 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DBD83F5A1;
 Wed, 27 Apr 2022 09:16:01 -0700 (PDT)
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
X-Inumbo-ID: 556acb42-c645-11ec-a405-831a346695d4
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: smmuv1: remove iommu group when deassign a device
Date: Wed, 27 Apr 2022 17:15:51 +0100
Message-Id: <a19f7238f428deb610df643944f60e1e79e273cf.1651075797.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When a device is deassigned from the domain it is required to remove the
iommu group.

If we don't remove the group, the next time when we assign
a device, SME and S2CR will not be setup correctly for the device
because of that SMMU fault will be observed.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 5cacb2dd99..9a31c332d0 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -1690,6 +1690,8 @@ static void arm_smmu_detach_dev(struct iommu_domain *domain, struct device *dev)
 	if (cfg)
 		arm_smmu_master_free_smes(cfg);
 
+	iommu_group_put(dev_iommu_group(dev));
+	dev_iommu_group(dev) = NULL;
 }
 
 #if 0 /*
-- 
2.25.1



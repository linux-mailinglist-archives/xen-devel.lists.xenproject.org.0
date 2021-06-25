Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EB53B477F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 18:37:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147325.271491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwopw-0006IE-Qz; Fri, 25 Jun 2021 16:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147325.271491; Fri, 25 Jun 2021 16:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwopw-0006G6-Nl; Fri, 25 Jun 2021 16:37:48 +0000
Received: by outflank-mailman (input) for mailman id 147325;
 Fri, 25 Jun 2021 16:37:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqCl=LT=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lwopv-0006FN-1k
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 16:37:47 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 559867d7-eded-4ff4-b049-5ac0980b89b7;
 Fri, 25 Jun 2021 16:37:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29ED91396;
 Fri, 25 Jun 2021 09:37:46 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 433703F719;
 Fri, 25 Jun 2021 09:37:45 -0700 (PDT)
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
X-Inumbo-ID: 559867d7-eded-4ff4-b049-5ac0980b89b7
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: smmuv1: Set privileged attr to 'default'
Date: Fri, 25 Jun 2021 17:37:27 +0100
Message-Id: <c6c5e3deb97200baefb75d06ec934d2c6ee5eb62.1624546852.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <612e7f61c19e60019bb7829888342fda95fd36be.1624546532.git.rahul.singh@arm.com>
References: <612e7f61c19e60019bb7829888342fda95fd36be.1624546532.git.rahul.singh@arm.com>

Backport commit e19898077cfb642fe151ba22981e795c74d9e114
"iommu/arm-smmu: Set privileged attribute to 'default' instead of
'unprivileged'"

Original commit message:
    Currently the driver sets all the device transactions privileges
    to UNPRIVILEGED, but there are cases where the iommu masters wants
    to isolate privileged supervisor and unprivileged user.
    So don't override the privileged setting to unprivileged, instead
    set it to default as incoming and let it be controlled by the
    pagetable settings.

    Acked-by: Will Deacon <will.deacon@arm.com>
    Signed-off-by: Sricharan R <sricharan@codeaurora.org>
    Signed-off-by: Will Deacon <will.deacon@arm.com>

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 1a68c2ab3b..d9a3a0cbf6 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -1566,7 +1566,7 @@ static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
 			continue;
 
 		s2cr[idx].type = type ;
-		s2cr[idx].privcfg = S2CR_PRIVCFG_UNPRIV;
+		s2cr[idx].privcfg = S2CR_PRIVCFG_DEFAULT;
 		s2cr[idx].cbndx = cbndx;
 		arm_smmu_write_s2cr(smmu, idx);
 	}
-- 
2.17.1



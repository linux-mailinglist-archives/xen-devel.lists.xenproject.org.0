Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 213B63B477C
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 18:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147324.271480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwopq-0005z0-IN; Fri, 25 Jun 2021 16:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147324.271480; Fri, 25 Jun 2021 16:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwopq-0005wg-Ef; Fri, 25 Jun 2021 16:37:42 +0000
Received: by outflank-mailman (input) for mailman id 147324;
 Fri, 25 Jun 2021 16:37:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqCl=LT=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lwopp-0005wW-8o
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 16:37:41 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id ac1ae509-4fba-482a-84ea-ea43ab348c04;
 Fri, 25 Jun 2021 16:37:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EDE31396;
 Fri, 25 Jun 2021 09:37:39 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37B1B3F719;
 Fri, 25 Jun 2021 09:37:38 -0700 (PDT)
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
X-Inumbo-ID: ac1ae509-4fba-482a-84ea-ea43ab348c04
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: smmuv1: Fixed stream matching register allocation
Date: Fri, 25 Jun 2021 17:37:26 +0100
Message-Id: <612e7f61c19e60019bb7829888342fda95fd36be.1624546532.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1

SMR allocation should be based on the number of supported stream
matching register for each SMMU device.

Issue introduced by commit 5e08586afbb90b2e2d56c175c07db77a4afa873c
when backported the patches from Linux to XEN to fix the stream match
conflict issue when two devices have the same stream-id.

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index d9a3a0cbf6..da2cd457d7 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -149,6 +149,7 @@ typedef enum irqreturn irqreturn_t;
 #define kzalloc(size, flags)		_xzalloc(size, sizeof(void *))
 #define devm_kzalloc(dev, size, flags)	_xzalloc(size, sizeof(void *))
 #define kmalloc_array(size, n, flags)	_xmalloc_array(size, sizeof(void *), n)
+#define kzalloc_array(size, n, flags)	_xzalloc_array(size, sizeof(void *), n)
 
 static void __iomem *devm_ioremap_resource(struct device *dev,
 					   struct resource *res)
@@ -2221,7 +2222,7 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 		smmu->smr_mask_mask = smr >> SMR_MASK_SHIFT;
 
 		/* Zero-initialised to mark as invalid */
-		smmu->smrs = devm_kzalloc(smmu->dev, sizeof(*smmu->smrs), GFP_KERNEL);
+		smmu->smrs = kzalloc_array(sizeof(*smmu->smrs), size, GFP_KERNEL);
 		if (!smmu->smrs)
 			return -ENOMEM;
 
-- 
2.17.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 766F6352BDD
	for <lists+xen-devel@lfdr.de>; Fri,  2 Apr 2021 17:51:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104905.200930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lSM4m-0007Gp-3i; Fri, 02 Apr 2021 15:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104905.200930; Fri, 02 Apr 2021 15:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lSM4m-0007GQ-0K; Fri, 02 Apr 2021 15:51:12 +0000
Received: by outflank-mailman (input) for mailman id 104905;
 Fri, 02 Apr 2021 15:51:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lSM4k-0007GL-Rs
 for xen-devel@lists.xenproject.org; Fri, 02 Apr 2021 15:51:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lSM4k-0000dr-G1; Fri, 02 Apr 2021 15:51:10 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lSM4k-0007En-4r; Fri, 02 Apr 2021 15:51:10 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=96ZKz1XmVWDUX9O90srYP7TKBuT4+NLELAxUsP7ryl8=; b=R4hgIoOsFE7yXyA2OwciAkNIAM
	JOsokbamE5Wb/jU0E4TABqEXBTjR3KJMCyLKaSuKiOUaZlExQin/Uf04QYirrtLJbNs9xv3ohN1mv
	j9fF0TE7/Cz4Lg2kYmRaPBXDiJY2zMj8SlRnE3SoZM4qyefXe14SJ8Wcnaboog22DjBY=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/iommu: smmu: Silence clang in arm_smmu_device_dt_probe()
Date: Fri,  2 Apr 2021 16:51:06 +0100
Message-Id: <20210402155106.15486-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Clang 11 will throw the following error:

smmu.c:2284:18: error: cast to smaller integer type 'enum arm_smmu_arch_version' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
        smmu->version = (enum arm_smmu_arch_version)of_id->data;
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The error can be prevented by initially casting to (uintptr_t) and then
enum.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Changes in v2:
    - Cast to (uintptr_t) rather than introduce separate pointer
    (requested by Andrew).

Only build tested
---
 xen/drivers/passthrough/arm/smmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 20ac672e91b6..fab7be8b48bb 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -2382,7 +2382,7 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev)
 	smmu->dev = dev;
 
 	of_id = of_match_node(arm_smmu_of_match, dev->of_node);
-	smmu->version = (enum arm_smmu_arch_version)of_id->data;
+	smmu->version = (enum arm_smmu_arch_version)(uintptr_t)of_id->data;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	smmu->base = devm_ioremap_resource(dev, res);
-- 
2.17.1



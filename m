Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 806E072524C
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 05:06:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544291.849974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6jUN-0002SB-4Y; Wed, 07 Jun 2023 03:05:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544291.849974; Wed, 07 Jun 2023 03:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6jUN-0002Ol-1D; Wed, 07 Jun 2023 03:05:35 +0000
Received: by outflank-mailman (input) for mailman id 544291;
 Wed, 07 Jun 2023 03:05:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfoE=B3=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1q6jUL-00029M-3z
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 03:05:33 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29760b33-04e0-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 05:05:32 +0200 (CEST)
Received: from BYAPR07CA0090.namprd07.prod.outlook.com (2603:10b6:a03:12b::31)
 by MW4PR12MB5625.namprd12.prod.outlook.com (2603:10b6:303:168::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 03:05:28 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:12b:cafe::f6) by BYAPR07CA0090.outlook.office365.com
 (2603:10b6:a03:12b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Wed, 7 Jun 2023 03:05:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.36 via Frontend Transport; Wed, 7 Jun 2023 03:05:26 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 22:05:25 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 22:05:24 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 22:05:23 -0500
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
X-Inumbo-ID: 29760b33-04e0-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A31Zozbf4U0MlcxvxzzzVvE4IGw2EC3S72yZrehb3FaYhv4gPWixfRk56tPS8bry9AXH9wCagNWUoAZB/NqZDomr/0Z7B7Y8444YhVgtBTPC3EyIH/IPu8jUlkvwaUYW6rjJlMaiInqXDhPlf90g7ocGV5hxUQzMT2zSA25oL0uX+njVNNGVrtx+4L1nCtZQPKxKvHDh9mow7W9vMiZalrF+Btp4sD+AzIgKFwP6wyYyP5+WXxWEvZWS32FvkIZ23vS196JrCXFpOI3lUlUeOBKWKtqvMkzFKjmtaleKtyAe54qDttwGyWdMId8Kgr0bKQfJYlrMk5DuE+5/qSOZmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IR23MxhVQUAbCp/F/DH8joMby5YUmz7+v0X+yjQZ5Cw=;
 b=kuoGyO3tcw21UfhiSctHkgd4FEEsCYNVSLhgP/066BJ+AiyPbOYWshwbmiEsiRrQpPxpxejmwrNN7VfROqEpTeKg9HcL6q6WkgiYBeSI8OUwml7+XjwTG+5R0kxbOtFcdsfqvR62Nl1/uAbWKaw7txW6gFtJtVwqMCwrijjesTAKCaO8uz2TA51YjUq7Pz1vF4tlAVyx84LOs/n28bW75NzuHLvujwuNkDp3+5Dt9dMCkx4et+uuHLIHFkP75J7b0ZAatytcVpesp55YDOYHuWLIIDpAN0snN0OKdUL/2MvbLUEIJMj0aApuCPvKdqW7M5lEEbnbBGIbkOu6De1iMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IR23MxhVQUAbCp/F/DH8joMby5YUmz7+v0X+yjQZ5Cw=;
 b=19/bz30kSO09H3yJp76Ez4lWRUfoxYU5c9WhFWMunIwKRdh92zgNsqB3ZINgKpZOeoWfJb5YcDbTTRYn3jERqwoI6WOdodlwqLicnxRiAx0XZO6ZTDFW/NE1WJ4339yAjZe2gkDqCVxMeSnQquqtJyY6tOx5ua/x1P3kWtg+q70=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Rahul Singh
	<rahul.singh@arm.com>, Bertrand Marquis <bertrand.marquis@arm.com>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>
Subject: [PATCH v4 1/7] xen/arm: Improve readability of check for registered devices
Date: Tue, 6 Jun 2023 23:02:14 -0400
Message-ID: <20230607030220.22698-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607030220.22698-1-stewart.hildebrand@amd.com>
References: <20230607030220.22698-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|MW4PR12MB5625:EE_
X-MS-Office365-Filtering-Correlation-Id: 098a4bd8-1043-4374-25a2-08db67040b4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k+jlx5Akjo+zGyu7iVck76upxSHq5rS8qkW0Me8T2NGylBVEkGXZsfmA8fB/doL7g51nABr0dTn/QZwFUdO0ea2PRBYY4siZX0zeyoyMmGNlBMYUyqTv8k1yPrpdnvTaRT7YMwuRqgdq/V9zQ54cyFU6vXukcBhU3B5wn2assI3wqFHJ1f+w1/dvQPZ9jpgMsbeMDPWgEewDeaiPzQ1MWMiAp792Zb00AayewCABbZzdfRbrST0UsN8xjGMir9+uiPQk4c08kpvKFWra1uLevQ35bUQOaK8YdeEMT4auaLTwc1Zqawk7AizHI55KkNfgXgQNaZsR2qBtOhohttagMPiq58g8hRtQMyEAejCW/+k7MC3kZ9mwE1xuAmtY/nHy+4QSwqqlA6FpuRhVWQkfdZ3zn3gLI7ARvwTmB+EA1E194uv9N1g6a+oxrdw/RHD3arQzIPte1FIg+1nJeL5zQADG0qJaS7tD6pO1e2+pJH9t27r9J15DOXdvC+B54jOImCGttQZ9sNz2br6/CQ2zPVK93z1ha3q+flrY6UPDiueIVFqwMDdBmEnnJ87K4D4FGGTvBmVAM/N1Y5+xFusMO0IEisPnO8yO48Wrm8SFPfrQ8/tFjON+CB9KN2X49DAyEoYLjJtami/YjaI6kgO4OQOKFSn6BvLJVusfncydIuc2uh9gF6D6OU2vdoDLMi2RyYt4Lwj4nOUkj8KdTVKGEhQ9SBxHyOzBw4UauLSYikVn2r/dnX/dGAZ33G46hVgAv7GyOgQZu3S2TW3HNjEizA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199021)(40470700004)(46966006)(36840700001)(36756003)(82310400005)(44832011)(5660300002)(86362001)(2906002)(40480700001)(47076005)(6666004)(186003)(426003)(336012)(36860700001)(83380400001)(1076003)(26005)(356005)(81166007)(82740400003)(478600001)(40460700003)(54906003)(2616005)(316002)(41300700001)(6916009)(70206006)(70586007)(4326008)(8676002)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 03:05:26.8630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 098a4bd8-1043-4374-25a2-08db67040b4d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5625

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Improve readability of check for devices already registered with the SMMU with
legacy mmu-masters DT bindings by using is_protected.

There are 2 device tree bindings for registering a device with the SMMU:
* mmu-masters (legacy, SMMUv1/2 only)
* iommus

A device tree may include both mmu-masters and iommus properties (although it is
unnecessary to do so). When a device appears in the mmu-masters list,
np->is_protected and dev->iommu_fwspec both get set by the SMMUv1/2 driver. The
function iommu_add_dt_device() is subsequently invoked for devices that have an
iommus specification.

The check as it was before this patch:

  if ( dev_iommu_fwspec_get(dev) )
      return 0;

and the new check:

  if ( dt_device_is_protected(np) )
      return 0;

are guarding against the same corner case: when a device has both mmu-masters
and iommus specifications in the device tree. The is_protected naming is more
descriptive.

If np->is_protected is not set (i.e. false), but dev->iommu_fwspec is set, it is
an error condition, so return an error in this case.

Expand the comment to further clarify the corner case.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v3->v4:
* new patch: this change was split from ("xen/arm: Move is_protected flag to struct device")
---
 xen/drivers/passthrough/device_tree.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 1c32d7b50cce..d9b63da7260a 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -141,12 +141,17 @@ int iommu_add_dt_device(struct dt_device_node *np)
         return -EINVAL;
 
     /*
-     * The device may already have been registered. As there is no harm in
-     * it just return success early.
+     * Devices that appear in the legacy mmu-masters list may have already been
+     * registered with the SMMU. In case a device has both a mmu-masters entry
+     * and iommus property, there is no need to register it again. In this case
+     * simply return success early.
      */
-    if ( dev_iommu_fwspec_get(dev) )
+    if ( dt_device_is_protected(np) )
         return 0;
 
+    if ( dev_iommu_fwspec_get(dev) )
+        return -EEXIST;
+
     /*
      * According to the Documentation/devicetree/bindings/iommu/iommu.txt
      * from Linux.
-- 
2.40.1



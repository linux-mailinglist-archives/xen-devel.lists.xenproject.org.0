Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA116F38FC
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 22:03:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528261.821190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZkJ-0005fD-WC; Mon, 01 May 2023 20:03:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528261.821190; Mon, 01 May 2023 20:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZkJ-0005ci-Su; Mon, 01 May 2023 20:03:39 +0000
Received: by outflank-mailman (input) for mailman id 528261;
 Mon, 01 May 2023 20:03:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwpa=AW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ptZkI-000525-PU
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 20:03:38 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41eb799f-e85b-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 22:03:37 +0200 (CEST)
Received: from BN8PR16CA0024.namprd16.prod.outlook.com (2603:10b6:408:4c::37)
 by CO6PR12MB5409.namprd12.prod.outlook.com (2603:10b6:5:357::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 20:03:34 +0000
Received: from BN8NAM11FT091.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:4c:cafe::db) by BN8PR16CA0024.outlook.office365.com
 (2603:10b6:408:4c::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30 via Frontend
 Transport; Mon, 1 May 2023 20:03:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT091.mail.protection.outlook.com (10.13.176.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.20 via Frontend Transport; Mon, 1 May 2023 20:03:33 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 1 May
 2023 15:03:33 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 1 May
 2023 13:03:33 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 1 May 2023 15:03:32 -0500
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
X-Inumbo-ID: 41eb799f-e85b-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LV0L+cf9/+6ujJZdLT8zIve3cMVi3MpH41QJrGA7CHEm4Q4bUgznShMOcJt80isbi9oScwHO1tQ1yyN3pIDsqUe+E7XujEyBxWcPnls5z+p9VQWlKlB70yRnCYYzwqn871TmJIxOy5oJAD66NMnTqB9khf4gHY9KBMLyvXp4XL5Ee1wlPhyptlXCJShRqGTkbLEf8GdJDo9mTysBEVa+lLk38YgZS1ro4EHmMkSO9NBNVvo7m1Fm50VriNcN/N166twvnQqR8dfTvRfX+bv71eowKXkprixLgMQDcnAqoFplhmJD96R7otYw+YqwGqEZyPyOyN5DRxs/iuZLJQGgOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FH3cbOq7w4Ry4gUimwrCXWO3YUo9mU/EEVtFtBj29+A=;
 b=Twdih1oH9w/ylQfYLwykufELuND7MvGz+L/nnqynK0t/AHIlrRbSbnnDENCuAAxSoEjoypXDVhFIttZhiDZLBETdIcTw6nO0TnVwRpa9jkKPWZW4DCKwl1wjZMpKibXe7M8eAM+MJKUk1FYPGQNs6JksM9ikY26W3FebZPogpwDfAtZgYYAkeNnJDHykR6pIUIaaEmyCr49zLoQ0t5MVim3EKe4TrYcvlOo73xznYS6t7HDiMWvpJb4wOde5rfFMv6YiQOsEX7EIAeXoOhCvGsfAzXmo1aEhxF58RSkQ0ndqxKfkdAy6P9UBNxOqc3BfqeBiRos0SyPNOZEToalGKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FH3cbOq7w4Ry4gUimwrCXWO3YUo9mU/EEVtFtBj29+A=;
 b=gb1DePfI6A2wEm5sog39kHFHnEzCTWnFg/y79Tfmwd7O9JC+dexz5WD0EsN0L/u8sVvH8KofezLyqcwpLE8qO91o7KxMBBkDCsIyLBGw2t5HgjJm+krxhwy1KoPEjXQAaBhMp3tWIBHwnj45KRfvobpb7zEt3gXCtG99yI2ZRys=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v1 2/6] iommu/arm: Add iommu_dt_xlate()
Date: Mon, 1 May 2023 16:03:01 -0400
Message-ID: <20230501200305.168058-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501200305.168058-1-stewart.hildebrand@amd.com>
References: <20230501200305.168058-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT091:EE_|CO6PR12MB5409:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cebc486-355f-4c39-d618-08db4a7f24ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	haDaEyABepE2+Gd97f0WweYm957fdnjDqu1y9Tqk61FEjA6lT5xKt7LwNaydMWmDZ7I77xuy/Eucn1nzrilsG0x2MRPlZ6GUNpGtsMeapI+R0MoHXR3v4yg5xJqQueT06qoj833NWBAwI62BrhrxtNdOHfto+V82EP0/L/v2ZuytWl7rlVhtXb5byFjLVkqE/KxDbi7zuysm+xt8CvtwkHcoMTWcoypxKsz4vv7NeDQHM5vqtM/+pOwZ7AsqhX3Ny6GugI6iHPgOmNAqZVSCB7x2Z2HFeDhqkfmYy19JhxAcWpRxvc0xIgmPLQhAu88/hP8/U0ThVo73FAtloxfAO5lwm0JcyJCwHnehxPrnAdqyEKkeLbdgG26ng5sro0C/Yt4490vxFu9bsyRG1dhnPYZM+7iG/lB6WcAHLMI2VnJHIZkR9nLJWlqCAkP4a11l3Y/blD/UUAP6avM1NlzZp3hldQIKacjtEzL5HCfdqCV3XztBx2fogf5qh2q+Rq+OEU9nl0jh1fJNf5UOJQi6/3y2crM5H9gQYArHlJlHZynt/H9se1LT72kJtXhog26qf1OZoCGRwLC1whvSvosNTBqOenFL7jlzrr8PY6KFwBbrMJbFV2QrlssW9NUmz/GY5kr/8IaE+0BJuDAzBdRWxPlCk5DmC/vcNQ1jRuHbXBVeLPQhh9Hi6B3i4oTNk231YaSN2ECcCmHuILieZvkqmzW1Fj9Sk6Ec301LZWjMIIo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199021)(46966006)(36840700001)(40470700004)(40480700001)(82310400005)(40460700003)(316002)(2616005)(4326008)(1076003)(336012)(426003)(70586007)(41300700001)(47076005)(83380400001)(36860700001)(26005)(478600001)(54906003)(70206006)(6916009)(6666004)(966005)(186003)(356005)(82740400003)(2906002)(36756003)(81166007)(86362001)(44832011)(8936002)(8676002)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 20:03:33.9197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cebc486-355f-4c39-d618-08db4a7f24ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT091.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5409

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Move code for processing DT IOMMU specifier to a separate helper.
This helper will be re-used for adding PCI devices by the subsequent
patches as we will need exact the same actions for processing
DT PCI-IOMMU specifier.

While at it introduce NO_IOMMU to avoid magic "1".

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com> # rename
---
downstream->v1:
* trivial rebase
* s/dt_iommu_xlate/iommu_dt_xlate/

(cherry picked from commit c26bab0415ca303df86aba1d06ef8edc713734d3 from
 the downstream branch poc/pci-passthrough from
 https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
---
 xen/drivers/passthrough/device_tree.c | 42 +++++++++++++++++----------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index b5bd13393b56..1b50f4670944 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -127,15 +127,39 @@ int iommu_release_dt_devices(struct domain *d)
     return 0;
 }
 
+/* This correlation must not be altered */
+#define NO_IOMMU    1
+
+static int iommu_dt_xlate(struct device *dev,
+                          struct dt_phandle_args *iommu_spec)
+{
+    const struct iommu_ops *ops = iommu_get_ops();
+    int rc;
+
+    if ( !dt_device_is_available(iommu_spec->np) )
+        return NO_IOMMU;
+
+    rc = iommu_fwspec_init(dev, &iommu_spec->np->dev);
+    if ( rc )
+        return rc;
+
+    /*
+     * Provide DT IOMMU specifier which describes the IOMMU master
+     * interfaces of that device (device IDs, etc) to the driver.
+     * The driver is responsible to decide how to interpret them.
+     */
+    return ops->dt_xlate(dev, iommu_spec);
+}
+
 int iommu_add_dt_device(struct dt_device_node *np)
 {
     const struct iommu_ops *ops = iommu_get_ops();
     struct dt_phandle_args iommu_spec;
     struct device *dev = dt_to_dev(np);
-    int rc = 1, index = 0;
+    int rc = NO_IOMMU, index = 0;
 
     if ( !iommu_enabled )
-        return 1;
+        return NO_IOMMU;
 
     if ( !ops )
         return -EINVAL;
@@ -164,19 +188,7 @@ int iommu_add_dt_device(struct dt_device_node *np)
         if ( !ops->add_device || !ops->dt_xlate )
             return -EINVAL;
 
-        if ( !dt_device_is_available(iommu_spec.np) )
-            break;
-
-        rc = iommu_fwspec_init(dev, &iommu_spec.np->dev);
-        if ( rc )
-            break;
-
-        /*
-         * Provide DT IOMMU specifier which describes the IOMMU master
-         * interfaces of that device (device IDs, etc) to the driver.
-         * The driver is responsible to decide how to interpret them.
-         */
-        rc = ops->dt_xlate(dev, &iommu_spec);
+        rc = iommu_dt_xlate(dev, &iommu_spec);
         if ( rc )
             break;
 
-- 
2.40.1



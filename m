Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 480F779333E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 03:17:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595997.929780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhA3-0000Ue-16; Wed, 06 Sep 2023 01:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595997.929780; Wed, 06 Sep 2023 01:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhA2-0000NX-Hr; Wed, 06 Sep 2023 01:16:50 +0000
Received: by outflank-mailman (input) for mailman id 595997;
 Wed, 06 Sep 2023 01:16:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbfT=EW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qdhA0-0006tr-8D
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 01:16:48 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ccc862b-4c53-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 03:16:47 +0200 (CEST)
Received: from MN2PR19CA0019.namprd19.prod.outlook.com (2603:10b6:208:178::32)
 by BL3PR12MB9052.namprd12.prod.outlook.com (2603:10b6:208:3bb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Wed, 6 Sep
 2023 01:16:45 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:178:cafe::c1) by MN2PR19CA0019.outlook.office365.com
 (2603:10b6:208:178::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34 via Frontend
 Transport; Wed, 6 Sep 2023 01:16:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 01:16:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:42 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 5 Sep 2023 20:16:41 -0500
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
X-Inumbo-ID: 0ccc862b-4c53-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBg1DDNhP8qXdAIAGp4WVRdfKNF/Vhc1E2Ef4e/v7RtotSiVJn6SCq6luUbAwTXNYukBzUTzieXkoTcgpGI4sZYaY2K/zNmrHKJVxOd1oNu7otn+udHaOeTptmdZtGJVLfSy8W2RIYSpfaI7OJwHcsMtAbWXdgq/mZkP7z1E6jVYiEqDzZYNgTG9k0uAjjn1s9tHNXf4I6UTMq8A8zAXJWWbecjUm/IJrJy4RRjy0Rn60LvRS1Thwz6xMkgEFoDLCG3GaMcVHUtixKYWZdZUebtPL9mfsIle/d+mhalC+I1hT8PwyAI7wcsgOhBPHtS6vpF8b3OkAm8t+TDWt62NTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrgEsWcwxI+fxIg7Dz5RugaxhcdPFLlME4+MrASnUSw=;
 b=AT2m9zaG7bjnMwOj/ZSaCea/fUOtdSk/P8DL9tZ1/S4CrtblrjG6RqPaP1VPQi5XZO2+WkDGxe+e4OYC3y0IhLQjnN3VLNkB6x9Q49i2O+ugqmHzr6YntFBLS7FNK+JNr6yOs/AiWE1Jkh+uhyqeAcNzbTLlMQtsJx3Tk6sxzzyEo8Ci0yyV7wB6Br2wGi+y5F9v8EnQ134k5G3oCuwful5C0rM9U6KM3WIdQfBRtYlGtIGQQb7G9yFK1N8AElW76UqzBCiBuWLb1oO74OD7VI20sh/4Fm/nKIl1tQeqFvTGjS21NilSq5uoDOfFnBRMmxI/CPYUC7t7v429jWWO7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrgEsWcwxI+fxIg7Dz5RugaxhcdPFLlME4+MrASnUSw=;
 b=VcCRaChZJ1TFoLFO2pa8VsdCc5MqBjoaKV7gnUWjvc/v1Y979diX+XohwpyTJKF5nPF9/dxhcuCfazh6Y/8tnejj1SSqt+w6y8ossDYfpWYzD0oZvTBWHzixAD5jG17I24iLSjeJ/hZKM6PcFuzcnArUVBBWmg6DNMZr0vpP4GA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>
Subject: [XEN][PATCH v12 10/20] xen/iommu: protect iommu_add_dt_device() with dtdevs_lock
Date: Tue, 5 Sep 2023 18:16:20 -0700
Message-ID: <20230906011631.30310-11-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230906011631.30310-1-vikram.garhwal@amd.com>
References: <20230906011631.30310-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|BL3PR12MB9052:EE_
X-MS-Office365-Filtering-Correlation-Id: b10a6c5c-a22b-4109-c291-08dbae76ef96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5VxtcJgTRbn5Qmw74uvCbkM7DCwaEVZuMfNOCGcCKsJfPfxnC5O353Cs8sArJNuUACmnMaCKulPJqurjKOdnNt6VUCtZFVqMjU9LsN7575y/pONWSg1gv8CcCrnV7KuBJuVTVeRnZr/5VfwMpyEaSYO3jNeVG2CYxXtZho2ZzuSfJNucHZAJNYFgGwyIyrOm/lzFxcgJzFoGVtkOjKx2KHRGTzgq8282dy4C4YVHCqrl5+DNPyYo2lIILSeD3BRG1Jj+kcqsoMAgWQuZZ/HCePaCw5E91My6lEyeYUwpQGh+7njxFk4f4dYdGwu3uZtB0ZPA5e4dvFbmBPRJ6rGYJkJTR+oBqcDC3wlUkRVA/KztdTTNgB5sC0f32+TiBgkz2tIQQYFuKn65K7a8aGDaGHoCFp4dTs3/THkcwjFNxZiN5+01gtHFiQt06HFA0rkUhTZ5SR05XldtHhwtGlKAjhNrWHeWVAzFHoZcgtVdfL9wptMYKLN9KZf3uJ57N6pVSRC+0OsSJ+VFtGm1JfKA/YYokp6YlZhZCoxTpZr0dZkIqULXtp4XQ5RetF2CeAmQPfqzsQ4xHYVncD+Dyy7P/udHkQacR/FBpNQvbqdFEgw2D2kGpoO7K9FWP7aFRSCLRM7DmG4tC8Sk3JFRU8WnNRvtm5D/3no6IUkQV22A37pVGL6bNYSiRv/2T4FYCUKxhAmQZ2L2DhCtBiRyy13EhOo89BwN3bvoDqdzm9Aaj994zSpRK2aA+/pI+n2dsHoimHkt+MDi7FdO7jVirYy7hg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(346002)(376002)(186009)(1800799009)(82310400011)(451199024)(40470700004)(36840700001)(46966006)(8676002)(8936002)(5660300002)(6916009)(316002)(2906002)(54906003)(36756003)(70206006)(70586007)(44832011)(4326008)(36860700001)(41300700001)(40460700003)(426003)(1076003)(26005)(40480700001)(47076005)(336012)(82740400003)(6666004)(81166007)(356005)(478600001)(83380400001)(2616005)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 01:16:45.1597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b10a6c5c-a22b-4109-c291-08dbae76ef96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9052

Protect iommu_add_dt_device() with dtdevs_lock to prevent concurrent access
to add/remove/assign/deassign.
With addition of dynamic programming feature(follow-up patches in this series),
this function can be concurrently accessed by dynamic node add/remove using
device tree overlays.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>

---
    Changes from v7:
        Update commit message and fix indent.
---
---
 xen/drivers/passthrough/device_tree.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index a7d86a20a0..687c61e7da 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -147,6 +147,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
     if ( dev_iommu_fwspec_get(dev) )
         return 0;
 
+    spin_lock(&dtdevs_lock);
+
     /*
      * According to the Documentation/devicetree/bindings/iommu/iommu.txt
      * from Linux.
@@ -159,7 +161,10 @@ int iommu_add_dt_device(struct dt_device_node *np)
          * these callback implemented.
          */
         if ( !ops->add_device || !ops->dt_xlate )
-            return -EINVAL;
+        {
+            rc = -EINVAL;
+            goto fail;
+        }
 
         if ( !dt_device_is_available(iommu_spec.np) )
             break;
@@ -190,6 +195,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
     if ( rc < 0 )
         iommu_fwspec_free(dev);
 
+ fail:
+    spin_unlock(&dtdevs_lock);
     return rc;
 }
 
-- 
2.17.1



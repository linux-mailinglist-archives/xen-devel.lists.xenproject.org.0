Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0765D6453E6
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 07:18:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455853.713505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2nlR-0002dj-Nn; Wed, 07 Dec 2022 06:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455853.713505; Wed, 07 Dec 2022 06:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2nlR-0002Zz-Jc; Wed, 07 Dec 2022 06:18:41 +0000
Received: by outflank-mailman (input) for mailman id 455853;
 Wed, 07 Dec 2022 06:18:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FP08=4F=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p2nlP-0001rE-Vb
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 06:18:40 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e88::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc63c4cc-75f6-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 07:18:39 +0100 (CET)
Received: from DS7PR03CA0146.namprd03.prod.outlook.com (2603:10b6:5:3b4::31)
 by MW4PR12MB6924.namprd12.prod.outlook.com (2603:10b6:303:207::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 06:18:30 +0000
Received: from DS1PEPF0000E653.namprd02.prod.outlook.com
 (2603:10b6:5:3b4:cafe::f8) by DS7PR03CA0146.outlook.office365.com
 (2603:10b6:5:3b4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 06:18:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E653.mail.protection.outlook.com (10.167.18.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Wed, 7 Dec 2022 06:18:28 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 00:18:28 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 00:18:27 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Dec 2022 00:18:27 -0600
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
X-Inumbo-ID: fc63c4cc-75f6-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzyVu5um2w5rSj+rvsgptU6As5+M7Tzp/dIcujowhLL8k17tzNCZ42D9oyja8PLzP1u69wMlfAmXXmYx1hzrjLF8xIdiA+xYI64kBz59CB7DG5o+VKgKSzacLivwPJM61vrrhJGmqjGXDZMme4Q3+uxYm/FED+NELi5+MniGL+ZWUjOIcpmwRIn2cjhOPBJTPqlrRbI3Fe5sjCAz+F5uqxv7AVjvsUYhYKbkJujJmx1dN3q54gf6TNx05zmcUWfuTzL51PL36tWuRhD7tq5Z9GkQz14rHJYPvPMD5vgAKZ+2N8jkJHbfpHP6ch7yuEQpvh5RxokCZqru8oFPxwlJcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LUe0w+LpO5tERWdII/zFZViW4K+Jr8pdOMefoNdmlg=;
 b=JOgLJWRc3AmI2MK9NkKY+TaK9mhNFrQTGJ8DZc6KAgm4nVhB4b96u0EPU/2YiqPmGdOsfVTm0fQRKujUSLBy/TV0PUS3FdHpRDQ48JaZxsH4MVd31c1LvoS1GtyLohkeyaukvDJiLWE4wxD2TMUPnjXrGzWEv+xrvRqB83AbOHu2VjA6sd7nCLEQLexyPzNgHfRjsNoIKLN0RF0Yk10wOABV2tpqrXzh2bgVPuIhGLqcXnCX/y1PkGSyFGsVOY5pl+1ufWmpMN6PAtO4v57qGLg7zxsXXqzIau4wDzNhaRiZjDsJSvejGFdG5xKPP6pSN3bcbQ9AHDjWeJmDKiNx8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LUe0w+LpO5tERWdII/zFZViW4K+Jr8pdOMefoNdmlg=;
 b=UwOPF03jEgllGUo3PbJeO6MaZbzIiyOJX8Xumxpt6HAUYSVLotbVskRIVK7SBu2sCokYjTbqGCRct/CGrS6QI1ltM+6++qSwXJv5QWBc9blseyItuzjSq0KxPgo2JRrOxj9KHxVG7JBv2JMTdgW2AiMpKcI3gtWNvoDEm7h3Th0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <vikram.garhwal@amd.com>,
	<Luca.Fancellu@arm.com>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN][RFC PATCH v4 09/16] xen/iommu: Introduce iommu_remove_dt_device()
Date: Tue, 6 Dec 2022 22:18:08 -0800
Message-ID: <20221207061815.7404-3-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221207061815.7404-1-vikram.garhwal@amd.com>
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E653:EE_|MW4PR12MB6924:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e85081-b8f3-47d8-5bbf-08dad81adb3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZNEtA9ZYKzx7T+6ftIUAC1dkwZ8SZXZbe68Xlz4pfxOp+OFhrRObrIfLDZq4sWcggZUxuYj6e6rtiW0g0sQ/si5BK/uargVusQYwVbwYlcLKR75D1J6XRTlU4KyuYh0PlHmu+5y3qISXFr0e4DmHhO+n+3PBTjGsKdAYE/dNpTrGhvWFk+baDXzEAAmqz9wed3Cmlp5KsGuVZUahGRiuKYCA87WkWjEHATVs9aevnrJNgow0k20v2zzNHp1R6Ztj/XEQaCCvUpWu/cq3obpy0VnBLkYlULTGwDsBeJZsLf6I+CUQcm7Go8T23Nu+z7aCBACeRds/bvp5SQhWy6pGD+5iy7CV1dJ/b4HVr7bVFzDwkpcsua1WsxPKFscOzUvuUp53vdD9Puxfzk1PtM/T8mX3DMILRDNi7dSCqmWTGRx7FqesUt4jjzEc1mJz6mIGfGlyVG5MxF0/UhPNevQdbwbiXbc589IqoZ/fUH7USYaQ9mU5DEEvYOdG5X5Xx9o9VLD/v/T+IVrlhloVuzduXIsyfDghOrDU0PRw+DU9sI/XznoQG75o0eCW4e59Ojv13CMSqPsa5FgFB1X1lNhFe63vjwWY8CIkFS1SF81B7Bi+gdw/j0zOFXi9syGT0wzTPMYCyP7EYet37HFMFCkQ46DZn6CFe2YVRgBiJf1veesUSdSeN4FOiHNyzhgFw6At45Zu3hLFKYf3ojf4knEDpF86IzdHKDV5vS/M+fta1PI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(70206006)(70586007)(478600001)(8676002)(44832011)(81166007)(4326008)(6666004)(82740400003)(2906002)(40460700003)(356005)(316002)(54906003)(6916009)(36756003)(40480700001)(86362001)(83380400001)(47076005)(426003)(1076003)(8936002)(5660300002)(2616005)(336012)(186003)(41300700001)(26005)(36860700001)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 06:18:28.4455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e85081-b8f3-47d8-5bbf-08dad81adb3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E653.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6924

Remove master device from the IOMMU.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 xen/drivers/passthrough/device_tree.c | 38 +++++++++++++++++++++++++++
 xen/include/xen/iommu.h               |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 457df333a0..a8ba0b0d17 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -126,6 +126,44 @@ int iommu_release_dt_devices(struct domain *d)
     return 0;
 }
 
+int iommu_remove_dt_device(struct dt_device_node *np)
+{
+    const struct iommu_ops *ops = iommu_get_ops();
+    struct device *dev = dt_to_dev(np);
+    int rc;
+
+    if ( !ops )
+        return -EOPNOTSUPP;
+
+    spin_lock(&dtdevs_lock);
+
+    if ( iommu_dt_device_is_assigned_locked(np) ) {
+        rc = -EBUSY;
+        goto fail;
+    }
+
+    /*
+     * The driver which supports generic IOMMU DT bindings must have
+     * these callback implemented.
+     */
+    if ( !ops->remove_device ) {
+        rc = -EOPNOTSUPP;
+        goto fail;
+    }
+
+    /*
+     * Remove master device from the IOMMU if latter is present and available.
+     */
+    rc = ops->remove_device(0, dev);
+
+    if ( rc == 0 )
+        iommu_fwspec_free(dev);
+
+fail:
+    spin_unlock(&dtdevs_lock);
+    return rc;
+}
+
 int iommu_add_dt_device(struct dt_device_node *np)
 {
     const struct iommu_ops *ops = iommu_get_ops();
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 4f22fc1bed..1b36c0419d 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -225,6 +225,8 @@ int iommu_release_dt_devices(struct domain *d);
  */
 int iommu_add_dt_device(struct dt_device_node *np);
 
+int iommu_remove_dt_device(struct dt_device_node *np);
+
 int iommu_do_dt_domctl(struct xen_domctl *, struct domain *,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
 
-- 
2.17.1



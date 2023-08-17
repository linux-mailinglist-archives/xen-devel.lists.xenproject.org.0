Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9824477EE63
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 02:40:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584985.915927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWR3b-0002ck-RF; Thu, 17 Aug 2023 00:40:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584985.915927; Thu, 17 Aug 2023 00:40:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWR3b-0002ZP-O4; Thu, 17 Aug 2023 00:40:11 +0000
Received: by outflank-mailman (input) for mailman id 584985;
 Thu, 17 Aug 2023 00:40:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IvtK=EC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qWR3Z-0002YP-Qy
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 00:40:09 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d39ac63-3c96-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 02:40:08 +0200 (CEST)
Received: from CY8PR12CA0032.namprd12.prod.outlook.com (2603:10b6:930:49::23)
 by DM4PR12MB6064.namprd12.prod.outlook.com (2603:10b6:8:af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Thu, 17 Aug
 2023 00:40:04 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:930:49:cafe::9d) by CY8PR12CA0032.outlook.office365.com
 (2603:10b6:930:49::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Thu, 17 Aug 2023 00:40:03 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.80) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Thu, 17 Aug 2023 00:40:03 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 19:40:02 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 19:40:02 -0500
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
X-Inumbo-ID: 9d39ac63-3c96-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6OPvYaVjUlHMn+GZEX3Iei4gYKFoXzi02+bDj4TDStNneoavNHrEjNn/EyOcbQAOmo0wuMiSOQTdT++kas3I1e7d/w+RqV7EXRjbCAR4gTbTgmv5Fn6GCKVsX8YDzf4Uu1w3M0cb4nWuzACBVpPcJZfu3MxjWJF69YeyZSkfXqhrhPI1VyCLqHkqyVFb9jtQmT9m5l7rU0MFhW/qvyrrzI7WwY9SwsJapS0UqCIaAdVgmYNfxSCfm/WODpk9aDLX7oQ5FMzuaCpaU/hI3aJILSG4w9VQhUpr7KwvF9g2isaZt7bAEDnr//PzmySXtjbwvGLiuH1lOm+3+7DoqGCKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnAkiyK51E8/9hbpYvNOl4Id3yZ+E95/wfBvKWMf7tM=;
 b=c/GWQZSVwjrUABqCorwLgvNh1Zd2MhHcfeW2yX9mK4Guor2D6UH5ylt8lql1jntXjKP4dCSQDSjVHq2CEr2jWqEYt6/qs2eGYS+FU6Yo1CyAYTrhKAKq0SKC6fnAuRzB6iaSWAbae6nb2yLiUB2F5ZLrJzbpB7zFArJHJijhnX58KkWEtXmuNlBSLPziZZR4frdWdsx6yjwg2UY2kX3890IYZiHx6SV//4XuyjSkdUddyVGxxaBIN6VSYYUWVOXjNCBXsrYF1q4q00T4Ir7zPY+YsTJHYSbciMA/42+zWdff+Im8bnDFsDqM575Bukje/zZn1t97hjS35Bh1Sduh5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnAkiyK51E8/9hbpYvNOl4Id3yZ+E95/wfBvKWMf7tM=;
 b=Euo3ehfi8tuIew08vfTp5Y2cbUd4saxlGJJzCR9I1H4E+b/db0iF3J2C6yEQFZsYA/TRmns4Ekg9OgqcugqgGxtRqDMaBcsilmr4aW8pqYYpFdfxSx62La9s3SwOtCUoNf+aFxeersNyMsi1NoOowUCD57H3KBhndj5h5VGMtVk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, Julien Grall <julien@xen.org>
Subject: [XEN][PATCH v8 01/19] common/device_tree: handle memory allocation failure in __unflatten_device_tree()
Date: Wed, 16 Aug 2023 17:39:29 -0700
Message-ID: <20230817003947.3849-2-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817003947.3849-1-vikram.garhwal@amd.com>
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|DM4PR12MB6064:EE_
X-MS-Office365-Filtering-Correlation-Id: 82c6b25e-8d2e-4114-6089-08db9eba7ef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y8uTqncCMMjb2a2oi/Epjvcc3PW+Qeem3wiE2p5bssEbbHM8apxzbveUPmJ5oFhSFzvVWf4WoPhoMMPcbSzEqF+lpnzq0YCsPgzDRnz9SCgyi9pPjUD7ec51RbMyfvzRxSfBCAU/j31P1xzAAsyLfqMeXYNqEL9OzmKNBnIah67yXh1EG4pgYBiJXVPFQuUufbtTGYeJLQ1npzniyKiDtht7MX0miazfE6FJCjLLH3X5kBJ3Y7b+Wyh2/HhhAvERobmVBCcZewTkhobjdmkwPn2SbQ0HqVegR71opGnrWNmmJ76Pcv5IXFUFGwiKDPjMIdirXpehekxp7j662FhZ7RrisDnbrfhtGYS7ttYF2HaGU6RM1rk9PRetwCbGEBobq6BczXl0RDPE10it8fhRGu2IoMJdEBkKtvuYZ7viiMGOVzUZtazlHcDojUbMiug1Rt5Sz1WcRX+v9tBedQzdyGd1yeb3LSo8zKamlD8BZ7ts98/YPnI2XPeY5y3aMlVlum0/HMwE/twwE0m4URiJ+IA7TDVnBrXiWpD18iC8nu+7Lb26z7o32lCs7KLS6eLPqgK2D4gElegA7eIruoXtEIt14Qpyz8ka+k6Y4dr32S1hq9GC6+xQVB6vwdqGVvbOEmqzHGE5N+MQQvz2Eh/Gr3kgzycu/toauhhpDDkBP//PMLxz9d/T+yo9o4yPPwRN0Edy6MPW6HfI3IxuDwLTjcLBsR+NEljGKRTURWPmKs/oaeK6sXTNr3WRfyfsylYHVcmVY6lHH8Ipjp6FDP+/zA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199024)(1800799009)(186009)(82310400011)(36840700001)(46966006)(40470700004)(316002)(54906003)(356005)(82740400003)(6916009)(81166007)(70586007)(70206006)(5660300002)(41300700001)(36860700001)(44832011)(47076005)(4326008)(8936002)(8676002)(26005)(2906002)(40460700003)(83380400001)(40480700001)(426003)(336012)(478600001)(86362001)(36756003)(6666004)(1076003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 00:40:03.3275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c6b25e-8d2e-4114-6089-08db9eba7ef8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6064

Change __unflatten_device_tree() return type to integer so it can propagate
memory allocation failure. Add panic() in dt_unflatten_host_device_tree() for
memory allocation failure during boot.

Fixes: fb97eb614acf ("xen/arm: Create a hierarchical device tree")
Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
 xen/common/device_tree.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 0522fdf976..c91d54c493 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2092,8 +2092,8 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
  * @fdt: The fdt to expand
  * @mynodes: The device_node tree created by the call
  */
-static void __init __unflatten_device_tree(const void *fdt,
-                                           struct dt_device_node **mynodes)
+static int __init __unflatten_device_tree(const void *fdt,
+                                          struct dt_device_node **mynodes)
 {
     unsigned long start, mem, size;
     struct dt_device_node **allnextp = mynodes;
@@ -2114,6 +2114,8 @@ static void __init __unflatten_device_tree(const void *fdt,
 
     /* Allocate memory for the expanded device tree */
     mem = (unsigned long)_xmalloc (size + 4, __alignof__(struct dt_device_node));
+    if ( !mem )
+        return -ENOMEM;
 
     ((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeefU);
 
@@ -2131,6 +2133,8 @@ static void __init __unflatten_device_tree(const void *fdt,
     *allnextp = NULL;
 
     dt_dprintk(" <- unflatten_device_tree()\n");
+
+    return 0;
 }
 
 static void dt_alias_add(struct dt_alias_prop *ap,
@@ -2215,7 +2219,11 @@ dt_find_interrupt_controller(const struct dt_device_match *matches)
 
 void __init dt_unflatten_host_device_tree(void)
 {
-    __unflatten_device_tree(device_tree_flattened, &dt_host);
+    int error = __unflatten_device_tree(device_tree_flattened, &dt_host);
+
+    if ( error )
+        panic("__unflatten_device_tree failed with error %d\n", error);
+
     dt_alias_scan();
 }
 
-- 
2.17.1



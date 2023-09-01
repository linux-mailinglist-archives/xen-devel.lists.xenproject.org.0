Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EADA878F7C0
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 07:00:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594214.927468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwGR-00039n-6x; Fri, 01 Sep 2023 05:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594214.927468; Fri, 01 Sep 2023 05:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwGR-00037y-2p; Fri, 01 Sep 2023 05:00:11 +0000
Received: by outflank-mailman (input) for mailman id 594214;
 Fri, 01 Sep 2023 05:00:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvPm=ER=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qbwGQ-0001Hn-08
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 05:00:10 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e88::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c09cb3d-4884-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 07:00:08 +0200 (CEST)
Received: from DM6PR11CA0016.namprd11.prod.outlook.com (2603:10b6:5:190::29)
 by IA1PR12MB6164.namprd12.prod.outlook.com (2603:10b6:208:3e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Fri, 1 Sep
 2023 05:00:04 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:5:190:cafe::24) by DM6PR11CA0016.outlook.office365.com
 (2603:10b6:5:190::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22 via Frontend
 Transport; Fri, 1 Sep 2023 05:00:04 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Fri, 1 Sep 2023 05:00:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Sep
 2023 00:00:03 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 1 Sep 2023 00:00:03 -0500
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
X-Inumbo-ID: 6c09cb3d-4884-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KZ7eUmJhLV9Zxs35H71ghReW7zKM3PMZaGQ31dBlYxhotVP1SyBSNUem9/8zuUD8F4MJERvT+kl01V13ue00j7pc7Ubo6I54Syis0rS5IxfA0nMothl9rOvB6wxQkV4sWT09yvEsCh9hdtzEQzlwFEC+KMP308xsqGd7BJuCu8pw3JjgX+wTIRciQ2bHl1eO7I139vzNLRHQ4qYMsHmmkLwIb0CaY0QGZWOquEO6YjgD8HI6feZeIGVb076jdspCUtqpqMtgh2LQoMqzc/L3yAqmJs0MwAatrCQmb2RevYRWc7kXbmsrn2I3j8SaJZdRqob+1nNsecCT0ZXyN85YNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=551FbITUy/lX+UFAVwLYLGK11TzVaHOhuLFDvzMcrP0=;
 b=IjMnoH0+FMUUzhk2mcdrZBwuWupsgFYFUg7o/9fDrH5plLQOy5hauhMPcq7QfB5s7vVoIt6m4J583jcwki5Uo2UHPr2SsW4yG3tP9fj4tu0sAX1YP3F3OUB/MDYSZSJAZDE3x9E7rCfcp8Oitu1Kp1Ipj55iOUnIceEO/gSkA0fyZLfJ1S21fXa3lp8LeDra68G5Jc4vGEIn6uQOVsjoSjMRceLGvGitRcosbVuuUXsVUpkWlneFksngJ0Qr0YIArVBhcQPk0o/Flc4lR6hlzrMZn0KZPdjo5mtM0a+omURe7rHx42f5VRSccAm6AjYZ4iwasetHOj618CflUFcfOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=551FbITUy/lX+UFAVwLYLGK11TzVaHOhuLFDvzMcrP0=;
 b=HXhYuYW9DFa/TIK6N1FgUZywh1VekL1ZiaI3OcxISmueGGFHBXS97LtMhP40tY4uGgxVmUy0SgkUqaeUvGGTVB4sAZL1U1crXQPtOkdjRMHZtCWkVrSMXl/Lk+41lBlfFnhGCVuYyaFN7oHgr71GJ+Yh19aWs3jk5cAaHqAE9CA=
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
Subject: [XEN][PATCH v11 01/20] common/device_tree: handle memory allocation failure in __unflatten_device_tree()
Date: Thu, 31 Aug 2023 21:59:28 -0700
Message-ID: <20230901045947.32351-2-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230901045947.32351-1-vikram.garhwal@amd.com>
References: <20230901045947.32351-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|IA1PR12MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: 737e6e59-95ad-4346-96f3-08dbaaa84e05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2SHxBrHydjnE4JcjMZxmv8H2Os82vmIaRa7cYQNKuR297uZ/BhnoCbM+Zzxu0mG6l8K0hATRPQFtPHqx6s2rHZKgisTU+tGmxYpvZlc4xRuGf0tjvEfUPuue80AWKJA82hPIC/bRHJckbNLIzsObxFoWvd6c0SfD5ErTZC8mY2DHZGmtwvX4PcahRWB2b+M4cuedShlttyxI9APhJXIRe3KzWifr7olg95PXxL7S4EQ0lchAQZ7ANZUbj4ww75uD4zmGRCpt00xM+3POlD2kXTRg8pNxql0dsN3B7KzsUVzSS8/9KRFpdWh6BzmzC6AwwKMRFJLakQJnXJYrYTnjeO9siOgv0epCNSbTxeWntbt0JLNrbWyVMYPVcsjQDUzpYZzoyMw4RgkQmociArChtqIfqwBElm9SAhHWYeg1f5NJyWWIuqIngr0x3HnlUD+UMLOasBFQGRYXHUziWpXhIRNq+Wuwd/3qnVEYpr3f50zn1mPGw2UtvAM1tDdKnsJSOfFANcN1X55FCgrwDKPOFmEOTfDq2VGXevKh0L+I/f4PMIbluRhqh2k5Jh2pYGxwiTFTrQvTr9Xytst7jvwqQIZmmCBEzaLX6f3knWCkOoteWhyGlg4MjUfQQVIjUV8WEkaKVb/fY8wEsEClVzmgF/hBN+LKBNSm68eV33evg7JSmM4XvjSnFGHjtXaPVVD/7FeEQYnm6b4CrjP3kLV/y4qNJnkYRwCMeHRfRVhdqbHSqoBi3YwPuy7tOWLtiUH/60hkw5hfBZMJ8r37ZfVTZA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199024)(82310400011)(1800799009)(186009)(40470700004)(36840700001)(46966006)(82740400003)(426003)(356005)(478600001)(1076003)(26005)(336012)(36756003)(81166007)(70586007)(70206006)(47076005)(36860700001)(41300700001)(6666004)(83380400001)(2616005)(54906003)(6916009)(316002)(44832011)(5660300002)(40460700003)(4326008)(8676002)(8936002)(86362001)(40480700001)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 05:00:04.2180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 737e6e59-95ad-4346-96f3-08dbaaa84e05
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6164

Change __unflatten_device_tree() return type to integer so it can propagate
memory allocation failure. Add panic() in dt_unflatten_host_device_tree() for
memory allocation failure during boot.

Fixes: fb97eb614acf ("xen/arm: Create a hierarchical device tree")
Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---
Changes from v9:
    Update comment regarding return value of unflatten_device_tree().
---
---
 xen/common/device_tree.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 0522fdf976..7c6b41c3b4 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2091,9 +2091,11 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
  * can be used.
  * @fdt: The fdt to expand
  * @mynodes: The device_node tree created by the call
+ *
+ * Returns 0 on success and a negative number on error
  */
-static void __init __unflatten_device_tree(const void *fdt,
-                                           struct dt_device_node **mynodes)
+static int __init __unflatten_device_tree(const void *fdt,
+                                          struct dt_device_node **mynodes)
 {
     unsigned long start, mem, size;
     struct dt_device_node **allnextp = mynodes;
@@ -2114,6 +2116,8 @@ static void __init __unflatten_device_tree(const void *fdt,
 
     /* Allocate memory for the expanded device tree */
     mem = (unsigned long)_xmalloc (size + 4, __alignof__(struct dt_device_node));
+    if ( !mem )
+        return -ENOMEM;
 
     ((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeefU);
 
@@ -2131,6 +2135,8 @@ static void __init __unflatten_device_tree(const void *fdt,
     *allnextp = NULL;
 
     dt_dprintk(" <- unflatten_device_tree()\n");
+
+    return 0;
 }
 
 static void dt_alias_add(struct dt_alias_prop *ap,
@@ -2215,7 +2221,11 @@ dt_find_interrupt_controller(const struct dt_device_match *matches)
 
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



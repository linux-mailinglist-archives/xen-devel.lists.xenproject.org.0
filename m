Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 484DA781608
	for <lists+xen-devel@lfdr.de>; Sat, 19 Aug 2023 02:29:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586690.917937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9q4-0001lf-98; Sat, 19 Aug 2023 00:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586690.917937; Sat, 19 Aug 2023 00:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9q4-0001iA-4K; Sat, 19 Aug 2023 00:29:12 +0000
Received: by outflank-mailman (input) for mailman id 586690;
 Sat, 19 Aug 2023 00:29:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eu5+=EE=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qX9q2-0001hl-Vv
 for xen-devel@lists.xenproject.org; Sat, 19 Aug 2023 00:29:10 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e83::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6871bd8b-3e27-11ee-9b0c-b553b5be7939;
 Sat, 19 Aug 2023 02:29:08 +0200 (CEST)
Received: from DS7PR03CA0210.namprd03.prod.outlook.com (2603:10b6:5:3b6::35)
 by CYYPR12MB8924.namprd12.prod.outlook.com (2603:10b6:930:bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Sat, 19 Aug
 2023 00:29:05 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:5:3b6:cafe::91) by DS7PR03CA0210.outlook.office365.com
 (2603:10b6:5:3b6::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Sat, 19 Aug 2023 00:29:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.207) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Sat, 19 Aug 2023 00:29:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 19:29:03 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 18 Aug 2023 19:29:03 -0500
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
X-Inumbo-ID: 6871bd8b-3e27-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqmgXLga2Qwq5Cp69wReUk5ulf3ZGqgVQEN78eJyuQnA3nJS7qXxF1S4veBLCmiulAdQibZGpCpK6sAiLzi3UTqaqCCcEd4NPIFEG7aJzG45coeMuF+amv+0q3Kp9FStce4K3CYNAPJcKh2mL5gaXDp2XyeIFTAAFgJC0wG+8LERFwHKgHb+rf8Yct/TLKXIEIqe/56VSMs4MPn1LrVKLFPuQr/N0v/HNCqg5DPQrLOD0Tfv6FnCBmePOyW07tUDoZCXfuc68uvTTf53h1CqD0WUP907TZm8eqKPORAmTHIGNyfgiBe8mWFfzKVY/UnFDJSL4Y1zK2ocBkaW1mpppw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnAkiyK51E8/9hbpYvNOl4Id3yZ+E95/wfBvKWMf7tM=;
 b=k5C0M9u1I6g35Ld5hU59dLJZ6UNLv1+Sq59bQte8aJlJwAuVU6/WE0yW38pPLbi0D6LMyNColBzFfrQyEnyb1iD7BW9o7xFv9C6Jaq+/xhkm7+fK3ufESPgI2fZRsXaK31k2KYBMFbDIupwLLBc/3J5TZA0T7pp9qBcOzlNktUUWR54s91Pb6mgqoz0EePdqjndlLHx+OhryI6jgx9DxjqsqbyK39gJdFt9Dt5r9ih3KtKBKsFumfoDJMbtj/1wdKiEIgGvoMhIb7MVwPOdOb4sxPqvRN7JUMJj4fkzkRx34nf8H35NBl21eZ4SywcEkkL5gAQO12ikDBIG9GX21JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnAkiyK51E8/9hbpYvNOl4Id3yZ+E95/wfBvKWMf7tM=;
 b=aWxmEGmS7/31zUTyh52F/XGFBRlbWZk0GzwTFM3gzNFldYj3lyJkemWepEItlbemdi0jXXdBkGAJfYsbOKmeXo5q5hmGLnENlQNLtGSpnPgFNiwQ1/6ET1ulzzD9BLikvZqHcUHCEZdtVmtjIDW2i/l3eX/vdYuXrpqvDNww+ek=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Subject: [XEN][PATCH v9 01/19] common/device_tree: handle memory allocation failure in __unflatten_device_tree()
Date: Fri, 18 Aug 2023 17:28:32 -0700
Message-ID: <20230819002850.32349-2-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230819002850.32349-1-vikram.garhwal@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|CYYPR12MB8924:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c5cf87-aa63-4580-548d-08dba04b4ae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZAQl0jlfYu4Gxs08r3+uNfTHzBE3pOdpSXHMK0SfuqSxswHz4mLIDTXggqjGhhGV9L2LXGxbaJgJx6kSPtrzT4DdACySDQwE8m38fiA+8QHLDvurCcGAHpxgfmm293qoaJIA+zJYzat+7eS62d74v4hMsdrf7899D6cEncSEmLHl/emR3Gv9QQffF6oj7goD8k1xgyv7RBMLPfgyHTQbPHQZ0iAZ8OmbVzAY4J4aMwCgNC4We3YYLEryfTwcuJXHNvmpEXcXbGspr7o7gyrDLxMSRy+6t2Ej+JMI1uIALF0rnuGHO8AIWfoctIVQs2nW+d3Smwg5EgZZLfVd7H1Hcl5TcTYpuAVlwu1McSo8mo8VJqkvEb7qURKPJp2qa/MQTwXxLSpeSYCfew1mn9iFitBtm1oNseM1VUDhLxF8psncRo3Bh4f18UQX1bGLcQWQdsKhnis30VfChNZBJNYLz8u743a+XlEOOgDlOKvS/UiGztg3IQH2bujn3EeWmi+Bc79QlJ41qQTJQeyyZdJSJBTjijZbHjCrxoWMkmTqv/JwSuT/CagYLbZJZ8GMRUMVhg/FuxhbaLXe7+ntAFe/OfFKVMOIA/hHXxz52eTt4v4dSdXiMB61gOmzMqRPvPw9QDoDvcojUvjHg1UCS4ZyNWKnebQ7lQZYai6M4JIyU5wPdWRyxDbmIjRcWz/8MCjIAmcpJmEnHWaauGC8Jedyb/Qcx5ZkSHBIrHg/ENUuA7R5XXeRcr1YTTMtPDDHTsj3mkH9vGQ7zoP2mFKAk6QldQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(1800799009)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(6666004)(40460700003)(36860700001)(426003)(336012)(40480700001)(1076003)(83380400001)(36756003)(47076005)(81166007)(356005)(82740400003)(26005)(2616005)(316002)(2906002)(6916009)(54906003)(41300700001)(70206006)(70586007)(86362001)(5660300002)(44832011)(8676002)(8936002)(4326008)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2023 00:29:04.1170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c5cf87-aa63-4580-548d-08dba04b4ae0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8924

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



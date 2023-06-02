Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A15C71F749
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 02:49:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542791.847100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syR-0001a4-Dr; Fri, 02 Jun 2023 00:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542791.847100; Fri, 02 Jun 2023 00:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syR-0001Nm-2U; Fri, 02 Jun 2023 00:48:59 +0000
Received: by outflank-mailman (input) for mailman id 542791;
 Fri, 02 Jun 2023 00:48:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQ40=BW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q4syO-00018B-Pq
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 00:48:56 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e421de4-00df-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 02:48:53 +0200 (CEST)
Received: from DS7PR07CA0008.namprd07.prod.outlook.com (2603:10b6:5:3af::21)
 by DM6PR12MB4861.namprd12.prod.outlook.com (2603:10b6:5:1bd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Fri, 2 Jun
 2023 00:48:47 +0000
Received: from DM6NAM11FT089.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::e8) by DS7PR07CA0008.outlook.office365.com
 (2603:10b6:5:3af::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Fri, 2 Jun 2023 00:48:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT089.mail.protection.outlook.com (10.13.173.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.24 via Frontend Transport; Fri, 2 Jun 2023 00:48:46 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 19:48:46 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 17:48:45 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Jun 2023 19:48:45 -0500
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
X-Inumbo-ID: 3e421de4-00df-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmNZcbMqkH/CWS7pVUpCKUcF3m+Kgx3L3ZW+5Fqyiv2DrlDTfpwHPOkvixRzSfgADWqbpL+GaIlrI79Drkjx6aZVg8PYFJClR6JgDXHPSMDeDLizOj0zf5Sm+6vXTXMYNjxn2DBaTmPN0Z6XfKGFjvCftd53hmD0k7CbbAI7VvaTwrsvRJdgzkggTQQqrvKUtQwb/OnjfHjslu1Ky/0CGE25UcYSf6dU2Z/NtvhmtEqxOjMS0VdAHHLwZhL3I8IY29cQNZHhJdplQC9vtOeWKFZzXMhYgzB+wOShF8CpaNhir/RNaU1YVNd9pEDQx2UWUJ5Q7U8ZTpLnIODAJ8PylA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQpG5gl8tjfgQA0nY9ZK0fMXg1D/2bl66ZjFs1Y7jAg=;
 b=oU1oT1hMDMGW2m3OhQevwgtA3gFKvtsABteio/dWRBnSKR4x2QYsNmKYZaHvwDgUyIvVPFoqzvoyLfsSg48U0VQ74NvMGwEH04J3RmiPTslSvxwcoYaLLN8z1EwXsROnQEOT177m6V1yT0Nbx3+Y0aiO1/9yOSg4bnDnVvx8QqVJbd8kU3vgAFwJsb4l1GbRiA7UQwesapHsUsrMY2NLd9fViZVCeR2dJTfOdPlwxtcAX7z1WSYD9l0bUwMwZPLCZSwqmIaDyJieWY0DNy2vrNbDydMBZJLDBQONYE6K4SRwlaVSwtpEBMXp23PV5y7iQzP4yoh52ABeN/ryKusuJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQpG5gl8tjfgQA0nY9ZK0fMXg1D/2bl66ZjFs1Y7jAg=;
 b=mphWWZLOegKaL+lfl3uUFuLCgZB5TsT1zHsnh9Tbb7DvUo9QqXVtntQl7+c3DiZmzB9VLXmqKxNlLkAF4zY4SEoV2ZpoklhrONrzbW/yeJQezo4t0ZzCRPZ+ikvFEPsjGWWCLT95QpYao7VRasy+VI3RW3rooL2NWIBd9AsrUD4=
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
Subject: [XEN][PATCH v7 02/19] common/device_tree.c: unflatten_device_tree() propagate errors
Date: Thu, 1 Jun 2023 17:48:07 -0700
Message-ID: <20230602004824.20731-3-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602004824.20731-1-vikram.garhwal@amd.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT089:EE_|DM6PR12MB4861:EE_
X-MS-Office365-Filtering-Correlation-Id: 2536a6fc-905d-4c67-2595-08db63031f86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l0kEec3x1PBIRSkp6AIwnBj5sR377grKmkNuMDHsyyOUoNtt/x2Mu2B1lFiww80KkfpMmryFMPM4cwVoMH52iI50vPJJQ0xcpiJZVYqF4/a0eu9k3CL3yWnxn+F5+PXckjSvNj0jFcACxBxpFS7bgmA1kMxFNXhXwQ1XuF5MgWk8xEmR/rw2YGKy2tvTmapmDuIzPPG4gFL3SCyWnDbcokdUnJChM7yL3LozEdIsiYrtjUgGrqdmO/tCXm101AlhfUNZ2lfK68bdPvZmzcFPDDY2IBntmsCl6QRIqBmMtFnco32QLdsY4UtH9JOqjTilVMu5NHb/LGBKoodHkUCQp1N2wRNWZHxJSQtVIzAKIy53IBvp0MWmzes3UrV1sy5+EdjKq0taY6MwfCJgDZ4oRNZmTXWWQcn3htHLAOg+EfSDLeY4J0QsYDlqdtkIJOt/kE+HudgWw1Y9XOHjeOhEMM7vkXFJfD5MFO5C8ZFSanZkKoYgu9L+7ZqWDLk06Kjr9KNm6FTtX3PAeFneiWXoT1WjDNLuHqaAjrIK3ZUZUYnWS0O5+S5RnM59+Jsr34Lq8/zqkmsMXNnGTsNyCMtBG1y7j8I6HLFg55MXZy1Vo35j2eFSbl4h0IG46TPvIgZxNkwfmmxYyVZkdMf/Z+VCz+UgH8DpvHCcdizuTtvyKWcdp3e6i/y2j4RBcuTT0l9ctbSlSYmIcJYE6o82ZIYBvLYx9BWtKOrK4gJziDLVG+g0gEPN1s0lk+WiCytMXfu+etwf5CuRwOwOQDw6ak7tCQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199021)(40470700004)(36840700001)(46966006)(186003)(40480700001)(6666004)(40460700003)(26005)(1076003)(316002)(478600001)(70206006)(70586007)(4326008)(6916009)(82310400005)(86362001)(8676002)(8936002)(82740400003)(5660300002)(356005)(41300700001)(81166007)(44832011)(47076005)(2906002)(36756003)(54906003)(36860700001)(426003)(2616005)(336012)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 00:48:46.7212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2536a6fc-905d-4c67-2595-08db63031f86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT089.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4861

This will be useful in dynamic node programming when new dt nodes are unflattend
during runtime. Invalid device tree node related errors should be propagated
back to the caller.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
---
 xen/common/device_tree.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index dfdb10e488..117ccccb09 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2108,6 +2108,9 @@ static int __init __unflatten_device_tree(const void *fdt,
     /* First pass, scan for size */
     start = ((unsigned long)fdt) + fdt_off_dt_struct(fdt);
     size = unflatten_dt_node(fdt, 0, &start, NULL, NULL, 0);
+    if ( !size )
+        return -EINVAL;
+
     size = (size | 3) + 1;
 
     dt_dprintk("  size is %#lx allocating...\n", size);
@@ -2125,11 +2128,19 @@ static int __init __unflatten_device_tree(const void *fdt,
     start = ((unsigned long)fdt) + fdt_off_dt_struct(fdt);
     unflatten_dt_node(fdt, mem, &start, NULL, &allnextp, 0);
     if ( be32_to_cpup((__be32 *)start) != FDT_END )
-        printk(XENLOG_WARNING "Weird tag at end of tree: %08x\n",
+    {
+        printk(XENLOG_ERR "Weird tag at end of tree: %08x\n",
                   *((u32 *)start));
+        return -EINVAL;
+    }
+
     if ( be32_to_cpu(((__be32 *)mem)[size / 4]) != 0xdeadbeef )
-        printk(XENLOG_WARNING "End of tree marker overwritten: %08x\n",
+    {
+        printk(XENLOG_ERR "End of tree marker overwritten: %08x\n",
                   be32_to_cpu(((__be32 *)mem)[size / 4]));
+        return -EINVAL;
+    }
+
     *allnextp = NULL;
 
     dt_dprintk(" <- unflatten_device_tree()\n");
-- 
2.17.1



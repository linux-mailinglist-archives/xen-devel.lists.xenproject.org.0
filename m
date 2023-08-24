Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC497786B20
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 11:07:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589841.921886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ6In-0001w0-JU; Thu, 24 Aug 2023 09:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589841.921886; Thu, 24 Aug 2023 09:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ6In-0001t7-GV; Thu, 24 Aug 2023 09:06:53 +0000
Received: by outflank-mailman (input) for mailman id 589841;
 Thu, 24 Aug 2023 09:06:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6NC+=EJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qZ6Il-0001t1-Ea
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 09:06:51 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ddf0c26-425d-11ee-9b0c-b553b5be7939;
 Thu, 24 Aug 2023 11:06:48 +0200 (CEST)
Received: from SA1P222CA0177.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::25)
 by IA1PR12MB6651.namprd12.prod.outlook.com (2603:10b6:208:3a0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Thu, 24 Aug
 2023 09:06:45 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:3c4:cafe::e2) by SA1P222CA0177.outlook.office365.com
 (2603:10b6:806:3c4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27 via Frontend
 Transport; Thu, 24 Aug 2023 09:06:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Thu, 24 Aug 2023 09:06:44 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 24 Aug
 2023 04:06:44 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 24 Aug
 2023 04:06:43 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Thu, 24 Aug 2023 04:06:42 -0500
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
X-Inumbo-ID: 8ddf0c26-425d-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGeFD8Dle0NQkTNQxFoVh3VEY+g00ZyYujpzyOTC6azSDDO7XkkpOwhTGYnE/Nw74WhlVRXWrHlpDU8ydAiZX579T3/6GfwHrl8EUUm6NXP1yja2O7B1UyQplvJj7qPAkEiXMEx3JUMQzUDU4gBmvkL1pLSRuD+brQoitxzQQT7rcIJQuVLzRrFcVszWN2ic9WdpZbhpRasGJEByACsb/INQ3Xr2uw3jCybYExuNqq0pGdp5PE8VffOQnOmCD3x+EENB6f0dryp6tjYTmK6j3ZwhGEuvtTtH1p0nGrX/Ivv+jVh8GMkbUmd3lq7obgyoDoECuotaIn+oE7xdlxE4hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5oa2P7g2Yo5D+ZwtVfauh4e9cq1iHtWwSzAl2ftEMU0=;
 b=glr4YJPmxrRfiYakbwtQpcg+S9ZkNYwFw56LThF5JSspNFh9zo7c8MHHjLum0Iuf4gYMcs6E3GFqJJSXxr4uSPc0QhtP5fA7JdOuJ3mcQHzdvr/62loWd/Yy0fyzFxUhnDzb+eaTBzzCDaLUBHfz61ox6+rveWWsX1NiaNjUIxenmF8bqXjbPlAOjHFYICFUqTCGdAPscPdVcpI4Z4GVZhd2wWhJIGRRRSduFJbjaUMaYGhDPLAoA7co9bcpwgHHDoBHCJ0ntim4YTJeh2mBnmnD0Y+fou35lTOIU+ExUqffMZkiYD4g33yvPsWTh3+/a/SaZJk60CIQZpLJRHMNhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oa2P7g2Yo5D+ZwtVfauh4e9cq1iHtWwSzAl2ftEMU0=;
 b=p5eulpypI7B6SZnvLvd5Kwg5Bh5go9XOOblc6lLr+yiAsiUW1ZBUj2qkLqqO+9enjkO8toSIlo3ht/ig47niwKylsWDSd3oZvreTqWiJSoZOq31zGmGB8imMx9HxElgY1rLvpzRZuMAC/ksB5bcmrYcdfhJEcghoKQvpAsaSusU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Handle empty grant table region in find_unallocated_memory()
Date: Thu, 24 Aug 2023 11:06:40 +0200
Message-ID: <20230824090640.25338-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|IA1PR12MB6651:EE_
X-MS-Office365-Filtering-Correlation-Id: 902b5b13-5fa8-4051-d358-08dba4817060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Cn+3DcgEi9EGHYgsm5KDo6tq7r8FwquKn7yh4taYNvdSr84Q0uofh4xAsHx/4vdS921QxpAhok90AdWAb4lz2ymIfp+hzoOVB/H9aO6FvlRVy0RHjJyU60q3e292IUHLtpoXPpG6VYeag3G+ZaZBWleoSeFfDtbkZrjoq46mrJnSAIkKrdykVCSv3cZnCP6TJwWLTaes6as3gDPUqXxdJUmMXKaq9x9nt/GvFaS7Vofg8SN/98O4RvypMl+ur7ZJIDE8p2+LD1urIpzdFd3zlm/FD56eTufjjyl7aJrxSGuiMdTjNba1/b9+vafK1Ks0yyvABggKEGIrhn4plngCx8R3mNVCL5i33nJ1DTiOkhXDdqCaGyvSsZ2vI1M6aHApTlVJ48j0xOB44qQARJc8qFrMmaeQ9NzPGgZEXSEqcSW7LcBY0/tIBhzqDDuMZHR3tLHXK4ZTL25rpRVA9wfuiCx6KASJecZJ1FptIDxlM46Qs/+gITxTQzFc4EeJR83rajshBGSd3V7rLcEPyfAm3FU7oyS3ctlxAlQeD0rFvPFYL/nES4P96jGhgraT6/1fvnzfZpeK3S+te1BGY8cfqtsVB9dHIBBXFwbvU4OsQiS9YsWJrsuoPHODM0kHQ29X6i0wCXN/2bMUl2G+0CA+x2WQsMMKOoBILjicwtL23whUp9+QEXKqrTBPv9xoV/plfPyAOmBF+BVdNCEIfjpElS1bVvCR8uKMhnB0djRH+q4nwgkhMCOL4ahdrzJVBHOIu35I6Tn/HdeTdlY6TfA6Lg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199024)(186009)(1800799009)(82310400011)(46966006)(40470700004)(36840700001)(86362001)(40460700003)(36756003)(40480700001)(44832011)(1076003)(5660300002)(26005)(2616005)(426003)(336012)(4326008)(47076005)(8936002)(8676002)(2906002)(83380400001)(478600001)(70586007)(70206006)(316002)(6916009)(54906003)(41300700001)(356005)(81166007)(82740400003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 09:06:44.5562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 902b5b13-5fa8-4051-d358-08dba4817060
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6651

When creating dom0 with grant table support disabled in Xen and no IOMMU,
the following assert is triggered (debug build):
"Assertion 's <= e' failed at common/rangeset.c:189"

This is because find_unallocated_memory() (used to find memory holes
for extended regions) calls rangeset_remove_range() for an empty
grant table region. Fix it by checking if the size of region is not 0.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/domain_build.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 54bf5623c889..2e899458acdf 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1633,14 +1633,18 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
     }
 
     /* Remove grant table region */
-    start = kinfo->gnttab_start;
-    end = kinfo->gnttab_start + kinfo->gnttab_size;
-    res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start), PFN_DOWN(end - 1));
-    if ( res )
+    if ( kinfo->gnttab_size )
     {
-        printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
-               start, end);
-        goto out;
+        start = kinfo->gnttab_start;
+        end = kinfo->gnttab_start + kinfo->gnttab_size;
+        res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
+                                    PFN_DOWN(end - 1));
+        if ( res )
+        {
+            printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
+                   start, end);
+            goto out;
+        }
     }
 
     start = 0;
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD09A55941
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:04:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904065.1311996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJJv-0001CN-Mp; Thu, 06 Mar 2025 22:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904065.1311996; Thu, 06 Mar 2025 22:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJJv-00019j-J5; Thu, 06 Mar 2025 22:03:59 +0000
Received: by outflank-mailman (input) for mailman id 904065;
 Thu, 06 Mar 2025 22:03:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqJJu-0000Ss-7q
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:03:58 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2412::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5ea909f-fad6-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 23:03:57 +0100 (CET)
Received: from BN9PR03CA0148.namprd03.prod.outlook.com (2603:10b6:408:fe::33)
 by SN7PR12MB6744.namprd12.prod.outlook.com (2603:10b6:806:26c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 22:03:52 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:fe:cafe::91) by BN9PR03CA0148.outlook.office365.com
 (2603:10b6:408:fe::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Thu,
 6 Mar 2025 22:03:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8549.1 via Frontend Transport; Thu, 6 Mar 2025 22:03:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:03:51 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 16:03:50 -0600
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
X-Inumbo-ID: e5ea909f-fad6-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mmu++9iWtcrxjaxtS+qalyPjmS9QKKo69Om6ME+4+lC8rNlQeW2VK6bnVSNNfCWO4F4r4mWaWyETH5UfM8vFNQOju3OB++627msih+OASf0xPR9vxoPbSxfPzS92+l3FS5PuRbGyYqjxb0lyQ/rDFwC8kA6JP372ZSfXZl4pFcQItjm4DFcn1gn7ohq/6wo04F3ctvRFJlpD2RHVDnHG3qm1ljqr6K42dZL0Xexc+L80lGdXdSqUHIibUpWl6ynd4SwcOICWeJrxLLUUGDQ7PF4f+i6DfKmuzwxlAwobeC3114QEWOWfF2Y5DSZMwJOEUbAt2280wLzXjCnGjdDUbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VPQcrgtdmm3+GRmy13JpI5He8WqKvpADWE80W2X34I=;
 b=sXPFGvqaMwlbLyb8J6c0+jYvuPVAyzyrn7foChJKVWw7lHtN0+i5SPoKvp4CtPdrdeX3rtnpuZZVVJHJi7Z2VXdy8IVUU/XKWce/4puiaF8f9YLXe1y2w74QchOo7eNlp/Hq3sMqDXk1O/79bJ80q52XB4QsgjhZIaN7ZRLCLknIoKy0NBvLxK3JQAVBdag9ne8aJpkuITy8d4a2JsWQVMFxxMKZSqZ1h1o4lFW/viLcu5hzEXuXCf3y4/wambCMBCp3/XpsU7XiNJiQ7TB6M1uZBZX5Ii4Ss0kV6eYtAQ//verToUPPtOdt5khUBT5oPvSS/z81ulXs9buE3N5sVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VPQcrgtdmm3+GRmy13JpI5He8WqKvpADWE80W2X34I=;
 b=N9A3tQZJSwgyy+X0Z46fHQFsGdTd1w2MJuBEVxBPTPgU3nRwwNYdfvZSyuZoJC8mv4hlgFL60lIN+SCYbtidtEsAZ/A0g+ARlM28V3sy00TfvQ6nQ2Kb/dT1iYvZ1fcn6pPaYc2QZbFtFnf+5GIca351DfDl3sEQSgdSvn3bAnA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 03/23] xen/arm: dom0less hwdom construction
Date: Thu, 6 Mar 2025 17:03:23 -0500
Message-ID: <20250306220343.203047-4-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306220343.203047-1-jason.andryuk@amd.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|SN7PR12MB6744:EE_
X-MS-Office365-Filtering-Correlation-Id: 83b07267-253d-4b74-4f8d-08dd5cfac79c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c4UuEoFjiJW6Bc8/f9iiVO6ZDEGG6alOa5MdRcdxoM5RvsrSGgJjiqYpEJOj?=
 =?us-ascii?Q?7PG/jOpgab4HeoVATtOZ7ZrwEgbtv3AHDHhU7vs8YzNGN2WYoHPrCguhnvy7?=
 =?us-ascii?Q?IkEoQn+CzYKdwWHq6Cr7iA/ZMUQZEJweoW7ESKE091XRNdyd0Xvwiyjgy3qU?=
 =?us-ascii?Q?ZSruBtSJccBkGI8hwecFbXCPR6e8zjlKMQSyOhSHGQZqmzdVWTkcuVEasH7a?=
 =?us-ascii?Q?zZp25UUtxHOG8vhm2AoIF9DtFG9bJZxHzsXDNMMdvX9GCYrvRcZKoa4u/tdD?=
 =?us-ascii?Q?WY/lC22MJv/1kmHXmvCMwEpkNJeNMuISzpOpuHfyOFGvWc2pRI9tZu7pqq3x?=
 =?us-ascii?Q?80qscdbyNpev2DmSS0ZnuiNPy14bkjx8XJYioYJPwUoSwUSNSaNFS7AAvTRo?=
 =?us-ascii?Q?lQyyRvU18y9t8qq3caq6QlbHgwpgfYu8mPawmWhfaHLOqXwwu9UbJVH9cgP2?=
 =?us-ascii?Q?y8c1ueY/riMZEKCavcbPDx4Vz5xU1bUmYOdcPkrKEJ4KBQABqZksRoJcXC9u?=
 =?us-ascii?Q?yxfLsSmeLaY6vAZ5dKImTVIK/lI0+VGh+2cU7mrtgGl/pkeXrcuzQnDg0ow2?=
 =?us-ascii?Q?nBXrEIrLGHlSq/CNhYFHg47TWU1hsd3hbc0gsnxHx6SkehP/riJy5XFYtZvR?=
 =?us-ascii?Q?B2VnnARw34DgUL70t3JYlNeuBya5dO2lOLZznhpCpWwfH5Y+mjcOrygVHFEt?=
 =?us-ascii?Q?D3XadFQ/h9ass4MCHMiS01MLU68l3H2+/brHuop+P00ZvM5Nv0crhc/PPaMO?=
 =?us-ascii?Q?vzscERrumsgAmP2rWAk2pWrH+SEZZpEPboYvJp3wn+WS79J0eOQuDCZquOK3?=
 =?us-ascii?Q?I9KT0TKwDocjFMGVO1H3u32sp7wiWcznQroB9ZBe5PsglOF/M93oIotNueKN?=
 =?us-ascii?Q?UKeCvQXnKEI6HJ0uM63EmoMrxYhgtG8CXp3j2O6cl1/7QiD+HVmuLxIJk6+8?=
 =?us-ascii?Q?HuI33tRZwOf9fOARpWqcuur9gtGmlo0OhBYQJVlIDALND+cvclvOrwc4Mpv9?=
 =?us-ascii?Q?Qk2earNwIbCxnBE79DY9/VXvK1PkME3BFKOyT2fMCNyn3GHJWOG2Pd8fbbTX?=
 =?us-ascii?Q?LXiGfmblE/T8sI6OyCOi21+XHItDarPvkWBaHE/jjxZgr1rrScZ2Ajxlz8B0?=
 =?us-ascii?Q?mIZD4Cy8hXDOKG9V3uLKlWobIf48hmo0UCE2cAQFX7a6Iha4EA0fHaxJ3OyM?=
 =?us-ascii?Q?sW2t6n0CeJYYnb1S7rjbNPBoF/thbxcjmmKrOxXsKDaSGwRnB4c7Cmg+3AcN?=
 =?us-ascii?Q?Tpf8qpZflwUDxH0eNCSgo5Qws9zOW3Bl+a4bLhe53YkoBXVKoLPyr2WlQ4HV?=
 =?us-ascii?Q?kRL0JzZ8GfukU7Q1oFs2VHLF4aZjXXXM2tx8oUVcJBgs1GO2UdjIE1dMKNwe?=
 =?us-ascii?Q?XyiqFxsqshyme5QEQB9bReSPuZ7EYx1OcLN2aa2KYd7y12LN0i+Kr6B9NyaT?=
 =?us-ascii?Q?ba5iHNz9VycWNx8JZlzDDn53eOOvuc3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:03:51.6500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b07267-253d-4b74-4f8d-08dd5cfac79c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6744

When creating a hardware domain, have the dom0less code call
construct_hwdom() which is shared with the dom0 code.  The hardware
domain requires building that best matches the dom0 build path.  Re-use
it to keep them in sync.

The device tree node of the dom0less config is now passed into
construct_hwdom().  dom0 uses /chosen for process_shm while a hwdom will
use the value from its dom0less device tree node.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/arm/dom0less-build.c           | 57 ++++++++++++++-----------
 xen/arch/arm/domain_build.c             | 10 +++--
 xen/arch/arm/include/asm/domain_build.h |  3 +-
 3 files changed, 42 insertions(+), 28 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 31f31c38da..e539bcc762 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -911,36 +911,45 @@ static int __init construct_domU(struct domain *d,
     /* type must be set before allocate memory */
     d->arch.type = kinfo.type;
 #endif
-    if ( !dt_find_property(node, "xen,static-mem", NULL) )
-        allocate_memory(d, &kinfo);
-    else if ( !is_domain_direct_mapped(d) )
-        allocate_static_memory(d, &kinfo, node);
-    else
-        assign_static_memory_11(d, &kinfo, node);
-
-    rc = process_shm(d, &kinfo, node);
-    if ( rc < 0 )
-        return rc;
-
-    /*
-     * Base address and irq number are needed when creating vpl011 device
-     * tree node in prepare_dtb_domU, so initialization on related variables
-     * shall be done first.
-     */
-    if ( kinfo.vpl011 )
+    if ( is_hardware_domain(d) )
     {
-        rc = domain_vpl011_init(d, NULL);
+        rc = construct_hwdom(&kinfo, node);
         if ( rc < 0 )
             return rc;
     }
+    else
+    {
+        if ( !dt_find_property(node, "xen,static-mem", NULL) )
+            allocate_memory(d, &kinfo);
+        else if ( !is_domain_direct_mapped(d) )
+            allocate_static_memory(d, &kinfo, node);
+        else
+            assign_static_memory_11(d, &kinfo, node);
 
-    rc = prepare_dtb_domU(d, &kinfo);
-    if ( rc < 0 )
-        return rc;
+        rc = process_shm(d, &kinfo, node);
+        if ( rc < 0 )
+            return rc;
 
-    rc = construct_domain(d, &kinfo);
-    if ( rc < 0 )
-        return rc;
+        /*
+         * Base address and irq number are needed when creating vpl011 device
+         * tree node in prepare_dtb_domU, so initialization on related variables
+         * shall be done first.
+         */
+        if ( kinfo.vpl011 )
+        {
+            rc = domain_vpl011_init(d, NULL);
+            if ( rc < 0 )
+                return rc;
+        }
+
+        rc = prepare_dtb_domU(d, &kinfo);
+        if ( rc < 0 )
+            return rc;
+
+        rc = construct_domain(d, &kinfo);
+        if ( rc < 0 )
+            return rc;
+    }
 
     domain_vcpu_affinity(d, node);
 
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d676422496..00bc484642 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2305,10 +2305,11 @@ static int __init construct_dom0(struct domain *d)
     if ( rc < 0 )
         return rc;
 
-    return construct_hwdom(&kinfo);
+    return construct_hwdom(&kinfo, NULL);
 }
 
-int __init construct_hwdom(struct kernel_info *kinfo)
+int __init construct_hwdom(struct kernel_info *kinfo,
+                           const struct dt_device_node *node)
 {
     struct domain *d = kinfo->d;
     int rc;
@@ -2325,7 +2326,10 @@ int __init construct_hwdom(struct kernel_info *kinfo)
     else
         allocate_memory(d, kinfo);
 
-    rc = process_shm_chosen(d, kinfo);
+    if ( node )
+        rc = process_shm(d, kinfo, node);
+    else
+        rc = process_shm_chosen(d, kinfo);
     if ( rc < 0 )
         return rc;
 
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index 134290853c..17619c875d 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -13,7 +13,8 @@ bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
                           paddr_t tot_size);
 void allocate_memory(struct domain *d, struct kernel_info *kinfo);
 int construct_domain(struct domain *d, struct kernel_info *kinfo);
-int construct_hwdom(struct kernel_info *kinfo);
+int construct_hwdom(struct kernel_info *kinfo,
+                    const struct dt_device_node *node);
 int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
 int make_chosen_node(const struct kernel_info *kinfo);
 int make_cpus_node(const struct domain *d, void *fdt);
-- 
2.48.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B299A7ED98
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 21:41:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941048.1340633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1sL6-0008Ov-RJ; Mon, 07 Apr 2025 19:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941048.1340633; Mon, 07 Apr 2025 19:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1sL6-0008Jg-M0; Mon, 07 Apr 2025 19:41:00 +0000
Received: by outflank-mailman (input) for mailman id 941048;
 Mon, 07 Apr 2025 19:40:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tcrT=WZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u1sL5-0007y6-90
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 19:40:59 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f403:200a::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3981e34e-13e8-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 21:40:58 +0200 (CEST)
Received: from MW4PR03CA0076.namprd03.prod.outlook.com (2603:10b6:303:b6::21)
 by PH0PR12MB8150.namprd12.prod.outlook.com (2603:10b6:510:293::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Mon, 7 Apr
 2025 19:40:52 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:303:b6:cafe::11) by MW4PR03CA0076.outlook.office365.com
 (2603:10b6:303:b6::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.27 via Frontend Transport; Mon,
 7 Apr 2025 19:40:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 19:40:52 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 14:40:51 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 14:40:51 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Apr 2025 14:40:50 -0500
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
X-Inumbo-ID: 3981e34e-13e8-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5yCebZSDd/RZRUWAF8UHdHucpsYmceXq4Ig8ZoxjxTY9SJ5iKxmtpVfDlMt/d5I/QTwhJu+g68hPRYQ3Uajmi59WtVu3dxejZU+qWORw7Ofi3AIPdXTEW+8dfTM7Dwe+kzfpP5RYwCnHZdDWGE3TserBbZycJ//oDQzJBJofgmQr5y5outqYZqF1Lh8z8HdQDdiI6q3Dg7uOArN0Jq63bDSEsKpdAiKEQR5/1Z/sa8r9aMl/u11TzEHjBiIPPPrtiYMchdZsKeIDsyFKdaQXT97BI6Y5ngs7YaFBs4SF4K/8T9epqZvquTmNqED66anHycGtq3/SpkVtM5zUoHiDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qO9SiZnuBr9WdpBWU0DoSKy3ddphr2m8uxBGiGeFiI=;
 b=shhPJkfkMdWhC2HABy+08eTx1Lr6LFa5QrjOPZew/VRucmh058DNsF6e2ZoAPixivJNCvTrlPqOIFp+qEFV3iZJfJhNd4gmULvVw7w/EuhiAwNen5HBdlTp1Wfy1nTIPvDmMxmHpBbW4kaC2oshMCN58oGoe8QKZCRTszZGSApEzfINUpn5CDQy8gyl88GsRS6seP9NXvqU3IapEThzI9Jr0juFL7A+xW3OqjGksXjhDufcYjQgQYQyR+/raXBMw3edZJts+O4eTthAxF1i6OinF8eJb2lNg93/8gX53T2HGJ922rL/0ytdIfLBTOKFbqugapE0/mcviWzn3nRsxwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qO9SiZnuBr9WdpBWU0DoSKy3ddphr2m8uxBGiGeFiI=;
 b=pg2hya5bjOCD4TISX3eKMBAxET6aBNcrecS5fNM0qdG8qijUKtTomeM4lcLYPtugksLLiP+9qbnM4brP5uBPXrn4pHpBeBXofGT/47CyBFLQgL5T1xg5sdjpM0i4fqfouXm9dKSUd2Uq2tlDE30zGZsd/A/JmYxOpS2Gw+TQWbM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 2/7] xen/arm: dom0less hwdom construction
Date: Mon, 7 Apr 2025 15:40:33 -0400
Message-ID: <20250407194038.83860-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407194038.83860-1-jason.andryuk@amd.com>
References: <20250407194038.83860-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|PH0PR12MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: 272e456b-4295-4a4c-2db0-08dd760c1b3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UZ+5aFPXSvzdyjVGMBflOuXVZuzpFWWCYEt6ph+zPTo8J8vW4Wf89VLlGMZp?=
 =?us-ascii?Q?P09/HYPMKB79te6XtOAWa0XO6CpmrdPsjXlQJ4r/CHRsukDJljOAX99ePDas?=
 =?us-ascii?Q?4UK9ZHGq3wgAesUJ7in4IPApOdWBsz2Xzqdng9/rku7wQS7jRfXvW63AY793?=
 =?us-ascii?Q?GpYPewV34hB2N/eDjKwyPRzmfL2A8aMuEkwOYUBjFVO6RdYCkdBQK1SvQY2l?=
 =?us-ascii?Q?3I+nzYewSiIHPgM3mkfLnXxfnwm7nX6f/PMqvCCIxlbIypzVJGltXOms6uPU?=
 =?us-ascii?Q?HQVxasPb2ZUwIKoIqwEB1/2JuJFBTaEZqMJnq9gJdtFuwQ9/mvv4yzXtCR7X?=
 =?us-ascii?Q?vJnkK9qdaP2YZQ1JsCUDGGEBlS/TjZC3OmmP7znG4oK/DQOQliraIJ5h9GOc?=
 =?us-ascii?Q?JhVBUYv9kT4jyoEXqKAiJd0isZnnvYtWMjQo06QCrGEtcpVdQQyNzKqQYM77?=
 =?us-ascii?Q?ptdKod3BPZAtMKur5pUHGvGGVM1rYAKuDX9ryI264h3Ul0x0RfV15aKJ56K7?=
 =?us-ascii?Q?A+in82lOi7TCrykTuxU7Q+3BBsJYubZ26s+b4EVckxDtwhOm/XEMyOhHusSB?=
 =?us-ascii?Q?oMXAvKQzC9QrRNo5X3kjXwRvtiM8Js6SnNYT/w7hnsTm7ScEfZV9FEi3+7Sz?=
 =?us-ascii?Q?AZ8hJOF9BQK7O4BdRfGKSbsfnSKroSq4uOhXWxixs2gRG0WkE7OUCSznF6tD?=
 =?us-ascii?Q?JLzYTi3PkRNbXSy4ZjhAK7gmDyaruuDP4ygt2VpYJeIDX+SrmDj/YR31lTh+?=
 =?us-ascii?Q?e6Ijiyw68j0tcAoNoH39aakmSQ87zAMVjAJIPrb69bnwh3M6/XPQT1XZNSdA?=
 =?us-ascii?Q?n6ZBTJhUVGB8r1FVv4KLKR4MtvyDzGDdf+Q2Sfec1/T1zELTKYk792zNG6oR?=
 =?us-ascii?Q?OCkdkn/IZd0y/6Zhbtk/jnRY7yU3iIl1GbXfs+viSOpuj4GKst92lQ/0t7Xm?=
 =?us-ascii?Q?IuH5j5UJwyZ2E+9bKxmyTR9YlLQ06SuZ2P6kK5sBkhqi41+duObJHpB84Egi?=
 =?us-ascii?Q?FZRY9zAlB2zV9Q1s+Be1/xNumg51bWB6uaVT6zFdOeUsmocsfMyQknxzVxAV?=
 =?us-ascii?Q?Gpcrsa0j8pMWExUD9CCpVAc0xG53nenrmYyp+vnK3P2WhDmWvGCYZgIGQcY8?=
 =?us-ascii?Q?VA8HtS9pWZNo7fCGeeZUua7pAMPMYr0Y8h3tagFf2wbdNY/xHBE5DRvMgBEH?=
 =?us-ascii?Q?DESUpU0VKHHKmcTUZXvmMHxHmHm+3yRLyVksEVjG4wFAHM1H0XMjP3/iny2/?=
 =?us-ascii?Q?7of/5jb11RtlMDKMl13k1G/MVmf1E663gKSVU9n821sSppjKK1A7cij/NVD/?=
 =?us-ascii?Q?25UYABy8bqbFHwZFjbDZdxg3cx/AVyr/np4jP54i7ec216b786svQuIPPWqk?=
 =?us-ascii?Q?lHe6//KOaLjWOW2Uv8pQc+uBdFPIHVxL5/ubVal48ZiqLsSmtzF+Z1Pe1D5X?=
 =?us-ascii?Q?TSagiUiPPEgbHpSLDL/vb4TNDEd3SUJoLbdKKS7VEEi5Vrwl5V51RhfydPeq?=
 =?us-ascii?Q?Cw7G1RZgY8z0S4E=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 19:40:52.3751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 272e456b-4295-4a4c-2db0-08dd760c1b3d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8150

When creating a hardware domain, have the dom0less code call
construct_hwdom() which is shared with the dom0 code.  The hardware
domain requires building that best matches the dom0 build path.  Re-use
it to keep them in sync.

The device tree node of the dom0less config is now passed into
construct_hwdom().  dom0 uses /chosen for process_shm while a hwdom will
use the value from its dom0less device tree node.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v3:
Rebase on process_shm_chosen() removal
---
 xen/arch/arm/dom0less-build.c           | 57 ++++++++++++++-----------
 xen/arch/arm/domain_build.c             |  7 +--
 xen/arch/arm/include/asm/domain_build.h |  3 +-
 3 files changed, 39 insertions(+), 28 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index bd15563750..7bc6a6c4d7 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -929,36 +929,45 @@ static int __init construct_domU(struct domain *d,
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
index b8f282ff10..0a329f9f5e 100644
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
@@ -2327,7 +2328,7 @@ int __init construct_hwdom(struct kernel_info *kinfo)
 
     if ( acpi_disabled )
     {
-        rc = process_shm(d, kinfo, NULL);
+        rc = process_shm(d, kinfo, node);
         if ( rc < 0 )
             return rc;
     }
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
2.49.0



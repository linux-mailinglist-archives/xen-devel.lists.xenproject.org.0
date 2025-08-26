Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9B3B37441
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 23:09:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095133.1450284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur0uq-0007Ps-M6; Tue, 26 Aug 2025 21:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095133.1450284; Tue, 26 Aug 2025 21:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur0uq-0007Iw-Fy; Tue, 26 Aug 2025 21:09:16 +0000
Received: by outflank-mailman (input) for mailman id 1095133;
 Tue, 26 Aug 2025 21:09:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=etY1=3G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ur0up-0006z4-FF
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 21:09:15 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20622.outbound.protection.outlook.com
 [2a01:111:f403:2414::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea50d56a-82c0-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 23:09:13 +0200 (CEST)
Received: from BY3PR05CA0006.namprd05.prod.outlook.com (2603:10b6:a03:254::11)
 by BL3PR12MB6593.namprd12.prod.outlook.com (2603:10b6:208:38c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 21:09:04 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::8) by BY3PR05CA0006.outlook.office365.com
 (2603:10b6:a03:254::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.12 via Frontend Transport; Tue,
 26 Aug 2025 21:09:04 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 21:09:03 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 16:09:03 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 26 Aug
 2025 14:09:03 -0700
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 16:09:03 -0500
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
X-Inumbo-ID: ea50d56a-82c0-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkyTdFAn7KprzTPkuvHbOTpnEZhoznnBGyVwyAin0D8h8iQ6AiKrmNbdmbN/8kUDkGS5pgBTbYf+r/3paVfxjCRTG5ekbelHPsMrkOzhpM+6FPDw3C7NpoRJZbBhMyMojy10Pc1LhM86BAhW9XTvgBKHw0fn3RnWpIVMy0G79SxjYQzUmK98KCGr2u/jdAxyWJ3BvDTFGXBTj5YMkjv+xcx6CQe+c7Az59z9uM25gvVW7jwhJ7DEFJxPx21LpN4grduD5ayR8Q+1XUJhshUMAojFutgc7t6Lpdapudr8UeBdDbKl5OBMBCIxYRCGAIRsRn/p04zcK7doTOZh85moGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zh8RyeKz1ZM0/lFRJbJVe9Xi6LtsKXP+OxMCeZpnpeU=;
 b=Hwhf+/NaN+gyGEdIUowDyaAY0VF53uTpeB8IJzDLvGeSkz9NGQqUN93dUyNgY3xrbJgfcZ7C7CVihNF5Lh44Gf9mK+YOpiLGQTtB5lNiypruFWQYKlfaE7WqraaiC093FBsXnIslVFBFpnD2mf2WeIQ/SPjCwc6mfCx5efoZRE+uFmU0v2jKGpJBvGvft3ACCRAqp0RXQgBsrkx0ImWI4xH0aGBP21ELZRJuSCcvIyEoEa6MpPm8noy+id54CzPXJ1pn03qJip1E4t6qZ3iz6d7ShsfGmOVWx8e1qqvhfddiPPbOcdGJGTrG70hOHJNnLNDHh5xnSHdfBHPj1Mo9SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zh8RyeKz1ZM0/lFRJbJVe9Xi6LtsKXP+OxMCeZpnpeU=;
 b=ET+7LMP/cNLqDLZ3Mn+MxvUPcGpjtojs/BcR/NwWVESMYKjox2I0K6rbhjH80P6WllcloKwXw40CwWYv5AicMaRYXmUWEHVzpxFMsXqAusCTGcdYsf2ATWOn3cAYim0ZGNeYIAWPO+GiTAJxgV8AL84TwRaEu+yii2dACqeYanE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v3 2/8] tools/init-dom0less: Factor out xenstore setup
Date: Tue, 26 Aug 2025 17:08:41 -0400
Message-ID: <20250826210847.126015-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250826210847.126015-1-jason.andryuk@amd.com>
References: <20250826210847.126015-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|BL3PR12MB6593:EE_
X-MS-Office365-Filtering-Correlation-Id: 66d20738-c757-4f14-af5b-08dde4e4c967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XE00tK+IQAjAgwwtUoNRXIvuWXR3w4460zCE0Ym19haPbsjHTIRqnzop2ues?=
 =?us-ascii?Q?jOEyDryjFrO+7manQu6A9jmL+163Mfn3ZezMAqTjXWT8yXQxh6rRweBhx3Xm?=
 =?us-ascii?Q?HtGJqtJVfw3Z36gXmn4LuvM9QYF8PgletWvT60XSc1+ybk0mJqetbE3JX1AH?=
 =?us-ascii?Q?Z/Tr3OqR8FaGqlUf1UfhR+p7yq3R+fyTEIF1fHGlfMgIKzoxOCf6HkkuSil0?=
 =?us-ascii?Q?nT3RboIqJlGcDhJgCCPLKIZ9neyHSdOZ9Azs9OOAVUDQi+p7FHDxuqZ//TtI?=
 =?us-ascii?Q?USCXP9RmrD6qWdJwvaULsRRTKL3QUOc2/QClW7uN4e/YgKnHnKJ5ifL36sVN?=
 =?us-ascii?Q?l5YqdW2RC08BehTRXTAq9PQ3PDm8FmryqKaRfRo02FjPm/V9ASshbx6ASsbN?=
 =?us-ascii?Q?6sPkvIGgLo8MGkyC7NxamljRO6oxnL2O/A0Zke9yXoI0MoUFv/2Hrh7C0ysc?=
 =?us-ascii?Q?HhQ3l9uswY/Ij07tkdjSxv1n4/p16BGU9Ygu1SCaZ4dSGc203RwQS8DT7GRz?=
 =?us-ascii?Q?Fi1eGN++cAhVolhBD1WE+4yPnYrSg6yKewW4ZnCECDZyuvA3ZVkYQqqG7RST?=
 =?us-ascii?Q?FznhqvLpuXB697T71ZkzqKAkYjU3LjCpSmCPBQ9by0HkvioVZKTrXgu9b2Ip?=
 =?us-ascii?Q?XtKHpeiXhqvc9inIKiLFjjM5R6MbG9de24+0V++xEU9gK2muX479aESYiwmW?=
 =?us-ascii?Q?LheEaSgMOxL9pFek4OXUtzs4gNQelIAN5DoRYGyETnCzObzgNa2VK/+AxcwL?=
 =?us-ascii?Q?3ikw8W9Sb2w3yuUgh79PWIadRaux6YTnXEZvW3EdqqUB51TKXO6hiaxyorfq?=
 =?us-ascii?Q?/T5+0g/+yBL8d/C4GRZ/a+mWpTLSvrcZc8PJ1NiN2QvFfnFSIMGk1B9/g1M7?=
 =?us-ascii?Q?G0RuOB8TFEPp1M8kKvXf7gFbBWx/qKilOb932gf8MbzMigMWh7AtabzRC5aK?=
 =?us-ascii?Q?tLxaJ79auxubQ3XSgkVab5Hrc2trfo/4bG+8RilV5S/ySKEkTiVCbYvgSoSC?=
 =?us-ascii?Q?/J6mkK43olUsynpdnphTiEvvpvJ7lN4DzIorOlI4Lo+uIkYxRP6nNbX0lVmM?=
 =?us-ascii?Q?bcNKGKXU88lNXWfDTXnjtKcPoth70UCNgHuatfub0uRNw7R/hUK3Deva55S8?=
 =?us-ascii?Q?JlX4x69RdOH88NuMxG8bh8nbhMQFJ5RxXcZeqdDLjv7K9Qv+2c0RFPaob7wN?=
 =?us-ascii?Q?V1H8K/ZvxxiMJ9Htp9ThsS2q9N2TYTRMTK3peNEoUB/LuI0wHkQpPt9EymvK?=
 =?us-ascii?Q?6h53cs2OFcN12OpnylBqMqkZs3dNRAhkhLHj3v2sFB3GXlQMsFnjArRXaKgA?=
 =?us-ascii?Q?Nb1oZMYdhsvYMH+h4G6wm4OqIyMSql+iZOAfcBLW6rtLRFlqHPACcUXdL9wH?=
 =?us-ascii?Q?2TLAuNsxa6x5x0rdIcUOGgjS0/OnDAVyV034OWMZmuLJtXUXLwlHFhEejYzz?=
 =?us-ascii?Q?wcuTYcziwYwgpzRClWkRAz8+xYag5OY5PaIwtyBXreRxt6BL1zk9vItRe7wu?=
 =?us-ascii?Q?86vP41tGp8y8N0wYT0Io0a2+tRwMJg/Oibqh?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 21:09:03.7822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d20738-c757-4f14-af5b-08dde4e4c967
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6593

Factor out the xenstore setup code into configure_xenstore().  This is
in preparation for handling already-introduced domains.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v3:
Remove handle passing
---
 tools/helpers/init-dom0less.c | 39 +++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index 0b0be08449..8de8e44ad3 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -237,40 +237,40 @@ err:
     return rc;
 }
 
-static int init_domain(libxl_dominfo *info)
+static int configure_xenstore(libxl_dominfo *info,
+                              uint64_t *xenstore_evtchn,
+                              uint64_t *xenstore_pfn)
 {
-    libxl_uuid uuid;
-    uint64_t xenstore_evtchn, xenstore_pfn;
     int rc;
 
     printf("Init dom0less domain: %u\n", info->domid);
 
     rc = xc_hvm_param_get(xch, info->domid, HVM_PARAM_STORE_EVTCHN,
-                          &xenstore_evtchn);
+                          xenstore_evtchn);
     if (rc != 0) {
         printf("Failed to get HVM_PARAM_STORE_EVTCHN\n");
         return 1;
     }
 
     /* no xen,enhanced; nothing to do */
-    if (!xenstore_evtchn)
+    if (!*xenstore_evtchn)
         return 0;
 
     /* Get xenstore page */
-    if (get_xs_page(info, &xenstore_pfn) != 0)
+    if (get_xs_page(info, xenstore_pfn) != 0)
         return 1;
 
-    if (xenstore_pfn == ~0ULL) {
+    if (*xenstore_pfn == ~0ULL) {
         struct xenstore_domain_interface *intf;
 
-        rc = alloc_xs_page(info, &xenstore_pfn);
+        rc = alloc_xs_page(info, xenstore_pfn);
         if (rc != 0) {
             printf("Error on getting xenstore page\n");
             return 1;
         }
 
         intf = xenforeignmemory_map(xfh, info->domid, PROT_READ | PROT_WRITE, 1,
-                                    &xenstore_pfn, NULL);
+                                    xenstore_pfn, NULL);
         if (!intf) {
             printf("Error mapping xenstore page\n");
             return 1;
@@ -281,16 +281,33 @@ static int init_domain(libxl_dominfo *info)
 
         /* Now everything is ready: set HVM_PARAM_STORE_PFN */
         rc = xc_hvm_param_set(xch, info->domid, HVM_PARAM_STORE_PFN,
-                xenstore_pfn);
+                              *xenstore_pfn);
         if (rc < 0)
             return rc;
 
         rc = xc_dom_gnttab_seed(xch, info->domid, true,
-                                (xen_pfn_t)-1, xenstore_pfn, 0, 0);
+                                (xen_pfn_t)-1, *xenstore_pfn, 0, 0);
         if (rc)
                err(1, "xc_dom_gnttab_seed");
     }
 
+    return 0;
+}
+
+static int init_domain(libxl_dominfo *info)
+{
+    uint64_t xenstore_evtchn, xenstore_pfn = 0;
+    libxl_uuid uuid;
+    int rc;
+
+    rc = configure_xenstore(info, &xenstore_evtchn, &xenstore_pfn);
+    if (rc)
+        return rc;
+
+    if (xenstore_evtchn == 0) {
+        return 0;
+    }
+
     libxl_uuid_generate(&uuid);
     xc_domain_sethandle(xch, info->domid, libxl_uuid_bytearray(&uuid));
 
-- 
2.50.1



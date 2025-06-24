Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD2AAE5883
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 02:20:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022869.1398732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTrP0-0006If-1n; Tue, 24 Jun 2025 00:20:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022869.1398732; Tue, 24 Jun 2025 00:20:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTrOz-0006FI-US; Tue, 24 Jun 2025 00:20:41 +0000
Received: by outflank-mailman (input) for mailman id 1022869;
 Tue, 24 Jun 2025 00:20:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKra=ZH=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1uTrOx-0006CC-Qk
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 00:20:39 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20628.outbound.protection.outlook.com
 [2a01:111:f403:2413::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ac0f783-5091-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 02:20:34 +0200 (CEST)
Received: from BN0PR04CA0150.namprd04.prod.outlook.com (2603:10b6:408:ed::35)
 by MW5PR12MB5683.namprd12.prod.outlook.com (2603:10b6:303:1a0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 00:20:28 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:ed:cafe::b5) by BN0PR04CA0150.outlook.office365.com
 (2603:10b6:408:ed::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Tue,
 24 Jun 2025 00:20:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 00:20:28 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 19:20:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 19:20:26 -0500
Received: from xsjvictlira50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Mon, 23 Jun 2025 19:20:25 -0500
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
X-Inumbo-ID: 0ac0f783-5091-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zm57fYIqWU7EIN/Le5C2pjhQ1y9RCGdtyTeG/lH3xu92zIgiUMDyLeCmTlVCVU1tDobpOMU6Qy+UZWW3Fu3+/mLm8AxT7sdaCeXmFe28YsTJHnx4T3E5BVercDQfSzNM0fBYuLnu3tn9sR0bE7pFiJm1h7L+69vbaBys8tQYNK81mvg18o6tC94DGO7Pbr9mp1x+WJUns5QVS5P7FxmvpJTroYnQjVOZBXQRVTJP2ZQpCFbdoiPTnQg6y1quoy56jT+9ttJ+cPx8lXDnGFng8zn6I6yQySAH5EN9YJI1yeg4em2KXDTQTlx1FhZLa6dslk11yEt2DWp0tARMce5feQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSJwW2j+84BVU86M+ey7G1OUCwpFZObGFbhbZ90payg=;
 b=xlxNEGllzfXi+o22IWVSEOk3dMHmKyKAXH+cBJVKXDOFlGCcQS34aYf48dxFJwsSSIgjDTqZfGcsRG/w73vRazerP+d28gzkMUMM+TKGnDaB5T5UY6MqDwaudZxdb6pBLaX5DBliHMt332quXRhUj40GxC4RGW19gBYVUqwElu/Lm3dLV7eyQZSWezzKBFgKwypy9fCOjgHSqDFZmt8QsYNjlneM+M98oQGiGBXqSlwBMyueCAXJV4vKH8AEcdzxFZRdNGKomeWzxQBa3FAZfGmkfKwoOLDUcFaIkID3CSZiV4GsOqVDeOixoXsXq6ZF0VMVNB2SU7V3QSyDrOWduA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSJwW2j+84BVU86M+ey7G1OUCwpFZObGFbhbZ90payg=;
 b=QjxXmO3FDCMApFF8jgAK7td/Mul3aey0SVPZlROrlRfaQ0Um4ISjrsFDHpp+walfvjfO4GvqxhEDr42QHJcoVkdi9v5WsTY7pV4yCRact3UPQDKcJjmHzLVS2lcRbC+AWDMo5Xde5gqe+29qAPRn8XcSpyxr+SckXGeWbD5hczw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Victor Lira
	<victorm.lira@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=83=C2=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Federico Serafini
	<federico.serafini@bugseng.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH 1/2] xen/arm: address violations of Rule 11.3
Date: Mon, 23 Jun 2025 17:20:14 -0700
Message-ID: <20250624002018.4121819-1-victorm.lira@amd.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|MW5PR12MB5683:EE_
X-MS-Office365-Filtering-Correlation-Id: 94754749-4ffa-4916-cb5f-08ddb2b4ec14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0c0T0l6RDhERHpUcEJtaDQzZk1VV2NOczRBL0NCMTZsb3NyTnF1TnBWYmpr?=
 =?utf-8?B?VnVQVFVqN211WG5jQVB6TVFPTmE1TXhEQzQzNjZKUlAzTDIxV1RvT3lIVWhy?=
 =?utf-8?B?M1BhUGVidlZ2ekx6UWZlbnN1SmJySGRpSldPdXBtNFk0V2hibWc1L29IaU12?=
 =?utf-8?B?K1NFYVdpMDVmcFN0TmNSNisvYko2VVBvREdWWldZaDZCL2pMdUR2WUd3dkgy?=
 =?utf-8?B?Vy8wajV2bVdLMmpINGhKWS9UMFlBWkFRTkhPYmhnZjdDakV5dVloNUNWNUc2?=
 =?utf-8?B?UFBZWWFCYklsQ3VrejJXYjZEaEFabVNHSVpuTWxtWEF0TTR1djgzOG9SR3hO?=
 =?utf-8?B?OXl1NWUveUdBUVBpd1dvVVBFS1BWRW54Yk9UN2ZxcHdpZHJSMy9TS3lhSVdT?=
 =?utf-8?B?NHpMaHowSHg5N1d2b0dNb0d6SXJpeHZrZ1IrS1hWQjkzRjhtdkRXV05mME9W?=
 =?utf-8?B?RVNmYXhndTlLaTVRWnIwNGxlRWx0OE9YMU4zQnQwT0ExeWxoTklpNDdNQkRE?=
 =?utf-8?B?R0pXcm9xcDQ5Y2VuWndnR3M0dDlGL0ZwV1VIWmtFcGVjYUxiQnZHZFUvRzRw?=
 =?utf-8?B?Qk1udnBvSnpSdnFBSkRHY003cCtKMmYwQkdhcCtqUGxrZkFYRkhUYjhNNGVZ?=
 =?utf-8?B?cHJad3dQV2h4OHEvM2tOMDBhUE90NUkwc3B1M3hkNVFzUzVMSDM1clR3RFhm?=
 =?utf-8?B?V3RDYmFEQkFqbXlJTkV6NTZjZXRZYUhzb3BjZFpaMXUvSitTbklNRjBnWHo0?=
 =?utf-8?B?Zk8wMW4wZXZkOUlTMmlzZWlvcWtjaG10amkxR0xJZ0FrMDBUdG9BM2tsTERV?=
 =?utf-8?B?dDdXZUFlTkwzMHk0ODYrNGRCMzJYZTM4anJ1S1MvUHpmSFIxc0FIdVdLZzRZ?=
 =?utf-8?B?SXphVFBvUS9KMW9tSElQdWhqRjRYTXVqZlI1dmJocnU0cjZSckxMK2tkbStP?=
 =?utf-8?B?MFdZaEVRSFBtZHZBMXBTb0JxeFVkQ1Rvb3ArS3BsK1dnWUpPMWo0cUFJdWR2?=
 =?utf-8?B?blorNlFVRE56ZHVUb0xxamtnK21mZGRkZ3g1NHY5ZmEvcXdKZUNZZmozMXRH?=
 =?utf-8?B?bTdHMWg2TlRLMDlCandRZ2kwWHMvMEFHRjRxeHJaeWZ3SUhmZ1RjdjE4ZW5F?=
 =?utf-8?B?SW5USk5sSE04c1l6N3M4UXhVZGZ6VUJ2aThVVEEwQjJqWllPZ0VEajV5UGJQ?=
 =?utf-8?B?clZOeE4rS3BzZ1liaTFoMzZLSkFPcU5RUkRaMkQ1clBiWVQvVk9iYlJNcnJZ?=
 =?utf-8?B?YTVDRWlUTUF4UEZ0bmNXWkdYL2JTQWp4akh0eXplb0wxQ2NHOTMwR3g3c2VD?=
 =?utf-8?B?NFk1eFRGcVlGVFlkMVZJQjY5SG80Q3Zqd00xTkZZSXZCSktkZHhHb29IVUxy?=
 =?utf-8?B?clA0NlBkU2ZTeDlzSXpwODBJalVBcXlMOTRKOC9XTkJxbXQ4Rm13WU85MEE3?=
 =?utf-8?B?NnBQd3RUa0RhTjNzSjlYTUlCLzZNcGsyKzkyQ0dSVDBKRWtMb1J4SkRMZjM3?=
 =?utf-8?B?TlI3UlpkR1ZpS0F0L2FQZzhRWG5tMWlVZkVvUVgwM3RvWGFQQ1FpNnRyQ2Iv?=
 =?utf-8?B?NkJpUGlWU3hyWnN5NUMyWk1mclJHUE52aFdTUlJ1MWd1dmZJWkVkbkx2dytj?=
 =?utf-8?B?Tkl0c0N2eitkUk1lRTZRYlpqTU5LbGNGbHZaNEsxNStJRmxHc2lhOFgxN3Bk?=
 =?utf-8?B?d2tEVTFtYW5Ldmk4bkkvUUp3RjkvbHVMbVNFVlZXK1JLTWdDK3BaOThUK0sx?=
 =?utf-8?B?dExqMXlpZjJQUlh2eGtrNHU1SkgzMlFSd2VENmVWbm0zWDBMYkZJVnhqQk5x?=
 =?utf-8?B?cENLYWx6Nk5yVHdlK2lWTWZqNjFuMTF1azZWU0NQVEN2K0pmK1BmejRwSkN3?=
 =?utf-8?B?d1A5RjVlZFhVQmF4UURYbThITUZQSzV6UjFJT1Z2enNoZW45NGNTdnk1QUdM?=
 =?utf-8?B?OGFnZkVhS0RwYi9lUjVGQUhkVVltKzZMVTBtTW5FMVE2M3JHM1pyUlY5Qk5Q?=
 =?utf-8?B?aTc4UHpxV2hocjlLd2IzSXA0a2dXeHRuKy9PdmlLRitMYmVMQ1FmREtsaENB?=
 =?utf-8?Q?0ICx6l?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 00:20:28.0698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94754749-4ffa-4916-cb5f-08ddb2b4ec14
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5683

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

Use {get,put}_unaligned_t to ensure that reads and writes are
safe to perform even on potentially misaligned pointers.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Roger Pau MonnÃ© <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/efi/efi-boot.h      | 9 +++++----
 xen/common/device-tree/bootfdt.c | 3 ++-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index ee80560e13..12dbb6961f 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -9,6 +9,7 @@

 #include <xen/device_tree.h>
 #include <xen/libfdt/libfdt.h>
+#include <xen/unaligned.h>
 #include <asm/setup.h>
 #include <asm/smp.h>

@@ -85,7 +86,7 @@ static int __init setup_chosen_node(void *fdt, int *addr_cells, int *size_cells)
         *addr_cells = 2;
     }
     else
-        *addr_cells = fdt32_to_cpu(*((uint32_t *)prop->data));
+        *addr_cells = fdt32_to_cpu(get_unaligned_t(uint32_t, prop->data));

     prop = fdt_get_property(fdt, node, "#size-cells", &len);
     if ( !prop )
@@ -96,7 +97,7 @@ static int __init setup_chosen_node(void *fdt, int *addr_cells, int *size_cells)
         *size_cells = 2;
     }
     else
-        *size_cells = fdt32_to_cpu(*((uint32_t *)prop->data));
+        *size_cells = fdt32_to_cpu(get_unaligned_t(uint32_t, prop->data));

     /*
      * Make sure ranges is empty if it exists, otherwise create empty ranges
@@ -824,7 +825,7 @@ static int __init handle_dom0less_domain_node(const EFI_LOADED_IMAGE *loaded_ima
         return ERROR_MISSING_DT_PROPERTY;
     }

-    addr_cells = fdt32_to_cpu(*((uint32_t *)prop->data));
+    addr_cells = fdt32_to_cpu(get_unaligned_t(uint32_t, prop->data));

     prop = fdt_get_property(fdt_efi, domain_node, "#size-cells", &len);
     if ( !prop )
@@ -833,7 +834,7 @@ static int __init handle_dom0less_domain_node(const EFI_LOADED_IMAGE *loaded_ima
         return ERROR_MISSING_DT_PROPERTY;
     }

-    size_cells = fdt32_to_cpu(*((uint32_t *)prop->data));
+    size_cells = fdt32_to_cpu(get_unaligned_t(uint32_t, prop->data));

     /* Check for nodes compatible with multiboot,module inside this node */
     for ( module_node = fdt_first_subnode(fdt_efi, domain_node);
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 529c91e603..9f255027ea 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -13,6 +13,7 @@
 #include <xen/lib.h>
 #include <xen/libfdt/libfdt-xen.h>
 #include <xen/sort.h>
+#include <xen/unaligned.h>
 #include <xsm/xsm.h>
 #include <asm/setup.h>
 #ifdef CONFIG_STATIC_SHM
@@ -213,7 +214,7 @@ u32 __init device_tree_get_u32(const void *fdt, int node,
     if ( !prop || prop->len < sizeof(u32) )
         return dflt;

-    return fdt32_to_cpu(*(uint32_t*)prop->data);
+    return fdt32_to_cpu(get_unaligned_t(uint32_t, prop->data));
 }

 /**
--
2.25.1


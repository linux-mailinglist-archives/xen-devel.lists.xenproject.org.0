Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EA2B0F844
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 18:38:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054533.1423328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uecTy-00025F-R8; Wed, 23 Jul 2025 16:38:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054533.1423328; Wed, 23 Jul 2025 16:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uecTy-00022J-My; Wed, 23 Jul 2025 16:38:18 +0000
Received: by outflank-mailman (input) for mailman id 1054533;
 Wed, 23 Jul 2025 16:38:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3I4v=2E=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uecTx-0001Gm-NY
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 16:38:17 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20619.outbound.protection.outlook.com
 [2a01:111:f403:2418::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e297883-67e3-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 18:38:16 +0200 (CEST)
Received: from BYAPR06CA0019.namprd06.prod.outlook.com (2603:10b6:a03:d4::32)
 by SA5PPFB9BA66B77.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8df) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 16:38:11 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:d4:cafe::71) by BYAPR06CA0019.outlook.office365.com
 (2603:10b6:a03:d4::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Wed,
 23 Jul 2025 16:38:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 16:38:10 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 11:38:09 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 11:38:08 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Jul 2025 11:38:08 -0500
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
X-Inumbo-ID: 6e297883-67e3-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQRh/Ggi0ZbcQ/LI4OvuZ4KVOY9qXxMWrMUzousJTfiMmKdkW8wo5NxoJeYOnn/nM+MOlvbQlujJUk7WVtKGwB64isSFsWXNbd6yZEkLPiFnYLrCMKTRW80UazecOGHWWRKOwH+CGEblOjTYNIvUFMrY0OU47f8czxQcK8t6K/DJi9j6WFAE9kdqVuglvlsthksJKXFwNMao86VegbL4gtMWKkwmPpNhqgW3IBc7f/iaZLtNQwLJTw/j8pcP67mBSj60PoBgo2EsLyY4TsH0htN7bu5BLzkgYsHH7zM+dcf/1iMV7tqacUKGO0nU/kkvTyp3M0gLNVso0OlV4Ehkow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RE1UVrfIVK3mwTDtCLjyTbQcbJMEk64J6J5dQb7S5G4=;
 b=mozcb7Pt4H82UCbI8lo1guS+RDNX+yoh3d8f44bSqTI8uhsBtHG+4CQ3SE8oARqd8NgbzOVztmO/MMh6MAf7yGOgd4FWoyVdOX1uyBMf1Pu/cwNoh3FBRQwW8o1M+UVndYAkv5PdEu6eErrLjKC+08sB3AejPB30aInTy8EcpqS34qD81E9FhaZT3wBGfN5a1JGWka6BCudFaGyZ9+DSsH0NoWG40utlir8PuDB/97qCDSXwSiY/d7wiW2mVnxk+81DInwtL92RaZu88neNOw0SUy363ChXLsCVx6yAZdH5JJaq32GMVYNBqHo16/t2gV4VsQ1G01fnZ2HysyqECqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RE1UVrfIVK3mwTDtCLjyTbQcbJMEk64J6J5dQb7S5G4=;
 b=2SSGRduyWKbaqcQp08V6mOVaOGcmbwvaqirJIrPeKPbAb9bScFoD/nS9M3dT8tJpUPVn1MnaqRPgmBYbVg7x3059cZ8kYC3Ppm2b4d+7HgB+zuiaQvrhp7+J07eCJ8/iPBQbduH1XXCmcrN5hF26YJBjTf/bH+4AVNu5CxiTtws=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 3/3] vpci: allow 32-bit BAR writes with memory decoding enabled
Date: Wed, 23 Jul 2025 12:37:43 -0400
Message-ID: <20250723163744.13095-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723163744.13095-1-stewart.hildebrand@amd.com>
References: <20250723163744.13095-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|SA5PPFB9BA66B77:EE_
X-MS-Office365-Filtering-Correlation-Id: 401569ca-07cc-4c9b-a9b8-08ddca074f65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uwmrscUOWFdhjFMHKY4nJTtdvdF/i4qS7hnbomfaowfXLrKqzRd0Hvh57coH?=
 =?us-ascii?Q?xJOJe617ckVKlqFDPty7ZEosmgigznKN9gsQn00xYNXlrDSXJHX7X0DuwuW/?=
 =?us-ascii?Q?1edia7NJBScoyLuWIsbDbneczyvh5dBUnGgpw6POwjDrTCNUOgrWU4h6dEq8?=
 =?us-ascii?Q?KS2hxmeL8j8rOhKRnpNGRK+LU32jLylgKL1YaV4jxXC90oCKbX6IChEDvD7y?=
 =?us-ascii?Q?fIIvWfQuTMtSoF5WdnVMWhLSL0RHaIvZVTjR4vlH2UCoO/t2r21Rxnqm2WlY?=
 =?us-ascii?Q?8OkX2Anyq5jdp7qPfzZAQKm2ouRuTC1V8nB/DF09WUnFgGjkJBy2aDg0AooT?=
 =?us-ascii?Q?54sINxRpNZmZI9v9iI/LMGjxg2PoNxp5aDEOA4xBmeeM79WjDdzidID97Hp9?=
 =?us-ascii?Q?S8GQLi5elDvU/RIi50tqcolLuxPmBVrHaBEr2XztXx0bevEh9zWevbYU086g?=
 =?us-ascii?Q?n3Z5vgNpXG/6XIUvEGT5zcBrpkWN48YO6jFVnHNpNewhemPh6a9nBZ/bYr0h?=
 =?us-ascii?Q?de90PRbllJlR4vBUC/SEXnrGJ5ZQbuNYasd3q6GTyQT8PzXSa8uUFrAHUupD?=
 =?us-ascii?Q?oHFQUQg1Dv9/hHZJ7UPo238FobrDft/IMZa/EbpKnYvAG/LoDxSoLuXwXLjk?=
 =?us-ascii?Q?ag0R0aYnwME4drt3ncYAJUCp7ToiZWItgq6m1iDTfeZgCKPIHrrxER7O+aw3?=
 =?us-ascii?Q?uvRHKt342jl3xOuOTVTUWl1owkmKrWxsU8oDs6HddRHmukdB9C97GsM+iLrO?=
 =?us-ascii?Q?F0+4XXjPmN09OHqHvAfTicc44c/EMbFKa2D+fsEf8+hQmjkyC1hN0PmHzFiz?=
 =?us-ascii?Q?7q3ea6POkloUM3QVrPySC05tzltpU6VrsNrov5vGE2txfUdadDOoqnSSU0T4?=
 =?us-ascii?Q?LjubQ9W5czl6pJ6V9tLRozKqSOCI5IfsFOPBnM7YwpO8d1/T6W5DWc1ExCiu?=
 =?us-ascii?Q?47bHRE8dK/ly8s7J0+LLXAdnd5Rwb3PIb44whuISts8aBHQEUKj0zUKnoCF1?=
 =?us-ascii?Q?vEi5EOkMcxY+PGDWT0k931FZnM+KIxsX37pZm19MJfF953Tq5FEOzVgnx+MR?=
 =?us-ascii?Q?ft2GG4aMjzSaLUgTTNgBbKqDh6zS1ft6+OPa6U/lHwKxp9LVgER9H9w2NAWc?=
 =?us-ascii?Q?K3DVT6v3+6ic0m1me9uZmkSOOQRGqmUvmpdOrdjS0us/FUI/CH/Pb12qCl1i?=
 =?us-ascii?Q?rADfReB2GVNb0GRqoFJkLc+NTEl7l6JSNdTZ2l5+0gPhi/Cn+F3X4qr4hdLJ?=
 =?us-ascii?Q?Qa3sriXOcjL5HNAehv7Qum4YMEhd1XqHREoxmisHU2w20OEwxtpG37prsVAK?=
 =?us-ascii?Q?23g93wboI64nbKCzqfmWxZjDK6ghCHc9KeJOvPkH6Uqge5MMWupZLLQcQ1rb?=
 =?us-ascii?Q?RhDxyqirCl5QQ3f0DP/FXTwA2UuBARGZjX7xWSf7XdC3KrkLv1Mx8TEje89H?=
 =?us-ascii?Q?qCbUtq6RD0cAg7M7IVuqNxfGgNEEChbLqIvG66UATkEyYXeBd2EHiprkzROK?=
 =?us-ascii?Q?wZHxnlJwyZq8vms3oED15s606KElNz7xQ750rFmW5ri4BYAHxSh8ohmTIA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 16:38:10.0774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 401569ca-07cc-4c9b-a9b8-08ddca074f65
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFB9BA66B77

Currently, Xen vPCI refuses BAR writes if the BAR is mapped in p2m. If
firmware initializes a 32-bit BAR to a bad address, Linux may try to
write a new address to the 32-bit BAR without disabling memory decoding.
Since Xen refuses such writes, the BAR (and thus PCI device) will be
non-functional.

Allow the hardware domain to issue 32-bit BAR writes with memory
decoding enabled. This increases the compatibility of PVH dom0 with more
hardware.

Note that Linux aims at disabling memory decoding before writing 64-bit
BARs. Continue to refuse 64-bit BAR writes in Xen while those BARs are
mapped for now to avoid mapping half-updated BARs in p2m.

Take the opportunity to remove a stray newline in bar_write().

Resolves: https://gitlab.com/xen-project/xen/-/issues/197
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v1->v2:
* rework on top of queued BAR map/unmap operation machinery

RFC->v1:
* keep memory decoding enabled in hardware
* allow write while memory decoding is enabled for 32-bit BARs only
* rework BAR mapping machinery to support unmap-then-map operation
---
 xen/drivers/vpci/header.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 1c66796b625b..06c1dbfd5de0 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -404,9 +404,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd,
 
         if ( !MAPPABLE_BAR(bar) ||
              (rom_only ? bar->type != VPCI_BAR_ROM
-                       : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) ||
-             /* Skip BARs already in the requested state. */
-             bar->enabled == !!(cmd & PCI_COMMAND_MEMORY) )
+                       : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) )
             continue;
 
         if ( !pci_check_bar(pdev, _mfn(start), _mfn(end)) )
@@ -650,19 +648,29 @@ static void cf_check bar_write(
         val &= PCI_BASE_ADDRESS_MEM_MASK;
 
     /*
-     * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
-     * writes as long as the BAR is not mapped into the p2m.
+     * Allow 64-bit BAR writes only when the BAR is not mapped in p2m. Always
+     * allow 32-bit BAR writes.
      */
     if ( bar->enabled )
     {
-        /* If the value written is the current one avoid printing a warning. */
-        if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
-            gprintk(XENLOG_WARNING,
-                    "%pp: ignored BAR %zu write while mapped\n",
-                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
-        return;
-    }
+        if ( bar->type == VPCI_BAR_MEM32 )
+        {
+            if ( val == bar->addr )
+                return;
 
+            modify_bars(pdev, pci_conf_read16(pdev->sbdf, PCI_COMMAND),
+                        VPCI_UNMAP, false);
+        }
+        else
+        {
+            /* If the value written is the same avoid printing a warning. */
+            if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
+                gprintk(XENLOG_WARNING,
+                        "%pp: ignored BAR %zu write while mapped\n",
+                        &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
+            return;
+        }
+    }
 
     /*
      * Update the cached address, so that when memory decoding is enabled
@@ -682,6 +690,10 @@ static void cf_check bar_write(
     }
 
     pci_conf_write32(pdev->sbdf, reg, val);
+
+    if ( bar->enabled )
+        modify_bars(pdev, pci_conf_read16(pdev->sbdf, PCI_COMMAND), VPCI_MAP,
+                    false);
 }
 
 static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,
-- 
2.50.1



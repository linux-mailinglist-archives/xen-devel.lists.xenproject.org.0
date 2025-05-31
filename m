Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 912C1AC9B10
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 14:55:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002030.1382084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLLjc-0001Mf-74; Sat, 31 May 2025 12:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002030.1382084; Sat, 31 May 2025 12:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLLjc-0001JU-40; Sat, 31 May 2025 12:54:48 +0000
Received: by outflank-mailman (input) for mailman id 1002030;
 Sat, 31 May 2025 12:54:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L58R=YP=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uLLjZ-0000jq-Sn
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 12:54:45 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20609.outbound.protection.outlook.com
 [2a01:111:f403:2412::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b432af5-3e1e-11f0-b894-0df219b8e170;
 Sat, 31 May 2025 14:54:43 +0200 (CEST)
Received: from BL0PR01CA0026.prod.exchangelabs.com (2603:10b6:208:71::39) by
 MN0PR12MB5857.namprd12.prod.outlook.com (2603:10b6:208:378::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Sat, 31 May
 2025 12:54:35 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:208:71:cafe::7b) by BL0PR01CA0026.outlook.office365.com
 (2603:10b6:208:71::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.25 via Frontend Transport; Sat,
 31 May 2025 12:54:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Sat, 31 May 2025 12:54:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 31 May
 2025 07:54:34 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 31 May
 2025 07:54:34 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 31 May 2025 07:54:33 -0500
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
X-Inumbo-ID: 6b432af5-3e1e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJAIkIVaUbBuWLUFlyUrilG+yo4Sy97coG0SQq3d9JcyUBvBKiaPVBkZmsZ0U6sYYN5Bgl7IN8Wym8Gtjk8TuhJK2Mu24CRBs3aebxIT9kUa5JKBELHRAj5Dh5b3Z2erRO4tzplWFlMSYac3MeWsWs100Hz1j2pxu+3J7QQUva2CAMNyX9sWd0BQd6xHxhioHncOImljhDcoA7mWLPvIU2m+KvxrDY40qe7ip6snJt7av+38JMrHCMkFsotOsvHYMl3UB1d9LNTBMYS8QShfM6s8oLdsxj3WyrlGI1eXeT4p8z55ihLo/MubYNthyF7gvyeU3RTCXgOeJVKzLhvLfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRLlB/4MlTzuE2oawBKxhWDsuNWlyRB6/R+h6IJtbIE=;
 b=oPH/exz9JJrx5D4sjCRnG91ZlUc+t6xP865mtI57aiFAvFZ+01C0mQ/GpCOJS8i0+26QOM8b698aIjzYJ0OBPVO0Iyj/lz+guvzyXCHCG80KX6LLm43leZ+ioT7XAjmO1ADoqVpfyRzCXhuYYxI4oywfnfwKe3Al7mVsed1UKlxM4IUV5V8l4uLzLJ8Fu8FBD4yUg+JMlx2/JeCEUAKeqQ4chuXhv48PcUSZ3MAIYPaJKPfqvgTZf7g/zZCOwGCJ4KtpfXUnW89F4BLDYJuvrWYlmfLFsVkWIZgqanM9SeLnfBsPB1CPojAo+qZnx5XUIGoVXVQxv+/ZtrE2vGKyGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRLlB/4MlTzuE2oawBKxhWDsuNWlyRB6/R+h6IJtbIE=;
 b=d7svcjOjySOn+NTh1RJSEMxi4PuXNgyhuhSaWYWWZ7EL5wWH6mQreOsPedQn5aQ6xRKHXCgzMeTXn4gW8L5gFKRewyNR8cwBC3w0jZfDvrILkRV6TodD4h/03d1wafMpnJf7MJ6w1um1mSDsU3d6uueK4f1QOy7fCJaY0gMMbSQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 4/5] vpci: use separate rangeset for BAR unmapping
Date: Sat, 31 May 2025 08:54:02 -0400
Message-ID: <20250531125405.268984-5-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250531125405.268984-1-stewart.hildebrand@amd.com>
References: <20250531125405.268984-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|MN0PR12MB5857:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c873d21-e470-45de-b9e0-08dda0424b5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7WoNnWjX4ZrMMUPvg2SE4AAvDG90zRtLFdGeKUdYUDpUHxy57CjLh1c0ujh8?=
 =?us-ascii?Q?ltAGTu31q5GQ+XwwhuomTxJNGM2cZuR9xWICSEDXF4XTenEbYPCDT/5uIFgw?=
 =?us-ascii?Q?7h27T+ONFmEhouJMss8UzzEI7Dm2C8LULblOgPHyHTWJTWodhBgotkM5HG5O?=
 =?us-ascii?Q?O4/IwhR1dHtxDf78+JoUSTaxwb9rMhYKC4jZSEFvQB96VHehUnxvl4AAQ6cQ?=
 =?us-ascii?Q?IjWTPCO3Ggl2KFxvUWhl83xiFXiGGXkIav1DrT/p/rP6b8QETzXblO5fkBoE?=
 =?us-ascii?Q?YEYlH3WKPeeek2O9jA+lI1nIyBExFgk8+0MjNy2Pose009QtSGLPN6ObNPsU?=
 =?us-ascii?Q?nv22l8YMuDpsdO70b6QyeQ5VPZOzQKWMkfIIY2XR8Kby+3Ovkq4GXM2kHZRg?=
 =?us-ascii?Q?fgGWN05/p322cKyFGNWmW0spsPdXPibBVNBmbzqMh5VaS7623TNGbE/0i42f?=
 =?us-ascii?Q?0oJJcqLnHD/ZU9pdIpkaEwwfIQirjcBP6iFB00oQq2KeL3NyR1uXnNVOb9ha?=
 =?us-ascii?Q?vF8dgDMjB6rJsnNEBFlDgOUpWXtAjNkGNldq1FKMvztYBOA2assl8QkM9aEa?=
 =?us-ascii?Q?JAUXEkB8ZI1Tp8OyB8K3tm94hRJBFsPpGaCnLNgdt7+RybxejquXblFRMLNj?=
 =?us-ascii?Q?gkbioDc2DZJ23SRZP0/wxytnB+HUfvlywNyelkiQS8cH+uYGV4CG6zY9aBEx?=
 =?us-ascii?Q?VQ2ZLc+uyn8/G7wgfQenXii9dH/YUyW461eg6hNTuJuTANK5h72PGzjH4eWS?=
 =?us-ascii?Q?0TTUhhfHx7Xn0DaKEzFGShZ2Wim7qXbCktzVT3qCVqaseo8gWonfzWo2dU1j?=
 =?us-ascii?Q?9p2/qDOhoLUZz57LZQtGwrDl2sWfh/aTCPKslk7VqsZ+2Px5codAsdOBkPBN?=
 =?us-ascii?Q?KcCjohIMy8x0uGsjW2UzypkkZ8oyDZDS39jT4ZHiRUFA3Kk21AMPsoOqnonN?=
 =?us-ascii?Q?EihH8+hidaUVsxvK65BxL3enge/ZlwykADa7W/rroCtYDgxawGL/299GO3Eu?=
 =?us-ascii?Q?wzxCw/v+JplJMHBJMOsZ3zc4JzIv8N59S6qiqh6P8WW7WvyqCfcSCc37MMC6?=
 =?us-ascii?Q?FnyO0UUX074eWQth2fS8w8ofXjnki+eC7+KYdfgl1xE0livzRNchHMDhMvxp?=
 =?us-ascii?Q?jtiNI++qyD8tSLcm4h57o+bj2+IsXqoKCmJDMoHYxCqxOqu4uZpMlCpr78Nf?=
 =?us-ascii?Q?Fw2dwuOL15KFmHHEclMquFs6U+N94ybmSiaMq0r038joMN0gTvM3FceSM8wN?=
 =?us-ascii?Q?mgkfqlDrJDnDWwD9IiEt+NrM+LyGc6YaAwTyA0JjrjJG6susdH4B+C+glZOv?=
 =?us-ascii?Q?yDBLaMMqcONKm6Fcb09J/QPONYqXcsfSZ829Rd1FwNrrSvD6XnnnczPWsn2X?=
 =?us-ascii?Q?VzyUEU1z/UWQSxZa7PTns3a8lRsjL/f58Num4dPP3Wcn6mSfElMq49C+m9nX?=
 =?us-ascii?Q?QwMCYjqntmFLqElYEkQsJDPNB51u3zcx5ldqA/uozFRbQXKOLqPmBCz77+88?=
 =?us-ascii?Q?lw123vVjPs08cQyXGOSwp4MCGXqngy3J66zg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 12:54:34.8643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c873d21-e470-45de-b9e0-08dda0424b5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5857

Introduce a new per-BAR rangeset, unmap_mem, for p2m unmapping. Rename
existing mem rangeset to map_mem, which is now only used for mapping.
Populate unmap_mem by moving just-mapped ranges from map_mem to
unmap_mem. In modify_bars(), skip recalculating the ranges when
unmapping as they are already stored in unmap_mem.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/drivers/vpci/header.c | 74 +++++++++++++++++++++++++++++----------
 xen/drivers/vpci/vpci.c   |  5 ++-
 xen/include/xen/vpci.h    |  3 +-
 3 files changed, 62 insertions(+), 20 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index b09ccc5e6be6..c9519c804d97 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -90,6 +90,8 @@ static int cf_check map_range(
         if ( rc == 0 )
         {
             *c += size;
+            if ( map->map )
+                rc = rangeset_add_range(map->bar->unmap_mem, s, e);
             break;
         }
         if ( rc < 0 )
@@ -102,6 +104,13 @@ static int cf_check map_range(
         }
         ASSERT(rc < size);
         *c += rc;
+        if ( map->map )
+        {
+            int rc2 = rangeset_add_range(map->bar->unmap_mem, s, s + rc);
+
+            if ( rc2 )
+                return rc2;
+        }
         s += rc;
         if ( general_preempt_check() )
                 return -ERESTART;
@@ -185,12 +194,13 @@ static int map_bars(struct vpci_header *header, struct domain *d, bool map)
             .map = map,
             .bar = bar,
         };
+        struct rangeset *r = map ? bar->map_mem : bar->unmap_mem;
         int rc;
 
-        if ( rangeset_is_empty(bar->mem) )
+        if ( rangeset_is_empty(r) )
             continue;
 
-        rc = rangeset_consume_ranges(bar->mem, map_range, &data);
+        rc = rangeset_consume_ranges(r, map_range, &data);
 
         if ( rc )
             return rc;
@@ -248,8 +258,13 @@ bool vpci_process_pending(struct vcpu *v)
 
     /* Clean all the rangesets */
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
-        if ( !rangeset_is_empty(header->bars[i].mem) )
-             rangeset_purge(header->bars[i].mem);
+    {
+        if ( !rangeset_is_empty(header->bars[i].map_mem) )
+             rangeset_purge(header->bars[i].map_mem);
+
+        if ( !rangeset_is_empty(header->bars[i].unmap_mem) )
+             rangeset_purge(header->bars[i].unmap_mem);
+    }
 
     v->vpci.pdev = NULL;
 
@@ -275,10 +290,10 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
         struct vpci_bar *bar = &header->bars[i];
         struct map_data data = { .d = d, .map = true, .bar = bar };
 
-        if ( rangeset_is_empty(bar->mem) )
+        if ( rangeset_is_empty(bar->map_mem) )
             continue;
 
-        while ( (rc = rangeset_consume_ranges(bar->mem, map_range,
+        while ( (rc = rangeset_consume_ranges(bar->map_mem, map_range,
                                               &data)) == -ERESTART )
         {
             /*
@@ -329,6 +344,13 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
 
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
 
+    if ( !(cmd & PCI_COMMAND_MEMORY) )
+    {
+        defer_map(pdev, cmd, rom_only);
+
+        return 0;
+    }
+
     /*
      * Create a rangeset per BAR that represents the current device memory
      * region and compare it against all the currently active BAR memory
@@ -349,7 +371,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
         unsigned long start_guest = PFN_DOWN(bar->guest_addr);
         unsigned long end_guest = PFN_DOWN(bar->guest_addr + bar->size - 1);
 
-        if ( !bar->mem )
+        if ( !bar->map_mem || !bar->unmap_mem )
             continue;
 
         if ( !MAPPABLE_BAR(bar) ||
@@ -367,7 +389,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             continue;
         }
 
-        ASSERT(rangeset_is_empty(bar->mem));
+        ASSERT(rangeset_is_empty(bar->map_mem));
 
         /*
          * Make sure that the guest set address has the same page offset
@@ -382,7 +404,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             return -EINVAL;
         }
 
-        rc = rangeset_add_range(bar->mem, start_guest, end_guest);
+        rc = rangeset_add_range(bar->map_mem, start_guest, end_guest);
         if ( rc )
         {
             printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
@@ -395,10 +417,10 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
         {
             struct vpci_bar *prev_bar = &header->bars[j];
 
-            if ( rangeset_is_empty(prev_bar->mem) )
+            if ( rangeset_is_empty(prev_bar->map_mem) )
                 continue;
 
-            rc = rangeset_remove_range(prev_bar->mem, start_guest, end_guest);
+            rc = rangeset_remove_range(prev_bar->map_mem, start_guest, end_guest);
             if ( rc )
             {
                 gprintk(XENLOG_WARNING,
@@ -408,7 +430,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             }
         }
 
-        rc = pci_sanitize_bar_memory(bar->mem);
+        rc = pci_sanitize_bar_memory(bar->map_mem);
         if ( rc )
         {
             gprintk(XENLOG_WARNING,
@@ -429,10 +451,10 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
         {
             const struct vpci_bar *bar = &header->bars[j];
 
-            if ( rangeset_is_empty(bar->mem) )
+            if ( rangeset_is_empty(bar->map_mem) )
                 continue;
 
-            rc = rangeset_remove_range(bar->mem, start, end);
+            rc = rangeset_remove_range(bar->map_mem, start, end);
             if ( rc )
             {
                 gprintk(XENLOG_WARNING,
@@ -486,7 +508,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                 {
                     const struct vpci_bar *bar = &header->bars[j];
 
-                    if ( !rangeset_overlaps_range(bar->mem, start, end) ||
+                    if ( !rangeset_overlaps_range(bar->map_mem, start, end) ||
                          /*
                           * If only the ROM enable bit is toggled check against
                           * other BARs in the same device for overlaps, but not
@@ -497,7 +519,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                           bar->type == VPCI_BAR_ROM) )
                         continue;
 
-                    rc = rangeset_remove_range(bar->mem, start, end);
+                    rc = rangeset_remove_range(bar->map_mem, start, end);
                     if ( rc )
                     {
                         gprintk(XENLOG_WARNING,
@@ -752,12 +774,28 @@ static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *bar,
                             unsigned int i)
 {
     char str[32];
+    int rc = 0;
 
     snprintf(str, sizeof(str), "%pp:BAR%u", &pdev->sbdf, i);
 
-    bar->mem = rangeset_new(pdev->domain, str, RANGESETF_no_print);
+    bar->map_mem = rangeset_new(pdev->domain, str, RANGESETF_no_print);
+    bar->unmap_mem = rangeset_new(pdev->domain, str, RANGESETF_no_print);
+
+    if ( !bar->map_mem )
+        rc = -ENOMEM;
+
+    if ( !bar->unmap_mem )
+        rc = -ENOMEM;
 
-    return !bar->mem ? -ENOMEM : 0;
+    if ( rc == -ENOMEM )
+    {
+        rangeset_destroy(bar->map_mem);
+        rangeset_destroy(bar->unmap_mem);
+        bar->map_mem = NULL;
+        bar->unmap_mem = NULL;
+    }
+
+    return rc;
 }
 
 static int cf_check init_header(struct pci_dev *pdev)
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index d2f0f97e0a04..c0198aa1b08d 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -118,7 +118,10 @@ void vpci_deassign_device(struct pci_dev *pdev)
     }
 
     for ( i = 0; i < ARRAY_SIZE(pdev->vpci->header.bars); i++ )
-        rangeset_destroy(pdev->vpci->header.bars[i].mem);
+    {
+        rangeset_destroy(pdev->vpci->header.bars[i].map_mem);
+        rangeset_destroy(pdev->vpci->header.bars[i].unmap_mem);
+    }
 
     xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 27eebdcef170..e74359848440 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -101,7 +101,8 @@ struct vpci {
             uint64_t guest_addr;
             uint64_t size;
             uint64_t resizable_sizes;
-            struct rangeset *mem;
+            struct rangeset *map_mem;
+            struct rangeset *unmap_mem;
             enum {
                 VPCI_BAR_EMPTY,
                 VPCI_BAR_IO,
-- 
2.49.0



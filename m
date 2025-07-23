Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78477B0F842
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 18:38:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054532.1423318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uecTx-0001oq-Gx; Wed, 23 Jul 2025 16:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054532.1423318; Wed, 23 Jul 2025 16:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uecTx-0001nD-D1; Wed, 23 Jul 2025 16:38:17 +0000
Received: by outflank-mailman (input) for mailman id 1054532;
 Wed, 23 Jul 2025 16:38:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3I4v=2E=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uecTw-0001Gm-8w
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 16:38:16 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20606.outbound.protection.outlook.com
 [2a01:111:f403:2412::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ccd8ed2-67e3-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 18:38:14 +0200 (CEST)
Received: from CH2PR07CA0062.namprd07.prod.outlook.com (2603:10b6:610:5b::36)
 by LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 16:38:10 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::60) by CH2PR07CA0062.outlook.office365.com
 (2603:10b6:610:5b::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Wed,
 23 Jul 2025 16:38:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 16:38:10 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 11:38:03 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 11:38:03 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Jul 2025 11:38:02 -0500
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
X-Inumbo-ID: 6ccd8ed2-67e3-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rfP1tYK0MX1VPMxn1SQXhhkKqLDzqXQ4pVhQxdXPKR5PiATHm1kM4I87XY7xo2MGq4vZ6W+nOfhEpQdOLqBD3xC49gpvi4gYnn8HStnxSoV4dMK6YwSKEfKE7zmLExtYcGADonipiRfU7gW8nZRrZ9b1UWolGCVfs4vY4mrmqPxHFY7rastS5Nzq91/MLNctYuLQZZEafc8N8+FxocG2aGqo9bcsRJzrJAtfmL76blkAyPHBlWN3rWavlnm4vmDsissVK3ar9CGde+jW0ri/aOCsMD7Fo+hTbgKj6RFtQ8pUkES0Bzz9V90TxCpOum7vGndxfXPhPIsSpvpUkk6R+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xe9gMIo3gkDd6ETT+xugRqmmoUz50b4pUIRZemnzS2M=;
 b=kK+llIiAC3VuD3kIDPqcczuB06twz0/CE1NqsJs60nP19D5o3jzc0HbDaCQ8ebzNrtoC2z10jTOHSz7N8T+iaxcz0617oj5Gbrbb+wHOakxAVc5qDoT1yawm5f991+CNgZ4i0oDXgugm50Ai7yWee3rRR+Exylcix0BpU8ScbL1FmhlK67BOOgC8n0v43l9rcSYQfze68Gr+atZa0F5zqZJv5HSl6IeVf2ulNUIO2xuMiEcxv8jRDsLcLiSUMcj32PA5a2022RwhWqxASiDkOX+mSVBg5kUh1D8hhz2xeaqJZ+F92OWEp9q0oGlVxTqCPVoiCmqpxOfgX5iweIj85w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xe9gMIo3gkDd6ETT+xugRqmmoUz50b4pUIRZemnzS2M=;
 b=JrES/bGtuZk/gJ6Cw0SExjlK0FzJZUdcFIUrlkcArEM0w3dEki3hDm9GKiAC3DVTkEIQlh8I+IGJHnmKOUjR9g1/PxBe2RLzOPKM7aa9y0sUjeLlDiSnvxnwbjbOfWBVh38GZwBdh1CBII2NZLxlII0ugdwcZXmjCIesDtXqqsk=
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
Subject: [PATCH v2 2/3] vpci: allow BAR map/unmap without affecting memory decoding bit
Date: Wed, 23 Jul 2025 12:37:42 -0400
Message-ID: <20250723163744.13095-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723163744.13095-1-stewart.hildebrand@amd.com>
References: <20250723163744.13095-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|LV5PR12MB9779:EE_
X-MS-Office365-Filtering-Correlation-Id: 68ea07c1-2f8c-4d74-94ce-08ddca074f61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HHjnhPINSrHtZcNn0lmpaoi4yutsNw6Nn9n+DES6DfhFlyCyBTAtxELZ0ui9?=
 =?us-ascii?Q?DUVRYlb1P9O7aSwJlBo8Qh0qGRyl6a4G9KYNNHKCoxHIXT/EIqfQ0JVpXpTD?=
 =?us-ascii?Q?OYllD4pwmTt88I3q6NIbbOyQ9ixbRe0qTXU9cSPGu9mp9V7uGX0SvFnwGczz?=
 =?us-ascii?Q?dUcdApfz8kRkqYbJTPl1JVOFbUUBaYbMuj8K2UIL9a1/OB+ESYVHZ6fyG0Sv?=
 =?us-ascii?Q?7HtfZZZshojkHDDD/f28I/R3qc+6LeK5InRnkGQ2qmg259Sj02Qlw5BdXejv?=
 =?us-ascii?Q?M7WhQoP4jqKauPUN7dd2xuAq+yUTIDMBbeSHrkudl+WFEJFVKl8Nk6yNYKYM?=
 =?us-ascii?Q?pfOzt0hZA+rwBK9+SNMLBaGNQ7c0TJdSMVKbxI1z43l9KW1t1pob0iGLeT0N?=
 =?us-ascii?Q?JDa1B5XIHDnBynbl5C2+uSvUTmuhO9bRB3BN29t+7rG65JjzZeCUITwSGA6T?=
 =?us-ascii?Q?KbhIvQW14XigGWt4d1DRC5bQTcaAJvr1IJYx99qtewEPmNinkLmFU6aN1Jpx?=
 =?us-ascii?Q?bVlOFhVyB6CSyjXR1RirWv3RJ8bYehBTOjpGbnkmWUb91jqAALX2pIslfUik?=
 =?us-ascii?Q?/2vIlWSM/cxkx/ybabD6NXwI8sBUo4fGpsdFp2C3M13kLcszb/16TGhl7frE?=
 =?us-ascii?Q?iZFB78T7pUIyDaBIEIw6wEGLRbss+p/SGIm9fFYQNXtdPIGWboNHX0dp/LYO?=
 =?us-ascii?Q?oMJ7LyFRWjGOAstKzYus66TvVRkjatudjHJmd0elWsrWbYF+4SrW2Ie3sbdo?=
 =?us-ascii?Q?XTqhk2qPUc00qeDpHK0Xkzvo2DM91v2Jvjv4/EmDlgOoxNbZELKS9PqN9e2X?=
 =?us-ascii?Q?F5EAr+b95PKZyaTdO8GroZV2BY4xehc4O7KWJgNoBugGe4QECyI1RUDIRSFZ?=
 =?us-ascii?Q?4y0MPncMQOGC3aK6zkGkyyszHSccU0Nrc9uOG1Uw6IWW1YNZHYuJhS9PsRN1?=
 =?us-ascii?Q?q+SbXe6zjaKdTVfiTfPhDQLpT2DvDeBcnX9kfQxLUYLOnLV3xW51IznM85+o?=
 =?us-ascii?Q?LhtqykPxXeiJsixPhfaqlTx+4apUi8MA7fh78+Qsv+3bLQX6X8CIPCtKJhfq?=
 =?us-ascii?Q?vY2q3i+JNOc0z0+Rp4cJUWIo5yZgJYDD2RGL0xJxC9eYaG5KrOyQ/nGynSxb?=
 =?us-ascii?Q?8YOobUt4x/EQz362gvW4EjlpS6WKGMJHYHgDyC6GJZhbaur7v9EvZ3iVKclG?=
 =?us-ascii?Q?nZtwmVHT4DAjNWleePvR3x8vM0L+2Dzem8tC3J9FH9TPL9F9W96SXOU/jQ2D?=
 =?us-ascii?Q?CBfpH2vskAiror45MdHSMQT4rdUnog9oYEF4JiHNusm0q7rvMPI4y9R26V5m?=
 =?us-ascii?Q?rChmM53iinzMqNewa7f+tRRJUGPY80W5VkCmaoHPvk01Ue7jWXepzSN8FB9l?=
 =?us-ascii?Q?slDra/i+fAAjaI92/BqXOceO8S8vXzSpXuOiZXJtiT5mqR8YHsOb5F6ePnOq?=
 =?us-ascii?Q?fY7myzUq+3QHnSK9QbonKeD6eZ6Tw7gS/uTQS9uZ/gJR4tJQ3+nrRUITvllv?=
 =?us-ascii?Q?msc20dVRv/5qK9ewKg8J8Gwb3Sxr8eU5o9oF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 16:38:10.1301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ea07c1-2f8c-4d74-94ce-08ddca074f61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9779

Introduce enum vpci_map_op and allow invoking modify_bars() without
changing the memory decoding bit.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v1->v2:
* new patch
---
 xen/drivers/vpci/header.c | 22 +++++++++++++++-------
 xen/include/xen/vpci.h    |  4 ++++
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index df065a5f5faf..1c66796b625b 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -189,7 +189,7 @@ static bool vpci_process_map_task(struct vpci_map_task *task)
         struct vpci_bar_map *bar = &task->bars[i];
         struct map_data data = {
             .d = task->domain,
-            .map = task->cmd & PCI_COMMAND_MEMORY,
+            .map = task->map_op == VPCI_MAP,
             .bar = bar,
         };
         int rc;
@@ -298,7 +298,9 @@ static int __init apply_map(struct vpci_map_task *task)
 }
 
 static struct vpci_map_task *alloc_map_task(const struct pci_dev *pdev,
-                                            uint16_t cmd, bool rom_only)
+                                            uint16_t cmd,
+                                            enum vpci_map_op map_op,
+                                            bool rom_only)
 {
     struct vpci_map_task *task = xzalloc(struct vpci_map_task);
     unsigned int i;
@@ -333,6 +335,7 @@ static struct vpci_map_task *alloc_map_task(const struct pci_dev *pdev,
     task->pdev = pdev;
     task->domain = pdev->domain;
     task->cmd = cmd;
+    task->map_op = map_op;
     task->rom_only = rom_only;
 
     return task;
@@ -359,13 +362,14 @@ static void defer_map(struct vpci_map_task *task)
     raise_softirq(SCHEDULE_SOFTIRQ);
 }
 
-static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
+static int modify_bars(const struct pci_dev *pdev, uint16_t cmd,
+                       enum vpci_map_op map_op, bool rom_only)
 {
     struct vpci_header *header = &pdev->vpci->header;
     struct pci_dev *tmp;
     const struct domain *d;
     const struct vpci_msix *msix = pdev->vpci->msix;
-    struct vpci_map_task *task = alloc_map_task(pdev, cmd, rom_only);
+    struct vpci_map_task *task = alloc_map_task(pdev, cmd, map_op, rom_only);
     unsigned int i, j;
     int rc;
 
@@ -614,7 +618,8 @@ static void cf_check cmd_write(
          * memory decoding bit has not been changed, so leave everything as-is,
          * hoping the guest will realize and try again.
          */
-        modify_bars(pdev, cmd, false);
+        modify_bars(pdev, cmd, cmd & PCI_COMMAND_MEMORY ? VPCI_MAP : VPCI_UNMAP,
+                    false);
     else
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
@@ -782,7 +787,8 @@ static void cf_check rom_write(
      * Pass PCI_COMMAND_MEMORY or 0 to signal a map/unmap request, note that
      * this fabricated command is never going to be written to the register.
      */
-    else if ( modify_bars(pdev, new_enabled ? PCI_COMMAND_MEMORY : 0, true) )
+    else if ( modify_bars(pdev, new_enabled ? PCI_COMMAND_MEMORY : 0,
+                          new_enabled ? VPCI_MAP : VPCI_UNMAP, true) )
         /*
          * No memory has been added or removed from the p2m (because the actual
          * p2m changes are deferred in defer_map) and the ROM enable bit has
@@ -1067,7 +1073,9 @@ static int cf_check init_header(struct pci_dev *pdev)
             goto fail;
     }
 
-    return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
+    return (cmd & PCI_COMMAND_MEMORY)
+           ? modify_bars(pdev, cmd, VPCI_MAP, false)
+           : 0;
 
  fail:
     pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index c2e75076691f..fb6cad62d418 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -205,6 +205,10 @@ struct vpci_map_task {
         struct rangeset *mem;
     } bars[PCI_HEADER_NORMAL_NR_BARS + 1];
     uint16_t cmd;
+    enum vpci_map_op {
+        VPCI_MAP,
+        VPCI_UNMAP,
+    } map_op;
     bool rom_only : 1;
 };
 
-- 
2.50.1



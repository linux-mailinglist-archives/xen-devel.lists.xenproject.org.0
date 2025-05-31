Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 138ADAC9B13
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 14:55:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002032.1382095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLLje-0001ec-G1; Sat, 31 May 2025 12:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002032.1382095; Sat, 31 May 2025 12:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLLje-0001dE-BR; Sat, 31 May 2025 12:54:50 +0000
Received: by outflank-mailman (input) for mailman id 1002032;
 Sat, 31 May 2025 12:54:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L58R=YP=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uLLjd-0008IU-Bn
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 12:54:49 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20606.outbound.protection.outlook.com
 [2a01:111:f403:2412::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f334c24-3e1e-11f0-a300-13f23c93f187;
 Sat, 31 May 2025 14:54:48 +0200 (CEST)
Received: from BL6PEPF00016414.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:c) by SJ5PPF7B9E98CB6.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::99a) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Sat, 31 May
 2025 12:54:41 +0000
Received: from BL02EPF00029929.namprd02.prod.outlook.com
 (2a01:111:f403:c922::2) by BL6PEPF00016414.outlook.office365.com
 (2603:1036:903:4::a) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Sat,
 31 May 2025 12:54:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00029929.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Sat, 31 May 2025 12:54:40 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 31 May
 2025 07:54:39 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 31 May
 2025 07:54:39 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 31 May 2025 07:54:38 -0500
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
X-Inumbo-ID: 6f334c24-3e1e-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7JZaOLHJ3H1PzknsycPo8EDku8ZSENiC+nBrPgChrCjUI1mOAcFXYQ//fZVz/xAYGpICweBEfLmiIjsqM5Bae5HEz6olmiuQNWL5zdr3jVGvmcs0B47S8+Kgkg1RSmD/O4USvvYgulUi5m8ftrS6U8h3AoklOa+XCU1utTuKuRC+qtR9sQ7Rb1D+RPmoinFnfE4TfViCNJavzIW+C9lGO2ObQ4v5kYDWLwL2GPWSor47WPjVUOw0TCOEVAaQbFb+kWQFpdBCXNRCVrgU5V4ULlrTZWBilKGwghWkJL9bIepwrIEZABU5x1VaOf3H6cZuSccdrDlK5EvbDEydHMVtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rI8UnhNOrjv0t84mgaR1iGWPmAZvLMQm08nsNuTMTw=;
 b=CI3WYmiTWX8xOrrwM6G8RQhuw2q1/jqNYZbxobFTz61KhCd3KH4/Zp8Qyg8OL9xxmLVFKvzjXGo9nV9bfrlkBZJD0VZhAmimWGKnIUO9E0s3ivgvIUaOWLBXHfLo1tk/yqka3yP+5QzjUzqcPw5H9mKfntyr1f9+rC378xbGR0ncLhuMmddEcK2HUrjor5nDjDg7Y2zkWX9wFqESwMQFtA/rs0i3umqHJ6fhrwWmwaMmhu7bnLnc7tJAMams2AFxQvwL2ChGW3nNyET9+pjIV3/F1sZhzsFNgs+A+N9tdtlQAttyu+h1j16HhzPFW5rR2/pVwsfGvqoIOYT5/3sGfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rI8UnhNOrjv0t84mgaR1iGWPmAZvLMQm08nsNuTMTw=;
 b=Ea8ti5lNO+JtMZMhC6eEX+6n0Ld2icdT5t3dVewJMRatqDaoTDRamNwTZsRf38bJvrYjDgiWCg6AFH5HtI2hFDfSSkDOYWEq+7p81MQOddKtey44ldNfh3XlDFm+MFfl7frBYNDauHv4B10x/jkYcrLc4r7gKmhd/91xZFi9HSg=
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
Subject: [PATCH v1 5/5] vpci: allow 32-bit BAR writes with memory decoding enabled
Date: Sat, 31 May 2025 08:54:03 -0400
Message-ID: <20250531125405.268984-6-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250531125405.268984-1-stewart.hildebrand@amd.com>
References: <20250531125405.268984-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029929:EE_|SJ5PPF7B9E98CB6:EE_
X-MS-Office365-Filtering-Correlation-Id: 05757956-fbb6-4eeb-cc03-08dda0424e86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8ceTcrfjKC8POQ00hCBahmBS995brB5K3F/O2aIpNwLc3rQaDepXyEcK7kCw?=
 =?us-ascii?Q?Qb84j/s6nH4aWOPMWdz9+/JtFlaN7Azvp4ApAaOCWRijXKXvAj5u/4KazisK?=
 =?us-ascii?Q?s0+NJP0vR2ynNYDA/d5TikdoZChUvAw4Q/hN68Rub1XC/qCyHqy7qxs57Ldb?=
 =?us-ascii?Q?Ppt9gK0lPiZxYw1qjsuodEsevsIahEs/PXxKNhxjNjDrkrC2KFGc05lXp9kL?=
 =?us-ascii?Q?6aW8Za+Jm1sQuvMrd3HVLmyTLqrZS2dxuM6XhWbgjqwP9zKDcZ1kMfinX3dU?=
 =?us-ascii?Q?I3/cSxYbPO1I922KyaYR3Qx85GmGUr/cYabMidp7i/Zw/d8bXQIH1NzttZXD?=
 =?us-ascii?Q?JNbrE1EpAeiM4MUo4DG32rgg39gj9eD0ciGR/fV2w9kzn1Fieadjsvu/pJ+R?=
 =?us-ascii?Q?onOMehQofUBGAt2rl1OW2ia8muNvMAMcfMAfukOfeuUe8QnyabF9so7rifkX?=
 =?us-ascii?Q?hHhk6xP5D8MSoV+hDlML16R/j3fMOBXfhU0bs148NU+lP3l5Dbc48d1sGrkm?=
 =?us-ascii?Q?rzMD8n3CCztUpS38rAa4i/1tzDam/XgYkxKBSf4A79waw1xPe+XOxAUHVCfG?=
 =?us-ascii?Q?02EJiuJsoFfRMMKFKQwyjciWUl0uUD2APiatzmMSwZibQ5/sdj8B5bEbushW?=
 =?us-ascii?Q?J8+CDMGFp13uz67hFqYJUnqh2K5S/Hig2LBo+0A4/OskHYI57l9MtzL7epnu?=
 =?us-ascii?Q?5nTEKHuEnVgOlgEcjaZ0gOkR0lGobFHKJV9Wl1I8Ai3A0pxc0E2fv6Z2qXOm?=
 =?us-ascii?Q?CF9E0mnonxVhxo8BTYMrQGeoApFi1exVa0IWBEfxY0+Y6zVvEUlvSWlDUSFz?=
 =?us-ascii?Q?m+JD4xYHa80cxJQMocDLhbgw3VxYXKewtsxEgRlP9pHEUE/JLVlexNCwAztj?=
 =?us-ascii?Q?Eqt15AoATjjJZPzfLxZg3aZnTGGf7C/I861F6crw0nl/+N/HNLfIRRN7iw99?=
 =?us-ascii?Q?EhKyeoJK2nV9h2SjwcW4bN/1oJ1gtES1esFLwMnyOyBeBiuqtKJhym37Z1yv?=
 =?us-ascii?Q?ZE1ySkcUJxNo+04RV6Qb9SP4cKZNXN/aqBA3Qu7lkrKPOym3/zOgbO3Ww8yb?=
 =?us-ascii?Q?kv9OesOgLOQKdof5psu60Ucwt6Ior3HP1ayNuA0Npi9i7K6Pt597b/DOw2WP?=
 =?us-ascii?Q?U6n/wuDdmEh+A6GYiUeJNmNKaZSGREa8Lh3yWmp0oLKeb8rZWpu2OfCqyvw7?=
 =?us-ascii?Q?Qu5W3LntnSeyCT81i3ziNyhxGUnfi2S6kyu7vGI+AUOqJbgNSd3C4eGzQG0e?=
 =?us-ascii?Q?cYrvbJHI0z3rUk+20QbHwmFTtZ4Z7IjVEP/YkGVswSzGYWFCOs39Xc/+A2ua?=
 =?us-ascii?Q?hK6PkutuM/LL6x8fuT3yCgiemJnSYxXHWT0fd4BdJjUXFrLsQDE/LS5dbXmt?=
 =?us-ascii?Q?RSQ8QDtIfWO8HR0FP2e7pTN225XXvsC/F6hJ8ULcM7FO52yTVOpqWS6IclMS?=
 =?us-ascii?Q?RiUPwKz4+07EC7io5yPIM+IWWIk3Um8P21YoeZRZk3m+8zkdbA0zTA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 12:54:40.1799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05757956-fbb6-4eeb-cc03-08dda0424e86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029929.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7B9E98CB6

Currently, Xen vPCI refuses BAR writes if the BAR is mapped in p2m. If
firmware initializes a 32-bit BAR to a bad address, Linux may try to
write a new address to the BAR without disabling memory decoding. Since
Xen refuses such writes, the BAR (and thus PCI device) will be
non-functional.

Currently the deferred mapping machinery supports only map or unmap
operations. Rework the deferred mapping machinery to support
unmap-then-map (VPCI_MOVE) operations.

Allow the hardware domain to issue 32-bit BAR writes with memory
decoding enabled, using the VPCI_MOVE operation to remap the BAR in p2m.

Take the opportunity to remove a stray newline in bar_write().

Resolves: https://gitlab.com/xen-project/xen/-/issues/197
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
RFC->v1:
* keep memory decoding enabled in hardware
* allow write while memory decoding is enabled for 32-bit BARs only
* rework BAR mapping machinery to support unmap-then-map operation
---
 xen/drivers/vpci/header.c | 86 +++++++++++++++++++++++++++------------
 xen/include/xen/vpci.h    |  5 +++
 2 files changed, 66 insertions(+), 25 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index c9519c804d97..f2ffad2ace32 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -214,7 +214,6 @@ bool vpci_process_pending(struct vcpu *v)
     const struct pci_dev *pdev = v->vpci.pdev;
     struct vpci_header *header = NULL;
     unsigned int i;
-    int rc;
 
     if ( !pdev )
         return false;
@@ -229,16 +228,34 @@ bool vpci_process_pending(struct vcpu *v)
     }
 
     header = &pdev->vpci->header;
-    rc = map_bars(header, v->domain, v->vpci.cmd & PCI_COMMAND_MEMORY);
 
-    if ( rc == -ERESTART )
+    if ( v->vpci.map_op == VPCI_UNMAP || v->vpci.map_op == VPCI_MOVE )
     {
-        read_unlock(&v->domain->pci_lock);
-        return true;
+        int rc = map_bars(header, v->domain, false);
+
+        if ( rc == -ERESTART )
+        {
+            read_unlock(&v->domain->pci_lock);
+            return true;
+        }
+
+        if ( rc )
+            goto fail;
     }
 
-    if ( rc )
-        goto fail;
+    if ( v->vpci.map_op == VPCI_MAP || v->vpci.map_op == VPCI_MOVE )
+    {
+        int rc = map_bars(header, v->domain, true);
+
+        if ( rc == -ERESTART )
+        {
+            read_unlock(&v->domain->pci_lock);
+            return true;
+        }
+
+        if ( rc )
+            goto fail;
+    }
 
     v->vpci.pdev = NULL;
 
@@ -312,7 +329,8 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
     return rc;
 }
 
-static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
+static void defer_map(const struct pci_dev *pdev, uint16_t cmd,
+                      enum vpci_map_op map_op, bool rom_only)
 {
     struct vcpu *curr = current;
 
@@ -324,6 +342,7 @@ static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
      */
     curr->vpci.pdev = pdev;
     curr->vpci.cmd = cmd;
+    curr->vpci.map_op = map_op;
     curr->vpci.rom_only = rom_only;
     /*
      * Raise a scheduler softirq in order to prevent the guest from resuming
@@ -333,7 +352,8 @@ static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
     raise_softirq(SCHEDULE_SOFTIRQ);
 }
 
-static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
+static int modify_bars(const struct pci_dev *pdev, uint16_t cmd,
+                       enum vpci_map_op map_op, bool rom_only)
 {
     struct vpci_header *header = &pdev->vpci->header;
     struct pci_dev *tmp;
@@ -344,9 +364,9 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
 
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
 
-    if ( !(cmd & PCI_COMMAND_MEMORY) )
+    if ( map_op == VPCI_UNMAP )
     {
-        defer_map(pdev, cmd, rom_only);
+        defer_map(pdev, cmd, map_op, rom_only);
 
         return 0;
     }
@@ -378,7 +398,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
              (rom_only ? bar->type != VPCI_BAR_ROM
                        : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) ||
              /* Skip BARs already in the requested state. */
-             bar->enabled == !!(cmd & PCI_COMMAND_MEMORY) )
+             (bar->enabled == !!(cmd & PCI_COMMAND_MEMORY) &&
+              map_op != VPCI_MOVE) )
             continue;
 
         if ( !pci_check_bar(pdev, _mfn(start), _mfn(end)) )
@@ -551,7 +572,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
         return apply_map(pdev->domain, pdev, cmd);
     }
 
-    defer_map(pdev, cmd, rom_only);
+    defer_map(pdev, cmd, map_op, rom_only);
 
     return 0;
 }
@@ -584,7 +605,8 @@ static void cf_check cmd_write(
          * memory decoding bit has not been changed, so leave everything as-is,
          * hoping the guest will realize and try again.
          */
-        modify_bars(pdev, cmd, false);
+        modify_bars(pdev, cmd, cmd & PCI_COMMAND_MEMORY ? VPCI_MAP : VPCI_UNMAP,
+                    false);
     else
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
@@ -615,20 +637,27 @@ static void cf_check bar_write(
         val &= PCI_BASE_ADDRESS_MEM_MASK;
 
     /*
-     * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
-     * writes as long as the BAR is not mapped into the p2m.
+     * Allow 64-bit BAR writes only when the BAR is not mapped in p2m. Always
+     * allow 32-bit BAR writes, but skip unnecessary p2m operations when mapped.
      */
     if ( bar->enabled )
     {
-        /* If the value written is the current one avoid printing a warning. */
-        if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
-            gprintk(XENLOG_WARNING,
-                    "%pp: ignored BAR %zu write while mapped\n",
-                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
-        return;
+        if ( bar->type == VPCI_BAR_MEM32 )
+        {
+            if ( val == bar->addr )
+                return;
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
     }
 
-
     /*
      * Update the cached address, so that when memory decoding is enabled
      * Xen can map the BAR into the guest p2m.
@@ -647,6 +676,10 @@ static void cf_check bar_write(
     }
 
     pci_conf_write32(pdev->sbdf, reg, val);
+
+    if ( bar->enabled )
+        modify_bars(pdev, pci_conf_read16(pdev->sbdf, PCI_COMMAND), VPCI_MOVE,
+                    false);
 }
 
 static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,
@@ -752,7 +785,8 @@ static void cf_check rom_write(
      * Pass PCI_COMMAND_MEMORY or 0 to signal a map/unmap request, note that
      * this fabricated command is never going to be written to the register.
      */
-    else if ( modify_bars(pdev, new_enabled ? PCI_COMMAND_MEMORY : 0, true) )
+    else if ( modify_bars(pdev, new_enabled ? PCI_COMMAND_MEMORY : 0,
+                          new_enabled ? VPCI_MAP : VPCI_UNMAP, true) )
         /*
          * No memory has been added or removed from the p2m (because the actual
          * p2m changes are deferred in defer_map) and the ROM enable bit has
@@ -1054,7 +1088,9 @@ static int cf_check init_header(struct pci_dev *pdev)
             goto fail;
     }
 
-    return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
+    return (cmd & PCI_COMMAND_MEMORY)
+           ? modify_bars(pdev, cmd, VPCI_MAP, false)
+           : 0;
 
  fail:
     pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index e74359848440..2ddfb147e7b7 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -197,6 +197,11 @@ struct vpci_vcpu {
     /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
     const struct pci_dev *pdev;
     uint16_t cmd;
+    enum vpci_map_op {
+        VPCI_MAP,
+        VPCI_UNMAP,
+        VPCI_MOVE,
+    } map_op;
     bool rom_only : 1;
 };
 
-- 
2.49.0



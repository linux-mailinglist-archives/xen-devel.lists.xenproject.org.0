Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B60C9AC9B12
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 14:55:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002025.1382075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLLjU-0000pL-VF; Sat, 31 May 2025 12:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002025.1382075; Sat, 31 May 2025 12:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLLjU-0000mA-RC; Sat, 31 May 2025 12:54:40 +0000
Received: by outflank-mailman (input) for mailman id 1002025;
 Sat, 31 May 2025 12:54:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L58R=YP=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uLLjT-0000jq-B7
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 12:54:39 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20622.outbound.protection.outlook.com
 [2a01:111:f403:2412::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6777e1e2-3e1e-11f0-b894-0df219b8e170;
 Sat, 31 May 2025 14:54:37 +0200 (CEST)
Received: from BL0PR01CA0002.prod.exchangelabs.com (2603:10b6:208:71::15) by
 CYYPR12MB8871.namprd12.prod.outlook.com (2603:10b6:930:c2::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.31; Sat, 31 May 2025 12:54:30 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:208:71:cafe::a2) by BL0PR01CA0002.outlook.office365.com
 (2603:10b6:208:71::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Sat,
 31 May 2025 12:54:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Sat, 31 May 2025 12:54:29 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 31 May
 2025 07:54:29 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 31 May
 2025 07:54:28 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 31 May 2025 07:54:28 -0500
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
X-Inumbo-ID: 6777e1e2-3e1e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZIYBJnmI5KT0rI79mVxn1+1/uKeGa03IpFCrk6FmFsWoHXLpyEe+CjuOCuTxBeCTCRHAXAdRr80V7OyK4c6WQ1kDRVIQ+asif5iYL+LimAFrg4vLBsLTU8qOQjOAWFXsxc5WCucAaPkRshdtsoNLQEc30sb2qaUU3+nEkVlgey0SBlIqOk7K+xydaxctEB1YACA8uIma49eUMlUAbFnIpokiz7jPrzpx7CIhcliUCfoT/cw5HDUeyqZQK01BYojFOSP8In5ReJ24A69JT51PYmJV0lbBVyuhzbrLrxnnVl1bDvw8mSPar+msprFQG0lF/oEKLugz+9kR1evBjNLJ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSKZrMr2YteCMaQlPNeKwVgUDT7zaH5OzY0UNxxx8gM=;
 b=iTZL2e90ezOVZuRsA1LHpAn71lzLETktA5vfjnUjF+ttX0Lngdvsx6lZG3j4/CnOysPj0Zqk8AttvswfcOQU8opSvU1sdCsKGfaGeFM0dLufQoJLKS5ay7+NMQ7vZPcOoTlcAfeaMEYBLeEc/2SfE2dtCUNvHbBRdoHChPlUfiItsgzLQkrNsIcK1o9MZ6/BGKrPmi+gTQ14AiBrE4qwdSUHUCP9T86wP11RehErV7FpoOeXk4j15+5wda14wfdldnP8qSKswT1vREVuoF0XgYN0cxPAh0210+hW5gN3fhI9JytSGYBsEM7UHIVNh+me7/SpxpFzlrgJKw6zi8zdAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSKZrMr2YteCMaQlPNeKwVgUDT7zaH5OzY0UNxxx8gM=;
 b=ZBxrfxFoVrCjPvEiyx8g7aWKVnuI6ixoPboQsXRQPfbRN7OtvrDeRz1QIvE3op8x/Un8cVte5tV6Kgj22mto4Fmaf0Pji/3h6JQHdbJusOE2g0Z5u13SLuF9NSaWDJcef0ApsXY1Quxf2WIXPw70KibZZTxJhiG5GG760tAeVVU=
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
Subject: [PATCH v1 3/5] vpci: introduce map_bars()
Date: Sat, 31 May 2025 08:54:01 -0400
Message-ID: <20250531125405.268984-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250531125405.268984-1-stewart.hildebrand@amd.com>
References: <20250531125405.268984-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|CYYPR12MB8871:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b81dfba-47e9-43ef-b997-08dda0424838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MhQ7I7+8XB8ol+bznIDs8sOq9qKt8pSxEV0mlRwQq3/217JqHWK5uBofbZ/H?=
 =?us-ascii?Q?SscocFDngHJBf8xzEvBWvHc9IQ/8O2jFfDzM9X+T8anE86F8e7zkroRj8qXY?=
 =?us-ascii?Q?5uM3+kNaiNwhsEt60EF3KTy3sXx4IUlaKcfnarrU/o5Ey/cINwMZRXd/iMXZ?=
 =?us-ascii?Q?ZKJ8OtCZ0AwsI8pwKgr5BxVu9GMlxICeXP5aYzLQCs4PNKoJuvOCGMJElMcg?=
 =?us-ascii?Q?NNwvWd4GHd06vUGN3gaPayuhSyhxPN7QOLpOINuIxfjnIlyXU/C5oujVilEi?=
 =?us-ascii?Q?2Ew7Osnvcrc2V3MKkw2KPBZt9tfWtutAdVRopq+PHMc3hfJNt1jwcGhDHk6F?=
 =?us-ascii?Q?LjUCCS8iNen10q72LNA5ECV9/GNkXKPW20NwFdqL3iRxyQ84NK2euJrtC/1L?=
 =?us-ascii?Q?2zaMqR49Ekqy19K4g6auFLh+dSLvE5Pi3J/8uMCqlZXmjQW/hMCngG4XxbNt?=
 =?us-ascii?Q?X6wrgNmZHOBtLW8ae3e116C7CD+/WUYU+l8sZiuyjNQS0egby7WHVDj5RdHK?=
 =?us-ascii?Q?0mzrEsBwVAH9BlaVlGAogdgT60zXeUSunfN+z7Bz+hx6bQK64YNgPtyyGECl?=
 =?us-ascii?Q?Y0uZ9BBwJmCggkqqlnV8E4sWOAfBICt7oZm8pSIQ0FZv6mRHUaGymWHfnXe5?=
 =?us-ascii?Q?O+r6X3u54XWARp04rMv6pRe20WdcAhmh4Knff58mHu04/oMSgAZ6ZHvRDxTR?=
 =?us-ascii?Q?7Eu5AEMmhwSDLohaX5kmLgnFstbJ+ja+iP7V4Qoj5HVhuz/pFyqi6QNG8odA?=
 =?us-ascii?Q?mHrP7XdCepT1uWY1LBRvko+HFttjlZyjazq1yNUFCHORp7kNKms5FwXopQzF?=
 =?us-ascii?Q?n99jYZX+wrbh1AqmWzMgFC6QinHaY8En2qW/d9Ep06LSPz+FsCsGYa8mw/8f?=
 =?us-ascii?Q?VuuMbuHPFL501cssVDDNuGuabx6PAnKhJPZrzku471iypypEAiqPzulI1Byu?=
 =?us-ascii?Q?3K/2D/cCcmlFfQQWS3zXidIuIU4hWZSOVkk2vr40f2krmnq99sVWiau+gfsx?=
 =?us-ascii?Q?gk96wtPIFSAYc+ao9+d9WUPjMfY7s2iVXpqfk+mRXm5fMkDJMvLUr70Vi7Nl?=
 =?us-ascii?Q?O/sDHk5RJbcihBrzTMIazdzWhhIZGBcwS3Mq3AeV0lvmyti7CzQjf/BOOuCI?=
 =?us-ascii?Q?4uywSJNBUsXijyqhZnAfcyCYoHmLuXpaPF3gTYxEZRUn8AhiEolm2lwON3ox?=
 =?us-ascii?Q?zc/ed95nq/AkXc3NqxaOKuiovuXk4bnyKwCy8J2IvxzpSALeE6mQbV0utc1P?=
 =?us-ascii?Q?fLAEyxWcaPNt7cHBXQtDmxh7sCEnqNvpdMkaaJOW3erK5021CYctqdc+wL1E?=
 =?us-ascii?Q?2RlWYtEgtov0YVe1xWN87ysOpCYvSGYurTwH5PXP/+DPO05136uidGnViZ5o?=
 =?us-ascii?Q?ChchNmurVgOQ4YrYDGtDnwWqouZHTxX0Va3FSlX64OJL2Hy3or+gz0L62w1E?=
 =?us-ascii?Q?XoeKY/HUK7vBb4P8zsQqvUUOyW8kF3R6PGEpSlKgnFCFkql5ZhND0dawK4Zu?=
 =?us-ascii?Q?gfZGAttsUhqwkxQNGFR93MzOgxSg1W5wlaBm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 12:54:29.6002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b81dfba-47e9-43ef-b997-08dda0424838
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8871

Move some logic to a new function to enable code reuse.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/drivers/vpci/header.c | 56 ++++++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 21 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index c1463d2ce076..b09ccc5e6be6 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -173,11 +173,38 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
         ASSERT_UNREACHABLE();
 }
 
+static int map_bars(struct vpci_header *header, struct domain *d, bool map)
+{
+    unsigned int i;
+
+    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
+    {
+        struct vpci_bar *bar = &header->bars[i];
+        struct map_data data = {
+            .d = d,
+            .map = map,
+            .bar = bar,
+        };
+        int rc;
+
+        if ( rangeset_is_empty(bar->mem) )
+            continue;
+
+        rc = rangeset_consume_ranges(bar->mem, map_range, &data);
+
+        if ( rc )
+            return rc;
+    }
+
+    return 0;
+}
+
 bool vpci_process_pending(struct vcpu *v)
 {
     const struct pci_dev *pdev = v->vpci.pdev;
     struct vpci_header *header = NULL;
     unsigned int i;
+    int rc;
 
     if ( !pdev )
         return false;
@@ -192,30 +219,17 @@ bool vpci_process_pending(struct vcpu *v)
     }
 
     header = &pdev->vpci->header;
-    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
-    {
-        struct vpci_bar *bar = &header->bars[i];
-        struct map_data data = {
-            .d = v->domain,
-            .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
-            .bar = bar,
-        };
-        int rc;
-
-        if ( rangeset_is_empty(bar->mem) )
-            continue;
+    rc = map_bars(header, v->domain, v->vpci.cmd & PCI_COMMAND_MEMORY);
 
-        rc = rangeset_consume_ranges(bar->mem, map_range, &data);
+    if ( rc == -ERESTART )
+    {
+        read_unlock(&v->domain->pci_lock);
+        return true;
+    }
 
-        if ( rc == -ERESTART )
-        {
-            read_unlock(&v->domain->pci_lock);
-            return true;
-        }
+    if ( rc )
+        goto fail;
 
-        if ( rc )
-            goto fail;
-    }
     v->vpci.pdev = NULL;
 
     spin_lock(&pdev->vpci->lock);
-- 
2.49.0



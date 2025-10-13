Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5327BD654A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 23:12:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142499.1476641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8PpJ-0000cO-QK; Mon, 13 Oct 2025 21:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142499.1476641; Mon, 13 Oct 2025 21:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8PpJ-0000a2-Mb; Mon, 13 Oct 2025 21:11:29 +0000
Received: by outflank-mailman (input) for mailman id 1142499;
 Mon, 13 Oct 2025 21:11:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VK7X=4W=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v8PpH-0000Zw-Lw
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 21:11:27 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a4354ba-a879-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 23:11:21 +0200 (CEST)
Received: from DM6PR02CA0163.namprd02.prod.outlook.com (2603:10b6:5:332::30)
 by SN7PR12MB7108.namprd12.prod.outlook.com (2603:10b6:806:2a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Mon, 13 Oct
 2025 21:11:16 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:332:cafe::3f) by DM6PR02CA0163.outlook.office365.com
 (2603:10b6:5:332::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 21:11:16 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 21:11:15 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 13 Oct
 2025 14:11:15 -0700
Received: from fedora.mshome.net (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 13 Oct 2025 14:11:14 -0700
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
X-Inumbo-ID: 2a4354ba-a879-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpxf+6R4GobOEYe+5pAQG13JIbxEQh2+BiPQckslP9A0SP9FRy/cGSYIa8o5fGz0W1pV6KTTaDCYEcFxoHNgTPeQ3NfYh/bwe2g9fBm2RBUkCgyhz2WiZkjXLLdcSPu+jts56fjEXVXdqNUu0Hd7wscr8K0u7j1T51GP90eBm5IoWizR3ykq8cVTcBzRFb/W6blnEy4T7aqV62UFWLpbkldX2j3zGa1lJRHYSmh5knmse4wgcsZElWHwBuJ5550KJvXo+Ar9C3xgOPxzrrag4aS67YSRX3K4fw58ak3LewNuxwjkaNPt9rO2q1TA504ty/drBuIhpYWI7gEWfiIsAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLGIot/OlkrKS6JOahSgpBaWPVm4lw5lz6qlsstWm5E=;
 b=XoMGlUkzhs8iNYdNkuifI+2ctNimQNT82GAI35WTt8J/ZdR9TifTV47buqL5PAwlc4IKjr8CUg+HRurbfNxIGnjpi+Qb7G4DhrVK3UYMY1an7Hn9dX6heZXMQOgpLETQ8pe4srfDc0QokgupqxvslWXi83XvU2/uvgQsId6RTBBj/p5ZPgDAMbB8ReRtq8IZoq7rlO/AD1VYf1TFLKreYtSoo8cpKKhzFzB1u5ijcrA1dLDTtggiAE+nDWlQbCQQwZg+R2BD26b2UqnzTyHiZC2DLRlr5lCXBi7zfnn0+b3edi13zzftEjC+zlD7rTMa6RgQMBf0nOVJcWLGDWMoLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLGIot/OlkrKS6JOahSgpBaWPVm4lw5lz6qlsstWm5E=;
 b=wcbK7TBZVT5ILs3D5/NpZ3UHa75TtxRPwD/FCiCzxKjifS28jlfsACinmlrcvuDKm/adnPvAhU9TLrFwLAxpavyARMDD+TpFHBtD6PDsPt2e3Ev9TJ6HPczAjYKDv0l29rNHZmjTCUI5c7g2cEIRIGUm8IsYoxFT6N6aBkd1abM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2] x86/apic: Avoid infinite loop in io_apic_level_ack_pending()
Date: Mon, 13 Oct 2025 17:11:06 -0400
Message-ID: <20251013211106.8720-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|SN7PR12MB7108:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e316f10-2260-4fa9-d2dc-08de0a9d0bfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P7MPgZisjplJuzP5dyveZ7eyetl1Yhs23VD5p6zth/eW28MaypPsrYXgRsy/?=
 =?us-ascii?Q?94v/saoiiAxCgy1s2aFytk6uDhVCddeo9nD6LWVgwNC/Syyydr6hfSp8AWHy?=
 =?us-ascii?Q?ySUWF1AhPxKGBnbztTLjV+lFLwkcLivu9Qld3m5UMWPUxIEV4tLZiibmQOzH?=
 =?us-ascii?Q?9pSXVN1xYk1hIyB2XIGkDVfB3U3UAtHr0SljGm+HKS0SD1SQ5K6t1UIE1/+i?=
 =?us-ascii?Q?P5hYH4P9YCrMvXUAwzNw5oVu6YNIGYcsqYgODAGakCbcPlPkOUGbA4DNk2gp?=
 =?us-ascii?Q?jU1bj6SD8Ntj5xY2AC1vBY2T4MUIV5C2gmePfidmDluCUCcibHa1EyVJtQGy?=
 =?us-ascii?Q?z+w6CpYOHU1r2olna6hdxW8hFQUepGSZariyjLgxjRzvC7UK+Xv2Fqz0W99+?=
 =?us-ascii?Q?8g2+oDONqae70Bj9IXsrHjYSxiluNlp3jyizRdlk/ARCuFzFZNABelS2Bk2a?=
 =?us-ascii?Q?RHguWespxxqySkcKrwDw5CN7Y2a1nWU/IzLwSKyUAT1dnF8tYf2NIzD3nrQf?=
 =?us-ascii?Q?tLXL2eGTJFGwfZCQIGshcI6sbOXjwtKGhQ/fveH3ACdoAflGKJJldCib5Dgc?=
 =?us-ascii?Q?OA+HDJKPEv1xmjIGtOk0Xo3vty7Cny7MG7M9NXYa7zrADI5Ckh2U6GIjf/yG?=
 =?us-ascii?Q?c5JInbDx3wq2JRklzMvV1HJJPCfsItOvHfVSZLDXvcKcyJ7gyBsCwFcPl31d?=
 =?us-ascii?Q?63riCvR1SWjdrYVrLNFVPcm4GGAyd6BE1Yw3Z6tk6o9L6MtOyvbgvpDsFT15?=
 =?us-ascii?Q?GbemChYbaUyr26CLoBNcmJESpfQ8dPt7iweWVmXCxLFwuxtGKhwhX1KoJwuv?=
 =?us-ascii?Q?Q0NPBXhcebskUfD2drBeygQtqQr59Yf0smQ95y3i4EmnjQ6buTzz891SjcvC?=
 =?us-ascii?Q?un1Bh/vDmy5gWMzhZjJueWkkooAz0TyR1Ta/y/NkYiDyTuLL+C67KEWsYBP+?=
 =?us-ascii?Q?wSHJZjTCNsT/skwqLnzua2zJoSQGGmrgKGqXONPqYNB8CEF81/DRNkbjJOa4?=
 =?us-ascii?Q?ad5J4gq4ZaqFsCaUVzR5ZtLPayW8mVKRsSUqfbaP8i67i9y1UAVt5riaBSdY?=
 =?us-ascii?Q?2ZRq1LVA8neoX34k3oJdF4YHADOwb1PWGJc16v4fbB+7IP8x1nn9dqFDd0lP?=
 =?us-ascii?Q?Ciyn8GS0y30D1wlpw0eMxHRA4ia4NVubnzLHHsCKqgbf9teJOL7sTpT8i5IU?=
 =?us-ascii?Q?T28YplV62UXtnmu+PvqcDbVLEITB8HYj5f6HHDJ8GuELecM0+rM7XUi6dPQx?=
 =?us-ascii?Q?P/CuA3PFPLkIaM1W0vomrgswKAmyJO2EmvAEDWLCnY2Aw6j7R0yLJjPOSIuX?=
 =?us-ascii?Q?ZkhtK8q8POmpM/zU+Gcob0L5w/S8g5dLrdi59zqqXp530SJ580iaPLaCbMbQ?=
 =?us-ascii?Q?YNGAiAXuJ0znYee1Kh2I42xk0Tm45kefN+y3L7/si+BVzforNNmV6wnQbYYt?=
 =?us-ascii?Q?K88mH/dEboQj3i6QCCbK5I1SGfKYjNbxl5sLOkGWQERPF3VMPrQMEijVJGaE?=
 =?us-ascii?Q?bvoPVH5yTwCIP8tcyRpRLlBDVSc6W08Nb3k1cFQym2ema0cB4Ep+6o6+0zWV?=
 =?us-ascii?Q?DBG26dQKcrznVm9i1GA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 21:11:15.9700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e316f10-2260-4fa9-d2dc-08de0a9d0bfe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7108

io_apic_level_ack_pending() will end up in an infinite loop if
entry->pin == -1.  entry does not change, so it will keep reading -1.

Convert to a proper for loop so that continue works.  Add a new helper,
next_entry(), to handle advancing to the next irq_pin_list entry.

Fixes: f821102450a1 ("x86: IRQ Migration logic enhancement.")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
continue (not break) for pin == -1.

I added the next_entry() helper since putting the expression in the for
loop is a little cluttered.  The helper can also be re-used for other
instances within the file.
---
 xen/arch/x86/io_apic.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index c384f10c1b..7b58345c96 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1586,14 +1586,21 @@ static int __init cf_check setup_ioapic_ack(const char *s)
 }
 custom_param("ioapic_ack", setup_ioapic_ack);
 
+static struct irq_pin_list *next_entry(struct irq_pin_list *entry)
+{
+    if ( !entry->next )
+        return NULL;
+
+    return irq_2_pin + entry->next;
+}
+
 static bool io_apic_level_ack_pending(unsigned int irq)
 {
     struct irq_pin_list *entry;
     unsigned long flags;
 
     spin_lock_irqsave(&ioapic_lock, flags);
-    entry = &irq_2_pin[irq];
-    for (;;) {
+    for ( entry = &irq_2_pin[irq]; entry ; entry = next_entry(entry) ) {
         unsigned int reg;
         int pin;
 
@@ -1609,9 +1616,6 @@ static bool io_apic_level_ack_pending(unsigned int irq)
             spin_unlock_irqrestore(&ioapic_lock, flags);
             return 1;
         }
-        if (!entry->next)
-            break;
-        entry = irq_2_pin + entry->next;
     }
     spin_unlock_irqrestore(&ioapic_lock, flags);
 
-- 
2.51.0



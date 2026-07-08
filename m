Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q8itGk67TmrETAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 23:04:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D50E172A66F
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 23:04:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="5Yl/XjhJ";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357356.1611809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whZQz-0004pp-Ty; Wed, 08 Jul 2026 21:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357356.1611809; Wed, 08 Jul 2026 21:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whZQz-0004mG-O8; Wed, 08 Jul 2026 21:03:57 +0000
Received: by outflank-mailman (input) for mailman id 1357356;
 Wed, 08 Jul 2026 21:03:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1whZQy-0004kJ-KS
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 21:03:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whZQy-001Bh4-1F
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 23:03:56 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a4ebb37-2eae-0a2a0a5409dd-0a2a4505e776-2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 23:03:55 +0200
Received: from [52.101.62.48]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a4ebb3a-3cb2-0a2a45050019-34653e30b4b9-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 23:03:55 +0200
Received: from CH5PR04CA0016.namprd04.prod.outlook.com (2603:10b6:610:1f4::24)
 by PH0PR12MB7984.namprd12.prod.outlook.com (2603:10b6:510:26f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 21:03:50 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::46) by CH5PR04CA0016.outlook.office365.com
 (2603:10b6:610:1f4::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 21:03:48 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 21:03:48 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 16:03:48 -0500
Received: from ubuntu (10.180.168.240) by satlexmb09.amd.com (10.181.42.218)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 14:03:46 -0700
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A8CWO4Ml1xQ18GKLYOjJKgNEQjD/X7CvpRRdTmiGWY2uP6JMTJ+5ghUWcBQ5AoPgbdVO0A+iMgLoG4jJD+DU+ah/T/628AbIzc1pgQE/62zHoWKXTQII6j0Y13u2UaDEWIsMCOgnld7L/r3bCCao9ok/E8GDy6Qpq9mDZo/v3vHMrGOgPYzfeSPB1+wdz6XXnKOHTdZLirmfuh4aiAnP+I3WirM/Yq9aoK3MWGh5rAuBLUhWyJgUY985oZxc4hleamR+vsf9hYJhVeSOjtLwBifns0dXHk/waApGorJeO2H5+6PHTEhMX6yRnseBuWlT5k6E+PhyLJm0m+mOOWFtWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mo/LqwcRC5ubuqxIgn4Vv90MFbTVJNrQe4oyzux4B+o=;
 b=t5IVnBQUbBcnHOaKcDr7RvNrgPU/zidkYuRRKOZgeVPB4HyGstqUa9LFQkUNdmf3ZHg0y2F7lqw+QCUxJHd+yM7U5zw0gw+qIcF+ojUq8kZ4o8300u5iobNsbIfh+BauyDViX03f78SXPncUGq3k95zCk7fSYJtD15TNbqa42aO86XkTAGCGVZyYDGHcrNt6QWQvmKBVT0dO54D9jpHdXgXDihblunn6gziv0DLRQ6QEAzrpRlqRbhVKIi3dcf/dVPmXVp0bIADZFvE2NQV06bo13J223QEzaaEEeX4UlelEe1RaW8/hJV8yd8NCUviURXLgn5yZImXlWbYb6lGM2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mo/LqwcRC5ubuqxIgn4Vv90MFbTVJNrQe4oyzux4B+o=;
 b=5Yl/XjhJTTf+NSjs4aUp9s4hBIcYWVYX7x80uxE5WRQral/iWaI/KB2iXhUZu2OdJpaZTsVXCPdBjiBdSOV9CeTuQLLqEfgqMrFxghr6PhgCA/pS8jZCLOjKBZRv61ddpPQMzba/njTxf2XP+kAWXW/vigisWW5775gC4NqaEmc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Mykyta Poturai
	<mykyta_poturai@epam.com>
Subject: [PATCH v5 6/9] vpci: create mem local variables
Date: Wed, 8 Jul 2026 17:02:21 -0400
Message-ID: <20260708210233.922275-7-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708210233.922275-1-stewart.hildebrand@amd.com>
References: <20260708210233.922275-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|PH0PR12MB7984:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d478f83-f067-44b5-992a-08dedd34681e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	yru+yoYVz9AG1FwPJEJyfce+AYHA1xSy5S8euQJR5qT3rbUGmsGV/Nqbj0VF4jaokO7Zg6ASQ3ZxsQaFiTmNcIJCVzAHDt6nkrAS4bSSKPTmqt7cYdbRAecYDWyA3sgYqR9kVGvfnQ2SNYZbx76DB+ULBsbDP5rQiDjhoharR5QwLqpQi7yAZx67yReHtWPYBrhZ7PVIkBlViuZY1csZ4lSPQ1LDt097nPLTe0rJdXvtHX2d1j/qNmvhik6FQU0jkI7HVE+phCYPjSZ7EQOnpJyuFrERLNRE1EsC/7GAU5tGO3Hm0arXLTMsCHra29UyoPScshHAe+ANwr6U2TlmTnzmbcnHChHO7Lva4ACFLkfXqXPe5sycIy10ORak+5y3l2N0ougQF93yLoEzd8Tv3K6fcqolvDaJa17qZ1s7C0f8EtHvcNeYa4t4ByIJ4boxOSPnXmFInTqLZe+XCBs7cQbdtMZ8+RM7kD79yspTjSPES9KmbYb2n/vYKKD6Fh4zc9B12q/6KM2hajDM9x7P2PPm7mb1Tu+MFwhPngQlAbXf9Lw0IPPSoVWfYaZDssrq8MZVcglMeHUzHNcAuwVZBYTWm9hyaDSnBm/oIybouycIXUr9DDZomVYbDVwae9VxQhsxBj9twAlJnFCMBCR8j4Dvxd1PsUWDzxmCyJksOxuRRp2ky/nAugVnDf9uz0JccdBgHM+sDA8yIqxIvkbyCw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hyTEYV8+2pB0YX2cyzbQFWqxKntNJ3l2giLwN+KvE8aK5UdQQuWo3ulvBPMY0lMSXOkzAuzIjU0VgneTP0i+BUa0n+4w5HnX2D0COxJgo2ouLE00bhzGA7ubjKLycvRTxB8tWtQacR1sMtUZXJcr6EIybiECRDcXKvxEsRUjJ9A6vNYbfpk5zPJ9gVJSiBi6tF5AQJ2jd1bjZ/Uf3bRUtwfJw21UVXQ6VJ558P1g/oayXpuoC30yoALggnIFj2LMqBY2YtVMz+/vE6qbJcDNZ3E06RuFIFxN4O2LuQQpQXB0IVTbxGY1v8JDP+DraMmHhDNh55wwEhq33McDrGNTLR07j/A/lTg/dJZEQc8Nt9ZjIuiRAVLpYAFnYrzVIe9huuNegcddTZwg32yyN8XjbjmliGgSlO8mdLNPV+XK4TPvzz1rbu3K3Cc1DzP5mfJ8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 21:03:48.7519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d478f83-f067-44b5-992a-08dedd34681e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7984
X-purgate-ID: tlsNG-c201ff/1783544635-54BE32B8-42E1F82B/0/0
X-purgate-type: clean
X-purgate-size: 6360
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:roger.pau@citrix.com,m:mykyta_poturai@epam.com,s:lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D50E172A66F

Use local variables to reference struct rangeset *mem in preparation of
moving it out of struct vpci. No functional change.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v4->v5:
* Patch adapted from [1] ("vpci: Use pervcpu ranges for BAR mapping").
  I kept Mykyta's S-o-b tag since many of the changes are similar.

[1] https://lore.kernel.org/xen-devel/20260406191203.97662-2-stewart.hildebrand@amd.com/
---
 xen/drivers/vpci/header.c | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 908adf0b3f4c..28e051f2779c 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -124,6 +124,7 @@ bool vpci_process_pending(struct vcpu *v)
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar = &header->bars[i];
+        struct rangeset *mem = bar->mem;
         struct map_data data = {
             .d = v->domain,
             .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
@@ -131,10 +132,10 @@ bool vpci_process_pending(struct vcpu *v)
         };
         int rc;
 
-        if ( rangeset_is_empty(bar->mem) )
+        if ( rangeset_is_empty(mem) )
             continue;
 
-        rc = rangeset_consume_ranges(bar->mem, map_range, &data);
+        rc = rangeset_consume_ranges(mem, map_range, &data);
 
         if ( rc == -ERESTART )
         {
@@ -178,13 +179,14 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar = &header->bars[i];
+        struct rangeset *mem = bar->mem;
         struct map_data data = { .d = d, .map = true, .bar = bar };
 
-        if ( rangeset_is_empty(bar->mem) )
+        if ( rangeset_is_empty(mem) )
             continue;
 
-        while ( (rc = rangeset_consume_ranges(bar->mem, map_range,
-                                              &data)) == -ERESTART )
+        while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) ==
+                -ERESTART )
         {
             /*
              * It's safe to drop and reacquire the lock in this context
@@ -248,12 +250,13 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar = &header->bars[i];
+        struct rangeset *mem = bar->mem;
         unsigned long start = PFN_DOWN(bar->addr);
         unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
         unsigned long start_guest = PFN_DOWN(bar->guest_addr);
         unsigned long end_guest = PFN_DOWN(bar->guest_addr + bar->size - 1);
 
-        if ( !bar->mem )
+        if ( !mem )
             continue;
 
         if ( !MAPPABLE_BAR(bar) ||
@@ -271,7 +274,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             continue;
         }
 
-        ASSERT(rangeset_is_empty(bar->mem));
+        ASSERT(rangeset_is_empty(mem));
 
         bar_valid[i] = true;
 
@@ -310,7 +313,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             return rc;
         }
 
-        rc = rangeset_add_range(bar->mem, start_guest, end_guest);
+        rc = rangeset_add_range(mem, start_guest, end_guest);
         if ( rc )
         {
             printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
@@ -321,12 +324,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
         /* Check for overlap with the already setup BAR ranges. */
         for ( j = 0; j < i; j++ )
         {
-            struct vpci_bar *prev_bar = &header->bars[j];
+            struct rangeset *prev_mem = header->bars[j].mem;
 
-            if ( rangeset_is_empty(prev_bar->mem) )
+            if ( rangeset_is_empty(prev_mem) )
                 continue;
 
-            rc = rangeset_remove_range(prev_bar->mem, start_guest, end_guest);
+            rc = rangeset_remove_range(prev_mem, start_guest, end_guest);
             if ( rc )
             {
                 gprintk(XENLOG_WARNING,
@@ -336,7 +339,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             }
         }
 
-        rc = pci_sanitize_bar_memory(bar->mem);
+        rc = pci_sanitize_bar_memory(mem);
         if ( rc )
         {
             gprintk(XENLOG_WARNING,
@@ -355,12 +358,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
 
         for ( j = 0; j < ARRAY_SIZE(header->bars); j++ )
         {
-            const struct vpci_bar *bar = &header->bars[j];
+            struct rangeset *mem = header->bars[j].mem;
 
-            if ( rangeset_is_empty(bar->mem) )
+            if ( rangeset_is_empty(mem) )
                 continue;
 
-            rc = rangeset_remove_range(bar->mem, start, end);
+            rc = rangeset_remove_range(mem, start, end);
             if ( rc )
             {
                 gprintk(XENLOG_WARNING,
@@ -410,8 +413,9 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                 for ( j = 0; j < ARRAY_SIZE(header->bars); j++)
                 {
                     const struct vpci_bar *bar = &header->bars[j];
+                    struct rangeset *mem = bar->mem;
 
-                    if ( !rangeset_overlaps_range(bar->mem, start, end) ||
+                    if ( !rangeset_overlaps_range(mem, start, end) ||
                          /*
                           * If only the ROM enable bit is toggled check against
                           * other BARs in the same device for overlaps, but not
@@ -422,7 +426,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                           bar->type == VPCI_BAR_ROM) )
                         continue;
 
-                    rc = rangeset_remove_range(bar->mem, start, end);
+                    rc = rangeset_remove_range(mem, start, end);
                     if ( rc )
                     {
                         gprintk(XENLOG_WARNING,
-- 
2.54.0



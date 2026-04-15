Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sC47J5d432nFTgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 13:37:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5356B403E84
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 13:37:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282286.1564943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCyYl-0003j0-AI; Wed, 15 Apr 2026 11:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282286.1564943; Wed, 15 Apr 2026 11:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCyYl-0003eu-5g; Wed, 15 Apr 2026 11:37:31 +0000
Received: by outflank-mailman (input) for mailman id 1282286;
 Wed, 15 Apr 2026 11:37:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wCyYj-0003d5-TY
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 11:37:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCyYj-009G4C-AE
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 13:37:29 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69df786f-bab6-0a2a0a5309dd-0a2a4501ad1e-38
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:37:28 +0200
Received: from [52.101.62.13]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69df7877-c1f2-0a2a45010019-34653e0db0fb-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:37:28 +0200
Received: from BL1PR13CA0127.namprd13.prod.outlook.com (2603:10b6:208:2bb::12)
 by BY5PR12MB4274.namprd12.prod.outlook.com (2603:10b6:a03:206::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 11:37:22 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:2bb:cafe::ac) by BL1PR13CA0127.outlook.office365.com
 (2603:10b6:208:2bb::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Wed,
 15 Apr 2026 11:37:21 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 11:37:21 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 15 Apr
 2026 06:37:21 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Apr
 2026 06:37:21 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Wed, 15 Apr 2026 06:37:19 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnvBxuQMmquKtqShmz937brUuJ6TEc+gg/BKX79O8gv78IFGgxDNkDnk+grj6cO9dilN9puMTH064t1XrZVdkq+qXtZeAQMZpYMbqQ4bhO7zcbFBaFjuQpafhL8RmKojaPBirB7QAtjiuG3Slq30T3HwtGiie2tPi92Nlur0xb2YnqK8KB+YnnnBABVIe+SPRdYJM9zaB7m7cg3YC4MCSvEszXAHvl6HuriVPnUoLhdCs3GM2JIZGdtyATVbQ6WUfr2F9ukYWPZiV4wcoJAeJQy2RevtgrXZqKZTTBrj5nuNXqgcq4TZqmr0hYI/e2L0gOtWlEScuFZA+rgm8xvTdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hB9ytw7x4Jebi3tKWGpsuYy48KxopqXnvHggFtPWCpA=;
 b=vG9KHq+Z/zo7gKfyWrR0nawQVUg0EReTNshHS1zIr+uxjl3l/RlmAfF2xQ6fQ4ltbv+4F9VgRepkkWnwY0hnK56pfD4mLVCLan6woORMcSUtMGgEVPtUAur2kETihcWqnhfEwbnXs0SO+iXOE44lnRyiwqCOjp/0EmTPEaq4V2WfNA9ldLLj7XwiVr4T7MLlrkDaSqjR0r89/9zEFfL28wuiQacMU9pU7K7IaL2ZdQJIQhl17jHSdlR//Arf3ET+SBeMrOgtm6kGfwkaPoWVnBtwz6yqZVFYZv8lFXb7wggU8x+pWyzFFPOVq9AbblnkinVuHZpiFLAvGh/WkML/mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hB9ytw7x4Jebi3tKWGpsuYy48KxopqXnvHggFtPWCpA=;
 b=1CQ+8XlZ4b3Aylscw8z565+l0IIAWcsewYxcWshNYwQYA35rK+JP53b1ydMowljyJ+x49yqwaB4u7uWpYMzls3ueXuB7vFASQDpOS0iA/LbeQsJomliQhf3ewJ+YhF052jIyEuxARYpt0SzwvNT5TobJCFIY3uabr9nHiSd22KY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH 6/6] xen/dt-overlay: attach resources for child nodes in overlay
Date: Wed, 15 Apr 2026 13:37:00 +0200
Message-ID: <20260415113700.107915-7-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415113700.107915-1-michal.orzel@amd.com>
References: <20260415113700.107915-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|BY5PR12MB4274:EE_
X-MS-Office365-Filtering-Correlation-Id: ebca11c2-b8ac-48be-c02a-08de9ae35b9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	9RImkJQnJ+WV95qZw95lkOzhmA/9P6Mfh4ocIDZj3qkLRIYJv5gYzkfSw9WB27SRCh3Sbkaw5PcjkRI2CVt1iHrJ/P7cLKtsjao4azKzCIjELfPfLGR8bce93ocIgC+yy2KnxCJDYe/d9G3tfCdSD/pxn9e9DMq2TjYL7xC2wCD/Yxz7naOWerg7ktV8DDlxEcFI5Z4U3eqf9ctCRU+A7hnMZAKQNpugwnjiiYgKv/wMfrQ1OvyXW9d/Dbh44qt7W6btaTZ4sZ9HRh1HylQWWO9uGHi/BowN+HXwuAKwY36526gE17Q4XnLVNH58D+iBRJjJoueFd6e8u0qZeAVNFmBoJFg0MsTDjf/hrmIxRzkoEEldUMk1fiG2N50S/W7+GA7vCllZrUvwg8aKhyt+CDF+mHDDUGdCO+skLpXukNbU4K5l6B22nmFkfqHmwleR63iDOB7V8WjcI3airv01mslxk4580pvM38d0CZYwkaKKwgkU4AmR0BmWtJIKPDz4J73YeXHA1yP/caGss6VKZxeiZNrICLzq1b1K9u8BC09IYqZccSpCdJnvR0a0uKIvUh7iVJB6S46B5eMvGAB1ba79dOsVFoHP79U/noC5SZklsfnDvBAZ0sHYFdVf9+KT7oLdt4fwnqCB35x5Eyh0znyY+k0RLX9t0Jrc1TQNdhb7yndyPWmbdTy7rtJbtCg5/XDmNvk241A/hFlRdU22iCdpHBVBvLDNjUo6WDMD3ihP6uPLyz+vtzwcR4Ic3Blme+vOGpjGefXK/lmV9iW2Ow==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	d4e1tmwLxaa5YXwxN/kTc80whTCvrybkqEOdlj/R9aA4PZO6Wb3EKriN2AS1Sut16cH/ig/6Ket7fxx8kr5LHu3a8f7nIbf7Q9Ws9fLMpTfnxwVtQ+u1OIuIVflaMosFEfiqFa74jVZTg8cAjotAv0fFmCIYmbZD4Hfl3dhvXFUOl2ndr+uMZyZ910r7/nzOx4vsIeD5PUkH0n4vfscnbgy30DephGscKUN7EMiFXkbDzWfj8k2CUZt9Z+iCrxNC0iaZsFSDclAxDq/CpcTz9I/4QI+96hFN+O3fhemuz1Fqgw4q0Ecx/MShnGxFn9zWtoJXvEbxQr1uMzOk6i4qR8BVRktoKdlN5pAdx9DbR6H+lUociktqJ5eZaUBcWZuRXnyOiuKAPPLu+iT74cMuCV0DKL1FHon3pHSJ1rrMGJNfo+f/aRTX+4DzIe3XR20h
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 11:37:21.8040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebca11c2-b8ac-48be-c02a-08de9ae35b9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4274
X-purgate-ID: tlsNG-d62444/1776253048-B4E13FF4-14468FCA/0/0
X-purgate-type: clean
X-purgate-size: 3237
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
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 5356B403E84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

handle_attach_overlay_nodes() only calls handle_device() on the
top-level overlay nodes tracked in entry->nodes_address[].  Child nodes
that have their own reg, interrupts, or iommus properties are never
processed, so their IRQs are not routed, MMIO regions are not mapped,
and IOMMU setup is skipped.

Introduce handle_device_and_children() which recursively walks the
subtree rooted at each overlay node and calls handle_device() on every
descendant, ensuring all resources in the overlay are properly attached.

Note that the attach error path has a pre-existing bug: on partial
failure, the tracking rangesets are destroyed without first revoking the
IRQ/MMIO permissions and IOMMU assignments that were already granted by
the successful handle_device() calls.  Add a TODO comment to flag this.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/common/device-tree/dt-overlay.c | 34 +++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/xen/common/device-tree/dt-overlay.c b/xen/common/device-tree/dt-overlay.c
index a0dee7edb7e5..b837f1112188 100644
--- a/xen/common/device-tree/dt-overlay.c
+++ b/xen/common/device-tree/dt-overlay.c
@@ -894,6 +894,30 @@ static long handle_add_overlay_nodes(void *overlay_fdt,
     return rc;
 }
 
+static int handle_device_and_children(struct domain *d,
+                                      struct dt_device_node *dev,
+                                      p2m_type_t p2mt,
+                                      struct rangeset *iomem_ranges,
+                                      struct rangeset *irq_ranges)
+{
+    int rc;
+    struct dt_device_node *child;
+
+    rc = handle_device(d, dev, p2mt, iomem_ranges, irq_ranges);
+    if ( rc )
+        return rc;
+
+    dt_for_each_child_node(dev, child)
+    {
+        rc = handle_device_and_children(d, child, p2mt,
+                                        iomem_ranges, irq_ranges);
+        if ( rc )
+            return rc;
+    }
+
+    return 0;
+}
+
 static long handle_attach_overlay_nodes(struct domain *d,
                                         const void *overlay_fdt,
                                         uint32_t overlay_fdt_size)
@@ -951,8 +975,9 @@ static long handle_attach_overlay_nodes(struct domain *d,
         }
 
         write_lock(&dt_host_lock);
-        rc = handle_device(d, overlay_node, p2m_mmio_direct_c,
-                           entry->iomem_ranges, entry->irq_ranges);
+        rc = handle_device_and_children(d, overlay_node, p2m_mmio_direct_c,
+                                        entry->iomem_ranges,
+                                        entry->irq_ranges);
         write_unlock(&dt_host_lock);
         if ( rc )
         {
@@ -968,6 +993,11 @@ static long handle_attach_overlay_nodes(struct domain *d,
  out:
     spin_unlock(&overlay_lock);
 
+    /*
+     * TODO: IRQ/MMIO permissions and IOMMU assignments granted by
+     * handle_device() before the failure are not revoked here.  We only
+     * destroy the tracking rangesets, leaking the actual grants.
+     */
     if ( entry )
     {
         rangeset_destroy(entry->irq_ranges);
-- 
2.43.0



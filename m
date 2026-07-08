Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UlDqCle7TmrLTAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 23:04:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9BA72A695
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 23:04:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="GYr/3BGG";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357393.1611836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whZRI-0006jv-6d; Wed, 08 Jul 2026 21:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357393.1611836; Wed, 08 Jul 2026 21:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whZRI-0006hD-1s; Wed, 08 Jul 2026 21:04:16 +0000
Received: by outflank-mailman (input) for mailman id 1357393;
 Wed, 08 Jul 2026 21:04:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1whZRG-0006a2-9R
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 21:04:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whZRF-00BD5T-MQ
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 23:04:13 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a4ebb34-e002-0a2a0a5209dd-0a2a4507ae2e-24
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 23:04:13 +0200
Received: from [40.107.209.30]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a4ebb4b-9c8e-0a2a45070019-286bd11ead0f-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 23:04:13 +0200
Received: from CH0P223CA0018.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::28)
 by CH2PR12MB9457.namprd12.prod.outlook.com (2603:10b6:610:27c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 21:04:07 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::8f) by CH0P223CA0018.outlook.office365.com
 (2603:10b6:610:116::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 21:04:07 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 21:04:07 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 16:04:07 -0500
Received: from ubuntu (10.180.168.240) by satlexmb09.amd.com (10.181.42.218)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 14:04:06 -0700
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
 b=EfGaMFGslcPz3bBqBETRlEU8uMf6YUP5kEaT5ZsBEtoKxzcq4tjWA6nMA7QeGI2ebOhs98LuYBiZAvRS1fZxO2Z7fkhUs7/ZYWA+U6tCF0uz7mmxO6hTNxWt7+Lw54uf/B6YgCfvUsbVKpFgXdN69Xy3N/EO38QjV3HEUZklXn4PwNjbvgXfHuKK7qPFxUHV1dHvd6YzxcxJWJwSzEXxQ11Xc7OmmicNlcPLCI28uPMik+qDuwk7C3dbqaMEWz74dHJM/XQ+Tfq2ksPLzi946oJ5mVDZG0NwbpY4toI63S9NhY66kE2p3UOP7VfNGhi+ZufVRTemva4QvLFvNyWDkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9Ml1rEuDAWohroa4VYPF4k6cEO055kVYBLCDJzDEvI=;
 b=BHsNz2mC3ar3qIxN8v7daPMOXRTW2a/Dnx5Kt+85jd6vIiirGZeIfEYTc9+lvfdpQOQEpSCbR5b9qX3DhccTO4gaNvTA9WdsmemWFHGVbfewcFdDnq2GtUR5uValwv+iDWKJ7zgSfVDsz2THjM2/QH6cV36HArATO9G57jXY+lkvrkKUOnv9dWHFYUyohGbN9YBhQ3VPGN6PAryZXzoXcLEfO6NiV6E9h8g+GMl+y6aCv6yHYSTYOP6vcq0DULQOvn9PcaFZLXAj5Nz5HXNKqyCYL+bii0WL0GC/bwbfH6mFFiCxms4O9305ESgTIvney8j6ye+rwYnhU3fTYYINEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9Ml1rEuDAWohroa4VYPF4k6cEO055kVYBLCDJzDEvI=;
 b=GYr/3BGGw43YpJAMMOKlxaaKaT1IQZ4Pqbam/d1HcG5O8WnGEMf+p3AKMESESfCSBnqLmr0s8qYQB+m/nwmY8mCMOlq1dh5xlmcFhh1sQJ3DpYxzY59BJHyAhJ8djXKjnNPzBe1eCnR0E4NafxCW6IOXF5dio7AxpmenXrFc+W4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v5 9/9] vpci: don't pass command value to modify_bars()
Date: Wed, 8 Jul 2026 17:02:24 -0400
Message-ID: <20260708210233.922275-10-stewart.hildebrand@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|CH2PR12MB9457:EE_
X-MS-Office365-Filtering-Correlation-Id: 74f2cd4f-6d7b-49d8-9570-08dedd34734e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|11063799006|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	HhVwZdPh0GSLdXOJAzZvMSnn+t9GjnFrMzgpxvET0FdktfQE456XweStMMGZ3pT6x6qGh7v+JVIXYyCFRqMuf8Xuj6CGyvaz7GWAiBGmZOCEcv0x+sJR6Oh3Zyj8S+rSU5U/59utcYljLVRJ2MNwaRNUODCWQpuFT8sh8pIcFefxxbfnxpRBgAHqiVnvDTJ8F3vSWfdCVz8m73Mxyu+n3Pa01BGpVF0Q2fQ74njhBLrpeBcq99safWVLjbWTaQsaAYTVBXv2zfE9PGmj1R5oUJPuSv7J7KhKYO8tinJxenFZcd+nrnJnMIde/uSWUEYZm1aDX8D8TRCWStMDXjGBpT5OU3EMMZy8o6ox6hA6cJfDHI/NrXRH4cxCMGIQNIzQNLEnP+27Al1tD1MdRpqRYPfhYeHV8eMinMH3a+gAMAusABQ5/X6FgMbFJ6i+gkUVB5d6UeyZJDAqnJLR9eL1BqFtF1qsDyYzaqyqpZ5nC5d2Xn0WEYUWeBJkL0FypWxbCvni9aoIMTe2gUIyHXGSnqS0JB2y/65+ALfzlx+bAB0Cl9zUNFYMoXN1Apvy3NHpuyYh0f9SGJWK4ifg/rbsHKGo02v9IchkzMMOoYF6BzPdx+YfHLcG2BEtvXEjMy6aGOV4xx7bBo1jlztrEQKE16WZH85lsn46ffmobVdIOdAlU8X63wML8yjU2woIj7+pHfpcCNaZuNmc1PZK8OnZ9w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(11063799006)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9+96k0L5V0NdgTWRRPTC4wZnESalCqPlNLHmN3JVztiQ4AHQEc9PjTJZotmo1IjuTYgaCOU9pSW0I+hYAy7GqJ66I/EEAqZ0PI4pO2Oo9w6STPXtc3EyNfqkwDoYRcqnKvCvLDQTMfz6LrqYHGQOKAe2ehK/e+izBVXm0ZGhwnC9WAQ5oiX3sPR/kx9RxPfUfyHpnU1z0V+gUwSWweK5CQ0rP3/P8yBqlEG471KMAQPcEWf0bz0ej0fEPpLEH2kEQVm/qo+CPoQ9IQbzCcG+RTQSqcaan5FkErpkP2IXNdE7iKEIIm+H3hOq8WOAEOu/H+mgCwKMTlZg6gq59dMpBiczg2jULXG7MN5jlNeQsMFQjv6zgR8BKfGNfy0qF+8t/kr3zWHNKoby+c9jhK23qp9Yc8RUi/RnDjWDeGmhJoCD0K2gqk8QPUfkWDGSRIVN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 21:04:07.5212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f2cd4f-6d7b-49d8-9570-08dedd34734e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9457
X-purgate-ID: tlsNG-ef75cf/1783544653-FD72125E-DA63933E/0/0
X-purgate-type: clean
X-purgate-size: 4658
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: CD9BA72A695

Now that writing the command register is no longer deferred, there's no
need to pass the cmd value to modify_bars(). Replace it with a bool to
indicate map/unmap.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v4->v5:
* adapted from: ("vpci: allow BAR map/unmap without affecting memory
  decoding bit")
* significant rework

v3->v4:
* rebase on dynamically allocated map queue

v2->v3:
* use bool
* switch to task->map in more places

v1->v2:
* new patch
---
 xen/drivers/vpci/header.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 99ce67053068..187de3a12abb 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -324,7 +324,7 @@ static void defer_map(struct map_task *task)
     raise_softirq(SCHEDULE_SOFTIRQ);
 }
 
-static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
+static int modify_bars(const struct pci_dev *pdev, bool map, bool rom_only)
 {
     struct vpci_header *header = &pdev->vpci->header;
     struct pci_dev *tmp;
@@ -337,7 +337,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
 
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
 
-    task = alloc_map_task(pdev, cmd & PCI_COMMAND_MEMORY, rom_only);
+    task = alloc_map_task(pdev, map, rom_only);
     if ( !task )
         return -ENOMEM;
 
@@ -369,7 +369,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
              (rom_only ? bar->type != VPCI_BAR_ROM
                        : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) ||
              /* Skip BARs already in the requested state. */
-             bar->enabled == !!(cmd & PCI_COMMAND_MEMORY) )
+             bar->enabled == map )
             continue;
 
         if ( !pci_check_bar(pdev, _mfn(start), _mfn(end)) )
@@ -409,8 +409,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             goto fail;
         }
 
-        rc = xsm_iomem_mapping_vpci(XSM_HOOK, pdev->domain, start, end,
-                                    !!(cmd & PCI_COMMAND_MEMORY));
+        rc = xsm_iomem_mapping_vpci(XSM_HOOK, pdev->domain, start, end, map);
         if ( rc )
         {
             printk(XENLOG_G_WARNING
@@ -555,7 +554,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         if ( bar_valid[i] )
-            header->bars[i].enabled = cmd & PCI_COMMAND_MEMORY;
+            header->bars[i].enabled = map;
     }
 
     if ( system_state < SYS_STATE_active )
@@ -568,7 +567,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
          * be called iff the memory decoding bit is enabled, thus the operation
          * will always be to establish mappings and process all the BARs.
          */
-        ASSERT((cmd & PCI_COMMAND_MEMORY) && !rom_only);
+        ASSERT(map && !rom_only);
         rc = apply_map(task);
         destroy_map_task(task);
         return rc;
@@ -607,7 +606,7 @@ static void cf_check cmd_write(
      * handled above and by the rsvdp_mask.
      */
     if ( header->bars_mapped != new_enabled &&
-         modify_bars(pdev, cmd, false) )
+         modify_bars(pdev, new_enabled, false) )
         /*
          * Ignore the error. No memory has been added or removed from the p2m
          * (because the actual p2m changes are deferred in defer_map) and the
@@ -784,12 +783,8 @@ static void cf_check rom_write(
         rom->guest_addr = rom->addr;
     }
 
-    /*
-     * Pass PCI_COMMAND_MEMORY or 0 to signal a map/unmap request, note that
-     * this fabricated command is never going to be written to the register.
-     */
     if ( header->bars_mapped && rom->enabled != new_enabled &&
-         modify_bars(pdev, new_enabled ? PCI_COMMAND_MEMORY : 0, true) )
+         modify_bars(pdev, new_enabled, true) )
         /*
          * No memory has been added or removed from the p2m (because the actual
          * p2m changes are deferred in defer_map) and the ROM enable bit has
@@ -988,7 +983,7 @@ int vpci_init_header(struct pci_dev *pdev)
         pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
     }
 
-    return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
+    return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, true, false) : 0;
 
  fail:
     pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
-- 
2.54.0



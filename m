Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mHF4IE67TmrFTAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 23:04:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F2F72A671
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 23:04:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=XFpvO2KX;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357347.1611760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whZQk-0003Ka-6y; Wed, 08 Jul 2026 21:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357347.1611760; Wed, 08 Jul 2026 21:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whZQk-0003HE-3l; Wed, 08 Jul 2026 21:03:42 +0000
Received: by outflank-mailman (input) for mailman id 1357347;
 Wed, 08 Jul 2026 21:03:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1whZQi-0003BV-Tz
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 21:03:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whZQi-001FOW-1P
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 23:03:40 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a4ebb18-5cb7-0a2a0a5109dd-0a2a4506bcd2-20
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 23:03:39 +0200
Received: from [40.93.196.65]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a4ebb2a-08de-0a2a45060019-285dc44164ea-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 23:03:39 +0200
Received: from CH0P221CA0044.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::27)
 by CH3PR12MB7667.namprd12.prod.outlook.com (2603:10b6:610:14f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 21:03:35 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::72) by CH0P221CA0044.outlook.office365.com
 (2603:10b6:610:11d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.10 via Frontend Transport; Wed, 8
 Jul 2026 21:03:35 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 21:03:34 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 16:03:29 -0500
Received: from ubuntu (10.180.168.240) by satlexmb09.amd.com (10.181.42.218)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 14:03:29 -0700
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
 b=UK3Gmy8oby9ofsA7T0E/gPoVclyD6ZOLaydoexBeXCIz1fFlNjpieWKjzCTzUsd8RgM7REz+H15HGSjd/uS0uBI3eYA/MWGx0YRNfyUvO6Z01RQRI3ObXiMq6ZooQ05/hVBPlP6Uq4ze78X5p12L6JPjtfN4eosKGH3ojPjL5hXha8umHA1UPpIt5f8Qf99E4jVgkQ2CijeHmY+FP5ShWOKP3By6AlxPIYeqHUbMMgt2Q25WsgQYDj5fOXsOE5ml9mR/3zEzZfyVHiXKRYalo5YI6TeMveurPF5UO2wdDguaQv1KE5/7Z4Wb1WPo64C4p2wfEYMuGmYsuVxAxsPpzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSKtr1QODaGQ+yBMbiw0PTCEl6qNRjC3impW+6VKld0=;
 b=X5jNpdrDA6pjoEfMB6AFNa9ptHGbWzQmHzH/xTBUE8ZgqfFQXcrPNFXx1eszEZFhya4BDivLVFxjAtnfESslrRRQUmUE1/EHl1btXaVVhI18Km+IG5PFa2KeHNhcx9bdIPpLGofpomFII7jVtcZTIfuTQJ8ZfIkPRQ5a2D+Zifm1BVCvfg2ZSNanXgTDIHOJDB3dOtVmASNNEGPgATeBCbHshjRTtNJHviPBMU5kJ7EhD9zXG5x25qmNj5u80OCA/oCEdAWxYtiasDsSviFXaYMehEyfvONLZZtK5CBdMP4/uSDO7il7fFefLYFIjHn1po/nVpFkH9r6dTO79hHDGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSKtr1QODaGQ+yBMbiw0PTCEl6qNRjC3impW+6VKld0=;
 b=XFpvO2KXwvZarZn8GTxeguY5V7C8gXmAN1h/5Ann5Jh662tAr+q8yS1sUpjXl4DDQBYLnH4EAocq9qNFRchteyuvPnFtDtPDd4+A0jTZYgunNf5fCdC3bk9KNjvYj/5OvO79EVVYO24MBKYGGng9kXt3+s5BRBBqAaXYRb/WEzk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v5 3/9] vpci: only check BAR validity once
Date: Wed, 8 Jul 2026 17:02:18 -0400
Message-ID: <20260708210233.922275-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708210233.922275-1-stewart.hildebrand@amd.com>
References: <20260708210233.922275-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|CH3PR12MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 317a639d-aaf4-41de-07e7-08dedd345fdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|36860700016|13003099007|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	PJ/S7en6FHNjzOhtO5YbTP5LbdWA53G215p1RQGfHHiJVU2tFagmKAu/fhPl0TduAAu//wD3nf30PEeKjCddavYgaY8q1fAd70EldIP5ROzUQFzhWCV6TQJIa5sW1uQkYn8BS3V2Tn+wI+rA94r/P6UtPVfL8SbNdSORpUf4lDnY04fqpptjUEZdfqWWZb+9/MFImj+V2gC5SZphekNl5hLe65zTlwriYl2EckluxWw22TPvuJpuoDaFr980+JtNLusm0Jep6MQHHSnB0Wy9dWo/GWjQfgCgbx87DE1iWeCeRibDcuUTVMNKlZOXffjdL/YUx5LgCEQ0yStYbxLZkIv/fJXJ1upAENLJA4bgy7f0XtWwhasf2BVWTg3NGLJ1XAZhyyhLAw06HCWty4wPthPzFC7k5WBWAmMS2X3tDZPrp3ifkiqhPXJk/2/o8M7+lqBI7WA27pkt2DJZPQQndGocOvyy6sWB9TW/LitUzy3SWnG1XHnRXs+G8sWSsxoWznB7Y25/pNE6mAuei4McbIkvtauZ5raJqhOX5pxIAshCIdHUqh1VlXYn5v170JtPrM66Yqr9NEGTf07Q4yCgk4nQI/EOm9D3iyjB10jQB3QAsMT/nDmSGXiyy1sC21fTgCqMPwHvFCvklTMZqKmctRxJk2YPkUUSQieAYk63Vgz/PdEb3mJp/59ds/3XCDIh/8Zmx4RuXKG6o1zhiMzyDw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(36860700016)(13003099007)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	p7EdcUcq/vmYTVI6FIFb21IpNJntPfhHMDC5ItGe6q19vs7sYeIvYSujPpPGizYXECH9XlavDVRJExMaIXvSFUG/jH3tGJ2+A/TpG1/gx2mYWHRyYMjk5EBDtBQyKHbfgLHJDk/oJlveNwpm2/KbL9l4gOPjQjeVmBRRaQuzDdWCPqgdC7ofzNOwnYDEtay+dEsvNpVE/WATsEVh/NRs6tfwA596Fqxq0LRxpQG4lj2WUngzqIUDamCMwiAhnv1NFe+V2y0VVz8wE3A/EmRtFpuloUxAANWhzyL21bLk1bAz6UUuNLyd9SEpARDiSBpq0SZQMF0Wv6974/8NQFfr1i21Z/LXcxPD4VHZYnDLENXIKah/46FeRFStYyZ/NEAeCdtC5RD8KxpAXJxgiDeRCdS/L2HU41+K9j89cZxGul4J0/qjnL61m5uIrSw8su1j
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 21:03:34.9008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 317a639d-aaf4-41de-07e7-08dedd345fdd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7667
X-purgate-ID: tlsNG-16d1c6/1783544619-C513768D-AB82D982/0/0
X-purgate-type: clean
X-purgate-size: 3969
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[xen-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 11F2F72A671

From: Roger Pau Monne <roger.pau@citrix.com>

The BAR validity checks in modify_decoding() are redundant since they
are already done in modify_bars().

Avoid multiple calls to pci_check_bar() for the same memory decoding
related operation, as each call can possibly print a warning message
about a BAR being in an invalid position.

Further, there's no need to defer setting bar->enabled until p2m
operations are finished. It can safely be set in modify_bars() itself.
This slightly changes the meaning of the bar->enabled flag: when true,
it means a BAR is either mapped or queued to be mapped. Store whether
the BAR is validly positioned in modify_bars(), and use the cached value
for setting bar->enabled.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Fixes: 4acab25a9300 ('x86/vpci: fix handling of BAR overlaps with non-hole regions')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v1->v5:
* rebase
* don't defer setting bar->enabled
* use local variable for bar_valid flag

Original report [1]:
[1] https://lore.kernel.org/xen-devel/dbc003a2-9202-46ec-bf87-2829d8a63d53@citrix.com/
---
 xen/drivers/vpci/header.c | 18 +++++++++---------
 xen/include/xen/vpci.h    |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 9f2d0c8a5452..1fd4832033e9 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -128,19 +128,10 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
             uint32_t val = bar->addr |
                            (map ? PCI_ROM_ADDRESS_ENABLE : 0);
 
-            if ( pci_check_bar(pdev, _mfn(PFN_DOWN(bar->addr)),
-                               _mfn(PFN_DOWN(bar->addr + bar->size - 1))) )
-                bar->enabled = map;
             header->rom_enabled = map;
             pci_conf_write32(pdev->sbdf, rom_pos, val);
             return;
         }
-
-        if ( !rom_only &&
-             (bar->type != VPCI_BAR_ROM || header->rom_enabled) &&
-             pci_check_bar(pdev, _mfn(PFN_DOWN(bar->addr)),
-                           _mfn(PFN_DOWN(bar->addr + bar->size - 1))) )
-            bar->enabled = map;
     }
 
     /*
@@ -296,6 +287,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
     struct pci_dev *tmp;
     const struct domain *d;
     const struct vpci_msix *msix = pdev->vpci->msix;
+    bool bar_valid[ARRAY_SIZE(header->bars)] = { false };
     unsigned int i, j;
     int rc;
 
@@ -341,6 +333,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
 
         ASSERT(rangeset_is_empty(bar->mem));
 
+        bar_valid[i] = true;
+
         /*
          * Make sure that the guest set address has the same page offset
          * as the physical address on the host or otherwise things won't work as
@@ -506,6 +500,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
         d = dom_xen;
     }
 
+    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
+    {
+        if ( bar_valid[i] )
+            header->bars[i].enabled = cmd & PCI_COMMAND_MEMORY;
+    }
+
     if ( system_state < SYS_STATE_active )
     {
         /*
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 877aa391d178..ab94eb60d65f 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -64,7 +64,7 @@ struct vpci {
                 VPCI_BAR_ROM,
             } type;
             bool prefetchable : 1;
-            /* Store whether the BAR is mapped into guest p2m. */
+            /* Whether the BAR is mapped or queued for mapping in guest p2m. */
             bool enabled      : 1;
         } bars[PCI_HEADER_NORMAL_NR_BARS + 1];
         /* At most 6 BARS + 1 expansion ROM BAR. */
-- 
2.54.0



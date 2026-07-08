Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AYP+K0+7TmrGTAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 23:04:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F0B72A680
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 23:04:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=jNU0tXHP;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357348.1611772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whZQl-0003cr-Dg; Wed, 08 Jul 2026 21:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357348.1611772; Wed, 08 Jul 2026 21:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whZQl-0003bA-AS; Wed, 08 Jul 2026 21:03:43 +0000
Received: by outflank-mailman (input) for mailman id 1357348;
 Wed, 08 Jul 2026 21:03:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1whZQj-0003Bb-El
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 21:03:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whZQi-001FOW-Rv
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 23:03:40 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a4ebb18-5cb7-0a2a0a5109dd-0a2a4506bcd2-26
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 23:03:40 +0200
Received: from [52.101.61.59]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a4ebb2b-08de-0a2a45060019-34653d3b3f23-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 23:03:40 +0200
Received: from CH0P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::6)
 by DM6PR12MB4435.namprd12.prod.outlook.com (2603:10b6:5:2a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Wed, 8 Jul
 2026 21:03:36 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::16) by CH0P221CA0026.outlook.office365.com
 (2603:10b6:610:11d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 21:03:36 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 21:03:36 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 16:03:35 -0500
Received: from ubuntu (10.180.168.240) by satlexmb09.amd.com (10.181.42.218)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 14:03:35 -0700
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
 b=m8Qei/p0jHBxVkppaYSnNj2hwlvYj61LHN9PG9QzAb5uDaFegy+CirUSa+kOC58H4qTT25EYOcp3VRfTk4cd8UKlCAqT3NnLK13m4BmqWOUlVDBLXfsxyadHQDKGlxE6fKHjjYtQHjjXB1BLCwSE27iHKMb6FDVQSBzfP7SDZ9guBLO0umV7GAjAdGa5MwydI8x4ZvKYXZEDquFxFc269Dz6ple9z2OZc2YPKLExVf3e9yGfrC9joaZYYcXwVKDvEVunkv/u8m4BOU6RgYSzYZT8Ur6djQjXDekv+U8yUOqIyTDo/fsdJvU0FKDmE3W9CDeUfy0EZJUkSD93K2GOgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcreZ/yNtHeipp+IQwqa98GHDSr0hRONrQURcLHiG7E=;
 b=HOgt5qZEI5C5QHPu07RmSKBb192DvLpmVVWFHsqz7O01ljRTeJLqAiIKvk8he+r8Fku0aeo4IQ8IVz5D2Y/AF1yuXjUa55IqsaiUUJ2FwThnK99M5zLoCiS6pmtYROgoLB2PyJFtEowrCXaYJ0MZXvRjQ+hrTMFSxFR9WD0fTRicl13mdqI8mV3/XUArSbCxWEsNCXFWYjvLOmXDxftTIi3sNYHWY2CsfoYVCTewWk+vg4WUuMqVMbmRJbKXG90f04fe480QKMmdZpIMkZwpNdP5hK8fFLrYd3F21qbRkOBgXyipuNVYZnuR775SWDCYQkyPSsYKShfILlv4L03/dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcreZ/yNtHeipp+IQwqa98GHDSr0hRONrQURcLHiG7E=;
 b=jNU0tXHPcDcstPRTzyN2/hTZbCdbHANW/jLfnX1ojOEFVBr/PJROuCq1GIlsbziRJPcF7oWXWkYiBhGMoE9yUrniakDvb/mX7DJokLoIytvLHz5mKotFTuQDq1FDC1tgdDgTTtP4fs+VIEb8GBMMcxnyTffVJGCh3/UKC4Ikfmc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v5 4/9] vpci/msix: move MSI-X hole punching as a result of memory decoding enable
Date: Wed, 8 Jul 2026 17:02:19 -0400
Message-ID: <20260708210233.922275-5-stewart.hildebrand@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|DM6PR12MB4435:EE_
X-MS-Office365-Filtering-Correlation-Id: 84d4b59f-4dd8-4687-66ac-08dedd34608c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|13003099007|18002099003|22082099003|6133799003|5023799004|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	nTJloavw2r/OWjTKnO87BfrHsBsF3i3Qy1iciNJ+EuKy0DRU6+rrnrg/Gs5iF05hCGa0Px2oEjfiOlxxiHc16tpod1mXUtkbzeBQT8xOHQG01jn8TX8Ysqo4RvayBQu6BlSmsBR0LEk7Ym8bq4qVcKIQ7wRnSQVhmgOX57HN5ZkqHzJPxfFkO0dDqx9eBt7OHzV+MvMyljiwDZ9W5C/Gdsb3zQPdfHugVahj4KiqrS6upqLyy88t5dSmDvu4D27nNYRNR6gq/YRoKrmWp8qgtQ22s+0f3vElXO52w57XuG6kvbYmO4s5I9WpI4aO1tHmMTZplsgmjOI/B/dM0xAmweKD1fw7Gu/miBbimb0TsoM0Pl8Nz4sa2lVaoGzVBccX9v8VAnrxsj0AT1Bs0iGtpPbSuWRCWNbktcbF+fcATL6512q7CJMbVKQ5B70/He8c6SzfdSnH3A9OnaHG0kb27fLfQB7X09UQvJXCtFYTUmvt2gGGqaItt1l+T8hUvx8EczN9JaeRBIpqlJRKpt6Djq5HkNCnQdFsJWz8SS4qZ8k9I+bszs+oAcG8p6MlRiVrhCPNpzeNfEydRqve/m1BJIfG2BvTgKaFe+x3/S0emcXy9braB+2NeNWnXhFf+0ShYcuyKH5jpyhtIrI1MPL18Ui4YLlxxe4RhwyhPuyz1zOAmqmqheCxmxWvAB8g+Rpyhk0+ddTQYiSq0oqLoKKYyA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(13003099007)(18002099003)(22082099003)(6133799003)(5023799004)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GloOGldQnjkyzuD6i1217oRt2UlaGYTJaXvKxYAyXK4jgbanu+LquN2e0iLMYjC/sm5i+LyBzSUfV/qQkIAnj3CSOWrQGU5VyQJbDuM/yRZohUmrLuGZeZe4uGKad+Io/PA9LP/Rnc+H+rwL63N8AUSVrkxvTPBo4zWy06b3l9zRI9buxiYkRkYgTTbI7f+L+ri1LKc24VSUFO9Tc0RSdhR4c06QrbAmumE9pdB/4SdNPqFC22oohzQTyfcZGYSgCy9tICp0kp6/D2c71gyvAmy3FewY/puTXaOs9gtsz8zcEYsfrVGd+pqs24CWEGb4bUGF7aPRrV/rdxvJwjHvlW8ijNaubwA7x6kpisLaSDnPnMu0dFmsAzTJekMf17XL09PfQzg/nAoMwXCjib33HuI7XEGsigwf/7qDFWTmTW1U5kGScTyGHGR0roE8p7Fx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 21:03:36.0791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d4b59f-4dd8-4687-66ac-08dedd34608c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4435
X-purgate-ID: tlsNG-16d1c6/1783544620-F81E568D-655A63EA/0/0
X-purgate-type: clean
X-purgate-size: 4042
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[3];
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
X-Rspamd-Queue-Id: 56F0B72A680

From: Roger Pau Monne <roger.pau@citrix.com>

Deferring the p2m unpopulate of the MSI-X table region to after the BARs are
mapped in the p2m is not needed.  The aim of vpci_make_msix_hole() is to
cope with the BAR containing the MSI-X table being positioned over a
reserved e820 region, by making sure the MSI-X table region is
unpopulated on the p2m. Note that reserved e820 regions are identity mapped
in the hardware domain p2m by default.

Doing it before or after the BAR p2m changes are done is irrelevant, hence
do it ahead of the p2m changes, as that's simpler.

Note that vpci_make_msix_hole() should be invoked strictly after setting
bar->enabled. The movement of vpci_make_msix_hole() is OK since
bar->enabled is set in modify_bars().

Take the opportunity to store the memory decoding enabled bit in a local
variable.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Note that this should not be committed until after the bar->enabled
setting movement in ("xen/vpci: only check BAR validity once")

I tested this with hot-plug as described in 7c24d58a6e64 ("vpci/msix:
check for BARs enabled in vpci_make_msix_hole").

The return at the end of the function will gain a purpose again after a
later code movement patch in the series.

The new_enabled variable will gain 2 additional uses later in the series.

v1->v5:
* order after ("xen/vpci: only check BAR validity once")
* preserve behavior of only invoking vpci_make_msix_hole() when memory
  decoding toggles from 0 to 1
* add note about vpci_make_msix_hole() invocation after setting bar->enabled
* use local variable
* Jan offered an R-b tag in [1], though I hesitated to pick it up due to
  changes, and it was offered prior to 7c24d58a6e64 going upstream
[1] https://lore.kernel.org/xen-devel/e2c4944d-d089-490c-879d-b6baec5e4cae@suse.com/
---
 xen/drivers/vpci/header.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 1fd4832033e9..cf9d0bac8876 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -134,19 +134,6 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
         }
     }
 
-    /*
-     * Make sure there are no mappings in the MSIX MMIO areas, so that accesses
-     * can be trapped (and emulated) by Xen when the memory decoding bit is
-     * enabled.
-     *
-     * FIXME: punching holes after the p2m has been set up might be racy for
-     * DomU usage, needs to be revisited.
-     */
-#ifdef CONFIG_HAS_PCI_MSI
-    if ( map && !rom_only && vpci_make_msix_hole(pdev) )
-        return;
-#endif
-
     if ( !rom_only )
     {
         pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
@@ -529,6 +516,7 @@ static void cf_check cmd_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t cmd, void *data)
 {
     struct vpci_header *header = data;
+    bool new_enabled = cmd & PCI_COMMAND_MEMORY;
 
     if ( !is_hardware_domain(pdev->domain) )
     {
@@ -546,7 +534,7 @@ static void cf_check cmd_write(
      * decoding one. Bits that are not allowed for DomU are already
      * handled above and by the rsvdp_mask.
      */
-    if ( header->bars_mapped != !!(cmd & PCI_COMMAND_MEMORY) )
+    if ( header->bars_mapped != new_enabled )
         /*
          * Ignore the error. No memory has been added or removed from the p2m
          * (because the actual p2m changes are deferred in defer_map) and the
@@ -556,6 +544,12 @@ static void cf_check cmd_write(
         modify_bars(pdev, cmd, false);
     else
         pci_conf_write16(pdev->sbdf, reg, cmd);
+
+#ifdef CONFIG_HAS_PCI_MSI
+    /* Unpopulate MSI-X table region, so accesses trap into Xen. */
+    if ( !header->bars_mapped && new_enabled && vpci_make_msix_hole(pdev) )
+        return;
+#endif
 }
 
 static uint32_t cf_check guest_cmd_read(
-- 
2.54.0



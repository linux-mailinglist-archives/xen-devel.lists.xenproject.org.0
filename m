Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OFzSA1G7TmrJTAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 23:04:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A90772A689
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 23:04:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=3LhAIgOW;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357351.1611800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whZQv-0004Sc-GL; Wed, 08 Jul 2026 21:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357351.1611800; Wed, 08 Jul 2026 21:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whZQv-0004Q6-BC; Wed, 08 Jul 2026 21:03:53 +0000
Received: by outflank-mailman (input) for mailman id 1357351;
 Wed, 08 Jul 2026 21:03:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1whZQu-0004NW-Hz
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 21:03:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whZQt-00CYbB-HL
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 23:03:51 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a4ebafd-bab6-0a2a0a5309dd-0a2a4502c1f2-36
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 23:03:51 +0200
Received: from [52.101.61.60]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a4ebb35-5a27-0a2a45020019-34653d3c37fb-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 23:03:50 +0200
Received: from CH0PR03CA0362.namprd03.prod.outlook.com (2603:10b6:610:119::9)
 by DM4PR12MB6664.namprd12.prod.outlook.com (2603:10b6:8:bb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Wed, 8 Jul 2026
 21:03:42 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::55) by CH0PR03CA0362.outlook.office365.com
 (2603:10b6:610:119::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 21:03:42 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 21:03:41 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 16:03:41 -0500
Received: from ubuntu (10.180.168.240) by satlexmb09.amd.com (10.181.42.218)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 14:03:41 -0700
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
 b=KN60nnxFFwJSSDrfCC10oE3/sBu/YBouEwTCQY95C6DDJx3wUXx5c1qq1LKc1Zy08sTRARQENz6O5HWzU7+AMVna4Z/e8HsF3Y4eOiI/LhC2Nn9cJlFYONIz6BoC9dfUEhqoDxpYq5s5J5hGD4ULYdk6Q/oZ/wqK1acSWLYuAgR57nO1IwTfhOo576ECCzO9YzuqtpQv4m0xEmEHXrVkYBy2G0wMh39h0Avwt79pkAcE1KTfV4AFuRhwhEy5yB/0m+X4BZCftZsyJcpjijcX/Z4gAMHtqIu769O4SMuJlAIVVNk3pfRKncTu68X7nmMP1/UVcfk9YIq9DYg/hFVuoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVUodHck0vEaTTblxDg5RDc7BDsFcyAxQrfUdezpsHI=;
 b=Y3OtsuuQlIOooIaC0Eo+vexfSM5FFyzx0QGooESIQcECCDssq6SsnfdDn82FhNLdMaE+Y6hQdpMAWa6iNS/F3Y16eZ3Isw9ex2bNnD+/rvw9jXzignRLv+57Uy3Cln0HCL3+VPJVhXKTnU7LqUbtl6QQcFOoX9zUPsyMnY3X2vPAzM0HUEt3gwbW8LRB0d1YXRjk5N9VnzJ6vQFi/+E6zzedgavyEYuTNFmo50O1TIvYDL6JpNbPnALmf0b+KQ18P6GbANd7X3MH8HHoEPqF9s9PsfFyhmbbQsELvLeuvx1kOgOwwlUvOVjZzYDuqqchDTkG43ut1oWmadtl7w+b2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVUodHck0vEaTTblxDg5RDc7BDsFcyAxQrfUdezpsHI=;
 b=3LhAIgOWB8fP2T9tqWVx9jqWMhf294LShZHBbaKGU5i3/4CsK+TMHggBkbKdLoasqv4fIZ+zLg1rUMyNxIrJPOKoLXzDkhCHxzw83Ip+cM3M+pweDI8gxsmTufUGwLeOtrifszAPjePHOh1GhIdRyhP1assZek2wM7oY8LFn6pk=
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
Subject: [PATCH v5 5/9] vpci: simplify handling of memory decoding and ROM enable writes
Date: Wed, 8 Jul 2026 17:02:20 -0400
Message-ID: <20260708210233.922275-6-stewart.hildebrand@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|DM4PR12MB6664:EE_
X-MS-Office365-Filtering-Correlation-Id: 05df2474-5f02-41a2-c0ad-08dedd346408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6z0ELKaOZ9oqmhr9HvY8dox93fJIWG8HluOXzKVseqFiJMZqCTxqLB2Nv8RuVpR9DZaFgoq8V0KtGUOcruUqyo7+EN2a/FTf1di7xhjk9dHuJ4gltIwkZCN32Hsqhiw611W37BOiwcn7N0X465rIlGRYOY5Q6N9SUHXYyMasXonSBg04+6+aTCL8SqvPS9a42lvgbEoIzVxeCixs5bALum3MUnN6Gzt+a7g9EmRJp8g98L9yekw/cEp5oCJME1Rn4I6CVpwvuNnfqBpMuJqTuyJ7gnfCX6DSEl4WyEkoe22yWnRuSGyL0gClwEKcs0z3qBLQTy+s8K0afBdgZifmdPYRognMjmY+bWvuwNBek2Paoif9t6NOjab2GZKTWCx+bGGFrsMTylANjRMGEL76A5/f+kQNGBIL7kcQahqx+ryLMBHoOUQakl6FvNcCePMjR8uLbA6zpYNzxl0ih0BrWvm99y+tyCDv1Iipyg87rA74WZKMvvm4LcHCHPO8BwS0AJqSidjLKAZXJeJ8Z87i46MDzE4nGZlpsOLkfgl35dlNBgjlwgPUlx1YsGVR6j2aNO39R5GzoQZuFYm/+lSCTp9B7XIteTZDTjIakJwpS3O+htGSGh7dfxz2EXEB+4mndTmixUw4J9va0dAw/mHNBdcDPZfdUx+spCEqnpuG9/oc+tbmdP7f2J3XZ7ax0aCq3bCNfSOgj2ARJFCwGbrvUw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X/SjnTYyp95Fy6Iq9DMjGbQLlUs5uU+Gf11Sd0fSdhmJ9BeJpXoHFWTX6eoL1RtpqUXjkpENRKKe6xpGut2R5e7TSFis45k+/GQB8qYgGScAB2g4Ep8RihUE6zSCTrOxYJC7El0GhEbmL3opwcO4wIqUKRxu5PikJL+kZx2gmi0XUj5TjJAmMrodqmFLPfdyMdtdWkuwig1ZXiWKuOMegjYbC4dv2RPIuWUOsZVdD2uBTJ8yNyVX4zph+B83LLDrei95IsQMF4S6/tKjSOGuq3lfwb30C/wEmallKJlMJFhmmG4q1ae7m7umZOsowmbG+sAaDh/S+fRJ//npeJrFofTBRwuwn0n99orKQshR2G1SSkgY2JWaLqq1IrfWm9W1Jg1fws3/o6loiVXr4aQrB89wDRD94IuPIqQJ6FFY5JEXEcWKD+vKgt8fk5/hvg11
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 21:03:41.8972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05df2474-5f02-41a2-c0ad-08dedd346408
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6664
X-purgate-ID: tlsNG-720697/1783544631-4D70D7C5-F7AD733C/0/0
X-purgate-type: clean
X-purgate-size: 7442
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
X-Rspamd-Queue-Id: 8A90772A689

From: Roger Pau Monne <roger.pau@citrix.com>

Deferring the actual write of the PCI register bit, either the memory
decoding or the ROM enable is not helpful, and adds an unnecessary amount of
complexity to the preemptible handling of BAR related p2m modifications.

In the hardware domain case, whether the PCI register write is done ahead
or after the p2m changes doesn't matter, a hardware domain has plenty of
ways to mess with the PCI register state if it wants to.  Any poking at the
BAR p2m regions ahead of the guest write having completed will be
undefined.

On the other hand, for domUs the memory decoding bit shouldn't really
change as a result of guest actions, and should always be enabled.  Guest
toggling the memory decoding command register should only result in p2m
modifications, but no propagation to the device PCI registers.  Having
memory decoding unconditionally enabled ensures the domU attempting to
perform p2m accesses while the p2m changes are taking place will always
access the BAR contents. This is not the current behavior for domUs, so add
a note that it would preferably done that way.

This allows to get rid of modify_decoding(), as writing the command
register can easily be done without the need for an external helper.

Resolves: https://gitlab.com/xen-project/xen/-/issues/98
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Since the full command register value is no longer needed after p2m
operations, we could reasonably replace the cmd parameter to
modify_bars() with 'bool map' immediately after this patch. However, I
chose to wait until the end of the series to reduce the diffstat and
make review easier.

Note that in rom_write(), when rom->enabled and new_enabled are both
false, rom->addr/guest_addr will be written twice. This quirk is
preexisting, so I didn't think it was in the scope for this patch to
address it. Do you think it's worth addressing separately?

v1->v5:
* rebase
* reorder within series
* in rom_write(), retain bars_mapped / enable toggle gate for invoking
  modify_bars()
* add Resolves: tag
---
 xen/drivers/vpci/header.c | 80 +++++++++++----------------------------
 1 file changed, 22 insertions(+), 58 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index cf9d0bac8876..908adf0b3f4c 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -102,47 +102,6 @@ static int cf_check map_range(
     return rc;
 }
 
-/*
- * The rom_only parameter is used to signal the map/unmap helpers that the ROM
- * BAR's enable bit has changed with the memory decoding bit already enabled.
- * If rom_only is not set then it's the memory decoding bit that changed.
- */
-static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
-                            bool rom_only)
-{
-    struct vpci_header *header = &pdev->vpci->header;
-    bool map = cmd & PCI_COMMAND_MEMORY;
-    unsigned int i;
-
-    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
-    {
-        struct vpci_bar *bar = &header->bars[i];
-
-        if ( !MAPPABLE_BAR(bar) )
-            continue;
-
-        if ( rom_only && bar->type == VPCI_BAR_ROM )
-        {
-            unsigned int rom_pos = (i == PCI_HEADER_NORMAL_NR_BARS)
-                                   ? PCI_ROM_ADDRESS : PCI_ROM_ADDRESS1;
-            uint32_t val = bar->addr |
-                           (map ? PCI_ROM_ADDRESS_ENABLE : 0);
-
-            header->rom_enabled = map;
-            pci_conf_write32(pdev->sbdf, rom_pos, val);
-            return;
-        }
-    }
-
-    if ( !rom_only )
-    {
-        pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
-        header->bars_mapped = map;
-    }
-    else
-        ASSERT_UNREACHABLE();
-}
-
 bool vpci_process_pending(struct vcpu *v)
 {
     const struct pci_dev *pdev = v->vpci.pdev;
@@ -202,10 +161,6 @@ bool vpci_process_pending(struct vcpu *v)
     }
     v->vpci.pdev = NULL;
 
-    spin_lock(&pdev->vpci->lock);
-    modify_decoding(pdev, v->vpci.cmd, v->vpci.rom_only);
-    spin_unlock(&pdev->vpci->lock);
-
     read_unlock(&v->domain->pci_lock);
 
     return false;
@@ -241,8 +196,6 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
             write_lock(&d->pci_lock);
         }
     }
-    if ( !rc )
-        modify_decoding(pdev, cmd, false);
 
     return rc;
 }
@@ -534,22 +487,29 @@ static void cf_check cmd_write(
      * decoding one. Bits that are not allowed for DomU are already
      * handled above and by the rsvdp_mask.
      */
-    if ( header->bars_mapped != new_enabled )
+    if ( header->bars_mapped != new_enabled &&
+         modify_bars(pdev, cmd, false) )
         /*
          * Ignore the error. No memory has been added or removed from the p2m
          * (because the actual p2m changes are deferred in defer_map) and the
          * memory decoding bit has not been changed, so leave everything as-is,
          * hoping the guest will realize and try again.
          */
-        modify_bars(pdev, cmd, false);
-    else
-        pci_conf_write16(pdev->sbdf, reg, cmd);
+        return;
 
 #ifdef CONFIG_HAS_PCI_MSI
     /* Unpopulate MSI-X table region, so accesses trap into Xen. */
     if ( !header->bars_mapped && new_enabled && vpci_make_msix_hole(pdev) )
         return;
 #endif
+
+    /*
+     * FIXME: for domUs we don't want the guest toggling the memory decoding
+     * bit.  It should be set in vpci_init_header() and guest attempts to
+     * modify it should only lead to guest p2m changes.
+     */
+    header->bars_mapped = new_enabled;
+    pci_conf_write16(pdev->sbdf, reg, cmd);
 }
 
 static uint32_t cf_check guest_cmd_read(
@@ -705,17 +665,12 @@ static void cf_check rom_write(
         rom->guest_addr = rom->addr;
     }
 
-    if ( !header->bars_mapped || rom->enabled == new_enabled )
-    {
-        /* Just update the ROM BAR field. */
-        header->rom_enabled = new_enabled;
-        pci_conf_write32(pdev->sbdf, reg, val);
-    }
     /*
      * Pass PCI_COMMAND_MEMORY or 0 to signal a map/unmap request, note that
      * this fabricated command is never going to be written to the register.
      */
-    else if ( modify_bars(pdev, new_enabled ? PCI_COMMAND_MEMORY : 0, true) )
+    if ( header->bars_mapped && rom->enabled != new_enabled &&
+         modify_bars(pdev, new_enabled ? PCI_COMMAND_MEMORY : 0, true) )
         /*
          * No memory has been added or removed from the p2m (because the actual
          * p2m changes are deferred in defer_map) and the ROM enable bit has
@@ -726,6 +681,8 @@ static void cf_check rom_write(
          */
         return;
 
+    header->rom_enabled = new_enabled;
+    pci_conf_write32(pdev->sbdf, reg, val);
     if ( !new_enabled )
     {
         rom->addr = val & PCI_ROM_ADDRESS_MASK;
@@ -927,6 +884,13 @@ int vpci_init_header(struct pci_dev *pdev)
             goto fail;
     }
 
+    if ( cmd & PCI_COMMAND_MEMORY )
+    {
+        /* Restore command register value. */
+        header->bars_mapped = true;
+        pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
+    }
+
     return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
 
  fail:
-- 
2.54.0



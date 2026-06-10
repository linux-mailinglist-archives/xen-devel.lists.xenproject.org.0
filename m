Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8dESFhj5KGpxOQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 07:41:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91087665FC5
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 07:41:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=fckr4FuV;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1333926.1597023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXBgR-0007m5-7D; Wed, 10 Jun 2026 05:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333926.1597023; Wed, 10 Jun 2026 05:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXBgR-0007hG-20; Wed, 10 Jun 2026 05:40:59 +0000
Received: by outflank-mailman (input) for mailman id 1333926;
 Wed, 10 Jun 2026 05:40:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1wXBgP-0007d2-85
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 05:40:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXBgO-00FjXF-Dr
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 07:40:56 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a28f8c1-bab6-0a2a0a5309dd-0a2a45059818-40
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 07:40:55 +0200
Received: from [40.107.201.29]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a28f8e6-aaa8-0a2a45050019-286bc91da918-4
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 07:40:55 +0200
Received: from BL1PR13CA0008.namprd13.prod.outlook.com (2603:10b6:208:256::13)
 by CH0PR12MB8487.namprd12.prod.outlook.com (2603:10b6:610:18c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 05:40:51 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:208:256:cafe::6b) by BL1PR13CA0008.outlook.office365.com
 (2603:10b6:208:256::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 05:40:51 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 05:40:51 +0000
Received: from zjiaqing-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 10 Jun
 2026 00:40:48 -0500
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
 b=QLVfHD6uniKvju7wQpT3NVUQeGCP/ixbF1e0L/nBKAaQ4pTIioQf6T2ZixL3LBT/NMQ8jvW3fAKLt2NwP+r13zPx6aw3bcIoDgpxpH7HPjMkrxpMGkKra6EdHxdQMBKE6spPPintdShxMFPvaoBVvjC0gG8DjRQ2g7MItQ+6hihpEm0CkbOw33nTvaK4b5v/ut+9K8bQ7XEePFbxYVFmaAxNCJU7pP0pouT9pHFVx4uIoVLdAgZ4/S5lnCtCiITNCZCwU+iN8M9x/B4fZ6A4ngNreslrhxCkRcrNsFrkMWsoF9F5P8QQAKS0fuctKdrtkj7lF8PG1RaUaxG6voxfxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EK6a2UFU+of/PuSh5uCUJHjyBKBPm7/2jZE4fVYKMsI=;
 b=kVJXYbl8FkXgu+rfTVqOBNkVDnTyiQ1eYMWPIGgMsRSFyyVmcthS42VjBrzgw9Qh1XIlc4IW0/l7t4Tdspv5YrwgMj1WMjplnx4YTakBWqrI9kNPF7D00FwUC95xpGBVDJi3CXkgn7hv15QxuXjVXCgvdovjMVz5AL2HufZgFp2rIb3y7N8Pd0ZgLKv3iOfWKjElOM14vzzWJxhPj0G/LdTkGVIWm4YfqWu5zn4PT9Uwc90ningWbZ6oRlmO2HPb6vP6s+J9jlFKuWo9hQ4NWDRzvgmmOx6gkKmn85/WJlSOxCsNm5dZxRNv05dC4bbxoherRfKxoBGwaNKoe6y7IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EK6a2UFU+of/PuSh5uCUJHjyBKBPm7/2jZE4fVYKMsI=;
 b=fckr4FuVzQHhGdXTBsotQbg3Wp/pdme5vpiqbG5lJ7YjhXySYFfByOXl37x9NgA1bYl8YgLMQpMthI3XxuRHgo8Qx+fQ9EvmsK7XFIQa5ANkwU5yfKnGJLZCFmiZQ5yDsEpWgZKGk7EtU0+cwHYPML216bn892LSYQ9E5E2jhl8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Jiaqing Zhao <Zhao.Jiaqing@amd.com>,
	Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v6 2/3] ns16550: add support for WCH CH382 serial adapters
Date: Wed, 10 Jun 2026 13:40:29 +0800
Message-ID: <20260610054030.1624662-3-Zhao.Jiaqing@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260610054030.1624662-1-Zhao.Jiaqing@amd.com>
References: <20260610054030.1624662-1-Zhao.Jiaqing@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|CH0PR12MB8487:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f7a36ef-e641-4d72-2c22-08dec6b2d4da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|11063799006|18002099003|22082099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	31QOj3dHYF7VKcNKqGdkc7mnAEd68rGqdyzJ1FMKJqY7E1R8vB9FTcN7qIrbfzZoHgsc/v0A65y9Lo6i7hsABy1MsIqRAGl72qcRHuFpJqGCD06vKhbTQFcg841n8CCHo1tGCk/kAi+GEquggPtytARbJ8S0wRfEni1nl8oLYEutvfqaOY2/sOfyk8ZnfG2p1nRXhToW/PIYVX1tyc1vtMs72EESek/Vovr1U1eKnyVxPyKPqf5InmezevotbZKBu2toz4b9eQ69wWephOt1r+vXaQ8WXPDavTfOBm884nusXkQcKelbVcK2XlTm8KcsB1EoXxQoj8tZMJrXv9H9Yrbtwd+e9OWqUDhAqTO8I+sAhU626gAWv4l2WHiApNquIiIWwswqBkqhqvFq75N5jDkhSh7g1cm0s3NESQPkY3T16kSnOhWG2AKEYjSExsNFtQJ7Dw6y9B9bQN1nq8cEivl/BD+cdAptb3aRBjHpFVS4QZDzibMZ2WUKqZ9TM3eclUlhmCRUNDYa1f6E3EV6F8B90cVxth59tMP2wfIDElFlOPz1shV/pCmzMs5WZRuKB9aTGejqiUA70DKglM63b7iw64sOxoyM6SWtiIRxeqDY+BFd5/KtoEBqZzAhAczBs+dxDYmRO8ZpUj891Pk+SfsPsKQegAIiolFLIOdfBsgaNVYp+S/8fUfFEl0ku9xDj3eJzAf5WvlFaFT4OWuK7x2iftyILmS2CF2YGobAcng=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(11063799006)(18002099003)(22082099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RFsOZ6z5jtlIfrY/CTeia3YR23pTI8KLt9PyqKH0IS00zyX7Aj13LLTI6asJwfqbsELj7ZNn71Ba6dUmxYsWHcW3amMSVJ3E6r88CPckvEIvxP0FMFfCHMyEOHPrhDK86TGFSctM8cL5sDOCVyrPGdJpH9ZRF+2otld3YuVo5QmjAYK/zrrQ2ngJPSXn16/NR/KA21X702n+nDDIViEUhYVxd+yUvqzOg8aBpNy2NSwqrlqMTqcH83XFPjqbE1MzECwqkSf14JyIJPygfqw65Nr4/A/oBdFK/43oGNXvU/IBFQmLWWYIcUcCB0Goy5MLLL38FWJzYIgpbuDgSTqFrO9N7XvlzyVlNAlUeedkJb9bdooBK4MeUlKE1GzrcyeV7Fjc2t0N5xi1b8dhpJBBsB7i//rgoAei8lLqNX/oAw4WcN1MU/GQGEoG7IDLPP83
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 05:40:51.0212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f7a36ef-e641-4d72-2c22-08dec6b2d4da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8487
X-purgate-ID: tlsNG-c201ff/1781070055-DAD6F443-F3BAE754/0/0
X-purgate-type: clean
X-purgate-size: 2525
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Zhao.Jiaqing@amd.com,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Zhao.Jiaqing@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Zhao.Jiaqing@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,wch-ic.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 91087665FC5

Add support for the WCH (Nanjing Qinheng Microelectronics Co., Ltd.)
CH382 PCIe dual port serial adapter. The CH382 is available in two
variants:
 - CH382 2S   [1c00:3253]: 2 serial ports
 - CH382 2S1P [1c00:3250]: 2 serial ports + 1 parallel port

This chip uses IO BAR0, base baud rate 115200, ports starting at offset
0xc0 and spaced 8 bytes apart, and a 256-byte FIFO. [1]

[1] https://www.wch-ic.com/downloads/CH382DS1_PDF.html

Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/char/ns16550.c | 23 +++++++++++++++++++++++
 xen/include/xen/pci_ids.h  |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index ed4e29ec25..5a93685da4 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -95,6 +95,7 @@ struct ns16550_config {
         param_exar_xr17v354,
         param_exar_xr17v358,
         param_intel_lpss,
+        param_wch_ch382,
     } param;
 };
 
@@ -861,6 +862,16 @@ static const struct ns16550_config_param __initconst uart_param[] = {
         .mmio = true,
         .max_ports = 1,
     },
+    [param_wch_ch382] = {
+        .base_baud = 115200,
+        .first_offset = 0xc0,
+        .uart_offset = 8,
+        .reg_width = 1,
+        .fifo_size = 256,
+        .lsr_mask = UART_LSR_THRE,
+        .bar0 = true,
+        .max_ports = 2,
+    },
 };
 
 static const struct ns16550_config __initconst uart_config[] =
@@ -1189,6 +1200,18 @@ static const struct ns16550_config __initconst uart_config[] =
         .dev_id = 0x7adc,
         .param = param_intel_lpss
     },
+    /* WCH CH382 2S1P */
+    {
+        .vendor_id = PCI_VENDOR_ID_WCHIC,
+        .dev_id = 0x3250,
+        .param = param_wch_ch382
+    },
+    /* WCH CH382 2S */
+    {
+        .vendor_id = PCI_VENDOR_ID_WCHIC,
+        .dev_id = 0x3253,
+        .param = param_wch_ch382
+    },
 };
 
 static int __init
diff --git a/xen/include/xen/pci_ids.h b/xen/include/xen/pci_ids.h
index 5884a20b8f..15e938225c 100644
--- a/xen/include/xen/pci_ids.h
+++ b/xen/include/xen/pci_ids.h
@@ -13,6 +13,8 @@
 
 #define PCI_VENDOR_ID_BROADCOM           0x14e4
 
+#define PCI_VENDOR_ID_WCHIC              0x1c00
+
 #define PCI_VENDOR_ID_INTEL              0x8086
 
 #endif /* XEN_PCI_IDS_H */
-- 
2.53.0



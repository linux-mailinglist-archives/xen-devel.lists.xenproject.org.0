Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CIeuFhj5KGpwOQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 07:41:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1984665FC8
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 07:41:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=aPi6dKP6;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1333927.1597040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXBgT-0008Ib-Ix; Wed, 10 Jun 2026 05:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333927.1597040; Wed, 10 Jun 2026 05:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXBgT-0008Fu-Fc; Wed, 10 Jun 2026 05:41:01 +0000
Received: by outflank-mailman (input) for mailman id 1333927;
 Wed, 10 Jun 2026 05:41:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1wXBgR-00085X-VV
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 05:41:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXBgR-00FjXF-C3
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 07:40:59 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a28f8de-bab6-0a2a0a5309dd-0a2a4507ba1e-6
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 07:40:59 +0200
Received: from [52.101.48.20]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a28f8e9-229c-0a2a45070019-346530146d18-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 07:40:58 +0200
Received: from BN0PR04CA0125.namprd04.prod.outlook.com (2603:10b6:408:ed::10)
 by DS7PR12MB5840.namprd12.prod.outlook.com (2603:10b6:8:7b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 05:40:54 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:ed:cafe::33) by BN0PR04CA0125.outlook.office365.com
 (2603:10b6:408:ed::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 05:40:54 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 05:40:53 +0000
Received: from zjiaqing-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 10 Jun
 2026 00:40:51 -0500
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
 b=O12o6DkoMS0JQksgxMRiHgT9DOgLK1c1kBWhExT/dWMYxr1UOi1hHsAAZ3L+7IiOfPnZpoKSccNH8avNyrbKPkSKSTV0oSKWOd7thyrXY+bAYiydzieuc/uiDwmIMZaIOk1SOmm9/xq69RvzKfpLRBbJRVWcEpSlCkjpPj7e5/sO4N9sPRKJo1C0DfvxxnQ7lhWh0OeSBYAxN15GII+QaU3t93DIsbQh0hx4MSDnYEUfIdqTQox29yrRaiHQjr4I5xN2aRlyfTyvkrDMBhB9LsjDWKRmGvdkpEqvuQAyvAMONdNuUhbz+ORqOVSGN+pPxjvhWpvlC0D0zgE5ohM39w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZqNNzSCEegZxbz7cGNIdz/058lNDyqEA0VLDyA8T6k=;
 b=a3QXFkDfqfABqL1X88y6+Y4NDPRcIgEHDl1iUJ7kxO08Nw8mm+ZvRvhh4EvuJfGFbEAQyADWVb84DB2gD0nxLJFVQTlHco1uAvYdDfFMcwuLpqacKAVuhRhN12pyVf9cBm+H/+SK6HLGLpsTr9tWccHUn3IPltmRhmbbNjAeNxu6QIdL8jdQi2HPr8xWtdzNFyUpoecAiHM1owK9Up8ELKQgimXPX/TWpZJzpN9/kmqAi5DvGH8z6ugscb2aqjwPY0i5oly/v9aW6rNeOEoaBKxNhdYeVmJhND1mJ/AMqcoMj4GmAiE+CGVFsU2PL955t5Ac3uFarzE30lRpBNqHvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZqNNzSCEegZxbz7cGNIdz/058lNDyqEA0VLDyA8T6k=;
 b=aPi6dKP6MLmPriMdPKZ7Pge65nq+QjEL4AdVxt67mtLignp6fdthcvuzNp/amKTOrGmF1/3ocq13Xa8+hbFxw6e2H8lDhnKkEZgVLk1oM4BxDoBhmY5/F9VuvZgdpqt1dbedGliWRSizJfcDzna52s7lT/omkC89L9eCFUOj3Ag=
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
 Stabellini" <sstabellini@kernel.org>, Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Subject: [PATCH v6 3/3] ns16550: add support for ASIX AX99100 PCIe Multi-I/O controller
Date: Wed, 10 Jun 2026 13:40:30 +0800
Message-ID: <20260610054030.1624662-4-Zhao.Jiaqing@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|DS7PR12MB5840:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa556da-a3e5-434c-a55d-08dec6b2d66f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	n7+fatnGwo+LD4OdPxUSO2/7o/Nervfdd1+v2wY0zMIRcBb5KXMBCwtmhe6dOTL/9yyDORmtZ9iE6JSviJMKrX2m6CNeRUzlqotUmdmAAnUL285F9fEINqC9oIrTcK2WKDnM9sjYburwmpYwWENbaAWV22AZ5cWUdXCsoZ6r7eAeUCI2FecqEzP85uXEbx9Ag+7YW8HXgqjOcIgP67XY6yVQMi6zfqOJ2/tsBAFsKjGkGLaTKuJun2s+vZeVoBydTEvRdGuEym/erX2YtNcs88Fn2l0aVqb8kQFQ3jg0pY7yVCwx2Fb81G4iE38k84IfQr0/LTHtGxcdYCDVbVEhMIQxAlbweRToZHZFpS/T+5csKItLlz3D96qdEuw//2m8SVvCDteaSQenK1biPbDZbS4c9zvp8AXOMfriCEUOqWb3eiECO5JKUtvq+vftPIe83vInuo9qs9/Rn9wCq/tQj9wA1n/QPo+Fodt8lwmmwXanE/AUqPmaJCJwFo4zf+BoG7ednICDFvihnS7qd9VKnppiiG9fSIBN5OW84kHhOBYZo1kN+A1GhrE1YGr/PXCIi0qeG9hqfk7bSpGnYDgvTK1p/yvW/G0VcDFtQlsyfI7JgUfl6NWUeQSwXlU3reOJnYZLOyejPGWY1ODQM2B+fWkxuZztkrCD3yweAYln1y76jgiNsqG2TTJSP8tTApWSq16z+W69hWIPX4ooVK99KCA+UC098uObccBTie5GMfc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6pnNloe3hni9hV1x3RZIU4DmqkLY1BrLZrGhxk/ISIIFgOhj7WN9Mxbe/87j1UA9gyw0CdZfu4+NA+MgSE2dQJW1v2k+Z9I85mPSZv7SGfJfoLcE/qausEiWwiGTZJvrp9Wlx9Ea9WpXeFc2pj9Q6XRZO/DXpalB0PM0P5mjgylXH9zdwnctrE/c/o4ihESWd/24+vO9mdvx1TqiPWxmMUnVhPYoFylb/szWFPObG5IwBEGXJDoBeXwu5EImiMGu3lrqmcrTZDV2zU1rUslNE9Xsz8nC5uXDdQqaB9E1wkiB84xDmIalMfOkeaX+8TuZpggelSYeCGRAMBj6kh4lOfXxrpmbOWemSSLzTplUX7b81VHykTd6JDrM8RRQZ2lBfNib7N1MlxaS3kUsS91YXr4f7gAS3MyoLvxYNOvajH9uWViFP1krtdLe8X8kD7t4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 05:40:53.6915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa556da-a3e5-434c-a55d-08dec6b2d66f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5840
X-purgate-ID: tlsNG-ef75cf/1781070059-23F7EC48-291A54D1/0/0
X-purgate-type: clean
X-purgate-size: 2104
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
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Zhao.Jiaqing@amd.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1984665FC8

Add a PCI device table entry and matching parameter for the ASIX
AX99100 PCIe to Multi-I/O controller [125b:9910]. Each port on the
chip is a standalone PCI function, with UART registers on its I/O
BAR0.

Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
---
 xen/drivers/char/ns16550.c | 15 +++++++++++++++
 xen/include/xen/pci_ids.h  |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 5a93685da4..1510cf143f 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -96,6 +96,7 @@ struct ns16550_config {
         param_exar_xr17v358,
         param_intel_lpss,
         param_wch_ch382,
+        param_asix,
     } param;
 };
 
@@ -872,6 +873,14 @@ static const struct ns16550_config_param __initconst uart_param[] = {
         .bar0 = true,
         .max_ports = 2,
     },
+    [param_asix] = {
+        .base_baud = 115200,
+        .reg_width = 1,
+        .fifo_size = 256,
+        .lsr_mask = UART_LSR_THRE,
+        .bar0 = true,
+        .max_ports = 1,
+    },
 };
 
 static const struct ns16550_config __initconst uart_config[] =
@@ -1212,6 +1221,12 @@ static const struct ns16550_config __initconst uart_config[] =
         .dev_id = 0x3253,
         .param = param_wch_ch382
     },
+    /* ASIX AX99100 PCIe to Multi I/O Controller */
+    {
+        .vendor_id = PCI_VENDOR_ID_ASIX,
+        .dev_id = 0x9910,
+        .param = param_asix
+    },
 };
 
 static int __init
diff --git a/xen/include/xen/pci_ids.h b/xen/include/xen/pci_ids.h
index 15e938225c..fd424ef55d 100644
--- a/xen/include/xen/pci_ids.h
+++ b/xen/include/xen/pci_ids.h
@@ -5,6 +5,8 @@
 
 #define PCI_VENDOR_ID_NVIDIA             0x10de
 
+#define PCI_VENDOR_ID_ASIX               0x125b
+
 #define PCI_VENDOR_ID_PERICOM            0x12d8
 
 #define PCI_VENDOR_ID_EXAR               0x13a8
-- 
2.53.0



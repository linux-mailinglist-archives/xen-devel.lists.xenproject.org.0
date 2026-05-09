Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Da5QCz/B/mn/vwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 07:08:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AFB4FE16E
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 07:08:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304451.1577472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLZu0-0005z9-2e; Sat, 09 May 2026 05:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304451.1577472; Sat, 09 May 2026 05:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLZtz-0005wD-SO; Sat, 09 May 2026 05:06:59 +0000
Received: by outflank-mailman (input) for mailman id 1304451;
 Sat, 09 May 2026 05:06:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1wLZty-0005w7-E5
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 05:06:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLZtw-000QAm-Er
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 07:06:56 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 69fec0a5-5cb7-0a2a0a5109dd-0a2a4504c1ce-44
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 07:06:55 +0200
Received: from [40.93.198.30]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 69fec0ee-1dec-0a2a45040019-285dc61e0a58-3
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 07:06:55 +0200
Received: from CH0PR03CA0387.namprd03.prod.outlook.com (2603:10b6:610:119::21)
 by SA0PR12MB7073.namprd12.prod.outlook.com (2603:10b6:806:2d5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Sat, 9 May
 2026 05:06:49 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::19) by CH0PR03CA0387.outlook.office365.com
 (2603:10b6:610:119::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.20 via Frontend Transport; Sat,
 9 May 2026 05:06:47 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.8 via Frontend Transport; Sat, 9 May 2026 05:06:47 +0000
Received: from zjiaqing-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sat, 9 May
 2026 00:06:45 -0500
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
 b=D76Aco2fN+eH5WXgyTU3cdfSsdhLnQJR7ybTev68wqNUhK5Y7wz7kaprn7vZ37P4hUN0GblIffTIyzm4+nRNjr2lcqpO+yl2yQ85LFNUVW4trGIx9tLTavYg17KeYE4qXmHa5XLyQ6krsMDsLmiJsMb3fBsRDshlWXlfsFM09rIEL6voJsrrYxIDcp9DwwhT/LLxSckuqOeoPbiE3q13kA61hzlWrVs2oixrWki1tKLXD/HSJeM8vd3mMghlqGu6CqCtTjxCEBj+pElEWo9m71MK2vuQ7vo2F41pVamCdlTPQ2gNOdh1CCIWYmeCpil17NCFWfqDHNm4xOLxXLUnAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOKg+8L7DZ2nsIB6/+JL5BYj/mjNp6wkTWTDRtxkxYg=;
 b=jXwGHF9dNSoRxRhzJ/XROUnpCNNFEYhsnsoJCEHuvnTG7JFRP4v6ERDi2Lk2e4h7jnOuYhalcYigznpXjrvD7CK3DPSu0H9Fiz8faB3zOZRerg9lxSS6crwNBMn75vLXBI9+uTt0/blYElCiXQmQv12uOPtJKj7J4LsUWt4shmvKMXWYZ3N4sFqQGzlKMf7oNR4UPS67I/U0FEuGlYh3SHBZtjREi34mipiM3zdxAaT4OtYVD9iiiIKpDJ8TvvDYWJcCRPVUllPu5P3ynytAilqj7LqfCGD4Zn/pm6zj4M89zRugcyBxzt/YL8GfPJKAAwg8OCgEWDHdkn/Rd/KrWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOKg+8L7DZ2nsIB6/+JL5BYj/mjNp6wkTWTDRtxkxYg=;
 b=5AWRogSbvIfQF1swpeli6y8myMjdPg5iDej+taiudoiTkUzLBFEsL5owN1lp4BVx6toQn26ZuHmg0eEv3RJVsN9dbvfb2yQuSs4lahkLx9NaMdm6aCRDy0Ut/9TxXTnHQ6VbqpXUlBqjRkiBjfrJEnl/cM70uWlLnlFPeu72lBM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
CC: Jiaqing Zhao <Zhao.Jiaqing@amd.com>, <xen-devel@lists.xenproject.org>
Subject: [PATCH v2] ns16550: add support for WCH CH382 serial adapters
Date: Sat, 9 May 2026 13:06:28 +0800
Message-ID: <20260509050629.12043-1-Zhao.Jiaqing@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|SA0PR12MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c7621fb-1c8c-4568-1671-08dead88c5d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	AEc1ip/3DTDPCgyUHKkcgY7v7sxWrfww2NYiXmbjl/WyK8/ugzfFQECmF4eveLCxBUakNHx+DaPEeEXYi0GuoBpxIRtM4YOOb3U3Q1GE/aZ/f2rJn3ucwS0Yn+Jngj5c1pglD+AQ+TdX8MXKc7nf0NDDlqFDD9bVmmKRJYfR4CZYaHxNK9CAkIy1kJ+UnRUgBIWX7AQqwbX98YTAbEaoWT6TkTplDJOuOhzxzDAegf+r9nJ1bHiwbQsbIREgBG4D8CbIGkuKM8qB4J2gfkKL2UllP+m1TdiGEot0hLm4Jfgvb27hJkpdfEB4Rx6bm+EOPhHFbzLatDf+tiAuJ8r6JjPLzULpMX8L+rAFJrVZ5UqxGPYSf+lpHyIKW3lXUd4ndbmGUvDSMQoP1wiTU0qAU0Z1djaaFVdtBoSeLX0JI9fc58Tc6ULSg97QcDjtQVhHFNpooi+TwN+fEoAz88zx7hUf1tfpD4fpJBc5d8Tt68Zc+/qO1LWyB2JQqdEgCO2lQdRnKZz1i6Zgnn/lbi6Wwj6Q5/j+crEs6jjSXxsM2DZD8i15kAqJ1h2/a2zL2Y5PWHBmIC4rqJK+jK8sTD8/CCDkur3FyRGRXM6ntc3fJki+HNuunT5jodCKpFikYY/mVPAGJkfLJYduUxdtZPkWBmEUpNmEbtER/rj4BUD59LijIXsKtEjCtjHtRXxrYFa2
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xjps7H6XNUlxQTtwpIWE24kyxMACd2Btv2mlaOvUc3gbyRmh42HNbOPu6Wcj3AgoK3HU6BiWa97SoPW+nUeC339q/dNtH1mnIVxhm9rHOaAqGeFWDizNvJdE7xtaFNHR8VKanBEX2QHer8a7gsEgx10pq96lsD1H9AiIsgzGq0ZwNKkJD9FC5x5RIOkGlKQUxqM4KYYT2xWmg5aUM5Q4R2l7c23XZBduDmeAUmlya0h0xC6bAf5AfG1xeomaOJ70aG1ThzHsRBuxDgBdZQgNiySa/NwchT+BZ5wxeVs8uOJS9XFsxyvBoT6T/9vRmpzCN3EM4r7BLg5pMovgCMu36mXL4m24yzOsDU0yoOH+u7sWQjvc8VjPdx4smVaw2jmg6bTxsj6urWyAcZRCzHF66FMlmYiT4D69s1pP8rIQd4voa/xYHB9ub+BmEc7aU6KM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 05:06:47.9179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7621fb-1c8c-4568-1671-08dead88c5d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7073
X-purgate-ID: tlsNG-ebf023/1778303215-4197A3FF-1FAA5359/0/0
X-purgate-type: clean
X-purgate-size: 2526
X-Rspamd-Queue-Id: 70AFB4FE16E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Zhao.Jiaqing@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[Zhao.Jiaqing@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Zhao.Jiaqing@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Action: no action

Add support for the WCH (Nanjing Qinheng Microelectronics Co., Ltd.)
CH382 PCIe dual port serial adapter. The CH382 is available in two
variants:
 - CH382 2S   [1c00:3253]: 2 serial ports
 - CH382 2S1P [1c00:3250]: 2 serial ports + 1 parallel port

This chip uses IO BAR0, base baud rate 115200, ports starting at offset
0xc0 and spaced 8 bytes apart, and a 256-byte FIFO. [1]

[1] https://www.wch-ic.com/downloads/CH382DS1_PDF.html

Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
---
v2:
 - Reorder entries ns16550_config to keep it sorted by device ID.
 - Rename PCI_VENDOR_ID_WCH to PCI_VENDOR_ID_WCHIC as WCH has multiple
   vendor ids.

 xen/drivers/char/ns16550.c | 23 +++++++++++++++++++++++
 xen/include/xen/pci_ids.h  |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 878da27f2e..cf10a06a3d 100644
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
         .mmio = 1,
         .max_ports = 1,
     },
+    [param_wch_ch382] = {
+        .base_baud = 115200,
+        .first_offset = 0xc0,
+        .uart_offset = 8,
+        .reg_width = 1,
+        .fifo_size = 256,
+        .lsr_mask = UART_LSR_THRE,
+        .bar0 = 1,
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



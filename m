Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K/u9MVYBH2pVcwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 18:14:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A576301D9
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 18:14:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=ShEEa4JZ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325246.1590754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wURkl-0003wL-I8; Tue, 02 Jun 2026 16:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325246.1590754; Tue, 02 Jun 2026 16:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wURkl-0003u8-Em; Tue, 02 Jun 2026 16:14:07 +0000
Received: by outflank-mailman (input) for mailman id 1325246;
 Tue, 02 Jun 2026 16:14:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1wURkj-0003fi-Nd
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 16:14:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wURkj-00FG85-47
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 18:14:05 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a1f013e-e002-0a2a0a5209dd-0a2a450c91e8-30
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 18:14:00 +0200
Received: from [52.101.46.71]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a1f0146-62f1-0a2a450c0019-34652e477992-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 18:14:00 +0200
Received: from PH0PR07CA0071.namprd07.prod.outlook.com (2603:10b6:510:f::16)
 by LV8PR12MB9716.namprd12.prod.outlook.com (2603:10b6:408:2a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 16:13:55 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:510:f:cafe::a5) by PH0PR07CA0071.outlook.office365.com
 (2603:10b6:510:f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 16:13:55 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 16:13:54 +0000
Received: from zjiaqing-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 2 Jun
 2026 11:13:50 -0500
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
 b=iRY/7TIPqFV49hixGWu7RUL8abSfIfUsTMJJerP/O7RWj1uS/NDsPQKDzv3sq/ib1NaVTrBTs6v+0R9oGINwzvWXpC4jZ96Gb2iFTeh0Ykq6TePjz0pacCKfshWD54K7ZohdwGroDf9HiGIIotS4w2SPmDqcYAydDRCoOrC4u4IE2xWqxtxUNkIULgux4907anUMddtYkQSOEWcPotoSZVdKoasGIJDP0SzFA4EF1qopFNqbL1SoiD9A2Kg7tfIrqg5Q44SdfRJB6w190u935r3kuOS57v5QI1PdHaY6+FO1bKU5SZmHv91vLFeaihBBSE2yiRQfkgC3kT5cFH+owg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EK6a2UFU+of/PuSh5uCUJHjyBKBPm7/2jZE4fVYKMsI=;
 b=bQvVfLJ0Atp8HIsmuQl8RdhNbE++F/Mc3vvv89RMN3bXv3LXYMlESR4Jo3Z5RrT5+5+pgrpJnZE5np0cbQk7jJQnJUYwT8Wy5eWx/4j47B7feO1LjIvwQ1a6Rul8oHciM8kSXTWjBrtCJIAffu/bXGEkfq9X7UB5NITems8AehhbxfXMkYVvo4O39/mAh+jD5JQUvT8v+Gzpypuwzid4QrvJ3HF//Y2YDBFhZk0S8AWka21ZuwLNnb86kcJzPm3b8/+dmNGraKY0+CK6ip/w1I8l9FuJVxtx0Gq5hNa+0AhhGPHw35v/wLi33HrZwXLFXdI0oKq+NHJenHf2BxBxnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EK6a2UFU+of/PuSh5uCUJHjyBKBPm7/2jZE4fVYKMsI=;
 b=ShEEa4JZQ3Gon90iGPl7Hc5tqgXLb7KZ/0Plq0MliNfiazkfIQ5yUk0ExH5C1hWFf48Y/KPy7+6bWzMVGv/ow8BXyCc8JbSPWvDXakrHVbK8v/101Dw9RdKbbglMZnPveUIilnbBv1P67mhhMSKJUKqG/s4DinyPtls7saV0Z+Y=
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
Subject: [PATCH v5 2/3] ns16550: add support for WCH CH382 serial adapters
Date: Wed, 3 Jun 2026 00:13:21 +0800
Message-ID: <20260602161322.1039349-3-Zhao.Jiaqing@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602161322.1039349-1-Zhao.Jiaqing@amd.com>
References: <20260602161322.1039349-1-Zhao.Jiaqing@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|LV8PR12MB9716:EE_
X-MS-Office365-Filtering-Correlation-Id: 61efb724-ec3d-453c-6755-08dec0c1f1c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|13003099007|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	KluvGK84So5ReXMhOustEqgtiAPBZsPuYailhO0gcE+4qD2dJdtm/QLN8eJuR/Nb2XNgPVnRiJ2gYxTSOkkZELOsu5ToYb9qSi6EOMZRWGOKVwlvr2GbtSxd81RCsGkJNo8yf2nea6M1b2VfZOJegYsNpjJfUUzogRXnxRwtgevZh/b/LF9umrwFUHFwmRRrzsm8GttGQjcErxUwZJB5p2brYR7zkuQCs5eovtQmcnDxtNztd1JwV+198UmhqZ595b9xYBIrfoq/jWhaV1JJ8NPKL/JN2YhQUzjL++9CruzPiITQGY/F2FHJCf9Um+LzDwPq5e7+s8rd/y/zIVQegtgSfeI70V9CMitOuCovb9Y9Z8sc0s30DQrCli9cM8/yZapySiRdMplXgfbhj4IH/KWVX5l28P3VaNxcpvj5XL/NHv5jbMiDt8gWcBqgm7qz9OkRCr85hvkg5N+XZAM85kBwtUy5pKoSwz5l+If/YG5yygIB2jDvSbtFaEWXt6S7xT1Ayn/t5QD3RhRAJHha14EbkrkWhXUKuk/3c8YO4pRPS48yIEL6Hm4nuy3uPd+qIFMhS//8jk53EApWPwZ7XI4U/5GWGUA7zGJ9DOIEAOCMZPc9QtCrj2cVXtx8Z3JQIQZCAv+x4AB/F8f3YAt4/iiaVfH6378qSFvcgpaJwl8QY/Dd2xSaSdE5wJE2A339xPfCfIUjwQBX4nJZbloQ4GO8mupIzA9FnHPPBdraVQ4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(13003099007)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9xZ5Go0kA/FzZDB8xOtBBbr3uhsnWsArURV8gpeWNb7lP6MX2ZagjR6ahAQJOJLYPyxDc9/NibzJIUN0cDG07ZQNrxE7NU0QnALNMgnHjD6QWZnCPq1+T834ii0P1Yvurk1SwCePXi6exz1sEC77M6k8w2amM4M5etOdlV51iEXD7NiEA6LeuXHl2OeMvBhTS5lEAK2mZX/VFTPc7Ag5/KVOvRFlRRLsHLD1O1abs+uy8oBwNZJNXhjnz+EcUbPZBySt1OWAgNpMrX1PwlR6o6LO11qKOAaewajV6Q1SYKKyIP7M8LZFcxF5RVKhQC9K/yGT/nrgbdkzXaF6w99h6CLAbVb8oDSEnS8DRjNcAGN1LSsKvyeu7EDtoQhEi5YEW0PnWC2LkVO5ZERY6v0SbtDReZjyGCqUc1fF7nxJPlb2/htW09k702t21MR0c89r
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 16:13:54.9909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61efb724-ec3d-453c-6755-08dec0c1f1c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9716
X-purgate-ID: tlsNG-d25034/1780416840-DBD7BCF5-12FD90A9/0/0
X-purgate-type: clean
X-purgate-size: 2525
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:from_mime,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42A576301D9

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



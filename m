Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEcAO46LAWqRdgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 09:55:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EE2509A82
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 09:55:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305819.1577976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMLU7-00070f-BL; Mon, 11 May 2026 07:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305819.1577976; Mon, 11 May 2026 07:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMLU7-0006y6-84; Mon, 11 May 2026 07:55:27 +0000
Received: by outflank-mailman (input) for mailman id 1305819;
 Mon, 11 May 2026 07:55:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1wMLU4-0006wa-S8
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 07:55:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMLU4-00GmeR-91
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 09:55:24 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a018b68-2eae-0a2a0a5409dd-0a2a4503b7a6-20
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 09:55:23 +0200
Received: from [52.101.61.19]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a018b6a-672d-0a2a45030019-34653d136033-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 09:55:23 +0200
Received: from BL0PR1501CA0015.namprd15.prod.outlook.com
 (2603:10b6:207:17::28) by IA1PR12MB6068.namprd12.prod.outlook.com
 (2603:10b6:208:3ec::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Mon, 11 May
 2026 07:55:12 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:207:17:cafe::a5) by BL0PR1501CA0015.outlook.office365.com
 (2603:10b6:207:17::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 07:55:12 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 07:55:12 +0000
Received: from zjiaqing-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 02:55:10 -0500
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
 b=IpfuizC03LO09Mynfgf709o8gwGPglI+Hpcsgifl91CrK5kNDGabRPQfiM2I4/3RT9JLFszbGjBuaSJ8iz6SICBUM6evdFFB7PScgF+rmwrOOrcparx+7sK8EPSnK2O9qwhcUwLx/3Q5UlnQOO3gcTFM6K/UTiTSE+Qzo7J6MPU8bhqAHanxNj1BQ1lyyaEeyXN4zHB6gWTez+NvbkoGSuJlEVM3UBsnjr29uxlHD01eM9zXQ6Pt53fjvHGOd4tKnjgg8LzI9BU+NRL6c4Lc+rfK8NimOm3b151qcTgoQM1C9RoXbWkPC/0e1Xubt0w1ln9IDKBxnyyQPNUpb3mLjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09anfy61K4RuK/0oYkCwZ4jVFWhXDaLGNl0OpQxgJOU=;
 b=N4qM8qUPUnw45MGNcih5z1Y08eh78JwvD4hz6vlji10OwOJAFvwnjDv5+xbsSjFsQihZ6/mQNlGL1qIg4hn2L3PyybWbUApKWda4XSnXVmP22dau3+m3pPtGbj7LwaczfKasCNQGTanTB0JEwpNcxTWx/kx8P5tvz+beoAUixHAWpVZshFYcyHuiGUi14fFhVKRCcR9Xl5KMW8KPrzL707BDgV4nyOExzKUA0JqzQLHJu/b9dIkMSz3sz8pKmocHMQNAGO+F/xWdBeaFeOTKdhITWUCLIQz+c8xVqIOwz8qVs3xtzY2mRZGujC7DQZOlw5UF/iqIYhESVDxYab4p3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09anfy61K4RuK/0oYkCwZ4jVFWhXDaLGNl0OpQxgJOU=;
 b=xGtKRvFhfDHz27AwzlZn50as7sAcGUXxJV47MPyok4qX1exsS+07V1ZP2jM6oagF5idUkrUHIFgeshdTdmbBV9IYu6zEbyfV/gAW4rZIkb37ppxXDO2Hcb4pcEu89edSU0KjQKBVykLIjKHFCPrjcxN80ZF7KPs46S90dP1C9M0=
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
CC: <xen-devel@lists.xenproject.org>, Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Subject: [PATCH v3 2/2] ns16550: add support for ASIX AX99100 PCIe Multi-I/O controller
Date: Mon, 11 May 2026 15:54:15 +0800
Message-ID: <20260511075415.36538-3-Zhao.Jiaqing@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511075415.36538-1-Zhao.Jiaqing@amd.com>
References: <20260511075415.36538-1-Zhao.Jiaqing@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|IA1PR12MB6068:EE_
X-MS-Office365-Filtering-Correlation-Id: 56c2be1f-9609-47e9-fb2f-08deaf32a191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ut5V74R7F/fwwNvIinpJlqOjcjouS+cbHruBxuOOx0EP/RRxGLKpJ4cjaY1WaXvS6KPu66T9Le0L52cIH3klfr9KCRtwapXZPBJi6Zr5LUpfWGiINfONpqp2LA1RwKikfOSUhc4HA0LVMin2rxNBqaPBU+HUNDbov6hBcxn/ya+VLzXYCvzGsKQNKIo3AiilVorg1o2HClUQhlj0peP1SgWhTSGTiIEfNZsBBu9fwl0lEhNFXXgNqGFihFh5+B3npznpA8/3reN4dqyOgewm97vn1SkPqCy0Os5teLQgwzzwkDdP6mtQYoNi9A9EuV/GbrgPxNZ1ITpzg4G5ogQeC8a7J703oKmTSgmAy0HHpEqWPFnbrb4rYIMB9xp9uYzGOnHRXpaoVWqMv/LFrPEXGzVWs95m8DWA1qz0PmtmdpU5Fvw+zBtKmV7Mk+mOP/rg2Aj8AyvgzCdQweaSO0GoCKLbDOSj3BNPsB/RCSEH/0HIiEXWbRDChPkngmFvQN1xtii0XVBE3nIcSGoIwhWSChvwCwE+47jvEH0E++GNrsSGDZwiI2dCUSDPMlxtsI1BL62u4sk3Wt9KLAfc/rJy1/83VPAGoxDROPGmKQPs+M9f5cHX6afBJ8U5CCgawIu7KErlDwmT/olm09qd9iU0X0Y4JC6mTDXXdB7APTGSc7yOwGQfnfW5hfwYI6Ppt5Buf97YDmOgHZ3Lb/UxIcT58iZb6i8mshfeS7Tv/HIHo0A=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zQorApm8cH+Ug72m2cLknW6DOrP4v6+xr7apVbusuG5DR9xqyL5lipirV3jWNthPxsFJU8+pH3MRekQ+jpPP7FgfK5JNZ9Gz97yWozH5qqX8ge+QLjAUYIf0lvVJiPS4tvp9ZSFZT7T90ZtdwMjNt+RBlfomPCDTlEIoL5+wqE1t6ls1+Bn3ESuN8L1egwkhX2nyrnKUGGEL2wi1Hp3SVAQDOfI/dqgZ8j/iPs9kl3Qa3bwxJMsg+4Ik3p2w0VByXyGO1TD79x+jc4ZfQzJ3nBVNOJ0sIX7LxSEix2cH9EDSab9MEXSJXPOsGpn0zv0MByPrXwBoaYXC+sFRMU3sjtQ28bRE1WyVHlHYx9F1WjMYbYeC4ExnS/6dPb1T4YeCYD3dHG3m/+H5GEfl7breQowSkD2K7FBP8u9qgbVNtusRROl/bTAnbeVYbizQoL4v
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 07:55:12.6682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c2be1f-9609-47e9-fb2f-08deaf32a191
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6068
X-purgate-ID: tlsNG-33051d/1778486123-36945938-9A72C49F/0/0
X-purgate-type: clean
X-purgate-size: 1937
X-Rspamd-Queue-Id: A2EE2509A82
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:Zhao.Jiaqing@amd.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Action: no action

Add a PCI device table entry and matching parameter for the ASIX
AX99100 PCIe to Multi-I/O controller [125b:9910]. Each port on the
chip is a standalone PCI function, with UART registers on its I/O
BAR0.

Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
---
 xen/drivers/char/ns16550.c | 15 +++++++++++++++
 xen/include/xen/pci_ids.h  |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index cf10a06a3d..26503070dc 100644
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
         .bar0 = 1,
         .max_ports = 2,
     },
+    [param_asix] = {
+        .base_baud = 115200,
+        .reg_width = 1,
+        .fifo_size = 256,
+        .lsr_mask = UART_LSR_THRE,
+        .bar0 = 1,
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



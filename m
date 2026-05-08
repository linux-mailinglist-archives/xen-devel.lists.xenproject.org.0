Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDSlAdes/WlOhgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 11:28:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6972E4F442C
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 11:28:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303359.1576802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLHVl-0003Bm-Re; Fri, 08 May 2026 09:28:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303359.1576802; Fri, 08 May 2026 09:28:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLHVl-00039Y-Oc; Fri, 08 May 2026 09:28:45 +0000
Received: by outflank-mailman (input) for mailman id 1303359;
 Fri, 08 May 2026 09:28:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1wLHVk-00039S-AP
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 09:28:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLHVj-002LOd-NM
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 11:28:43 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 69fdacca-bab6-0a2a0a5309dd-0a2a4509b016-4
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 11:28:43 +0200
Received: from [52.101.201.48]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 69fdacc9-2497-0a2a45090019-3465c930fda9-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 11:28:42 +0200
Received: from BLAPR03CA0104.namprd03.prod.outlook.com (2603:10b6:208:32a::19)
 by SJ0PR12MB6757.namprd12.prod.outlook.com (2603:10b6:a03:449::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.18; Fri, 8 May
 2026 09:28:37 +0000
Received: from BL02EPF00029929.namprd02.prod.outlook.com
 (2603:10b6:208:32a:cafe::45) by BLAPR03CA0104.outlook.office365.com
 (2603:10b6:208:32a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 09:28:36 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00029929.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 09:28:36 +0000
Received: from zjiaqing-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 8 May
 2026 04:28:33 -0500
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
 b=lX1bkv41nSeUeAqDtc1yZvbYPAovh4xwv2ncUM8yQHeKVYpWKHH0b0qBkWT5YJH2z019TjQiVbQfGvOyZ2zAN+CS5apcRNH5J/4PYYai3SjMg1BERoGGxZUoQq729gPGKxtz5TOWxmvKmWPEdgR3AYlCVTwtn9DTgyjtjm3KRj/jyy0e7vyK3k980GL9IKkU+TLjLCDxsMcbd2kgiUbDOvfXEsUGrxmOKB3zLtQ+yXUZhzfZhc9mS1afp1weGuqyGytuLWYQpQxs3tT9qr4NBURkAJTY4EzXUHKd0/O3cSIwRZtNiQyXixpuTAbZ9utjU67CQVhN2sNDylmNumA7Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzsn+T6QcTRg8SadARBRoXIgAt0rLvZJPeWc0WTlDW8=;
 b=DnIaHAFouChlbQA6362It1LFvzxdoPfAg9qQAh2x+5mQHtPlwL8DIoHDfNIexR2Y3Gh9/R22Dd7kWZJXlRMVIzN4zxqST+EpkEMl5APSSizj6K4+wlyiEYYOi3fQGC9jkyHPKj/vKRCv5WJPRy8GOik/35qNFUDjobVzjtoxp2i6Kvgd2Ni1doS2uxagc/6pjklRiuQVjPZTmjkScIBfriFKfM+PtTj0w4HhWpefPk0Vk/9BMyWMjMZfhgh6ZSGFO4w5rPyByrkzjUDZeOxRCYzjMeHf4FCoPLmyo53OWF90Q8wHEyLazNhrTCcW3GVl1LT5GyXh3Lz0Ek2dxPnoEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzsn+T6QcTRg8SadARBRoXIgAt0rLvZJPeWc0WTlDW8=;
 b=yIFGe1cMpWbPOaJbftqZYxKOpTK5fQ6G4FbacoldvYKem75hme+wt1FBzmn4nov8npyBZ6qvWgJsD/qLm6W2eHrUbMqUFAxiiFI7FmsSZQwrAj6ZMle205J1KvaKYAZhpFWvDGdN31aHsbDJ1IooPRPwmzJS9CRbnknJ/xsaccc=
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
Subject: [PATCH] ns16550: add support for WCH CH382 serial adapters
Date: Fri, 8 May 2026 17:28:13 +0800
Message-ID: <20260508092813.12894-1-Zhao.Jiaqing@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029929:EE_|SJ0PR12MB6757:EE_
X-MS-Office365-Filtering-Correlation-Id: c84d6a3e-0779-4277-607e-08deace42e52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	oz+zLRIPFVH5nvdoNTMbXpxLhYvxw1hy+Z1Z08wqCPrGxnMnfTffSgdGpJ0WHykVBep4gVMM6pgSPXtbHJLP1h5nGDddckAjkR3U7DVhS21m1SOmI6sNYc9QAn/zhRoQ4v7XP7AYjuycojAapX6ZC3qdiXued3cHCdUKiphCP7q5NH8oiSHqjQqDnNWK/RHY9DNliapu0Nk9aB5I8YH9y5+nIVHukVJPHp7ENCUp2o6DmSuvt4Ik9KJYWunm9qTJ+rt5ClgQDeGz6n0FInTB4hPaxUktMG1uMO0HVQjhvgLhhmi5a9bwqF5E3BY3vAjzfjAIX0jjUdx43lcvAjbG8W9m+evNzz6rZX3tGPwau3aXAEqTvW/98zqjJJ+3oqx6/eS5TIFftpa2xKera8qC7OgjKGu8vLNeEJeBdJ/KDXFxfxSEBgz0QdjLniX4rncRn3MNC6Exgx6x7lXQo0ho2nr3zVdRxYWHm1hAi1qxZHAYcrrgNyCyN+rNAWH+jiSAXAupYKecAQ6hghFNrHqASqFBAFyHg+ocgFqdBmVdUVrKL070hCIh2qFEORPinDCvBCMX2LOn7wHozeKdxWcyQZ4vc1h8TpvhQpdHyFCAf7bhsSBGzxwWjBTK3rsxQm4/I4MxsAwzAjGRX4NDtS62e2+Twq0aRzCRhEPrUfMWPmZ0LAQiIR3DW5iCmc7rlzPK
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Wrd/lXxcxUt8GqtMvYwuezfgdSRAUCUhu3IPvQpM9pox+GQU2QiXrJXQzQqE12wZNWFrEBoa3sMEcJ/7WdlwiVMa0MJrGk1eD6t4kBQmWTA3a9UbFNdBVbqKn8JUh5GxLURmUne0k7lAZbNu0jGunlvEwoT+Y3t5xbXkSEhDpm4cGmx26YJ96YyaJ+9XphYsc6PHl0e6Bp3EoCAt+g1Z0HUu+U5rPdhgXn2ys9gyE07PCb5kvQW2d5NMvk3MlyNt2km6/z7bit8IFsBPVHEqGcbBK9R15DMRa3pNMVJjeA8PURhTfJJnhMhi3/uxiPEo53kEpe8qudpaiLXED3SMOhKGzJE2Aqx1zPjj5Poed5m4DZ644Q+bcn9qhg4RDjbFYYoEWuXGMkKp0a+b7a5AboCOPHEZz/T+EhKWwz3bpypsnMU4uixuHlzToz8rQI3G
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 09:28:36.2423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c84d6a3e-0779-4277-607e-08deace42e52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029929.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6757
X-purgate-ID: tlsNG-bad1c0/1778232523-40961A53-0421F3B0/0/0
X-purgate-type: clean
X-purgate-size: 2360
X-Rspamd-Queue-Id: 6972E4F442C
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
	NEURAL_HAM(-0.00)[-0.969];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,wch-ic.com:url]
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
 xen/drivers/char/ns16550.c | 23 +++++++++++++++++++++++
 xen/include/xen/pci_ids.h  |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 878da27f2e..106ef56316 100644
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
+    /* WCH CH382 2S */
+    {
+        .vendor_id = PCI_VENDOR_ID_WCH,
+        .dev_id = 0x3253,
+        .param = param_wch_ch382
+    },
+    /* WCH CH382 2S1P */
+    {
+        .vendor_id = PCI_VENDOR_ID_WCH,
+        .dev_id = 0x3250,
+        .param = param_wch_ch382
+    },
 };
 
 static int __init
diff --git a/xen/include/xen/pci_ids.h b/xen/include/xen/pci_ids.h
index 5884a20b8f..b8316d464c 100644
--- a/xen/include/xen/pci_ids.h
+++ b/xen/include/xen/pci_ids.h
@@ -13,6 +13,8 @@
 
 #define PCI_VENDOR_ID_BROADCOM           0x14e4
 
+#define PCI_VENDOR_ID_WCH                0x1c00
+
 #define PCI_VENDOR_ID_INTEL              0x8086
 
 #endif /* XEN_PCI_IDS_H */
-- 
2.53.0



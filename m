Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNzzD5trHmq3jAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 07:35:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD97C62899C
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 07:35:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324445.1589985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUHmP-0005t9-Jc; Tue, 02 Jun 2026 05:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324445.1589985; Tue, 02 Jun 2026 05:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUHmP-0005rA-GR; Tue, 02 Jun 2026 05:35:09 +0000
Received: by outflank-mailman (input) for mailman id 1324445;
 Tue, 02 Jun 2026 05:35:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1wUHmO-0005r4-Ln
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 05:35:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUHmN-006Z8z-V2
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 07:35:07 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a1e6b8a-5cb7-0a2a0a5109dd-0a2a45078ede-2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 07:35:07 +0200
Received: from [40.93.201.70]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a1e6b89-229c-0a2a45070019-285dc94654fa-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 07:35:07 +0200
Received: from BN9P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::29)
 by LV3PR12MB9331.namprd12.prod.outlook.com (2603:10b6:408:219::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 05:35:02 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:13e:cafe::42) by BN9P220CA0024.outlook.office365.com
 (2603:10b6:408:13e::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Tue, 2
 Jun 2026 05:35:02 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 05:35:02 +0000
Received: from zjiaqing-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 2 Jun
 2026 00:34:59 -0500
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
 b=ROCdzxpraPWqVs6JiRHvU/lVu6Hhd2dbLbWaOb57hmocoHOYtySbQQ32SwHkc8oxYB2uw60Ar4TCQi8plAw63tzMDqpN/oPoDvm6lXcj7YvYR2jkYHf0ACLgSl+p0TTk0JXGUM+G98kP3imyxaGaVPPvNqcYL9hudzX19PvaBsJPgppNdCx+52cMkd73pdWEAa+7twiIvd/aJ6Jxar1vBTot9yRfSQ6BYdzu9NOmeuK6Yxts/C37BqImIpn+MgwukrAoUcfR6TtUrzt0lcrslP9j7nN884OZSa9BX4dGOVtvKp0aBrUfJ2Yzk9UGCPJhUlHhCtyzyEzvAm/lT+/Iuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7tOc0wWCXWIt/jwd+06dSQL+5xFR+yiddWmpX7yKAk=;
 b=HBv72r/cXfUq4Eze1SnZ3jRFYlR1gecxPMRgsUq/ck1g+/aNLzW4SoyJfag0hfl/p+eHEl3CuW18PfEGHkdLGzvqhgTBQSYuuhTtnxWUDX1+q+uY4wlCdCuuE2rhRBMzlPDuemslabluOM6rXU+jFc1zzf+ZlHd/F2N+n4EzuNFzGyAheT2ulcWKGdKnqrGAtShtQt55P8dw0Xi/JymP0OSVsETx5GbZ1WRT26+EFJHtE0Q4D2exybNDNPO8Me/mDpstixtFIixpp060zFkY1dg/avLeNyF5YWb2vrqub4BnFU9tHQMLs4TbwtHt5Sm/9+gUcuALpYO4EHaEW59qvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7tOc0wWCXWIt/jwd+06dSQL+5xFR+yiddWmpX7yKAk=;
 b=uFymnAO8aG2NacMKuFv6dYa8oGFHOyQT1ra7zy2VhmXkeyAVSVNjQeKSoPE2a01ML8XutwCcsamzSLte0IEc2K4jLM6S+MoFtfWhj2I9SdoDsOZ56UGHUvSVH0lf6Yfb3lqnxVjViq3FyKL8eZENP5ylbURCEklyvkZ/lT6Hoys=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
To: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
CC: Jiaqing Zhao <Zhao.Jiaqing@amd.com>, Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v4 1/2] ns16550: add support for WCH CH382 serial adapters
Date: Tue, 2 Jun 2026 13:34:20 +0800
Message-ID: <20260602053421.773149-2-Zhao.Jiaqing@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602053421.773149-1-Zhao.Jiaqing@amd.com>
References: <20260602053421.773149-1-Zhao.Jiaqing@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|LV3PR12MB9331:EE_
X-MS-Office365-Filtering-Correlation-Id: 97684155-f545-4861-a6f4-08dec068b195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|56012099006|11063799006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	cMugKeh9OVnJtzagwU2uPnbby23ig1VgvMjC1ELIV9Q1waaRQl7YgCS2cbzKM0Z6D3qWT7nU3ks6mOVqtAdOelsA+eYXZ3IeyFpzWOztGCKKIGfyYUh4Cbd+5ZaR4zYcVoBEmdlzrp+WMgJovl7DFdpLUCFUajSNrxaNssy7TbpkdTk2KcXihLP0q07HdBwXLlyWAErhKGumS8dLI0Dc+/BDQ/yh8uB7rNp2/637nhmvuv2iwDv0oV4DYt9De2AG8TPv59BM4aFgu2sCrOWcBH+NV4evvww++JE+8EqV+h6B4gRZfQB920dcbAvthnOGmu3TcLuoKfdP3qnprbFhj18bfJIstyR9FA541xWNqpg5gw7v2nlbcBXDtnLi5B6/K4qId/jKF66kaGB595eBWD+BngZiO4zUo9jfyZjmIiXMrYJMTIQKuSX3gppXVKe5ovKgy+HcgtU+3cIQsVCU6UqkV+Q7rHELMNFP4EmmxtfvCW+D3Gwq6awXTrMc4QfZ31wDT6UC3QXHxdcKV5Bi0360KmDAPga2W9xU0Eh/Y5mEm3u4V9f7a1r1NphSjfJEcCVJZXl21TarAaCEd3h9hy/LyN5lKVpEdU67kS2RaK9OAdurJNLD/5wtPCdUXgrnFkmMXbH10re4NGEQhLKmQsCL7iMdEqZnC7bwtX/ntr7qdtXrXF5pBzZ38+B+oSwI
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099006)(11063799006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	znHWfIKMkdLCSDpCrjzCxYB2To+nC9D1k7qLNcGbqqiMMgjdWnQS33Azwe8TPOrKinzpXsOz25BAexTM0hoL8WoxZeha+y16PGNaACKe7iBdUwojsQYD0TLavouOYqQp48exJQpaIuvCI3NXwlwrSUftnVNEwIOuNtaNBj2ZNBuYeW9SdxoH82BLbqKo4/LD6f3GYKjgGLGoJhzL5HPNAHAIYX9rsf3lIKsNoHHGc7h7bHIXds2+5CXZxJd89RVIqdC5412+65oJ78BMdWxWMAV4C0ZhWe9QKtG65jPv+Pshs3iMGzKonyuxpHnnKSo3kEk7jKze88Psq9jKsmGROVgt9iXC0Op7WwFctOngg9gBsldd4HPsM8FoCVyBLkdXE6S8OuaFmSRjlX6xKTShJJEihORnAVIlrDpdQvJWEV93LCdpw3zMawOgeTtDiNUQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 05:35:02.1306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97684155-f545-4861-a6f4-08dec068b195
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9331
X-purgate-ID: tlsNG-ef75cf/1780378507-23979C48-B788C2EA/0/0
X-purgate-type: clean
X-purgate-size: 2468
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Zhao.Jiaqing@amd.com,m:dmukhin@ford.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.985];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:email,amd.com:mid,amd.com:dkim,ford.com:email]
X-Rspamd-Queue-Id: CD97C62899C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
---
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



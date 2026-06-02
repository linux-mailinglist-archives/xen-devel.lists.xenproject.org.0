Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VnRxMFgBH2pWcwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 18:14:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7270D6301DC
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 18:14:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=JQYBGXVq;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325245.1590746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wURkk-0003iX-B8; Tue, 02 Jun 2026 16:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325245.1590746; Tue, 02 Jun 2026 16:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wURkk-0003g1-71; Tue, 02 Jun 2026 16:14:06 +0000
Received: by outflank-mailman (input) for mailman id 1325245;
 Tue, 02 Jun 2026 16:14:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1wURkj-0003fN-8B
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 16:14:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wURki-00C4nC-L1
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 18:14:04 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a1f013f-5cb7-0a2a0a5109dd-0a2a450ada74-28
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 18:14:04 +0200
Received: from [40.93.196.44]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a1f014a-56b3-0a2a450a0019-285dc42c3594-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 18:14:03 +0200
Received: from PH0PR07CA0089.namprd07.prod.outlook.com (2603:10b6:510:f::34)
 by DM6PR12MB4091.namprd12.prod.outlook.com (2603:10b6:5:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 2 Jun 2026
 16:14:00 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:510:f:cafe::64) by PH0PR07CA0089.outlook.office365.com
 (2603:10b6:510:f::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 16:13:59 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 16:13:59 +0000
Received: from zjiaqing-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 2 Jun
 2026 11:13:53 -0500
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
 b=g9wNci+7aRYErXEHenqkYhcx324csxF5z9FCAEYbmdZuoRFxYSyldGSDrWZgfHY/bd1DMoEiv54mE34MOrMZXIlFljo+PC//LM1M4hoI0SKjy3FHgTs/5L+o/nBHMY/pDoxQFJlBQGaXF4zlINd/+FADc6V/04FuCg9Ta/R0EAlC1S25hRoZpm4kdE3AyQGG0B+AYuQG0V70gCEJ+viSaaXEqhK7FwtUlQepWVq72yxxNpborlvmsQuvDW4kemLU2kbg9Rbiaz1Fqr6/RFBWx6NBuMNoqhz7ZO9uzJauW+VZvbiQxkNmHLN4OMshQNrPfcfZcp3u2dPeycLMeK8I5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZls0mBn/oN40t4VHDo5pvOBZP/o7JYlxJqz6BdsmiY=;
 b=GqVLfCPGrFVBbSbnv/f8vHSGVtVdPQ16a+n86Ip+3j23l7begM6OekopqfGe7bD6D+FG7bCVxNn5fEW7a1HgCbzxb/3pAVoEIgvHFzGWRCEoJ6uCuP4jio9p6Z+lEPpT8xG1c063PH/XS6QIhYvW6Loou0j9Ath8uvmVYYDGe4MMotn/67FmeODm940R/5vlNMHmG3o+Tz1lCQnyfDuyAf5c2Hg+Js6L7WPlPw+lcfrqoLyKDw0jRhYsVTd0BJUF9eR+hayuHtUoGUGUzhetRj4qqln68HDETTYSRgsblTaiL7TYkSRR3VvXziEDGZvIfVE3e8eWNkalCA/QYhRB/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZls0mBn/oN40t4VHDo5pvOBZP/o7JYlxJqz6BdsmiY=;
 b=JQYBGXVqPA1pd4ELVuXWQLcL/UN8ayosoGLDUAfFwZ71iC5t22WfgHVlBKLO7EDWKPsiEDClyg72gVhofCKlGBz6amekyBmdCCxgH1KX6ejnLO29q0gT5Y/rl6kDPcpZCu/bbgvp2tDM03FVN6GQpUqupIqlzbwJ9z7pC3tViYQ=
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
Subject: [PATCH v5 3/3] ns16550: add support for ASIX AX99100 PCIe Multi-I/O controller
Date: Wed, 3 Jun 2026 00:13:22 +0800
Message-ID: <20260602161322.1039349-4-Zhao.Jiaqing@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|DM6PR12MB4091:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f5feec8-a6ab-4c47-368b-08dec0c1f49e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	dkjyKUHTpuwJcpQydr3pfLp3XNOwEwTWj25ZTdEc4LgAEysvEmAUvg4wkD2FnZ/9jI/hgn/vfWX7+ZDsPUYRhwqNKULE+oEDaEC3fEH0zPaUZSJa1VogflgeVg4Dk9xtDDuRDmsCclubM4g13bZ1VcYVRgH6e9r9x3rbxkJQ+FJrAMdJVCBEhLI5L4nYlAUjjq3s9kZu6KjoUhk5J28RjcfWoljkODa5PDjK1Gs6spiMtV0zJmfG9wPoNF1BvkcW4ImaMr5EU1qiglbNorr8OwoGE5ZfN18cW52K0v/+5K+/AK91pWE8EMLPmANKW/2ScZCCazhN9a95MP+5k3i5htofNNRwbfgynbICVim/queDSjXqVC4H4mgufiphydIWtKxFjYNpT7mlDYrHP5RoWEsunfr4Y1Gmisdimmc/lG9QiVAGyQGYGdD4fHJDgzJj+jVGE/VUdz/+mcJqMwjpil56vfAOiFyrDo8sMaTT+KV2UJjcVXYF3poyPwszgVjG43oROvNEp0ZSXIXMw457HcmhlmvZZGVBKqtW/p73Wfow7aNp94DFVUTBAwPIfzggYIQkmAxGV6AaCyq+IVqTVOi8NU7IhLAyqvTONMpcFgHLHB6qnJWjfrgJ1D44WOQslni3g0sgFDjyDoU60B+sCiC1cpySt+8wg/MvQuCiFs3g1AzCxLr7ptD3iLTodJzjErzbXjsQdvl0DHxlyxvbYS28c5deG5w5Mncg90871cs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0Iukkg8u1mf+lZL/ugvzmpJ3StQRlPi+JLDQjg/BjhDKOvc/Sork8OpZaBx/6mzblSCIPtLxuy3zsavb/naqtaxdRlwABVwkjpauslNCTctNd9saoirAMvUC//CZmRKOpfiw54vvHYqJUilvmbS00TqdvQoITschpVcjEP9hcglPcbEZ0/QMvjcQBHx+jEZEPPe91q2Q3nXEEcOZDSgvjUZRdesrdvzNkbAKQLpHr4doAKfEyoGBGVyT4ZYzCQS9YPxjDOu0nB2eCS7ovhEUx4A5z3RqAV/iZCDmjrgHxSBP1tPqWCGwUauLXxkcpR6pCNrgP+iZHYihDprVoWxiyBRL7xYu0Rc4zayzS4qtTEb8wKolXlOWnl250TV+z/1wFxAQpWbkzTqkw1EEMN3Ogyt8KN/h5JKF3khGshM9MEzqS2Pt7/iRj6PcPFDeIv/C
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 16:13:59.7792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f5feec8-a6ab-4c47-368b-08dec0c1f49e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4091
X-purgate-ID: tlsNG-4011c0/1780416844-7E58E8B7-9D6C7303/0/0
X-purgate-type: clean
X-purgate-size: 2052
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:from_mime,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7270D6301DC

Add a PCI device table entry and matching parameter for the ASIX
AX99100 PCIe to Multi-I/O controller [125b:9910]. Each port on the
chip is a standalone PCI function, with UART registers on its I/O
BAR0.

Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
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



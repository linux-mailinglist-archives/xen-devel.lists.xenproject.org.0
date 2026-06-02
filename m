Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGWZDpprHmq3jAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 07:35:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C715628995
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 07:35:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324446.1589994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUHmT-00067B-Rr; Tue, 02 Jun 2026 05:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324446.1589994; Tue, 02 Jun 2026 05:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUHmT-00064k-OH; Tue, 02 Jun 2026 05:35:13 +0000
Received: by outflank-mailman (input) for mailman id 1324446;
 Tue, 02 Jun 2026 05:35:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1wUHmS-00064G-2J
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 05:35:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUHmR-006Z8z-El
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 07:35:11 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a1e6b8a-5cb7-0a2a0a5109dd-0a2a45078ede-10
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 07:35:11 +0200
Received: from [52.101.46.44]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a1e6b8d-229c-0a2a45070019-34652e2c2bdb-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 07:35:10 +0200
Received: from BN9PR03CA0430.namprd03.prod.outlook.com (2603:10b6:408:113::15)
 by DS0PR12MB7825.namprd12.prod.outlook.com (2603:10b6:8:14d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 05:35:05 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:408:113:cafe::33) by BN9PR03CA0430.outlook.office365.com
 (2603:10b6:408:113::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Tue, 2
 Jun 2026 05:35:04 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 05:35:04 +0000
Received: from zjiaqing-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 2 Jun
 2026 00:35:02 -0500
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
 b=CiScsHORptySTEepLhtHWYsC9kzphOYtK6Z54h0cw3I3QNRqo7meLFArMTDY27rqr8y3l5ziSJFLdyxy6SINkcT1Q/HzF347pDNPIX5R6EbEwtfBAlAsevz3Yrxkn5dWAAU+H2pQDykd/lZe1X2258CmZIZiS6wkfC9/LitWU870u0QUnXl0ZQbGDP+xeu6JNMcI/ZQ66981RWKBbjdpGaQ1jR/79S9AtIENUw9C1C7m8oQjEvYY78T747q30LGEa8VEBKxCum6n43HGKNrWRqR5TBU4KKnDUlnyLAxVL2m28zuUiS+CAEFKRZizgAIPRYuB0j749UZJx6EgiQzPwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lO/AQShTDkBUcHto3u/hfaydZa8G8crAtUGWOtdgc+c=;
 b=cij3p1/cBqSElQ6CZjLe9bcxfYzU7mK1W/gqFG5gUU1s+UbCf6Ka7VtkxjFMffdAB2NFlhsdxtUGLXYdH0QOowSVY5LOC2fYIKnVDQcmMoA7qfxhiR84lWWdaL82gPpL2au6l77RLFHmNjD7r71SQqfSc4VZFSb/glDxJDmHBS83CIR9f/MreM+45x+lpkVaBt0XkY7oUTB59Vrz/+4bHYYg1Dkdka34C47S2snlv5UnlzWKked5pENhBXlIsdMkxzVZtKyoD6bQaLgdO34/jSoIgPH045nyINJBdFFPN+gtItN489+yVK+4uUyZZFUzbBHxc2p5CtXmNV6gtt/U8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lO/AQShTDkBUcHto3u/hfaydZa8G8crAtUGWOtdgc+c=;
 b=Tl05PicvmpqSCMWh1qUDwGQAwRt5gJIwF5AHWbX+KTh+cDGgRZQs69RSqjcqEedH6a+HwUtakQ52JPLMgME3rgn5Ev4D1vtgXdEbAaelLxau30zS6nvOQkXrzbUf8oC9feuHykmWS/KKXl+8zQAbkQbS+/Xxv/DSETM36X5L9ak=
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
CC: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Subject: [PATCH v4 2/2] ns16550: add support for ASIX AX99100 PCIe Multi-I/O controller
Date: Tue, 2 Jun 2026 13:34:21 +0800
Message-ID: <20260602053421.773149-3-Zhao.Jiaqing@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|DS0PR12MB7825:EE_
X-MS-Office365-Filtering-Correlation-Id: a9976b70-ab15-41dd-d850-08dec068b320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AhwGB/3SSz2ET0iJmMRm9QGUBi9GkbF7IlvgQcmWGyFe0TGYQgnua8aP033OGibaCVgNE1FpknpUyQYxAV4dMFpCNS4/KHYqp22tQQP9Bse/Urqd0hn1tmsyTVbIjRE1nw/KVxLYMmltHBbtShOCndHKHRoDL+MYAuerKMg4PZiOmSCrWbnP1ydMOGTGLYgeF73H+cMdRWRk64dogbaDMTP3Qqrr76gi7gSPVWei+9aHY6EKSB7YuvhJ/lm8nED4VTGAKJitWS+Qk9k2akU3cbK6mw66p8xcwDcemulKV1Z9ykynCKHbH9KFWRXdsjTJ03ah8CUegdnG3LHnTrdvQ00D7Io/walNKSQ16vq0yfYowmtyp8SDWVRYGX/T/zUgyPD/k9jz3gsrNiCsxOx7SqnlvCX8fW1mZBVcL8wCtQzFU4FpR9ZgkI0PoI1u9TRaZCccft0B8UKEoaPSX1Fpr+r2qvszif+2yT4qB9+HObi5X6yLbRTIOXEOoK+eLVJG65V/oxJPnMhlGHtzmNhtJsYTA3EoroM+ikgFnDlt4cYAA8mufWTjzOxOriFb22Zv2AbelAwwjfybOsYupkFEO86BzYRRUA56Uk672XGPUy9dTtdINJyrJg35PMZ1s71H+/H1bwpneddrvAv8Ni2iptNmdl0gM+qHuyryQpkW9e8VeWzvVSsWMYuGemXog9V3/1/YueksjURiGn22eQCLu2Md7ABBYoVtdfKRcWTQt/4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5ML+s/cycHNhxigEHoa6pijubIT7sxko6PzTSf0O3qdh8mtNHsZZAVQzvuKHtwkjwDf1ns9uXVifOhX7rIs+5KlPofEHSFQLuAbOGGAWqHNWfOECkMCLV2KVCK3fJnUxY6VnA6hYBYA2HXM6XP/qJq1PsM+LrvAsuItpEB91lEwqoWlyfRzsQcbKx03DfQJkBHzCzyYrQN3hup1nGrJ+u0MWWobUhbP00kjZ6sH6qZpj1IFhKYGF0Xp50ljdyFbDxZrpBw8fF+w7QMRqnlCfpmtCRlqs1EmUsQrXLEZoivAgZEgce6MM1nUffaCxtwma7nlkT4HiXGJQmxpNa2fh94sg+1tHtVGvFM421fzeVaZgxSkrDXx1aw3uWodjegMDkhUYpBfWVE/J3Y0kKcWHhvlsDYy+CApAAw667z5j+QQB4CIvo08AkbihxOLxm7XW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 05:35:04.7213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9976b70-ab15-41dd-d850-08dec068b320
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7825
X-purgate-ID: tlsNG-ef75cf/1780378511-21B68C48-508743D5/0/0
X-purgate-type: clean
X-purgate-size: 1995
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Zhao.Jiaqing@amd.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 9C715628995
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a PCI device table entry and matching parameter for the ASIX
AX99100 PCIe to Multi-I/O controller [125b:9910]. Each port on the
chip is a standalone PCI function, with UART registers on its I/O
BAR0.

Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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



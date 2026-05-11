Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1fxmCI2LAWqRdgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 09:55:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72897509A74
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 09:55:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305818.1577968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMLU0-0006iv-V3; Mon, 11 May 2026 07:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305818.1577968; Mon, 11 May 2026 07:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMLU0-0006hD-R4; Mon, 11 May 2026 07:55:20 +0000
Received: by outflank-mailman (input) for mailman id 1305818;
 Mon, 11 May 2026 07:55:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1wMLTz-0006gq-8v
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 07:55:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMLTy-005EcB-Lr
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 09:55:18 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a018b59-5cb7-0a2a0a5109dd-0a2a450384ca-38
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 09:55:18 +0200
Received: from [52.101.62.3]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a018b62-672d-0a2a45030019-34653e03cb99-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 09:55:15 +0200
Received: from BL0PR1501CA0014.namprd15.prod.outlook.com
 (2603:10b6:207:17::27) by DS7PR12MB8201.namprd12.prod.outlook.com
 (2603:10b6:8:ef::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 07:55:10 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:207:17:cafe::a8) by BL0PR1501CA0014.outlook.office365.com
 (2603:10b6:207:17::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 07:55:10 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 07:55:10 +0000
Received: from zjiaqing-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 02:55:07 -0500
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
 b=nQczhBALhZafnJgLB0CiPfezrXhgKTlThpztVntQBnuj4u03t1f3xV1EUXjhO7uVPJbFplJTV4OyGy7NTrfribpdQRCioJRhUGbTg924KFpk8VLhZ69y/ep+QMc/sjDuzmpn1fTfKli7NTExfIjzXlPE5Vkd98lOW+mZO4nNFhQPO80xUJt7W4QOj9m19FlWye5EIx2Lg2V/XpQVU568TgQobvBhPmJBro/jNnszZWIvEpBt//XcV9GAA8agtWSq0ShZ+dUh3cBRQZRIV5o0Sik7UeD4Lme/eeEv0piHQjlcrLb2eKn2Kmh4e5UkCRCFI/UmBHcrM1H1TDoudof76Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oTKXd9YUSZDMBp5MvD4C+12RK6xJu6gzXgdL9CFEZag=;
 b=RBAGp1ddeMvDJMM3U2Ne513gWsp7R5daNaa/xH+nmwVjQLi9iQr4YDDWRLS8/uOj+11+yTnmQnOW+mHXCEurQG2UBX6VrwOb3GXVgGEKQ2+ALxdfDUFa21aeqNyJVGcrGDGH6gRFs9+1+Thdch/JPjb3wIudIfv4CRvX4vzvEjI5isT4w885HNNjzq4AJzAH4rNfgvdacGzPgMuEXzdBNxKnt2w0bDaltP7TgNnSRBP6tNyEeQgR86+lm8sXVnWKItsS7fwd/9Wz44aQfdg3I6DzBGniifmmYQKWc7aV2FjJax1fQmol+z3Wd5FJevp3Ki2Kt7Kpm9bz3/U/WSmtYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTKXd9YUSZDMBp5MvD4C+12RK6xJu6gzXgdL9CFEZag=;
 b=NGM8pTMXGw1/EBvU9K9d06BfDueZ8REq83d9RkwMOyjMWaSHRC5OXu3GZIZ/26FOClx5BRFLGQDGrC5ueXldyjLxVhtGZVx6VKFGNT0CI+J95qgr1abu11zcpb/0/0FIfSSyM/JhsfIoW0E49quO5OJH1354jxg/GszeB+8Td40=
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
CC: <xen-devel@lists.xenproject.org>, Jiaqing Zhao <Zhao.Jiaqing@amd.com>,
	Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v3 1/2] ns16550: add support for WCH CH382 serial adapters
Date: Mon, 11 May 2026 15:54:14 +0800
Message-ID: <20260511075415.36538-2-Zhao.Jiaqing@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|DS7PR12MB8201:EE_
X-MS-Office365-Filtering-Correlation-Id: 212133d8-d9db-4f2e-f848-08deaf32a02b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|13003099007|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	B3dgCLiGPT7edfgAVI1lZWI2WKPc1Wss7+KuCG3Rjt/jhqrCFSXio0Udn9WIR+/9Ww6NSIKPp+fp18RJ9DUEhJPw/xH7fKnAz7s4prFVQUxoNHYBgJLWHGAKpHUG6aEA/P+fLWvrlquRUh1A9OpgzZ6IdnPrnHhRN7d7pmGfZDk/1xAILWJ89Ldyo5MjILupw9pkDJp0DvtopZeUL9IW3GVUKQfS4CtewlML0TuHXxkETdS1733KjgdJUNuv6NEk3bUTKaSz4umUXkhCTW483f9Wvz0JkYP7lIxwE8Lsmh17Is++0fkyNj1xBkL+r+pVfKChsB2n0tGa/dJ7kxOSOGRyPavKmwvpS173DmgUkN+idTroOfHdrbCgOA+7NdJyHXTm545pnaTfjRR0un23CzMDdo34smWwjN8mNl2A4xMeCHpIXBmJJFaeOBPxCL1+1TX6ydIdWIt3lufSJ3eCV9T69OvQ+U6XUiG5L8JxOz5LqM49t8yLZZCvNfgyIUjmq4MhhMLsr2y0EI/Jdzm9jj8xGkqZxRToJHY6u1fHGR+WRFoMs2KWdxskjqKgX9NUV/tcoWhOhHC1YXJxtSYKBA4Ek3MNLQnIROSgLHihGGvqQ0ByIa9p7IC4yxoxHXskS/dhKH9U3tSYx70rbfz1O3yCSYm4lizhyzTllz+s4kZol88m4Te8FKypOaRW+jB6
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(13003099007)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lbdfuL8yoqteu7LSunsSVZeFTp+jfms6s1Usxt9LFMdg8FjXADeUR0G3Cu49nTM3BZFbTlQsBYNsMyJhHb9stGmV9xvev6TEPhkJ0yzZjAkBFtLFPqSkhxlIpttBKakCDEyLVmygYA0UM+LERA3vvbPsYgED5zrTWnOrHDayT0MRzA5vO7rGaSkoIfzPrhG9YnMaErM+xk7WRB4F4eOAdPeKgyq8Z36DtT4XtEIDj0jsI36RRV0FJVeQXj2C2feXlTEef4WOf6msECQdS+0xJrB33tV/pAybUcIHKYSFzgY/YzaOs+eA1oXFnNvkj+ZXB7dwNeVdi8q9cn1VqAFGcW0Alay8gfPNNOMdNS+g1ilVsMskAk2MiXgV/YiygJ/d+nPECjiNQ+CLamxar7VMvHx5oqKSYiD3QttlprRKpyPMo8mRkJ+BoYWxtgEEzFG3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 07:55:10.3214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 212133d8-d9db-4f2e-f848-08deaf32a02b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8201
X-purgate-ID: tlsNG-33051d/1778486115-3A567938-78703441/0/0
X-purgate-type: clean
X-purgate-size: 2410
X-Rspamd-Queue-Id: 72897509A74
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:Zhao.Jiaqing@amd.com,m:dmukhin@ford.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,amd.com:email,amd.com:mid,amd.com:dkim,wch-ic.com:url]
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
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAF5AC5D2F
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 00:38:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998786.1379485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK2vx-0003pD-52; Tue, 27 May 2025 22:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998786.1379485; Tue, 27 May 2025 22:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK2vx-0003nk-1c; Tue, 27 May 2025 22:38:09 +0000
Received: by outflank-mailman (input) for mailman id 998786;
 Tue, 27 May 2025 22:38:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mfAC=YL=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uK2vw-0003ne-7S
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 22:38:08 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20627.outbound.protection.outlook.com
 [2a01:111:f403:2412::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e6f77a4-3b4b-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 00:38:02 +0200 (CEST)
Received: from BN1PR14CA0023.namprd14.prod.outlook.com (2603:10b6:408:e3::28)
 by CY8PR12MB7586.namprd12.prod.outlook.com (2603:10b6:930:99::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 22:37:58 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:e3:cafe::86) by BN1PR14CA0023.outlook.office365.com
 (2603:10b6:408:e3::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.27 via Frontend Transport; Tue,
 27 May 2025 22:37:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 22:37:57 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 17:37:56 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 27 May 2025 17:37:56 -0500
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
X-Inumbo-ID: 3e6f77a4-3b4b-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WThV6PPiYzwQdFsduHl7ho0mbPFeYTf+YEpT5ZouXGog5oDIvkhxu2H+3Xwt+dRaW3hn9aE9zrzqFVwYhKggeAIcjB/c+DxuAguURPsBgv4KMZXKnm+OHgaphWd2sfOY/lu3YI3y9nz/Ekj4RVYpflD069fi/aFOGZQltU42RJZzMhSBlLbKtxNxovoCGjkiZAcrUTlUBQJ0VUuzlzLBOgWZutFwhKrVDjeUyuKkeqiEwN6wI5dz2y5A0eGam2bbcLvTsqLoxw5MPRxDECi1VbA2TlL9eNTjxKCpWEt5V+zkLEKsaePdbsLEcSZvzGldnTh8Yyq/odcZkBKorU9pTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOCIgSrhE370bSBnQ7ALiF16fphr5HjFCjkf66s7g44=;
 b=ODiwtcVsbnpYzMroyciNnA6sW8+EN3Rnnmn41KmvWgDi5mYSl+sqtPh4dxiCHnpT2kd3Z1HnLztB0CHIogoX0OHC+7WPgRZKgYH4qf6/sC0z0lcm7aqDk4YFbrkdON7JA/Mgw4t/RmL+3CFIFp6FVNf+twQgGeSrlbz5NXA/Xu7Z4BMP95SNZaegQOJvJTc2iMgMnmqHeOa6nzLBICUMQyFF3fK+itPMqh9hxGd/AfmR0Audsow6lqG2uzd3M3EA6SisvWBHbQgT2Stu30y84vehExULTzQ4lMhHY1JBlThw9944gWpr0K8jLDee3hRLxUZYoOBgp51B4kP+G53v7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOCIgSrhE370bSBnQ7ALiF16fphr5HjFCjkf66s7g44=;
 b=ryT/3Ds537G4Re3U5n/vIN7cVHRHEr1ml3pe3GxnB8Om5H2isa9QNKHmRy0wnuSMBFPhW0q5EL58LM9MoAh4IqgEwWlr7FXl/IYHv2o1uFC1xqLLQBy+uArIWx1hBg5oacEWrtUksXSclcVssQ5oCGZCCZLhZL8wVExkCQ8vi60=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen/x86: Remove is_periodic_irq() prototype
Date: Tue, 27 May 2025 18:37:53 -0400
Message-ID: <20250527223753.47055-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|CY8PR12MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: d9937ee1-07d6-4a6d-8186-08dd9d6f20cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v43PRb4JSHpxicjZwLQ7O+04lOpkkhffFX9j2nj7FIhGLSTytLdP8uysODjL?=
 =?us-ascii?Q?np3yf4mBWb6CXtGPpYhEvC9Hj2MrSruVqcGrT1uU7kFy8B3/qQ5VC0SRqnPz?=
 =?us-ascii?Q?AA+43kCwB5OlmrfC9N1DZ1xZV8dzKh/tZu+wDl/7oOTZajH/WmV2baP7dbpg?=
 =?us-ascii?Q?LpE3oXIzFKdUHD5cf+mulVZbQONdPHc0OaHnk/CNwraDIgAp0/QeHd0DiEYS?=
 =?us-ascii?Q?M0I+uRd49AfGD8ApzgkpHDjsCN9U836DOcHroQ1wNwlWwgvsO6fwEN34HGG4?=
 =?us-ascii?Q?wfzl1/szb4PvvgVwtr1L/elWat+AuGqr0Kz3ObI3fUjUdAEub2rkTpl7s9td?=
 =?us-ascii?Q?YcB+ppL7xbxfOFgSWRzkjaIfsy1ZKiEdaxKBb0K8QGvTYkjw0HQ5CDJizVT8?=
 =?us-ascii?Q?fV2a23lFJ9qfgPqeq92JUTXc1A7q18vwYfX9kkx73QLVJ6JKkOddBL9THPRL?=
 =?us-ascii?Q?VmDcGIyhtc/8KoVPWa0/N94b23mHOsW3k8pVCvByRwRR7yjdDK5rDttah4h0?=
 =?us-ascii?Q?Hg821co4kmHSaXyqOKkendSeMznN1x4Mn5FpX9dpn+iee/9nzNZrMuA/1hr2?=
 =?us-ascii?Q?fgzZH6wwIXzYsrW1RKczxjwQxeCEjSJ73lxVYbAeP1Av/3EReIaQbiiIYRZt?=
 =?us-ascii?Q?R5TtulfhYj7OXX9RBHZz0r7VHI6o24WdTPuhB5O5u88xGQ59EzFJe2fnS4x9?=
 =?us-ascii?Q?7/sU3YxlCCyqA692df3jCwuPpuADUTZqjGgsNK3MJdtAJWHIDV0YQorHTuhy?=
 =?us-ascii?Q?MKSf5I3+qGKy+ua9zKjFSA9egFF5FVxZaAVIiyx/dEbLsQiRE6M5p08ACWqy?=
 =?us-ascii?Q?2+irdFOJuF7ToQTsf9N8lbYWADeUtdAqp5boUBcOlaW+3VgFijBEmFjBxCaf?=
 =?us-ascii?Q?Hb6XVizn1l54um0HPQpCRzeriHNPZsLfsF8436+1r7oZQuy9djUeZkBhWMIb?=
 =?us-ascii?Q?ABHtxojCgX+6RIR1qyPg2LyDZtylp7SDzRUDwqPZM2OFqZ5MYEDDR0ArQTEE?=
 =?us-ascii?Q?LhMbsohSpBVxF68VtSyyQKrSp09qckt/HQDu6ICmR/hnn+u+lyOnjwssIhh5?=
 =?us-ascii?Q?8F/B04ne3qf0kmDgeFAVqfH7+kt2rdIHpOVlKlKJg9ui1Q7+vbRRBL/4EN7V?=
 =?us-ascii?Q?EyXvD97J7flC25qtdyDpyKbFXQA0MHxfnszO9NpH2+Q11wDlo1lH3fN+yjDO?=
 =?us-ascii?Q?CQY/BrmGbZPmFluPRRhgkaURW5+rqNlF91TbEtWKsXKEHiCIDYCmWn615+vc?=
 =?us-ascii?Q?7Se6882FHC3wkXwe5kt7D2mgIxm9xmlRKiCWNq2mQO+24uC+YGHJLt66vkAf?=
 =?us-ascii?Q?RlbXCKlwbJy0pANCd0itW5Fljc0wIyXN6szI4z1HVn3bshuCS5svyMst7DNx?=
 =?us-ascii?Q?55G6/sruOKyqnkqOwNTkFtNEFjh4qrEfV/p7r8iBa6z1NG2D6FkfLopXw0vm?=
 =?us-ascii?Q?czow5+lgRrD6rWONbDUZof1G8JRDLaxgRXN4/3AJDYOkGW3Sg0AOuensOz1L?=
 =?us-ascii?Q?X9rcw39pyCRXO/dl9Bny9G6xlj1hNXXIcGt6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 22:37:57.3186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9937ee1-07d6-4a6d-8186-08dd9d6f20cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7586

is_periodic_irq() was removed in the Fixes commit, but the prototype
remained.  Drop it now.

Fixes: ddc35d1cc994 ("[HVM] Enable more than one platform timer...")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
The full Fixes line is:
Fixes: ddc35d1cc994 ("[HVM] Enable more than one platform timer (PIT/RTC/HPET) programmed as periodic timer and adds them to abstract layer, which keeps track of pending_intr_nr to avoid time interrupt lost and sync'ed timer with TSC.")
---
 xen/arch/x86/include/asm/hvm/vpic.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/hvm/vpic.h b/xen/arch/x86/include/asm/hvm/vpic.h
index d71b270193..78ed33e9aa 100644
--- a/xen/arch/x86/include/asm/hvm/vpic.h
+++ b/xen/arch/x86/include/asm/hvm/vpic.h
@@ -35,6 +35,5 @@ void vpic_irq_negative_edge(struct domain *d, int irq);
 void vpic_init(struct domain *d);
 void vpic_reset(struct domain *d);
 int vpic_ack_pending_irq(struct vcpu *v);
-int is_periodic_irq(struct vcpu *v, int irq, int type);
 
 #endif  /* __ASM_X86_HVM_VPIC_H__ */  
-- 
2.49.0



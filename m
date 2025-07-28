Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42194B142A4
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 21:53:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061914.1427511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugTu6-0006lf-9g; Mon, 28 Jul 2025 19:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061914.1427511; Mon, 28 Jul 2025 19:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugTu6-0006kD-6Y; Mon, 28 Jul 2025 19:52:58 +0000
Received: by outflank-mailman (input) for mailman id 1061914;
 Mon, 28 Jul 2025 19:52:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uPvZ=2J=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ugTu3-0006k7-SL
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 19:52:55 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20624.outbound.protection.outlook.com
 [2a01:111:f403:2414::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 728eb242-6bec-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 21:52:53 +0200 (CEST)
Received: from SJ0PR05CA0163.namprd05.prod.outlook.com (2603:10b6:a03:339::18)
 by MN0PR12MB6246.namprd12.prod.outlook.com (2603:10b6:208:3c2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 19:52:50 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:a03:339:cafe::1f) by SJ0PR05CA0163.outlook.office365.com
 (2603:10b6:a03:339::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.11 via Frontend Transport; Mon,
 28 Jul 2025 19:52:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.0 via Frontend Transport; Mon, 28 Jul 2025 19:52:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 14:52:47 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 28 Jul 2025 14:52:46 -0500
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
X-Inumbo-ID: 728eb242-6bec-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YhBIpfklX6Kyi452qvZFUDiPHVFkiOHWbT3U4/PYVWCe2oLMDsGBI2+HqHGV3zCAV+LA+dPAwY39QyAbNti6q55kwwBtwVwwaGYn9dUGkIa6G3vJnD7hCTZLZkkoTxh5rGt31Xt30JEnaGmfkhPQu40sDpnnhTHu7VRJQATHKdyVFI6k031Ev3OIXf4hioXHz0+4AHst1SsUZXRofZySxrF5r9E3JOrP2ERqm2VTS8UOlKYjmTHb1YTsieaJjBNwgMexVHBigXIiMyJUcsRU/HRZYcZhudMQShrLQtLHJABf1MbAKvWYNtC0PJdfwGNJfFBHdG+p0AKsWXdzjdPR0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBzOoW8r1k77r3Pka0LshNPmTSwghiAK8xr8qcTkfBc=;
 b=yK7YM8SqMuUxZibifGhVkK3DgIOE5pYTgO1WpRYHFzukmd686Ra9DnfQkrwsiXLahIZbkKOiELI9ACfZK7LzIyNf1ON0xZH37Co4c7sABhQIJnnMlG1XrV/+GZe5JZ3wzsRXnVMv70u/fP4tlKcOx9TvtVnXhFLBhkNlCL7wakiQg3EdKwpQ5SF53Rd3Mkho4ApOzA5a0xzIAy4ImZKTcdKlKGVOXzXBWj4HK5jb6oCTYwtHVxsGkfFolGjVJKhGxYF2O7rjhzNBka70ePilaOVqlMoNkBI+HlQKzQLA9YxaQ2tn7cK/3/7Q2tW31hCDqQU7uXcVGIodkm0KzXhAEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBzOoW8r1k77r3Pka0LshNPmTSwghiAK8xr8qcTkfBc=;
 b=E0nLRQnY+YcSOyRnWWE6UR5rxpu4QcpT8Og5iEKIpKGrFKj8UyiqGzANVmTwnc5yBFMgzeQahYvssylo15GMkZYgKoSO1FWhxsgBUyXtf8gRwuMruwJ4MVlxnEEfRGglUmofp5AZC9xBXaaHAlqz0CG2uu5zha574LPfRGBli/w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen: fix memory leak on error in vcpu_create
Date: Mon, 28 Jul 2025 15:52:44 -0400
Message-ID: <20250728195245.90356-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|MN0PR12MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: aa1177ba-56b9-4e88-ab4a-08ddce10547e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JU9+45Gy9srNrUR2Xy9RQYwGWefSJgtE0fovTb0d9eBta6QvkLdL55CGORBf?=
 =?us-ascii?Q?GvDiP76ojXtSCf+B9laEPnpkqBOT5LR+DaouXuVhoKQGJ+uzzKVj7IaSRBbB?=
 =?us-ascii?Q?y4kcaa3O1/mK2bPmr6UN/OygqXbDsfs2rIIN4iBHQobMQtdlQCTue0SlTAOC?=
 =?us-ascii?Q?nqgfLHLk8MKV6omICZc75wx+6vcgd6fHADDeudT1HLpuI2wAHl3kqLXUOi/4?=
 =?us-ascii?Q?Xx5UhUyt3iJGKghbvElD6tmBD7XrplacDxy/wo6cwK2154f276IrYXXfAL3j?=
 =?us-ascii?Q?2dcbPpO4KfayBdV5EDvlS/wvIjazGxgnmNdBdEWq5zcBnPrjSBG98uTebXJ/?=
 =?us-ascii?Q?feXvpjv60caDmMH06L8X4zABOFYkFTHuDISyJvx3n5m0rpc3SML8/VTPBouU?=
 =?us-ascii?Q?CfMc40aTaIpxNJLubMSjl8KvVGzjXWQqIlWJDvTUQttm6ICuVCTrExz0DvLW?=
 =?us-ascii?Q?aVcWkoHj7cqVi8P486RZLd6HI4c/Lvlo7Lxs5fTtUEmQYnIFHAmUbi5d60YL?=
 =?us-ascii?Q?YJ0o1aCK/4UPgn/94ASsB3m5SGUq1AqHMjSBiyPRy+7Nb8U/1lZ7fXKVxPia?=
 =?us-ascii?Q?Nv5tdlloQqZ0x1PdHx/A6yAf25Q3m3q0ApH1PBWHN+eDQeCKicLFPNenq6UA?=
 =?us-ascii?Q?wTCv1Iz3bWJkPDRsfPDyFZkU5gn1jlw7ckXlguuamoWOupPSv2da7je77Vz3?=
 =?us-ascii?Q?naWF8vNLIxDCOm1Oo8MAgaHl9Q0mSfWj8SxJAKnLMl6e3ByyC7euUFgyKwpK?=
 =?us-ascii?Q?QtIxY/ryZyGAdUPSnkAK7Pu/bR9LewGvh167O9pxvo1B6yL9reh7qPLvRZNn?=
 =?us-ascii?Q?7RDqyta2LxL1Qm3GdCJVQXAXWaRxI2lB6MTnSk9tFyOab8MzFHr3q9fILxl4?=
 =?us-ascii?Q?w2Mtl/Z/SdQ6FG1aGGbvRlYvyHdpxon68lMiacai4JyNfyhbUBp4fZtND/28?=
 =?us-ascii?Q?x56DNXqv02wBCf7s/XxpSK/6efXWaNhw6fFz59TMWhohfSImziQOqQJeo78L?=
 =?us-ascii?Q?1bJZfAkLVo3HYASwXVh78yezwdJvKjGsxHPaPvRXlBHn1SBZCvSjYOG18agu?=
 =?us-ascii?Q?HHUp4EBQJcGbdUXpHLyhxpKgLuLWzidgoxgZ1Y8jLixGSJYgVnRb1Ry9FrC1?=
 =?us-ascii?Q?nsgdWylb3bQcWTpffKl5O8tlLXWFvCijra2LvHbrOg1o9r1+cOk+043ghB5F?=
 =?us-ascii?Q?77LgwK4CCjgp05MaT6BO4gEEQl18KENer8BlGnbIMyFJX9v9djuHlWO20wY8?=
 =?us-ascii?Q?WqfRw6aQmhdENJg4oTca6946sKc1GpIdlFn1wnkBMGzEthpN3K92qWT6LeCz?=
 =?us-ascii?Q?xlwZ6SOmmCeRsgXxhJ9USsjA2GeeNxZ4r/TN9225K/+sJKRq4Jep402fGee9?=
 =?us-ascii?Q?eLjFIwefJOXSbSNHhn3ZFwbIt1Dp+bDZihKVkn2FSlFKdxv5Oe/ngv13Gxv3?=
 =?us-ascii?Q?/MOJKjrIDmuY3fk6ZRbZASZjvD9NLhYf0cHkbmF0bkn/oieyzz+dtRc3fP4n?=
 =?us-ascii?Q?3xtuui7ySlHStiSqQ17ldy/En+jdZLlaISug?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 19:52:48.7514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1177ba-56b9-4e88-ab4a-08ddce10547e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6246

In vcpu_create after scheduler data is allocated, if
vmtrace_alloc_buffer fails, it will jump to the wrong cleanup label
resulting in a memory leak. Correct the label.

Fixes: 217dd79ee292 ("xen/domain: Add vmtrace_size domain creation parameter")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/common/domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 3c65cca5b0ff..b1e2709d3d82 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -451,7 +451,7 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
         goto fail_wq;
 
     if ( vmtrace_alloc_buffer(v) != 0 )
-        goto fail_wq;
+        goto fail_sched;
 
     if ( arch_vcpu_create(v) != 0 )
         goto fail_sched;

base-commit: a845b50c12f3ec3a14255f5eb3062d0c9801a356
-- 
2.50.1



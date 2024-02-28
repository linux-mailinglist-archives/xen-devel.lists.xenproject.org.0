Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEF986AC42
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 11:36:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686462.1068538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfHII-0001Ok-Ih; Wed, 28 Feb 2024 10:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686462.1068538; Wed, 28 Feb 2024 10:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfHII-0001N2-EL; Wed, 28 Feb 2024 10:36:10 +0000
Received: by outflank-mailman (input) for mailman id 686462;
 Wed, 28 Feb 2024 10:36:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NMA4=KF=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rfHIH-0001Ml-8H
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 10:36:09 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cb73f51-d625-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 11:36:05 +0100 (CET)
Received: from BN8PR16CA0032.namprd16.prod.outlook.com (2603:10b6:408:4c::45)
 by DS7PR12MB8274.namprd12.prod.outlook.com (2603:10b6:8:da::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Wed, 28 Feb
 2024 10:36:02 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:408:4c:cafe::44) by BN8PR16CA0032.outlook.office365.com
 (2603:10b6:408:4c::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.28 via Frontend
 Transport; Wed, 28 Feb 2024 10:36:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 28 Feb 2024 10:36:01 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 28 Feb
 2024 04:36:01 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 28 Feb
 2024 04:36:01 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Wed, 28 Feb 2024 04:36:00 -0600
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
X-Inumbo-ID: 2cb73f51-d625-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQvhUsjMCn5OFne3T09KQ6Gu9y5CLQeYkWHWAlyTyWk9hv2i0MpwWtDBniQlqzniPElmLqrNxv5/CUD1nD2j8K5ting89EmBzisswyjnQmYUfDHeWzv2ceIjCsnrbeZoz/gwZTh+o91IxnGCmGZZvVIrgiS0YYeZCeOEycebOr2n+qy11jYShU5IdIiNzph6kTgbCLZa0bk4XwBUBNfSij60RghMBN6oMoHJ6UFCTxVYA5/eE08tN3h1ArLi/Wy9Yh02PzGpFQInFGOwuN9f2l6RFkrEP2SoEMTYfazebOXgWd2x7wda2VYHyXK7QnoCLheZfdaym2xCdJFFvnBpEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJETay2uUVAJ5SihwmOLSlS2wrmi7o0ZhePbQ5L7+O4=;
 b=W+Yq9sLfkSpVfHFkqxzhDxcQ51REd81eE2zHq15U26rwxuc5441TUnIfURRQYQGxMSRQ1rTLrN2zgDTWpBKDB8UN3B6SAKnmcb+NQlE1jeSa3zoZ1rNakvc4C3sXT1VRIDpanPiZKREqBF4FRDBemPo4OEHT3LSBiI9GJr45Tkq+lXOys6yVvZs9EQ2exQD9Zkgs+D2/6Ux4mX2XoEVixcfvITG+zeZPZlu+W0oyeDbNiF+klIjzNZeGjjgCHLajzVAAYwVUeTPsA5xeI4agC1y4cp7lekPmbuaIKgLh1pjaM8vqcWWerNb/N9pbu+HCnVPVfSYd0v7/ABhcWDZirQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJETay2uUVAJ5SihwmOLSlS2wrmi7o0ZhePbQ5L7+O4=;
 b=GFFdZqwsOPGlqobLh0qOO8x6LR3F4sHQcXRD1ESQfu9rlipD2ZfbcdDchN+IchHTh2NWDeZ08qvJxJehiUkWRCkbvj7vUULRZYv/h7xZP5ebJkEApDJpSa3PpO9GqrrUhFUK6Hk1nMsTgY9Trl+8U545j61lxvOJcvcgBkHwBDE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Fix arm32 build failure when early printk is enabled
Date: Wed, 28 Feb 2024 11:35:55 +0100
Message-ID: <20240228103555.172101-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|DS7PR12MB8274:EE_
X-MS-Office365-Filtering-Correlation-Id: f79f49a2-41b8-4e27-1b29-08dc38490f43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4zCMVFiEf2wW+hvfBrN5IKQoyT09ngaqz8oCRW9sH1+RNR4h/0ji/l8CLDi6ZYyOyjDCuQtVAsec8joYtXcGirtdSMB196ifu7MaBB420VonrkUdUlLrpQZQeXrJmUev5TWzXiACvGPEynmO9Jv+OR3zf93XRkl9q1iJIybVnX0mgp8u/KF1FzU7BPsjrRQXxsYVqeAr+QxtFRpRkt+0AWsOoneFLG+d4d2rqc2MlnlnFgg1pKLIvzDUjxgKwB4fy6oOf0KB6tOYg0KGf+rTw17zqMnpuqNNUz/A9oag0KL7txY/oZc2UviiSoy5x8YwwEpPwYybRD6rAje9VruZ15ktLGv0+oHisCeqqtDh0JgqaAFh5YWm3nj+9eBZLrZYwhccop5wG5NHoh25o2AqDFWnSfIYSYPoFsyxr3T3z3qyZL56+sCKpKj4HpVGZc2mEaZnn2aWTWjPzWph8RSUNdAynjacn6G3Hgua2pGr70DChj1QsgfG3yiHOcq37z4vZUVqkQg0AHCdfumhuGd08UqmG9GzuH9xRv05N08YDmTJtzH0SP0EyhumRA//xKobd7VP30eW5VN22z0LuG0B8Nq6tUP5vIh28y66+Hm8d2JELKedtVcwywInrL6cYRzYfptgQdMZ8lJvcBglYdfYpOczVyp/oM4smlBYnBUHUrWXYLyL9kZOdRL/twp8aR/cFHIeE30psXg6o3fyZ0uQRJ1q/vQkYJzZMJCTBJPuo/ibbS7ht2OrjRSU/XHDAcAy
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 10:36:01.9123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f79f49a2-41b8-4e27-1b29-08dc38490f43
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8274

Commit 0441c3acc7e9 forgot to rename FIXMAP_CONSOLE to FIX_CONSOLE in
TEMPORARY_EARLY_UART_VIRTUAL_ADDRESS macro. This results in a build
failure on arm32, when early printk is enabled:
arch/arm/arm32/mmu/head.S:311: Error: invalid operands (*UND* and *ABS* sections) for `*'

Fixes: 0441c3acc7e9 ("xen/arm: fixmap: Rename the fixmap slots to follow the x86 convention")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/include/asm/early_printk.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/early_printk.h b/xen/arch/arm/include/asm/early_printk.h
index f444e89a8638..46a5e562dd83 100644
--- a/xen/arch/arm/include/asm/early_printk.h
+++ b/xen/arch/arm/include/asm/early_printk.h
@@ -20,7 +20,7 @@
     (FIXMAP_ADDR(FIX_CONSOLE) + (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
 
 #define TEMPORARY_EARLY_UART_VIRTUAL_ADDRESS \
-    (TEMPORARY_FIXMAP_ADDR(FIXMAP_CONSOLE) + (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
+    (TEMPORARY_FIXMAP_ADDR(FIX_CONSOLE) + (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
 
 #endif /* !CONFIG_EARLY_PRINTK */
 
-- 
2.25.1



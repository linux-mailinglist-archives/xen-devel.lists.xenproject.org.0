Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AB37D3CBC
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 18:38:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621573.968170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quxw4-0001gn-Os; Mon, 23 Oct 2023 16:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621573.968170; Mon, 23 Oct 2023 16:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quxw4-0001ei-LL; Mon, 23 Oct 2023 16:37:48 +0000
Received: by outflank-mailman (input) for mailman id 621573;
 Mon, 23 Oct 2023 16:37:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S5HM=GF=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1quxw2-0001ec-Qr
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 16:37:47 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20616.outbound.protection.outlook.com
 [2a01:111:f400:7eab::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b3ebb59-71c2-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 18:37:41 +0200 (CEST)
Received: from SN6PR04CA0102.namprd04.prod.outlook.com (2603:10b6:805:f2::43)
 by SA1PR12MB5658.namprd12.prod.outlook.com (2603:10b6:806:235::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Mon, 23 Oct
 2023 16:37:37 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:805:f2:cafe::e9) by SN6PR04CA0102.outlook.office365.com
 (2603:10b6:805:f2::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33 via Frontend
 Transport; Mon, 23 Oct 2023 16:37:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Mon, 23 Oct 2023 16:37:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 23 Oct
 2023 11:37:36 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 23 Oct 2023 11:37:35 -0500
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
X-Inumbo-ID: 7b3ebb59-71c2-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWuP4mFwfuIBZXZxNypaDlLc/m7SevPJPbNmOTXhv0fKdyTHDBYnVKRtJ1NPA/sUE+GGYiIEYvomtfrfMwLgmy88bPKErEhQzO5WA3QknG+WSsowo1/CYqtcqZ1k6dNqt0Mtl7xoKQaWQLAYKplO+pmyy8aC/g0PjqokBrqzCE2rtYaV5P0Uf7owJpIGNkpPwZLl0AArZxMp1lKnHPq0vz3aUI/vH+qqIHYa7VEw2J2c9hf9QaWK4Gkd8JfgPz1uQU6PdFWVWusPGBDa2cP5tfSTDztgvdPAIyPBSAkh8p0dyu7NsGWssqu9/Va4QN/OswdTxtiYYT3imK5Pqx77fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sts18KoG3P9R+TzF0gjg1K4Eu54lv/xR0a8FI2qbN2Y=;
 b=RLDAyWSWEgeSvEmd47t1vhQD9xHjG4ZXOBuiPj+FXldUVFDpUEKYAv/foNqrTCtxjxU5Hi8zmvtUaZguX+koLYk/OncH042bUiBQVC4/yTTo/lARdH3o0Np6q+mhcfWBqRYq+0gSfQ62P5Xl4GiRoEiss5zB2zmo43VFdf/zrb9aL6NJszAYZqD1FO5ujAx3ZjjGnS7UNhYhz+tDvsIIXijfqm8ZlNJ3AFK5zJPytUfqw0ARY1noQEYJHEaaQ390fmD70J+40JZPFamUEOu/0oGuRtadBruLqIHLkp4YGiz0zAJrJFUwKDrHBZLWEycSc7n20+RAmH/wSbYgxwNLuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sts18KoG3P9R+TzF0gjg1K4Eu54lv/xR0a8FI2qbN2Y=;
 b=gauucPrZ1EaBgXsChnTVK7QpWd9rE+DxDuh1lfltXsJ3qZCLkdpI6ypNxyNAswkkHAw2A9cXR/cydXeFJD3NnacarqISUd8fTpPrb2NUcMLPnSng6O2sXyTW8DEkNwXalpJ5H66y1DoNdpz6KkKVlfwpDTYk6H9hkbkP0BFVNJs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen/vpci: allow BAR write if value is the same
Date: Mon, 23 Oct 2023 12:36:07 -0400
Message-ID: <20231023163615.693462-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|SA1PR12MB5658:EE_
X-MS-Office365-Filtering-Correlation-Id: 464d2257-d8bc-46c8-262a-08dbd3e65db4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MCN/V295YYrusZ9zbmlrJ9cPDuzS35iBEOaGFWCX9uoW0QvWRNtWkRepX6EU+1UIEWvo3APDa1PZHHYmYO1qjuzST8LaU58MkkBSudnuVhaLENHMc2SmEklVqCkXoqVeDGeV31jFjXGt1P2gyPrNs413H2D+7NyEJ22XzNu4kyE7bl6RhxHiZ5KGZ+WQMASAzie5j1rxd3ajQ8O2LYoBQDy1iwJaQEZ4e5MPdqyrcPUslMBCS1mquWi5pYK6BfF5zh8cbTEvOPIgkzNlPbjhXptYbUW45JisNg1kCgzadb5J7KNh2aYdJBO9EgGNQTGMDKuVMhxrz/Y+LzLa8Bvve/FwZwm53LPCHNICHAex0l4EUOGM8VpIL4WyQvwo1D7fte5MWva8s5xDkP74LI2Gy687ZX2qPZdMpfFWvaJwjqEEDDKzg3Rm7Igq9PgScZAWc72W0NPHBUu69xZgRFQaJEpzzwxR2DF1gNz+rjSMNjsNUoN9727I5MWSBvzSWNoWqoEySBgAJgPBfYk4RlYNbpphcaECJsPbv3/yqbcMZLc/VfLjkMsLcYojoXATrFa/vhVDHRRKh1t3YGvLvJMHx/7n9Z89PDm5kid1hdZ3sGrtHwjT+D702Y/kA3gyEb16nFPCL/FQpjzl6evhia8H3SpOZFsIOt6yJyQiXF0zxBlBrtjvaSvVP3uktBVvcFVq/4LAYsNLANrdC24oILnJJFdHpBt0KPCTOh7Ioao5Rpe0/DX4xC7cEYRf12/aGTDLvgcSK4FmbUdmnf5/ZSAXxw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(39860400002)(136003)(346002)(230922051799003)(82310400011)(186009)(64100799003)(1800799009)(451199024)(36840700001)(46966006)(40470700004)(54906003)(83380400001)(36860700001)(2616005)(26005)(336012)(426003)(1076003)(6666004)(36756003)(86362001)(47076005)(356005)(82740400003)(81166007)(40460700003)(41300700001)(4326008)(44832011)(8936002)(8676002)(478600001)(5660300002)(40480700001)(2906002)(6916009)(70586007)(70206006)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 16:37:37.0614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 464d2257-d8bc-46c8-262a-08dbd3e65db4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5658

During xl pci-assignable-add, pciback may reset the device while memory decoding
(PCI_COMMAND_MEMORY) is enabled. After device reset, memory decoding may be
disabled in hardware, and the BARs may be zeroed/reset in hardware. However, Xen
vPCI still thinks memory decoding is enabled, and BARs will remain mapped in
p2m. In other words, memory decoding may become disabled and BARs reset in
hardware, bypassing the respective vPCI command and BAR register handlers.
Subsequently, when pciback attempts to restore state to the device, including
BARs, it happens to write the BARs before writing the command register.
Restoring/writing the BARs silently fails because Xen vPCI mistakenly thinks
memory decoding is enabled.

Fix the BAR write by allowing it to succeed if the value written is the same as
the Xen vPCI stored value. pciback will subsequently restore the command
register and the state of the BARs and memory decoding bit will then be in sync
between hardware and vPCI again.

While here, remove a nearby stray newline.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Do we need similar handling in rom_write()?

We may consider additionally checking during bar_write() if the memory decoding
state has become out of sync between hardware and vPCI. During bar_write(), we
would check the device's memory decoding bit, compare it to our vPCI state, and
invoke modify_bars() if needed. Please let me know your thoughts.

I considered additionally checking if the hardware and vPCI memory decoding
state are out of sync in new cmd_read()/bar_read() handlers, and calling
modify_bars() if needed. However, I decided not to do this because it would
impose an unnecessary implication on the in-progress vPCI series with the
rwlock: calling modify_bars() would require holding the lock in write/exclusive
mode, whereas in vPCI read handlers we would only hold the lock in read mode.

I have only observed the inconsistency after device reset when pciback (i.e.
dom0/hardware domain) is restoring the state to the device. Since pciback will
also restore the command register, the state will be back in sync after pciback
is finished restoring the state.
---
 xen/drivers/vpci/header.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 767c1ba718d7..446ecf539e89 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -430,19 +430,17 @@ static void cf_check bar_write(
 
     /*
      * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
-     * writes as long as the BAR is not mapped into the p2m.
+     * writes as long as the BAR is not mapped into the p2m. If the value
+     * written is the current one allow the write regardless to ensure
+     * consistent state between hardware and vPCI.
      */
-    if ( bar->enabled )
+    if ( bar->enabled && val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
     {
-        /* If the value written is the current one avoid printing a warning. */
-        if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
-            gprintk(XENLOG_WARNING,
-                    "%pp: ignored BAR %zu write while mapped\n",
-                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
+        gprintk(XENLOG_WARNING, "%pp: ignored BAR %zu write while mapped\n",
+                &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
         return;
     }
 
-
     /*
      * Update the cached address, so that when memory decoding is enabled
      * Xen can map the BAR into the guest p2m.

base-commit: bad1ac345b1910b820b8a703ad1b9f66412ea844
-- 
2.42.0



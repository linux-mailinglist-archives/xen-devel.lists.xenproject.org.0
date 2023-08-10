Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4127776E3
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 13:26:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582072.911653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU3o0-0007i0-04; Thu, 10 Aug 2023 11:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582072.911653; Thu, 10 Aug 2023 11:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU3nz-0007cB-RQ; Thu, 10 Aug 2023 11:26:15 +0000
Received: by outflank-mailman (input) for mailman id 582072;
 Thu, 10 Aug 2023 11:26:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8LQy=D3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qU3ny-0007LL-Fk
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 11:26:14 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4b66cda-3770-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 13:26:11 +0200 (CEST)
Received: from MW4PR03CA0262.namprd03.prod.outlook.com (2603:10b6:303:b4::27)
 by CH2PR12MB4136.namprd12.prod.outlook.com (2603:10b6:610:a4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 11:26:06 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:303:b4:cafe::85) by MW4PR03CA0262.outlook.office365.com
 (2603:10b6:303:b4::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30 via Frontend
 Transport; Thu, 10 Aug 2023 11:26:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Thu, 10 Aug 2023 11:26:04 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 06:26:02 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 06:25:55 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Thu, 10 Aug 2023 06:25:54 -0500
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
X-Inumbo-ID: b4b66cda-3770-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKp0N4KbQrOEtlgL4PD8o14PHKvZt2JlxB801L+XxBuY8V+ZdHIBdQr5d59CMIpb9AA37NlEOre3hZp5AsVJqWtxFVWECUXwDTTJE9bB3Litylw22DUe4mfdGpBn8nEfbz70n6UFQBemjKes9A2xBjRW5s2jMONlkpibuGvzeqyO6mZ7e0PXPclYCtvv39L701ZbVIiO2Wfa7RtdooTjPn08I4NOm8YrEyvhkd32+Hy8mNgc8B6SdEBvJ8P9KmpKApuAwi2E4JOScl3dEWAyLF124TmdPwbeFcwYoSILk6e2Y/HsxBxYFpYMqD3y9rcE5i7VSvvbJWTn/ThMQRsCWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JuleepvHl9watBMb8Yr2FhoB77ZcoX5n+rVEP21MO5Q=;
 b=alJ8EOZMSn5PWrV6MrHkRx6IDqSBCx2urwD9tKGpwRTnZOWo67XIjgckIT0k+EeAq+Yge28IWFWwoqEf8nQrBRQhfARF7VkBt9A3HPbHsyYswVXKQ6qO9Rty5E5cYg50M64mn4serMtr5f3aRcE2vpkCbRli2vASP04Q3e1WypEuANNxFqEHh4WttPSoDyDXP6VGKM6regp+EbS4FjP19vnT0rdIm1uQQoWt2BsixPvqWvdQBw9YI11/doBDn8QXni8zKGnWCKJ6M1FE1f8mS6JDJaIcYohdtKJKFoElZuxV8TtRX2bnSqywa8UtiM6arxgXz2iy4lbnXZa56/Q8vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JuleepvHl9watBMb8Yr2FhoB77ZcoX5n+rVEP21MO5Q=;
 b=w45ye4cRZ0Eyk6FiAx08c0HCOr4d2N5Brn2H9eZFtbYCtAzsU0IFfvgFGHtx8FPl3xJTUk2OJ7O7SHqPM12f2yRbj3e5zESiT6CDJcYrgGTN0RVPdLPU+YWkhei7q/IvxEqXdd65xW+yBNPPjEw1ICTQZglNtluoaL04LqAfxe0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/2] xen/arm: Fix initrd placeholders generation in make_chosen_node()
Date: Thu, 10 Aug 2023 13:25:43 +0200
Message-ID: <20230810112544.17365-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230810112544.17365-1-michal.orzel@amd.com>
References: <20230810112544.17365-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|CH2PR12MB4136:EE_
X-MS-Office365-Filtering-Correlation-Id: 957aaee4-7783-4d80-7454-08db999495cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ngULf1tCXWnr0u7vrSTOCAEp5OgiazJK3vCXUqk+qlcdmLI38OWde0DlMtIuuZx3/EUL1DndyQsTHmDroncp4kKUCRrQsBiYfKiS4P8D4ztV3Oj9sdjJCwdsQeto6AA1DXtBA51/Lw4B/UDfjhnRkeScMF6ZhcO2gty/GjjNMmuF97LNWnIOyPfz9KthydvnqrgUJ8xb61zBNKCFHduYIad4gPisYh+1sBdEkW8mukzB7A1PXXa4epfNmXZWKFLCY+4XOeuGs06ZNN4v9CjSIAhrhJDLdQTHwxWkYMGDVoJCuh4iBcgwkXrUHzkc0oI6COoEpFydTu4fyctvygz/KLeLO04ZJ0JQUEalmjElQrxOqF1omNoi5bin5QBJsK71m0NUSwVvtx5dbYPfbpbxWmwo77yTHlj13jyobnkqF7w38nTmrNZ/WQ5P05+zb4/iSbwLZFvaxG9HDV/u35vqw9YbsGQXTrE7fw4pWhNNyWHElxplpYCAlsuUaXxDxSLzX7qIvoWm++uUjr7RLb/282ph1M+eZTZV4wU1xhWEduMtH0PGoY5oc7j3rEEa/Oe1bUjTwujrWiEu2Vh8Um9LTp7X2KnaAdBzeDQTpCqKakH/lx8dWGnMnxeF6Nu2/fMDeK5XuIya08rvHEsY8AcJdy1aI9Lr+pn/LtzBhWQV4MWUD6seKn5VzBalxW6PIPElk2ka/iu0yTARi9NZPgH0OzPnaV8pHjomNUOen/QJNGFLFS1mkQUyTWPgw3OddA9IClJw3EyQXpLf7c0U9NqjHg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(396003)(376002)(1800799006)(186006)(451199021)(82310400008)(36840700001)(40470700004)(46966006)(40460700003)(40480700001)(70586007)(6916009)(336012)(70206006)(1076003)(26005)(6666004)(478600001)(36756003)(54906003)(83380400001)(47076005)(2616005)(426003)(36860700001)(41300700001)(44832011)(316002)(4326008)(2906002)(86362001)(8936002)(81166007)(8676002)(82740400003)(5660300002)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 11:26:04.9105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 957aaee4-7783-4d80-7454-08db999495cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4136

When booting a dom0less domU without initial ramdisk, it was observed
that Xen still creates empty linux,initrd-{start,end} properties under
/chosen node. This is because in make_chosen_node(), generation of initrd
placeholders (later on filled with the real values) is protected with
a check for presence of kernel bootmodule (always present) instead of
initrd bootmodule. Fix it along with renaming the variable from "mod" to
"initrd" to prevent similar mistakes in the future.

Fixes: 48f4bf6bdeb4 ("arm/acpi: Create min DT stub for Dom0")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/domain_build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 39b4ee03a505..c6881de8bd85 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2256,7 +2256,7 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
 {
     int res;
     const char *bootargs = NULL;
-    const struct bootmodule *mod = kinfo->kernel_bootmodule;
+    const struct bootmodule *initrd = kinfo->initrd_bootmodule;
     void *fdt = kinfo->fdt;
 
     dt_dprintk("Create chosen node\n");
@@ -2276,7 +2276,7 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
      * If the bootloader provides an initrd, we must create a placeholder
      * for the initrd properties. The values will be replaced later.
      */
-    if ( mod && mod->size )
+    if ( initrd && initrd->size )
     {
         u64 a = 0;
         res = fdt_property(kinfo->fdt, "linux,initrd-start", &a, sizeof(a));
-- 
2.25.1



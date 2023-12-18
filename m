Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5DD817BFE
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 21:33:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656385.1024492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFKJ2-0003es-J4; Mon, 18 Dec 2023 20:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656385.1024492; Mon, 18 Dec 2023 20:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFKJ2-0003cR-Fg; Mon, 18 Dec 2023 20:33:40 +0000
Received: by outflank-mailman (input) for mailman id 656385;
 Mon, 18 Dec 2023 20:33:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wqZ=H5=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rFKJ1-0003D2-Az
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 20:33:39 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7d7a636-9de4-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 21:33:36 +0100 (CET)
Received: from CH5P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::11)
 by DS0PR12MB7873.namprd12.prod.outlook.com (2603:10b6:8:142::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Mon, 18 Dec
 2023 20:33:32 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:610:1f2:cafe::71) by CH5P221CA0020.outlook.office365.com
 (2603:10b6:610:1f2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38 via Frontend
 Transport; Mon, 18 Dec 2023 20:33:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Mon, 18 Dec 2023 20:33:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 18 Dec
 2023 14:33:31 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Mon, 18 Dec 2023 14:33:30 -0600
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
X-Inumbo-ID: b7d7a636-9de4-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKv8LiDJ809zUxHmJa9JVfopZvvnCKfFlFgOuhQldaTb93TpVIHwiBL+sjGdrQPwhxsQQWak5xcWXgUhvRHcoETYc7OMaLCfXIS9taaLLwlN/qSgFexrrNc3Ksxe2FYWTk7sbCjAnOTmVIRiI5IzMvuF/BzWOm632FOcBMV4L2dSehctCyRisrHWfpDt1IcBHO6921BH9IcoCd4b4vQoYcAsBNhe1V9h/guR1iPgugpjWjC7PMEgIXjYJ73TrnY8QBsQy3m09PcwUvY4tEC5DDXVy7zKs7roxXtNmA+W1DmBJutObRxsZBkJz095LdfF6Kp2HMuLOBJ9eJ47nBK/Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idvMLh7ay3HgFa0HUlYc6KaMzvjAv1vhicqtRD33Dco=;
 b=KyMQJl+0WIazzpnt+Z8Ac49uw2OxI6/JJ+nNdKpR/n42R7auMxGL6i4YzjUXg1an+nE8+mhYWt7dKo0a7dD8/iJre/X1deWzLvKoleq8Fm7evUPsbSjhA4vYoXbhJNe4r/9t7qwWX1QA2VBcAnEt/aCwxbkfN8pgJzX1z7IEQ7UcEw8LDpKJvuBrs+JdqXDk+qmZa+ZtGfbkSrYlO8/Xr7RjlNpDShyQGyiPFiWJhIS/yc+jPCrecLwm3cJRxXXJJ0DSrvnvLdss5SCd/Fu0Ws0k6t7sbVhLd/F5O7KAoE38FTsm8WlfNoMwTT+PEynXlDYdnitYjKlLllaYCK7Uwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idvMLh7ay3HgFa0HUlYc6KaMzvjAv1vhicqtRD33Dco=;
 b=QKFWbe7aP1wIYykiADgU/Lh5ORtCe4glZejNFtIXPh4e20vrq3dHHjh4TWGaTr7nQIWH96Hb7DPSSrjtY+38V8lx32hS3idg23NBbwrWXhXWgh9OHuy9B37oLOpWBp4MCB+cgWI0GFKGcAVTCmlR2wxy3Z2QFo/sHz0iLl9f99o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <julien@xen.org>, <ayan.kumar.halder@amd.com>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <stefano.stabellini@amd.com>
CC: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 2/3] xen: arm: Introduce CONFIG_PARTIAL_EMULATION
Date: Mon, 18 Dec 2023 20:33:22 +0000
Message-ID: <20231218203322.1394097-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|DS0PR12MB7873:EE_
X-MS-Office365-Filtering-Correlation-Id: 023e7c54-eeb8-4d7d-7a7b-08dc000899db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N8Mx+MHNnKjeu6Zp74UYCkwWdisVn+xJLwGb0kafpnPcwRljrIa2OwS+jLky4wIf2DsZN+0jBEkXcO79izp3GzPy4ms57ocsxMtzb8r2kNwKQj9wysZ4D8mdH/V2q5BZQ1HLfzgMOB/p8YVtj18/SugOWAqnfUWg+LuaaFVlD+0oct5ueaishIyUZWEft1a+3Vn0kubrXz+pOZ6SFdQKQ4IAfyzHlDs2A+fzlgmZcvpGbI3DrM5MOn4GU9b669nGfN577T1ptRmbSLyueyUQr+r8JRATsLSdXPPOgFQVlojgMv6wHGJ7557QNfibPSTgZ6O6R8d/M59ZgVPvL0LzTGMSyFHnL+tRh21OxvFMoqdBzL2ddTTKIMv1Om6vWIw0iqwWTJXaJG7uK7nisWuyEv06Ut2xAz9bmB+HvNnleIJ7rcnByIwyqesDeAtTjo0v07Us9KCztnXRpaVAakYB8pv3rDvKuJtaRUJ/C5GEfgCLZhc1KfcXxq3tOdI4mxb5wQH0/xSjNYgiiqVDexsqf6oCf7xVK3P62WsCltztZgp3I+NNSVMkcz3sbuvm2GLQUWUwPgJ6H3/ZzPmogTbpKFDikmidDsRFdEReMGiej7sTZQlvNKbg4ukFAOe7N+u6dqc/BrXbXD1VOxobU1Ei9dYvystiprt7z/6JbNvNHVM1yoOMay8eqA2Xw7WjfjYpfir0J+UpILHqrwRuyVa3kIM3NZexcpmhnU9mWdUULjoLcy35LpUrvAdPMcfXsj79h7c1CPiZ5TpBsfX0PcI7/g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(82310400011)(186009)(46966006)(40470700004)(36840700001)(26005)(336012)(83380400001)(426003)(2616005)(36860700001)(6636002)(1076003)(47076005)(4326008)(5660300002)(41300700001)(110136005)(2906002)(478600001)(8676002)(316002)(8936002)(6666004)(70586007)(70206006)(103116003)(86362001)(36756003)(82740400003)(356005)(81166007)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 20:33:31.9553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 023e7c54-eeb8-4d7d-7a7b-08dc000899db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7873

There are can be situations when the registers cannot be emulated to its full
functionality. This can be due to the complexity involved. In such cases, we can
emulate those registers as RAZ/WI.
A suitable example of this is DBGDTRTX_EL0 (on Arm64) and DBGDTRTXINT(on Arm32).
As this register is not optional, guests may try to access this. Currently, this
would result in a crash. With this patch, Xen will emulated this as RAZ/WI and
the crash will be avoided.
Such partial emulations will be enclosed within CONFIG_PARTIAL_EMULATION.

Also "CONFIG_PARTIAL_EMULATION" is default to y, so that Xen does not need to be
rebuilt in order to prevent guest from crashing while accessing registers like
DBGDTRTX_EL0.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from v1:-

1. New patch introduced in v2.

 xen/arch/arm/Kconfig         | 8 ++++++++
 xen/arch/arm/arm64/vsysreg.c | 3 +++
 xen/arch/arm/vcpreg.c        | 2 ++
 3 files changed, 13 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 50e9bfae1a..8f25d9cba0 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -225,6 +225,14 @@ config STATIC_EVTCHN
 	  This option enables establishing static event channel communication
 	  between domains on a dom0less system (domU-domU as well as domU-dom0).
 
+config PARTIAL_EMULATION
+    bool "Enable partial emulation for registers"
+    default y
+    help
+      This option enabled partial emulation for registers to avoid guests
+      crashing when accessing registers which are not optional but has not been
+      emulated to its complete functionality.
+
 endmenu
 
 menu "ARM errata workaround via the alternative framework"
diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index ebeb83dd65..0fa8716884 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -188,10 +188,13 @@ void do_sysreg(struct cpu_user_regs *regs,
         return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 0,
                                   1U << 29);
     }
+#ifdef CONFIG_PARTIAL_EMULATION
     case HSR_SYSREG_DBGDTR_EL0:
     /* DBGDTR[TR]X_EL0 share the same encoding */
     case HSR_SYSREG_DBGDTRTX_EL0:
         return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 0);
+#endif
+
     HSR_SYSREG_DBG_CASES(DBGBVR):
     HSR_SYSREG_DBG_CASES(DBGBCR):
     HSR_SYSREG_DBG_CASES(DBGWVR):
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index 5087125111..52a8732423 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -575,6 +575,7 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
     case HSR_CPREG32(DBGOSLSR):
          return handle_ro_read_val(regs, regidx, cp32.read, hsr, 1, 1 << 3);
 
+#ifdef CONFIG_PARTIAL_EMULATION
     case HSR_CPREG32(DBGDTRTXINT):
     {
         /*
@@ -584,6 +585,7 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
          */
         return handle_raz_wi(regs, regidx, cp32.read, hsr, 0);
     }
+#endif
 
     case HSR_CPREG32(DBGVCR):
     case HSR_CPREG32(DBGBVR0):
-- 
2.25.1



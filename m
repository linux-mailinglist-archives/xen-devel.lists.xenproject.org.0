Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F19636202
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 15:40:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447595.704008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxquQ-0005xa-EP; Wed, 23 Nov 2022 14:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447595.704008; Wed, 23 Nov 2022 14:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxquQ-0005uo-Ay; Wed, 23 Nov 2022 14:39:30 +0000
Received: by outflank-mailman (input) for mailman id 447595;
 Wed, 23 Nov 2022 14:39:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P5PS=3X=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oxquO-0005ui-SE
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 14:39:29 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061e.outbound.protection.outlook.com
 [2a01:111:f400:fe59::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a06dc06c-6b3c-11ed-8fd2-01056ac49cbb;
 Wed, 23 Nov 2022 15:39:26 +0100 (CET)
Received: from MW4PR04CA0271.namprd04.prod.outlook.com (2603:10b6:303:89::6)
 by PH8PR12MB6721.namprd12.prod.outlook.com (2603:10b6:510:1cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 14:39:23 +0000
Received: from CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::73) by MW4PR04CA0271.outlook.office365.com
 (2603:10b6:303:89::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15 via Frontend
 Transport; Wed, 23 Nov 2022 14:39:23 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT032.mail.protection.outlook.com (10.13.174.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Wed, 23 Nov 2022 14:39:22 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 23 Nov
 2022 08:39:21 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 23 Nov
 2022 08:39:21 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 23 Nov 2022 08:39:20 -0600
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
X-Inumbo-ID: a06dc06c-6b3c-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IlvCoCnJvtr3SEMZHHStaHq/TlUGPbLIzRquTq7wHSF+s+bXHVEoKFr09C9bAZuRfVwkncesiHM9teYX4LXjy7u2byuT4hCcJFTIw98FZ1EfyfXNvzVeU42OkgSOVK/IIG1axnpRyYp6dXtYx+vN/+NRR4w9swCgCDLFh2PbYZu6tOkW1v2ntVYfP9b8PCgGLki4TEUAcgVcrYR/lJhyAzhCCGMn8vQAch5aVeby5tRCX5e5rmMYSqZg9PG0SG38c7q4Rqsz0t0Qy218ttX6Lm9Sgu7ZZeqNo74TDV7rZQN+3WkitJ4qhT9WSe8t/e3A8ZhZJJ30R3vIujMLwvbabg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91ztrhNqOMOt8/1qRSE0i4yZUeitmA5IIjtHpwt4LOc=;
 b=bI00qXmRZDoS8HH2DBs2vJ7Pj8aO6T13E+PQnsBP6AiBUexkpVCj82CpK/0wfbGGWJaQ5bhlbN8Y+RIr5ygMMGu8r9NUMSKuGohqv/tuas4epHoQcmZmZHRJP1pHbbAk0o+9+F3uEyJMjxfIpuHwRCBygVYZdvVs9LuBEu6oswSZIjoxVsnXUIuqXfiWnxjU08tJ47Pe6s8cSG2/V/ZemzfIrAzlvj2/tWJfrgRsnq8pfRBddaBdiwNfl/aB5wQkmaIBXL0tNQqP7PMuM162p1DqA+8haitoic5HRp6qW2uUhThr9kjZNYNIy4DI/49zhUOrIhNFIr7dFLy/t3Lj9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91ztrhNqOMOt8/1qRSE0i4yZUeitmA5IIjtHpwt4LOc=;
 b=VyMWm25UnYTdGC3iFOVeXbJqK+4pjPOMDAlw6hIcGTOHT1PKlkEmG17JgU8xURIX+RZi5b9NIh5ksqu6CcOnb6ZPx+0g+b3zP9MYQK1eaB7zXLGEpkRGzddM1o3afJzWupcD1mByRdbcOckBjh+4XLr9+A+lnpZbiM2J4J+mYgE=
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
Subject: [PATCH] xen/arm: Fix unreachable panic for vpl011 vIRQ
Date: Wed, 23 Nov 2022 15:39:13 +0100
Message-ID: <20221123143913.6527-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT032:EE_|PH8PR12MB6721:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c652ef6-a7b7-47c1-a576-08dacd60830f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mtyDhzEhA2+OO3CD5wC+BOsX6bLaPeKcwoZRIEvxGIjIRCSvKWNEzUNRqKaDksP0QB2biNWO+ObeXPiAFcyKKhbI+mdrIkqCEC0wq0XNI48Sp4e22Aey6E3DwndGiTk+agl0uGUG1/L0C9EURhWo7umoz15KB8di/VSr24e464K/YACuIXwyhbbJBBezbyEUDBG54ieV6QAe0+tIUjm1YB7l0hcxZdOGn9+8zBqBzO+BUw8Sgdz9vrmkDjRSE8/0pxi23vjt+gqL3+zDTgTV2J0sg9kfpO0cdqrnXfZ7WUOYsuT5CMpDT612QE2qfF4JCDoYn0TYNdJcpaWR3EpDOxB8nWPPvkiFbDkrCPUF6CzUA37qMygCoMO/4G6G0e46cml7PzSA0cuLmSKLf1DU0bzycXdtbaI98MPKkmtSCbyxNJF0ox78Ww8qmZZ+m4FazVwZPKUCC8iPag6LlALQhs7kXyopTmczEtLe0Zq+9bdSsSob3iZwf1+0n9aQN+ptlzQyRz8JI0EcH1vjWzxTt29Zgbs3+BVQWphtG1bBBUAB6meaGHxgZO8i6IEPGtz20KZw12ImNjj6QGHWD+89Rin5lZjUaDM7IyQWlq1DQCRnkTqUbOngxvos/Q2upCM4FJ8IWJEqHhRvIWb7IM6omxDqgKLxWSq6yA63zpc+0S/FCijiwtpZwmtB2FSIX8/mDMDzC1INpyLfSxpEIHJgHj87PVmrb/HCtC85MPW3uo8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(6666004)(36860700001)(4326008)(478600001)(26005)(41300700001)(186003)(44832011)(8936002)(5660300002)(8676002)(2906002)(83380400001)(40460700003)(81166007)(356005)(82740400003)(36756003)(54906003)(70206006)(82310400005)(47076005)(336012)(426003)(1076003)(316002)(2616005)(6916009)(70586007)(40480700001)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 14:39:22.4179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c652ef6-a7b7-47c1-a576-08dacd60830f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6721

When creating direct mapped domU, the vIRQ for vpl011 is taken from
the SERHND_DTUART serial port using serial_irq. This function can return
-1 (i.e. no interrupt found) in which case we should call a panic.
However, vpl011_virq is defined as unsigned int which causes the panic
to be unreachable, because less than zero comparison of an unsigned value
can never be true. Fix it by defining vpl011_virq as int.

Fixes: 3580c8b2dfc3 ("xen/arm: if direct-map domain use native UART address and IRQ number for vPL011")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
To be considered to be taken for 4.17, although direct-map depends on
CONFIG_STATIC_MEMORY which is marked as unsupported.
---
 xen/arch/arm/domain_build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index bd30d3798c9a..71a3243f48c5 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3897,7 +3897,7 @@ void __init create_domUs(void)
 
         if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
         {
-            unsigned int vpl011_virq = GUEST_VPL011_SPI;
+            int vpl011_virq = GUEST_VPL011_SPI;
 
             d_cfg.arch.nr_spis = gic_number_lines() - 32;
 
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB44AFE9C4
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 15:13:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038122.1410630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZUbn-0005z8-3U; Wed, 09 Jul 2025 13:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038122.1410630; Wed, 09 Jul 2025 13:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZUbn-0005wc-0L; Wed, 09 Jul 2025 13:13:11 +0000
Received: by outflank-mailman (input) for mailman id 1038122;
 Wed, 09 Jul 2025 13:13:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0v+Y=ZW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uZUbl-0005wW-Bo
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 13:13:09 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20631.outbound.protection.outlook.com
 [2a01:111:f403:2407::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73cd20f0-5cc6-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 15:13:07 +0200 (CEST)
Received: from SA0PR11CA0127.namprd11.prod.outlook.com (2603:10b6:806:131::12)
 by SJ1PR12MB6194.namprd12.prod.outlook.com (2603:10b6:a03:458::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Wed, 9 Jul
 2025 13:13:02 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:131:cafe::cf) by SA0PR11CA0127.outlook.office365.com
 (2603:10b6:806:131::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Wed,
 9 Jul 2025 13:13:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 9 Jul 2025 13:13:01 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Jul
 2025 08:13:00 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Jul
 2025 08:13:00 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 9 Jul 2025 08:12:59 -0500
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
X-Inumbo-ID: 73cd20f0-5cc6-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rA7vFs02iaG02wtMCl1cS+CC7rxn/KJ7hKfRv8dWJFFrb1e1cDM8P87hz9ivkmtQd7kLY259q533SzUsV01fFEcitec8yn4Ry59P3R/xonoAaVdZPnhWWSPospFUQN0hUy41oi6jYLZzmw8Mq6SExpJEOLQD5rCRvVqhxNqfRWUmemdrTfQm2uvqTDw6+Eu9X90tfcGRebFZMan/K01uynG6IUrFC+xgsz+RI44WPprloOLquJ+jfE4LVlQpm6t7ydt/8TrWDJU6xJgX1b+oYNv5sRMCwPKBNfcBMPZu7fp8X7gc1iQDw8ne0b9EIvJkXkQfAGBtOIL3GUmhZ+Fz0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Ik+OK9F+YqOzPpYHEKto4yjmMSDORafPDOTabi0LBE=;
 b=FQ9I92zZE+QNa3zgLYC5SqqUfg0q+c0v7+m5NdV/0whKm5P66AZqrWJvw9kjs01uFquYedzHzJuStS2GDpgN0weywK0u26kMK8TRhqG2QdQ7eqbdBcobHnUJqkjd8R/ZqoDTfphei0A2VN35wFWDJ0C1ivp+xk/Vm9XZ+XRrkSpKVvGmAZSLMTa1YrfWhQOznKTy/Lt2hRXlGX/s2+Syu7C8B9ZB5bA1DsjZ3HbKpN9H8iPfhn6xgTo2WaGo/xUxUjtDQ/sC96suBL1WumVkzvBNWQTIn5E9UXIaL+Ma9lgtalouiE8MILJI10CYQtd47z6ykw4Z6AyFXH5R5dldIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Ik+OK9F+YqOzPpYHEKto4yjmMSDORafPDOTabi0LBE=;
 b=t9ykuO0cNa5ZtFfXc1/WJeorLSR8D66cI0cOR0LfmE6BAAH6inxZ5uQ5pgLx60gQ+T0Sx8H5kk97Ux3Dj5FMlAMHdhit9M/+QhCSu309sr+ykzv5CEJCJH67+mvGtLZzSx8O4XRA2/IRtYtWvPCTlLdcdDdLc/GuUW91mMImiAg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Artem Mygaiev <artem_mygaiev@epam.com>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH] xen/arm: Track coverage gap due to architecture limitations
Date: Wed, 9 Jul 2025 14:12:57 +0100
Message-ID: <20250709131257.1655509-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|SJ1PR12MB6194:EE_
X-MS-Office365-Filtering-Correlation-Id: 52649092-5881-488e-b1ec-08ddbeea54d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iIA+DLLtHkXHSsH7y+nnhsnXrsy4/W54YuC3LMsK71GYECTU96NgVkoLZoZ2?=
 =?us-ascii?Q?gusbu+3+wwRsajat3WK5XIbJAv38lbahApME4xMsRxDJDx3x5eYDAI6HJa5C?=
 =?us-ascii?Q?D4/LxyXdAlhhmRqnfjt9ksmqKcL4YOyQhkca+pKw2FYiewHBfOGkCdPtT40E?=
 =?us-ascii?Q?+FzdRSZpQtmB5yD3o0UzbYleV+Ogtjj3z2xm/TlKPRFbLOPDoK+VPtPV87rl?=
 =?us-ascii?Q?ZLWgaKNkAFGjyrDsngc6UFvnLTETF5RsbrV95r8CScNFUoyTX5GX5IMAARMX?=
 =?us-ascii?Q?3AT2rYB934h3ML1qBfDl0ecTHIO9FSCf4C72l3oDc772yRPbg2izngdR6y/s?=
 =?us-ascii?Q?cWVc/1HQlCZIf4+09INEAbqUiBWV0jDRbBfM533Zup9MrezUh9VpfQEq420F?=
 =?us-ascii?Q?cddGeScgiFqgyWgz9uLCqkl4yVuIU+5Uk+CmSIcM2QppYGNlMS5846yyFppM?=
 =?us-ascii?Q?MPmwDC50GsFAahJL3aFbaDk7WyOlonH4WSmwNWH7GEGhp9gPPbAussxOBmDa?=
 =?us-ascii?Q?sfbuxhARvJzGZ1k1SYO1KZRZefSfRvlnryNvlH3UMyS8aOLLfnsZNC8/jl2r?=
 =?us-ascii?Q?PQKZADZyu+tzXjkvOWSIznFu8uvvvH/2pYBeZ0HB9T5cso2I2tee/MeSg3yN?=
 =?us-ascii?Q?k2n3QXVyQjt1dHbwmuEPMJ2xEoNr6kpSoc8rzWkqMJMNxJErM8RdYZVrxkSk?=
 =?us-ascii?Q?qd05haUB+OE3PBhMRGHCmyXMTCGmKPN42PHsykeOrFXA6rw7Tge4JQmWC02i?=
 =?us-ascii?Q?3Dzr2mR7zu5mKT14v6xGExMQSa7o6XhJb6hzHag9Za6xT7z1BeBeLjAmJ1Un?=
 =?us-ascii?Q?P8Za3JgsDXFokdeR6pVICwGkWvtXrWVGPIQYCG9xC/B9c3P7MN5J98VOWzOc?=
 =?us-ascii?Q?YnthqHDPOg0SriHuuWHdNpfsqwsZM7TtaQaLHXIPrdHBbCTIzxfB4xB+gMUj?=
 =?us-ascii?Q?9KxKAXIFXpC3ZLu6wTOuqiKKVVU5cMdVlOrrsuNb6m4Zfsn5TNn6g0KUR4pH?=
 =?us-ascii?Q?4NFcyQnTmojV4C/Vqqi70czYyn67By2slwY+brn90SEP950ipNJl921FtHXN?=
 =?us-ascii?Q?UINMzdp0ARPzhn2ufzzePuPb1HtlL6eVrE9mBjrU3MUapv9aq8D0fz+v7Qw5?=
 =?us-ascii?Q?YIqMgAh7S2IgoubKuhQq/YfvbYOEJ1KdxxqwBouk7WhTc2rTGgUk8Fwc6KiN?=
 =?us-ascii?Q?L9FfRME8wBbMTe8R0kHFiqLU06ssCdhKG+/Pj53B9RhQia97aVeGV1TDsjSA?=
 =?us-ascii?Q?9JLKHG7TRwJc6/qA/bXYiK/o0YEkO0zSzPHVO/7R3AHxYNjblVUq8nIXFnzn?=
 =?us-ascii?Q?uavAEAI2W8hrYhvrA6/Jalm9fVRKFANU/S1Iyzg0JnGrApXDLeaXPn/xWvOc?=
 =?us-ascii?Q?TCOLFwzDEe0F8AMUsJxLoZ/8dAk4tfWIqtMFqH5dYqHzwopGddy4b5saNuL9?=
 =?us-ascii?Q?yW4NuL3JEcoXhgioF6uZHhH/ZtDof2luW5ZaVdMxGkFlhGBIXCb7LJ7eL9Gc?=
 =?us-ascii?Q?+Qak4s2DrvGvhIllPGfSojiGBxqmgLjp5frA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 13:13:01.0876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52649092-5881-488e-b1ec-08ddbeea54d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6194

There are a number of places where Xen triggers a BUG() due to 'impossible'
conditions. One of these impossible condition is when gicv3_info.nr_lrs is
equal to 0 or greater than 16.

Add a OFT marker in the code and link it to document explaining why this
condition is impossible to be covered while running Xen on a platform. As a
consequence, explain the architectural limitation that Xen relies on.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
While running Xen with coverage, there will be some parts of code which cannot
be covered as long as we run Xen on a supported platform. If we have link the
code with the specific explanation, this will provide some context for the
missing coverage. Also if the relevant part of the code is ever modified, the
dev can update the explanation.

 docs/fusa/coverage_gaps.rst | 17 +++++++++++++++++
 xen/arch/arm/gic-v3.c       |  4 ++++
 2 files changed, 21 insertions(+)
 create mode 100644 docs/fusa/coverage_gaps.rst

diff --git a/docs/fusa/coverage_gaps.rst b/docs/fusa/coverage_gaps.rst
new file mode 100644
index 0000000000..3cb877a8ee
--- /dev/null
+++ b/docs/fusa/coverage_gaps.rst
@@ -0,0 +1,17 @@
+
+Coverage gap
+============
+
+No support for zero or greater than 16 LRs
+------------------------------------------
+
+`CovGapExp~unexp_err~1`
+
+Description:
+gicv3_info.nr_lrs is populated by reading ICH_VTR_EL2.ListRegs. The supported
+number of list resgister is 1 - 16. Thus, any value outside of the range is
+currently unsupported by Xen.
+
+Needs:
+ - CovGap
+
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index cd3e1acf79..eca4d76f5a 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -109,6 +109,7 @@ static inline void gicv3_save_lrs(struct vcpu *v)
     case 1:
          v->arch.gic.v3.lr[0] = READ_SYSREG_LR(0);
          break;
+    /* [CovGap~~1->CovGapExp~unexp_err~1] */
     default:
          BUG();
     }
@@ -171,6 +172,7 @@ static inline void gicv3_restore_lrs(const struct vcpu *v)
     case 1:
         WRITE_SYSREG_LR(v->arch.gic.v3.lr[0], 0);
         break;
+    /* [CovGap~~1->CovGapExp~unexp_err~1] */
     default:
          BUG();
     }
@@ -196,6 +198,7 @@ static uint64_t gicv3_ich_read_lr(int lr)
     case 13: return READ_SYSREG_LR(13);
     case 14: return READ_SYSREG_LR(14);
     case 15: return READ_SYSREG_LR(15);
+    /* [CovGap~~1->CovGapExp~unexp_err~1] */
     default:
         BUG();
     }
@@ -253,6 +256,7 @@ static void gicv3_ich_write_lr(int lr, uint64_t val)
     case 15:
         WRITE_SYSREG_LR(val, 15);
         break;
+    /* [CovGap~~1->CovGapExp~unexp_err~1] */
     default:
         return;
     }
-- 
2.25.1



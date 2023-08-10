Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F72D7776E4
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 13:26:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582070.911636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU3ny-0007Mi-AV; Thu, 10 Aug 2023 11:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582070.911636; Thu, 10 Aug 2023 11:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU3ny-0007KR-6J; Thu, 10 Aug 2023 11:26:14 +0000
Received: by outflank-mailman (input) for mailman id 582070;
 Thu, 10 Aug 2023 11:26:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8LQy=D3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qU3nx-0007KG-34
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 11:26:13 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e88::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b50cd0c8-3770-11ee-b283-6b7b168915f2;
 Thu, 10 Aug 2023 13:26:11 +0200 (CEST)
Received: from CY8PR19CA0046.namprd19.prod.outlook.com (2603:10b6:930:6::10)
 by PH7PR12MB5877.namprd12.prod.outlook.com (2603:10b6:510:1d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 11:26:05 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:930:6:cafe::29) by CY8PR19CA0046.outlook.office365.com
 (2603:10b6:930:6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30 via Frontend
 Transport; Thu, 10 Aug 2023 11:26:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.147) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Thu, 10 Aug 2023 11:26:04 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 06:26:03 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 06:26:03 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Thu, 10 Aug 2023 06:26:02 -0500
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
X-Inumbo-ID: b50cd0c8-3770-11ee-b283-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J16ttXIWv6tekdYUf+IHpfMOtHcYf6N4i8Pc/0loM4yV17fYzn2J9Zk+Fd79Q/+FkP+HT4HnkgOqn1pV9lSReRNkFmKHiCL3n9DXSq5BBGM07XxMGwDQbVI1NKa68hLXNpOfbPSToY5OrM8rGoE1wKXGHAQ4gCythwntaXc6kBrAJtkFW3K43s8eaFqvE1Dy6KM+ZrYoj9v6XtSKyNqft6SpwKCYtIXQcJARJ0xW+xDXZYb/KyMFACTAGABCY+qF96bSw2kEjjFaJce+XtGT2Yv4LU1Og6yvRH0+Qzi7CTDX6UlS4Jpy7pl8O8hrw0YRUkDhffXhcGxxZcvrR92U0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIq6mkZCycPFXQBXidjf4QJt8gnrX6XXIW7vDCATUws=;
 b=jvG3vT4nAUMCQJMRzhb7UH9xWCbN/GQ11zzG3Ca9Bm9oZlwhZ1zAAXlEApD41qbWSSkxle4s2vJWeyx17683y3S75EBVwXM8YLrlxGHvYNPfRKGyUMyWAjq+W9i9HsLIDcMTuFlFwM22nCX8+MTdTrjB/mm/9wmZVK794F1KuTDMODBYob+TbrVf3E2RZb/mmhL/epraMfScFTvrRD66AlrKB9iG0HVFatNxjKAw7kLsOYLimrYxFFi5WSjxs37/krlq6ZWw9No++F7cpImyQRc6zznrbIRwYvM9tGAyNPBFx3NgnUErqkGFs7wxy0ixX0S5P+RFz1NeJkzbKmMHxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIq6mkZCycPFXQBXidjf4QJt8gnrX6XXIW7vDCATUws=;
 b=LHo0Qd84wp28X4W9Qsfr5qVIC8IHf2hhk+7cqCnvAw+AGUKfhzfoWcEdUbqLIpwAqJXPeiF1p682iv59XmxGO1lXxgf3wVXn0d3rQpJQ340YvShoCGr+nYm+CAKGiLCjh0cM0K8FQnBNQcox5BOHRBZqLsR8esrlTp+MUn69ai4=
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
Subject: [PATCH 2/2] xen/arm: Skip inclusion of domU nodes into hwdom dt /chosen node
Date: Thu, 10 Aug 2023 13:25:44 +0200
Message-ID: <20230810112544.17365-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230810112544.17365-1-michal.orzel@amd.com>
References: <20230810112544.17365-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|PH7PR12MB5877:EE_
X-MS-Office365-Filtering-Correlation-Id: 0210e78c-724e-4be6-b7da-08db9994956a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gMqXbG59qU/5PTE+3hUsiZLNAf17sIcb6tv7bc/9QhEBdxmj1Fqttuumxf2A0hrFKSoRFJyYxMRDpS1mxr3rc2ezNElT46bWLJzaLZNBXGYNtxywqlwsgryxo40gNXy7xWmmotheu0SgeWt9at3Ws+F1WMAPqo3CdYzWl90VC+kbGKk0U7d7wdTijFdLcxNLNP+pXc8F1EjOC4IHdgUMWlJH6Qbvj89QK1wWFZXXsnKtkeVvK7QSkP5c6zmWsQXnA7Mh9GoOas9dF5ZAhNFxgjVSL45jSoILfObKQA0YwZxsz5J61mSCgKZUZ3klS8DkUrl9fxJzgivHEpDSIiJOcLRgPnOFCsGeYDDIhaNGK99C3d4MJVBM8j1GRSsytYBedB4kly5PtAga0es4Ip4MNRPUaAvb2dAGw635h6ULEmpULxOhR3vcJJDUTTCRX3CZEIIT1i8zFaxM3Clv92DngQXlg6XA+gzeW0l1f2VflXe7dEAEIl8l/grJY+EmD48loVy4b3hePvYSbTy4dsu3PGl8QAxHwFRLLJWVVKhpo7lxcVj+fvFkrHpQj/sFSq5wtqyO5zHRtUdJlXgoGI25J8LqTgkRVVQP/KnP4tLhe3gHbSP/zBzMi4DHhapgrvMpjqcd5xpTkCW6xka4XPoj6aQRfR1kEaarSRsL/ANn+OK5Xj7H+eUVqYs2khptJLu7CzQE6JAOtFzlFI57MRJz9pUp12iookGU8wzyTCNs61vIK9I3QYBySGnBmMz4cdRNomsaa8bVY4wk6HdGMneJLw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(396003)(1800799006)(186006)(451199021)(82310400008)(46966006)(40470700004)(36840700001)(40460700003)(40480700001)(70206006)(6916009)(70586007)(336012)(1076003)(26005)(478600001)(6666004)(54906003)(36756003)(47076005)(426003)(36860700001)(2616005)(41300700001)(44832011)(316002)(4326008)(2906002)(86362001)(356005)(81166007)(8936002)(5660300002)(82740400003)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 11:26:04.2971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0210e78c-724e-4be6-b7da-08db9994956a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5877

Configuration for dom0less domUs is stored under /chosen/<domu> nodes
present in the host device tree provided to Xen. All the properties and
sub nodes there are meant only for Xen. However, at the moment we still
copy them (except for modules that we skip) into hardware domain /chosen
node. Fix it by adding "xen,domain" compatible into the list of nodes to
skip in handle_node().

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/domain_build.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index c6881de8bd85..54bf5623c889 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2592,6 +2592,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
 {
     static const struct dt_device_match skip_matches[] __initconst =
     {
+        DT_MATCH_COMPATIBLE("xen,domain"),
         DT_MATCH_COMPATIBLE("xen,xen"),
         DT_MATCH_COMPATIBLE("xen,multiboot-module"),
         DT_MATCH_COMPATIBLE("multiboot,module"),
-- 
2.25.1



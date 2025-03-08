Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54258A576AD
	for <lists+xen-devel@lfdr.de>; Sat,  8 Mar 2025 01:16:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905464.1313288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqhre-00021t-ES; Sat, 08 Mar 2025 00:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905464.1313288; Sat, 08 Mar 2025 00:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqhre-0001yp-9f; Sat, 08 Mar 2025 00:16:26 +0000
Received: by outflank-mailman (input) for mailman id 905464;
 Sat, 08 Mar 2025 00:16:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIyW=V3=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqhrc-0001rU-R1
 for xen-devel@lists.xenproject.org; Sat, 08 Mar 2025 00:16:24 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20623.outbound.protection.outlook.com
 [2a01:111:f403:2412::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e66e51e-fbb2-11ef-9898-31a8f345e629;
 Sat, 08 Mar 2025 01:16:20 +0100 (CET)
Received: from PH7PR10CA0001.namprd10.prod.outlook.com (2603:10b6:510:23d::23)
 by SA1PR12MB6894.namprd12.prod.outlook.com (2603:10b6:806:24d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Sat, 8 Mar
 2025 00:16:14 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:510:23d:cafe::25) by PH7PR10CA0001.outlook.office365.com
 (2603:10b6:510:23d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Sat,
 8 Mar 2025 00:16:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8558.0 via Frontend Transport; Sat, 8 Mar 2025 00:16:13 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Mar
 2025 18:16:12 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Mar
 2025 18:16:12 -0600
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 7 Mar 2025 18:16:11 -0600
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
X-Inumbo-ID: 8e66e51e-fbb2-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/nW+jAmZRSb4D51rOTPYBhvhe5Kn7GTCQ91LW3ut6zR97Sz8kZ84bHMRPNNFimE4OBO+t2QXlAc14yBdYCVkIJq1nkeAmeUDNigO8drjtsoBJVj45DuVwLwDqtaEOFrg0SSKAHCK4lNY2AFZM63rvH9gvjI3HTb5QPbm5LjsbboFWCPmiUUZIBXAsS2wLvBkH4jXDHU0EGDzdw/Lh6Lgeazo8KJ9CCKkBR87PRX1ERSVBcckY1U7+V56g/gcyiLZCg+KS5e4NpXEF6328go73jbGNtPNQVKeqx/aVjp558I0LxOiEI6N9gBkNYHoOt+8Ks4ZE6gl9CyEoAIAArxnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVbyUMe/ZD9zRIAvR8guy+m7+oje+qEheIUUpEhekXU=;
 b=jMWJtFGuYZYr/9wKulocGB3AcWipRUj977Kd3+1bBRElX6PkimilCus9J5IgoSPjpPGtx4f+9kSjD0A9GSijNMwO5PQ18ENr9hHyDco61d0KPZJTAGCmADDkHd1fbIDLdiQmasFJ6yLopa5oyymCIgjUc3jvP17/+waqp9Qo4kWaqUzJNZpg874z3KnoRAI2DMEAR44n9bh9nN/91PWUVZ2pA/onudioQiyagY0HOY9YXL00SbwLqgTBg7Vjf2fQcAo9XRUWOjx8ym3NQ8pj0Q/YDO3f2teAN83fzNChvjQVhRUpbyQYGEu0FtYUAb1/bckWWrpm1HpxzopEV99SWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVbyUMe/ZD9zRIAvR8guy+m7+oje+qEheIUUpEhekXU=;
 b=h0bpCtIoDa6SZb/lg09EJvIrDrxI0hNm4lK/VE2nZywV4A0I5qzelOCClyfCxuyA1OOv2aDj7ddqDsQ4+Hv6QO+103uH3t9lBDGJi+RjAa7G9/kC3nvU5OB6iLqE9TymaIpayY0ykwaUMZxPpOHXBO9yhBGB2FiJ+Nla1Rsczlw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Anthony PERARD <anthony.perard@vates.tech>, "Juergen
 Gross" <jgross@suse.com>
Subject: [PATCH v2 0/2] tools: Fix PVH dom0 passthrough with legacy irq
Date: Fri, 7 Mar 2025 19:17:09 -0500
Message-ID: <20250308001711.18746-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|SA1PR12MB6894:EE_
X-MS-Office365-Filtering-Correlation-Id: d9b8df83-8ae7-41a2-eb55-08dd5dd66f8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FuB2sQHpqfGzZ0dJl8zDEJj8VWxQ2TdgCvkaxVcpXv0veOCcuTiEiFjO9kV4?=
 =?us-ascii?Q?BtY7Aw7jqsoxNZCmgSnO3EfuQ+/HAWHR69jJ/Sl6hZQCVbzKHEEanKpTEjhK?=
 =?us-ascii?Q?5qZhadusR8Br511jX8c49+olniY1QV0alY3NF0K4IFAubv8k0hIU8CoO44dl?=
 =?us-ascii?Q?rOf6TRhpk9qQSP2zSq1uUY0oGg8jWghvQVe1Q7iGm/SaFl7FPXtMlb5fcm8d?=
 =?us-ascii?Q?1OIEqckB79dSsp1XXWJWYQtfBeWFzXvW7ePYYFRwuBgNrU59P37auNZakGhS?=
 =?us-ascii?Q?3UQ0k5DM7DTnG7LrA0FLVdQIW5tQRDbaM9z9JzyWm+/l42DNF9e+x6sWX4sd?=
 =?us-ascii?Q?G7X9DbzzVp7xsXJeFwp12FBFjLWUUkPUdOd1s7DvrP4mpb9OuvLHwH5ZfAiq?=
 =?us-ascii?Q?+yiGmvrXErnt+HGthU8ca/gmLQqqzz1G2B5Wbepm1hvcwKepAgniNoPO2EFT?=
 =?us-ascii?Q?HTPO9jSb0jLdmmz2CkDXgLuyEV+RaL0jm4nbIKjT11z9KX2oHQCr1Dg7vzbI?=
 =?us-ascii?Q?LYoUEGe0eFzJ0U2O8wZ623v1hCQxFSzZVHak2TnadHcGh46TldBvjrcm4Bd0?=
 =?us-ascii?Q?PJmMrWKEPPMh1LerSGgATW9d5mGMowc7ELiTFP7YgTtXjM3PlwYk8TivlRsj?=
 =?us-ascii?Q?Gtusv7edTYx7TZIfA62wWbo2WafTEEV8C4NA42+6JTaPhOsNOw+dp4b7+Xht?=
 =?us-ascii?Q?WyZiO18Gft+sUrQgOOPghCS3+JjX1MCD1JKMvSWuV0EGbQHm7Hi2X3bTA1pS?=
 =?us-ascii?Q?9IpnLRuGPqK3hqWnHVG+/UgX9O0iwyVNzQODjYwB8dxVMoiGNmUj4FBXxaK9?=
 =?us-ascii?Q?aZP7GIknSd9gHkmbyWLML5jVJeCZDWkEgj3pJNUbid61ROiY4bSQ2FBaoM9T?=
 =?us-ascii?Q?FYk4ZrUKUOYwNP5rhksNtGuCmT3/63vA3L52xYEnCh+XIiQgoMg2E3YnDO9o?=
 =?us-ascii?Q?8s89zP/8/H/ygR+sfY0MUwBO39QLgiA+g5/0l3efxe0xGzLiYpEVozl1NIpj?=
 =?us-ascii?Q?321CNykPAbVQ4uBG1D6QMnQWotBbJM0yBZ4mPhZPWqZoBMCVK5an25fZ9xRO?=
 =?us-ascii?Q?GmIhVPF9Xmvb7uuoBRrYzKmjD1YYEvTy8KuZf/rwON/CgpvTTVT6D82X935W?=
 =?us-ascii?Q?pN9y+WWkH7AF/NNVvm4h3IEvSM1Kntf38mh83+05WxryN8iBnMzh3c6T/Hgi?=
 =?us-ascii?Q?b4ceO7+9Tgm094RYcB7xlYfMN5BqmIB7dmwpC+vyPS9fgZDRkyVL5h1bHaaQ?=
 =?us-ascii?Q?T6xCIGlfIF4Uc0TdRIePNe+uONwq5cxKr0YRImA4QGvNpnhhTcqMmcX1vLkn?=
 =?us-ascii?Q?1eE4j07RG+XTj4oZlNrO+oR58nnUud5bJt94rNGuzgIyAADntbweJMvepFQi?=
 =?us-ascii?Q?bAonqyBSZ78eMfOg2xe1t6MTeCdDzuB8LP+ugYI4MHBvSNwV1Qw9oS2k8UYw?=
 =?us-ascii?Q?zraz6f529JPgDyOAt2YfyzVFR84o2uXu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2025 00:16:13.1003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b8df83-8ae7-41a2-eb55-08dd5dd66f8f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6894

A PCI device may not have a legacy IRQ assigned.  This series allows
passthrough of such a device to a guest.

It relies on a Linux change to xen-pciback to also handle missing legacy
IRQs:
https://lore.kernel.org/xen-devel/20250226200134.29759-1-jason.andryuk@amd.com/T/#u

Jason Andryuk (2):
  tools/ctrl: Silence missing GSI in xc_pcidev_get_gsi()
  tools/libxl: Skip missing PCI GSIs

 tools/libs/ctrl/xc_linux.c   | 11 ++++++++---
 tools/libs/light/libxl_x86.c | 10 ++++++++--
 2 files changed, 16 insertions(+), 5 deletions(-)

-- 
2.34.1



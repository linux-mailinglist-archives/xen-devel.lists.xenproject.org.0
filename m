Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF7B9A2AA0
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:19:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820979.1234744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U9Y-0007j0-6a; Thu, 17 Oct 2024 17:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820979.1234744; Thu, 17 Oct 2024 17:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U9Y-0007hc-0O; Thu, 17 Oct 2024 17:19:12 +0000
Received: by outflank-mailman (input) for mailman id 820979;
 Thu, 17 Oct 2024 17:19:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c7jd=RN=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1t1U9W-0007JO-0e
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:19:10 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20605.outbound.protection.outlook.com
 [2a01:111:f403:2405::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e56ee804-8cab-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:19:00 +0200 (CEST)
Received: from CH2PR11CA0029.namprd11.prod.outlook.com (2603:10b6:610:54::39)
 by SN7PR12MB7250.namprd12.prod.outlook.com (2603:10b6:806:2aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Thu, 17 Oct
 2024 17:18:56 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::e4) by CH2PR11CA0029.outlook.office365.com
 (2603:10b6:610:54::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18 via Frontend
 Transport; Thu, 17 Oct 2024 17:18:56 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Thu, 17 Oct 2024 17:18:55 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 12:18:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 12:18:55 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Oct 2024 12:18:54 -0500
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
X-Inumbo-ID: e56ee804-8cab-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOaNYAC85CZvKTSZKIC8qNuNMfIObJMdmZXD4ODwyHXRpnurc0evhIDwCP9nXV8SzWFfa51P10bOE05r7oQmlCZsZViHj8fm9eVEMty1oYwE2CfH2vKGb8YJ9tJNfMulX5R1DPKiJD7l5wXr3XoDGgtpDqNrFYQkoKURPfRLruFBVb32M/7JqNrjpr2eCLP1XMh3r5RVZOtO45mSIwQrZgyz74Nw+mJB2j05h1wrzO/NyoAjwhS8Pbw1ZrUdh3HY645DNW/5/STo/aUoV/78RGEplNZ6mmoYnuc9gNvIgYjqQ5cJXC3we5JtMNxkYjMsnhikFemS6uvEqCYgJJFVgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNZ4IhvfY96hseFUkdXAkYxaQJura+eXssH8aXv6I8Y=;
 b=heuCO6PEY+FUe3TwrQCVB+c4PEuRd8lD1srOIijSuSg/8f0iLXi8Z7iDOyskMsDH5R3s9DNguGkETZDnpGmcI1c9CDUPa2vFZC4Qfp3xC8K3UaRbIfSO8Z2CTW5k0TVxwNxbhWtq9uQ2N4tOmIEVniAgRClZ7DylsdU7bQE4O67l+3zRebdW/DF5nAPSUgDMDYXRP4xtqXhGCV5l0+Dde3H61lIEt0pFi/6zuoSqQd5cUJeW9uop7nwY0V4dnrdgqk9mYbQvfw6E7RqNii/QazUFTOUEuiwMqgwzB11iA1GGfMdNfByvDWRKHsFoGDlP8Vh001plow/2hglnGc1jEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNZ4IhvfY96hseFUkdXAkYxaQJura+eXssH8aXv6I8Y=;
 b=mUCpNrIsG+HQGI0h73KBuDK8S+gzaN1Vf/a4CXgpmHKLn3VkN77xkDw1bzCOFuxeNT/ppqKD3TAplZZS/DV1tedpW3iN1MWAHpzohDAV0FeGIXi8T06bvnh0UYGIlKskQRD07H0Ae8EWbiaZCm/PddPBuzruRgOlEw4qksMgLZI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 0/3] automation: add x86_64 test (linux argo)
Date: Thu, 17 Oct 2024 10:18:25 -0700
Message-ID: <cover.1729183051.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|SN7PR12MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: 57a73a92-bec0-4d24-62db-08dceecfc7ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?99dnqk8PC3cQtIIu3AxKFRHhBZb2hfJSlVxeEsdQis/sCKHD6iFerVnGRRdz?=
 =?us-ascii?Q?ZBR7rUzfDCxu7EGiw7j7iXvq5VZpvTW+YWk6PoYMREYWg1Yv7iN5Ij+EL0Tm?=
 =?us-ascii?Q?DeAaN/FEZQHKkgth2n5A/DRNp5kEVEvvXjTEu8ibYceMmgJYoWsSVS2XJ8dP?=
 =?us-ascii?Q?jCPWl4f5yESY3BeWi4p/Is6hhIQhHOL3BYuZ6ujXM7eU7s1AYP8ru/UUYy2f?=
 =?us-ascii?Q?nYdM9wssSb4xjWkmQjsbH9V20SeIxnJgILHMCYSN4QCxPLf5HJoAeen4trdw?=
 =?us-ascii?Q?Q/T8rkirZjWbIXukiiw9bylKyL4Ys+H1WHWdKzvrclSyyrkdJLTNebul7kIg?=
 =?us-ascii?Q?EUFQPhgMT0dRvW41I8aJrZGYkWjNPZiYqNWieZ3LoA1RRjlHiAhClez1Kgc1?=
 =?us-ascii?Q?9i7Szy1p9EO+TCLs0wdeewjpgZy1Ng6djoK0S428pkKZPL0l2+4a1gGSNNV4?=
 =?us-ascii?Q?vgOEORJ0j0zES0rwUCmEvTR23s92vtEp9XWz2iz5GFnkniHB+JlbOgQVs1jl?=
 =?us-ascii?Q?Di3nVMeMAd95u47BLZcl9HxTclDJPgaCmPFVjRDwtpXl+/Vy9glk/S0xma7w?=
 =?us-ascii?Q?n3sl/aWiBCfEKrkEDJvsWyapyDaiL+ebhsMmLMhFxIjOS1Qdb7DCriwBvuqY?=
 =?us-ascii?Q?FPS3P4BPfHfB/niPe3Rno0NDgomYJniPpN8LfHRsP+rANsUHkju5UuPMqHFj?=
 =?us-ascii?Q?E21jesmojI6vAke4MLbIB1mFNjmFB3CcH70mIX/GHCHvFZdYeUXDSthejBxi?=
 =?us-ascii?Q?tA6Bys21J2b2SxFh68721m83n6plZBwn8teBFWRSWRr3rktY4/78N/uLeuPb?=
 =?us-ascii?Q?/PjogRremM7hCe8BsWmOZ6ogbszFoT/yILrEToJQXXIf59BBAaRgsMQBar7D?=
 =?us-ascii?Q?RBOsxRyKGirNSkeeayoF2KZIYLQZtPCw5Vx/Mx3pHWfjIxK71X7YUxcqq84n?=
 =?us-ascii?Q?U6DEoILlp6VwsfsFW3+wR/4nmmC9OzyD63333f20aG5Fl11JuchQ7paKFQD6?=
 =?us-ascii?Q?LwnOomQfVhU/7wBQeW/qVY2aFHRuJYef5G+MSw4R4j9yzHzAJ8+bjfG3V4Ki?=
 =?us-ascii?Q?p4pQ5p6plbaR8fOJUrByQrjiNp4a9B04twAKNex2+zeE70MhyrXGfBvcTNZ7?=
 =?us-ascii?Q?ByLHSTyE+6Pue0Z+b1hCy1gtCiDc5YtJ2IOXtVVuLJIlQKTtg7uSG69Tp/yF?=
 =?us-ascii?Q?i1rb6Dmehgss64vGTJi/lMdoOYcWjebcSlN65DqopKK3Oc7W/FkozDZdJzu8?=
 =?us-ascii?Q?jvsg8C3OfI9iwVGZQI5g9f+dBtEx5HmvhB+pFIV2DHdxoBFoGm+hrFJBXWgi?=
 =?us-ascii?Q?6bNIxUdr4of492HHTkOp2so7pUn6re/YN+3yqinP0/8neVWWIeOA3iJlN/rE?=
 =?us-ascii?Q?LQWcf6++g3a3qPvp6NLQGEDNcWcn+4hihfPAlfkJ8HEtYkBCZw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 17:18:55.8760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a73a92-bec0-4d24-62db-08dceecfc7ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7250

From: Victor Lira <victorm.lira@amd.com>

Add x86_64 hardware test that creates a Xen Argo communication
connection between two PVH domains.

To accomplish this, add new build artifacts for Linux and Argo, and
update the xilinx x86_64 test script.

Victor Lira (3):
  automation: add linux 6.6.56 artifact
  automation: add linux argo test artifacts
  automation: add x86_64 test (linux argo)

 automation/gitlab-ci/build.yaml               | 34 +++++++
 automation/gitlab-ci/test.yaml                | 10 ++
 .../scripts/xilinx-smoke-dom0-x86_64.sh       | 76 ++++++++++-----
 .../tests-artifacts/argo/6.6.56.dockerfile    | 95 +++++++++++++++++++
 .../tests-artifacts/kernel/6.6.56.dockerfile  | 54 +++++++++++
 5 files changed, 244 insertions(+), 25 deletions(-)
 create mode 100644 automation/tests-artifacts/argo/6.6.56.dockerfile
 create mode 100644 automation/tests-artifacts/kernel/6.6.56.dockerfile

--
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37808965300
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 00:35:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786135.1195671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjnjA-0002qM-8c; Thu, 29 Aug 2024 22:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786135.1195671; Thu, 29 Aug 2024 22:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjnjA-0002of-4W; Thu, 29 Aug 2024 22:34:52 +0000
Received: by outflank-mailman (input) for mailman id 786135;
 Thu, 29 Aug 2024 22:34:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N580=P4=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1sjnj8-0002oZ-R9
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 22:34:50 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2415::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e51bcc9d-6656-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 00:34:48 +0200 (CEST)
Received: from SN6PR01CA0027.prod.exchangelabs.com (2603:10b6:805:b6::40) by
 CY5PR12MB6180.namprd12.prod.outlook.com (2603:10b6:930:23::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.20; Thu, 29 Aug 2024 22:34:41 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:805:b6:cafe::78) by SN6PR01CA0027.outlook.office365.com
 (2603:10b6:805:b6::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28 via Frontend
 Transport; Thu, 29 Aug 2024 22:34:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 22:34:41 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 17:34:40 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 17:34:40 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Thu, 29 Aug 2024 17:34:39 -0500
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
X-Inumbo-ID: e51bcc9d-6656-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eaBG48U/yxhSRdfCZ1iPzGpypHbpdDKS/kNYpIexrIr7OMvzHe9zG6nl8DHJEJxttwl0wEIc1x78tkPrr3lpoZ8FR3tMlYlKdCwd+s7LQPRVOf6OgmfMjJE3neQPhFUIcTohWukl7Tv4FhetrU4invjO7h2xAZnZL2XWXq2DNEcSHPd3lcfyvYp+p6ly5HRZtSJWQoyq55dANqHX4m/iQnV8WXvqga2kz4nmLJuaapLD15gAj58e6HtsEn74buZ/MW6IV2ZLiv/3DsRgQ40ukspf5TZsg6zzNA8pNR4RIP+0drTCyIvA/fuKST2aDzdDXzeJX4w5KTBW+2thJQS8yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Bg6jyvZrN9UIpYXhrdKMxapnXYnZfNOq+H1L5YAZps=;
 b=rpYDSnO7z/eEyRTRkQGIZ6lwpQZsAclFdJxe7iWobIorulSzl9zvDUic5dTHx8jwTmSf8ObxM567kXZZNjAIimFQ29uHK0jKfsDsrS5aaBC9y2xcgkso8co8K7H6dZlAr5BlA4zPHLIGcvZirmGb6hZmmSi5Dl0H+SZ9XxIH34UEbGHnuTGJT+KYpxTZZ2wnwvi49pIOfCNn7ue8ZpJy8YI8GC+dOaCptRdYB36WyxXGtHqP47oidOusSI3jPAMyO//2lu0bhX5msgumcyGGKM6PBHDgInI70z98NLbWtOtOEejM7EArXz6tP6ijH9SsHrak8ImIlh77C9icnOkNNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Bg6jyvZrN9UIpYXhrdKMxapnXYnZfNOq+H1L5YAZps=;
 b=3CVmPXrs6u7iG9xDeZGMDnEfkSciR/wQ6byKq4leSejeaICSlLJIpR175vvawuZUA6LTO6TytabUO+Li0xDL711e9tPKlbj+O+8Bzf5z7QE+7rqtMK5oQcYuHd/ggfe0uZ3RKGrreHPw+aaV3D1A1ys9ICNHPYcPQ/yHJ1N01G8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>
Subject: [XEN PATCH v2 0/2] automation: test script fixes (pipefail)
Date: Thu, 29 Aug 2024 15:34:21 -0700
Message-ID: <cover.1724967614.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|CY5PR12MB6180:EE_
X-MS-Office365-Filtering-Correlation-Id: 07293d21-fd24-451b-433f-08dcc87ac60b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wykpv8E7oiW6GYBaond6K63pKJzvQK53NFsRrMDY35OmOLKbZQEvINXt/Ef2?=
 =?us-ascii?Q?q32b806fyZQKyoSuB1lPr3jmqGudu9ZLYQMdTIHSRO5Z97CenIQqmArZsbgS?=
 =?us-ascii?Q?7nj2XrpuJ5HArJX1gf0xBye4UmBH2Fyz7V1oQewQeY8U9mOrcJigpmQJjNQ/?=
 =?us-ascii?Q?yJLK3npLenLH6Ce1c1bxQAb+7OvTM3aj16fQT5xWsJGbaEzQovF6uCPBpQfD?=
 =?us-ascii?Q?FpHjdp1g/ineo+r/BJMVZy/EhqJvqBmnkJauKur56EiOz0LD7XbaK3jOrLkh?=
 =?us-ascii?Q?jEic8V5aWc4qAy1/WjlRJ/fuqebtXWHpn3KN7wKbrV2eBsX5J+CrwhpqwRcV?=
 =?us-ascii?Q?wIRHHVJLqsS+GOhNKCFn54c8wQBKkVKM1EdgMJHmAUV71tNQGm0in7YDTbSL?=
 =?us-ascii?Q?tjL4kPOtjO91r7fY100f01XXxJDhKSYf3tNEFeAkKR7fhxQEkaYje8GTcsC6?=
 =?us-ascii?Q?ZMcUnR1rOOYATJ61ffNnEH6FY2akBRQ8ClRFIlW2glefJL/aTQaSuV7znndI?=
 =?us-ascii?Q?hdRMmpyIlprqQSuP8mMcjYgGp1UuSNNz/xcJdOfvXh3JwZjX/6ButENWvtK0?=
 =?us-ascii?Q?+OnNlZkqNQ3WB+JEyRQJI20sR4W41Jz66oF5Kt9psvA6zQqaIif2xQtDhOou?=
 =?us-ascii?Q?U93xP3HEqElwfqAgpcFQrAOrYNzouXbhSpQfkGQ2RVBbTr4ApmCWVN1ypiya?=
 =?us-ascii?Q?RSd7wmyk8m8GYAgC1MFsRiNQBwWC+7q2GThSym3700jY9sOmjrVfkDwG9ewo?=
 =?us-ascii?Q?MX9ZwQ4X1A3EB0IJxkWh74JaJZkTwd5675EwL7XUzbWge+PHYa85lL4U6MbI?=
 =?us-ascii?Q?6F27TXpwxC45lPo4S3L70qjeufS4/ESpaJJ866XC1HKiI7yfrRtWbpCXZGOW?=
 =?us-ascii?Q?soKX5B+n1sALlkn58D0Gq6rgV06XZwfAVQWZMkpJTu24kbzCnMG9c5CH3dWC?=
 =?us-ascii?Q?ksO9n23pkNDxCxG38/bShjuvbDTICF08LusOiWiFrWmtaZpTpbwP9nVw54Tc?=
 =?us-ascii?Q?v93b0bevkzeaIlCXfZbRJBS29FvFndi57Wb0oQlqVIC8zldomqvXTZu0kOk7?=
 =?us-ascii?Q?hO2fszCB0crTxNE8UhXzHX86yQYvtkMm2cnv76O2xAMsZCooklWr4wNCo3av?=
 =?us-ascii?Q?t0SsbZ2wt5+kAQCmA591Urx7WJ5i5t+mP/MQyvhppqJOHjaosRUZXMNi6qUZ?=
 =?us-ascii?Q?5v/D6fpTKx3QhWMjpYj73/n0KepfWI6tQRZokZ7pxV0xuA4wENWfAlUpAewH?=
 =?us-ascii?Q?mWsKT9UH7VeZ8mrDC7wVwT0Hr2pVIQTiIYHecDaEX7lr6XE7XUSo5ZAZpqR3?=
 =?us-ascii?Q?le4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 22:34:41.1772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07293d21-fd24-451b-433f-08dcc87ac60b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6180

From: Victor Lira <victorm.lira@amd.com>

Separated into two patches to improve clarity and updated to use the
"pipefail" function instead of "mkfifo".

Victor Lira (2):
  automation: fix qemu test false success
  automation: use expect utility in xilinx tests

 .../build/ubuntu/xenial-xilinx.dockerfile     |  1 +
 automation/gitlab-ci/test.yaml                |  2 ++
 .../scripts/{qemu-key.exp => console.exp}     | 10 ++++-----
 automation/scripts/qemu-alpine-x86_64.sh      |  9 ++++----
 automation/scripts/qemu-smoke-dom0-arm32.sh   |  9 ++++----
 automation/scripts/qemu-smoke-dom0-arm64.sh   |  9 ++++----
 .../scripts/qemu-smoke-dom0less-arm32.sh      |  9 ++++----
 .../scripts/qemu-smoke-dom0less-arm64.sh      |  9 ++++----
 automation/scripts/qemu-smoke-ppc64le.sh      |  9 ++++----
 automation/scripts/qemu-smoke-riscv64.sh      |  9 ++++----
 automation/scripts/qemu-smoke-x86-64.sh       |  9 ++++----
 automation/scripts/qemu-xtf-dom0less-arm64.sh |  9 ++++----
 .../scripts/xilinx-smoke-dom0-x86_64.sh       | 22 +++++++++----------
 .../scripts/xilinx-smoke-dom0less-arm64.sh    | 19 ++++++++--------
 14 files changed, 64 insertions(+), 71 deletions(-)
 rename automation/scripts/{qemu-key.exp => console.exp} (78%)

--
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F28809AF5D0
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 01:27:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825583.1239852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t47Ea-0008Ey-81; Thu, 24 Oct 2024 23:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825583.1239852; Thu, 24 Oct 2024 23:27:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t47Ea-0008Cc-4t; Thu, 24 Oct 2024 23:27:16 +0000
Received: by outflank-mailman (input) for mailman id 825583;
 Thu, 24 Oct 2024 23:27:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QKxT=RU=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1t47EY-0008CW-H8
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 23:27:14 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2415::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f5d8c4d-925f-11ef-a0bf-8be0dac302b0;
 Fri, 25 Oct 2024 01:27:13 +0200 (CEST)
Received: from CH5PR02CA0023.namprd02.prod.outlook.com (2603:10b6:610:1ed::24)
 by MW4PR12MB6684.namprd12.prod.outlook.com (2603:10b6:303:1ee::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 23:27:08 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::fc) by CH5PR02CA0023.outlook.office365.com
 (2603:10b6:610:1ed::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18 via Frontend
 Transport; Thu, 24 Oct 2024 23:27:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Thu, 24 Oct 2024 23:27:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Oct
 2024 18:27:06 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Oct 2024 18:27:05 -0500
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
X-Inumbo-ID: 7f5d8c4d-925f-11ef-a0bf-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fjQJC1JkY52kppIFxrjVg2RomsEUeJnmPt+arrI75x4zWRAdPLOhyQ3r+vbrFF6UYbqmhYViX43C4VJGNcLnXK5rJFwPnci0ZA6fn62+XfLUSz5lMbpUAv1oaQWnwBYSzV1ISRwHTIcv8/tlIaQ26qL44KwUkfDdgax3VrRXSsFzBRdwTPfV32GzZ2e2lOALx4Ycbo91jdauR22fFu8pyBVo5IVj1v149VHKziQPBM6cFKJx651Fuc/sdfl1tk0uW4nI27D5UZGHw04a+n3omm72U+PQpYUaBpE+CVMYRs+nMaGGnPLKxedrOoTzv+D5uq1RAxNtzIqXj2uwp24m0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HuKqe4464Z1xh2mUL7kdN2VW0A0xjkcziv4tR7GBCo=;
 b=P/dmnnLldLzXFQoAm79/s86MNYCKwnkAPn6iSk93zADZAJ0NAbp6O5RXJdlWwjEVjXY+mQEsxE8RhFYLJMk/fQSYKihA/kZsy4CUp9tDGwjWj7Upn+5iyBH4Bq45lO86hwCzt2bDaHbfGbbK17EXtuQ9ErM+68gPhwdRBrT9i2wdVeVnPJrZC9AaSwZ+Xbjvth38dlPEhlrI1boNcmXh5wlUqSfwLOWVUpXmDegTRArbUXFX0+l/Xu0TLncHXc8aK57DTVTJhmhI8b7DsBll3L+H+wxxoG05NfZthumzh7ZJujqs4xJNMUwyWnX1LAzl3d1RAOAJXd3K0V37NWeJtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HuKqe4464Z1xh2mUL7kdN2VW0A0xjkcziv4tR7GBCo=;
 b=G2/M5g8JZk8iJUsqiJAeLgB3SwU8A0fFycCMf6VWDdiPaYYNbPoVoMLPlZaQnQTnchRkKI9DIgY0G4SJJW4svapzuFjngr56jyIy88kRHgkEBO0mGVJBiBFi3Nxe8cJYr4GOUomAPWDi9E3lrTA6hYxX1ZsDf9NZ6ljfrnEqEvw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [TEST_ARTIFACTS PATCH v1 0/1] build: add x86_64 xen artifacts (argo)
Date: Thu, 24 Oct 2024 16:26:48 -0700
Message-ID: <cover.1729809799.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|MW4PR12MB6684:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ab2637-1728-45a5-07a9-08dcf4836011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JYkkhuFBeQ1w0cNghQ9xqKwO82jUQWEyZNE2tY2a0osw0/XnRXfLZsyYKIhA?=
 =?us-ascii?Q?by7PdMiDSVhz0pq9rwqzr98FdhCMnCHI0OLWVB5evZ51xZ6vD349MWXql5sH?=
 =?us-ascii?Q?HkTAYkY9nWNLaHZfeL1Q5l5h4cKS5IjiqrF00Ee0M3tldeTVNjoZOGbL2iZl?=
 =?us-ascii?Q?xIOonN9iYJot5O9nFKk5wUZJ2wjQOuTmHognubBiWNvSjpEuVtQljwFH9dBN?=
 =?us-ascii?Q?bwA+IzHGNLoUpy9xqFkIpwfrtXzsaqTWa3fLbvxzBXfqLhbVA6rOsJTVEXeU?=
 =?us-ascii?Q?b2VQsZYF08Z4LXDjVZiWUOkoT6rGGEV885Qp/RkMG35CjDB5BHWBLFST0lN4?=
 =?us-ascii?Q?u9/Q87/lLXYsWIi2+MI3YLy8SCTkEi3Y1hqINwJ0x0ZOKu3Y7JFQLH/fizec?=
 =?us-ascii?Q?gQzOxG/ah7Lx6JRpVjbjH+w5ZvT+DnfqZs7IzNIFdWTTKPCqa04tdzvO/qiB?=
 =?us-ascii?Q?BvTkJZWEDy0BfxkENdp48W5EKTu6AlE8KIy9k9hLg5xbCbPMyQnxW3e5tyvE?=
 =?us-ascii?Q?+E2/l2pbm5v3rR++WlzeKCM3bqAo4ea5d3skS82BiOehNLvvBkzfZX77tWhl?=
 =?us-ascii?Q?EO8vhUCECJHegfA4/0sSO36EzsFXhVI+cTjAxPhIUQZbh8XR5Vdx4wFZT1SX?=
 =?us-ascii?Q?GmvvrbKrMiU+CMIrHSJXcqEOTlFNsL3o0fPurVrtnCvF907Jptd4TV90sMTj?=
 =?us-ascii?Q?VdCChvF/vDOZD3N3ywvNG2eibtF+jVfScRNno3IDa4AhIlYcZTPWYLh1QCDY?=
 =?us-ascii?Q?xDKktjyND6guacbM86uYaYt1B+H0lP4QF6/OriwyXkGqIL6s8LKWIxmijQK4?=
 =?us-ascii?Q?iojG/q59ZtGYkwVyg8/smQCfxkWZhQkpJi5epajPjnAnV1B5zTNXBh8rhAxD?=
 =?us-ascii?Q?3isqQm97RrVZJZADXhe8Ao0hp0M084XP6S+B/DBywhMwuBG7+EXXZRDG0+4a?=
 =?us-ascii?Q?WLDdvy9oiKFsUmxCHXB7PqaF4pLxElM2FnhlfsmoJ0oD1zf3Gm8Xa6hPpwWj?=
 =?us-ascii?Q?j6OXzF0Q7xMkQFynCvOv7jmPseapsl7tP+CNFtWycZS4PRvLygQheK7xLm8K?=
 =?us-ascii?Q?79LKtWnBqNWWmv1kdyrgTukMJAv3rnfFv14ehFZKtRF0fIIO3cdvrA8Un1uW?=
 =?us-ascii?Q?6vGis4MZ7ZrPSRv8fhsxVUc8Wpzp+KE0BNZfFXxI5skTjHDjRKM5QDzlHIf3?=
 =?us-ascii?Q?ULr1JFoid5zllDRhqDU6/sPlXkIqkeirYkUtyCTwRcyqlEvTbNpMyppmXODL?=
 =?us-ascii?Q?KFBmhsOXHG8cgzpFvmnoi5e14SXizMnmGeung+JUDYsgZizxV35duMzQmSk5?=
 =?us-ascii?Q?wYZtlXbyOHviA5wm4+EwpPgiLJVFl/nq5KZYYpBaNESEATN1SKCYhd7VEIuN?=
 =?us-ascii?Q?gTGcJY97aYZvFugkiF243wcKjSEd+zajI4hHbSxWIf1oYmGwGQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 23:27:06.8608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ab2637-1728-45a5-07a9-08dcf4836011
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6684

From: Victor Lira <victorm.lira@amd.com>

The current configuration of Xen CI generates test binaries using "export"
jobs in every pipeline. This unecessarily uses a large amount of storage
and network traffic because artifacts are duplicated over each project and
branch that uses this configuration.

Instead, use a separate repository to store test binaries, then they can be
retrieved using GitLab CI built-in functionality. A test job can pull
binaries from another project job using the "needs" syntax. This will pull
from the most recent successful job on the specified branch. However, it
will not wait for a currently running job to finish and will instead pull
from previous jobs. This should not be a problem as we expect to change the
binaries only rarely.

Victor Lira (1):
  build: add x86_64 xen artifacts (argo)

 .gitlab-ci.yml                         | 50 ++++++++++++++++++++
 binaries/.gitignore                    |  3 ++
 images/Makefile                        | 20 ++++++++
 images/alpine/x86_64-build.dockerfile  | 31 +++++++++++++
 images/alpine/x86_64-rootfs.dockerfile |  4 ++
 scripts/x86_64-argo-linux.sh           | 63 ++++++++++++++++++++++++++
 scripts/x86_64-kernel-linux.sh         | 31 +++++++++++++
 scripts/x86_64-rootfs-alpine.sh        | 58 ++++++++++++++++++++++++
 8 files changed, 260 insertions(+)
 create mode 100644 .gitlab-ci.yml
 create mode 100644 binaries/.gitignore
 create mode 100644 images/Makefile
 create mode 100644 images/alpine/x86_64-build.dockerfile
 create mode 100644 images/alpine/x86_64-rootfs.dockerfile
 create mode 100755 scripts/x86_64-argo-linux.sh
 create mode 100755 scripts/x86_64-kernel-linux.sh
 create mode 100755 scripts/x86_64-rootfs-alpine.sh

--
2.25.1



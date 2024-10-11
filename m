Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 700D799A7A5
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 17:28:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817223.1231300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szHYN-0007EB-3s; Fri, 11 Oct 2024 15:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817223.1231300; Fri, 11 Oct 2024 15:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szHYN-0007Bd-0k; Fri, 11 Oct 2024 15:27:43 +0000
Received: by outflank-mailman (input) for mailman id 817223;
 Fri, 11 Oct 2024 15:27:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I9YX=RH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1szHYL-0007BW-EX
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 15:27:41 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2417::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58e876c8-87e5-11ef-99a2-01e77a169b0f;
 Fri, 11 Oct 2024 17:27:39 +0200 (CEST)
Received: from DM6PR06CA0038.namprd06.prod.outlook.com (2603:10b6:5:54::15) by
 IA1PR12MB6530.namprd12.prod.outlook.com (2603:10b6:208:3a5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 15:27:35 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:5:54:cafe::b4) by DM6PR06CA0038.outlook.office365.com
 (2603:10b6:5:54::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20 via Frontend
 Transport; Fri, 11 Oct 2024 15:27:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 15:27:35 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 10:27:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 10:27:34 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 11 Oct 2024 10:27:33 -0500
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
X-Inumbo-ID: 58e876c8-87e5-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZWWy/4cnuS4ZHH6UfhFXza/vsjVqtiX7qLbDfUGHxeNxD7vbwC6gdH98v90YzXT76sRoiynLnT+FXmb8XfYnTFFfuarLhVfFu1m7gR47w/5EY3NU7GhdwyIA0EdTu+2YfyXvPbdWUyiu/dISyCjbwDCOYYhT2dvLbqol72ZJlXJR8wC8lauIUMcfymIHh28rwMK5fjGT3ul4JdX+FbghQdIsVx1zXdoTnP6UCrs2fau4sbwVnHKcEOuyym0GmOfs3flYuB+wwQPCE25ut4kBAzlZwydhHPPD3DPTXu+oLfB2tsUva/5wgpg3WsrNTaabKryKablCP+xcKvEGzXRBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DX+O69LlgKIahowaCk4Nma+41PhS8gSAjUIER4tMIY0=;
 b=YCEZ6KR6/lWd/P58MkQLmiI/5jhpe4fJklqTnabSae2Qkto6ACrCR6kzgqbmcKRskeqp9HlKtV/FfwKnhEdzqxGE5jUz71ybMFaY0qfUDBRP31dXfwQFLQwFa/XsEaAh+aKk+XBxWUeXZQMIrNVP4zvz7z22rWwzMia3yI+CUVbVT4wDxDJfQMzg9rUL3oc1rm6hvMnmnqsvzzOx5YlaMipVMOQ5i3dwsNFRaqbPVTOl7GssHNNSt3ZHnsa5qhmOf+/Y5wXs6Ol3FL4pfoVIW7kED/I0NbTc8BsnHOSzCge1u5aFFoLY0kSX4wqmP9YKJ8jRhat+rdL6eQDWNyv4Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DX+O69LlgKIahowaCk4Nma+41PhS8gSAjUIER4tMIY0=;
 b=A7Inog6bSfW+FmGB3TOicl0QwNuKGDKe1flZ55m2CquCsbkM3i0TOOWAul0bcWSnf/mhWR1QEu4nOUHhAmFZcBlDEbd8tBUMiLqCZmLeTFlys4nkg21tiCnpMjRiswBP6sxkXrzXinvxqvoZvH3G9HlHweZKTlq3f3IOrCFHm50=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [PATCH v5 0/3] xen: SR-IOV fixes
Date: Fri, 11 Oct 2024 11:27:05 -0400
Message-ID: <20241011152727.366770-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|IA1PR12MB6530:EE_
X-MS-Office365-Filtering-Correlation-Id: b63cfbfa-91e0-4bea-92b8-08dcea093b59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d1XsHs08M5nIKzZ8iIGjxeFDKCgQPQAVg+/hX32JXOp9hgOXlQVMIJdTwCKC?=
 =?us-ascii?Q?dCuhnY452jRzTr77rqeO9WJIETs83EDo6r3K2MkY5XrLSHAeTIbDVVvCNzTs?=
 =?us-ascii?Q?NmVYQSgCdowKsqBhUPsqlUQxTwkg79luqbRvEU1Hi1F9CsZ4Q7ZP8Hj0ErQB?=
 =?us-ascii?Q?cIVr4UMcTXvjE8byVllSfC/FguP1fy2E5eVgR0I54vBJb3jYZ7Kistbqs4pw?=
 =?us-ascii?Q?VcXRqRwOHDxgJyUAtVev6sDKTJxo2h7BG4SSFF3Gd1xD+aFdFtds5b13DFAv?=
 =?us-ascii?Q?xMH9UGns7NbmwvfxOBT7eSMJh79wP05uwPb1iEwwMGP7Fvq2cfK7Fy/xW3cD?=
 =?us-ascii?Q?txBAF/wb4ZYkXH+X50s99LOOGn8HyZifW01Na9oNLYTn2Z3NvbQx7rNrdjlN?=
 =?us-ascii?Q?Q2iB8hmsSOXmk8UdVxkhXeokPzq+ikGerXU1HWWDsy9JycJR99JyHvxSGrKI?=
 =?us-ascii?Q?qfwMxPorCAipqf+xwpi4UbbEiTfVjbwGHWulAZ42sNBAysxg4VdRfa36iOja?=
 =?us-ascii?Q?cIGaP8oM5zY0q1EVRgMKSGXrtjWbxrAWlyrjYBtrfSIS4uFgRZMZHuuHe/Yr?=
 =?us-ascii?Q?s6QN7ENlagkdO7BlCWosD3OxTK6eIZJFH81hbjpKkQfn77KRSYYeuVPP5qIa?=
 =?us-ascii?Q?GMUHjUqs57qkOOQbqMXYNceqm8qMoyLL3SQvHcMiZLZLcvtjnsLLae/cqHrb?=
 =?us-ascii?Q?pc4v/Bh7AOsRa5sRFrOZNYwPs6uTno4SDNo4vY2Mg7k8E95rsV+9EM/nhSsC?=
 =?us-ascii?Q?flPGux3Kb+a3JIZ7NizQkTXPmuQ/CUrou7/RDBgkrFID0u3qtubzJQynfkoo?=
 =?us-ascii?Q?2SVIY1cUZSaTBMjBtIX82p1P3A/GPnr7488Zb6naVmoSAJv1Or6zvH9pmpNU?=
 =?us-ascii?Q?4Z2yVD3NbASy+iZqWI2F+11mqy+ATuV6j3jUIgeUpZDX3lkUrJIT1yKXfvn5?=
 =?us-ascii?Q?mJV4Y+EXTBwZ3eTzTSe7aAY6WOno1x0cndFiHsKCFVvL5Zbeo7HQKvqPn7RG?=
 =?us-ascii?Q?GHfBLR4DI4bBS02sf80oWU80BZLdri+SjtS7slzqhcRjXvg2TR0cv2hBN76k?=
 =?us-ascii?Q?bSmnFpQojqBwF0oRnk7c+bP89XuzPyHLesF6+MlmeFt4rZokY8mrJIhNKxqT?=
 =?us-ascii?Q?WyIksjnrKQCEzq28ucgmIfOhnupCykgi9d+vl4l6hPkVTyrXpnj886jVthkf?=
 =?us-ascii?Q?e/S4+d4a++3Hw0tUsYfvny7jc/jIx/26mkhAmghl09XUqWUW8oN0RGFDGfOE?=
 =?us-ascii?Q?UR0Ppfq2ay/bS5CYA3B5hxe+9pEfQhaQLnhk1Qi+8VLiK/rru2IjIT4YeCWq?=
 =?us-ascii?Q?4Iz/GAr41gceLKlCEI5NpomNP0YQNTUqnPqo1RytuE7i6l4ZSPxXzNihlT7A?=
 =?us-ascii?Q?cTZFBkg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 15:27:35.0005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b63cfbfa-91e0-4bea-92b8-08dcea093b59
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6530

A fix for handling of stale pdevs, and a fix for a regressiong related
to a locking change.

Stewart Hildebrand (3):
  x86/msi: harden stale pdev handling
  xen/pci: introduce PF<->VF links
  x86/msi: fix locking for SR-IOV devices

 xen/arch/x86/msi.c            | 51 ++++++++++++++++-------
 xen/drivers/passthrough/pci.c | 78 +++++++++++++++++++++++++++--------
 xen/include/xen/pci.h         | 17 +++++++-
 3 files changed, 112 insertions(+), 34 deletions(-)


base-commit: 76a54badf890f56ff72644593c0fbc72138e13aa
-- 
2.47.0



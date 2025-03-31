Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78238A7703A
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 23:43:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932995.1335039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzMuu-0004YD-Cx; Mon, 31 Mar 2025 21:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932995.1335039; Mon, 31 Mar 2025 21:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzMuu-0004Vx-AA; Mon, 31 Mar 2025 21:43:36 +0000
Received: by outflank-mailman (input) for mailman id 932995;
 Mon, 31 Mar 2025 21:43:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vLSd=WS=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tzMut-0004Vr-AC
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 21:43:35 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20614.outbound.protection.outlook.com
 [2a01:111:f403:2408::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3061ae6c-0e79-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 23:43:32 +0200 (CEST)
Received: from MW4PR04CA0245.namprd04.prod.outlook.com (2603:10b6:303:88::10)
 by MW4PR12MB7384.namprd12.prod.outlook.com (2603:10b6:303:22b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 21:43:26 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:303:88:cafe::25) by MW4PR04CA0245.outlook.office365.com
 (2603:10b6:303:88::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.53 via Frontend Transport; Mon,
 31 Mar 2025 21:43:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 31 Mar 2025 21:43:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 31 Mar
 2025 16:43:24 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 31 Mar 2025 16:43:23 -0500
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
X-Inumbo-ID: 3061ae6c-0e79-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0Sg45lmjSjETQVeM12CremgmW4CK0KgJZQAUzfNO6dYDr1D9ab6q2DYxduSxYDQDyFNQ7yCuhqY/vSz0X9L+BDGqGjK6QFcBq+OsdMsJu8dRFoFtDCDypYeFb0XAKLOPkLY2GIGAkvX2hl8g5agbxGhGZcNIoqEsHCW2L8pcHY4jReTHOk11epVUvy9s5loHdN/htGXGVySyijuenwQ+sH838YI/CtSYGkTgvD9FxOrCpQYRhAtMaqzQGCCC3zOVALfSqHOuRTpNiQAkcRjK4mdqLioYQM/rwa55BmQmXQ9PVUhH/VNg5xkrTFpqr7VdlkxVGUY2U4eqX0aZ1pLkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJ7lXInbhKYWMPqWa9S25QekJEMpcqLlw5cD8U8hdXc=;
 b=zGIvyHB2T7Xco1tfcKwUPRV7HH6BeD3zqMn9onITKW99NVubX3mnS+ZXbRgwXoQNYjjcvOx7ExF17koabrPBoQ45WGqwe/7hOilKGCPy3nS3hu0wFmYcMynQ40S34yvxpMTLtaa83kxhCquQWdqi8be+Ctly+cbm4HJGXDKiqlLeyWa19AnBLr3HH5alikqbKnRs4MDC+mnJ3rA9udqsC9IlVipz1O2h9FW3U9tQuja6mlDpRJwllXP+VGMdAtes5cfeKaWWRZnMfMFlGiYPsipiXToyt1++kxglD+PniEp9xv6LFTx+qxaXrATd7NEuRXSqoB3oiDKurhmk7/HXwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJ7lXInbhKYWMPqWa9S25QekJEMpcqLlw5cD8U8hdXc=;
 b=bDp6BBulESAM4a+9Fqm0/QZTCTrS+bdoRLvZAFu37L5/ZAFIHS4k5DPgPcpHeFtLPiVGsu9Yl6EQggxNgvccnWtVT19H+gm+QYQvQhLsgwGwToR+5OlG6qYRXfQCjVL6FrhK+42+lQhxOvSDGEO+/WFoEsTyfWMTTzv5659uhd8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2 0/6] ARM split hardware and control domains
Date: Mon, 31 Mar 2025 17:43:15 -0400
Message-ID: <20250331214321.205331-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|MW4PR12MB7384:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fb9e207-66e9-4892-780f-08dd709d112f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8Z6u4VmowRLrNN0qZJTnAeA6GK9kS8TthNmPeYyQD9jV3P0rGq1Z+qukSovT?=
 =?us-ascii?Q?yFC1on+swHz8V7Aeg7JwEegtWC33jTHTixCtJgQ70rTDLPGxit97/TrrUTYB?=
 =?us-ascii?Q?LTNL4UUxdeCzRxeRamfVzBI+buTUimdzS9aUQDPQqM4QWALdWX6Yq2vagjsO?=
 =?us-ascii?Q?XOzZi354pRpOI1H7kRKgQU3545FVjRmz2/MgQOB5hCWiosEoFK9hPlQc+qwS?=
 =?us-ascii?Q?GLXN2wVxfWMflin2hKnmvk9Qt25+2QGD0jB9kb/g5QAd+tcjNwjNubwQ6jgs?=
 =?us-ascii?Q?x74etL/Z6x2Ci6F+q0QnErQY7KGUOblBCAdKfVaxmarBK/ldBEIBJ4ba3oT8?=
 =?us-ascii?Q?LpKzJ4NTxTJgbG5hYCW4/SlFUVTMJwHdgXZ/iOWxO+EVQc6cpfUOR1fKaJ+9?=
 =?us-ascii?Q?yHc9zqS5Ap+tTbz/NeG7f2zGktX1DLzh6sL5HwHdfNrErtCxAokdMe7YMNLO?=
 =?us-ascii?Q?96xx/6Vbn4jw4cXtDyABFvkUWyjSPQHF7FLK3WweWGoaVsCiRfjiLsV10d9E?=
 =?us-ascii?Q?SBAjsoyiL3AgOSqJSwrdXKE2hK+IBwevvDFH4WnWj2DHSmyT/OagRe16/SFj?=
 =?us-ascii?Q?6H6gvZjV/xFORsugrPHSNjSjeve0y+JgKbKPUQavsbAOy2y0K6RSP7o4TfDP?=
 =?us-ascii?Q?VWT51gzsPmOg6uX8IcLUy4zN8z9MTIwO2vEMB8ESiWZV4vdSPIzNuQPnyeyW?=
 =?us-ascii?Q?/910eks4JLYu3bZS0IkYOF1oalnCUcXFgkwF76IsuyeqDBIQapY9nWkM+Oe5?=
 =?us-ascii?Q?JXkL8107d3vwx93ozOVmyJqXX+B3Gle3Owz+FIo3+L/i5mF287J6imyZVl00?=
 =?us-ascii?Q?qp/fTlLWBum9aBZbDuw2MQLd78+HyLClUsTqwVBG5tZguEMDwm/3nwR9iUpa?=
 =?us-ascii?Q?sGtbqSk13/th6PEXF1+002E/wHY47KEJF3WjCzmssQRXBgMObLgPxyMmdc2h?=
 =?us-ascii?Q?Z+ylfSjVkWONj5hwzQm8ZtNQm4Gry0hVUpVNsisjC+PXAk4XRiJ5zFCFbYjr?=
 =?us-ascii?Q?cCSW8PPLKXHOzWoUUdVn5jNSXXCR6CFzSdNPXbCUIMewNrpdJGhR4AArOV6a?=
 =?us-ascii?Q?JZ1YbQiOFDOQSmdd/a5Tqi8PI5QhF0oHEF/CP1rPuwGnaFsF+MimseVpu2IE?=
 =?us-ascii?Q?YeaUtu7eF5SY5KJXJnHGYCP0sjNuBAKYOMW1A7M9VbE2sVMq65G2dAJO3QlF?=
 =?us-ascii?Q?Bc24Bf9LI4TS27awAvIn2Qs5ZLPzB5kUrZXcDzJUnBiLuJpudeLXxOHqQx0m?=
 =?us-ascii?Q?npwIw8d6hLJo8/e9muzSv6hFVyVi1cVDqsUcRiM78uwBLwZlEbflrVI/POHe?=
 =?us-ascii?Q?Ets+7rvvES1w/KrE+7BqJdwUJsCi6HYeuYjGgme6dINN6jS1283Zq1blDQmc?=
 =?us-ascii?Q?ANf2w0iMfdjHaV+6zrn4EkO+Ohnm1+amq4oiy05CxmxNwLc5v7tt35CPhjYa?=
 =?us-ascii?Q?zJGP4JTDgcr6Ty/mQ/iiiWbL21v41L6JLWMen3x9RnR2s8mmrwMRLLVPM1BT?=
 =?us-ascii?Q?u/KJodYeeAggLss=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 21:43:25.5572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb9e207-66e9-4892-780f-08dd709d112f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7384

This series implements separation of dom0 into separate hardware and
control domains.  It uses the capabilities idea from Hyperlaunch -
hardware, control, and xenstore.  It's been tested with  dom1 as
control, dom2 as a domU, and dom3 as hardware and xenstore.

To keep things more managable, this v2 is only the ARM hypervisor changes,
and one associated init-dom0less change.  The series is slightly
re-ordered to move xenstore changes ahead of adding the capabilities.

Setting hardware domain as domid 0 is removed.

I've been unable to run a combined control/xenstore.  Linux console
output stops shortly after the domain determines it should be XS_LOCAL.
I have not investigated further.

Daniel P. Smith (1):
  xen: introduce hardware domain create flag

Jason Andryuk (5):
  xen/arm: dom0less hwdom construction
  xen/arm: dom0less delay xenstore initialization
  xen/arm: dom0less seed xenstore grant table entry
  tools/init-dom0less: Only seed legacy xenstore grants
  xen/arm: Add capabilities to dom0less

 docs/misc/arm/device-tree/booting.txt     |  11 ++
 tools/helpers/init-dom0less.c             |  10 +-
 xen/arch/arm/dom0less-build.c             | 167 ++++++++++++++++------
 xen/arch/arm/domain.c                     |   3 +-
 xen/arch/arm/domain_build.c               |  14 +-
 xen/arch/arm/include/asm/dom0less-build.h |   2 +
 xen/arch/arm/include/asm/domain_build.h   |   3 +-
 xen/arch/x86/setup.c                      |   3 +-
 xen/common/domain.c                       |   6 +-
 xen/common/grant_table.c                  |  15 ++
 xen/include/public/bootfdt.h              |  31 ++++
 xen/include/xen/domain.h                  |   2 +
 xen/include/xen/grant_table.h             |   9 ++
 13 files changed, 221 insertions(+), 55 deletions(-)
 create mode 100644 xen/include/public/bootfdt.h

-- 
2.49.0



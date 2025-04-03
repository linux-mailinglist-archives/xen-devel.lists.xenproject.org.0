Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBA7A7B19F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 23:46:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937339.1338341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0SOD-0000Ne-DA; Thu, 03 Apr 2025 21:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937339.1338341; Thu, 03 Apr 2025 21:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0SOD-0000LL-9t; Thu, 03 Apr 2025 21:46:21 +0000
Received: by outflank-mailman (input) for mailman id 937339;
 Thu, 03 Apr 2025 21:46:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GOX3=WV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u0SOB-0000LE-VQ
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 21:46:20 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20627.outbound.protection.outlook.com
 [2a01:111:f403:2009::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 103b2a84-10d5-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 23:46:14 +0200 (CEST)
Received: from BN9PR03CA0966.namprd03.prod.outlook.com (2603:10b6:408:109::11)
 by IA0PR12MB8304.namprd12.prod.outlook.com (2603:10b6:208:3dc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 21:46:10 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:408:109:cafe::3a) by BN9PR03CA0966.outlook.office365.com
 (2603:10b6:408:109::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.53 via Frontend Transport; Thu,
 3 Apr 2025 21:46:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 21:46:09 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 16:46:09 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Apr 2025 16:46:08 -0500
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
X-Inumbo-ID: 103b2a84-10d5-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGbCaYBw1LO1LhnntkmTHW5s91C+0TiPj7LGN7WbyiKJjBegeEoqFl4VS78dBQJOzBACh3MqnyX0SF1aPvRSQDB3X+hw+XXesn4y2eUrgQ+t4Y/6sRJ2L3CkY3hFKeneUhvvKDfMFkJ3WlkMyqdCiDPB+rXTCun514QBxIkQkKzTx+49iErXV39SVFUeVzMye87kVD9h0RwI672DkWoyrBfy/cdsznv0LsOb7Ptn8AVJOuRuxvRvURv0jKc4Z1hmIpyYS7c8pqWEDLNnVCpaOsz1mHZzRQcCxNi6FKkfdCNJ8pOc4reRraTEUy3dbyKmDF/6Iyd7zl1NWnDPatrgFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JY7pwv1wK1CqRWVrF/jA8JHdhYkcf/QyWiB4jUMBuYM=;
 b=fME0h7heg5BIj6s+doAzT5ih3UaePocjJR/wZ2CSBjMieE5bqzg0NKdp61b+9uuihgrXnADQyls79usdo1OxZQ6abT/snEfSn0ITcTOiQBVOpFw2WO9A/70O/pE2+9suRPVXbrg0BZ0dd5O5j5y5tQXonAzsgy5uWdLvOY/JvOik+WR2DtHHw/PCIOtUqNcFRJTRBeUkb+TodEgDAkfVc8Kewu/c4lIzcwejjL8omitpo7YmyZO0IdI/snDbJ4LajqpDmcLl89OvpGQy1/M8mreh4wzZhHau0i4sgIhP/3W0ZbP4KztBAWYIF+AMVyvkWiYqs/W8GkfIc64d5tSu8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JY7pwv1wK1CqRWVrF/jA8JHdhYkcf/QyWiB4jUMBuYM=;
 b=Kkm4heJlzXvuDMnCVF0R9n3DUVcTFl0hTQ/f8dTCNNCYN03xqfmlLCL+ClKC0/K38nr5tFCv1LHE8SKIxqHbxjJzIoyvi4jTjAKhnDTeH5rAFndmUvEPcAbsfnhR/GzWnXOlVSWrF8JoG48zv1X51JUyk5EaBqh66dNu6cEPLMw=
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
Subject: [PATCH v3 0/7] ARM split hardware and control domains
Date: Thu, 3 Apr 2025 17:46:01 -0400
Message-ID: <20250403214608.152954-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|IA0PR12MB8304:EE_
X-MS-Office365-Filtering-Correlation-Id: 70a9255c-b9e1-4e20-6e9f-08dd72f8f1f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?82VW6m3CMHC2x7/ulmZf+tinh0XKSfWMV8C1Kl9bl+V4J2aab3h6+J9IDkiw?=
 =?us-ascii?Q?r1Xkk0vY+si9xuAJB2Un6YM0WNFnnmCtZqE8PUBgSqSfBK7e63R65cqFYurL?=
 =?us-ascii?Q?GeqXkVG0pywFylPYUy18kINLUqx+J+h57rAJLyF8wq6nJ9mRO7k5McPY14r+?=
 =?us-ascii?Q?/fUUCnT2hCiQ+M2x1IkWeFxmCKzUdJ0QSe2konIadi+QHwrHMmSiPkknaI1O?=
 =?us-ascii?Q?/76olfqgzmTZhjOJVFrChBBAP3ad9nhRSnxQEWphthRoXZS39gPfIF43fH8K?=
 =?us-ascii?Q?faOrsV6268vFTg5lPliWYu9aQIPXtt+aUZJAyWzrbLe54Wgi1rRIkZOnsjQK?=
 =?us-ascii?Q?nBunSGYfq4GXt51OPf+4tYvXxGpr2lh6w3CWvhBAiVuaCwyrqF8YbnLnr4T9?=
 =?us-ascii?Q?gLbosFDuogsVvpLuC9I/Y+WX1H7zRpM0VAhLwO5Dn6qdf0eJI4rjwH+JU6su?=
 =?us-ascii?Q?iWYx4aTIv189vXxGpBR00vggKgxGmwpS108DYyinXjshfuhZJhgOHJY3dWuG?=
 =?us-ascii?Q?0mROJYPCk5OXl6UMA7kzxJUS6uGQa+fZVG0dezBMy2jjdIQ8Lxr/FKoy/rl1?=
 =?us-ascii?Q?9KjVtgn0A5/42r5Zke5fuw3F2HHJT9RsUof2vxen1dzsWObGTQ2TpeOmQ7KI?=
 =?us-ascii?Q?sVgvFB2bLPg3nEwdDfA0Iwdmw9XwxSk8SLxFxdCLl5Yn6mDeIL4N1Rgr2FiF?=
 =?us-ascii?Q?3ndlFZmTktDIp1gcLYUO3wM6M03Jq7Zd7ZD/3pmuEFe2PvCxt5cqU0TDnL4b?=
 =?us-ascii?Q?KFSO84o134FdEgNH1TeYIYL71wz6kI9j6PUM3tvQ4wcssliKvnF7pG+F+afC?=
 =?us-ascii?Q?W7z1r0snjVSCX1YRtYBAYHO6IgB0uk+fCKPgWMV+BfTb9U/q2fQ7s2/yR+Qi?=
 =?us-ascii?Q?6Qkr+KaFppJ3oMMdF8D7KT1za9NMZGvWFb2P7vPbfbO13HuHwNfoz6CR+xy7?=
 =?us-ascii?Q?BV5oFaRornpZa1bZIyrWu5fdDX/rQfTrc2R+7WhvTy00Jin3qCZ3lI2YziAj?=
 =?us-ascii?Q?fk8AaiXKIxdLF9fx5NwWcqhwe+d3RHtnS/cvUs2zgz94nzWrSU0Kt7B7V+fG?=
 =?us-ascii?Q?IZpEyDQukdmqkGePw1oYaN7adj/kpiJaWlpZubv++ZYxjcKbqREY69QLaWKA?=
 =?us-ascii?Q?UQr5t43ijXtUoL9uQWM/HhaMt8sctlWRIOFeKZxZjBg2o+tx2BjgxgyLLghd?=
 =?us-ascii?Q?Mm2GORUoQLOhqf5FQDpMGQBfKAHbn03fk6USqkwVsVxsR4LHACdp1RmWi1/+?=
 =?us-ascii?Q?6yqd5dJmf5/PHw+zcBrzu/krobBhVXD9fSi+3tME1qdVLjF/bkW+CQrLBAng?=
 =?us-ascii?Q?D2IOWiuYPd4iUi94Y7cHb4Qkkx19u3+gM3x2CLsoUEPwjCLoWEgc7s/Pzr2V?=
 =?us-ascii?Q?AdTCJzMV/hIpkJiWjotmtxiFCyyKKFYxOR9MOvxcde/P9ocqlnRyyQNSGQGp?=
 =?us-ascii?Q?KDZ+Ayix9WWejeZfCVst0dLBxc9j5w7iGlqFLtu/tSYKG3TteP5NMEp8FsQW?=
 =?us-ascii?Q?fo1RyaLUgvOm+Uk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 21:46:09.3101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a9255c-b9e1-4e20-6e9f-08dd72f8f1f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8304

This series implements separation of dom0 into separate hardware and
control domains.  It uses the capabilities idea from Hyperlaunch -
hardware, control, and xenstore.  It's been tested with  dom1 as
control, dom2 as a domU, and dom3 as hardware and xenstore.

To keep things more managable, this v3 is only the ARM hypervisor changes,
and one associated init-dom0less change.  The series is slightly
re-ordered to move xenstore changes ahead of adding the capabilities.

"xen/arm: dom0less use has_dtb local variable" is a new patch to
slightly simplify "xen/arm: Add capabilities to dom0less".

Setting hardware domain as domid 0 is removed.

I've been unable to run a combined control/xenstore.  Linux console
output stops shortly after the domain determines it should be XS_LOCAL.
I have not investigated further.

Daniel P. Smith (1):
  xen: introduce hardware domain create flag

Jason Andryuk (6):
  xen/arm: dom0less hwdom construction
  xen/arm: dom0less delay xenstore initialization
  xen/arm: dom0less seed xenstore grant table entry
  tools/init-dom0less: Only seed legacy xenstore grants
  xen/arm: dom0less use has_dtb local variable
  xen/arm: Add capabilities to dom0less

 docs/misc/arm/device-tree/booting.txt     |  11 ++
 tools/helpers/init-dom0less.c             |  10 +-
 xen/arch/arm/dom0less-build.c             | 195 ++++++++++++++++------
 xen/arch/arm/domain.c                     |   3 +-
 xen/arch/arm/domain_build.c               |  11 +-
 xen/arch/arm/include/asm/dom0less-build.h |   2 +
 xen/arch/arm/include/asm/domain_build.h   |   3 +-
 xen/arch/x86/setup.c                      |   3 +-
 xen/common/domain.c                       |   7 +-
 xen/common/grant_table.c                  |  14 ++
 xen/include/public/bootfdt.h              |  31 ++++
 xen/include/xen/domain.h                  |   2 +
 xen/include/xen/grant_table.h             |   7 +
 13 files changed, 238 insertions(+), 61 deletions(-)
 create mode 100644 xen/include/public/bootfdt.h

-- 
2.49.0



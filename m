Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75531A90DCE
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 23:30:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956562.1349984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5AK4-00038J-P5; Wed, 16 Apr 2025 21:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956562.1349984; Wed, 16 Apr 2025 21:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5AK4-00034p-Kw; Wed, 16 Apr 2025 21:29:32 +0000
Received: by outflank-mailman (input) for mailman id 956562;
 Wed, 16 Apr 2025 21:29:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5uj=XC=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u5AK2-0001ht-QT
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 21:29:30 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20631.outbound.protection.outlook.com
 [2a01:111:f403:2412::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db43075a-1b09-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 23:29:21 +0200 (CEST)
Received: from MN0P223CA0026.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::12)
 by PH8PR12MB7208.namprd12.prod.outlook.com (2603:10b6:510:224::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 21:29:14 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:208:52b:cafe::8f) by MN0P223CA0026.outlook.office365.com
 (2603:10b6:208:52b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Wed,
 16 Apr 2025 21:29:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.4 via Frontend Transport; Wed, 16 Apr 2025 21:29:14 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Apr
 2025 16:29:13 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Apr 2025 16:29:12 -0500
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
X-Inumbo-ID: db43075a-1b09-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cRplAWU6BfRBLaMYeA9HLUb6wJwGyClzUXKUoBn8ea9oEZRmalbUevX76sAxPavHr+LK+0XxAiLMEi6ZroPFZASn095IjbqBV84V46PBUs1jTXLF1QYKZiqJFuyUb3FjrKOGbxQXznsxbK/ptooxfydYyDmsGUFVW3E/4BSNhJzOJV4j4aciZfigdcVT5xfnknxl8ax+37dGa+uGq3Kt5EKCLS9KPyedXnKWecGe/a1F38HegrJINzvBL3gcNOzwIq5wEVpEeX6nYPgQPFtDGgJZ+H+3tIvGnlwTiRy5IEfMKL71KfGa6yAon6qutjkRJqJOSdi/Xq5rTFQ0FG7lwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sl42oGSVJ5tdONDIQTNmAmSgYy+P+a6JrWP+kdTHfEg=;
 b=VDRnIfp3qfqjzlpgc4RI+gRkWaTbDhVa96NbB6mYf+DI59Hsc7zfEy5kNB0ltV85orYNHVzdNFTurhsHybV5WhAJIkzN/w3sveC427PMmv0FXqZa300pOTcjt+Sgg/RshD2FUCUmh5r6k5zIMxDsVYxWX7aqU+Tvh4HczZwo4i/SDFru/STsSKEfY+FrivheHrSdUOnkrCLkF7kWw/fzyn5J083dB7OqpyRJSPJu7gyX3QMxw58RukmjV+v7t2vc/E5GnkG8r2DzPhyjXeXtkTeXTmc7Md0AhkAdAicfcolFGIdvTkSoujM0Be1jOhy+EYZ/Xeg+9678eDi/N1Z9Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sl42oGSVJ5tdONDIQTNmAmSgYy+P+a6JrWP+kdTHfEg=;
 b=TCGArGucGAWhPA9jabi5Nowh//SjvnCTpSqLJtW7zt6EjRJYmkL9s+HelT/r/1b1I22RWV8Hdhxa99L0GYWfzJ8fdIxgH6KvCXbI+2Qhp4Olm5cDQ4H1AjhQZ5D3fUbXxOuNX1UC33cOgQjLxpp80OJ9F5LH2fOdqsEtuZ8OHGo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v5 0/7] ARM split hardware and control domains
Date: Wed, 16 Apr 2025 17:29:04 -0400
Message-ID: <20250416212911.410946-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|PH8PR12MB7208:EE_
X-MS-Office365-Filtering-Correlation-Id: 8733ea9f-6f46-4126-d072-08dd7d2dbc3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kSEUDXafw5fHorIdvQqgaknlNR9HBrxxArQZT1Jua0C1X3uKIMizebvw2duw?=
 =?us-ascii?Q?c9gzjD4oo2VL8mFyOSQhSHdUF9cCIxEQop2ulUVe0oFg/BiZWY5V1vhAZV5w?=
 =?us-ascii?Q?lfs86CohUKcChOxpSM5XqNEqorSRg22qWYY/MUVf5jEb05ucrHFBJglsaE74?=
 =?us-ascii?Q?6DDkU1kj2+HE2xqFf11m39xEIvXXNcJk6oLB0rHbn6sDc6ZNslNSepNDkn25?=
 =?us-ascii?Q?qDWznUtqh1lJelS7BjMf/fG+Hh0xeEzz8nywzZS6wgcfkzxSNnzwguRb36SL?=
 =?us-ascii?Q?j4jIF8+beDBisqddFBWNCYY+Oc6AuvKfq3qU0anG87VjSZ+xPtfwmYjVFxJg?=
 =?us-ascii?Q?QtaT6rRI0FLaQ2yDas72qHP/fpWwE2qVNSm5IUKlmGCyAVhlv/egoqtInXfi?=
 =?us-ascii?Q?kaOrK2w4r+BLep8iOEIrh5IwwKkAK1gEC3Zm9pVYvCQh9JTWWqaYfSNsPzbX?=
 =?us-ascii?Q?5TVVQjPgSYuk3UUG8RaaQmux7/Hc6GRSUb5dsm5+4zoFpbbLTBCpVcm0nHNM?=
 =?us-ascii?Q?fn1KTPXfygqDD59ZOBGc1NuBBYTFuVPjXGMhIp86vtoLh6KbLBbqVrxb3Qns?=
 =?us-ascii?Q?toJEyvlJZeFvn0ivr0tJRrhnpTD48isOkAZVTqkqnABcF1c+0zE0zejbVg/Y?=
 =?us-ascii?Q?pZRJQ1VhC+J59OnCIgTZG4AC6/cYyrpgQ4h/1wHaAOEY4ygHZ45V7zOx0/5S?=
 =?us-ascii?Q?AHJ9L2i5x66Di5J61c461Sy64ubFOrTwJ1E7yvfvETrBmu+DNO1Iwea3FuMq?=
 =?us-ascii?Q?xf9gUtuvSAJfBV+F7VUNfrrjdefVmyzPB9lv+jzm7IqxZEp0Wngtixyyrk2+?=
 =?us-ascii?Q?nkd8hS5EeDoPdXFvL1vLX6UJmWKSybip2w0IiQHJo8YL56jYUd/7y8N3HDEE?=
 =?us-ascii?Q?lW0wzDUJ8N4JsSdfsETCV+wUL0KdW0S+zIe2K//kLkPPqdM22dirbXtdkS2D?=
 =?us-ascii?Q?BFdGSdxJK/vcm1GmXg8h6qTFV5q7mY1dc5KgcRoe7G/tRZpwrwOMx/1zDMUK?=
 =?us-ascii?Q?oDHgdxdCLXs4/LvpiffXQC38SyU6g4JwJ+8U0oizWYftj31JpjwWE1ulr9Wr?=
 =?us-ascii?Q?BX7K0pMClhVqnK5MNTk5EsBL2Qk7JPAVVKToEGB32XyOFXup/XSYdLp1vucL?=
 =?us-ascii?Q?gkhFIEICefUfOZo1WMvCmRuCuAmNncp2/HAoj0JV8VXAft9I2e++1yOpOcQm?=
 =?us-ascii?Q?UmTkzclujMrJSsxT3tc9V6wPcTQdhlT0kyuQ4C+zY0/Dvdcewg7sG0MdZAjH?=
 =?us-ascii?Q?QJ8SjIlvreSx8ojHqB9iXvSs0CHVzPXiCuZc7SjjKklKuJfqD7bwoeVbuiBl?=
 =?us-ascii?Q?BEQGwcllXa1i6aW2V+Fv64s6nBoeTSQ0DN1r6X1jSvGCcahtvQbAamHkj5Tc?=
 =?us-ascii?Q?PW11nlm4VFVoLUnD4YVH5JAjFlMRu46AtLyqvRMOoT9MUvbz7lO4Ltx5RGz6?=
 =?us-ascii?Q?VCwDzp9BcNQ2+eqsovbQcDwF+SnzeFdXo/KrMf5y2xcEO1KQAjF/GMJ87Iqn?=
 =?us-ascii?Q?rGcw81AMpAoUdgE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 21:29:14.0993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8733ea9f-6f46-4126-d072-08dd7d2dbc3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7208

This series implements separation of dom0 into separate hardware and
control domains.  It uses the capabilities idea from Hyperlaunch -
hardware, control, and xenstore.  It's been tested with dom1 as
control, dom2 as a domU, and dom3 as hardware and xenstore.

To keep things more managable, this is only the ARM hypervisor changes,
and one associated init-dom0less change.  The series is slightly
re-ordered to move xenstore changes ahead of adding the capabilities.

Setting hardware domain as domid 0 is removed.

v5 is fully reviewed.

I've been unable to run a combined control/xenstore.  Linux console
output stops shortly after the domain determines it should be XS_LOCAL.
I have not investigated further.  An ARM xenstore domain also has
console output stop at seemingly the same place.

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
 xen/arch/arm/dom0less-build.c             | 197 ++++++++++++++++------
 xen/arch/arm/domain.c                     |   3 +-
 xen/arch/arm/domain_build.c               |  11 +-
 xen/arch/arm/include/asm/dom0less-build.h |   2 +
 xen/arch/arm/include/asm/domain_build.h   |   3 +-
 xen/arch/x86/setup.c                      |   3 +-
 xen/common/domain.c                       |  19 ++-
 xen/common/grant_table.c                  |  14 ++
 xen/include/public/bootfdt.h              |  31 ++++
 xen/include/xen/domain.h                  |   2 +
 xen/include/xen/grant_table.h             |   4 +
 xen/include/xen/types.h                   |   1 +
 14 files changed, 247 insertions(+), 64 deletions(-)
 create mode 100644 xen/include/public/bootfdt.h

-- 
2.49.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8A3AA8B2D
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 04:57:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975734.1363069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBm0d-0000Lh-GN; Mon, 05 May 2025 02:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975734.1363069; Mon, 05 May 2025 02:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBm0d-0000J1-BB; Mon, 05 May 2025 02:56:47 +0000
Received: by outflank-mailman (input) for mailman id 975734;
 Mon, 05 May 2025 02:56:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LKXI=XV=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uBm0b-0000Iv-FW
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 02:56:45 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20625.outbound.protection.outlook.com
 [2a01:111:f403:2413::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 922e261b-295c-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 04:56:42 +0200 (CEST)
Received: from MW4PR03CA0297.namprd03.prod.outlook.com (2603:10b6:303:b5::32)
 by DM4PR12MB6253.namprd12.prod.outlook.com (2603:10b6:8:a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Mon, 5 May
 2025 02:56:38 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:303:b5:cafe::f6) by MW4PR03CA0297.outlook.office365.com
 (2603:10b6:303:b5::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Mon,
 5 May 2025 02:56:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Mon, 5 May 2025 02:56:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 4 May
 2025 21:56:36 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 4 May 2025 21:56:35 -0500
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
X-Inumbo-ID: 922e261b-295c-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TwznU89kxl7F1Bv3cV/ws5FygInpU2ikB8giwJQTiwV0QQbpS2Ig1lLzKoz6kP/+ZkSXCMtKtQ90Pp9METxvUQUZVPz2awuVpB/ZOWwLW5j/+zCXgmuZJf3bxVIDLPAoJW5ZwrnwRtsu3Dyv8ElI+otyub4VYxwEJhGJeOe8bly2qXeJZTkHy52JZOcDAt6sLnCRx8XI/AWhbUM2grwS0beaTkBRWR7gxFjVECGi/r4KA965WJV6rg9m6if6piFzeaEXV8mzkaeAb9qzJcEDKT1fnv84q5QtikEwhyFOnDni8fqHKC/MVpiAoJ5Jc0EVb1dcaiCgRMgukAL6AC4gvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVGq8F/Hua4ybpdTW1eQsHcn8bwbEhtWSGvMOWqnUS4=;
 b=bvF7AHsrAJhDlcf9UbVlTl4RHMetnud9aUT2bIMJ9fw9C6vowV44XE13w1ZkFQVvCBqgFj+JybLH94oTXUegSnhX85OSoAiFJyyHbP53ZJXkHJPkwrhAGY3DOibNQdDm3nMBVThgUIQAAKPcrqBGsO68xKMdqDb8gp81bhUvECYJCdgRFKiHEV52PBFESAyMKVU4/NjSJgA9lSwxkXFn0QWiP29IucfehAft1drUM142GW+S4uHPH/6GC8TH2DSS2L4v8foKN5FHzASmdp5sE/Px4uQJTd5AmiGx1Iu3pr+iRLDmZffHmPOpe3TzNtfNhTg35QBr6Yr4yp6bD0e/JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVGq8F/Hua4ybpdTW1eQsHcn8bwbEhtWSGvMOWqnUS4=;
 b=4qiV5JhDVkwe5jXEkbzOFJFA+C5avUja0aapm6AllZAebIkhSfch5pV/b9oV0x2jK5JKhLeRTvTii171qF4nB1JW4vSLlDJMsRqKHWFoNbqyTwKBpZXBWfzzaYx58rwhZBjJTvOwG2F6CrIl18+rns88iO2GhwOaTsUtVWK8TdM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
Subject: [PATCH 0/6] arm: extended regions fixes
Date: Sun, 4 May 2025 22:56:23 -0400
Message-ID: <20250505025631.207529-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|DM4PR12MB6253:EE_
X-MS-Office365-Filtering-Correlation-Id: e6bf3029-20a1-4d9d-2f55-08dd8b807415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n3Jh101DyZSyyNZ6HihYUCi1Hr+VJHHTSI/oHTHonc2bPeoldQBQCPddhAh0?=
 =?us-ascii?Q?XryyG5Q/kBEMQMNXN0cWOBlnXGfV5+8U2KF/+0STFU4zEQ0M45JmEF867WqV?=
 =?us-ascii?Q?/KlbHCrjveIKHC0MKda6bGsLu6R3S/Vi9yQT9flXp4k1jUW0NobLop2pLnd6?=
 =?us-ascii?Q?1+l6KI+CyiwYSdnlL7uOkjrsjxg9gwAuqE9hCTTntvyBinzRnLvr9Gzt9CpV?=
 =?us-ascii?Q?DPurxdf68iX+iuieGHtfxrSMisjcz8Y8pn6gixehNkYYp31ypWTAo7Xz00sj?=
 =?us-ascii?Q?xZj6W/elsuutyHGJ3Hnj9LjFbOJV2cgz1I4aOnVe9M1uoYkHuShlXT/c/+qe?=
 =?us-ascii?Q?ia5jwNiVSvDgNCCo0nCYQm7KoPpoWFFs2aiA6ylDpxmZMah4uR5Tt1OwCwjh?=
 =?us-ascii?Q?ba1LyK288++7K6XLo8u2Oowd2P9DZnHLZqb05z06xeRM/M8JjTKtDYCBsODM?=
 =?us-ascii?Q?ZSjlIS2V4SO+tTItSPb4axp9OqIC8T8Vcd+ZTXACZKUVlPTn/Eg+vWXd5dBx?=
 =?us-ascii?Q?eMZNMQ+ncQ3S5tqBuwbn/gPMlrD5JhpSDgA4h32Bkkls+xP5brD/7C7ima0J?=
 =?us-ascii?Q?CXK4d7vwVApzXxpc+Kuw9H4CB+WFFS22vz+JfGY6fa/xQ1mfkUKmyWRhKlYm?=
 =?us-ascii?Q?cRXqMKHgj0Dt0nd11dTYuRAHTFvLuhOw5Dh8V18tcKRmtZbEWgh0vVTlcVs9?=
 =?us-ascii?Q?+DYzWA3gfWCP8LsVaheYnIb0XMqfXMR0i0dp7FXe6+oY3VJACaVWM07qfc4t?=
 =?us-ascii?Q?E+1hSTzZxSPctMuhHoi3IhEl2rXLVpw1LY1lLqOCG5g86Nlf2y3m8eQ6VLlc?=
 =?us-ascii?Q?gX+9NDJ5mjVIa8J8aHgrYq20lSaRhsrrNrxpluN+YWuaX1ITjgocZRaSJ19/?=
 =?us-ascii?Q?G5obQPwrkowDI/xLaWFsHNHMafJ+Wvo+zGkCRbLgoNHc9kyhdzY72+syBjiR?=
 =?us-ascii?Q?/EDklW3Uhz0DXtHM/yGPoKsfjiW5em3oADaKoUmCcQ0V+RHjAET0ZnPit639?=
 =?us-ascii?Q?4kSaoK7xG36Du7El+S++yzlr7pZ+KaOjZJXXekR4yJSYKjm29LjjU9YX2Uli?=
 =?us-ascii?Q?IpJISQZTjklcawx6sD8qWScAQ4iuu0LGP3jFuUTi9YyGPhQWzCvLdn6ucdT+?=
 =?us-ascii?Q?l1jBJR8BTQxtmqsOq3T/A6sd6bYlT7SkeDAfA7ZbFbD7ARVeUWUZhWxDPBt1?=
 =?us-ascii?Q?/Yg3eGdvwRhKvpkFd7+/ftn488VJEh4b7m7NKF85fYfwUxUzr6KED0hb1gWu?=
 =?us-ascii?Q?khkfCL205U1rLRYbsz5q9b/AOe9LlKc5C1wKOQ+AT6wED5kXmYnfOSBi0TRY?=
 =?us-ascii?Q?mwMsYrU4QLkoib24jkINE7RYqvaH22C6h80PIYjVJZwRq1lawymSXcd1V5Qb?=
 =?us-ascii?Q?Wktm+ymSk8omV3xcpZ1RMKLxOzQspcj2nhoWFRixyZba1Pw3IWZwpvlgOMHN?=
 =?us-ascii?Q?pkl0U06OEmsPH8f4V/2QwdtqOGbNysPRB/HP7uWsUTfogGu9Ca9rZFWAIiA/?=
 =?us-ascii?Q?o0viaMdC8RDTCfuGaFoNRcEJ9+p+Og5om7TWV2gV1Y8uD0WeRW7vkZ9nYw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 02:56:37.5412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6bf3029-20a1-4d9d-2f55-08dd8b807415
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6253

pipeline: https://gitlab.com/xen-project/people/stewarthildebrand/xen/-/pipelines/1799738957

Stewart Hildebrand (6):
  xen/arm: fix math in add_ext_regions
  xen/arm: fix math in add_hwdom_free_regions
  xen/arm: switch find_domU_holes to rangesets
  rangeset: introduce rangeset_subtract
  xen/arm: exclude xen,reg{-cacheable} from domU extended regions
  tools/arm: exclude iomem from domU extended regions

 tools/libs/light/libxl_arm.c            | 118 ++++++++++++++++++++----
 xen/arch/arm/dom0less-build.c           |  19 +++-
 xen/arch/arm/domain_build.c             |  63 ++++++++++---
 xen/arch/arm/include/asm/kernel.h       |   1 +
 xen/arch/arm/include/asm/static-shmem.h |   9 --
 xen/arch/arm/static-shmem.c             |  65 -------------
 xen/common/rangeset.c                   |  12 +++
 xen/include/xen/rangeset.h              |   3 +
 8 files changed, 182 insertions(+), 108 deletions(-)


base-commit: 78ce2be733b1e45e2e190c1765fe31da318d435f
-- 
2.49.0



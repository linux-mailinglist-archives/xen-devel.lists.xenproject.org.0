Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D06BB127B6
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jul 2025 01:59:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058717.1426221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSK4-0007cE-V5; Fri, 25 Jul 2025 23:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058717.1426221; Fri, 25 Jul 2025 23:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSK4-0007Z0-Rl; Fri, 25 Jul 2025 23:59:32 +0000
Received: by outflank-mailman (input) for mailman id 1058717;
 Fri, 25 Jul 2025 23:59:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ufSK3-0007YZ-KQ
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 23:59:31 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20617.outbound.protection.outlook.com
 [2a01:111:f403:2414::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6639bf14-69b3-11f0-b895-0df219b8e170;
 Sat, 26 Jul 2025 01:59:29 +0200 (CEST)
Received: from BN7PR06CA0049.namprd06.prod.outlook.com (2603:10b6:408:34::26)
 by CH3PR12MB9195.namprd12.prod.outlook.com (2603:10b6:610:1a3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 25 Jul
 2025 23:59:25 +0000
Received: from BL6PEPF00020E5F.namprd04.prod.outlook.com
 (2603:10b6:408:34:cafe::45) by BN7PR06CA0049.outlook.office365.com
 (2603:10b6:408:34::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Fri,
 25 Jul 2025 23:59:25 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E5F.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 23:59:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 18:59:24 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 18:59:24 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Jul 2025 18:59:23 -0500
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
X-Inumbo-ID: 6639bf14-69b3-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYui0l2Y330rrxqCzcHWsGCJcdRqzsgoD5qa3TPQhgdvn4r7x4G3gVpRvg0B2aolVvshWgatwx3ROHY7I9bKMkvym1/NpeWXumpbIMQbSYpLkDKZjavpBNPnb7F+mlZBiZnQ1TW3awX7lwai82zhaKJ2D9az1sZR/sNikfL8tYsaF5WLl7GwipxNf+Wf9duEmgbgSQdeyZMSnezYS+CnlTdcIadb3maG06wINkhsQ4W6r1kMcN5MHuiuF2/gRfvyPPVOr+k0h7sfpDkOjYiaAFtJdaQ35LV7m9kn0WkL7u/uzvNDkLigBnofbdIHoBdQtH1STAmMwQ/dly5GyGBCSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cY66KcLCVC0cw7vTENgNXXNjkSIIGP5XLYOWaQF9CBg=;
 b=S5HyWPcVSvfNSZU6kc5yWNIo3dq3N0wSknevaTKozNo+BmxG/j9O3L8qZdgddWHI4r1feZiZJhAMTXLf2kNnwWW6hiTT9MopFy3qwozZNJ5kdFZ2ydUqVfmpG7uBP9/r5q8jTN+Tz9t0ErgiYNMaz0My3auirzzav/o1SDlN3pqbIinNKJfTzA0qJptujCOWj8wlT/PxS2AvLVcZmBytAMA2Bv9hTahe1dDujGjDwszVBHvW8FvAVKFoSGc1LJ2BDGxNrpBSEUx2EfL8avm4ditk2jfBPNPha5JUm1czeRu7NvzMH336LD+inWuwmDEDxfgS0href9FniVTLw469OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cY66KcLCVC0cw7vTENgNXXNjkSIIGP5XLYOWaQF9CBg=;
 b=T19Hp8Pj7dz5KFoQ644ybgpAHnbBO8jCFl/9kAXfcIhCj598chF3s9sMBZGaN11iK2Pc/kXYZ1scvP+yXGcvU+uDuuSBdnJ/slMkC8tCvZ7SjFAd/Dc+Aug+mCgw7GviUgAL9Z6G8Kj+sPrBodJ5mI8rx9juZd9ZV8S0+pTzN0s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Juergen
 Gross" <jgross@suse.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v5 00/11] xenstored patches from split hardware control
Date: Fri, 25 Jul 2025 19:58:47 -0400
Message-ID: <20250725235858.666813-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E5F:EE_|CH3PR12MB9195:EE_
X-MS-Office365-Filtering-Correlation-Id: 567b7b3f-b0d4-4bc8-0c2b-08ddcbd74859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XqgGvLHOF1jc0Jn2O46cDTErQXE0yOamfzyyvwnjxcRgVPsMsCBIs1ywn0KE?=
 =?us-ascii?Q?JXtblC58T8Gmwgf5T2KP15o9CAPV7odEA9q8tbBiMgKnQM54PRXq4xVq770f?=
 =?us-ascii?Q?pjR3fz30dFYZ9AIVyHRcXANLoxpwOUhxm8zkntnTDt1siElzwMM08ZmhxAd1?=
 =?us-ascii?Q?ZnYKvI1TDLJse2YjDl9Kv3TwCEKdHxVA/1wbeKMRYvuFlhTxfuMTG5jtuLCU?=
 =?us-ascii?Q?jc5YVIOeZSN5jCdp5HNwo+xip+IaBGWhG2fSxVzQSV+TiVBULbqXhKPkT5sP?=
 =?us-ascii?Q?bVXuWs0FYXkHECoT45Wz4YchYHRkhu8PbCUoWYfRkeDVurlsFO1WCEdR5Fnk?=
 =?us-ascii?Q?mu+pDWLyO4mvkoSB7WVntcJR/DQSnyke7DS3Z4sbWm5Da/4rX2Nv7hpzF8vy?=
 =?us-ascii?Q?1CXyvSxAxQ02LoeOnZL67zqWCFBnHEbKyJOvfovTXr9a+LxHcO3LZnlXgI4x?=
 =?us-ascii?Q?0DCbr2e8mhGc/VHHs0BBmBop9DflhmbCAVn6Fgp2/Q879u5q8+uhjyNXH7+k?=
 =?us-ascii?Q?K7AHe2cV7VfeLojNlzrEHoKazfBihDp7ZQec+zs9l5JIs/vXVswJ0n5ZVr0t?=
 =?us-ascii?Q?R4ZTbDkXYzutUpgvE67nawrBJSknIsxuoFHpI5G6Cj2kKqtV6PfzDZlHk1sn?=
 =?us-ascii?Q?Lg1QpkdBSDRhhaDTpcwy+aIF7rOgCgSbZltGYj002+4g46Hyknf3rPP2a+xz?=
 =?us-ascii?Q?J28PABIbpOis8H4Mf+NWd9F4pKNbbBvHWFnntWvSK7XLF/Fkpt3Nmc8FXhtm?=
 =?us-ascii?Q?0h91KlA5dhX3/Ugvtv2MjejTudc+r4j3E1E+CEybUYfSdPUHGBC0p1oCSYg+?=
 =?us-ascii?Q?4n3UocI5su3Ghhg49YRsXs0ocy1lQXLxRWbVSoAv6slcqytMtVGmmTmBwmQ3?=
 =?us-ascii?Q?xKdygcp5Ym5CFkVHZF6qRk9IArT3QCOwFOIyy4D7dOrNcv2OKb8jlvVDa1cj?=
 =?us-ascii?Q?Kbz5Jb+Lbzf7q5fhgNpcuwtTjT6BIigeMQLnpsOZWVhaj1qyoZmulgVySs06?=
 =?us-ascii?Q?0R/tjxMDwA1rJXhD28QW+OqSpYOQfh/63HBJTpYI0NM1V274p557BZpo/NrD?=
 =?us-ascii?Q?MbQlonoZbYCuhUYPzePEQBhOgb8fNGHMj8WhCV9H+OLX84AZVxPwiHJxrnZ3?=
 =?us-ascii?Q?T6JO7zqDaYoQLfqx/iuy10esI8CgipxV/1FKbRLgLftlkEaC2xCQ98FhKQPd?=
 =?us-ascii?Q?YsdYQefCeHdfbJX5WT/Eja1EPIS7Q0lVLcRq6EUxlv7rT6vhqTKKS0qfkx6Q?=
 =?us-ascii?Q?M3fKOvZHA8zlZ7JbpdddyGLZFf7WkfS2DziZ1aA9mOaXBedIZufNIajlYSZF?=
 =?us-ascii?Q?cEVNnq5AwaOHgP7Cu4cd4sZ60dyYSpZN8buQpZPmOBcC18aDAD7K2NwdzL0T?=
 =?us-ascii?Q?HTXf9yquMz6XTrntaE204ZF892tKQ3sDj4vjdfh90RktAcCjaVlhGVsyoHVE?=
 =?us-ascii?Q?x6TCxHaSkm1nk7azu72d4tT/dnMJyidf30S0etSZc/0rSVFxEXVKmcV0ymN1?=
 =?us-ascii?Q?gprw2pBlbjB3zyFQ4NHhXr30ujgZcS6g/KGR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 23:59:24.8226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 567b7b3f-b0d4-4bc8-0c2b-08ddcbd74859
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E5F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9195

This is a subset of patches focusing on xenstored changes from my split
hardware control domain series.

It should address the stubdom breakage from the previous series.
stubdom was tested in gitlab-ci - xl list shows Domain-0 and Xenstore.

"tools/xenstored: Use priv_domid for manual nodes and permission" is an
interesting result of looking to rename some internal variables to
better align their purpose.

Any review or guidance on the approach is appreciated.

Jason Andryuk (11):
  xen: Add capabilities to get_domain_state
  tools/manage: Expose domain capabilities
  public/io: xs_wire: Include event channel in interface page
  xen/dom0less: store xenstore event channel in page
  tools/xenstored: Read event channel from xenstored page
  tools/xenstored: Add get_domain_evtchn() to find evtchn
  tools/xenstored: Auto-introduce domains
  tools/xenstored: Use priv_domid for manual nodes and permission
  tools/xenstored: Rename dom0_domid to store_domid
  tools/xenstored: Remove stubdom special casing
  tools/xenstored: Remove hardcoded implicit path

 tools/include/xenmanage.h               |  14 ++-
 tools/libs/manage/core.c                |  21 +++-
 tools/xenstored/core.c                  |  17 +--
 tools/xenstored/core.h                  |   8 +-
 tools/xenstored/domain.c                | 133 ++++++++++++++++++------
 tools/xenstored/domain.h                |   2 +-
 tools/xenstored/minios.c                |  21 +++-
 tools/xenstored/posix.c                 |  18 +++-
 xen/common/device-tree/dom0less-build.c |   7 ++
 xen/common/domain.c                     |  10 +-
 xen/include/public/domctl.h             |   7 +-
 xen/include/public/io/xs_wire.h         |   7 ++
 12 files changed, 202 insertions(+), 63 deletions(-)

-- 
2.50.1



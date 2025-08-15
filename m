Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2872EB287BE
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 23:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1084082.1443487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un25Y-0004zn-Hg; Fri, 15 Aug 2025 21:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1084082.1443487; Fri, 15 Aug 2025 21:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un25Y-0004xQ-E9; Fri, 15 Aug 2025 21:35:52 +0000
Received: by outflank-mailman (input) for mailman id 1084082;
 Fri, 15 Aug 2025 21:35:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IuPz=23=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1un25X-0004xK-AC
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 21:35:51 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20602.outbound.protection.outlook.com
 [2a01:111:f403:2406::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce681348-7a1f-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 23:35:48 +0200 (CEST)
Received: from BN0PR04CA0160.namprd04.prod.outlook.com (2603:10b6:408:eb::15)
 by LV8PR12MB9452.namprd12.prod.outlook.com (2603:10b6:408:200::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.19; Fri, 15 Aug
 2025 21:35:45 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:408:eb:cafe::69) by BN0PR04CA0160.outlook.office365.com
 (2603:10b6:408:eb::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.17 via Frontend Transport; Fri,
 15 Aug 2025 21:35:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 15 Aug 2025 21:35:44 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Aug
 2025 16:35:44 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Aug
 2025 16:35:44 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Aug 2025 16:35:43 -0500
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
X-Inumbo-ID: ce681348-7a1f-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RCPUBJxxRndAdSbcEm5LlWTRXMaNqk9WQ4vuwYuqhaP8pdFBvKO6SMyGuomiUGEUAfKS+VP5mNRdiabVljzCk9R4j7C1RbRBYcGB7HDdP9i7FwJ24iveNm3AtxpsmOwZXfdxpxOcpoT4hpTWQDIu9bEvSTD+8eLketWQGWHzc7N2gBbwudsvhxVde3Oh+Wn5RtxdpYOLswvl7RMSFT6mYBo5YHCYHiyJtYPsmp3Na+xjIZa0eOI40k28wpdBwV9vM+01xjlTV2TZBcDgo+30tvQlErgxPauu+DSDb96H56i5fRxXxLc960oUjkPYQ1lSty8I3sTvcQbwcVRN/MYrBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2D2BgYB2jvAg9Habw/kRw/P3OCnyTCx7Sn7Bkw58x3c=;
 b=Dm+B8emln9wlhgT0lFvhghUz8cKJUU8HfJQXSjv1L+vCcrMPEmgpml71C9C4fIy6FCshFa/1woWY8QXkRaR/NLatNaaXS1lc/CHq8/4DeSjPHzZ5mRq4mqBqqTbBRYtOMQdTX36VO3I1jwUr6OMtGe7+jGALvKPyIYhngbhK9EHz+OZuVofk4czheKv/fnlfV9TOudWYJbUw98zEDmWGJHCPFeEMygLwCrKm1IUxub0CzbJfXMLFt/L/OSWXYkzLnuiXg2uQ8npM8e0xTQcTj/2CAApvTWH8uSXmedbbooVJa76lj+6IFh+YuDBxemq9eIa7yod+6w91ipzdk2Ym9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2D2BgYB2jvAg9Habw/kRw/P3OCnyTCx7Sn7Bkw58x3c=;
 b=FEAK5Sef6vmHRmOY83cjTW2phMm+R6rd4b367pYGG46mSnmvw761khkJJAXxdGhTjbjPqHwY8jcsYjsvRf8Hs+syzZtjTlRoeCPDfWI4uILKjkgYIsMiplRJxbqy067q5nvVzDryIkgFgL+dcAItI2qmE7hn97mjtbjtuc8h+uU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v6 0/8] xenstored patches from split hardware control
Date: Fri, 15 Aug 2025 17:35:48 -0400
Message-ID: <20250815213556.90068-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|LV8PR12MB9452:EE_
X-MS-Office365-Filtering-Correlation-Id: 2904fefc-1937-4917-104f-08dddc43b10e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZuIjS0nDwRMhEuZH80ooIUBbbquI0REqT/D7PNhn4JNHu3agrYsVOlfglUlX?=
 =?us-ascii?Q?taYIiGu2CpfmzjvSnCZT6C1unxIs1ez4K6Uk3qv9BKaRK9r9DU4JXk8G1/60?=
 =?us-ascii?Q?ohL+Pg/t5Rle54MSitAS6ucRIBlY0g7CQ2BEwb0DkmALXmjwavrkH6wQqCsH?=
 =?us-ascii?Q?OlrQ32fgIG31SWn+gd33XtuVKZEg9aYooqibL/mn/Tc9PIwepXPl0M7sEd/O?=
 =?us-ascii?Q?i62Hp8jU93RpjPxuDHWapdA7lSlDm5C9JEAdWWL7AhPp4cJz34KhMvMcJcS3?=
 =?us-ascii?Q?qI9YNYLSYWPKif0ouznm4Yi/BrJK5e2+aIqYGVz0+2fLGCWmPoTrQwk/QZ91?=
 =?us-ascii?Q?a+7tvwFBrFff34FSVINaxubo4ZQv/OajRuR8OeISUgPLLs8v/3ZMlT7+DcIh?=
 =?us-ascii?Q?/1y78Fs3SejN66d5BUN6NqO1RC/bL2q49r3t0tkwSjtDmKfC2DkllNdl8XPM?=
 =?us-ascii?Q?qWBx+z0/484OYy1I63EdEHisj/CdvVwzngIAB1OR3b6R+ro/UPlp9RAhwANW?=
 =?us-ascii?Q?od/njL3N3GkQ+gK7MQbr7LeL7e/kjUp2wd0Y7PtV3cgZqnqY9tKFgY1wNeps?=
 =?us-ascii?Q?MNzk5D8M96ShMuOrUle0BSTgolyQL7IGbAc5kYbHE/n+qGdWX4xkHwV3E+aD?=
 =?us-ascii?Q?fq9ekcXCKdaoxXRrQt1c7Li5tzYxWLLPhmA66vaBUR5Ei4rRZCK6pLbP9eSM?=
 =?us-ascii?Q?DuS/DyRE/mkH8xXxBEbHof5ZYrHEjUf2QlvtyD4YNP8KfJCFFh13LCLjaUWe?=
 =?us-ascii?Q?t5ddp6qSKAGO2j/6p7e5/uNVIHVtI8CEZIrzWcL6NBzMeRaHPA2yotsO1eAO?=
 =?us-ascii?Q?Q8AQ3C+V4Zb0aXAOOvM7fIJNNWd9nvk2FgB0MitWKYO0t0Ga6qJWDMaUmHd3?=
 =?us-ascii?Q?OCL5g+gC1PHoWCKg3zgU/VVZWiXt+Wsa/phcAb1+RstTbVIaX+nHdinyOSQ4?=
 =?us-ascii?Q?UWiz9Hhqju7HOM4/koeNH2GwhXZK8fENn4PvyR6475MUN2ottJyFFZUQ4zyG?=
 =?us-ascii?Q?c81CCiDZBQSz9UNtuFrQaExvC+rk6CXG3X8eQ8hr6Btd7K3tCxvt5Y/cNY+E?=
 =?us-ascii?Q?xPzLoB5imLmRF0vYx679blVJKzMZVdviG7sui7clTHsh72UHydGSWYxaGq4/?=
 =?us-ascii?Q?nUX6bQzY7n87tFzBk69AX+VzTzgzc3bop2B2iJ8nMKYk39fIOY9lgfhPfmzH?=
 =?us-ascii?Q?ySDdJBCiKdl2WP8cRdciRP3xFtZ1OsxQjTeoH5FU2D5gC26DOrs4N6+9dkCz?=
 =?us-ascii?Q?bCtIf9xQPBa+bAreFwWOaF/egestiE0OMyhe2XxZByM3F+ymRKQqjHs2mOb/?=
 =?us-ascii?Q?/BgOLotDS34iL10xBf1H/u5x02Pq+Iq6oIMT/COSjpLRxS0FOCIOhnpQAmqu?=
 =?us-ascii?Q?Z//HfeELCwiRgKnOvH+8DqIxa38gSXbNaME8W8MS5iEMosu7E0RuTthua9fO?=
 =?us-ascii?Q?F3iHCBPJbgAgNVfqAaPSHYZzZVvcmbfO1qmvw42VaUApcOk2R5ZQ2qeCYc6h?=
 =?us-ascii?Q?XmPcGLzFgB26hcK+kib25fDzXkMjJOa306Ot?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 21:35:44.7451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2904fefc-1937-4917-104f-08dddc43b10e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9452

This is a subset of patches focusing on xenstored changes from my split
hardware control domain series.

"tools/xenstored: Check NULL domain in domain_chk_quota()" is new.

The xenstore changes are reviewed aside from the new commit.

stubdom was tested in gitlab-ci - xl list shows Domain-0 and Xenstore.

"tools/xenstored: Use priv_domid for manual nodes and permission" is an
interesting result of looking to rename some internal variables to
better align their purpose.

Any review or guidance on the approach is appreciated.

Jason Andryuk (8):
  tools/xenstored: Read event channel from xenstored page
  tools/xenstored: Add get_domain_evtchn() to find evtchn
  tools/xenstored: Auto-introduce domains
  tools/xenstored: Check NULL domain in domain_chk_quota()
  tools/xenstored: Use priv_domid for manual nodes and permission
  tools/xenstored: Rename dom0_domid to store_domid
  tools/xenstored: Remove stubdom special casing
  tools/xenstored: Remove hardcoded implicit path

 tools/xenstored/core.c   |  17 +++---
 tools/xenstored/core.h   |   8 +--
 tools/xenstored/domain.c | 128 +++++++++++++++++++++++++++++----------
 tools/xenstored/domain.h |   2 +-
 tools/xenstored/minios.c |  21 +++++--
 tools/xenstored/posix.c  |  18 +++++-
 6 files changed, 141 insertions(+), 53 deletions(-)

-- 
2.50.1



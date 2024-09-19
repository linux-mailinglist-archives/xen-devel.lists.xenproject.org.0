Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E5297C830
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 12:45:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800597.1210531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srEfC-0003ph-5c; Thu, 19 Sep 2024 10:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800597.1210531; Thu, 19 Sep 2024 10:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srEfC-0003mw-1i; Thu, 19 Sep 2024 10:45:30 +0000
Received: by outflank-mailman (input) for mailman id 800597;
 Thu, 19 Sep 2024 10:45:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9goU=QR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1srEfA-0003mj-Gy
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 10:45:28 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20625.outbound.protection.outlook.com
 [2a01:111:f403:2405::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 479ceadf-7674-11ef-a0b8-8be0dac302b0;
 Thu, 19 Sep 2024 12:45:27 +0200 (CEST)
Received: from MW4PR03CA0349.namprd03.prod.outlook.com (2603:10b6:303:dc::24)
 by SA1PR12MB8919.namprd12.prod.outlook.com (2603:10b6:806:38e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Thu, 19 Sep
 2024 10:45:22 +0000
Received: from SJ5PEPF000001EE.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::e8) by MW4PR03CA0349.outlook.office365.com
 (2603:10b6:303:dc::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Thu, 19 Sep 2024 10:45:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001EE.mail.protection.outlook.com (10.167.242.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 19 Sep 2024 10:45:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Sep
 2024 05:45:18 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 19 Sep 2024 05:45:17 -0500
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
X-Inumbo-ID: 479ceadf-7674-11ef-a0b8-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b0guoxvGclUyjardFArSasCVxEOPxC/m78jVe7TQVRz5cMISnqwwfOaXVy3rKM1t0jql6nVzCUfm4p16c9A0pTRsUUmmaGE3OWsG1/neih8veO7GEzsJ455iZYKofvmJ63zsDwcwvtuY6O96nkfgNpc6InjcrUvWiNrslt/0X4z+7xkFj9aJnhvr4IsES6yj/O6VoQ+gqwos7gKRpzr384ud+0xgjZslHO+cMAZsKuUFCkQAfgNre2Vex7DWtoWzQnJyQQ4iU/I5t1pFDKn+q6fgwMWnkdUQ+amSrhC7j430wyvVlxTTPD3uQI+EtUetevgCLxD5y9AAYH8L0LaRRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGQIBXyZmt1q0xZ6pRpx/lofcIOKIcqaWAlN88BlQGg=;
 b=i4HKe1rhGE+lQ0GajB11RrgNGhquZCUsi+N1NDzYEQPBXxb5tSVBA4tWgyzOZeRXjbI1WBOsh8A+lYeXGEdLl1qXGgfuncl9/A2ZgeraZzfM6MK/2PYLt8x87wNpyj6SiXmXQxKMyddB59SKcRrvyxueJAtXNpJaCoCz1kzK7vMG0O+4GOFocIm5rKt5tUFhQrxBwwu7dYt39P/WgfIsQ6598HoDrO8X3hgbPs1rMvxagbxejLVAM27Qf5wg0t6trwyJwZHXDkWj3MZx2EkQV9cckoJuU5cQn5oIHn0QYtb8nVjcx7ao/FK0qyyimo51CNcymfrNzVvBiCFg42d+Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGQIBXyZmt1q0xZ6pRpx/lofcIOKIcqaWAlN88BlQGg=;
 b=clcgRO0zeswsdL2bMwdDBuFly25ybL4gmKtPJGTYEw4E2mWL40EqNjj/qlChFKHPhmVWHLU/Nx8NZbP4Ml6/eyUOTOAMkEL/Np9FTTlSknUve41CLWG+h7jzCKGfugAElAO+fy56bcOktubNHZ9BuzzvHpgnqGxAko+2hgtEpsU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH 0/4] xen/arm: dt overlay fixes
Date: Thu, 19 Sep 2024 12:42:34 +0200
Message-ID: <20240919104238.232704-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.37.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EE:EE_|SA1PR12MB8919:EE_
X-MS-Office365-Filtering-Correlation-Id: e5c1037a-9424-4ff0-f7a1-08dcd8982898
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8MCzK6FqxJ9tWmurO12j68u7qPNPeDCsC7PElRWrCM6T7AfzGWjfvCshGE6d?=
 =?us-ascii?Q?3Lh87eD0TOK4KW+MEBacr6L95au02m99LKMFztLsVCaayK+uGlUW5jNLr/6D?=
 =?us-ascii?Q?wM4/mMQjKxJgk7qjoqw3srjqNH5KRaFla2C2N1aWKI2yFzndDvaq5HBkZ/Uc?=
 =?us-ascii?Q?hyF/5YcvJaMQqSAEDEckQDSQ5fBuMZnGHuMyUchl0e5SpocGLzpfk7csWVPj?=
 =?us-ascii?Q?/qdSnZktz1/AymiL/1cai8d4hJwfFfDgYPfkQbppwAvbag0bD6x8NGA0w1nE?=
 =?us-ascii?Q?Pn0UNurPGd34WfoeAcFCFtR0lPVsMZPW4nd7JurezUY8B9q9r+bKBtURjhPW?=
 =?us-ascii?Q?sVI3NVDl5KJ+Ey+QDDsBan7/FP9RSlKXrTW4u7zkEO02f8A4KR1T1xK5IYK8?=
 =?us-ascii?Q?WDZ3hy3eFBYuxml1Brjx9t7/Rp4tpImo0jnhC6dphxeSAK62s53ywezuRxVK?=
 =?us-ascii?Q?l4GfsLTDXpFtQjL1Cfv6FaPg7NqhI329f8cQ3TZkqlrvepvqveWy4Wz6wz4d?=
 =?us-ascii?Q?yQKnAIXXrEUg5zvEpbOdGUWwQZbuvckVseT2D9d9u/TFnut1NT5oHQTooBCp?=
 =?us-ascii?Q?IGXSZibYSoE3h3pK8OtIC0UOSurPBJwfOynv+9Q+k1xIFONbh0JEzaoq2jNm?=
 =?us-ascii?Q?kff78zUZ2JOeMF1UOlviPamZYuGRosaLVLsSVAIMwp1skVpGJ1ERlRlgwISt?=
 =?us-ascii?Q?HP7FmCKrTv7u/9EEqK4Mi5yoMMAj0hF6Wt9MpU1UEDh/yMuFiVa3NNW6Chio?=
 =?us-ascii?Q?lkN6G5sw5wUk4gO9j5VEYC/b965Df+FDhDCHG5+LKK5y0gItmFtewU3qtqxe?=
 =?us-ascii?Q?Kl7XIIbOxcdFiQh5I07ERmX1kW8KEYq+K6q0nmcnSEi4QQwhIZArJisuwhZy?=
 =?us-ascii?Q?KEuyyBK2nb172f8spFzgwLSVz5AQnGZxO5o7rJ/ws+ohTHKoAiyRblbOhiGm?=
 =?us-ascii?Q?MUB9BTa2tzdNAMGJdtG7fNWJK5lnmPnb73T87tj5zTqgl/gQL/wRwS7MLI82?=
 =?us-ascii?Q?fgKjGfBbbkA63PEBvTZHRHErAjrIK9fA7mJzm6o/N6hY4GGGKuC8nZWNmy7U?=
 =?us-ascii?Q?HcQNBvt4/hh8MgVKd4o+vo32/tBq7FoOGHghukMqRtL2z6487eYWtSngva3Q?=
 =?us-ascii?Q?e21WNvjWn3afjsn9T7Zck3KNBfmiQC3pfz1A2N0h2aZPX+GhPBNcNX+/v7pE?=
 =?us-ascii?Q?KOoxgKoFaswZcUHDSfuTkSjx+WdyqFcz5heFrCkLyKKOZnPbGuhYiRTdM9aS?=
 =?us-ascii?Q?PSZ7rpx0jblTzc2ZNL1CxdySyqlLUyva+vP2c11qhq2u2TBRUl7hW94ADzk3?=
 =?us-ascii?Q?CFC8ePEDf2b0A0OAhadReCOsx+e7rFE39kyzcnejJRkSwOTV9xLpxRPHJV0F?=
 =?us-ascii?Q?nE4mD3e0ARto9mu7sHkXhkgQiD04Ovc7y6dQh4XTPeH+0MdjuMj+mu21q1VY?=
 =?us-ascii?Q?iXz+dVxwgJJAbotc142NKuTXnMAXz1UK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 10:45:20.5947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c1037a-9424-4ff0-f7a1-08dcd8982898
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8919

This series contains fixes after doing some tests with DT overlay support in
Xen. I split the series so that each patch fixes a separate issue.

Michal Orzel (4):
  dt-overlay: Fix NULL pointer dereference
  device-tree: Remove __init from unflatten_dt_alloc()
  dt-overlay: Remove ASSERT_UNREACHABLE from add_nodes()
  dt-overlay: Support target-path being root node

 xen/common/device-tree/device-tree.c |  4 ++--
 xen/common/dt-overlay.c              | 27 ++++++++++++++++-----------
 2 files changed, 18 insertions(+), 13 deletions(-)

-- 
2.37.6



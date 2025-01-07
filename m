Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E9FA03B12
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 10:27:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866190.1277486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5s8-0006Wp-5C; Tue, 07 Jan 2025 09:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866190.1277486; Tue, 07 Jan 2025 09:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5s8-0006Ub-2L; Tue, 07 Jan 2025 09:27:36 +0000
Received: by outflank-mailman (input) for mailman id 866190;
 Tue, 07 Jan 2025 09:27:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FVI7=T7=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tV5s6-0006GX-CQ
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 09:27:34 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20613.outbound.protection.outlook.com
 [2a01:111:f403:200a::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e7e19ba-ccd9-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 10:27:32 +0100 (CET)
Received: from BY1P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::12)
 by PH7PR12MB5926.namprd12.prod.outlook.com (2603:10b6:510:1d9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 09:27:24 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::5d) by BY1P220CA0010.outlook.office365.com
 (2603:10b6:a03:59d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.18 via Frontend Transport; Tue,
 7 Jan 2025 09:27:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 09:27:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 03:27:22 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 03:27:22 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 7 Jan 2025 03:27:21 -0600
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
X-Inumbo-ID: 9e7e19ba-ccd9-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kz0mLgDPlB8BTI20qvcKEvx6D4TJU8bNXj2Yhjrpva7hjTjxIrS4Vj7C1z4RaEPBqPgGD8jdjvX7vrfKxl/eedzgDbOzlQX5MpGgH1H3xYiFCgPn2SS9oR5cskH1YVoRguiM9u6KzrDVpG5t11vQyYeIQihXClvUMMPFZO21fE9BvzQEiRJbQoTdYvlofaHMMGXZQIHWh5d20LDd1EraqWEeTKSIAXh1tmU/5txGrfb8NhWqNQFy8x110yLu7++38VCY/34aHCaIcUXUiMJpyO7pdZZJfcgk8bqhnvK0Qohn1aaeXLwtQ2LKmbmMivWfAT9k9AvLeCRBtc8PiWQ6xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zA11wOj5gZzVwCBIqPYpvQZoZdMx4eFFL4WzObr/tIE=;
 b=QH3YKzbirCufb8Bk9uJiYG1tRqn6qE7eqmahW8z3mFBHS3pcT04nwAS2wacXwaVm7CwXyLjuksFmshLM09k8LNkG14eTgN80G43I+ixEUJZDO3YJtZpaAoIa2fxwcVsUz4nuN+4cEvaW7RZaG3+Az9xcghB1i5kRCYxBPKd2VqyVih1QneL+dt3COCCBlDJi2YZ4GAlS+XTnfykpDUfS4W63bk4wlXVJCRect9sVDEGDWpfb8vQBa5EKV4Oc7nuDyO+pH9Ai4HWvvXUKYYG3Fg3i5qR3+FbNhoI6C1O9ID6vvFFLT2VdDLiIjneUOlq9tdxczKO77Jxx0oPIdwTRSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zA11wOj5gZzVwCBIqPYpvQZoZdMx4eFFL4WzObr/tIE=;
 b=dTU/Mj1qlcknu3JIfgr23mLfK60ZVupx5ir8TfndMWoUEQ0SA68Iy1rktdM+9ImrWjn42sy5SHC3GV5joULo2HHaicGWPd1WQTUOXI8kBUQahxo6rcFm7Oz0dt5m1NwpHEW4MheI9Axa5pH3bAEVg/I3p4RIbtlODY6U+1cj7r4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Anthony PERARD <anthony.perard@vates.tech>,
	<oleksii.kurochko@gmail.com>
Subject: [for-4.20][PATCH 0/3] xen/flask: Wire up missing hypercalls
Date: Tue, 7 Jan 2025 10:27:16 +0100
Message-ID: <20250107092719.26401-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|PH7PR12MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: 186cb170-621c-40e7-7032-08dd2efd7e5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F50fqFobckXtDGsfi/J3rJA0eUKvpKgG1ckeC6pHN0rwtQznCjFX4OWyY1O/?=
 =?us-ascii?Q?aXjq29h/7bbKB5Q3lnctC+hbO2paRfYBHs2qyjKUorTNc3+PZaxtUAXFd48t?=
 =?us-ascii?Q?SgXmi8YE20SJz25j3ACyUkYFYpfmSrIAetGgc3nnyUXqk4P3OuO3CFThjVNu?=
 =?us-ascii?Q?fXMD3VxbulqwGdg47f8+pKb+DGbKEA9D8jK644emmMOvLrDEdrMS0gnc34Gg?=
 =?us-ascii?Q?g7Cejtlcyrd4Jc2SWGaCJapkcrkeY90Vs+ikl7auy26iA/awy+LuxNC9E9zd?=
 =?us-ascii?Q?T/2ttXtJpYhBdLnQMWBot+y3gIoBEaqBIJKh+DL/MPFsAeDyevol8gNG9Lqn?=
 =?us-ascii?Q?geavYAZR3ekMBD9fbvtq2L0IfChopiKzjfC87gIIEQFXDIJ/yQm59rYZma70?=
 =?us-ascii?Q?LbsS63MK6VZPc7NzFbbOVbaZBRQLcDtmaHHOy5gZx0LzwTHUHP/zwZY+wtJo?=
 =?us-ascii?Q?a9rGNNoSpw5z/gd2oPI9Y3kbR1Vci2zymIw9XY1zBO7Lf7M9p+VOP0RjAVgx?=
 =?us-ascii?Q?oXyGhOe8FPV/Lk/7EHSSNd3ERofgbuBC/aHb3sQsU/1xVjXPPl0VNonu0EIG?=
 =?us-ascii?Q?wrq91oWccnc7s9muIgEIO5fvjSO/ElZrtclkrVUpKhUFPfGNH7q/VRHdqZoE?=
 =?us-ascii?Q?/VX7HAOi/F6Y11+z+nuiZ1SpKLcMG5Tn9qVzVdaaIYN9s//Fe33fikdvuxuV?=
 =?us-ascii?Q?XSz9Y62DAeult7RwD2qSvbsf6p9sJIaLrGgGCFLvmdfQ/TbivnvKNdbBxu9C?=
 =?us-ascii?Q?PF6PPusQVYJjXsWX74pA1p2jHTmrd39dNW1Fg0nQZqJsJ/mZMgi/7GrRBtlG?=
 =?us-ascii?Q?m1o9YFqN+uLELX97RwdopD2WTPScFzbP8Xq+XAPS3oFM5R0NRdb/TjEHCyQY?=
 =?us-ascii?Q?FsJXmlVXDTeCecbT5zh1yDBeAxdvHAHge2vX/6ifWVC8ul/XyNbNkZCQT4TH?=
 =?us-ascii?Q?Yiqfq8PkieyBj6GNfDt9Xao7cK0HAilPAORylQjp39v4WNwRVpLQIkg4/fKz?=
 =?us-ascii?Q?xwXKAwzpZqZVobKYOunlgLeE4lNUwzXJdlbXCFD2VubAdaA4ywqcLZsKPwXX?=
 =?us-ascii?Q?Ug/KEiGA5+o8lqYhA6CWHQwJ9t42JiclUC3GyMfmiY3HOA3ThFpy5Ru9RNGG?=
 =?us-ascii?Q?Aw96eVIhv+gciKhWVI9nLqbew+KfzRrynO5l9F6v4o2fy49D+2PZsxGK5Vtv?=
 =?us-ascii?Q?5D6vMZe7cTXgnN5ZavZDEKjVy6VWvW0qwpmtsbOGFgBpkpmyG8GoRwV3Wzlo?=
 =?us-ascii?Q?PPdtBXfvgdgYcQQ2xDS2DMZMFdQ5a8Xvy6VA41ASXjkuV2ylnQM25/cBO1Eo?=
 =?us-ascii?Q?S64TQxxnegtOVPQjmnaIAJ/6DtEY1WXsPGu4Ua6CVKzVusOyJQK87VMdrgUR?=
 =?us-ascii?Q?KfnhkSGPjypBeyBc4zlXf+TKl1VNuZsKQLMO7sNCziYyJM67wwaTLlv3J9wq?=
 =?us-ascii?Q?1Ln+I3c+anLmJqWfwDQDU5CT1MovX7vmbYiqJrzuef3kCHZnHt0kHb1AjLDW?=
 =?us-ascii?Q?3x08fdpX2P+uZ7s=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 09:27:23.6506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 186cb170-621c-40e7-7032-08dd2efd7e5c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5926

It's been noted by Juergen that recently added XEN_DOMCTL_set_llc_colors
is not wired up in FLASK. While preparing a fix, I noticed two other Arm
hypercalls from the past that were missing the linking as well. These two
are latent bugs while the LLC one is a release blocker for 4.20.

Michal Orzel (3):
  xen/flask: Wire up XEN_DOMCTL_vuart_op
  xen/flask: Wire up XEN_DOMCTL_dt_overlay
  xen/flask: Wire up XEN_DOMCTL_set_llc_colors

 tools/flask/policy/modules/dom0.te  | 2 +-
 tools/flask/policy/modules/xen.if   | 4 ++--
 xen/xsm/flask/hooks.c               | 9 +++++++++
 xen/xsm/flask/policy/access_vectors | 6 ++++++
 4 files changed, 18 insertions(+), 3 deletions(-)

-- 
2.25.1



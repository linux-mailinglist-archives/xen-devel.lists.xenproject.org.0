Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CADFAD25AA
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jun 2025 20:35:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010404.1388509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOhKe-0004KI-Ie; Mon, 09 Jun 2025 18:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010404.1388509; Mon, 09 Jun 2025 18:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOhKe-0004HB-FV; Mon, 09 Jun 2025 18:34:52 +0000
Received: by outflank-mailman (input) for mailman id 1010404;
 Mon, 09 Jun 2025 18:34:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7/lO=YY=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uOhKc-0004H5-G8
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 18:34:50 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2412::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b8d3b70-4560-11f0-a305-13f23c93f187;
 Mon, 09 Jun 2025 20:34:48 +0200 (CEST)
Received: from MW4PR03CA0358.namprd03.prod.outlook.com (2603:10b6:303:dc::33)
 by DM6PR12MB4356.namprd12.prod.outlook.com (2603:10b6:5:2aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.36; Mon, 9 Jun
 2025 18:34:44 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::a) by MW4PR03CA0358.outlook.office365.com
 (2603:10b6:303:dc::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Mon,
 9 Jun 2025 18:34:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 18:34:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 13:34:42 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 9 Jun 2025 13:34:41 -0500
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
X-Inumbo-ID: 6b8d3b70-4560-11f0-a305-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JnyUJuqB+++2Q5Kh1ZM+HXFTXR7m7OWcwNM77gZ/uZ5iR+kjbOFRuXAXfFN/n6smcW2hIAkSLT2simVRSVDSAvR4ma+s8KZKASkO8HXCgkylFqetvPNXVKKv7DmtgfksW//3LXUjLqLTPHk451L3AO6uycfO53hQzzKCO6JgqErdF+l1EepT74GQorXqvaVXktZBJRZIaMdRnQAQZDy4Eb4d0WPHiPqZRtuWPx5QMv6BfkTCyv7g8d7sZf8VZMZotQjOhVNzGXF9bJ/0QaZNEj6W8PMMS0v3NKLy0IHNZncY1hRBrgBA7mjiyz4FToBIPehs6fNFFGkD2E5maVz5OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fL1f4/8f25nFmIj75IpfJ3ScV+q0xaoS4/WYxH/aDGg=;
 b=bU0Wi5VTKTJNW/6M89xkPxpHE8pbwdANEASdCf9z/wMqRpYHUYT80XHVJNIN35mKkcRMdKGuihvaDHBN7W0+AroFCzQfR0oRsMY5Cn3ki1rDXseJmpHkLdMd+NKEND92mp7ppSndhDL5BOjKEABq8W1a6/cKvtDFaHlbxqngrvegYyEShi5JQw1LXfAfEgkfbtMd3az0IdOozqEoEsIbBxpsJ7K4nKoI478LHzsTgl4nqZcbllGGdsur3GQaKAitOCz3YJoaHLJg2K30fCQf1xk+I1Xcpq199HYsp2Oh01yvuyMDl5HgYqDlCNmAgDWOBxF5i8rmDFf8UI1ioc9tuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fL1f4/8f25nFmIj75IpfJ3ScV+q0xaoS4/WYxH/aDGg=;
 b=fA03eioRCyj2srIHwlVanuVDdGCT05Cahuq4XaGcNOvB6IXxOBwMtELrfymOIsOCa9/Y0TFveXkfOdBD8BkwpmUuE7cEuZpGEMPVc35SY9LovXgIiAqz3ZIn4juAZwXN9FY0XClUN1JrnKVoPdU1Y9qsCRKatbPyCIVXZsN6kx8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 0/2] arm: extended regions fixes
Date: Mon, 9 Jun 2025 14:34:31 -0400
Message-ID: <20250609183438.178214-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|DM6PR12MB4356:EE_
X-MS-Office365-Filtering-Correlation-Id: 72adae3a-1596-458c-3284-08dda7844d68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3n8nElrbcOvqTMnWGjyQx+h7fWYGnZFcPyPKk9mmWNcUSiJaSnahPg28Gzps?=
 =?us-ascii?Q?re7mosp3+DQibxktSm8nELmPa49NE2AkkDqQxfGnQYLsutzWbQFhiErSQuXf?=
 =?us-ascii?Q?lxyaE8B48Mo1yha0GLgYgaCcRGFDOiUiWEgzF6eZA0sqVoYRpWBejj5W/DxD?=
 =?us-ascii?Q?L+e9HOeB9w4s2YlmzzLHroGnBo3+e7sTRp9tqWU1Uhv8vMfKvmd5TQs4I8FH?=
 =?us-ascii?Q?xw3WBq1/qtI98iIeSJxW4WZjQEy9Pvb7ahh8EvolmMX/a1FnMCMA0BoVwZ5v?=
 =?us-ascii?Q?uY/2NGnjwqqo8RCzZpaMHB/dAa/xtrpv0Q7gNdbsmLG2dh7ftQePDfrygtHk?=
 =?us-ascii?Q?+DGPvzPy/ZBp6BoxzopFjTDCSj2qVHeihNz7XmPVldZzbFdTWA7fHUNvOBmQ?=
 =?us-ascii?Q?YAh7Oew6F7Bizw8WUZI1AeBcRaPWUyFUQ+TAsR0/FHrVCJQOvNAwGBsrJq7y?=
 =?us-ascii?Q?hivplh5E5H8kaQh5OEoVMz/k2uXZdYBFk4tgIughlPdcQysJM3U5uDMFY3mF?=
 =?us-ascii?Q?QiH7lIigGh2+QqWWgNLqPrzskJDto8iWrrNtawSI7cmxo1gln6wSD/dL1zlS?=
 =?us-ascii?Q?Tf1QKMirSNKivk6YdqLzdDw0VtBnE4OsFqQG0ZmSPAKaR4QAbDAcXQVM2fVJ?=
 =?us-ascii?Q?Jb1v3EGkhEmNftxdrb56RqTQYTzmGBb1dRGFprcD+VpUHVGu7j/BYpfEt/5r?=
 =?us-ascii?Q?kb9FRHO8I6p+NiiiYoQmFvREtgwDV/cJv4YkoG0xUHNuRAXTeHNuIb+zNJmc?=
 =?us-ascii?Q?21p00tGj8ItRtuDF+8woWETCgbYkdewinYn2C6GJxPQCkJJ7vQMy1cBiBnTT?=
 =?us-ascii?Q?Fz0z/39bzxDDCMK1OIX3bTlp0GEcr0H1SmTcDmjQlyeaHqzfjzNBwbMvzM5P?=
 =?us-ascii?Q?k0/CwPvIopI0e1kFPTfNU5nC9twqQzmC1RIrvxSCwHYpGir1vqD0u43cm6Vi?=
 =?us-ascii?Q?5/ZwuX73LRMscQc1vf/vJvCOYPukv9FpeEuJV85yb/UUNpqPsh03U/QKesln?=
 =?us-ascii?Q?4pud9TLMISdZXUuxV2Dd/C1voTEVG13VXHeQt4XKB6lV1iidYd4WcflgPMBJ?=
 =?us-ascii?Q?LSrU8qSKBolUwOiE9shlk0bg/UDUmSOYjgI5zg4gvdY3rc5DJf25z3/c+pfA?=
 =?us-ascii?Q?J4uw6ChlQmFyt5F7PocshDaWqq1Jd1DnH4v2jJhDa4r9NXpyeHIs/skvhGqR?=
 =?us-ascii?Q?1CCtD00EFQ2IZGhJQVJlCUdO4GN7/K0xX8rrwPuFUe9RRJTzo7+OCtrJzjvL?=
 =?us-ascii?Q?mfG5TyOoZi6S8BZu0b/EkSkEe4+CfbNjxezl1Yu4emYC/TD7aYZ6Qzh/g8Ff?=
 =?us-ascii?Q?ExPOTGeHQjkLcWHy4DE+wYS+q+cNH8IUrFaSS4RPoWx8Qf8QS5wE12XIyVL3?=
 =?us-ascii?Q?zs1kPFZzhQx6eCz8WT3ZxroOxEzSgOstLbXySL7CJHvpVzYrXBDtMJ1DHZF/?=
 =?us-ascii?Q?F3Zk9yOajdQhx9cznjOVsUZ38kFl8AidOTTym5jLAIkYexAWKdjYort8WIUO?=
 =?us-ascii?Q?CVLea3+TGqPw4RsXVTI43XFpdmMlOB7KJnYZ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 18:34:43.1182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72adae3a-1596-458c-3284-08dda7844d68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4356

v3->v4:
* see individual patches

v2->v3:
* drop committed patches
* add ("xen/arm: exclude xen,reg from direct-map domU extended regions")

v1->v2:
* rebase
* address feedback

Stewart Hildebrand (2):
  xen/arm: exclude xen,reg from direct-map domU extended regions
  tools/arm: exclude iomem from domU extended regions

 tools/libs/light/libxl_arm.c          | 110 +++++++++++++++++++++-----
 xen/arch/arm/domain_build.c           |  77 ++++++++++++++++--
 xen/common/device-tree/domain-build.c |   5 ++
 3 files changed, 168 insertions(+), 24 deletions(-)


base-commit: 86a12671c5d33063b6f958bdcca7c9d14cd5aac8
-- 
2.49.0



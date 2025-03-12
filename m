Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC71A5DA4C
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 11:16:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910189.1316950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsJ8r-00024g-0D; Wed, 12 Mar 2025 10:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910189.1316950; Wed, 12 Mar 2025 10:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsJ8q-000238-T3; Wed, 12 Mar 2025 10:16:48 +0000
Received: by outflank-mailman (input) for mailman id 910189;
 Wed, 12 Mar 2025 10:16:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qnRX=V7=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tsJ8p-0001og-Jt
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 10:16:47 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20619.outbound.protection.outlook.com
 [2a01:111:f403:2413::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19729e59-ff2b-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 11:16:46 +0100 (CET)
Received: from MW4PR04CA0213.namprd04.prod.outlook.com (2603:10b6:303:87::8)
 by DS0PR12MB7801.namprd12.prod.outlook.com (2603:10b6:8:140::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 10:16:42 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:303:87:cafe::45) by MW4PR04CA0213.outlook.office365.com
 (2603:10b6:303:87::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.21 via Frontend Transport; Wed,
 12 Mar 2025 10:16:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 10:16:41 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Mar
 2025 05:16:40 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Mar
 2025 05:16:39 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 12 Mar 2025 05:16:39 -0500
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
X-Inumbo-ID: 19729e59-ff2b-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PU1T0C5gfHJDLke44ZRarJ1jiOLsjkbEEpp3V2urGfBE36v+qd8tWU1LEvZ/JzmPexICRjpLBB8gURFG3uO8x2yjkn+BYAwOQ4Y6viTLBzuFN3Ojk9LuSbZT3qnQjCueanfVJdLU8Brs7IO23YcwebZ2rdfYrX4e9nE21kQ73PycdLJqJ0QKxKb2FlGi3xg2+O9oZ70jpdBeJ+pWWnaGKLZ0AEQaEkOBpDaEbWR8TZBsUWqW9Yth9o3OkzbhlBuYIy8bV6+/tIv1FHnJ/tEfycaRevlSDRQnXmzazePUP0/L+S9iDD7XVPrMNJlJid8whGGdc92FAXpo57Adpb+zCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5unY60UllShS4fHki6ipXQaxRzk+8Bdb3SI1EP+Zams=;
 b=hZRPj57+kFzZ0Q6b2sOwkAuV3/uet+p115kpIqDPx2FMhKEDwwR8nxQaIoD+PP0fn4Wl6uoOByv6PTosccjBqiUKmdViZjb5CoW/kiL5gyO2NzylYEa8Ezh1TcyDHBj2y0bg8+XRS3DSCNmVddX052tgMJQSfKzGXSAH6c9p6j/DRrFzkEoKrb0klZp66rmhqIrcnXDaCY3yzCZsS0flQRMukA9B08XeHz7NvROTO0qAOzlHt20Ypp6tFyTCjUI2rPxNItTVZHaxokqyh6M9kI0uYMogsPDtg4McGeTNIq2tIr/JD7CdqNh2CpZbfM2mrRn5v/w+3dsncSVE5wtgrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5unY60UllShS4fHki6ipXQaxRzk+8Bdb3SI1EP+Zams=;
 b=pNr5zCSbGIPmdXdPjaOBE3jcdSDRbQQ7zmJRH57DzXt6h8KrBNOjUVxdLUFkomW0vRDWUF1VzRmM8WSdjZ8KYImddKx85SxrY5fXpFWTlaWcwops4K1fm0RQUvWj2YvsnNdL2xILTmTDDWETFRmjqhPosTxp3wKiXLD5Ocfn9sA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v2 2/2] tools/arm: Reject configuration with incorrect nr_spis value
Date: Wed, 12 Mar 2025 11:16:19 +0100
Message-ID: <20250312101619.327391-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250312101619.327391-1-michal.orzel@amd.com>
References: <20250312101619.327391-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|DS0PR12MB7801:EE_
X-MS-Office365-Filtering-Correlation-Id: ae8ca0a8-011f-413c-8ab5-08dd614efbf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RjARUbn3ZLzLcDExq6F5lb/7pMoj9Wm0DaYhc5tKAKSwA0EekeFoGNJxPMFd?=
 =?us-ascii?Q?+Y2hlQoo+Qb0ZneJ27PtBMgGQLVHlFg8IBDlWdbCKd/2J6NTQHo71hgrIYkl?=
 =?us-ascii?Q?QT5Rgoq6UIvOvu2vjhuYbl0LzdizctrTAx7URoNKlyg+foOLNpT1LJ7qoOwA?=
 =?us-ascii?Q?RkwmP1hUqoRrhVTMl/g+Xu6X8E/Ts5uVfLdKUpOdz0UyaHZplhm8DwJ8jSOp?=
 =?us-ascii?Q?mirmRJzeiXm7r+c7oaPounLbme7l/rjNW1oKCttlT6KrzoU9aO5sPK3CNw+f?=
 =?us-ascii?Q?i00SOCtoG6hurF1BKSs4HK1ligvH21nQ7a7QudDFfK8YfqYlcpydbNTYum1U?=
 =?us-ascii?Q?GGDVhM+lidpuJw5nbtU9AmBfZrpv9BsJcTiwUsqFie7Zc/P3AXVfhucxvfRx?=
 =?us-ascii?Q?smHWExsuIuVXn7zm4hguK34kQkGFaMsko3rRDh/a88RJxVG90cAYXpMqgTOE?=
 =?us-ascii?Q?ho4IMVHXeUX994i3JHaMxcVm9LmKuyXYyYT9oiHHrwd1Fqi8erui+bCAOfpI?=
 =?us-ascii?Q?CqORunIwHCSsaj9dj1kwzRbbD9cBZlfajISU5TMNmj835TLW7trjxEx9POBs?=
 =?us-ascii?Q?qaU362estr1bfXRwJ/Sf8aGTBX6gVg4pNOqeOkWRxhpJoTQaGNHphKkW6i2+?=
 =?us-ascii?Q?cE7tCXtXizCZQKioiQLmVzPY9rZ5m5yUyUF4Au4Q9bmWA3Lm9UTrxAc0lOct?=
 =?us-ascii?Q?5ILZfz9PiJS+6XspqGgj2gfgVudUCQ9ARVcQeRp2GtHqWVyPFnDk+bKAQA2u?=
 =?us-ascii?Q?V89mLcIAhbvNUzmNYT5Y81ngU+PNKRpwvFRXypysZ74E5NFf8imeOg6s88Ej?=
 =?us-ascii?Q?GahnwW/LUv1dlTBGb+y4CZiJ08rtPXkk3IpIg8ik2jfELirAkhFI2rXjaQgr?=
 =?us-ascii?Q?SG7LhzaEjF/7giXrQeBL8APzsULW7e3cTA+QtldfDpa8R3hVHffKNuRZAjbo?=
 =?us-ascii?Q?ISo7BIjs/hIbgKdp+03CvS7ap7bhK9s8K45H2IQ081EDyP1F5tTLr0jDwTQM?=
 =?us-ascii?Q?IkY3wZOd+G7Qg4cE2pUPvoRWMVY4P+yJxW4gOG6j5ELronzfTPI973wMUbZF?=
 =?us-ascii?Q?PwEpTwAMtxQ7V6basG+bZP0I5HvGsazAFhuMxJlvo43+tUwuULeSYIOheVbP?=
 =?us-ascii?Q?UGNRqofuiOkcnfV2L+Fy5+mjUW/YsrUrCwayQvGb1lQgdSr2XogKQOXNZJeF?=
 =?us-ascii?Q?34SHUO3uu+Rt4eo1KZVnnws9M8Z27APCpv7s48P/kxcEEWqbUtNYv5lzwXAJ?=
 =?us-ascii?Q?7f4uJk4u4JaY/ucCrgK4Je5T+uEPiNt6uu7xUb3BkBJ+AA+tnrcyRbjuuqcB?=
 =?us-ascii?Q?LADq/3XyMILf8IIQoP66moLduU0mXp7KJltE8PjGWLxKanqCs9BGyrqcwvXq?=
 =?us-ascii?Q?RuOYajEg1iY3FBZ6lZMa/y8VcuTPCUyQuljFCvhq6WdrZ+9FDnbZdSJrCZKn?=
 =?us-ascii?Q?SMjhZispaLwi6DrfpX742AcHjeMFZMnb2+rLJgaHPT+rY4FaTxr/3mHa3rGu?=
 =?us-ascii?Q?UCPta/ifesDjxq8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 10:16:41.7366
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8ca0a8-011f-413c-8ab5-08dd614efbf4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7801

If the calculated value for nr_spis by the toolstack is bigger than the
value provided by the user, we silently ignore the latter. This is not
consistent with the approach we have in Xen on Arm when we try to reject
incorrect configuration. Also, the documentation for nr_spis is
incorrect as it mentions 991 as the number of max SPIs, where it should
be 960 i.e. (1020 - 32) rounded down to the nearest multiple of 32.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v2:
 - s/required/minimum required/
---
 docs/man/xl.cfg.5.pod.in     | 13 +++++--------
 tools/libs/light/libxl_arm.c |  6 ++++++
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 8e1422104e50..7339c44efd54 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3083,14 +3083,11 @@ interval of colors (such as "0-4").
 =item B<nr_spis="NR_SPIS">
 
 An optional integer parameter specifying the number of SPIs (Shared
-Peripheral Interrupts) to allocate for the domain. Max is 991 SPIs. If
-the value specified by the `nr_spis` parameter is smaller than the
-number of SPIs calculated by the toolstack based on the devices
-allocated for the domain, or the `nr_spis` parameter is not specified,
-the value calculated by the toolstack will be used for the domain.
-Otherwise, the value specified by the `nr_spis` parameter will be used.
-The number of SPIs should match the highest interrupt ID that will be
-assigned to the domain.
+Peripheral Interrupts) to allocate for the domain. Max is 960 SPIs. If
+the `nr_spis` parameter is not specified, the value calculated by the toolstack
+will be used for the domain. Otherwise, the value specified by the `nr_spis`
+parameter will be used. The number of SPIs should match the highest interrupt
+ID that will be assigned to the domain.
 
 =back
 
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 5a9db5e85f6f..2d895408cac3 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -181,6 +181,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
 
     LOG(DEBUG, "Configure the domain");
 
+    if (nr_spis > d_config->b_info.arch_arm.nr_spis) {
+        LOG(ERROR, "Provided nr_spis value is too small (minimum required %u)\n",
+            nr_spis);
+        return ERROR_FAIL;
+    }
+
     config->arch.nr_spis = max(nr_spis, d_config->b_info.arch_arm.nr_spis);
     LOG(DEBUG, " - Allocate %u SPIs", config->arch.nr_spis);
 
-- 
2.25.1



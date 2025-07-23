Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B123B0F843
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 18:38:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054529.1423298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uecTi-0001JD-S3; Wed, 23 Jul 2025 16:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054529.1423298; Wed, 23 Jul 2025 16:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uecTi-0001Gs-Ow; Wed, 23 Jul 2025 16:38:02 +0000
Received: by outflank-mailman (input) for mailman id 1054529;
 Wed, 23 Jul 2025 16:38:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3I4v=2E=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uecTh-0001Gm-By
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 16:38:01 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20605.outbound.protection.outlook.com
 [2a01:111:f403:2417::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62cc707e-67e3-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 18:37:58 +0200 (CEST)
Received: from CH2PR07CA0038.namprd07.prod.outlook.com (2603:10b6:610:5b::12)
 by DS0PR12MB8069.namprd12.prod.outlook.com (2603:10b6:8:f0::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.21; Wed, 23 Jul 2025 16:37:53 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::4e) by CH2PR07CA0038.outlook.office365.com
 (2603:10b6:610:5b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Wed,
 23 Jul 2025 16:37:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 16:37:53 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 11:37:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 11:37:51 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Jul 2025 11:37:50 -0500
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
X-Inumbo-ID: 62cc707e-67e3-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNVR2eSWy4qN1hhbNZeORLzW5deiF+a4dG8/myeXv0UDcIREQZr+d9AoOIQMnQRbJHopGMS+hb2AcymXdKBv1OqIYQF1cLHYSVu8VjUUFoUvviVid004BI4Dm8IkRnvCzTlyoBg0hYqBN/1nvNoQXw8uMyYxCLj2085MwJN/j6XXC33Xu1+VHskIuDu9xSlQi93uFcvRqwKwZciCc1aaL+wYaEQp6vRpsSob+gE8ntGxVcOzUYul0W01CGPyCJ4E+peM8TCqpYKeZpj/Uw5tsg86+xUFyYhKYEKUmBtUF1Af4+gS9OXSa72MhfG4PhoeJ4GlEvDnnRFKl4NEavKulA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPFrvNbmp7KSar5eGPiNbcZZoHVxlKHvodJ1yaE5j0Q=;
 b=oxwF/+lTHbKeSZrLX0agTv2DzFSeDoqu6PGRbyZVijziJi/E3Y5LmYfRKRpukYaran20iclmLrgh3yn215rpWfhV4XzIRx6+l9nSiJjjskw05CMrjl0vkTH+JS9cUfz+nB597oqcjSr/aOkWJIiOYSSDKUcsGMZ1iAWj5xNuNPSNV5R9oiYjGRqgbcYlrxVCFEp6fIY1vC6fsEnP29YE4OQClEj6/veGvTFqqEO9DJK5Q5VtOEzI1+M/hgIWi1+VHHJoYg0J0gE3dE48ojW970P6GUeYwo3RQD1NFVCtMz/yhmOrTj9Ck7krVKAuPNwVcLLD24MK2ayJ2wAJjtNN6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPFrvNbmp7KSar5eGPiNbcZZoHVxlKHvodJ1yaE5j0Q=;
 b=30TIBz6PUYj1awnLWpDbE+PJdk5GRFePLBZlZ2VDhOjWz/fsvcil3rpxEiyJ/m8CJvE5Wit+b6UvVFnvh8/4/Az3RE1EfSG88xizIDMUBicfgkYeBrMTyEZnqt6w81FE8lH++pVSvgEdyvF4JJDp+LilH/edizY5S24DIfQSab4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/3] vpci: allow 32-bit BAR writes with memory decoding enabled
Date: Wed, 23 Jul 2025 12:37:40 -0400
Message-ID: <20250723163744.13095-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|DS0PR12MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: 6765d894-1470-493d-9410-08ddca07454a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Pvv6o7Ptluv0mrQXcv9sBnSWtp4UkafpXqM3w3crvQfAm08pa0r7BtV0u+CV?=
 =?us-ascii?Q?VHoLddE2M/3KenCMYKM/CiwySdEQHmGjc1aBZPfV+IjxnT5e7a6P6NyIWAdB?=
 =?us-ascii?Q?g0Kgl09vEYziIJZXPw04hhU7qjg8R9yI+0ScWLXgGCEPfM1OuXRcW737ThUu?=
 =?us-ascii?Q?NYghKezcXO5q3rmwr2YPTWzVmvDgEkLRhMudLmwiWmxPDigO2mv5zs1tXXWL?=
 =?us-ascii?Q?dlTHgvF5qp6/BbGuAVSrf88mop72/X+O5eockWM+toBkVMZasMJ/5c+sR4ue?=
 =?us-ascii?Q?4QFmjd4KLBgdvUrdNBWWMc7C0wlkjPL8kS97SIxQxi+zx04iHt7rPsUPSUlq?=
 =?us-ascii?Q?qnei73ZHEZVcXRGEtwZ1suydLEMB0qgIeu89r6C2apbw1d1TQeuddJbQZAKC?=
 =?us-ascii?Q?u4R4ZJG2Ksl8eegADqUKacE66JmnKyeem5INYTpI1yIOaQk49ufOIuQ0LGva?=
 =?us-ascii?Q?AL59TuRvywOdz1UAa9/Ww8qKj1s0GEXzEx0vndPSVxb/ncCkG2TNIY6cuHaH?=
 =?us-ascii?Q?i5sx9pdNRSG7PnN7cHDZ7fPnSWDRLy61AOYmjNdJY494z2vpt0o9bVE51NA/?=
 =?us-ascii?Q?MOI3KvPrRvTZdoMNDOXSP5PCNqHCU9TGUaHgYU76aJ3gjgHP4j50Q93l2Dle?=
 =?us-ascii?Q?8I5VrkbBAJIO3h0zEWfJyPNdskTYlPuww8jKOs2oCwD/jwhbUpi92Spba+aJ?=
 =?us-ascii?Q?ZDUNYngJVAbQFp5lXrGUoUefqW+m3J9G5AHavG8S6uVnCABZbAyEKediB8AX?=
 =?us-ascii?Q?Z+9gIAf+/F4yXaNd4gMjAkn3Plsm4DxC3oQdM4RatVdL0c1W/1KpilVwFRuf?=
 =?us-ascii?Q?j89YqSLvTS+sSSiEqogCkINxGSm3g2Cyjuga6zWGsUDfduM0819DksfhjXks?=
 =?us-ascii?Q?x31BjXmO4Kno+TXzgxZW53n1t4hnvuQSlCb5rrxJ2sDUKQVSv0kgYmfMMjwA?=
 =?us-ascii?Q?w7ootQXwx3m/H0s9jDdoKXKcOfdJewiFJcPiJ+rVgSdZ0HfglsHa+tmvHNp+?=
 =?us-ascii?Q?4Cs8sFt1Et4f2O/0/qLvFQwAZl2ibrYjWWTk463kKI9/pQSRrjEfKdEHBQBC?=
 =?us-ascii?Q?MJY5GfI0sqB7andrxGrJjnByKvqfUFW9iN5soD0/ktR5Qw9aEWTdxxkMMcUW?=
 =?us-ascii?Q?mivUmNefCK7ZjrhwIyRQp0gRXBdb8C9qc2K8jXTO4Lm6BZIta9A34T8cjw7u?=
 =?us-ascii?Q?uBLG9hhAp7pBxKFNCKZC87hCV3romDssHw5CMM98RzUiR+UmGF1ChbpSlYiv?=
 =?us-ascii?Q?BwCqjek1u5doq+zUn6QQOMUj3K3Lxrn821bIUh3e+7bfUcDuNuhC5Twho22Q?=
 =?us-ascii?Q?J+Qc05L1Pin8iV/ejqToyK5uHyAr5KwoMxKcmxQvK69hdvSyALK0KmyMWlJ7?=
 =?us-ascii?Q?lGWfru6BDLqRRLuhe+OK6jQ1PAXKOAqja9sb4HeKGt/6HX/2MTAK6/wsTEBQ?=
 =?us-ascii?Q?F+/9R7FqdIJ12qsri96YEkPQ2F4bdHd63ZUoAxRpcxiWQWEb9GeWmW1opNqr?=
 =?us-ascii?Q?kdjYL8EREZyb24gmRgdssjVfxYpX5KZjUdOdzJJvpwl4V8n24HmmphXb2Q?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 16:37:53.2042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6765d894-1470-493d-9410-08ddca07454a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8069

Pipeline: https://gitlab.com/xen-project/people/stewarthildebrand/xen/-/pipelines/1944094764

v1->v2:
* new approach with queued p2m operations

RFC->v1:
* rework BAR mapping machinery to support unmap-then-map operation

Stewart Hildebrand (3):
  vpci: allow queueing of mapping operations
  vpci: allow BAR map/unmap without affecting memory decoding bit
  vpci: allow 32-bit BAR writes with memory decoding enabled

 xen/common/domain.c       |   4 +
 xen/drivers/vpci/header.c | 249 ++++++++++++++++++++++++--------------
 xen/drivers/vpci/vpci.c   |   3 -
 xen/include/xen/vpci.h    |  20 ++-
 4 files changed, 179 insertions(+), 97 deletions(-)


base-commit: 5c798ac8854af3528a78ca5a622c9ea68399809b
-- 
2.50.1



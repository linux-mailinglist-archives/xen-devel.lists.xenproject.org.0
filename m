Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9652B524C6
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 01:41:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118945.1464546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwUQL-0004oT-D3; Wed, 10 Sep 2025 23:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118945.1464546; Wed, 10 Sep 2025 23:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwUQL-0004mV-9n; Wed, 10 Sep 2025 23:40:25 +0000
Received: by outflank-mailman (input) for mailman id 1118945;
 Wed, 10 Sep 2025 23:40:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1IrW=3V=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1uwUQK-0003qA-4O
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 23:40:24 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20617.outbound.protection.outlook.com
 [2a01:111:f403:2413::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83de0bbb-8e9f-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 01:40:22 +0200 (CEST)
Received: from SJ0PR13CA0212.namprd13.prod.outlook.com (2603:10b6:a03:2c1::7)
 by IA0PR12MB8696.namprd12.prod.outlook.com (2603:10b6:208:48f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 23:40:17 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::68) by SJ0PR13CA0212.outlook.office365.com
 (2603:10b6:a03:2c1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.6 via Frontend Transport; Wed,
 10 Sep 2025 23:40:16 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 23:40:15 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Sep
 2025 16:40:13 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Sep
 2025 16:40:12 -0700
Received: from xsjvictlira50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Sep 2025 16:40:12 -0700
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
X-Inumbo-ID: 83de0bbb-8e9f-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vq87AHm+TLSXR6RTPQRcOuuNQydcXgID9TXIKtukqlrLr1SOEkITG0URqclAJ2zn48g1jezvx8G+4XzGo9uaaig0fUT2IgW7IAqCxsKsQR/zBvFTXWvcLf0lfopjUs4hbtEp7d0sAmmBeUTAXKxOrh6ufY2JAxkJraJd+OL33C2NTkfhN8n7uvSOOQswsR+pHoyP/zMedTa24BtSrAjFuHdeHJMC9+L06U/eN+STjWlU/skiAcXJ7tcuKvkCCTiL9T7my3kKGCtLwbPssDf15sPVVOzatE3td5igSoxQwrG2KMk8egJcKrFMt9SieNkjCmWRfSFdfv5CbVmTlDJ2WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywd4+98JNVWn5LlquwViQkCbOtL4x1Nk8xfenPNoMXs=;
 b=WzckdDXhbPy/horpvlCWctXE04sL50QB0kAlhCav4D+Urqz3qOV6KIARTi+nnxTzow/AaT+tglg6Yukt+vl67x+Vtdh+tfKdwd3RIBJXnVxlbZnwvAUfKW8FrRLJaray9zwaa7PEEwLU7NtBq1ObN6a3DTw3Sn/j3xlgW8HxV/crGvfgD3J+QWfBP+SXL0TAGvXRdP+AvB/rRPjxREjiTPmopK1QqZZlfNM7JHpl6riA8Ja5jxeu2JsVtWXVQtD39T/UGkuOGVhYFu7cfmBzzLpHtTfjyf5onKG3pTVAQOYxmvxe91VShfgGOt8JNsZIcEpns3mzXREwcVxM6bepzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywd4+98JNVWn5LlquwViQkCbOtL4x1Nk8xfenPNoMXs=;
 b=ZFJcNzSBHtHKQ809GH/WJgToK5kkpAiObZEtET5+oqw0Kd7d/XOUkUwG0kPq6lDA9QXY78WGthy70GA+cV9ARMO1mBS9E0IMOpT+21epaXdUHFeEyl2AbR2TxB1sG84umlx/KNCuz63HRhsfHKk2Uv9zDSbFGWQSiSObi68SBT0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1] coverage: add missing include for macro
Date: Wed, 10 Sep 2025 16:40:02 -0700
Message-ID: <ae1c963aa985694967ca7ba87929b2a66dcfd8bd.1757545904.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.50.GIT
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|IA0PR12MB8696:EE_
X-MS-Office365-Filtering-Correlation-Id: f59560b8-0ad3-4857-f94f-08ddf0c364e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sVtTsHYYZUsT6jpUFu88i8sNhGOBKBdBurwgCM9Cb3guzWftETAAF4apy5M8?=
 =?us-ascii?Q?zb9V+FehRT4iV+i41+GiJV8NPumMLQJhvjTM/cyaJxpAeoTiwed4jEbkDfuE?=
 =?us-ascii?Q?0i8C/IEgb6ZyEYIb00kCcdISbvs7BA3PPvOspZQIxsoSHEHsaH9oe+SWcukC?=
 =?us-ascii?Q?unRu3qNUcTCld9U/4j2XpaTpCYnpKIxG3c2hckEEc5iJcSwI3qLJhaCCrK5F?=
 =?us-ascii?Q?3V15SiVmElff/BWiC7N/3NaY8MA/l5jUVjpOdyyDWZixWymcQdpR/MNXNh6S?=
 =?us-ascii?Q?golr15E3McZg8shRn5jYHHFdFcmrR2VkpM2WXARYxk+spyq2XBhLR6Y6c/Oh?=
 =?us-ascii?Q?/mzhqw9/QXekMQ5t+6G2ZGDePNp8LOv4YduPTTFMf9AkQIXtvJXXBzotQK5b?=
 =?us-ascii?Q?EagQuufickrWo74cmJqNJh+Mkdi55pVBgbjepXVoRNyFdJvaLQ9Vpv8IQVs7?=
 =?us-ascii?Q?wkX5wG1XMfh8i9b05tseN4tKJ3CIp53caA6YGRgTolsgWGqrT8u5hT74NDRG?=
 =?us-ascii?Q?SsFSttccDbkEzuhWCptt6TzikMG2OBmU4H+Vbp6zHsV/mghH1OKtaTwWRpk5?=
 =?us-ascii?Q?9GLaviUkkJmpNpPNmhUmadjh12CiImve0gvrr2qUoa4i5yTm1nyZsCZ1g0CN?=
 =?us-ascii?Q?dgm7cDeWnIb43Kmajn17/er/7ilPAdq92fa9TPwrobGL+ZadKRim5X+9MN3a?=
 =?us-ascii?Q?2qSMkitFXIZWDMJhicL2738lKScspXCWoBjlUoldLUl6xiOyB+I8uU0kcmyW?=
 =?us-ascii?Q?GFRrPB8f0kKlQ90Y0KZj4rbgUGr2UO8b+/GH37IY9H1KLxFnx4XS394rylQE?=
 =?us-ascii?Q?wd9i1x/gSlWX8bRLLYM+SuzQyR9N+MHPlzONMDIWRTBsrdTd79jzXhFRNJ5R?=
 =?us-ascii?Q?xz27jrM/iF1vSDEYpbtT+PeCYPjQdDWb8e23XnYUNn1ywOcigIBnuGvkfnDO?=
 =?us-ascii?Q?C0q0dPiDTRjI7+f1HLnwKQAGHBf6/JX0WoEjIc7tYf/3MbutDdLkYuLZXGQs?=
 =?us-ascii?Q?qp51L/jS3ke8z+BL/AlD8xynMwCQwbNCvUyuvriPz0sZcRgLS+32AgwpHG08?=
 =?us-ascii?Q?GtKP4NqJFN0WcSiHaqpv9IzFVH+7h8cE4WN8B3vxozHyz9/9d4N2K9GFd7aL?=
 =?us-ascii?Q?kIpxPJdoh5iKv3Mevql6UZfhayxvhhDhU5q6Cohgp6/SXmNbrCe+01P6LERT?=
 =?us-ascii?Q?oe3/wF90mSX1Si6IL/2zBrDY4FKeuig1TXyT0INXYqXW78JXE6ETqZx2+tso?=
 =?us-ascii?Q?0JQHLIB3uhItLW6ZXpNiqHZRILx0q8LBb3vQwlJuM8saDeAxaCb9F0G9uMCQ?=
 =?us-ascii?Q?q/qKbl0fhFXBmxxTBZpNxLg55Xg1IFqqHw+KLyQAVQ/Odn+CgR4I0LI2Rey6?=
 =?us-ascii?Q?0+B7E98CsmMWPvNefFhyPhEMCBthOVpdP6fc4ooIhY0vfZ5uuW85Bay63bNP?=
 =?us-ascii?Q?IIcYie71K8BWJgVZjeDwDSwWisahiwPrCnoxAAB0DihVh07AINyyVAPqIWno?=
 =?us-ascii?Q?9NSIGymBDY24VgR80OqFJXb9m7iZjFmeje12?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 23:40:15.7898
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f59560b8-0ad3-4857-f94f-08ddf0c364e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8696

From: Victor Lira <victorm.lira@amd.com>

The missing include prevents it from compiling when CONFIG_COVERAGE is not set
and the header is included in a file that has not already included errno.h,
causing EOPNOTSUPP to be undeclared.

Add the missing include.

Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
example of the problem:
    diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
    index 7ad870e382c..4d27f16e8ef 100644
    --- a/xen/arch/arm/setup.c
    +++ b/xen/arch/arm/setup.c
    @@ -10,6 +10,7 @@

    #include <xen/bootinfo.h>
    #include <xen/compile.h>
    +#include <xen/coverage.h>
    #include <xen/device_tree.h>
    #include <xen/dom0less-build.h>
    #include <xen/domain_page.h>
    ---

    In file included from arch/arm/setup.c:13:
    ./include/xen/coverage.h: In function 'sysctl_cov_op':
    ./include/xen/coverage.h:10:13: error: 'EOPNOTSUPP' undeclared (first use in this function)
       10 |     return -EOPNOTSUPP;
---
 xen/include/xen/coverage.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/include/xen/coverage.h b/xen/include/xen/coverage.h
index ba5fb67947..28506c239b 100644
--- a/xen/include/xen/coverage.h
+++ b/xen/include/xen/coverage.h
@@ -5,6 +5,7 @@
 #include <public/sysctl.h>
 int sysctl_cov_op(struct xen_sysctl_coverage_op *op);
 #else
+#include <xen/errno.h>
 static inline int sysctl_cov_op(void *unused)
 {
     return -EOPNOTSUPP;
--
2.50.GIT


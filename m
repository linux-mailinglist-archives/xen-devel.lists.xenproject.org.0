Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B814A79DE0
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 10:20:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936332.1337607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0FnT-0001D3-Cy; Thu, 03 Apr 2025 08:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936332.1337607; Thu, 03 Apr 2025 08:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0FnT-0001Ah-AE; Thu, 03 Apr 2025 08:19:35 +0000
Received: by outflank-mailman (input) for mailman id 936332;
 Thu, 03 Apr 2025 08:19:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t8zK=WV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u0FnR-0001Ab-GP
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 08:19:33 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2416::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d86079e-1064-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 10:19:31 +0200 (CEST)
Received: from BN9PR03CA0587.namprd03.prod.outlook.com (2603:10b6:408:10d::22)
 by DM6PR12MB4201.namprd12.prod.outlook.com (2603:10b6:5:216::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 08:19:25 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:10d:cafe::3e) by BN9PR03CA0587.outlook.office365.com
 (2603:10b6:408:10d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.26 via Frontend Transport; Thu,
 3 Apr 2025 08:19:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 08:19:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 03:19:24 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 3 Apr 2025 03:19:22 -0500
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
X-Inumbo-ID: 5d86079e-1064-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fwkvxu+FmEXVqSuPUh/Z2X4g7auYrv3c9KtKFChfW3Qs9rao1+XwvCL9u+iGIdc1KIL7Ui9zc7tDT2Y7WRd9BlJLNsIJZV8JJ6I45mdcl7wCvgxeJjIWLh/mteQdZtLEN85AjPoY/LYSmNnL1i0UiRH3D9w9W0pdM5lHxIOpEzTR6ykdxxj7W2lW2dR7xcI9bmMkTrfJUp2Yd2sekrin4FJkkYU1FYpTVbHbbwRG1BqhLx9/Ag07XJksSt5zZ3Ha86YTFvoW3BuGGzUGS1L8z5BAssFa7XGEi+VcLqDdm3df4WApmKc1Tsq7usRywSoPffnF9ueJuIhKE4vMIx7AsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=siK3ewKkAJq17lVUU6E9iWSkb/n2a7tTFyiT/lNAD+o=;
 b=qlRtaRjWDOMR28PN5oEtXWsBP2fXskin3k7Pqg1mHHM1O9Q7mXCZY1lt46x1n/bNyvM+IWH+5fdFGXLSwdHi5+v855noEJzYYvB65cijucF2nQ7Fk61w+rhTdsiGJh397xRFRXw/RTDyN6mPFBsvgSfkovb9cA2kgtg0oKQh/2XacRwPTrXJfALhFu/scdo5vxGDWaCZthQlABDTbs69JMnr3rnhW0QN+r78bACBuH4yVcfc+c9fVh4TBMQl+xXTk6hrgUlNY8DIvKEVRZR+07i6FCGsHizo0TMxwh2vUlI7k4q15u8tdCQrxgr7Uw/k59L//djwoZaA59F1hsEGCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=siK3ewKkAJq17lVUU6E9iWSkb/n2a7tTFyiT/lNAD+o=;
 b=neMDgu5DaDqGtr9k7FriclZxQ2WuMg8kuZNUYUkmEfl6BteAn3DyH65OzBClPk8mwn6Ph/PGErVPkOgsu04VXCuO7yCjGRm0qOmFtDQN1dpjzrcLBy7nZMf7j+dNaze8Yfdl4UyhG78sgQpAzLXi31sNzaYtzKGYpAiCHvkApDQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Luca Fancellu
	<luca.fancellu@arm.com>
Subject: [PATCH] automation: Add Arm64 MPU build job
Date: Thu, 3 Apr 2025 10:19:16 +0200
Message-ID: <20250403081916.6834-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|DM6PR12MB4201:EE_
X-MS-Office365-Filtering-Correlation-Id: b85a2a70-7b51-4359-a72e-08dd72883e83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UUAG9Z7DbEWwFcPxMrYO1SZoM7aLgc/q10KwX8LZoevl0qFMAzW+87ioESOQ?=
 =?us-ascii?Q?b//B3yAmtodrnFyQHjBMDlqkyA3bXL8e4N5s+mFzSSXMXoAosM/fFW06s6dL?=
 =?us-ascii?Q?bFGqBoUZ/ubVSbLxw3McZlGUF36rK4o5puIDJILF5GwHEJ0NBGXj9apcSQE7?=
 =?us-ascii?Q?vpxGsEEE/gL4JiWRkryI/RgTNiuZ2M6lYYA8BhcCeO1EHFgjO7drXEPxVDiS?=
 =?us-ascii?Q?RjWJum9U6azb9CLlvpG4G/lggJWOkSgDlrVjcBUSFcZqrf2RuDsx84rCrxsz?=
 =?us-ascii?Q?kLxYI8VPK3t7rhb9sSekfKeNHN4KPo+MAW1iDmx1j+hODGzKJot6/6ueaPDI?=
 =?us-ascii?Q?2265Em+aawzwsyf0SgILV9PUqLLB4UNntG4jpDeM9Igdpc25sSDgXRvjofqo?=
 =?us-ascii?Q?dqdPNtlwJGOETzWez2M9sxOZh57Qi0vz6igD2oArP8+ThoUmmtkGafQBE0gN?=
 =?us-ascii?Q?ihT84uBZ68LRK6aPZwsuBmV8Apq2n7FOxJQWyo4MgEjHipWsl1fK0lGkM0ZU?=
 =?us-ascii?Q?h17FRxh0ZbM72Hwc2+Y1bvcjb7Ud2AfckzAxr2rfwxdI7nppgeIFQtBXmETA?=
 =?us-ascii?Q?anw01V4j3VjLXi46jtVJGQnlefBVWjIsX5AFqSpFIXrk3C/Ppm8Hi9OThKMc?=
 =?us-ascii?Q?X+/ICbJ03xJgIQDk2EtkJ3hxUs3zK8V5BLf2b3bua/Rs+dHwMpJ8CU6rsC0d?=
 =?us-ascii?Q?HAeuffjuDb/MdKiw1ZYIf0hRPGeTRvNCei4LHtYxE6FmF8y77nDpKPgUMIyL?=
 =?us-ascii?Q?4N38vDScoKK5z5Qnwn9Wufi27Mkje6nKKzjQVa3zz3qYGFBikKLgJXv4OS/7?=
 =?us-ascii?Q?Xdvk3C+/rc5i2Ecb9ycEifNwX3W/PNJKyZPkq+3wMHTPWYQJvkRmEhagisgw?=
 =?us-ascii?Q?5vg8qrpK+rFGag2/IwFrFnAf4XcE7OdlQmB+a4jFgPsxBRLiEspUSwsbYPKw?=
 =?us-ascii?Q?KzY6xAe9QDSf5494vjJKskkSYoXwIAbpKija85dGCEJq1nbowf7Pn5yBsi7I?=
 =?us-ascii?Q?+GCYmFVFVVDR7UEqmprxfFcCxsHqnJjKqHVExXFaeMJxXYmEy8VyZA+GlGbE?=
 =?us-ascii?Q?LWPg4jJ0jI8m+Fb5p1b1aiD6ni7La7Of2cGe7F9hZCfFF98eJL3iuny6AKAf?=
 =?us-ascii?Q?04V0opjB1Jy84NhEIIfELcVIonV48+/DPOF1KFO92eOdGiz5ptfvQYnqP6cZ?=
 =?us-ascii?Q?rraEZ2e7k38gnyUxoRMBj8loKjvsvcheWnUDZkkS7k/E967F6B+n9I9ajoJy?=
 =?us-ascii?Q?3MYbPhI6J1TAdtI5GiFx3I8WEomrNQsKetSiYh1r3saV1xe91qaq7rplimSy?=
 =?us-ascii?Q?It8c8kiJqyNaJ+k53YUSIWkP4ujDSsgBYNCF4NW5y/Tsmwo52QljN4VFyIQA?=
 =?us-ascii?Q?nrlxuVF9DPLdnoA+TF6OBd2v/jYchYpnEtNJdEArYLDK/8m2ExtLMYXK5SN5?=
 =?us-ascii?Q?bXk0ngT1rOoiMbzg7UJR749qxqttpdYAsl6xVYuvl7RlQIVEeIebyQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 08:19:24.5943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b85a2a70-7b51-4359-a72e-08dd72883e83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4201

Just like for RISCV and PPC, the earlier we enable the CI build the
better.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 automation/gitlab-ci/build.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 2513908b059b..8cb770d6ff27 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -476,6 +476,16 @@ alpine-3.18-gcc-debug-arm64-earlyprintk:
       CONFIG_EARLY_UART_CHOICE_PL011=y
       CONFIG_EARLY_UART_BASE_ADDRESS=0x9000000
 
+alpine-3.18-gcc-debug-arm64-mpu:
+  extends: .gcc-arm64-build-debug
+  variables:
+    CONTAINER: alpine:3.18-arm64v8
+    HYPERVISOR_ONLY: y
+    EXTRA_XEN_CONFIG: |
+      CONFIG_XEN_START_ADDRESS=0x0
+      CONFIG_MPU=y
+      CONFIG_UNSUPPORTED=y
+
 # Yocto test jobs
 yocto-qemuarm64:
   extends: .yocto-test-arm64
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7FAA2B878
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 02:54:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883272.1293351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgDZ6-00043Q-O3; Fri, 07 Feb 2025 01:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883272.1293351; Fri, 07 Feb 2025 01:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgDZ6-0003uL-HH; Fri, 07 Feb 2025 01:53:56 +0000
Received: by outflank-mailman (input) for mailman id 883272;
 Fri, 07 Feb 2025 01:53:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yNCd=U6=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1tgDZ4-0003b1-LI
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 01:53:54 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2009::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61948495-e4f6-11ef-b3ef-695165c68f79;
 Fri, 07 Feb 2025 02:53:52 +0100 (CET)
Received: from BN9PR03CA0938.namprd03.prod.outlook.com (2603:10b6:408:108::13)
 by SN7PR12MB6716.namprd12.prod.outlook.com (2603:10b6:806:270::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 01:53:44 +0000
Received: from BL6PEPF00020E63.namprd04.prod.outlook.com
 (2603:10b6:408:108:cafe::5) by BN9PR03CA0938.outlook.office365.com
 (2603:10b6:408:108::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.27 via Frontend Transport; Fri,
 7 Feb 2025 01:53:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E63.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 01:53:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Feb
 2025 19:53:43 -0600
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Feb 2025 19:53:42 -0600
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
X-Inumbo-ID: 61948495-e4f6-11ef-b3ef-695165c68f79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xj30mxH/9cdcGpJg0s+eYDW8LMxu3g6B4zo9CbSyGFBy3RA6MhOKr8Nw1bGtYiklBbiTlu+KXhYWOuUuUuwfENm5LbU/uWMKQgc68JHc0yfZO4ZTYquxfAROEIazE5UAhsNwLSE9IvTFQVbv/0TV6yiACBZpDrQZUxRZpsgwvuNXEl9IZ5auUCp+lzAbzwBM+g0BZ4BDhK240Ng3SbQRb9HNUQE9tdIoVx5+7cG7A99Ux9m/tRg6vSX8dEQD/Suxxe/SnbJC8yyLXXE2+zh85MxjTqy9XMDfC+nx6u0f6/RSB25omvuxbEQ6SDATP9OzrFS4dq+9v67QrhjrNWD/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVw7d8gNfaaXnFYOAq45gurUF8bQfBjpMOEsqE5OT0s=;
 b=v1pGsIbZ+XV6KqnHWmiTtskiaW7RGBpzmWv4sgDrgj2d1xUkiYqiKOz19ZfdFtaet0IjCkPA8g5ZmO9J3WKbrtMt3/2Rers5+Z4Fo9Vxfvq1Th5gOA0LhVnmQtfa6zgr7fEDJiJMqJOY+sbjR3JyZId4RR+VUMd/mdShfw0WaXtiKROHXrNu/c19rXRAXIMZECEuVbTtmt99km/M2mRbMBSjHIU94R/BSu9+2noS618bZomfcStYbSzK9xCccXhPHNWTuPPZ7AMbTslz9GjL5yGQQ40rmY7P47WbSELBCbKvSVz/pz+By6gxSHztfiVlBMMwQpsPVQ8q996uwAAtyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVw7d8gNfaaXnFYOAq45gurUF8bQfBjpMOEsqE5OT0s=;
 b=kqV6BY5X36cJnGjFo0IREijeM3cvMRgs3mmnE3yuuOu7JUzZnl+Vw2MUOQ20oUfUa66P+AJEjCBNt1RUs2fG53/V3yZkckZJ3IMF3XPFLUzvIXLdpwL4UUjHBB62kxVrcbB60TomAA2xXO9hVqXJQ6fT3sHGRqDE1mKbkQFSjt4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>, <julien@xen.org>,
	<michal.orzel@amd.com>, <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v6 1/7] automation: upgrade Linux kernel for arm64 tests to 6.6.74
Date: Thu, 6 Feb 2025 17:53:35 -0800
Message-ID: <20250207015341.1208429-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2502061750480.619090@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502061750480.619090@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E63:EE_|SN7PR12MB6716:EE_
X-MS-Office365-Filtering-Correlation-Id: c808c684-b117-42e0-12e8-08dd471a40b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WPygDIJO4OeFQZaPaVBlNqvdcOkP3eoWMNsG+3CeYU7TeveVjVZvqnwuq/wW?=
 =?us-ascii?Q?yNgfwzcoxGqRHVb8BG4Ie93S+7r61O8Xg0OByx9g4COhllwgnCwm5adcL8RV?=
 =?us-ascii?Q?Tv6elGid+yhdny/Cfg94EmO+34anLRB4q0rGfa0xU40ofI93rR8HwhICDxgr?=
 =?us-ascii?Q?3z47Nm60/d95QX3BuTwBeDC276eYv6vBsNWhPScSGzwhywcWB4xLxlxIroSm?=
 =?us-ascii?Q?7NeDa1i7uAPI/iei0KKB21YZyZeos/D9whgg5eEr/n3r+odmUBufTpM71Yc2?=
 =?us-ascii?Q?t6TPEqxZNiEBp7ph3RICXjYQdbHFLaxK2AwIKzBNcHi4hORwtxWo4W7deXIG?=
 =?us-ascii?Q?ABfKz2Rr1UurAivF0LBq9wogpEPCoLuBUFx/kBiDX0dot9c5SGt8JxngdTeB?=
 =?us-ascii?Q?9cvfHwCBLKlfID66tR2Rt038lb7irS/60Swq7P6wDsT5kowpzudWmq0BGYGc?=
 =?us-ascii?Q?98t8gVWUEXBbPHwwSkqmXx50XGM6DNDzs+MeAgRfZ6c0AI1QEkohCneZrRnV?=
 =?us-ascii?Q?99/qeNHGq/PFJuey0nKOrVOQw+NI7K/QUKK/9JyUiTeg8TaLgUe2gT8PX/u4?=
 =?us-ascii?Q?2EFtxzvUcX5uafOmdDuaUYo23mKAVuoUEyaaWfHt8OaHlnFAQyq7ZL4O8Nv+?=
 =?us-ascii?Q?TXq5dwprUVdoxCe7CYXixneIOzRYMCoYqKP5nGXtdgimlJkX4QhUGVMWNswt?=
 =?us-ascii?Q?ut2FKKCRyDL/GYc2Iod3TqZUm3A77JD2hW2XRMpmokTYhTMJAIwJZHnIUtfb?=
 =?us-ascii?Q?zSPLtcwQSqTlREsRRxxrDI2eDA4l++uxfyWooAIUEIhA+NikLNxquNEQaTFe?=
 =?us-ascii?Q?vKloadgoinFPCmP2cbwqQKW5rHX5UWBjK3d3HnjPc9FkXes4Fr+XGdEVpiX/?=
 =?us-ascii?Q?HEoIuq6D2cbNwGeE7t83Gt3Y/0FaS8hGXM0Tr8H9FmmdjdufwZyyEayuWHXY?=
 =?us-ascii?Q?90f5tvYbGxNZ2CPWQnS6kjlCZ4xQCHU4ql/6UDcioQlSBAOxjkY13s5gKn1m?=
 =?us-ascii?Q?/dMrmHAYoLqWFpqaBz6EzDWrn8MIK0qLNvUGr+jmLoHYqADS8KpulZlSeFtd?=
 =?us-ascii?Q?su4F9BhnbcUgNXEIGO72LTzbeqbzRjmgVJkk/+5u40iGDnwPN6Tqh0GUGb60?=
 =?us-ascii?Q?+U48Ru0jk0ZFGuQXlu3ufLJgtO10/q48mvSUGzBpGTQoEL0riwt7liCC9sQ7?=
 =?us-ascii?Q?uxYsm3paq4dp88iv72WarRO0Jnv50z4tCOaF/D0jcxyPJiRI1LFqEM7I+wQ/?=
 =?us-ascii?Q?VYkZ09MJAkQ8vbdQLXd3ZmEHzespEkkvqUEeVpFvQzLG/w1C6asiG3iKYNXr?=
 =?us-ascii?Q?KDvnL2mWKp4kgWQ9Ppv9DAcKBu2Y1IeMJVIkojrEddHtkQKAHkZnBsbpOjbd?=
 =?us-ascii?Q?aNzpvGK5mbfk1WO1CSS6OtdikeR8C45Sd6EyKM9Nboo739Z092+bUYKMIY+t?=
 =?us-ascii?Q?iH4mzIQeE3g=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 01:53:43.5765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c808c684-b117-42e0-12e8-08dd471a40b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6716

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
 automation/gitlab-ci/build.yaml                              | 4 ++--
 automation/gitlab-ci/test.yaml                               | 2 +-
 .../{5.19-arm64v8.dockerfile => 6.6.74-arm64v8.dockerfile}   | 5 +++--
 3 files changed, 6 insertions(+), 5 deletions(-)
 rename automation/tests-artifacts/kernel/{5.19-arm64v8.dockerfile => 6.6.74-arm64v8.dockerfile} (90%)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index bc4a8a5ad2..411b4902b5 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -269,9 +269,9 @@ alpine-3.18-arm64-rootfs-export:
   tags:
     - arm64
 
-kernel-5.19-arm64-export:
+kernel-6.6.74-arm64-export:
   extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:5.19-arm64v8
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.6.74-arm64v8
   script:
     - mkdir binaries && cp /Image binaries/Image
   artifacts:
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 1822e3ea5f..6ad45269ea 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -4,7 +4,7 @@
 
 .arm64-test-needs: &arm64-test-needs
   - alpine-3.18-arm64-rootfs-export
-  - kernel-5.19-arm64-export
+  - kernel-6.6.74-arm64-export
   - qemu-system-aarch64-6.0.0-arm64-export
 
 .arm32-test-needs: &arm32-test-needs
diff --git a/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile b/automation/tests-artifacts/kernel/6.6.74-arm64v8.dockerfile
similarity index 90%
rename from automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile
rename to automation/tests-artifacts/kernel/6.6.74-arm64v8.dockerfile
index 8e33995ba3..73e5145425 100644
--- a/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile
+++ b/automation/tests-artifacts/kernel/6.6.74-arm64v8.dockerfile
@@ -4,7 +4,7 @@ LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
 ENV DEBIAN_FRONTEND=noninteractive
-ENV LINUX_VERSION=5.19
+ENV LINUX_VERSION=6.6.74
 ENV USER root
 
 RUN mkdir /build
@@ -18,10 +18,11 @@ RUN apt-get update && \
         curl \
         flex \
         bison \
+        libssl-dev \
         && \
     \
     # Build the kernel
-    curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-"$LINUX_VERSION".tar.xz && \
+    curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"$LINUX_VERSION".tar.xz && \
     tar xvJf linux-"$LINUX_VERSION".tar.xz && \
     cd linux-"$LINUX_VERSION" && \
     make defconfig && \
-- 
2.25.1



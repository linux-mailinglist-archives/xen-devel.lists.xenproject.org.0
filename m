Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 401F4A8B35E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 10:22:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955300.1349094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4y1p-0001Cb-Oo; Wed, 16 Apr 2025 08:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955300.1349094; Wed, 16 Apr 2025 08:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4y1p-00019v-LN; Wed, 16 Apr 2025 08:21:53 +0000
Received: by outflank-mailman (input) for mailman id 955300;
 Wed, 16 Apr 2025 08:21:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PIlj=XC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u4y1o-00019p-GT
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 08:21:52 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2415::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d862bef1-1a9b-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 10:21:50 +0200 (CEST)
Received: from PH7P221CA0073.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::30)
 by SA1PR12MB8860.namprd12.prod.outlook.com (2603:10b6:806:38b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Wed, 16 Apr
 2025 08:21:45 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:510:328:cafe::4c) by PH7P221CA0073.outlook.office365.com
 (2603:10b6:510:328::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.33 via Frontend Transport; Wed,
 16 Apr 2025 08:21:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 08:21:45 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Apr
 2025 03:21:44 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 16 Apr 2025 03:21:43 -0500
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
X-Inumbo-ID: d862bef1-1a9b-11f0-9eaf-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sIgEi7Q/vKsjlA7IkRSDFZwtcKcExcbzkji5oLFW9U5Z2K73E91BgT5tHqHMkIhNDKqpY6WSYbrok7oJBzLbWAN6Vy5h4mfRbZ++fBLZDVFR6GgpVkk5yCTygPAPsS7l1T2/EGeKlXAA/6p69Fvvny5hm9hr8eIkmRdOkCLxlCJNvg5/da0Pa8WkkciHP/qtcu+GaAf8XFLus8BTSkiD/qMaOQMKRyvPdmn0Fi4PsBTxiMZ07aNY8BPa0XvGhFkKCNvnoaLcUGZ/QfyVHwn1GsaKYb7TrwvV4Y2raKBDzaYvMijhGeinclPkUVEpNFByFfK9RdSOE5VxD4mOgtbPUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHVJn6Jg0FETVTCNhE4fZ4jxpmp3g9d55F3oyk/yX7k=;
 b=D5+zO/Xe42L1p5bzuB/t9W7tk2t16n/UFqZscidh4weJCPcxGe3VrwsywyWtRutu1nqbUGmDUYUytDPxqo+TQv369rL72N1ZSnb0mSuhBT0+F7y3oQtdiJNW/kt+V9CMzRWN6Tk0F3loFvNABfymLtk+W8Ma3dz8Vm9SYg4YxamaY6pU64A603fIhkez5JmTYnDFLnl/8CmmaOkDJ5dktJBL9qOMq2N1qobxjdLp2ex9F93FL+KrAjiKbS5hdlEiAv89TCivOO3DQL22dbqW8PqHiSHLWQtciK/2SHTx35xaYebcikBqpgROA/lbrVsaX23VQKzu0cKSYnZszVO4yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHVJn6Jg0FETVTCNhE4fZ4jxpmp3g9d55F3oyk/yX7k=;
 b=OswaAnR2z1PpOwp5pAEQCRTBwkh73R+fKwzsKp7vz+ytdLQlb7efn+9BKmTZyZ1GAMMp4me0pl2gq9+8VKI3N+OPXe3EGrdyrt3j9h2c933r5J3wbSVMxXXLkOzgGKLcAcje0WS3IDe2eHS8gIY7yCbqu6Pw9xkKOHWSgK1VFhI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] CI: Add Arm64/Arm32 MPU build jobs
Date: Wed, 16 Apr 2025 10:21:30 +0200
Message-ID: <20250416082130.236530-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|SA1PR12MB8860:EE_
X-MS-Office365-Filtering-Correlation-Id: aa36f3f9-ce32-45e0-4b49-08dd7cbfb9a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R4miyFyKo2MwJl8lHjvpsEUZ05YVCzWsAvankjvv+Cpqrlo5ZS1DI3y9+/T8?=
 =?us-ascii?Q?A8jcV2KqHTC7XdGqfzfVSzFHGVf8IaaygnEaIGHpvyG5EkCwgSfyL+XlE3vc?=
 =?us-ascii?Q?q7Vjgh+blGXpkQmLG3k6CCskGvrN+1UcB3WacWrEwkP86qNpgxOi2Jyxap0k?=
 =?us-ascii?Q?I6/4XRGPZ1flNjGuRyOzxArWV93sZ5b/QoXB1jB/caitG8Ge7tokhz8njUA7?=
 =?us-ascii?Q?Y4MDbhBkCHX2oq/nY2I8nZRuo2kwZVs6czutyDW+YRhoItnSg2/eB4l0KrX9?=
 =?us-ascii?Q?7cf7D1KJnMHf/65jw9NNu11BoWl+JdJtPwMYgKKwVoLOe0uWB3NRBLalSppU?=
 =?us-ascii?Q?PGVGrFfHe+8LJsyrCUDxlsuooIIha+px9lRpGbta19NSunuBwReYgpQdYw43?=
 =?us-ascii?Q?pctXSiYUpxGjw+lCZLtbDDffJZneFb2ZsEFla9PZwy9wfE1oaarfQNaXW9HH?=
 =?us-ascii?Q?WEsMGf3UlbhuRTEaiIqC9uzBXunT4EM6viagEdJbyy4rnvAstM5DImgr+zpQ?=
 =?us-ascii?Q?FXgx+1BbZz04H5xbX7yyjT+UMHcfPIxy2gj6iwI1ecmWs0+Ufrgfouq76gbT?=
 =?us-ascii?Q?IfPndm3YEAc5mcWyXM8oyESO2aG7JvgbdBLScVbedr3mB3MOHrn/hEwnbIUt?=
 =?us-ascii?Q?g6jgym14Dv8SSBuuftm2AvMa5N+pn+eNOES+GgtIgCYt3KuSVcqlCTEo0eTs?=
 =?us-ascii?Q?VB478TBgEizTRP+UN9vTJkeeUJ4EYZeebsfZhqyeeeHpfejdIwr2gV81Hbry?=
 =?us-ascii?Q?UMHPo4vo2Y2Op4rfgJPMTUzjxsUWJmP0EfPxFYELjQ9Bxd/PQPJB/Z8QGLsU?=
 =?us-ascii?Q?8RHhVLCpqxPZwdB6t04dMpEbkZdzrNtURm8HOcGK7Zi11rpOwxltokGnbCUy?=
 =?us-ascii?Q?KYsatknmtswR9TjidgWiR1AL9O1rIoBUiNrseM0srs81v76r76KxHjhUcwkx?=
 =?us-ascii?Q?DXnmtN8XOBd66MtkS7FAdztv9CbDxFkkicv1BagyrnxYyZyeGhyE1wzDLlxC?=
 =?us-ascii?Q?PvqH2hbdpK41MQ3j9Y0XwIV37N5eluSjbvmKH+WQeUt8blUP1h6KUa31L0UJ?=
 =?us-ascii?Q?5/iMx+p6dibir8saxB+DhhworR8p4vHR3U1AoNl+RHc1Zn71Av5D0qzH30sw?=
 =?us-ascii?Q?LfUogDsWxEMs8q06NlVdneCEQN1PdLdqo5B8xwJg6KkeK0eNwIxYVxQ12GNL?=
 =?us-ascii?Q?qohEHHeiCRYuERhzpv7AgCA1mitBpi1MSpyGSTsBHqvGwOEbKEmThvsG9KRB?=
 =?us-ascii?Q?uCz5NvA34krgsE7K//o7/jZtav8kpV5vbAleSsFxpeTmRfkX+j8GRwp9BlLu?=
 =?us-ascii?Q?VbFPrwCVpqr4vszC9cULPOftliVpPSKWxbrLRqf2HBGI1KgkgAceszgU5D0W?=
 =?us-ascii?Q?hNQmKdLn9iN/cNOG7TI3/lxAJeUXa03thLjFlXwAyMSLwb4slaQpJSs68iXk?=
 =?us-ascii?Q?tNidZPoXAv9ftGSVGWnQUwcxzTdQEIEZRprHhkKz0gyTs9IkCRsoXg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 08:21:45.0418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa36f3f9-ce32-45e0-4b49-08dd7cbfb9a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8860

Just like for RISCV and PPC, the earlier we enable the CI build the
better.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - add Arm32 job given recently committed series

Pipeline:
https://gitlab.com/xen-project/people/morzel/xen/-/pipelines/1771015642
---
 automation/gitlab-ci/build.yaml | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index ac5367874526..ab5211f77e5e 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -379,6 +379,16 @@ debian-bookworm-gcc-arm32-debug-earlyprintk:
       CONFIG_EARLY_UART_CHOICE_PL011=y
       CONFIG_EARLY_UART_BASE_ADDRESS=0x9000000
 
+debian-bookworm-gcc-arm32-debug-mpu:
+  extends: .gcc-arm32-cross-build-debug
+  variables:
+    CONTAINER: debian:bookworm-arm64v8-arm32-gcc
+    HYPERVISOR_ONLY: y
+    EXTRA_XEN_CONFIG: |
+      CONFIG_XEN_START_ADDRESS=0x0
+      CONFIG_MPU=y
+      CONFIG_UNSUPPORTED=y
+
 # Arm builds
 
 debian-bookworm-gcc-arm64:
@@ -443,6 +453,16 @@ alpine-3.18-gcc-debug-arm64-earlyprintk:
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



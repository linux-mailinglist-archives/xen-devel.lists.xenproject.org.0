Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B496AF8EE3
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 11:41:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033164.1406638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXcup-0007Gm-1n; Fri, 04 Jul 2025 09:41:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033164.1406638; Fri, 04 Jul 2025 09:41:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXcuo-0007Dp-UT; Fri, 04 Jul 2025 09:41:06 +0000
Received: by outflank-mailman (input) for mailman id 1033164;
 Fri, 04 Jul 2025 09:41:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIza=ZR=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uXcl8-0007ek-I7
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 09:31:06 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2408::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b4bf235-58b9-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 11:31:04 +0200 (CEST)
Received: from SJ0PR03CA0368.namprd03.prod.outlook.com (2603:10b6:a03:3a1::13)
 by CY5PR12MB6300.namprd12.prod.outlook.com (2603:10b6:930:f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 09:31:00 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::5e) by SJ0PR03CA0368.outlook.office365.com
 (2603:10b6:a03:3a1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.23 via Frontend Transport; Fri,
 4 Jul 2025 09:31:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Fri, 4 Jul 2025 09:31:00 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Jul 2025 04:30:57 -0500
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
X-Inumbo-ID: 9b4bf235-58b9-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ComQ7DhqYWrOzpBoURo2WmK+MXLfx1bD98cR1+tITo28D7eQXh8o/HCIlrC/lrXWXEq5e3YQZozezVWCGFuyez4qR1blaaxpwMbTNjewDFjMW1wokP/7aUVaOBmYdqVm/ukw3lBKTpZKL54O1d8+Ch4KdqaG12HCtSJXs3+/9HpKzxdOgCEiBfqjLop2jO73v1Jg70JyrTo5B0Ml07UVKXmJgxjetxMZFShjtPzxcZnsUGC2Cp7ZmEHaniKFqOHGYqqFbxzkifvCVNL/B5qbBDRqaXoQfrqeYAYpNiIfDjiV/eOgSw8NgxdZCKJ8xCBTqO8QElhpWeKTrlItMlD9QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJ0yWQQ3+ezfc84j0CJ2nrRzdn7Cpfu7Pu0S/BuaQIE=;
 b=KPHlA4Xgel1+OJEeSwqx5QkVmPFHCbc6f1ImdyJLmS8v4y86kXPMhROmY7Q+9ziDHDSANTZM6b4PF3ov2gv9E8Uyy9ziixoMOz3g2zn/WYof7IihYx907JWSCTzFSl0+wfh+fkjRJgk8VQRmUYuqErCE9LbTNnJ9nH5jYt0tkrW0LfoNq5tYL4G/AEJBVNvVUlnQIk5jyJ9Vya3Z9FSUChsiijdLrKyat6YxFuRiiRoJkoY8RtNSRJ/rvpA5sggmDknbCLOGL/74D5D4fxxzr5UU/gTxylo6Ljim2F0MAE1na2XlYSlb9ftPT1bF9nJqYDLe5tWiLqtuppdJ6z35uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJ0yWQQ3+ezfc84j0CJ2nrRzdn7Cpfu7Pu0S/BuaQIE=;
 b=Ur9UuPqbzuxQBYfIQbLB6ueUkrgX79FMEdxjpbohcvsDcpFDZ+D9oB0DP2n1+6Hs6uzjAvKqQdbDKehYN82UVEK2lN2Sc3Jyb35LLjW5dJZj4d+rsNL7+MnfWVbESfFrqT5B9aTWHqR9hV5Wdo0YZkyzI8ZrJT/t9MzoFEkD874=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 17/18] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
Date: Fri, 4 Jul 2025 17:29:51 +0800
Message-ID: <20250704092952.822578-18-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704092952.822578-1-Penny.Zheng@amd.com>
References: <20250704092952.822578-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|CY5PR12MB6300:EE_
X-MS-Office365-Filtering-Correlation-Id: ae7b7e3b-6a21-4036-10ca-08ddbadd7cfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7qcDZGwQuPkstqgrHSljXYhlifnTb5GO7zcYQKxM+VlpaFdW0/0s9bv+eqTs?=
 =?us-ascii?Q?vVRxf6IC5k8DkLVj9536edjmSjMyi7ZPdaG5kPLNLyZ9Bh4M81Q7gANjcfvC?=
 =?us-ascii?Q?YulkJFDDobEa/sekGfelo685aKtxh26eXd2BAj78OaV+hqNUZyd3RdWy4joo?=
 =?us-ascii?Q?VcoGVGF8vC02sl3Fed6htsXoQ4kHgzeodFjPnW5T9x2uL4ZoPY8qbNbiyNur?=
 =?us-ascii?Q?4Qqi9nMqdaJAwBZg2WhAeAsI/Z8HlHjW1lJSEVNXGQUhAiFUd+XMld6pjsD2?=
 =?us-ascii?Q?e4toYl/eub0QDDj4nFtv4/gvyUKmJg95niaSJ0Ubjwx5hoG7/+57vhVK4Ogp?=
 =?us-ascii?Q?g7AnFQU8z+Sa3TpL7PCpyqy/qXIMj6BqBvIZW+aXy/OY1LZgjB6wO1PDSLSN?=
 =?us-ascii?Q?drR3cbSwb41Yda4wDoLRUwscV/MOUap/InGdZCQM1djxJZOuWOjsS1psLzYi?=
 =?us-ascii?Q?7uwBOcpX3Ku8jNumTCfqodeuGowg8bosoS4EejMFA0g6XgdLcoYqME4fObmk?=
 =?us-ascii?Q?Fl1mxFy7K5DgSa4k7hGbfZbxtD+sm/6cEUa2A+xzWiTg80W6YLI2nAWxQW4i?=
 =?us-ascii?Q?M2MmIzibPlu3i3YppREAGUws6ppsGKTkEvmzuGIi7HONSIYBkIX3aLLBGbIb?=
 =?us-ascii?Q?auKFUBa+Ppw1xD5hCc3HHPAlplJwKjiJ0zsddexSbJt2DrYYuCnCBPq51Znm?=
 =?us-ascii?Q?Vtkyq9WsPu+2l0bN8uK7glW8cQU1V6ddVo/HqJFiaBeQm6Pv/kpSTqLrZfEV?=
 =?us-ascii?Q?F3w78BoRJ2ORcDdKKnNfln9qLyc6IS95vz6m4G4S5k1UBhCQBlRdAaTZJPNk?=
 =?us-ascii?Q?C+1xecnXmHLFWELBGoyatFgnU88GRdDjmSSGuHJIQLa8rI16yJDnlEwlsC5+?=
 =?us-ascii?Q?HroO7TbfDgWuHSoLqZpS9eTHoGG97CHYmsO7dXmrg0+qklnh1FzdLf/Sz5qv?=
 =?us-ascii?Q?6SKiV+MqJe09F9NBpw7yGw3qVH70d3YKhENr0j5SsFvti+AOckRqGlq8FpzK?=
 =?us-ascii?Q?t9N9/M0m6q6HM7akZBhhWoUdC4gnYeyc7AsbABpq+LI4g7nMpuQJss533mRB?=
 =?us-ascii?Q?aKFwsRKeDqByIImFZl68IFwwPeI2ZtoPm52Fi65rkIIosgZT79tAPbYet7+B?=
 =?us-ascii?Q?ExqnYQEe4hMdQpKsPWTVuJmwH+iZvN3ZXVbI+MG9GQMf6pErO4kfruwEA/pU?=
 =?us-ascii?Q?s0BGlk10icq1kz07xBNGIKG3FBslKkNFwSiGt8m4JSWhWNxNVs5h5opUYzVk?=
 =?us-ascii?Q?0Sy5SbXJ8QtZdZwTw2qA+H2k9fDyeiTRMy9hYmRGyJdAkG/+ctfwh0t6ejRQ?=
 =?us-ascii?Q?m0sw0PCmJPCh5SHdim9IctjVBlocPtoIRXDYKziPhaZ3KJeF/Khcb3BVVA5q?=
 =?us-ascii?Q?TxcLIFfFHxtZ8oIFZu18XShCs+tiebsKYY2IQAOybL1fUoETn6AGfelu+XKW?=
 =?us-ascii?Q?05WHKbiViSH1dhnVGSDuAx5bmwhuVdbWmdE1F+GeJyhp4tV/yjPH87eG/0Zw?=
 =?us-ascii?Q?dHPlMOXI+z2lZb8V8cP00ct9wA3uKxT5pWE3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:31:00.2566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae7b7e3b-6a21-4036-10ca-08ddbadd7cfc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6300

Remove all "depends on !PV_SHIM_EXCLUSIVE" (also the functionally
equivalent "if !...") in Kconfig file, since negative dependancy will badly
affect allyesconfig. Although "if !PV_SHIM_EXCLUSIVE" for CONFIG_VGA is not
truly a dependency, setting PV_SHIM_EXCLUSIVE y still makes it unconfigurable.
So we remove it here too

Add "#CONFIG_xxx is not set" for above options in presets for x86 PV shim, as
the explicit declaration is to ephasize setting for the shim is different
from the general default.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
This commit shall be commited together with the next one, which is also the
last commit.
---
v2 -> v3:
- remove comment for PV_SHIM_EXCLUSIVE
---
v3 -> v4:
- explicitly state "CONFIG_xxx is not set" in "pvshim_defconfig"
- Add "default y" for SHADOW_PAGING and TBOOT
- refactor commit message
---
v4 -> v5:
- For not breaking allyesconfig, changes to defaults are actually not needed.
So remove them all
- Leave one blank lines
---
v5 -> v6
- add description for change: removing "if !PV_SHIM_EXCLUSIVE" for CONFIG_VGA
---
 xen/arch/x86/Kconfig      | 4 ----
 xen/arch/x86/hvm/Kconfig  | 1 -
 xen/drivers/video/Kconfig | 2 +-
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 752d5141bb..b45f17a16e 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -289,8 +289,6 @@ config PV_SHIM_EXCLUSIVE
 
 	  If unsure, say N.
 
-if !PV_SHIM_EXCLUSIVE
-
 config HYPERV_GUEST
 	bool "Hyper-V Guest"
 	select GUEST
@@ -299,8 +297,6 @@ config HYPERV_GUEST
 
 	  If unsure, say N.
 
-endif
-
 config REQUIRE_NX
 	bool "Require NX (No eXecute) support"
 	help
diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index 2def0f98e2..b903764bda 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -1,6 +1,5 @@
 menuconfig HVM
 	bool "HVM support"
-	depends on !PV_SHIM_EXCLUSIVE
 	default !PV_SHIM
 	select COMPAT
 	select IOREQ_SERVER
diff --git a/xen/drivers/video/Kconfig b/xen/drivers/video/Kconfig
index 245030beea..0a51e87eb2 100644
--- a/xen/drivers/video/Kconfig
+++ b/xen/drivers/video/Kconfig
@@ -3,7 +3,7 @@ config VIDEO
 	bool
 
 config VGA
-	bool "VGA support" if !PV_SHIM_EXCLUSIVE
+	bool "VGA support"
 	select VIDEO
 	depends on X86
 	default y if !PV_SHIM_EXCLUSIVE
-- 
2.34.1



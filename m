Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E268318E2
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 13:07:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668743.1041136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQRAm-0005w4-5i; Thu, 18 Jan 2024 12:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668743.1041136; Thu, 18 Jan 2024 12:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQRAm-0005uB-1o; Thu, 18 Jan 2024 12:07:04 +0000
Received: by outflank-mailman (input) for mailman id 668743;
 Thu, 18 Jan 2024 12:07:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fkFQ=I4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rQRAk-0005u5-Ln
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 12:07:02 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13d50504-b5fa-11ee-9b0f-b553b5be7939;
 Thu, 18 Jan 2024 13:06:58 +0100 (CET)
Received: from BYAPR06CA0036.namprd06.prod.outlook.com (2603:10b6:a03:d4::49)
 by CH3PR12MB8548.namprd12.prod.outlook.com (2603:10b6:610:165::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 12:06:53 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::c9) by BYAPR06CA0036.outlook.office365.com
 (2603:10b6:a03:d4::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24 via Frontend
 Transport; Thu, 18 Jan 2024 12:06:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Thu, 18 Jan 2024 12:06:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 18 Jan
 2024 06:06:51 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Thu, 18 Jan 2024 06:06:49 -0600
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
X-Inumbo-ID: 13d50504-b5fa-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RpWNW6QVqTuud5b1jU3EeLBffx5X44O/JVXcqglWVKNEyAUrH+cmgY96X8WoFarMrKQ1l0m4OGu9oneuBZI4J9ISGy3BBz1pij0Ir/OfcQN6ikQnRddgXHBy8NEBlBJDG8MF+ZcFU7gEn8GEQBnxc9yHT0EaTmUxP8+2wcCCenA8FIm1F5gPswYbg+S5mUKkZdyHQtI4TiuheTeKXQXpyZywEGJbeDUDQZOqoIuqST00GRDFERDKXidJZAniH2B580MNWswcn+UFtdOfrVXUkUWLGX5Rebt0nRe4Cbxs5jwtwkO8vLtK9rU0GseXMlPbGdiA0T1uRZv86WZiu/WoYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+kg6+IJHxqILiPqgSli5P1UDg1reVgTH5m++TngXLs=;
 b=ZF54wH2w5vy1kkzD0Ww88HLYajMWd2TAZXRdktA6GFdqUnnSLNlfqQPo2U4PldrUq9zNt0P2vfOZ0SkdAfKMsNfRMQBTKlDtzxW9Xx3eWKai5BK2HOWM0nxashHSk/KSopPcpYpF+/cTf4to20KBJR6jXTXzUVDO1RPPgXiXxpNdc+IFyMBSaXFItbbqy0LiqkGszAhI2JM5Lucyf6YlIb5vHUDGmDY8an1zA2/H/J/R83Zs32ExkyosMRGoH/5ReWpYK1Q+9vkzhAlUJUj0c3v7Y+nHe1RT0/I6gZX/+qDOVxQa8OY0WPZCtOE6QJiethVgPqvs2GNcu4+vJe5bQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+kg6+IJHxqILiPqgSli5P1UDg1reVgTH5m++TngXLs=;
 b=YR2c9NVqJN+LmTfsMebBghi1YHjUMd/Q3mmEqBMVDIVerByz+IoAmFkjZGKBuxBhuepRfqao7355FEQDrTJuvBbC685qG+7JIm+52/GJgGeFOK49Ss7gNl44u6wpM+L0nVtv8a2zdHNoOLbwlckA3kuic9oKolvHrb3S4zQNtrY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Javi Merino
	<javi.merino@cloud.com>
Subject: [PATCH] coverage: filter out lib{fdt,elf}-temp.o
Date: Thu, 18 Jan 2024 13:06:41 +0100
Message-ID: <20240118120641.24824-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|CH3PR12MB8548:EE_
X-MS-Office365-Filtering-Correlation-Id: b8b1c237-1059-4f2c-f5e7-08dc181df4ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DBAwF0J7tnOueh0Zi7T3QuiRkv3iaDnhaC993VJ8bGNsfGlpBR6ZBZzTX+5ZIuUcaR8/OOXOU5DJKEkotDYnDYVfaO2u7uSr3WXbOuBmk0RA0VlWrJS8y/YK/vmBpzitFo9ox4+TOcQgepeW+n80SAcxQ1B7jTd7i+l+CQFPjpEDSe0XPjSs1u6YeImR98gKGm6AtJ+AI9baC8hI3AZ/UoRX/JWX+k8C3gZB8yQEemiZmQYn7sbhPf4BsRQlYwkF7pmCyRjGvdX1e2sBAvXPjr2H97hhNyJGAY7gbhWkJ7B8xAdm3QQQgCuZBXDFIww6lbq8LzTU/b8whdmdUXj5dUZqJ+pHiyZqSso4daDKol3hLH9+2nC4+2Brh1LxLNR/Ft+hu+4Vyyouz9eEA74LN/D/pTLvqTvGoOtC9ouLPYZv1uZzuQZbg1Ylz2LjwqkNhZIJch8ltB3Ew1anhn0s2p4MNJeAu+1PpouxF8N5ukYR+TskxN9TMplVEf99v3IM+5b/iANvDVpFdpWsmOg99lLOUCmoCKeZWSrDBKwGk4DWCe62HHJ3zkHYrp08kkwzq4CWH/I+02E0F4N76cJMh741vi7rSBfmlBHC9a1uHE/KeDdh3pA2FQp4Ap1GTO2g64FNbBmmW0m5Puj1tm5LuP5WIBUjrDTKJVM1Gku7MXo8eNw5WTTdFt9jsnn4eSLb93AFXnS9lkM8FUjkaunP5Y3OM6X3XmcSVvv/sDhhfrVKCraswMkI9LUcM+TOfjU2q14JXG0+e4+fUmDHgQtesg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(136003)(346002)(230922051799003)(64100799003)(82310400011)(1800799012)(186009)(451199024)(36840700001)(40470700004)(46966006)(36860700001)(47076005)(4326008)(8936002)(8676002)(81166007)(36756003)(356005)(41300700001)(2906002)(86362001)(82740400003)(44832011)(5660300002)(26005)(40480700001)(40460700003)(1076003)(426003)(336012)(478600001)(6666004)(83380400001)(2616005)(54906003)(316002)(6916009)(70206006)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 12:06:52.0937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b1c237-1059-4f2c-f5e7-08dc181df4ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8548

At the moment, trying to run xencov read/reset (calling SYSCTL_coverage_op
under the hood) results in a crash. This is due to an attempt to
access code in the .init.* sections (libfdt for Arm and libelf for x86)
that are stripped after boot. Normally, the build system compiles any
*.init.o file without COV_FLAGS. However, these two libraries are
handled differently as sections will be renamed to init after linking.

This worked until e321576f4047 ("xen/build: start using if_changed")
that added lib{fdt,elf}-temp.o to extra-y. Any file listed there without
*.init.o suffix will be part of non-init-objects for which COV_FLAGS
will be appended. In such case, the solution is to add a file to nocov-y.

Also, for libfdt, append to nocov-y only if CONFIG_OVERLAY_DTB is not
set. Otherwise, there is no section renaming and we should be able to
run the coverage.

Fixes: e321576f4047 ("xen/build: start using if_changed")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/common/libelf/Makefile | 2 +-
 xen/common/libfdt/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/libelf/Makefile b/xen/common/libelf/Makefile
index 8a4522e4e141..f618f70d5c8e 100644
--- a/xen/common/libelf/Makefile
+++ b/xen/common/libelf/Makefile
@@ -1,5 +1,5 @@
 obj-bin-y := libelf.o
-nocov-y += libelf.o
+nocov-y += libelf.o libelf-temp.o
 libelf-objs := libelf-tools.o libelf-loader.o libelf-dominfo.o
 
 SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
index d50487aa6e32..fb0d8a48eee2 100644
--- a/xen/common/libfdt/Makefile
+++ b/xen/common/libfdt/Makefile
@@ -5,10 +5,10 @@ SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
 # For CONFIG_OVERLAY_DTB, libfdt functionalities will be needed during runtime.
 ifneq ($(CONFIG_OVERLAY_DTB),y)
 OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
+nocov-y += libfdt.o libfdt-temp.o
 endif
 
 obj-y += libfdt.o
-nocov-y += libfdt.o
 
 CFLAGS-y += -I$(srctree)/include/xen/libfdt/
 
-- 
2.25.1



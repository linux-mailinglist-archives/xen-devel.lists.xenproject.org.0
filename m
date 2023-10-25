Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A39C27D6510
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 10:29:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622700.969763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvZGB-0003wZ-Nz; Wed, 25 Oct 2023 08:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622700.969763; Wed, 25 Oct 2023 08:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvZGB-0003u0-Kh; Wed, 25 Oct 2023 08:29:03 +0000
Received: by outflank-mailman (input) for mailman id 622700;
 Wed, 25 Oct 2023 08:29:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XAhw=GH=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qvZG9-0003tu-Ne
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 08:29:01 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89fab2e1-7310-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 10:28:57 +0200 (CEST)
Received: from MN2PR15CA0064.namprd15.prod.outlook.com (2603:10b6:208:237::33)
 by LV2PR12MB5798.namprd12.prod.outlook.com (2603:10b6:408:17a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.29; Wed, 25 Oct
 2023 08:28:53 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:208:237:cafe::d7) by MN2PR15CA0064.outlook.office365.com
 (2603:10b6:208:237::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33 via Frontend
 Transport; Wed, 25 Oct 2023 08:28:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Wed, 25 Oct 2023 08:28:52 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 25 Oct
 2023 03:28:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 25 Oct
 2023 03:28:51 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Wed, 25 Oct 2023 03:28:49 -0500
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
X-Inumbo-ID: 89fab2e1-7310-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Io/UcMPegHpM/ql8BAEI6mKqKtkMGAEg/sV/my/BTv+WH/BvhfbODz1/KdxWW77Yzi3akTdXI6xB+kG4Hh2GvME2HNrnPiNalwNJFjyJZCmu5YbAjM6KmQVJ9RLkfnJaROppRijBIbD7CZkjyioVlEEH46IGrzwAvozJv8METOMyGk93xNlBo5YX82WzgRYSA0jpAbmUCaLcSRQVMTIXbM3/H4To2XTh9h6bG29+V+4Hlv9YfwSPJiqcUIVcyxR529rjgm3YWqPt6cceyif2ipkZUpXCf1h5B84VREbGFBVkmJIpmDjvfQBOFoeQOkq+uLpprOhVqIyeT0zDdCF0qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAZHBNJKUQYFM4Jm7+3mJwKq70OpgNRzmyQQPMz3Fiw=;
 b=ahUAP9I3lgzs6NsTUsvx0VjzMEsWNaij65Ug2qo8eVTSxgz6ZlImDu+JAisay5IQZCErd3+EsrWynPFzuMXyKjD4YklEK4mJL17g8eNCuj6tpl1oFCmYSsKnH8O12WBSvxds7DBDJp4mKIt32SnvplpdtvHZZY4arau4Z//cSWjt30zgpmN2B4c/3BR2s5YmpZduliDuetaNPLDHO6cxr8Lx/9HYfa04oTwKsDi82iX0khlnQK9IEq99n4ps8j8JsT90g+SRIqe9QKBtNp0XE0L9v9mab5zJ517JK2kUS/dEvaUeVoDU4NezWwRRzLDdv09o33EIKpuZVe9AN1NUaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAZHBNJKUQYFM4Jm7+3mJwKq70OpgNRzmyQQPMz3Fiw=;
 b=M9bQQ0bxMtpbaiqmJRhhCA5G+X3MwloemRqHdX2O3emGgZCZXd8MzOrLUt3KLOOUjJ1MOn81ZxuIB7KzZWQPBw6sl5Fzqxnay0mORunFHCaugqlP9W6S7lzWhHkTJWoO5nvo/NLLrzkDfQeaULWPe+sDg0BdAjolbjWgHna0ns0=
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
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [for-4.19][PATCH] build: Allow setting KBUILD_DEFCONFIG in the environment
Date: Wed, 25 Oct 2023 10:28:34 +0200
Message-ID: <20231025082834.31680-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|LV2PR12MB5798:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d837ec8-2abe-4dc9-d762-08dbd5346bdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dnx3chwFcEe0UJluKXdN2cP3uH6eX2eT5EwRn5C7fXD+NB/Z19LeSs6g2EXqdWxn3A1oF1YIQ7KspUpXhXP2UFzwiemen8DH9aWxd+bfNBLq07xvoDGi+zRELyihKgIejgHN9AGhdi8yMbqIgz6lT7q5b44urxgM6f1nq9lDa84a3Rmv9Nyu/c/ZZF+G0ol7rhtXF9J7RGEpchWM/qYF1TR7VYtMFHixBk7nk4QwqRKla8FYEK0WfIHhvKweCAw+3PuAyBsQTMAVvWac1Rwb7PKFQ96W5oxx/DHqsrZpNmEy6kPN8WU7W11RvVK0JswrOGDIA7v1JE+q+eizh2KZz6/7MOF34sDSWLUFUnKmhc7I8Ik8bRRtfe2iYcGzA70H1oOeUGSQoBn97XKbix3FEKmqJ7Tz7ne7v6AlIj4UuWyrjU6DuksmR8UqmZn9AM1qtdk8GcIIvzHKHJ53VjEwDyTTzzA2J/S7QJIrPUudG0Qwp/+a8Tgo4FCmMdt1kerbidlNN3C1Xgb1BXlOP1cPa/XIZF7nmlD7AkMc+0BBgc1L/DXZV9JxzDiQzJpM+n+rwwkSwVNa29wBVCqb3cQxJWjE4PX5/vwVKvyLWaKRxlXLFDoy/eCc2sYDIlRIZpyTEpmcNkyZ/jYXHKOSzcOquUPInnjIzDCdqVoHz8iFH3luxCstStwEzynyipRMkbhaIjavUXTy4yba7Y3kxbD0r4+1PzgcuufEjje1uh9HIbP3731fn1exiHj3Amzd93Oh/f0KI4oREDmAyniT0AM3Bg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(186009)(451199024)(82310400011)(64100799003)(1800799009)(36840700001)(40470700004)(46966006)(81166007)(26005)(40460700003)(36860700001)(2906002)(41300700001)(44832011)(86362001)(5660300002)(36756003)(8936002)(8676002)(4326008)(6916009)(54906003)(478600001)(1076003)(82740400003)(70206006)(356005)(70586007)(316002)(40480700001)(2616005)(83380400001)(47076005)(426003)(336012)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 08:28:52.7304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d837ec8-2abe-4dc9-d762-08dbd5346bdd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5798

At the moment, in order to use a different defconfig target than default,
one needs to specify KBUILD_DEFCONFIG=<target> on the command line.
Switch to weak assignment, so that it can be also obtained from
environment similar to other KCONFIG/KBUILD variables.

This change will activate the use of KBUILD_DEFCONFIG variable in CI
build jobs that so far had no effect.

Note, that we will deviate from Linux in this regard.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
In case of reluctance to this approach, we can always do:
 make -C xen defconfig KBUILD_DEFCONFIG=${KBUILD_DEFCONFIG}
in automation/scripts/build.

Also, Linux defers setting the variable to arch specific Makefile, so it is not
sth mandated by the top level Makefile or documentation.
---
 xen/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/Makefile b/xen/Makefile
index fd0e63d29efb..40feefff4ab5 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -256,7 +256,8 @@ export YACC = $(if $(BISON),$(BISON),bison)
 export LEX = $(if $(FLEX),$(FLEX),flex)
 
 # Default file for 'make defconfig'.
-export KBUILD_DEFCONFIG := $(ARCH)_defconfig
+# May be overruled on the command line or set in the environment.
+export KBUILD_DEFCONFIG ?= $(ARCH)_defconfig
 
 # Copy CFLAGS generated by "Config.mk" so they can be reused later without
 # reparsing Config.mk by e.g. arch/x86/boot/.
-- 
2.25.1



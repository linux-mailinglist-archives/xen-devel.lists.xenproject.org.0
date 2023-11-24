Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1875B7F7372
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 13:09:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640613.999055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Uzv-0003av-7k; Fri, 24 Nov 2023 12:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640613.999055; Fri, 24 Nov 2023 12:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Uzv-0003Yi-5B; Fri, 24 Nov 2023 12:09:27 +0000
Received: by outflank-mailman (input) for mailman id 640613;
 Fri, 24 Nov 2023 12:09:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u6gD=HF=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r6Uzt-0003Ya-O5
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 12:09:25 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20607.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e0a6ac4-8ac2-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 13:09:24 +0100 (CET)
Received: from CH0PR04CA0099.namprd04.prod.outlook.com (2603:10b6:610:75::14)
 by PH7PR12MB8828.namprd12.prod.outlook.com (2603:10b6:510:26b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 12:09:20 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:610:75:cafe::da) by CH0PR04CA0099.outlook.office365.com
 (2603:10b6:610:75::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21 via Frontend
 Transport; Fri, 24 Nov 2023 12:09:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.3 via Frontend Transport; Fri, 24 Nov 2023 12:09:19 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 24 Nov
 2023 06:09:18 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 24 Nov
 2023 06:09:18 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Fri, 24 Nov 2023 06:09:17 -0600
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
X-Inumbo-ID: 4e0a6ac4-8ac2-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNYIpmC30QrK2drnNOGLfRMXw7ZNe/dLiHhg5bM2024XP/K/xJUtTOZSdSFYXNkWuS4xTEOluUWUN8NF6C5N8eyzx1i17hBKT1rxCueP2mXEh2EYCTNF19L4+m9VqR38k9ShrCucytjodGmpq1GXP074suOwLnU41e89sUvAEyJ0Mg40gz05ZzSDrZRr1RRolW+J5M+kH/ZuTPr4yVvhOVkfhv1MPzqXM3VXpKJgC07xVyXI/tkNtD11+1xF6hzweW0JmYKqjSEjHCbg2QdtzKXz5f0+xgBDkNXMiJGbK8ZEqzbQL2z1bcyvprbXQgdyhrbQgeWz6HQAYuD/ZlALMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oebaTVPYPPEn3j7Hjt48AyhfPRq2C9llOLws4Q96Is=;
 b=AV/xPuu7QvelvGHhV6JUd4p8+C17iaynz3e88TeuSBt4d+enVsGPC//MQjQIWxefSN4wHuiaUI3SqNpL8p/kUiQny4lKXHo/w3wo8nIN+vu+9GS95XW1NVbcElX6eSwOHDnInvuqC/DZ5ahaPILsL79roWCWFtEqS0XW5b+9Z4g4hylNKhUd0Jl1XYXUSLmaYuTabtmsguVPiYZkYzQBjtyqo2VLSvVy2WomWthbM4rKT27phgO71cOOrvvfJxDAvDd8bTrvwgORh79Dl2pwkttrkfrksEauN5Vx3dJypjS9no0FBv9bGpNKximulC6Bw5BCH263vFl1SACOE6ilFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oebaTVPYPPEn3j7Hjt48AyhfPRq2C9llOLws4Q96Is=;
 b=jj6cQjJvZLXGKdETPXzzk8S3WnGjNcS/xiHMAJqEWOUMzyTVwxDZ3IRq6fcARco1RU0stjxCssLZeAwTvLgkr2MH6X5GckoZ9rljyIKqdv55TYefiv8SBNezyiUUQFBrWRc0J3uF8+t9PrLDyl3eRC1biHRPWU+O+eeCLd/e+Bk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] automation: Switch u-boot boot command to bootz for arm32 tests
Date: Fri, 24 Nov 2023 13:09:07 +0100
Message-ID: <20231124120907.2044651-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|PH7PR12MB8828:EE_
X-MS-Office365-Filtering-Correlation-Id: f22ee2fe-72bf-402f-ca2b-08dbece62fd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qjon8eGIXTcX+9ZcW9h6FNd+d2XpibQjLogmfRyTaSdr6qyWeg4862WoTV72S64piU0INkCcps1Dyh6K5AgdYm5HuhIL+HaH+K7q7b/a75JHI3JSmpgbbDEyzQ4S339max0u5axIukDPmu1KafO5Ty/4ZCQOR/Nxf4hZSx8LcqRFioFpvJFpe6Xwt3VrhdK4ijTQrKU/6RBMfXLLvQsT8lCxeeYhMSE8W8IkSTCA1xC+POt3iKb3QZ+4CuweqzT8zA/aT8wgH853tg4F1ebWI2hqtUUy/FpuxSEoVlK7KXLVyWEvzn32cTGeBMbdbAfXq4cfb6zWk/4uDaTp4aU5ARs3JqyoMLPr9yB84TVPrFQqkCGrJ3pCxGKPzx6YYpQxCihCfUGoQlPsIx8vgsxprnIR2iKwcyteVIt78F7f0NpyPqgJs7jyUPmPoEGQS0anXbr6fV0U6plq4jcLP4WB8ZBVohNIQ1g3iF1pjE5OJlnurYTaPPLK1/2nsH/p/OkigVajjK3/ZOIxP12bQr4sTbo1RjMwdM2lyHXYv+3jFgLGeYc+1Jh2/C2U6cX81o7BbqPbVP/tIFTShsXMLZJgytaf1L2jmvEcqzTbNgLzgSCxdd7n5Lps9HEyFzie8H1Z8BNn8Svyhvpzha1Ng2JvuCMDTDzDTfth47A0xaXmpCoYwFcKy5Ndyf1PISekHVTUlUaRgCrQ8QoCXleKa0Yx4sNoH8d66ltZhIXwDz8BMLl/HBQFMhwKU/9ErQa3A7awiMxbs+uoXBR7qiZlPE8iHqilYk8TrDfQujwjQ429sUs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(346002)(136003)(230922051799003)(451199024)(186009)(64100799003)(82310400011)(1800799012)(46966006)(36840700001)(40470700004)(70586007)(54906003)(316002)(6916009)(70206006)(478600001)(966005)(40460700003)(6666004)(5660300002)(86362001)(2906002)(4326008)(8676002)(8936002)(44832011)(36860700001)(2616005)(47076005)(356005)(36756003)(41300700001)(40480700001)(26005)(336012)(426003)(82740400003)(1076003)(81166007)(83380400001)(36900700001)(139555002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 12:09:19.0930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f22ee2fe-72bf-402f-ca2b-08dbece62fd9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8828

Thanks to recent changes added to ImageBuilder to support the bootz
command, which allows obtaining the effective image size (including NOLOAD
sections) from the zImage header, switch the BOOT_CMD for arm32 tests to
bootz. Among other scenarios, this change will enable us, in the future,
to add tests with UBSAN enabled Xen, which would otherwise fail due to
incorrect image placement resulting in overlapping.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Before adding UBSAN CI tests, we still need to decide if we want to add support
to panic on UBSAN epilogue guarded by some config option or to just grep for
UBSAN message.

CI pipeline:
https://gitlab.com/xen-project/people/morzel/xen-orzelmichal/-/pipelines/1083821754
---
 automation/scripts/qemu-smoke-dom0-arm32.sh     | 2 +-
 automation/scripts/qemu-smoke-dom0less-arm32.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index a4b487b08055..d91648905669 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -68,7 +68,7 @@ XEN_CMD="console=dtuart dom0_mem=1024M bootscrub=0 console_timestamps=boot"
 NUM_DOMUS=0
 
 LOAD_CMD="tftpb"
-BOOT_CMD="bootm"
+BOOT_CMD="bootz"
 UBOOT_SOURCE="boot.source"
 UBOOT_SCRIPT="boot.scr"' > config
 
diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
index 7e3cfbe9c4d0..e31b6b9014e1 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -101,7 +101,7 @@ DOMU_MEM[0]="512"
 NUM_DOMUS=1
 
 LOAD_CMD="tftpb"
-BOOT_CMD="bootm"
+BOOT_CMD="bootz"
 UBOOT_SOURCE="boot.source"
 UBOOT_SCRIPT="boot.scr"' > config
 
-- 
2.25.1



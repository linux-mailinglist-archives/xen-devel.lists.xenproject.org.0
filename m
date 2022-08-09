Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E04858DB73
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 17:57:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383054.618157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLRbf-0003E3-A9; Tue, 09 Aug 2022 15:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383054.618157; Tue, 09 Aug 2022 15:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLRbf-0003CF-7D; Tue, 09 Aug 2022 15:57:23 +0000
Received: by outflank-mailman (input) for mailman id 383054;
 Tue, 09 Aug 2022 15:57:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TVJh=YN=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oLRbd-0003C9-Ud
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 15:57:22 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2089.outbound.protection.outlook.com [40.107.96.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f230d758-17fb-11ed-bd2e-47488cf2e6aa;
 Tue, 09 Aug 2022 17:57:19 +0200 (CEST)
Received: from DS7PR03CA0183.namprd03.prod.outlook.com (2603:10b6:5:3b6::8) by
 PH8PR12MB6723.namprd12.prod.outlook.com (2603:10b6:510:1ce::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Tue, 9 Aug
 2022 15:57:16 +0000
Received: from DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::d3) by DS7PR03CA0183.outlook.office365.com
 (2603:10b6:5:3b6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Tue, 9 Aug 2022 15:57:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT046.mail.protection.outlook.com (10.13.172.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5504.14 via Frontend Transport; Tue, 9 Aug 2022 15:57:16 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 9 Aug
 2022 10:57:14 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Tue, 9 Aug 2022 10:57:13 -0500
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
X-Inumbo-ID: f230d758-17fb-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNUzCxbA9s4ahXNiioA+dYgSFOyE9PJTVKW/T6UisViNFj95LQmOABXPT3cjFY2IASWd7W/n9PtQQedawsUZhNR9ALgbS6jWMJlzO1Lb5iWuhWG3wo8CU6mbmvPoVMBozR1K5WnU4K+vO78doALGriUEs3UW0p9UpZSztRPgs3Y6Swx9vbJ08aFXHoqLfE4pScX7awBdqb/S89bIDu4rHd5idnwByYJQvBBQ4t61yCdiCOenvWpYs3fmmo02hy8oaxJZXzOSib2AWeU0VwaQIlfKxXVV+uudKwU8apOyjMoI16Tn68IsaOOsvKPZPZctZ+JYPQQ1H4pNchgx7FM/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAUABT5KI2RGeCYMYaaE9z3R2dDgSDAkJ8fTYgIVVTk=;
 b=d7C/kDD2c6lgiOfxSqlwsoBYfXbpIk3aGZF5SBG/t0UIwV3S4T3f3Md1r7d19aOIxBZyd1vhlx9WCoKspa8lhZ5OneD2/d0qoVcw5bWCEtUMMqIlReybr0op4dKwtDJTKsmqch/p2Ob+5Fbmon9UDPUrPsVCvU6KjQF7HnF1afjTDHgnOs0CsA8UTkL9KyeX9lSAhKj+K3rZIKuYXMlC4gy2XAkK0f53wYR6RdTc0ufBBPmP4ZAn4Mxpk2b/UBGJkKSVblM3aNkq/CNnP/K5pDvdE2PprL11SluRofD69U7faCjqXO54NttItNwf7apzPV+5BSIp4Xke6rDgiWTsTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAUABT5KI2RGeCYMYaaE9z3R2dDgSDAkJ8fTYgIVVTk=;
 b=X2dXVDKFX4bi3oor/ohm/OMvpsZai5YQ6f1+Xx5QlE68qx8FPQ5IzrnjdFWxTqe5LwxfTwBcu/JPtlhDGFoHTU2FSSu5rpcCTXuYZAgSKBfypX0hXTrE8C3q0Jabo3fu2xxyEcn32Hs5Gf+2yDd1a/NQTgRu8BzDJ6l6fxUGrdo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <stefanos@amd.com>,
	<cardoe@cardoe.com>, Ayan Kumar Halder <ayankuma@amd.com>
Subject: [XEN v1] gitlab: automation: Fix the automation scripts
Date: Tue, 9 Aug 2022 16:57:11 +0100
Message-ID: <20220809155711.39168-1-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15278ad7-8c10-4773-b505-08da7a1fd4f6
X-MS-TrafficTypeDiagnostic: PH8PR12MB6723:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D4ZaFdvV2UMEUnMMrC6PfSzcyG93C7oEsnGb/4lyNYYC5BAxxEwjbO1gJVM6oaVeo9stKV+suRShXuDv3bJBtF7QHTNkZ4/uCSNIwTNMGjAnLpdq54gPjAEsUbCM7V9MLUkCRhHg/bthSvUOvd26P2LmVlPh7A9r6kaypXpghAkVq/oWslLXnLuUv8Ln3lBcdTwwXFUVR5HbGE/1zgKgokwPZzSDoOrMYYFlIcAG1xt1xf3KxXbG4Xw/EfjYTpppg3G3olvSW6j+WJrBKe3qZUe1JifIbMjGc47W/vkRDK+FGyyrShySoJ/Kc8je/P/jv8O3Ldhug8Ahb8qGyvvYlZcR4iV5eCQoCaC2vsu1Cqf4DW24yQhBiCm8jfYpkAt78WgorXCAHY/cRGzzpwSGPgsoPvSCEZouAClGYVEMy6oA8CzoM9x5EjF3cMrlVkTRD27XjHEiQB1iOV+1wygUuUL40Z2gxyEaEY6POmBvzX7WHM+k7iPmD1im+leR4ccLgyG0jrqYiPnIzKBXkqVgHtrCvOArI7ZHh+HGfQzIwMLmTa9ykFvEvBD7lsCXfojFYbvGlNochY899DgS1dIflPGYGMKtvw5vJLyfenuRVUL6vdjDDs2F+wNB2cEnLm8vvu+ao+tAJyKyYCaSL38CsIVsKO0x7WZNtphtMyrw7dqqFT4KxavGxcMfxvOBG61Jce0K6o0VnTRwdY5F/rZRJharddMVsF+ghVgk8JZI7zz7DtrKNr+AJTv5eANnx/T3H/zSZ1y3X3ThvmrP19vc75py/bAbuutlexdGWfbN72gygoP3UFva0kNJuxvV8O2uMZ5bRpDeGOti8oml8RLwPBQsUttXUSw+NugyAphe5sswk6tiglepNYhG7+XT5t+V
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(396003)(346002)(40470700004)(36840700001)(46966006)(26005)(8676002)(4326008)(82740400003)(70206006)(83380400001)(5660300002)(82310400005)(36860700001)(70586007)(40480700001)(41300700001)(2616005)(36756003)(40460700003)(6916009)(81166007)(478600001)(8936002)(186003)(2906002)(356005)(316002)(966005)(336012)(54906003)(426003)(47076005)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 15:57:16.0921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15278ad7-8c10-4773-b505-08da7a1fd4f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6723

One needs to run 'apt-get -qy upgrade' to upgrade the old packages so that
the missing dependent packages are also installed.

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---

This is supposed to fix issues seen https://gitlab.com/xen-project/xen/-/jobs/2832045004
The failure is :-
root@4a175985cd71:/Users/ayankuma/alpine_vm/xen# apt-get -qy install --no-install-recommends u-boot-qemu u-boot-tools device-tree-compiler busybox-static cpio curl
Reading package lists...
Building dependency tree...
Reading state information...
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 libc6-dev : Breaks: libglib2.0-dev (<= 2.72.3-1) but 2.70.2-1 is to be installed
E: Error, pkgProblemResolver::Resolve generated breaks, this may be caused by held packages.

For this we need to upgrade the packages which will resolve the dependencies.

 automation/scripts/qemu-smoke-arm32.sh | 1 +
 automation/scripts/qemu-smoke-arm64.sh | 1 +
 2 files changed, 2 insertions(+)

diff --git a/automation/scripts/qemu-smoke-arm32.sh b/automation/scripts/qemu-smoke-arm32.sh
index 530f3892fd..e7e733798c 100755
--- a/automation/scripts/qemu-smoke-arm32.sh
+++ b/automation/scripts/qemu-smoke-arm32.sh
@@ -4,6 +4,7 @@ set -ex
 
 export DEBIAN_FRONTENT=noninteractive
 apt-get -qy update
+apt-get -qy upgrade
 apt-get -qy install --no-install-recommends device-tree-compiler \
                                             curl \
                                             cpio
diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
index 497dbee15f..f714aacbb3 100755
--- a/automation/scripts/qemu-smoke-arm64.sh
+++ b/automation/scripts/qemu-smoke-arm64.sh
@@ -23,6 +23,7 @@ fi
 
 export DEBIAN_FRONTENT=noninteractive
 apt-get -qy update
+apt-get -qy upgrade
 apt-get -qy install --no-install-recommends u-boot-qemu \
                                             u-boot-tools \
                                             device-tree-compiler \
-- 
2.17.1



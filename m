Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE79260A40B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 14:05:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429049.679813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omwCP-00087x-4d; Mon, 24 Oct 2022 12:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429049.679813; Mon, 24 Oct 2022 12:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omwCP-00086C-1x; Mon, 24 Oct 2022 12:04:57 +0000
Received: by outflank-mailman (input) for mailman id 429049;
 Mon, 24 Oct 2022 12:04:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tdD1=2Z=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1omwCM-000866-Vn
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 12:04:54 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 113fd497-5394-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 14:04:53 +0200 (CEST)
Received: from MW4PR03CA0300.namprd03.prod.outlook.com (2603:10b6:303:b5::35)
 by DM4PR12MB6328.namprd12.prod.outlook.com (2603:10b6:8:a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 12:04:50 +0000
Received: from CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::6) by MW4PR03CA0300.outlook.office365.com
 (2603:10b6:303:b5::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Mon, 24 Oct 2022 12:04:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT063.mail.protection.outlook.com (10.13.175.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Mon, 24 Oct 2022 12:04:50 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 07:04:49 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Mon, 24 Oct 2022 07:04:48 -0500
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
X-Inumbo-ID: 113fd497-5394-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HlPCMzC7z4yW5AjrqC5LFWy1q3GDPZY2f4DdjShJ5/XsaL8R5uNvNTNTD/43il+6naYIBAYfTuI4PR8NfS8x8ElC9SpgCKbhTgP5K5/Tj3H14v6uifv+jvFttjSPpOpTbKbgVEEtQtneq9qICsYtZ7l3pXre+17K8aP7yyDe3os6YBs8f9LlhdHNKq1PU1++1YBlySkYJJlOhx21twr4s30cDdeMeTfW+UNw7vXhvdWivRa+yFU28XP3UWEGt5EFBrIqAjoo28MjhLqhlmH7Q/578VbdiQSk3jK17s/mi7XKdV0GwfeOB7ETnatU7pW3mLqIbyqWrKKDBf5cIFMoDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCeunKUDYS7dW3EKFsxJvNMpnPsl3HJEwwfTpZQ3bMU=;
 b=X02YmLKcGiHbMi+/3rTO9VI6iQtNbN/s2z7P8hucFSwmv5xXKyxhDkC1BPUnnM2uF5amjk2jSqx21wVQ/xQBSGaG2aj7OXWGmXtA2EyABgHX/sOPQnpfWgRAf8RDNmeKfpsnLiDUo055fWtMRL6V5sHhUw1yTDGIVwjfyG8dGlcZZEkou2oNvJt3szehGpj9VBvHZHnTUY8jViZ7gN8wRBZdW3zbGhdYRnrvwG+qdInlRoupklQgQSuDiQj1bV2w/L7HTsVFyybFaQ3g/zgsxCDzeLP+C+vL8EGnFBkTYX32Wm+AT8S/kOACy7IVEBlQ0+1o73abg9A983ERrF1RIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCeunKUDYS7dW3EKFsxJvNMpnPsl3HJEwwfTpZQ3bMU=;
 b=uD6g+9KujZpD7GuSGDFcHSD00uVEWYGF3+ZggK/dfAmftZhTVIoEvBiT35DH020EsmhLgt/B4pG6w5WEi4gKrEziIbU22dWhMinZGhjtzD2Ab6h443gVC8rgwoR6Aof46wvvvWc6N81XzC8lVyc4pId0WPhemlPEYTFkKWZtEZo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, <Andrew.Cooper3@citrix.com>,
	<Henry.Wang@arm.com>
Subject: [for-4.17, PATCH v2] automation: Explicitly enable NULL scheduler for boot-cpupools test
Date: Mon, 24 Oct 2022 14:04:43 +0200
Message-ID: <20221024120443.16202-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT063:EE_|DM4PR12MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: f03b1416-94ea-4db4-2efe-08dab5b7f3f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	shicq1BTe4dC5HZeMvEYtR9ZVlVEnzg7aSU5YVAHuL50Elv5I0tunJoPUgxzYFyvyquUY/hDXAsa6pvtQF9xglC7t/PS9EXPbEila9dimPEAmgpcL+pkismDVfNq462zEYQqlP3QXsydCUodhQpBV51YzGAjwnipLE/Zn9vBqrdxgXmhgqXfZOgvU2xiOQDy/DvMmg8yoZhJG5Mn2z5Eydn7oNe7aydlpD9SD99Xj/IVqafxL4S2hFN8+da9y5H8E6lyDC7kFd90AcaErZ6SfgZhq+6x9x2n8dVZp2zB6sdaGPqQwv4tOGNqxDsY5trutWtRRa2+IFzuraCHXhpVzf7ZWlZQtRBJ6jl8UYhvrwx4apJ7hFBcBPQdths2PzBhKABj3PZT9u2kzUwEOcP+3CMF/OZf475pONUz9+0GDujOiaxwwS1BIWm+pQAnTJ1o67V3APe9i8jTQcP5rOUsKWGs8+euU3qOdr5v+CGuxUrtWi/cqX3lJwueHwri9/fI5TyAd8fdB51SCi0EbL5O8TPCbNDWHoxfo4R9Rra3+JcnFyoW7cgLTd3PaO+ItAoz1+0nNY0Ihbe2o3SrKMyEi9xhT3BoJXPMuId2wtxVDWJ/9bg5N4jXPnUd+DY5Hn2sodc9hqJ4+CA7ITSQu8gZ8GUNm/m8PAU3U2Sd0IlonT2R7j8TvFeUL6rHT9ko9VI9u9T/xb+2mJXkBNmbKtSFFonrbuNCIqss6wVa2rISpHsU+AyZKuAwoQ1IZjSvf+zVNg50NxiEBbRqAP3xM5xncSiumSaCcH86Zr3JO+UTaSazYCGWAFbqOGCkmxa/DvjB7lTGVinBlfDnCizjvJ9elQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199015)(36840700001)(46966006)(40470700004)(40460700003)(5660300002)(966005)(8936002)(36860700001)(478600001)(44832011)(82310400005)(26005)(2906002)(6916009)(54906003)(316002)(82740400003)(41300700001)(186003)(1076003)(86362001)(70206006)(40480700001)(70586007)(81166007)(356005)(4326008)(36756003)(426003)(2616005)(6666004)(8676002)(336012)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 12:04:50.1227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f03b1416-94ea-4db4-2efe-08dab5b7f3f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6328

NULL scheduler is not enabled by default on non-debug Xen builds. This
causes the boot time cpupools test to fail on such build jobs. Fix the issue
by explicitly specifying the config options required to enable the NULL
scheduler.

Fixes: 36e3f4158778 ("automation: Add a new job for testing boot time cpupools on arm64")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
- was: automation: Do not use null scheduler for boot cpupools test
- modify the commit msg/title
- explicitly enable NULL scheduler by specifying all the required options

This patch acts as a prerequisite before merging the following patch:
https://lore.kernel.org/xen-devel/20221021132238.16056-1-michal.orzel@amd.com/
(to which Henry already gave RAB), that helped to find the issue described
in the comment.

Tests shall explicitly specify the required Kconfig options for non-default
pieces of logic, thus this patch is unrelated to the discussions whether
enabling/disabling the NULL scheduler should be controlled by DEBUG or not.
---
 automation/gitlab-ci/build.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index ddc2234faf39..716ee0b1e460 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -582,6 +582,9 @@ alpine-3.12-gcc-arm64-boot-cpupools:
   variables:
     CONTAINER: alpine:3.12-arm64v8
     EXTRA_XEN_CONFIG: |
+      CONFIG_EXPERT=y
+      CONFIG_UNSUPPORTED=y
+      CONFIG_SCHED_NULL=y
       CONFIG_BOOT_TIME_CPUPOOLS=y
 
 ## Test artifacts common
-- 
2.25.1



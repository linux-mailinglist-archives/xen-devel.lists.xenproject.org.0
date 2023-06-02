Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EAE71F74A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 02:49:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542792.847104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syR-0001g0-PD; Fri, 02 Jun 2023 00:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542792.847104; Fri, 02 Jun 2023 00:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syR-0001Zj-E6; Fri, 02 Jun 2023 00:48:59 +0000
Received: by outflank-mailman (input) for mailman id 542792;
 Fri, 02 Jun 2023 00:48:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQ40=BW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q4syP-00018B-9F
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 00:48:57 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40307ee2-00df-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 02:48:55 +0200 (CEST)
Received: from DM6PR12CA0018.namprd12.prod.outlook.com (2603:10b6:5:1c0::31)
 by BN9PR12MB5163.namprd12.prod.outlook.com (2603:10b6:408:11c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.26; Fri, 2 Jun
 2023 00:48:51 +0000
Received: from DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1c0:cafe::3e) by DM6PR12CA0018.outlook.office365.com
 (2603:10b6:5:1c0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Fri, 2 Jun 2023 00:48:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT058.mail.protection.outlook.com (10.13.172.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.24 via Frontend Transport; Fri, 2 Jun 2023 00:48:50 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 19:48:50 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 17:48:49 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Jun 2023 19:48:49 -0500
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
X-Inumbo-ID: 40307ee2-00df-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBgdIyNx1lErEsqHUSihRG7XOhpgomU+O0DXYoEyE3UAjpE38BXonyk4/vzFUe4uXRRpMLabQKok/vU69nswDKAwdACmp6rquxo2INI6EbpMp6qSoGSdOKBeKnksGKKZooXGriS5N/ze8efLJRoqjTZBdEPyriiI1INEr51K59yqK4AKgZDeqxioV5VnwLMnmQvnqwgSBmVy1TRV6GjBxklVIsb2Ijylt3WIRF2O+1IjoHuExpBDVIM+w3U3smmKZzavz49Sa3XBxHK0ofIbXJzJx4xCWetCWJ6/lPxxt+347hWwZV5ACzApyfLSvKHF3DGeiAhTnMSBXIvS0Q9qJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aOH8wbfxJ3CDB9n8z4otIPVVDXaY3ZnHxlpPeTlbO8=;
 b=P4kPavBZ8MkGS1uEWTtSnvjYtqV3Eu6zW4EZDm5kfv8Tv9ZwYkHlrUPF6tYubk7ZnJi4Swg8ruzLfnO9abM0lKTWl8FZEdptrgd2wxZ3b3qng1xWDBJ/+ouNquSaClcKPKweIuP7JC56Jwni010TvQS1tcnOJFjr+xJVsfVW2pSWeNeODfEhEgPhJard/QM0HIsGY26MY3Jnclmjd04azp1QQ+eLsNKLrQ7ouBpGSQlz7oz9HeIjFgCerRdU3lVw5Hj/9GW+ASXpp/WAvx/gOFtFEOWk3V4chlAZ3HAXFfmODzTUBNkb68zxqf68/JfDKvZ7gLpW7MgLEgmSxy5MYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aOH8wbfxJ3CDB9n8z4otIPVVDXaY3ZnHxlpPeTlbO8=;
 b=L8kfweqG9wzxNi+4XwPRAqKBDHJ0GjmPGlf34fxd0YTmHQQyIXeBIlRdA4dZsuX21CZQIxh1qgi9yqEi8qHqjDcdIKrfvFzmqXpk+R2ghJyY4ZNhJBuiCFhE5/PaPFq7xYigyXq4D2gatC7iGiPwdvqXuGDeGp66lSQHt8jjkVE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Subject: [XEN][PATCH v7 06/19] libfdt: Keep fdt functions after init for CONFIG_OVERLAY_DTB.
Date: Thu, 1 Jun 2023 17:48:11 -0700
Message-ID: <20230602004824.20731-7-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602004824.20731-1-vikram.garhwal@amd.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT058:EE_|BN9PR12MB5163:EE_
X-MS-Office365-Filtering-Correlation-Id: cbdab297-8486-4c84-ed80-08db630321ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bQdRVhgx3JNVKksLG2YJ0P5KsJp+9nt/MgflSR3ZxkNC5wCn1Lszc4GB/IBo0iZ5Wa9MgdZZZbv7HUTN1FPYqFStWFK4M5Ty5l6D0K2F6Q1YWPDEuAf38Eb+LR+QH3VJvk1a8DSIM9FmTIF9ca7vdzTThX5ySGVleL0vAb0GzbOiN9R+vadbICwNN5s0yxVo9ISLA6hQync7FhcclnYFQ7+dwt+/aIP/EwyWXorlRiO16eM7Klvij/p9Vmeb0rbu/bpcudcMBTiRR+xbKEOl6r/tz85mlv9Ry2VUZwzYOH0/LbiWIwd5j5qYg6GgWonxJrTmL1DDGe+YUmXCvvQkdYhh2hEMUa+Z33eC5wv3WPDr13CKXJtmazzzNOYB+FuzkVsLDCCFnHMQbVchLiayz02HqI7vvdv0q4TyrYe2t5JwXBPnSLj9KYfkl7gYtVtvgFm6SG+cZtHxI3JZcY7JDVlv/qc1FzUeFegqNATuXcCqXZOQp/Qw5p2ofOZZGe3ZiNfICsbSfgyrIxeMOwGFiLmwNCgp5VsFEQmSUvNvJf19d/KgjdKTtUds2sXQcGR5zzth/UlkkJ6mHqboTQakI9qO8DFG5jvv9J66jHPJOvHgNEjAbRt+uFa9jCAA6tXJeiPEx9Ko46KihHPnznneBZIghmjhTvt6BZIttbmM/a09GoA/2U8Q+xo4A2iG71rLq+cFsb/PnWXUdVLJPzkygq0iFqEPGI1bxikynCZMaedaoRp66+H867xhICeobwQH/W0lLOBWTFQbLPaO+aPWxA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(36860700001)(82740400003)(5660300002)(81166007)(356005)(8676002)(8936002)(1076003)(426003)(336012)(83380400001)(2906002)(26005)(2616005)(4744005)(47076005)(44832011)(40480700001)(6916009)(6666004)(316002)(70206006)(4326008)(41300700001)(70586007)(86362001)(82310400005)(36756003)(186003)(478600001)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 00:48:50.5537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbdab297-8486-4c84-ed80-08db630321ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5163

This is done to access fdt library function which are required for adding device
tree overlay nodes for dynamic programming of nodes.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
 xen/common/libfdt/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
index 75aaefa2e3..d50487aa6e 100644
--- a/xen/common/libfdt/Makefile
+++ b/xen/common/libfdt/Makefile
@@ -1,7 +1,11 @@
 include $(src)/Makefile.libfdt
 
 SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
+
+# For CONFIG_OVERLAY_DTB, libfdt functionalities will be needed during runtime.
+ifneq ($(CONFIG_OVERLAY_DTB),y)
 OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
+endif
 
 obj-y += libfdt.o
 nocov-y += libfdt.o
-- 
2.17.1



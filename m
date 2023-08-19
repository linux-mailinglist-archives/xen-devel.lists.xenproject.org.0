Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EC7781609
	for <lists+xen-devel@lfdr.de>; Sat, 19 Aug 2023 02:29:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586700.918021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9qF-00043r-FI; Sat, 19 Aug 2023 00:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586700.918021; Sat, 19 Aug 2023 00:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9qF-0003th-6Z; Sat, 19 Aug 2023 00:29:23 +0000
Received: by outflank-mailman (input) for mailman id 586700;
 Sat, 19 Aug 2023 00:29:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eu5+=EE=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qX9qB-0001hl-Pk
 for xen-devel@lists.xenproject.org; Sat, 19 Aug 2023 00:29:19 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e70ad3f-3e27-11ee-9b0c-b553b5be7939;
 Sat, 19 Aug 2023 02:29:18 +0200 (CEST)
Received: from MW4PR02CA0026.namprd02.prod.outlook.com (2603:10b6:303:16d::25)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Sat, 19 Aug
 2023 00:29:10 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:303:16d:cafe::ba) by MW4PR02CA0026.outlook.office365.com
 (2603:10b6:303:16d::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Sat, 19 Aug 2023 00:29:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Sat, 19 Aug 2023 00:29:09 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 19:29:08 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 18 Aug 2023 19:29:07 -0500
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
X-Inumbo-ID: 6e70ad3f-3e27-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyZ4fcsLCVOjkIXzgnUa6ji+61VMET/U7h7KMIR2aX7RqGL9HS9jvWToAbQinVE4K9uECpGMmsAunH8n/gIvANkMUIWKGhhDvypFzDF+eV++2caX4Pl14NZobPlGW9lquptJGsyZbVB8eYl2YUDM7dVLD3shxVsSC1tmO5Ilu8cS38AOd48mnJwDY1ka3rI/brNtxqIZa83+YA72I8pLxVmlT3ET4cnytvkouKD2DYUymciq+R/16z/5VyxV199JNVBYyDlGQH4hVOHJEixWnJoK9mxmalriZn/WdK+g9mAhRGy6oQ+25ySHuZbMa/PA5mv8w8zzmEHI0CfWWTonOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aOH8wbfxJ3CDB9n8z4otIPVVDXaY3ZnHxlpPeTlbO8=;
 b=I4avalaNMVLwxKCpWNi4BmXBINW5qfumrsN5+9Sl6AySRojApVVpzLWIrOG27w2EZYn12E6E/tzcJ8tIOVByYgrc/H7dsmPWPfTdan8I3Dx6la5dhtE239bd9VM7TE44zEF2PZfhErNbdbBxqwF5uIZQOp8mBoRMRmo4kfjD8DPKDjP5gfCKspuNRtLvrNmilkry6bIIiIskRCqJ5yVVnjK2LNyZf4Cc8p6T9pPtmEPXn4vGrCgBS6B1GpdZ7PfoFGFfmf8fzrSJpQVOISp0m97JcOGbVilrmKZA4p1RhZTMgw7XGyoR1agZ5+LNzzM+/dsQqivPM5tXTZQD/Q8xnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aOH8wbfxJ3CDB9n8z4otIPVVDXaY3ZnHxlpPeTlbO8=;
 b=iWCDZQEM6u4AT6MxBi/F/m58WQ4LDOmxrp8cNjfvPAMm0mpuXI//gVDCNV7Izn3xpa9cFRr64F/FoHV1HLqoBsGqFWZ0FEmnnqZdflKjCq2GXxnL1hq4WNpG7nfwnb6ran6I7zBYPC0Rf++l7lCch6qXmGPXbrA/xwW0oqjo6aU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Subject: [XEN][PATCH v9 06/19] libfdt: Keep fdt functions after init for CONFIG_OVERLAY_DTB.
Date: Fri, 18 Aug 2023 17:28:37 -0700
Message-ID: <20230819002850.32349-7-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230819002850.32349-1-vikram.garhwal@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|MN2PR12MB4111:EE_
X-MS-Office365-Filtering-Correlation-Id: 3882f220-e7f2-4061-a760-08dba04b4e57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FWBXhnZXhm6KYWTR/4SlGUbbfY89AIzY+ojC1kffJ7ZvxRmaVRtZmImfO0NnnTpTlMAfrYZTWu3CA2FlN/xmDCxjdeVQeU5n4jn6CNODtE3lAZ0YHzRRvJmAjKT9TQtNBAHN10nPSX+j9wHmb5O8EGvB6nvEFhlOqi3l37iwH6URWMgEqgu4ppsFLMLQt6+cFUlQUGDzdQqBOYJ8wQmOgtDnJNZCAwPAI3DQ0ey/jCMOkz5bF+eGgqsiKXdEYLREguCCyhiTnxd5UWuXNlzvkn2CyJf7D/ZoQCOKMVdk3CzgcAWfm+wXF9n1jgpS6MrftEkoDPTx6Cm8XsATwCP/fGFPqQMf2UrylD6+LQbwSSz4+nbZTAf1dL0xNkuJtbLjMEuJkCQsNZEgFzQQy90D58/nctFVc8m7wW+YNasqnwvtXgeLDjntGcbcrzaDF4uyOKDhy5jO6QEZRUqJ9WCnM/BWbtQ1FDKm5jrxUBPFsDr0F9LGtU4aq8kLnqvB+MM2FXfXhRpD7+4dr6pEijVTtO9IQ+0+OP/1L5ZjqGRHVGhGN6DDHsJVe+4vjfSEOfHa3WB91Rrr1RfKJpp4NMaXAli4Rc1yuP42rjfg3GDGk7IKK/zPRrD8pIkT0czG0ZGS8J7CMTkpGjR8iaaU0jMmPqRDqygmqUb5dixrThz9hJja5YoWB+9RXNIALfuLZxgp2pL97YXsPH2KJfN7TYwrYtM1puYFvCT3JqJh/7OJhJAaPvRTTN+v7oEs3LCC6pacwy0pY9XEk4jzn6ip5ZxrdQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(1800799009)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(6666004)(40460700003)(36860700001)(426003)(336012)(40480700001)(1076003)(83380400001)(36756003)(47076005)(81166007)(356005)(82740400003)(26005)(2616005)(316002)(2906002)(6916009)(54906003)(41300700001)(4744005)(70206006)(70586007)(86362001)(5660300002)(44832011)(8676002)(8936002)(4326008)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2023 00:29:09.9009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3882f220-e7f2-4061-a760-08dba04b4e57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111

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



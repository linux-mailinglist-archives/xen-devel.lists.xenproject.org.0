Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3BA78817B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 10:03:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590557.922955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRmm-0001OD-U7; Fri, 25 Aug 2023 08:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590557.922955; Fri, 25 Aug 2023 08:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRmm-0001Dn-1r; Fri, 25 Aug 2023 08:03:16 +0000
Received: by outflank-mailman (input) for mailman id 590557;
 Fri, 25 Aug 2023 08:03:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VXW=EK=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qZRmi-0007G4-Ua
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 08:03:12 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d58f77b7-431d-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 10:03:11 +0200 (CEST)
Received: from SJ0PR13CA0207.namprd13.prod.outlook.com (2603:10b6:a03:2c3::32)
 by DM4PR12MB6206.namprd12.prod.outlook.com (2603:10b6:8:a7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.29; Fri, 25 Aug 2023 08:03:05 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::aa) by SJ0PR13CA0207.outlook.office365.com
 (2603:10b6:a03:2c3::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Fri, 25 Aug 2023 08:03:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Fri, 25 Aug 2023 08:03:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 03:03:00 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 25 Aug 2023 03:02:59 -0500
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
X-Inumbo-ID: d58f77b7-431d-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKislC23qUUQRL2Vr8JOs7s3LAf0PG1xd6HaS59cjNWzdNT9wGWIQBcrLNTcwnjvgoQqtlGyBTWJEhrxoasHaqVjrxPWDo6ctkULvYAt43JgMUlD7qJkyPkLdiMhzHI7V+6zsaF8JlhffIsWiFo//SfgmhIUPJL/yy6DFdsYviJDj9Wnp9AuzVYgNnF+yDosXSOME1d7YXow8GNOM6N+VKvNl4oEYK6DI9Z9yPtxjHgamDYzJbibdRbEx7UetewkAellAcYg4GCOUYJxp6o97Lu7ZBun/ZOp4Vw4eVEGWzsgZf2UUk8CCt7QENHxFaTJko59d4HXzChwfFCCvw+shw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aOH8wbfxJ3CDB9n8z4otIPVVDXaY3ZnHxlpPeTlbO8=;
 b=lKwP13yn/5bUO87KwHcKBlEV84uIV2FapQ9uACFshvhyysF8EdHz/InJeHb2QTs4yHnn3Ns/WrvO9cIZVImF9X1WE4HgPoHTPbGvNnhinOyVmz75OxYwhBlGGIvCatg1i5PIl3NxxFyhdzbusFGdsDEJdo48l9Jq4Rm/Jt1QILDRvy0ZKlUjmeawgqtRgSg15biLdDAhu8G/pTJpKV4oVN9DONJnycPej0ILYNdU+5jYqXIrEjVhdAPrYEGYfvcDzIxplNcyvwcPRblTuRI0x1JpZu+4Sb5eKvoFQ92UsgzCq++3yxfM8/jcaGYZQ0Tc/l1aNH9hw7lG0J6Bj7y7lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aOH8wbfxJ3CDB9n8z4otIPVVDXaY3ZnHxlpPeTlbO8=;
 b=kTqr/MSGDC2yAdHlqRbyolTivQ3SuOJcvfa3Uh5K85mh8S56vbFPBrpQnYJUHrdajQD1Nt5pQZlobZsZUdXooaGqc/XFgjvjFj3Vjv7LSRWtC+KSUSENs7apuvzwx5CGb2TRJocwsG1+OQQJOhiPwJDTelXGjdJSoG3R79xXmcY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <julien@xen.org>
Subject: [XEN][PATCH v10 06/20] libfdt: Keep fdt functions after init for CONFIG_OVERLAY_DTB.
Date: Fri, 25 Aug 2023 01:02:08 -0700
Message-ID: <20230825080222.14247-7-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230825080222.14247-1-vikram.garhwal@amd.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|DM4PR12MB6206:EE_
X-MS-Office365-Filtering-Correlation-Id: fe5d618e-bf27-494e-6d0f-08dba541b660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JOi6MCIzvT27J7jf3vQElEY2nG7J9611Ixiq2ORkMOyuuV+ucUfyaV/9JcngEacTvQXaZwHQHg/+P4w6MG+uivuJ/CV3EJ5KTr9URIz5RUShm2oZeaczxInxQ9LONrwnL+UbvcBTlQopBwvMLxDEpl3O99E366cqOJ3tah0hXY6T1dLddpf4EO3nbNFioaamNDOo8JObyjwxxCfayKrll+RElqNy/xEBz2+LGW0Q14CrNekbPi2vmodXINy5t0OLwO/tuQF7lrGov/42w7t8Qf6CKDs2OGP94nuDdLCM9mKG9A0ZCcVn+L11LyS4JiQB4xmOJeI4IWsAunlATIxMMYVWJarxXmfTC1mElKmVwrfpPgMcLrCOk81RqQQ9p81uITnwDx/R0t0ecX6COreLAuz4HZAAtRKdYEDXQYgi185oa17DJ69F0eS3KcxiWh6HFwKVZxg82j/NcTcCnJVu/4fMyGftim3zVHxJQ5gtbnQ+7v17ZevOyQuEr7irdsrRZoId/qXTBFL4eo3U96Ws/UFK/cc35McFstLJ6OQhmM+EKcqgjz79FREJErCMBMjmOE/3b8GJmb1vGhfYzejjCiIP27Kwi7p14qq3IWJBQ9f621N1QivRbvgHC5mPxDcJ9oVgJrs1a6SRaDwxuslYP0JvzjEYqBJciOVBqB3fgNdqXWID3BO91z9eeZXbUf6e7yfXIyPbANN8xlcddXji58MVxJ7UnjS66GrsQmmvhmBrXRoBPNRd6urdVTS+g7xJJPJrerh1mRTqRBzt2kdQTA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(346002)(396003)(82310400011)(451199024)(1800799009)(186009)(46966006)(40470700004)(36840700001)(82740400003)(81166007)(356005)(40460700003)(8676002)(4326008)(8936002)(54906003)(41300700001)(6666004)(316002)(36756003)(6916009)(70586007)(70206006)(86362001)(40480700001)(47076005)(26005)(478600001)(336012)(36860700001)(1076003)(44832011)(83380400001)(2906002)(4744005)(2616005)(426003)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:03:05.2568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe5d618e-bf27-494e-6d0f-08dba541b660
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6206

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



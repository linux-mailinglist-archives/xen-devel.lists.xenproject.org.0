Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1C7793343
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 03:17:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595996.929765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhA1-0008Sf-E1; Wed, 06 Sep 2023 01:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595996.929765; Wed, 06 Sep 2023 01:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhA1-0008JC-2X; Wed, 06 Sep 2023 01:16:49 +0000
Received: by outflank-mailman (input) for mailman id 595996;
 Wed, 06 Sep 2023 01:16:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbfT=EW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qdh9y-00079K-Vb
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 01:16:46 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0aecb4fa-4c53-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 03:16:45 +0200 (CEST)
Received: from BL0PR0102CA0035.prod.exchangelabs.com (2603:10b6:207:18::48) by
 LV2PR12MB6015.namprd12.prod.outlook.com (2603:10b6:408:14f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 01:16:39 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:207:18:cafe::61) by BL0PR0102CA0035.outlook.office365.com
 (2603:10b6:207:18::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32 via Frontend
 Transport; Wed, 6 Sep 2023 01:16:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 01:16:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:39 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:39 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 5 Sep 2023 20:16:38 -0500
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
X-Inumbo-ID: 0aecb4fa-4c53-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYfPCUou6Me5bAHdo0fdbji6sGCqTVaXWC+WNm4mk8YggFzkQ6c9P0AlGbmM5o2bVM+eQwDjTPlHJmhUtGsubDT9Mv5+fhQ/w41PnrnSrQImxouAP4JBmcVim50ABA4Zuq+kgapIrn3YZmNHeC/SjBkh8uFBfvCfpFbSs5QgXqvYznDgejRF6l/6ZWFNU4r9CvFX5l2OnaiC6uimgtrYzAAdLeK7iuvwAVMTlxXFSouqrDevHFQePm61hejtdIs2kQyf9rAGUNjs/buPlk21u4Vg7kInFAkReG667VRD4Awv/HTCugCWxCkvhJWSfYQ2F8RpX+A3PxUwoE9I151QxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aOH8wbfxJ3CDB9n8z4otIPVVDXaY3ZnHxlpPeTlbO8=;
 b=Owyo5CSr9/6ZX2Z+joewg8Saxrid9UartnNb0urqnEuQ+09XTVzXGwxxR0LrTgvcwIeZfRmDaXFq4vIVJfLfODlp0skuC457XNnYr+PuzzCtNoWGI0uttMKwJSfD0I/8jea7aLpk1QU3jaeYGrpvEyF3pBgr6bLLtaJDjhjLUUrav+twp9GXX7PN9U8F/lmUgOKsNXC+lIX2ksemqbeip9pTc073U1VhfA5LG5WWXrVUE+xjUMe283NQhIVP7n8mqF5G5RVc9ig1xjZfxqYhg6ayUOy6QjtcYBaKAxgkO57PfxGwv7+hVIBTGZcQuQWEtdW05L7+NATbnIyEEwHXww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aOH8wbfxJ3CDB9n8z4otIPVVDXaY3ZnHxlpPeTlbO8=;
 b=S4mSZ7BAbOHs0azHtNS8K3t3ynHo2A1O/Osx61WsSS7LJGmmpPGncXMb8xMq3f3jW01ZY7Gsyi2L94sJDDKxtYSg+iJn1wS+ob9T9tpqDBA2MYsB+c+kypsvBqMRD1aDemdtPt/lMl2VfbJWmoZDfGwx3T5QWZ8vxuAcw3Pcuws=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>
Subject: [XEN][PATCH v12 06/20] libfdt: Keep fdt functions after init for CONFIG_OVERLAY_DTB.
Date: Tue, 5 Sep 2023 18:16:16 -0700
Message-ID: <20230906011631.30310-7-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230906011631.30310-1-vikram.garhwal@amd.com>
References: <20230906011631.30310-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|LV2PR12MB6015:EE_
X-MS-Office365-Filtering-Correlation-Id: 966adf19-d251-4134-e266-08dbae76ec4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J9JVl4o4VWjcHtLoBQny51ZptNiZDs0vz3P3veBdganJRFCOHSfBR13ObDkwulEW4sS6X2VT9lOJR+OanQIVi0HyN9yeQKV/RQKu4gc4y0UMOJStrUnaYRbSzfOXUvoFTGMjfnjQbeOBlV0y38kvQhvTQbz9TYi3iFgjNL3aARCEGQ2JW3AQ07pOoYirRUEdydNq57QWj/8FOeeawYlEbQ514yEGM2289VTEdJwd5TsppHcYnY0g7Vu5obuxwTCzYryfi4XpF6DwaW0wBzH0ZmyiSKIgL5MWeWjJletFj4on5O3jXZg/Xn6eHWpLvM9YLapP1AU/J2z3Q57VDkgz7cOwhGSdD/sgU1fz/RcTS9oO99+PMVnD52HpVlxuNggeh9+AHZh5ezSUCqhgk9PQEdkHFqiYvQSumXlyRigDW4lSdKDoSTUMpV2O1KY4hMSX4CNB4vKImDUwlqajps+J0dFUr/d5fKjwypdMnguTO2gyWSezGpHcfhvwygyAYXVGLyrI1lqNtGE9Esr+ijjak5ik8w/qDTRB/+TNgI92coa6Xx+W35K5xn9fPaPE9p8ototkwOsP+S69eMCllXsIh0yocF7YkSblmxG1OjPZ8oYTtk6g7OcjWF7iHMrnzHRki1bbujIPIwVxzO2UZUN/fXWxL2E3HqqqmKq9NQUludNtrRuflNzzmkeTIHq+NC5idc7GB3BTjbtkHr2e4WrLklUoFUBQ3BQUU3fD7kaIXfWpeRolVKMaJ33NkPqn8E29f8t6VfTYQ6p0MlyUnREP/w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(396003)(39860400002)(376002)(186009)(1800799009)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(36860700001)(6666004)(40460700003)(44832011)(5660300002)(83380400001)(86362001)(1076003)(2616005)(426003)(336012)(2906002)(4744005)(47076005)(36756003)(26005)(40480700001)(356005)(82740400003)(316002)(41300700001)(70206006)(6916009)(54906003)(81166007)(8936002)(8676002)(70586007)(4326008)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 01:16:39.6489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 966adf19-d251-4134-e266-08dbae76ec4d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6015

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



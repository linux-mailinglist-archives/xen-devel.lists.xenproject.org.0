Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5219C6F4DA8
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 01:37:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528869.822623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzZ5-0000Gr-Tu; Tue, 02 May 2023 23:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528869.822623; Tue, 02 May 2023 23:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzZ5-00004v-CW; Tue, 02 May 2023 23:37:47 +0000
Received: by outflank-mailman (input) for mailman id 528869;
 Tue, 02 May 2023 23:37:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cxx=AX=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ptzZ2-0005Si-I8
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 23:37:44 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20615.outbound.protection.outlook.com
 [2a01:111:f400:7eab::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 542f6709-e942-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 01:37:42 +0200 (CEST)
Received: from BN9PR03CA0353.namprd03.prod.outlook.com (2603:10b6:408:f6::28)
 by DS0PR12MB8017.namprd12.prod.outlook.com (2603:10b6:8:146::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.20; Tue, 2 May
 2023 23:37:38 +0000
Received: from BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f6:cafe::79) by BN9PR03CA0353.outlook.office365.com
 (2603:10b6:408:f6::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21 via Frontend
 Transport; Tue, 2 May 2023 23:37:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT047.mail.protection.outlook.com (10.13.177.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.21 via Frontend Transport; Tue, 2 May 2023 23:37:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 18:37:37 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 2 May 2023 18:37:37 -0500
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
X-Inumbo-ID: 542f6709-e942-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbLrY0XLfmtX5VteDWmQwhU0kk2Ylnhgds6RZ+kfmVv+oussvigC+N19O6lGs47+KeUblhHXdolMu9LH6xcHSmkRtx+yYjeY2V1qZTGJo7ZCRPwbhTYpVYUHIRmEpJbdX1P2cAHvf3C2RksP+jLk6vMv/ByNntBL78KPO2SNbGAAe3vTB8Q83yTXoKrXtEIAUovJ6/HTXVJPWI7TWQbOck8P7Tae/+L/rUiXDEL6IrRRYNRRWsMS1zYbVMPo9XClfsovvTbbvDeQpLMqEbBnj8eP0igPQb1TU/c4Aww3cmwDbkYqiI/XQcz231ht3T1raBkk6Oz05iiYUq0i7X4mbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CZpvoQNw8JQfGrQR7sP9j/mivY1rVi0G0xxugML0N8=;
 b=OYsyBQ2qtqWf9g4uKUwiBP9H0/uFQGZgVXvKlpP8iP5ZoN4x9aKo/EFMymredk4PiW4oSgu3M5BWjelyXrC5qMVLoKFCLxWVOm2e6lgMhpwnbviHTt3NEhe5ivHhIrqa0bBFHNkqWBZLY8KddIbB6/W4T+vhlFyzWnjk3DQLF8RRYe21RM8so3gX9N1dJW2FzJWV3WanfYdE2DU0DbFmQkL8JKuOyf7L4cAmuDwiuqIZdkV70RS6oVV+bOEA89Y/TWwz/lkHPbQdKw1oLrYKh2rpqYesYyCN5AefVo/vtk/zeWTFbpWNaCK/xHq8t4KkmvMo35sAFYfpLLDpiS29Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CZpvoQNw8JQfGrQR7sP9j/mivY1rVi0G0xxugML0N8=;
 b=wPIjnURyLlj93gqdi6Z9aCwXcg+joWkR/kkmEM8sFZVJWqiAR9Zzf0gTzm0bh6clUjcfjwg/jMz6JuCxjD1vPxnPWM3Dqpc7cgWJanHT2GKTQ0W6aORAjlFk1ik/ZvSlwGmyUcBI+Ab0WbZQwEutjYwJ9Gj1xFpOVhJ40cnjhUQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <vikram.garhwal@amd.com>,
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v6 13/19] asm/smp.h: Fix circular dependency for device_tree.h and rwlock.h
Date: Tue, 2 May 2023 16:36:44 -0700
Message-ID: <20230502233650.20121-14-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230502233650.20121-1-vikram.garhwal@amd.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT047:EE_|DS0PR12MB8017:EE_
X-MS-Office365-Filtering-Correlation-Id: 497fbd75-4f3b-410f-3942-08db4b663709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QDJUL5UEsyw4J3mOZMHxO6MCIzm75A6YFTW2AkkQIcsuLRHs5vWqj64AKqydffx5mFFgPMwILp2KH7S/s2EeVNQYdWveT69oPyb25LzbrtBEY592D+WV68LQ/kx6hV3nBM1JFUIjzLIgJWIyHWGIorDRg4GP1w5RAXulf+7Q61hrJYNXc4Pd9DFyeJqOAFYhXwKMW5c41bI7WgyN/jD4cbQtX4+6oBUuizaN5u4f164CJMLg3DyiDK5/ecex3eh97PyONaJDMjaq4B74FyltkzLDz0YtnSA9VveGUs3Xe1smDdM9pATBCVOIjfVHem1wkh8FFVPBU0N9imnou9JI+jT+CS8rhHl4D860WfrG8ZjIkl+7yY4czOHf95HOZyR8Vf426SllumytAZFP3XhrP7bVD4tfqPGqy/VEe8Zf+HsmgtCyd0wcvYtBxi1VoozpHHUrdNm3mUAvnZ0S8MJ9U2nJnYFSI+mcemuUSkVWFxadpIokx9PaJ4VZQM42dtFk8cCW7QHC+7Jte7kNSJ2b339pKiQiYj70ICIhvNywYHEL7eOzXMUvoUqnKx1IRDGhVu9xeyVIOylmJpw0eQ3sl80hABabLPFDJLRct2aPwDDHF0tYgL2JNPAFDVnzs7ZsO6Zdzxh3A0SeGwDw0nYk4+Bknur1eOWtGSDxHvo/j715/FTzc6LAIlQUoGk3DM9tzpbwNTHw2Ga+YJ/rb/btLKHjzTx9KHbjiGOnco08ufU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199021)(36840700001)(46966006)(40470700004)(81166007)(356005)(82740400003)(44832011)(41300700001)(8936002)(5660300002)(8676002)(2906002)(40480700001)(86362001)(40460700003)(82310400005)(6666004)(36860700001)(47076005)(54906003)(478600001)(186003)(36756003)(2616005)(70206006)(83380400001)(1076003)(26005)(336012)(6916009)(70586007)(4326008)(426003)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 23:37:38.4843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 497fbd75-4f3b-410f-3942-08db4b663709
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8017

Dynamic programming ops will modify the dt_host and there might be other
function which are browsing the dt_host at the same time. To avoid the race
conditions, adding rwlock for browsing the dt_host. But adding rwlock in
device_tree.h causes following circular dependency:
    device_tree.h->rwlock.h->smp.h->asm/smp.h->device_tree.h

To fix this, removed the "#include <xen/device_tree.h> and forward declared
"struct dt_device_node".

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/include/asm/smp.h | 3 ++-
 xen/arch/arm/smpboot.c         | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/smp.h b/xen/arch/arm/include/asm/smp.h
index a37ca55bff..b12949ba8a 100644
--- a/xen/arch/arm/include/asm/smp.h
+++ b/xen/arch/arm/include/asm/smp.h
@@ -3,13 +3,14 @@
 
 #ifndef __ASSEMBLY__
 #include <xen/cpumask.h>
-#include <xen/device_tree.h>
 #include <asm/current.h>
 #endif
 
 DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
 DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
 
+struct dt_device_node;
+
 #define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
 
 #define smp_processor_id() get_processor_id()
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 4a89b3a834..255bbcc967 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -10,6 +10,7 @@
 #include <xen/cpu.h>
 #include <xen/cpumask.h>
 #include <xen/delay.h>
+#include <xen/device_tree.h>
 #include <xen/domain_page.h>
 #include <xen/errno.h>
 #include <xen/init.h>
-- 
2.17.1



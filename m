Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF3377EE77
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 02:50:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585042.916058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWRDa-0002Ua-VC; Thu, 17 Aug 2023 00:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585042.916058; Thu, 17 Aug 2023 00:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWRDa-0002Qq-RL; Thu, 17 Aug 2023 00:50:30 +0000
Received: by outflank-mailman (input) for mailman id 585042;
 Thu, 17 Aug 2023 00:50:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IvtK=EC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qWR4G-000280-6h
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 00:40:52 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7eab::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6134fda-3c96-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 02:40:50 +0200 (CEST)
Received: from SN4PR0501CA0041.namprd05.prod.outlook.com
 (2603:10b6:803:41::18) by CYYPR12MB8964.namprd12.prod.outlook.com
 (2603:10b6:930:bc::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Thu, 17 Aug
 2023 00:40:45 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:803:41:cafe::9f) by SN4PR0501CA0041.outlook.office365.com
 (2603:10b6:803:41::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Thu, 17 Aug 2023 00:40:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Thu, 17 Aug 2023 00:40:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 19:40:42 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 19:40:41 -0500
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
X-Inumbo-ID: b6134fda-3c96-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOOUjvCMsKxWmuQ+eP0zb4yRO8q30D0X2fubeaLSsvNHDe8Qls2gd11lpbI6WioB1NVDDn59Yb5/HYBgfp65i04hEMZX0MZwoNzEp+hwnvD0iqw5ambYYAb1GD2pgmcJC3+yi0uHnB1ZRzBTC0nrnI69Une+hH3KvYA/x/bGIoOF00ZLuY1e/e9TgT9nQHqwnozIbqivy+MjCATN0fy9ZHONVEk+A6P9w/wN2jb4tFZJpJTEH6BGmmvOZvHgHph22QVz2SWWHHHDXDh48yJN7sPdI0leOVgMJSN9Yx2wj7bKlM69AlsBwXVklJWansRiy+zA5QyBCpDL8dS6Y1FnqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbvEFTy0SN7hLXU1211NeYzv59Rers6Gren3/qiNJHg=;
 b=kr0/WPGXrWX+5troHsezseknnebqb++eWnynezqYXcuHy45cyEivUfZ6PVV97dTZkoGureKLf1PXjUnFUebfwsNDgyc6d5UTAC/5dVRsoO29n7K478AGAt1cD+fjo+fhQxF3XY9zHS45fTDD06j4FHRKeJWw0X9IXimzowGVGkt4bgH7fbA0o+HWdtdkPPSLmB88zkWM9UjbrH1mlyFeELrt7+z9IUadc5MsFNeSEznFG8b+1x94Kx/YqAOooQenOkK2DESNpw5mSPUXXwAN/f0/Wd9BylyI5HTziaSPJ8/tLJ24/73usm/NrjVSu3HGI1iRud/SDMiteLaU9vgSPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbvEFTy0SN7hLXU1211NeYzv59Rers6Gren3/qiNJHg=;
 b=C5Oj9mlb6W80Ic7nE6j7i0Ssp9XF++qMzoe3nqp8v395KXIPnv3GukmL1OgjXuSVxniHBsFVGm28qiz2/6rBZ2ZHMQ6VMcKK+j2L6Et0/0dGubzbgl38QH7bsQwQS8wktE4VFX8Mg7KOW38RAkWa0ZJI6n1YS4mgmd7/w8Nj5m0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v8 13/19] asm/smp.h: Fix circular dependency for device_tree.h and rwlock.h
Date: Wed, 16 Aug 2023 17:39:41 -0700
Message-ID: <20230817003947.3849-14-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817003947.3849-1-vikram.garhwal@amd.com>
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|CYYPR12MB8964:EE_
X-MS-Office365-Filtering-Correlation-Id: 62a1ac86-896c-4af2-67ec-08db9eba9831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RojMygBGOAwZgBK/+KBo6vKmdWBnWv/KUrzXLLdO05lQCe3Cr8wsa0rVJAHg3Ja28gcJCYpUK7xKcGqlNv9Op2xwofiVJrxUo2Yl3+LsYmio1EExo2vW23EATJ41GbxCQQ67xq4yubQhmMa7ieb/hGHj2R5eTVWkAM5SM3D4gUtvp+t/PMYlU1PtgK6zjgQTdVec2kZH2UsKv9syL421zjYEBvdLx/x4YlLEC4U71zsvOMeEQPcipU5LC8ENnm8YTP5gmB/pk1JrBUbf3I+q57nUlu3oo0GkgjbCddU/LKZ7YWxUAL6493Wd9aIJSAkMhmnE7AyXqCtmDUa+fgUJfDyPH64k73nW+rCkGvcY5Xocm1DolPbHzfsaq37Txf42SApHTJfeRiRls/Rp1fpSa7tsJ19LlefPQP6oSzc5lzMYMLbtSfbnJISsi88KaSCFyqewmNe9iOVInwDwF/HjfcR6qKJk/X/9WJoYk4HIntklRbQlh6PVgODkkgyiHpOT+VrKAjkV7rpUtJcVshYJlZK5pOp6aozNoOlHdiFO+N9kavVOFJnhYJtpt2FXKntIPfrA4MJ6o2wLaQKWSCFAlVJobFNqKH1HA9uAshdzS5YhYwl0Xzqa+lHanEG2k4RJ3MZwVUBlT6/Gw2/mqi8X0rlaLPMuiOkTq+Vm2tmah3/XdEU2qzEYFznhHL0uSPiaDgVIKW7OufXPC3wFCmLu6bpVbRdHVjwEaD8awKbZx25bRTzB3MdYsbgQGIZ1BTKUR0Re0iiBusSWyCCL3Z9xcQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39860400002)(186009)(451199024)(82310400011)(1800799009)(40470700004)(36840700001)(46966006)(36756003)(86362001)(40480700001)(40460700003)(83380400001)(8936002)(4326008)(8676002)(5660300002)(2906002)(41300700001)(1076003)(26005)(2616005)(44832011)(426003)(36860700001)(336012)(47076005)(478600001)(316002)(82740400003)(356005)(81166007)(70586007)(54906003)(6916009)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 00:40:45.6912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a1ac86-896c-4af2-67ec-08db9eba9831
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8964

Dynamic programming ops will modify the dt_host and there might be other
function which are browsing the dt_host at the same time. To avoid the race
conditions, we will need to add a rwlock to protect access to the dt_host.
However, adding rwlock in device_tree.h causes following circular dependency:
    device_tree.h->rwlock.h->smp.h->asm/smp.h->device_tree.h

To fix this, removed the "#include <xen/device_tree.h> and forward declared
"struct dt_device_node".

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

---
    Changes from v7:
        Move struct dt_device_node declaration just above arch_cpu_init().
---
---
 xen/arch/arm/include/asm/smp.h | 4 +++-
 xen/arch/arm/smpboot.c         | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/smp.h b/xen/arch/arm/include/asm/smp.h
index a37ca55bff..4fabdf5310 100644
--- a/xen/arch/arm/include/asm/smp.h
+++ b/xen/arch/arm/include/asm/smp.h
@@ -3,7 +3,6 @@
 
 #ifndef __ASSEMBLY__
 #include <xen/cpumask.h>
-#include <xen/device_tree.h>
 #include <asm/current.h>
 #endif
 
@@ -23,6 +22,9 @@ DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
 extern void noreturn stop_cpu(void);
 
 extern int arch_smp_init(void);
+
+struct dt_device_node;
+
 extern int arch_cpu_init(int cpu, struct dt_device_node *dn);
 extern int arch_cpu_up(int cpu);
 extern void arch_cpu_up_finish(void);
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index e107b86b7b..eeb76cd551 100644
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



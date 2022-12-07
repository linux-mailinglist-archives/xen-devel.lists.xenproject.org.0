Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D05E6453E5
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 07:18:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455852.713494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2nlP-0002JN-Ak; Wed, 07 Dec 2022 06:18:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455852.713494; Wed, 07 Dec 2022 06:18:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2nlP-0002HK-6t; Wed, 07 Dec 2022 06:18:39 +0000
Received: by outflank-mailman (input) for mailman id 455852;
 Wed, 07 Dec 2022 06:18:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FP08=4F=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p2nlN-0001rE-UX
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 06:18:38 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faccc05a-75f6-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 07:18:36 +0100 (CET)
Received: from DS7PR03CA0015.namprd03.prod.outlook.com (2603:10b6:5:3b8::20)
 by SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 06:18:31 +0000
Received: from DS1PEPF0000E64E.namprd02.prod.outlook.com
 (2603:10b6:5:3b8:cafe::1a) by DS7PR03CA0015.outlook.office365.com
 (2603:10b6:5:3b8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 06:18:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E64E.mail.protection.outlook.com (10.167.18.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Wed, 7 Dec 2022 06:18:31 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 00:18:31 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 00:18:30 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Dec 2022 00:18:29 -0600
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
X-Inumbo-ID: faccc05a-75f6-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXOzTNpk/5BMKH+TTIPgyuM2zRgpk8eUMR+vB2kT4ztNRkDbpzX0gwX9UCramvCpFcX9In3nH7nuuNVDMFqjWk45KMDjsdglKOSw7dUiPgUK68dxNK5lbObABq4rMP1YiSrAz5r0sLbpsJsZWUULxjfBvm+jHMyI1ZYlHjp5oeB/44CLy/TbTvwbmzbaiDrK63p86ChJoRCHi1yuBTL98MOX+J+BbgHDPOFm6k972WFdaZIF7eKEW2+B/mgnX6WmYgd/3rn/s23/Q/Zl240hTyqQRJ0bZxSEj1CCHKUYtrxZgjpKr9exSM49Liy/R6I7Gi6pSnMyCHaRc6q8Ac6lPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+Sq6+5nUDNMD9hP99qzhfGlSEZu9BK2xepwW4V56QI=;
 b=Fniblm45wnL1kmFFwur/0YAlBRFG3GPO+PR/zBSKIXi96RP9UjEUMMqAKN3mos5CNCtDNMCIlQc2m5rIjpXIl6D3X3wy88cdYNr2aO6qbSDmKvhvC1tvTCSUblJnSNHymKjmtpRZue0tu/ih+ejlqSDOEzewIbv4zdCeLb/g9AR5Tikk/xiNT6Yv313y8vG4qtpTCkIiUdVW6PAN5ieK+6px3qOIULZT+f0RVF3cf0nlOoWizbZiV3KmyggT/pMLFziT2ctffY33++MFw3nrUl8vhbtX9yMfkODp4LJZvAmKuOBl4IB8BqF+Nh2IPW8LUUCffpivxdeldIvBY1rpvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+Sq6+5nUDNMD9hP99qzhfGlSEZu9BK2xepwW4V56QI=;
 b=glWZSJrpo1cLTqRtVolAKHS4df9fe3+5jGNFmFdcPMoKSCohYXbfDM1ZoehuYxMmKf7eY+ZDfz1ECW52KrCl0K3mW29JT8Jm5VQUYlCzG5s1SpTyztI6IuXXae5EsrtlaR6YGVQUmETHcoQ70O/K5GvycaOa3nDYRWWssqpWhOA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <vikram.garhwal@amd.com>,
	<Luca.Fancellu@arm.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: [XEN][RFC PATCH v4 10/16] asm/smp.h: move cpu related function to asm/cpu.h
Date: Tue, 6 Dec 2022 22:18:09 -0800
Message-ID: <20221207061815.7404-4-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221207061815.7404-1-vikram.garhwal@amd.com>
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E64E:EE_|SA0PR12MB4557:EE_
X-MS-Office365-Filtering-Correlation-Id: d33989e8-047b-45dd-23ce-08dad81add06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HB8RbFd9C4NWZvnmbm2ClJBErG2zjMZnocH4Ep/flRhEVjkJawutEtvNXyhHaT0euQLbTpbPqu9b4wisFxSAqKQ5h3qbBdjDBZ8CMfNNbp1xUcSYkomwUmIAUJR8CsBpP8d/ekbiFfwoPvv2Q9ZBqfanvA9vkVORTg0+9nPII6VkNcm3M+51aiHCYdWqNP6Brk9Rf6oInosz0oWWLxHbg/KEa2XGK+4zETiTNk+NcF1/ZZ+YyXkbi/xMtj4uR5tNab/zFN0/c/1Gt307RB3YgZtuNl9AGblg1VCLu/MP4y4dD7ve/OmUNCOwjfsZlm4YT3RswqwnMEPYCVRcBEL4gl3PknXi32WOXKzP22FMBHtVdSoawk+dh4j+VbEv2TbmGXUyaX7G7T420KmQaQiOK0SfnuIn3+BKADudqUcNatH9zSdhWhYGFiZmt7ezYBzmUlPahX6hpuqStTSfwwNbnDtQEC5hJ/RhuEQgd1kjYeAc9pEJeMakiF1KT5qb4okA1zaNVtQqD22VgpQCEkx+ZrPmw/jtK8tUmh6JdoleGVpq/9l/4npDndxyELT/e6CftrHYgT1rancU74E+QBwLzDzbk+bEyx7iMujzUcAkowEWPFiVRGtd0HrWyCCmWQWh7y1g8xkvvurwspCf6uCtZ3+wJ6H5lkY1+r02fSMyK10jD6TXnA3EEtU305owf6TMYoYhrODR2yCQxE3+8Mx9T5/pNRHc6Ep4+7IvYJLJrlg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(41300700001)(36860700001)(86362001)(478600001)(6666004)(1076003)(2616005)(82740400003)(81166007)(83380400001)(6916009)(316002)(40460700003)(54906003)(356005)(4326008)(336012)(8676002)(186003)(7416002)(8936002)(36756003)(2906002)(40480700001)(26005)(47076005)(5660300002)(426003)(44832011)(70586007)(70206006)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 06:18:31.4325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d33989e8-047b-45dd-23ce-08dad81add06
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E64E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4557

Dynamic programming ops will modify the dt_host and there might be other
function which are browsing the dt_host at the same time. To avoid the race
conditions, adding rwlock for browsing the dt_host. But adding rwlock in
device_tree.h causes following circular dependency:
    device_tree.h->rwlock.h->smp.h->asm/smp.h->device_tree.h

Inside arch/arm/include/asm/smp.h, there is one function which needs
device_tree.h, moved the cpu related function to a new file:
arch/arm/include/asm/cpu.h

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 xen/arch/arm/efi/efi-boot.h       |  1 +
 xen/arch/arm/include/asm/cpu.h    | 35 +++++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/domain.h |  1 +
 xen/arch/arm/include/asm/psci.h   |  1 +
 xen/arch/arm/include/asm/smp.h    | 24 ---------------------
 xen/include/xen/cpu.h             |  4 ++++
 xen/include/xen/softirq.h         |  4 ++++
 7 files changed, 46 insertions(+), 24 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/cpu.h

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 43a836c3a7..ca40c6f73f 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -5,6 +5,7 @@
  */
 #include <xen/device_tree.h>
 #include <xen/libfdt/libfdt.h>
+#include <asm/cpu.h>
 #include <asm/setup.h>
 #include <asm/smp.h>
 
diff --git a/xen/arch/arm/include/asm/cpu.h b/xen/arch/arm/include/asm/cpu.h
new file mode 100644
index 0000000000..4df80ca1b5
--- /dev/null
+++ b/xen/arch/arm/include/asm/cpu.h
@@ -0,0 +1,35 @@
+#ifndef __ASM_CPU_H
+#define __ASM_CPU_H
+
+#ifndef __ASSEMBLY__
+#include <xen/cpumask.h>
+#include <xen/device_tree.h>
+#include <asm/current.h>
+#endif
+
+DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
+DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
+
+#define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
+
+/*
+ * Do we, for platform reasons, need to actually keep CPUs online when we
+ * would otherwise prefer them to be off?
+ */
+#define park_offline_cpus false
+
+extern void noreturn stop_cpu(void);
+
+extern int arch_cpu_init(int cpu, struct dt_device_node *dn);
+extern int arch_cpu_up(int cpu);
+
+int cpu_up_send_sgi(int cpu);
+
+/* Secondary CPU entry point */
+extern void init_secondary(void);
+
+#define cpu_physical_id(cpu) cpu_logical_map(cpu)
+
+#endif
+
+
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 2ce6764322..f9440e5c7e 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -3,6 +3,7 @@
 
 #include <xen/cache.h>
 #include <xen/timer.h>
+#include <asm/cpu.h>
 #include <asm/page.h>
 #include <asm/p2m.h>
 #include <asm/vfp.h>
diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
index 832f77afff..74c1bc6368 100644
--- a/xen/arch/arm/include/asm/psci.h
+++ b/xen/arch/arm/include/asm/psci.h
@@ -1,6 +1,7 @@
 #ifndef __ASM_PSCI_H__
 #define __ASM_PSCI_H__
 
+#include <asm/cpu.h>
 #include <asm/smccc.h>
 
 /* PSCI return values (inclusive of all PSCI versions) */
diff --git a/xen/arch/arm/include/asm/smp.h b/xen/arch/arm/include/asm/smp.h
index 8133d5c295..76944b07f7 100644
--- a/xen/arch/arm/include/asm/smp.h
+++ b/xen/arch/arm/include/asm/smp.h
@@ -3,40 +3,16 @@
 
 #ifndef __ASSEMBLY__
 #include <xen/cpumask.h>
-#include <xen/device_tree.h>
 #include <asm/current.h>
 #endif
 
-DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
-DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
-
-#define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
-
 #define smp_processor_id() get_processor_id()
 
-/*
- * Do we, for platform reasons, need to actually keep CPUs online when we
- * would otherwise prefer them to be off?
- */
-#define park_offline_cpus false
-
-extern void noreturn stop_cpu(void);
-
 extern int arch_smp_init(void);
-extern int arch_cpu_init(int cpu, struct dt_device_node *dn);
-extern int arch_cpu_up(int cpu);
-
-int cpu_up_send_sgi(int cpu);
-
-/* Secondary CPU entry point */
-extern void init_secondary(void);
 
 extern void smp_init_cpus(void);
 extern void smp_clear_cpu_maps (void);
 extern unsigned int smp_get_max_cpus(void);
-
-#define cpu_physical_id(cpu) cpu_logical_map(cpu)
-
 #endif
 
 /*
diff --git a/xen/include/xen/cpu.h b/xen/include/xen/cpu.h
index e8eeb217a0..ce93eb0003 100644
--- a/xen/include/xen/cpu.h
+++ b/xen/include/xen/cpu.h
@@ -5,6 +5,10 @@
 #include <xen/spinlock.h>
 #include <xen/notifier.h>
 
+#ifdef CONFIG_ARM
+#include <asm/cpu.h>
+#endif
+
 /* Safely access cpu_online_map, cpu_present_map, etc. */
 bool get_cpu_maps(void);
 void put_cpu_maps(void);
diff --git a/xen/include/xen/softirq.h b/xen/include/xen/softirq.h
index 1f6c4783da..cc98a65287 100644
--- a/xen/include/xen/softirq.h
+++ b/xen/include/xen/softirq.h
@@ -19,6 +19,10 @@ enum {
 #include <asm/hardirq.h>
 #include <asm/softirq.h>
 
+#ifdef CONFIG_ARM
+#include <asm/cpu.h>
+#endif
+
 #define NR_SOFTIRQS (NR_COMMON_SOFTIRQS + NR_ARCH_SOFTIRQS)
 
 typedef void (*softirq_handler)(void);
-- 
2.17.1



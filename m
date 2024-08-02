Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD50945DBA
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 14:15:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771054.1181649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZrBh-0003PU-36; Fri, 02 Aug 2024 12:15:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771054.1181649; Fri, 02 Aug 2024 12:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZrBg-0003ND-Vp; Fri, 02 Aug 2024 12:15:12 +0000
Received: by outflank-mailman (input) for mailman id 771054;
 Fri, 02 Aug 2024 12:15:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sjRO=PB=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sZrBf-0002qg-7n
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 12:15:11 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20625.outbound.protection.outlook.com
 [2a01:111:f403:2412::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd1c7229-50c8-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 14:15:10 +0200 (CEST)
Received: from PH7P220CA0072.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::31)
 by PH0PR12MB7485.namprd12.prod.outlook.com (2603:10b6:510:1e9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 2 Aug
 2024 12:15:06 +0000
Received: from CY4PEPF0000E9CF.namprd03.prod.outlook.com
 (2603:10b6:510:32c:cafe::51) by PH7P220CA0072.outlook.office365.com
 (2603:10b6:510:32c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Fri, 2 Aug 2024 12:15:03 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9CF.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Fri, 2 Aug 2024 12:15:02 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 Aug
 2024 07:15:01 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 2 Aug 2024 07:15:00 -0500
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
X-Inumbo-ID: dd1c7229-50c8-11ef-bc03-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UKrWA47OVwAZllrifdvyN+cgcSIDqdM1MG5hepUF9ujI2nffKoMNvzW5tVDz3KTpfndkhNj/9ftZ/PK0eKGv5QZREpTAJ54cVuspoyVGZ2/sLHsDnaPxxsLOeWiXijSfmrg3j8+DLr66d0/pxkZ+C+qUzUPnt7TAYRe1PLRmvNdZUtGQFKDi19Ul/ETadMnx9rx7lhOVxW73nroeqFrZInqXOLwfJcg/XXgpwcktGZxTgxwvgtqg10sd2Hpa/bxrJF8ngC83W6EAR2PEUc/Un4/OVyAEwcdy/0umRKmo+tzac0O7QZ6sSd4PwTD3JujrkszC+ydVSVF6v4NkxniG4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcvevutIA8wF3Pys0d5aki/QrgNfXYtD6SWLs8zRKls=;
 b=s5Ci7QnURzu2TDqqaDr1RrFfgjmrZ9xIerqJbMEEBS9OOLA1rN8lw3s4cywh7UnV+sR9lPTUe7J6puKVb7YPa58od76QczKiNcrm5BMqOLcdc5ZbGZu3Nd+vVFFJ+uGOuOn+CzcVBq/gAUhk72kuEzCIHXzgB1rcSoUKUgjsVeo3A27c4rt++ewmFPEX5A903JBZJZ/d7Y6LWqj4QjNmpsPqov5UeYQ7cc1FxRmkYHigT8GYTYcMDQYOI/rMa96onn9flL7YEZou+XsO0aMhBTR5r6delas4vS4ow5wPNjHAZxuYx8zRu1XxyilEvCU+FrD0spZWRLWHtsXzi6i5bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcvevutIA8wF3Pys0d5aki/QrgNfXYtD6SWLs8zRKls=;
 b=Vyj+iQVOPo/EgVYaK1RF0sf++A6GxKxq+5zhg3p8MWl0JwvdLRzpHFYFR4jd68O3RFc6swodpoDM6KuzpO63LzViKD4aVEQVIRojUzLk+fJDMNj8IKLvzrhyz+ZnBJkwlvpBpQc/qUSc4w/BDwN5GKBsoFXJ+OOYraQBqindlN8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <ayan.kumar.halder@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Penny Zheng <penny.zheng@arm.com>, "Wei
 Chen" <wei.chen@arm.com>
Subject: [PATCH v1 2/4] xen: arm: make VMAP only support in MMU system
Date: Fri, 2 Aug 2024 13:14:41 +0100
Message-ID: <20240802121443.1531693-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240802121443.1531693-1-ayan.kumar.halder@amd.com>
References: <20240802121443.1531693-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CF:EE_|PH0PR12MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: 35ae0cc8-dca4-4418-a24e-08dcb2ecbcd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GFXWBsM7TeZL3KJ6/PAvM3bzy4UIo8R7A1yMUPyi1MhFPdvxRCO4etI0haQI?=
 =?us-ascii?Q?R4bSLXAUYy1Lc4WGDoVUJfq/A1BNLylRUYFTocYL7jWwqC71BoSK83iYHdS3?=
 =?us-ascii?Q?y8eFuO7J7/YKVIt+OLU8PxKoUhntEmKLVVLiscZ38Dh4giooT7RZT9AttzlN?=
 =?us-ascii?Q?benvv1lTR5rK4APKSYeLaQxLmXFNN4yjwjKYh72Nm/u2C8QVqG0QhtGX6iKW?=
 =?us-ascii?Q?iYxzOcM7LpD2R2PFWJw0FqKtV62+uPswx0Xc3RBFXZ6lzIZ1uPcS6thnuQ0l?=
 =?us-ascii?Q?H4aXnZ5i8eGYHcQMLJiU8BUQv6FcomkD/vc28sMfCScvEQOcQj7D4UZTKpNI?=
 =?us-ascii?Q?+colwOfBCoGTBx6f/srbY4Gh1vpxlZZpjh1GyvMGv79zOSmRFBugIZaihCHj?=
 =?us-ascii?Q?I1IXu6zObTwWBCXpQo7oKdF10THJ10VQ73LUy8T8qWnTSjPPgG96pea5OJKY?=
 =?us-ascii?Q?3BHjczxTT+F14maOamTRW+R6XS2hGPbO9APlh+bCJcwcj586uGSkRvqeQ22I?=
 =?us-ascii?Q?TyTQv2HUili/djqz6Vw1Ou1utXEOQ8tiOg7hkwUwcVW23zJ12p0ZSm7nU7AZ?=
 =?us-ascii?Q?3ZKPxVw2a/kadj8Vbv6MLFBruDS3AosOPJ/f7eSlzqEGhfg8qQR15/kw2xch?=
 =?us-ascii?Q?RR6WlpqfGcMLjdd4Br2nxmTrFLKIsC/3djiGwKaNDbWcJgsecwjLxf08d4A0?=
 =?us-ascii?Q?VBYLbeMX0BopUPwfeyA6J1hIbLgjJQX3K+SLvQMw6L2znDysLUcP7a6ZtrvH?=
 =?us-ascii?Q?CDWT0D4MpzWQKapgWKya3dXEfkeiiJO4wSOlGrUcrsvk76aLzlQpl2C27dwM?=
 =?us-ascii?Q?35qWrUSwMzFkf09XJtZsbeKOpbJ86TPuM48pk2Gbks82Gvd1Iv2/OI2dHAuf?=
 =?us-ascii?Q?MlWuEznx2WluZnDLbYW7o6CZMgu1tSThZ0t+NBGZPuMHo/dL9tA7Z73rz/c1?=
 =?us-ascii?Q?mJML+223stvz+CGt1ETNnSXHmXsK37fI3frpfBlrm73h01m2UtKi66TOdALI?=
 =?us-ascii?Q?7diC0dizI1UlqtL/EmJTXJENfbHYs7gm5ThSXLbjC1+b2Wa7rr2+zti+3eG6?=
 =?us-ascii?Q?M1tl/S7vmCV2a3uCMbQSTsCRzv90qSpsGaGqgGyjdgDpbs69Sf18dVtDGwEe?=
 =?us-ascii?Q?+Y1Psf9zISm/txWB5aqcafTzAsE1VXGDXLZ+48eI3HCICkJ4QtlsMQmhAL1O?=
 =?us-ascii?Q?mR1JGsxm24HXySyTo2CNPl1lA4MnjveMlJlfU8gopK/ufgp+8D28eD6WmFPg?=
 =?us-ascii?Q?e2Chcm8VM5aVuRYupggh0NH/Uv+Bpqmo/iShrCOpqLbhB6mtixIBwkFBaS6Z?=
 =?us-ascii?Q?f01fFsQrVi62hWUb+qa9nKCVKDBF+OyURIrYJrXYxmu90SMQTvLYSld5p2xy?=
 =?us-ascii?Q?udb1xxtzFgosx5eUzBxrYRacltFrHrUP3kXy2dHAmDRR14vsfg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 12:15:02.8036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ae0cc8-dca4-4418-a24e-08dcb2ecbcd5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7485

From: Penny Zheng <penny.zheng@arm.com>

VMAP is widely used in ALTERNATIVE feature, CPUERRATA feature, etc to
remap a range of memory with new memory attributes. Since this is
highly dependent on virtual address translation, we choose to fold VMAP
in MMU system.

In this patch, we introduce a new Kconfig CONFIG_HAS_VMAP, and make it
only support in MMU system on ARM architecture. And we make features
like ALTERNATIVE, CPUERRATA, etc, now depend on VMAP.

Split "https://patchwork.kernel.org/project/xen-devel/patch/20230626033443.2943270-16-Penny.Zheng@arm.com/"
into Arm specific

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/Kconfig   | 6 +++++-
 xen/arch/arm/Makefile  | 2 +-
 xen/arch/arm/setup.c   | 4 ++++
 xen/arch/arm/smpboot.c | 2 ++
 xen/include/xen/vmap.h | 6 ++++++
 5 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 21d03d9f44..c8d417298c 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -12,7 +12,7 @@ config ARM_64
 config ARM
 	def_bool y
 	select FUNCTION_ALIGNMENT_4B
-	select HAS_ALTERNATIVE
+	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE
 	select HAS_PASSTHROUGH
 	select HAS_UBSAN
@@ -58,9 +58,13 @@ config PADDR_BITS
 	default 40 if ARM_PA_BITS_40
 	default 48 if ARM_64
 
+config HAS_VMAP
+	def_bool y
+
 config MMU
 	def_bool y
 	select HAS_PMAP
+	select HAS_VMAP
 
 source "arch/Kconfig"
 
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 45dc29ea53..6882814d38 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -11,7 +11,7 @@ obj-$(CONFIG_HAS_VPCI) += vpci.o
 
 obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
 obj-y += bootfdt.init.o
-obj-y += cpuerrata.o
+obj-$(CONFIG_HAS_VMAP) += cpuerrata.o
 obj-y += cpufeature.o
 obj-y += decode.o
 obj-y += device.o
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 0c2fdaceaf..9d34ac7f64 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -804,11 +804,13 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
     nr_cpu_ids = smp_get_max_cpus();
     printk(XENLOG_INFO "SMP: Allowing %u CPUs\n", nr_cpu_ids);
 
+#ifdef CONFIG_HAS_VMAP
     /*
      * Some errata relies on SMCCC version which is detected by psci_init()
      * (called from smp_init_cpus()).
      */
     check_local_cpu_errata();
+#endif
 
     check_local_cpu_features();
 
@@ -879,8 +881,10 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
      * It needs to be called after do_initcalls to be able to use
      * stop_machine (tasklets initialized via an initcall).
      */
+#ifdef CONFIG_HAS_VMAP
     apply_alternatives_all();
     enable_errata_workarounds();
+#endif
     enable_cpu_features();
 
     /* Create initial domain 0. */
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 04e363088d..999afc028e 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -406,7 +406,9 @@ void asmlinkage start_secondary(void)
 
     local_abort_enable();
 
+#ifdef CONFIG_HAS_VMAP
     check_local_cpu_errata();
+#endif
     check_local_cpu_features();
 
     printk(XENLOG_DEBUG "CPU %u booted.\n", smp_processor_id());
diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index fdae37e950..84797acfc0 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -138,10 +138,16 @@ static inline void iounmap(void __iomem *va)
 /* Pointer to 1 octet past the end of the VMAP_DEFAULT virtual area */
 void *arch_vmap_virt_end(void);
 
+#ifdef CONFIG_MMU
 /* Initialises the VMAP_DEFAULT virtual range */
 static inline void vm_init(void)
 {
     vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
 }
+#else
+static inline void vm_init(void)
+{
+}
+#endif
 
 #endif /* __XEN_VMAP_H__ */
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2D2ADA88D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:51:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016617.1393560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3gp-0000Zv-BK; Mon, 16 Jun 2025 06:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016617.1393560; Mon, 16 Jun 2025 06:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3gp-0000WL-7n; Mon, 16 Jun 2025 06:51:31 +0000
Received: by outflank-mailman (input) for mailman id 1016617;
 Mon, 16 Jun 2025 06:51:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hn5w=Y7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uR3YR-0008AT-9s
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:42:51 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20618.outbound.protection.outlook.com
 [2a01:111:f403:2405::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e5db3d8-4a7d-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 08:42:50 +0200 (CEST)
Received: from DM6PR12CA0016.namprd12.prod.outlook.com (2603:10b6:5:1c0::29)
 by PH7PR12MB6585.namprd12.prod.outlook.com (2603:10b6:510:213::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 06:42:43 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:5:1c0:cafe::55) by DM6PR12CA0016.outlook.office365.com
 (2603:10b6:5:1c0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.21 via Frontend Transport; Mon,
 16 Jun 2025 06:42:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 06:42:43 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Jun 2025 01:42:39 -0500
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
X-Inumbo-ID: 1e5db3d8-4a7d-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KcaJn1l/dGt+BpTb4O2+okjS089GXEU5DRxwCb6S02yQABzIIp9pToPmhPtbUXK+WA+lxNlJV0eh5/MhlTIdkOj7G1jp17mQZ+V3blwecRfjMH6psMWvFdA4pkgEzgUrLyw8y/GtUQdn3GB2o4x3bOCnw91cFcDw+XHW4mCmbW9RWb1ZVCO7wp5EqbehOQHSWnIi3hqzC1WdpSMxbFUULFMKpSTeuraVx3KKp3HcNbomzXTH5ZlW214KlJFME+H+PeaFiUs6kt5XYdRUdrYICgnjB1fL57AdwgwcbfdwR5TI1gl3tSByZ7RCZUGSFHbkUZPLqmq58kJQHnrhEvuaug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFLZ7b6gl3GP+IHNPjkhHrTHCTAFBKAP01UJHvvbNv4=;
 b=ZTLQnFBeEv5petbTTzYZze93v3BisjrGgsRZ8Yufxqu2rv8Zx5a6QKgjDAMQNXPodOgzcTtZvEhdUQB0V/8Y9aFbKW6NJtYel2Ihk1dg7Oan4Aso7/QpgU43voVLjcA3Rr+Pj2QC7RtOHO6gQth6tp/pUa0RspfOcXmybNfTBu23uv+YkkkFiq6rjjbhytvpsOyUDpSWn0RmqWq28HdjVHgTennN02exBJ8ZmKmu4/I6cQPLwhVOPvi9eXQ+8+wjBf4Q1blZ9adZjrroN3fcx9/LdBRhJ45nRr6esxZnLmytjlKvKWqxJ61byXo9STZXUqvN5ofjcxCKMgNTzA+LjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFLZ7b6gl3GP+IHNPjkhHrTHCTAFBKAP01UJHvvbNv4=;
 b=TBUFX0eArCWc1Ym7LU7h8hDjW3AwA2kbsA9/O3pDOZOvzovt9zgIlkzh6nC/58KZd/HzVeNvTpSz+9SFVRIfCtk5cP9HqLcC1ncDzXK0MZz1HqpOneVXLA6x2hpio8CD05yOvV1+IfzS0Fl7nZTIR2eoQ7oB4DGDiziveuLcaZI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, "Stefano Stabellini" <stefano.stabellini@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [PATCH v5 17/18] xen/sysctl: wrap around arch-specific arch_do_sysctl
Date: Mon, 16 Jun 2025 14:41:27 +0800
Message-ID: <20250616064128.581164-18-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616064128.581164-1-Penny.Zheng@amd.com>
References: <20250616064128.581164-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|PH7PR12MB6585:EE_
X-MS-Office365-Filtering-Correlation-Id: a04c1807-ab17-4318-e855-08ddaca0ff2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IRBiahoJJq1UgpOFXM3QwFQuGw/8eOfnWJGh4k+IzUOa5tn4wVEEMNMj62/h?=
 =?us-ascii?Q?YUxIJLHzj1dAYlvWJofKB50L44N8fXVfqc8cxnQyovnYemlVwmerrxmjNyBl?=
 =?us-ascii?Q?VuGEFRnUlvI04G659rOMaNBSn1TDShQwVzdAbRXSY1fZUwsRyt/lGwHdgtlI?=
 =?us-ascii?Q?x/cQZwdwWBkGzA/Xn1d+v1vTmMXc5Asy5ylFo177D7tBJFy+McRKQwID9LRM?=
 =?us-ascii?Q?G69Y/2FHC18qcAKacVlPbJDqnGk8iXAUyDPbNq7c9ouNedbGeeW/ZdemWmVI?=
 =?us-ascii?Q?caaRFRmhohDOOujOWzIyMTlnHfSXSq11Dl+3sPmgxyAbgORlGagpIQeKbwqR?=
 =?us-ascii?Q?ZguKKGY2lw+k+VYx8/Sp9jzz8KruiAW9TNv+J5vWbE3LM/FLZ4yTMyaDHBNc?=
 =?us-ascii?Q?6VaCtEDZT3wlW3hJlfuZTNqq00UDWIpcVsccjNiCGrhiABPW/I0yWTqPSjIa?=
 =?us-ascii?Q?snbCgn6JdEbxP1iM2suUuXhJN6GqtX/wpY3YjY3nHxW4OOrPmrCdKmOaGl4s?=
 =?us-ascii?Q?UwLGgM+I7MYcUTKPNEv55Fvs6U7+B3pkL66JADkbjZ36FK/pa53vSsdoJ59T?=
 =?us-ascii?Q?ALf+jA1pR9dnR0hRbr2H2cUz+AXm345hXyJyAWN3WwGizcTuTjHE6+gPFzGx?=
 =?us-ascii?Q?tpbUwav1XwZnHo1TW/EzEhbIeHBS1x0cQRwo6HLyUNJ4i+bnAsw13HKr4uQs?=
 =?us-ascii?Q?LAeqm8OT+Vit2nZRgO4QWYUjGJODUjZq/EdUQRxIKvBptq8t+kL+E//PtEvr?=
 =?us-ascii?Q?qPqgMdqWQ3zQb2vll96Amylvs1FZHVSioLamrmkB/vqGpiYSXWexcT8+KKr7?=
 =?us-ascii?Q?/AwOoYgvLIFvod+6SiEy6N/47eAsuPI8P/Mgp0J8sCsapG2AIhhGGhkps04Q?=
 =?us-ascii?Q?Lrx2UId1uXCwzpVLvaQPNB7Ctg8i+2LE1jDmapWvqS0B+ib277rXFqt5RDQR?=
 =?us-ascii?Q?g1ALakbScHnOPh9WALsS0kHuUFn1iyIX0H04eNNyeLrBXZYV94wxIZZkAgQj?=
 =?us-ascii?Q?hMrAwGk6yUGjVaCea9BiEUcyBJC4HzRKMQxYBAc6dT/r4oAWJiyPmHzTNkL2?=
 =?us-ascii?Q?P3TSGhE/S/1b9nFMtrhwzJWDhmPsM97McuJ8LxO/hspI10jJa0dctSuJpKEF?=
 =?us-ascii?Q?XEFjHyvXltIBns+RJmnWWpXLdn8vJuiOoQdVbaYQrARzap9ZQ0+s7sqaLjTl?=
 =?us-ascii?Q?Kyi/4XiqXniAkQLOKzzxWZqz8+tS6q+D6wwEt39cA3aoi3K0wRXhsSaXY79m?=
 =?us-ascii?Q?e0yP76YESDbwd+QrsZ5qbRJ/moE5fAZy1zYWgLNi9/5ghbBh4j6cKFgcL2Bk?=
 =?us-ascii?Q?oxJEF1nN9mTCJZqT5AgJ8MBLptChbaDNINrGF43d5hVJdmNXrYlsPMLDxWqI?=
 =?us-ascii?Q?9R2uTQ/6rv7W40X9wvplup6tTy9SV94/KvPaNGXxXBS7lRdSQYw5b870LL6L?=
 =?us-ascii?Q?7W69XbB51XPz6gw28cQz2X3j1fR5FhJxEUsGQuhc0WUaABJmeOA1r9UBad/N?=
 =?us-ascii?Q?TeMhKnt0MkBaoo34lzV3WwtrDU4weRICxo5O?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:42:43.1438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a04c1807-ab17-4318-e855-08ddaca0ff2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6585

Function arch_do_sysctl is to perform arch-specific sysctl op.
Some functions, like psr_get_info() for x86, DTB overlay support for arm,
are solely available through sysctl op, then they all shall be wrapped
with CONFIG_SYSCTL

Also, remove all #ifdef CONFIG_SYSCTL-s in arch-specific sysctl.c, as
we put the guardian in Makefile for the whole file.
Since PV_SHIM_EXCLUSIVE needs sorting in the future, we move
obj-$(CONFIG_SYSCTL) += sysctl.o out of PV_SHIM_EXCLUSIVE condition.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v1 -> v2:
- use "depends on" for config OVERLAY_DTB
- no need to wrap declaration
- add transient #ifdef in sysctl.c for correct compilation
---
v2 -> v3:
- move obj-$(CONFIG_SYSCTL) += sysctl.o out of PV_SHIM_EXCLUSIVE condition
- move copyback out of #ifdef
- add #else process for default label
---
v3 -> v4:
- remove transient "#ifdef CONFIG_SYSCTL"
- move #ifdef ahead of the comment
---
 xen/arch/arm/Kconfig   |  1 +
 xen/arch/arm/Makefile  |  2 +-
 xen/arch/arm/sysctl.c  |  2 --
 xen/arch/riscv/stubs.c |  2 +-
 xen/arch/x86/Makefile  |  2 +-
 xen/arch/x86/psr.c     | 18 ++++++++++++++++++
 xen/arch/x86/sysctl.c  |  2 --
 7 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 3f25da3ca5..e076419d5e 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -139,6 +139,7 @@ config HAS_ITS
 
 config OVERLAY_DTB
 	bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
+	depends on SYSCTL
 	help
 	  Dynamic addition/removal of Xen device tree nodes using a dtbo.
 
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index ab0a0c2be6..f833cdf207 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -51,7 +51,7 @@ obj-y += setup.o
 obj-y += shutdown.o
 obj-y += smp.o
 obj-y += smpboot.o
-obj-y += sysctl.o
+obj-$(CONFIG_SYSCTL) += sysctl.o
 obj-y += time.o
 obj-y += traps.o
 obj-y += vcpreg.o
diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index 2d350b700a..32cab4feff 100644
--- a/xen/arch/arm/sysctl.c
+++ b/xen/arch/arm/sysctl.c
@@ -15,7 +15,6 @@
 #include <asm/arm64/sve.h>
 #include <public/sysctl.h>
 
-#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     pi->capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
@@ -23,7 +22,6 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
     pi->arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
                                        XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
 }
-#endif
 
 long arch_do_sysctl(struct xen_sysctl *sysctl,
                     XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index f86a1c17cb..8918cebf35 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -302,6 +302,7 @@ unsigned long raw_copy_from_guest(void *to, const void __user *from,
     BUG_ON("unimplemented");
 }
 
+#ifdef CONFIG_SYSCTL
 /* sysctl.c */
 
 long arch_do_sysctl(struct xen_sysctl *sysctl,
@@ -310,7 +311,6 @@ long arch_do_sysctl(struct xen_sysctl *sysctl,
     BUG_ON("unimplemented");
 }
 
-#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     BUG_ON("unimplemented");
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index ce724a9daa..96d63219e7 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -63,6 +63,7 @@ obj-y += smpboot.o
 obj-y += spec_ctrl.o
 obj-y += srat.o
 obj-y += string.o
+obj-$(CONFIG_SYSCTL) += sysctl.o
 obj-y += time.o
 obj-y += traps-setup.o
 obj-y += traps.o
@@ -78,7 +79,6 @@ ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 obj-y += domctl.o
 obj-y += platform_hypercall.o
 obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
-obj-y += sysctl.o
 endif
 
 extra-y += asm-macros.i
diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
index 5815a35335..499d320e61 100644
--- a/xen/arch/x86/psr.c
+++ b/xen/arch/x86/psr.c
@@ -133,9 +133,11 @@ static const struct feat_props {
      */
     enum psr_type alt_type;
 
+#ifdef CONFIG_SYSCTL
     /* get_feat_info is used to return feature HW info through sysctl. */
     bool (*get_feat_info)(const struct feat_node *feat,
                           uint32_t data[], unsigned int array_len);
+#endif
 
     /* write_msr is used to write out feature MSR register. */
     void (*write_msr)(unsigned int cos, uint32_t val, enum psr_type type);
@@ -418,6 +420,7 @@ static bool mba_init_feature(const struct cpuid_leaf *regs,
     return true;
 }
 
+#ifdef CONFIG_SYSCTL
 static bool cf_check cat_get_feat_info(
     const struct feat_node *feat, uint32_t data[], unsigned int array_len)
 {
@@ -430,6 +433,7 @@ static bool cf_check cat_get_feat_info(
 
     return true;
 }
+#endif /* CONFIG_SYSCTL */
 
 /* L3 CAT props */
 static void cf_check l3_cat_write_msr(
@@ -442,11 +446,14 @@ static const struct feat_props l3_cat_props = {
     .cos_num = 1,
     .type[0] = PSR_TYPE_L3_CBM,
     .alt_type = PSR_TYPE_UNKNOWN,
+#ifdef CONFIG_SYSCTL
     .get_feat_info = cat_get_feat_info,
+#endif
     .write_msr = l3_cat_write_msr,
     .sanitize = cat_check_cbm,
 };
 
+#ifdef CONFIG_SYSCTL
 /* L3 CDP props */
 static bool cf_check l3_cdp_get_feat_info(
     const struct feat_node *feat, uint32_t data[], uint32_t array_len)
@@ -458,6 +465,7 @@ static bool cf_check l3_cdp_get_feat_info(
 
     return true;
 }
+#endif /* CONFIG_SYSCTL */
 
 static void cf_check l3_cdp_write_msr(
     unsigned int cos, uint32_t val, enum psr_type type)
@@ -473,7 +481,9 @@ static const struct feat_props l3_cdp_props = {
     .type[0] = PSR_TYPE_L3_DATA,
     .type[1] = PSR_TYPE_L3_CODE,
     .alt_type = PSR_TYPE_L3_CBM,
+#ifdef CONFIG_SYSCTL
     .get_feat_info = l3_cdp_get_feat_info,
+#endif
     .write_msr = l3_cdp_write_msr,
     .sanitize = cat_check_cbm,
 };
@@ -489,11 +499,14 @@ static const struct feat_props l2_cat_props = {
     .cos_num = 1,
     .type[0] = PSR_TYPE_L2_CBM,
     .alt_type = PSR_TYPE_UNKNOWN,
+#ifdef CONFIG_SYSCTL
     .get_feat_info = cat_get_feat_info,
+#endif
     .write_msr = l2_cat_write_msr,
     .sanitize = cat_check_cbm,
 };
 
+#ifdef CONFIG_SYSCTL
 /* MBA props */
 static bool cf_check mba_get_feat_info(
     const struct feat_node *feat, uint32_t data[], unsigned int array_len)
@@ -508,6 +521,7 @@ static bool cf_check mba_get_feat_info(
 
     return true;
 }
+#endif /* CONFIG_SYSCTL */
 
 static void cf_check mba_write_msr(
     unsigned int cos, uint32_t val, enum psr_type type)
@@ -545,7 +559,9 @@ static const struct feat_props mba_props = {
     .cos_num = 1,
     .type[0] = PSR_TYPE_MBA_THRTL,
     .alt_type = PSR_TYPE_UNKNOWN,
+#ifdef CONFIG_SYSCTL
     .get_feat_info = mba_get_feat_info,
+#endif
     .write_msr = mba_write_msr,
     .sanitize = mba_sanitize_thrtl,
 };
@@ -808,6 +824,7 @@ static struct psr_socket_info *get_socket_info(unsigned int socket)
     return socket_info + socket;
 }
 
+#ifdef CONFIG_SYSCTL
 int psr_get_info(unsigned int socket, enum psr_type type,
                  uint32_t data[], unsigned int array_len)
 {
@@ -839,6 +856,7 @@ int psr_get_info(unsigned int socket, enum psr_type type,
 
     return -EINVAL;
 }
+#endif /* CONFIG_SYSCTL */
 
 int psr_get_val(struct domain *d, unsigned int socket,
                 uint32_t *val, enum psr_type type)
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index f64addbe2b..1b04947516 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -91,7 +91,6 @@ static long cf_check smt_up_down_helper(void *data)
     return ret;
 }
 
-#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     memcpy(pi->hw_cap, boot_cpu_data.x86_capability,
@@ -105,7 +104,6 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
     if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
         pi->capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
 }
-#endif /* CONFIG_SYSCTL */
 
 long arch_do_sysctl(
     struct xen_sysctl *sysctl, XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
-- 
2.34.1



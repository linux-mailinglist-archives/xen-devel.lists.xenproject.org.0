Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0209B07F79
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 23:22:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045780.1416027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aD-0000I8-Hk; Wed, 16 Jul 2025 21:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045780.1416027; Wed, 16 Jul 2025 21:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aD-0000CM-3L; Wed, 16 Jul 2025 21:22:33 +0000
Received: by outflank-mailman (input) for mailman id 1045780;
 Wed, 16 Jul 2025 21:22:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc9aA-0007F2-V7
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 21:22:31 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20615.outbound.protection.outlook.com
 [2a01:111:f403:2412::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8ccfa8b-628a-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 23:22:28 +0200 (CEST)
Received: from BN9PR03CA0794.namprd03.prod.outlook.com (2603:10b6:408:13f::19)
 by SA3PR12MB9106.namprd12.prod.outlook.com (2603:10b6:806:37e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 21:22:24 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:408:13f:cafe::a3) by BN9PR03CA0794.outlook.office365.com
 (2603:10b6:408:13f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.32 via Frontend Transport; Wed,
 16 Jul 2025 21:22:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 21:22:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:22:08 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:22:08 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 16:22:07 -0500
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
X-Inumbo-ID: f8ccfa8b-628a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qm04lwKejipEvP9bRBW3JabX+5X33oz+MhgN8rC/cYSlLiQ1gEm4ODfS7/Np7O+LxuDynAmAjww/of2CiqaM8pjXqI6vX8tld0xeSAnSkcCzK2Z7C9o9vt88nYCf4tnwHxJdiYjvMB9I4nsTVT6TO+TsZiyRfDIWLlKQpQOYZ1cSfP0ZxPW1+3TDHBQg2IHp6ZTm03x59tJSPEL+cWOTFyLbf3IVFRNA4DwiFhlN8k68Lzkl6NOqSuR11cyFs2lymGkqlnMDVMwDw5g5xF+V13Yb2s5rtsH7aj1h0KsvcnjvdmqpFsl0Uysp9n1NHVqgEzRaV7npazyV8hVzBeAHOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JF6+JxSKjzA4UzG7AozD85Y2sWpyR7xteKGEDVhlnLc=;
 b=dhGiJqGBk4t320+YsWdnjcvZ0q8yVoCvv0brqdWDI4z61oIoxxd7fICmkC5UVmoRLLF4I0LR19jgiAaDV1+o21khp4mmT8mGqL6wBdv1Ua1ji1v3Yt8IlQ4LXwDb1RdE9plv/EFP3S2O/tfypkXCmRaWMVKSL+oJcqdAs1EWdBRJcSkQdt18D/K4SYprQJYNneY8/+UK1ddDHspfzXJJFnUA8sKJgAKxlCBVkTiYJPJgDb9E/B1qIAvLeWmRKvzv6yjyG82K9rLrSQeTf3SmCoiqpYAUFaeQs+2iTrQzaLguwamfsWQ+nPREr1iDBoe+seWl5C025b1TpbCBKvwnoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JF6+JxSKjzA4UzG7AozD85Y2sWpyR7xteKGEDVhlnLc=;
 b=LwVA+Dsi6VUBwIwYxBRk90qhTF8R3GvaRnMOpH0IGtFJbMyC5s2mUp491Kosr1tFeCw6GeKDTJsVbQaWO3BoGV77aq3zYnullsMaLieRbKs0Ic16kc4ClohhRO/E05Hfz7qygiavwiFuR4lt+piXQPiATj/hxaIEaFyZsNjdEcg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Christian Lindig <christian.lindig@cloud.com>
Subject: [PATCH v2 03/17] xen: Add DOMAIN_CAPS_DEVICE_MODEL & XEN_DOMCTL_CDF_device_model
Date: Wed, 16 Jul 2025 17:14:50 -0400
Message-ID: <20250716211504.291104-4-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250716211504.291104-1-jason.andryuk@amd.com>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|SA3PR12MB9106:EE_
X-MS-Office365-Filtering-Correlation-Id: 22a2cfc6-4192-44e2-7b90-08ddc4aedb71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yJly645dfciSSzlDpxkGK90wK7E7Pb14Q1ftlsKyOnMf91TgL/xfjPWphUtr?=
 =?us-ascii?Q?iF/nPMEf7xkIDsAH5/cnXQSlKoAtSogtyHwVH0ZxFYD2qrrYjIwJP7rT7X6h?=
 =?us-ascii?Q?fqVpsha8qHA+IXMusc/XfD3eVHVmuZWT3iK6dOK2l+ZjwyOP8dvNdL7J/FM2?=
 =?us-ascii?Q?FmZtA3XnPXEkkYOEl1TqMjbZnuOjnvU8OE+OUd0FQm304rra4oBfGkrbsObr?=
 =?us-ascii?Q?zvS8VB7qwPD4sM1Q77hyVmQwjuegA1hgDH/XASPV1V0qS9U0Azu0rfKt//4x?=
 =?us-ascii?Q?5uOk7AGeYnDCn9sCHQyzN7uLoeA5GOg6nv/r31aUfGfiVA3myZY/uoZW72RM?=
 =?us-ascii?Q?VKpTgPHOAuS8YzbnU1nTt/aXrd0e61xtmh268aor99DLon3hO2PX6S49ZtQ+?=
 =?us-ascii?Q?0/cJT7SYdWaG0WrknMPSgr+JuhY7sooyx51aM4lCFUcE5fZAdB4jxpcF+dwU?=
 =?us-ascii?Q?iUFRA8WAjjwex5Xlijar4gGkviIOo6DgBDvDoV/x1l7l0qx7Eh3GiVa1DSv5?=
 =?us-ascii?Q?mAtw9L3Ma/pm61myfv0esxnHdC+M42mhbdnMraAKd6xaRAbVy4IiFQSZLqro?=
 =?us-ascii?Q?pVbkq96rAeoyzxOUbCjFty8LUYDH8fhh+9WZco34IdGmdOINAs4WR4X69bxf?=
 =?us-ascii?Q?kpiZmaqzBNY5uB+8reVsmaIaKRcS+zDxdYDij7R0b5dU1yKjQdsmiMIJAE6d?=
 =?us-ascii?Q?38uEcg9/B02SRCz6Kr3C+QMwLcNWAT0zwEg0u7+U6MLeEEhJYqfQ1Mco9u8P?=
 =?us-ascii?Q?t35jsx+/Tc/6kzd2/aUDAgz0urrSPBXZI6lzfj9fyHT98m8jYTJjqVMVP/Z+?=
 =?us-ascii?Q?dXfYIJBIwNfeTlLFo833LCj4t4vAPTBKN1wc8zPKF67A3l7+OummTyBqdliz?=
 =?us-ascii?Q?/9ss9z2pbDD0QhnUQ0QsXQX5WadJ6ialiOx8KAl/+dPM+JN6cKLKcG1xM7oF?=
 =?us-ascii?Q?mBz8LCBtyfjn0F5jAOHBaMf9xeTN+TAfo7n+j26v5LsHjvnzFC488Hf2OQyJ?=
 =?us-ascii?Q?9wPCzG7OOQQ6AXPQeggE97JGNqURa75ndbKbtvCMsADLitgycIfxEIXnKsRW?=
 =?us-ascii?Q?o1lJ8k9J4yBPzQu+F6oCxls4YSL5xtbuaU2ELRB01iiijDprQbBwy2pbtFzv?=
 =?us-ascii?Q?Rl5kbht2qr27LP8wvrGZbHd1LpzdgwKUbfc3Gh4iXjYbRKZzTSFNrxrtdAC0?=
 =?us-ascii?Q?qlcCtzR2xnyKHrLxXjGAykkjUk0GYa7bitr4PlS3NQXHpRbH6/uWrSMjhJ0o?=
 =?us-ascii?Q?wt9aEoKyFHqWPq4Q6IvChFD3y9/fA39ZOvFalcgjSroV8HxmOXlnuLuVKh5w?=
 =?us-ascii?Q?fS48WZwN4Ye1WnIamqpJip9zNxF8t1XdprzUnRWtDWqlgAw/cYCTcyt9+bOf?=
 =?us-ascii?Q?VJ5GMZinG20336lf2gLhrvfQKVFWDwSJ7F7oVhVHvJI2WYIUwmU43syCSb0n?=
 =?us-ascii?Q?bsbvN3Vyez50CXfec337BeMywZMu6wjnPpCzVpiLL+lRc9b/Wd5EWkEKqLJ7?=
 =?us-ascii?Q?fpWTbsjyA9zxBfmyO4sfXXDL8GkPUe7P16Qv?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 21:22:24.1033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a2cfc6-4192-44e2-7b90-08ddc4aedb71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9106

To add more flexibility in system configuration add the new
DOMAIN_CAPS_DEVICE_MODEL flag and XEN_DOMCTL_CDF_device_model.

Thie new flag corresponds to allowing XSM_DM_PRIV for the domain.  This
will enable running device model emulators (QEMU) from the assigned
domain for multiple target domains.

Stubdoms assign target allowing the stubdom to serve as the device
model for a single domain.  This new flag allows the single domain to
provide emulators for multiple guests.

The specific scenario is a disaggregated system with the hardware domain
providing device models for multiple guest domains.

This permission is also enough to run xenconsoled in the hardware
domain.  This is a byproduct of getdomaininfo being available.  The
grant permissions are also configured for the console page.

The OCaml code needs the flag added in as well.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Acked-by: Christian Lindig <christian.lindig@cloud.com>
---
v2:
Add Christian's Ack

XSM_DM_PRIV falls through to the is_control_domain() check - should this
be a return to make them into disjoint sets?
---
 tools/ocaml/libs/xc/xenctrl.ml          |  1 +
 tools/ocaml/libs/xc/xenctrl.mli         |  1 +
 xen/arch/arm/domain.c                   |  3 ++-
 xen/common/device-tree/dom0less-build.c |  3 +++
 xen/common/domain.c                     |  3 ++-
 xen/include/public/bootfdt.h            | 12 ++++++++++--
 xen/include/public/domctl.h             |  4 +++-
 xen/include/xen/sched.h                 |  9 +++++++++
 xen/include/xsm/dummy.h                 |  2 ++
 9 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 7e1aabad6c..f5835e7d95 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -71,6 +71,7 @@ type domain_create_flag =
   | CDF_NESTED_VIRT
   | CDF_VPMU
   | CDF_TRAP_UNMAPPED_ACCESSES
+  | CDF_DEVICE_MODEL
 
 type domain_create_iommu_opts =
   | IOMMU_NO_SHAREPT
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index f44dba61ae..b9471a56a8 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -64,6 +64,7 @@ type domain_create_flag =
   | CDF_NESTED_VIRT
   | CDF_VPMU
   | CDF_TRAP_UNMAPPED_ACCESSES
+  | CDF_DEVICE_MODEL
 
 type domain_create_iommu_opts =
   | IOMMU_NO_SHAREPT
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 79a144e61b..57eecbd250 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -613,7 +613,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
     unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu |
                                    XEN_DOMCTL_CDF_xs_domain |
-                                   XEN_DOMCTL_CDF_trap_unmapped_accesses );
+                                   XEN_DOMCTL_CDF_trap_unmapped_accesses |
+                                   XEN_DOMCTL_CDF_device_model);
     unsigned int sve_vl_bits = sve_decode_vl(config->arch.sve_vl);
 
     if ( (config->flags & ~flags_optional) != flags_required )
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 221b875a2f..bb52291dfb 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -883,6 +883,9 @@ void __init create_domUs(void)
                 d_cfg.flags |= XEN_DOMCTL_CDF_xs_domain;
                 d_cfg.max_evtchn_port = -1;
             }
+
+            if ( val & DOMAIN_CAPS_DEVICE_MODEL )
+                d_cfg.flags |= XEN_DOMCTL_CDF_device_model;
         }
 
         if ( dt_find_property(node, "xen,static-mem", NULL) )
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 303c338ef2..42c590b8d7 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -722,7 +722,8 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
            XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
            XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
            XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |
-           XEN_DOMCTL_CDF_trap_unmapped_accesses) )
+           XEN_DOMCTL_CDF_trap_unmapped_accesses |
+           XEN_DOMCTL_CDF_device_model) )
     {
         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
         return -EINVAL;
diff --git a/xen/include/public/bootfdt.h b/xen/include/public/bootfdt.h
index 86c46b42a9..c6b5afc76a 100644
--- a/xen/include/public/bootfdt.h
+++ b/xen/include/public/bootfdt.h
@@ -25,7 +25,15 @@
 #define DOMAIN_CAPS_HARDWARE (1U << 1)
 /* Xenstore domain. */
 #define DOMAIN_CAPS_XENSTORE (1U << 2)
-#define DOMAIN_CAPS_MASK     (DOMAIN_CAPS_CONTROL | DOMAIN_CAPS_HARDWARE | \
-                              DOMAIN_CAPS_XENSTORE)
+/*
+ * Device model capability allows the use of the dm_op hypercalls to provide
+ * the device model emulation (run QEMU) for other domains.  This is a
+ * subset of the Control capability which can be granted to the
+ * Hardware domain for running QEMU.
+ */
+#define DOMAIN_CAPS_DEVICE_MODEL (1U << 3)
+
+#define DOMAIN_CAPS_MASK     (DOMAIN_CAPS_CONTROL  | DOMAIN_CAPS_HARDWARE | \
+                              DOMAIN_CAPS_XENSTORE | DOMAIN_CAPS_DEVICE_MODEL )
 
 #endif /* __XEN_PUBLIC_BOOTFDT_H__ */
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index a69dd96084..88a294c5be 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -68,9 +68,11 @@ struct xen_domctl_createdomain {
 #define XEN_DOMCTL_CDF_vpmu           (1U << 7)
 /* Should we trap guest accesses to unmapped addresses? */
 #define XEN_DOMCTL_CDF_trap_unmapped_accesses  (1U << 8)
+/* Allow domain to provide device model for multiple other domains */
+#define XEN_DOMCTL_CDF_device_model   (1U << 9)
 
 /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
-#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_trap_unmapped_accesses
+#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_device_model
 
     uint32_t flags;
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index fe53d4fab7..9863603d93 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1148,6 +1148,15 @@ static always_inline bool is_control_domain(const struct domain *d)
     return evaluate_nospec(d->is_privileged);
 }
 
+/* This check is for functionality specific to a device model domain */
+static always_inline bool is_dm_domain(const struct domain *d)
+{
+    if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
+        return false;
+
+    return evaluate_nospec(d->options & XEN_DOMCTL_CDF_device_model);
+}
+
 #define VM_ASSIST(d, t) (test_bit(VMASST_TYPE_ ## t, &(d)->vm_assist))
 
 static always_inline bool is_pv_domain(const struct domain *d)
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 2b0ed25cc5..0b341efd18 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -91,6 +91,8 @@ static always_inline int xsm_default_action(
             return 0;
         fallthrough;
     case XSM_DM_PRIV:
+        if ( is_dm_domain(src) )
+            return 0;
         if ( target && evaluate_nospec(src->target == target) )
             return 0;
         fallthrough;
-- 
2.50.0



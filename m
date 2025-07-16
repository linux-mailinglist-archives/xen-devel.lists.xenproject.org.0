Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60407B07F82
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 23:22:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045777.1416007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aB-0008Nn-Sy; Wed, 16 Jul 2025 21:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045777.1416007; Wed, 16 Jul 2025 21:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aB-0008Ln-OA; Wed, 16 Jul 2025 21:22:31 +0000
Received: by outflank-mailman (input) for mailman id 1045777;
 Wed, 16 Jul 2025 21:22:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc9a9-0007F7-T5
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 21:22:30 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20623.outbound.protection.outlook.com
 [2a01:111:f403:2418::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f97e0db4-628a-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 23:22:28 +0200 (CEST)
Received: from BN9PR03CA0801.namprd03.prod.outlook.com (2603:10b6:408:13f::26)
 by LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 21:22:24 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:408:13f:cafe::6b) by BN9PR03CA0801.outlook.office365.com
 (2603:10b6:408:13f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.33 via Frontend Transport; Wed,
 16 Jul 2025 21:22:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 21:22:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:22:10 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 16:22:09 -0500
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
X-Inumbo-ID: f97e0db4-628a-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=huGqY/1epyL8NEzdTlWX4aNcPjt94KOqAitBgHt7HIOnPl9Bxq3MASS+hjTMH82Mq3dnCM1PNaUypClE2Dty0FbepMXkq69ROykRq+Hdkhhf+AczeVO6DIqj9F39Eok24wLqrBPaGtq/MwsHqkmPf95D3WU66RGiyJW9cH/ItYGDHEkyTiIVLpfWw2k2s1HG00z6MiR5zItXtjojOfCQwl0V+1USSvsHGjhgSG+4oIcT2JynvXSy3BBACSHGs5xri6W0jxBJ+PzEgX1kRBJ0vf8fz12Xs/eUDGcI7rZJochkj4bRF0FiNbDfGZEkAUrIPX7STPhzs0NFhXKG8wsO/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykb3PuSX5SAI+R8wxC7PVzFq5Z1MUVmxV7kUfgrRp3A=;
 b=xIPTjzkwo/V9xjJ7GWlJZynOcq9F9yLTtT35wh7TexcD+ywI5Ik3sKOQXbfF22OFMc+jLMp6GjjgHMHM0zkVK4f07trpI/9Dg7G2xfs8ME/3g7uhf9GE2Ci8tdsIJZBH7EpxEPVBoNNZnRG0u4H4eSpeZy21037LJ9Cn1krvzm3DxD4bI71hGKvduzy0xZ4ozkKGP4eri42JkitZLpeL+HRXOq98OynpIcy8EOkq0fcCnVPUNNav/3qpig0cqJ3l1y0b8VLJDYXLimr3vj3ot0f+HI1cYpIFoC+rRpNtgaCXO7Hn95I2PhMeBE6zO17hsP47Dz/ITRFXu3PhW8D2HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykb3PuSX5SAI+R8wxC7PVzFq5Z1MUVmxV7kUfgrRp3A=;
 b=wtY997j6bIlX6MwTzjLW2fhnGgvWNEZAAoo7js86zkQ2t83s2vapRiZuLkw17f3KL6E3zTP7z3jSap/9d8CZaxPSTFSo4WOpiKP1SKUXC0ArV/OJlilorr03vJEXarh0XtENu8LXlqk4CJOatWJySeh5eCw1BcyjjMbUHKdp3AI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	"David Scott" <dave@recoil.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v2 04/17] xen: Introduce XEN_DOMCTL_CDF_not_hypercall_target
Date: Wed, 16 Jul 2025 17:14:51 -0400
Message-ID: <20250716211504.291104-5-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250716211504.291104-1-jason.andryuk@amd.com>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|LV2PR12MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: 309870da-e022-4eb8-8d3e-08ddc4aedb84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W2+2jV4wYV5Ci6UZxFYRgIHLKPEaJvKFlJGXRx/fWsnBsbz18cPJrZINZLMo?=
 =?us-ascii?Q?2/1snR/2EWH1aJzYy7CqzttS6RCnTA6UQxcYI0vsmr4IvMRKZWd+ewMMouA2?=
 =?us-ascii?Q?gkUJ6OoNhiwi1X0zakfsg0Ly9mAwIWmEuEmhBL4UuVNSfTOs5MoN/tnyRdg/?=
 =?us-ascii?Q?k4m6YguZME6CGcGrUvEKli0UQR+7roRq68ZRllx49GjSJ9WgH54dZC5xewfX?=
 =?us-ascii?Q?glVk2d1lJl0ShK0tfTyzuGrMvXreR7VKcjc6o1gfcPaZqwFUJsBj7CyGNRHE?=
 =?us-ascii?Q?NkOUjRweEhz3uqaBdqh5q6QHbbXQ3OZxaWpEaAK54sr/6PGYQ4o7NHfHMT/K?=
 =?us-ascii?Q?zrYtX3Y7h1b3ObIjW2fOy0/omPLmbmf3m2nkWVcMdgemF4fy23C/cnm6a/OB?=
 =?us-ascii?Q?p2Fyk4xk5VBFc7BSvNQzZfw21xCMraAzp0EaD4feMFrat1o28ksG5PyMCcmw?=
 =?us-ascii?Q?TJ5c7g7Z6WU0HLBh0zsr09TFAqzmVgMj5NbF2l+/jaanHi3aZ2/ZigqE5t0R?=
 =?us-ascii?Q?39jfTqu8xCaNqZU2wPO7Pp/aEefMoJ7YDxkQCKdbyPSo5DQ9zEZgtroVPEz1?=
 =?us-ascii?Q?heZShNCIxt7Lq+jmd5LtRrxSU4kwn6LxOayHQ/Q2xMk2e0fG8isB88k7ywjK?=
 =?us-ascii?Q?VMVmjD856M87amQuZVIVo7oMr4phVYOCt0vARdW0/DD3Q/jZt2ZNC+6GCHnK?=
 =?us-ascii?Q?tJS1a98lAXe610Qt0KZpap/SzRNxNs0dRhUx9escmKhBz2UfwvbpPcRCyvQt?=
 =?us-ascii?Q?vVkSfMX2qvMZ2oq1HobMMu6DSxfRpazVHMR48FPVY+LHRbcPmzo6vwaW94kS?=
 =?us-ascii?Q?/MRsanZCIhHNlMPvAQD813DiYAIWIoWTdHChFL56e50N3zGMZxDQl0RVNF1u?=
 =?us-ascii?Q?Fc4HqcjtD0+koB5gO4qoeSe1VVqfvhLoj7SN1W1CplyZHvIcw9KtXDxQvrmw?=
 =?us-ascii?Q?J3vQxPxuxrgJgqHXQG762au3gTB7ElCvWQn2pJD0UZ6U05rP2wQ4BJfPZoj5?=
 =?us-ascii?Q?AjyW7Oq5AbJto1TazmYtBzyDCIL9LzgC/Z+Sl4gAj27n6USPrfwYXiscTrdt?=
 =?us-ascii?Q?R3O3IUwJDc5lJLheZil45/Dcdk0BhgbHYjYXqtvxXiIxpG7r6ZFVQXkqWFzX?=
 =?us-ascii?Q?/T3eodtQDPcw/uo5FW0EthhUItAMhcRy7agR99Z7tNpXE1OcAoOmx/+ClKUe?=
 =?us-ascii?Q?/3aW6izVrDIM1L5+GcsuVr1NnF+1crI1HZbTl+m4NPiQtzK/eqZSwA3GNa7a?=
 =?us-ascii?Q?gMgxbQdViWWpmzJhwiZ0cLIj79mK44DD1TvDr/zLwaSWDCOZmbYnB7AspCzp?=
 =?us-ascii?Q?4v/EV1rhAt/isP+ujQQ+l0peBUzKXtjn+I8xVXkr55H7tR6fh/uPXI0tE2NC?=
 =?us-ascii?Q?jGdBoxgljMoLXK27gZvQfV9tmAnHp5dSCR1eDQyw42Z6ApfutS02Vyw+m7u5?=
 =?us-ascii?Q?nnt4r3P268txtlXNOXHRIyPdziJqeQWEti03kaHvskPkklk6KNI2qOB8u8Ut?=
 =?us-ascii?Q?RcZ1j22AVvuFeMOscCUOu/ZehNGD2qsNnJsL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 21:22:24.2293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 309870da-e022-4eb8-8d3e-08ddc4aedb84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5869

Add a new create domain flag  to indicate if a domain can be the target
of hypercalls.  By default all domains can be targetted - subject to any
other permission checks.

This property is useful in a safety environment to isolate domains for
freedom from interference.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
DOMAIN_CAPS_NOT_HYPERCALL_TARGET duplicates the hypercall-untargetable
DT property, so it could be removed.  Leaving it here for now to at
least illustrate the alternate approach.
---
 docs/misc/arm/device-tree/booting.txt   |  6 ++++++
 tools/ocaml/libs/xc/xenctrl.ml          |  1 +
 tools/ocaml/libs/xc/xenctrl.mli         |  1 +
 xen/arch/arm/domain.c                   |  3 ++-
 xen/common/device-tree/dom0less-build.c |  6 ++++++
 xen/common/domain.c                     |  2 +-
 xen/include/public/bootfdt.h            | 10 ++++++++--
 xen/include/public/domctl.h             |  4 +++-
 xen/include/xen/sched.h                 | 12 ++++++++++++
 xen/include/xsm/dummy.h                 |  4 ++++
 10 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 07acc7ba64..963dd81912 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -307,6 +307,12 @@ with the following properties:
     passed through. This option is the default if this property is missing
     and the user does not provide the device partial device tree for the domain.
 
+- hypercall-untargetable
+
+    Optional.  An empty property to specify the domain cannot be the target
+    of hypercalls.  This protects a domain for freedom of interference from
+    other domains.
+
 Under the "xen,domain" compatible node, one or more sub-nodes are present
 for the DomU kernel and ramdisk.
 
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index f5835e7d95..00c29199dc 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -72,6 +72,7 @@ type domain_create_flag =
   | CDF_VPMU
   | CDF_TRAP_UNMAPPED_ACCESSES
   | CDF_DEVICE_MODEL
+  | CDF_NOT_HYPERCALL_TARGET
 
 type domain_create_iommu_opts =
   | IOMMU_NO_SHAREPT
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index b9471a56a8..daf6686f4d 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -65,6 +65,7 @@ type domain_create_flag =
   | CDF_VPMU
   | CDF_TRAP_UNMAPPED_ACCESSES
   | CDF_DEVICE_MODEL
+  | CDF_NOT_HYPERCALL_TARGET
 
 type domain_create_iommu_opts =
   | IOMMU_NO_SHAREPT
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 57eecbd250..5f6358096f 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -614,7 +614,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu |
                                    XEN_DOMCTL_CDF_xs_domain |
                                    XEN_DOMCTL_CDF_trap_unmapped_accesses |
-                                   XEN_DOMCTL_CDF_device_model);
+                                   XEN_DOMCTL_CDF_device_model |
+                                   XEN_DOMCTL_CDF_not_hypercall_target);
     unsigned int sve_vl_bits = sve_decode_vl(config->arch.sve_vl);
 
     if ( (config->flags & ~flags_optional) != flags_required )
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index bb52291dfb..22af043aa5 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -886,6 +886,9 @@ void __init create_domUs(void)
 
             if ( val & DOMAIN_CAPS_DEVICE_MODEL )
                 d_cfg.flags |= XEN_DOMCTL_CDF_device_model;
+
+            if ( val & DOMAIN_CAPS_NOT_HYPERCALL_TARGET )
+                d_cfg.flags |= XEN_DOMCTL_CDF_not_hypercall_target;
         }
 
         if ( dt_find_property(node, "xen,static-mem", NULL) )
@@ -896,6 +899,9 @@ void __init create_domUs(void)
             flags |= CDF_staticmem;
         }
 
+        if ( dt_property_read_bool(node, "hypercall-untargetable") )
+            d_cfg.flags |= XEN_DOMCTL_CDF_not_hypercall_target;
+
         if ( dt_property_read_bool(node, "direct-map") )
         {
             if ( !(flags & CDF_staticmem) )
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 42c590b8d7..c347de4335 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -723,7 +723,7 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
            XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
            XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |
            XEN_DOMCTL_CDF_trap_unmapped_accesses |
-           XEN_DOMCTL_CDF_device_model) )
+           XEN_DOMCTL_CDF_device_model | XEN_DOMCTL_CDF_not_hypercall_target) )
     {
         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
         return -EINVAL;
diff --git a/xen/include/public/bootfdt.h b/xen/include/public/bootfdt.h
index c6b5afc76a..1eba1cc487 100644
--- a/xen/include/public/bootfdt.h
+++ b/xen/include/public/bootfdt.h
@@ -32,8 +32,14 @@
  * Hardware domain for running QEMU.
  */
 #define DOMAIN_CAPS_DEVICE_MODEL (1U << 3)
+/*
+ * Domain cannot be the target of hypercalls.  This provides the domain
+ * freedom from interference from other domains.
+ */
+#define DOMAIN_CAPS_NOT_HYPERCALL_TARGET (1U << 4)
 
-#define DOMAIN_CAPS_MASK     (DOMAIN_CAPS_CONTROL  | DOMAIN_CAPS_HARDWARE | \
-                              DOMAIN_CAPS_XENSTORE | DOMAIN_CAPS_DEVICE_MODEL )
+#define DOMAIN_CAPS_MASK    (DOMAIN_CAPS_CONTROL  | DOMAIN_CAPS_HARDWARE | \
+                             DOMAIN_CAPS_XENSTORE | DOMAIN_CAPS_DEVICE_MODEL | \
+                             DOMAIN_CAPS_NOT_HYPERCALL_TARGET)
 
 #endif /* __XEN_PUBLIC_BOOTFDT_H__ */
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 88a294c5be..f1f6f96bc2 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -70,9 +70,11 @@ struct xen_domctl_createdomain {
 #define XEN_DOMCTL_CDF_trap_unmapped_accesses  (1U << 8)
 /* Allow domain to provide device model for multiple other domains */
 #define XEN_DOMCTL_CDF_device_model   (1U << 9)
+/* Domain cannot be the target of hypercalls */
+#define XEN_DOMCTL_CDF_not_hypercall_target   (1U << 10)
 
 /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
-#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_device_model
+#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_not_hypercall_target
 
     uint32_t flags;
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 9863603d93..8a32f9a1b6 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1157,6 +1157,18 @@ static always_inline bool is_dm_domain(const struct domain *d)
     return evaluate_nospec(d->options & XEN_DOMCTL_CDF_device_model);
 }
 
+/*
+ * Return whether this domain can be the target of hypercalls from other
+ * domains.
+ */
+static always_inline bool is_hypercall_target(const struct domain *d)
+{
+    if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
+        return true;
+
+    return evaluate_nospec(!(d->options & XEN_DOMCTL_CDF_not_hypercall_target));
+}
+
 #define VM_ASSIST(d, t) (test_bit(VMASST_TYPE_ ## t, &(d)->vm_assist))
 
 static always_inline bool is_pv_domain(const struct domain *d)
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 0b341efd18..f2205575ed 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -91,12 +91,16 @@ static always_inline int xsm_default_action(
             return 0;
         fallthrough;
     case XSM_DM_PRIV:
+        if ( target && !is_hypercall_target(target) )
+            return -EPERM;
         if ( is_dm_domain(src) )
             return 0;
         if ( target && evaluate_nospec(src->target == target) )
             return 0;
         fallthrough;
     case XSM_PRIV:
+        if ( target && !is_hypercall_target(target) )
+            return -EPERM;
         if ( is_control_domain(src) )
             return 0;
         return -EPERM;
-- 
2.50.0



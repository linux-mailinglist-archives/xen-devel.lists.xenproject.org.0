Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC888C8A8C
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 19:07:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724363.1129616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s813B-000784-1Y; Fri, 17 May 2024 17:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724363.1129616; Fri, 17 May 2024 17:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s813A-00075U-UG; Fri, 17 May 2024 17:07:20 +0000
Received: by outflank-mailman (input) for mailman id 724363;
 Fri, 17 May 2024 17:07:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KIA2=MU=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s8139-0005cV-Ez
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 17:07:19 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea290aca-146f-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 19:07:18 +0200 (CEST)
Received: from CH0PR07CA0014.namprd07.prod.outlook.com (2603:10b6:610:32::19)
 by SJ0PR12MB6781.namprd12.prod.outlook.com (2603:10b6:a03:44b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Fri, 17 May
 2024 17:07:13 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:32:cafe::d6) by CH0PR07CA0014.outlook.office365.com
 (2603:10b6:610:32::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30 via Frontend
 Transport; Fri, 17 May 2024 17:07:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Fri, 17 May 2024 17:07:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 17 May
 2024 12:07:12 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 17 May
 2024 12:07:12 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 17 May 2024 12:07:05 -0500
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
X-Inumbo-ID: ea290aca-146f-11ef-909e-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4zeHa5+mYcNejHDgbSebek8KjYBpkQK2u5AlNgP+8Ippj2O3xRRv7FciQrlt4yX2LMXjJPAEh6DByroDztdhjLbCGwNsGMM4WgeTlO75rSg4TzqDGA3mJu+oGBf4+ipBaf8IgTk3HQkV6CDToaxQJk9iWeJAzE6z1OCyKUXkEzyZ6PW+MDigjWw9is/76yeX5LSXkwJcbKzVBhc33N9E/ve4ZAgiAdz3vS8M5yoATI439kNYgtUmxcMvN0K0LReAd1KfIiHCe0+UHiYMwzP7UhAvlp8E1USR+5nqtL6Ywt+RXlqO0+8B9mAEVC0DQL/FAKlbyVOVDCtUxZOYO9Rsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUM6dVyovYpjq8KjZD0l2PS8q/TOLp/Wit92KUplaCw=;
 b=JN00j14+XaNx7V/ype4xKqhW6VbtqyqIYd9MOe6QeHdpZIIykewkc+Jljghvc/BV3sJ+wLbpxaYhhd0CGmgo2KEP3qF2Iezn5lAEBtcPA/GFvfHcZ+c3hYt11WsoLxzXgs4ye4OqpUjIP0c+CvMTnIORJEJmAVcj6N541Xt/2c/rx5O/f+Lp8qtQNPoCoBI0CULrvT0W59uFqhRZ/DYgq3t+DcnOosKz59ag9pwuSgg3Yq1UpvZPiERXDTWt8PSLM1WGmORW9Le2FVnaBE8+EF7P9fCnb6mdRsPsbv2KrO2rbo9ZLdCpMFtlrYc5/gIzBiWyHGHP7sB1uZ9bMlr36Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUM6dVyovYpjq8KjZD0l2PS8q/TOLp/Wit92KUplaCw=;
 b=gnayb4iCZKRb2sZgjkEyZQ8C4m3nAFCZz01hI92Ijyx0b5yX5A9/lBK5/Z6Aa+vmU9bCWGVbiHmV2xoDeWwSEkisGlhjBnO+vX6zuuv5asU4AArpxceNv8Jnsii2CZ7QCGXpPiiprFzLGoICldpZLcaJlDBKlDbAalEinqA88c8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: [PATCH v15 4/5] xen/arm: translate virtual PCI bus topology for guests
Date: Fri, 17 May 2024 13:06:14 -0400
Message-ID: <20240517170619.45088-5-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240517170619.45088-1-stewart.hildebrand@amd.com>
References: <20240517170619.45088-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|SJ0PR12MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: f5c0efbd-de52-42a2-50cc-08dc7693cba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|376005|36860700004|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CTwG2Q13s/um5srL3kk8yIvX9sf9IhUslUJiU0HBvoAqJu3S25dnTFvbPvSO?=
 =?us-ascii?Q?TTwCJznSa8zFuftEpNXI+n19tRjUs/8BeEFcsacOVp89LG8QRrAL87W/1xga?=
 =?us-ascii?Q?vodKMFDV9HJ+ajQt675qVgdhAfnZE0Qh+oQ3awMpxOv8iwIi5VqS6vCL2atD?=
 =?us-ascii?Q?iYgMGRx/Yd/t6PC5VYRtiWVprcQNV77yWwBRP+kHS0RvLFOHgZBK1isElQcZ?=
 =?us-ascii?Q?pxLBT+7F2J2zoxNFaAJBGAO4dfLRD3pl46cNkF+oqn2VK65jCCZOtffndTcl?=
 =?us-ascii?Q?5ZYa5E6Ae64uQMIsf4mE+g+Zz7YUjvAGVmuOveYWEMUhOaDlDk+SRrxlA2ts?=
 =?us-ascii?Q?+FW6Hq9zTTTfcaZ39N+7vs0pMU6pxWAZmGHZzGsB7DMBc1hZR7cLCLaClDlO?=
 =?us-ascii?Q?dCjYZE5tRX62bkvV0oMJNZ/JR0lU3tN9vDURC/A6EMmAufVlXgafhIRGWIqi?=
 =?us-ascii?Q?XqkZYMSyLlgqE63UL7LqItik2CcNshy/4ud+Hxflv+0eXhgx0WtlxFy/a7Q6?=
 =?us-ascii?Q?R3aEXyzk8cxozLmtI3XGhoOQIc53CIBBPSolnIffxzuWd2DiaT2xTLd8AsIo?=
 =?us-ascii?Q?W2jcfDL/ZIjTaDYnAZ5tsyudr83kgGZo+n3prhgguMeYSm2NMAn9HNxy1TIP?=
 =?us-ascii?Q?Q/Gzfi0AXDWaMRj7gS06Gp/jm+c7JSsBMkwUucMZfW9yBsKvNa/8AC81jog4?=
 =?us-ascii?Q?SAGAvMFe6asI9Z0yzhQd0LQLR+vuPxJo4BqixKy9blkDIXm0w44w4Ou08P6O?=
 =?us-ascii?Q?ODHR5jLEsOI54uy2ykJjYcI/Z024H/uo87kSqWvt2BalyRRRaNAHe9UX3Hz0?=
 =?us-ascii?Q?RhXG/OWQ8yqWBEYMD4VHfpmbqSO+rOgntjaujbyG6uggG7s5RljCKP0mC5N/?=
 =?us-ascii?Q?LbXQ2WSXoeYKfhtj+7bKqjt795E7Ftvnn/zTas6SwJS4k12qWszxMap5sfmh?=
 =?us-ascii?Q?C9IBaPmaTs001GgMknX/nd676pD7+GokngWNqcGKcq3HUQrseMHIWj+n/97y?=
 =?us-ascii?Q?Kp4xe6bQlzoIsRexd6UGlRIV2CFKhWopJ4YUgdu9oL+me1i092eT7nEfv7Rs?=
 =?us-ascii?Q?/JZnSx5x+Hh7zXgnkLZi9oPyhTaxfX4PkqK6un87/9WnZ+3maoZLi9aGoVjm?=
 =?us-ascii?Q?oDS67mylUJELWMFX3WvXS76yYfz3nF2QJYjtRbLr+q4Oi3vlKyHh73nkdUKp?=
 =?us-ascii?Q?8ESC0hTCctC/tSkgqF4q9vmJc4FdWwSKSYal0aVK8QfFe7YJPChu/gFzK9Dd?=
 =?us-ascii?Q?7gUcWOYFrO3jGAxCiDiVmCtprBzPlF7Kbl6a6FNuf1DWhK69Ma7LraqHjfnn?=
 =?us-ascii?Q?jXBTF8XgZhTiSD+xHzyrakZQ5tw4Uo5E+8BaCWSyV+ERkVCWGIsuQZSL1mnO?=
 =?us-ascii?Q?fh51sqVr4Ws3mhficJ2CcJ+oxSb+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 17:07:12.7759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c0efbd-de52-42a2-50cc-08dc7693cba1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6781

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

There are three  originators for the PCI configuration space access:
1. The domain that owns physical host bridge: MMIO handlers are
there so we can update vPCI register handlers with the values
written by the hardware domain, e.g. physical view of the registers
vs guest's view on the configuration space.
2. Guest access to the passed through PCI devices: we need to properly
map virtual bus topology to the physical one, e.g. pass the configuration
space access to the corresponding physical devices.
3. Emulated host PCI bridge access. It doesn't exist in the physical
topology, e.g. it can't be mapped to some physical host bridge.
So, all access to the host bridge itself needs to be trapped and
emulated.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
In v15:
- base on top of ("arm/vpci: honor access size when returning an error")
In v11:
- Fixed format issues
- Added ASSERT_UNREACHABLE() to the dummy implementation of
vpci_translate_virtual_device()
- Moved variable in vpci_sbdf_from_gpa(), now it is easier to follow
the logic in the function
Since v9:
- Commend about required lock replaced with ASSERT()
- Style fixes
- call to vpci_translate_virtual_device folded into vpci_sbdf_from_gpa
Since v8:
- locks moved out of vpci_translate_virtual_device()
Since v6:
- add pcidevs locking to vpci_translate_virtual_device
- update wrt to the new locking scheme
Since v5:
- add vpci_translate_virtual_device for #ifndef CONFIG_HAS_VPCI_GUEST_SUPPORT
  case to simplify ifdefery
- add ASSERT(!is_hardware_domain(d)); to vpci_translate_virtual_device
- reset output register on failed virtual SBDF translation
Since v4:
- indentation fixes
- constify struct domain
- updated commit message
- updates to the new locking scheme (pdev->vpci_lock)
Since v3:
- revisit locking
- move code to vpci.c
Since v2:
 - pass struct domain instead of struct vcpu
 - constify arguments where possible
 - gate relevant code with CONFIG_HAS_VPCI_GUEST_SUPPORT
New in v2
---
 xen/arch/arm/vpci.c     | 45 ++++++++++++++++++++++++++++++++---------
 xen/drivers/vpci/vpci.c | 24 ++++++++++++++++++++++
 xen/include/xen/vpci.h  | 12 +++++++++++
 3 files changed, 71 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index b63a356bb4a8..516933bebfb3 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -7,33 +7,53 @@
 
 #include <asm/mmio.h>
 
-static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_host_bridge *bridge,
-                                     paddr_t gpa)
+static bool vpci_sbdf_from_gpa(struct domain *d,
+                               const struct pci_host_bridge *bridge,
+                               paddr_t gpa, pci_sbdf_t *sbdf)
 {
-    pci_sbdf_t sbdf;
+    bool translated = true;
+
+    ASSERT(sbdf);
 
     if ( bridge )
     {
-        sbdf.sbdf = VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
-        sbdf.seg = bridge->segment;
-        sbdf.bus += bridge->cfg->busn_start;
+        sbdf->sbdf = VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
+        sbdf->seg = bridge->segment;
+        sbdf->bus += bridge->cfg->busn_start;
     }
     else
-        sbdf.sbdf = VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
+    {
+        /*
+         * For the passed through devices we need to map their virtual SBDF
+         * to the physical PCI device being passed through.
+         */
+        sbdf->sbdf = VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
+        read_lock(&d->pci_lock);
+        translated = vpci_translate_virtual_device(d, sbdf);
+        read_unlock(&d->pci_lock);
+    }
 
-    return sbdf;
+    return translated;
 }
 
 static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
                           register_t *r, void *p)
 {
     struct pci_host_bridge *bridge = p;
-    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
+    pci_sbdf_t sbdf;
     const unsigned int access_size = (1U << info->dabt.size) * 8;
     const register_t invalid = GENMASK_ULL(access_size - 1, 0);
     /* data is needed to prevent a pointer cast on 32bit */
     unsigned long data;
 
+    ASSERT(!bridge == !is_hardware_domain(v->domain));
+
+    if ( !vpci_sbdf_from_gpa(v->domain, bridge, info->gpa, &sbdf) )
+    {
+        *r = invalid;
+        return 1;
+    }
+
     if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
                         1U << info->dabt.size, &data) )
     {
@@ -50,7 +70,12 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
                            register_t r, void *p)
 {
     struct pci_host_bridge *bridge = p;
-    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
+    pci_sbdf_t sbdf;
+
+    ASSERT(!bridge == !is_hardware_domain(v->domain));
+
+    if ( !vpci_sbdf_from_gpa(v->domain, bridge, info->gpa, &sbdf) )
+        return 1;
 
     return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
                            1U << info->dabt.size, r);
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 23722634d50b..98b294f09688 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -81,6 +81,30 @@ static int add_virtual_device(struct pci_dev *pdev)
     return 0;
 }
 
+/*
+ * Find the physical device which is mapped to the virtual device
+ * and translate virtual SBDF to the physical one.
+ */
+bool vpci_translate_virtual_device(const struct domain *d, pci_sbdf_t *sbdf)
+{
+    const struct pci_dev *pdev;
+
+    ASSERT(!is_hardware_domain(d));
+    ASSERT(rw_is_locked(&d->pci_lock));
+
+    for_each_pdev ( d, pdev )
+    {
+        if ( pdev->vpci && (pdev->vpci->guest_sbdf.sbdf == sbdf->sbdf) )
+        {
+            /* Replace guest SBDF with the physical one. */
+            *sbdf = pdev->sbdf;
+            return true;
+        }
+    }
+
+    return false;
+}
+
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
 
 void vpci_deassign_device(struct pci_dev *pdev)
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 980aded26fc1..7e5a0f0c50c1 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -303,6 +303,18 @@ static inline bool __must_check vpci_process_pending(struct vcpu *v)
 }
 #endif
 
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+bool vpci_translate_virtual_device(const struct domain *d, pci_sbdf_t *sbdf);
+#else
+static inline bool vpci_translate_virtual_device(const struct domain *d,
+                                                 pci_sbdf_t *sbdf)
+{
+    ASSERT_UNREACHABLE();
+
+    return false;
+}
+#endif
+
 #endif
 
 /*
-- 
2.45.1



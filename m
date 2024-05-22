Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 045A68CC949
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 01:00:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727916.1132633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9uwg-0001eo-Qf; Wed, 22 May 2024 23:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727916.1132633; Wed, 22 May 2024 23:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9uwg-0001ce-N2; Wed, 22 May 2024 23:00:30 +0000
Received: by outflank-mailman (input) for mailman id 727916;
 Wed, 22 May 2024 23:00:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=31Ro=MZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s9uwf-00085F-FS
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 23:00:29 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13f89e88-188f-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 01:00:27 +0200 (CEST)
Received: from CH2PR19CA0009.namprd19.prod.outlook.com (2603:10b6:610:4d::19)
 by DM4PR12MB5866.namprd12.prod.outlook.com (2603:10b6:8:65::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.20; Wed, 22 May 2024 23:00:18 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::30) by CH2PR19CA0009.outlook.office365.com
 (2603:10b6:610:4d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35 via Frontend
 Transport; Wed, 22 May 2024 23:00:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 23:00:18 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 18:00:17 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 22 May 2024 18:00:10 -0500
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
X-Inumbo-ID: 13f89e88-188f-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jt1/NlIeAv8OkqunZeZ/Wscjincc4KRRgJInrNPAUejv4X6DMD3TLTWMiOE9a+Ay0NySuA0oXUtgHsx8CEoZr5ex++Rrd+3v3YoonDhHg7lxCPFngzq/8YvkQoG44GHkRyCPDjmUmjwo9jQ+0HYQD3jfKru9EXQ3/pR/Bf4v0jfPHppqMt0ck8xSqLE8A1wNB7BUQyAjFQTN9s11hR7mcK9OdYn6Xn81djzx01sj37QTIV3lsQvNR2Gt5P0ThjcO79PPT78W3XG+2N/4JUG6SuWa+qsq6lHqAVnE9ywrZAUcqaCrKs9pxAAwThqXQ/qSWQPB8IKOM9NLk0fW9gbYDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uF7c5zavGjbbV/lkf4o6jybYZmZIylb5HcpXyWKE0tU=;
 b=MYpVIT0k9nyTpewe3mehTh6ec7igXTVVw9ksR4WGvv34qTMEHEMeP/+XdF/NlLNatf/fmihIY2XrgL1U7n70uBbMfgwragZDglnHc7dURCqbxHIDrZMqY15wCIApCgCb/6R2Oda7WTHhJUyA9Qo45db4WsVgYpjzh4L2gIq0IarIigFvCjyaraB3P9xn/IDBxUoLSE01keczMGRp1COSMczcTHLAgANgyGNNBXCfMdZsQ6NaXCasSxZ3IFovE4MOYcTRHYxTcuOyLesl/7EtxWIAiqMOirc29MUpODODqGpp3qawGk81+tKW/XvYXBbNxDPGUtbgtIkYIGhhf8y8hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uF7c5zavGjbbV/lkf4o6jybYZmZIylb5HcpXyWKE0tU=;
 b=zKO+HHUqN7nTUyl43gWACKGXwoDhtm+2MCYOLBu3jow+IgB5f4mQVLnNRLwG5AGrWeCI/4rA0HPqZOK/GcjVuuc9kAyQ+nEBeIDmiIk8eqNKE5hc1d/C3Pv4eSZ1pQD0fxrmcpkrUyiTISkXMgzAaYqTXJauJ7pnxzwgPdoh9w0=
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
Subject: [PATCH v16 4/5] xen/arm: translate virtual PCI bus topology for guests
Date: Wed, 22 May 2024 18:59:23 -0400
Message-ID: <20240522225927.77398-5-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240522225927.77398-1-stewart.hildebrand@amd.com>
References: <20240522225927.77398-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|DM4PR12MB5866:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e0fa9ef-0ac7-4e54-32a9-08dc7ab2f337
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fnZLKv+SGJt4vX2RMtcs9tiwjbyCahC6JTuuxvTAgkdpjbAsShlbm2pV6t9b?=
 =?us-ascii?Q?qcFm0uIXmjIFo3TwKM5+j5IIzoh0GwI4GqmV7QRC0qglEmsNkD0X8KSP6ch4?=
 =?us-ascii?Q?DQkAEC3fiP8RExYNNY0+DoEn1Wb1pwq14DxfHfucR2mKEdccizIgHbETCv5k?=
 =?us-ascii?Q?SoEDe/pL8WXo5VFE/U6ZxUEFZSyDTfkP/yqNe8NApZP1mf0KX6DblgTGdsrt?=
 =?us-ascii?Q?JXRwcTh/CW7IUq3GFwQsKk9I3ldsG258cdjlbsGuGpPof6JHYPfDWDTh65dj?=
 =?us-ascii?Q?7Y1HMEHBA0chpSDmnw3Lh+BSknn/RkER5CTvkmnoXw1CuEvJzjp0Ux9rie9P?=
 =?us-ascii?Q?Nt/lC0qMCfUexD1xj0KiCygIZAzyjgC6L6xeGq/+JneN4jZbdXVfLr8uKWE4?=
 =?us-ascii?Q?Hxr2jjI3eIE6mz4jkSRZvLpwVCI9Op63lx09jP6g8O3cnYG8tBFffrvGMaAt?=
 =?us-ascii?Q?wBMM1Mk2HKg0VlzblV0jpr2CNWQWVOQ4nyYH2JzQcYeG6Z4ynlv90VGfjCE4?=
 =?us-ascii?Q?8F/0nlQLEOOQTlCNDqT9OOzsnSRKO/yNgHm8NKqsLReMHxUU7NfC5qLiHd+V?=
 =?us-ascii?Q?SLfbGipts4gYgJDO/a0eTWaJ6ubeh3KyF1o4ohiBW4ZjNDz89dY30+m4q/ak?=
 =?us-ascii?Q?FfpENwYmT83Gg7CgI1VRfD/uq2KWivyh1OxPgvsHDxWL5b+MEfOS4HW7teIg?=
 =?us-ascii?Q?oPAIx4+ZLA0dTMUsydaYfHnmJ0hz722MYKKEKx/uA9M28UP8snvET5h3HVnG?=
 =?us-ascii?Q?PsWRoE6wtewOavtBBfV6ob7QWydj7VRJBUQODGkTJHDvCsTnCGjip+vJptXu?=
 =?us-ascii?Q?I7tpyqVt7WQiAb8GIKBWdkyY+SB0GapM+AqzXE5WwgNytlK7WnVeXCZeRWh0?=
 =?us-ascii?Q?DTIEIgBV/gaSI3SF8baSKDSWe5x4izWqV293gvR03XLJY8XqRoInioQwd31T?=
 =?us-ascii?Q?B1I/ZRnNdetzpsZpi3TgrnZR5tm2h2j+dXQOshUC1orGdLA7REYAQvqxL3/J?=
 =?us-ascii?Q?gC4w72Mix82EVp5t2MeoT5pRhzVszh4OALCpfYsD5DhaR8egojIuLPmyG/ta?=
 =?us-ascii?Q?gktwVQXX6L2MFiNYze2Nq/hOQBbiC7G7bRrzuFQVtL0o2x842baNPb+I9GYA?=
 =?us-ascii?Q?KqVcYL4F2LqA/BAmGYNAWVD1Nqs5JJNGo4bkJrEMcwQQk65IG7POQs/RG+AY?=
 =?us-ascii?Q?fHzAF0Zk4Rf6Y27farg/sBDSZ8cfv8UddOq0SygLxQ/JhTL2AJdSlAq5aJyr?=
 =?us-ascii?Q?+GBbzWIv78U7ZMPP13RN8S8/r7IOYnXmpcjRxumk/xtRfd6lFDa+faAewO69?=
 =?us-ascii?Q?Em4wCWut1UXKPQxBKGyblQ9S2WbR4ARxc59SiriOMjlSgbNRk1UCC9CvZhpe?=
 =?us-ascii?Q?olZFSEU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 23:00:18.2078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e0fa9ef-0ac7-4e54-32a9-08dc7ab2f337
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5866

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
index 1e6aa5d799b9..86a89adb63b8 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -81,6 +81,30 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
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
index da8d0f41e6f4..533a319406b1 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -304,6 +304,18 @@ static inline bool __must_check vpci_process_pending(struct vcpu *v)
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



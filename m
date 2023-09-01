Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA7378F7BC
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 06:59:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594198.927438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwFc-0000TB-9X; Fri, 01 Sep 2023 04:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594198.927438; Fri, 01 Sep 2023 04:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwFc-0000Qp-6I; Fri, 01 Sep 2023 04:59:20 +0000
Received: by outflank-mailman (input) for mailman id 594198;
 Fri, 01 Sep 2023 04:59:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=am4h=ER=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qbwFa-0000Nr-M1
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 04:59:18 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7eab::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c62c828-4884-11ee-8783-cb3800f73035;
 Fri, 01 Sep 2023 06:59:16 +0200 (CEST)
Received: from CY5PR17CA0052.namprd17.prod.outlook.com (2603:10b6:930:12::30)
 by IA0PR12MB7674.namprd12.prod.outlook.com (2603:10b6:208:434::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Fri, 1 Sep
 2023 04:59:11 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:930:12:cafe::d3) by CY5PR17CA0052.outlook.office365.com
 (2603:10b6:930:12::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22 via Frontend
 Transport; Fri, 1 Sep 2023 04:59:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Fri, 1 Sep 2023 04:59:10 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 23:59:10 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 23:59:09 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 31 Aug 2023 23:59:08 -0500
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
X-Inumbo-ID: 4c62c828-4884-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jR5pEtfBwCpghDODLPo4YolLTi9/N6jMeQi7NO+84WfbV6F9F7icsvGNkbex66K9r7ATAOGuJkKHQ1p5FZvFuVpxIyrzKQ4LtvJT9g5sqExWAjwnh/SYCguE73rXfefwJjVLdkeL1Ybw3SKqpESLNAIGutSIOD5JUA4PkvyJL7wRzoxfqeM89HuGvStzXU8/ABU8TWok7gDBnMjGsaSKCuaZHl+n/bgyVuNZQyvIBMc8SIOBZYpV5F4l0zkSc69TdYresiyF6n0J95YGcgq9BdJJEqJPedHdDrr3jRn7IEZMdJcEpB0ySGJxwWFbMWa45DeijityDStO3GlOks9aeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZC2l0vFk7lQvmeX715YMFbry0xa9KxT1+wYTczHy+Ts=;
 b=ASMl42MQ6bIcwEVB395ebU/ubUsMZIsRiBlEcHU/Ea4mNrKSI/MttPqmjg81/ZV7yWrJ85Xmvk82Z/2Akm+NyPMuVYwoOCULBaGkO5GChf6csC+VEmfnwzvK1paqlVpc8DZwSI/YAr1YiqgT1/+Ab61h/omsyUDeyPKe7HQv1BCTsoj4/fpa8L2ta9pXdQKgdmY9YQk7UfTjBUwV8LR+cpaZlFr5tVdsjs1KnlSxTlwqF6R6hsUoYo4F+KHT5y0dx8Guecr+us3WPrIr7mTLY73muoKVI260uhYyKUhkDxHGIYaOl/r5sJE/iyMTgr/kQ2hPRBu+pt4wkgpD17iSWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZC2l0vFk7lQvmeX715YMFbry0xa9KxT1+wYTczHy+Ts=;
 b=Kggt8T25TYEWefCoHKqOvKLlPxtf0D65xisVtEgiGsac85fPTRB/9EKUVdormvX3HrIpv24pvDHjyXUMrlNmxssRUQP6Rv35pZk621EO27OqNsBoHXPd26HehpvTRBebpwQ8mZFOmPSxrU2O9r+MjUfrpV5trkQrYyN8UVcpNSQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant
	<paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v5 1/5] xen/pci: convert pci_find_*cap* to pci_sbdf_t
Date: Fri, 1 Sep 2023 00:57:28 -0400
Message-ID: <20230901045742.235975-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230901045742.235975-1-stewart.hildebrand@amd.com>
References: <20230901045742.235975-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|IA0PR12MB7674:EE_
X-MS-Office365-Filtering-Correlation-Id: 47de36dd-b8ab-4159-11a8-08dbaaa82e44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T5TyRQgQCLZSHOgollpB/M2qUTBNTUJdJMVPu9ugP32RAkt+Cpa2api+E3L/FHncZJg0thFzA4aWz9WUGUMZDOwYDFVAENXHza6LkivHXrUvWWr0zqKYwO04eXcRDYmonbt0NwCUnwTMB8CV1s4Qmrckl1krfwX/5e9fCEA75e2cXWIjEPoL5tybCBwFT29db2zoyilqoN3ONoczXaM+pGJYb4AnMI/KXo38DyG0lYzlyOJaPAonea+7r9dBGi8OysfrSs93KWnNsFTxA/M0P9rjNw344ARMovJqxy5ih/cAz9L3BmSJBrQm3B8Wy6tzu7fYF0ekYEFVaRBTBROxIuIcRifA0GKAglpyVQY8CVxagQEDLFtjFsMjXffX50KK9hG0TUe4fHeNpr4KAjPtChvPq8c4NjCcncZX4f3qmDKccRf9iEx6s2LrJ2yyjPbeCbEfddfN6VbE0CdjfcRfBfUK9opTPCdOkS+PnZlMsufyW89UZKd8fO/n4dnwlaToD7aIaGpl7J741ovSC76wY8JGx/ITU1petlvYbDklSXesLJ4gVHaumiFvp6pCD5G/Sdr5bawhCnYSgoC7qMZn54+ITNxpIf6kuNhfXr9DWKFJ3S33R0k0xs17BLUDZd4rFmGKL6ijovvFkx4yxu8gUwGrRWmZOVLEDaHrNNQiIViEzmLi1Mj4pE+7VudHwqpd03ZJ9RXiC7KK0rw+Djc2Qrsah5K9aYqivRIx6L50R6Ke8S9EnWQ9Id/vXj749Wo2eKzKoiZtnLVIjW89WLatjA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(346002)(376002)(136003)(1800799009)(186009)(451199024)(82310400011)(36840700001)(46966006)(40470700004)(356005)(82740400003)(6666004)(36756003)(40460700003)(36860700001)(86362001)(81166007)(47076005)(40480700001)(2616005)(1076003)(30864003)(2906002)(426003)(336012)(26005)(83380400001)(478600001)(70586007)(70206006)(8936002)(54906003)(8676002)(4326008)(44832011)(5660300002)(7416002)(41300700001)(6916009)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 04:59:10.9403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47de36dd-b8ab-4159-11a8-08dbaaa82e44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7674

Convert pci_find_*cap* functions and call sites to pci_sbdf_t, and remove some
now unused local variables. Also change to more appropriate types on lines that
are already being modified as a result of the pci_sbdf_t conversion.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
I built with EXTRA_CFLAGS_XEN_CORE="-Wunused-but-set-variable" (and
unfortunately -Wno-error=unused-but-set-variable too) to identify locations of
unneeded local variables as a result of the change to pci_sbdf_t.

v4->v5:
* add Jan's R-b

v3->v4:
* use more appropriate types on lines that are being modified anyway
* remove "no functional change" from commit description

v2->v3:
* new patch
---
 xen/arch/x86/msi.c                         | 40 ++++++----------------
 xen/drivers/char/ehci-dbgp.c               |  3 +-
 xen/drivers/passthrough/amd/iommu_detect.c |  2 +-
 xen/drivers/passthrough/ats.c              |  4 +--
 xen/drivers/passthrough/ats.h              |  6 ++--
 xen/drivers/passthrough/msi.c              |  6 ++--
 xen/drivers/passthrough/pci.c              | 21 +++++-------
 xen/drivers/passthrough/vtd/quirks.c       | 10 ++----
 xen/drivers/passthrough/vtd/x86/ats.c      |  3 +-
 xen/drivers/pci/pci.c                      | 32 +++++++++--------
 xen/drivers/vpci/msi.c                     |  4 +--
 xen/drivers/vpci/msix.c                    |  4 +--
 xen/include/xen/pci.h                      | 11 +++---
 13 files changed, 58 insertions(+), 88 deletions(-)

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 41b82f3e87cb..8d4fd43b10a6 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -283,7 +283,7 @@ static void msi_set_enable(struct pci_dev *dev, int enable)
     u8 slot = PCI_SLOT(dev->devfn);
     u8 func = PCI_FUNC(dev->devfn);
 
-    pos = pci_find_cap_offset(seg, bus, slot, func, PCI_CAP_ID_MSI);
+    pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSI);
     if ( pos )
         __msi_set_enable(seg, bus, slot, func, pos, enable);
 }
@@ -291,12 +291,9 @@ static void msi_set_enable(struct pci_dev *dev, int enable)
 static void msix_set_enable(struct pci_dev *dev, int enable)
 {
     int pos;
-    u16 control, seg = dev->seg;
-    u8 bus = dev->bus;
-    u8 slot = PCI_SLOT(dev->devfn);
-    u8 func = PCI_FUNC(dev->devfn);
+    uint16_t control;
 
-    pos = pci_find_cap_offset(seg, bus, slot, func, PCI_CAP_ID_MSIX);
+    pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSIX);
     if ( pos )
     {
         control = pci_conf_read16(dev->sbdf, msix_control_reg(pos));
@@ -603,13 +600,10 @@ static int msi_capability_init(struct pci_dev *dev,
     struct msi_desc *entry;
     int pos;
     unsigned int i, mpos;
-    u16 control, seg = dev->seg;
-    u8 bus = dev->bus;
-    u8 slot = PCI_SLOT(dev->devfn);
-    u8 func = PCI_FUNC(dev->devfn);
+    uint16_t control;
 
     ASSERT(pcidevs_locked());
-    pos = pci_find_cap_offset(seg, bus, slot, func, PCI_CAP_ID_MSI);
+    pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSI);
     if ( !pos )
         return -ENODEV;
     control = pci_conf_read16(dev->sbdf, msi_control_reg(pos));
@@ -680,8 +674,8 @@ static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
     {
         struct pci_dev *pdev = pci_get_pdev(NULL,
                                             PCI_SBDF(seg, bus, slot, func));
-        unsigned int pos = pci_find_ext_capability(seg, bus,
-                                                   PCI_DEVFN(slot, func),
+        unsigned int pos = pci_find_ext_capability(PCI_SBDF(seg, bus, slot,
+                                                            func),
                                                    PCI_EXT_CAP_ID_SRIOV);
         uint16_t ctrl = pci_conf_read16(PCI_SBDF(seg, bus, slot, func),
                                         pos + PCI_SRIOV_CTRL);
@@ -772,8 +766,7 @@ static int msix_capability_init(struct pci_dev *dev,
     u8 slot = PCI_SLOT(dev->devfn);
     u8 func = PCI_FUNC(dev->devfn);
     bool maskall = msix->host_maskall, zap_on_error = false;
-    unsigned int pos = pci_find_cap_offset(seg, bus, slot, func,
-                                           PCI_CAP_ID_MSIX);
+    unsigned int pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSIX);
 
     if ( !pos )
         return -ENODEV;
@@ -1097,12 +1090,7 @@ static void _pci_cleanup_msix(struct arch_msix *msix)
 static void __pci_disable_msix(struct msi_desc *entry)
 {
     struct pci_dev *dev = entry->dev;
-    u16 seg = dev->seg;
-    u8 bus = dev->bus;
-    u8 slot = PCI_SLOT(dev->devfn);
-    u8 func = PCI_FUNC(dev->devfn);
-    unsigned int pos = pci_find_cap_offset(seg, bus, slot, func,
-                                           PCI_CAP_ID_MSIX);
+    unsigned int pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSIX);
     u16 control = pci_conf_read16(dev->sbdf,
                                   msix_control_reg(entry->msi_attrib.pos));
     bool maskall = dev->msix->host_maskall;
@@ -1206,8 +1194,7 @@ void pci_cleanup_msi(struct pci_dev *pdev)
 
 int pci_reset_msix_state(struct pci_dev *pdev)
 {
-    unsigned int pos = pci_find_cap_offset(pdev->seg, pdev->bus, pdev->sbdf.dev,
-                                           pdev->sbdf.fn, PCI_CAP_ID_MSIX);
+    unsigned int pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_MSIX);
 
     ASSERT(pos);
     /*
@@ -1229,10 +1216,6 @@ int pci_reset_msix_state(struct pci_dev *pdev)
 int pci_msi_conf_write_intercept(struct pci_dev *pdev, unsigned int reg,
                                  unsigned int size, uint32_t *data)
 {
-    u16 seg = pdev->seg;
-    u8 bus = pdev->bus;
-    u8 slot = PCI_SLOT(pdev->devfn);
-    u8 func = PCI_FUNC(pdev->devfn);
     struct msi_desc *entry;
     unsigned int pos;
 
@@ -1240,8 +1223,7 @@ int pci_msi_conf_write_intercept(struct pci_dev *pdev, unsigned int reg,
     {
         entry = find_msi_entry(pdev, -1, PCI_CAP_ID_MSIX);
         pos = entry ? entry->msi_attrib.pos
-                    : pci_find_cap_offset(seg, bus, slot, func,
-                                          PCI_CAP_ID_MSIX);
+                    : pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_MSIX);
         ASSERT(pos);
 
         if ( reg >= pos && reg < msix_pba_offset_reg(pos) + 4 )
diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.c
index 72be4d9cc970..00cbdd5454dd 100644
--- a/xen/drivers/char/ehci-dbgp.c
+++ b/xen/drivers/char/ehci-dbgp.c
@@ -687,7 +687,8 @@ static unsigned int __init __find_dbgp(u8 bus, u8 slot, u8 func)
     if ( (class >> 8) != PCI_CLASS_SERIAL_USB_EHCI )
         return 0;
 
-    return pci_find_cap_offset(0, bus, slot, func, PCI_CAP_ID_EHCI_DEBUG);
+    return pci_find_cap_offset(PCI_SBDF(0, bus, slot, func),
+                               PCI_CAP_ID_EHCI_DEBUG);
 }
 
 static unsigned int __init find_dbgp(struct ehci_dbgp *dbgp,
diff --git a/xen/drivers/passthrough/amd/iommu_detect.c b/xen/drivers/passthrough/amd/iommu_detect.c
index 2317fa6a7d8d..cede44e6518f 100644
--- a/xen/drivers/passthrough/amd/iommu_detect.c
+++ b/xen/drivers/passthrough/amd/iommu_detect.c
@@ -27,7 +27,7 @@ static int __init get_iommu_msi_capabilities(
 {
     int pos;
 
-    pos = pci_find_cap_offset(seg, bus, dev, func, PCI_CAP_ID_MSI);
+    pos = pci_find_cap_offset(PCI_SBDF(seg, bus, dev, func), PCI_CAP_ID_MSI);
 
     if ( !pos )
         return -ENODEV;
diff --git a/xen/drivers/passthrough/ats.c b/xen/drivers/passthrough/ats.c
index 253f5c2e1042..0da183d057c5 100644
--- a/xen/drivers/passthrough/ats.c
+++ b/xen/drivers/passthrough/ats.c
@@ -24,11 +24,9 @@ boolean_param("ats", ats_enabled);
 int enable_ats_device(struct pci_dev *pdev, struct list_head *ats_list)
 {
     u32 value;
-    u16 seg = pdev->seg;
-    u8 bus = pdev->bus, devfn = pdev->devfn;
     int pos;
 
-    pos = pci_find_ext_capability(seg, bus, devfn, PCI_EXT_CAP_ID_ATS);
+    pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ATS);
     BUG_ON(!pos);
 
     if ( iommu_verbose )
diff --git a/xen/drivers/passthrough/ats.h b/xen/drivers/passthrough/ats.h
index baa5f6a6dc04..f5e1d254e0d3 100644
--- a/xen/drivers/passthrough/ats.h
+++ b/xen/drivers/passthrough/ats.h
@@ -32,7 +32,8 @@ static inline int pci_ats_enabled(int seg, int bus, int devfn)
     u32 value;
     int pos;
 
-    pos = pci_find_ext_capability(seg, bus, devfn, PCI_EXT_CAP_ID_ATS);
+    pos = pci_find_ext_capability(PCI_SBDF(seg, bus, devfn),
+                                  PCI_EXT_CAP_ID_ATS);
     BUG_ON(!pos);
 
     value = pci_conf_read16(PCI_SBDF(seg, bus, devfn), pos + ATS_REG_CTL);
@@ -45,7 +46,8 @@ static inline int pci_ats_device(int seg, int bus, int devfn)
     if ( !ats_enabled )
         return 0;
 
-    return pci_find_ext_capability(seg, bus, devfn, PCI_EXT_CAP_ID_ATS);
+    return pci_find_ext_capability(PCI_SBDF(seg, bus, devfn),
+                                   PCI_EXT_CAP_ID_ATS);
 }
 
 #endif /* _ATS_H_ */
diff --git a/xen/drivers/passthrough/msi.c b/xen/drivers/passthrough/msi.c
index fb78e2ebe8a4..13d904692ef8 100644
--- a/xen/drivers/passthrough/msi.c
+++ b/xen/drivers/passthrough/msi.c
@@ -24,8 +24,7 @@ int pdev_msi_init(struct pci_dev *pdev)
 
     INIT_LIST_HEAD(&pdev->msi_list);
 
-    pos = pci_find_cap_offset(pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn),
-                              PCI_FUNC(pdev->devfn), PCI_CAP_ID_MSI);
+    pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_MSI);
     if ( pos )
     {
         uint16_t ctrl = pci_conf_read16(pdev->sbdf, msi_control_reg(pos));
@@ -33,8 +32,7 @@ int pdev_msi_init(struct pci_dev *pdev)
         pdev->msi_maxvec = multi_msi_capable(ctrl);
     }
 
-    pos = pci_find_cap_offset(pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn),
-                              PCI_FUNC(pdev->devfn), PCI_CAP_ID_MSIX);
+    pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_MSIX);
     if ( pos )
     {
         struct arch_msix *msix = xzalloc(struct arch_msix);
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index ed1f689227fa..04d00c7c37df 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -361,8 +361,7 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
             break;
 
         case DEV_TYPE_PCIe_ENDPOINT:
-            pos = pci_find_cap_offset(pseg->nr, bus, PCI_SLOT(devfn),
-                                      PCI_FUNC(devfn), PCI_CAP_ID_EXP);
+            pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_EXP);
             BUG_ON(!pos);
             cap = pci_conf_read16(pdev->sbdf, pos + PCI_EXP_DEVCAP);
             if ( cap & PCI_EXP_DEVCAP_PHANTOM )
@@ -565,13 +564,12 @@ struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf)
 static void pci_enable_acs(struct pci_dev *pdev)
 {
     int pos;
-    u16 cap, ctrl, seg = pdev->seg;
-    u8 bus = pdev->bus;
+    uint16_t cap, ctrl;
 
     if ( !is_iommu_enabled(pdev->domain) )
         return;
 
-    pos = pci_find_ext_capability(seg, bus, pdev->devfn, PCI_EXT_CAP_ID_ACS);
+    pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ACS);
     if (!pos)
         return;
 
@@ -704,7 +702,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
 
     if ( !pdev->info.is_virtfn && !pdev->vf_rlen[0] )
     {
-        unsigned int pos = pci_find_ext_capability(seg, bus, devfn,
+        unsigned int pos = pci_find_ext_capability(pdev->sbdf,
                                                    PCI_EXT_CAP_ID_SRIOV);
         uint16_t ctrl = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_CTRL);
 
@@ -916,7 +914,8 @@ enum pdev_type pdev_type(u16 seg, u8 bus, u8 devfn)
 {
     u16 class_device, creg;
     u8 d = PCI_SLOT(devfn), f = PCI_FUNC(devfn);
-    int pos = pci_find_cap_offset(seg, bus, d, f, PCI_CAP_ID_EXP);
+    unsigned int pos = pci_find_cap_offset(PCI_SBDF(seg, bus, devfn),
+                                           PCI_CAP_ID_EXP);
 
     class_device = pci_conf_read16(PCI_SBDF(seg, bus, d, f), PCI_CLASS_DEVICE);
     switch ( class_device )
@@ -1184,10 +1183,7 @@ static int hest_match_pci(const struct acpi_hest_aer_common *p,
 static bool hest_match_type(const struct acpi_hest_header *hest_hdr,
                               const struct pci_dev *pdev)
 {
-    unsigned int pos = pci_find_cap_offset(pdev->seg, pdev->bus,
-                                           PCI_SLOT(pdev->devfn),
-                                           PCI_FUNC(pdev->devfn),
-                                           PCI_CAP_ID_EXP);
+    unsigned int pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_EXP);
     u8 pcie = MASK_EXTR(pci_conf_read16(pdev->sbdf, pos + PCI_EXP_FLAGS),
                         PCI_EXP_FLAGS_TYPE);
 
@@ -1258,8 +1254,7 @@ bool pcie_aer_get_firmware_first(const struct pci_dev *pdev)
 {
     struct aer_hest_parse_info info = { .pdev = pdev };
 
-    return pci_find_cap_offset(pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn),
-                               PCI_FUNC(pdev->devfn), PCI_CAP_ID_EXP) &&
+    return pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_EXP) &&
            apei_hest_parse(aer_hest_parse, &info) >= 0 &&
            info.firmware_first;
 }
diff --git a/xen/drivers/passthrough/vtd/quirks.c b/xen/drivers/passthrough/vtd/quirks.c
index 5d706a539788..5a56565ea883 100644
--- a/xen/drivers/passthrough/vtd/quirks.c
+++ b/xen/drivers/passthrough/vtd/quirks.c
@@ -495,8 +495,6 @@ int me_wifi_quirk(struct domain *domain, uint8_t bus, uint8_t devfn,
 
 void pci_vtd_quirk(const struct pci_dev *pdev)
 {
-    int seg = pdev->seg;
-    int bus = pdev->bus;
     int pos;
     bool ff;
     u32 val, val2;
@@ -532,12 +530,10 @@ void pci_vtd_quirk(const struct pci_dev *pdev)
     /* Sandybridge-EP (Romley) */
     case 0x3c00: /* host bridge */
     case 0x3c01 ... 0x3c0b: /* root ports */
-        pos = pci_find_ext_capability(seg, bus, pdev->devfn,
-                                      PCI_EXT_CAP_ID_ERR);
+        pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ERR);
         if ( !pos )
         {
-            pos = pci_find_ext_capability(seg, bus, pdev->devfn,
-                                          PCI_EXT_CAP_ID_VNDR);
+            pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_VNDR);
             while ( pos )
             {
                 val = pci_conf_read32(pdev->sbdf, pos + PCI_VNDR_HEADER);
@@ -546,7 +542,7 @@ void pci_vtd_quirk(const struct pci_dev *pdev)
                     pos += PCI_VNDR_HEADER;
                     break;
                 }
-                pos = pci_find_next_ext_capability(seg, bus, pdev->devfn, pos,
+                pos = pci_find_next_ext_capability(pdev->sbdf, pos,
                                                    PCI_EXT_CAP_ID_VNDR);
             }
             ff = 0;
diff --git a/xen/drivers/passthrough/vtd/x86/ats.c b/xen/drivers/passthrough/vtd/x86/ats.c
index 9de419775f90..1f5913bed9d2 100644
--- a/xen/drivers/passthrough/vtd/x86/ats.c
+++ b/xen/drivers/passthrough/vtd/x86/ats.c
@@ -57,8 +57,7 @@ int ats_device(const struct pci_dev *pdev, const struct acpi_drhd_unit *drhd)
         return 0;
 
     ats_drhd = find_ats_dev_drhd(drhd->iommu);
-    pos = pci_find_ext_capability(pdev->seg, pdev->bus, pdev->devfn,
-                                  PCI_EXT_CAP_ID_ATS);
+    pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ATS);
 
     if ( pos && (ats_drhd == NULL) )
     {
diff --git a/xen/drivers/pci/pci.c b/xen/drivers/pci/pci.c
index c73a8c4124af..3569ccb24e9e 100644
--- a/xen/drivers/pci/pci.c
+++ b/xen/drivers/pci/pci.c
@@ -8,25 +8,25 @@
 #include <xen/pci.h>
 #include <xen/pci_regs.h>
 
-int pci_find_cap_offset(u16 seg, u8 bus, u8 dev, u8 func, u8 cap)
+unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap)
 {
     u8 id;
     int max_cap = 48;
     u8 pos = PCI_CAPABILITY_LIST;
     u16 status;
 
-    status = pci_conf_read16(PCI_SBDF(seg, bus, dev, func), PCI_STATUS);
+    status = pci_conf_read16(sbdf, PCI_STATUS);
     if ( (status & PCI_STATUS_CAP_LIST) == 0 )
         return 0;
 
     while ( max_cap-- )
     {
-        pos = pci_conf_read8(PCI_SBDF(seg, bus, dev, func), pos);
+        pos = pci_conf_read8(sbdf, pos);
         if ( pos < 0x40 )
             break;
 
         pos &= ~3;
-        id = pci_conf_read8(PCI_SBDF(seg, bus, dev, func), pos + PCI_CAP_LIST_ID);
+        id = pci_conf_read8(sbdf, pos + PCI_CAP_LIST_ID);
 
         if ( id == 0xff )
             break;
@@ -39,19 +39,20 @@ int pci_find_cap_offset(u16 seg, u8 bus, u8 dev, u8 func, u8 cap)
     return 0;
 }
 
-int pci_find_next_cap(u16 seg, u8 bus, unsigned int devfn, u8 pos, int cap)
+unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
+                               unsigned int cap)
 {
     u8 id;
     int ttl = 48;
 
     while ( ttl-- )
     {
-        pos = pci_conf_read8(PCI_SBDF(seg, bus, devfn), pos);
+        pos = pci_conf_read8(sbdf, pos);
         if ( pos < 0x40 )
             break;
 
         pos &= ~3;
-        id = pci_conf_read8(PCI_SBDF(seg, bus, devfn), pos + PCI_CAP_LIST_ID);
+        id = pci_conf_read8(sbdf, pos + PCI_CAP_LIST_ID);
 
         if ( id == 0xff )
             break;
@@ -65,21 +66,21 @@ int pci_find_next_cap(u16 seg, u8 bus, unsigned int devfn, u8 pos, int cap)
 
 /**
  * pci_find_ext_capability - Find an extended capability
- * @seg/@bus/@devfn: PCI device to query
+ * @sbdf: PCI device to query
  * @cap: capability code
  *
  * Returns the address of the requested extended capability structure
  * within the device's PCI configuration space or 0 if the device does
  * not support it.
  */
-int pci_find_ext_capability(int seg, int bus, int devfn, int cap)
+unsigned int pci_find_ext_capability(pci_sbdf_t sbdf, unsigned int cap)
 {
-    return pci_find_next_ext_capability(seg, bus, devfn, 0, cap);
+    return pci_find_next_ext_capability(sbdf, 0, cap);
 }
 
 /**
  * pci_find_next_ext_capability - Find another extended capability
- * @seg/@bus/@devfn: PCI device to query
+ * @sbdf: PCI device to query
  * @start: starting position
  * @cap: capability code
  *
@@ -87,13 +88,14 @@ int pci_find_ext_capability(int seg, int bus, int devfn, int cap)
  * within the device's PCI configuration space or 0 if the device does
  * not support it.
  */
-int pci_find_next_ext_capability(int seg, int bus, int devfn, int start, int cap)
+unsigned int pci_find_next_ext_capability(pci_sbdf_t sbdf, unsigned int start,
+                                          unsigned int cap)
 {
     u32 header;
     int ttl = 480; /* 3840 bytes, minimum 8 bytes per capability */
-    int pos = max(start, 0x100);
+    unsigned int pos = max(start, 0x100U);
 
-    header = pci_conf_read32(PCI_SBDF(seg, bus, devfn), pos);
+    header = pci_conf_read32(sbdf, pos);
 
     /*
      * If we have no capabilities, this is indicated by cap ID,
@@ -109,7 +111,7 @@ int pci_find_next_ext_capability(int seg, int bus, int devfn, int start, int cap
         pos = PCI_EXT_CAP_NEXT(header);
         if ( pos < 0x100 )
             break;
-        header = pci_conf_read32(PCI_SBDF(seg, bus, devfn), pos);
+        header = pci_conf_read32(sbdf, pos);
     }
     return 0;
 }
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 2814b63d2be7..a253ccbd7db7 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -184,9 +184,7 @@ static void cf_check mask_write(
 
 static int cf_check init_msi(struct pci_dev *pdev)
 {
-    uint8_t slot = PCI_SLOT(pdev->devfn), func = PCI_FUNC(pdev->devfn);
-    unsigned int pos = pci_find_cap_offset(pdev->seg, pdev->bus, slot, func,
-                                           PCI_CAP_ID_MSI);
+    unsigned int pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_MSI);
     uint16_t control;
     int ret;
 
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 1be861343dba..d1126a417da9 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -659,14 +659,12 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
 static int cf_check init_msix(struct pci_dev *pdev)
 {
     struct domain *d = pdev->domain;
-    uint8_t slot = PCI_SLOT(pdev->devfn), func = PCI_FUNC(pdev->devfn);
     unsigned int msix_offset, i, max_entries;
     uint16_t control;
     struct vpci_msix *msix;
     int rc;
 
-    msix_offset = pci_find_cap_offset(pdev->seg, pdev->bus, slot, func,
-                                      PCI_CAP_ID_MSIX);
+    msix_offset = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_MSIX);
     if ( !msix_offset )
         return 0;
 
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 7d8a7cd21301..ea6a4c9abf38 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -193,11 +193,12 @@ int pci_mmcfg_read(unsigned int seg, unsigned int bus,
                    unsigned int devfn, int reg, int len, u32 *value);
 int pci_mmcfg_write(unsigned int seg, unsigned int bus,
                     unsigned int devfn, int reg, int len, u32 value);
-int pci_find_cap_offset(u16 seg, u8 bus, u8 dev, u8 func, u8 cap);
-int pci_find_next_cap(u16 seg, u8 bus, unsigned int devfn, u8 pos, int cap);
-int pci_find_ext_capability(int seg, int bus, int devfn, int cap);
-int pci_find_next_ext_capability(int seg, int bus, int devfn, int start,
-                                 int cap);
+unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap);
+unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
+                               unsigned int cap);
+unsigned int pci_find_ext_capability(pci_sbdf_t sbdf, unsigned int cap);
+unsigned int pci_find_next_ext_capability(pci_sbdf_t sbdf, unsigned int start,
+                                          unsigned int cap);
 const char *parse_pci(const char *, unsigned int *seg, unsigned int *bus,
                       unsigned int *dev, unsigned int *func);
 const char *parse_pci_seg(const char *, unsigned int *seg, unsigned int *bus,
-- 
2.42.0



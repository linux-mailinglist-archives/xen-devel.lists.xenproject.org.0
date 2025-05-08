Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EE0AAF850
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 12:46:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979272.1365956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCym2-0006UQ-7E; Thu, 08 May 2025 10:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979272.1365956; Thu, 08 May 2025 10:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCym2-0006Rj-3F; Thu, 08 May 2025 10:46:42 +0000
Received: by outflank-mailman (input) for mailman id 979272;
 Thu, 08 May 2025 10:46:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IqQS=XY=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uCym0-00061s-Ll
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 10:46:40 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20622.outbound.protection.outlook.com
 [2a01:111:f403:2414::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8d2b17b-2bf9-11f0-9eb4-5ba50f476ded;
 Thu, 08 May 2025 12:46:39 +0200 (CEST)
Received: from BL0PR02CA0069.namprd02.prod.outlook.com (2603:10b6:207:3d::46)
 by SN7PR12MB8028.namprd12.prod.outlook.com (2603:10b6:806:341::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Thu, 8 May
 2025 10:46:33 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:207:3d:cafe::d8) by BL0PR02CA0069.outlook.office365.com
 (2603:10b6:207:3d::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Thu,
 8 May 2025 10:46:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 8 May 2025 10:46:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 05:46:32 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 05:46:32 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 8 May 2025 05:46:25 -0500
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
X-Inumbo-ID: b8d2b17b-2bf9-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPW8arZwYrz9tYcIY/dStTCDrRL37gGH2MhgcV4bWZvCaM04K96wC8SgrBgwdn38bKSyyjHSCcT+oJcwmReusKxUBn6s+VTkMTl1+asbyxeINybBM3WBsgEloqusigBQHT3hYNmVin6tZsaKBvtatJvn8Mu69jLKld8b2TAp02WPGI7MLerzcZyQfCkPimyC11dSlcD63m5C7F58w49sciJeQiGyfALqT5nwyvPuC8RiJy+fQ/IZIA5mD38jBwGxZVG67+dHLHOaxlnrN3D++ue/8XfGDtx8wo9ZA0mnbO5tbNE3xKUbygCXtoJRP56cj/mBEtfJbQvmj9jarQlMUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07oonBGuyFDrFTpIXfAPomqVLfYtNQTC2ByuuwV+kOM=;
 b=FDkX3O/M5EshUjWBRXzcBa+hCXpbkzyzeCtqld0t9WfpBemaFa/SB42pmJd2tAFWHDDx9Tm2lkxadgoyG1WiHTGoRn7SIQg1hq0HULHeApn8Zpc8O5Y5ZihZ9vo4PUWevXTG8mtOTB4pYH+H9UFLeRjVikxzdcH2LwLJun9SR5QGwNBDGFwRTz1c1TM4O5imMFKXjjGvC6yiJo1DQ7TTSrqUXmJVNSAJ40IL4u21tkiKdIAkMudC4O239lbih2sGqOOLvm+urhVu0yI8Hfl4HQK7kd8jpnjVzT1DDSDrdTuifvMJy0asxEsE0e32zQHgJGLXE/IV23ayPd+G8jebAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07oonBGuyFDrFTpIXfAPomqVLfYtNQTC2ByuuwV+kOM=;
 b=zRxy2ejl0meWOqlq4QXh5klNduUjkyBmxvHjjE+bgjvOYuBvdQHzEgtPz+Q43ilSimjU/0F2PLXj2falBRDRQzX32dbBrszH/hAj7lqdr8LsmXF2K8SSmWFxyZ0MQnnSq43bvW6HWW8R4LKe1iidLXbL4yyME6jr8zOpDeuN6XM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Mykyta
 Poturai" <Mykyta_Poturai@epam.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>
Subject: [PATCH v21 2/2] vpci: translate virtual PCI bus topology for guests
Date: Thu, 8 May 2025 06:46:07 -0400
Message-ID: <20250508104608.531079-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508104608.531079-1-stewart.hildebrand@amd.com>
References: <20250508104608.531079-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|SN7PR12MB8028:EE_
X-MS-Office365-Filtering-Correlation-Id: b2c16bb7-9bf9-4f5e-8afe-08dd8e1d98fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r78BNYUWb05AiWcxnduacsgo60yqCD1li1gbqD/Z+9b4rkCzYQUeJl4IjL9p?=
 =?us-ascii?Q?AH5uXS3YRBxjvxDAJ/s4zB55ASYEcmMqcMHsLu1nmDeqRDQe8fIzbMEbw6w2?=
 =?us-ascii?Q?G3BUvrxgt/G45hFoWP/sdmGJQqhX7MbTpHnkp5mazN24WBiqcVDVFEXnNeME?=
 =?us-ascii?Q?jtrRFkKKSQ+lZUYA/41JXNZU6kSBwhgZjqYnLzFuTEkxl1YUal1xYMKcb0O0?=
 =?us-ascii?Q?pMhZeFa8RZQhLpAtLDpaKjF4NcIJdvviTpzPLyLAqLMhwkKfQzUPg7ivsodj?=
 =?us-ascii?Q?EH8GvNcKg6cHHpibgmvSt7Z2gkiWM5u60QYC8nsoThmi6V61AJIdX7DJSNtE?=
 =?us-ascii?Q?3zGD/gkRc0ZFiRD3iYcVTkiLexF78Vy72vPtQ1PG39i1OnNNwp42y4EQD0O5?=
 =?us-ascii?Q?jdcQL6CvCMvxzV+BAq9X3DV+mSBAfjCiLq1OusQOWkW3TeX+LbIws3Hxd9XP?=
 =?us-ascii?Q?GPiVRWIrmVeYazP3KNeqhr7SUpiHLDeVwV8hw/3wW/XxYQqjYJInuJqtD8uf?=
 =?us-ascii?Q?o9cJlYBxZeXv1lU0Ge5rXDe3lbSHErthjZMHLbeLw0Li8S7LU2/5k9xsNKjh?=
 =?us-ascii?Q?aFTjlT/ckd04m3nyRtmtFLzTlFQQ7fKPkTAeNqCQP6WIwHtnqgIyAliNaLLk?=
 =?us-ascii?Q?j0TDK3I9v5xPfcedOPUfQSjIMT06T2hpE2xY1+4GNlD+aXnccmzVUBlTJAr2?=
 =?us-ascii?Q?+J/sVJgWHDOvwK6s4HzDJa5i0NtK37eWWxKwTodtn4oIP7WwSY4EP0l4KtzS?=
 =?us-ascii?Q?3E3Rkz+mrnidL8Bypv/9SWT2JYJMcpAQUjumT9CJz88fDQPcnuwxfL7FiJS0?=
 =?us-ascii?Q?jTUDTNPO0Gvy/QWtw3bs7Prz2+anAX5LirPL/tKhsWo/k3TVybFAt7BfEm3g?=
 =?us-ascii?Q?tmzVKk2AuX6Z5u1D2yKtyexRnc5PgNYGskKglTlrp98Cpr4j0K/DYP6mcRP3?=
 =?us-ascii?Q?uiJfRp7Zuiwd8jyrscxXaTUsh1YXY3Szk6W7sEiQuZIx7XYdzC+8CS9cwnih?=
 =?us-ascii?Q?po+etFq8AjlngN//NYFOMvLKcEsivB/4GGwvrX9uCpzCLrJfmnE1wKyzReyo?=
 =?us-ascii?Q?5bLT/6UO35BIJSPg3KzwfC7OmmQ+qE0XdDjnxMGUSpA4ek+pAjhQARkeLOYL?=
 =?us-ascii?Q?2BaubmfaTMHdKK3RP6XwWIOoBQ/H0HjWaWIg//vXzDEFZZq7Jz/i/w/jPFeH?=
 =?us-ascii?Q?SIWa1cX936yAYRWjx9oNwz57vjKcgAMi091kB5Irr0eyGyH9PKxidxg1R1S8?=
 =?us-ascii?Q?GeqU8gy8PGY5FBiRd8sIPuCA+iFBYxomnoPKqtoeAue3DWa82TGpdq3VuC1Y?=
 =?us-ascii?Q?fRJs8QHJWURhJOoGzqcuzRoa4FhLq0ErwUi//F+IretcpohBtKVdMpjTPXKB?=
 =?us-ascii?Q?Q87hlilfW+q9gA4bES4DcWycm5KqkI2VyR409e7wNbUI0RzsNFLWnZKgrcOW?=
 =?us-ascii?Q?+KfmORxijWOCKpfj1vZnkOIdCWBe6Boin5XT+p++0AuKYS6EBpvU1SfRIlLv?=
 =?us-ascii?Q?HnquCeulsZaLZTNvGyT0AtqXT8GIk3bYqYT0yhJcs7vB9a5Wkbs3PDTo3Q?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 10:46:32.8038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c16bb7-9bf9-4f5e-8afe-08dd8e1d98fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8028

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

There are two originators for the PCI configuration space access:
1. The domain that owns physical host bridge: MMIO handlers are
there so we can update vPCI register handlers with the values
written by the hardware domain, e.g. physical view of the registers
vs guest's view on the configuration space.
2. Guest access to the passed through PCI devices: we need to properly
map virtual bus topology to the physical one, e.g. pass the configuration
space access to the corresponding physical devices.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
In v21:
* adjust #ifdef
* remove redundant return path
In v20:
* call translate_virtual_device() from within locked context of
  vpci_{read,write}
* update commit message
In v19:
* move locking to pre-patch
In v18:
* address warning in vpci test suite
In v17:
* move lock to inside vpci_translate_virtual_device()
* acks were previously given for Arm [0] and vPCI [1], but since it was
  two releases ago and the patch has changed, I didn't pick them up

[0] https://lore.kernel.org/xen-devel/4afe33f2-72e6-4755-98ce-d7f9da374e90@xen.org/
[1] https://lore.kernel.org/xen-devel/Zk70udmiriruMt0r@macbook/

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
 tools/tests/vpci/emul.h |  2 +-
 xen/arch/arm/vpci.c     |  4 ++++
 xen/drivers/vpci/vpci.c | 53 ++++++++++++++++++++++++++++++++++++-----
 3 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/tools/tests/vpci/emul.h b/tools/tests/vpci/emul.h
index da446bba86b4..dd048cffbf9d 100644
--- a/tools/tests/vpci/emul.h
+++ b/tools/tests/vpci/emul.h
@@ -89,7 +89,7 @@ typedef union {
 
 #define __hwdom_init
 
-#define is_hardware_domain(d) ((void)(d), false)
+#define is_hardware_domain(d) ((void)(d), true)
 
 #define has_vpci(d) true
 
diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 3a3ff5d0812c..0ce11ffcc508 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -34,6 +34,8 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
     /* data is needed to prevent a pointer cast on 32bit */
     unsigned long data;
 
+    ASSERT(!bridge == !is_hardware_domain(v->domain));
+
     if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
                         1U << info->dabt.size, &data) )
     {
@@ -52,6 +54,8 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
     struct pci_host_bridge *bridge = p;
     pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
 
+    ASSERT(!bridge == !is_hardware_domain(v->domain));
+
     return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
                            1U << info->dabt.size, r);
 }
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 1e6aa5d799b9..d2f0f97e0a04 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -174,6 +174,35 @@ int vpci_assign_device(struct pci_dev *pdev)
 }
 #endif /* __XEN__ */
 
+/*
+ * Find the physical device which is mapped to the virtual device
+ * and translate virtual SBDF to the physical one.
+ */
+static const struct pci_dev *translate_virtual_device(const struct domain *d,
+                                                      pci_sbdf_t *sbdf)
+{
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
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
+            return pdev;
+        }
+    }
+#else /* !CONFIG_HAS_VPCI_GUEST_SUPPORT */
+    ASSERT_UNREACHABLE();
+#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
+
+    return NULL;
+}
+
 static int vpci_register_cmp(const struct vpci_register *r1,
                              const struct vpci_register *r2)
 {
@@ -453,9 +482,15 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
      * pci_lock is sufficient.
      */
     read_lock(&d->pci_lock);
-    pdev = pci_get_pdev(d, sbdf);
-    if ( !pdev && is_hardware_domain(d) )
-        pdev = pci_get_pdev(dom_xen, sbdf);
+    if ( is_hardware_domain(d) )
+    {
+        pdev = pci_get_pdev(d, sbdf);
+        if ( !pdev )
+            pdev = pci_get_pdev(dom_xen, sbdf);
+    }
+    else
+        pdev = translate_virtual_device(d, &sbdf);
+
     if ( !pdev || !pdev->vpci )
     {
         read_unlock(&d->pci_lock);
@@ -571,9 +606,15 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
      * are modifying BARs, so there is a room for improvement.
      */
     write_lock(&d->pci_lock);
-    pdev = pci_get_pdev(d, sbdf);
-    if ( !pdev && is_hardware_domain(d) )
-        pdev = pci_get_pdev(dom_xen, sbdf);
+    if ( is_hardware_domain(d) )
+    {
+        pdev = pci_get_pdev(d, sbdf);
+        if ( !pdev )
+            pdev = pci_get_pdev(dom_xen, sbdf);
+    }
+    else
+        pdev = translate_virtual_device(d, &sbdf);
+
     if ( !pdev || !pdev->vpci )
     {
         /* Ignore writes to read-only devices, which have no ->vpci. */
-- 
2.49.0



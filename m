Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2C4A93E11
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 21:00:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959328.1351730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5qvn-0001VR-G3; Fri, 18 Apr 2025 18:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959328.1351730; Fri, 18 Apr 2025 18:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5qvn-0001Sp-D0; Fri, 18 Apr 2025 18:59:19 +0000
Received: by outflank-mailman (input) for mailman id 959328;
 Fri, 18 Apr 2025 18:59:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gHr6=XE=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1u5qvl-00014S-ND
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 18:59:17 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20610.outbound.protection.outlook.com
 [2a01:111:f403:2418::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3944ff6d-1c87-11f0-9eb0-5ba50f476ded;
 Fri, 18 Apr 2025 20:59:16 +0200 (CEST)
Received: from BLAPR03CA0015.namprd03.prod.outlook.com (2603:10b6:208:32b::20)
 by SJ0PR12MB6928.namprd12.prod.outlook.com (2603:10b6:a03:47a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.26; Fri, 18 Apr
 2025 18:59:10 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:208:32b:cafe::69) by BLAPR03CA0015.outlook.office365.com
 (2603:10b6:208:32b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Fri,
 18 Apr 2025 18:59:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.4 via Frontend Transport; Fri, 18 Apr 2025 18:59:10 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 13:59:07 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 18 Apr 2025 13:59:01 -0500
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
X-Inumbo-ID: 3944ff6d-1c87-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IEsZg2FsxS2sIvnFM/RmLv1zdoAvvCuRSPFzDNYXfNbWQG0+rSDAK+X343MsfteuOtF3wJqsmjEbPr8i4xyxkrTihfl9V4xeWdYg95WUK2CAHpPjYHA5RsiT9pg4HUkhMb0ycGX1Y6MANPSvQyYaMVi8uOkNu/l4+0/oQ7Ei4l76V9Lf69bXdkYAual752xq3wSfGuLPzKwGcunmCCwSmXjAuM9xVQEC7iecfkv4EISPps/VnAs458EdeSYSmdOyN6nEnBqd6R2/bdq/iqyzaJrEZZ++FYoAR8rO3xlzt2VpKUt0sWYNZSswfqksNDllz3ZvHI/aIqD1goaFnE/Ylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAlUivpPbpK17IGyc2SL90/VS7vZTd5+wKTy79sl/LM=;
 b=LR//yiODYgOb/66CBYZ7bnUignKO/8Wuo96qo3u/awN1bkhSbBkhehgMb9vgUZeJuejT9Io7O/5zv/mIZDVMAoKa23aecqi++7NP3GbLPsSIqSiT/NSygSPPZ1Un5PgCe5WJjnFHzh0+ndC6IPPVu+H00iaLFseMeGBhZY0kEoaGEi4NNT+NsZO+ccGnUFe3OWpRSZAhT7b04HyOlUm8rtL124U06Sgmf/Ov3spjwpjtbMxShSCNiUvI1p2VqDLYL8+DtMdteh5ZzaojS/LSHJC/XZuouYVSHS26V1/l7MRcF90Nf48UA1tZBZiTzwXC6FQ1nTxcgLb2JX9tpAhkug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAlUivpPbpK17IGyc2SL90/VS7vZTd5+wKTy79sl/LM=;
 b=xMWBp32GLTp6UI4aMs6nINJH8shfO7TJpoQdXkiyyxi7moizUeFGiDfHTZYX7d9YvfAGfGVNf9H3J9iAEAdZFk/ZeI5XBKfpdG2fsamobNbAUnDVzyTluLatlm18XBnnijiE8/WFj71MDakEi6lhTzS+LxWgtUrQGyZ0Mlal0hM=
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
Subject: [PATCH v20 2/2] vpci: translate virtual PCI bus topology for guests
Date: Fri, 18 Apr 2025 14:58:37 -0400
Message-ID: <20250418185840.335816-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418185840.335816-1-stewart.hildebrand@amd.com>
References: <20250418185840.335816-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|SJ0PR12MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: e6687a8f-4988-4327-8c64-08dd7eab1a4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wU6zZ9wBOofRvWCwtozFrZj3839oiNyZwAWJ0VHGuaVNebMb+VV6NMHKU3Ev?=
 =?us-ascii?Q?YZC1idxL7ZaR2bnt2MqeKD3tcHb6aPql8DyIWn1cDLj32Po+1xz0B8s75qCl?=
 =?us-ascii?Q?fPxrGr8GdmLFV8i08uI0KZpANHyOa6eH7B1M9+GSNQCQS+YuKAiRd1D66pJT?=
 =?us-ascii?Q?FovrO276sW0jBMOo+ZHNMLvCYyg/eWXpaADJ0qFJyZFhcfsySEkl9KtR3q7L?=
 =?us-ascii?Q?itgK8yoyibI5RapO2CjbA+j2p9ZA4s0zk3mTHWh1ZLBu6Vmb9ZwSL4/g5NGb?=
 =?us-ascii?Q?RaKlEa3Pua2/o3Twof+FdNxmBgOdzDSLMDnPRl2VtxBqShRWiCogKGk8OCPN?=
 =?us-ascii?Q?3c1Moj3+/pS/UQ0Fd5K8dEHfa0zDB0LC+XvEdD3p6Isg9gAYD3QP8xkX7YPK?=
 =?us-ascii?Q?2zLHwUXJ6cPxVjXAR6B7Moqq3Xza3khkGy7Q6ZPTpguwZotKnu5XRtjdOuyj?=
 =?us-ascii?Q?inHg4GJxfl+ILqfVYDNeUuuTbw+Ja1Z5+xE7WYYV9bJOOdzuhp1P6wnX2oi4?=
 =?us-ascii?Q?weVDdixKH4okUGAg2ppq/3pcts9cKX2HbKGPOW0uUeRIJG6+7Qogy95O0zhv?=
 =?us-ascii?Q?T9PZ2cEf5dskj6c22RPqZOSJAKc90eoeycStwcDNT28Hwzq56lk/iD8x5kZD?=
 =?us-ascii?Q?oi1iZkZeW7pVY0WNCrATOs0Sn91XVfIQpaKwG5fgfJCUHlBITuQ2yFy1N71k?=
 =?us-ascii?Q?ldjonbR5/5xs+63AIoeYM33amQ8JaYnWn01OyvVjmZankEa6qyW1pwskCqA4?=
 =?us-ascii?Q?3nZAJtOBW6kUmMMlUUb0jPsLTLkkbYO5DHCa2YqTSOFwEgnfBoVc9NO2w4Y1?=
 =?us-ascii?Q?XFtaTegzE7Lg8juEnaBtzGjzZhjL+XBCfem+9t2TPF/gQ4knG60n4RKSmh1Q?=
 =?us-ascii?Q?cPpkivoPjwTc8NjC/TXhAej7opUZd0ufsb8Vg9vh1Cocsv3dQDLv/JG3qcrD?=
 =?us-ascii?Q?cbIy8vPmyEcCqJv3t+I5TIBcDXw9efiuiRBRu+rCN+ma3fMdDWwuc9fBNnyr?=
 =?us-ascii?Q?qkBuGH5G7Ek3XcZ1jTVzVe4lZV+9EpBBMlB+j8t+3QdnD2QZgYQq4zU/vIOg?=
 =?us-ascii?Q?FhaDeU4v1N/ZTBTfNkDigIRGeeZBhNWIEGH8N6GT50121un+EssDmZhw4Sua?=
 =?us-ascii?Q?ABbEkal7wOCmEPiIpE3IS2HM3ZRIxhZhgPCjffT5Zb21qholsCdNMaJvM+Io?=
 =?us-ascii?Q?OZ9ONqoVvcYOruYZ9sQMMS33dSuF2F1o6aq7apVGnGY3dYNLrsx+uZqeFpa+?=
 =?us-ascii?Q?4mCqEypCXbhClSvaE5LdDaSLvEUjtEuRzWWBxoLqNpAO3q7HA4G+145j603e?=
 =?us-ascii?Q?dqZzQ2SriREuZUZengxfNWdsz0z8IVxdWesM1RUaUl+iDOLs5Mx9xZlNvN5f?=
 =?us-ascii?Q?VjzH1npyz/CUnUt8XYZJh+K5c0tCsv2/05h6Q1Y4ugNmlaOfb/ZeilMK5bPn?=
 =?us-ascii?Q?Ps9FHvz5/RwYkZhiw6+Awe5o7Wkw4d02PeNeuswv3+FnNsV8eyOp3p/8hCrK?=
 =?us-ascii?Q?8lO6HFVMvLkevac=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 18:59:10.1978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6687a8f-4988-4327-8c64-08dd7eab1a4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6928

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

There are two originators for the PCI configuration space access:
1. The domain that owns physical host bridge: MMIO handlers are
there so we can update vPCI register handlers with the values
written by the hardware domain, e.g. physical view of the registers
vs guest's view on the configuration space.
2. Guest access to the passed through PCI devices: we need to properly
map virtual bus topology to the physical one, e.g. pass the configuration
space access to the corresponding physical devices.

In vpci_read(), use the access size to create a mask so as to not set
any bits above the access size when returning an error.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
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
 xen/arch/arm/vpci.c     |  4 +++
 xen/drivers/vpci/vpci.c | 73 +++++++++++++++++++++++++++++++++++++----
 3 files changed, 71 insertions(+), 8 deletions(-)

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
index b63a356bb4a8..618ddb7f6547 100644
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
index 1e6aa5d799b9..fc409f3fc346 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -174,6 +174,41 @@ int vpci_assign_device(struct pci_dev *pdev)
 }
 #endif /* __XEN__ */
 
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+/*
+ * Find the physical device which is mapped to the virtual device
+ * and translate virtual SBDF to the physical one.
+ */
+static const struct pci_dev *translate_virtual_device(const struct domain *d,
+                                                      pci_sbdf_t *sbdf)
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
+            return pdev;
+        }
+    }
+
+    return NULL;
+}
+#else
+static const struct pci_dev *translate_virtual_device(const struct domain *d,
+                                                      pci_sbdf_t *sbdf)
+{
+    ASSERT_UNREACHABLE();
+
+    return NULL;
+}
+#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
+
 static int vpci_register_cmp(const struct vpci_register *r1,
                              const struct vpci_register *r2)
 {
@@ -438,7 +473,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
     const struct pci_dev *pdev;
     const struct vpci_register *r;
     unsigned int data_offset = 0;
-    uint32_t data = ~(uint32_t)0;
+    uint32_t data = 0xffffffffU >> (32 - 8 * size);
 
     if ( !size )
     {
@@ -453,9 +488,21 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
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
+    {
+        pdev = translate_virtual_device(d, &sbdf);
+        if ( !pdev )
+        {
+            read_unlock(&d->pci_lock);
+            return data;
+        }
+    }
     if ( !pdev || !pdev->vpci )
     {
         read_unlock(&d->pci_lock);
@@ -571,9 +618,21 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
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
+    {
+        pdev = translate_virtual_device(d, &sbdf);
+        if ( !pdev )
+        {
+            write_unlock(&d->pci_lock);
+            return;
+        }
+    }
     if ( !pdev || !pdev->vpci )
     {
         /* Ignore writes to read-only devices, which have no ->vpci. */
-- 
2.49.0



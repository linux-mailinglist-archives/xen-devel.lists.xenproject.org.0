Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6892A5D093
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 21:14:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909056.1316144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5zB-0007h1-Jb; Tue, 11 Mar 2025 20:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909056.1316144; Tue, 11 Mar 2025 20:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5zB-0007fs-Eg; Tue, 11 Mar 2025 20:13:57 +0000
Received: by outflank-mailman (input) for mailman id 909056;
 Tue, 11 Mar 2025 20:13:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8jJT=V6=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ts5z9-0007Om-SO
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 20:13:55 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20623.outbound.protection.outlook.com
 [2a01:111:f403:2418::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59e921c1-feb5-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 21:13:53 +0100 (CET)
Received: from BYAPR11CA0075.namprd11.prod.outlook.com (2603:10b6:a03:f4::16)
 by PH0PR12MB8174.namprd12.prod.outlook.com (2603:10b6:510:298::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 20:13:44 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:f4:cafe::b1) by BYAPR11CA0075.outlook.office365.com
 (2603:10b6:a03:f4::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.23 via Frontend Transport; Tue,
 11 Mar 2025 20:13:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 11 Mar 2025 20:13:43 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Mar
 2025 15:13:42 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Mar
 2025 15:13:42 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 11 Mar 2025 15:13:35 -0500
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
X-Inumbo-ID: 59e921c1-feb5-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ShxBRuEYZ5sGkFwpv57hk2xgxt8UuXYWGAWgxNLxCO5tdBHrfYFtufUeE5VI4z4jqlmxZBiQkNAzbD+II8irl5X56iUK6aXk2Cp+J+uZdIss4n+u3Bbh+zM3nS/DVKGbO1zJ0K0mmF59LcTEX2qJQ+BvGQcEI1ag1iZilfNFsTU7FTjv1mjTzOK1Czyc/HEypaAVonjgti+qMF2wLa9mXv8YYS87Km/q7Wg2XCfmchq+qe8cm36CCq5T+ixE5irjSazUljG35D7Xx70efhiFkxcs1yncuSVZV8Or/3bYc0c8a3PHB/4lNEXqMT08JK45MmJIVTR9E0nLz0nBPHmbrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJlcttoUkBrewjjbqp29o2Dgy13fkIGTdbkbNC7C96w=;
 b=LLeXQpKiykmUAx8LycKaYCB77Ar5pLCl9yLEt3PNiAeHuJktXIsHlBz642hkzgjea5xWjuCygb8kyPvXzGz640TbgRgb9sy9hcLyt9gKPT2Ptbz02e5pz/BKCzx2gBuB+YdXj3SrAsFaNNV2rlT4suIp9XHnJNpfIS8gxWM2OoE/sqKptK1VMaIKIVm75OWZUHfGODx96ESj9YO0YjaYFe4ohJYuuWS4xt8GMYiiHqkLl9GVBqDnXgBsFshqOTgUgiaU6GE3f0L1iYntMeDB6lIPHToFKZtCbJBl+oKci0kfhBg/DElEs46Hj6WhVTxDz5/3h6iLs2XPs18Vvo8qqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJlcttoUkBrewjjbqp29o2Dgy13fkIGTdbkbNC7C96w=;
 b=2OucM8A1XcG/6xkXXcCtS+89DJHYkFqE1y6y96BgnqFSlpVHNfZBgJTlEdpGSlmx/2utTCZJnE5eHjGAtBTndBVTQWFYgUaeWBeW1XtVg5FR4QkZO1zj8i0x9ypRx/BpRVtxp+FYAyx46BydFZGyPhPqp2lKVBt9oRDOY5mWd8Q=
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
	<roger.pau@citrix.com>, Jiqian Chen <Jiqian.Chen@amd.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: [PATCH v17 1/2] xen/arm: translate virtual PCI bus topology for guests
Date: Tue, 11 Mar 2025 16:13:27 -0400
Message-ID: <20250311201330.365499-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311201330.365499-1-stewart.hildebrand@amd.com>
References: <20250311201330.365499-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|PH0PR12MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: b306b098-591b-4ba2-802a-08dd60d93907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TaZwjyYoPi2KN+v80VrunyS0e3ZMFKfJP5Mfdq5A+jhy2NxaXByJYi8VQOfD?=
 =?us-ascii?Q?1FamLBxpiH05CdOpvzbnfYe0gI5A2j3SSGDttMY3HcvN6d8FgDmp197ecTe/?=
 =?us-ascii?Q?745TdbUJnxrSyxLtt8WJ7uxJAGcAklFVC/EQx2R0P734RH//4/o7ZJZ+59+r?=
 =?us-ascii?Q?yQTqI8HaKIZ5mdwTSs+r8p9Wrce3iNy0vL8kgwZ6jAJg7YGueGQvBdw9jLPZ?=
 =?us-ascii?Q?fOlP4uDWb3qrM/UJreJQw50ZXQI/g/wBiwQii1VeFwydyl9Szfb1bW11SkRX?=
 =?us-ascii?Q?YWbUgJ5hymOoaZh4t9qB4pSHr3CzXqryjI/YmRTa3AEz7xLz1W10PvsjtDYJ?=
 =?us-ascii?Q?MUvTdQDqdylcSSWo9spwoHdWE2vuC50lbhnOK0Rhdy9zsj3hU2/2wfJZgCKi?=
 =?us-ascii?Q?sDI/OdoSzvmSuia5ecDE+W1lKOaKoiscnJZdAbcZlxQp5YVOhBldnEvj1kpM?=
 =?us-ascii?Q?nGc8HyMTT3SVhh5lgFoq6RO5BPQG+3l2dXzMlHQVPJg+TxtsIFhbRQV/lQ1b?=
 =?us-ascii?Q?PtvnGz9iTxesF1RZ7mDs7JD7iIGOU1SdEAuEPKeGYjRxwwoSQ/dgxpHflZVs?=
 =?us-ascii?Q?a/Fy8c68X6smk5qcm3pJUJp3D75EYYNMDDHUyAtK/I5/Pm/h8c13hNeEWu6b?=
 =?us-ascii?Q?5WvF7b2QJZtS8ObeYdjsobL4LKE5m3CGL2dvt4tHWGejp/vX7jFFYneSZq23?=
 =?us-ascii?Q?yNINOQ3lv1babmop+tvqjgxKKPIcSjofZgnDmk5yv9MI1VDEJTF3GIuhCtYx?=
 =?us-ascii?Q?6Xmkp8C9D82nj7cg/c2LBZS+YeeIh6luHzKAJeBjoUO/knjoeOfkAdDL8vpy?=
 =?us-ascii?Q?qGqZjwZXyzkEDX/rIcO566d0PGLWgTFf1hB5yfX3c4AH5yXMidlQZ339oDRp?=
 =?us-ascii?Q?SmD+aV2xc21SjOrUNukRp1Bdl0qsOdycsxvUyxjV5XCN0sg9EkEYW/9fEwwg?=
 =?us-ascii?Q?3LQ2elsXiux1cEg10Jo9GjgYmLY4KcAxI7Nq6RwP4b9V3c25f0oPDsrPnpNy?=
 =?us-ascii?Q?KJzQKBIZHOV9LXaDE7KXz3sjcaBPOV6RgsV5twWBiwXDgRCODGrwA/k9B9B9?=
 =?us-ascii?Q?v7YycLd9xSFbNOLUuTrVRokGW/zxRL18gezq69Mb2tHIpYgfb4sd7lZc7vqj?=
 =?us-ascii?Q?2WjlwMp+lHJvyswScN9LUsJT9byOSmgrNNU7sptU4TAItWioJLFWnzZwkQCI?=
 =?us-ascii?Q?fEY//t4LukLpbfJXHewacTzkT0S8ng+a7CSWfBIA4o1vah08Gg1XcgDRru9y?=
 =?us-ascii?Q?2OpFOXhFFHPS/SaaCOYol63BtKiAcevHDKbkxYoy95au1IBdHLXKmEh7Z2/B?=
 =?us-ascii?Q?y4Sw0ituU/zRqqfNslbBkcs4qBu7F9y9qWEu2e3KschF4RY6am4uYGnKuM+T?=
 =?us-ascii?Q?1Yjr5d8BSDyePozcp/igsHo3qlU/Fcvp/TkOvGhCkg3NVq5tT/ihOfCk4Ubk?=
 =?us-ascii?Q?sZLSaim1mT58iDrIUCA6Zv/7SA6LbPDECpSIwy4vF66UIH2uwoBJqyeeNOIN?=
 =?us-ascii?Q?nxuibGNkPCRhg7A=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 20:13:43.5878
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b306b098-591b-4ba2-802a-08dd60d93907
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8174

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

There are three originators for the PCI configuration space access:
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
 xen/arch/arm/vpci.c     | 43 +++++++++++++++++++++++++++++++----------
 xen/drivers/vpci/vpci.c | 26 +++++++++++++++++++++++++
 xen/include/xen/vpci.h  | 12 ++++++++++++
 3 files changed, 71 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index b63a356bb4a8..5719821cad67 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -7,33 +7,51 @@
 
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
+        translated = vpci_translate_virtual_device(d, sbdf);
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
@@ -50,7 +68,12 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
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
index 1e6aa5d799b9..49c9444195d7 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -81,6 +81,32 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
     return 0;
 }
 
+/*
+ * Find the physical device which is mapped to the virtual device
+ * and translate virtual SBDF to the physical one.
+ */
+bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf)
+{
+    const struct pci_dev *pdev;
+
+    ASSERT(!is_hardware_domain(d));
+    read_lock(&d->pci_lock);
+
+    for_each_pdev ( d, pdev )
+    {
+        if ( pdev->vpci && (pdev->vpci->guest_sbdf.sbdf == sbdf->sbdf) )
+        {
+            /* Replace guest SBDF with the physical one. */
+            *sbdf = pdev->sbdf;
+            read_unlock(&d->pci_lock);
+            return true;
+        }
+    }
+
+    read_unlock(&d->pci_lock);
+    return false;
+}
+
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
 
 void vpci_deassign_device(struct pci_dev *pdev)
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 807401b2eaa2..e355329913ef 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -311,6 +311,18 @@ static inline int __must_check vpci_reset_device(struct pci_dev *pdev)
     return vpci_assign_device(pdev);
 }
 
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf);
+#else
+static inline bool vpci_translate_virtual_device(struct domain *d,
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
2.48.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2A899A7A4
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 17:28:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817225.1231320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szHYb-0007n4-Pi; Fri, 11 Oct 2024 15:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817225.1231320; Fri, 11 Oct 2024 15:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szHYb-0007k3-M6; Fri, 11 Oct 2024 15:27:57 +0000
Received: by outflank-mailman (input) for mailman id 817225;
 Fri, 11 Oct 2024 15:27:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I9YX=RH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1szHYa-0007SS-Eg
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 15:27:56 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2415::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 626127fd-87e5-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 17:27:55 +0200 (CEST)
Received: from BN7PR02CA0002.namprd02.prod.outlook.com (2603:10b6:408:20::15)
 by PH0PR12MB8125.namprd12.prod.outlook.com (2603:10b6:510:293::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 15:27:50 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:20:cafe::e6) by BN7PR02CA0002.outlook.office365.com
 (2603:10b6:408:20::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20 via Frontend
 Transport; Fri, 11 Oct 2024 15:27:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 15:27:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 10:27:48 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 11 Oct 2024 10:27:47 -0500
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
X-Inumbo-ID: 626127fd-87e5-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBGo0ONO5nhwEO3UszMfRS/bOX2NDDgS7dfJWbD3JORg6nY6wQ4V9vZUShfYU2NAT0HXdFI+TKn86q0qicctR2Bi7056i+fVb14REjkxJ9HHlO3RACLGYb0MWGxQQi4AcPaQs+gMJYi2cGPgnbKmjrMMpNHas1hL0JcLMWe9luamStVR50HaWKl4o8EQhAkz/uSU9saiaWC9hl5P/J+gUOaPLecgCu1S05smi4HIPc1nkRHjMvnyyaHNq92EtPgqch1xLckES6dplXzinATOzs/iKTm4L9jGtJpBcFYBgsNIAA+umBsWknr72WtjjL/E9dDMKXlv0IfeBrcBgOZ0ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hdJcd67VFCUntI2TnhTshHdpS7eovY/+F2haWAsl40=;
 b=hpRh12Ja7KktDPBVh2Izavb3yg5R4N07JJNkry/C+tjs0Q5hGIbg6XMaAPw8XgzfL9aU0ToM7vRCbmMAKBVeiEPAVBV3draEpyrUm447/2rLfc2SAGdpr/owDlqnCUVftFPYUnk4Hv15EaTdA6QitTTnRko9GsN+sHsAymvpBragCSJse2cjv4AAJb3fYgptWKhqylSU1corIpOq/NUlbIfVELRFv68nljIeWSNuzElVHIq7Fx9fHe6oM8E7oHvGgKlHAepl3I88TSSxlWMyI0Wx5JnaSnL1ftUJzZoo/igAsOqbGfFypUwsfM9dwJE7J7aGHNePA9Xbhn6NMqHwrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hdJcd67VFCUntI2TnhTshHdpS7eovY/+F2haWAsl40=;
 b=R7pJYlvgCd4wxirE+pp4Ad2pWj/Z5W0fcaT42X9cbXFUGVSvbWe/xcHJwct1bu5QCelRAVOQHUd52+mJwIUVRx1ilCAcIrH0tVpVsvs3Cc/EwWqiXa6qSyHFSFoiulhRgc6YD3J0kV6euJjIGgDmdJCOJBgPfgCZezMtuZaSNwM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 2/3] xen/pci: introduce PF<->VF links
Date: Fri, 11 Oct 2024 11:27:07 -0400
Message-ID: <20241011152727.366770-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241011152727.366770-1-stewart.hildebrand@amd.com>
References: <20241011152727.366770-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|PH0PR12MB8125:EE_
X-MS-Office365-Filtering-Correlation-Id: f847a9b3-49d2-4bd9-f711-08dcea094475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HjVEaIXfOLZtSrKpIg90qlVpiUInB6M0q0RQ9XN+vaWyi8tHamvSB60/X9fj?=
 =?us-ascii?Q?28674g9ccg2VLI8VZJ1Q+tdi9zeZGWGcO31Q5k25z66FCSRJtOfjwLj1PgND?=
 =?us-ascii?Q?DbqbnLZ4f5SmGNzQRrqaN1jrTIDTaDo8JcoWow5E/h46N30KFp9LLVwUx41o?=
 =?us-ascii?Q?9Txfd2cee2oR0d61Tu18FBPeIrv4pJSUSwUW/FIO5ktiSmR2J1YD6cQGqOKX?=
 =?us-ascii?Q?X++JXspoU/h7Wscw/BLPaYHGsL+LJSgSzHeNh3KLrujOftQhQhB74dEw4MqN?=
 =?us-ascii?Q?WMSH3WynGHzlx3MBsU7k8dEuDfVHah3zF/t1M/NQ7Phk43IXDIuGNuc/zjud?=
 =?us-ascii?Q?njYglJU2PAdY++qpv/IMtI9EopNIkJQU/78AwGcdqdOEueQPvLKY0YnLftAf?=
 =?us-ascii?Q?22vcE2cfoFiCZMHFK7aZlmiGEhfTmIrYdlgg2cnBWG38YDHeO3bjRF20d5Uz?=
 =?us-ascii?Q?aURM58Y3dhqt/N4iVc/vozqwJ+NdEMwylzuR42PKbs2znLxXIjTRCdvuXyDg?=
 =?us-ascii?Q?2En8hWSFvmSORZcl1QBM+StC4DKi3Y8p9tVCkbnvJQeoOz2HzYOKxU6XETUi?=
 =?us-ascii?Q?kObw52ZtFR52KCWEsOYvkyQaI04FPEhbRYz6q8o0dNtUXWSLhrZq4z7k7PT2?=
 =?us-ascii?Q?q6/BG2pt92O/hw5ECzZoHRCOiDSO7UJoxeriKh5L5z37zeNlPOYpZWU6sQ0o?=
 =?us-ascii?Q?ysIlCbPSLhliU8DSOsTkUu1kFt1kyfILsQlvjqr4yAcPVeckU35rOGh5ywho?=
 =?us-ascii?Q?AYnauPhmoyMEPShQLcu9jH2FFq3HPS0cMQp4HG7syjgiCrcXIfr5QM8XciLd?=
 =?us-ascii?Q?NL2dZyClKs4nD6Qu3n+YAFKNVkHc8aAkpNaqJt8FNoFdoGqQdXm2I/f02aqi?=
 =?us-ascii?Q?N730DkfnAFBHfPVLSOayIrEu24nhYi3sbfVe5zS0iUgKulOC24KnbuUMOb0k?=
 =?us-ascii?Q?zxaicWLpP9PF5AgsmZcfOTzjPKaOmyDBoGMu1wRCsY69pE9Asr0fDXLj8Abz?=
 =?us-ascii?Q?ZTqE17EvTc+bPjH28/AHebGsIz0OmR0DwBixItgd4pFXvtqjEi1XxDR+3I4h?=
 =?us-ascii?Q?9tFE1ESUFQFT2G88NvCldIVRZMUYHrLIY223kRixzHoYv6J6cXe7lOSrcpPh?=
 =?us-ascii?Q?UMVcY4e8wUR+iAc/IUb077J7etbJ0DOYfVwTZOh4ih1IPKg8OQweshT/AHxn?=
 =?us-ascii?Q?2qTLYKLEaK/kW0OfKAIVkCwkwV9VIX6aBewwdCrnTfiYeh2b6iKmsr1pfE/L?=
 =?us-ascii?Q?o9c4dnvCnyNEqDen6LTHNRzPhkI/srXPAXUemhkZmSLxNadt03j8PtnGXyjI?=
 =?us-ascii?Q?xAMyy4as9lfpgm0yIpuouxvbZNIzRQxW/A3A0qreEdIeVVMHRd40SVRObfOL?=
 =?us-ascii?Q?4RgEghk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 15:27:50.3329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f847a9b3-49d2-4bd9-f711-08dcea094475
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8125

Add links between a VF's struct pci_dev and its associated PF struct
pci_dev. Move the calls to pci_get_pdev()/pci_add_device() down to avoid
dropping and re-acquiring the pcidevs_lock().

During PF removal, unlink VF from PF and mark the VF broken. As before,
VFs may exist without a corresponding PF, although now only with
pdev->broken = true. If the PF is removed and re-added, dom0 is expected
to also remove and re-add the VFs.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Candidate for backport to 4.19 (the next patch depends on this one)

v4->v5:
* new patch, split from ("x86/msi: fix locking for SR-IOV devices")
* move INIT_LIST_HEAD(&pdev->vf_list); earlier
* collapse struct list_head instances
* retain error code from pci_add_device()
* unlink (and mark broken) VFs instead of removing them
* const-ify VF->PF link
---
 xen/drivers/passthrough/pci.c | 70 ++++++++++++++++++++++++++++-------
 xen/include/xen/pci.h         | 10 +++++
 2 files changed, 66 insertions(+), 14 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 74d3895e1ef6..95a8ed850efd 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -333,6 +333,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
     *((u8*) &pdev->devfn) = devfn;
     pdev->domain = NULL;
 
+    INIT_LIST_HEAD(&pdev->vf_list);
+
     arch_pci_init_pdev(pdev);
 
     rc = pdev_msi_init(pdev);
@@ -449,6 +451,10 @@ static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
 
     list_del(&pdev->alldevs_list);
     pdev_msi_deinit(pdev);
+
+    if ( pdev->info.is_virtfn && pdev->virtfn.pf_pdev )
+        list_del(&pdev->vf_list);
+
     xfree(pdev);
 }
 
@@ -656,24 +662,11 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
     unsigned int slot = PCI_SLOT(devfn), func = PCI_FUNC(devfn);
     const char *type;
     int ret;
-    bool pf_is_extfn = false;
 
     if ( !info )
         type = "device";
     else if ( info->is_virtfn )
-    {
-        pcidevs_lock();
-        pdev = pci_get_pdev(NULL,
-                            PCI_SBDF(seg, info->physfn.bus,
-                                     info->physfn.devfn));
-        if ( pdev )
-            pf_is_extfn = pdev->info.is_extfn;
-        pcidevs_unlock();
-        if ( !pdev )
-            pci_add_device(seg, info->physfn.bus, info->physfn.devfn,
-                           NULL, node);
         type = "virtual function";
-    }
     else if ( info->is_extfn )
         type = "extended function";
     else
@@ -703,7 +696,44 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
          * extended function.
          */
         if ( pdev->info.is_virtfn )
-            pdev->info.is_extfn = pf_is_extfn;
+        {
+            struct pci_dev *pf_pdev;
+
+            pf_pdev = pci_get_pdev(NULL,
+                                   PCI_SBDF(seg, info->physfn.bus,
+                                            info->physfn.devfn));
+
+            if ( !pf_pdev )
+            {
+                ret = pci_add_device(seg, info->physfn.bus, info->physfn.devfn,
+                                     NULL, node);
+                if ( ret )
+                {
+                    printk(XENLOG_WARNING "Failed to add SR-IOV device PF %pp for VF %pp\n",
+                           &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn),
+                           &pdev->sbdf);
+                    free_pdev(pseg, pdev);
+                    goto out;
+                }
+                pf_pdev = pci_get_pdev(NULL,
+                                       PCI_SBDF(seg, info->physfn.bus,
+                                                info->physfn.devfn));
+                if ( !pf_pdev )
+                {
+                    ASSERT_UNREACHABLE();
+                    printk(XENLOG_ERR "Failed to find SR-IOV device PF %pp for VF %pp\n",
+                           &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn),
+                           &pdev->sbdf);
+                    free_pdev(pseg, pdev);
+                    ret = -EILSEQ;
+                    goto out;
+                }
+            }
+
+            pdev->info.is_extfn = pf_pdev->info.is_extfn;
+            pdev->virtfn.pf_pdev = pf_pdev;
+            list_add(&pdev->vf_list, &pf_pdev->vf_list);
+        }
     }
 
     if ( !pdev->info.is_virtfn && !pdev->vf_rlen[0] )
@@ -821,6 +851,18 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
         if ( pdev->bus == bus && pdev->devfn == devfn )
         {
+            if ( !pdev->info.is_virtfn )
+            {
+                struct pci_dev *vf_pdev, *tmp;
+
+                list_for_each_entry_safe(vf_pdev, tmp, &pdev->vf_list, vf_list)
+                {
+                    list_del(&vf_pdev->vf_list);
+                    vf_pdev->virtfn.pf_pdev = NULL;
+                    vf_pdev->broken = true;
+                }
+            }
+
             if ( pdev->domain )
             {
                 write_lock(&pdev->domain->pci_lock);
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 63e49f0117e9..f9435b7f4eb9 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -150,7 +150,17 @@ struct pci_dev {
         unsigned int count;
 #define PT_FAULT_THRESHOLD 10
     } fault;
+
+    /*
+     * List head if info.is_virtfn == false
+     * List entry if info.is_virtfn == true
+     */
+    struct list_head vf_list;
     u64 vf_rlen[6];
+    struct {
+        /* Only populated for VFs (info.is_virtfn == true) */
+        const struct pci_dev *pf_pdev;        /* Link from VF to PF */
+    } virtfn;
 
     /* Data for vPCI. */
     struct vpci *vpci;
-- 
2.47.0



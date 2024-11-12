Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EAC9C62F0
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 21:54:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834911.1250718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAxtO-0006od-1o; Tue, 12 Nov 2024 20:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834911.1250718; Tue, 12 Nov 2024 20:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAxtN-0006mZ-VC; Tue, 12 Nov 2024 20:53:41 +0000
Received: by outflank-mailman (input) for mailman id 834911;
 Tue, 12 Nov 2024 20:53:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6R0y=SH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tAxtM-0006YG-42
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 20:53:40 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20625.outbound.protection.outlook.com
 [2a01:111:f403:200a::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f938939-a138-11ef-a0c7-8be0dac302b0;
 Tue, 12 Nov 2024 21:53:37 +0100 (CET)
Received: from BLAPR05CA0001.namprd05.prod.outlook.com (2603:10b6:208:36e::6)
 by SJ2PR12MB8783.namprd12.prod.outlook.com (2603:10b6:a03:4d0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 20:53:32 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:208:36e:cafe::77) by BLAPR05CA0001.outlook.office365.com
 (2603:10b6:208:36e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.15 via Frontend
 Transport; Tue, 12 Nov 2024 20:53:31 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 12 Nov 2024 20:53:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Nov
 2024 14:53:30 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 12 Nov 2024 14:53:29 -0600
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
X-Inumbo-ID: 2f938939-a138-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjAwYTo6NjI1IiwiaGVsbyI6Ik5BTTEyLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjJmOTM4OTM5LWExMzgtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDQ0ODE3LjU0NDkzMywic2VuZGVyIjoic3Rld2FydC5oaWxkZWJyYW5kQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iS2jnoy4aJW7ve7HO5rr2EixV40FBpLlH1/uuGV3BgnvP74lHO100pKqCQSjaUukLax2lTF1RT1M+DbPsmoLh7m6aJO4x9GKmJVWqHkyVVdBt/Vyq69s94DCd2sRdULvNpOOX900UriWbGesT7VCcBoCm8dQ+TcODmzaweoM41HuxtxaRDRxaoQ9UagLLXfP28xJnIYbu9iPz25Ll7/4Yc0EYTctD6sIpLu2tNG8ssuyhYs2H5ScxkyuQ9cvCe7I9Or6yekEoDV4WO/pPCl1ZzCPrj0Aj2nL3JDPezinTHpoeS0ptO17I/cGPgWh8X3/g/IjcMsTxNwxlg65tsychg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ky8HxzXjH0qC2Vc4vqFd2aklwcMHHpdbS4ww5q29aEk=;
 b=Nh1KXwM8WXWSyTgNML782YduUNDSLrngq2NnZy+YdEJAXf9x6xXMxtD/P7SJ3Xe0lHZTE7xsi6YguyPf8g8nhkHCIM0WotH2D3mRQrqFwMHMoU1cI0JiE4AyNAaBCN80IM7Bl/YfSLsHWErDjXa0xs5Xu0Fvc9S+qNlE/hLXp9d7ZQ/dbQJiHbt20kiuIsUsx3R+e91W3U+ARWduLJY22ZFvT5jvXv7GiFMjLC6ulPkdBHKKFs40499DhQqv6Xu1bYyjtKTZI+oHJJyt3KhuLwFO4cz43XYdenYdK9m+ToM/4tE+VTTst7eV2PBjePGogYaz8uskrL+5IrDFoKbXBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ky8HxzXjH0qC2Vc4vqFd2aklwcMHHpdbS4ww5q29aEk=;
 b=QOV+7rQ5CPwiln+/q2LJzxoFX9bCo6vSq72G64A43iADQXuHM/FGKDWzxSgfP2QNKOzhCVNC1VNx2AAxixtWpOSUzgnFaqI/uuyKahnDJRlnFXmL0zdaoeGRWuKQbnjEqLBYL0TPLmYuF2lR1uchyhL9i13l0qwEVOeWROj6RSE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 1/2] xen/pci: introduce PF<->VF links
Date: Tue, 12 Nov 2024 15:53:19 -0500
Message-ID: <20241112205321.186622-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241112205321.186622-1-stewart.hildebrand@amd.com>
References: <20241112205321.186622-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|SJ2PR12MB8783:EE_
X-MS-Office365-Filtering-Correlation-Id: 40ff51b7-ef80-4318-5713-08dd035c1118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?By4rK9PtHmnwASVBJRBz5fplmo85mXM61Ss8N9qZGbRvGlAtqi0o1hg5e4ix?=
 =?us-ascii?Q?DlWQXzzpReO4qeMmof33TNW/i+cMygboxO3YDeYNet5l4jA1/3V8I5YzbPO2?=
 =?us-ascii?Q?xxp/iRuNC9ggpSpE662GT+9W5QBUPChJoafTy35PZo1ARq6DuBMmcaLOGxyr?=
 =?us-ascii?Q?zhfm7Mh3cJSMIkYjik5znSMzWn0f6G/CwmCwyE1W/4J4jI7pF+XDbhFWKCNw?=
 =?us-ascii?Q?5tdg0g7L4Q5c/5z9Pl9yUAwPzkYJ33kxDZyVXcB8U2vT7GTD2y52sf5TL90K?=
 =?us-ascii?Q?iBqEJBqzZHZtFqjeBsCm0earU48jl2wwqcN5y6i7jdJ3ld2V4py74jbSs0Xf?=
 =?us-ascii?Q?AybdydyfdxZJyZ4ziWStSIwMOUTRHil4NWsPt1xMJ/c013j9yyHJ68eNSorH?=
 =?us-ascii?Q?HToKwHLSD8O+WcU09X+0/1KdpUHtyxga4QCzfc6M4rNuQU+ZUGhrXQ4SDDCE?=
 =?us-ascii?Q?xByhhODwlgjr+OXleSGZMypyLJ7lLXzK+VP6ZmB+kSIcGkzzKV+PwG5wTgS+?=
 =?us-ascii?Q?KEsFlP+/Es8KNT+SBEqS5uAzwEfn9E4kIP2nR0yU1yvCBMBoBDHO23qFv9wm?=
 =?us-ascii?Q?2E4q1mCGSVa+Nrjdt/cDzhTGjFHgILXk5ST15LAxG0Hqc21alLqpQOQQq5nH?=
 =?us-ascii?Q?1RSbiEtCtaWi51t/ADg7y91bI9QMAluoU2hL0S46MdiwMRU8+TfYYEHrWkWf?=
 =?us-ascii?Q?EP96w3WJH4+yO9Rro7iWtVe/IP80nSrI2tiQ75d/n9grjeIM+KBCuySwjz/b?=
 =?us-ascii?Q?DDf0eUSIQ6bI1XsDREaa9v3On/t77ZBga6B0ztFZGsVNzAybJdX4zrcxcx/K?=
 =?us-ascii?Q?lbwHoANQqWVLmUtnMeRTIRIpRe983p2kY/lrLpZB4cBblLX9+IXUEJMr2cVN?=
 =?us-ascii?Q?+1dWHc44gNeXOIVfWRK8tr7KHjq4QglzxMzUUTforbYaLVybS8nWtbYVzoQj?=
 =?us-ascii?Q?L2czr/Hbx61NdFobrAYmKk0jEjE0MFyfYKguO7u+zXKM/7RYfIWGYiqUyOXh?=
 =?us-ascii?Q?lcCAav7ISaw7TDctY7PfdAsW/8z4yYj2XsDlVf3ByVSm2JKAe70fqipX/fz8?=
 =?us-ascii?Q?eMLKYvR1Dp2duiCa4kAYnSWnaDuMK0U3ArD3jE71hlMF8gG/gz4eOH9iLK+T?=
 =?us-ascii?Q?GcQ00Eb+YkPoPKijTQrHKRg1fYDYgJ8b6uJHQ4Ss5+X54CGEu97wOpBOKm6Z?=
 =?us-ascii?Q?PIBERTct+gs7KmkAQXku87mpZMTXYM12dNaqq19uKvFA1xSk9kZgJfr43+7L?=
 =?us-ascii?Q?R+v1g4xDz7A4HmDuuRPWNf+QeWERo5eUkrPcup+Eq4wkXiDT1SHCsuC6pr69?=
 =?us-ascii?Q?g04H1T0HnD6VPE2XoSl1vgN2NvWlO0szSzv/6UGfFOHRBcG8GPhWT9S/jfI3?=
 =?us-ascii?Q?qF4ZKFcgvWVrEsawsn9K8XkAYKdLyyJs44u0o9lVfhrV5fwh8g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 20:53:31.4379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ff51b7-ef80-4318-5713-08dd035c1118
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8783

Add links between a VF's struct pci_dev and its associated PF struct
pci_dev.

The hardware domain is expected to add a PF first before adding
associated VFs. Similarly, the hardware domain is expected to remove the
associated VFs before removing the PF. If adding/removing happens out of
order, print a warning and return an error. This means that VFs can only
exist with an associated PF.

Additionally, if the hardware domain attempts to remove a PF with VFs
still present, mark the PF and VFs broken, because Linux Dom0 has been
observed to not respect the error returned.

Move the call to pci_get_pdev() down to avoid dropping and re-acquiring
the pcidevs_lock(). Drop the call to pci_add_device() as it is invalid
to add a VF without an existing PF.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Candidate for backport to 4.19 (the next patch depends on this one)

v6->v7:
* cope with multiple invocations of pci_add_device for VFs
* get rid of enclosing struct for single member
* during PF removal attempt with VFs still present:
    * keep PF
    * mark broken
    * don't unlink
    * return error
* during VF add:
    * initialize pf_pdev in declaration
    * remove logic catering to adding VFs without PF

v5->v6:
* move printk() before ASSERT_UNREACHABLE()
* warn about PF removal with VFs still present
* clarify commit message

v4->v5:
* new patch, split from ("x86/msi: fix locking for SR-IOV devices")
* move INIT_LIST_HEAD(&pdev->vf_list); earlier
* collapse struct list_head instances
* retain error code from pci_add_device()
* unlink (and mark broken) VFs instead of removing them
* const-ify VF->PF link
---
 xen/drivers/passthrough/pci.c | 74 ++++++++++++++++++++++++++++-------
 xen/include/xen/pci.h         |  8 ++++
 2 files changed, 68 insertions(+), 14 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 74d3895e1ef6..d4167cea09c0 100644
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
+    if ( pdev->info.is_virtfn )
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
@@ -703,7 +696,38 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
          * extended function.
          */
         if ( pdev->info.is_virtfn )
-            pdev->info.is_extfn = pf_is_extfn;
+        {
+            struct pci_dev *pf_pdev = pci_get_pdev(NULL,
+                                                   PCI_SBDF(seg,
+                                                           info->physfn.bus,
+                                                           info->physfn.devfn));
+            struct pci_dev *vf_pdev;
+            bool already_added = false;
+
+            if ( !pf_pdev )
+            {
+                printk(XENLOG_WARNING
+                       "Attempted to add SR-IOV device VF %pp without PF %pp\n",
+                       &pdev->sbdf,
+                       &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn));
+                free_pdev(pseg, pdev);
+                ret = -ENODEV;
+                goto out;
+            }
+
+            pdev->info.is_extfn = pf_pdev->info.is_extfn;
+            pdev->pf_pdev = pf_pdev;
+            list_for_each_entry(vf_pdev, &pf_pdev->vf_list, vf_list)
+            {
+                if ( vf_pdev == pdev )
+                {
+                    already_added = true;
+                    break;
+                }
+            }
+            if ( !already_added )
+                list_add(&pdev->vf_list, &pf_pdev->vf_list);
+        }
     }
 
     if ( !pdev->info.is_virtfn && !pdev->vf_rlen[0] )
@@ -821,6 +845,28 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
         if ( pdev->bus == bus && pdev->devfn == devfn )
         {
+            if ( !pdev->info.is_virtfn && !list_empty(&pdev->vf_list) )
+            {
+                struct pci_dev *vf_pdev;
+
+                /*
+                 * Linux Dom0 has been observed to not respect an error code
+                 * returned from PHYSDEVOP_pci_device_remove. Mark VFs and PF
+                 * broken.
+                 */
+                list_for_each_entry(vf_pdev, &pdev->vf_list, vf_list)
+                    vf_pdev->broken = true;
+
+                pdev->broken = true;
+
+                printk(XENLOG_WARNING
+                       "Attempted to remove PCI SR-IOV PF %pp with VFs still present\n",
+                       &pdev->sbdf);
+
+                ret = -EBUSY;
+                break;
+            }
+
             if ( pdev->domain )
             {
                 write_lock(&pdev->domain->pci_lock);
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 1e4fe68c60fb..977c0d08f78a 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -153,7 +153,15 @@ struct pci_dev {
         unsigned int count;
 #define PT_FAULT_THRESHOLD 10
     } fault;
+
+    /*
+     * List head if PF.
+     * List entry if VF.
+     */
+    struct list_head vf_list;
     u64 vf_rlen[6];
+    /* Link from VF to PF. Only populated for VFs. */
+    const struct pci_dev *pf_pdev;
 
     /* Data for vPCI. */
     struct vpci *vpci;
-- 
2.47.0



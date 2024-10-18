Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AB79A4845
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 22:40:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822150.1236131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1tl8-0001XQ-FV; Fri, 18 Oct 2024 20:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822150.1236131; Fri, 18 Oct 2024 20:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1tl8-0001Ux-CI; Fri, 18 Oct 2024 20:39:42 +0000
Received: by outflank-mailman (input) for mailman id 822150;
 Fri, 18 Oct 2024 20:39:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiWJ=RO=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1t1tl7-0000xC-G4
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 20:39:41 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20629.outbound.protection.outlook.com
 [2a01:111:f403:240a::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 189e824f-8d91-11ef-a0be-8be0dac302b0;
 Fri, 18 Oct 2024 22:39:40 +0200 (CEST)
Received: from BY3PR05CA0023.namprd05.prod.outlook.com (2603:10b6:a03:254::28)
 by PH7PR12MB5853.namprd12.prod.outlook.com (2603:10b6:510:1d4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Fri, 18 Oct
 2024 20:39:34 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::23) by BY3PR05CA0023.outlook.office365.com
 (2603:10b6:a03:254::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.10 via Frontend
 Transport; Fri, 18 Oct 2024 20:39:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Fri, 18 Oct 2024 20:39:32 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Oct
 2024 15:39:32 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 18 Oct 2024 15:39:30 -0500
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
X-Inumbo-ID: 189e824f-8d91-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cv2J0MgqpazzhLjeyG63sHGxWuLt7ZVUSdd0KdofanA7yDEH8bw3QXS9Y7OPy6LOIf5DbpIvmxjTWP0hFx/h98k7kXEh/JPRBSwHl0Ilgh4ffpg9CCIFOk0j+7/zIbirnxjRZ4idG6Qv8usIJThdSjgqIyXP4lJgKhb5z5DseJgbjwzTI+NgkWT7dqsGA++NzvyzNrbAh6PBVcC0DU5cXZEjmmvmP3UOwxiMoftF6RD+0+xpJNRCS+6P+csUbSiFkDt7YdQfqizToKy9pWsMbxr5BF+oSjjKJDUKgTfJGtJlbnkA69AtcGveOrXnN72yOOcBQNXqiU6ku1qhWEzgBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fq6KP4wVu47kB55ME6GPz2MtcQHWslf85p2ZaJ9WoQ=;
 b=ykw8fcwvufKrJhuX22BIw/6P8KamRUbPK/Xlzsi16DpADEeyc/S9M3ct9+f34VT/jbSar4H6j+pf8z52VM/6aqBWj9x3T70cy23l5OvdBYaBSjnF/n6LHzdEjCOdiVpGzvOlWIvSEKZvBJw8+qBm6Uu2knciLgUEiTRi9rU91pFp31aAjxtVmaF3+keyxDmlO+tOCiWnzHqoMAXabiFdHSeDyTVLmqVva/AOgoFoIAfRU5yS6ttjpHCQBEfgTp0OsAKUhWju+x5ZBsi3Cbhdzqe2pGvKtaQ7LQCsT5aTlVD1xag/yHI+5IWr6W1KOqy/GssqjuCNl/HH24BqAn1Kug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fq6KP4wVu47kB55ME6GPz2MtcQHWslf85p2ZaJ9WoQ=;
 b=nO3TspkTNOZMz6/ExV5qiHKosYq9LZxlGZc9pp03SIryrAyucVvxi0bUyt/aqdq7XoLJELL1oLGxekbtDTNO8/cxps2ygs/SR5SY2nnXhdfh7iz4HrxFKIAlh8SuJk8R6uaQkHbepSYn/HBl5Z/XOGe4embPuUeKBpmUyAUlyjA=
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
Subject: [PATCH v6 2/3] xen/pci: introduce PF<->VF links
Date: Fri, 18 Oct 2024 16:39:09 -0400
Message-ID: <20241018203913.1162962-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|PH7PR12MB5853:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aa28764-1c2a-4471-cffc-08dcefb4f90b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WQGirubvFsMHFc/rghVPZsvKPdBCWJT49f86mJmn8n4o/wJIu7Xw7RffwylS?=
 =?us-ascii?Q?vLEFkqOCpzecJ0p2mhLdSy0J2NpKsvgZ50k+5PNn59TLz1Qkhq3Rph5XYVr3?=
 =?us-ascii?Q?bflyCLx/3pjVgU42Jf3FWiWOhCb2Kokbm2Kvga7WemRzHQ6Ijh6dzo3G3toE?=
 =?us-ascii?Q?mZ0FdzjF3ijxsZSLlMndIVE+NwF99enshGFmCIzwbrINizPVeOPwrWsyskdg?=
 =?us-ascii?Q?0b5/yi538y/lLhcDZ1JZe1fWtHIOa6rBIYvFX5LsctSbA7jlGUzjsUSub+ZW?=
 =?us-ascii?Q?8B8yV3+DpxamhJVHGzqsVnfddHWQEXwP31AYylde6CBfDhEqQ3tjwCrzJ0Uf?=
 =?us-ascii?Q?BtwBJ707xPTC/0M8v94Z2BApRPv+zGgtYptFlSylnDWIzvnEGVgj0bHE1lWT?=
 =?us-ascii?Q?337RPQ3MiUi5ZH0yH93PLWn9Bb1lxrpLNCCm2iNUtapOZ38sxi8riSRlQC3w?=
 =?us-ascii?Q?hLR0hAj/7yg9QMqeohxoKEGnD23CxPG4Nil/YgNnN4EHTGOvbyFLy9ppbtLm?=
 =?us-ascii?Q?XtPpFkJydTBX5SYw9vg4Er03ICZTJqK3E59RJ12Badf3phILJz5FlRxnuZO/?=
 =?us-ascii?Q?58seha9sNPL6uSSU3An9RHSicHjAdNSQvBNMCHnfI2FkmNY24fS6LMMCKvNf?=
 =?us-ascii?Q?zxLNrMCD3vjEm1SbNf741cAmeYQ9x3Xv1T/4M3H3SwVUUYQty/UjeoppjSeM?=
 =?us-ascii?Q?oNdnuz3AGCRXJNX845y1BCpd6kXyOFa992Iz6MSvHlFM1wilQz6q+FqSU70G?=
 =?us-ascii?Q?Dg3TOa7gNzU1ZSPguhSTEpBOe7BeUphj7+eD4hxkjAlqVeqjHFL9NZzj2kTC?=
 =?us-ascii?Q?2BhHeCyUnBLfp5hacWKNqzHJHoCIB77beFPtNcSe5l8dOTe+Ovy7Fr2GPAra?=
 =?us-ascii?Q?OWQUslkhW2pOKZe0uXbweogEWI9x8DTj31qhLnC7IOkRn746zyPGfF4meDfz?=
 =?us-ascii?Q?OACEJPzZGlUXycid+0Bts0y4uA3eH4rmh9ACq/kTCqVmRmHDHthEY2wAl9nJ?=
 =?us-ascii?Q?liecRitO5Ee4Dm4YUbKYv3/mDri/OxiudcEn1U6wZvvVRrTv7aEU1DsvvJ4O?=
 =?us-ascii?Q?jASTYHCFDZ1yNlCOFASRkCrJ4o/GfBnp0h2rzWj2L8pfd52zRUlP2TseREbK?=
 =?us-ascii?Q?P7WGNvXuqhuPCxrHJWffukHq6W2yFmTN/uGofdJ5NHWz5KaXZ7mlh1HudT+j?=
 =?us-ascii?Q?80Mpu/QzGQ47oyY5kV1/RGzcv1F5SwUKzdyaalcr9KxjEeFrGHXxy6ZuzREC?=
 =?us-ascii?Q?SZnTt98XHFUtV0avjoDIq8dQ2wwWr8X+Mn1XbVX0mC5dbdGhdOct1eXiSWgL?=
 =?us-ascii?Q?bqCcYqjbMj5y1zBnyHK0UOQAZ793ZrDnCF2ituJ0U5861U7Vvk0TGQmIarxI?=
 =?us-ascii?Q?bmMEOeBLtLGn/plfVtzuT8XzJUHUp4hQcvs0J3KCmu6JABxNJw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 20:39:32.9657
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa28764-1c2a-4471-cffc-08dcefb4f90b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5853

Add links between a VF's struct pci_dev and its associated PF struct
pci_dev. Move the calls to pci_get_pdev()/pci_add_device() down to avoid
dropping and re-acquiring the pcidevs_lock().

During PF removal, unlink VF from PF and mark the VF broken. As before,
VFs may exist without a corresponding PF, although now only with
pdev->broken = true.

The hardware domain is expected to remove the associated VFs before
removing the PF. Print a warning in case a PF is removed with associated
VFs still present.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Candidate for backport to 4.19 (the next patch depends on this one)

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
 xen/drivers/passthrough/pci.c | 76 ++++++++++++++++++++++++++++-------
 xen/include/xen/pci.h         | 10 +++++
 2 files changed, 72 insertions(+), 14 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 74d3895e1ef6..fe31255b1207 100644
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
+                    printk(XENLOG_ERR "Failed to find SR-IOV device PF %pp for VF %pp\n",
+                           &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn),
+                           &pdev->sbdf);
+                    ASSERT_UNREACHABLE();
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
@@ -821,6 +851,24 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
         if ( pdev->bus == bus && pdev->devfn == devfn )
         {
+            if ( !pdev->info.is_virtfn )
+            {
+                struct pci_dev *vf_pdev, *tmp;
+                bool warn_stale_vfs = false;
+
+                list_for_each_entry_safe(vf_pdev, tmp, &pdev->vf_list, vf_list)
+                {
+                    list_del(&vf_pdev->vf_list);
+                    vf_pdev->virtfn.pf_pdev = NULL;
+                    vf_pdev->broken = true;
+                    warn_stale_vfs = true;
+                }
+
+                if ( warn_stale_vfs )
+                    printk(XENLOG_WARNING "PCI SR-IOV PF %pp removed with VFs still present\n",
+                           &pdev->sbdf);
+            }
+
             if ( pdev->domain )
             {
                 write_lock(&pdev->domain->pci_lock);
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index ef56e80651d6..2ea168d5f914 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -153,7 +153,17 @@ struct pci_dev {
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



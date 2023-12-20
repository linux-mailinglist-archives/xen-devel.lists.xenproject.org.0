Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4D681A8A5
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 22:47:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658317.1027430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG4PU-0005Tm-2w; Wed, 20 Dec 2023 21:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658317.1027430; Wed, 20 Dec 2023 21:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG4PT-0005Rc-VX; Wed, 20 Dec 2023 21:47:23 +0000
Received: by outflank-mailman (input) for mailman id 658317;
 Wed, 20 Dec 2023 21:47:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7nCC=H7=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rG4PS-00059K-P8
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 21:47:22 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2409::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59b03c1e-9f81-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 22:47:21 +0100 (CET)
Received: from CH5P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::21)
 by MN2PR12MB4373.namprd12.prod.outlook.com (2603:10b6:208:261::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 21:47:16 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:610:1ef:cafe::ba) by CH5P220CA0003.outlook.office365.com
 (2603:10b6:610:1ef::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18 via Frontend
 Transport; Wed, 20 Dec 2023 21:47:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Wed, 20 Dec 2023 21:47:15 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 20 Dec
 2023 15:47:08 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 20 Dec
 2023 15:47:08 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 20 Dec 2023 15:47:01 -0600
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
X-Inumbo-ID: 59b03c1e-9f81-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnUrPzeffMuHjZHgeoAVbR9c5EVdbzlc6sxh2lfwIZ47RxYFFfkN1Y3D2cldn9Tq4sC5pNtreFseV1megZ9e2foH1CPe3LLbXUqnIzaXTZ10m+GOnaXjrhm4BjxafnD0l+Wy8rtnMukFiC6WM545E6oXp2oZQWTmiuMvSIdzzTX3cGixRlmnO6w3B7NnGJ3Q4GXrAcrKb0aNZFEcYU9Rlc72m9qizQM8OZWdU2+XrO8ogl2fJI92ncUWgRynt0AZfl6yr5MO84YapJcXH2ktpBUOmy08QGWZYLMWbw8i9FtFaW19R8thKZLIzq4guuk3o4EQvRoGc8tofXz8XQpKgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yz7MawEjyV2a8Oykj6A1kAth1jXNG2SxWf2+03xYt3g=;
 b=cCOnRmMNnWIyn4iGnb7ov5oXksaE9v7tTe5Brz7eurd0uEC7yl1a2q06VkmmHY3ZqmNF1DMBjL0EeUKHbOLjnUNG19QE0+rlQf+ccnM4EnSdj16w6SMjUDQgLcPGJfAVWR8tCsTfgm4SBW0+Ug5dmJJVd5gEZy7e79HTBKGuN5knMYXdR1KP5nakd1kSamAqko+vc/51uYQuUl3RGO1KW0HBSRBp24Oc4zwonIT7lbMXo8VTccO2hawQyCwkBXyrX8wb5JJqFvrb7vt5RLtIxuZyIEZflHo9H+1GBJsEiF378VEhOLiA11XYuIqG8ehtELNDuit3CjNT8JdjkoARbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yz7MawEjyV2a8Oykj6A1kAth1jXNG2SxWf2+03xYt3g=;
 b=ADP7PclVTYlnJSUF54+VdcPZS4NvpMD6wn7UxjsLYtQs+f3umfhpXkZs8BoaIsseO/Np1eZa7NgaqTSwq6lScgMvjhwWj4k7vKQaO3wmnhtW8yIH/liMdxvupZwzOLsNqpAvLY9LJ3f4w7zalB5/BWJNU1E7CfBOAVhkU8TfP1M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH v11.5 2/17] pci: introduce per-domain PCI rwlock
Date: Wed, 20 Dec 2023 16:46:53 -0500
Message-ID: <20231220214658.431526-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231202012556.2012281-3-volodymyr_babchuk@epam.com>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com> <20231202012556.2012281-3-volodymyr_babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|MN2PR12MB4373:EE_
X-MS-Office365-Filtering-Correlation-Id: 70d3d07e-4f21-4a0e-a5e9-08dc01a53b25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fF4pqa8beg1sRzac3+LfCMd8BkHZrAQkiwsk+DTambxXTsU1GqKNwuSIzUPk6RPj1cLf7Eyu0DhdYf6gjLMS960NSukbl0Be0/1x0n+KRJ4vPTe7MX5Du6XAIiAeKztaKHrDnZycOn22j1yebLkIF/OwLDYmOZLiby1i8ZBcd4ja84q38e4bXGjEnSeaEmuC8BWwBahbyYU5PvvfzOlbXz2c1PIzD1AebXbKTh8KDJsLAN3Gfr2ZtdUdlam7g4PS9t1M0XtlzIbRXB61LWkKbFT8Gk+NugXwkNOb9aEQfAVOX+lvZ+fGKCeVu742XxqbFQERjdogmqEXlfbmAOS08bROXQ7WgBxty1kR3m3cXSX+0/0dr7B50Wp1DARjEEz7MstGWBmoOD4xKqzg8P/g7ZvRJlzyHXkpWPZ3vSPIZcKkvHmgbf3S4j8o+7fI4SVHH6H2+buEpi6UVOyWIC1o+5ymF/rC6RS5cU5Fne1o9TPBKhp7FiOU5qik5+ctFWK8zm/14c2x8Ej7QZhbx9ZS+ZGzpXPmNQt+gPbKPUd/wjFqVS6hUfzKsJDzY72VZ74XzrUxmaHxNaI2ufN1lKjUDztwc3xBTv7cYREuF1IfKVcUXdak7tEPUEegZK3miKux0L0NXzjm4BQM4/lqGFjweDctjE5dQCIcVIOYMuSMwlCavtq9nO7GoIFnUtslxD+W2YB1Jh/5nzn1jtSmXo3hrohRUE6V2LA3u+RuXF6MiBSNIcG4sZ9u9soFv60QuL/HUxbPRzduyWM6yIeDi0OaDQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(376002)(136003)(230922051799003)(1800799012)(82310400011)(186009)(64100799003)(451199024)(40470700004)(46966006)(36840700001)(5660300002)(2906002)(7416002)(40460700003)(41300700001)(356005)(81166007)(336012)(36756003)(86362001)(26005)(426003)(82740400003)(2616005)(1076003)(47076005)(44832011)(36860700001)(83380400001)(478600001)(6666004)(8936002)(70206006)(54906003)(4326008)(6916009)(8676002)(70586007)(316002)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 21:47:15.2697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d3d07e-4f21-4a0e-a5e9-08dc01a53b25
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4373

From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>

Add per-domain d->pci_lock that protects access to
d->pdev_list. Purpose of this lock is to give guarantees to VPCI code
that underlying pdev will not disappear under feet. This is a rw-lock,
but this patch adds only write_lock()s. There will be read_lock()
users in the next patches.

This lock should be taken in write mode every time d->pdev_list is
altered. All write accesses also should be protected by pcidevs_lock()
as well. Idea is that any user that wants read access to the list or
to the devices stored in the list should use either this new
d->pci_lock or old pcidevs_lock(). Usage of any of this two locks will
ensure only that pdev of interest will not disappear from under feet
and that the pdev still will be assigned to the same domain. Of
course, any new users should use pcidevs_lock() when it is
appropriate (e.g. when accessing any other state that is protected by
the said lock). In case both the newly introduced per-domain rwlock
and the pcidevs lock is taken, the latter must be acquired first.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---

Changes in v11.5:
 - Add Stefano's A-b
 - Add Stewart's S-o-b
 - Add in-code comment about locking order in sched.h

Changes in v10:
 - pdev->domain is assigned after removing from source domain but
   before adding to target domain in reassign_device() functions.

Changes in v9:
 - returned back "pdev->domain = target;" in AMD IOMMU code
 - used "source" instead of pdev->domain in IOMMU functions
 - added comment about lock ordering in the commit message
 - reduced locked regions
 - minor changes non-functional changes in various places

Changes in v8:
 - New patch

Changes in v8 vs RFC:
 - Removed all read_locks after discussion with Roger in #xendevel
 - pci_release_devices() now returns the first error code
 - extended commit message
 - added missing lock in pci_remove_device()
 - extended locked region in pci_add_device() to protect list_del() calls
---
 xen/common/domain.c                         |  1 +
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  9 ++-
 xen/drivers/passthrough/pci.c               | 71 +++++++++++++++++----
 xen/drivers/passthrough/vtd/iommu.c         |  9 ++-
 xen/include/xen/sched.h                     | 22 +++++++
 5 files changed, 99 insertions(+), 13 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index c5954cdb1ac2..f6f557499660 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -651,6 +651,7 @@ struct domain *domain_create(domid_t domid,
 
 #ifdef CONFIG_HAS_PCI
     INIT_LIST_HEAD(&d->pdev_list);
+    rwlock_init(&d->pci_lock);
 #endif
 
     /* All error paths can depend on the above setup. */
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index 6bc73dc21052..5cd208bbefee 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -481,8 +481,15 @@ static int cf_check reassign_device(
 
     if ( devfn == pdev->devfn && pdev->domain != target )
     {
-        list_move(&pdev->domain_list, &target->pdev_list);
+        write_lock(&source->pci_lock);
+        list_del(&pdev->domain_list);
+        write_unlock(&source->pci_lock);
+
         pdev->domain = target;
+
+        write_lock(&target->pci_lock);
+        list_add(&pdev->domain_list, &target->pdev_list);
+        write_unlock(&target->pci_lock);
     }
 
     /*
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 28ed8ea8172a..1439d1ef2b26 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -453,7 +453,9 @@ static void __init _pci_hide_device(struct pci_dev *pdev)
     if ( pdev->domain )
         return;
     pdev->domain = dom_xen;
+    write_lock(&dom_xen->pci_lock);
     list_add(&pdev->domain_list, &dom_xen->pdev_list);
+    write_unlock(&dom_xen->pci_lock);
 }
 
 int __init pci_hide_device(unsigned int seg, unsigned int bus,
@@ -746,7 +748,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
     if ( !pdev->domain )
     {
         pdev->domain = hardware_domain;
+        write_lock(&hardware_domain->pci_lock);
         list_add(&pdev->domain_list, &hardware_domain->pdev_list);
+        write_unlock(&hardware_domain->pci_lock);
 
         /*
          * For devices not discovered by Xen during boot, add vPCI handlers
@@ -756,7 +760,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         if ( ret )
         {
             printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
+            write_lock(&hardware_domain->pci_lock);
             list_del(&pdev->domain_list);
+            write_unlock(&hardware_domain->pci_lock);
             pdev->domain = NULL;
             goto out;
         }
@@ -764,7 +770,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         if ( ret )
         {
             vpci_remove_device(pdev);
+            write_lock(&hardware_domain->pci_lock);
             list_del(&pdev->domain_list);
+            write_unlock(&hardware_domain->pci_lock);
             pdev->domain = NULL;
             goto out;
         }
@@ -814,7 +822,11 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
             pci_cleanup_msi(pdev);
             ret = iommu_remove_device(pdev);
             if ( pdev->domain )
+            {
+                write_lock(&pdev->domain->pci_lock);
                 list_del(&pdev->domain_list);
+                write_unlock(&pdev->domain->pci_lock);
+            }
             printk(XENLOG_DEBUG "PCI remove device %pp\n", &pdev->sbdf);
             free_pdev(pseg, pdev);
             break;
@@ -885,26 +897,61 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
 
 int pci_release_devices(struct domain *d)
 {
-    struct pci_dev *pdev, *tmp;
-    u8 bus, devfn;
-    int ret;
+    int combined_ret;
+    LIST_HEAD(failed_pdevs);
 
     pcidevs_lock();
-    ret = arch_pci_clean_pirqs(d);
-    if ( ret )
+
+    combined_ret = arch_pci_clean_pirqs(d);
+    if ( combined_ret )
     {
         pcidevs_unlock();
-        return ret;
+        return combined_ret;
     }
-    list_for_each_entry_safe ( pdev, tmp, &d->pdev_list, domain_list )
+
+    write_lock(&d->pci_lock);
+
+    while ( !list_empty(&d->pdev_list) )
     {
-        bus = pdev->bus;
-        devfn = pdev->devfn;
-        ret = deassign_device(d, pdev->seg, bus, devfn) ?: ret;
+        struct pci_dev *pdev = list_first_entry(&d->pdev_list,
+                                                struct pci_dev,
+                                                domain_list);
+        uint16_t seg = pdev->seg;
+        uint8_t bus = pdev->bus;
+        uint8_t devfn = pdev->devfn;
+        int ret;
+
+        write_unlock(&d->pci_lock);
+        ret = deassign_device(d, seg, bus, devfn);
+        write_lock(&d->pci_lock);
+        if ( ret )
+        {
+            const struct pci_dev *tmp;
+
+            /*
+             * We need to check if deassign_device() left our pdev in
+             * domain's list. As we dropped the lock, we can't be sure
+             * that list wasn't permutated in some random way, so we
+             * need to traverse the whole list.
+             */
+            for_each_pdev ( d, tmp )
+            {
+                if ( tmp == pdev )
+                {
+                    list_move_tail(&pdev->domain_list, &failed_pdevs);
+                    break;
+                }
+            }
+
+            combined_ret = combined_ret ?: ret;
+        }
     }
+
+    list_splice(&failed_pdevs, &d->pdev_list);
+    write_unlock(&d->pci_lock);
     pcidevs_unlock();
 
-    return ret;
+    return combined_ret;
 }
 
 #define PCI_CLASS_BRIDGE_HOST    0x0600
@@ -1124,7 +1171,9 @@ static int __hwdom_init cf_check _setup_hwdom_pci_devices(
             if ( !pdev->domain )
             {
                 pdev->domain = ctxt->d;
+                write_lock(&ctxt->d->pci_lock);
                 list_add(&pdev->domain_list, &ctxt->d->pdev_list);
+                write_unlock(&ctxt->d->pci_lock);
                 setup_one_hwdom_device(ctxt, pdev);
             }
             else if ( pdev->domain == dom_xen )
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index bc6181c9f911..99b642f12ef9 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2816,8 +2816,15 @@ static int cf_check reassign_device_ownership(
 
     if ( devfn == pdev->devfn && pdev->domain != target )
     {
-        list_move(&pdev->domain_list, &target->pdev_list);
+        write_lock(&source->pci_lock);
+        list_del(&pdev->domain_list);
+        write_unlock(&source->pci_lock);
+
         pdev->domain = target;
+
+        write_lock(&target->pci_lock);
+        list_add(&pdev->domain_list, &target->pdev_list);
+        write_unlock(&target->pci_lock);
     }
 
     if ( !has_arch_pdevs(source) )
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 3609ef88c4ff..9da91e0e6244 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -461,6 +461,28 @@ struct domain
 
 #ifdef CONFIG_HAS_PCI
     struct list_head pdev_list;
+    /*
+     * pci_lock protects access to pdev_list.
+     *
+     * Any user *reading* from pdev_list, or from devices stored in pdev_list,
+     * should hold either pcidevs_lock() or pci_lock in read mode. Optionally,
+     * both locks may be held for reads as long as the locking order is
+     * observed.
+     *
+     * Any user *writing* to pdev_list, or to devices stored in pdev_list,
+     * should hold both pcidevs_lock() and pci_lock in write mode, and observe
+     * the locking order.
+     *
+     * The locking order is:
+     * 1. pcidevs_lock()
+     * 2. d->pci_lock
+     *
+     * Additionally, users of both pci_lock and vpci->lock should observe the
+     * following locking order:
+     * 1. d->pci_lock
+     * 2. pdev->vpci->lock
+     */
+    rwlock_t pci_lock;
 #endif
 
 #ifdef CONFIG_HAS_PASSTHROUGH
-- 
2.43.0



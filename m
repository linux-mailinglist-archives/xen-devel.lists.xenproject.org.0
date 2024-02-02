Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DD2847B94
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 22:34:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675213.1050503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1BD-00058g-SN; Fri, 02 Feb 2024 21:34:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675213.1050503; Fri, 02 Feb 2024 21:34:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1BD-00055v-Or; Fri, 02 Feb 2024 21:34:35 +0000
Received: by outflank-mailman (input) for mailman id 675213;
 Fri, 02 Feb 2024 21:34:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iq6B=JL=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rW1BC-0003tJ-77
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 21:34:34 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2409::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dae8aeb1-c212-11ee-8a45-1f161083a0e0;
 Fri, 02 Feb 2024 22:34:33 +0100 (CET)
Received: from BYAPR03CA0001.namprd03.prod.outlook.com (2603:10b6:a02:a8::14)
 by MW5PR12MB5600.namprd12.prod.outlook.com (2603:10b6:303:195::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.9; Fri, 2 Feb
 2024 21:34:30 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a02:a8:cafe::2f) by BYAPR03CA0001.outlook.office365.com
 (2603:10b6:a02:a8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23 via Frontend
 Transport; Fri, 2 Feb 2024 21:34:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Fri, 2 Feb 2024 21:34:29 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 2 Feb
 2024 15:34:28 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 2 Feb
 2024 13:34:28 -0800
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 2 Feb 2024 15:34:27 -0600
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
X-Inumbo-ID: dae8aeb1-c212-11ee-8a45-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1IV2fkW4MlwOgrgGzh8fEIhwjZP2sJrnLPO7NpcwlKavBVUBIp9/ewqlF+Rxztd2ShM9SjpnKPlNAnvCC/zrruphJzNM9PYS9fBzVqEYSwYlk46nbTXuYBDcOoWnM6qyExXx346dbZKGhoWS52O6qNuBfc2UqpIH+vwjHIv71gv3cLNbXE+Di771e8QzRHE9im7Ab3bfbMtHfd8bhyVBBUS6S2VYhZT9xdActlDZFKZQQyHkuKhSsWEjrZJth+I8VoHSEGfdNNcU+zD4+Qggn6sr8QcY6qAkGfqqu4IUJPF42wUC+s0SGuPhixmfaSnyJr1aLTGN+NyChVa+KsqtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NWmHF1bTVpBmU7drHJ9mWbFr611+spd24HiT6koGFoM=;
 b=C6tx3ucDy0C7nxCqI/LNmR/HZSgUuXc+wfrSxJ8kT/pXiTCkKhopcXI5XockOn/bNzyQDDq/+bYBo47QvXhm75SiAiKzfk6DqaszaeNwakH1DAQpU900g8LI7GZEGEtPjx4QpeKNUAZg4KVrrePRGSVZ5dGAmI7AEjfRaazbDO8NFFkaKPVpzSLh/EcHDs2cIbNr5T68TQ9pChYkxaC5croqYGfD+xEiUfNM5sQkiRkthhMr5+XRc/kZc4OEmDLRe8weLoOu0YyAP6pIpOOvnuAa0NeR2hka9ar4Y5Pv8CZ01BND99FN/fUTkz1jQaffecVkYV6r7ikQgqYT0T60MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWmHF1bTVpBmU7drHJ9mWbFr611+spd24HiT6koGFoM=;
 b=Yg1j149sHsTJl26CvEuTs9SfJCSNb49Klj79OmsEJsqEl1GppmhTD+8zC+qcwPMYlU0g1ds0WSfIk3Mvjn/1fAUZeX5549xWQfQ7WcDBU9ItifTmvMTgsjWsww7+rkWJ2QnmPg1e4nWsLfUBq/GQU/sdAgs0IH4qT6fIMlgCfEM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Volodymyr
 Babchuk" <volodymyr_babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v13 03/14] vpci: add hooks for PCI device assign/de-assign
Date: Fri, 2 Feb 2024 16:33:07 -0500
Message-ID: <20240202213321.1920347-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|MW5PR12MB5600:EE_
X-MS-Office365-Filtering-Correlation-Id: bc76e669-0c30-490a-0edc-08dc2436bcd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	26CNyWiHFkKUwHCJUuvydOTrQInd9iUThSL+uq7k910Yh1Pf2BN7NaaAoFu1zbu8O/UrsAoPbBkh05Pt4uK3X7xNlCzURkOKL+JuiGWeY9RsJti0xxQeS4bGUKyNA87jKCsI1prAKTwlNTrh1kCVxP9eGWO6ZdAkh7su6Qhdxyr/O0Cr4N89a2nXp+GNIdhvD2sXXOZSkVU/6bnwC2nOTsW4sqJmV++P2GVlFMDcYPYm86YmVw6xFK+odCcGrwEBhqArnNnb41mnXFVoVlUWvTrP1zAze/bhVNy16H443O5Kz9a45jqtHI0BzyGl/jjNh7hojsvsXg3HFyvBy7/n+Ss24/RZ3/Ymlmz67iHAHbgLRQf8UErnPKJbMpO2rxH006zfF5csn6HsjlSlYZ1NqKwiiCvhNHCsQPPfJppUorBni/d9NQglrVoFFLSxuNd78CNz5fcpS4AY+Gfceb841A3rUYgDR1U1ZN85exqw6srSCmL5j7ArFUMOJhHyx+5LdUlHlffHTeDggxnLP77YBeQBSVD4cAGwBIIbK8z1rW9v/M5JZDFe3kj7HE+Jfqez5Hxk0LFyBntK84sVCwNxeuvZo5RSMJzWeDd77nVhk3zIO5SJr0uDSaUTT/TK50/hQa1jFb4ZWCCCquQmwa/JzLLxUO5Gt63w9GsMc8bwDc3xm0qj9krtIJ6AGW6cvNzR28uVVeMfHhXol/nfkL8K8LpYiQ+9QQ/ZqJqy/pevQtlWBNdvKj6DboBd+y99ckIBxzqifcDpZTxUft1GVgP1zg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(82310400011)(64100799003)(186009)(451199024)(1800799012)(36840700001)(40470700004)(46966006)(40460700003)(40480700001)(36756003)(86362001)(478600001)(356005)(426003)(8936002)(82740400003)(1076003)(336012)(2616005)(41300700001)(81166007)(26005)(83380400001)(47076005)(44832011)(54906003)(36860700001)(6916009)(5660300002)(2906002)(6666004)(316002)(4326008)(70206006)(70586007)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 21:34:29.3627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc76e669-0c30-490a-0edc-08dc2436bcd8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5600

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

When a PCI device gets assigned/de-assigned we need to
initialize/de-initialize vPCI state for the device.

Also, rename vpci_add_handlers() to vpci_assign_device() and
vpci_remove_device() to vpci_deassign_device() to better reflect role
of the functions.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
In v13:
 - Add Jan's A-b
 - Rebase on
   cb4ecb3cc17b ("pci: fail device assignment if phantom functions cannot be assigned")
   and add if ( rc ) goto done; in assign_device()
In v12:
 - Add Roger's R-b
 - Clean up comment in xen/include/xen/vpci.h
 - Add comment in xen/drivers/passthrough/pci.c:deassign_device() to
   clarify vpci_assign_device() call
In v11:
- Call vpci_assign_device() in "deassign_device" if IOMMU call
"reassign_device" was successful.
In v10:
- removed HAS_VPCI_GUEST_SUPPORT checks
- HAS_VPCI_GUEST_SUPPORT config option (in Kconfig) as it is not used
  anywhere
In v9:
- removed previous  vpci_[de]assign_device function and renamed
  existing handlers
- dropped attempts to handle errors in assign_device() function
- do not call vpci_assign_device for dom_io
- use d instead of pdev->domain
- use IS_ENABLED macro
In v8:
- removed vpci_deassign_device
In v6:
- do not pass struct domain to vpci_{assign|deassign}_device as
  pdev->domain can be used
- do not leave the device assigned (pdev->domain == new domain) in case
  vpci_assign_device fails: try to de-assign and if this also fails, then
  crash the domain
In v5:
- do not split code into run_vpci_init
- do not check for is_system_domain in vpci_{de}assign_device
- do not use vpci_remove_device_handlers_locked and re-allocate
  pdev->vpci completely
- make vpci_deassign_device void
In v4:
 - de-assign vPCI from the previous domain on device assignment
 - do not remove handlers in vpci_assign_device as those must not
   exist at that point
In v3:
 - remove toolstack roll-back description from the commit message
   as error are to be handled with proper cleanup in Xen itself
 - remove __must_check
 - remove redundant rc check while assigning devices
 - fix redundant CONFIG_HAS_VPCI check for CONFIG_HAS_VPCI_GUEST_SUPPORT
 - use REGISTER_VPCI_INIT machinery to run required steps on device
   init/assign: add run_vpci_init helper
In v2:
- define CONFIG_HAS_VPCI_GUEST_SUPPORT so dead code is not compiled
  for x86
In v1:
 - constify struct pci_dev where possible
 - do not open code is_system_domain()
 - extended the commit message
---
 xen/drivers/passthrough/pci.c | 28 ++++++++++++++++++++++++----
 xen/drivers/vpci/header.c     |  2 +-
 xen/drivers/vpci/vpci.c       |  6 +++---
 xen/include/xen/vpci.h        | 10 +++++-----
 4 files changed, 33 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index c97dd4504a7a..4c0a836486ec 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -755,7 +755,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
          * For devices not discovered by Xen during boot, add vPCI handlers
          * when Dom0 first informs Xen about such devices.
          */
-        ret = vpci_add_handlers(pdev);
+        ret = vpci_assign_device(pdev);
         if ( ret )
         {
             list_del(&pdev->domain_list);
@@ -769,7 +769,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         if ( ret )
         {
             write_lock(&hardware_domain->pci_lock);
-            vpci_remove_device(pdev);
+            vpci_deassign_device(pdev);
             list_del(&pdev->domain_list);
             write_unlock(&hardware_domain->pci_lock);
             pdev->domain = NULL;
@@ -817,7 +817,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
         if ( pdev->bus == bus && pdev->devfn == devfn )
         {
-            vpci_remove_device(pdev);
+            vpci_deassign_device(pdev);
             pci_cleanup_msi(pdev);
             ret = iommu_remove_device(pdev);
             if ( pdev->domain )
@@ -875,6 +875,10 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
             goto out;
     }
 
+    write_lock(&d->pci_lock);
+    vpci_deassign_device(pdev);
+    write_unlock(&d->pci_lock);
+
     devfn = pdev->devfn;
     ret = iommu_call(hd->platform_ops, reassign_device, d, target, devfn,
                      pci_to_dev(pdev));
@@ -886,6 +890,11 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
 
     pdev->fault.count = 0;
 
+    write_lock(&target->pci_lock);
+    /* Re-assign back to hardware_domain */
+    ret = vpci_assign_device(pdev);
+    write_unlock(&target->pci_lock);
+
  out:
     if ( ret )
         printk(XENLOG_G_ERR "%pd: deassign (%pp) failed (%d)\n",
@@ -1146,7 +1155,7 @@ static void __hwdom_init setup_one_hwdom_device(const struct setup_hwdom *ctxt,
               PCI_SLOT(devfn) == PCI_SLOT(pdev->devfn) );
 
     write_lock(&ctxt->d->pci_lock);
-    err = vpci_add_handlers(pdev);
+    err = vpci_assign_device(pdev);
     write_unlock(&ctxt->d->pci_lock);
     if ( err )
         printk(XENLOG_ERR "setup of vPCI for d%d failed: %d\n",
@@ -1476,6 +1485,10 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
     if ( pdev->broken && d != hardware_domain && d != dom_io )
         goto done;
 
+    write_lock(&pdev->domain->pci_lock);
+    vpci_deassign_device(pdev);
+    write_unlock(&pdev->domain->pci_lock);
+
     rc = pdev_msix_assign(d, pdev);
     if ( rc )
         goto done;
@@ -1501,6 +1514,13 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
                         pci_to_dev(pdev), flag);
     }
 
+    if ( rc )
+        goto done;
+
+    write_lock(&d->pci_lock);
+    rc = vpci_assign_device(pdev);
+    write_unlock(&d->pci_lock);
+
  done:
     if ( rc )
     {
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 8f5850b8cf6d..2f2d98ada012 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -191,7 +191,7 @@ bool vpci_process_pending(struct vcpu *v)
              * killed in order to avoid leaking stale p2m mappings on
              * failure.
              */
-            vpci_remove_device(v->vpci.pdev);
+            vpci_deassign_device(v->vpci.pdev);
         write_unlock(&v->domain->pci_lock);
     }
 
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index d545dc633c40..ff4837391786 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -40,7 +40,7 @@ extern vpci_register_init_t *const __start_vpci_array[];
 extern vpci_register_init_t *const __end_vpci_array[];
 #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
 
-void vpci_remove_device(struct pci_dev *pdev)
+void vpci_deassign_device(struct pci_dev *pdev)
 {
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
 
@@ -73,7 +73,7 @@ void vpci_remove_device(struct pci_dev *pdev)
     pdev->vpci = NULL;
 }
 
-int vpci_add_handlers(struct pci_dev *pdev)
+int vpci_assign_device(struct pci_dev *pdev)
 {
     unsigned int i;
     const unsigned long *ro_map;
@@ -107,7 +107,7 @@ int vpci_add_handlers(struct pci_dev *pdev)
     }
 
     if ( rc )
-        vpci_remove_device(pdev);
+        vpci_deassign_device(pdev);
 
     return rc;
 }
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index d20c301a3db3..99fe76f08ace 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -25,11 +25,11 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
   static vpci_register_init_t *const x##_entry  \
                __used_section(".data.vpci." p) = x
 
-/* Add vPCI handlers to device. */
-int __must_check vpci_add_handlers(struct pci_dev *pdev);
+/* Assign vPCI to device by adding handlers. */
+int __must_check vpci_assign_device(struct pci_dev *pdev);
 
 /* Remove all handlers and free vpci related structures. */
-void vpci_remove_device(struct pci_dev *pdev);
+void vpci_deassign_device(struct pci_dev *pdev);
 
 /* Add/remove a register handler. */
 int __must_check vpci_add_register_mask(struct vpci *vpci,
@@ -255,12 +255,12 @@ bool vpci_ecam_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
 #else /* !CONFIG_HAS_VPCI */
 struct vpci_vcpu {};
 
-static inline int vpci_add_handlers(struct pci_dev *pdev)
+static inline int vpci_assign_device(struct pci_dev *pdev)
 {
     return 0;
 }
 
-static inline void vpci_remove_device(struct pci_dev *pdev) { }
+static inline void vpci_deassign_device(struct pci_dev *pdev) { }
 
 static inline void vpci_dump_msi(void) { }
 
-- 
2.43.0



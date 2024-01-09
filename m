Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F41BA828F3F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 22:52:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665018.1035205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNK1b-0000Ns-4m; Tue, 09 Jan 2024 21:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665018.1035205; Tue, 09 Jan 2024 21:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNK1b-0000Kk-00; Tue, 09 Jan 2024 21:52:43 +0000
Received: by outflank-mailman (input) for mailman id 665018;
 Tue, 09 Jan 2024 21:52:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ONpl=IT=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rNK1Z-0007gG-H2
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 21:52:41 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e88::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67b647c9-af39-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 22:52:39 +0100 (CET)
Received: from BYAPR07CA0038.namprd07.prod.outlook.com (2603:10b6:a03:60::15)
 by IA1PR12MB8222.namprd12.prod.outlook.com (2603:10b6:208:3f2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Tue, 9 Jan
 2024 21:52:32 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:60:cafe::76) by BYAPR07CA0038.outlook.office365.com
 (2603:10b6:a03:60::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23 via Frontend
 Transport; Tue, 9 Jan 2024 21:52:32 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Tue, 9 Jan 2024 21:52:31 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 9 Jan
 2024 15:52:31 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 9 Jan
 2024 13:52:30 -0800
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 9 Jan 2024 15:52:29 -0600
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
X-Inumbo-ID: 67b647c9-af39-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPbIe4AGfLg5H0PbZGcMsjYQlGEej/LE1fqXDyhwi7toYFEj7KYD49a0/IqrxKH60x4CuikZhw9PVCTs1F2Bg7lbqEyqy2UCfeHyx/6XX59RwmNXjNJZtS4am8G/UF2XBFCwc2JJ+KlqzsQ2begBdo38JuDQUzPPVPZ9WelEx3VQQIfVe0anhMwCANcwk5MEf+J2KrLpt/2Jo/slg7sZB3ENwLw5U+fyESTciZre4avZtpQS8+NHUDIIXgsvOlqwPSWhsMefADQwDlTzZOPIAM7/WnSUXb9kXE5zeoxA8g5LDkFU7orRTkEHI7WJj3G3BMGbCwxIpmAOzl3x1Amg/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E94DHi+8iv4ojBdqEJ1iMS9iLwhVWhZwG3WSVolNNZs=;
 b=TJKuLxN/j36qbc5UEdXNe7W1jlepvl+EmE6BLK/Z9lhgJ1umW8m6pxtERrTmn3v6Xn6QxnzTUIP7x1DBplWedEc0/U2m8X/c8/orHCOxaa47pRr6gsy/8657rMvkbXjLVXmD5BqZCVSELb9LEiXwDY0/saRbjHB8wx2N2XKw5b0fAJXVJvAcOVp/tgs4RN6hnUtjYKHUnxFLMStCbLIdWqVXTyijAQyGZONGq9Qux/QEq+WCo5LVEk6MCjdubte0oWe7CSsUFyEtHJi8xuSrBLsPWxy7YMkmXSV1lKvHjXXZbFYQWOar+4KUgrMr8PLPb7tbNaa8N2J4HoyoueCwCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E94DHi+8iv4ojBdqEJ1iMS9iLwhVWhZwG3WSVolNNZs=;
 b=voZTB7MskqiJBx8TjC9BHBKzn/J+EeCWUYSlFtt9GULzDleqPMtPSD55PxNRdco7NaAGrN22wwHdeDPC9gplRFgMYi7llkBLLpqJnkX1oMUYNYLvcuXfxA5XzFWckesDRHwUGAo/YJ35DA4zT/2zRCM2FrGttKN1dWDn7Q+Oe7A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Volodymyr
 Babchuk" <volodymyr_babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v12 03/15] vpci: add hooks for PCI device assign/de-assign
Date: Tue, 9 Jan 2024 16:51:18 -0500
Message-ID: <20240109215145.430207-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109215145.430207-1-stewart.hildebrand@amd.com>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|IA1PR12MB8222:EE_
X-MS-Office365-Filtering-Correlation-Id: c8a76ff7-9028-4648-a64c-08dc115d47fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7T229zm9TmGhKkB5r1olrQAAAYXaH9dfzplmQvd/w9VYONGVkJp9z3WF+JellbLR37bz/rOuXkqtcJ9OXMt0HwmqFoJaxLmW+g7AdIpAB3pKJ66SHWAJDEq0Y8MR0G5mbkzHattZFH4bvxj7T/gPmX430Bc6wDZ9lwTfycZodnSHnUsWbhdFEEeF+eXJUZ3YI8ngYANvtJ6H5Ybs+ZtQghrSnYcQCKnv7LTbX16iVN2V7GOseNXPqcUrYYQ4JX6aXK6xn2vVyv3Uk6E7Te37tTOM9LVeaDVUSNy/j7UDVzhM2RAlHA3FoAkjAckecRoyw/8ZVR/YkXDk5TnJ9RYVORjcqXOfcQ4aFEKe/X/Y35jLXpEbuD3yMqzxEslugV0kNeDTnMU7U9N9UANB+6ZpDJI9KNYwNmxaU2TKb+BoEQ0+z8Tpy5kj82aZz9NwMXJt7EPfiQe4LWqTX+64mbrSlxi2j9LPnihsxNg8IorqKri+GiSDBmltQOincMFOFjT8YDQuu6dBN/4tuR8yV+Leobvx7sfSx+gJvrKe/CqKfay96RHlEgYH8Mb9PdIimqw+3NnAhLSmwHxHMb2aepuJxx6Nds4w6Ykyzr9J0BpKXuTbjMv4cS5v4VEm67gA+Bp0BfvMFLM9gZq3YmZDGnHOjSS4OvrjdYTYRUfl6pzjLxZFEbVKNQgkhBpruaXtZNRKghGJHP5+XG5jPwyi8wvDe88PPVfZliayOE1t5Mt1fDAByNAzT72a3dOjf+0BLonUvlRxgSxSytDwyhZT3XB2iRp2OFlofmnAdeYj45CNYTPqx8JcYa9jXmqazGi7hRGa
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(230273577357003)(230173577357003)(1800799012)(82310400011)(186009)(451199024)(64100799003)(36840700001)(46966006)(40470700004)(36860700001)(47076005)(2906002)(2616005)(70586007)(1076003)(70206006)(41300700001)(86362001)(40480700001)(26005)(40460700003)(36756003)(82740400003)(356005)(81166007)(5660300002)(54906003)(316002)(426003)(336012)(6666004)(4326008)(44832011)(6916009)(478600001)(83380400001)(8936002)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 21:52:31.5822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a76ff7-9028-4648-a64c-08dc115d47fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8222

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
---
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
 xen/drivers/passthrough/pci.c | 25 +++++++++++++++++++++----
 xen/drivers/vpci/header.c     |  2 +-
 xen/drivers/vpci/vpci.c       |  6 +++---
 xen/include/xen/vpci.h        | 10 +++++-----
 4 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 3a973324bca1..a902de6a8693 100644
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
@@ -1502,6 +1515,10 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
                         pci_to_dev(pdev), flag);
     }
 
+    write_lock(&d->pci_lock);
+    rc = vpci_assign_device(pdev);
+    write_unlock(&d->pci_lock);
+
  done:
     if ( rc )
         printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
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
index e98693e1dc3e..42eac85106a3 100644
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



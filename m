Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5023781A8A3
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 22:47:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658316.1027421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG4PK-0005B6-Me; Wed, 20 Dec 2023 21:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658316.1027421; Wed, 20 Dec 2023 21:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG4PK-00059R-Js; Wed, 20 Dec 2023 21:47:14 +0000
Received: by outflank-mailman (input) for mailman id 658316;
 Wed, 20 Dec 2023 21:47:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7nCC=H7=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rG4PJ-00059K-55
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 21:47:13 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52c2509e-9f81-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 22:47:10 +0100 (CET)
Received: from SN7PR04CA0212.namprd04.prod.outlook.com (2603:10b6:806:127::7)
 by LV2PR12MB6015.namprd12.prod.outlook.com (2603:10b6:408:14f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Wed, 20 Dec
 2023 21:47:06 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:806:127:cafe::42) by SN7PR04CA0212.outlook.office365.com
 (2603:10b6:806:127::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18 via Frontend
 Transport; Wed, 20 Dec 2023 21:47:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Wed, 20 Dec 2023 21:47:05 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 20 Dec
 2023 15:46:45 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 20 Dec
 2023 15:46:45 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 20 Dec 2023 15:46:38 -0600
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
X-Inumbo-ID: 52c2509e-9f81-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3NNOrBq5cvm7jzEkn6NFa97RBLgZvSK5JN015zJjH45sTiuWwmDXx45aSvaqq/gkv5tmIUvzHa1WVU/KZrfyOu1FtZUxmmwy0WBxuXQ2m9ChcAw/nPFOngoAWkhma51rY0D7mWnJHBIyyrM3cLNnE4wQjGQfDmma06HaZYl2A4P4cDQnhj4e6C1oyFZbMYBaoS4L2/ZLQYXRQ/sm7O/HoKt/HCQ6SStntJebA9KoV9c7vlPZzZLfUr4lmOLpHYK4ZMPaPc5G7H45mZ81rJyizBSnlrN9QdBlRzj7fw/4AQEpWIZIuQZJ4seTwIIDPxdUDXURy4UNFrAAVaLJRG5Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntUY66EzQs1HWViU/XNbeAAlsc1Pg56omXE5aTE4KlU=;
 b=C5W0KQu6qQ2i80E+w0ciCYnsJ17KYCL/hTgMvNm2D77AjQWHs6i49WRu3tFxmBwh+S4PUyJGTTm4SbkeXV+tEFjc5ilMXRC46LdcBBB8uF9nrzZOOD9jS1QlqzTL+Zn2X+5fsp+zGrIJCmH/ZngawH4nSPIVnW2+hH6WucxzGj9s2xJEkCPS8dRvMKvll0akl4XDCkl2aobTOH8R+97ldQEyZehmfUEwMi39nydwP5diYMoub/0VcLm5eHQefnJdFZgc5vBWJ+4jpFT33MJeV6nYxSXZn24726oER2s9Eww4N9secBn5YphnbsNKpiDWxXUAzI7k73BSIURts49p6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntUY66EzQs1HWViU/XNbeAAlsc1Pg56omXE5aTE4KlU=;
 b=a6/IO6vDPjCLnbdhuK9+IKBvLaxBe0ufCWRxdKOgKaeqRXD4kUaAe0Vml94ZtoEL5ddqZRiBT3A/A2+SRUy8WaIC9lAt5GWTwVPVSb06eULIrmoU7ITS4hMyO+0lwhw4wDvScER7R9UiNIF40rwszWfTbDbWFcaF3g8zXaHJWbo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Volodymyr
 Babchuk" <volodymyr_babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v11.5 1/17] pci: msi: pass pdev to pci_enable_msi() function
Date: Wed, 20 Dec 2023 16:46:27 -0500
Message-ID: <20231220214628.431512-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231202012556.2012281-2-volodymyr_babchuk@epam.com>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com> <20231202012556.2012281-2-volodymyr_babchuk@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|LV2PR12MB6015:EE_
X-MS-Office365-Filtering-Correlation-Id: c447e5cd-f78c-46a1-86fd-08dc01a53539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	07b1ve4lf2y6eac5hHMkW3sriYM60eK50BRZrN0UAxaq04DIOm6o3s5EqLTJ5xMFBc6bl9SqnOL2rE9mW0lKoMFC/R7X3wX/U7C+5oLG247HyK6OI4/1HH3zk/3KpaF8iQwi3hq+g9mKb2mVXtx+7v2i0GsJZI0bh4On4kj2QVbJF+k9AR44PA7QkKSsVJkMps/Tya7TD8+ftCYeVPYTxLGmCK+k6Fgysw/A/hCwdSDilpmWOkEne3ifwKPNaBan2q5WDlabNkLsEbYugYtfinrLmLTH4rWPCu2AXp230VT7vq8f+i2XW9VNAUmBp391V7wtOdDIOqqL11JKUocja+X9C/hmj9u5wHUY/pgAYMx0v184Yi9vGGyyOdRdXwJHjfJxLv8MbY+pMqvXM7Qg5LDuMmzeNetDupmMeTioWihbeIDjq6lKnYcXZaR73a6Be/SVEDj4M4s2+jG8IpXQ7+STduVHaQpNJuc9jIjhmtYYVa/jExVlyaattW6WwXk20Cdq1jdcbL3Imdp4z7I2W3Gasf4oyw3P23085roU1lvTLFMFI5z+LOp0eOjBRtzRnwQBW74/ffFF0eYXGPTK+Cu8nJug5pJXfwfaJo+RM+bLuq43WwCsA+WcgO0ha2pIl0ca/G0GljlXr5eM7pcGoMmbZF35wKCK7EeKAevHlVeqFz94BNN3LuNfdbCWxbTQtiQPRPunaVlakqoYj6Kg5LHJ92RYqwMMGzeE9JeZXIYa5QrpSdEMVRLR5iJULpHggSAEg+EO+x57uy37XqIYCg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(82310400011)(46966006)(40470700004)(36840700001)(40460700003)(356005)(336012)(26005)(2616005)(426003)(1076003)(83380400001)(4326008)(36860700001)(47076005)(54906003)(5660300002)(41300700001)(478600001)(6666004)(8936002)(70586007)(2906002)(8676002)(6916009)(316002)(70206006)(82740400003)(81166007)(86362001)(36756003)(44832011)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 21:47:05.3337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c447e5cd-f78c-46a1-86fd-08dc01a53539
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6015

From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>

Previously pci_enable_msi() function obtained pdev pointer by itself,
but taking into account upcoming changes to PCI locking, it is better
when caller passes already acquired pdev pointer to the function,
because caller knows better how to obtain the pointer and which locks
are needed to be used. Also, in most cases caller already has pointer
to pdev, so we can avoid an extra list walk.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
In v11.5:
 - Add Stewart's S-o-b
 - Add Stefano's R-b
 - Drop unrelated change renaming msi_desc parameter to desc in
   pci_disable_msi() prototype
 - Use ternary operator in ns16550.c to avoid unnessary code churn

In v11:
 - Made pdev parameter very first in pci_enable_msi() and friends.
 - Extended the commit message
 - Added check for pdev into ns16550 driver
 - Replaced hard tabs with spaces

Changes in v10:

 - New in v10. This is the result of discussion in "vpci: add initial
 support for virtual PCI bus topology"
---
 xen/arch/x86/include/asm/msi.h |  3 ++-
 xen/arch/x86/irq.c             |  2 +-
 xen/arch/x86/msi.c             | 19 ++++++++++---------
 xen/drivers/char/ns16550.c     |  5 ++++-
 4 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index c1ece2786e01..997ccb87be0c 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -81,7 +81,8 @@ struct irq_desc;
 struct hw_interrupt_type;
 struct msi_desc;
 /* Helper functions */
-extern int pci_enable_msi(struct msi_info *msi, struct msi_desc **desc);
+extern int pci_enable_msi(struct pci_dev *pdev, struct msi_info *msi,
+                          struct msi_desc **desc);
 extern void pci_disable_msi(struct msi_desc *msi_desc);
 extern int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off);
 extern void pci_cleanup_msi(struct pci_dev *pdev);
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 6e668b1b4fe2..50e49e1a4b6f 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2176,7 +2176,7 @@ int map_domain_pirq(
         if ( !pdev )
             goto done;
 
-        ret = pci_enable_msi(msi, &msi_desc);
+        ret = pci_enable_msi(pdev, msi, &msi_desc);
         if ( ret )
         {
             if ( ret > 0 )
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 7f8e79425452..335c0868a225 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -983,13 +983,13 @@ static int msix_capability_init(struct pci_dev *dev,
  * irq or non-zero for otherwise.
  **/
 
-static int __pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
+static int __pci_enable_msi(struct pci_dev *pdev, struct msi_info *msi,
+                            struct msi_desc **desc)
 {
-    struct pci_dev *pdev;
     struct msi_desc *old_desc;
 
     ASSERT(pcidevs_locked());
-    pdev = pci_get_pdev(NULL, msi->sbdf);
+
     if ( !pdev )
         return -ENODEV;
 
@@ -1038,13 +1038,13 @@ static void __pci_disable_msi(struct msi_desc *entry)
  * of irqs available. Driver should use the returned value to re-send
  * its request.
  **/
-static int __pci_enable_msix(struct msi_info *msi, struct msi_desc **desc)
+static int __pci_enable_msix(struct pci_dev *pdev, struct msi_info *msi,
+                             struct msi_desc **desc)
 {
-    struct pci_dev *pdev;
     struct msi_desc *old_desc;
 
     ASSERT(pcidevs_locked());
-    pdev = pci_get_pdev(NULL, msi->sbdf);
+
     if ( !pdev || !pdev->msix )
         return -ENODEV;
 
@@ -1151,15 +1151,16 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off)
  * Notice: only construct the msi_desc
  * no change to irq_desc here, and the interrupt is masked
  */
-int pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
+int pci_enable_msi(struct pci_dev *pdev, struct msi_info *msi,
+                   struct msi_desc **desc)
 {
     ASSERT(pcidevs_locked());
 
     if ( !use_msi )
         return -EPERM;
 
-    return msi->table_base ? __pci_enable_msix(msi, desc) :
-                             __pci_enable_msi(msi, desc);
+    return msi->table_base ? __pci_enable_msix(pdev, msi, desc) :
+                             __pci_enable_msi(pdev, msi, desc);
 }
 
 /*
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index c8a51ed66008..52f2fe754c66 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -452,10 +452,13 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
             if ( rc > 0 )
             {
                 struct msi_desc *msi_desc = NULL;
+                struct pci_dev *pdev;
 
                 pcidevs_lock();
 
-                rc = pci_enable_msi(&msi, &msi_desc);
+                pdev = pci_get_pdev(NULL, msi.sbdf);
+                rc = pdev ? pci_enable_msi(pdev, &msi, &msi_desc) : -ENODEV;
+
                 if ( !rc )
                 {
                     struct irq_desc *desc = irq_to_desc(msi.irq);

base-commit: 913a1774168f82565bbdc7d41a46013a40ba302d
-- 
2.43.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD2E828F4E
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 22:54:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665048.1035254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNK3W-0003Vj-Se; Tue, 09 Jan 2024 21:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665048.1035254; Tue, 09 Jan 2024 21:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNK3W-0003T2-PY; Tue, 09 Jan 2024 21:54:42 +0000
Received: by outflank-mailman (input) for mailman id 665048;
 Tue, 09 Jan 2024 21:54:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ONpl=IT=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rNK3W-0003SZ-6e
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 21:54:42 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e88::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b023d02b-af39-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 22:54:40 +0100 (CET)
Received: from SJ0PR03CA0252.namprd03.prod.outlook.com (2603:10b6:a03:3a0::17)
 by SJ2PR12MB9190.namprd12.prod.outlook.com (2603:10b6:a03:554::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 21:54:34 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::ac) by SJ0PR03CA0252.outlook.office365.com
 (2603:10b6:a03:3a0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17 via Frontend
 Transport; Tue, 9 Jan 2024 21:54:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Tue, 9 Jan 2024 21:54:34 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 9 Jan
 2024 15:54:34 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 9 Jan 2024 15:54:27 -0600
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
X-Inumbo-ID: b023d02b-af39-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qc0BiCiCQS3BoatDQnZLjAwgeVo73gibk18ormyzrbMVHZESfBuByQwRULCkLskZIWw2kOVCGhLuL8sdFJCm1EcHkXPcwKS9HgeEIk1xuqpE+1CJ79Iq9wJQWMnjp2BVdOLHA5AlUDrlCjVfN2xbu9+icBg40CUC/cw4dDosWUXdDpeHMf6Pbv+g+k/pRKOtvZTncuG+/+iJxWEr4ZblfgfQv9LkfwKEWwg8HrHhC5fxhKYs9nD/LJ/snht6FX7JftNgxDoHpItEYFfGcbuRlQjjg+CrNT42oR+a4Mc5mWDm4TNbc9sAzwHk3fIUvPAz8hXVsY9olnmmaAjb+405ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXxqm2R+KG+DNPuVmoVRc8P1hQTGMm+S12P871URecc=;
 b=frVQVoanV4MZOE+xUTMmzl9dbSacIETz6QfHNacws+yhfzrZr4MXANupHYDKn3jLDCv9LcqmsnCKqaGdxBOxKjY+MzhZpDDlWTOfXL8zRMCmKg/Wp8mFhRazEfuZe+LIuyDd2V1F3QYZoSIl1NZxT7YqugQpPBu0bx3CQPVVPMtVDQYK1IuW3/AgXWQ64FuVcW53qOrWf6QzpHhmsidcpalEJlxU+63hAiYOSrSlFGF7+YoTQqAN5YRcQIGvcdh/HrcB4icHc3MOdTPT9ZQW+Si9WiykuntKjnDyeIyO1xF1pFV2BBXhYgAycizMLioZTPmSL6xFmplmSLBtIgYMWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXxqm2R+KG+DNPuVmoVRc8P1hQTGMm+S12P871URecc=;
 b=3EmUpLLbKy4CDmYgkHTU5CgcnTfSWmJT0U98lN9s//5/vWrZAFJbG15vOeDM3s4SP1pZcFWMh5QwW6uUXg1lqjVgieKJ+bzGo/QQiZJm6ttdDhsv4ibRE+hLEm9ADXBus3rcVFQLRlNpgqm/bIRpwofu97fh4FDFF7Xd6CbSjqc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Volodymyr
 Babchuk" <volodymyr_babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v12 12/15] xen/arm: translate virtual PCI bus topology for guests
Date: Tue, 9 Jan 2024 16:51:27 -0500
Message-ID: <20240109215145.430207-13-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109215145.430207-1-stewart.hildebrand@amd.com>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|SJ2PR12MB9190:EE_
X-MS-Office365-Filtering-Correlation-Id: d40471b3-af2f-4f68-767f-08dc115d916f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FoW/3jSMKiVHG0OLtejhEQLKvbkbVN5BcoHU/6kvYF14nS7GL1OjifUJil7VpSQGyr4tu5BUWB4rUzFEBZMXo06xw2k+8rn7WkzXaGjI2T42pHG9onvHZHGPhnA4rAYE8MuC7A3v5hEA/N0TPPUOWUUoqyFo2JTXVNhSQB23UnKP7hkFehYjw3e1Sc7e3so5DdmWq5rYDBlBE6cWCEllgYA/C5dntJoKEHRcrl8atCtvPjN9FLluOcFC9O/jEw56TteP2t9W8IL1Q7MJnbgWLnQKIuF+JMlJJoUl8nIgSvYURoAoSaDiRD7i89ExU2OFHLyKrfks4SXFQk07Oxi1JFkBX/igItNjIvxx2Am4wfykIeyZ2Fls5EolhhguW/ZoV4FlAkPDOm1fL4ipP/rIdlyP2tDm2Plb67xLpwRpDDO9tZzIcBAqMaHXl+BYkled4vKBjIB4KEm9XaqEp6NHNaIccrTsLbRzsLhJSUJl3JJQ57HjAh3aYBYOA6BqFoHRHCLBxQWqv2qkco0YWS97Lj0yOM8A6xmHHq35IhR7TkXExNSbv03W1ugZvwaSqK4Q90E81vJbJ704Tv0/tPIdnUtg3KJSn33W/DZUmXKMsFvYPQ1l8FbA9KwnMtwzMPHxlsmkBhqrIeWeOXL/l6esvpj0eaUrEzTOdAV9szMfS4Em1oJ5hR0QMcdsUleN6BlMGbyh9AFHqJlAxDMSZIOa8LvCCgVYpwLPUnDKdGhAbRQPcluK7b1k1/HD6ijDuNocORldzMmvBlBEwfLNhYvbfQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(376002)(346002)(230922051799003)(82310400011)(1800799012)(186009)(451199024)(64100799003)(46966006)(36840700001)(40470700004)(40480700001)(40460700003)(2906002)(478600001)(36860700001)(5660300002)(81166007)(4326008)(44832011)(356005)(41300700001)(8936002)(316002)(70206006)(70586007)(54906003)(36756003)(6916009)(2616005)(8676002)(86362001)(426003)(1076003)(26005)(336012)(83380400001)(47076005)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 21:54:34.8149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d40471b3-af2f-4f68-767f-08dc115d916f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9190

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

There are three  originators for the PCI configuration space access:
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
 xen/arch/arm/vpci.c     | 47 +++++++++++++++++++++++++++++++----------
 xen/drivers/vpci/vpci.c | 24 +++++++++++++++++++++
 xen/include/xen/vpci.h  | 12 +++++++++++
 3 files changed, 72 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 3bc4bb55082a..7a6a0017d132 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -7,31 +7,51 @@
 
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
+        read_lock(&d->pci_lock);
+        translated = vpci_translate_virtual_device(d, sbdf);
+        read_unlock(&d->pci_lock);
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
     /* data is needed to prevent a pointer cast on 32bit */
     unsigned long data;
 
+    ASSERT(!bridge == !is_hardware_domain(v->domain));
+
+    if ( !vpci_sbdf_from_gpa(v->domain, bridge, info->gpa, &sbdf) )
+    {
+        *r = ~0UL;
+        return 1;
+    }
+
     if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
                         1U << info->dabt.size, &data) )
     {
@@ -39,7 +59,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
         return 1;
     }
 
-    *r = ~0ul;
+    *r = ~0UL;
 
     return 0;
 }
@@ -48,7 +68,12 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
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
index 57cfabfd9ad3..6e2d428d691b 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -81,6 +81,30 @@ static int add_virtual_device(struct pci_dev *pdev)
     return 0;
 }
 
+/*
+ * Find the physical device which is mapped to the virtual device
+ * and translate virtual SBDF to the physical one.
+ */
+bool vpci_translate_virtual_device(const struct domain *d, pci_sbdf_t *sbdf)
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
+            return true;
+        }
+    }
+
+    return false;
+}
+
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
 
 void vpci_deassign_device(struct pci_dev *pdev)
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 053467f04982..3cfd9a401178 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -302,6 +302,18 @@ static inline bool __must_check vpci_process_pending(struct vcpu *v)
 }
 #endif
 
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+bool vpci_translate_virtual_device(const struct domain *d, pci_sbdf_t *sbdf);
+#else
+static inline bool vpci_translate_virtual_device(const struct domain *d,
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
2.43.0



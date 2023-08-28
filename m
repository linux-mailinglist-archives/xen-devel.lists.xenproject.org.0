Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3330E78B6F2
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 20:02:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591748.924244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qagZ1-0002M5-VL; Mon, 28 Aug 2023 18:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591748.924244; Mon, 28 Aug 2023 18:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qagZ1-0002Ji-Rg; Mon, 28 Aug 2023 18:02:11 +0000
Received: by outflank-mailman (input) for mailman id 591748;
 Mon, 28 Aug 2023 18:02:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+nU3=EN=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qagZ0-0002JG-Et
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 18:02:10 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e89::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0016af90-45cd-11ee-9b0c-b553b5be7939;
 Mon, 28 Aug 2023 20:02:08 +0200 (CEST)
Received: from CY5PR19CA0004.namprd19.prod.outlook.com (2603:10b6:930:15::22)
 by SJ2PR12MB8035.namprd12.prod.outlook.com (2603:10b6:a03:4d3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 18:02:03 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:930:15:cafe::c0) by CY5PR19CA0004.outlook.office365.com
 (2603:10b6:930:15::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34 via Frontend
 Transport; Mon, 28 Aug 2023 18:02:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Mon, 28 Aug 2023 18:02:02 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 13:02:01 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 28 Aug 2023 13:02:01 -0500
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
X-Inumbo-ID: 0016af90-45cd-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+oeHL8tmBcBPqE9HHzzRnVQCuTyOQv5/UOKzh4jwLrMAny6N++ge+0BTx5wp2EmuI4ptuyYFoj9g4UORm64aXri7/H26BA06wQN4+fOPwqLhKYyZIfuZ/WhsEtiHlJmlQsHV8vvJGD+vLnR+3I0O4odXIohFpwcZkW8jxDlUuO6R4R7SiKKtQ6tgEWt1zG8sACQdSrT2mKG+CzlEBeaI77gKtOnJw2e+iMrthk+qE7z1S4ccpPC1Ye08ZW+3l+FCnomZzjsR4Kh+Ul2V2rsRavwRowrJX8t6FaCDcNFgsCl1B1Me3gDCd1AjlMHVsK/+90JcHJxueFyzfseNqPMnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJvej4o/mElq6FjgO0ZWLPfwnQd61fY6nEWCZloj5OE=;
 b=hRDjo4vS7WZEvF5yj65zrXG3sH1VzPdDjAyyefoYIvbbK8Npl/BZA9KbxUW4BmjbQLDjnL2LwwUwPn/sZ0bVaVH3PAxInwbZwU+8KkxkcVRF3jANbN7jqZZrAunE7pjADXDtGjmDC7LAMirap/5jJIvEKO+KWHeaLM8rA/nYlGtMUC5vUgVILtccFm/Hr/vp2p+yeTZ2MCAlzaLlRO4jTkPgogsbnkdbk3h9GFIVaQPuvA4hp85ywhqHcvFIgcJ/swNj3gJN4CdfYb6toZ3GtV6J2XaOrF9AQMg2Iq9ZwtFR0gdb+yPAaFrp3kNKDasJQtvekEJhnOxlNuypmvGvow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJvej4o/mElq6FjgO0ZWLPfwnQd61fY6nEWCZloj5OE=;
 b=L0yNnOG6af+pbAIvZOfi9IcD7v6TBMDWETAzoT+LL0Ra2n+kdEnC9ED3AjeVwM7Ax0HgQpymYK4Td/DOnGz87yAMsD5zwsitCuJKwDQBFC7XkRXpOigaQ4eQ8AAcA5umcGBqj+2K7ejcvPXrCLYDusZoSMiLtxOt2k9OsMavzz0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 4/6] xen/vpci: header: status register handler
Date: Mon, 28 Aug 2023 13:56:52 -0400
Message-ID: <20230828175858.30780-5-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230828175858.30780-1-stewart.hildebrand@amd.com>
References: <20230828175858.30780-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|SJ2PR12MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d8a99c-88b4-4537-af11-08dba7f0e1f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/NrZaw/dF2KnJ1SojurgEW8oPSC3Jv/yQT107KcDCJpGRL4w5kFzNhIHpuVM/JOWNivAbhvUFHGslHVLXnmQ7ubJ7y048ywaSZQSYB0mOhPrMqm54c8JgrkZJOTwXeI/LEDywmtyXhs5ZJ1NO+MYAFqXoBLcb8pViuDtvmwmtULddavbz5pX3G5LiWkZH1UMDh1aeGnK0vBfX/qIINXqBfUuTnQWbi6nkDbXNkqgszmptAEX/l4WRf6GChFhcls9UyzgTYUHnzWy3uVz7Q613zNbTdmnQxP6AhymuleivcAiZo5pjCH7ULrmtDCfTEzU01+HP4cEofjPPXnOMYcxgp5wt2vUxK81OJ/3/r8MDJr8WwrzMzoVmhKJfnbABj/fHYsr+iWdh+V8L6oomJvIZujbub4GDt52k/gw9KRItlP+0aKRTCTQ8I2ZWjVcQuWmGgCg9C5Grw0l1hGmx6PRPt4jEbdcXEZCrW2PkrEdy8HhNbH7kVhFQ0y5434B5iTV0FU4/K3a9EujwGm9gRHrxlWve86x0C+wKwP7MZ5FKfCL+ga1JN5UwMDv4Kzl0JMWbWfX/5m2PyTxchvdV4rBRCAAh+zcElF/2QtEH4m+vUrKOB1Bo7Zrva5Ufi3hDugu/hXgBPeCTiMnzqjM17Os00PEiceHZ+cTxGtViqB8CYugXh2HtJEpqDEDyRCAjBMwqb+HGF2Yh2/wgMFpl5RpbtU2R/v47c3kgzGk0W9pqoJ6eRwBa46vrEo8CzBVgH4wOyye3UeZgWq5PjMaJ8vilNjHMjHoQTnOApWn1LmtsaA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(136003)(346002)(1800799009)(82310400011)(451199024)(186009)(46966006)(40470700004)(36840700001)(478600001)(83380400001)(81166007)(356005)(82740400003)(26005)(336012)(426003)(47076005)(36860700001)(1076003)(2616005)(40480700001)(66899024)(6666004)(86362001)(2906002)(44832011)(316002)(4326008)(6916009)(70206006)(5660300002)(8676002)(70586007)(41300700001)(8936002)(54906003)(36756003)(40460700003)(36900700001)(357404004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 18:02:02.6993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d8a99c-88b4-4537-af11-08dba7f0e1f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8035

Introduce a handler for the PCI status register, with ability to mask the
capabilities bit. The status register is write-1-to-clear, so introduce handling
for this type of register in vPCI.

The mask_cap_list flag will be set in a follow-on patch.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v3->v4:
* move mask_cap_list setting to the capabilities patch
* single pci_conf_read16 in status_read
* align mask_cap_list bitfield in struct vpci_header
* change to rw1c bit mask instead of treating whole register as rw1c
* drop subsystem prefix on renamed add_register function

v2->v3:
* new patch
---
 xen/drivers/vpci/header.c | 17 +++++++++++++++++
 xen/drivers/vpci/vpci.c   | 36 ++++++++++++++++++++++++++++--------
 xen/include/xen/vpci.h    |  9 +++++++++
 3 files changed, 54 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 767c1ba718d7..dc8c6a66770b 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -413,6 +413,18 @@ static void cf_check cmd_write(
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
 
+static uint32_t cf_check status_read(const struct pci_dev *pdev,
+                                     unsigned int reg, void *data)
+{
+    struct vpci_header *header = data;
+    uint32_t status = pci_conf_read16(pdev->sbdf, reg);
+
+    if ( header->mask_cap_list )
+        status &= ~PCI_STATUS_CAP_LIST;
+
+    return status;
+}
+
 static void cf_check bar_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
 {
@@ -544,6 +556,11 @@ static int cf_check init_bars(struct pci_dev *pdev)
     if ( rc )
         return rc;
 
+    rc = vpci_add_rw1c_register(pdev->vpci, status_read, vpci_hw_write16,
+                                PCI_STATUS, 2, header, 0xF900);
+    if ( rc )
+        return rc;
+
     if ( pdev->ignore_bars )
         return 0;
 
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 3bec9a4153da..8b26870a8a2b 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -29,6 +29,7 @@ struct vpci_register {
     unsigned int offset;
     void *private;
     struct list_head node;
+    uint32_t rw1c_mask;
 };
 
 #ifdef __XEN__
@@ -145,9 +146,15 @@ uint32_t cf_check vpci_hw_read32(
     return pci_conf_read32(pdev->sbdf, reg);
 }
 
-int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
-                      vpci_write_t *write_handler, unsigned int offset,
-                      unsigned int size, void *data)
+void cf_check vpci_hw_write16(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
+{
+    pci_conf_write16(pdev->sbdf, reg, val);
+}
+
+static int add_register(struct vpci *vpci, vpci_read_t *read_handler,
+                        vpci_write_t *write_handler, unsigned int offset,
+                        unsigned int size, void *data, uint32_t rw1c_mask)
 {
     struct list_head *prev;
     struct vpci_register *r;
@@ -167,6 +174,7 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
     r->size = size;
     r->offset = offset;
     r->private = data;
+    r->rw1c_mask = rw1c_mask;
 
     spin_lock(&vpci->lock);
 
@@ -193,6 +201,22 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
     return 0;
 }
 
+int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
+                      vpci_write_t *write_handler, unsigned int offset,
+                      unsigned int size, void *data)
+{
+    return add_register(vpci, read_handler, write_handler, offset, size, data,
+                        0);
+}
+
+int vpci_add_rw1c_register(struct vpci *vpci, vpci_read_t *read_handler,
+                           vpci_write_t *write_handler, unsigned int offset,
+                           unsigned int size, void *data, uint32_t rw1c_mask)
+{
+    return add_register(vpci, read_handler, write_handler, offset, size, data,
+                        rw1c_mask);
+}
+
 int vpci_remove_register(struct vpci *vpci, unsigned int offset,
                          unsigned int size)
 {
@@ -407,11 +431,6 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
 
 /*
  * Perform a maybe partial write to a register.
- *
- * Note that this will only work for simple registers, if Xen needs to
- * trap accesses to rw1c registers (like the status PCI header register)
- * the logic in vpci_write will have to be expanded in order to correctly
- * deal with them.
  */
 static void vpci_write_helper(const struct pci_dev *pdev,
                               const struct vpci_register *r, unsigned int size,
@@ -424,6 +443,7 @@ static void vpci_write_helper(const struct pci_dev *pdev,
         uint32_t val;
 
         val = r->read(pdev, r->offset, r->private);
+        val &= ~r->rw1c_mask;
         data = merge_result(val, data, size, offset);
     }
 
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 0b8a2a3c745b..51b1b06c2c71 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -37,6 +37,11 @@ int __must_check vpci_add_register(struct vpci *vpci,
                                    vpci_write_t *write_handler,
                                    unsigned int offset, unsigned int size,
                                    void *data);
+int __must_check vpci_add_rw1c_register(struct vpci *vpci,
+                                        vpci_read_t *read_handler,
+                                        vpci_write_t *write_handler,
+                                        unsigned int offset, unsigned int size,
+                                        void *data, uint32_t rw1c_mask);
 int __must_check vpci_remove_register(struct vpci *vpci, unsigned int offset,
                                       unsigned int size);
 
@@ -50,6 +55,8 @@ uint32_t cf_check vpci_hw_read16(
     const struct pci_dev *pdev, unsigned int reg, void *data);
 uint32_t cf_check vpci_hw_read32(
     const struct pci_dev *pdev, unsigned int reg, void *data);
+void cf_check vpci_hw_write16(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
 
 /*
  * Check for pending vPCI operations on this vcpu. Returns true if the vcpu
@@ -94,6 +101,8 @@ struct vpci {
          * upon to know whether BARs are mapped into the guest p2m.
          */
         bool bars_mapped      : 1;
+        /* Store whether to hide all capabilities from the guest. */
+        bool mask_cap_list    : 1;
         /* FIXME: currently there's no support for SR-IOV. */
     } header;
 
-- 
2.42.0



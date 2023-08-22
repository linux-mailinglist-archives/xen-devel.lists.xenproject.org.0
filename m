Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F289C783762
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 03:32:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588008.919440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYGFT-0003AF-PL; Tue, 22 Aug 2023 01:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588008.919440; Tue, 22 Aug 2023 01:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYGFT-00038Z-Jz; Tue, 22 Aug 2023 01:31:59 +0000
Received: by outflank-mailman (input) for mailman id 588008;
 Tue, 22 Aug 2023 01:31:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MiiM=EH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qYGFR-0000x4-Mj
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 01:31:57 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adc9c927-408b-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 03:31:55 +0200 (CEST)
Received: from MW4PR04CA0380.namprd04.prod.outlook.com (2603:10b6:303:81::25)
 by MW5PR12MB5682.namprd12.prod.outlook.com (2603:10b6:303:19f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 01:31:51 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::34) by MW4PR04CA0380.outlook.office365.com
 (2603:10b6:303:81::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 01:31:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 01:31:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 21 Aug
 2023 20:31:50 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 21 Aug 2023 20:31:48 -0500
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
X-Inumbo-ID: adc9c927-408b-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdZXYD8eMfHrczPHd31YEBi7lKuPsgOr3FP41IwcQy0BzruO/2uSriZhlxFxsmjRa4Gf98WObc26f3257uxPoio3mVKE8QGauEQkji/t3oTFJF/Dz1X6R1PfSr7Fq76i7ZF7gjfpzx+EcDB5K4/z1bgkTIMMOH8eCzhtgCfg2C+58BXhDQzV38KcprcL6wTByB7pFhWa0oI82uj9O0ICxw36CJNHMebf6eCJaBU/+ddTQsEJiVSd7SuYvHUHfI4h8Xark0ImEyIGf2PeGiIUMEJYoa4Ue8BrTMceY/uFJTkXdwypS1CA2W0RCXeYakjir44OwKwGHW1exwAH3wiXYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dly4to6LYqbONjIY1DEXYph5RrSOJfNV6FXB7NX/h0=;
 b=NdzxPmUDpLt66evvqFUNki/1AtbTSrz8tpXxlwM1ae+JolAHLhtvN7YD07UM2VGf9Z5sbAdMMDggUAXFyZK5yGIxDQcR2by+8Li7x8AGGrGIgIpeOHUKNRQvVhyIdaw/4mQJlH6GQqfiEWWUj3mK7cI655xIhFdBCyd08fHp/D+72NqSPP/Z+dJHuI0RmelxFkx8yu9NJkQzAOKt5c9jRqo2uxOD1/d9UMxcXj5omy6FldS//uFLLlSkpenKGArCFkAhAhTCU1FbcyXUjLVTov+5T2DJJCpGAJROfBwqQCEt75Ka4d1BJ8e1RctzkC9RyH1F78Oe5fAAKFMRIQaO3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dly4to6LYqbONjIY1DEXYph5RrSOJfNV6FXB7NX/h0=;
 b=UA5a6x8bMuVNwbTzR8Ijcn55KTqAVPzFY09kK7h/eQTb1kgwxU8FPY45X22nk841Q2sSpx16rLsK5TLI0c4mu6ywBTZ0pes3VXWEqDzu9DTscp2OK4b6CSRKwopxmY3zgHDA9OvR8vR9L3sygrdspHFvSIH2Vz5GW8HarDrBj7w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 3/4] xen/vpci: header: filter PCI capabilities
Date: Mon, 21 Aug 2023 21:29:51 -0400
Message-ID: <20230822012955.312930-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822012955.312930-1-stewart.hildebrand@amd.com>
References: <20230822012955.312930-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|MW5PR12MB5682:EE_
X-MS-Office365-Filtering-Correlation-Id: 597c7468-e19e-4d5a-3e7e-08dba2af8f4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qK/Rz00xXvTtSo3waVIr3BihBIYM3A7A5IA6RP+2d+ztn/vcUa69lcpnu5u5voG1wajIhGEyMCSQyi9W7rtV0RpwZsVRpa99+6UIPqtCgl9VblHanrAleL72cOfwjYw1nGgPgYU2F/f44BwJPDSPyzfZkfHzj/QzEtMcyvWTPttwi8M2gbPoD9cqvuXEGjVErDdE25lf01EwjGjIKxXWzEBjOeyc54B7D3a++P3/OMChezYqCRh7mDip4TskEAb9qMtF8uOGLFF41+1cHHybSY/fTWsiJ66bdUpIHlyxtyDiv8MGsoMNSFzjFDktN7mVlIRTqtTkKs16SlO7Mmo2wHH0ibtseemRpiduZ4ZfAc9D9qniatvM6z5yiqQgf2MREXNOYsFwfoUJ/HPYsic4eJDcQ6VePZp1ddEFKR+qbfME3SMmxct9mLZDkmTv03A9oIKNuzCS+1le160ITPiV6M+2AzZjdjsIcvpq9QUT2O/xauOMf43VzKzZ9c3R1QcHdDR+B8KCb5tkGS6XahGhuBe3jAH1ZR5S3warm1meBm701d2EyYKO+cJ2nFcFJdRvggmeC9UDoJ8tSigjYPl2bomAfSNpqcWo8AuXGHyFsfcXSMuX2yayg8lIZqkB/RGZvPk4jR0mwvLZzicYHBgD3whpfu2A7lAMNhekmjTjF1e8dle89agYWhj1zmntTffHDffWub8OGTMA5Ou15GHU0+fvRd1eMQHC2bOKFRmpJuydWXINZuMPSKgGnxncPYdIEzLtNXTOnjy0OUZ+eGMvrA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(376002)(396003)(82310400011)(451199024)(1800799009)(186009)(36840700001)(40470700004)(46966006)(2906002)(40480700001)(83380400001)(5660300002)(44832011)(336012)(426003)(26005)(86362001)(36860700001)(47076005)(8676002)(2616005)(8936002)(4326008)(70206006)(316002)(70586007)(6916009)(54906003)(478600001)(356005)(82740400003)(81166007)(6666004)(36756003)(41300700001)(40460700003)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 01:31:50.8806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 597c7468-e19e-4d5a-3e7e-08dba2af8f4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5682

Currently, Xen vPCI only supports virtualizing the MSI and MSI-X capabilities.
Hide all other PCI capabilities (including extended capabilities) from domUs for
now, even though there may be certain devices/drivers that depend on being able
to discover certain capabilities.

We parse the physical PCI capabilities linked list and add vPCI register
handlers for the next elements, inserting our own next value, thus presenting a
modified linked list to the domU.

Introduce helper functions vpci_hw_read8 and vpci_read_val. The vpci_read_val
helper function returns a fixed value, which may be used for RAZ registers, or
registers whose value doesn't change.

Introduce pci_find_next_cap_ttl() helper while adapting the logic from
pci_find_next_cap() to suit our needs, and implement the existing
pci_find_next_cap() in terms of the new helper.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v2->v3:
* get rid of > 0 in loop condition
* implement pci_find_next_cap in terms of new pci_find_next_cap_ttl function so
  that hypothetical future callers wouldn't be required to pass &ttl.
* change NULL to (void *)0 for RAZ value passed to vpci_read_val
* change type of ttl to unsigned int
* remember to mask off the low 2 bits of next in the initial loop iteration
* change return type of pci_find_next_cap and pci_find_next_cap_ttl
* avoid wrapping the PCI_STATUS_CAP_LIST condition by using ! instead of == 0

v1->v2:
* change type of ttl to int
* use switch statement instead of if/else
* adapt existing pci_find_next_cap helper instead of rolling our own
* pass ttl as in/out
* "pass through" the lower 2 bits of the next pointer
* squash helper functions into this patch to avoid transient dead code situation
* extended capabilities RAZ/WI
---
 xen/drivers/pci/pci.c     | 24 +++++++++-----
 xen/drivers/vpci/header.c | 69 +++++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c   | 12 +++++++
 xen/include/xen/pci.h     |  5 ++-
 xen/include/xen/vpci.h    |  5 +++
 5 files changed, 106 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/pci/pci.c b/xen/drivers/pci/pci.c
index 3bcb74040284..f60051694dc5 100644
--- a/xen/drivers/pci/pci.c
+++ b/xen/drivers/pci/pci.c
@@ -39,30 +39,38 @@ int pci_find_cap_offset(pci_sbdf_t sbdf, u8 cap)
     return 0;
 }
 
-int pci_find_next_cap(pci_sbdf_t sbdf, u8 pos, int cap)
+uint8_t pci_find_next_cap_ttl(pci_sbdf_t sbdf, uint8_t pos,
+                              bool (*is_match)(uint8_t), unsigned int *ttl)
 {
-    u8 id;
-    int ttl = 48;
+    uint8_t id;
 
-    while ( ttl-- )
+    while ( (*ttl)-- )
     {
         pos = pci_conf_read8(sbdf, pos);
         if ( pos < 0x40 )
             break;
 
-        pos &= ~3;
-        id = pci_conf_read8(sbdf, pos + PCI_CAP_LIST_ID);
+        id = pci_conf_read8(sbdf, (pos & ~3) + PCI_CAP_LIST_ID);
 
         if ( id == 0xff )
             break;
-        if ( id == cap )
+        if ( is_match(id) )
             return pos;
 
-        pos += PCI_CAP_LIST_NEXT;
+        pos = (pos & ~3) + PCI_CAP_LIST_NEXT;
     }
+
     return 0;
 }
 
+uint8_t pci_find_next_cap(pci_sbdf_t sbdf, uint8_t pos,
+                          bool (*is_match)(uint8_t))
+{
+    unsigned int ttl = 48;
+
+    return pci_find_next_cap_ttl(sbdf, pos, is_match, &ttl) & ~3;
+}
+
 /**
  * pci_find_ext_capability - Find an extended capability
  * @sbdf: PCI device to query
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 60f7049e3498..b531ab03cec1 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -513,6 +513,18 @@ static void cf_check rom_write(
         rom->addr = val & PCI_ROM_ADDRESS_MASK;
 }
 
+static bool cf_check vpci_cap_supported(uint8_t id)
+{
+    switch ( id )
+    {
+    case PCI_CAP_ID_MSI:
+    case PCI_CAP_ID_MSIX:
+        return true;
+    default:
+        return false;
+    }
+}
+
 static int cf_check init_bars(struct pci_dev *pdev)
 {
     uint16_t cmd;
@@ -544,6 +556,63 @@ static int cf_check init_bars(struct pci_dev *pdev)
     if ( rc )
         return rc;
 
+    if ( !is_hardware_domain(pdev->domain) )
+    {
+        if ( !(pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST) )
+        {
+            /* RAZ/WI */
+            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                                   PCI_CAPABILITY_LIST, 1, (void *)0);
+            if ( rc )
+                return rc;
+        }
+        else
+        {
+            /* Only expose capabilities to the guest that vPCI can handle. */
+            uint8_t next;
+            unsigned int ttl = 48;
+
+            next = pci_find_next_cap_ttl(pdev->sbdf, PCI_CAPABILITY_LIST,
+                                         vpci_cap_supported, &ttl);
+
+            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                                   PCI_CAPABILITY_LIST, 1,
+                                   (void *)(uintptr_t)next);
+            if ( rc )
+                return rc;
+
+            next &= ~3;
+
+            while ( next && ttl )
+            {
+                uint8_t pos = next;
+
+                next = pci_find_next_cap_ttl(pdev->sbdf,
+                                             pos + PCI_CAP_LIST_NEXT,
+                                             vpci_cap_supported, &ttl);
+
+                rc = vpci_add_register(pdev->vpci, vpci_hw_read8, NULL,
+                                       pos + PCI_CAP_LIST_ID, 1, NULL);
+                if ( rc )
+                    return rc;
+
+                rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                                       pos + PCI_CAP_LIST_NEXT, 1,
+                                       (void *)(uintptr_t)next);
+                if ( rc )
+                    return rc;
+
+                next &= ~3;
+            }
+        }
+
+        /* Extended capabilities RAZ/WI */
+        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL, 0x100, 4,
+                               (void *)0);
+        if ( rc )
+            return rc;
+    }
+
     if ( pdev->ignore_bars )
         return 0;
 
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index d73fa7630237..4a96aa50494d 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -133,6 +133,18 @@ static void cf_check vpci_ignored_write(
 {
 }
 
+uint32_t cf_check vpci_read_val(
+    const struct pci_dev *pdev, unsigned int reg, void *data)
+{
+    return (uintptr_t)data;
+}
+
+uint32_t cf_check vpci_hw_read8(
+    const struct pci_dev *pdev, unsigned int reg, void *data)
+{
+    return pci_conf_read8(pdev->sbdf, reg);
+}
+
 uint32_t cf_check vpci_hw_read16(
     const struct pci_dev *pdev, unsigned int reg, void *data)
 {
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 8a482b15745c..b30034ecccba 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -194,7 +194,10 @@ int pci_mmcfg_read(unsigned int seg, unsigned int bus,
 int pci_mmcfg_write(unsigned int seg, unsigned int bus,
                     unsigned int devfn, int reg, int len, u32 value);
 int pci_find_cap_offset(pci_sbdf_t sbdf, u8 cap);
-int pci_find_next_cap(pci_sbdf_t sbdf, u8 pos, int cap);
+uint8_t pci_find_next_cap_ttl(pci_sbdf_t sbdf, uint8_t pos,
+                              bool (*is_match)(uint8_t), unsigned int *ttl);
+uint8_t pci_find_next_cap(pci_sbdf_t sbdf, uint8_t pos,
+                          bool (*is_match)(uint8_t));
 int pci_find_ext_capability(pci_sbdf_t sbdf, int cap);
 int pci_find_next_ext_capability(pci_sbdf_t sbdf, int start, int cap);
 const char *parse_pci(const char *, unsigned int *seg, unsigned int *bus,
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 0b8a2a3c745b..17fd252746ec 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -45,7 +45,12 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size);
 void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
                 uint32_t data);
 
+uint32_t cf_check vpci_read_val(
+    const struct pci_dev *pdev, unsigned int reg, void *data);
+
 /* Passthrough handlers. */
+uint32_t cf_check vpci_hw_read8(
+    const struct pci_dev *pdev, unsigned int reg, void *data);
 uint32_t cf_check vpci_hw_read16(
     const struct pci_dev *pdev, unsigned int reg, void *data);
 uint32_t cf_check vpci_hw_read32(
-- 
2.41.0



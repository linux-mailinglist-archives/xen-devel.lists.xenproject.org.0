Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A532777E90C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 20:51:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584853.915719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWLcE-00059t-6T; Wed, 16 Aug 2023 18:51:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584853.915719; Wed, 16 Aug 2023 18:51:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWLcE-00057h-3m; Wed, 16 Aug 2023 18:51:34 +0000
Received: by outflank-mailman (input) for mailman id 584853;
 Wed, 16 Aug 2023 18:51:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5U+O=EB=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qWLcC-000576-Qi
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 18:51:32 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e83::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e96a47ee-3c65-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 20:51:31 +0200 (CEST)
Received: from SA0PR12CA0027.namprd12.prod.outlook.com (2603:10b6:806:6f::32)
 by IA0PR12MB8228.namprd12.prod.outlook.com (2603:10b6:208:402::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 18:51:27 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:806:6f:cafe::4d) by SA0PR12CA0027.outlook.office365.com
 (2603:10b6:806:6f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Wed, 16 Aug 2023 18:51:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Wed, 16 Aug 2023 18:51:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 13:51:26 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 13:51:24 -0500
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
X-Inumbo-ID: e96a47ee-3c65-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmAVue0Ok/5WWQwftJ6oj9S0Rj5kD3QStAR6bkXsuBJzpKg/Tsm8EbU+e2FkTbwW42UvJ4bxWKgBYxzdG5B5gcQ4Vn5Ht8TxJxqjzZospW1fS9ufAzSUy0RQIs5MEZFOIQB3U7/seC9TM8DQMHIodSNnYZY0OL/2DUyMdFDdJvvo/yXZ2gC+Cse+h9Ad2gE1uKYYYN3QGWNCY62NsTEZjIMKBgr+s+hPHFOSaauGUatUuQEsvptYPcXvVZjPo9W4IC52/f4uY5oiJrDzvG6tfzZds9ZdV4El3vNvqda6YCfqrylCGt9V0QoQFXsPvyD2hgvlcQ95Jb58OfkPPVkFxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ql0jXnI4Ipxpt1/ru8/r0InDW4bpinHGzCTrC/z1SG0=;
 b=kcrVplmUAMCD/9USH/wN48mIbdaoNkiyM1iy5dDbmaMgw7tjHQVGTpv0O3CEioMgZ65HgrWHyv3Ax/qMnZ/C+ALgnX9bUdeCAm+ndz8UGDtM4l/6J94EcEufR2JVdILitEcWh4aw5aYOMNPXd30XFCeJ1NTaKtpdgZ4IvCRckRq3pyfQS4P4fJM9no/2JL7D2SkDJDka44C2xg3m+SWEUPYoMUPeVGjrkiCV9hqjXSSeyjEeDRZjbI1i/uBL0/FJ6eQO+2n/zCMhkxW2G2au03r2Yjn2tRBQXXIk8/JtdK1ImWZCGjeLYmIo9++/5dLTO1g1+0jRomtwYsMDyrxxTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ql0jXnI4Ipxpt1/ru8/r0InDW4bpinHGzCTrC/z1SG0=;
 b=q4DjQN0KHKbVMExxviZK4YbXiPqO1m1TmJTAmHtuC9DIGdBWYUR2hAL62RwWOjkRzp04UbPeO47l0+1/x4s2Plhc3+Gjet3GOCsa0mHV/kJdhh4hQZzwFE2maZSlZ8nOzHlVBYRRUHGPbDNVz0aeSxuy0FZFzd2ViMz8ZGSKj7c=
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
Subject: [PATCH v2 1/2] xen/vpci: header: filter PCI capabilities
Date: Wed, 16 Aug 2023 14:50:28 -0400
Message-ID: <20230816185035.82994-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816185035.82994-1-stewart.hildebrand@amd.com>
References: <20230816185035.82994-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|IA0PR12MB8228:EE_
X-MS-Office365-Filtering-Correlation-Id: e5f36781-430f-4155-16b9-08db9e89cbaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mI8ir1tV92IwWvqhi3F8PB11XQVcsMhYFtEzMioeqyq++l5b3uwcFM2BhS5LBg+8XhrMkrIGSMTw1MZMedEBGM20pm3jhJP2h9dtHLKpOCwnXVMfE70tBMzRTB58qI8hctw52+bZ8NEuUg2zlXOUjyBGSfVCK3EwaLxy6LqB10P/M26tI+ByKhfA+Wk2Rci1PsG1iPylysxIxMx7BxOCaQodT5GxhB/IxgUorXpedbo+BhILPr3g5oBYmp1MSolEzNnaQ3WxQMG5chhqsbrr2ofRpIUssY9UDFdL1DwZiRc6QBmzerghCaPi30iS8Qi3yxh9xAOUu0tOo4DKyHIUZPB0p7r7QT1GXa0ZRestdN2BpGVvqk7mKfBdiTi00DxV+kPfP6ja62+mYOMeF3SjwkckDrJFDdf6w+PeMpjmaDTxeG07AY+uJHbVvlswh+/sfOUXUGy/XY+PlTPeFU6N23INE8JXgqG2urptHgNEvHPH8YpVLCyvIH6WIQPttXpDQ/dLCSbP/uIu7Jv3KV10qkFH9s405mJVDkdy0Y3vh895lwivI3AjO2IQF0zhkzgcoX++CyXmf2cxlY+NEAseIl+XWeVM9FBxOgVV6PxHWNsez2CJhrj6UuRrGGIeYTwwSkzQ9F1YjBjIuK6dWxoKRLIglSo5Qb8KOmqTphOsZhudjSuY9sJSybDG3pzRq2KkHUhLX9C4cnOjw2jhNbao59mRj0AAwJ5oR67f+UeNr3ESqC3BSDsgmYr/vGo6VfRraeWd2chZetpBKCYEET4aeA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(39860400002)(376002)(1800799009)(451199024)(82310400011)(186009)(40470700004)(36840700001)(46966006)(2906002)(40460700003)(83380400001)(86362001)(40480700001)(478600001)(426003)(336012)(36756003)(2616005)(1076003)(26005)(966005)(44832011)(5660300002)(36860700001)(41300700001)(356005)(54906003)(82740400003)(316002)(81166007)(70206006)(70586007)(6916009)(8676002)(8936002)(4326008)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 18:51:26.7389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f36781-430f-4155-16b9-08db9e89cbaf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8228

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

Adapt pci_find_next_cap() to suit our needs, which has no existing callers.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
If there are no capabilities to be exposed to the guest, a future status
register handler likely would want to mask the PCI_STATUS_CAP_LIST bit. See [1]
for a suggestion of how this might be tracked in struct vpci_header.

RFC: I'm not a fan of the (void *)(uintptr_t) cast for passing a value to
     vpci_read_val, but without the cast, the only alternative I could think of
     would be to introduce a new memory allocation. See the next patch for an
     example of what this might look like.

v1->v2:
* change type of ttl to int
* use switch statement instead of if/else
* adapt existing pci_find_next_cap helper instead of rolling our own
* pass ttl as in/out
* "pass through" the lower 2 bits of the next pointer
* squash helper functions into this patch to avoid transient dead code situation
* extended capabilities RAZ/WI

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg01173.html
---
 xen/drivers/pci/pci.c     | 18 +++++------
 xen/drivers/vpci/header.c | 66 +++++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c   | 12 +++++++
 xen/include/xen/pci.h     |  3 +-
 xen/include/xen/vpci.h    |  5 +++
 5 files changed, 94 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/pci/pci.c b/xen/drivers/pci/pci.c
index e411876a1518..fbebbe4a872a 100644
--- a/xen/drivers/pci/pci.c
+++ b/xen/drivers/pci/pci.c
@@ -39,27 +39,27 @@ int pci_find_cap_offset(u16 seg, u8 bus, u8 dev, u8 func, u8 cap)
     return 0;
 }
 
-int pci_find_next_cap(u16 seg, u8 bus, unsigned int devfn, u8 pos, int cap)
+int pci_find_next_cap(pci_sbdf_t sbdf, uint8_t pos, bool (*is_match)(uint8_t),
+                      int *ttl)
 {
-    u8 id;
-    int ttl = 48;
+    uint8_t id;
 
-    while ( ttl-- )
+    while ( (*ttl)-- > 0 )
     {
-        pos = pci_conf_read8(PCI_SBDF(seg, bus, devfn), pos);
+        pos = pci_conf_read8(sbdf, pos);
         if ( pos < 0x40 )
             break;
 
-        pos &= ~3;
-        id = pci_conf_read8(PCI_SBDF(seg, bus, devfn), pos + PCI_CAP_LIST_ID);
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
 
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 60f7049e3498..ec5947300198 100644
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
@@ -544,6 +556,60 @@ static int cf_check init_bars(struct pci_dev *pdev)
     if ( rc )
         return rc;
 
+    if ( !is_hardware_domain(pdev->domain) )
+    {
+        if ( (pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST)
+             == 0 )
+        {
+            /* RAZ/WI */
+            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                                   PCI_CAPABILITY_LIST, 1, NULL);
+            if ( rc )
+                return rc;
+        }
+        else
+        {
+            /* Only expose capabilities to the guest that vPCI can handle. */
+            uint8_t next;
+            int ttl = 48;
+
+            next = pci_find_next_cap(pdev->sbdf, PCI_CAPABILITY_LIST,
+                                     vpci_cap_supported, &ttl);
+
+            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                                   PCI_CAPABILITY_LIST, 1,
+                                   (void *)(uintptr_t)next);
+            if ( rc )
+                return rc;
+
+            while ( next && (ttl > 0) )
+            {
+                uint8_t pos = next;
+
+                next = pci_find_next_cap(pdev->sbdf, pos + PCI_CAP_LIST_NEXT,
+                                         vpci_cap_supported, &ttl);
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
+        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL, 0x100, 4, NULL);
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
index 5975ca2f3032..57792282108b 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -194,7 +194,8 @@ int pci_mmcfg_read(unsigned int seg, unsigned int bus,
 int pci_mmcfg_write(unsigned int seg, unsigned int bus,
                     unsigned int devfn, int reg, int len, u32 value);
 int pci_find_cap_offset(u16 seg, u8 bus, u8 dev, u8 func, u8 cap);
-int pci_find_next_cap(u16 seg, u8 bus, unsigned int devfn, u8 pos, int cap);
+int pci_find_next_cap(pci_sbdf_t sbdf, uint8_t pos, bool (*is_match)(uint8_t),
+                      int *ttl);
 int pci_find_ext_capability(int seg, int bus, int devfn, int cap);
 int pci_find_next_ext_capability(int seg, int bus, int devfn, int pos, int cap);
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



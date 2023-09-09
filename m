Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF027995EF
	for <lists+xen-devel@lfdr.de>; Sat,  9 Sep 2023 04:20:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598359.933107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qenZZ-00050h-Au; Sat, 09 Sep 2023 02:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598359.933107; Sat, 09 Sep 2023 02:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qenZZ-0004xR-7W; Sat, 09 Sep 2023 02:19:45 +0000
Received: by outflank-mailman (input) for mailman id 598359;
 Sat, 09 Sep 2023 02:19:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vbb/=EZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qenZX-0003dU-Nm
 for xen-devel@lists.xenproject.org; Sat, 09 Sep 2023 02:19:43 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20611.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55653dd0-4eb7-11ee-9b0d-b553b5be7939;
 Sat, 09 Sep 2023 04:19:41 +0200 (CEST)
Received: from CY8PR10CA0038.namprd10.prod.outlook.com (2603:10b6:930:4b::22)
 by SN7PR12MB7154.namprd12.prod.outlook.com (2603:10b6:806:2a5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Sat, 9 Sep
 2023 02:19:36 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:930:4b:cafe::3e) by CY8PR10CA0038.outlook.office365.com
 (2603:10b6:930:4b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31 via Frontend
 Transport; Sat, 9 Sep 2023 02:19:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.147) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Sat, 9 Sep 2023 02:19:35 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 21:19:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 19:19:34 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 8 Sep 2023 21:19:32 -0500
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
X-Inumbo-ID: 55653dd0-4eb7-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nL4DFepLL3YE6S8Wk9tHfklVXFEh2uQVmsbkyTj5dzoWR4gz2zPlOTKsR+vlNe5xEo78SrZokWTNg5k8AXn7zNt1UJG3/TSLyNiOR3NxmJ4HkJaZwNUt/YDC3EAKVXrX1KgEI1JQeejiQKHkgRxIHVu2eRIMmj1Xw7t4D1tAo33uXSmuZ69622+Xp//yUJMwumCTAeqG9rZFxON7JBY4PwoqHrQ6O1zrojAqDKRhfBAJYqUtwPblpRZDDTQ7lHiBUlu35kTPzZExbM7tcXvjCD5UzB1a2kalUdFf8EvAJyhorVSRbDFDZtPK4ftL0uHDsklfCjRGojGnBOeE28+naQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zynH6bdtDF71r3QmVXE6saNFjB3y2Dk04pLrBIKZUo=;
 b=YphjmFHxkkbw/8JiIALcVSUBJnONs8Qvk/Q73xUrATUeb2hRTJ7cCzd/aJL7RnrOyWvSLZZI2vuUxsRSZWtdY+v4K1WC5SdrPukITgLzigpTAhjHtmXaVtLcf+TsoFEDdLS3lCAEjRV/ZtnSZy/K4KHycYv4JySOp9IPmEsCQn7OE0Iac1OMMoZlbEnqRFE7jtboKcsM4ytq22qVpFq+tXJxm/0QZD3zLSDW77mPM00P7ZispRRnSiSkLgoSEPeM2qG5RrhRTGAfhaA6FnarDpZFcTcGTzNhXHhJTmvteg0OLnH/56eJawRRKt6nYDqHmy5xQONpeXrMoUTnrdqUJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zynH6bdtDF71r3QmVXE6saNFjB3y2Dk04pLrBIKZUo=;
 b=bM59Z4c9KfTluoSEFF1C5Kshj69blI52M9PWFMia4qJ6R333Vw0R2OQSZc9KH28jzuQwguMq5k/Pe7AWHicT6RtMUD/BCkq07X7fNzSjbgv2rN0gj/EwcNXY0DQOrNlUCSYafAkIzSD9ymqiWEG6ZJnsUOg5zbyVCYI4RWaXRNE=
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
Subject: [PATCH v6 4/4] xen/vpci: header: filter PCI capabilities
Date: Fri, 8 Sep 2023 22:16:28 -0400
Message-ID: <20230909021647.558115-5-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230909021647.558115-1-stewart.hildebrand@amd.com>
References: <20230909021647.558115-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|SN7PR12MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: f662380b-b764-4ffb-750d-08dbb0db3623
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fm6Q4N4vJEHipoxwyR9mDAqE7NklxyXjGWFPOUcXEUlKvVSEp+HAh+B4Neo5DmItDrBSZx/9sM4gNnr9ywLetQ85W9yyMvO2dXyY6Z0iTt9lWfI9vybuzZdyMxYrH0zO3TEGXtSeIVtRvDd1LnU7weVGajxGw3QpII8pMmuGFf++qIUBHRAASazWB1Q+lOXXEk/x/OI+qfAy4Gx8V7n71gtJ0R3w2vI0PSoiGdhGTofDorMp8zR0/OrZzDEj+ihM0Hn77CjIxb9bWeNiaWZLNw7YeIDARxL/UirNx1HeF/ek0ilDNK1sBe9iW5oHeOh2oTmVfLLkl0jXGM3HxD+auz7LVeCiecl73TageyOVZ+8AohG9H1wG0Nwn6gdthUPraVA/fsQS7cTCxSxAX3jm9tFhpOPUo0VUnpqFueje75Jgx3jmFS5y9lkqh/FFy8SSVEarrtMQl28sS7iJp/6whx08fVOOQcecvuUmiNAOXBqCLB7WG7xdONkbyyCQKuSmoK6tf1Y0NNJMph7JIYAZ/3ADVa944rww8QqcsDxrLyHu8Wbp81jVC1geoF4GAhgXL5G5nUv/ycD+L/OW2Rtp11XcVPUHZLBsl2n63XFiy1FRdPJ1K+U2SLwiSohiygMU3yBtwR6fQ3qocT2Gowiht8WpGHrf5ZysJQXFXC1hCwps7cJIoB5GowgftxvOvpofOZHCCEX2dkGmJ4jtihQVm6iX6ynayyS9Jwo/8GqJE5hWx0KKoHIuXAfxlk+ZD1jteVgiJMlXzp3JK7XPLTFFpw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(346002)(39860400002)(82310400011)(186009)(451199024)(1800799009)(46966006)(40470700004)(36840700001)(36756003)(40460700003)(2906002)(47076005)(426003)(83380400001)(336012)(1076003)(54906003)(316002)(2616005)(6916009)(70206006)(36860700001)(4326008)(70586007)(8936002)(478600001)(8676002)(44832011)(5660300002)(81166007)(82740400003)(6666004)(356005)(26005)(86362001)(40480700001)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2023 02:19:35.4583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f662380b-b764-4ffb-750d-08dbb0db3623
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7154

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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v5->v6:
* add register handlers before status register handler in init_bars()
* s/header->mask_cap_list/mask_cap_list/

v4->v5:
* use more appropriate types, continued
* get rid of unnecessary hook function
* add Jan's R-b

v3->v4:
* move mask_cap_list setting to this patch
* leave pci_find_next_cap signature alone
* use more appropriate types

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
 xen/drivers/pci/pci.c     | 26 +++++++++-----
 xen/drivers/vpci/header.c | 76 +++++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c   | 12 +++++++
 xen/include/xen/pci.h     |  3 ++
 xen/include/xen/vpci.h    |  5 +++
 5 files changed, 113 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/pci/pci.c b/xen/drivers/pci/pci.c
index 3569ccb24e9e..8799d60c2156 100644
--- a/xen/drivers/pci/pci.c
+++ b/xen/drivers/pci/pci.c
@@ -39,31 +39,39 @@ unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap)
     return 0;
 }
 
-unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
-                               unsigned int cap)
+unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
+                                   bool (*is_match)(unsigned int),
+                                   unsigned int cap, unsigned int *ttl)
 {
-    u8 id;
-    int ttl = 48;
+    unsigned int id;
 
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
+        if ( (is_match && is_match(id)) || (!is_match && id == cap) )
             return pos;
 
-        pos += PCI_CAP_LIST_NEXT;
+        pos = (pos & ~3) + PCI_CAP_LIST_NEXT;
     }
+
     return 0;
 }
 
+unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
+                               unsigned int cap)
+{
+    unsigned int ttl = 48;
+
+    return pci_find_next_cap_ttl(sbdf, pos, NULL, cap, &ttl) & ~3;
+}
+
 /**
  * pci_find_ext_capability - Find an extended capability
  * @sbdf: PCI device to query
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 99dcf57678a8..118dd5d4535d 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -513,6 +513,18 @@ static void cf_check rom_write(
         rom->addr = val & PCI_ROM_ADDRESS_MASK;
 }
 
+static bool cf_check vpci_cap_supported(unsigned int id)
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
@@ -545,6 +557,70 @@ static int cf_check init_bars(struct pci_dev *pdev)
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
+            unsigned int next, ttl = 48;
+
+            next = pci_find_next_cap_ttl(pdev->sbdf, PCI_CAPABILITY_LIST,
+                                         vpci_cap_supported, 0, &ttl);
+
+            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                                   PCI_CAPABILITY_LIST, 1,
+                                   (void *)(uintptr_t)next);
+            if ( rc )
+                return rc;
+
+            next &= ~3;
+
+            if ( !next )
+                /*
+                 * If we don't have any supported capabilities to expose to the
+                 * guest, mask the PCI_STATUS_CAP_LIST bit in the status
+                 * register.
+                 */
+                mask_cap_list = true;
+
+            while ( next && ttl )
+            {
+                unsigned int pos = next;
+
+                next = pci_find_next_cap_ttl(pdev->sbdf,
+                                             pos + PCI_CAP_LIST_NEXT,
+                                             vpci_cap_supported, 0, &ttl);
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
     /*
      * If mask_cap_list is true, PCI_STATUS_CAP_LIST will be set in both
      * rsvdz_mask and ro_mask, and thus will effectively behave as rsvdp
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 586c6057365b..433b9b3ebbb1 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -136,6 +136,18 @@ static void cf_check vpci_ignored_write(
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
index ea6a4c9abf38..cceac8654f07 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -194,6 +194,9 @@ int pci_mmcfg_read(unsigned int seg, unsigned int bus,
 int pci_mmcfg_write(unsigned int seg, unsigned int bus,
                     unsigned int devfn, int reg, int len, u32 value);
 unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap);
+unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
+                                   bool (*is_match)(unsigned int),
+                                   unsigned int cap, unsigned int *ttl);
 unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
                                unsigned int cap);
 unsigned int pci_find_ext_capability(pci_sbdf_t sbdf, unsigned int cap);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 7a5cca29e54c..b79efc49bad6 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -51,7 +51,12 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size);
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
2.42.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B30178B6F5
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 20:03:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591759.924264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaga1-0003an-IH; Mon, 28 Aug 2023 18:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591759.924264; Mon, 28 Aug 2023 18:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaga1-0003XZ-EJ; Mon, 28 Aug 2023 18:03:13 +0000
Received: by outflank-mailman (input) for mailman id 591759;
 Mon, 28 Aug 2023 18:03:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+nU3=EN=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qaga0-0001uT-78
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 18:03:12 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e89::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25a821a8-45cd-11ee-8783-cb3800f73035;
 Mon, 28 Aug 2023 20:03:11 +0200 (CEST)
Received: from DS7PR07CA0009.namprd07.prod.outlook.com (2603:10b6:5:3af::9) by
 CH2PR12MB4150.namprd12.prod.outlook.com (2603:10b6:610:a6::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.34; Mon, 28 Aug 2023 18:03:07 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2603:10b6:5:3af:cafe::6e) by DS7PR07CA0009.outlook.office365.com
 (2603:10b6:5:3af::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34 via Frontend
 Transport; Mon, 28 Aug 2023 18:03:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.82) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Mon, 28 Aug 2023 18:03:06 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 13:03:06 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 28 Aug 2023 13:03:04 -0500
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
X-Inumbo-ID: 25a821a8-45cd-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3j3mDpZ+44P5WurDfQPTSg/9v2DhCjRDzrWZXqgBavo5CoT5rDjJDw/dIpEax+2K7npOaIdxZH9XLHE7gcGP/SACWlYwadxl9qu+ji9Qon+1sST9xDtSaevbEGT0+p61X6AOKsYOV200up/102Z1AExlh3e6YPQ+CeU5wuwpXD2bU78qYZePloYupb8WlKwor+ueoy+qiaVTeKH7ZHIBKt1c+MrV8xECGEz0/1zvOlRsvUPALlqsJ7El2YNmUyclaZoFP7j5dOF9vm50hDC04Yg4AfHJPhBPVLPExDVHYQCaEpwih6j2UdV+b8a0DoP2T3nam/zs6TaprCpQltGCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnedCK7tAR44q7lO/DURZyKyOiN3g7ouC9lxG2A93XY=;
 b=HfekPXyKQ9Q2vdzSprVvMA4zyqPdsgii78OnbnZquisUjd+bnowolII1pI7hAXJwH/iRDpmq7lROJNWwh9ZXHFKJke9dc07nTnIel0rqCAeHCGj6W27Rr/Liiueg0llaNMfvDFkPPNuVvksjUoaWda6BhXKh79XyOXq6eHKN/jFS7HLxhiHbGK1jKsN89T9PI8UDjjKBNRHINtZlqtNDK3RlF+kk3KNPxxbc/3AGY+i0SYqXXPdnUKlKqJPrxZC9zanVK1uF4ucIwJ4lcY4ogwh0i6pjeTzNk0eheUU4pqln94Oxwnt9+SWItfwycDd2manNKK4yeAfBspAwHPP5kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnedCK7tAR44q7lO/DURZyKyOiN3g7ouC9lxG2A93XY=;
 b=R7oS/llCM9SDdqAtvA26ZbveqDiGLmdsLHhfJ7nAvbob31JEOxv4ptBxZ7kEpDmDGlwSQ2h0zawaQTG+Jfg2I1Ugxf2Bl4OExQyk2UTz19nbLcnYIAFyhQpnXXA1iFLtqAadDdYsEUTVBZCaD3ihB9L/q7cY72GSI6cCBbsHj2Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 6/6] xen/vpci: header: filter PCI capabilities
Date: Mon, 28 Aug 2023 13:56:54 -0400
Message-ID: <20230828175858.30780-7-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230828175858.30780-1-stewart.hildebrand@amd.com>
References: <20230828175858.30780-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|CH2PR12MB4150:EE_
X-MS-Office365-Filtering-Correlation-Id: df6e9dd2-e2e0-4344-4a0c-08dba7f10835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/CsJmoMb0Yx7fnezMLF9P+lYZXAa4K1VJR0YeOq/qAUHiqG+RPrSUDwC8kSVTRuEMreYjWtlQk5v4G27nLsErutuJJBL03bT4k6Hyl7QEa7XMy1y/TfKdbMpYupYjNR7P/AYy1l/xMSWzxAWb5VRQICOLUSeujinZUEdkKuDmoqTdgxSL/Tiuo+2W0XQiel38naKijXwLaY3qi7XVUlvNLgoHLPLUbogBeogywXaDJIp8362hyW38wiXuGATDTDzgx0lvgRBNJDZlkWTbOrA28DHdjD9NkvW+mtWEK5Tn7ZgghH9RVQSprKuKylxMBQUQnrdjsvVstNakYk52djaqVLLgvI5KjoCcQYI+gBFcj4snTP/LPjIycVwmrrl4oXqotnlpD8BhFVgJcCgn8gu02fkVAKjX1eaCwV0RaZTIrG+ggKXbEhlrUX9vEOVBAI2hjZVDxRB/Na9NVrioKZEOInhoNv6gkY7qeyw/QOFWiH7JXT/GtAbrx/aigvSMrr9Q1FN00ZG1hTy6zFJNlMPS/YLsCTdVRx30XadEiWUiMrCxRpWmj7PdlQnY0+g2UUVaFtlPOMNmXGraDi7/2YjdMlyrNYuzR3MsPgPe/zOyk84/roFodlHb8Xn1sb7GVYeT8Pkp1fqPy9NA1u6HlDFvc8n5BLv7QniO45A2G/M426ZfqnFQfHZx4qnp5+3hP3Y3g1J+vdnvHC+hsCzjMYRxtQqc6aLl3vCRSfG862saWKwedQ0gLdoFANCf8fa6j0bo0VF6f1R/8JfM77A6e7Dxw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199024)(1800799009)(186009)(82310400011)(46966006)(36840700001)(40470700004)(82740400003)(6666004)(40460700003)(36756003)(86362001)(81166007)(356005)(40480700001)(36860700001)(47076005)(1076003)(478600001)(2906002)(336012)(426003)(26005)(83380400001)(70586007)(70206006)(41300700001)(8676002)(4326008)(8936002)(44832011)(5660300002)(2616005)(6916009)(316002)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 18:03:06.8630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df6e9dd2-e2e0-4344-4a0c-08dba7f10835
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4150

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
 xen/drivers/pci/pci.c     | 31 +++++++++++-----
 xen/drivers/vpci/header.c | 77 +++++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c   | 12 ++++++
 xen/include/xen/pci.h     |  3 ++
 xen/include/xen/vpci.h    |  5 +++
 5 files changed, 119 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/pci/pci.c b/xen/drivers/pci/pci.c
index 3569ccb24e9e..733e5e028908 100644
--- a/xen/drivers/pci/pci.c
+++ b/xen/drivers/pci/pci.c
@@ -39,31 +39,44 @@ unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap)
     return 0;
 }
 
-unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
-                               unsigned int cap)
+unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
+                                   bool (*is_match)(unsigned int, unsigned int),
+                                   unsigned int userdata, unsigned int *ttl)
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
+        if ( is_match(id, userdata) )
             return pos;
 
-        pos += PCI_CAP_LIST_NEXT;
+        pos = (pos & ~3) + PCI_CAP_LIST_NEXT;
     }
+
     return 0;
 }
 
+static bool cf_check is_cap_match(unsigned int id1, unsigned int id2)
+{
+    return id1 == id2;
+}
+
+unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
+                               unsigned int cap)
+{
+    unsigned int ttl = 48;
+
+    return pci_find_next_cap_ttl(sbdf, pos, is_cap_match, cap, &ttl) & ~3;
+}
+
 /**
  * pci_find_ext_capability - Find an extended capability
  * @sbdf: PCI device to query
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 4a4dbb69ab1c..919addbfa630 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -525,6 +525,18 @@ static void cf_check rom_write(
         rom->addr = val & PCI_ROM_ADDRESS_MASK;
 }
 
+static bool cf_check vpci_cap_supported(unsigned int id1, unsigned int id2)
+{
+    switch ( id1 )
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
@@ -561,6 +573,71 @@ static int cf_check init_bars(struct pci_dev *pdev)
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
+                header->mask_cap_list = true;
+
+            while ( next && ttl )
+            {
+                uint8_t pos = next;
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
     if ( pdev->ignore_bars )
         return 0;
 
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 2a67cc516626..25567005d66f 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -135,6 +135,18 @@ static void cf_check vpci_ignored_write(
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
index ea6a4c9abf38..50ca2f40acda 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -194,6 +194,9 @@ int pci_mmcfg_read(unsigned int seg, unsigned int bus,
 int pci_mmcfg_write(unsigned int seg, unsigned int bus,
                     unsigned int devfn, int reg, int len, u32 value);
 unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap);
+unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
+                                   bool (*is_match)(unsigned int, unsigned int),
+                                   unsigned int userdata, unsigned int *ttl);
 unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
                                unsigned int cap);
 unsigned int pci_find_ext_capability(pci_sbdf_t sbdf, unsigned int cap);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index b0636182d91e..a63f2ca8ed56 100644
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



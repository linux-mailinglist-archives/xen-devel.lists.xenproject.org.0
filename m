Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A168379EB3D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 16:37:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601466.937468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgQzr-00028x-I0; Wed, 13 Sep 2023 14:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601466.937468; Wed, 13 Sep 2023 14:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgQzr-00026T-Dt; Wed, 13 Sep 2023 14:37:39 +0000
Received: by outflank-mailman (input) for mailman id 601466;
 Wed, 13 Sep 2023 14:37:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eUH4=E5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qgQzq-000263-Cu
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 14:37:38 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e88::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1418a764-5243-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 16:37:36 +0200 (CEST)
Received: from CY8PR22CA0014.namprd22.prod.outlook.com (2603:10b6:930:45::23)
 by DS0PR12MB6462.namprd12.prod.outlook.com (2603:10b6:8:c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Wed, 13 Sep
 2023 14:37:31 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:930:45:cafe::61) by CY8PR22CA0014.outlook.office365.com
 (2603:10b6:930:45::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19 via Frontend
 Transport; Wed, 13 Sep 2023 14:37:31 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Wed, 13 Sep 2023 14:37:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 13 Sep
 2023 09:37:30 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 13 Sep
 2023 09:37:30 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 13 Sep 2023 09:37:29 -0500
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
X-Inumbo-ID: 1418a764-5243-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hj2t+1vQx/qNthka0P5ykbpKORbIlNBY2SVHQ1bNQn4DauMAJZsikebLFq4Mj28HkR5vqxnm01PkQg9+sxatkoyYFExMT5EtDq+Yc+AlpQoaPr+tj/XSbALRrinCz9ZlX0xUmLuKYqSvY2mzO9bDs8s8Niu2eBznCDbxJW4EpKa61/pt1naVhZtaQ8/2iEpJJuw/3FqdDsOjJa5iDq7xu7NONId97P/XuV3GxC0qp4wMrfmnnaP55NUSWZE67LdmVpip9OzV3yJGwRdwXbyzsqEY5OwtvbpKfigcaibbCbDUm3ybSlHqSs7ZhcnQVwZXLsHHEwzCJ3bMAiasMwAvig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrhRapVOmwIwx7xDQq+6O9s3+XB1BZg/+wc7w4AyuHI=;
 b=hf9lHjZk++rHx95aOVy4/8j85iyGJ1MFGxhW7Qwoj9GtX58xh0jCa0+cD4vzBj9+R8F/yIPgR/88U03j1C6Fh3PwXB64tGbD3X69NZM1mLGOYy5VbdS68VaS+KGY/SiNbSFC8YNlWVjvOQ7j2uTER+4cgv40BXHqMyMusjtUuZseMnvgOEI2B7fikEB6HKVZMORG942gt5RwplqfqoVPhWrc83cN5HMBamgWJknuf1rfl4t1oKhcKPsDpBOClokiwhW3NO27K6+Kg0vSC2uQlPhBapI0CFQfZehMn/33e/j+1ebSDS44je43FGEChuroxc0pXrnijju8WerXmNdhGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrhRapVOmwIwx7xDQq+6O9s3+XB1BZg/+wc7w4AyuHI=;
 b=XHmbNBdPXOAWbQjGkcBa0rztMK6pLZAGwZ4YyN8IIq2YCSaeXn0UKSd8bbDlV1wKOsjuUrDc8Y3ibcGYtTwDdOP5lCS1LYhNOpae64AtLgmxBgW152jfS1z6qHSWVP1iJ4ui6sUsLUJzJnrPYGg9OMDb4ltRUZnj5ua471aHN5s=
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
Subject: [PATCH v7 2/2] xen/vpci: header: filter PCI capabilities
Date: Wed, 13 Sep 2023 10:35:47 -0400
Message-ID: <20230913143550.14565-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230913143550.14565-1-stewart.hildebrand@amd.com>
References: <20230913143550.14565-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|DS0PR12MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: 62e4bd03-0863-4e68-c1bf-08dbb466f63c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iNHo7AJCh5QnkKbu6aeUccwqv2injv3gJyX8Fr3m45+Bk6/OS19cOewR9kLjM5k9kDkOENYxLLHmlouq+sbbuNtVSd9tjCph8a+HlkMULj9Ksw1L6B+Z9KC29yxUldXB59eHZLy5dP/iTcT14MluaCneD1x0o95mS/56I1TCC1EqtL7SYERxjdT/y8ToBsDDqtaXifTdybeRqt8qUcZMyDU5b1abCZYHbbcY+VHc5f40nOXHqYawCXb8unV49bFuaJVi3JywEUBr2piYcMas75SS3Mpa9mgrHJiwWzThCUrep+4UxEIHzBr4N5R1DRs0rC8AfIbqg6xlNoJ+pj3AOHucfrqCp2GS/V0dFPKbvqyRKD91WvdCgbYpvXsu74ye4K7Ic0TllH67wFr3UNi8MlAqBRAHX6GxfjLM0XtRpVQDVwHYIR20h8hRyzno4DutUS/6Kwtk3mG223KAQaKSq4hneSfgzLLtQyIBqQSW7w4Z6+YwdVauHNgT2tovih9zlc1gUleh+6hMZFLW5X5kwG/OoR4z84SkIeX3P4wgJB7fE4jCrNVVvATJESz/hiJILjeCmfXQ200im/1mGo6vLSPka/FOdzI0gYnKGNigUNBV+wG6pUnF/ykAiIhnoRKsrnBO1DXt/zZEJalloO5vIjG6XiqfteUZQ90oakTDTRZ8211R1cTphpgie9oiFsNH6Mmsj8vSMpRqd/EEvvKvQ4Ma53BRcpD/zLaartcABbJqaKz3LFzzzARgpOn/yizS64+SQm4jqm7+dPzCrYJi6A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199024)(82310400011)(186009)(1800799009)(36840700001)(46966006)(40470700004)(5660300002)(70206006)(81166007)(356005)(6666004)(2906002)(47076005)(36756003)(86362001)(82740400003)(40480700001)(336012)(2616005)(36860700001)(1076003)(26005)(426003)(478600001)(70586007)(83380400001)(44832011)(40460700003)(4326008)(8676002)(8936002)(41300700001)(6916009)(54906003)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 14:37:31.2960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e4bd03-0863-4e68-c1bf-08dbb466f63c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6462

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
v6->v7:
* no change

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
index af267b75ac31..1e7dfe668ccf 100644
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
      * Utilize rsvdz_mask to hide PCI_STATUS_CAP_LIST from the guest for now. If
      * support for rsvdp (reserved & preserved) is added in the future, the
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index b4cde7db1b3f..e3b866aaf7a4 100644
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
index 251b8761a8e9..db927eeaeef2 100644
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



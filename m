Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F111B78F7F0
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 07:15:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594357.927689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwUj-0001Iz-LA; Fri, 01 Sep 2023 05:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594357.927689; Fri, 01 Sep 2023 05:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwUj-0001GT-GZ; Fri, 01 Sep 2023 05:14:57 +0000
Received: by outflank-mailman (input) for mailman id 594357;
 Fri, 01 Sep 2023 05:14:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=am4h=ER=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qbwUi-0001GN-03
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 05:14:56 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c2335fe-4886-11ee-8783-cb3800f73035;
 Fri, 01 Sep 2023 07:14:54 +0200 (CEST)
Received: from MW4PR04CA0348.namprd04.prod.outlook.com (2603:10b6:303:8a::23)
 by CH0PR12MB5188.namprd12.prod.outlook.com (2603:10b6:610:bb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Fri, 1 Sep
 2023 05:14:48 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:303:8a:cafe::7a) by MW4PR04CA0348.outlook.office365.com
 (2603:10b6:303:8a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.25 via Frontend
 Transport; Fri, 1 Sep 2023 05:14:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.2 via Frontend Transport; Fri, 1 Sep 2023 05:14:47 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Sep
 2023 00:14:47 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 1 Sep 2023 00:14:45 -0500
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
X-Inumbo-ID: 7c2335fe-4886-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YdY06kseYzjerhRqBZ9zVe8f8CFXvHIuLjWaFPOdwwGDjmMHLy8ZUg8Vp7p3hAeb6uEgn0uzg2kvbGNmMCMCnRd7oUIF/g/bhmNs+cES2ubqyxnFFqSkiVIFAiMFbNz86ii4vB+Sq9eSHc1TGS3/26rF1+NR/kKfi+FbZEio6afyXvreGBwxWInI1/LAtnSQH02o1fodIFqQtoJZ8l/4zkMUxUTuhEW2jCT01NxTtAvGsjyy0XKF8y4Y/Gvaml/7cCmDykrXjNyhyz6nwdKyQK5F8/obDKMvjnMkWozlrRs+OWqFRzdrtcqJkbldXCNgyPv1jUc63LHS0+U1ZGQEfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWgrFE1PFgTCu8cgThjyBQIC11fyPr/WMl8soFJau04=;
 b=FQDOdkseF2A6nt3vS3PI/GTkpz1Dxp8hxd7th1V1cqdduLt39NhQeIJ8+knPy4f2gNe84Er+ICFMCLWlejbqum9Y8hBYvq1j4X9Ch0N63HDIhnElplTQ76HqZvOhkPTCVUNsHzjg77kSEnlNiTRj4+0EI4qb98O4WJm2/rn+Tie87yWSpgvIuH8vlEGfsdxWmzOZj9v8b48PDfQyF7OFKpra5O+Dr/2PmMVAuyMvGQg6kIs/ZhrJwe0t3jAspDT46j4gUeta0sC4Een6+eWO6ZHQoldesso9k5V9mSBdC69B1T/7wnVq98efzWyOnrIK1mz3J6AeshvnyPkCwVjuxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWgrFE1PFgTCu8cgThjyBQIC11fyPr/WMl8soFJau04=;
 b=J6kdAQjeqLkS7bHW636KUKc3VGkFdw7mFfj0QvoBuiVOu9fFCcoLx+HLHiNjJVL7MTVC2axIPLDCGg//Kt1HKBda6dWgFg2Rz/yx/cnAA/AisHmvP++p+Qg4/gFWr+RI10BW8x/p8Ve3vOB7vZHdrSUYqx9Odh4gI58XQmd0bUA=
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
Subject: [PATCH v5 5/5] xen/vpci: header: filter PCI capabilities
Date: Fri, 1 Sep 2023 01:13:53 -0400
Message-ID: <20230901051357.236049-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230901045742.235975-1-stewart.hildebrand@amd.com>
References: <20230901045742.235975-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|CH0PR12MB5188:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a342d2c-33ef-41eb-8b07-08dbaaaa5ccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zQif1+PdSaApbuz2d6GvtRDV5Z6CZ8zj2tvIicfZfaAmSiMWZ/X/VWqVVxu9HcB+SNs5uETERwCd0TLpS6eMdgNaIW4QCqjxBsm90BlT/ZVf5POP3no0Ln86cKs4w/k2hSjShOyLWI5oF/up9b8Yael6E+S1PnW6b/HlGeSas1prQvLMSJcsC/5OCBc0E2M9w2Wi9JHV+Gv0fQPW6dRGH1sU+paGtCcluR9FixbUuMUdhv21EGRo0zE1L/EQXy/MqOeCDVR6vGYM+DhdsWaLwYQ9ZdbDoliseDcr1j9l7t5xcjly1V81iDyQwxRXXsXnUaFtwzyENZ8we2n1C5Fmy/8VdQ4To5xHmWMuwu/ZwCsW9qhWic/Ne12S6e27HQ/AgYa7Ax/NNSWZWuzRTewTOjI18A6LHlerCu3nUNsG5fyikd22XPRviY3smdMbHMH5uEhSiLeVdhEWszkwYz+Gv/LADDWoiaFyK1c5pa7fjcYbJowEEIKcmWMCYgnaYm6gDHtSpNV3AnJSyC0I/2al8b/QrZAW7i0wvxNDjUA8Y7RnQ4WizuImJJll/M1FduXrXz3ppwzguC0hx9qBpQM/CU4gucDYaa2s9I1RTyIIkzn/u3ZxyiFjQtdZa+XHW6EVTCFkRSIvKi7KANvbbCHRtYvNDa85bYBJkvG5h7XcZOq+Gsc5ff/LlqdRvj/+Jwx0BMUJhGhwZbCNoWxAPWnan/sjUi+kSWpLZJsIlgGMX4B1rJv+arhw2TIabPj0pohvYv6/Yonz6/GoeFvCrHIX7w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(39860400002)(346002)(82310400011)(451199024)(186009)(1800799009)(36840700001)(46966006)(40470700004)(6666004)(36860700001)(82740400003)(356005)(40480700001)(83380400001)(81166007)(478600001)(47076005)(54906003)(316002)(41300700001)(70206006)(70586007)(86362001)(40460700003)(2906002)(5660300002)(426003)(6916009)(36756003)(336012)(2616005)(1076003)(44832011)(26005)(8676002)(8936002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 05:14:47.9631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a342d2c-33ef-41eb-8b07-08dbaaaa5ccd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5188

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
index 791791e6c9b6..f7d02a7f7bfa 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -525,6 +525,18 @@ static void cf_check rom_write(
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
@@ -562,6 +574,70 @@ static int cf_check init_bars(struct pci_dev *pdev)
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
+                header->mask_cap_list = true;
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
     if ( pdev->ignore_bars )
         return 0;
 
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 6e6ad4b80a0d..94cbae312abe 100644
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
index 0a6c9e19b399..866bbf656e2b 100644
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



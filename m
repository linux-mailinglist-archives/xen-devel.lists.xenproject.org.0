Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DE77FC464
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 20:45:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643449.1003694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8417-0005sZ-4q; Tue, 28 Nov 2023 19:45:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643449.1003694; Tue, 28 Nov 2023 19:45:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8417-0005q9-16; Tue, 28 Nov 2023 19:45:09 +0000
Received: by outflank-mailman (input) for mailman id 643449;
 Tue, 28 Nov 2023 19:45:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FWLy=HJ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r8415-0005Sf-PM
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 19:45:07 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a123b2d4-8e26-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 20:45:06 +0100 (CET)
Received: from CH2PR19CA0022.namprd19.prod.outlook.com (2603:10b6:610:4d::32)
 by SJ0PR12MB7007.namprd12.prod.outlook.com (2603:10b6:a03:486::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Tue, 28 Nov
 2023 19:45:03 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::2a) by CH2PR19CA0022.outlook.office365.com
 (2603:10b6:610:4d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29 via Frontend
 Transport; Tue, 28 Nov 2023 19:45:02 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Tue, 28 Nov 2023 19:45:02 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 28 Nov
 2023 13:45:02 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 28 Nov
 2023 13:45:02 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 28 Nov 2023 13:45:00 -0600
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
X-Inumbo-ID: a123b2d4-8e26-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9jJx0U7xUyCSBPuALz5j967Lp373WB0YsmwFLTmzOmqyQh794WHFRGlSjhMhkU7YSZ/+TAqjFiM0LtUTbSlCFUVg0c0VxNWTvqUgr7sVN41gcJVglwB55m+nFyigXi+Spgceokl9SRBKlO8uJepZZG5CzlFSCcZ9E+Jg0/2vJbSaGPRReNoSitt5LiK08Jje2WQSAgmzIpw1vzGjOT4ojnZ63VqlXUoW+1upIsFm8JRNudyPickS66UdevVh+5PoNb9WdxcPKBhsiqdQGLQbmrfJUnEeCsrgVK2Ue2qteGnBUyUOO2GLk1lVD/Rv9WLS8uWWw79wLPG6KXGG0aogQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T17tiKHmcbaQx3dRFOfzBGEbQzMo3quHzHjXP9wNTwk=;
 b=VKDvhmO4UVOdtYsu8re6rQGDCwBhqBVHx2YxZL3HldV9Y0w0T3QhPRKRwpnxklHQ0c6aqcvOneMYBIYhOJN1PvPjPXZdd07LFB1xv4QJ0PIKvmU30ceaF3bn9m45CWrO6st+tykg6Bxevcw8gp890w1qYrq+o2Wc7U7GV4oiYTT1yKX1nNjzPHb2mbG7PX8LhzJRhuptve4F7hYQ+6fopocAxmb2epCbAisaEf9Pkf+ypIsRziosHX33bOPLyfEUiThRIhYR/XPPqga6waSQqBr2ua0DmXJSRAIQpMUF7gCLMW1gZras2ewQqzyDj7Irt5qv0IjAOzBpRVv8J1ilYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T17tiKHmcbaQx3dRFOfzBGEbQzMo3quHzHjXP9wNTwk=;
 b=SjAtIes9axaG2EefjIYUpgRa4m9SB12cfbFXXWTj8vNRgkSRODlKd8sSBygIDbVtVzxh/vlg5YRnuKwciSeLcKDnGCEm3yREF0Joq+zpna0nEmf5mDNa/RwOchlWGeZf73vzt8kLMWCXBJGnS7h+5D+/u6rA5z+CxfRcJiPd3V8=
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
Subject: [PATCH v8 2/2] xen/vpci: header: filter PCI capabilities
Date: Tue, 28 Nov 2023 14:44:25 -0500
Message-ID: <20231128194427.2513249-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231128194427.2513249-1-stewart.hildebrand@amd.com>
References: <20231128194427.2513249-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|SJ0PR12MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: aceae3dc-5184-454e-3b0a-08dbf04a838d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	++Fu4rSkApoRGpEGKYPrHWeaYJC4I0D9zLdQ3mGNNzmalc9MbuzpLTMp62yNtO8sUNhokCRWVJv2etb4AG48OKbPHYTJt65jYjQkrl+I6RQL4B+pICK71ORLrgWhGoJn8SnSPxW3Qycij5A2DgAZtuLWWGLuTtkhVY9aT14IlGf9Udsk4b2x527ty+Y+5v8y6SgYlF6u7rkUoTbPCrJDSawVNw+/+nbgK+jJki/u7sppq0B2cFAwuMd8Q5Gn9m1LrKSHfD191KruqEpRUMB7phuLfodJz1Zincovl8/fXeomsXXjo9+KsIg+eYuOzYDhxTZmWNBdi2uI5/bFceLkXD/2lBMrQ7IgoDyVWVjQucU6tSBWCCvc+IGbZT9ejOcRfmVhEGfqyl0NfKH/BufJiUPxJDQ4baB2Nude6SJy2trjI6/zZx8ZviClqYC+QlSEFE1sVR2lNLsakc3oltcQowjp+7IL4JgUir+Rbf1S0APr4mNUT3UDyam1BvFC5Vqzb1Y5oVDgslxVABB5cosCelELRx0S55XtIupch5sn80DdS2g8nY4T+ekYNQAvZbZ0WqyskhNf3IFfb4hH8XCa+Mez1oe5UALkvtuCOekCpdH4f6/ClXOyuvgFQJZTeBXfZwLZvDcfvebDmS0EzVBxq3I2qGcSL0Yo05E99xHfMwoFlESOq3/So8bLRv5onGVoWTWC/JYyqi1Us5j5riLBt+9gTrQaABO1RUz0Tqv731mOpPYeLoxEwWKVhGcMheE7vj1XY3SIjNrQfLUcrkOf0w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(82310400011)(1800799012)(186009)(64100799003)(451199024)(40470700004)(46966006)(36840700001)(2906002)(40480700001)(5660300002)(40460700003)(44832011)(36860700001)(6666004)(478600001)(8676002)(8936002)(41300700001)(4326008)(36756003)(81166007)(356005)(82740400003)(426003)(336012)(47076005)(2616005)(83380400001)(6916009)(86362001)(70206006)(70586007)(54906003)(316002)(1076003)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 19:45:02.7749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aceae3dc-5184-454e-3b0a-08dbf04a838d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7007

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
v7->v8:
* use to array instead of match function
* include lib.h for ARRAY_SIZE
* don't emulate PCI_CAPABILITY_LIST register if PCI_STATUS_CAP_LIST bit is not
  set in hardware
* spell out RAZ/WI acronym
* dropped R-b tag since the patch has changed moderately since the last rev

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
 xen/drivers/pci/pci.c     | 31 ++++++++++++-------
 xen/drivers/vpci/header.c | 63 +++++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c   | 12 ++++++++
 xen/include/xen/pci.h     |  3 ++
 xen/include/xen/vpci.h    |  5 ++++
 5 files changed, 104 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/pci/pci.c b/xen/drivers/pci/pci.c
index 3569ccb24e9e..1645b3118220 100644
--- a/xen/drivers/pci/pci.c
+++ b/xen/drivers/pci/pci.c
@@ -39,31 +39,42 @@ unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap)
     return 0;
 }
 
-unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
-                               unsigned int cap)
+unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
+                                   unsigned int *cap, unsigned int n,
+                                   unsigned int *ttl)
 {
-    u8 id;
-    int ttl = 48;
+    unsigned int id, i;
 
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
-            return pos;
+        for ( i = 0; i < n; i++ )
+        {
+            if ( id == cap[i] )
+                return pos;
+        }
 
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
+    return pci_find_next_cap_ttl(sbdf, pos, &cap, 1, &ttl) & ~3;
+}
+
 /**
  * pci_find_ext_capability - Find an extended capability
  * @sbdf: PCI device to query
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 351318121e48..d7dc0c82a6ba 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -18,6 +18,7 @@
  */
 
 #include <xen/iocap.h>
+#include <xen/lib.h>
 #include <xen/sched.h>
 #include <xen/softirq.h>
 #include <xen/vpci.h>
@@ -545,6 +546,68 @@ static int cf_check init_bars(struct pci_dev *pdev)
     if ( rc )
         return rc;
 
+    if ( !is_hardware_domain(pdev->domain) )
+    {
+        if ( pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST )
+        {
+            /* Only expose capabilities to the guest that vPCI can handle. */
+            unsigned int next, ttl = 48;
+            unsigned int supported_caps[] = {
+                PCI_CAP_ID_MSI,
+                PCI_CAP_ID_MSIX,
+            };
+
+            next = pci_find_next_cap_ttl(pdev->sbdf, PCI_CAPABILITY_LIST,
+                                         supported_caps,
+                                         ARRAY_SIZE(supported_caps), &ttl);
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
+                                             supported_caps,
+                                             ARRAY_SIZE(supported_caps), &ttl);
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
+        /* Extended capabilities read as zero, write ignore */
+        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL, 0x100, 4,
+                               (void *)0);
+        if ( rc )
+            return rc;
+    }
+
     /* Utilize rsvdp_mask to hide PCI_STATUS_CAP_LIST from the guest. */
     rc = vpci_add_register_mask(pdev->vpci, vpci_hw_read16, vpci_hw_write16,
                                 PCI_STATUS, 2, NULL,
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 96187b70141b..99307e310bbb 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -137,6 +137,18 @@ static void cf_check vpci_ignored_write(
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
index 50d7dfb2a2fd..b2dcef01a1cf 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -205,6 +205,9 @@ int pci_mmcfg_read(unsigned int seg, unsigned int bus,
 int pci_mmcfg_write(unsigned int seg, unsigned int bus,
                     unsigned int devfn, int reg, int len, u32 value);
 unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap);
+unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
+                                   unsigned int *cap, unsigned int n,
+                                   unsigned int *ttl);
 unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
                                unsigned int cap);
 unsigned int pci_find_ext_capability(pci_sbdf_t sbdf, unsigned int cap);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 8e8e42372ec1..3c14a74d6255 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -52,7 +52,12 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size);
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
2.43.0



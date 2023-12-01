Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 996D3800EC6
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 16:47:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645610.1007818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r95is-0006DF-AF; Fri, 01 Dec 2023 15:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645610.1007818; Fri, 01 Dec 2023 15:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r95is-0006B3-6w; Fri, 01 Dec 2023 15:46:34 +0000
Received: by outflank-mailman (input) for mailman id 645610;
 Fri, 01 Dec 2023 15:46:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qhld=HM=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r95iq-0005mO-MK
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 15:46:32 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e88::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb527ef3-9060-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 16:46:30 +0100 (CET)
Received: from MN2PR02CA0036.namprd02.prod.outlook.com (2603:10b6:208:fc::49)
 by BN9PR12MB5384.namprd12.prod.outlook.com (2603:10b6:408:105::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 15:46:27 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:208:fc:cafe::b6) by MN2PR02CA0036.outlook.office365.com
 (2603:10b6:208:fc::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23 via Frontend
 Transport; Fri, 1 Dec 2023 15:46:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Fri, 1 Dec 2023 15:46:26 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 1 Dec
 2023 09:46:26 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 1 Dec
 2023 09:46:25 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 1 Dec 2023 09:46:24 -0600
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
X-Inumbo-ID: cb527ef3-9060-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0KOgS8egHPfQTV2UewXgY9J722V3x2i/YZ/SIfwAj71rVe4aiZyO1h5INdI9mufKiJSjpeuE3GhFMcVVED83i/yuDO18eVa5glxXPUTB7Wz/krScCjqi+jN9h7UJg7gp9DsoqhCUoWVUFrlqdGN6wKv10rpo/Dn8qyu8mI4KhlPrCv9P8bdoBMGTQ+ztjyi5TnVo2DReRl6MDSfmKNdsmJ0DvLY/q0bZyJ227vl63jocBRp9QFYy3Y+S++1fyC1EjuWJpxmDUpo9ysC97k5a0SDqAmDyx7F5etNdFfrs5xGI7pFFtSbGp6NhNY7UT+FbAsSUKq6ZFYpk1Oy5SSuCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rDW8TKwJYFddUpSjwpZw1tdKMfC4BlAOpTAFnwuQrg=;
 b=lU6MqkdtNQHGGCknJFmO1YYskMfyr5rrd0KomhbcmYfHh5PwZNOMGR5ZGMNX6sTPP/QDAHzVrrgDxlSQ1qedeXDJRAsu0yVE78OIQ7ElKA5oXc5MTIUgUVW2L+Sh9QNEyR2ZxXy9VgSDsBPWz2KTOSZ85JPh8gO+JkZmCvCecAPLLx8ZBHAiBo3cCmx4e4WBTXbHSBqjtIp11smujjz3blUoUZcOTDJE+227bu/PNcChL36uF67hKNPubYNy6JvwYSCzbVdvuXoNEPH9wJQsECfKO0JSdwig5UAdfzWn+tUcaSGPf/3qpfWVF8QIe8cC56oj4EmpA7AtSlwNYMFxPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rDW8TKwJYFddUpSjwpZw1tdKMfC4BlAOpTAFnwuQrg=;
 b=eiy+8h3r995brPcv9YOni6X5chbk5TbOmO8sJPTdlOhRb1acRQdNkP8+EE3RR1JiQ7hAxnp5Fki6/O4N1okVBzOC4lSUOXBPSq0rHs7eGymb5IUcNNcBMETf5prrops05d5Qvjm375kEXbEhXaOSG9d2OUmTOrnsEXQaAMLd6oE=
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
Subject: [PATCH v9 2/2] xen/vpci: header: filter PCI capabilities
Date: Fri, 1 Dec 2023 10:45:50 -0500
Message-ID: <20231201154552.3066321-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231201154552.3066321-1-stewart.hildebrand@amd.com>
References: <20231201154552.3066321-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|BN9PR12MB5384:EE_
X-MS-Office365-Filtering-Correlation-Id: 5583f7cb-54cb-4036-4100-08dbf284adc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kLGLqGEGcHPMLjFGap2eTEwdluUOpdVVEkC7pVfl3/0PK8tWd1wuS5TdEtEQDBeDvypcGEjAq50pisolWS7cE/69kJ633oUXSWctgyQkA0qy1Jk8Lzytz9+7wzHFm61ZgotbLym2gX7t4PnNu7LpNw3tQKZdlC0hqEz3zZkwkqV8PwD0TjrtB/88EJIvmy4DKm93vKEHLjGE6+75PwSWfRVG0HrMjaft3gTKyXmQ3XopkHMp0kGVDVzRt9ox8WibvYm7I3hxmiYHMrvXNcNxqA0kwACjYgrgYVDwGNSsngfjQGEi6V9ULu/OK/X8il8Neej0hsGhLdh/nxJ5YYNUrPhxV8yUqtVv/H4GdbXQapfgOd1yqj3zpTv10dti7AF6EzSZY+q2NMz5ChBSdzx+7nVa8XlZeZCvlG6XjeSNrtiyH/KmJTY7hbCCkZNFy42OvnXEXi4ShL/pqcpxcQBp9JR609KFG42S+zRbNQ1z4Odi26e9o0rp2pxbChh0sK0FQ05DJoB4IlISXKu1E2MB2aWmqFy7o9YczQZoWQ4ogNeronjwAiJpvHTVPkvMc7GMEggC62rM9sk5vgm+MRkjmYYgxi2Kb+EAWxaE84epvN58XFHdNBEmgRqumzl25CjmTMTzotvnNfgvE8DSYCAFHdZoElul8H7j/PLvd4E+C05AlD0XmbuDp4Pgy53mRPYmX2Eu9E5S61QtyWkHFzZY1eHxlSrLRW3r+0xFOyUkOQxNNgIBLKwplST8Gk8swuQMADtD7r3yk7EWGzDukrFEEA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(136003)(396003)(346002)(230922051799003)(1800799012)(82310400011)(451199024)(64100799003)(186009)(36840700001)(40470700004)(46966006)(36756003)(41300700001)(2906002)(5660300002)(44832011)(86362001)(40460700003)(1076003)(2616005)(40480700001)(6666004)(83380400001)(26005)(82740400003)(426003)(336012)(478600001)(356005)(47076005)(81166007)(36860700001)(4326008)(6916009)(54906003)(316002)(8936002)(70206006)(70586007)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 15:46:26.7251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5583f7cb-54cb-4036-4100-08dbf284adc0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5384

Currently, Xen vPCI only supports virtualizing the MSI and MSI-X capabilities.
Hide all other PCI capabilities (including extended capabilities) from domUs for
now, even though there may be certain devices/drivers that depend on being able
to discover certain capabilities.

We parse the physical PCI capabilities linked list and add vPCI register
handlers for the next elements, inserting our own next value, thus presenting a
modified linked list to the domU.

Introduce helper functions vpci_hw_read8 and vpci_read_val. The vpci_read_val
helper function returns a fixed value, which may be used for read as zero
registers, or registers whose value doesn't change.

Introduce pci_find_next_cap_ttl() helper while adapting the logic from
pci_find_next_cap() to suit our needs, and implement the existing
pci_find_next_cap() in terms of the new helper.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v8->v9:
* move local variable definitions inside loop in pci_find_next_cap_ttl()
* constify supported_caps array and cap parameter of pci_find_next_cap_ttl()
* add comment by vpci_read_val() helper
* rename s/init_bars/init_header/
* add Roger's R-b tag

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
 xen/drivers/pci/pci.c     | 33 ++++++++++++-------
 xen/drivers/vpci/header.c | 67 +++++++++++++++++++++++++++++++++++++--
 xen/drivers/vpci/vpci.c   | 12 +++++++
 xen/include/xen/pci.h     |  3 ++
 xen/include/xen/vpci.h    |  6 ++++
 5 files changed, 108 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/pci/pci.c b/xen/drivers/pci/pci.c
index 3569ccb24e9e..e6ccc86214ba 100644
--- a/xen/drivers/pci/pci.c
+++ b/xen/drivers/pci/pci.c
@@ -39,31 +39,42 @@ unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap)
     return 0;
 }
 
-unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
-                               unsigned int cap)
+unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
+                                   const unsigned int *cap, unsigned int n,
+                                   unsigned int *ttl)
 {
-    u8 id;
-    int ttl = 48;
-
-    while ( ttl-- )
+    while ( (*ttl)-- )
     {
+        unsigned int id, i;
+
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
index 351318121e48..3be2e21cd925 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -18,6 +18,7 @@
  */
 
 #include <xen/iocap.h>
+#include <xen/lib.h>
 #include <xen/sched.h>
 #include <xen/softirq.h>
 #include <xen/vpci.h>
@@ -513,7 +514,7 @@ static void cf_check rom_write(
         rom->addr = val & PCI_ROM_ADDRESS_MASK;
 }
 
-static int cf_check init_bars(struct pci_dev *pdev)
+static int cf_check init_header(struct pci_dev *pdev)
 {
     uint16_t cmd;
     uint64_t addr, size;
@@ -545,6 +546,68 @@ static int cf_check init_bars(struct pci_dev *pdev)
     if ( rc )
         return rc;
 
+    if ( !is_hardware_domain(pdev->domain) )
+    {
+        if ( pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST )
+        {
+            /* Only expose capabilities to the guest that vPCI can handle. */
+            unsigned int next, ttl = 48;
+            const unsigned int supported_caps[] = {
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
@@ -642,7 +705,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
 
     return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
 }
-REGISTER_VPCI_INIT(init_bars, VPCI_PRIORITY_MIDDLE);
+REGISTER_VPCI_INIT(init_header, VPCI_PRIORITY_MIDDLE);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index d569f596a4c3..72ef277c4f8e 100644
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
index 50d7dfb2a2fd..1509f8f466f1 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -205,6 +205,9 @@ int pci_mmcfg_read(unsigned int seg, unsigned int bus,
 int pci_mmcfg_write(unsigned int seg, unsigned int bus,
                     unsigned int devfn, int reg, int len, u32 value);
 unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap);
+unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
+                                   const unsigned int *cap, unsigned int n,
+                                   unsigned int *ttl);
 unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
                                unsigned int cap);
 unsigned int pci_find_ext_capability(pci_sbdf_t sbdf, unsigned int cap);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 85c52a1ebac7..d20c301a3db3 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -57,7 +57,13 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size);
 void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
                 uint32_t data);
 
+/* Helper to return the value passed in data. */
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



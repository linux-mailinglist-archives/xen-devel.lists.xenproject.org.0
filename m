Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8518040CA
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 22:10:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647311.1010322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAGCR-0006Dy-Vo; Mon, 04 Dec 2023 21:09:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647311.1010322; Mon, 04 Dec 2023 21:09:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAGCR-0006Bh-Sm; Mon, 04 Dec 2023 21:09:55 +0000
Received: by outflank-mailman (input) for mailman id 647311;
 Mon, 04 Dec 2023 21:09:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y+Gv=HP=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rAGCQ-000698-6M
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 21:09:54 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 773c3930-92e9-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 22:09:53 +0100 (CET)
Received: from MW4PR03CA0024.namprd03.prod.outlook.com (2603:10b6:303:8f::29)
 by CH2PR12MB4087.namprd12.prod.outlook.com (2603:10b6:610:7f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Mon, 4 Dec
 2023 21:09:46 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:303:8f:cafe::24) by MW4PR03CA0024.outlook.office365.com
 (2603:10b6:303:8f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Mon, 4 Dec 2023 21:09:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 21:09:45 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 15:09:45 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 4 Dec 2023 15:09:43 -0600
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
X-Inumbo-ID: 773c3930-92e9-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mV9Pq8L4nzuROBsNtI82U7W7V+rhRLK19D12bK8f8AYvYYUNf+SpJ4nIwEd3YYRPs+vlGYJCfB0JG724Jf1gnfpmawn3CjPZgpf/PcegPNYC069eeTZCqmCGrgFe07AxeYKjoqifIeYccvgmg6cqR+9dcEF2b1RpPvS2Sq9nmZTgEe+LiVClkalr8o36/D4Dtc8hYES+C5IiiVblmUj9XxQkY6vsCdzpad63Q01F7GBaqcw9ZtP822CVqZPHSI+dHxYaqhRcxvtU6KuY8K7drupfm3ibipSIomChX2hmjoXJutBk+oOsXO0YexLgpql2VNfqWe4TsQ+fodmL8aXCKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRL0UvNdHD3s4CJd428rmdW97NYNmAI0AVnnctl7IJU=;
 b=Z1HfNLdeiGKu1soBCl5MFZvWX0UcXxTrNyUlHnUv51XW0GThB8SMh5C8/5DxBh6gWoZ4XPCwEbPC1RpDJZaGUbQQMmTXe/TLoCUfqMQPpqKpgD6X7KejOPohLDvJv+bf57DauHquNn09QadlYd/eQ9rRkX59Ce878RhiMKNcbjzPV8qOm1Qka4zBz8ZKc23H29JGCUwC7bXPcbFqAtIUxYfBEpVP6lA5+J2r+htLaDi04+LLQf/vU76rQ/SvFcdnd3Y9/wti+UmxvHKAGFqKH2xyr1qncI8Rdo9rezhGcuqKS8i+3UUG8DGqcQeshwGRvxRkvFg/jh+/adZBS71W0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRL0UvNdHD3s4CJd428rmdW97NYNmAI0AVnnctl7IJU=;
 b=1+PcMvFAzrGbT/lN/U9caiCr+MipdVfLb0KqXBW+V5C4NE/LiVlWog/AYZlUP3GE7kphuecEKMqMmaWtYJlO7wHQFSHVugYpYpt1tx3PYmG4EaHnNpw9A8j9Wb9jOAzD+rLkONWozEcI7FCpDyDWUMfDL0qNJTGMop5jW7ptzJQ=
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
Subject: [PATCH v10 2/2] xen/vpci: header: filter PCI capabilities
Date: Mon, 4 Dec 2023 16:09:13 -0500
Message-ID: <20231204210916.3651999-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231204210916.3651999-1-stewart.hildebrand@amd.com>
References: <20231204210916.3651999-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|CH2PR12MB4087:EE_
X-MS-Office365-Filtering-Correlation-Id: 50ea0472-51c2-45db-a118-08dbf50d57e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8JiYhka1OAEpNF0t93kym/VsJ18OBG/x4E5ac6kj6rKXYF5VR1weSjOfsG6Zc3rScWc3HfTSuTD+LkRXZ4xg2eeozYgzz1GSFVNa0t2LCBj3D0bnPvP5tp+aNLhiTnzjq9fHC2jLwMSt+7jdmrpi6ih8q+8qGmt2j44PAO0RcYi2ya7oSf4+Rj+51sk4MwcJEhTcIKTrlKtFv9QCJ3F679vr0hePKZlfCK9yeh4MpjZqhXhBjrIIhuPAfDHotEWQm7UQDiIjOwN2aWT+9Kfm2MULKBUrkTlDbsDdIotZ87d7kFs1mQKJwXGzt/f6eZhhhDFdqDUuDyV22dMnSfzxWS3dKwcPt5N1+i/tiLtXA+Fk4fpCZNsA+JS2KTuKizUjzz4xdtT/RrPqXqYaRYR4YCCdnDclebEzVL63wcdR+yAF3uLNMoAiU2OgyzvXnYW4DU2gdDZVYe//a6Lvs2WRTwFaQagS/OsUb1RBg6CZNaHICSsXPkDXOdfmDhXBJ8bDWCfzYq848yXvqN49Fhojo7M9YYdzoFN6wZaCk5yBj7nAI902f3/PdI09+Ytm8JpwnyDVz3b8FnCW5RUisRM2GGGJuo3VoxuGidViVXs0wuqSIPCwz7kznl8b22uFByvcHXEEsvmcIgFVdoxPBJr9YJBn4Ax3w17Bi8rS28bZDxeB4PsmyDX7AJ0iXRvlhknbuH7TKi6FkVNKHWIMDbuK3EIfCfsi3GTFY5o4FeWnDKV+NPVZMsYqoCtMH6dDKC0xd3A/71vNSQUOhBV0p/1gFg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(39860400002)(396003)(136003)(230922051799003)(82310400011)(1800799012)(64100799003)(451199024)(186009)(40470700004)(46966006)(36840700001)(336012)(26005)(478600001)(83380400001)(47076005)(6666004)(356005)(81166007)(426003)(1076003)(40480700001)(82740400003)(36756003)(2616005)(316002)(6916009)(54906003)(70586007)(70206006)(36860700001)(5660300002)(4326008)(86362001)(2906002)(8936002)(8676002)(40460700003)(44832011)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 21:09:45.8916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ea0472-51c2-45db-a118-08dbf50d57e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4087

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

Rename init_bars() to init_header() since it is now doing more than initializing
BARs.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v9->v10:
* rename s/cap/caps/ parameter in pci_find_next_cap_ttl()
* make caps parameter in pci_find_next_cap_ttl() an actual array
* make supported_caps static
* add Jan's R-b tag
* mention renaming s/init_bars/init_header/ in commit message

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
index 3569ccb24e9e..edf5b9f7ae9f 100644
--- a/xen/drivers/pci/pci.c
+++ b/xen/drivers/pci/pci.c
@@ -39,31 +39,42 @@ unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap)
     return 0;
 }
 
-unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
-                               unsigned int cap)
+unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
+                                   const unsigned int caps[], unsigned int n,
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
+            if ( id == caps[i] )
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
index 351318121e48..58195549d50a 100644
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
+            static const unsigned int supported_caps[] = {
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
index 50d7dfb2a2fd..2a0a01bf92e5 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -205,6 +205,9 @@ int pci_mmcfg_read(unsigned int seg, unsigned int bus,
 int pci_mmcfg_write(unsigned int seg, unsigned int bus,
                     unsigned int devfn, int reg, int len, u32 value);
 unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap);
+unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
+                                   const unsigned int caps[], unsigned int n,
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



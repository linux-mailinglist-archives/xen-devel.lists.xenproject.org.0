Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3958CCD30
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 09:41:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728100.1132923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA34X-0003Pz-In; Thu, 23 May 2024 07:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728100.1132923; Thu, 23 May 2024 07:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA34X-0003Lu-F2; Thu, 23 May 2024 07:41:09 +0000
Received: by outflank-mailman (input) for mailman id 728100;
 Thu, 23 May 2024 07:41:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1Po+=M2=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1sA34W-0001WY-Bw
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 07:41:08 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2408::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0c5d2ec-18d7-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 09:41:07 +0200 (CEST)
Received: from BY5PR20CA0024.namprd20.prod.outlook.com (2603:10b6:a03:1f4::37)
 by PH7PR12MB6738.namprd12.prod.outlook.com (2603:10b6:510:1a9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Thu, 23 May
 2024 07:41:03 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::ef) by BY5PR20CA0024.outlook.office365.com
 (2603:10b6:a03:1f4::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22 via Frontend
 Transport; Thu, 23 May 2024 07:41:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024 07:41:02 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 02:40:59 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 23 May 2024 02:40:58 -0500
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
X-Inumbo-ID: d0c5d2ec-18d7-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZawFVej4XbPQ44lzG6OFWPH5F7gp/ntM/F0lJ6b4W2SDVG6DjqzJ0SNvVOIxD3r53kSxc5L6fD+Kr52Cnmtm6LaZbg0w8iAfiPChYlbhglrjpL/lPR2l0Fi4yTMANNn48FdBez2h92eTfP2Nq7kr2MUfBA/5RrcNpmUjgQbb4Vx9T3sQOxOglATWbMnQNNAuO+rzsKk4po+8/k7zrBCMpeyNU2qXQ3dbnuFF2gy0Om5o1Mv9Zd3ufqUnGHiZWxd/NCH8E6q+mi/y9t7dzxHyhEerFhI7NhijOyi8EEhqYQFTYuOL8SlU03Hfz25vIBXG62z6TYJkQGwZxfANnE6vwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WjCV+UJTAIwa98i99pj6e9RnE3+oYy74bW5zI2VriQ=;
 b=n0nw5r70dTN9/IUIRZjlqTnDYsguiiKMq2UY84uPM9Krskv+CqFHFH0MWX77PGRKWu70gPA1O2RTg73EJCvn0kfeu0WfRybXdqTk53Xdic15frL7i72kusIMEI4lJSI2Pap4xaEuZgBlR7FG46PP2jj/4AM8Uh2T5OCXYrGgIBHEZjrQylsDS5wLBSX4hzC4/N2LEBJDpglYTRRt8pN3PGTo/1hawzq65eY8FD4Y430XRTYH7+2+v/970VwUzVZ1P2Lorxs/3ijI95QW4TD3q+oVw4FnwoeoYfkgsLV05B15JQCIf+qk+gs31soVDzagNE54iRJ/r7TsZMLEbt71qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WjCV+UJTAIwa98i99pj6e9RnE3+oYy74bW5zI2VriQ=;
 b=05HiC3DdPgRXfDroX4eQlYRO5tbdoPbfu8wuUuR+jEopWi0wsgN2dwBI49/WQp8ffYVDGw/wvlcer1w7ymZNXR/tu6qsUQ4NXfrmVSa+xzYIc+Uf98VdNmdNW2Fds0lMh9ULejxDsVlNd8cHjPdds8syvPQajJlm1d8kyH2/OpQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Henry Wang
	<xin.wang2@amd.com>
Subject: [PATCH v4 7/9] xen/arm: Support device detachment from domains
Date: Thu, 23 May 2024 15:40:38 +0800
Message-ID: <20240523074040.1611264-8-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240523074040.1611264-1-xin.wang2@amd.com>
References: <20240523074040.1611264-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|PH7PR12MB6738:EE_
X-MS-Office365-Filtering-Correlation-Id: 4004e741-a608-4b1d-3e75-08dc7afbb262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|36860700004|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HEj4UA5zBGDBgQ72s0ZLScb306lbL6WBiFpXCeolHkM2EqPOR/yIraiT8MBx?=
 =?us-ascii?Q?qJVupoEd3MiBwopBNCVv61Kxnm9FkwhMdvnrIO3V4FEDxtp0uSUFUjgiIeG2?=
 =?us-ascii?Q?rQNKK9MWcy3Twjvp0ojYy2XfnZia2Qeqlf0wcWA/vJK2T2Y4H2bGWWdUk6XC?=
 =?us-ascii?Q?18mWzpeBaG5mZh8VG0Wmk0YVB42emsoK/FEW8Fa4dfWFHPBPDg9rvyRY4TtR?=
 =?us-ascii?Q?q2HZpkc3Um44+VDwkKpet5svQLFOJSVZPE8qy3DS5v6Blq96W4+eLpSyhhdt?=
 =?us-ascii?Q?lIKRW0l+jr68AACveMoXFMuTgJbZm3WM8B8vmjPfKv4sIlR9KMEsb0/0Ul7m?=
 =?us-ascii?Q?nkAHL6XVU6ObtXBkzkEuTY0oe6jbdxrgT/xkLrDauvLiThgQTK6DrSYZCX1h?=
 =?us-ascii?Q?1RMExcCl52WXoIjvmr4gVVzAx3mbAHG2VRKjDXktiuGQxEjOC2e3gq8rTpB0?=
 =?us-ascii?Q?fhLQ+vfRFzm8xXIcY78nYzSTwKgfapaqeqcrl51894dIgowz+0Tm9tJl1YDl?=
 =?us-ascii?Q?HHFkd8pBIrvPD/nL1h92a0ZRSJam6lYADZaN1DmgbYM3Ejc71up7BGVylEWJ?=
 =?us-ascii?Q?GlRmss5qzNux5Ezo+BMez0jrLiP8IRKyBB0GPB5eCmiT5GjtkxNvxLreDRUo?=
 =?us-ascii?Q?IzOW5AceSnB1fMkgz/QdFR1WYnwqf4BFAzLGe86kl00neq9Fl1TqiH8ybmTc?=
 =?us-ascii?Q?LLXq1euz1E71zoSaqvfwPjztlcZeW0QF+dXLCAw+NMYeYnzbFRi7sJHZrC/8?=
 =?us-ascii?Q?e1CG8gFXf1ZBzDVbrMbQalRZzPUNpiTWJk/GWdN4TExm7dTGWecgLjFy1282?=
 =?us-ascii?Q?bUrPGAURmHhA2Z/sxf0nOWrSV8VHcXOU6TdYf2Drwn8r/Sh9nKuvEfSEOC5H?=
 =?us-ascii?Q?7QMuyqwahKvmk1eojH/J05VCMurl5YjCXu2Yb6PyLGfrieUuWHZaZg/8h349?=
 =?us-ascii?Q?YpAeJQp7LGp1XyF2Oztx4jMGtvZeto3Xu2EokhY46dqw+q3KjC4C9nek97ck?=
 =?us-ascii?Q?DiwZkNuPHfo6qIuzum79astagPxeGW3IN6XmkiKN0kEOrf+4jqhmbzlK2/yR?=
 =?us-ascii?Q?JsU3ffDkSnTkHO5Sp0lvHJcoUD9ROJSOldq2u6l0iGLd5jEu+34WDH7NnKzc?=
 =?us-ascii?Q?5k1TvFl2ncGLEtPgOEBiekDTqqTlrsa8eRfO3c4e9YPD5aZnhlU7oghHaDdM?=
 =?us-ascii?Q?MNM4nMUcAVos/F3M4/yErrqej72ZyTOJNkgs/wq+wtp6pVqrkWSjxX7eC4B4?=
 =?us-ascii?Q?GF7KJh2ks6gr5etccn4liRphAW/wHwtZPLEcpidz3tht6Y7/vUdGWvwftKIG?=
 =?us-ascii?Q?Vko78hCn72zq0JEwqE5zMqNofBodj5k0AwcgqJMGzv09w67qtWr42bhrjp/x?=
 =?us-ascii?Q?KvqCkdk39/qRB1TfODGYZv5VH/xi?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 07:41:02.6368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4004e741-a608-4b1d-3e75-08dc7afbb262
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6738

Similarly as the device attachment from DT overlay to domain, this
commit implements the device detachment from domain. The DOMCTL
XEN_DOMCTL_dt_overlay op is extended to have the operation
XEN_DOMCTL_DT_OVERLAY_DETACH. The detachment of the device is
implemented by unmapping the IRQ and IOMMU resources. Note that with
these changes, the device de-registration from the IOMMU driver should
only happen at the time when the DT overlay is removed from the Xen
device tree.

Signed-off-by: Henry Wang <xin.wang2@amd.com>
Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
v4:
- Split the original patch, only do device detachment from domain.
---
 xen/common/dt-overlay.c     | 243 ++++++++++++++++++++++++++++--------
 xen/include/public/domctl.h |   3 +-
 2 files changed, 194 insertions(+), 52 deletions(-)

diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
index 1087f9b502..693b6e4777 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/dt-overlay.c
@@ -392,24 +392,100 @@ find_track_entry_from_tracker(const void *overlay_fdt,
     return entry;
 }
 
+static int remove_irq(unsigned long s, unsigned long e, void *data)
+{
+    struct domain *d = data;
+    int rc = 0;
+
+    /*
+     * IRQ should always have access unless there are duplication of
+     * of irqs in device tree. There are few cases of xen device tree
+     * where there are duplicate interrupts for the same node.
+     */
+    if (!irq_access_permitted(d, s))
+        return 0;
+    /*
+     * TODO: We don't handle shared IRQs for now. So, it is assumed that
+     * the IRQs was not shared with another domain.
+     */
+    rc = irq_deny_access(d, s);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "unable to revoke access for irq %ld\n", s);
+        return rc;
+    }
+
+    rc = release_guest_irq(d, s);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "unable to release irq %ld\n", s);
+        return rc;
+    }
+
+    return rc;
+}
+
+static int remove_all_irqs(struct rangeset *irq_ranges, struct domain *d)
+{
+    return rangeset_report_ranges(irq_ranges, 0, ~0UL, remove_irq, d);
+}
+
+static int remove_iomem(unsigned long s, unsigned long e, void *data)
+{
+    struct domain *d = data;
+    int rc = 0;
+    p2m_type_t t;
+    mfn_t mfn;
+
+    mfn = p2m_lookup(d, _gfn(s), &t);
+    if ( mfn_x(mfn) == 0 || mfn_x(mfn) == ~0UL )
+        return -EINVAL;
+
+    rc = iomem_deny_access(d, s, e);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "Unable to remove %pd access to %#lx - %#lx\n",
+               d, s, e);
+        return rc;
+    }
+
+    rc = unmap_mmio_regions(d, _gfn(s), e - s, _mfn(s));
+    if ( rc )
+        return rc;
+
+    return rc;
+}
+
+static int remove_all_iomems(struct rangeset *iomem_ranges, struct domain *d)
+{
+    return rangeset_report_ranges(iomem_ranges, 0, ~0UL, remove_iomem, d);
+}
+
 /* Check if node itself can be removed and remove node from IOMMU. */
-static int remove_node_resources(struct dt_device_node *device_node)
+static int remove_node_resources(struct dt_device_node *device_node,
+                                 struct domain *d)
 {
     int rc = 0;
     unsigned int len;
     domid_t domid;
 
-    domid = dt_device_used_by(device_node);
+    if ( !d )
+    {
+        domid = dt_device_used_by(device_node);
 
-    dt_dprintk("Checking if node %s is used by any domain\n",
-               device_node->full_name);
+        dt_dprintk("Checking if node %s is used by any domain\n",
+                   device_node->full_name);
 
-    /* Remove the node if only it's assigned to hardware domain or domain io. */
-    if ( domid != hardware_domain->domain_id && domid != DOMID_IO )
-    {
-        printk(XENLOG_ERR "Device %s is being used by domain %u. Removing nodes failed\n",
-               device_node->full_name, domid);
-        return -EINVAL;
+        /*
+         * We also check if device is assigned to DOMID_IO as when a domain
+         * is destroyed device is assigned to DOMID_IO.
+         */
+        if ( domid != DOMID_IO )
+        {
+            printk(XENLOG_ERR "Device %s is being assigned to %u. Device is assigned to %d\n",
+                   device_node->full_name, DOMID_IO, domid);
+            return -EINVAL;
+        }
     }
 
     /* Check if iommu property exists. */
@@ -417,9 +493,12 @@ static int remove_node_resources(struct dt_device_node *device_node)
     {
         if ( dt_device_is_protected(device_node) )
         {
-            rc = iommu_remove_dt_device(device_node);
-            if ( rc < 0 )
-                return rc;
+            if ( !list_empty(&device_node->domain_list) )
+            {
+                rc = iommu_deassign_dt_device(d, device_node);
+                if ( rc < 0 )
+                    return rc;
+            }
         }
     }
 
@@ -428,7 +507,8 @@ static int remove_node_resources(struct dt_device_node *device_node)
 
 /* Remove all descendants from IOMMU. */
 static int
-remove_descendant_nodes_resources(const struct dt_device_node *device_node)
+remove_descendant_nodes_resources(const struct dt_device_node *device_node,
+                                  struct domain *d)
 {
     int rc = 0;
     struct dt_device_node *child_node;
@@ -438,12 +518,12 @@ remove_descendant_nodes_resources(const struct dt_device_node *device_node)
     {
         if ( child_node->child )
         {
-            rc = remove_descendant_nodes_resources(child_node);
+            rc = remove_descendant_nodes_resources(child_node, d);
             if ( rc )
                 return rc;
         }
 
-        rc = remove_node_resources(child_node);
+        rc = remove_node_resources(child_node, d);
         if ( rc )
             return rc;
     }
@@ -456,8 +536,7 @@ static int remove_nodes(const struct overlay_track *tracker)
 {
     int rc = 0;
     struct dt_device_node *overlay_node;
-    unsigned int j;
-    struct domain *d = hardware_domain;
+    unsigned int j, len;
 
     for ( j = 0; j < tracker->num_nodes; j++ )
     {
@@ -467,18 +546,15 @@ static int remove_nodes(const struct overlay_track *tracker)
 
         write_lock(&dt_host_lock);
 
-        rc = remove_descendant_nodes_resources(overlay_node);
-        if ( rc )
+        /* Check if iommu property exists. */
+        if ( dt_get_property(overlay_node, "iommus", &len) )
         {
-            write_unlock(&dt_host_lock);
-            return rc;
-        }
-
-        rc = remove_node_resources(overlay_node);
-        if ( rc )
-        {
-            write_unlock(&dt_host_lock);
-            return rc;
+            if ( dt_device_is_protected(overlay_node) )
+            {
+                rc = iommu_remove_dt_device(overlay_node);
+                if ( rc < 0 )
+                    return rc;
+            }
         }
 
         dt_dprintk("Removing node: %s\n", overlay_node->full_name);
@@ -493,22 +569,6 @@ static int remove_nodes(const struct overlay_track *tracker)
         write_unlock(&dt_host_lock);
     }
 
-    /* Remove IRQ access. */
-    if ( tracker->irq_ranges )
-    {
-        rc = rangeset_consume_ranges(tracker->irq_ranges, irq_remove_cb, d);
-        if ( rc )
-            return rc;
-    }
-
-   /* Remove mmio access. */
-    if ( tracker->iomem_ranges )
-    {
-        rc = rangeset_consume_ranges(tracker->iomem_ranges, iomem_remove_cb, d);
-        if ( rc )
-            return rc;
-    }
-
     return rc;
 }
 
@@ -534,7 +594,6 @@ static long handle_remove_overlay_nodes(const void *overlay_fdt,
     {
         rc = -EINVAL;
         goto out;
-
     }
 
     rc = remove_nodes(entry);
@@ -552,9 +611,6 @@ static long handle_remove_overlay_nodes(const void *overlay_fdt,
 
     xfree(entry->nodes_address);
 
-    rangeset_destroy(entry->irq_ranges);
-    rangeset_destroy(entry->iomem_ranges);
-
     xfree(entry);
 
  out:
@@ -840,6 +896,88 @@ static long handle_add_overlay_nodes(void *overlay_fdt,
     return rc;
 }
 
+static long handle_detach_overlay_nodes(struct domain *d,
+                                        const void *overlay_fdt,
+                                        uint32_t overlay_fdt_size)
+{
+    int rc;
+    unsigned int j;
+    struct overlay_track *entry;
+
+    rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
+    if ( rc )
+        return rc;
+
+    spin_lock(&overlay_lock);
+
+    entry = find_track_entry_from_tracker(overlay_fdt, overlay_fdt_size);
+    if ( entry == NULL )
+    {
+        rc = -EINVAL;
+        goto out;
+    }
+
+    for ( j = 0; j < entry->num_nodes; j++ )
+    {
+        struct dt_device_node *overlay_node;
+
+        overlay_node = (struct dt_device_node *)entry->nodes_address[j];
+        if ( overlay_node == NULL )
+        {
+            rc = -EINVAL;
+            goto out;
+        }
+
+        write_lock(&dt_host_lock);
+        rc = remove_descendant_nodes_resources(overlay_node, d);
+        if ( rc )
+        {
+            write_unlock(&dt_host_lock);
+            goto out;
+        }
+
+        rc = remove_node_resources(overlay_node, d);
+        if ( rc )
+        {
+            write_unlock(&dt_host_lock);
+            goto out;
+        }
+        write_unlock(&dt_host_lock);
+
+        rc = remove_all_irqs(entry->irq_ranges, d);
+        if ( rc )
+            goto out;
+
+        rc = remove_all_iomems(entry->iomem_ranges, d);
+        if ( rc )
+            goto out;
+    }
+
+    /* Remove IRQ access. */
+    if ( entry->irq_ranges )
+    {
+        rc = rangeset_consume_ranges(entry->irq_ranges, irq_remove_cb, d);
+        if ( rc )
+            goto out;
+    }
+
+    /* Remove mmio access. */
+    if ( entry->iomem_ranges )
+    {
+        rc = rangeset_consume_ranges(entry->iomem_ranges, iomem_remove_cb, d);
+        if ( rc )
+            goto out;
+    }
+
+    rangeset_destroy(entry->irq_ranges);
+    rangeset_destroy(entry->iomem_ranges);
+
+ out:
+    spin_unlock(&overlay_lock);
+
+    return rc;
+}
+
 static long handle_attach_overlay_nodes(struct domain *d,
                                         const void *overlay_fdt,
                                         uint32_t overlay_fdt_size)
@@ -956,7 +1094,8 @@ long dt_overlay_domctl(struct domain *d, struct xen_domctl_dt_overlay *op)
     long ret;
     void *overlay_fdt;
 
-    if ( op->overlay_op != XEN_DOMCTL_DT_OVERLAY_ATTACH )
+    if ( op->overlay_op != XEN_DOMCTL_DT_OVERLAY_ATTACH &&
+         op->overlay_op != XEN_DOMCTL_DT_OVERLAY_DETACH )
         return -EOPNOTSUPP;
 
     if ( op->overlay_fdt_size == 0 || op->overlay_fdt_size > KB(500) )
@@ -979,7 +1118,9 @@ long dt_overlay_domctl(struct domain *d, struct xen_domctl_dt_overlay *op)
         return -EFAULT;
     }
 
-    if ( op->overlay_op == XEN_DOMCTL_DT_OVERLAY_ATTACH )
+    if ( op->overlay_op == XEN_DOMCTL_DT_OVERLAY_DETACH )
+        ret = handle_detach_overlay_nodes(d, overlay_fdt, op->overlay_fdt_size);
+    else
         ret = handle_attach_overlay_nodes(d, overlay_fdt, op->overlay_fdt_size);
 
     xfree(overlay_fdt);
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index ac3c2a7c4c..e91f743fa4 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1195,7 +1195,8 @@ struct xen_domctl_dt_overlay {
     XEN_GUEST_HANDLE_64(const_void) overlay_fdt;  /* IN: overlay fdt. */
     uint32_t overlay_fdt_size;              /* IN: Overlay dtb size. */
 #define XEN_DOMCTL_DT_OVERLAY_ATTACH                1
-    uint8_t overlay_op;                     /* IN: Attach. */
+#define XEN_DOMCTL_DT_OVERLAY_DETACH                2
+    uint8_t overlay_op;                     /* IN: Attach/Detach. */
     uint8_t pad[3];                         /* IN: Must be zero. */
 };
 #endif
-- 
2.34.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDA98C7458
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 12:04:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722995.1127511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xxu-000753-UI; Thu, 16 May 2024 10:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722995.1127511; Thu, 16 May 2024 10:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xxu-000714-Q9; Thu, 16 May 2024 10:03:58 +0000
Received: by outflank-mailman (input) for mailman id 722995;
 Thu, 16 May 2024 10:03:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MS9v=MT=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s7Xxs-0005ER-TE
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 10:03:57 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e88::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99e22697-136b-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 12:03:54 +0200 (CEST)
Received: from MW4P222CA0022.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::27)
 by MW4PR12MB7216.namprd12.prod.outlook.com (2603:10b6:303:226::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Thu, 16 May
 2024 10:03:50 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:303:114:cafe::41) by MW4P222CA0022.outlook.office365.com
 (2603:10b6:303:114::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28 via Frontend
 Transport; Thu, 16 May 2024 10:03:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.0 via Frontend Transport; Thu, 16 May 2024 10:03:50 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 05:03:49 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 05:03:48 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 16 May 2024 05:03:46 -0500
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
X-Inumbo-ID: 99e22697-136b-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzQl4oC4aqwmsE01f/6t/ZOPpDuu2OXSOZnTZMof0AJkaz4k4e46VqcSsMgpMoQNdVoOIY/9r92ht1uSnDbZmS/kt+fdgoRaSJmJL6eggQ4O3nBWJvqwl9+URHc6UstuNbkklNvmOn6eCS1KwvsnRySGWtOyrPDil3ar02qmvwldB+tO1rbXUkIhKlF4ozM2bZ9Tf636C6yQJu7vdkw6g7kXyfZe5CP67acHtGADv5WwNLxbDuirDgpvh70TFghSih8b4CtoLtH8u3c7gQBPcBk+bny8j7TwZ5qzk/7UKC+V1c1EJFqHawJ4q9xt1/kcdSbQbi+2NBaPf36Fxigjxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQdHNGe+exEXW3biYqAzR1o3kzypd+Kl5wlHYuzIz7g=;
 b=jDVarwmQNumQeCnO6vlEHV0+tGYfK0jtCfRZNR+OEaEcwDSID1rr1MtYBFxLJ2Ysocl2MAkb5xWwG1Lj9YTfQDkdbDJCLGcKH76DrUZKFRr2LvSOheMvkjm75sQKLqK2Y6oHl+ZYIZZnvHsz2UTFNB+NDasP0bIhGTUw5iDznAA4P1bYtrdANBW1kL4QPbjk1cpoZRC2l5mXGbiSdSxCC1h9SMrG2fAFuCbIZpUeX6//B4LagHk5XP2c7K/vHwqE8ytDn/K/GVvlLvXEjIXTO6G7aGqUT0cV3LtZE0lMmqTMyIEyYDCNJRv1YOn6Q6TQyhJ7HpUtdqrw8H5IhtosfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQdHNGe+exEXW3biYqAzR1o3kzypd+Kl5wlHYuzIz7g=;
 b=lvR9g0YEn//fjhoof7iZwr3o0rdpktzOe28FSOoy1Os8AkM5vjWLRkXKeAOQFSorcFaZhUHbIWdjVf2GX59EcJ7mcnYke/bL6DM6y1DEIWxygv0wI4KIzlUGHHE/wyTvQ/tvKy/0ECPPirVjk9fbPKSs8fcsIONzkLuWTCGDwsg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>
Subject: [PATCH v2 6/8] xen/arm: Add XEN_DOMCTL_dt_overlay DOMCTL and related operations
Date: Thu, 16 May 2024 18:03:28 +0800
Message-ID: <20240516100330.1433265-7-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516100330.1433265-1-xin.wang2@amd.com>
References: <20240516100330.1433265-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|MW4PR12MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: 01f7cbec-ff38-4212-e416-08dc758f7c2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|1800799015|82310400017|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Te+EBV2CpKCi2W/w0ahW0wrJr6MCpWgKhZ1SWwMV8+V6PEKwDkcEs/d8Zp+3?=
 =?us-ascii?Q?kC5N7YH9r5GdbAxBzwRaNiZomJi6akssyp+zgJIGAOZWTzOVQU+EgIKjst4u?=
 =?us-ascii?Q?npLrxCRbyRCRUGKkiNio6d9GhF9Kske1fsTH+hJ6eI4zJpT1wyQV1LwKCHDy?=
 =?us-ascii?Q?C/hUjNjCWKvOmjGtESrkGSTmVaNrpA/h9NxYP8TXM/tD2F8tna74vbQwtoSe?=
 =?us-ascii?Q?m/zEUP/LqIvq6G7kUpdqwj84bD+ERgKl7OHwdyt47k1r0525AtrF+b1kHqhn?=
 =?us-ascii?Q?RuDlLPD9KVQ8h/UH+C03aHe+katwI+JZAnZL6sbYzrFfCtltu8seTMtAwSgi?=
 =?us-ascii?Q?K8+qmciCdmtmyVaS8jGNQc6S4lEWiJEbaHo2hP6fA+P3zCuGNi71X7pCwasM?=
 =?us-ascii?Q?ml7rtKZUcjJYl8hU4br2eK+LBOc8h5tkUVpA/KZnl2HCU1FEKfkvX06sB+RC?=
 =?us-ascii?Q?qJrlQnlBN+B1s1w6d22V4WLaqa3/cM23ICHNgMeOZmpxVJ5fEQVGgytSftHA?=
 =?us-ascii?Q?HwXciwxHUx0QERDW6j31KJEy7lPrMHUSdNjLcJhw7SJ0DjKNOJZj2bKdNfxn?=
 =?us-ascii?Q?LzS3N5oTRlTgkkVwMLDaNi/hXuseXqRbyzY5aInvlfx/obNYPQN7WdJKFPQO?=
 =?us-ascii?Q?MK0GKfV9mkSLNEz2yUKcAgug2RUZrdvpDIziUeOOhJexYM3BZmVlv3sFfsLA?=
 =?us-ascii?Q?tcORE6wyX7baXpnz8GvURW2Sgf1mA9g8chZKJRwSlWnT90TvYIfKGfTNgo3w?=
 =?us-ascii?Q?rQkAZww55r7/4NdCgwaePPuXBQ6hDxdhR9/CqvnaVn7CgANWgYTQzZpRngQD?=
 =?us-ascii?Q?JhR0iJyEv5jplR2hY9/VndPY/lWU0r0gphI+aAHth3Ymv6gHkwcHADwnTEKD?=
 =?us-ascii?Q?IgkpqaPOmttfEetLF6G7UBdmZT4ApP3E2pGCr6HKZV3+h2Oik5dRbNtnr472?=
 =?us-ascii?Q?Heh/2Ou5ufOCDQYVrRFr1OSfFytV04S5iC0qrLUZg+VyAe9mi/SxK2cr49MW?=
 =?us-ascii?Q?y8i0t4KzHT0Iz1bZhfX9TECovCLOCyT1Y1Nau/xTfmYUs2dDsko/Wv4RwX8h?=
 =?us-ascii?Q?wkc/gKOS5TXm48H8A/dUHQIzPle6L/r9SrJSaPdrKZjH3VrNH61a2JeDdLL7?=
 =?us-ascii?Q?MVNkXfglo5zjLIEl3RArKWQagqvoXDvKsRp+sl5uiNL6icfW6LNAr6DG0tY8?=
 =?us-ascii?Q?AB2K37v4G0y45SrPCjocQhSLMdWic6mL7tjlItuzShmimhudlseN0ZEWQXct?=
 =?us-ascii?Q?Q3jSjcaDpjTL2GDJvxPsh6M1zeBvT0jKsrMXcNCmJi2Bf6hfjri2MfyI8sbo?=
 =?us-ascii?Q?OLbmeaK8Hjy6GRba/onomDGgRjCuyhW2bEDewk+Vn2Tjab/3lIdOjgBmW3KO?=
 =?us-ascii?Q?Viyx5j4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(82310400017)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 10:03:50.2073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f7cbec-ff38-4212-e416-08dc758f7c2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7216

In order to support the dynamic dtbo device assignment to a running
VM, the add/remove of the DT overlay and the attach/detach of the
device from the DT overlay should happen separately. Therefore,
repurpose the existing XEN_SYSCTL_dt_overlay to only add the DT
overlay to Xen device tree, instead of assigning the device to the
hardware domain at the same time. Add the XEN_DOMCTL_dt_overlay with
operations XEN_DOMCTL_DT_OVERLAY_{ATTACH,DETACH} to do/undo the
device assignment to the domain.

The hypervisor firstly checks the DT overlay passed from the toolstack
is valid. Then the device nodes are retrieved from the overlay tracker
based on the DT overlay. The attach/detach of the device is implemented
by map/unmap the IRQ and IOMMU resources. Note that with these changes,
the device de-registration from the IOMMU driver should only happen at
the time when the DT overlay is removed from the Xen device tree.

Signed-off-by: Henry Wang <xin.wang2@amd.com>
Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
v2:
- New patch.
---
 xen/arch/arm/domctl.c        |   3 +
 xen/common/dt-overlay.c      | 415 ++++++++++++++++++++++++++++-------
 xen/include/public/domctl.h  |  15 ++
 xen/include/public/sysctl.h  |   7 +-
 xen/include/xen/dt-overlay.h |   7 +
 5 files changed, 366 insertions(+), 81 deletions(-)

diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index ad56efb0f5..12a12ee781 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2012, Citrix Systems
  */
 
+#include <xen/dt-overlay.h>
 #include <xen/errno.h>
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
@@ -176,6 +177,8 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
 
         return rc;
     }
+    case XEN_DOMCTL_dt_overlay:
+        return dt_overlay_domctl(d, &domctl->u.dt_overlay);
     default:
         return subarch_do_domctl(domctl, d, u_domctl);
     }
diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
index 9cece79067..593e985949 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/dt-overlay.c
@@ -356,24 +356,100 @@ static int overlay_get_nodes_info(const void *fdto, char **nodes_full_path)
     return 0;
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
@@ -381,9 +457,12 @@ static int remove_node_resources(struct dt_device_node *device_node)
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
 
@@ -392,7 +471,8 @@ static int remove_node_resources(struct dt_device_node *device_node)
 
 /* Remove all descendants from IOMMU. */
 static int
-remove_descendant_nodes_resources(const struct dt_device_node *device_node)
+remove_descendant_nodes_resources(const struct dt_device_node *device_node,
+                                  struct domain *d)
 {
     int rc = 0;
     struct dt_device_node *child_node;
@@ -402,12 +482,12 @@ remove_descendant_nodes_resources(const struct dt_device_node *device_node)
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
@@ -420,8 +500,7 @@ static int remove_nodes(const struct overlay_track *tracker)
 {
     int rc = 0;
     struct dt_device_node *overlay_node;
-    unsigned int j;
-    struct domain *d = hardware_domain;
+    unsigned int j, len;
 
     for ( j = 0; j < tracker->num_nodes; j++ )
     {
@@ -431,18 +510,15 @@ static int remove_nodes(const struct overlay_track *tracker)
 
         write_lock(&dt_host_lock);
 
-        rc = remove_descendant_nodes_resources(overlay_node);
-        if ( rc )
-        {
-            write_unlock(&dt_host_lock);
-            return rc;
-        }
-
-        rc = remove_node_resources(overlay_node);
-        if ( rc )
+        /* Check if iommu property exists. */
+        if ( dt_get_property(overlay_node, "iommus", &len) )
         {
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
@@ -457,22 +533,6 @@ static int remove_nodes(const struct overlay_track *tracker)
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
 
@@ -536,9 +596,6 @@ static long handle_remove_overlay_nodes(const void *overlay_fdt,
 
     xfree(entry->nodes_address);
 
-    rangeset_destroy(entry->irq_ranges);
-    rangeset_destroy(entry->iomem_ranges);
-
     xfree(entry);
 
  out:
@@ -620,15 +677,7 @@ static long add_nodes(struct overlay_track *tr, char **nodes_full_path)
             return -EFAULT;
         }
 
-        rc = handle_device(hardware_domain, overlay_node, p2m_mmio_direct_c,
-                           tr->iomem_ranges,
-                           tr->irq_ranges);
         write_unlock(&dt_host_lock);
-        if ( rc )
-        {
-            printk(XENLOG_ERR "Adding IRQ and IOMMU failed\n");
-            return rc;
-        }
 
         /* Keep overlay_node address in tracker. */
         tr->nodes_address[j] = (unsigned long)overlay_node;
@@ -638,9 +687,7 @@ static long add_nodes(struct overlay_track *tr, char **nodes_full_path)
 }
 /*
  * Adds device tree nodes under target node.
- * We use tr->dt_host_new to unflatten the updated device_tree_flattened. This
- * is done to avoid the removal of device_tree generation, iomem regions mapping
- * to hardware domain done by handle_node().
+ * We use tr->dt_host_new to unflatten the updated device_tree_flattened.
  */
 static long handle_add_overlay_nodes(void *overlay_fdt,
                                      uint32_t overlay_fdt_size)
@@ -774,20 +821,6 @@ static long handle_add_overlay_nodes(void *overlay_fdt,
         goto err;
     }
 
-    tr->irq_ranges = rangeset_new(hardware_domain, "Overlays: Interrupts", 0);
-    if (tr->irq_ranges == NULL)
-    {
-        printk(XENLOG_ERR "Creating IRQ rangeset failed");
-        goto err;
-    }
-
-    tr->iomem_ranges = rangeset_new(hardware_domain, "Overlay: I/O Memory", 0);
-    if (tr->iomem_ranges == NULL)
-    {
-        printk(XENLOG_ERR "Creating IOMMU rangeset failed");
-        goto err;
-    }
-
     rc = add_nodes(tr, nodes_full_path);
     if ( rc )
     {
@@ -843,14 +876,205 @@ static long handle_add_overlay_nodes(void *overlay_fdt,
     xfree(tr->nodes_address);
     xfree(tr->fdt);
 
-    rangeset_destroy(tr->irq_ranges);
-    rangeset_destroy(tr->iomem_ranges);
-
     xfree(tr);
 
     return rc;
 }
 
+static long handle_detach_overlay_nodes(struct domain *d,
+                                        const void *overlay_fdt,
+                                        uint32_t overlay_fdt_size)
+{
+    int rc;
+    unsigned int j;
+    struct overlay_track *entry, *temp, *track;
+    bool found_entry = false;
+
+    rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
+    if ( rc )
+        return rc;
+
+    spin_lock(&overlay_lock);
+
+    /*
+     * First check if dtbo is correct i.e. it should one of the dtbo which was
+     * used when dynamically adding the node.
+     * Limitation: Cases with same node names but different property are not
+     * supported currently. We are relying on user to provide the same dtbo
+     * as it was used when adding the nodes.
+     */
+    list_for_each_entry_safe( entry, temp, &overlay_tracker, entry )
+    {
+        if ( memcmp(entry->overlay_fdt, overlay_fdt, overlay_fdt_size) == 0 )
+        {
+            track = entry;
+            found_entry = true;
+            break;
+        }
+    }
+
+    if ( !found_entry )
+    {
+        rc = -EINVAL;
+        printk(XENLOG_ERR "Cannot find any matching tracker with input dtbo."
+               " Detaching nodes is supported only for prior added dtbo.\n");
+        goto out;
+
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
+static long handle_attach_overlay_nodes(struct domain *d,
+                                        const void *overlay_fdt,
+                                        uint32_t overlay_fdt_size)
+{
+    int rc;
+    unsigned int j;
+    struct overlay_track *entry, *temp, *track;
+    bool found_entry = false;
+
+    rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
+    if ( rc )
+        return rc;
+
+    spin_lock(&overlay_lock);
+
+    /*
+     * First check if dtbo is correct i.e. it should one of the dtbo which was
+     * used when dynamically adding the node.
+     * Limitation: Cases with same node names but different property are not
+     * supported currently. We are relying on user to provide the same dtbo
+     * as it was used when adding the nodes.
+     */
+    list_for_each_entry_safe( entry, temp, &overlay_tracker, entry )
+    {
+        if ( memcmp(entry->overlay_fdt, overlay_fdt, overlay_fdt_size) == 0 )
+        {
+            track = entry;
+            found_entry = true;
+            break;
+        }
+    }
+
+    if ( !found_entry )
+    {
+        rc = -EINVAL;
+        printk(XENLOG_ERR "Cannot find any matching tracker with input dtbo."
+               " Attaching nodes is supported only for prior added dtbo.\n");
+        goto out;
+
+    }
+
+    entry->irq_ranges = rangeset_new(d, "Overlays: Interrupts", 0);
+    if (entry->irq_ranges == NULL)
+    {
+        rc = -ENOMEM;
+        printk(XENLOG_ERR "Creating IRQ rangeset failed");
+        goto out;
+    }
+
+    entry->iomem_ranges = rangeset_new(d, "Overlay: I/O Memory", 0);
+    if (entry->iomem_ranges == NULL)
+    {
+        rc = -ENOMEM;
+        printk(XENLOG_ERR "Creating IOMMU rangeset failed");
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
+        rc = handle_device(d, overlay_node, p2m_mmio_direct_c,
+                           entry->iomem_ranges, entry->irq_ranges);
+        write_unlock(&dt_host_lock);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "Adding IRQ and IOMMU failed\n");
+            goto out;
+        }
+    }
+
+    spin_unlock(&overlay_lock);
+
+    return 0;
+
+ out:
+    spin_unlock(&overlay_lock);
+
+    rangeset_destroy(entry->irq_ranges);
+    rangeset_destroy(entry->iomem_ranges);
+
+    return rc;
+}
+
 long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
 {
     long ret;
@@ -890,6 +1114,45 @@ long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
     return ret;
 }
 
+long dt_overlay_domctl(struct domain *d, struct xen_domctl_dt_overlay *op)
+{
+    long ret;
+    void *overlay_fdt;
+
+    if ( op->overlay_op != XEN_DOMCTL_DT_OVERLAY_ATTACH &&
+         op->overlay_op != XEN_DOMCTL_DT_OVERLAY_DETACH )
+        return -EOPNOTSUPP;
+
+    if ( op->overlay_fdt_size == 0 || op->overlay_fdt_size > KB(500) )
+        return -EINVAL;
+
+    if ( op->pad[0] || op->pad[1] || op->pad[2] )
+        return -EINVAL;
+
+    overlay_fdt = xmalloc_bytes(op->overlay_fdt_size);
+
+    if ( overlay_fdt == NULL )
+        return -ENOMEM;
+
+    ret = copy_from_guest(overlay_fdt, op->overlay_fdt, op->overlay_fdt_size);
+    if ( ret )
+    {
+        gprintk(XENLOG_ERR, "copy from guest failed\n");
+        xfree(overlay_fdt);
+
+        return -EFAULT;
+    }
+
+    if ( op->overlay_op == XEN_DOMCTL_DT_OVERLAY_DETACH )
+        ret = handle_detach_overlay_nodes(d, overlay_fdt, op->overlay_fdt_size);
+    else
+        ret = handle_attach_overlay_nodes(d, overlay_fdt, op->overlay_fdt_size);
+
+    xfree(overlay_fdt);
+
+    return ret;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index a33f9ec32b..95bfb3c0e8 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1190,6 +1190,17 @@ struct xen_domctl_vmtrace_op {
 typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
 DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
 
+#if defined(__arm__) || defined (__aarch64__)
+struct xen_domctl_dt_overlay {
+    XEN_GUEST_HANDLE_64(const_void) overlay_fdt;  /* IN: overlay fdt. */
+    uint32_t overlay_fdt_size;              /* IN: Overlay dtb size. */
+#define XEN_DOMCTL_DT_OVERLAY_ATTACH                3
+#define XEN_DOMCTL_DT_OVERLAY_DETACH                4
+    uint8_t overlay_op;                     /* IN: Attach or detach. */
+    uint8_t pad[3];                         /* IN: Must be zero. */
+};
+#endif
+
 struct xen_domctl {
     uint32_t cmd;
 #define XEN_DOMCTL_createdomain                   1
@@ -1277,6 +1288,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_vmtrace_op                    84
 #define XEN_DOMCTL_get_paging_mempool_size       85
 #define XEN_DOMCTL_set_paging_mempool_size       86
+#define XEN_DOMCTL_dt_overlay                    87
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1339,6 +1351,9 @@ struct xen_domctl {
         struct xen_domctl_vuart_op          vuart_op;
         struct xen_domctl_vmtrace_op        vmtrace_op;
         struct xen_domctl_paging_mempool    paging_mempool;
+#if defined(__arm__) || defined (__aarch64__)
+        struct xen_domctl_dt_overlay        dt_overlay;
+#endif
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index febaa4b16a..b613babdf9 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -1187,11 +1187,8 @@ DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
 #if defined(__arm__) || defined (__aarch64__)
 /*
  * XEN_SYSCTL_dt_overlay
- * Performs addition/removal of device tree nodes under parent node using dtbo.
- * This does in three steps:
- *  - Adds/Removes the nodes from dt_host.
- *  - Adds/Removes IRQ permission for the nodes.
- *  - Adds/Removes MMIO accesses.
+ * Performs addition/removal of device tree nodes under parent node using dtbo
+ * from dt_host.
  */
 struct xen_sysctl_dt_overlay {
     XEN_GUEST_HANDLE_64(const_void) overlay_fdt;  /* IN: overlay fdt. */
diff --git a/xen/include/xen/dt-overlay.h b/xen/include/xen/dt-overlay.h
index c0567741ee..64c9e34a8a 100644
--- a/xen/include/xen/dt-overlay.h
+++ b/xen/include/xen/dt-overlay.h
@@ -14,6 +14,7 @@
 #include <xen/device_tree.h>
 #include <xen/list.h>
 #include <xen/rangeset.h>
+#include <public/domctl.h>
 
 /*
  * overlay_track describes information about added nodes through dtbo.
@@ -42,12 +43,18 @@ struct xen_sysctl_dt_overlay;
 
 #ifdef CONFIG_OVERLAY_DTB
 long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op);
+long dt_overlay_domctl(struct domain *d, struct xen_domctl_dt_overlay *op);
 #else
 #include <xen/errno.h>
 static inline long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
 {
     return -EOPNOTSUPP;
 }
+static inline long dt_overlay_domctl(struct domain *d,
+                                     struct xen_domctl_dt_overlay *op)
+{
+    return -EOPNOTSUPP;
+}
 #endif
 
 #endif /* __XEN_DT_OVERLAY_H__ */
-- 
2.34.1



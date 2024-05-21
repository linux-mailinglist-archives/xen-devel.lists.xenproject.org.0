Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D768CA774
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 06:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726505.1130851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9HEc-0008WI-PH; Tue, 21 May 2024 04:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726505.1130851; Tue, 21 May 2024 04:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9HEc-0008QW-DY; Tue, 21 May 2024 04:36:22 +0000
Received: by outflank-mailman (input) for mailman id 726505;
 Tue, 21 May 2024 04:36:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H+om=MY=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s9HEa-0006eS-Bo
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 04:36:20 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e88::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa4ee97c-172b-11ef-909f-e314d9c70b13;
 Tue, 21 May 2024 06:36:19 +0200 (CEST)
Received: from SA1P222CA0035.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::10)
 by SA1PR12MB9247.namprd12.prod.outlook.com (2603:10b6:806:3af::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 04:36:14 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:806:2d0:cafe::ed) by SA1P222CA0035.outlook.office365.com
 (2603:10b6:806:2d0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Tue, 21 May 2024 04:36:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 04:36:14 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 23:36:12 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 23:36:10 -0500
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
X-Inumbo-ID: aa4ee97c-172b-11ef-909f-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BAa3lpafPZQvr1YDjSdauNNXobXxJcpOnNsPWh5+1icXRlADKKLU1MlwpI6v5jurDAEluiO4pHZYIyEkR5Wsd4hGK+gsviZEieVVdOjFBPwqo7T7DZqAsqTvqRcs51C/waS5m6f5nrLGfgw17hkSXq8Q2G0L/NX6v46KwJ6e0ZcArZTE36WOul1aLX/hRv9LlWOIVVKXgTQzhc5S6Psy7+TsmSn7v8mYMqx7yWrcKnYSeFFAeiY371glACcOZoV60MMaY8n7/13vxzVPTJaXmX/uHZvBRu1TpFZt/+MFOarEX2J9525ExL65PxCoEcdbSx24C/Bklr2KtKv1Y7CLgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5asE2vIShV06rhyQR/L2eZ3PEF3qss1h6tMuTFdt4g=;
 b=epZ9eySRQp5IaVic1R+4fyc4tk8BzeT7norjD66eu4nZU24HfOfh6zS7oq4JjTkPZ0Km1KrGL+pjwriUtF11pejDKzdByuA4KaAG00JmgaZelzWKhMqyqx3Hs69Tn8stfd3tKonbQlHHt9M86q7ONO/TOvkqJsGmsZ0PFN8rxukgX64uGk5lFGZI6XxMJqoWXyovaST3ATxkgi+yCMTp/3VkfZCO5t7QH+F636MCwNOa5flrdVtSYPhj9hhMz0DzKahWdsGtAvyDNyyVulkOpClxr3OcsAqBTsv3w/sxdQ1zMiUcK81Haz5m48VhvUxLWbRHdTVLvCLumAsBgyePgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5asE2vIShV06rhyQR/L2eZ3PEF3qss1h6tMuTFdt4g=;
 b=sqwYR0Mg4WjfZYWlz0NbAuuoxG9kCZT2BKUAbh4wZDAsn4pUp8kaVlCmQ7ZYpWPivvMKjUu01pkTNSvzQzGdQAFggFaDxAXZkSdyIgfZ/QkzxafRlNjN06IlStiwh2zjR2N2YacR8BEnJAJNqj1mzYqzdgCxolGaUZJ9mgjZPcY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Henry Wang
	<xin.wang2@amd.com>
Subject: [PATCH v3 6/8] xen/arm: Add XEN_DOMCTL_dt_overlay DOMCTL and related operations
Date: Tue, 21 May 2024 12:35:55 +0800
Message-ID: <20240521043557.1580753-7-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521043557.1580753-1-xin.wang2@amd.com>
References: <20240521043557.1580753-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|SA1PR12MB9247:EE_
X-MS-Office365-Filtering-Correlation-Id: b7df2670-00aa-46e9-dbc3-08dc794f8c60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iDPD4qsEn3+NtRctDhK14FfHQI854Qi/ehp2yAH0A0tgAd9z237TVYEWYurA?=
 =?us-ascii?Q?PYj/LEsIBAI2XiIacSWG0BWVqZZ+LAy50vhNQ/4PR3fRqvYWAAhZRXFmhM9+?=
 =?us-ascii?Q?DM38fOmgWyF3ItOIUx6WmwSXrP0tDJxDkAclKbYyt4i1UFMumcYFuI6w5oPW?=
 =?us-ascii?Q?zTryYyY+6/HVoBSCkakwgcAFRWoSaRJVSn+wlwiEVo7mgEejUAbRipvW07iM?=
 =?us-ascii?Q?i8zFabfooD5yM+8YeRAkQct5E47g+f6p43lgnIPwxQEgpCVlA4iShwcEzHFo?=
 =?us-ascii?Q?0+UyrcPBIuJFMHZZvRCXpEWlFL275Ile00Xzbe6MaBnjCtunvzswLSLTtlbL?=
 =?us-ascii?Q?pq4NKBxoLN0FvNUueKCOc5AwH51rv7x0amwlrDLsEHHKCTgVoBP0ctnA8sxI?=
 =?us-ascii?Q?+8G90CCAvYxVvlcIZwDYQAdF8A2z+6MJFrTTgc+N9cZToilfKs7ZNgp7+wxX?=
 =?us-ascii?Q?kfoZP9a2Ban4P8X213w5jlq9kSn+YqBnEdT8LpQdGXbQKEiJAW2NYGPzwRww?=
 =?us-ascii?Q?/674yAQ1AmrWSGGzTOW5Bvked1iKN7x5T8Qx4roDocWXzObx/Hbi6drKNf0R?=
 =?us-ascii?Q?YNZzlPDldmE8xP2twOCpdNX7+W0j/gZIiYZQla0bDXeE3DCdoakk2aHO3REG?=
 =?us-ascii?Q?Rbl52H4WQDvUqcw6gChUvj8z6nDjgvl9TbbaNaAgNonxNUAIzlOkgSpcGHDP?=
 =?us-ascii?Q?ekEKU32LJRSsbho9pPnQ0kVOnm5r2rWOROJGWMJloLRtr9Z/j9Z3NDCtkc6q?=
 =?us-ascii?Q?CsxHNoSijKL5Iu4lGttDS0nWqd1FeKkkDK06emAjuUBIAcvaKZacEuObdOfR?=
 =?us-ascii?Q?EikaLO7HytKsGT/2g1HVSiWLDr3w81Bib5HjhWz0SREWufMzhn3/F45Ely3/?=
 =?us-ascii?Q?3WpLOJq0qtmRZj09o7eIjcZxBUQwYg9KO/2SSS86Eoum7VSX15FuazMktsAE?=
 =?us-ascii?Q?Td1ROk2WHIRTchkzv5Uat1C9Wghe1GYyHD6nJDrM8xPI3QltJjIzq7xSK2ng?=
 =?us-ascii?Q?pEGvbFGfxfw/ib3x/VMqQk790M9F828bQWCHxk4n/SJFfURP1LiCpjlSAA8y?=
 =?us-ascii?Q?ODaR9ldL+eG0CvDdXEOpED3NHN6tMYhx1EAx4tIDyE+8BeLn//UMLY8UyR/w?=
 =?us-ascii?Q?2xRojwf1DCop1saZgWgh8cbE61amzsiwC0ky2mxNHBY9pDf6uFByweIR1iH/?=
 =?us-ascii?Q?pTPikLsUaT9J4p91cIaaLI0RFuGrkDqAbsW6nBFMqNLSM/oTqm1oTGfJqTz8?=
 =?us-ascii?Q?hux/OWbFxe8XtycR08pBvpL44PpUfLwBt/EOm7qTawVg6NhpIuquMIdE++//?=
 =?us-ascii?Q?K1DTO2iI4w4arKJlyGUY8OsJCfna29wlND7U009N5WrQnbgjoElJ21tI8UvZ?=
 =?us-ascii?Q?tENyE7H8knDq72XMc1pP4V/C84zw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 04:36:14.3678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7df2670-00aa-46e9-dbc3-08dc794f8c60
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9247

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
v3:
- Style fixes for arch-selection #ifdefs.
- Do not include public/domctl.h, only add a forward declaration of
  struct xen_domctl_dt_overlay.
- Extract the overlay track entry finding logic to a function, drop
  the unused variables.
- Use op code 1&2 for XEN_DOMCTL_DT_OVERLAY_{ATTACH,DETACH}.
v2:
- New patch.
---
 xen/arch/arm/domctl.c        |   3 +
 xen/common/dt-overlay.c      | 438 +++++++++++++++++++++++++++--------
 xen/include/public/domctl.h  |  15 ++
 xen/include/public/sysctl.h  |  11 +-
 xen/include/xen/dt-overlay.h |   7 +
 5 files changed, 367 insertions(+), 107 deletions(-)

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
index 9cece79067..693b6e4777 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/dt-overlay.c
@@ -356,24 +356,136 @@ static int overlay_get_nodes_info(const void *fdto, char **nodes_full_path)
     return 0;
 }
 
+/* This function should be called with the overlay_lock taken */
+static struct overlay_track *
+find_track_entry_from_tracker(const void *overlay_fdt,
+                              uint32_t overlay_fdt_size)
+{
+    struct overlay_track *entry, *temp;
+    bool found_entry = false;
+
+    ASSERT(spin_is_locked(&overlay_lock));
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
+            found_entry = true;
+            break;
+        }
+    }
+
+    if ( !found_entry )
+    {
+        printk(XENLOG_ERR "Cannot find any matching tracker with input dtbo."
+               " Operation is supported only for prior added dtbo.\n");
+        return NULL;
+    }
+
+    return entry;
+}
+
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
@@ -381,9 +493,12 @@ static int remove_node_resources(struct dt_device_node *device_node)
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
 
@@ -392,7 +507,8 @@ static int remove_node_resources(struct dt_device_node *device_node)
 
 /* Remove all descendants from IOMMU. */
 static int
-remove_descendant_nodes_resources(const struct dt_device_node *device_node)
+remove_descendant_nodes_resources(const struct dt_device_node *device_node,
+                                  struct domain *d)
 {
     int rc = 0;
     struct dt_device_node *child_node;
@@ -402,12 +518,12 @@ remove_descendant_nodes_resources(const struct dt_device_node *device_node)
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
@@ -420,8 +536,7 @@ static int remove_nodes(const struct overlay_track *tracker)
 {
     int rc = 0;
     struct dt_device_node *overlay_node;
-    unsigned int j;
-    struct domain *d = hardware_domain;
+    unsigned int j, len;
 
     for ( j = 0; j < tracker->num_nodes; j++ )
     {
@@ -431,18 +546,15 @@ static int remove_nodes(const struct overlay_track *tracker)
 
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
@@ -457,22 +569,6 @@ static int remove_nodes(const struct overlay_track *tracker)
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
 
@@ -485,8 +581,7 @@ static long handle_remove_overlay_nodes(const void *overlay_fdt,
                                         uint32_t overlay_fdt_size)
 {
     int rc;
-    struct overlay_track *entry, *temp, *track;
-    bool found_entry = false;
+    struct overlay_track *entry;
 
     rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
     if ( rc )
@@ -494,31 +589,11 @@ static long handle_remove_overlay_nodes(const void *overlay_fdt,
 
     spin_lock(&overlay_lock);
 
-    /*
-     * First check if dtbo is correct i.e. it should one of the dtbo which was
-     * used when dynamically adding the node.
-     * Limitation: Cases with same node names but different property are not
-     * supported currently. We are relying on user to provide the same dtbo
-     * as it was used when adding the nodes.
-     */
-    list_for_each_entry_safe( entry, temp, &overlay_tracker, entry )
-    {
-        if ( memcmp(entry->overlay_fdt, overlay_fdt, overlay_fdt_size) == 0 )
-        {
-            track = entry;
-            found_entry = true;
-            break;
-        }
-    }
-
-    if ( !found_entry )
+    entry = find_track_entry_from_tracker(overlay_fdt, overlay_fdt_size);
+    if ( entry == NULL )
     {
         rc = -EINVAL;
-
-        printk(XENLOG_ERR "Cannot find any matching tracker with input dtbo."
-               " Removing nodes is supported only for prior added dtbo.\n");
         goto out;
-
     }
 
     rc = remove_nodes(entry);
@@ -536,9 +611,6 @@ static long handle_remove_overlay_nodes(const void *overlay_fdt,
 
     xfree(entry->nodes_address);
 
-    rangeset_destroy(entry->irq_ranges);
-    rangeset_destroy(entry->iomem_ranges);
-
     xfree(entry);
 
  out:
@@ -620,15 +692,7 @@ static long add_nodes(struct overlay_track *tr, char **nodes_full_path)
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
@@ -638,9 +702,7 @@ static long add_nodes(struct overlay_track *tr, char **nodes_full_path)
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
@@ -774,20 +836,6 @@ static long handle_add_overlay_nodes(void *overlay_fdt,
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
@@ -843,14 +891,165 @@ static long handle_add_overlay_nodes(void *overlay_fdt,
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
+static long handle_attach_overlay_nodes(struct domain *d,
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
@@ -890,6 +1089,45 @@ long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
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
index a33f9ec32b..81efb39014 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1190,6 +1190,17 @@ struct xen_domctl_vmtrace_op {
 typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
 DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
 
+#if defined(__arm__) || defined(__aarch64__)
+struct xen_domctl_dt_overlay {
+    XEN_GUEST_HANDLE_64(const_void) overlay_fdt;  /* IN: overlay fdt. */
+    uint32_t overlay_fdt_size;              /* IN: Overlay dtb size. */
+#define XEN_DOMCTL_DT_OVERLAY_ATTACH                1
+#define XEN_DOMCTL_DT_OVERLAY_DETACH                2
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
+#if defined(__arm__) || defined(__aarch64__)
+        struct xen_domctl_dt_overlay        dt_overlay;
+#endif
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index febaa4b16a..3a6e7d48f0 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -1184,14 +1184,11 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
 DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
 #endif
 
-#if defined(__arm__) || defined (__aarch64__)
+#if defined(__arm__) || defined(__aarch64__)
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
@@ -1265,7 +1262,7 @@ struct xen_sysctl {
         struct xen_sysctl_cpu_policy        cpu_policy;
 #endif
 
-#if defined(__arm__) || defined (__aarch64__)
+#if defined(__arm__) || defined(__aarch64__)
         struct xen_sysctl_dt_overlay        dt_overlay;
 #endif
         uint8_t                             pad[128];
diff --git a/xen/include/xen/dt-overlay.h b/xen/include/xen/dt-overlay.h
index c0567741ee..7f0f3741b5 100644
--- a/xen/include/xen/dt-overlay.h
+++ b/xen/include/xen/dt-overlay.h
@@ -39,15 +39,22 @@ struct overlay_track {
 };
 
 struct xen_sysctl_dt_overlay;
+struct xen_domctl_dt_overlay;
 
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



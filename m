Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 880B18AFFF1
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 05:44:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711058.1110747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTY5-0001Vp-Hj; Wed, 24 Apr 2024 03:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711058.1110747; Wed, 24 Apr 2024 03:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTY5-0001RB-EC; Wed, 24 Apr 2024 03:43:57 +0000
Received: by outflank-mailman (input) for mailman id 711058;
 Wed, 24 Apr 2024 03:43:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z4K=L5=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rzTQd-0002In-Kd
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 03:36:15 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2414::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc34aefa-01eb-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 05:36:13 +0200 (CEST)
Received: from MN2PR07CA0006.namprd07.prod.outlook.com (2603:10b6:208:1a0::16)
 by DS7PR12MB6357.namprd12.prod.outlook.com (2603:10b6:8:96::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 03:36:09 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:1a0:cafe::32) by MN2PR07CA0006.outlook.office365.com
 (2603:10b6:208:1a0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.34 via Frontend
 Transport; Wed, 24 Apr 2024 03:36:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Wed, 24 Apr 2024 03:36:09 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 22:36:02 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 20:35:50 -0700
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Apr 2024 22:35:47 -0500
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
X-Inumbo-ID: cc34aefa-01eb-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQ6JSNrzJpeerxjmsbGM+jY1aBs+y+YCk4oE7pRxuTHbAX3LTsdlx4v8TgkZP3SbeNRh2M8WG8aL827wzo2R2n5aFaIDD3c2UDB4B9ElW2EDJ89HAihAiRTHBKtpvcSYgBTNS2m68RGyqY8zBR3mRZ3goc+4UkEUg+/A/LtRvH3o9ix1ELlMZTNkSiDL4VEiOlO+6x1kgmdVwFjqLpoQ3LhiVAmZXOoqOPhw2PycSBgcNPlCFqRc2vZoAPUKd77wigfZ2uM9U2dM7NLsJv6SMgYWAqkSBH0a70uCqq/vLvPvFV8QVYaCIEGS59NwHOTPwLXgzEY2vFUi9DN2wVMyww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTkFoRXnpKJLc0+QsW9+qktSbxTVG+nGYUGcq/+U60w=;
 b=PJFYV6JxgxLJIcKT3wDdeshkOvzFUTSdtbWqmiBYNmvORLnI+8vKrVmWgUECoiYygBD3BDeKyGOrIDH5P5XK6Yg+uLVXzRl2ZaAQRMqCI6+ZzoQilILVfsUOoGKREpvYlUMJjWbqDLV1N4EwkZWQCbc3KyyroHE/XwTCk8U3b8zVDlq1OieDi4ekDxOV3VPLI/PVinRw7tf3Ch540rPyz6asBXDOviX75DCJWdgMScJkjqn7r1nuHv4NIAhLDcldfbHh6PqrG81U5e2cV8PquMdYd+Vs4s9G9h0MTXb5IkMlllq+Z1okRC2DwbGTRdHF62pqw5WXWfx7zpoANcYg/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTkFoRXnpKJLc0+QsW9+qktSbxTVG+nGYUGcq/+U60w=;
 b=mncG7NdhNOZyjEsA5n7OWngNYcGNWtJSNyv7YxuELcahr579douhrAxDB0aFvH5Z+sjeWacBiBAudd/nok8eyRkD6xdudlhS4gJNDYBiIw5ZhuTpYO+hZl4JPKbuJr+4rVfFljm//L5o5g75r65ctnoJFMaGcC7bxsRl3iLzvAw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Vikram Garhwal <fnu.vikram@xilinx.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Vikram Garhwal <vikram.garhwal@amd.com>, "Henry
 Wang" <xin.wang2@amd.com>
Subject: [PATCH 07/15] xen/overlay: Enable device tree overlay assignment to running domains
Date: Wed, 24 Apr 2024 11:34:41 +0800
Message-ID: <20240424033449.168398-8-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424033449.168398-1-xin.wang2@amd.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|DS7PR12MB6357:EE_
X-MS-Office365-Filtering-Correlation-Id: f4fcf970-eedd-4aa1-dfc8-08dc640fae65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K85sB8ClB6nQkWsQeYTh18OXfZkGhagob1W4qn1IX09NmR5trNEud9WRU2Ba?=
 =?us-ascii?Q?ClrOIBwJqcIbdL7q+NYAdaI1Jf1vmdxludqH/fjiPEpkUXsu+24LwbvbMKtz?=
 =?us-ascii?Q?CYoSbjAML/1B818XPwqd5dwj0fLUCzO3c3MUT7tX2ny4Gmb9toEEZDP6wrzF?=
 =?us-ascii?Q?AjBICUI6V435+Yq0E8FkX7+q16io4OCkVjHN2Zs0vCz2t52X1fi4bCgST/u0?=
 =?us-ascii?Q?YWeVAq7GIOzLV9IU9nLaVZqmcI0pXmJshqCh6NRrYu+H2IzJ/X3EEiJ3yWll?=
 =?us-ascii?Q?4waYggJnmVQRvdZhOAVoTZjXO8+bsCUVTULVEIhbPWfNXXPhNx2szHCVbZo1?=
 =?us-ascii?Q?Eg5b3p0MDbugWPx97FI+NqUqaGafOwOmSSOWqeR1ke6NatXBbXXTqg4ZzrAi?=
 =?us-ascii?Q?BOixxaKI82W5ZVKis0zBIz6ojN/Cri6hhJG4sEpynTEKQlhp+eo4gB3Ukd1J?=
 =?us-ascii?Q?rkfXU1domeQtIAweSWEMhvDQqMOZWphK3CVsG4+7Sni+1mtwH1qpXJG1rrIP?=
 =?us-ascii?Q?ITXS/EBOXbV32JO7jQTuilGiFOmQ7CgO/CK9PNeP1EJOK938gVSYu2jojkun?=
 =?us-ascii?Q?cf9BjpUukviHP+kTvfZZRrar/N8v8BaJ6dgGI8T3cuWAlmkU+GCHthKd3x4G?=
 =?us-ascii?Q?yX7Wpbbsc0JI47slwOWTMXV5L276y+UurbbLCRX4yVoRf18ScNmUvjPEgj9x?=
 =?us-ascii?Q?m8YyEkUMs9inkK1p9AcFjRK/MzQqqwnHBL/7V29nsctj2lnLv04P3uyxgqMt?=
 =?us-ascii?Q?VDJXegg0byvcmmXj3bQy/6QcQPzNy99AGams/HqHsYXXQx5CMW+0w9s0/qYa?=
 =?us-ascii?Q?ZmlLDLjcFI/wKG2twGLAhWe7wihEfsVlg7LS8Bn7ry159YEjvRO2EmiFhfQC?=
 =?us-ascii?Q?vwTGRybSPuxkWbxHaeVPbXG8g6SnIJP+RW7iUYSeFeD+PAO/JUhYtpvoCTZz?=
 =?us-ascii?Q?mc0rrMAgHe5HfmGeJCQ7nRue2ShP4XtlYq0gjeMx4Or5mNiXSFL7Wln3hzUa?=
 =?us-ascii?Q?ySV5c4RwAFvk1HT8KVSNXz8Uz903+e/VQsc6fbCXR9+PjrIPt6JuB7TyBV8D?=
 =?us-ascii?Q?yrCwRI1UgKoP9xI14w6dHOpWda3wao7dD+wDwdJVLPiD9JN1mqcATUVXy9pm?=
 =?us-ascii?Q?rwkjYLQ/Q5NcyLv7iFfrlvih85FEEay3qycQJID/h3Ev4mOQvVPR5aHDKNp5?=
 =?us-ascii?Q?2QBgUuBvlJuhrImJTRfci2j1SKCqeuurTqz2uW0GAq3JhZ/dwB0t2S/EZ9w8?=
 =?us-ascii?Q?3kRejUrKqsaGhRqK1jW5J7XkDjC+EL9wPJK8HbzXf+VIHm1r9ikk1TIkQ2zj?=
 =?us-ascii?Q?vls2jXr3YlVo0Z05YVIt70S3gbpSap0VUHW/PEgD2qKo3VbfWRjbaoDpZkiz?=
 =?us-ascii?Q?9rQaldw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 03:36:09.2498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4fcf970-eedd-4aa1-dfc8-08dc640fae65
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6357

From: Vikram Garhwal <fnu.vikram@xilinx.com>

Following changes are done to enable dtbo assignment to a running vm with given
domain_id:
1. Support for irq map and unmap for running domain. We store the IRQ nums for
    each overlay and while removing those IRQ nums are removed.
2. Support iommu assign/reassign to running domains.
3. Added "map_nodes" options to support two modes:
    a. Add the nodes in Xen device tree and map the nodes to given VM
    b. Just add them in xen device tree without mapping.

Change device.c: handle_device() function with input domain_mapping flag.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
 xen/arch/arm/device.c            |   8 +-
 xen/arch/arm/domain_build.c      |   2 +-
 xen/arch/arm/include/asm/setup.h |   3 +-
 xen/common/dt-overlay.c          | 218 ++++++++++++++++++++++++++-----
 xen/include/public/sysctl.h      |   4 +-
 5 files changed, 199 insertions(+), 36 deletions(-)

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 3e02cff008..df5035f9a8 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -317,7 +317,8 @@ static int map_device_children(const struct dt_device_node *dev,
  *  - Map the IRQs and iomem regions to DOM0
  */
 int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
-                  struct rangeset *iomem_ranges, struct rangeset *irq_ranges)
+                  struct rangeset *iomem_ranges, struct rangeset *irq_ranges,
+                  bool device_mapping)
 {
     unsigned int naddr;
     unsigned int i;
@@ -334,9 +335,10 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
     struct map_range_data mr_data = {
         .d = d,
         .p2mt = p2mt,
-        .skip_mapping = !own_device ||
+        .skip_mapping = (!own_device ||
                         (is_pci_passthrough_enabled() &&
-                        (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE)),
+                        (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE))) &&
+                        !device_mapping,
         .iomem_ranges = iomem_ranges,
         .irq_ranges = irq_ranges
     };
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 54232ed4cb..a525aed175 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1699,7 +1699,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                "WARNING: Path %s is reserved, skip the node as we may re-use the path.\n",
                path);
 
-    res = handle_device(d, node, p2mt, NULL, NULL);
+    res = handle_device(d, node, p2mt, NULL, NULL, false);
     if ( res)
         return res;
 
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index d15a88d2e0..d6d8c28d02 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -172,7 +172,8 @@ u32 device_tree_get_u32(const void *fdt, int node,
                         const char *prop_name, u32 dflt);
 
 int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
-                  struct rangeset *iomem_ranges, struct rangeset *irq_ranges);
+                  struct rangeset *iomem_ranges, struct rangeset *irq_ranges,
+                  bool device_mapping);
 
 int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
                               bool need_mapping, struct rangeset *irq_ranges);
diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
index 39e4ba59dd..8840ea756b 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/dt-overlay.c
@@ -356,24 +356,133 @@ static int overlay_get_nodes_info(const void *fdto, char **nodes_full_path)
     return 0;
 }
 
+static int remove_all_irqs(struct rangeset *irq_ranges,
+                           struct domain *d, bool domain_mapping)
+{
+    struct range *x;
+    int rc = 0;
+
+    read_lock(&irq_ranges->lock);
+
+    for ( x = first_range(irq_ranges); x != NULL;
+          x = next_range(irq_ranges, x) )
+    {
+        /*
+         * Handle invalid use cases 1:
+         * Where user assigned the nodes to dom0 along with their irq
+         * mappings but now just wants to remove the nodes entry from Xen device
+         * device tree without unmapping the irq.
+         */
+        if ( !domain_mapping && vgic_get_hw_irq_desc(d, NULL, x->s) )
+        {
+            printk(XENLOG_ERR "Removing node from device tree without releasing it's IRQ/IOMMU is not allowed\n");
+            rc = -EINVAL;
+            goto out;
+        }
+
+        /*
+         * IRQ should always have access unless there are duplication of
+         * of irqs in device tree. There are few cases of xen device tree
+         * where there are duplicate interrupts for the same node.
+         */
+        if (!irq_access_permitted(d, x->s))
+            continue;
+        /*
+         * TODO: We don't handle shared IRQs for now. So, it is assumed that
+         * the IRQs was not shared with another domain.
+         */
+        rc = irq_deny_access(d, x->s);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "unable to revoke access for irq %ld\n", x->s);
+            goto out;
+        }
+
+        if ( domain_mapping )
+        {
+            rc = release_guest_irq(d, x->s);
+            if ( rc )
+            {
+                printk(XENLOG_ERR "unable to release irq %ld\n", x->s);
+                goto out;
+            }
+        }
+    }
+
+out:
+    read_unlock(&irq_ranges->lock);
+    return rc;
+}
+
+static int remove_all_iomems(struct rangeset *iomem_ranges,
+                             struct domain *d,
+                             bool domain_mapping)
+{
+    struct range *x;
+    int rc = 0;
+    p2m_type_t t;
+    mfn_t mfn;
+
+    read_lock(&iomem_ranges->lock);
+
+    for ( x = first_range(iomem_ranges); x != NULL;
+          x = next_range(iomem_ranges, x) )
+    {
+        mfn = p2m_lookup(d, _gfn(x->s), &t);
+        if ( mfn_x(mfn) == 0 || mfn_x(mfn) == ~0UL )
+        {
+            rc = -EINVAL;
+            goto out;
+        }
+
+        rc = iomem_deny_access(d, x->s, x->e);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "Unable to remove dom%d access to %#lx - %#lx\n",
+                   d->domain_id,
+                   x->s, x->e);
+            goto out;
+        }
+
+        rc = unmap_mmio_regions(d, _gfn(x->s), x->e - x->s,
+                                _mfn(x->s));
+        if ( rc )
+            goto out;
+    }
+
+out:
+    read_unlock(&iomem_ranges->lock);
+    return rc;
+}
+
 /* Check if node itself can be removed and remove node from IOMMU. */
-static int remove_node_resources(struct dt_device_node *device_node)
+static int remove_node_resources(struct dt_device_node *device_node,
+                                 struct domain *d, bool domain_mapping)
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
+        /*
+         * We also check if device is assigned to DOMID_IO as when a domain
+         * is destroyed device is assigned to DOMID_IO or for the case when
+         * device was never mapped to a running domain.
+         */
+        if ( domid != hardware_domain->domain_id && domid != DOMID_IO )
+        {
+            printk(XENLOG_ERR "Device %s is being assigned to %u. Device is assigned to %d\n",
+                   device_node->full_name, DOMID_IO, domid);
+            return -EINVAL;
+        }
 
-    /* Remove the node if only it's assigned to hardware domain or domain io. */
-    if ( domid != hardware_domain->domain_id && domid != DOMID_IO )
-    {
-        printk(XENLOG_ERR "Device %s is being used by domain %u. Removing nodes failed\n",
-               device_node->full_name, domid);
-        return -EINVAL;
+        /*
+         * Device is assigned to hardware domain.
+         */
+         d = hardware_domain;
     }
 
     /* Check if iommu property exists. */
@@ -382,6 +491,16 @@ static int remove_node_resources(struct dt_device_node *device_node)
         if ( dt_device_is_protected(device_node) )
         {
             write_lock(&dt_host_lock);
+            if ( domain_mapping && !list_empty(&device_node->domain_list) )
+            {
+                rc = iommu_deassign_dt_device(d, device_node);
+                if ( rc < 0 )
+                {
+                    write_unlock(&dt_host_lock);
+                    return rc;
+                }
+            }
+
             rc = iommu_remove_dt_device(device_node);
             if ( rc < 0 )
             {
@@ -397,7 +516,8 @@ static int remove_node_resources(struct dt_device_node *device_node)
 
 /* Remove all descendants from IOMMU. */
 static int
-remove_descendant_nodes_resources(const struct dt_device_node *device_node)
+remove_descendant_nodes_resources(const struct dt_device_node *device_node,
+                                  struct domain *d, bool domain_mapping)
 {
     int rc = 0;
     struct dt_device_node *child_node;
@@ -407,12 +527,13 @@ remove_descendant_nodes_resources(const struct dt_device_node *device_node)
     {
         if ( child_node->child )
         {
-            rc = remove_descendant_nodes_resources(child_node);
+            rc = remove_descendant_nodes_resources(child_node, d,
+                                                   domain_mapping);
             if ( rc )
                 return rc;
         }
 
-        rc = remove_node_resources(child_node);
+        rc = remove_node_resources(child_node, d, domain_mapping);
         if ( rc )
             return rc;
     }
@@ -421,12 +542,13 @@ remove_descendant_nodes_resources(const struct dt_device_node *device_node)
 }
 
 /* Remove nodes from dt_host. */
-static int remove_nodes(const struct overlay_track *tracker)
+static int remove_nodes(const struct overlay_track *tracker,
+                        struct domain *d)
 {
     int rc = 0;
     struct dt_device_node *overlay_node;
     unsigned int j;
-    struct domain *d = hardware_domain;
+    bool domain_mapping = (d != NULL);
 
     for ( j = 0; j < tracker->num_nodes; j++ )
     {
@@ -434,11 +556,19 @@ static int remove_nodes(const struct overlay_track *tracker)
         if ( overlay_node == NULL )
             return -EINVAL;
 
-        rc = remove_descendant_nodes_resources(overlay_node);
+        rc = remove_descendant_nodes_resources(overlay_node, d, domain_mapping);
+        if ( rc )
+            return rc;
+
+        rc = remove_node_resources(overlay_node, d, domain_mapping);
+        if ( rc )
+            return rc;
+
+        rc = remove_all_irqs(tracker->irq_ranges, d, domain_mapping);
         if ( rc )
             return rc;
 
-        rc = remove_node_resources(overlay_node);
+        rc = remove_all_iomems(tracker->iomem_ranges, d, domain_mapping);
         if ( rc )
             return rc;
 
@@ -481,7 +611,8 @@ static int remove_nodes(const struct overlay_track *tracker)
  * while destroying the domain.
  */
 static long handle_remove_overlay_nodes(const void *overlay_fdt,
-                                        uint32_t overlay_fdt_size)
+                                        uint32_t overlay_fdt_size,
+                                        struct domain *d)
 {
     int rc;
     struct overlay_track *entry, *temp, *track;
@@ -520,7 +651,7 @@ static long handle_remove_overlay_nodes(const void *overlay_fdt,
 
     }
 
-    rc = remove_nodes(entry);
+    rc = remove_nodes(entry, d);
     if ( rc )
     {
         printk(XENLOG_ERR "Removing node failed\n");
@@ -560,12 +691,21 @@ static void free_nodes_full_path(unsigned int num_nodes, char **nodes_full_path)
     xfree(nodes_full_path);
 }
 
-static long add_nodes(struct overlay_track *tr, char **nodes_full_path)
+static long add_nodes(struct overlay_track *tr, char **nodes_full_path,
+                      struct domain *d)
 
 {
     int rc;
     unsigned int j;
     struct dt_device_node *overlay_node;
+    bool domain_mapping = (d != NULL);
+
+    /*
+     * If domain is NULL, then we add the devices into hardware domain and skip
+     * IRQs/IOMMUs mapping.
+     */
+    if ( d == NULL )
+        d = hardware_domain;
 
     for ( j = 0; j < tr->num_nodes; j++ )
     {
@@ -609,8 +749,6 @@ static long add_nodes(struct overlay_track *tr, char **nodes_full_path)
             return rc;
         }
 
-        write_unlock(&dt_host_lock);
-
         prev_node->allnext = next_node;
 
         overlay_node = dt_find_node_by_path(overlay_node->full_name);
@@ -618,18 +756,23 @@ static long add_nodes(struct overlay_track *tr, char **nodes_full_path)
         {
             /* Sanity check. But code will never come here. */
             ASSERT_UNREACHABLE();
+            write_unlock(&dt_host_lock);
             return -EFAULT;
         }
 
-        rc = handle_device(hardware_domain, overlay_node, p2m_mmio_direct_c,
+        rc = handle_device(d, overlay_node, p2m_mmio_direct_c,
                            tr->iomem_ranges,
-                           tr->irq_ranges);
+                           tr->irq_ranges,
+                           domain_mapping);
         if ( rc )
         {
             printk(XENLOG_ERR "Adding IRQ and IOMMU failed\n");
+            write_unlock(&dt_host_lock);
             return rc;
         }
 
+        write_unlock(&dt_host_lock);
+
         /* Keep overlay_node address in tracker. */
         tr->nodes_address[j] = (unsigned long)overlay_node;
     }
@@ -643,7 +786,8 @@ static long add_nodes(struct overlay_track *tr, char **nodes_full_path)
  * to hardware domain done by handle_node().
  */
 static long handle_add_overlay_nodes(void *overlay_fdt,
-                                     uint32_t overlay_fdt_size)
+                                     uint32_t overlay_fdt_size,
+                                     struct domain *d)
 {
     int rc;
     unsigned int j;
@@ -788,7 +932,7 @@ static long handle_add_overlay_nodes(void *overlay_fdt,
         goto err;
     }
 
-    rc = add_nodes(tr, nodes_full_path);
+    rc = add_nodes(tr, nodes_full_path, d);
     if ( rc )
     {
         printk(XENLOG_ERR "Adding nodes failed. Removing the partially added nodes.\n");
@@ -810,7 +954,7 @@ static long handle_add_overlay_nodes(void *overlay_fdt,
  */
  remove_node:
     tr->num_nodes = j;
-    rc = remove_nodes(tr);
+    rc = remove_nodes(tr, d);
 
     if ( rc )
     {
@@ -855,6 +999,7 @@ long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
 {
     long ret;
     void *overlay_fdt;
+    struct domain *d = NULL;
 
     if ( op->overlay_op != XEN_SYSCTL_DT_OVERLAY_ADD &&
          op->overlay_op != XEN_SYSCTL_DT_OVERLAY_REMOVE )
@@ -863,7 +1008,7 @@ long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
     if ( op->overlay_fdt_size == 0 || op->overlay_fdt_size > KB(500) )
         return -EINVAL;
 
-    if ( op->pad[0] || op->pad[1] || op->pad[2] )
+    if ( op->pad[0] || op->pad[1] )
         return -EINVAL;
 
     overlay_fdt = xmalloc_bytes(op->overlay_fdt_size);
@@ -880,13 +1025,26 @@ long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
         return -EFAULT;
     }
 
+    /*
+     * If domain_mapping == false, domain_id can be ignored as we don't need to
+     * map resource to any domain.
+     *
+     * If domain_mapping == true, domain_id, get the target domain for the
+     * mapping.
+     */
+    if ( op->domain_mapping )
+        d = rcu_lock_domain_by_id(op->domain_id);
+
     if ( op->overlay_op == XEN_SYSCTL_DT_OVERLAY_REMOVE )
-        ret = handle_remove_overlay_nodes(overlay_fdt, op->overlay_fdt_size);
+        ret = handle_remove_overlay_nodes(overlay_fdt, op->overlay_fdt_size, d);
     else
-        ret = handle_add_overlay_nodes(overlay_fdt, op->overlay_fdt_size);
+        ret = handle_add_overlay_nodes(overlay_fdt, op->overlay_fdt_size, d);
 
     xfree(overlay_fdt);
 
+    if ( op->domain_mapping )
+        rcu_unlock_domain(d);
+
     return ret;
 }
 
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 9b19679cae..f5435f8890 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -1197,7 +1197,9 @@ struct xen_sysctl_dt_overlay {
 #define XEN_SYSCTL_DT_OVERLAY_ADD                   1
 #define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
     uint8_t overlay_op;                     /* IN: Add or remove. */
-    uint8_t pad[3];                         /* IN: Must be zero. */
+    bool domain_mapping;                    /* IN: True of False. */
+    uint8_t pad[2];                         /* IN: Must be zero. */
+    uint32_t domain_id;
 };
 #endif
 
-- 
2.34.1



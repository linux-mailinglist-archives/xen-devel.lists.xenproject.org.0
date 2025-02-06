Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAA5A29E36
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 02:09:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882394.1292573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfqO4-0000GY-Pe; Thu, 06 Feb 2025 01:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882394.1292573; Thu, 06 Feb 2025 01:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfqO4-0000BH-Hg; Thu, 06 Feb 2025 01:09:00 +0000
Received: by outflank-mailman (input) for mailman id 882394;
 Thu, 06 Feb 2025 01:08:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3EC/=U5=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1tfqO1-00072L-Lt
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 01:08:57 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2415::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef538f0a-e426-11ef-a0e7-8be0dac302b0;
 Thu, 06 Feb 2025 02:08:56 +0100 (CET)
Received: from BYAPR01CA0047.prod.exchangelabs.com (2603:10b6:a03:94::24) by
 MN0PR12MB5762.namprd12.prod.outlook.com (2603:10b6:208:375::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Thu, 6 Feb
 2025 01:08:51 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:a03:94:cafe::c1) by BYAPR01CA0047.outlook.office365.com
 (2603:10b6:a03:94::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.25 via Frontend Transport; Thu,
 6 Feb 2025 01:08:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 01:08:48 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 19:08:47 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 19:08:47 -0600
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 5 Feb 2025 19:08:46 -0600
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
X-Inumbo-ID: ef538f0a-e426-11ef-a0e7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RiYfqIY9NSJmeIgyqllFnhz3u/JDL3IS01XB9QYF5I+lugoxeihHoTiRGp2Ha6Nulk43UmtUa9xKB3whPkkyH7+lerIppTEDTFDMhnjjpYtKeW2Wgut7nJsgkj1VXUUZDOzwZLCdBUAQ0i71wYfq+yIciWKBYP35nM+pVjlneWsZCdtEFzzFj8X0R9zBK6b28i180i75cW7umxrAhODb4PPGYlTp6kDgCHrtptIXj2IrsgFWNwwU/mjY7mjDOxhj31XHfgo4cPF3OFAtkoqtCg8VGwEtEEeC7zmE4aj0e+VrB1URbPt0BuKrj+j4m46qDXoQ+8bo4UP67R3Rw36seg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzZbJUo+E4TPTik2k3AaxTkcuvimPBLJBLsquMRVjxo=;
 b=RsVbVQE7VGX1gpLHIgdx5LJYDAZuK7ofgUopNU8AzTNR92juhj8/8mO77a9JtbjY0MuvKrllDnHQAwo2eUVGbuUTX4yxz/Ou4moAxefeWieXazOCr3HkLZvzokCC5cOEXdpCRdA+6/Zgqwg33SkTWLppb8GStRpgrcAV9hIceFWpQWHdsUkGRSckJWHUYQERtjs4kkUBb3DZYzjmYZmRJJW+numxgACaYiSmKoulpI9FrInfRQJO9GxRaJzVMZ4dEDgtEFi1sN/X+LkCmZlS9Icju8KpfW2giGXr8nDJWWrPOrIe3Ivk8NNpF1OfnpmRMIqA04qTc6A3SAv54+eYtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzZbJUo+E4TPTik2k3AaxTkcuvimPBLJBLsquMRVjxo=;
 b=bmX63a8CCoILE4i3mDskxjY3mJ2uXSL9/CCabB/F1JHrbjF4a8FBtEnpFr5ZxVP/rGIZ6eDUr45F1Gcnd7a67VuuEDWurhYavHJf20Iw/KxzKKoHbMQ+cYs4s0PPuaFdcLyVEfves4opLY8igB9JXRi77BhL60MM/CrggIDjf2w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>, <julien@xen.org>,
	<michal.orzel@amd.com>, <Volodymyr_Babchuk@epam.com>, Henry Wang
	<xin.wang2@amd.com>, Alec Kwapis <alec.kwapis@medtronic.com>, "Daniel P .
 Smith" <dpsmith@apertussolutions.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v5 3/9] xen/arm: Alloc XenStore page for Dom0less DomUs from hypervisor
Date: Wed, 5 Feb 2025 17:08:37 -0800
Message-ID: <20250206010843.618280-3-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|MN0PR12MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: 74f39a0d-75e1-45d0-db92-08dd464ad008
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m4BwnJuJ37e0Wykij1r9g9bmZFvZcVw/ytnXDT8yDJcqaOjwEMZ0KXfU1sn4?=
 =?us-ascii?Q?/zjK06C0HeL977Hu10v9WexVYBB9Auxjd86F08HKS3OXlWc5p0B3WjS5BfcR?=
 =?us-ascii?Q?cYecBqihx3l2Nm0gF71ujrE1oBylXqjACkcbXAUOS9xqY+NryUbDehW2wB+T?=
 =?us-ascii?Q?u6A4R77ipn3FlfkN6HlF7bfQWBfMox/cQdTf2SNnFzpHNI5ohFc4y8bTWLXg?=
 =?us-ascii?Q?DQrtJjNKdYReK57a3k85WCG9aJ7f3JB7Bz6bqGDjTcAMKuJWsLGadi4z0M2C?=
 =?us-ascii?Q?lClBxM7MAHbsORwGIcxw3HT3B9+YEZc63LVjwBLMm85AwicU5JBGkCwSqyY4?=
 =?us-ascii?Q?JFQjkhGAqB5v7lN/6Ha1i6WbDnHUEgUFe94zjEbwXPQfRSLonumKFDEF8FTz?=
 =?us-ascii?Q?XzM4LuKPExwWR3z6ddYjpEw9a1OD0Q+FUcbgr6AC8SWVssLapxO0H2MdFLrs?=
 =?us-ascii?Q?XbR8u3gZVYXFA1PB9Ikbmt8620vAmuUYGTWZOKeLbKSrNjZu8vVOPA3Ih3Rs?=
 =?us-ascii?Q?klo84Kq6pB8dKTiRckN6Bjc1NczT/7sLnDwlx9dNe9aPIZ2Or0WTlLXGnzqE?=
 =?us-ascii?Q?aFi5HyP4ILmQzADScvP7po81D5Mvur2vaqm+zwvHQ2hvaWYWQ+OpzZk3pnCe?=
 =?us-ascii?Q?srQFlwp1LOtQE+yjFlQK6qyEgahPWUpOSVLf+dKR1HzTByoPAtMEO5FoYgj+?=
 =?us-ascii?Q?Z6eu9Gzldksh+A15ufTYa8IaWJ1oVGXUaAUWX9RZBsA3wK2u1z/So/T5k1Nd?=
 =?us-ascii?Q?CKdsXm1PujThudLe33czPHizQbPxvzcW7e7Z9KARV4Fz4NGrsSlASM3COOO0?=
 =?us-ascii?Q?kmv4NC5q0ialwAWL/ZckRcURRZtFf4BIRu6VxK+Pbr/JSczHnBRLTisL6hzh?=
 =?us-ascii?Q?BtlAgexiOxhmBfLJmjX4HiAKDOUQOLF7bigLrw0LKUo49lBDUz21fXu7VpxJ?=
 =?us-ascii?Q?csGUgWcxhQE/OOQ7FCS6oDOp9LCIXmi3NP0qASAUee7dE/6dfH9einYuvJSi?=
 =?us-ascii?Q?7rvbglTr4tcruE1+9UVy3zNzdS8m7R6YhC2/j5GM2rKWmNpJVpsItCg0oi1k?=
 =?us-ascii?Q?Q12EPLWRaxaMvHwJGDC2CnvyNFzXda54tD4tw4YRlIvKlTtpYEMwFeRBJhGq?=
 =?us-ascii?Q?5FpekAMvN4MD45ETi8+/vvIzQ7q0uvLW7tnYA6EodB/BJcUbF7ahnyizfKO6?=
 =?us-ascii?Q?yyhJMmO//wBmWv0vy6Jiae1sc3rGweTqmX51m433Tx7DEbIFR9XN9Lm7K6l5?=
 =?us-ascii?Q?IabujqPeEdcXmGDa3MgR+v+dFt3k5U7zxHDT6D+/e0cpD6DnOLcyZcgrWyX1?=
 =?us-ascii?Q?NHy6/361YWfdvp8gyU+k5OHutamYxqfhk3rVfGXnM/BjdEgulbDcW9oHt3WT?=
 =?us-ascii?Q?qxK5P9ExrQM6MMdzc7pSxmojrp+jITyBNGFNDa3MGwETi9TcVuB+uNZ+PyCQ?=
 =?us-ascii?Q?1XzBgnBNDuvDek10JThAuGojTi16G4PYGtqu1OthzzXeiRPNNEtP9bdnKlGZ?=
 =?us-ascii?Q?vuBPRwr6+pa+wQo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 01:08:48.6525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f39a0d-75e1-45d0-db92-08dd464ad008
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5762

From: Henry Wang <xin.wang2@amd.com>

There are use cases (for example using the PV driver) in Dom0less
setup that require Dom0less DomUs start immediately with Dom0, but
initialize XenStore later after Dom0's successful boot and call to
the init-dom0less application.

An error message can seen from the init-dom0less application on
1:1 direct-mapped domains:
```
Allocating magic pages
memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
Error on alloc magic pages
```

The "magic page" is a terminology used in the toolstack as reserved
pages for the VM to have access to virtual platform capabilities.
Currently the magic pages for Dom0less DomUs are populated by the
init-dom0less app through populate_physmap(), and populate_physmap()
automatically assumes gfn == mfn for 1:1 direct mapped domains. This
cannot be true for the magic pages that are allocated later from the
init-dom0less application executed in Dom0. For domain using statically
allocated memory but not 1:1 direct-mapped, similar error "failed to
retrieve a reserved page" can be seen as the reserved memory list is
empty at that time.

Since for init-dom0less, the magic page region is only for XenStore.
To solve above issue, this commit allocates the XenStore page for
Dom0less DomUs at the domain construction time. The PFN will be
noted and communicated to the init-dom0less application executed
from Dom0. To keep the XenStore late init protocol, set the connection
status to XENSTORE_RECONNECT.

Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
Suggested-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/arch/arm/dom0less-build.c | 55 ++++++++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 49d1f14d65..046439eb87 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 #include <xen/device_tree.h>
+#include <xen/domain_page.h>
 #include <xen/err.h>
 #include <xen/event.h>
 #include <xen/grant_table.h>
@@ -11,6 +12,8 @@
 #include <xen/sizes.h>
 #include <xen/vmap.h>
 
+#include <public/io/xs_wire.h>
+
 #include <asm/arm64/sve.h>
 #include <asm/dom0less-build.h>
 #include <asm/domain_build.h>
@@ -704,6 +707,53 @@ static int __init alloc_xenstore_evtchn(struct domain *d)
     return 0;
 }
 
+#define XENSTORE_PFN_OFFSET 1
+static int __init alloc_xenstore_page(struct domain *d)
+{
+    struct page_info *xenstore_pg;
+    struct xenstore_domain_interface *interface;
+    mfn_t mfn;
+    gfn_t gfn;
+    int rc;
+
+    if ( (UINT_MAX - d->max_pages) < 1 )
+    {
+        printk(XENLOG_ERR "%pd: Over-allocation for d->max_pages by 1 page.\n",
+               d);
+        return -EINVAL;
+    }
+    d->max_pages += 1;
+    xenstore_pg = alloc_domheap_page(d, MEMF_bits(32));
+    if ( xenstore_pg == NULL && is_64bit_domain(d) )
+        xenstore_pg = alloc_domheap_page(d, 0);
+    if ( xenstore_pg == NULL )
+        return -ENOMEM;
+
+    mfn = page_to_mfn(xenstore_pg);
+    if ( !mfn_x(mfn) )
+        return -ENOMEM;
+
+    if ( !is_domain_direct_mapped(d) )
+        gfn = gaddr_to_gfn(GUEST_MAGIC_BASE +
+                           (XENSTORE_PFN_OFFSET << PAGE_SHIFT));
+    else
+        gfn = gaddr_to_gfn(mfn_to_maddr(mfn));
+
+    rc = guest_physmap_add_page(d, gfn, mfn, 0);
+    if ( rc )
+    {
+        free_domheap_page(xenstore_pg);
+        return rc;
+    }
+
+    d->arch.hvm.params[HVM_PARAM_STORE_PFN] = gfn_x(gfn);
+    interface = map_domain_page(mfn);
+    interface->connection = XENSTORE_RECONNECT;
+    unmap_domain_page(interface);
+
+    return 0;
+}
+
 static int __init construct_domU(struct domain *d,
                                  const struct dt_device_node *node)
 {
@@ -804,7 +854,10 @@ static int __init construct_domU(struct domain *d,
         rc = alloc_xenstore_evtchn(d);
         if ( rc < 0 )
             return rc;
-        d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
+
+        rc = alloc_xenstore_page(d);
+        if ( rc < 0 )
+            return rc;
     }
 
     return rc;
-- 
2.25.1



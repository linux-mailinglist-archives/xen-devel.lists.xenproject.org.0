Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 764918CEC85
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2024 00:55:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729966.1135343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdp4-0004rj-PP; Fri, 24 May 2024 22:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729966.1135343; Fri, 24 May 2024 22:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdp4-0004og-La; Fri, 24 May 2024 22:55:38 +0000
Received: by outflank-mailman (input) for mailman id 729966;
 Fri, 24 May 2024 22:55:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4rgR=M3=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sAdp2-0003hQ-Po
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 22:55:36 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9ee1500-1a20-11ef-b4bb-af5377834399;
 Sat, 25 May 2024 00:55:34 +0200 (CEST)
Received: from DS0PR17CA0007.namprd17.prod.outlook.com (2603:10b6:8:191::14)
 by DS0PR12MB6534.namprd12.prod.outlook.com (2603:10b6:8:c1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20; Fri, 24 May
 2024 22:55:30 +0000
Received: from DS3PEPF0000C37B.namprd04.prod.outlook.com
 (2603:10b6:8:191:cafe::fa) by DS0PR17CA0007.outlook.office365.com
 (2603:10b6:8:191::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Fri, 24 May 2024 22:55:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Fri, 24 May 2024 22:55:25 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 24 May
 2024 17:55:24 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 24 May
 2024 17:55:24 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 24 May 2024 17:55:23 -0500
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
X-Inumbo-ID: b9ee1500-1a20-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0ZwdWwFHgIU2CPMt51i20GT77LOt4RDg0m3ViVoe+VbLR2+nwy2hqJMwpFO2IuUd6Ca/FGhpyHnEbjp1ogHiQPr7vB7SP8LWqc+AEkoMXGuJJorunMj/W7SP+9ekbG0L2wefMc3Rm/7qxWosBX/3fQ/F+sasNMBA6i9vNMc3EBLaKHRc4/uIN+9Gg5D+HNiSrt3TsoL8alcUa+yFJVOMGxBpUbRpK3WguMej4o/RJxNyG7A5fdAHmVYAB9dya0Zy9/OzECyRiqluOb3QtYtkbhPW6tA0CX1ch5rF7UkH3FEfZOE47NMfSu5CTtm8J4yrlL7hOtMDHGYp+L3NMhKfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGJKl+YgAt+elTNKQCErwYXKgmqb2xKN/qNfttPWbAw=;
 b=Gt6IeM3OQ9OlNsZBJvR/YroCFBRM8YlaVUHqhTkdhLh9kI0G3RBF47rZlNUg7prCjaKDS0f27DJzOd8V72B/B2Gi+E79GY2NcGCzhwZ15s5+zrySnGA10L/NzsRLdtUX382X2hMeynof0XJUxhBLuxCbhRDiZE60JjxQA8m3O6+t1/M5u1Mihns8SFSsCN9IRWZnV47XE1xrPvorMUboTSvkfFNeaNmxO8g+vVtJwdmWpR2l4RX3l0+hQ8PmKzoQtTusOgrHks9ZE2HtLFYqoHrJQHiwgtK6IExDffab3tjVtiYbTcOz0f6SE7cfWvgA2Zc9SAGl9MXUXIFe/4UFhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGJKl+YgAt+elTNKQCErwYXKgmqb2xKN/qNfttPWbAw=;
 b=Kss64V5TJPeoTcxFJKrTeGpbOWUFId2KMI6M+sZsx5WXqRgqyQUu/GkXmFjVtywU99TzzsXOqWuPubE5lJlB0CuwpIhcvF7ImB5j05dr/34yTwK75zUOalGvL3Y4bbk8svTsNHNuhxJSPtsBgV1vWW2bLlEgTYVkLuXTIEOm6XM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <Volodymyr_Babchuk@epam.com>, Henry Wang
	<xin.wang2@amd.com>, Alec Kwapis <alec.kwapis@medtronic.com>, "Daniel P .
 Smith" <dpsmith@apertussolutions.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v4 2/4] xen/arm: Alloc XenStore page for Dom0less DomUs from hypervisor
Date: Fri, 24 May 2024 15:55:20 -0700
Message-ID: <20240524225522.2878481-2-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2405241552240.2557291@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405241552240.2557291@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37B:EE_|DS0PR12MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b482132-61e9-491c-4234-08dc7c44996c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|376005|1800799015|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b9wWaVUXtHuKsJimiwJE+gdixTUTt56rWyUww7V5ZOSjdNSw832v/fKtmPVp?=
 =?us-ascii?Q?saMupljRZ4Ou4H6ufSNAv7VOQEYsRSGM4VSwJC8gY5MWWf4ggYh3q4GTg9sK?=
 =?us-ascii?Q?zDZGWLrZ+wTB5BF5aURYCi38Gizq1drsgHNjzRKqaIDCSXWrSLFCPDaIWOt9?=
 =?us-ascii?Q?z0KfPI6XidMECWoYSyqHSKG1wkkJ5qNPrMiJEdld6eSLWLqfe0muqXHuzf2O?=
 =?us-ascii?Q?7/2Zx9B4SQqWstFaNernwQ4hil2zn69EbU7y3hs/1r4Led1BHaCKAfl4slMN?=
 =?us-ascii?Q?6nKucpsshlZWNS+Jg1zvjTy5aNGkFHu1vpX1fNFwG8ItGJrQxIG43DzfmdbY?=
 =?us-ascii?Q?jNZu2wzzb2BDrrpmC+4P6rZ+RMDKYd9FTDGdwLHpqWOjujlz8QzAQtGHseaN?=
 =?us-ascii?Q?mQOdqgFfMDPOQ9PljvyF8BywXBOS7F0Ep2yiHfXmKvsyuiNq+D+BiGRrVjPa?=
 =?us-ascii?Q?l5TpPq3iXgEKZC1E+UNpd/QM+dIH3TDm9uXsgFlpA38ifyWE7kCdDS2jvaG3?=
 =?us-ascii?Q?TUifqczF7gOZdStPQlEyqVAO7610RRsS90EVwVB/jN+bfTi2FEokN6sTo8eD?=
 =?us-ascii?Q?o1WHskQSSuFsBK9EZiYKft2mdDdQvS+Lo5Iz8p2DN8J7062Wz/FKZi0Gko0Z?=
 =?us-ascii?Q?uGyqM2j1ghFCNuMtKwakH9FHBSbYVR1R9E5vlsKB4CZUN0xRmbAQHXIvfPBj?=
 =?us-ascii?Q?hV811+pc/Hnn+3oJXeqNTe0L25sPVuRIx5jV6/pnzZwLzFKc1MlPpyQV4tkC?=
 =?us-ascii?Q?8NGIlqFwkTu1yfoCjlTtAq1vY6gWWAAziNOiDaCuEUmphKajq/SjXLeFBYHm?=
 =?us-ascii?Q?06qZJfmqqKNEUj0KsdgKVq+TbbEmV9pF9mheXMsSvhn2HS4c6fplev6DMKAX?=
 =?us-ascii?Q?k2OsPo/CtvThgIp01OknEy4SicbpoGCZbJfj2QR4HMBPF8vvvzJEPlaSd/+V?=
 =?us-ascii?Q?3NjEOCNi4JOYL9ClVobtb6e4XfyxWHTOCtWpLzUaWdQj85lo5IvEUODc6/mS?=
 =?us-ascii?Q?VCgwyVsLpGz6os6x87M875A89ylPhOquj5CYeGHDnnRvAZMrqPRij4u09hiM?=
 =?us-ascii?Q?uF4It7aNBYNbrxxvha47DLZ/loF4qLNh2X3trWeN6KdvhZDfdE+Za3d/rdmA?=
 =?us-ascii?Q?oXWWyHqHYkx0Yph5tuJBblmtEzWF65PVxBVVn6uYVlZoKKGGedX6uIYknuqO?=
 =?us-ascii?Q?RrPkhwb8NJl86a1mgCk1fy5/FsZAb0I0sz7tBxpvSr3sP7oh9th7anzmlhtx?=
 =?us-ascii?Q?pOoppul0kdT/pdHSE75JhHt3+klpFcNtDoSf9JbialTPdnGooU+DDQtKgQgo?=
 =?us-ascii?Q?+AjB0/KOljPRli71sBwuIYOJ3brYMmnZg/ep6B9OeQMcXHT+VEQtJY7/hjw0?=
 =?us-ascii?Q?t5gfU+ko4gb8UD/iabrRIiG173er?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 22:55:25.2459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b482132-61e9-491c-4234-08dc7c44996c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6534

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
index 74f053c242..2963ecc0b3 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 #include <xen/device_tree.h>
+#include <xen/domain_page.h>
 #include <xen/err.h>
 #include <xen/event.h>
 #include <xen/grant_table.h>
@@ -10,6 +11,8 @@
 #include <xen/sizes.h>
 #include <xen/vmap.h>
 
+#include <public/io/xs_wire.h>
+
 #include <asm/arm64/sve.h>
 #include <asm/dom0less-build.h>
 #include <asm/domain_build.h>
@@ -739,6 +742,53 @@ static int __init alloc_xenstore_evtchn(struct domain *d)
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
@@ -839,7 +889,10 @@ static int __init construct_domU(struct domain *d,
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



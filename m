Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 591618C8027
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 05:24:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723789.1128877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7oCP-0007Nh-7g; Fri, 17 May 2024 03:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723789.1128877; Fri, 17 May 2024 03:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7oCP-0007Lx-4N; Fri, 17 May 2024 03:24:01 +0000
Received: by outflank-mailman (input) for mailman id 723789;
 Fri, 17 May 2024 03:23:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6mIz=MU=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s7oCN-0007En-Mo
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 03:23:59 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5f63868-13fc-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 05:23:58 +0200 (CEST)
Received: from CH0PR03CA0067.namprd03.prod.outlook.com (2603:10b6:610:cc::12)
 by CH3PR12MB7643.namprd12.prod.outlook.com (2603:10b6:610:152::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 17 May
 2024 03:23:55 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:cc:cafe::43) by CH0PR03CA0067.outlook.office365.com
 (2603:10b6:610:cc::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28 via Frontend
 Transport; Fri, 17 May 2024 03:23:55 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Fri, 17 May 2024 03:23:54 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 22:23:02 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 16 May 2024 22:22:45 -0500
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
X-Inumbo-ID: e5f63868-13fc-11ef-909e-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cM3+el3unuMU10rud3w2f70OlJrNpEKvpi+Q+OTAguVkxqQy1EGeh/zPDVabehbt5UAYwVtDGzdoEVVs9f0pcAP3D1hiqLCsNp99Y95aQZCGNAoPLJngnq968MDZ8WtqUMGF8Dy36NhGvVgtDVLc2Fohu7KNgXgNDuvjxScGAQHP6e+3eYI66E/naS05C1kuGR0E9NcQ3+KQlU7v3F/3dA35TaQo3utrE+e9ck7aqNnU5Ro1UdTdFKAL9ZXwIe72WZ/mO/w+MKIL9IkfVX7gI67rZspCVlOPXLpUvBO1TflUNjSoODhOhDSd6Glj2pvhLP1NPYjipcglmkK9XXkxxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fG1F9XegT/sJSYG6Fu85jzQtPZmim9YqynPLlOCoLeE=;
 b=lgWrhr1X7NFphekaFNfrMFCNl6qK1tkr++mr4XDCxGz/A9km37nU5ngwIcy4HRirjmSGcR/82t8BwQO5yAm5Gi34Ixd8m70wBxb0eqgYZgFWME37+kjNhYnP6jA3qZ+PS5OvrI4LFBOCTJ748mBJIkbK8KyjVIpLP+th/bmGgaUZvlF//bFMQtGiGxXNI/vWQu0C2VJGdKfp2xNNr5ttIIylc6dQl6+xTRFMd3BGgvAuKY0TFN8xxl/SyR87G1UihkM/U0LqXQbFvaHEiL4K7QCT0fx1b01Ms5ypPxoROBPGODzpfhyAU/K3FQ9JHw/zMbeg//wymwnl/AWHf3a0VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fG1F9XegT/sJSYG6Fu85jzQtPZmim9YqynPLlOCoLeE=;
 b=Ob/HghIMy4+7AuuOjEmwGtFEOFbtR+arb8ugrofvaFUDYX4Q7zHsZgp0ZD26xjdzy/d8tl6ZvG8kmokmblJrIErFGSl1toJi1mZr0/PUnVjqPal3KpA+D72UDpsrCuswIVWwlYo+lAY1FTU/0O3kK26juMiAVP3aHWScHWOcTnM=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Alec Kwapis
	<alec.kwapis@medtronic.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v3 2/4] xen/arm: Alloc XenStore page for Dom0less DomUs from hypervisor
Date: Fri, 17 May 2024 11:21:54 +0800
Message-ID: <20240517032156.1490515-3-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240517032156.1490515-1-xin.wang2@amd.com>
References: <20240517032156.1490515-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|CH3PR12MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: 36fbe1af-e58e-4651-de76-08dc7620c831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|376005|36860700004|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6BiiqWCLmIwOmluOM5NDMDVRIN7urfuugWAcSQyiQ0feyxQjQz0D547Nrx+c?=
 =?us-ascii?Q?fDDrUjkgsaPtZLWsLfmRrJro4kedSrPWWvzZ7gmrPVvNRtDwf8SHJgGhufCA?=
 =?us-ascii?Q?bzhSF3snc4lHudZsCgAXIDKA9XlIVqQOOCdb4IZsmRUtKiXmFRG6mHXosxOn?=
 =?us-ascii?Q?RVGfnAM31COHLC374WOQI3aHQZP1hFHW0mIWDKbyKsxKsHpw6gDtqKxRzliK?=
 =?us-ascii?Q?3NgAonQs0coTkpQK2bCKlAHZgW7ppepzNkge7uqOcCkRqMmGdk45WYyj3HDe?=
 =?us-ascii?Q?fa3az5RZPG038L7hfXGubIYlbZB1F4gcDcrkIE07fAjUkoi/mPEIoPY1hEbb?=
 =?us-ascii?Q?Mi1b0c8ccUaVCFk8Kyi6wY0cEThitWh49/rD00nreMTNi+PVI5zYvKInWmMs?=
 =?us-ascii?Q?SWdpjMkymw22EcDEouqV9KTT5ZzQ6ZzF8JlfAvCrHvG9RxWnaXFaKhroPVri?=
 =?us-ascii?Q?9XlqpG4RKOdzNa5eUrA+zmgu/u7L5EsQ14ESPQUJPXk05wjiscZYCiG1t4kD?=
 =?us-ascii?Q?qQUp8GjxuDs3SrGRtwhhB0L8XYZrqpGVQDvzbC4+ZyKydD47hGaOA/BF4ouq?=
 =?us-ascii?Q?UjwwStoN++E0Mnqohm/9XSqXOI/SeLftAlCfNA5s4Is7klWNEZQsop6Mxhzq?=
 =?us-ascii?Q?zKsPDSX0TC01V2Q0muSDQdCLtpikVB8uL7Nk2YN/92FSwlVAdClET9fZF2p0?=
 =?us-ascii?Q?kC6Jd/SiFCcLItZbORi1fAS7aEjQFGfyTLqQL2hlLdevZAMwR8IFblCrpXfz?=
 =?us-ascii?Q?JiMEjNakq5sNJaN8lNbMaDMyrTUknxjj0p4IRciP9o2WP45DYman1h1j5T/O?=
 =?us-ascii?Q?Hj9yD6DcWlhGbQ5tmpu6lJb77YlEgQuBwAlu3OVG64uF/fT2gcdSpdV0jiWF?=
 =?us-ascii?Q?UarCr1botGRsIJI9nIwg/VfrF/k2is8WDKStDDtXRcqKPEuEWeZJtrGcKlO8?=
 =?us-ascii?Q?Mq3Ff3qAAibJd+1VEURPcGrDcCp3RlHmwMAlQpsfbQtoTlHtcRyYbxmVEonw?=
 =?us-ascii?Q?K1Lv6sfKoTa6obqoot/7BMGX3op7i08F7AC7WU+rHYC5M0z1uAKOcMj4EDgs?=
 =?us-ascii?Q?EYP4DG5wVwUWMUHGBJXrtifl7nhiDd95tyfVCy40qg8WB2+GYxegy+OvOF1W?=
 =?us-ascii?Q?ShNiHjHPe/qmgdrmu7SViAVT7dKFGGg9uOl6b5139+Q70hEKUkDMzmb+84XJ?=
 =?us-ascii?Q?5bx+sqxykFQAHw+ymxLIv3bL7xtmtKvxDF20KP8s+OvW1poTluKjG6HTOVy5?=
 =?us-ascii?Q?VuHmk+ro8sBgh7GZE/1E2ofPP9y5tu5FVGqEU5LzmZZMgKz6vJWCizv9H6zj?=
 =?us-ascii?Q?SyGmhL19W1KdxfbB5IqzxATi+gabUggCT/YXRv0XxEykT01ikJdCIh0Q7p+V?=
 =?us-ascii?Q?/mxshxz8mWkvQoYkmjNn2iHUw0U5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 03:23:54.7635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36fbe1af-e58e-4651-de76-08dc7620c831
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7643

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
---
v3:
- Only allocate XenStore page. (Julien)
- Set HVM_PARAM_STORE_PFN and the XenStore connection status directly
  from hypervisor. (Stefano)
v2:
- Reword the commit msg to explain what is "magic page" and use generic
  terminology "hypervisor reserved pages" in commit msg. (Daniel)
- Also move the offset definition of magic pages. (Michal)
- Extract the magic page allocation logic to a function. (Michal)
---
 xen/arch/arm/dom0less-build.c | 44 ++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 74f053c242..95c4fd1a2d 100644
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
@@ -739,6 +742,42 @@ static int __init alloc_xenstore_evtchn(struct domain *d)
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
+    d->max_pages += 1;
+    xenstore_pg = alloc_domheap_page(d, 0);
+    if ( xenstore_pg == NULL )
+        return -ENOMEM;
+
+    mfn = page_to_mfn(xenstore_pg);
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
+    interface = (struct xenstore_domain_interface *)map_domain_page(mfn);
+    interface->connection = XENSTORE_RECONNECT;
+    unmap_domain_page(interface);
+
+    return 0;
+}
+
 static int __init construct_domU(struct domain *d,
                                  const struct dt_device_node *node)
 {
@@ -839,7 +878,10 @@ static int __init construct_domU(struct domain *d,
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
2.34.1



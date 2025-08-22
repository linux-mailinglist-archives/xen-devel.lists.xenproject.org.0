Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD34B324AE
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 23:43:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090519.1447699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upZXJ-00048c-Lf; Fri, 22 Aug 2025 21:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090519.1447699; Fri, 22 Aug 2025 21:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upZXJ-00046f-IZ; Fri, 22 Aug 2025 21:43:01 +0000
Received: by outflank-mailman (input) for mailman id 1090519;
 Fri, 22 Aug 2025 21:42:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=21kD=3C=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1upZXH-0003pV-OH
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 21:42:59 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20614.outbound.protection.outlook.com
 [2a01:111:f403:2414::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f81de50b-7fa0-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 23:42:59 +0200 (CEST)
Received: from SJ0PR13CA0070.namprd13.prod.outlook.com (2603:10b6:a03:2c4::15)
 by SN7PR12MB6691.namprd12.prod.outlook.com (2603:10b6:806:271::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Fri, 22 Aug
 2025 21:42:54 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::37) by SJ0PR13CA0070.outlook.office365.com
 (2603:10b6:a03:2c4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.9 via Frontend Transport; Fri,
 22 Aug 2025 21:42:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 21:42:53 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 16:42:52 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 16:42:52 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 22 Aug 2025 16:42:51 -0500
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
X-Inumbo-ID: f81de50b-7fa0-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhgahcquxdTqeD5tJY+KeJ8qP9ZqpUGkz0j8uOArbGKhGYrgkNUtJW6g8rVfRTCbj/4Sx+uzsn8jS6W996VdM6wsOCPoX3J4pB2uEVqSUQEFT9RfolW7W75kBwQxnhO2BIAqfNrSYSlABoFTVmIDeCfydfflj3MOIG2CwWZ1s2DhLMNHja+BvyCSx9TdpQt+fuLsJaDCE19DtcFuXudIy6S9va9+nF+FHVyMKbiPyLAaWCbIGe6kdWEKmuEc/PoXYrLpOEBSADai5w7Er4hYH57XKYcNYwRI3hUbXUQj07pUO/rmHn/AdMlexaJ/KxykKrn0S3YE7YbseMTj+X73PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Ldt6U+CdRnhS1CaOFYVo0mX9S23oHqk3KpaQzP5sPo=;
 b=WGj6dfGEgg3B8vFKati9KocTMeb/X8o6tilVBoapSkid8zqwnS2hXD5/xDQ9ptA0SWad+WWIw6kNekhDEC9PXD+YlWdF3XC1ipCueNoYmNsPF3x3l2nFctRkzaVZWIIrMy5YIUlIgpW8pcVaO/TxCTgBXTtJSxCJvpsJBTp2ckcXdkAO9yT/BENujhjwJtm0gwV4MteOU1itugno05h7QeFwFdQBGfbVx5s81cMkzKhHljaazLA/dOG3fuRtw/q8fC72vjfZWyl03uViYzRnnPBW/ggMlecf5QUPtygWbQoLrO0ZMTgvQjWra/2EQV/pSBHk10/50jv+tUwbTxmWaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ldt6U+CdRnhS1CaOFYVo0mX9S23oHqk3KpaQzP5sPo=;
 b=ZLdg7ACXZFTAHx45Wqb7xuZYjhjBP/P7XwNhrHtxS4zdv+hhyscJLZCUY4mPuC7acnWYxoC9Z3qsjwA03/OPvx1R00UtdZKh1QOsVDTwvOb2jhBOmxi9GOvs2+LSv8NA+cfeVNOtv49zYuw7dGpB/7L1gwJQUiHVtRJQy1uqQic=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Anthony PERARD <anthony.perard@vates.tech>, "Juergen
 Gross" <jgross@suse.com>
Subject: [PATCH v2 2/3] libs/guest: Set console page to disconnected
Date: Fri, 22 Aug 2025 17:39:44 -0400
Message-ID: <20250822213946.245307-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250822213946.245307-1-jason.andryuk@amd.com>
References: <20250822213946.245307-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|SN7PR12MB6691:EE_
X-MS-Office365-Filtering-Correlation-Id: 480c2053-16a9-4525-1925-08dde1c4d96b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5SHUpzRCU4kjklgua8Sv9M72OhQzSgQ3UYzhB41K2syzmfTGFr0hGrsRrVV/?=
 =?us-ascii?Q?fXd79xyNOadTtdSHnb0h8PbeCl5mP2YHCRgnBJsMdVoWsJeQTAt+lG/Gn4u2?=
 =?us-ascii?Q?KOl5vOBNTZe6Nh/ncCsAqdW6iF/8xUJ3WpWFGRfZRjlZ5LQQ/pFBgEkOeh01?=
 =?us-ascii?Q?JqimrH3TcEp1oaCO+Y85pTLcIk4F20Pmun9iXC22re2Lo3AgQlzXmGLJGNnJ?=
 =?us-ascii?Q?UfG/VjokegisyPwWRVgzSMV918cWlFixfhBlDBygq3XzFgrYk4K2i2E50xSR?=
 =?us-ascii?Q?kCzedPVyZ7+eJmhkmGyUzNXNHT1fUi56Q1atYNZ21l3HXhccA87BU4KhmCXO?=
 =?us-ascii?Q?yR9JDsLwidD/XshFmABOS3/RwxfwBKFr/4PjmIq/irhm3j1KM9WQ7L3QSE6/?=
 =?us-ascii?Q?4tUsfKfRoI6tKUCI4099x3Tm8qjIfmDYRoBxT+eRDT81SQJu9hMH0+sEItDh?=
 =?us-ascii?Q?WpmjgK/MnN5OkzBZKgIH26I+giYvOEkV6oLKEtPWSWR/EkNLdgtqjjywDvto?=
 =?us-ascii?Q?bdfwFo7FNQzYXuK7D3j2dXJzLDDMeONSAs4opeNsIjRICl3pybMTlaUCFuqH?=
 =?us-ascii?Q?FfX7vYvinKGdrel9J4Po5FaLhJrMkEt4w0cvdfbbhpqEWRnn9qO0gnJQvQbU?=
 =?us-ascii?Q?oY1zil1rcxClvvy5jDHQhAoZIGqt5XoScydUjqYnWZuZYl1Gj098N48r+6U6?=
 =?us-ascii?Q?J6YYoviY0byLPGGFns2FMNyf3UpFRklbFklIOWiWnXHCKYc5b39MVITBHkPA?=
 =?us-ascii?Q?CCE/hfAkIFlhUbCaaKZbfS0q2Ql9hGbzdl1igX689C6fv1hlUyKtmnZU2nF/?=
 =?us-ascii?Q?Mp0Eyc1BT42guS1mz1IFe8QY5IgQiCIqGRQBKTnCVo+8xqzJ/n/HKzhub6D5?=
 =?us-ascii?Q?cCOpTe795nGxHOy0SdkPGR3y+zGtJU/JeI/xgHAR3d+4OA/lffWTOXA/urfk?=
 =?us-ascii?Q?KqThxMsUFEjioFmLRidqBLNSMYGuaxrQhMqDZ3mnO24LKpDF6C7OqzJGy59G?=
 =?us-ascii?Q?qX61UebiBpCXuIzpqvNSz39VX/ct/XhIWA46UDQZ+/V1aZvD9f/ptCaSDNFb?=
 =?us-ascii?Q?/PYtr/Wz1dNiKBPONkjQ6imxaKmukYN4gbxLCX7uX5lipxNrNGnNnKsgdOS2?=
 =?us-ascii?Q?aSIhjrgN7/k40n/1UBmdDHN1hjFG0pA9yLbq4R9/r0k+uYEWPbqRr5da/9Il?=
 =?us-ascii?Q?28I2DH4pCnX+g4HWuOn2KQZ6OIFd3eVeaFaQTdMeJED7GlYbBpMHaLJn7WQY?=
 =?us-ascii?Q?QSKOPNK3e2e6VtFMDFDn4rOwZ8cE0yiitNf+W6zpeZuOe+BHnzd94O9oT88J?=
 =?us-ascii?Q?h6hX+77UvGUR+HX2If9wmhtuB3GeRDZdWvnHcK3IFKIhXjCNEUdpXf+0CMeu?=
 =?us-ascii?Q?fDjX54TL3XbQwXmEoJNvyMKv4qJc4zsc6bnxxBQJvImVagWoITe6ZliuVBTP?=
 =?us-ascii?Q?C4eHDWyKge6clmEsCTBgzlOWYcQF62dY8rM29mVSF/Zw1wXxSh2Z9ZDyJUZj?=
 =?us-ascii?Q?r/gXBHNveTUM9s/EnGvRV/r7FHnBkXQxFHSp?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 21:42:53.2655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 480c2053-16a9-4525-1925-08dde1c4d96b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6691

Initialize xencons_interface's connection field to
XENCONSOLE_DISCONNECTED.  xenconsoled will mark the page as connected
when it establishes the connection.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
xc_dom_console_init() seems closer to the functionality of the gnttab
functions, so I put it in xg_dom_boot.c.  It can't take a struct
xc_dom_image pointer when used with save/restore.

v2:
New
---
 tools/include/xenguest.h       |  2 ++
 tools/libs/guest/xg_dom_arm.c  |  2 +-
 tools/libs/guest/xg_dom_boot.c | 20 ++++++++++++++++++++
 tools/libs/guest/xg_dom_x86.c  |  6 +++---
 4 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index e01f494b77..1d5a6d3509 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -335,6 +335,8 @@ void *xc_dom_boot_domU_map(struct xc_dom_image *dom, xen_pfn_t pfn,
                            xen_pfn_t count);
 int xc_dom_boot_image(struct xc_dom_image *dom);
 int xc_dom_compat_check(struct xc_dom_image *dom);
+int xc_dom_console_init(xc_interface *xch, uint32_t guest_domid,
+                        xen_pfn_t console_gfn);
 int xc_dom_gnttab_init(struct xc_dom_image *dom);
 int xc_dom_gnttab_seed(xc_interface *xch, uint32_t guest_domid,
                        bool is_hvm,
diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
index 2fd8ee7ad4..c8d0918506 100644
--- a/tools/libs/guest/xg_dom_arm.c
+++ b/tools/libs/guest/xg_dom_arm.c
@@ -70,7 +70,7 @@ static int alloc_magic_pages(struct xc_dom_image *dom)
     dom->xenstore_pfn = base + XENSTORE_PFN_OFFSET;
     dom->vuart_gfn = base + VUART_PFN_OFFSET;
 
-    xc_clear_domain_page(dom->xch, dom->guest_domid, dom->console_pfn);
+    xc_dom_console_init(dom->xch, dom->guest_domid, dom->console_pfn);
     xc_clear_domain_page(dom->xch, dom->guest_domid, dom->xenstore_pfn);
     xc_clear_domain_page(dom->xch, dom->guest_domid, base + MEMACCESS_PFN_OFFSET);
     xc_clear_domain_page(dom->xch, dom->guest_domid, dom->vuart_gfn);
diff --git a/tools/libs/guest/xg_dom_boot.c b/tools/libs/guest/xg_dom_boot.c
index 5c7e12221d..b5f248e642 100644
--- a/tools/libs/guest/xg_dom_boot.c
+++ b/tools/libs/guest/xg_dom_boot.c
@@ -34,6 +34,7 @@
 #include "xg_core.h"
 #include <xen/hvm/params.h>
 #include <xen/grant_table.h>
+#include <xen/io/console.h>
 
 /* ------------------------------------------------------------------------ */
 
@@ -427,6 +428,25 @@ int xc_dom_gnttab_init(struct xc_dom_image *dom)
                               dom->console_domid, dom->xenstore_domid);
 }
 
+int xc_dom_console_init(xc_interface *xch,
+                        uint32_t domid,
+                        unsigned long dst_pfn)
+{
+    const size_t size = PAGE_SIZE;
+    struct xencons_interface *xencons = xc_map_foreign_range(
+        xch, domid, size, PROT_WRITE, dst_pfn);
+
+    if ( xencons == NULL )
+        return -1;
+
+    memset(xencons, 0, size);
+    xencons->connection = XENCONSOLE_DISCONNECTED;
+
+    munmap(xencons, size);
+    xc_domain_cacheflush(xch, domid, dst_pfn, 1);
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
index cba01384ae..a82b481a12 100644
--- a/tools/libs/guest/xg_dom_x86.c
+++ b/tools/libs/guest/xg_dom_x86.c
@@ -587,8 +587,8 @@ static int alloc_magic_pages_pv(struct xc_dom_image *dom)
     dom->console_pfn = xc_dom_alloc_page(dom, "console");
     if ( dom->console_pfn == INVALID_PFN )
         return -1;
-    xc_clear_domain_page(dom->xch, dom->guest_domid,
-                         xc_dom_p2m(dom, dom->console_pfn));
+    xc_dom_console_init(dom->xch, dom->guest_domid,
+                        xc_dom_p2m(dom, dom->console_pfn));
 
     dom->alloc_bootstack = 1;
 
@@ -734,7 +734,7 @@ static int alloc_magic_pages_hvm(struct xc_dom_image *dom)
                      special_pfn(SPECIALPAGE_IDENT_PT) << PAGE_SHIFT);
 
     dom->console_pfn = special_pfn(SPECIALPAGE_CONSOLE);
-    xc_clear_domain_page(dom->xch, dom->guest_domid, dom->console_pfn);
+    xc_dom_console_init(dom->xch, dom->guest_domid, dom->console_pfn);
 
     dom->xenstore_pfn = special_pfn(SPECIALPAGE_XENSTORE);
     xc_clear_domain_page(dom->xch, dom->guest_domid, dom->xenstore_pfn);
-- 
2.50.1



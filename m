Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E99DB8CEC83
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2024 00:55:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729963.1135324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdp0-0004Im-0w; Fri, 24 May 2024 22:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729963.1135324; Fri, 24 May 2024 22:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdoz-0004FG-Tw; Fri, 24 May 2024 22:55:33 +0000
Received: by outflank-mailman (input) for mailman id 729963;
 Fri, 24 May 2024 22:55:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4rgR=M3=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sAdoy-0003hQ-B1
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 22:55:32 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7c3f78f-1a20-11ef-b4bb-af5377834399;
 Sat, 25 May 2024 00:55:30 +0200 (CEST)
Received: from BL0PR05CA0026.namprd05.prod.outlook.com (2603:10b6:208:91::36)
 by MN0PR12MB6031.namprd12.prod.outlook.com (2603:10b6:208:3cd::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 22:55:26 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:208:91:cafe::5a) by BL0PR05CA0026.outlook.office365.com
 (2603:10b6:208:91::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.9 via Frontend
 Transport; Fri, 24 May 2024 22:55:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Fri, 24 May 2024 22:55:26 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 24 May
 2024 17:55:25 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 24 May
 2024 17:55:25 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 24 May 2024 17:55:24 -0500
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
X-Inumbo-ID: b7c3f78f-1a20-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRdSxu+XN/ZW2GQ5HrLeUE2ojTfJtJP5H833elqm8+dCzt4nobooZ9enOSnLfx1sBhcK0z7NysVwM4nBWhx3KVhwTZBXSX83xRve4KoBun0wHFzxBcKB35N60jLpD4OfIrkVpomjqF0hvXt8loDlCGavuRXNXGVIKmeDMidkm4KQ8syCaKuFlfyMSnoU0SA/4BhgWLvV6IFUmnQVN9QQdPDv5M3yhnOpresV/ZovNonTqb+H9ns3igJnXUnVq62Qf0Tg9dNv0S2bthGfiU75PpARVeoIr+ojQWtQPXX3wUvefE/8totGVUOAoxywb10wwDoBdQ4vNn+pY+pWX7H5kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FumphntemJECKnhgVYvneYgiginHtvLBa1WGte3c0qA=;
 b=afGXK/5nfdz4FNrBl1zmsXjAqV0DNrafnleTKdh0nwANYSGWdpz6PAJ4HTo6D+m3CaGOCsF+rwIURAG8408/b5AbIT/+jGhu5MlMITDs8wOFqRdHcylWD0X7zhMVp0w7XiLYzybUoI9d5l7yChu77iZOmTFCHszaDlZvMLCJBEmIdn9911Lz+jic96WIyQxBC5hwqof7nMv1uj+q/3FW8gc1tPNJyUNzOCaGXiAf4KrhwbC3LzKNqMn5BI9P2zM6M1vNew8B4ZMDh0eDigbIbNDBXUFb1D3ejaad/k8VwhRcoGMDF5tDs1BFGM1L2EXWVr9NSe/CvvHlj6QWiY9aCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FumphntemJECKnhgVYvneYgiginHtvLBa1WGte3c0qA=;
 b=fGBXjkIVv5++lnx8mqLMZJXu5BKMcnsT1Zk7j10NfC1qSTJpPkQOS65aHnIEjBOAzuJGpfRo0dQ1mD81C8BFg7AITkZeQ3BjcIicChOuJEN1px5RbOi/VRuKuTRheRN4oYbSzLfD2U30dWrm76wswsGVGNqvYsy0wcReCokSUIQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <Volodymyr_Babchuk@epam.com>, Henry Wang
	<xin.wang2@amd.com>, Alec Kwapis <alec.kwapis@medtronic.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <anthony@xenproject.org>
Subject: [PATCH v4 3/4] tools/init-dom0less: Avoid hardcoding GUEST_MAGIC_BASE
Date: Fri, 24 May 2024 15:55:21 -0700
Message-ID: <20240524225522.2878481-3-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2405241552240.2557291@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405241552240.2557291@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|MN0PR12MB6031:EE_
X-MS-Office365-Filtering-Correlation-Id: 309ceecc-faa3-4e74-3bbf-08dc7c4499e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KIxqkTzY8QQ85inv/yQ3OyXd+w3NONL2ZDLaH64xcnGIDqYEbhLNMVoLWc2Y?=
 =?us-ascii?Q?SwXHbgtNyLcicxUs5myfcVddrbXi533X5Mci20STU0Aqu/HcR8rFraGjiXnA?=
 =?us-ascii?Q?aa+dpqQYDuEqDpK4p1+sGe8CxJ8M7/Glt9Oa1jAXMGl+YUzKdGoiIZW/xn7g?=
 =?us-ascii?Q?mo1Xg8fcNj9OUJ5pxLqp0na2TrmtVjCnQpEVyV2VXAfQsBQozup7Qz1t4CPI?=
 =?us-ascii?Q?76QfEXhqUpBS6WLCBC5CQc4Vl7mAiHly55wibBY+ozJdxnO6YtHc/LJBM3R7?=
 =?us-ascii?Q?wosG6eN+RNcWOXGLWlP5IhZhPD1O4pXzkEgVAT7YnUGj+zd0NAZs4ubenZxo?=
 =?us-ascii?Q?rnqr3RFHr88dR8mmXOx/Zpom1xkTQAA3CH+jBQ1KHjvvH+H9olsLOeTs9Ol/?=
 =?us-ascii?Q?pBkIErNyCb6QOnsuCfcR9K64SogHHYJ3qhakRWseWHBJlCfvbsy+ScF1Ct5O?=
 =?us-ascii?Q?lifg5IisDeZ4QFhwmCrzs7RWjPIp7ZVB7q4Lsd4pf9YuYJ+S9V+pEh6jS7MI?=
 =?us-ascii?Q?o1sLzscU4jCt1jRFvbq904eHSB8Ogdq+KQI7yeSn0NugeoDmE/QuM90EP4de?=
 =?us-ascii?Q?NsoF3gN9Nob0WlqBOg47QOhrRng8ve+LHX/F63aDiWGwW8631/BeRacO2iAR?=
 =?us-ascii?Q?XQRScUGQsF58pM+k5q/Bw/FZ0IcvWAZqZTk1WlglXN+izXbGoLKnfpWFG1jq?=
 =?us-ascii?Q?A7oxxB2t4EOuOXaH2wSaDFn3LnKQ2LmXCNakMkTiMVm7bsgNcevsmlW1Y4+r?=
 =?us-ascii?Q?znm3xnXYmWj2VNpzuK3PMelvj8OZLgwk6MkSexLZimPYGJg3geoJ/CE/bR9c?=
 =?us-ascii?Q?6it/uiiPZLBaSXWBeGtg+rqZfFGMuauxkRL/uR/qQFsoizNrV4P00cfI8WSr?=
 =?us-ascii?Q?mAj0mP9Cozdj5w4hEjVwcE842i5GYVtakAcgeRNFRh4uKGvWyoVtywRS/hvt?=
 =?us-ascii?Q?fL3DpSP2b6ItJ8PeGlVl6FjcHZFL96p1zV6KQI+XKwtqWwrchaOipYU1sKEY?=
 =?us-ascii?Q?2xbykewpuOtAviGC1zECBwbCBFRQU9A3m7KfqtmOCoXiUyISxUecV4xjDeTm?=
 =?us-ascii?Q?ohxQu0P6RF/Ou5j6K33SZbcl9YtA5qMamCsJ6/fRy7SBMDxGzzPC957LSMVL?=
 =?us-ascii?Q?shh7nv27eJJ6a3Km8TUVozIZzLoAH9xHTN1Zbd7YMiyZrb8ewn4oJlj4Z9Po?=
 =?us-ascii?Q?eNTwVYFi6l7EXfhCwNZFthmlbHoMHh/xSvsNUqY6p6l+UGcdOSYm1uVenBdv?=
 =?us-ascii?Q?yZVayBquQ3O8lKbPRcaC8ZdLsoRNjXMQOoC95k6r1lyl/TaxJXqa7W8jjqfG?=
 =?us-ascii?Q?CEEZQpi/LoJImHsrNVrxRNtBTS5QHnKoN4WVPY0d2/vaayrJVkdu5bTBItIK?=
 =?us-ascii?Q?VLy6Vodm64w+Zy2HvsioqFewCo0R?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 22:55:26.0594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 309ceecc-faa3-4e74-3bbf-08dc7c4499e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6031

From: Henry Wang <xin.wang2@amd.com>

Currently the GUEST_MAGIC_BASE in the init-dom0less application is
hardcoded, which will lead to failures for 1:1 direct-mapped Dom0less
DomUs.

Since the guest magic region allocation from init-dom0less is for
XenStore, and the XenStore page is now allocated from the hypervisor,
instead of hardcoding the guest magic pages region, use
xc_hvm_param_get() to get the XenStore page PFN. Rename alloc_xs_page()
to get_xs_page() to reflect the changes.

With this change, some existing code is not needed anymore, including:
(1) The definition of the XenStore page offset.
(2) Call to xc_domain_setmaxmem() and xc_clear_domain_page() as we
    don't need to set the max mem and clear the page anymore.
(3) Foreign mapping of the XenStore page, setting of XenStore interface
    status and HVM_PARAM_STORE_PFN from init-dom0less, as they are set
    by the hypervisor.

Take the opportunity to do some coding style improvements when possible.

Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
CC: anthony@xenproject.org
---
 tools/helpers/init-dom0less.c | 58 +++++++++--------------------------
 1 file changed, 14 insertions(+), 44 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index fee93459c4..2b51965fa7 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -16,30 +16,18 @@
 
 #include "init-dom-json.h"
 
-#define XENSTORE_PFN_OFFSET 1
 #define STR_MAX_LENGTH 128
 
-static int alloc_xs_page(struct xc_interface_core *xch,
-                         libxl_dominfo *info,
-                         uint64_t *xenstore_pfn)
+static int get_xs_page(struct xc_interface_core *xch, libxl_dominfo *info,
+                       uint64_t *xenstore_pfn)
 {
     int rc;
-    const xen_pfn_t base = GUEST_MAGIC_BASE >> XC_PAGE_SHIFT;
-    xen_pfn_t p2m = (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET;
 
-    rc = xc_domain_setmaxmem(xch, info->domid,
-                             info->max_memkb + (XC_PAGE_SIZE/1024));
-    if (rc < 0)
-        return rc;
-
-    rc = xc_domain_populate_physmap_exact(xch, info->domid, 1, 0, 0, &p2m);
-    if (rc < 0)
-        return rc;
-
-    *xenstore_pfn = base + XENSTORE_PFN_OFFSET;
-    rc = xc_clear_domain_page(xch, info->domid, *xenstore_pfn);
-    if (rc < 0)
-        return rc;
+    rc = xc_hvm_param_get(xch, info->domid, HVM_PARAM_STORE_PFN, xenstore_pfn);
+    if (rc < 0) {
+        printf("Failed to get HVM_PARAM_STORE_PFN\n");
+        return 1;
+    }
 
     return 0;
 }
@@ -100,6 +88,7 @@ static bool do_xs_write_vm(struct xs_handle *xsh, xs_transaction_t t,
  */
 static int create_xenstore(struct xs_handle *xsh,
                            libxl_dominfo *info, libxl_uuid uuid,
+                           uint64_t xenstore_pfn,
                            evtchn_port_t xenstore_port)
 {
     domid_t domid;
@@ -145,8 +134,7 @@ static int create_xenstore(struct xs_handle *xsh,
     rc = snprintf(target_memkb_str, STR_MAX_LENGTH, "%"PRIu64, info->current_memkb);
     if (rc < 0 || rc >= STR_MAX_LENGTH)
         return rc;
-    rc = snprintf(ring_ref_str, STR_MAX_LENGTH, "%lld",
-                  (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET);
+    rc = snprintf(ring_ref_str, STR_MAX_LENGTH, "%"PRIu64, xenstore_pfn);
     if (rc < 0 || rc >= STR_MAX_LENGTH)
         return rc;
     rc = snprintf(xenstore_port_str, STR_MAX_LENGTH, "%u", xenstore_port);
@@ -230,7 +218,6 @@ static int init_domain(struct xs_handle *xsh,
     libxl_uuid uuid;
     uint64_t xenstore_evtchn, xenstore_pfn;
     int rc;
-    struct xenstore_domain_interface *intf;
 
     printf("Init dom0less domain: %u\n", info->domid);
 
@@ -245,20 +232,11 @@ static int init_domain(struct xs_handle *xsh,
     if (!xenstore_evtchn)
         return 0;
 
-    /* Alloc xenstore page */
-    if (alloc_xs_page(xch, info, &xenstore_pfn) != 0) {
-        printf("Error on alloc magic pages\n");
-        return 1;
-    }
-
-    intf = xenforeignmemory_map(xfh, info->domid, PROT_READ | PROT_WRITE, 1,
-                                &xenstore_pfn, NULL);
-    if (!intf) {
-        printf("Error mapping xenstore page\n");
+    /* Get xenstore page */
+    if (get_xs_page(xch, info, &xenstore_pfn) != 0) {
+        printf("Error on getting xenstore page\n");
         return 1;
     }
-    intf->connection = XENSTORE_RECONNECT;
-    xenforeignmemory_unmap(xfh, intf, 1);
 
     rc = xc_dom_gnttab_seed(xch, info->domid, true,
                             (xen_pfn_t)-1, xenstore_pfn, 0, 0);
@@ -272,19 +250,11 @@ static int init_domain(struct xs_handle *xsh,
     if (rc)
         err(1, "gen_stub_json_config");
 
-    /* Now everything is ready: set HVM_PARAM_STORE_PFN */
-    rc = xc_hvm_param_set(xch, info->domid, HVM_PARAM_STORE_PFN,
-                          xenstore_pfn);
-    if (rc < 0)
-        return rc;
-
-    rc = create_xenstore(xsh, info, uuid, xenstore_evtchn);
+    rc = create_xenstore(xsh, info, uuid, xenstore_pfn, xenstore_evtchn);
     if (rc)
         err(1, "writing to xenstore");
 
-    rc = xs_introduce_domain(xsh, info->domid,
-            (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET,
-            xenstore_evtchn);
+    rc = xs_introduce_domain(xsh, info->domid, xenstore_pfn, xenstore_evtchn);
     if (!rc)
         err(1, "xs_introduce_domain");
     return 0;
-- 
2.25.1



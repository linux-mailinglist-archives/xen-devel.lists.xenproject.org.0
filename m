Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D115A29E39
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 02:09:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882393.1292550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfqO2-00083j-Qh; Thu, 06 Feb 2025 01:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882393.1292550; Thu, 06 Feb 2025 01:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfqO2-0007wh-L2; Thu, 06 Feb 2025 01:08:58 +0000
Received: by outflank-mailman (input) for mailman id 882393;
 Thu, 06 Feb 2025 01:08:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3EC/=U5=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1tfqO1-0007da-2z
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 01:08:57 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20612.outbound.protection.outlook.com
 [2a01:111:f403:2408::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee7052ca-e426-11ef-99a4-01e77a169b0f;
 Thu, 06 Feb 2025 02:08:54 +0100 (CET)
Received: from CH2PR20CA0015.namprd20.prod.outlook.com (2603:10b6:610:58::25)
 by DS7PR12MB5767.namprd12.prod.outlook.com (2603:10b6:8:76::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 01:08:49 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:58:cafe::d5) by CH2PR20CA0015.outlook.office365.com
 (2603:10b6:610:58::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Thu,
 6 Feb 2025 01:08:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 01:08:49 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 19:08:48 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 19:08:48 -0600
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 5 Feb 2025 19:08:47 -0600
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
X-Inumbo-ID: ee7052ca-e426-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hjQP4IwY79s2yaEUMVxGL5KPdixCCrlLJxZt82S260lY7YDY9mDaga86UFFOM0/DfjQuAOCqSIi+liTQGGUachi2Q9ECQ3M1za9pnrUPZhDjQY1npOeDGk3s5BgqApmBjx0ja5ki2ytXEk8NgJ1uXS9vEGeAMhXzw0E3vQJoA4sRv9J6pQr1mlZ4UJUBeCk4G8iZtA0wlzam1+GFJV29thXyZf2Qd3WdTSI7ybcCoP0cggSVnOWotRShvyVOOh3LkmYYdJHqCh3XApF/VRnU29PVkZvxpgtho45SUEvF6ziuQrvoKU54RRTaCSVt+ZwTH2WTQpenaJ1US5YeoRwplQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FumphntemJECKnhgVYvneYgiginHtvLBa1WGte3c0qA=;
 b=fGJHRrD/9KUFS1/uWet6Bzt2KhzrxNirBnizhWuU/209C5NzgoCG8drOuNx2VH0dLgqMypVoOrxoOVgVkyy3zig2SQA2iEtj3DR4O5LVw80TbECT8SXoEg14RnfYiDI50DlZbBRnd3vXX5OrZbZsyZUHCGeWuWorMhQPVd7ZLX/9BOpCnL/jSunp1rd8wBUba9y3V6U7uFY4ppZFF8JgqdLY0VW4y3rcFJuL9UOyo3rxDWqm7F+sNO3RjoHAu8KPnvCs2LiGfFRmOUlBj9kstuYNxHAPha+/D9TJLLLNqXsP16EII2+U+6QS8HhWt/7qVRgLGTpD/4LcgUuZfyRnwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FumphntemJECKnhgVYvneYgiginHtvLBa1WGte3c0qA=;
 b=PZ8X8V1RA0lPOjxerL8qBBRSyw/TGlkGYyxgvreqfblU3auvkZSQcJJ9fibK/rDm0tQVCPqsYxDi5BFOOaLHrSGs5ZozpYUXlNYFKAlnA7ear59PbqgYjlo8vDvZdZeLzC2VuKbOxYp69qLK1KJmDjcrOjRmhFwiICFK0dA4HFk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>, <julien@xen.org>,
	<michal.orzel@amd.com>, <Volodymyr_Babchuk@epam.com>, Henry Wang
	<xin.wang2@amd.com>, Alec Kwapis <alec.kwapis@medtronic.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <anthony@xenproject.org>
Subject: [PATCH v5 4/9] tools/init-dom0less: Avoid hardcoding GUEST_MAGIC_BASE
Date: Wed, 5 Feb 2025 17:08:38 -0800
Message-ID: <20250206010843.618280-4-stefano.stabellini@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|DS7PR12MB5767:EE_
X-MS-Office365-Filtering-Correlation-Id: 13063b06-5081-43ea-4c30-08dd464ad067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aqbvBHH6kwj7SVf5myNNcTgDUmhJr5Eo1jXHFcCHiHNKU0LszKrQj+p3ke5f?=
 =?us-ascii?Q?mnBiCv2lxKalN0vDp+mi9zM9mp2ki7QSsYSb9bJVZBdRbT59BOxmfwRYVkTE?=
 =?us-ascii?Q?sQD0WiV5Wu+TMLeWKgbN7mEqicvsUCk2wDYQTStGoA/QUHSSqX2aFQTlrFJ0?=
 =?us-ascii?Q?Ly0hLfhBy9N6SiHh25KMFEzD7jS4NoAoiOQGhqmzLE+bdE1LQNYkzKG5oWr3?=
 =?us-ascii?Q?ucn1Bss3m7XXb02mKaLlg3jyRul8/bpzKahFInd3KOif/+d3Cii/5hlOsAPe?=
 =?us-ascii?Q?a5YqatFwgAJXhnP5lN/iE655faMjRODdUJ49q7gsWmbMGepJIoHqlGnIExqq?=
 =?us-ascii?Q?gmJn/qctPYWXceMnXWCq4cZ3kY4oqB79ikKhFScZZKrF+OQ0raFSM55WxcRM?=
 =?us-ascii?Q?S7BKMOh4F5lYVcbFaoMnXYYdPIu6h4fSbQshGI7RQpO4CUZQ3VZuZRq055A2?=
 =?us-ascii?Q?xFoUBJ/fkXzmJ4q2a2ZyLX0kw5h3GZLQN5dbVZW8bzROhtWm0cuRmFkGzlfC?=
 =?us-ascii?Q?0OUJajKV271ZMqYJyGtrIzENLIhL14lythCFhU45I49z887jVGMtbLxWhIQS?=
 =?us-ascii?Q?qGCtz9Krh/asW5ks6wsoNhl2KxGI1scrWjIDtxtpvzYnpjsN69A4zw1+ApWy?=
 =?us-ascii?Q?2KNwsitwThVOkwwayyZZJs4vRD2i+j2hwOfiiYbn2hPYye4lLEk/ah4I5wsA?=
 =?us-ascii?Q?Hgh8+Rhh1znbZ8ZuIGEIREogpczd32GLsumbUDj7aVlOhO0P37D0BtYLXP6i?=
 =?us-ascii?Q?sJx5FJBD8lvs8Pu4DjRnxzklaJ9Dw/A1+FzsW1oy/ynYPHr3lUOCgMjtocXC?=
 =?us-ascii?Q?2MoKoh90jD5OdRaSws0HCRtCWlao3Wzb9FZhu+yHTVO90K5vaU1VsSjVAzYf?=
 =?us-ascii?Q?vwGB6bRZD82P+OunaWppwyTpqqrtiwyIVJQYAkdWoKjHazu80k2576AVREyO?=
 =?us-ascii?Q?03hKO3toOJZX/oG9MNWhhonjAGcYxIEdXOCw1KUSv/AUVJJzXNze3dM/QBVP?=
 =?us-ascii?Q?1qd3D8V1GIFuwtjzM9P3cDpAckSBpTpTbOCM96x88pigXaWiyPdId8s7kt9Z?=
 =?us-ascii?Q?k2ISHMDhGkJiHROzWkji6p1EOGefXv3ETiZkA4Y5JVdxqsMZH9iNxDmXoXZu?=
 =?us-ascii?Q?n3cY/BKmk9GzzGm/UpcKb4NnuU+l2zPdBYg6W8svI75RCrFeos/cXnA5Sy9+?=
 =?us-ascii?Q?Qu07lzxzLwVtAmyiYSEVi053pp/b3sbpF1RpPGqBg3ZEHzGTwzHbDJcwL9Sv?=
 =?us-ascii?Q?HvIOzdql8sKk4xj9j+CiT6D2+7aj0wPieM+wKc0NeztTU3bVhNyGmBotG0w4?=
 =?us-ascii?Q?Bum3pTiJgaQyncG8PxCotTyKhcbBD6swZ5xIDN50K5HCJjoupPhYdySFMWh+?=
 =?us-ascii?Q?dUe+gHQjDtYC/3uXoA31WENjbRPAASBI/BVsbGiXSJCglaFSCv7hj0NYwliR?=
 =?us-ascii?Q?4OCmJmN6qJSn1oOOkdy28irA4TUT3TZwC835ZHQFOKKwaEvXL7ahGf1VeWa+?=
 =?us-ascii?Q?wCRvVRAm2XAEsus=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 01:08:49.3652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13063b06-5081-43ea-4c30-08dd464ad067
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5767

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



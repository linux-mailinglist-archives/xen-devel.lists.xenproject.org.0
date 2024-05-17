Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6588C8028
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 05:24:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723791.1128887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7oCa-0007lR-F0; Fri, 17 May 2024 03:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723791.1128887; Fri, 17 May 2024 03:24:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7oCa-0007ij-CM; Fri, 17 May 2024 03:24:12 +0000
Received: by outflank-mailman (input) for mailman id 723791;
 Fri, 17 May 2024 03:24:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6mIz=MU=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s7oCZ-0006l6-CG
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 03:24:11 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec385ba3-13fc-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 05:24:09 +0200 (CEST)
Received: from CH2PR12CA0022.namprd12.prod.outlook.com (2603:10b6:610:57::32)
 by CYYPR12MB8701.namprd12.prod.outlook.com (2603:10b6:930:bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Fri, 17 May
 2024 03:24:07 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::c5) by CH2PR12CA0022.outlook.office365.com
 (2603:10b6:610:57::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30 via Frontend
 Transport; Fri, 17 May 2024 03:24:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Fri, 17 May 2024 03:24:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 22:23:54 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 16 May 2024 22:23:23 -0500
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
X-Inumbo-ID: ec385ba3-13fc-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z1XYILrUxe22f+CO8p9a/Uy7Poo7DKsvyV4yI6p+LfGwfkcvdTz629vvLFTxr1DFF6TiKcTFOTJZtxCf6oyyB46z2sYsALR2xh8KbP1WeuPHzexdedS1dgZmMx9pYKGp96/q5Wq11teXco0VYDJ5m+F2pk7zqqx4nS7S2I6PhKZfQlxjqiFYXTyJDeG8n72xivvPXwvSjYOr0blm6B2fTtisdDOyawr918RW85ortydi/yLheM1Rhnmzz+B3L50shDv93LM0CVU2zatFp7z0RdtQOxA0ROyrinu1cz7XavlGlTOLpAPGF9FXUsfcHrD6NKqDeOp0LipiZY/1snYP9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GyKN4QF9fVjSu+AyjNRAOue0Obnrq0vCp9OkHGHQS+8=;
 b=Ug61W5mJiOquEseiazbkFBTgKoFK+ldvDyyduTys/YrB2fyr7lE6071VIb+AC/qvWz7WFQWfhhtJyNQtbZP5iRe/leSUyGTZcr2IPcktTMFl14NOqJyAh1+N78ONe102cVjBOSemqx71tYwE8dRqbKHRozqr9L8OV3w54YCro69/xoXx8Jk8+48h1ZgsOEAHoJTEePvhPVRDt69+UUE5QQSyH/Xb+l4ihFhQil+REdOL/hG8b/rgemRighaHDXbmtefLkoxg3onSu4x4XRoykuQXGO+sssHlJfKldXzlhDLqqCapS74Y7nGcoSbKrtHJ8WneiCWyqP6ijzAsh/NlcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyKN4QF9fVjSu+AyjNRAOue0Obnrq0vCp9OkHGHQS+8=;
 b=sYZi1WHYB2b6gqIn9RpP/IkualfsU+zpIyCDPSH48beLXbRbQD43nsRagh9nOiSmitR1e04kG2n/aywDZ9DmAxGpGnnCeZUjBAyi56F6TB5nflicCUKW/Y1EJeCC5ijsnbv3nbZvZwNBLYz7IiJPqqt4q/biwnW8E8TWt7LLoFk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Anthony PERARD <anthony@xenproject.org>,
	Alec Kwapis <alec.kwapis@medtronic.com>
Subject: [PATCH v3 3/4] tools/init-dom0less: Avoid hardcoding GUEST_MAGIC_BASE
Date: Fri, 17 May 2024 11:21:55 +0800
Message-ID: <20240517032156.1490515-4-xin.wang2@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|CYYPR12MB8701:EE_
X-MS-Office365-Filtering-Correlation-Id: 2116035e-4bcf-482a-0f45-08dc7620cef4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NQHS6Ndpm0l2r0sHPBDXsEws8+31YWiTYLcnl8J9Clp6KfWkGctnT62XMdWa?=
 =?us-ascii?Q?IwuhBBtSkSGlwqfyl3aQHOan+O1NoX7XWNlQg+iU99pulfS+9rwMkbn9mqpP?=
 =?us-ascii?Q?zEOSCs8rUEtJOfbLlz0hqDwIbo4RCo+E79A4ERiH5SmqRQ/IahHmOTfTnsCf?=
 =?us-ascii?Q?7WIWjIrmoU+tQpl482hUG/x0HNEY/JywmtCKCJIwTGlDYothq++OS7E/q2PR?=
 =?us-ascii?Q?jAtLAwu1IHCHrh4tfaqvO/ZPxIIMnr12vnqvTRTlCPZ5T2kiI32x+scFXM0d?=
 =?us-ascii?Q?ajZauCGVbq2WWr7Ockv6mG3H24M2f3Tro82bIUHdNUR/okYuF0QOk0VDA2DG?=
 =?us-ascii?Q?DmMHYOKhMx2+4t/gQPdh0q5SHIR2b3x9wQXtBogvCYPyy55EkcR7jA4bnm4N?=
 =?us-ascii?Q?WHqCXI657Hp/Bbp6Cuf2UM2zKDGtA0JG1CxvP729vOGGb8zcJAzfsDlK/gRg?=
 =?us-ascii?Q?fO9mUzSs8eJI9H0JxBJCALtsP4bUeefUSGqdD8y313qu+k8KnxsjplDRhkfg?=
 =?us-ascii?Q?SY3iOgrdq4mOS4e0f80NTrYK1ffutG36H87uTsPQoBpbsvaISpjERprAMMp+?=
 =?us-ascii?Q?woxqR+owYpPWkqWlCbZCaQCVn8KSUjI9JHpMJPLM/6lXt115cPHbDKn4J/wu?=
 =?us-ascii?Q?2NJ7Yt9jl58f+BEnUbWuVzMpQzy/7n0dHg5NIcAHLvyXXWL2+jwAGDx5z8Is?=
 =?us-ascii?Q?JKcgxTvB1N3XcsRMExVaIDMEng3SDYULbrnC4m4Vs1aIx78onyAbv24GSQVH?=
 =?us-ascii?Q?vbh0XqI0SNJzdMQZ11pPOHIgLk3sYwciwkHQrkGH59HIpBlyIr3XNfoktood?=
 =?us-ascii?Q?StIqgVfai6X1ZR+Jx1fav38bJzwXIQrKG9rpx97q/AG06Jxrlx+YduqPL6Ko?=
 =?us-ascii?Q?W8fQoYMY5nYnrC0JMnUoA5wyh6A6YAcqbTz5tpdrzrUWu3kApmHrDVb1NOu9?=
 =?us-ascii?Q?FbRdcHQ4vYRJih16nnRcmbX83GiemIJOgh44R2WAbInoxoKPa104AZdT3H1Z?=
 =?us-ascii?Q?kQW79+bY7Ew+F/Lwgv87zm2tNtlMwRFQmSOAO/xk3R8UlScoJ4gzPavZl2+p?=
 =?us-ascii?Q?KHx0Y2AvdxkCu4QgHeIAe7QrNFtg1RmhEfw9JN1cCjOGlZUvgeZPscuPUHdt?=
 =?us-ascii?Q?wxP8/an7/qJOm3Kh6GvDrY09t7LqA4JOup1u5TeiQ77yE4b9YMwGgl7akhu8?=
 =?us-ascii?Q?zeNi3SO+XHsrmCWkbmpoWtQ75AOR84++yl0o7ZnOD7ZExJzhmmthWT5yzFe7?=
 =?us-ascii?Q?agtZZg8lgzHxnvaVkNrLjRl6oaHryNZtAdCIin60pLcdaxW17r+r2Pqt64e9?=
 =?us-ascii?Q?xVze7+DdsB2KZzYDRX4TvefDy+ra62cNAyPg9cZBKU6V3x1NAHEfLvcrtwGq?=
 =?us-ascii?Q?8B4zIJtapZlHnOY2J7XxCyT2Fs/3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 03:24:06.2275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2116035e-4bcf-482a-0f45-08dc7620cef4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8701

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
---
v3:
- Only get the XenStore page.
- Drop the unneeded code.
v2:
- Update HVMOP keys name.
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
2.34.1



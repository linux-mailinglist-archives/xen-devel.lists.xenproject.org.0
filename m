Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A488B2EE1
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 05:16:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712374.1113046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0C3b-0007JP-4V; Fri, 26 Apr 2024 03:15:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712374.1113046; Fri, 26 Apr 2024 03:15:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0C3a-0007Fz-Vu; Fri, 26 Apr 2024 03:15:26 +0000
Received: by outflank-mailman (input) for mailman id 712374;
 Fri, 26 Apr 2024 03:15:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9cwh=L7=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s0C3Z-0006yc-UR
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 03:15:25 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3967c6c0-037b-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 05:15:25 +0200 (CEST)
Received: from DM6PR02CA0045.namprd02.prod.outlook.com (2603:10b6:5:177::22)
 by CY5PR12MB6525.namprd12.prod.outlook.com (2603:10b6:930:32::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 03:15:22 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:5:177:cafe::2d) by DM6PR02CA0045.outlook.office365.com
 (2603:10b6:5:177::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.27 via Frontend
 Transport; Fri, 26 Apr 2024 03:15:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Fri, 26 Apr 2024 03:15:22 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 22:15:21 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 25 Apr 2024 22:15:20 -0500
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
X-Inumbo-ID: 3967c6c0-037b-11ef-909a-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6JQJ5tb/wzo7lju7iSH21rYKMSURdjryZq7gdDAnlcb5loNEVtHMKlzsEyN3z5M9Z+CtcAxqvrvCUFIDBCMs4/lxmJpZRe7ur9sB4AvhM4CUG0+csPPUSDWVsy82dcgNtvhMJn+4nPtcfr+azyVr9nNWzX6Pcq16hiIytY2Vds4oTyvhwJ7qrnMh6kw/WqBqt7VfU66sQqqyg0MEgLqP7MnTNBHXAjZOIM16/Py+GjNIejZYGTVjC1I7+bq2e1GH/gTU1Agj2IbBVAVHh0FTq8bq0GUErkVEXqrbLZgMEPJi1gUYTekL7OPmoKHKGJugCp8YWR5zzndYLaS1unYvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9NhlDanGQKebTLZq79LUOppo21Q/6jmY2OxbeF0g1k=;
 b=oNVD4r+MyPJKts8Ltr1lPnwlhF2CE43KB0W3i5hSXeRPaM2bSujsTSRj/ZZocoB0ChwoAh5zLCfBlQU9Y20hORLbO8cSelDegrbbUKmkgW9bC5i6F/IrQ05IwDPvxaF64XiFro2etz2SfAud/IJf+XmaDPSCaTN7jSUUNQBdwQVYaGHPmwfYyIYqt0tZCwrllvDtLoZJ36HJukaDbqwqrgVw4utLY5Gwh+QBbLk6Lna/kcKuMRKRf01XaFcEuL08SPKnCEf6wKAoF6/lJtJTqSgc0GflGK+atnZZJniiCqUoRwfHfhro3iMwiyj5UUKBcb9+84R3tccgnVxheV7xOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9NhlDanGQKebTLZq79LUOppo21Q/6jmY2OxbeF0g1k=;
 b=PNfZP+70Pb8zycoYAUUVs7U7zyhxIx/FgFeNfyiB6m4ueziSZGrrh3KOqfcL2D5YVKfbE9Xht73M2SqR+UTxHKDxi47RKhHMrGOkstAwry+zuY8TetUZ0HhEJVryyEWJqUSs0E9NrlOyVidW6UmU7khI+BecmbZwvmpI8Bg8GeA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Alec Kwapis <alec.kwapis@medtronic.com>
Subject: [PATCH 3/3] tools/init-dom0less: Avoid hardcoding GUEST_MAGIC_BASE
Date: Fri, 26 Apr 2024 11:14:55 +0800
Message-ID: <20240426031455.579637-4-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240426031455.579637-1-xin.wang2@amd.com>
References: <20240426031455.579637-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|CY5PR12MB6525:EE_
X-MS-Office365-Filtering-Correlation-Id: a7f967ab-7afa-42b1-637e-08dc659f1bd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+JpSYwXogpkByo6s6Bk9UC+I7nOv7+wtbqnsHPoHC9B0BqF50UpV/nK0p7QS?=
 =?us-ascii?Q?xMhYB0o0E4ZOqR7mUmOirRi+Ch5FlzJsmvkAtuiQrN0TRM1H8a1IVjcSuCWL?=
 =?us-ascii?Q?nYrJdowrhlcsMHp9mhXdN9+WtMtq1PwutTp/oo7eCOaVsc7TtZnXvH64FpcL?=
 =?us-ascii?Q?JDw/ClLAuuHLfBuFCEjw/ogPHycEOWruy7R0NorTUVkaEfFhySqzs3wZFOVa?=
 =?us-ascii?Q?/IAlpbXio974KlCXr6RFpuIzynYCfg/Z5DEVqYflJQzazJVrPIkt/KXhA0Ej?=
 =?us-ascii?Q?VrH11TkHepKd+ytze0P4KxMejZ05uObPiILvbv5VVmCME2z1jwBkTECjLfF2?=
 =?us-ascii?Q?q8hjgFoY5W1Q1zYFasoCDzkkNIy3ztGEp4yGsRK6kWpV4j7s76sn2VNJpDmS?=
 =?us-ascii?Q?HZkL8i5YCsYom90ROYahmmPVDn/B/SY73ZtylBpgusIJqId5CLJE72AVAL/+?=
 =?us-ascii?Q?f+A75Cx1zJShOoYnXPuwtJjqGU6SF9Sk3LSsFUZ+Bqeg+vKFB5ikbL7rWJf4?=
 =?us-ascii?Q?bEyfVNY+hCnOTV6DFKW+zIX3+DGMS6/SPcAGpjLAIAMRAU3VWiK+HigE9cgq?=
 =?us-ascii?Q?Z4LFaFLtHJSAUFCaiCqUJyyK65xCrXQWk3LW7r51dr3csNzhDkEiQlLaG7U+?=
 =?us-ascii?Q?53RZoKGEBdP9JKSHXGOS+U1E+fqc7UaABSG1vKBGr9ExgN8eLlhsqnHa9ixf?=
 =?us-ascii?Q?E/6t7xlGTiqwle83Nd1jbnlDc41iQqMIwAgQADESNCmkMDIl4FRChQmCnEID?=
 =?us-ascii?Q?ipn/H2cSDNUrGhlq+yr4flssRHwiYlJN8o+zHOTz6GTwQEcM3UKSSDTAjDDI?=
 =?us-ascii?Q?k8u4+o4TA1AmSAbkXHZPMHJbUWm2tEjtxvJdEkdHppzxMo7RRAETav+cSJvM?=
 =?us-ascii?Q?pG+t3RRgNXw9s4pBgMHz4IIw9Kv8KLBsDLvNrdE7zu0vrtqDnkXyBYVRlWx9?=
 =?us-ascii?Q?HVPJ+INdq8uiHK4BsKBlr3kZ74GDNbvbqUfcr3aBf/EbCNb63iC/u4QMJQzw?=
 =?us-ascii?Q?6HtnjTHRGobrERXBEsNGpBBTV0BWpEqhbhWGzZdCVw0PwCWB+8RjhS3Lpo33?=
 =?us-ascii?Q?ry/TMlfQzSNKozhFIkGE6hT38UrSIGGdIpFl+IERzXrNFJhKycZMv8h4ffQG?=
 =?us-ascii?Q?xUTTEY9r0PpsHreIYZiYWvnL3Ie1hdHGMpzCxbps2t7V6IoFj8PScOePcXrx?=
 =?us-ascii?Q?U3TXQHWFBAr8Z0VQuHAnL9vOW4YrVb2kTeEQ4VxCIxqMTD4L0WmC9ZVzZCWf?=
 =?us-ascii?Q?MBNsmwBFQrmOCp68+zk2Jg1WGyY1OUxjY7N/Ew6mDW/MLSKE6GiQ00zq+vhZ?=
 =?us-ascii?Q?MWcZ+9Fvu9g9XL1bGSHqleOWlfmrJLi7wibb3fQnIyXmc7RDJixpbMBLjoVN?=
 =?us-ascii?Q?a85vdQWnLSOmMLNnGXslwwAoAxcY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 03:15:22.0227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f967ab-7afa-42b1-637e-08dc659f1bd6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6525

Currently the GUEST_MAGIC_BASE in the init-dom0less application is
hardcoded, which will lead to failures for 1:1 direct-mapped Dom0less
DomUs.

Since the guest magic region is now allocated from the hypervisor,
instead of hardcoding the guest magic pages region, use
xc_hvm_param_get() to get the guest magic region PFN, and based on
that the XenStore PFN can be calculated. Also, we don't need to set
the max mem anymore, so drop the call to xc_domain_setmaxmem(). Rename
the alloc_xs_page() to get_xs_page() to reflect the changes.

Take the opportunity to do some coding style improvements when possible.

Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
 tools/helpers/init-dom0less.c | 38 +++++++++++++++--------------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index fee93459c4..7f6953a818 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -19,24 +19,20 @@
 #define XENSTORE_PFN_OFFSET 1
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
+    xen_pfn_t magic_base_pfn;
 
-    rc = xc_domain_setmaxmem(xch, info->domid,
-                             info->max_memkb + (XC_PAGE_SIZE/1024));
-    if (rc < 0)
-        return rc;
-
-    rc = xc_domain_populate_physmap_exact(xch, info->domid, 1, 0, 0, &p2m);
-    if (rc < 0)
-        return rc;
+    rc = xc_hvm_param_get(xch, info->domid, HVM_PARAM_MAGIC_BASE_PFN,
+                          &magic_base_pfn);
+    if (rc < 0) {
+        printf("Failed to get HVM_PARAM_MAGIC_BASE_PFN\n");
+        return 1;
+    }
 
-    *xenstore_pfn = base + XENSTORE_PFN_OFFSET;
+    *xenstore_pfn = magic_base_pfn + XENSTORE_PFN_OFFSET;
     rc = xc_clear_domain_page(xch, info->domid, *xenstore_pfn);
     if (rc < 0)
         return rc;
@@ -100,6 +96,7 @@ static bool do_xs_write_vm(struct xs_handle *xsh, xs_transaction_t t,
  */
 static int create_xenstore(struct xs_handle *xsh,
                            libxl_dominfo *info, libxl_uuid uuid,
+                           xen_pfn_t xenstore_pfn,
                            evtchn_port_t xenstore_port)
 {
     domid_t domid;
@@ -145,8 +142,7 @@ static int create_xenstore(struct xs_handle *xsh,
     rc = snprintf(target_memkb_str, STR_MAX_LENGTH, "%"PRIu64, info->current_memkb);
     if (rc < 0 || rc >= STR_MAX_LENGTH)
         return rc;
-    rc = snprintf(ring_ref_str, STR_MAX_LENGTH, "%lld",
-                  (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET);
+    rc = snprintf(ring_ref_str, STR_MAX_LENGTH, "%"PRIu_xen_pfn, xenstore_pfn);
     if (rc < 0 || rc >= STR_MAX_LENGTH)
         return rc;
     rc = snprintf(xenstore_port_str, STR_MAX_LENGTH, "%u", xenstore_port);
@@ -245,8 +241,8 @@ static int init_domain(struct xs_handle *xsh,
     if (!xenstore_evtchn)
         return 0;
 
-    /* Alloc xenstore page */
-    if (alloc_xs_page(xch, info, &xenstore_pfn) != 0) {
+    /* Get xenstore page */
+    if (get_xs_page(xch, info, &xenstore_pfn) != 0) {
         printf("Error on alloc magic pages\n");
         return 1;
     }
@@ -278,13 +274,11 @@ static int init_domain(struct xs_handle *xsh,
     if (rc < 0)
         return rc;
 
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



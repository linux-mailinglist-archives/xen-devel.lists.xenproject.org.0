Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEABB37442
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 23:09:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095130.1450256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur0ul-0006kk-HR; Tue, 26 Aug 2025 21:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095130.1450256; Tue, 26 Aug 2025 21:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur0ul-0006iY-EK; Tue, 26 Aug 2025 21:09:11 +0000
Received: by outflank-mailman (input) for mailman id 1095130;
 Tue, 26 Aug 2025 21:09:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=etY1=3G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ur0uk-0006HZ-0i
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 21:09:10 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2405::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e73480df-82c0-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 23:09:08 +0200 (CEST)
Received: from MW4PR03CA0268.namprd03.prod.outlook.com (2603:10b6:303:b4::33)
 by IA0PR12MB8863.namprd12.prod.outlook.com (2603:10b6:208:488::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Tue, 26 Aug
 2025 21:09:02 +0000
Received: from MWH0EPF000989EA.namprd02.prod.outlook.com
 (2603:10b6:303:b4:cafe::6c) by MW4PR03CA0268.outlook.office365.com
 (2603:10b6:303:b4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.20 via Frontend Transport; Tue,
 26 Aug 2025 21:09:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EA.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Tue, 26 Aug 2025 21:09:01 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 16:09:00 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 26 Aug
 2025 14:09:00 -0700
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 16:08:59 -0500
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
X-Inumbo-ID: e73480df-82c0-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Plf6Jy8QQxDrgVSnHUYKyyiTd0jotDC3rleISMSWL8+P4w/0LRtQAHBZtu1IcFGXT81V1SN8Om8HStKqjW0WvaswRYrO7OPWRt00xiD23hUoyBnXCxHHuj4LzqFECbvwXhq7OZFGvMHEHaPjT7iANClaLRI3pYMOG6w1++V1XY5bKQGAHN7mmqJoAoi81IsIgXIfDSxbSZhgMO37TFw5Ph2rH8lK9487ZhF/g7gvGrZaDOW4lYZhbG7d7c50Fh3SRlpQWg/Ez2YkSx6GicfwyGxlknk3w31urTczJDvvcpwAF79qNovLWab98Cph4Y45r2L6oFD5vxq7TJ0Sl7vznQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hb8jV7y+eU28UgOgIGo2GBFOvkJDnI7mqTnXWpd85l4=;
 b=gLoRlQUUh+db+AfD5GbIAs7Amy3QHM9nIlboHyBfMToYKmGofjZQG04fjbsoOX4l97pnNM115QgnLT9xLIAby/zsd0stvq0L3bKTZ8FowEhI2DLjBTj/pvI2i+1yMkUp43mCElTDX+IBdK6EsHvfnt3QvC+rJyHzvj0w8tBgwQc4aivPA57BvQ/giLmHmpGQHmyLLkfDX1qTywd18eTVsTNsgaDqBP9SHZA0C5I6l9Xt3DSc73YMbyVGkzhWgjjAvUYlbatP0DefM1r9otxbL6wEPU/PNZtt7e9CuU37kSmzy0qMWF8y7p8gFGiXhdp65Z7H7IEt7fhj/PUisdNGcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hb8jV7y+eU28UgOgIGo2GBFOvkJDnI7mqTnXWpd85l4=;
 b=lL9RSeuxzyshbCrAt3+6DtSy6r0HcJMLbZPxjwbyfE+rN/KFyVdJBIS5M3eCPb/3wZMIcmNHrUarkdK7YmN9B8X4cyqwe20Td2ZU63/PrDUzvTXR84SfyLhapcF921uGbf/TdInxBJrolFDShc3GVKiCj+Ecj6nBYRgSC75zZns=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 1/8] tools/init-dom0less: Make handles global
Date: Tue, 26 Aug 2025 17:08:40 -0400
Message-ID: <20250826210847.126015-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250826210847.126015-1-jason.andryuk@amd.com>
References: <20250826210847.126015-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EA:EE_|IA0PR12MB8863:EE_
X-MS-Office365-Filtering-Correlation-Id: 51b61009-9641-4a8b-a72e-08dde4e4c819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hL7Fht0hLaEufo1NfQexMRzkIY4HseO+Bm511mNDBL1pHhsN8ihnBcGMIjPa?=
 =?us-ascii?Q?aXhiqdM1ESRNNjSqx1pokgmGoVO3vjzQdwaGuk0bN7oZc5/VEqi4Sq7C0mMy?=
 =?us-ascii?Q?4E9hfCrfdggML/SX/dzcAMfmRHh5NTwpZUsP66VJNjsbMsP9GnIY5L20EAZ0?=
 =?us-ascii?Q?gjzZgzxCKHgBS7+UMTDOApJLkbG48Efxy9mNjhZTeeRLD+D9unCyXWCDoQIH?=
 =?us-ascii?Q?sq8ybBbI8ZChEEoLs3fKChR8o1JZVVyMU8bv4/65iXJf/JV0I2+g+VTT3IVc?=
 =?us-ascii?Q?2IVg2vAJ15rMCiY2UBZEwMqQH7syigGQt+EDjy9y8sHj+S9APvT3Z2lQGC8g?=
 =?us-ascii?Q?eyewxcV+UaaLbCf72TGLIT7dNypAuRQg0RT6yLoJeuxSzIfDxAv3H2kwj91d?=
 =?us-ascii?Q?NIyWGBe9qGipzWAJjqsdWuNzqodozPeXr6UN+/kuQfeZEE1qpL4iQ9Kfi4cG?=
 =?us-ascii?Q?+icRKJOEpyx6bUTjS0OafblETZbaDmAxQImMAllTETB+ANj4gR014jS55dKR?=
 =?us-ascii?Q?5fntoHRUM5PDVo+1tUfkED68iAm3nixuPjMVK2YSyEPQuyHrI7O9x3U+kHFw?=
 =?us-ascii?Q?LcJBVRFb9tl+93ogTZC2nucyipke8AMALFSrug/y7W5mI22mo/sGTpoi6wUV?=
 =?us-ascii?Q?4q3WRgdCxjqMFONPfDhZWrmXZsRSUwAcvyQpFowOcKASv8bKCI5MNdUagSdX?=
 =?us-ascii?Q?S9gEPs2I9FqkuxC/h3MkibYeJWjLklVP6a3UAvt173uXf0UZGsP9Hf0uwaus?=
 =?us-ascii?Q?S27bav375jFvr8s3I1EbYwJoQiPyKphh/FhPnGuSZBC53CEDdWIl8OFfCy0c?=
 =?us-ascii?Q?jxwAbBLEiWLdmf37X8wppgaCKof0soQ4BiAfwB05ueqji0tkr3yMImvyDgf9?=
 =?us-ascii?Q?94o6FD1CFloRv3i2+TCjjX+KvsAUdIhMsFGNohStkBrOCRSS4Rsk9nUKuluT?=
 =?us-ascii?Q?rZjPMaimf9Xck964oCdXvecoIEG1MDtQ4UOzsbyWlYMAiw/2ThDj3vlAiJH0?=
 =?us-ascii?Q?FSrMhyvRHiosN/+4S6gqRMEXwhD+Sh/8vzpvLwaXG1dGJjjRueRMeyX6HI6o?=
 =?us-ascii?Q?HO+ko82J2iBVcP7kw1fiFO5aXEhVD19OxpY+n8eYpOLQ2kPdc1UMt6iE4yeC?=
 =?us-ascii?Q?4xagbKprBoYBls0FXS5yvvG/OhOv7JTpw3DL1/UvZcEpwdPBkSX1FVy8vfMC?=
 =?us-ascii?Q?D13HYjfxun6HU6DMFUKcuJHYNY3nwEWEgkZdgkL4RXQiI8QrcmZos0W9i5fO?=
 =?us-ascii?Q?JNaex7AsXTxiiVk9QxOiYQQlmcbkYO8M8qqb9Bi5Yv3IdK1u7n0ZRP5L08MT?=
 =?us-ascii?Q?RdOcncSUySb/SF7wmGKhaKdM5slihSGOUIlilVjf/ZoediAVsiWx2vgTCLTz?=
 =?us-ascii?Q?83wheVx2Q8zznTU8uP5OzWPb83BJQIW9B6/R4pZ3WQY4tHn+m6fucLcKsI4P?=
 =?us-ascii?Q?E8UHa/BuskjCdSNSwu7QiGSIolPG9BEKCRBjPnTxwDPouvF+jH467EDAGkvo?=
 =?us-ascii?Q?pSaSJ4nyu2LyLkYRvCusenJeUfkhTkr7dBjt?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 21:09:01.5946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b61009-9641-4a8b-a72e-08dde4e4c819
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8863

init-dom0less passes the assorted xen library handles from main
downward.  This is a little excessive in places with 4 handles passed
into configure_xenstore().

Replace the handle passing with file-scoped variables.

The xenstore helpers are not changed.  This keeps their implementation
common with the libxenstore functions that take a handle, transation,
and then additional arguments.

Suggested-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v3:
New
---
 tools/helpers/init-dom0less.c | 37 +++++++++++++++--------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index a182dce563..0b0be08449 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -18,8 +18,12 @@
 #define XENSTORE_PFN_OFFSET 1
 #define STR_MAX_LENGTH 128
 
-static int alloc_xs_page(struct xc_interface_core *xch,
-                         libxl_dominfo *info,
+static libxl_ctx *ctx;
+static struct xs_handle *xsh;
+static struct xc_interface_core *xch;
+static xenforeignmemory_handle *xfh;
+
+static int alloc_xs_page(libxl_dominfo *info,
                          uint64_t *xenstore_pfn)
 {
     int rc;
@@ -43,8 +47,7 @@ static int alloc_xs_page(struct xc_interface_core *xch,
     return 0;
 }
 
-static int get_xs_page(struct xc_interface_core *xch, libxl_dominfo *info,
-                       uint64_t *xenstore_pfn)
+static int get_xs_page(libxl_dominfo *info, uint64_t *xenstore_pfn)
 {
     int rc;
 
@@ -111,8 +114,7 @@ static bool do_xs_write_vm(struct xs_handle *xsh, xs_transaction_t t,
  * The list was retrieved by running xenstore-ls on a corresponding
  * domain started by xl/libxl.
  */
-static int create_xenstore(struct xs_handle *xsh,
-                           libxl_dominfo *info, libxl_uuid uuid,
+static int create_xenstore(libxl_dominfo *info, libxl_uuid uuid,
                            uint64_t xenstore_pfn,
                            evtchn_port_t xenstore_port)
 {
@@ -235,10 +237,7 @@ err:
     return rc;
 }
 
-static int init_domain(struct xs_handle *xsh,
-                       struct xc_interface_core *xch,
-                       xenforeignmemory_handle *xfh,
-                       libxl_dominfo *info)
+static int init_domain(libxl_dominfo *info)
 {
     libxl_uuid uuid;
     uint64_t xenstore_evtchn, xenstore_pfn;
@@ -258,13 +257,13 @@ static int init_domain(struct xs_handle *xsh,
         return 0;
 
     /* Get xenstore page */
-    if (get_xs_page(xch, info, &xenstore_pfn) != 0)
+    if (get_xs_page(info, &xenstore_pfn) != 0)
         return 1;
 
     if (xenstore_pfn == ~0ULL) {
         struct xenstore_domain_interface *intf;
 
-        rc = alloc_xs_page(xch, info, &xenstore_pfn);
+        rc = alloc_xs_page(info, &xenstore_pfn);
         if (rc != 0) {
             printf("Error on getting xenstore page\n");
             return 1;
@@ -299,7 +298,7 @@ static int init_domain(struct xs_handle *xsh,
     if (rc)
         err(1, "gen_stub_json_config");
 
-    rc = create_xenstore(xsh, info, uuid, xenstore_pfn, xenstore_evtchn);
+    rc = create_xenstore(info, uuid, xenstore_pfn, xenstore_evtchn);
     if (rc)
         err(1, "writing to xenstore");
 
@@ -310,7 +309,7 @@ static int init_domain(struct xs_handle *xsh,
 }
 
 /* Check if domain has been configured in XS */
-static bool domain_exists(struct xs_handle *xsh, int domid)
+static bool domain_exists(int domid)
 {
     return xs_is_domain_introduced(xsh, domid);
 }
@@ -318,11 +317,7 @@ static bool domain_exists(struct xs_handle *xsh, int domid)
 int main(int argc, char **argv)
 {
     libxl_dominfo *info = NULL;
-    libxl_ctx *ctx;
     int nb_vm = 0, rc = 0, i;
-    struct xs_handle *xsh = NULL;
-    struct xc_interface_core *xch = NULL;
-    xenforeignmemory_handle *xfh = NULL;
 
     /* TODO reuse libxl xsh connection */
     xsh = xs_open(0);
@@ -355,9 +350,9 @@ int main(int argc, char **argv)
             continue;
 
         printf("Checking domid: %u\n", domid);
-        if (!domain_exists(xsh, domid)) {
-            rc = init_domain(xsh, xch, xfh, &info[i]);
-            if (rc < 0) {
+        if (!domain_exists(domid)) {
+            rc = init_domain(&info[i]);
+            if (rc) {
                 fprintf(stderr, "init_domain failed.\n");
                 goto out;
             }
-- 
2.50.1



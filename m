Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51657A2B879
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 02:54:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883271.1293344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgDZ6-0003rD-99; Fri, 07 Feb 2025 01:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883271.1293344; Fri, 07 Feb 2025 01:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgDZ5-0003mY-Ua; Fri, 07 Feb 2025 01:53:55 +0000
Received: by outflank-mailman (input) for mailman id 883271;
 Fri, 07 Feb 2025 01:53:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yNCd=U6=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1tgDZ4-00037W-4H
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 01:53:54 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20602.outbound.protection.outlook.com
 [2a01:111:f403:2408::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61c1b3cb-e4f6-11ef-a073-877d107080fb;
 Fri, 07 Feb 2025 02:53:53 +0100 (CET)
Received: from BN9PR03CA0958.namprd03.prod.outlook.com (2603:10b6:408:108::33)
 by CY8PR12MB7708.namprd12.prod.outlook.com (2603:10b6:930:87::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 01:53:47 +0000
Received: from BL6PEPF00020E63.namprd04.prod.outlook.com
 (2603:10b6:408:108:cafe::ce) by BN9PR03CA0958.outlook.office365.com
 (2603:10b6:408:108::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.25 via Frontend Transport; Fri,
 7 Feb 2025 01:53:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E63.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 01:53:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Feb
 2025 19:53:46 -0600
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Feb 2025 19:53:45 -0600
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
X-Inumbo-ID: 61c1b3cb-e4f6-11ef-a073-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=loReiXQFvbnrEuDRZj7LRuZ11cw9JNvVPmKNtKFDSut1j0QnLF3lIhS1znbvfeDFBq13bs1G/koanw9vxfS/uutQ8mw9/J04DcoW9A01tozgE9vpDagMZ/+H0zGiEY9c0iCT70ds44DM9JCH62jew1tdBuA7q155D6PK4BRcBvxnoWbo+dcU4xtikv1TCD7TLAh27+NvWKTvCTDIX5QshErBGSZySq2k3Vmpr4yUsGv3KMSSiPxHbtolgw5Doj1f7KocijPyrPiu4SBtRA9CS87bi/h7IRws8yHO3m6xRDdVGuDKFqYvY/qyK2hgpBghsKas2NJx4+Qh8hOr+y1V5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YraUCzpyaHUtOgiiBuxVZ3aTJyofgwv2U7kMIKg8sQ=;
 b=qxQ6Qi3fPrSbsYgjc+I/5Rlygmua0kipS2Z+zM980TYZR8uNHJDgi3WG5GNiuCDkrghxUXhXVECRnfVXVmG5EMXkr5UAh51rcv77MexPw0gk0Bs8U+3xSvBs0pY7eKvlAHMLGm0n0UPdPndaCwOTecPDU0Bvh1GMOERbam0OQ/uXB6TdOUHFPYBPTAyMfwFaBFMenmj2OVrHrWh+2OAAcr23L36AdFykp+BPDvWUXE+Pzi2WELtJFiRZ1MXKRF7nGG335XnuXV/MaG+KZX7Ay8ZQEsxNX3SI9ulAj4L7fdO54mhj+rRyHZm4mGx8JytiAL28YkFBkfsrL+WG7t/XfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YraUCzpyaHUtOgiiBuxVZ3aTJyofgwv2U7kMIKg8sQ=;
 b=qJXQhn+vDujUSPYcZYu9VnrrrT7EJJX7Q7aiJ5KJTwUbjqgLN6jg+h2Ggz3kvUHIBO2UPP3j/8RjBdX0Xa3HHveJ1AuOUmXZWDox2u1woN5yZ89DuHKnXNXVMUaei6wipHwMyt9v1VD/StcLVzlLDIcqV6othKUt8pmHOP0cCas=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>, <julien@xen.org>,
	<michal.orzel@amd.com>, <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v6 5/7] init-dom0less: allocate xenstore page is not already allocated
Date: Thu, 6 Feb 2025 17:53:39 -0800
Message-ID: <20250207015341.1208429-5-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2502061750480.619090@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502061750480.619090@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E63:EE_|CY8PR12MB7708:EE_
X-MS-Office365-Filtering-Correlation-Id: b2c393b6-fb7a-4f60-6d30-08dd471a42f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jbZYKao19QXMWdf+cOl07l7AJzUtEcgA7y0C6wBuP1Y50ezPyWURE4dlGmw0?=
 =?us-ascii?Q?aHzL82nIXyorTvzAGWU//v6tpk5LNGkrc+/ZJ6sMj53B7BA0t152VXBpryxy?=
 =?us-ascii?Q?Ey4LTUace4r+S/Moj4CBMCV52vK/NnOGagJ0OEZ2OqhLH00N104sj70FvQfE?=
 =?us-ascii?Q?6wWc096d0fzXDjeCPiTn8CkOOW/SDslB7Qbw0qNSlI+xyyILejQirffFomZe?=
 =?us-ascii?Q?WTJpr62UXTnBT6jZAfWy+9GPrbnWiUCYjGC15nOFkVZ7iY+4TbqvhbW4nPEJ?=
 =?us-ascii?Q?DoYUUjRNY5v8sxrd2GvSt84KjFIHRvhAJwMYW3jhJ0ylpVlzAZ5+2IrWNHFX?=
 =?us-ascii?Q?njNzEmE2cJMoH082Mh0WpacRC9s8oSIyVl6VOp8RA3/0kmViRaE2+n56IcnX?=
 =?us-ascii?Q?GlQ7AJfdLFP4Hy4hV20bca2km59EzYgQsR9gaa7ALNbZf4KFLjaLEnXapyKX?=
 =?us-ascii?Q?TskH/QvE0mqMQLYo5S+0maDeLrWnddCHRKZKDg5D9zvzjeovDrCISDZQRXNK?=
 =?us-ascii?Q?PvbYXxZg5O6ajIGIG85v6KsmrqWSiEvGBwXGaE/hhKMx4IxoBqK0q5x3OE8x?=
 =?us-ascii?Q?ZDt8fvrOHfR7aF5LU5MWHdZpIY8SoG081hD8LRxtN/C8MvpTnFM4i1n4A4Ab?=
 =?us-ascii?Q?AtlvMUrRV8ofgxQ2YjW7aB8Rga4cNtnNXP5SoTNKAoXIHak5OxAepD3HGEjW?=
 =?us-ascii?Q?qErDWyqWLRpME5RP+AHDQDvj6RY+ShlrxuBiCPDhtEeGc3tWXUYe3B8Yx5Ml?=
 =?us-ascii?Q?7jkMy9/bCZHaNQEYad7xOM1zYOoCzuPA9ocCCVll95g2Ug3dMgiMjxP89LqD?=
 =?us-ascii?Q?It6iucpIIqcyaQAYwMCpA28xGe5PJcvb1oHAHpQC7pr8mj2HxXwe5XZhyHTR?=
 =?us-ascii?Q?3bf6sB0U4U3lyQqeSERtjq+uAmmnvLQxYbrqYOkn2w4ODWdRw6bEXEi8wToe?=
 =?us-ascii?Q?IdaT797v0PwS1BLim85xi8OV73B1lp1hHF5h2Tr1y8ayRGKC83Yo9vEYdBO2?=
 =?us-ascii?Q?9knY4iZMwr2vt37DPbNNEf6BbZLuJZj5jCoBodssdCPrNLqmpGjAsTlOin/e?=
 =?us-ascii?Q?O3AH0E5eiwbslwte6TToli01hWZihqAQKkrdhEcCRBlpj46WnLtHjD8ZEFdR?=
 =?us-ascii?Q?EujRQSW8Dlww9PBjiy79gTQaDHJQ4Y4FehFJ4gNaEAPZKE7HY1J0BhmJ5SaW?=
 =?us-ascii?Q?GSOWO2EGiyI1jt0/a2Mgh2bphFktPN3AcjVaKghNAOWkYKTDgaYdwjAnSGPv?=
 =?us-ascii?Q?yFxgsBBBFteu4WZg5zLT4VGkLZMhKG2RbemMt1LvKU2Jgjf39vwBM0cFZuED?=
 =?us-ascii?Q?vS0qZky2OCpelWhW3vt5H6lc0zmLbyjYWys7rRwNPV2Hh1gdSSeb4eNkielL?=
 =?us-ascii?Q?HSKfbDEHjpPjQ+187Qficng0baq84yvGZF2RHzCq4ZqMuFsLbpCaAu2jYWjZ?=
 =?us-ascii?Q?P2uxEtvEjp1EPIpVt48TWdkdR1WOUEMhXWXzlxsvXxfv46gcqQGuQ/YoRwrR?=
 =?us-ascii?Q?5UVwOu4RYnqrFjA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 01:53:47.3734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c393b6-fb7a-4f60-6d30-08dd471a42f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7708

We check if the xenstore page is already allocated. If yes, there is
nothing to do. If no, we proceed allocating it.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v6:
- remove double blank lines

 tools/helpers/init-dom0less.c | 53 +++++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index 2b51965fa7..78c59ec5e7 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -16,8 +16,34 @@
 
 #include "init-dom-json.h"
 
+#define XENSTORE_PFN_OFFSET 1
 #define STR_MAX_LENGTH 128
 
+static int alloc_xs_page(struct xc_interface_core *xch,
+                         libxl_dominfo *info,
+                         uint64_t *xenstore_pfn)
+{
+    int rc;
+    const xen_pfn_t base = GUEST_MAGIC_BASE >> XC_PAGE_SHIFT;
+    xen_pfn_t p2m = (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET;
+
+    rc = xc_domain_setmaxmem(xch, info->domid,
+                             info->max_memkb + (XC_PAGE_SIZE/1024));
+    if (rc < 0)
+        return rc;
+
+    rc = xc_domain_populate_physmap_exact(xch, info->domid, 1, 0, 0, &p2m);
+    if (rc < 0)
+        return rc;
+
+    *xenstore_pfn = base + XENSTORE_PFN_OFFSET;
+    rc = xc_clear_domain_page(xch, info->domid, *xenstore_pfn);
+    if (rc < 0)
+        return rc;
+
+    return 0;
+}
+
 static int get_xs_page(struct xc_interface_core *xch, libxl_dominfo *info,
                        uint64_t *xenstore_pfn)
 {
@@ -233,9 +259,30 @@ static int init_domain(struct xs_handle *xsh,
         return 0;
 
     /* Get xenstore page */
-    if (get_xs_page(xch, info, &xenstore_pfn) != 0) {
-        printf("Error on getting xenstore page\n");
-        return 1;
+    if (get_xs_page(xch, info, &xenstore_pfn) != 0 || xenstore_pfn == ~0ULL) {
+        struct xenstore_domain_interface *intf;
+
+        rc = alloc_xs_page(xch, info, &xenstore_pfn);
+        if (rc != 0) {
+            printf("Error on getting xenstore page\n");
+            return 1;
+        }
+
+        intf = xenforeignmemory_map(xfh, info->domid, PROT_READ | PROT_WRITE, 1,
+                                    &xenstore_pfn, NULL);
+        if (!intf) {
+            printf("Error mapping xenstore page\n");
+            return 1;
+        }
+
+        intf->connection = XENSTORE_RECONNECT;
+        xenforeignmemory_unmap(xfh, intf, 1);
+
+        /* Now everything is ready: set HVM_PARAM_STORE_PFN */
+        rc = xc_hvm_param_set(xch, info->domid, HVM_PARAM_STORE_PFN,
+                xenstore_pfn);
+        if (rc < 0)
+            return rc;
     }
 
     rc = xc_dom_gnttab_seed(xch, info->domid, true,
-- 
2.25.1



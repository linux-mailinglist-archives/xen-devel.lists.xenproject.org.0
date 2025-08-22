Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7F1B324AF
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 23:43:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090520.1447710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upZXM-0004P2-4P; Fri, 22 Aug 2025 21:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090520.1447710; Fri, 22 Aug 2025 21:43:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upZXM-0004MB-0Q; Fri, 22 Aug 2025 21:43:04 +0000
Received: by outflank-mailman (input) for mailman id 1090520;
 Fri, 22 Aug 2025 21:43:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=21kD=3C=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1upZXJ-0003pV-W2
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 21:43:01 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20612.outbound.protection.outlook.com
 [2a01:111:f403:2415::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f93d803d-7fa0-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 23:43:01 +0200 (CEST)
Received: from BN8PR16CA0033.namprd16.prod.outlook.com (2603:10b6:408:4c::46)
 by MN2PR12MB4423.namprd12.prod.outlook.com (2603:10b6:208:24f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.16; Fri, 22 Aug
 2025 21:42:56 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:408:4c:cafe::d) by BN8PR16CA0033.outlook.office365.com
 (2603:10b6:408:4c::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.16 via Frontend Transport; Fri,
 22 Aug 2025 21:42:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 21:42:55 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 16:42:55 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 22 Aug 2025 16:42:54 -0500
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
X-Inumbo-ID: f93d803d-7fa0-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HDyctpuzeIiqxU5e4vZT4iJRtYNAAgi6RtgxYibmke2uCxMP3qVXlBIamKE4Or4N8Ip/sX9QloUQt1bNFeffOPLmg0lFlWHHms+qi0bMIMHT+rcwBkk000pxlD+c00Rc3QBNdWwz5CnR2DV1pvGs2qbpwt+FIEzw2GMSjpkOygowE3I4Jt271cIN+7caguek4RQcuWw+A8ly+qE+V6243cSk7BMClNX/aX+Ks4XE6SEi4vfbHgJzTRzQiK5dwkGcHZjNVQKf4S46UbiJl7u06jpHBjKj6PzFRwvVIppSM12v3V095frR67eBlDkUaVc0cyd45b/uPVowiv0ZnDmfHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19cplcKMnFgiawUGNbnlhakIWSLzp3vbDklKXu2XH0Y=;
 b=Nxi9H3XZ4MTZyVLy3bI2C57ewHkxFmmtik7hGhNf5jNq2En/6aXbJEXulomP1DHEl2gsbM2StAd3uBx0ARbqlnh1kLdAvw6NRMukYRP3qRRCg3FrlCTC6IxzW8guNLJe84aZlRLCj4A1aT/oK71aABlJIgBiKcuJm/aLM5q7PaLLHqawupkYE70dT+BiQbtUnCHEkfkjX/6lmltcJQ8VVL43FwGDcjJAUj5xtwcOawFq0V9mo81eBuGt4MWZTUW6SydLyV2EdgINjXhEuWcGOPD6pad0hbcpilcVmpcxaYpLQN/empTx+euw7TxyY0igks60hiJbjQCnVoLP4bfk2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19cplcKMnFgiawUGNbnlhakIWSLzp3vbDklKXu2XH0Y=;
 b=zCSZVj/aTGHR7T001loCiG4E3WTF4FhaXlm4q1V3dXq90tHKE+axQhuVTL5ZLkmHjvg3UlEvcgrviQG00eh9sIdjqrcD5+LiM6pBdmEe/mbgDjty8SZXdeimEqB4SQhT5ge3g03psFr79oR+CSy0PAA8nkvlxMoeKFn0th64xfY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Anthony PERARD <anthony.perard@vates.tech>, "Juergen
 Gross" <jgross@suse.com>
Subject: [PATCH v2 3/3] libs/guest: Set console as disconnected on resume
Date: Fri, 22 Aug 2025 17:39:45 -0400
Message-ID: <20250822213946.245307-4-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250822213946.245307-1-jason.andryuk@amd.com>
References: <20250822213946.245307-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|MN2PR12MB4423:EE_
X-MS-Office365-Filtering-Correlation-Id: 33f82a79-9729-4bd1-6c77-08dde1c4daed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WpnTmZq8+bC9CVnfcmk8u1EdI6pZGvFOMWv1ZAhTKsZMKnG+C2c32rGnjuYb?=
 =?us-ascii?Q?nVffjGs+A2BkR2HCfc16BTAEiSKbTmuLtdofIgn8BgY7xNH78hIgZnbad9jt?=
 =?us-ascii?Q?JsQbAlFsKtoD+oLo0YAJ0ROZdc9eCYaJWH2SPep+81wwF6RMC1H/SxPv1o3V?=
 =?us-ascii?Q?TsmwEdmsJ0j4pz7wd0FVf25vK+Rn9V/JRN8A/63FP6kPWtanZ4/1FoQkH4Ja?=
 =?us-ascii?Q?5lqgoyUq24BMjR9PTDf+ZVFZGCEYZAMSfe4UUmPA844LSYoUK1raSNUDl6i9?=
 =?us-ascii?Q?/IRlD9WkOf7jKDC6wUVpjgLBb5Azf6BZVUXD/S+ETPJg4qQvcEnwV/XPj5Km?=
 =?us-ascii?Q?PBjNa8wMheTkrx0ZvsVYgCAWxQWr8DYDz1JRVeipXBu9n1jxKeDv4j+FjjxC?=
 =?us-ascii?Q?P6xnj36aZOc/zMN8s4RoFl6WvW4AXtFiaaxolkbhwbcjdzLF5dmRA1UxhY+4?=
 =?us-ascii?Q?zyZlWNMpqOaDj/Q91Yj+/RDK9X+P+oAzWYimlKoZDTB6Ps+2R3Pcr30+OED4?=
 =?us-ascii?Q?XisbuFEIFfszaroJH1t5jT0zGAcdOBVyTbBtKFUTWh2Q38F6ulFDW7b3xahG?=
 =?us-ascii?Q?UTHzMTFHBqNbY+CouR5DTbi81HUoWUH+DQBuNbNaqqgmae9V7Xcl6D+yBtiW?=
 =?us-ascii?Q?9KvOPRjy3vbmm2tApXAByO6duJBdtqRzGi0BMUi89IQN166sesYeb1BYRWps?=
 =?us-ascii?Q?9jTXFGQ9ojdTlyWywrP7J1PSNZ7X3MvVMMHdvsCB85zjRF2/yAGeVIOT9Jz2?=
 =?us-ascii?Q?YXhlSsBBs9MdOKy/w8JChwb5TiCcGFk5iBKHH/FR/znaJYeF9WFhrduikMia?=
 =?us-ascii?Q?KVz3bPNVFU5URWkm7H5aYsHlhz6c5cwBnlTdpTxfcU/bAzLz1CXsglAadPCU?=
 =?us-ascii?Q?3S4MHYTZK0Q79ut1gWLjr9xIceYVJo4yBjzWJQH2JQbJUmehhN73hIgounsV?=
 =?us-ascii?Q?FR9Yjg9FwnqGrnnmuNiVYYgYqLDi7Z9ShOXBdl+Bm/izJgy9yHstSWDYragW?=
 =?us-ascii?Q?j6H+xcn9FkH7lATUbwmd/jJYoXos/3srqe/A+hIN+2onasj0TVipxVkr3Q1I?=
 =?us-ascii?Q?c9kUQ5A9s4HHg6qOugtI2A/M8zVhAI2aykhpL8W0V5K/XC9zTenNyZmu/uBc?=
 =?us-ascii?Q?XkROmrYbKUfLSChOkTcDvMiXgqE+2GxQUTl5uODjMnWyCKbnVv/xuppYomNI?=
 =?us-ascii?Q?U0QRFR40KSnzXAxjdutZiKuWvkeVAEUhDRSL12Y8HsNgvkE4XNKqLihvW66f?=
 =?us-ascii?Q?+f6gKExespGy7IWaTBQWYZaEQ6EFEz46dFSPs5eNbL6df7gO5Tx54h2WKaaE?=
 =?us-ascii?Q?e1tW5gEhKZZ3owbExu5AcCfdUy8lETNdMEv37PY1dVP4rcVOLN9RQJhPYt9H?=
 =?us-ascii?Q?+Ds7OM0AjyzTUhSx/GZpyqHmtBLnkaoCLnRT9uimgofWx9qm26AwBHSGu5FP?=
 =?us-ascii?Q?A5x1h2EbNYJu4MCY5R1W4pREWWZyzAtAFieJflE9jxs2nQWyFYLaoe8zoa2w?=
 =?us-ascii?Q?2XkPIomE+DJbjSnebcA1/Q3Zo5U8B8POVAbq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 21:42:55.8874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f82a79-9729-4bd1-6c77-08dde1c4daed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4423

There is currently an asymmetry between HVM where the page is cleared
and PV where the contents are restored.

Add xc_dom_console_set_disconnected() to only set the connection flag
for PV guests.

xenconsoled is responsible for setting the console connected when it
attaches.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
New
---
 tools/include/xenguest.h                 |  2 ++
 tools/libs/guest/xg_dom_boot.c           | 24 ++++++++++++++++++++----
 tools/libs/guest/xg_sr_restore_x86_hvm.c |  2 +-
 tools/libs/guest/xg_sr_restore_x86_pv.c  |  1 +
 4 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 1d5a6d3509..c88958faa9 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -337,6 +337,8 @@ int xc_dom_boot_image(struct xc_dom_image *dom);
 int xc_dom_compat_check(struct xc_dom_image *dom);
 int xc_dom_console_init(xc_interface *xch, uint32_t guest_domid,
                         xen_pfn_t console_gfn);
+int xc_dom_console_set_disconnected(xc_interface *xch, uint32_t guest_domid,
+                                    xen_pfn_t console_gfn);
 int xc_dom_gnttab_init(struct xc_dom_image *dom);
 int xc_dom_gnttab_seed(xc_interface *xch, uint32_t guest_domid,
                        bool is_hvm,
diff --git a/tools/libs/guest/xg_dom_boot.c b/tools/libs/guest/xg_dom_boot.c
index b5f248e642..f51b6a78c8 100644
--- a/tools/libs/guest/xg_dom_boot.c
+++ b/tools/libs/guest/xg_dom_boot.c
@@ -428,9 +428,10 @@ int xc_dom_gnttab_init(struct xc_dom_image *dom)
                               dom->console_domid, dom->xenstore_domid);
 }
 
-int xc_dom_console_init(xc_interface *xch,
-                        uint32_t domid,
-                        unsigned long dst_pfn)
+static int dom_console_init(xc_interface *xch,
+                            uint32_t domid,
+                            unsigned long dst_pfn,
+                            bool clear)
 {
     const size_t size = PAGE_SIZE;
     struct xencons_interface *xencons = xc_map_foreign_range(
@@ -439,7 +440,8 @@ int xc_dom_console_init(xc_interface *xch,
     if ( xencons == NULL )
         return -1;
 
-    memset(xencons, 0, size);
+    if (clear)
+        memset(xencons, 0, size);
     xencons->connection = XENCONSOLE_DISCONNECTED;
 
     munmap(xencons, size);
@@ -447,6 +449,20 @@ int xc_dom_console_init(xc_interface *xch,
     return 0;
 }
 
+int xc_dom_console_init(xc_interface *xch,
+                        uint32_t domid,
+                        unsigned long dst_pfn)
+{
+    return dom_console_init(xch, domid, dst_pfn, true);
+}
+
+int xc_dom_console_set_disconnected(xc_interface *xch,
+                                    uint32_t domid,
+                                    unsigned long dst_pfn)
+{
+    return dom_console_init(xch, domid, dst_pfn, false);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/guest/xg_sr_restore_x86_hvm.c b/tools/libs/guest/xg_sr_restore_x86_hvm.c
index d6ea6f3012..a5d1511fde 100644
--- a/tools/libs/guest/xg_sr_restore_x86_hvm.c
+++ b/tools/libs/guest/xg_sr_restore_x86_hvm.c
@@ -62,7 +62,7 @@ static int handle_hvm_params(struct xc_sr_context *ctx,
         {
         case HVM_PARAM_CONSOLE_PFN:
             ctx->restore.console_gfn = entry->value;
-            xc_clear_domain_page(xch, ctx->domid, entry->value);
+            xc_dom_console_init(xch, ctx->domid, entry->value);
             break;
         case HVM_PARAM_STORE_PFN:
             ctx->restore.xenstore_gfn = entry->value;
diff --git a/tools/libs/guest/xg_sr_restore_x86_pv.c b/tools/libs/guest/xg_sr_restore_x86_pv.c
index 9cd6a88022..876748c11e 100644
--- a/tools/libs/guest/xg_sr_restore_x86_pv.c
+++ b/tools/libs/guest/xg_sr_restore_x86_pv.c
@@ -208,6 +208,7 @@ static int process_start_info(struct xc_sr_context *ctx,
         goto err;
     }
 
+    xc_dom_console_set_disconnected(xch, ctx->domid, mfn);
     ctx->restore.console_gfn = mfn;
     SET_FIELD(guest_start_info, console.domU.mfn, mfn, ctx->x86.pv.width);
     SET_FIELD(guest_start_info, console.domU.evtchn,
-- 
2.50.1



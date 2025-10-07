Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B791BC0548
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 08:28:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138484.1474165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v61AC-0006Tq-Do; Tue, 07 Oct 2025 06:27:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138484.1474165; Tue, 07 Oct 2025 06:27:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v61AC-0006RT-7Y; Tue, 07 Oct 2025 06:27:08 +0000
Received: by outflank-mailman (input) for mailman id 1138484;
 Tue, 07 Oct 2025 06:27:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VgTy=4Q=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1v61AA-0006RN-Sj
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 06:27:07 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3bc7e69-a346-11f0-9d15-b5c5bf9af7f9;
 Tue, 07 Oct 2025 08:27:05 +0200 (CEST)
Received: from CYXPR03CA0016.namprd03.prod.outlook.com (2603:10b6:930:d0::24)
 by CH1PPF93AB4E694.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::61b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Tue, 7 Oct
 2025 06:27:00 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2603:10b6:930:d0:cafe::2) by CYXPR03CA0016.outlook.office365.com
 (2603:10b6:930:d0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Tue,
 7 Oct 2025 06:27:00 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Tue, 7 Oct 2025 06:26:59 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 6 Oct
 2025 23:26:59 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 6 Oct
 2025 23:26:58 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Mon, 6 Oct 2025 23:26:58 -0700
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
X-Inumbo-ID: a3bc7e69-a346-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EZ1jf76uurDDt8tFckextIuwavlfEHaNlurhO1yHq4V1NCLYJEvTgdUxWfJ7Rbhv7WVa6kt238gmmepVkTnlYepbFNO3YvsMyc5Rlls96840zAdF9o3XmBsphGsPoDr9cITLigxCYnZSLl40vt9lSCaeysc4C+yE5h+woIY8RxST1SHqkMohB+MCCd4Nd2u4+zgZmpIJQhPZfRQolpsKP1fN3/0eyTChDiOJ0zatQIeEtUMCoWd4st6+07marwTYkaTbcdNLpGE/HvAKzqJscua5Qj70B0h5wWMt5przHnSmam6MaM3yVNgWTeUr4Zx7wX2OsZAVVGJO3VKvOwRPog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4AaFdG4/kMukRfASgsxXz6Ikhpktcw485E5ohsxIVk=;
 b=yC7ho9sjOSrb1HCEnhBWk4NZ3bG+kYN07X9vq459+BVXkPf1IVGrAROCC6Gs2+Ski4gCntYvOldRE00wbKRT1MQjD5P5bwOAHE/gbTbDg29RHggkI0Z/QZ1aM1Z40pMyQx4zZQYQu7fg3Gev9Dk0mjwVJieqq3O9K90J4swCy0reXqSZMttXaWGn2/r6LGyzCXko/NutWjWNvi2xbQT9Qz1bo9TMPiagDwM9CPtsJFLY+KlEQ5IKNCTdPyK1JAgwx16ZuHmHx1AEZQsoYnkCZHaD+RBCWMmlwehj9MjrdVSEQ/6wFP5VG8I8b/TfLo3mqJE4PuZkmCfyAlY9/cCjBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4AaFdG4/kMukRfASgsxXz6Ikhpktcw485E5ohsxIVk=;
 b=Totyr4GAgM6UcEaasYiQawUexYm+cd70NZ8RJTrvzJ9SSPiR5+WCAekVx1cBL8C16vsJRfAUixFk45h7Yts//ebW/hJA6I/NtjgPr0+JPK+LgbICPaxSxmgM1KGjgTI4EGdgPOdOr0/taOZ+ZEMSfUeg2QYano/DMepj1G9RSH8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v2] tools: init-dom0less: Replace err() with more informative messages
Date: Tue, 7 Oct 2025 08:26:55 +0200
Message-ID: <20251007062656.4254-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|CH1PPF93AB4E694:EE_
X-MS-Office365-Filtering-Correlation-Id: 128ca40b-fdc8-4c91-0b40-08de056a8570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rxFyjYqeeAU3n7ZdBgwly5+phH+a2YpnbEo3iafv6hfV4qhQlpJ3U5pZTUVw?=
 =?us-ascii?Q?QEe4Yy7STyyb++u8khklYE35OEMHPJFTZl860weRz1eM0aWqGodD0OXK1T1J?=
 =?us-ascii?Q?2ELPlCjy5ed/lDpgXVO3PS37bg2d7Balhdb79IP4ziZ0wuxpNbSaIcd8Brlq?=
 =?us-ascii?Q?HtZDd1ib545ACsZkiHRq+6xjiTVfz1dqGI13qIcoP3aWDiq8WzscbuLG0+lb?=
 =?us-ascii?Q?HTgLRtKBgvbp/ZSmGDdrlyhf3kGWsgCiZRfowR6awfj/mwvqGJ4MawxXRvdF?=
 =?us-ascii?Q?G3HK0yHDSnDCyMXD5XZPdpYDuzjbV4dpw9buDYJku/rqlt1Fa5dDbd28jyHs?=
 =?us-ascii?Q?RFI9KxkJ9t48envbNQ+ZyEwR//KvFjyLtI0EQtTmlSG5b2JEML4QKBNsz+Z3?=
 =?us-ascii?Q?CROtu15dlYmh9HXlfHChuLbwRvF3PSCnbsr60tPxQJUfsoBItUI7dPPC3pNP?=
 =?us-ascii?Q?WFwHAfT/oD1UUMflGkAnrV8y3ZY6Isp3yFoNuViRKYIPK6Ms8y4yjF9qvmZ1?=
 =?us-ascii?Q?usCSkTNjp2GZBOhIQjhFZaXuAnerjCX6mdZs55n2nKbPShrcfCkoNWgCUFwI?=
 =?us-ascii?Q?i+QP5qpWqlgtiZTMQuRw5cIq5ph/uP9HoFEhosGXZ0s6f+Y4HWPEWYyt2bq9?=
 =?us-ascii?Q?n7mJgfn9zwS7WLOrXd+o6X/g58x0uUcPk5TVh1CyBbdmdk/zI78tmhAx2arQ?=
 =?us-ascii?Q?G41u8h+Vnk0HECefQYmKcIQNoDAh+I+j1I8itZhMXXo0VSm/cI9LgNZZdAer?=
 =?us-ascii?Q?Ia89n+HZykE5b842Rj7jhJWo9oEIankiHEoj9g16eo1YDk0pjQnpgDtqiCWU?=
 =?us-ascii?Q?APX+Uz1AFTYq1miIFKDnlB8yfaKXehoTLJ+42vBiYGEY3mgsh3eam7EI5TIt?=
 =?us-ascii?Q?F67lS6rhsxwYpbKNiasY0ON0qfjPu9qcNzv0og4kUhKA39qRGNbO2ck2CM3h?=
 =?us-ascii?Q?SY9RcQtaPe8Qg3shAq/T14VB9IZ4jbc9JU0TGW7B6h41E/eVIrJ6AwWHzBiq?=
 =?us-ascii?Q?f5tfl5UVLp4s3E+N4qGWPvkhwJpEq0gXWctNP4sjRBQvarNbkRU+hqGNFbel?=
 =?us-ascii?Q?6Ya1vrCiGA0IFXE/9vD5KYPbbq0Bxt8LwGTLZF8dd5mlnGPX3V6+/y7H4VIz?=
 =?us-ascii?Q?NnVVx2xTu+e+0BYGsA8M0CsePE50JZI0ETWhghl4HYf3xcQAhwowKfpXlsW0?=
 =?us-ascii?Q?ILJ4U9p+ZEVxXjJkWwdE7IAhWl9IklWQ77zZSYJh9O5dud8qO3YJcGJDtrZW?=
 =?us-ascii?Q?DxNzrnsbmRTI6Khf1qLgcOyP491foTQ1ZhZtkavZQMbKUX35xBcx2m0+DfZL?=
 =?us-ascii?Q?/wIvHzqgutRJylJDYa0musq5eVEPnmEkTZuXdXXMl029C8tu1hLUO9qmY8l1?=
 =?us-ascii?Q?OjRGac378xo452w8+vKnWlk2CQJjpRF2n1//LY7BjJS1LeOgT7lWTrv57ww+?=
 =?us-ascii?Q?4hU8PNPEuUIi4uvswG33jBfTlyGxnvBpcIa5ZNL/YEH92pDZ4Y9DuVqTfPnC?=
 =?us-ascii?Q?/vsvJw1f3fKFjG0BxrSfiKmYGMFVydxDferXp3Y+foDNdcOsOhPzKJdy2WPM?=
 =?us-ascii?Q?/gGSU8D8Kv3TloUsBk8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 06:26:59.5699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 128ca40b-fdc8-4c91-0b40-08de056a8570
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF93AB4E694

Current use of err() has the following issues:
- without setting errno, on error it results in printing e.g.:
 "init-dom0less: writing to xenstore: Success"
 This is very misleading and difficult to deduct that there was a
 failure.
- does not propagate error codes to the caller.
- skips "init_domain failed" message by exiting early.
- early exit prevents setting up any remaining domains.

Replace err() with more informative messages propagating rc when
possible.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - return -errno instead of 1 for xs_introduce_domain
 - add another bullet point in commit msg
---
 tools/helpers/init-dom0less.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index a182dce56353..851bbfff15aa 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -288,24 +288,33 @@ static int init_domain(struct xs_handle *xsh,
 
         rc = xc_dom_gnttab_seed(xch, info->domid, true,
                                 (xen_pfn_t)-1, xenstore_pfn, 0, 0);
-        if (rc)
-               err(1, "xc_dom_gnttab_seed");
+        if (rc) {
+            printf("Failed to seed gnttab entries\n");
+            return rc;
+        }
     }
 
     libxl_uuid_generate(&uuid);
     xc_domain_sethandle(xch, info->domid, libxl_uuid_bytearray(&uuid));
 
     rc = gen_stub_json_config(info->domid, &uuid);
-    if (rc)
-        err(1, "gen_stub_json_config");
+    if (rc) {
+        printf("Failed to create stub json config\n");
+        return rc;
+    }
 
     rc = create_xenstore(xsh, info, uuid, xenstore_pfn, xenstore_evtchn);
-    if (rc)
-        err(1, "writing to xenstore");
+    if (rc) {
+        printf("Failed to write to xenstore\n");
+        return rc;
+    }
 
     rc = xs_introduce_domain(xsh, info->domid, xenstore_pfn, xenstore_evtchn);
-    if (!rc)
-        err(1, "xs_introduce_domain");
+    if (!rc) {
+        printf("Failed to introduce a domain\n");
+        return -errno;
+    }
+
     return 0;
 }
 
-- 
2.43.0



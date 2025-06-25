Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8D2AE7EC2
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 12:12:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024617.1400461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUN7c-0002bs-GK; Wed, 25 Jun 2025 10:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024617.1400461; Wed, 25 Jun 2025 10:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUN7c-0002Yn-DS; Wed, 25 Jun 2025 10:12:52 +0000
Received: by outflank-mailman (input) for mailman id 1024617;
 Wed, 25 Jun 2025 10:12:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxbR=ZI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uUN7b-0002Yg-IW
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 10:12:51 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061f.outbound.protection.outlook.com
 [2a01:111:f403:200a::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1638697-51ac-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 12:12:49 +0200 (CEST)
Received: from CH2PR02CA0027.namprd02.prod.outlook.com (2603:10b6:610:4e::37)
 by DM6PR12MB4091.namprd12.prod.outlook.com (2603:10b6:5:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 25 Jun
 2025 10:12:44 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:4e:cafe::61) by CH2PR02CA0027.outlook.office365.com
 (2603:10b6:610:4e::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Wed,
 25 Jun 2025 10:12:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Wed, 25 Jun 2025 10:12:43 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 05:12:43 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 05:12:42 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 25 Jun 2025 05:12:41 -0500
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
X-Inumbo-ID: f1638697-51ac-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lr4hVe9KP3Q3AQtUxiu33Qo/mLRXFZ+a0nVOImWoTKn+VotUeGO20h+g29qXW+lTG9BhP8lP0xx/e/w2BTLRV7Wih+snmY93ZSXSDTbuWydZQdbdo8tZvUe/mGhXlqaFSiVxB0RQutapUABiwKtUESWRuVYXVT4vSY2ssM7vBSXsWwGD8te/4RDK6p4VDlAvTpox7+1NqrONzzqsLeF0iiGUAIa0op6ihaycxIa1myENtZIiJQR2dSw5rG5HeMYeTJH0oWExPVkLF6NFl0rQ4+ihqmfqhx9tTyL8w8KICimQtbchTGQ97oggy+EUubTItsWdeq56HN0ijR9VC+cyug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3hiNFzxIQZ9mKBcULLnKYBwTI1NMIdUdy4GH33M5uc=;
 b=rZu6aj4dAu7FpSIeh9mqytc1hE716IZVQTxh1jYNTGtr5ATDjGmh60siMlCEGim0jm9dNz4t7mEWRNfHRn0PuH9pBXZFapq1Uts0Y5w/0MUz+coxhoPVmmG4A3k1hCDvNFvi6M1OFqgF753ABwCuSPB6BFR0f10as84Bia1Zeuc+0Ud2JOdPlxU3r6bpDkx6n3wM37y4SkuiVzdFq/38wmz5TyZ1g6/nUZDbSuqlNuIzH7/LSTU94WXhnwzxSUliCKP5gZMnZ7AfsJxqpWMIxzSLAxcWIDz9kQ5MCDp9+auYaFV/07REKL6XwMOreCFhtgVDQCz0C5MZryIS2nUzCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3hiNFzxIQZ9mKBcULLnKYBwTI1NMIdUdy4GH33M5uc=;
 b=Yps6SHg6MF/zrsLvULkNlyVBg6KHK/jzp+vcGUE3BQpaLAPNw74biHUy7ZGjoM8HTh22AoExNCB4jvqz0WSAHlM/s/rFFY8gWXzeAJZ/DLrPTYL9rdydEhye5mQf+OYRYRYBjS58S4aZVLtFhrtqeEDufHTChZZ2A5wR6BAjD/k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Fix booting hwdom/1:1 domU with CONFIG_GRANT_TABLE=n
Date: Wed, 25 Jun 2025 12:12:30 +0200
Message-ID: <20250625101230.49653-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|DM6PR12MB4091:EE_
X-MS-Office365-Filtering-Correlation-Id: d7caad40-15da-4861-11dd-08ddb3d0d367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EbHbte8EpQUwes09fy0UWQcVAcZhfdJx4fDENVuSakyU1PtOaLVcDi4kmrW+?=
 =?us-ascii?Q?ceHgcvgjIW3RdPQD5Nv+oR1wzEQNHCWbI9CinGx+U2HjZACsWmsOvosPBODn?=
 =?us-ascii?Q?Vl0yQm5rQft+tpe9nMTRryzuckJW7QaMtiqoV63ozM3DFScU7NcUKNum1zxv?=
 =?us-ascii?Q?13hpj+KWRQS58x914SUX+5LrzVptiUqCSK3QDv/GFuNt+NzIxQiVCHqPhEOa?=
 =?us-ascii?Q?iQZVyaNW/eRLb2Ths1+tcRSvBBpm9lzNZvXGGXruIn3scG1BPlsFFyLvH08Z?=
 =?us-ascii?Q?2XtMvWIWFuzy0e2C7bXSJrzYcJZ873W+BbxBkS4LEIo0THUWrdvCzBMpF35i?=
 =?us-ascii?Q?7vIBy9g+qiaTTTjxol4J/su81s97AbI7LViWJ2bb3SjVBhvDGIXQgocOYvPC?=
 =?us-ascii?Q?fn0OzuAWCEl88l3wefHBQE5PzQC1F6XhKWV+SIlnwbTuVG86Q/sKmJdIUllv?=
 =?us-ascii?Q?50Qq82oD+HnK1Zqc8MkdGsHba6uVf6q7Y5BiV6mdyy57YYQ8I4DdikHa5bJt?=
 =?us-ascii?Q?q6ZMnuJuZCt/U3andHjCvkhuxF82yScg1a4veyaj33lEbYGLrdJRd3Z3dYTp?=
 =?us-ascii?Q?2+i2xbc3hnTk1E+V3Qn+YO1tzhu0O8bspjz3/4i0CJlcnKPsGIkm+E3drPYa?=
 =?us-ascii?Q?A0ArfgVi7muYK2T2noxzL0wngx8VwGdwMyW2G30AdODP9wzLXsneS3zKi5kI?=
 =?us-ascii?Q?GCoruhEHsUAZtVrT/8PyC6MdeYkOVrFgESaX8cRlo0hfAAQGzK7AW8i0dPzL?=
 =?us-ascii?Q?Bw40o7xnga5TUMzvbkiN8iF8Jr194KVik/dxpVsacmQ8QmirTO2Xnh996g0y?=
 =?us-ascii?Q?hwYArww8fCgcuucam/fdxh05uRsQl1yJ8Y8qmglHHGgbosUpZBHjwIaCABt2?=
 =?us-ascii?Q?Fxk9MBlrxj4pmcztSjZWR8W9mVEDVLcvIkBDPu1Exw2JaDVpEotCX60Gn10e?=
 =?us-ascii?Q?UPTUij1jS8UeAKNbu5DCw5ZiW0KCsFxkhm3NMTEPOa55nL5LdmTLxjXGn5oI?=
 =?us-ascii?Q?SZC5gi4fPSINVJYqoTv96KKN+4sPnrQxChAaYooF9UJT3QbQe7Nr5XKmYT+r?=
 =?us-ascii?Q?XbI76QSIjP16a8CXaTfsWhPVnab8dC8F71/m/xAYiHuLQ+vCxth17N6jyxaT?=
 =?us-ascii?Q?gtoJaqizmQS3WmkJmhfli2WRa7Lip7Vw85cv/COBZzgJ3EhORlTVnr4Ksxpz?=
 =?us-ascii?Q?xx1XpnBWndzDE2MD2h57I8burYlNuK6mVHBlFN1anz5HbAWN9L4QULVGZBp/?=
 =?us-ascii?Q?vjOpuq+vtSSrplq6exmPpMUA3bfPUXRIoIBOmaHsA33vo04fR7rO9uN9S/DD?=
 =?us-ascii?Q?gcnUFeLqNq1ZB3MXxvrAOlbr1Tm0aMKOrHNMALyHPiQp0hPQNR3u5rZN/Mot?=
 =?us-ascii?Q?OPzCuha3dIIQ2wM/HbhWQZiYwM1FZV/QI0pl6QGGUsZnj5OO9LZhUfNwmbKN?=
 =?us-ascii?Q?07awTwKu9tZXjETrOJCthZZ7w6ZMQLiblFxS7qIPBRlBafg3J4G394Ze13JR?=
 =?us-ascii?Q?w4RdflAwmxESzkZzxJEPIQ5t9K99ZvBsAQye?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 10:12:43.7229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7caad40-15da-4861-11dd-08ddb3d0d367
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4091

At the moment, we unconditionally allocate space for grant table region
membank and add it in the membanks array to find_unallocated_memory() to
find unused memory. In case of CONFIG_GRANT_TABLE=n, the size of the
region is empty and assertion in rangeset_remove_range() fails when
booting hwdom or 1:1 domU without IOMMU. Example:

(XEN) Assertion 's <= e' failed at common/rangeset.c:189
...
(XEN) Xen call trace:
(XEN)    [<00000a0000218b5c>] rangeset_remove_range+0xbc/0x2d4 (PC)
(XEN)    [<00000a00002b8370>] find_unallocated_memory+0x140/0x208 (LR)
(XEN)    [<00000a00002cc28c>] make_hypervisor_node+0x310/0x7e0
...

Same issue would occur when booting hwdom with LLC coloring enabled.
Fix it by performing conditional allocation and configuration.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/domain_build.c           | 19 ++++++++++++-------
 xen/common/device-tree/domain-build.c |  7 ++++++-
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 3f5c7c2e5aa8..04d3dca38a42 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1011,7 +1011,10 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
                                              struct membanks *ext_regions)
 {
     int res;
-    struct membanks *gnttab = membanks_xzalloc(1, MEMORY);
+    struct membanks *gnttab =
+        IS_ENABLED(CONFIG_GRANT_TABLE)
+        ? membanks_xzalloc(1, MEMORY)
+        : NULL;
     struct membanks *xen_reg =
         kinfo->xen_reg_assigned
         ? membanks_xzalloc(count_ranges(kinfo->xen_reg_assigned), MEMORY)
@@ -1037,12 +1040,6 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
 
     dt_dprintk("Find unallocated memory for extended regions\n");
 
-    if ( !gnttab )
-    {
-        res = -ENOMEM;
-        goto out;
-    }
-
     if ( kinfo->xen_reg_assigned )
     {
         if ( !xen_reg )
@@ -1056,9 +1053,17 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
                                rangeset_to_membank, xen_reg);
     }
 
+#ifdef CONFIG_GRANT_TABLE
+    if ( !gnttab )
+    {
+        res = -ENOMEM;
+        goto out;
+    }
+
     gnttab->nr_banks = 1;
     gnttab->bank[0].start = kinfo->gnttab_start;
     gnttab->bank[0].size = kinfo->gnttab_size;
+#endif
 
     res = find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
                                   ext_regions, add_ext_regions);
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index cd01a8b4bc9f..e6d7b8961e89 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -250,7 +250,10 @@ void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
      */
     if ( is_hardware_domain(d) )
     {
-        struct membanks *gnttab = membanks_xzalloc(1, MEMORY);
+        struct membanks *gnttab =
+            IS_ENABLED(CONFIG_GRANT_TABLE)
+            ? membanks_xzalloc(1, MEMORY)
+            : NULL;
         /*
          * Exclude the following regions:
          * 1) Remove reserved memory
@@ -261,12 +264,14 @@ void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
             gnttab,
         };
 
+#ifdef CONFIG_GRANT_TABLE
         if ( !gnttab )
             goto fail;
 
         gnttab->nr_banks = 1;
         gnttab->bank[0].start = kinfo->gnttab_start;
         gnttab->bank[0].size = kinfo->gnttab_size;
+#endif
 
         hwdom_free_mem = membanks_xzalloc(NR_MEM_BANKS, MEMORY);
         if ( !hwdom_free_mem )
-- 
2.25.1



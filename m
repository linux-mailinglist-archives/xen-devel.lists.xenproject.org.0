Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE5772F65A
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 09:31:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548485.856461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Kxj-0006Zy-Ul; Wed, 14 Jun 2023 07:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548485.856461; Wed, 14 Jun 2023 07:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Kxj-0006Xf-RI; Wed, 14 Jun 2023 07:30:39 +0000
Received: by outflank-mailman (input) for mailman id 548485;
 Wed, 14 Jun 2023 07:30:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nJe=CC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q9Kxi-0006XX-Ij
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 07:30:38 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20617.outbound.protection.outlook.com
 [2a01:111:f400:7eab::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a223fda-0a85-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 09:30:36 +0200 (CEST)
Received: from CY5PR22CA0042.namprd22.prod.outlook.com (2603:10b6:930:1d::35)
 by DS0PR12MB8504.namprd12.prod.outlook.com (2603:10b6:8:155::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.38; Wed, 14 Jun
 2023 07:30:32 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:930:1d:cafe::58) by CY5PR22CA0042.outlook.office365.com
 (2603:10b6:930:1d::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.35 via Frontend
 Transport; Wed, 14 Jun 2023 07:30:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.76) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.25 via Frontend Transport; Wed, 14 Jun 2023 07:30:31 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 14 Jun
 2023 02:30:31 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23
 via Frontend Transport; Wed, 14 Jun 2023 02:30:29 -0500
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
X-Inumbo-ID: 5a223fda-0a85-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mz2HQH1nJGDsZ7lKsObqQ9ZKq0SXBzt3U9xi7EZ1fsQ9wkc6y/DVuK8KrPveM/G2tEngBH3cquiKFghJYaHx65NaC8dAPjZC6ifL+qE4WjojdxVWHZe/AYbWf9gYNpNIwycfe5WCUxpFOhWFrtyop3f+YWA3QH5vEqioUfP5GT0EhsIaDg7OACkU3k8i3PQGgMOIbIpBpP88AyPgsmGNUirYfzl23TciD2Tmfuko/UgSJ8D7wjwAyzNguFA5HSLblg8doy6DMLak2VQlxz0HweyPDL+3JtsYEoEWaMRFWqRbEKHtDcFY74cZNqWigMXURVgXdMqSYIofH1fdf7yQcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BjQ6Rxgf8YRbhZ0pNFfEWib0JAFKG6+d25Ov3Zg444=;
 b=hjINgnVdw7mF1x0uJTgLfsZDAbqXLkvtPtrYUM4FWqc0paIzdMVWzHdO6xfM5Cn2ub2lK0cZpQHyWzIqbhR4bZJYPNFU7p2EqAjZQwpmjMh/KacLJFmNvidomd0k+6QBRIeZBFmWMEOVaVhM9mbx9g/V08ec1Ve96xxwDOGZA9KQrwKNEd8MVciB1bGrY+SNGQFScn5tEwKD0tjc49x0mVfJrtWrkswu1VdBG8rUdKMY2QgwKHVS0Mqx9ofoJ4mgbvuTJ3NL0CbEe6rwIQggVH8BByqpmtCQmsHhHb43FULsCpa1NA17SS/U38xcEKSrSnilH2t1J0ltkq2DMdVIcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BjQ6Rxgf8YRbhZ0pNFfEWib0JAFKG6+d25Ov3Zg444=;
 b=nckb5aXKKu+7cSz3ETAg3FpBJh1xbmX93XMLJzTfy4i/ZFoESh/AnFhVbQ/dOQDkcNyjJrVCmMFzTYwR6nNkwCvZ/cRbPLJXJa8/fVc8RwYyMjZaRN59NAH9F7LCwGNPcQo6ZpRXks+ZIyoEroY37yNIHL98mBmzwqVf0ANLcNU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH] xen: Append a newline character to panic() where missing
Date: Wed, 14 Jun 2023 09:30:18 +0200
Message-ID: <20230614073018.21303-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|DS0PR12MB8504:EE_
X-MS-Office365-Filtering-Correlation-Id: 243a8062-da52-427c-b68a-08db6ca93c57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UPYrSpsb//kGV2MYw9P6i5s5pzCGWPf3bRaQkCuWSuKItnHCNv2EWHsLs+5kKtdOQ2GuC5xEApvVlKzsajRYSA7mKkYh8gehtYDV6k2cY4EKLQmbcc4TvmAocxLcO8JjAkRa0PuDmd9Z7Hu7GfBkXnZUGmoiUO8W0f+6jFM+IeeHJ6Lp3HgDX+4Uis+Nns4brWDG/3LZLt+weGHE7qGiqRtsvcTcL+8TwsuPKJvUMZj2+bn6Dyv8XsqYReC2m2O3TuLa7Xzx2p4YBdETmQnDHEsg2489mo9Z6BYazYHZdrzbpQB5WoP+HNsK6CSiVp70T4qOJXa4/uf1TTfP6pRrp0GYS6+IdfRkr8C5MkklQDgGmCNtEVm89BVM2Ne+Frtid7x5KLtVCX8hFkHJiDEgCyTCsgNUYzhL1cD3T2bmsHHq5irap3ot7lz7t5phZBUJWB2qqcCaInetUvkhUQmDAKMSdkX7HTcWYv8JnpMHpwqMvEHQRUlqETYMQjK9V7KkYBlLzOdTAsky62qphNYYo5kflQV1fpnPpLJC2RiBtjVLKVDldk5Z20R5AZnEkDwNIIipQjSiLMRJOsjjMcpBLoc5zcWQuKOlggCVCE95vgdzWoyOG2EiwgirnUglfdeD6IyggNTQH4JCvMctdJteRFZlWGMKqPzdmsLV6FZT2B7gDpeRw8me/0d98+e12MzeBeKwGKwcUqr5O7rNHNvxrcS7V1/9JwxRHUPrb0yA79epDFIajCQRdkQhqfkOksKKVY9Cb8QcqJqzs3m3CA+uPA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199021)(46966006)(40470700004)(36840700001)(8676002)(8936002)(2906002)(82310400005)(5660300002)(82740400003)(316002)(70586007)(70206006)(356005)(81166007)(4326008)(6916009)(36860700001)(47076005)(83380400001)(54906003)(426003)(336012)(41300700001)(2616005)(36756003)(478600001)(186003)(1076003)(26005)(40480700001)(6666004)(40460700003)(44832011)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 07:30:31.9773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 243a8062-da52-427c-b68a-08db6ca93c57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8504

Missing newline is inconsistent with the rest of the callers, since
panic() expects it.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/bootfdt.c            | 2 +-
 xen/arch/arm/domain_build.c       | 6 +++---
 xen/arch/x86/cpu/microcode/core.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index b6f92a174f5f..2673ad17a1e1 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -225,7 +225,7 @@ static int __init process_reserved_memory_node(const void *fdt, int node,
                                  size_cells, data);
 
     if ( rc == -ENOSPC )
-        panic("Max number of supported reserved-memory regions reached.");
+        panic("Max number of supported reserved-memory regions reached.\n");
     else if ( rc != -ENOENT )
         return rc;
     return 0;
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 579bc8194fed..d0d6be922db1 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -74,7 +74,7 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
 
         return 0;
 #else
-        panic("'sve' property found, but CONFIG_ARM64_SVE not selected");
+        panic("'sve' property found, but CONFIG_ARM64_SVE not selected\n");
 #endif
     }
 
@@ -697,7 +697,7 @@ static void __init allocate_static_memory(struct domain *d,
     return;
 
  fail:
-    panic("Failed to allocate requested static memory for domain %pd.", d);
+    panic("Failed to allocate requested static memory for domain %pd.\n", d);
 }
 
 /*
@@ -769,7 +769,7 @@ static void __init assign_static_memory_11(struct domain *d,
     return;
 
  fail:
-    panic("Failed to assign requested static memory for direct-map domain %pd.",
+    panic("Failed to assign requested static memory for direct-map domain %pd.\n",
           d);
 }
 
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index e65af4b82ea3..c3fee629063e 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -524,7 +524,7 @@ static int control_thread_fn(const struct microcode_patch *patch)
          */
         if ( wait_for_condition(wait_cpu_callout, (done + 1),
                                 MICROCODE_UPDATE_TIMEOUT_US) )
-            panic("Timeout when finished updating microcode (finished %u/%u)",
+            panic("Timeout when finished updating microcode (finished %u/%u)\n",
                   done, nr_cores);
 
         /* Print warning message once if long time is spent here */

base-commit: 2f69ef96801f0d2b9646abf6396e60f99c56e3a0
-- 
2.25.1



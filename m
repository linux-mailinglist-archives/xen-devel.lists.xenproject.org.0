Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 199FB959BB9
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 14:25:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781072.1190643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgkOw-0004ll-Bb; Wed, 21 Aug 2024 12:25:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781072.1190643; Wed, 21 Aug 2024 12:25:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgkOw-0004ij-6j; Wed, 21 Aug 2024 12:25:22 +0000
Received: by outflank-mailman (input) for mailman id 781072;
 Wed, 21 Aug 2024 12:25:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rYNs=PU=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sgkOu-0004fH-3O
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 12:25:20 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20608.outbound.protection.outlook.com
 [2a01:111:f403:2412::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b92fbab-5fb8-11ef-8776-851b0ebba9a2;
 Wed, 21 Aug 2024 14:25:18 +0200 (CEST)
Received: from SA9PR11CA0026.namprd11.prod.outlook.com (2603:10b6:806:6e::31)
 by DM3PR12MB9389.namprd12.prod.outlook.com (2603:10b6:0:46::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.18; Wed, 21 Aug 2024 12:25:11 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:806:6e:cafe::e9) by SA9PR11CA0026.outlook.office365.com
 (2603:10b6:806:6e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Wed, 21 Aug 2024 12:25:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024 12:25:10 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 Aug
 2024 07:25:10 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 21 Aug 2024 07:25:09 -0500
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
X-Inumbo-ID: 6b92fbab-5fb8-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/H1JsA2Q7jPdTbWhJooj2VLv2Q/3sHJMmrA+MM68V3Pf3aAn+iFk4n/T8jYk1GuxyRCsWDfKNOxxJaqzA/B8KecXIvSiwIAQcijyWlkgjsWGcdvruyzN7REnMq1mkwdBAuyYR5TxpbyBvxvyG8sAzxjMGIwgt7+b62F0gX2bV1J4k5aahpmvWPHFszToRvgKlinmKxDL+q62nOvzk6/iZ0kXtAQBWWAKB0aYjiFLOr+vpjBgwYZR+vTd7w9g5JqlsDXB5E7uu26fMTKi1YNydx+SgP5OxF8pRoeKU6MHsRBKoEfNcn5w/AFGMpAJ3d1dUww49n5+sQiW1lFY3zozQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myNOoC4J1xnM7AVVy5dYiGJh7XPyIflSw2Q+8lWCIFM=;
 b=futS9a9NM5YuHSWfbCHmpJjRpA9CiAVPy1NvuAg+paJ6aqU+Kr/Yq6T0aPU2+dGRk+gJ6ZOVBA/ppavKPFUIAnGORHsEMFIy3v7ovdBNZLwwAsEZ1AQ8hNfGH2p4Yp1uXA0yvUZ6s+BuEGFOx1cLQvjwq8rHOb0GrksmOLjWtJwdVHZKaNC2d5q1PIuw4/1lqFmkk0WXaLtkWozdwp7lS1sSQ/tYZql/yqU/anflOEmwYncUf0W31Udb+WCUo+n7pncoqsZ69yX5KJ9EkR9b0kfdYi4wFVDdMy38dPjfTuNL6wdF9OSPh6XksWZ4NRIvywC82JUk0TfNWXHgu0+BWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myNOoC4J1xnM7AVVy5dYiGJh7XPyIflSw2Q+8lWCIFM=;
 b=y8zRDgnZHOTzzaAafd5+wyrroeLn64Byg1kU6zNOf9Kc6VcDGpl4liJUjhRtkQiAQvlvAMxpDwh7DzlPGQPEHdjcpwjn3n6XV6bnBjP0GvxhYE/v/lKVyFuFLTr1uENADskJek5JEGzUPYEJjj4r3H8nEZwaHROOHHq23wateGI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 1/4] xen: arm: Add a new helper update_boot_mapping()
Date: Wed, 21 Aug 2024 13:25:00 +0100
Message-ID: <20240821122503.2315844-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821122503.2315844-1-ayan.kumar.halder@amd.com>
References: <20240821122503.2315844-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|DM3PR12MB9389:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e4ff698-5ee1-4264-84af-08dcc1dc4d14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dtvNdzQJ7EOnLrjyvqGAm7wwbO4Z7DtwQVTT47zB5kJp8mupoJSuR6/z4xCi?=
 =?us-ascii?Q?xYLV6Z6g7Nih3KgbIoCw6fK3wojkv0xCWL0l2ih7eQntRws4MDUWcXkdXq8L?=
 =?us-ascii?Q?yNrsL+e/2l21kWZ+5pgaYqmH2VNJxF6HM6fKxwi8xSqlrHPN5X6h43csbpuI?=
 =?us-ascii?Q?HHJg2Au3vqj0gJRRWNMzupFhCt9gy0/OXn2PJF2svPqevahzh1IjrSEHlyhq?=
 =?us-ascii?Q?DtdcqoxgrEmgYEKhVkxSaw1vC1nJDFZ4dfEkfrUeln4TXjX8u1rD5jBtk3Is?=
 =?us-ascii?Q?QNj6k3fXlB5fkeWeapCUxojihqdkGjT+D/YdbNAh9HB99e8T6hCaulU5J5hh?=
 =?us-ascii?Q?2uVtsGqi/ftFVK+d5XPnvuR87bjkaOoSx+tSgk0BuYJfm9uiaBPctrqE3nJq?=
 =?us-ascii?Q?nlyYCOxU1VkZQkFpr2uU3/0I3L5fEXC5rTCVo9DTGjDbmhmFh8XeF+LMHLYq?=
 =?us-ascii?Q?vit/wG2LJcemkG+BFcRFXYktGi3i6SxCnHIfWuAVhrleQgt14bEU1pthux0m?=
 =?us-ascii?Q?AW/NtrGUuOHIBTFeM6MqFZqr4u2m3GV/xevlzMU2FNOHIFcVPXq2DxswHZ/9?=
 =?us-ascii?Q?xnp4K5mbJJczZuTMgk9g4O5oMMD/6S4L1Y0eMlM4HfVscV2M4ob3KztfYdJg?=
 =?us-ascii?Q?EYBBBpWMNJ0rJY6s0EVLPaNV4BlZI7rARmneroh6xlHUK7VUGpWTp/PKxu/k?=
 =?us-ascii?Q?Pzh0RaJrfDDvIR8VKxf/A2uzOFvMYODqRewicMfvGUUpazqIlRVJYmWciq4w?=
 =?us-ascii?Q?CZIVe3T7331Kg1uQ2K1pPQilEZoqrzmV8KXgAbomZmv7QwvtVhzR1pQDUUy1?=
 =?us-ascii?Q?AFwa02XDAF1ju7BrNXu9XKe38Tf3YDVpwpEEPOJ9x7uQE0xiN+2W0jqrfTut?=
 =?us-ascii?Q?/vsYYXOUB1jNQM32n8hHQC5ASY9wiWh/5f6svchQHnhKugwg0vJDm2PwNs4s?=
 =?us-ascii?Q?vT36XzLLXzyK3MNd3PlV1KPznrTAPXJAtdyHeo+F94JMR5A237jHnn6crWOK?=
 =?us-ascii?Q?dhH62y9QxvuY4HyUXIPJQ/cpBC/TdTAgWKkLC0AQKV4458lFUroNY0S6N4+C?=
 =?us-ascii?Q?DJQUhzkX0kGUPmtpcORtbl+iKePLZFs6AcgGiXSRIBdq3gpr45u/NJBRHQCt?=
 =?us-ascii?Q?Xnx0vDESbFsztgzWIhXwApvDgreK43FJo3Kvpg1sP86Qvo4L0zEPPzfUtAdf?=
 =?us-ascii?Q?Pf3H3GWCGg6BBIAOz6GspZcPlhOW0aB6WiDckcbLb1FL5IU4oOB9PVl4m9QQ?=
 =?us-ascii?Q?5g0cB8lhqkzeiIIptFVaszADHEybjzeOYyrSiIfyP2RDzCcwTaS3oRR0yMFK?=
 =?us-ascii?Q?5Ow0zA8nhCR8VO1NZoZDJNGgjRUhSJx1b0Eyl+Hxr8sLFw4SmjZYlkX+/K0u?=
 =?us-ascii?Q?vcUJxdvuSoHDUJgligc0+mFiI0m+vi4FCDFdJH3jxadFy6MRQNMcJtdcjjoj?=
 =?us-ascii?Q?HIPDf4HpVzpvChmJXTsE+kJuQ8M4ZuXk?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 12:25:10.9455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e4ff698-5ee1-4264-84af-08dcc1dc4d14
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9389

update_boot_mapping() invokes update_identity_mapping() for the MMU specific
code.
Later when the MPU code is added, update_boot_mapping() will invoke the
equivalent.

The common code now invokes update_boot_mapping() instead of
update_identity_mapping(). So, that there is clear abstraction between the
common and MMU/MPU specific logic.

This is in continuation to commit
f661a20aa880: "Extract MMU-specific MM code".

update_identity_mapping() is now marked as static as it is called from
xen/arch/arm/arm64/mmu/mm.c only. Also, amend the prototype to
update_boot_mapping() which is now invoked from other files.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes from :-

v1 - 1. Introduced update_boot_mapping() which invokes
update_identity_mapping() in MMU specific code.

v2 - 1. Make update_identity_mapping() static and update the prototype.

v3 - 1. The comment for "update_identity_mapping()" is moved to the
correct place.
2. Added R-b.

 xen/arch/arm/arm64/mmu/mm.c         | 14 +++++++++++++-
 xen/arch/arm/arm64/smpboot.c        |  6 +++---
 xen/arch/arm/include/asm/arm64/mm.h |  9 +--------
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index 293acb67e0..0de4f3c079 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -111,7 +111,14 @@ void __init arch_setup_page_tables(void)
     prepare_runtime_identity_mapping();
 }
 
-void update_identity_mapping(bool enable)
+/*
+ * Enable/disable the identity mapping in the live page-tables (i.e.
+ * the one pointed by TTBR_EL2).
+ *
+ * Note that nested call (e.g. enable=true, enable=true) is not
+ * supported.
+ */
+static void update_identity_mapping(bool enable)
 {
     paddr_t id_addr = virt_to_maddr(_start);
     int rc;
@@ -125,6 +132,11 @@ void update_identity_mapping(bool enable)
     BUG_ON(rc);
 }
 
+void update_boot_mapping(bool enable)
+{
+    update_identity_mapping(enable);
+}
+
 extern void switch_ttbr_id(uint64_t ttbr);
 
 typedef void (switch_ttbr_fn)(uint64_t ttbr);
diff --git a/xen/arch/arm/arm64/smpboot.c b/xen/arch/arm/arm64/smpboot.c
index a225fae64d..789f352ab6 100644
--- a/xen/arch/arm/arm64/smpboot.c
+++ b/xen/arch/arm/arm64/smpboot.c
@@ -112,18 +112,18 @@ int arch_cpu_up(int cpu)
     if ( !smp_enable_ops[cpu].prepare_cpu )
         return -ENODEV;
 
-    update_identity_mapping(true);
+    update_boot_mapping(true);
 
     rc = smp_enable_ops[cpu].prepare_cpu(cpu);
     if ( rc )
-        update_identity_mapping(false);
+        update_boot_mapping(false);
 
     return rc;
 }
 
 void arch_cpu_up_finish(void)
 {
-    update_identity_mapping(false);
+    update_boot_mapping(false);
 }
 
 /*
diff --git a/xen/arch/arm/include/asm/arm64/mm.h b/xen/arch/arm/include/asm/arm64/mm.h
index e0bd23a6ed..b4f7545d2c 100644
--- a/xen/arch/arm/include/asm/arm64/mm.h
+++ b/xen/arch/arm/include/asm/arm64/mm.h
@@ -14,14 +14,7 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 
 void arch_setup_page_tables(void);
 
-/*
- * Enable/disable the identity mapping in the live page-tables (i.e.
- * the one pointed by TTBR_EL2).
- *
- * Note that nested call (e.g. enable=true, enable=true) is not
- * supported.
- */
-void update_identity_mapping(bool enable);
+void update_boot_mapping(bool enable);
 
 #endif /* __ARM_ARM64_MM_H__ */
 
-- 
2.25.1



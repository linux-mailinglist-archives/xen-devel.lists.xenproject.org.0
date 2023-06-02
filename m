Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C03B72012A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 14:09:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543118.847795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q53bB-0005s4-Ew; Fri, 02 Jun 2023 12:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543118.847795; Fri, 02 Jun 2023 12:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q53bB-0005p8-BN; Fri, 02 Jun 2023 12:09:41 +0000
Received: by outflank-mailman (input) for mailman id 543118;
 Fri, 02 Jun 2023 12:09:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jAO=BW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1q53b9-0003vL-5Q
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 12:09:39 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5818c4ad-013e-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 14:09:37 +0200 (CEST)
Received: from MW4PR04CA0038.namprd04.prod.outlook.com (2603:10b6:303:6a::13)
 by DM6PR12MB4530.namprd12.prod.outlook.com (2603:10b6:5:2aa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24; Fri, 2 Jun
 2023 12:09:33 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::1a) by MW4PR04CA0038.outlook.office365.com
 (2603:10b6:303:6a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.26 via Frontend
 Transport; Fri, 2 Jun 2023 12:09:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.26 via Frontend Transport; Fri, 2 Jun 2023 12:09:32 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Jun
 2023 07:09:30 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Jun
 2023 05:09:30 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 2 Jun 2023 07:09:28 -0500
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
X-Inumbo-ID: 5818c4ad-013e-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HemJZkUgx1RqEICn9a1iW4BLGQlujWr05rMb1rs3AQ9oHT3aCZ+g6uYl9m+i4In8lDAVgWD6F2OI9PV63Tfb/TNYO1ntkn9QHfjN0xFduT5E8n7tl1r2xRiMDAQ1FrzG05HcHAmVx/oddiz5nVJNkjn7GeVJ052qX/nUypfmpgJSnwdfbpBJb73+vZPxYK+ogwCysOOokJbcDWrFbsuIJzcpOxgap3b/3f1Ou2WzcPNJdRX47Wk/kwVTATexuyzyDlKulY98Za0WzJmQfB8AgROee6txegW47l5fyhBWnCYGWH48MfHIWsSqUuaVTyJZGOyJK/ZLZlAn29gAGP2eLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqCo6sY+sNGsyn7K+5qf+y8ONKXZ0EQ9Pa42dCYxQjw=;
 b=jn8NhQ7BOjMAvRACnvIcqI4NYsfL4TbEdvLsILhmrG550ZgxZgEnA3nXiXGRcLB+GIPwfkVSqlBzRIei/xUJggK0if4sdPZRNyMKeBGTsL7yINMbiTb7hJD8a5c23h8t1+Zqbxw5G7VPV8TXen5lYp0UO2MH6hScKmWgl84T0Wt+AKXmPuUeAG2b+KQcl+uqE/ZAPARd+HJE29wQz8P1UP4EBC3qcLUWuI6kL/czMjK9VTVhtolVMtkBeOpZKnZOOFZvxW/9wZLnMzbWbsPr/IaY0dcsCa5gVH+aX5p7J79dlwZAunYNSYCUMcD4oEcAo0OuJith+6GDLMGN3nVGFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqCo6sY+sNGsyn7K+5qf+y8ONKXZ0EQ9Pa42dCYxQjw=;
 b=PQYIgR1XmoUcvkBzHFFs2RllyRNSzJUB70f7zOYdw+vztGsNZtIwIWIIx9Rh4EItDOzd84OtYX7SiPQFc2bU/GVm8yjrCX4wy91uyOwYpEjoXtZ8uwAMs63G1vjBHfg0DfpE8bBdRpG1R/2RJ/UMCHCR4Z9asny2YTnzbVVp/y0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v8 4/5] xen/arm: Restrict zeroeth_table_offset for ARM_64
Date: Fri, 2 Jun 2023 13:07:53 +0100
Message-ID: <20230602120754.23817-5-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602120754.23817-1-ayan.kumar.halder@amd.com>
References: <20230602120754.23817-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT048:EE_|DM6PR12MB4530:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f2c90ab-c47d-42a7-0e7f-08db636239b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NHHBN9100Obhp8+lRd0lDby/XDtUD58YAhaQFeYAti+/qJH4bz3OJTd4TRmgsL7G7c256PlcYxBn+cPInVdK4kqjnVmjwmOY12p5MmCmABCt0mBK3YZZdky1rC6XmLj+5WH53cu2GFxvJqbx0VIvT1TkKHpJdDdN+DU4Q6LoAE+7yksoHWTfMwZn/0gnOKt9DIvMtP6APqqJt1ByvADMOmVOSVpx5GezOwE/8xk+KKjHLOYV4Ec3iCMqx0EZAGml4GC8HyiASRTlwj2bHreLqYDhYI2IM/ddS4/oMcBiMKDyfCFInW5lrAznyH7uS9fbSGy2ZQjqnid3LyeqdZWbfluTiDp7VG8FSgEF/d30c7hGyGS9zK1GCWRPs46eHN4o9bqtg6atnyHoFC993nPzbBLXIQbnYfV3wbXTrSdkgbcOlCXJtCcS1CvKnVftBeKst2lhkgIH7OR8RmY9KRRrlGHLm9eIOqGtEtlCYdQvqHfoF4JY5WoqP14KRGtFtNJSSrApGbZG8UXf5YNO4S7bppmGrT80MclkdNdzJizST02RKJtrkkaWrrBziOyDzcEPCiYVgkPdFoRjstPro83l98bITHM58682iXCmttExucLk47Txc+W7kzPpaxkuTMcC20e3t/V0wRY70+C9suFyLzLij34a5bWKIOdapMmfDHqjFQf/bSLAxKVpXmUK6kQWZGzqnIfV0gNfbVkY4dP0Ew9BFLyMh/bkK6e9CPOOOcar7P+TG6oAeytw6aMirmQ7I/ANHUkqoMNqnPxkZq0xFw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199021)(46966006)(40470700004)(36840700001)(82310400005)(4326008)(81166007)(356005)(47076005)(103116003)(26005)(1076003)(40460700003)(7416002)(2906002)(86362001)(5660300002)(8936002)(8676002)(186003)(6666004)(36756003)(54906003)(426003)(2616005)(336012)(316002)(82740400003)(83380400001)(41300700001)(40480700001)(36860700001)(478600001)(70586007)(70206006)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 12:09:32.7163
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f2c90ab-c47d-42a7-0e7f-08db636239b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4530

When 32 bit physical addresses are used (ie PHYS_ADDR_T_32=y),
"va >> ZEROETH_SHIFT" causes an overflow.
Also, there is no zeroeth level page table on Arm32.

Also took the opportunity to clean up dump_pt_walk(). One could use
DECLARE_OFFSETS() macro instead of declaring an array of page table
offsets.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes from -

v1 - Removed the duplicate declaration for DECLARE_OFFSETS.

v2 - 1. Reworded the commit message. 
2. Use CONFIG_ARM_PA_32 to restrict zeroeth_table_offset.

v3 - 1. Added R-b and Ack.

v4 - 1. Removed R-b and Ack as we use CONFIG_PHYS_ADDR_T_32
instead of CONFIG_ARM_PA_BITS_32. This is to be in parity with our earlier
patches where we use CONFIG_PHYS_ADDR_T_32 to denote 32-bit physical addr
support.

v5 - 1. Added R-b and Ack.

v6 - 1. No changes.

v7 - 1. No changes.

 xen/arch/arm/include/asm/lpae.h | 4 ++++
 xen/arch/arm/mm.c               | 7 +------
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
index 3fdd5d0de2..7d2f6fd1bd 100644
--- a/xen/arch/arm/include/asm/lpae.h
+++ b/xen/arch/arm/include/asm/lpae.h
@@ -259,7 +259,11 @@ lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr);
 #define first_table_offset(va)  TABLE_OFFSET(first_linear_offset(va))
 #define second_table_offset(va) TABLE_OFFSET(second_linear_offset(va))
 #define third_table_offset(va)  TABLE_OFFSET(third_linear_offset(va))
+#ifdef CONFIG_PHYS_ADDR_T_32
+#define zeroeth_table_offset(va)  0
+#else
 #define zeroeth_table_offset(va)  TABLE_OFFSET(zeroeth_linear_offset(va))
+#endif
 
 /*
  * Macros to define page-tables:
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 5ef5fd8c49..e460249736 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -233,12 +233,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
 {
     static const char *level_strs[4] = { "0TH", "1ST", "2ND", "3RD" };
     const mfn_t root_mfn = maddr_to_mfn(ttbr);
-    const unsigned int offsets[4] = {
-        zeroeth_table_offset(addr),
-        first_table_offset(addr),
-        second_table_offset(addr),
-        third_table_offset(addr)
-    };
+    DECLARE_OFFSETS(offsets, addr);
     lpae_t pte, *mapping;
     unsigned int level, root_table;
 
-- 
2.17.1



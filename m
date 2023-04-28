Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C07A6F1DBE
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 19:59:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527453.820080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSND-0000Yd-83; Fri, 28 Apr 2023 17:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527453.820080; Fri, 28 Apr 2023 17:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSND-0000TP-3N; Fri, 28 Apr 2023 17:59:11 +0000
Received: by outflank-mailman (input) for mailman id 527453;
 Fri, 28 Apr 2023 17:59:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SG5/=AT=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1psSNB-0006fW-RM
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 17:59:09 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e83::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e802ccc-e5ee-11ed-8611-37d641c3527e;
 Fri, 28 Apr 2023 19:59:08 +0200 (CEST)
Received: from BN9PR03CA0581.namprd03.prod.outlook.com (2603:10b6:408:10d::16)
 by SA3PR12MB9198.namprd12.prod.outlook.com (2603:10b6:806:39f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Fri, 28 Apr
 2023 17:59:04 +0000
Received: from BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::9d) by BN9PR03CA0581.outlook.office365.com
 (2603:10b6:408:10d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24 via Frontend
 Transport; Fri, 28 Apr 2023 17:59:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT056.mail.protection.outlook.com (10.13.177.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.25 via Frontend Transport; Fri, 28 Apr 2023 17:59:03 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 28 Apr
 2023 12:59:00 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 28 Apr 2023 12:58:59 -0500
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
X-Inumbo-ID: 5e802ccc-e5ee-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYR+z5uiPu6EGYFFfewNlpphFFM4RDdAwZHuucFBtv9oa+7PAwyZwZ1L+f/U7YaVnzQFGonBb51kWqzwIy7WY1whwWOaH19zMeg+NBsOssWsKl6GmnU9K9OmPHux7TKjbYeQoJw96/zIFUTVHGRZdvBkKWjBdzd/bdd412wAX4igaAu3cz7lpSfiS6czkU6aTg3r1AUpw6I0MZAJSn1F38iomYyZu6Ct2TPbpeWYtf6J81aZ9eTNm5fom7RtjyR4c+Bf2y3pcomAPFSH6BSjG4DatWkxbjOn1BU+YWcLKhgwIDXdihy6MBDdxek1fG1SumTfdvVNm7pbYGEFBjO6dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5GvJVPCSXr6/uw/3PeMNt7ZXD0H8lgklyZTFsf2XdI=;
 b=JYEDpKYQpFn84JeqqziijSb5sgt6f0oAt0A+//EMGcj+MMRQjigksO9QxH1HBFlc63W/q0fU2JhRxpt5vkiht499JCUywN1E+j1ZuNzcH1etzQucfYykMRPHPZMCBwJea+3X9g52IGdxIGRO6tT4ZUpVa7BWO4SzJKSJZb7llFxw2zdazhwkvr14XsnfYoM2rqT2OPkZPx6bk5EjZAYg3NEtgSWfcV05GvUDVb00itmbHynMy03zx3KMakfyor/Zel2P8zr3wNWZ/XwRgy4VCBeVqMDuWN5yAYKVeEZYxEgwvP7+qk/PbOLJ+OhDINr38C6YIkO9+zIWkIvL07GkYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5GvJVPCSXr6/uw/3PeMNt7ZXD0H8lgklyZTFsf2XdI=;
 b=kQY65WoqSMq4XCRqqf4rfeXGQgk5b5fSi7xQd4IJdrOgJeEzgf2+UEnizkiDILSajjV6s2RgXnLB1AaDnVVQCZabNdR/Qure8OMQfw0e8Z5Tlnqc7+C+VI1Y5qsEzToSVEJNBBARlA0C/7ynKTkIhezZ5rC6V0Sbz6vISQDDo0I=
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
Subject: [XEN v6 07/12] xen/arm: Restrict zeroeth_table_offset for ARM_64
Date: Fri, 28 Apr 2023 18:55:38 +0100
Message-ID: <20230428175543.11902-8-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT056:EE_|SA3PR12MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: b47ea684-a41c-4919-09a9-08db481240e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VMYm6LxIACBOR/HPyHIdKzZNbO0NvBPKS8U5S8HdUAlqf09/Uq5gjhDKX9yH8m53EFdMIW4j9UsDsdHManayjSDBFeaGRS82QxhhP5YfkRoQlDb8hy5SfqyXPzQ3nbyfgnF/ugFElU+qhAcjZ7uUf/gxNywITTQ0MkxNXwTBGrIPTfX0B8oMtJXl+hd3JOkhNr4Z6kSCQ9cZQxsUB4PKMFof7vmbrJSAjz6JZOLc9qlGm5Tfb4RnWHXsF+EZWfJuzQdSPq1xbUIy4OLCbEl89Xwm75a7hYFn24uwhki8jC8MFm08rRSPn6QhKLDL97c4oVIIWA+aXy/rh2OJVAiP3EakPO/N5/xPw4mArxdg1Z9gy4yUbn0py5l2pKhI1EsLutjrSSTfVmFNTIS8+FzZlQa5Slv+p9kgUisDU8wVb7zF7zGgltM1t7pQ9XMjg+BSiD5WIzCHELXgxRy00RpI5ohBN5qdDYHL9Hrz6SP49rt9tUldhrvYPNDeLDhTgS+aqeLEntBEMoaGM/WvbweBVBxFKwymibIyustWAYk6UdgsL1YImmUQFx+04+cxpOXhLaQpIly8Qrt0hS2y+yYZ1VY67ggC3UGkZD0Y5wJ++Mv49XLIAEJtwYfkqsm5T5w+u0pgXCvvEN4crEb06D9sGAXQuQstSmaNswg8MTftAgPdYPBiqF5W7RXtHvic33ajBJqd+0Lq8IrewkNT/uO5Fj409sTN9pwm7AcGZKCvB/E=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199021)(40470700004)(46966006)(36840700001)(70586007)(2906002)(70206006)(2616005)(86362001)(82310400005)(5660300002)(7416002)(8676002)(8936002)(54906003)(40460700003)(36756003)(41300700001)(4326008)(6916009)(83380400001)(316002)(6666004)(478600001)(40480700001)(103116003)(426003)(186003)(1076003)(336012)(81166007)(26005)(356005)(82740400003)(36860700001)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 17:59:03.8304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b47ea684-a41c-4919-09a9-08db481240e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9198

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



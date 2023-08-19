Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6E378160D
	for <lists+xen-devel@lfdr.de>; Sat, 19 Aug 2023 02:29:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586702.918041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9qI-0004ce-4W; Sat, 19 Aug 2023 00:29:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586702.918041; Sat, 19 Aug 2023 00:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9qH-0004M1-Az; Sat, 19 Aug 2023 00:29:25 +0000
Received: by outflank-mailman (input) for mailman id 586702;
 Sat, 19 Aug 2023 00:29:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eu5+=EE=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qX9qD-0001Sg-2R
 for xen-devel@lists.xenproject.org; Sat, 19 Aug 2023 00:29:21 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20611.outbound.protection.outlook.com
 [2a01:111:f400:7eab::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f7b96c4-3e27-11ee-877e-cb3800f73035;
 Sat, 19 Aug 2023 02:29:20 +0200 (CEST)
Received: from MW4PR04CA0101.namprd04.prod.outlook.com (2603:10b6:303:83::16)
 by LV3PR12MB9118.namprd12.prod.outlook.com (2603:10b6:408:1a1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Sat, 19 Aug
 2023 00:29:16 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:303:83:cafe::6) by MW4PR04CA0101.outlook.office365.com
 (2603:10b6:303:83::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Sat, 19 Aug 2023 00:29:16 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Sat, 19 Aug 2023 00:29:16 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 19:29:14 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 17:29:14 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 18 Aug 2023 19:29:14 -0500
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
X-Inumbo-ID: 6f7b96c4-3e27-11ee-877e-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9QpzAX86QxnQp1df+PAZWOOhRNKD/SWA9p0HQPiRsEQbtpcZkEJLfejX4iWlfPriTAPjnhcZlv8wUjV/QfZ0vBp94SPXQyvIZkEfEpwOrJWCu/SN5ij2SdfhglA0wjc9bCaoxZ/2XeC5n5ct/q/YBTbM8bvC2wdcUNjHCF5DD2xciruDTBBlcBVFKVcXp9Eo2tMFGYuVvvTGN7fuMo1Jq84ujuCDiOdv5trOOGs+8Q9g1/mMHhluEjRKna/w+1hPfa2Wt+8FuERg3fZxPsoyFFlRMiHSsAp+0bsfXeUsUNskfE55EFELZJ/6WWR62NY4UVxA7kvqp7zYxDUJbj3EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbvEFTy0SN7hLXU1211NeYzv59Rers6Gren3/qiNJHg=;
 b=nPLc5ySIBkM4rnzFRBzLfL+VJY7Zr9p4evkGRR8mvMEbPgpj8SRUb9S5gtaoC+vWwfhs2vwcpsWxbC9qvDo0zDPqZeNIVDJzoEPj7YvOHzBvWtdcGFn7dmz4Z5xmpvOALXUNx3JqLd2jKsu/ygIAI13DuQ0hUTDJRR65kWL5JQH4AESQCyqY1ueWltsCDQKrz9eXarTB/dg9LjL2+IugQYWSt3GMWW7ldH4Po1Bc4KFHM8O8V4q5orfukeC5lE5OY2PHAdhgCIGk2OudsqfY64+tTOcRqBs79fOLoIadW+QJdGO+UertB672rexHT+vIg0zwr1cmtf3VCaBYyCchcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbvEFTy0SN7hLXU1211NeYzv59Rers6Gren3/qiNJHg=;
 b=FyAdKOC/17V4S5KTIx5aB+3/6KZJ/vsjedjhsosprooCfAOT0fVZiTmc7EmhE+mJmAA+LJhg8noTwO8lTN1Lki7ndDcu9dLmdwdodxZlk+TP07fRKa4KfDPVNI3bdSCSdQdeyaJdELbNGJNiiv4QtmWzPWkciNTD8GFphmBOQzY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v9 13/19] asm/smp.h: Fix circular dependency for device_tree.h and rwlock.h
Date: Fri, 18 Aug 2023 17:28:44 -0700
Message-ID: <20230819002850.32349-14-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230819002850.32349-1-vikram.garhwal@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|LV3PR12MB9118:EE_
X-MS-Office365-Filtering-Correlation-Id: 56f25e01-1c8f-49a2-9824-08dba04b521e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ug0N0niiGUIt2GBGwe4IKaSPJAwJSLed8C130uqeAAjcFrigdX5t9Kpcxnj/tFog21ByEPeblxAs8kh4f6yKknbVMnOE3GAUuTT5GGYnD+SNTCH8kPC8ZjoO52iS+G8R4fGw/UmybB80k0Y0j66Cw603fKYP7aUCNFoKmKmyBAOWLWCa0evZROkMM09NA86NRUUyrXCDp+vs+uE95zXAKlDUFLdHFNoPGrvBEi1SSwOyGQIfq6g1KR7nX++MtKW4VLe+Qg/JW8VOzhetf0+GUig9PVvfAejxcMMpLDoZA8ySU707tRfdIdc5jPnZd5KCejJvkJyS3w6qLPNxe8cm6aTC0sz54kWGFPQfxb6JxbhIVHTwJpFp0gmQ0D3OAyIHHAhV5C1gFRQWkVZbZm9lrdCPt8ac+hvT3+CpDrD7V4SP0NMgGNEBHAca9bJslt5qlF2VnHixsPwANPzGtxcV5Hpy6gmYRpLWrG2J4omFO7LL4EeUhoq7q1JDH2oYAONcegyl7WwTEk1LbDb6kg/smjaMOAbBxQWI6gNq+2YbMGnlkbCGmCWU2p5uDQbEwe1Y3YTTsdX+RWomQBlZidFzj6RtNXN2NgdvDxlEzQRxbsRZSAi8GNNaGi+En2Zlcvn9ukym/qQCugjWQ4bb9ljEDY2HQWt3NKVgH6OcpQ3J67MA/aJTPXaTJHMdpyAoBP0l4l8F+1O2iZbTAGyKHAxn51KqUmIzEyEWHTYXRvcD/lGfBDgSgPJOQcdBpWih/eUmjcZ/b09FdrRlnDoPSdMCew==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(376002)(39860400002)(451199024)(82310400011)(1800799009)(186009)(46966006)(40470700004)(36840700001)(86362001)(36756003)(82740400003)(356005)(81166007)(40480700001)(44832011)(2616005)(5660300002)(70586007)(478600001)(316002)(70206006)(6666004)(6916009)(26005)(1076003)(41300700001)(8936002)(8676002)(4326008)(54906003)(47076005)(40460700003)(83380400001)(336012)(36860700001)(426003)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2023 00:29:16.2378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f25e01-1c8f-49a2-9824-08dba04b521e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9118

Dynamic programming ops will modify the dt_host and there might be other
function which are browsing the dt_host at the same time. To avoid the race
conditions, we will need to add a rwlock to protect access to the dt_host.
However, adding rwlock in device_tree.h causes following circular dependency:
    device_tree.h->rwlock.h->smp.h->asm/smp.h->device_tree.h

To fix this, removed the "#include <xen/device_tree.h> and forward declared
"struct dt_device_node".

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

---
    Changes from v7:
        Move struct dt_device_node declaration just above arch_cpu_init().
---
---
 xen/arch/arm/include/asm/smp.h | 4 +++-
 xen/arch/arm/smpboot.c         | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/smp.h b/xen/arch/arm/include/asm/smp.h
index a37ca55bff..4fabdf5310 100644
--- a/xen/arch/arm/include/asm/smp.h
+++ b/xen/arch/arm/include/asm/smp.h
@@ -3,7 +3,6 @@
 
 #ifndef __ASSEMBLY__
 #include <xen/cpumask.h>
-#include <xen/device_tree.h>
 #include <asm/current.h>
 #endif
 
@@ -23,6 +22,9 @@ DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
 extern void noreturn stop_cpu(void);
 
 extern int arch_smp_init(void);
+
+struct dt_device_node;
+
 extern int arch_cpu_init(int cpu, struct dt_device_node *dn);
 extern int arch_cpu_up(int cpu);
 extern void arch_cpu_up_finish(void);
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index e107b86b7b..eeb76cd551 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -10,6 +10,7 @@
 #include <xen/cpu.h>
 #include <xen/cpumask.h>
 #include <xen/delay.h>
+#include <xen/device_tree.h>
 #include <xen/domain_page.h>
 #include <xen/errno.h>
 #include <xen/init.h>
-- 
2.17.1



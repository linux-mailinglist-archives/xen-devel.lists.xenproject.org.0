Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A183571F757
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 02:49:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542803.847207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syh-00057f-Pr; Fri, 02 Jun 2023 00:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542803.847207; Fri, 02 Jun 2023 00:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syf-0004u3-Ug; Fri, 02 Jun 2023 00:49:13 +0000
Received: by outflank-mailman (input) for mailman id 542803;
 Fri, 02 Jun 2023 00:49:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQ40=BW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q4syY-00018B-26
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 00:49:06 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20616.outbound.protection.outlook.com
 [2a01:111:f400:fe59::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 450f7372-00df-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 02:49:04 +0200 (CEST)
Received: from MW2PR2101CA0034.namprd21.prod.outlook.com (2603:10b6:302:1::47)
 by SA0PR12MB4461.namprd12.prod.outlook.com (2603:10b6:806:9c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24; Fri, 2 Jun
 2023 00:48:58 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::1e) by MW2PR2101CA0034.outlook.office365.com
 (2603:10b6:302:1::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.9 via Frontend
 Transport; Fri, 2 Jun 2023 00:48:58 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT033.mail.protection.outlook.com (10.13.174.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.24 via Frontend Transport; Fri, 2 Jun 2023 00:48:57 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 19:48:56 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 17:48:56 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Jun 2023 19:48:55 -0500
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
X-Inumbo-ID: 450f7372-00df-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YP37zK1MTTnTIgBCY2xm9N1z2hnqLOVeWBQM1RnZhlDCKqm7YLOUoMJhQqDtKJ+oeoVU6UaidbwiqIeNkx73m7sBSp0v7mKYjSoArwukXZTyq9Q4I8+W4VOC7NQP1HbR3RKMS3BPhNrnnXWTkgH2lNFiL16DMCfyUcXbyCduLT6ocZsxZSQ+hngFKs6eO/tLC+LkzFLNYWGagsPYvm4IrEb/otucI4jrpwTdX0KzhaacwNKLflfk46s0lCsDHmqMqXMTxp9QHV22/+2VccM6ZXmrymxet/D0vAqKMlqRFPbwRP3F8yN+2yozDyNC56adV3qF93LZRLmgznhNRYlgEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cw3ZgAJufScS/YkBvxCBzP/nR/M5kVzAUuLpS4HefHs=;
 b=KscL3NRo1r76NTawraKYvZ8y8qLHIA8/tZAqJFqGCTuIs2vZR+BmHd8KYJt0npWP2ti+pmG2O/h4dU7QnRaJQzdrZb/VSsoZSHI2f7/BRNV0PG3mowPorYfj5s1XEOfAgvycMFwB9kKgARBY0SYREIsai9PfM+BNWXKCYvEn2qyL3TwT23ZY0n65vXxz+oi5M/+1QWBPtarY8L5qYtJ6YotKNcHj/jpjy4uFn8/RezFPlERGYCvMJ4HT/rV8N+PpDyBHjyPJD9sEBQ4him02LEarHIgGO4jB+xBJ/YzgZprJHfkNkAhtyaGmdYyt0eTWHaOuLriqVWaHNtbuYzd2kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cw3ZgAJufScS/YkBvxCBzP/nR/M5kVzAUuLpS4HefHs=;
 b=e2PvS7RH3KA7nkhzhc8PiQrZBFUyBR8V9z3ZBsBTyK3RlLP05B5frXOrxE5UZzneXKBDaM8QzlJamqkpgKq6qegiEGKW7QyPcbJKVXQmls/LJZnz2QUIAYF9HJFp47Z1uVodYbFVgMNMuCKXv+Zvy6S3iy3I6Io/9cCyOsPyUGg=
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
Subject: [XEN][PATCH v7 13/19] asm/smp.h: Fix circular dependency for device_tree.h and rwlock.h
Date: Thu, 1 Jun 2023 17:48:18 -0700
Message-ID: <20230602004824.20731-14-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602004824.20731-1-vikram.garhwal@amd.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT033:EE_|SA0PR12MB4461:EE_
X-MS-Office365-Filtering-Correlation-Id: 4631094a-a250-4563-8928-08db63032614
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zxbrzXF9KkBZyucInPXuc2bP+Ix2YLZuSl02O98SMb0XzVjacZ/vkAiHgEvtU4zmg5Om/101L6PAqNtEOeNxcTAalr8ds/hoYnQBKPvBX5hl5i2V5T3S7WmW1jyO0vuwQRgPR7eQ8f1p4zvtbMnE6cH4wuGYggkFtqx7kcXQdaocUC4IaIsYWTbfKR002kWQKqzJ6rg9i2TLbtRQenbhm4vGe0fQ5pAe9tY3TkGfNu9TyivdO61s47dvqKbZD18GY8/l6LXdVjTKUkZ2Tr/qpQpyt2uvpSpksTNiILL6AIaoYIPVIrzgfEuqRE3Ru/UMHd95uqxEANVRDul/G2auGy7DBDrUFVh7uyQgMZPFTE6//7o68oF0yd/xsf1vu8EdNlWNUNMAT6YUWZUrhsp1Z1dJANYwxbUXsdWwsJOhoO1djSuOCYLS5mn5ExbC+QTgWtOQqbFKpC0OucZudvwb0Ng8H7C7xOTT4WcF/ktOWOKvy+yDfQYXp6+uYQGCBjTOXIlRliuETh+5l5SgRHkCruK93VYd/dSGfaAEaoFbpfHUPYqh1PO9EruEEW6rwd85R4KOqC2XLrxrNo4PB/6eeWsnHhC3Tr4h6e5a8DY0HRgoNiaChn1TCRW9Vyo6hEpfGz/kwuzsFsbqKHtQM1ZBPtv3e3ntRUUJpcp+uHykWWVk5olRcbpqVgF4RtlKA6aK/LGGeHGfttR6gS+Wcxo56SSfwsVBjdX+JIwOg28h9KwENrIBBLbxSNo+1xU3Bwa1T7sOYZNuzIcBYOP/xHFXEg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199021)(46966006)(40470700004)(36840700001)(47076005)(36860700001)(336012)(426003)(83380400001)(40480700001)(356005)(70586007)(70206006)(26005)(6666004)(1076003)(6916009)(478600001)(2616005)(54906003)(186003)(86362001)(2906002)(44832011)(8936002)(40460700003)(5660300002)(8676002)(36756003)(41300700001)(81166007)(4326008)(82740400003)(316002)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 00:48:57.6114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4631094a-a250-4563-8928-08db63032614
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4461

Dynamic programming ops will modify the dt_host and there might be other
function which are browsing the dt_host at the same time. To avoid the race
conditions, adding rwlock for browsing the dt_host. But adding rwlock in
device_tree.h causes following circular dependency:
    device_tree.h->rwlock.h->smp.h->asm/smp.h->device_tree.h

To fix this, removed the "#include <xen/device_tree.h> and forward declared
"struct dt_device_node".

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/include/asm/smp.h | 3 ++-
 xen/arch/arm/smpboot.c         | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/smp.h b/xen/arch/arm/include/asm/smp.h
index a37ca55bff..b12949ba8a 100644
--- a/xen/arch/arm/include/asm/smp.h
+++ b/xen/arch/arm/include/asm/smp.h
@@ -3,13 +3,14 @@
 
 #ifndef __ASSEMBLY__
 #include <xen/cpumask.h>
-#include <xen/device_tree.h>
 #include <asm/current.h>
 #endif
 
 DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
 DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
 
+struct dt_device_node;
+
 #define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
 
 #define smp_processor_id() get_processor_id()
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



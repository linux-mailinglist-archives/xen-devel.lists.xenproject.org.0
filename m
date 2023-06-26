Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CADD73E774
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 20:15:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555628.867520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDqjq-0005xz-6y; Mon, 26 Jun 2023 18:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555628.867520; Mon, 26 Jun 2023 18:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDqjq-0005vh-4G; Mon, 26 Jun 2023 18:14:58 +0000
Received: by outflank-mailman (input) for mailman id 555628;
 Mon, 26 Jun 2023 18:14:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X2wr=CO=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qDqjo-0005vZ-56
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 18:14:56 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20610.outbound.protection.outlook.com
 [2a01:111:f400:7eab::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57f1e880-144d-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 20:14:53 +0200 (CEST)
Received: from MW4PR04CA0386.namprd04.prod.outlook.com (2603:10b6:303:81::31)
 by PH7PR12MB5735.namprd12.prod.outlook.com (2603:10b6:510:1e2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Mon, 26 Jun
 2023 18:14:49 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::82) by MW4PR04CA0386.outlook.office365.com
 (2603:10b6:303:81::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.33 via Frontend
 Transport; Mon, 26 Jun 2023 18:14:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.47 via Frontend Transport; Mon, 26 Jun 2023 18:14:48 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 26 Jun
 2023 13:14:47 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 26 Jun
 2023 13:14:47 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via
 Frontend Transport; Mon, 26 Jun 2023 13:14:46 -0500
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
X-Inumbo-ID: 57f1e880-144d-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPms2fW+NGjL8xmVhSmiK5ykPeQHyTYjxpzm5yziXrMoZW8UZlY/5xD5NvJDA38uTAuEZPymFQK3RN58veFjG4Qv+sm8ZGrXgGbVgKY98YJ2Q4E1DQ1xZLBs64l94C08mMRL/kZGNI0go+dfjS+MElMixmmY3fjDXq/RbOQi+EFXfIW+h5DT9QPWsOqWLrIiNIWa9FmvXIlxmGp4gvdLZU7wfRlhetPYw0k5MbCwZwnGbFVMI2h+pEh5S4JFyZYVsKLmQ8OylXKfuH7All96hNzjyLa/rgPHTITNwBBhGIOYtxaNsRkZAQRDWlA2Su+D265XDUY0jk/58TmM4mm4Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6yihoa+/80SBfUX8wWhjluFGN6I/haOtnxcY6AQwwc=;
 b=BS6iKZVR+BO/4DWLJlapv2cWrnAq6NBiOLaCraZym+rqjg+Fk1qXQOKc9jePCL850M49jER027IYS58yc1kPJuAi+T6pwq0ZgjUaCv5cZ7sMFPSjCVgsCRyaS4yY6FmOktWSwq21VPQ+S35XFV2oozSCWgDuAeD+QaQaFIPucGzPzuHba+EJlTHyfrwwPFc1m6nUA8pmLxH5TD4h/2c0W8r3gjDqDAcZ9HHneiuwK/eohuGx9p7wbV4N2M5uOvUL9GRIfL5IJ1BKb6r8L4kku6LICa+cGHsojf7MtvMurYGIu1Sve67IZe6uak7E057GHQwFst3b+3zF32eIG8qYlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6yihoa+/80SBfUX8wWhjluFGN6I/haOtnxcY6AQwwc=;
 b=WG/k700E8BBMv1oO3db6F4HZ9NeoBnIyy7FEFjpkHJFqTXWo2QsPxuDQh8+GwV1nnLOOz6qWhQuWfkXKREg0hX70pF/OUavSmP2Qk84gQFAslRHGepuSaoqGhN1/eMHemz54QZ+VOBpXxQkSOpgAPA3rMDngzxHs5VebdoBVOHw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v2] xen/arm: arm32: Allow Xen to boot on unidentified CPUs
Date: Mon, 26 Jun 2023 19:14:44 +0100
Message-ID: <20230626181444.2305769-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT015:EE_|PH7PR12MB5735:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b6239a9-18dc-4a91-2395-08db76713a5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n8Tza29vAMltl/hYUw7uY9T4fgG1WmMzatdgVyXM3sFLR+K9CzQeZ7Ub83sGMEQ9byyfJLFquZE+bhoiK1zF1rVyZDoR+4kMHOIB98kNXHM+epegL2SMH5ci30+0lqzfnh34W52KYl8uEkOehl+0cD86bugjeyi4kp1VGiSHaLyduhvXNMbEZI83rO5IKHHo6VvveZ9f8SiqLYuMSd42iNR3uXM74lH+1gPdaX+q4CNymQCdkn4oaQvXj15t11Oof5mD8YIGzRrB1QsM+eIZ7QmiI03a6cMt4S73XxM7p127Gv+tE9LONYIh3hJtYyA6u3izWcm4h23vhJ/9icd8SWWp9Ov6Mx3+7q3iJ1T3KXfQ6ceQ15ic4jW5ZWIzZVjCeR0SG19H1Kbtfpp9pNTw+tEJizxTFyiEaJ6seM0Wjm3WV4cITDH0xWY10i9Lrjf54+dTrbEqxyiyZGThj5zgt5BP2SXaMLDOHqcniA0YzF1h0vI6Y421xlpuSAYl/1JcEhzyOL2hpEJyVLefSs9TvJgpwJHu4uACLU6su8w5Lvg/MXpVLjK6iv7xPwBnREkPUB62mwLf9T/1Vda06P6Ltg393iPDCJg01gtObZ43EHF5PqcxvQfsWeZsrYzd3wa1sEUowILY+Rtm0g1GurILN4vZEaeyHs0gRP7qBZFK6ZYykNiugthg/OWDGbvvm1Jm2jRI4exlok/5ketgKcnXt7tLWjMHEAuGPYjbOsfv/Jafz18n8yBDHlKGUo+yUV3Denn6cmXOtWS5EfdV/voFpg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199021)(40470700004)(36840700001)(46966006)(2906002)(4744005)(186003)(82310400005)(2616005)(82740400003)(83380400001)(81166007)(1076003)(26005)(47076005)(336012)(426003)(356005)(36860700001)(40480700001)(40460700003)(41300700001)(54906003)(86362001)(478600001)(316002)(36756003)(4326008)(70206006)(103116003)(6916009)(70586007)(5660300002)(8676002)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 18:14:48.4034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b6239a9-18dc-4a91-2395-08db76713a5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5735

Currently if the processor id is not identified (ie it is missing in proc-v7.S)
, then Xen boot fails quite early.
We have removed this restriction as for some CPUs (eg Cortex-R52), there isn't
any special initialization required.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -

v1 - "[PATCH v1] xen/arm: arm32: Add support to identify the Cortex-R52 processor"
No need to add R52 proc id and empty stubs as there is no cpu initialization
required.

 xen/arch/arm/arm32/head.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index f9f7be9588..3e88178552 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -324,7 +324,7 @@ cpu_init:
         PRINT("- Missing processor info: ")
         print_reg r4
         PRINT(" -\r\n")
-        b     fail
+        b     cpu_init_done
 1:
         /* Jump to cpu_init */
         ldr   r1, [r1, #PROCINFO_cpu_init]  /* r1 := vaddr(init func) */
-- 
2.25.1



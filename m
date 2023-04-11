Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE076DE4AA
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:20:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519846.806963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJWz-0000Fs-Dh; Tue, 11 Apr 2023 19:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519846.806963; Tue, 11 Apr 2023 19:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJWz-0000Cp-8m; Tue, 11 Apr 2023 19:19:53 +0000
Received: by outflank-mailman (input) for mailman id 519846;
 Tue, 11 Apr 2023 19:19:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUb-0004DR-Au
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:25 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7eab::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c43909a-d89d-11ed-8611-37d641c3527e;
 Tue, 11 Apr 2023 21:17:23 +0200 (CEST)
Received: from BN8PR04CA0065.namprd04.prod.outlook.com (2603:10b6:408:d4::39)
 by MW5PR12MB5598.namprd12.prod.outlook.com (2603:10b6:303:193::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 19:17:20 +0000
Received: from BN8NAM11FT069.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:d4:cafe::d) by BN8PR04CA0065.outlook.office365.com
 (2603:10b6:408:d4::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT069.mail.protection.outlook.com (10.13.176.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 19:17:19 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:17:19 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 12:17:19 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:17:18 -0500
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
X-Inumbo-ID: 7c43909a-d89d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTkfvHMw4fwZfUXsGYwMWqNK9TBfbtOjNei/7m39xnNYGph1NAu8DmaU7G6RySe+rPUyKwHKLe99naA3atslI4+AtkslwbNRuNPYKKLdJofW3MMmOnpzeJGo5XiutQUte1DlFCfhFhdj87Gq49q4IuDy+mjjnfUTiAwGt/o5zZ5/X7mij/jUiRVQ/ypK4xXSK93zZTk3/8P6pzHFzO8Mz8QipY2YO5nk4KY2Qz+AsD8VOFDR84tsR6FIQhSvNDNrtx8rgi8WPHsHHO+VA4ZP2zTUMxJMFUnRfG64qCT0S3ZwpNR+Qdc+W0XXbvCxXDG3/qaB0QWPh0Jl+kbHQyfRDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1PNAnqijXbZmLbaJTz/bnk2u6mRzrBSQaqCUQeSU5s=;
 b=FFOrj0o6TWzAcl90jAx+ZHpRzHGwNIn49bwTOzhpxT9xczQKuC+bOv3XbPGefV2DAUNjs8LPXlSJl7eeFxcl3Js77kcXAsjSpBo/pZ4FoAXUZluAod0dSF+4iK/AuJ9jqq+FZ5F+2w0CfPVA7EZ4T4KfIah77GdUw1DS5OspoVVRjpfVj6GivPDwnhiMA3xRShQrR80etqXS8yQrlNOZTaQGIE8hgoTJY2lTkLjnOa5fqC2hGR0lXlxwWyZmiVfUaHtO1lh3TN7b+FkSX04YJucGOjqJ0o2GNVZbQy75ZPPjLf2LMYA+6320fVpyHymJTLTV9G0wLwN/smWITJA8og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1PNAnqijXbZmLbaJTz/bnk2u6mRzrBSQaqCUQeSU5s=;
 b=wuntfbt/6RBi8we1bEE2MT1iJltEJu3U0H+EIy9i2cz6kFGZok1kVKid9tZJ9YA4toycLlEjO+CWZBRQ5Ip6Z+OBgVQZJU7x0141SchJob5+X1IMGwlxoqatul6fHZdmGPXqUhYG7EPBT0MeLCz1tnHGX9EHSUVraItI7oKzduE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v5 11/17] asm/smp.h: Fix circular dependency for device_tree.h and rwlock.h
Date: Tue, 11 Apr 2023 12:16:30 -0700
Message-ID: <20230411191636.26926-30-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT069:EE_|MW5PR12MB5598:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b4fc63-54fd-44d5-795c-08db3ac15eef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6qps8HEQfzg6wg3LtuU3NpVWgiVYlUptzQkTg/BZ9Gx9WDs1l6HDyz8G0SoDMCc7LRHWlB2Y195o8IxiFIGfe00rQ/Y3jE/uWYyf5hxB27tMEFxn1Fdd6XND800/0MYjrtNWAW/Ufrmiu+8+pVwS4GhBT71kAKdVlGPP0YQpQDVJdpnZQecPzZY7fnz0onN5GjRImXxLG4hsGswv9MCwizwqJSUGDHRyT37u9jW3d+zqsh58sUrcN42JdNpKAqqehq9UeUx+7oEyEg3VF0kkwlLlJCSooQC/+ltMLVfVL4683p2wWl0i3tyVPCV8kwcWlNj6jUBwmN56BB0sZRFDgNRhER5ttELBJ4ZW2773SZmdfgy5USZsnKt8GKjAULUjv+j7lw4iCNNri/oMGPQkPKBRdRRZ5Rj0VzcaJJsWKtXhIzIGNXUXDO2AuoJtI8NLFbnEI/S48bTKGPUdapAW+VBlIm/h/G70ED2XUZKdmmGkDdyxYKDk3l8+05eGdoSl962L8Vn6Cb3L7fvK5ZuzulOuPd2l8cho+UpIXAZQ3fwTJ3Of0NqHKN19SEO3kOS6bENVhoHroexpz2sOI75rMGp8cu/JSihG39ZB7hrL/WfXleR3Gc/hGE2a7d6jqMSK6Q8WHI6/L/kSKmd2JiJ/N3XGO02+YbtfE3pOn2KgsnxTSMlHFHGilsOflgK3M9qWL5Q3XQCshZtJ5/VRIvbzztT0cU2B2oSekLyp1Hqb1Q0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(36756003)(44832011)(82310400005)(40460700003)(2906002)(5660300002)(8936002)(86362001)(40480700001)(8676002)(26005)(6666004)(1076003)(36860700001)(54906003)(478600001)(2616005)(47076005)(336012)(426003)(83380400001)(186003)(70206006)(70586007)(81166007)(82740400003)(41300700001)(356005)(4326008)(6916009)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:19.8440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b4fc63-54fd-44d5-795c-08db3ac15eef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT069.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5598

Dynamic programming ops will modify the dt_host and there might be other
function which are browsing the dt_host at the same time. To avoid the race
conditions, adding rwlock for browsing the dt_host. But adding rwlock in
device_tree.h causes following circular dependency:
    device_tree.h->rwlock.h->smp.h->asm/smp.h->device_tree.h

To fix this, removed the "#include <xen/device_tree.h> and forward declared
"struct dt_device_node".

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 xen/arch/arm/include/asm/smp.h | 3 ++-
 xen/arch/arm/smpboot.c         | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/smp.h b/xen/arch/arm/include/asm/smp.h
index 8133d5c295..afe6129276 100644
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
index 412ae22869..336a7d418b 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -11,6 +11,7 @@
 #include <xen/cpumask.h>
 #include <xen/delay.h>
 #include <xen/domain_page.h>
+#include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/mm.h>
-- 
2.17.1



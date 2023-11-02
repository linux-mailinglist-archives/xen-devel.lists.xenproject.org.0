Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859487DFB2A
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 21:01:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626988.977808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qydsf-00027M-9O; Thu, 02 Nov 2023 20:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626988.977808; Thu, 02 Nov 2023 20:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qydsf-00024f-6h; Thu, 02 Nov 2023 20:01:29 +0000
Received: by outflank-mailman (input) for mailman id 626988;
 Thu, 02 Nov 2023 20:01:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mhp2=GP=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qydsd-0000bG-DO
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 20:01:27 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99bbd4ea-79ba-11ee-9b0e-b553b5be7939;
 Thu, 02 Nov 2023 21:01:25 +0100 (CET)
Received: from MN2PR08CA0018.namprd08.prod.outlook.com (2603:10b6:208:239::23)
 by CY5PR12MB6575.namprd12.prod.outlook.com (2603:10b6:930:41::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Thu, 2 Nov
 2023 20:01:19 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:239:cafe::13) by MN2PR08CA0018.outlook.office365.com
 (2603:10b6:208:239::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Thu, 2 Nov 2023 20:01:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Thu, 2 Nov 2023 20:01:18 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 2 Nov
 2023 15:01:16 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 2 Nov
 2023 15:01:13 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 2 Nov 2023 15:01:12 -0500
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
X-Inumbo-ID: 99bbd4ea-79ba-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvnvBI1jQc7P3iNgtanvGtELPkJnanpDublf2zbGDTE1ZCg/K8wUtXdV1Qs9pVnuiI20ttcb1v9SDCmnCKeeiJqtR66mZmFKXuGQTfAsp4TIjt3yDtlmWVayfhyLAQXHPxIi6KGcBDgUm+q1zQkkLqOxtSCUtBee3xCsI2UMx00F7DVAUwUF68pxplH4blAfMpTwdJpBJl5t4WDghF1NTuX2YzRs5/rvGCv8ZkQzaJNJFatYNXa+CLJI7EmVgsFj/g9kMQmtLbhCRftSDPjtHqRPz6R6GU2TyZ7rqucwzGe6GK3bFeqAC9dHpPRRX61SORkty2WlbHxRMmho62HbvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uwbiWJ1nI3UFBqjsZm4vAYZ3Ae/EpuSxlOkJkStLfA=;
 b=Mz8atBG0mrNpA6cXey8aPgsRg1Sg6+Pnw71yV+FkSZfGFLS4Yq8AUvlYpdXHO9pZtDO/C5kuztHqomII0lmYd6UYFXEO7Zj7boKpvfWoEvBTMTQEgYD1QbzbniMLhpa/CHzHNvGbWAMCJr31DVdxYK4CPSWOO9899BXVrYbBwbL6mfFE4xLklHcWmP6Qmx/V5UiT5A38X+KeXyjylsZPEK5Xf3rFEcveKlnF+9HSSlq2gNdysRcpoV9zn7weALlKMTxaPnFiHYyitPiZEWVoVvcQcsmLk4E5IcPc8Ca3TOIOKp/TdjxPJBSzLKO6UjP8+IAU3ufAi/HP1lrvuas1xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uwbiWJ1nI3UFBqjsZm4vAYZ3Ae/EpuSxlOkJkStLfA=;
 b=APQcW4kY85/x5xL9U3eZ66BjCHujeV6R/WYZpc6c/2aqoLP369RL3uRoRMxPWbYP/6gCTCLFHKwBiFNBm4fRGDBQy2ZaALtVkU3FqI8hzZjxnTXBpw+EI75KwAuLa7HTd+Wc955drYQw/8ticQT+vkJgwptH0VFJZbZVzevg0zw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 5/5] [FUTURE] tools/arm: enable vPCI for domUs
Date: Thu, 2 Nov 2023 15:59:33 -0400
Message-ID: <20231102195938.1254489-6-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102195938.1254489-1-stewart.hildebrand@amd.com>
References: <20231102195938.1254489-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|CY5PR12MB6575:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b91149a-b549-4f28-9d87-08dbdbde7a70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4Q6LTwBKsV6adbBlnsonGS2aXbksVl1jUaOcNmf0z/rlh7PHlc5untp62E7vXLOVK21EGqfagHz/yNzFNATdiVQRnD1YVl03cdZgMJVfgV+/7jnw7+zynaanb1a6lzxp5Upb4CcYpc9y84YkoF/BrayO1rm+MOYvYbFI2ROAyCSoxENq6jrjLSK9Ff/oN72jhROMi1aQE1XjUDdG7NmumdzTdn/okTLY+Mj+VUTJJ3EWAkgQfPUKxUnh4FfQIghrJULXvCQXOEdptzpJ7Pl5YPLpEMEHsrFpzfT+g2SOeh82B31e9CVPWOKa3Ku4UoM1pbX/bDpQyGxU4wbAHWCLWVZMqF2pUZ2OPedz38cqqSGkxVkCVu1QQAguVYlHrVBmSMtFJcMn1GUjXz/AAEA82I/dO7QbMpnjsKM5r22zBmKDafK4XrB+aYxvtp4hk45fj2PF0ix9uj/LJKAp4sUaicR8kYWZfIWY+5ocrNzouqAwDJKzbLi5mOySVJFOb3ncY5aN3q0jVGzbtzuoTskFJPTa5AixmSi+nebEUAYupLHiUqIC0mCU+xfESVpoEGr11CuaCwjE773IzDIZx5WGReGAb5JQ8tQVp1pHEdb25RhVnpqUvPafj4J4ldleO3yAv/M0Ty7CFqEDjth6/08ScRF/qTHr2e/GC5LbNw8GmVXIBrG3Rf/CDUWcYER+TUQw02ueiWmbfE3gDf7w/IQAAhxUmWA8g2cEU+8p/D763cqVn4JnA8PZwO5sVoWj98ivOLeEGQgv4RTvppu9VMBw4A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(39860400002)(136003)(396003)(230922051799003)(64100799003)(1800799009)(82310400011)(186009)(451199024)(36840700001)(40470700004)(46966006)(6916009)(47076005)(316002)(4744005)(86362001)(40460700003)(2616005)(1076003)(2906002)(336012)(81166007)(426003)(54906003)(26005)(70206006)(356005)(478600001)(36756003)(44832011)(41300700001)(8676002)(6666004)(8936002)(70586007)(40480700001)(82740400003)(36860700001)(4326008)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 20:01:18.4136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b91149a-b549-4f28-9d87-08dbdbde7a70
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6575

Set the vPCI flag in xen_domctl_createdomain to enable vPCI if a pci
device has been specified in the xl domain config file.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Same story as the patch before this regarding the [FUTURE] tag.

v4->v5:
* no change

v3->v4:
* split from ("xen/arm: enable vPCI for domUs")
---
 tools/libs/light/libxl_arm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 15391917748c..6daed958e598 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -222,6 +222,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         config->arch.sve_vl = d_config->b_info.arch_arm.sve_vl / 128U;
     }
 
+    if (d_config->num_pcidevs)
+        config->flags |= XEN_DOMCTL_CDF_vpci;
+
     return 0;
 }
 
-- 
2.42.0



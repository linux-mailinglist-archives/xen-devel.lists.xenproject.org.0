Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AA224F189
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 05:29:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kA3AF-0004eA-GM; Mon, 24 Aug 2020 03:28:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ot5I=CC=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kA3AE-0004e5-Lg
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 03:28:54 +0000
X-Inumbo-ID: cfddd72c-a4e3-4d2b-905a-11773d4e3d15
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.76]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfddd72c-a4e3-4d2b-905a-11773d4e3d15;
 Mon, 24 Aug 2020 03:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+H3wJF+JHcr7lSYGrwxDrb7AbgKV+XERRs6NTOnc74=;
 b=TQkpWI+QLGRKaXRbZj7FGaEEeCTPCXSD3AWmLSpwtoLlLylJi28yiJlQRQJdmzi0weLDaS2QCXMNu+VRbUuY6GhzDdu1eNuMc1HpEdS75r3l+RCx997mnbK9IDxYUFGPWCQu4A8ZKJi6NaCL6dx+k0LHRvlXkRTcBm2/2QJSzQM=
Received: from AM6PR10CA0048.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::25)
 by DBAPR08MB5558.eurprd08.prod.outlook.com (2603:10a6:10:1b3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Mon, 24 Aug
 2020 03:28:51 +0000
Received: from AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::f) by AM6PR10CA0048.outlook.office365.com
 (2603:10a6:209:80::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Mon, 24 Aug 2020 03:28:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT014.mail.protection.outlook.com (10.152.16.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Mon, 24 Aug 2020 03:28:50 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64");
 Mon, 24 Aug 2020 03:28:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4dcd6ddfea3d147f
X-CR-MTA-TID: 64aa7808
Received: from c58748b821c1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 06EAF8FD-4D80-4363-B2BA-9384155B09EC.1; 
 Mon, 24 Aug 2020 03:28:45 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c58748b821c1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 24 Aug 2020 03:28:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIuFdDTK4QYDnNHVrdvBnkikjox4BRwvPqCTk+pEQzJmhYaT1FIMJ7vBWbM8RVic78HPgA6gt9Ycg2md0qGVGeNsNlLzFUtEptBqdR1gIcC4LJmLBgLPpFIbpfWP2scPItHbFYEPhut0TR5l3RYkm7i98qxtzVpeyOORO5COcYiFP0LaWkTr0i4eJKCZmbiqCLzk+nFYVJjaBWX4sZ1ID4rvpXBDrvatd9Cm2rwLhU3mPcJpCtVVoYC9KY90b0WBvKBA9PuYTDtDubIi2yQdzCJSjl9/atleypg8/MLdwfIOTXbJ9WF2FHqPCzzGA/x4eMZrFRGSO5diSysZBz/Y/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+H3wJF+JHcr7lSYGrwxDrb7AbgKV+XERRs6NTOnc74=;
 b=h1Ya9OA/BDbZBLhyG2f9e4JfNIDkGJRfVnx3SYhjEBw1JptcKHbnXgNiGLL/X3nK4k6SXCp7MiNN7AKxkRPgESMfBiusOOBm/daYj3TpT9s+weU7YK1drKtfrXEuNWq5dOi8zFgkUF+gwv1LnpsSsV1PnnZxXVlgm0a0fZanJjIkmsMuIBm+SJKgMRLDGkCaLlbA4dv/ywi9zb+qZJlq7cOFeZ20AjwE9vm/S9798VL5V0P1jXrx4cNWIdEqWTgBqGc8BvDtQsh4JB7nRBgvf3dAKedbT/TRdETCX4b4x3TZ+wc7LxVSKmlJDARxMQ/JN9G7Dk/hldhBrpMewpsnQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+H3wJF+JHcr7lSYGrwxDrb7AbgKV+XERRs6NTOnc74=;
 b=TQkpWI+QLGRKaXRbZj7FGaEEeCTPCXSD3AWmLSpwtoLlLylJi28yiJlQRQJdmzi0weLDaS2QCXMNu+VRbUuY6GhzDdu1eNuMc1HpEdS75r3l+RCx997mnbK9IDxYUFGPWCQu4A8ZKJi6NaCL6dx+k0LHRvlXkRTcBm2/2QJSzQM=
Received: from DB8PR03CA0032.eurprd03.prod.outlook.com (2603:10a6:10:be::45)
 by AM6PR08MB4582.eurprd08.prod.outlook.com (2603:10a6:20b:8f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Mon, 24 Aug
 2020 03:28:43 +0000
Received: from DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::18) by DB8PR03CA0032.outlook.office365.com
 (2603:10a6:10:be::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Mon, 24 Aug 2020 03:28:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT028.mail.protection.outlook.com (10.152.20.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3305.24 via Frontend Transport; Mon, 24 Aug 2020 03:28:43 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 24 Aug
 2020 03:28:42 +0000
Received: from localhost.localdomain (10.169.214.112) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2044.4 via Frontend
 Transport; Mon, 24 Aug 2020 03:28:39 +0000
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
 <julien@xen.org>
CC: <Andre.Przywara@arm.com>, <Bertrand.Marquis@arm.com>,
 <Penny.Zheng@arm.com>, <Kaly.Xin@arm.com>, <nd@arm.com>
Subject: [PATCH v2 1/2] xen/arm: Missing N1/A76/A75 FP registers in vCPU
 context switch
Date: Mon, 24 Aug 2020 03:28:24 +0000
Message-ID: <20200824032825.18368-2-wei.chen@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200824032825.18368-1-wei.chen@arm.com>
References: <20200824032825.18368-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ff2c318-66ed-48d5-c2b6-08d847ddd1ec
X-MS-TrafficTypeDiagnostic: AM6PR08MB4582:|DBAPR08MB5558:
X-Microsoft-Antispam-PRVS: <DBAPR08MB5558E463728F636568E8AF489E560@DBAPR08MB5558.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: MBZi2oeAXQNPAFJxKsa0qYoF5IIfuQ85zqSu80Bsy2XaQApWnVlR8x44gbyRZGqFbTBP45VQwMZ1jSmTDxpzFXuVIR/tSvNv5b62KCKK6MFhImQpOu05Ztc1IRrjJnbFZYuTt/WvXksEm9cYEyqWucEZe3YZPlA+IpinUrnd+GZQe0bNDnbQZdfZFE4WBFdKE8xpt9IfxkigOcKXMZhlagBHq3iqAiEk6TUlESY4VJrqeuZhPbNzP0I0Gd4LYoYz+G2POpDL7cS6TZKMWA3lRt9GkHai3aMImMZYigRtGo80hPsFhWZv8OSZ8WNBQ0RtMHUQ+S+FLT4sFXS6k2aBe138EwQAGW1HyKwqcszDSTXdegktJOKq/amJiy25iuQCkzHkjfEpGFU9FrRqmFFxQA==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234; CTRY:IE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:nebula.arm.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(39850400004)(136003)(396003)(376002)(346002)(46966005)(86362001)(70206006)(426003)(336012)(4326008)(1076003)(26005)(44832011)(70586007)(2616005)(5660300002)(36756003)(6666004)(2906002)(186003)(8936002)(54906003)(8676002)(316002)(82740400003)(82310400002)(478600001)(110136005)(47076004)(81166007)(356005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4582
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: ba96a953-16cf-4955-d6cd-08d847ddcd74
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3TE+wIu80BhcJQJ3IXDBP2Fb5N50eIO9K9JIcvLDS/6VaHbiT+CA0fgqweOashg3EFsqdmiJh3yB0hPVz5JNTGvighK/GYAUJg7gX5LLe8f1Y317R78wH10T6vRgBkJX+kRi2sgUfoOnvyZTEVSYue7mGVGNwAVpKNz5yt7lliPIFdK+obgck4UzZcXXRDm8Ta0CXLGRO0KZI7Hmas6nYMlA/3mtvAJZegAA4kfQVHiDfbvnVtQwBldLNq/vCXcElop1In8DjkrKXmV8Fbxy4jpg1uQD4eyoFYej03AVOKs3Y9uubq7ESve5pTKfN0PG0MuAppSEs+mGbca97pL0fZZwiY7d8LvlpUHxgVp2AByjF4LkK2SClinaC7EuF7ne7K724a7ESOVRvGuvgvcgvA==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(136003)(39850400004)(396003)(346002)(376002)(46966005)(8936002)(186003)(2906002)(44832011)(4326008)(5660300002)(1076003)(70206006)(70586007)(26005)(36756003)(6666004)(336012)(426003)(8676002)(478600001)(83380400001)(36906005)(82310400002)(81166007)(316002)(54906003)(47076004)(82740400003)(110136005)(2616005)(86362001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2020 03:28:50.7654 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff2c318-66ed-48d5-c2b6-08d847ddd1ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5558
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Xen has cpu_has_fp/cpu_has_simd to detect whether the CPU supports
FP/SIMD or not. But currently, these two MACROs only consider value 0
of ID_AA64PFR0_EL1.FP/SIMD as FP/SIMD features enabled. But for CPUs
that support FP/SIMD and half-precision floating-point arithmetic, the
ID_AA64PFR0_EL1.FP/SIMD are 1 (see Arm ARM DDI0487F.b, D13.2.64).
For these CPUs, xen will treat them as no FP/SIMD supporti, the
vfp_save/restore_state will not take effect.

From the TRM documents of Cortex-A75/A76/N1, we know these CPUs support
basic Advanced SIMD/FP and half-precision floating-point arithmetic. In
this case, on N1/A76/A75 platforms, Xen will always miss the floating
pointer registers save/restore. If different vCPUs are running on the
same pCPU, the floating pointer registers will be corrupted randomly.

This patch fixes Xen on these new cores.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/include/asm-arm/cpufeature.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index 674beb0353..10878ead8a 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -13,8 +13,8 @@
 #define cpu_has_el2_64    (boot_cpu_feature64(el2) >= 1)
 #define cpu_has_el3_32    (boot_cpu_feature64(el3) == 2)
 #define cpu_has_el3_64    (boot_cpu_feature64(el3) >= 1)
-#define cpu_has_fp        (boot_cpu_feature64(fp) == 0)
-#define cpu_has_simd      (boot_cpu_feature64(simd) == 0)
+#define cpu_has_fp        (boot_cpu_feature64(fp) < 8)
+#define cpu_has_simd      (boot_cpu_feature64(simd) < 8)
 #define cpu_has_gicv3     (boot_cpu_feature64(gic) == 1)
 #endif
 
-- 
2.17.1



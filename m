Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C32A6251CE5
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 18:07:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAbTC-00043z-Ia; Tue, 25 Aug 2020 16:06:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BGsN=CD=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kAbTB-00043e-0q
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 16:06:45 +0000
X-Inumbo-ID: 96917e6f-fc4d-4c40-86e1-5cb998a496bd
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.78]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 96917e6f-fc4d-4c40-86e1-5cb998a496bd;
 Tue, 25 Aug 2020 16:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxjuW76QYQnnm39E3PPg+txyPyA7XTzDaE5mmk/F3KI=;
 b=tW81WUtcEey1DpjyEhpr2GFfkUviVChHK/eux5PxKh2OO+bGhH61lIOt3TCMkNwuxGDkh9iQ4+EJ+rlF/5C3TOKhS4rYYfG9/xg/tEeee5T1T2Uq95Q0BXw/iGYYqbG0lYfWRG/T8ja7TdplSSD2Af+j2AtSlOIqA3ndkTFNi6U=
Received: from AM7PR04CA0013.eurprd04.prod.outlook.com (2603:10a6:20b:110::23)
 by VE1PR08MB4879.eurprd08.prod.outlook.com (2603:10a6:802:b0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 16:06:35 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::8f) by AM7PR04CA0013.outlook.office365.com
 (2603:10a6:20b:110::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Tue, 25 Aug 2020 16:06:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 16:06:35 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64");
 Tue, 25 Aug 2020 16:06:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0bc93683b30ee6c0
X-CR-MTA-TID: 64aa7808
Received: from 14d743066a72.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7D628D81-D674-434E-A3E7-254F09BA3B56.1; 
 Tue, 25 Aug 2020 16:06:29 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 14d743066a72.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Aug 2020 16:06:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBfwO9ZqbE8APr7/ki+POnZC5X2JppDb4ErRrRv/weKMco+qfiaROWErmh2IrNufDrFLYseQJb8+YN0eJn2/++YjPj1QmkZC95LgFaVk2Bb9Eqv60O2CgqShWsdDXY/NPcG64W3k4ZZgc1p+dg7E4fhOXPOxfvFEvGws+lYYIGQp4uklU8R6zfmbH5dWW1oJ5bBqayD9KOGGs/biXgKfZwlv5NJhn/N86I4oI/r5guk7Mh0qrMq3QsOrkkbq7oQns2OvA/yj38/pI9Vk7ynogogU3pqx8fCTz3g3cpQKlHl0pEQiqss4bhZ8kWR9c9MTn7X+f7h7jT5nES7EHBG9BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxjuW76QYQnnm39E3PPg+txyPyA7XTzDaE5mmk/F3KI=;
 b=liPaN9Fa/GpS3U9xGmG5evn+1I3XVlcqX1nUt5wq5pdZhQOX82rrgIE7DIx+EXucCZ5AybLyO2Ktebpda6pSGGsg5Bw8z96gxDc6bWD7LyxtDpA9Jm5cxr+Ui24p6wQ4FN3mn7BVEPMJaUTRTyYZt9dRfr6xdrjUMPc8gDLavKax1XCb+Ba6vmLvqMqzIvicWrNh2jNFkXApNKIDcGrCZlXJPNbvYLGMmrGaKTqGnfnFtTF1iQy2W9ippKSh3voQz5KugWiuftQjxfzPt3xfGLVOWIxdDbTfPUxmKtOiqXS6RfxDZDSyEx4F5HdYg5TLJejQE8X/ZHu1WRLEVlQwgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxjuW76QYQnnm39E3PPg+txyPyA7XTzDaE5mmk/F3KI=;
 b=tW81WUtcEey1DpjyEhpr2GFfkUviVChHK/eux5PxKh2OO+bGhH61lIOt3TCMkNwuxGDkh9iQ4+EJ+rlF/5C3TOKhS4rYYfG9/xg/tEeee5T1T2Uq95Q0BXw/iGYYqbG0lYfWRG/T8ja7TdplSSD2Af+j2AtSlOIqA3ndkTFNi6U=
Received: from AM7PR04CA0024.eurprd04.prod.outlook.com (2603:10a6:20b:110::34)
 by VI1PR08MB3566.eurprd08.prod.outlook.com (2603:10a6:803:81::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 16:06:24 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::5a) by AM7PR04CA0024.outlook.office365.com
 (2603:10a6:20b:110::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Tue, 25 Aug 2020 16:06:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 16:06:24 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2044.4; Tue, 25 Aug
 2020 16:06:15 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1779.2; Tue, 25
 Aug 2020 16:06:15 +0000
Received: from localhost.localdomain (10.169.214.112) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2044.4 via Frontend
 Transport; Tue, 25 Aug 2020 16:06:12 +0000
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
 <julien@xen.org>
CC: <Andre.Przywara@arm.com>, <Bertrand.Marquis@arm.com>,
 <Penny.Zheng@arm.com>, <Kaly.Xin@arm.com>, <nd@arm.com>
Subject: [PATCH v4 1/2] xen/arm: Missing N1/A76/A75 FP registers in vCPU
 context switch
Date: Tue, 25 Aug 2020 16:06:02 +0000
Message-ID: <20200825160603.32388-2-wei.chen@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825160603.32388-1-wei.chen@arm.com>
References: <20200825160603.32388-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5a3d10f-1eb8-4f47-92d2-08d84910d76c
X-MS-TrafficTypeDiagnostic: VI1PR08MB3566:|VE1PR08MB4879:
X-Microsoft-Antispam-PRVS: <VE1PR08MB4879B63BF152712FD0FD625B9E570@VE1PR08MB4879.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: DChIpTwLyBfb5rP/RKHNBE5mV9VO2fi239U0Vz8aILgdbu37VxxmlFVy+M1IOyDN4NVKceO9JQR0SodCNPB0tpceahykqQID/r4slHBou5cE2vVGyjd9Sp3ZonLY6MnvwM3ivIO1jtYUxpdOG8w7jrmaOPI5l4mPCZr/PSnHqBgYfUq369/g+LjPNTX9ribFKlbfKVL53Tp4RSc+8dh2xG7zyL6LGf5rd9mXb8DQ/B/0MEFLjRheL5XoGK7sXDJejBdpKUsG5j5IKDWBRZrFKGoGrtYaxMIw8dBNJeCB/oRhXNtTSJk/lLT+l+Zb6jEZlHGst3EgQyxBDZ1QUHytm67CxlHVjbbsQ6hjP6vZhwIFJI5LUmdyLNuDB2wZB6hUvIlL/vhAKD3VA8ieuH75CQ==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234; CTRY:IE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:nebula.arm.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(376002)(136003)(346002)(46966005)(82310400002)(70586007)(4326008)(2906002)(70206006)(316002)(8676002)(426003)(478600001)(44832011)(36756003)(356005)(54906003)(6666004)(47076004)(82740400003)(8936002)(2616005)(86362001)(336012)(26005)(186003)(81166007)(110136005)(83380400001)(1076003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3566
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: c6b0ce40-7d83-495a-380d-08d84910d09b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rX7BQlb/0ngAHKEOn5UqbXSRMlLrRg0/VYb9TZ88ARf2BabXGyRdVDjfRQGI3AqQ2hiYgjwrk5cvBHWy41EKtM+Ud2feAtHR0mmUl+T0kapamr/9v0sKv3ULU8/eiyyMRexpLFuRMGnYNhaZ4FDjt/R0FCHOVrq2XZGCEN6YSMImNAsfjWDKHvZW2r0HS8FHnv7FAuJ8llvRzSuWbvE31vlcSJoqmHLHrABSf6gCGppsREvqBQkttDx2Iaj5/CoB9FbL5WbbTLOfRUH9idgIdqk4sguQLG9K+NfcaEJEvc5DpNNVeLpDrwtgJd23eXIYfrQ4dP+tEGcuDqJbla+9caTHKrsNqWc8mLM6yq985Gt8MPzxgdS2Jng9vPbZwr+W5u1AukE6k7G5nXOnblNTFQ==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(46966005)(36906005)(44832011)(316002)(86362001)(1076003)(4326008)(336012)(478600001)(5660300002)(8936002)(8676002)(82310400002)(82740400003)(70206006)(70586007)(83380400001)(186003)(47076004)(426003)(6666004)(36756003)(81166007)(26005)(2616005)(2906002)(54906003)(110136005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 16:06:35.4317 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a3d10f-1eb8-4f47-92d2-08d84910d76c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4879
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
For these CPUs, xen will treat them as no FP/SIMD support, the
vfp_save/restore_state will not take effect.

From the TRM documents of Cortex-A75/A76/N1, we know these CPUs support
basic Advanced SIMD/FP and half-precision floating-point arithmetic. In
this case, on N1/A76/A75 platforms, Xen will always miss the floating
pointer registers save/restore. If different vCPUs are running on the
same pCPU, the floating pointer registers will be corrupted randomly.

This patch fixes Xen on these new cores.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
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



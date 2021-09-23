Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 289A24155D1
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 05:12:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193314.344363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTF9U-0005QK-8B; Thu, 23 Sep 2021 03:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193314.344363; Thu, 23 Sep 2021 03:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTF9U-0005LQ-3u; Thu, 23 Sep 2021 03:12:00 +0000
Received: by outflank-mailman (input) for mailman id 193314;
 Thu, 23 Sep 2021 03:11:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qvJY=ON=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mTF9T-0004Qj-DW
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 03:11:59 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.75]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ffdad977-1c1b-11ec-ba0a-12813bfff9fa;
 Thu, 23 Sep 2021 03:11:53 +0000 (UTC)
Received: from DU2PR04CA0237.eurprd04.prod.outlook.com (2603:10a6:10:2b1::32)
 by AM8PR08MB6562.eurprd08.prod.outlook.com (2603:10a6:20b:355::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Thu, 23 Sep
 2021 03:11:43 +0000
Received: from DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::74) by DU2PR04CA0237.outlook.office365.com
 (2603:10a6:10:2b1::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:43 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DB5EUR03FT028.mail.protection.outlook.com (10.152.20.99) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 03:11:42 +0000
Received: ("Tessian outbound c9f4ff96a6ad:v103");
 Thu, 23 Sep 2021 03:11:42 +0000
Received: from 328040812834.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3AB28AAE-394B-455B-9593-66F767380AEF.1; 
 Thu, 23 Sep 2021 03:11:30 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 328040812834.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 03:11:30 +0000
Received: from AS8PR04CA0080.eurprd04.prod.outlook.com (2603:10a6:20b:313::25)
 by DBBPR08MB4521.eurprd08.prod.outlook.com (2603:10a6:10:cd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 03:11:27 +0000
Received: from VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::3c) by AS8PR04CA0080.outlook.office365.com
 (2603:10a6:20b:313::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:27 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT039.mail.protection.outlook.com (10.152.19.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 03:11:27 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 03:11:26 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:24 +0000
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
X-Inumbo-ID: ffdad977-1c1b-11ec-ba0a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHVKimCebnfTnXl/cdcWvwlQTjDe3a3vxMZKNxFvmJA=;
 b=i1VoeOZq/COXIp7ZbnpyZQVqsu5uUNZnHJaRzwrtdj9mPh/FV/aFfxwDlsBlGYBVCFKmrq7aGrF9PmuP909Zdbgb26BDFxzf5JbK0Pf7E+aItb8kJiPD1jxSwtm9NtRq1JpDJao7tsaaK2w6WM9D6vUETRL9G1xeHLv2M4RcrAA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3c0ad97f2e027594
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwY3/gCgm8FFI+//Y8bWgllcA4uiJCy5D//le6d3gRFdQ80qyseUmsGnxVdB2mwJJlWkUK1bfzDbopug7eYM66xknZHK2sz0tYd9i5aHjlDs48rnKIkoLKozMUQ7S1bNNtcb+Hn+6DhbLhYKh9fjqXjc3GzC6ornpAtRnfRM43yC6xxXBOH9BCG7e0Rghhvh+FeiCAo/Z5vYOx3XIok/diyWYKS156/fzPoB1xLMQqwQVunhnHWZtizM+YevLz5dc0d4OiDF2G7TlDLvbmVHqbgpIW1qI5yyImP4hHA4jt5i6pWZzOwo6IKeHPBrH3AxRXsmq/92UOJAvNS+en86vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=qHVKimCebnfTnXl/cdcWvwlQTjDe3a3vxMZKNxFvmJA=;
 b=AfgfBHyZVQf58vqVzf95ri3+Z+E0vfIenu7+wtaGtpvp10Kk8nUuV6AjKKdXTw+JOg7tEyHaFflftiClfBKVqMk6KL1CcACg+vyUNGccGyfvV/ewRBmMtx+eTvEDeWMTpNq/2vKLJJvvXpGH72ftIiBeBpXvd4YIRVQ4ot8mypQx5qQu8GAD3Zd5yFlYS0i2r1MvYnVxOrfUjgKf0vPeseIeom6S9ANHXDgFWC4Y+X8mzj3/1txiL38VObTKovXNVt5AHLgbC837DJ+qG+qFWDJQ9hG7b3MH2fBfCaHRou2a2USEeTikySxAlQJoV+HSusFZ6R7O/tQG7rpf4ewxog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHVKimCebnfTnXl/cdcWvwlQTjDe3a3vxMZKNxFvmJA=;
 b=i1VoeOZq/COXIp7ZbnpyZQVqsu5uUNZnHJaRzwrtdj9mPh/FV/aFfxwDlsBlGYBVCFKmrq7aGrF9PmuP909Zdbgb26BDFxzf5JbK0Pf7E+aItb8kJiPD1jxSwtm9NtRq1JpDJao7tsaaK2w6WM9D6vUETRL9G1xeHLv2M4RcrAA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH 02/11] xen/arm: introduce XEN_DOMCTL_INTERNAL_directmap
Date: Thu, 23 Sep 2021 03:11:06 +0000
Message-ID: <20210923031115.1429719-3-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923031115.1429719-1-penny.zheng@arm.com>
References: <20210923031115.1429719-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7638033-1e47-4487-6928-08d97e3fde68
X-MS-TrafficTypeDiagnostic: DBBPR08MB4521:|AM8PR08MB6562:
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB6562B705C129DDDE7A1B604AF7A39@AM8PR08MB6562.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:229;OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jtH2pJ/rqcJUjKN21pHyIOZmf6cu17r3p9OEYfYSXgyVmrpktCeFWsahkl/Zwy25iwD3zpX5b8luqiJ6o8vIM3Mvw8wHDzSGXg7ZA14nNL+f9xHAlSWgZaRyqkdMBOZWccd/Awnid/bFv/4jbkyJsrWOElkdfHHNQRXA/bzv5aFRBbJlq0x2y/HgWzdzEcb33DacVx/6hD1m8jG9+9ZmHvhw7sfhQ5fbOfcJ36lca8NlYLKG/tBc5EFVmfAMwUxDT1GISY4z15uGemW4GXoC4XwTtnzlF7NbCxIMW3piceTmkTkh+mzFEVHqVp8fh/7vkhYG7gQtGDaloKCyASyMXw4bgMgATBF7v/c1noeAkMLPScdxK8WtZWWAw3MpdzBqCOuF+4EWnEfswfz9DD4AVwZOIhXdTxKpJBRlAfPMGPOdIEdXifFDBH5hPyJ77rfWT72cwKwZM64zvLqdO81louCYpnIxDTNwxfj/c/fiRKTfMl5/j5WUOokRA/66AsSVeKRIx88RbDRpAEVddjORoH3fVYQVvXEDDm4Ue0Ogs0eJhQHAzHw7Gn7Vu5MSaVsNUsOaTjX2bRsZuFfrP7Alid8jFRr3s0ombp3PhAug3J6C/IDlFIKRNHdzKi3zJIXaherUBde8v2ykAidhvBP815z3oujNcE3lssGaztVEb90PDlBtscjc3GDsv/lQ4d/ITJW56oFvshpahH8j4qbrL7K1Nrc3QSlGuci0YssLtns=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(508600001)(70586007)(54906003)(83380400001)(70206006)(316002)(426003)(82310400003)(4326008)(110136005)(7696005)(44832011)(2616005)(5660300002)(186003)(36756003)(81166007)(356005)(6666004)(47076005)(86362001)(1076003)(8676002)(36860700001)(8936002)(2906002)(336012)(26005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4521
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	09e2341e-c755-40cc-640b-08d97e3fd528
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YhFj2w7HnknwFrSWixp24/IGxrJuy/fM8XHWkDJfWrUMVmKJRD+ZfjPq/kAi2SR/mwjEpZJHKjeIo4lNN/cWvhEz6jNbiRo3PxuBLJudhfzkI6Hqw3j6kk2kblCjD4Zx0T5a+wzDyBeoA4UqPkOFra5dbauhWkrDROwfMLFh625bBrZEegO6k5/PbNEWreGUJxiI4bomlLqqGeMoA2yK6iZdBB6PQnHwRbWLRMVJaURmjBZRDcosj4hHFVer/Ka3GKXMYiGhdHy315abftfYPgFv90NjsaGCxR13KcdDD5281Fdk5WV6pqVQOUzBCNfbu+DMYamWZH7ZwIiTv//SXoNlmV+Dj9l6IE075ICMkZ3NWuDDvhFBYeB0/Q4NVMmVG2jpW3dKvEAHYMjY1/NOTWsZta9fQAPhcbIN/LEyIyij0hHo70v4m1bWndkAi14D/G7Jq/ixgfxyo08tk54AEE57ZnZBfUf92b8aJYBKx1lyZXVM7iQ2Q9T7vJUsmyXMtRq3g15pbUEbNohe7KWGBi/T2siQF6c/92Q2hArVUHXgnF8hO4wGty3hWauH/CDM2ayhWzRNAKXDZpJWTXDiFruq06uncditSBIBLBMKIHqNYNlCZgvokrKpFR+aqRKEATBxpOwqQw2kiyrdhCCz0B2AB/7/v/d8G5hshV0RxFXucM0yEihmV42Vb9HJMoH62dLx+5xINjwstvsBbqaRVQ==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(44832011)(8676002)(81166007)(36860700001)(70586007)(186003)(8936002)(70206006)(82310400003)(5660300002)(86362001)(83380400001)(426003)(26005)(110136005)(7696005)(2616005)(47076005)(36756003)(6666004)(508600001)(54906003)(336012)(4326008)(1076003)(316002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 03:11:42.8989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7638033-1e47-4487-6928-08d97e3fde68
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6562

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

This commit introduces a new ARM-specific flag to specify that the
domain should be 1:1 directly mapped (guest physical addresses ==
physical addresses).

Also, add a direct_map flag under struct arch_domain and use it to
implement is_domain_direct_mapped.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
CC: andrew.cooper3@citrix.com
CC: jbeulich@suse.com
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
CC: Wei Liu <wl@xen.org>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
---
 xen/arch/arm/domain.c        | 1 +
 xen/arch/arm/domain_build.c  | 2 +-
 xen/include/asm-arm/domain.h | 9 +++++++--
 xen/include/xen/domain.h     | 4 ++++
 4 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 7922249d26..0b3cff8a40 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -696,6 +696,7 @@ int arch_domain_create(struct domain *d,
         return 0;
 
     ASSERT(config != NULL);
+    d->arch.direct_map = config->flags & XEN_DOMCTL_INTERNAL_directmap;
 
 #ifdef CONFIG_IOREQ_SERVER
     ioreq_domain_init(d);
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 8cc4c800e9..21d8a559af 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2753,7 +2753,7 @@ void __init create_dom0(void)
     struct domain *dom0;
     struct xen_domctl_createdomain dom0_cfg = {
         .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
-                 XEN_DOMCTL_INTERNAL_ispriv,
+                 XEN_DOMCTL_INTERNAL_ispriv | XEN_DOMCTL_INTERNAL_directmap,
         .max_evtchn_port = -1,
         .max_grant_frames = gnttab_dom0_frames(),
         .max_maptrack_frames = -1,
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index c9277b5c6d..a74ee5720c 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -29,8 +29,11 @@ enum domain_type {
 #define is_64bit_domain(d) (0)
 #endif
 
-/* The hardware domain has always its memory direct mapped. */
-#define is_domain_direct_mapped(d) is_hardware_domain(d)
+/*
+ * The hardware domain has always its memory direct mapped. And DOM0 shall
+ * be always been set as 1:1 direct-map domain.
+ */
+#define is_domain_direct_mapped(d) (d)->arch.direct_map
 
 struct vtimer {
     struct vcpu *v;
@@ -89,6 +92,8 @@ struct arch_domain
 #ifdef CONFIG_TEE
     void *tee;
 #endif
+
+    bool direct_map;
 }  __cacheline_aligned;
 
 struct arch_vcpu
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 7ed0b62b78..6c2b07eb42 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -32,6 +32,10 @@ void arch_get_domain_info(const struct domain *d,
 #define _XEN_DOMCTL_INTERNAL_ispriv         16
 #define XEN_DOMCTL_INTERNAL_ispriv          (1U<<_XEN_DOMCTL_INTERNAL_ispriv)
 
+/* This flag is ARM specific */
+#define _XEN_DOMCTL_INTERNAL_directmap      17
+#define XEN_DOMCTL_INTERNAL_directmap       (1U<<_XEN_DOMCTL_INTERNAL_directmap)
+
 /*
  * Arch-specifics.
  */
-- 
2.25.1



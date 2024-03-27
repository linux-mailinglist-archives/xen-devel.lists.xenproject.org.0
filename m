Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF3988F165
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 22:55:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698732.1090794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpbEo-00029R-8L; Wed, 27 Mar 2024 21:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698732.1090794; Wed, 27 Mar 2024 21:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpbEo-00026w-4z; Wed, 27 Mar 2024 21:55:14 +0000
Received: by outflank-mailman (input) for mailman id 698732;
 Wed, 27 Mar 2024 21:55:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWcJ=LB=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rpbEl-0001dR-Sy
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 21:55:11 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae74426e-ec84-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 22:55:11 +0100 (CET)
Received: from BN8PR07CA0030.namprd07.prod.outlook.com (2603:10b6:408:ac::43)
 by PH0PR12MB7791.namprd12.prod.outlook.com (2603:10b6:510:280::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 21:55:08 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:ac:cafe::88) by BN8PR07CA0030.outlook.office365.com
 (2603:10b6:408:ac::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 21:55:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 21:55:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 16:55:07 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 16:55:06 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 27 Mar 2024 16:55:06 -0500
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
X-Inumbo-ID: ae74426e-ec84-11ee-afe3-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFrIqIwHnw4I1Jzv5wnCufSzxVPZesBIyEengZO1opcNOZCSmIlcpm9Uk/1zTXlwwrmDY+K2kA4EOl2SaoEGmOW8Cytd6XKhIThVav2DYQ6vdnQLa2Uq+kerU8k8uWv4KjxH8RHCUjw//zcZL/qaj2D/1TpTABFpit28ZmBHdo3yEf0jiwGupeg23uRYR+Xm8xBeOIpHks3/2MymiUd9Nt0eKYd/Tv056Cif4XxR01QlNYrPRdMKK96hAtLIksyp1cTU2rnQidaJFrcH3LhaqWJRpwRe5vxnC+W9Vtxf48fGwp+BjTXyCEWP+FWKRFjJZ0PNB8FDiYlXvUg56iy2uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQPi9MnxIxYvNcw+aMSnS9BZzf8Q8kjV58jecRQgAtM=;
 b=F5YVg+HqXT3k+/iOOEqixe7IM1zw8/wy67AAzdDK5c/7oRWTXRl3+LfnqK86PRb6Xagg21oMGG/0A7+XoMhH4WjMSgPRx0u7/5eLZQ+CD7WKlZSZGLMt8PJxVIoD3rsbibQHtg00xYc8G7wDCvzSyX0VLF06WltKeKA2FV/5KzJWunCI8pgn8BaI7icMjhyDChI3UOpOnrQYYkSa0XtpZ3BjpJesEuBHqYg2h5NZ8LOAhbGrKuAeTp3qAwiknskYcaRZSQfkLZiv3ZhafBydMrGu4Ihpryla2UbieIIhpRRekfpMPHJ45o1879Z4hVwQkKtHiVcSQVPxzUrjgKGshA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQPi9MnxIxYvNcw+aMSnS9BZzf8Q8kjV58jecRQgAtM=;
 b=c0g7Xpa/ddR7UySF4vR/WTVzHo/5ZwcARZ0MEtPI1hTLCzJBDtuAPqSFicd1e6KHjiFW+meqZ57wBG60odKIjVXoMl9mi2k81UhmJaM8GVM1iDjvv97n8EqTn2bCUS6BcPgD0enuomaqRa1Sh2r+TVBEoxhuOj0qImnVLcqJmHs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>
Subject: [PATCH v6 2/4] tools: Move MB/GB() to common-macros.h
Date: Wed, 27 Mar 2024 17:51:00 -0400
Message-ID: <20240327215102.136001-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327215102.136001-1-jason.andryuk@amd.com>
References: <20240327215102.136001-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|PH0PR12MB7791:EE_
X-MS-Office365-Filtering-Correlation-Id: 1901e956-6295-45c7-4cfc-08dc4ea8912b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fVZm54szbFsZFEy+YWu/FNh5ByW1/E4WofAMqJ6e+ZtC3cocYazz/jqOtghItB9+BGorSGKPCbNpgwBVjFmXChZDjk+FXuplHrax2qO476ZX+3oCYd57qRg7xZ0uc8EHK1MtEfjK3IkOa5g9VxtJVNs6ybGDLR3E+kMG4I4bHC9pdkUIe9gIe316IId6NawTXUPRyppvwX/VqzW4Y+Jh2pwTtHB8OT4E5WDBH14Rt/lZLXwEADBeUwQGUdx8uNCB6vv8xUBtENsw5ZdN1orpN+l/e57NY6CsNYUsGJDSN7unxbaXEqzFarO+9HLNJO3nhhhezZolWQYjQi4fdY20mPRBSUANo0BYbetKZgjyDdruPPNqkb2s82Nq8IJPKjDrrQwlyBcIY7cT1nyooJOAWsC+mw9GmpKmr+O/UWuRyQytgLEkqULmigE68zaWrzklwzgl3gRAYykWkwxEo+FRa09e1PY6eivkthFD24foNBv9woArVBkzYXVQ0cWIl7nmm4cOLKAQUpXk38m9epPedYlNa1SbLnXPIcYZp9lIR1tWZJKmdqmpjS7jFVDHI59Km0p1v6j0u+V1UoZws+yEnFbhT5qeFiM8EPxc17nah/rVDSazcmrys828dmts80/gexumPRVpp25l+LTYURW+xzu29ZcPPSpxDlVVFHGxZd8eKo0jAw9eu4jsV/2ffSn3oVp28idrlUhPFAFX1Nk40rtoBms6zhSAmw3c+7sPDAW6HeDMogWG/CitkR0NBTLV
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 21:55:07.6305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1901e956-6295-45c7-4cfc-08dc4ea8912b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7791

Consolidate to a single set of common macros for tools.

MB() will gain another use in libelf, so this movement makes it
available.

Requested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v4:
New

v5:
Add Jan's R-b & Req-b
---
 tools/firmware/hvmloader/util.h         | 3 ---
 tools/helpers/init-xenstore-domain.c    | 1 -
 tools/include/xen-tools/common-macros.h | 4 ++++
 tools/libs/light/libxl_internal.h       | 4 ----
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
index 87be213dec..14078bde1e 100644
--- a/tools/firmware/hvmloader/util.h
+++ b/tools/firmware/hvmloader/util.h
@@ -38,9 +38,6 @@ void __bug(const char *file, int line) __attribute__((noreturn));
 #define BUG() __bug(__FILE__, __LINE__)
 #define BUG_ON(p) do { if (p) BUG(); } while (0)
 
-#define MB(mb) (mb##ULL << 20)
-#define GB(gb) (gb##ULL << 30)
-
 static inline int test_bit(unsigned int b, const void *p)
 {
     return !!(((const uint8_t *)p)[b>>3] & (1u<<(b&7)));
diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 5405842dfe..f38ba8d6b5 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -20,7 +20,6 @@
 #include "init-dom-json.h"
 
 #define LAPIC_BASE_ADDRESS  0xfee00000UL
-#define GB(x)               ((uint64_t)x << 30)
 
 static uint32_t domid = ~0;
 static char *kernel;
diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
index 81fba2e9f5..07aed92684 100644
--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -91,6 +91,10 @@
 #define __AC(X, Y)   (X ## Y)
 #define _AC(X, Y)    __AC(X, Y)
 
+/* Size macros. */
+#define MB(_mb)     (_AC(_mb, ULL) << 20)
+#define GB(_gb)     (_AC(_gb, ULL) << 30)
+
 #define get_unaligned_t(type, ptr) ({                               \
     const struct { type x; } __packed *ptr_ = (typeof(ptr_))(ptr);  \
     ptr_->x;                                                        \
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 094d0df9b1..803dbc1a03 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -126,10 +126,6 @@
 #define PVSHIM_BASENAME "xen-shim"
 #define PVSHIM_CMDLINE "pv-shim console=xen,pv"
 
-/* Size macros. */
-#define MB(_mb)     (_AC(_mb, ULL) << 20)
-#define GB(_gb)     (_AC(_gb, ULL) << 30)
-
 #define DIV_ROUNDUP(n, d) (((n) + (d) - 1) / (d))
 
 #define LIBXL__LOGGING_ENABLED
-- 
2.44.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC5E88B1E1
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 21:46:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697878.1089108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rorCF-0007qn-AJ; Mon, 25 Mar 2024 20:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697878.1089108; Mon, 25 Mar 2024 20:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rorCF-0007nl-6K; Mon, 25 Mar 2024 20:45:31 +0000
Received: by outflank-mailman (input) for mailman id 697878;
 Mon, 25 Mar 2024 20:45:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvT0=K7=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rorCD-0007L7-LC
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 20:45:29 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c3767aa-eae8-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 21:45:28 +0100 (CET)
Received: from MW4PR03CA0360.namprd03.prod.outlook.com (2603:10b6:303:dc::35)
 by IA1PR12MB6163.namprd12.prod.outlook.com (2603:10b6:208:3e9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 20:45:24 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:303:dc:cafe::e4) by MW4PR03CA0360.outlook.office365.com
 (2603:10b6:303:dc::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Mon, 25 Mar 2024 20:45:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Mon, 25 Mar 2024 20:45:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 25 Mar
 2024 15:45:23 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 25 Mar 2024 15:45:22 -0500
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
X-Inumbo-ID: 9c3767aa-eae8-11ee-afe3-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBBBzBlv2j3OYjZ8COtt3j43bwf03MgZCe9Z5R3DdlJxPNIDIUPgPTcBtKK/6TSAZTNqjlNyLdncsLa++3N6RwGOKiuSSPL6wcJLNzs7K2sbgVbUaFmT8UhOJTI7Slk+Jy9ZEysENsmeWI0p7PHZMMNxFUevaUwdYrXCYyddzdpS1QM4Ix5/C8p2doGAyYrOMfpCs+XzGSvatwOiyBq1DcxyWizEiVQvsbKAR7lyOCfD+YsogFdik/XTHjWPABZ3fHE+xUFbqvupiNaZtqbgkgZdOIevgmV+LUOkZTBJqddWOg4W8jd4tL3Nh8AxxPmpgXJsrCnB4FMzI3f6HaVzgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NWxzGLWg8rpT9SvmC6RSHVGPVmiDtkENizt4I3Gzge8=;
 b=BRrWN3d2bhmCNUeq6Auyi5EtjV3WNGOP0suuivF/vwpfBrKL9k2wXeRUOggoRgPnAKG4qwKMc+f2nvlMtH6O5LuBxQXsJ4hZFFqOmav85JHNrVEQPLLjQG7E/rj5gkaq45JRVc+g0aDeZD23z/gfJp9WBty8I2HyR3iufwUu2ifRxzOknLyOEVtgN0H2TipUwFh5Colq6I8a0Mw7LKzMsy8W9TmGfJgY54kNknoCAc7uPxdQttL5kD8YOViYryhT/98vA6midR5t3GlyOBsH8Im6EYm4NYiHpvtadZJNZnukPhC9vsjlvDxPad8XMZ+Dvcm9Yq98hwG8fR/fPlYHsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWxzGLWg8rpT9SvmC6RSHVGPVmiDtkENizt4I3Gzge8=;
 b=ghuyiCh0uS3ZdksSvCLq3U+CVORRt5T6EEHxHFub3UflXzXTjmqWWhRqSkqjaRhR5ARgzV3n+JFTxV1cV5VN2OI25bCmjJKRiE1Vfd4LNPRc//GeBQ+0Iur1inxk4bSrtQG/Ix+fqRz5Sq+Ndpm4nBdMf7UobELuQKghmgFVkBo=
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
Subject: [PATCH v4 3/5] tools: Move MB/GB() to common-macros.h
Date: Mon, 25 Mar 2024 16:45:13 -0400
Message-ID: <20240325204515.250203-4-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325204515.250203-1-jason.andryuk@amd.com>
References: <20240325204515.250203-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|IA1PR12MB6163:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f85f710-2bbe-4cdc-59ae-08dc4d0c7ef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yHULqzfyCbHZTqZTGlLgk3UeRaHEfqfRAnBAwyi59qApHIvz6+5iVoMT7UQI/Hbgb5MTBAEnCoB/EhT9xd7bv8of0RzEwloyXuESu8lI2n02ZjFF59lTdHmq4u/z543sBynLGNfJg6TqeOTW+HG36BOjrmuIlRMcggepLIGiktI5Pg58FNcHJXVXhWqiMc/ECQdR3dFNuPbwA4SumDPFoZXPoS7Pvq0500o85l7k8k3MO9kZEAoklNWRLePDo0VSVB4wvgcayygNflR5vGzKq7Afq1KsdhpSSEelJUPjZrtl3BvToZOU+3fqV8Alq/eI3gNJ4Pep9pf7DYsuNOHbT8TGYO2qOa62oqCjezSZnpWZ6TkI8omxtYQo1c3MUPKC2sqS6aqlh29l6DgHdlLPlrbcYkh9HgY+oICdRvmeQHOdODvLt/0aW9cJEa7LDMcmEMkQoKEB1jfRwLzkCq+ojD0obw/kI49pYDNOZEp4rbzYPtUFMtfsWotjpOrtrbVvYBAkYxPiJqT2ZegYP17fOmMyN+whR+wiKDmVI+9CWKLitfdStb6UtRJTS7Z1rMA9qwTkawnqw0rrocbWx5TT29DUUWm9FM5sl5JC606Clc351TmrMpuO5taM9xDLi/n/dGVN6Vo1I7N/TIQ5NoO+ZU6BsU3psjHd1FHgYWCzFzeleVf6kMdkBXNDcKHMZnLUUpYc105JEW+RlzAq6o794owjs/V4Mc5WO60OjKivwVPkITEpcWqu4doVT96R9VQH
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 20:45:24.2676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f85f710-2bbe-4cdc-59ae-08dc4d0c7ef0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6163

Consolidate to a single set of common macros for tools.

MB() will gain another use in libelf, so this movement makes it
available.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v4:
New
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



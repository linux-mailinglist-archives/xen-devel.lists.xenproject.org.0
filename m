Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E169888D035
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 22:39:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698212.1089709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpEVh-0006eJ-1d; Tue, 26 Mar 2024 21:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698212.1089709; Tue, 26 Mar 2024 21:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpEVg-0006XR-U6; Tue, 26 Mar 2024 21:39:08 +0000
Received: by outflank-mailman (input) for mailman id 698212;
 Tue, 26 Mar 2024 21:39:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qfY0=LA=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rpEVe-0005qH-G8
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 21:39:06 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 439217fb-ebb9-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 22:39:04 +0100 (CET)
Received: from SJ0PR03CA0024.namprd03.prod.outlook.com (2603:10b6:a03:33a::29)
 by CH2PR12MB4311.namprd12.prod.outlook.com (2603:10b6:610:a8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 26 Mar
 2024 21:39:00 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::47) by SJ0PR03CA0024.outlook.office365.com
 (2603:10b6:a03:33a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Tue, 26 Mar 2024 21:39:00 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Tue, 26 Mar 2024 21:39:00 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 26 Mar
 2024 16:38:58 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 26 Mar 2024 16:38:58 -0500
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
X-Inumbo-ID: 439217fb-ebb9-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/aUWTxxnB+4ADVXpIXQhAlyWQDDi4wtL8QXqIDF8pwuKEGwTOaN2U2q4UAWgGi+cvFvLcEtrSNH4ouJiZ6KMghTknMUo4Ze2y0GdiPDBFuikwXh6e7QEoR6iulDpy+jEDrHAY2JKvSFNZ9gitjoEKIM7AH+Y4a8ttIv9vCod61piz0ZMkN9jF6ZyKqnFustXBWVFfIP3wnV2hvr1KI9yHMpB6+3eP3+hNvzqxbieQq+szW+9tmEQux4KGIzSFyaWl1OgUO6kVuTegHqbKdtEgGd1Fd5Cdx384AbEQO+83WsC2D/ekkCEezcB9Vhg27g4V5FYn1Y5HHceqsYcUkZrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQPi9MnxIxYvNcw+aMSnS9BZzf8Q8kjV58jecRQgAtM=;
 b=mMb9gnMVKCrlD2zrXMBwuW5D1fOxk45Yk/xVmVJDjxisS8dq0WlRxUP/5jfyF2lwskskoPlIe93bVIDRSLXZEanEOqmMtEqj/R5f+iF/vDKI4dmQPt3pQizTdL1UutWolWQWlmC+dOwP0RcG3UrjstVeVW4d9NwrhupKTzNDi7xwQ4REWiYgqxXL+njee0ZmGqt1iKEKTjymQRw7qfUB/x1zhep/XRfKzcrdE8Emvv1keaIDLGIQ6UUn6IQvAgopWcjZVN5JVk4wL0AWekQgrXtwbxtOrJVX56txr1p7OkPF2MB4aHyCEFVriQlifUUchap48ADAUlCxnG08jUdRPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQPi9MnxIxYvNcw+aMSnS9BZzf8Q8kjV58jecRQgAtM=;
 b=ra1ACj2y/OKG+FBW7Op5nZew7G4bZFeh3BoL8xN+BNSLfVCWd3uvSm2Jy9qH0Yt5pH9Oa0mwh4PV20m1OTFkxjFQT653YkQwjUdrWOresDLyooY/u1NJ5O2ahxKIU4NPBiXNlEE3DVcSyMletC3W2Ilzdu5HBUceP8oJ+eNMAy4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>
Subject: [PATCH v5 3/6] tools: Move MB/GB() to common-macros.h
Date: Tue, 26 Mar 2024 17:38:44 -0400
Message-ID: <20240326213847.3944-4-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240326213847.3944-1-jason.andryuk@amd.com>
References: <20240326213847.3944-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|CH2PR12MB4311:EE_
X-MS-Office365-Filtering-Correlation-Id: 45580c16-8562-4a35-2c2e-08dc4ddd2641
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b2sMrpm8SgUg2h8oMvx7/yxjFe+H1fuXfBLhmSZzST9EcIYwajvyDmDXknr4jMCuWlLsjIe3w1N92gxDEUT4rWNGAUtGLjwuq1ff4Mt/iouXdTIEOkk2jgl7pmBZtWTaBIKI0Mh8uAPnS7C6mNEnE7ByDZzN/0pnsf/Br06zTdG2BeZO2Ku1N/+WRhrEDSc8vWmeT5hSGkZPg2gs1BzXNTWr00MWhfCBRLw8FwmQX+YTKn2+lF3z4eY7e3/JxpMHQQO+L4g7Sj77bnLp5UqFJpdNaO5ZWXGRalTv3NkLmDZzV3nNh5URIEjCwaZxJ+knZczBip8q31fxHjtKt4VnQ8DgPANSNJ6WKObnqU7GLwVVS/PnKN0fiMok7V0a+VC7eDCC3AzVDtEVgq4MckLSs9Sy4o8nhDW4oNozq+Hns4h5pFs6DiKK6636OoxnWmBEcmQLX2181wIbjXjKqdEhMkg+gkSr6tQqW3bdU2Jmn/2EgjvesB85umugxTJkvsYTefpPdkFbR/rf53KBkmp6utVi1nOItDsCz0QsbRUsI1UwV1xNq4mkuJn0hITpGMx5T38UEgEgkmZhIpT46c5tJ86Wdu9zspAKKvcgGzCacxDPQWIMh2rHzUsvQta7dLIdKWGpuI7UYi1Lw/xZk4dmv1jGvQ38kpfugvWFh8r3fEzS7cHbljwj49XkK55nKwiQ+tUKxkR3U4Pmaoj3TjKJbVhw1G2mSGknh4L5J+g5LpsycDAGGhLCtISQdb9Vff5l
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 21:39:00.2340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45580c16-8562-4a35-2c2e-08dc4ddd2641
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4311

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



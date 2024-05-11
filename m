Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 784F38C2E4C
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 02:57:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720146.1123235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5b2P-0008Br-Ga; Sat, 11 May 2024 00:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720146.1123235; Sat, 11 May 2024 00:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5b2P-00086q-D7; Sat, 11 May 2024 00:56:33 +0000
Received: by outflank-mailman (input) for mailman id 720146;
 Sat, 11 May 2024 00:56:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0W/u=MO=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s5b2N-0007p5-CT
 for xen-devel@lists.xenproject.org; Sat, 11 May 2024 00:56:31 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cb18fb0-0f31-11ef-909d-e314d9c70b13;
 Sat, 11 May 2024 02:56:29 +0200 (CEST)
Received: from PH8PR07CA0047.namprd07.prod.outlook.com (2603:10b6:510:2cf::10)
 by DM6PR12MB4218.namprd12.prod.outlook.com (2603:10b6:5:21b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.54; Sat, 11 May
 2024 00:56:22 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:510:2cf:cafe::cb) by PH8PR07CA0047.outlook.office365.com
 (2603:10b6:510:2cf::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.54 via Frontend
 Transport; Sat, 11 May 2024 00:56:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Sat, 11 May 2024 00:56:20 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 19:56:19 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 19:56:19 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 10 May 2024 19:56:16 -0500
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
X-Inumbo-ID: 4cb18fb0-0f31-11ef-909d-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=To37Un+0ohRQslENSwZeF92zxH4tKGvRGUqkAK7QMpuiaE3ww8wTNQdl6gAYuUGNoRrHyvaRF9eaoigbFEes0iKz7VKzje1ujcd/ZGhQ/E33K3+2ZtUdignTBE2BlObDZ/8j1u0gn5fGCPg7hzPoj9RuRdjHfgwlj9h8zxXtrGEvOS6DDfXOGOTXk0DKY1bQnVWrReUKHKeTTJSQhjVgLyzl0F8M/A5D2Lz4arRsuWSwg/P41tdKayL4zBnd0e4/vN+G97p40aX6ai2bWw9H9VXoua8vIS3wiGWq+q98vvs77OU/X4sVLKQtdzVvPjIH75Z2ejmp9eu84Fq+5BLrZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lk6GKSsCklZm9WOlSrI/19kZkT/LFQhP7ioFjW6GXdg=;
 b=ho15/4FRrUErZvFa9XSuYtv8qMWNnIgRZea+0B6lWGNZCm4AEOxAVez8He5LpGhOmCe/H6OCvY4e+I2w4noUA+8PQzN5SMQcue2/fxOtx6bH08jaH/tChSqNVd9xBAJdOKkvyr3cCbQtlonGgoqI+3n0REhc7JODKw6lL48MuCv7is/f9vkO/vRhhA91MCW8SK9hU6dFuwiFDR/qfWHPl6kHW5YWit7y8YpULPFua04sNnsPeAx6vFpKN5uRFUlit9FsOD5/4kKbXVBzAvwXJ5jZf7IAvPOiTj0vjjDoOzq9lbVRRKgMtPJhuVi4lNLaNrTcfxvC0Jq1IzL9nQuaHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lk6GKSsCklZm9WOlSrI/19kZkT/LFQhP7ioFjW6GXdg=;
 b=qOt+r6YCYQKvqUsUzxef8ks0l12kYD4YzyMIDC2fMTcmn+umm3BUXrHppPcelQdDW81/o0crCaRHaFvfmPLDQHhu8VHWc/AkAOM9fOemuktnujdw18zqcBQp4nftz8aKntowp7VkjXmAWamf7INQjFhn5BKJ1qwB/p1g4p1rnK8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Alec Kwapis <alec.kwapis@medtronic.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 1/4] xen/arm: Alloc hypervisor reserved pages as magic pages for Dom0less DomUs
Date: Sat, 11 May 2024 08:56:08 +0800
Message-ID: <20240511005611.83125-2-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240511005611.83125-1-xin.wang2@amd.com>
References: <20240511005611.83125-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|DM6PR12MB4218:EE_
X-MS-Office365-Filtering-Correlation-Id: 10690689-d50c-4993-d9fb-08dc71552bfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|82310400017|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2fTIgIGKbmc+axpa+4GH5Zzw4dlsjAIBeaxogAJgMC3vgjw3xXEuLG1n7fqt?=
 =?us-ascii?Q?LYPDA+5RnKsKTtD8RQOQdydaTCyCpDLwFBmbVKNKwkd9gaYeVyH0pilXBuyi?=
 =?us-ascii?Q?NFPkXtdbk6N0uWnNaax4MElZa5tZfcdnvK9geWlOf2iNuz0WWyAK7uUbADYu?=
 =?us-ascii?Q?EAxnzTZTO8X3NwAw1WKnD3/cdzYAqsXhIpFTgDEtjNEd7WNXQFfqT35enNtG?=
 =?us-ascii?Q?dgDYQpKUjO9VkHYcZ13lvggRhD0TV0DzevrQ8U2aQbhL8mFMMCeCCPJuyDgF?=
 =?us-ascii?Q?TbLO/Wwy7K7hj9MG/v81q49VHVKI1texQOdhBzYWvSpguyGrZORyIeH/TvxB?=
 =?us-ascii?Q?HFTozrZFgfumV1Bu52d9H236rZPy7StC38KSLOZavxJ0F5b9wQWrqSza6EWp?=
 =?us-ascii?Q?bYXbY9tsUYSBw9KJvss6ER+FN8xh2ZHi3S3b6VHiUHIfhrklR7IkL61l32dk?=
 =?us-ascii?Q?iJDRJadLnKTDDhNS7pzT/yqDHWu/NCCpeERS9DAr2T8igho440qrrsePmM4S?=
 =?us-ascii?Q?BLwwwUPyFP2UuL62kzahUkqxEye87KK7KOBc+L7wLM4LIDRfCkhVzHqb0JEQ?=
 =?us-ascii?Q?RUNjSDDecgNVoNiMwhSKU+09AAFeBx/YO8eEi1ReGuRou+olqK5YfV6UhbmK?=
 =?us-ascii?Q?DnFSzY4kF17/S/eUjtsZUjxgh7Fj4e4GccURuifpvcGZsYvF+4T4tOVcTx+x?=
 =?us-ascii?Q?QuIBltcPySl4kOs+XfYfdF/mwGUuntpK27h5RWt8Fx58HjDaCKC+LvMRcFPl?=
 =?us-ascii?Q?7bIA1HMNDvifXZOXEsXLnWrMNi3YAr3SSQbc3Xg1ss4LwDElg8BmPpaE8TCz?=
 =?us-ascii?Q?L6XvZzswrsjgUm3RBWFt5hKLS4N+Hyhx46eqIiYeTabtOK50dIwGXCTEdmpQ?=
 =?us-ascii?Q?SW810yJO77RvowIAdAtcaC5QZpVMjlIkoS8Ng4F7jWnFAlsxIQqaqzKFcjl9?=
 =?us-ascii?Q?hMDYnGHamHK7w/qG/HLrN12Wo49lBh8gWj4tLsGMn3YPM/ybT2XGkWhgpcMv?=
 =?us-ascii?Q?sIgme9AYghW87YBLxAYjDHs9mHoIILBIrKPBe6WouqtJp4oBov7WMtGAXCwd?=
 =?us-ascii?Q?7zcSjilQTul0UKQu7gHXBnSyC6CRqKjTzYvmJy3WU7fHzUGDy6uBZsLxSVTm?=
 =?us-ascii?Q?ufJ55aW+fRCdChfhCZQdf5hL6KtV1MCeKBAAce2UCnK9H/8vLcCdmRpzrEW3?=
 =?us-ascii?Q?W/GhBKUe0A8NZygCnKDO2pMyviDPYGnvVfUt2o5aXPtnENUHtwAKgp7VXqRr?=
 =?us-ascii?Q?o/UjSgqPJhm56No8joZ12S0E5SBN7Yv/Fllcl48Q0z5xcE2z46SfgZkFc2eh?=
 =?us-ascii?Q?XectRlpo2mUzEH7+z4nBRApbnhPtEmWsUByBNubAC7gmhm570OtqI06MNp0h?=
 =?us-ascii?Q?WPfSCXszj1mdGKMx01mA/Zj2yEcC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400017)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 00:56:20.2980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10690689-d50c-4993-d9fb-08dc71552bfc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4218

There are use cases (for example using the PV driver) in Dom0less
setup that require Dom0less DomUs start immediately with Dom0, but
initialize XenStore later after Dom0's successful boot and call to
the init-dom0less application.

An error message can seen from the init-dom0less application on
1:1 direct-mapped domains:
```
Allocating magic pages
memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
Error on alloc magic pages
```

The "magic page" is a terminology used in the toolstack as reserved
pages for the VM to have access to virtual platform capabilities.
Currently the magic pages for Dom0less DomUs are populated by the
init-dom0less app through populate_physmap(), and populate_physmap()
automatically assumes gfn == mfn for 1:1 direct mapped domains. This
cannot be true for the magic pages that are allocated later from the
init-dom0less application executed in Dom0. For domain using statically
allocated memory but not 1:1 direct-mapped, similar error "failed to
retrieve a reserved page" can be seen as the reserved memory list is
empty at that time.

To solve above issue, this commit allocates hypervisor reserved pages
(currently used as the magic pages) for Arm Dom0less DomUs at the
domain construction time. The base address/PFN of the region will be
noted and communicated to the init-dom0less application in Dom0.

Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
Suggested-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v2:
- Reword the commit msg to explain what is "magic page" and use generic
  terminology "hypervisor reserved pages" in commit msg. (Daniel)
- Also move the offset definition of magic pages. (Michal)
- Extract the magic page allocation logic to a function. (Michal)
---
 tools/libs/guest/xg_dom_arm.c |  6 ------
 xen/arch/arm/dom0less-build.c | 32 ++++++++++++++++++++++++++++++++
 xen/include/public/arch-arm.h |  6 ++++++
 3 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
index 2fd8ee7ad4..8c579d7576 100644
--- a/tools/libs/guest/xg_dom_arm.c
+++ b/tools/libs/guest/xg_dom_arm.c
@@ -25,12 +25,6 @@
 
 #include "xg_private.h"
 
-#define NR_MAGIC_PAGES 4
-#define CONSOLE_PFN_OFFSET 0
-#define XENSTORE_PFN_OFFSET 1
-#define MEMACCESS_PFN_OFFSET 2
-#define VUART_PFN_OFFSET 3
-
 #define LPAE_SHIFT 9
 
 #define PFN_4K_SHIFT  (0)
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 74f053c242..4b96ddd9ce 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -739,6 +739,34 @@ static int __init alloc_xenstore_evtchn(struct domain *d)
     return 0;
 }
 
+static int __init alloc_magic_pages(struct domain *d)
+{
+    struct page_info *magic_pg;
+    mfn_t mfn;
+    gfn_t gfn;
+    int rc;
+
+    d->max_pages += NR_MAGIC_PAGES;
+    magic_pg = alloc_domheap_pages(d, get_order_from_pages(NR_MAGIC_PAGES), 0);
+    if ( magic_pg == NULL )
+        return -ENOMEM;
+
+    mfn = page_to_mfn(magic_pg);
+    if ( !is_domain_direct_mapped(d) )
+        gfn = gaddr_to_gfn(GUEST_MAGIC_BASE);
+    else
+        gfn = gaddr_to_gfn(mfn_to_maddr(mfn));
+
+    rc = guest_physmap_add_pages(d, gfn, mfn, NR_MAGIC_PAGES);
+    if ( rc )
+    {
+        free_domheap_pages(magic_pg, get_order_from_pages(NR_MAGIC_PAGES));
+        return rc;
+    }
+
+    return 0;
+}
+
 static int __init construct_domU(struct domain *d,
                                  const struct dt_device_node *node)
 {
@@ -840,6 +868,10 @@ static int __init construct_domU(struct domain *d,
         if ( rc < 0 )
             return rc;
         d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
+
+        rc = alloc_magic_pages(d);
+        if ( rc < 0 )
+            return rc;
     }
 
     return rc;
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 289af81bd6..186520d01f 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -476,6 +476,12 @@ typedef uint64_t xen_callback_t;
 #define GUEST_MAGIC_BASE  xen_mk_ullong(0x39000000)
 #define GUEST_MAGIC_SIZE  xen_mk_ullong(0x01000000)
 
+#define NR_MAGIC_PAGES 4
+#define CONSOLE_PFN_OFFSET 0
+#define XENSTORE_PFN_OFFSET 1
+#define MEMACCESS_PFN_OFFSET 2
+#define VUART_PFN_OFFSET 3
+
 #define GUEST_RAM_BANKS   2
 
 /*
-- 
2.34.1



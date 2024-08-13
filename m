Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04427950B48
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 19:14:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776504.1186671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdv6c-0000Nb-9c; Tue, 13 Aug 2024 17:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776504.1186671; Tue, 13 Aug 2024 17:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdv6c-0000Ld-5v; Tue, 13 Aug 2024 17:14:46 +0000
Received: by outflank-mailman (input) for mailman id 776504;
 Tue, 13 Aug 2024 17:14:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rcsl=PM=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sdv6b-0007JM-3g
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 17:14:45 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87d21fa2-5997-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 19:14:44 +0200 (CEST)
Received: from MN2PR22CA0017.namprd22.prod.outlook.com (2603:10b6:208:238::22)
 by IA1PR12MB6162.namprd12.prod.outlook.com (2603:10b6:208:3ea::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 17:14:38 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:208:238:cafe::7d) by MN2PR22CA0017.outlook.office365.com
 (2603:10b6:208:238::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend
 Transport; Tue, 13 Aug 2024 17:14:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Tue, 13 Aug 2024 17:14:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 Aug
 2024 12:14:38 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 13 Aug 2024 12:14:37 -0500
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
X-Inumbo-ID: 87d21fa2-5997-11ef-a505-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSySvNV3VQ66/7hxddt4h+Q/o+jwuZhNjZzSqfXh2Eskf4RlDf7eB3d0TVIokVUOPtxV9TtSvdigmDe1xA6NM2WWvyxdzcbdi1g1abbItB+dtvuFD1wIs3OuC6JfKq8HAbBrQ6C8VsmbTELAXlG2JUgHzeFjn7EknNnDx6OF2+8fNpLtv2tWdQVcyvXpsBFDbWf3m0OpJPdOErwqZrieYeQ+69OxtQFnlKMU4KW9DIOYS1nVExuT5t+2aDgUUirbjdITNT9j5uK+GgdEQEe7db1nXFkegELnIgTjY+FOQmy5eLPdieOUYkUVqmjI7IUWYfmchdhlCjcsQjju6b2qKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iv/mcdKWSyDFQyeXlKdWpa5s6Ph01vN5ht4yXXGmCFM=;
 b=vEXvWDv9ncWLuhLLbDt3bCQ+ypu8E9gGOpiTMfHT1CjtJ2Fxwe9H3D9rV+n7zaHN5ODcHfagtD3FETW9gwXACWOE4Ws+y8FKy8mmXm/IEW3L3nJCW8Q9XrkFh9kk0OcGGx8oe0TZBCsYZXtcbbNhobhQGq3qGRLyYhO40zQ6f+uFMzq9SOKdytseyt7A0SF+2NYXj4/xRt4mfGKmWkdFK1aGOfbG//gJPM4oQ1UjoMC4ZaH26ELEvQ1YGU5ubUFlPdUR6xM0riqZA0csnjV/+vHqe93uU3PwrbzgT2rabbGbSagOOHfuVXzsOBpmZ5YxpnUlCnyxzjprnqFmRSqXag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iv/mcdKWSyDFQyeXlKdWpa5s6Ph01vN5ht4yXXGmCFM=;
 b=KIizFa56O55nH0yBVEK0TfUAY5I9CPc/zXI/hDJzVGfGvcw0VpgerGsRvD4Nm9dAKi0ikhC4+v2Vaamz9ye5gmkwcQLrInvPrMOlaR4dao9t96wJDNURV6FCDjM0TXl7J58sOOV3DdomeiEiRSGA5tnvPlQFg53QdbpEVo8x0KU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <ayan.kumar.halder@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <julien@xen.org>, <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>
Subject: [PATCH v3 3/4] xen: arm: Move the functions of domain_page to MMU specific
Date: Tue, 13 Aug 2024 18:13:55 +0100
Message-ID: <20240813171356.46760-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
References: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|IA1PR12MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: d887ab63-09d0-49a0-b601-08dcbbbb69ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fWQ8ovHk+DDNxOWEUV6oCXVGSEaDnYfiQnsTEdnJmaTBZ4lriwbz9eLzYzdl?=
 =?us-ascii?Q?TPKHrt1QpiDPlBbqw6KRih2Fk6LU7A182Jt64uH8306v4ATVcFg3mM5Uu1K2?=
 =?us-ascii?Q?wK63mYLuo9zOTA5R8wP0k0EQLOnMmHdyAK4h+TktFnwKOUTw/lr7kIl2Umhe?=
 =?us-ascii?Q?MFY/E+isr2+12sRvkWAzwl9D7jkONNEmLBvfIHx4kZlmQqiegeWGrXn6xkGr?=
 =?us-ascii?Q?cNFbBot/jLg4f+j6E9k+WLA5y69P2SY47tTSE+av9228tQUv6z+VBDpbhgSA?=
 =?us-ascii?Q?atHaFtM06vbtE+/eTTi11QnVeSV4A9ORnV88FjiRxJiZfWMVf+40wFC5TzCQ?=
 =?us-ascii?Q?CkLznhwE1RkLlc5BdIptNIZCaKEtYDUgRgSYTBuInfrF1krenIPTIwVEGRvE?=
 =?us-ascii?Q?mGHbkqIUFZGbBENCNMxNd4GPpU6t3ACjKcVzP2WKXyfGzxg8J5RWlC7pLQEy?=
 =?us-ascii?Q?4Ye0pLdF83xxMPlwHXlMaGEka2lzNM7k7yFJZ+LtINK6khl4hnfwDD8fqxyb?=
 =?us-ascii?Q?5XssYZJAD27yINgRyL/m5seCcaj1C39J5zPJNZV+KCIC5lXhnfcUZ49ITCge?=
 =?us-ascii?Q?1VX9+acmpqUZXFlN/ljWcSJBHHFFqqGzr5rRKbZcLREolm/+XOfADlKvoOdP?=
 =?us-ascii?Q?o/SYJj//l6XwuEJnyfcrUD4uHKe1axgR/DPh/BdnSEJ4/u0r1b4A715waKHR?=
 =?us-ascii?Q?Qx24Y9kwdJGQSBrjE+aehJJlt7VSXCsWzvInOx82ZlODyQsLRN8kK/PV9vg4?=
 =?us-ascii?Q?ZEvMBGjlQwSrXAkAJ+SOXa8fLzD37BxreU15SUKm1R85o7KqPJ8aIq7Ph4Nk?=
 =?us-ascii?Q?BAO9Wk9HN56tHrvFM+doZmoDkXHGqOR04Wj3qkkV9VMnjuQ/pfYajhVghZE3?=
 =?us-ascii?Q?M6XgFHxEEe/mz5zcNIb+pQKKQgrAeN6AKMueNjw0Tlk/q7thA7vXv3jdKcat?=
 =?us-ascii?Q?5TuhVNifhFknjE6YR85d0kl/4CH1H0o0J/PeCsFH4TglCRdNVLIuWzKzU+mQ?=
 =?us-ascii?Q?zXbcftufrZYsau/VsmLEbICfyTvvOrzEtabF/cvwhPd5Wj8ajBNPXUJ/KPNs?=
 =?us-ascii?Q?7CZEhMVMj1pxoN0Hey8SBWrutzhQzqJ8X8r60WmPRjZe96im1JYim1wlKnpR?=
 =?us-ascii?Q?orLFw0i0fe3Jvll4/4kUjbYVJ5e4pegUvtPY85o/SBmAlymVwP3fT6HwcvOq?=
 =?us-ascii?Q?bzMIqPWIFfu8KMiSQrgj7CNsDJ3n+jUMxAl5kODqJs2iloM4v9rErRdxCdKx?=
 =?us-ascii?Q?AkY79gqKG72In/iP7BaOB7QNkLJX7V0Yq4rlSKA8Psu+zWMFsSuKy2zALC4z?=
 =?us-ascii?Q?HLB5nAzUXcoB/QDdt1KnceJ/L/0iBSsAXScJnb4ngQWDFouNy9KYVoaxitrx?=
 =?us-ascii?Q?HPISerzqC02r1FM+5xPXOPGjL/y9xcfFhY+XCvJP9TqtRyA+yXlTFXX/M8iZ?=
 =?us-ascii?Q?WHGNye5Tgb+D12AE82hR5/Da0krSaZDd?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 17:14:38.7313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d887ab63-09d0-49a0-b601-08dcbbbb69ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6162

Moved init_domheap_mappings(), map_domain_page_global(),
unmap_domain_page_global(), map_domain_page(), unmap_domain_page(),
domain_page_map_to_mfn() to MMU specific folder.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1 - Moved domain_page.c to mmu/domain_page.c.

v2 - Updated arm/Makefile.

 xen/arch/arm/Makefile                | 1 -
 xen/arch/arm/mmu/Makefile            | 1 +
 xen/arch/arm/{ => mmu}/domain_page.c | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename xen/arch/arm/{ => mmu}/domain_page.c (100%)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index da9c979dc4..7792bff597 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -18,7 +18,6 @@ obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
 obj-y += domain.o
 obj-y += domain_build.init.o
-obj-$(CONFIG_ARCH_MAP_DOMAIN_PAGE) += domain_page.o
 obj-y += domctl.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += efi/
diff --git a/xen/arch/arm/mmu/Makefile b/xen/arch/arm/mmu/Makefile
index 67475fcd80..2cb44b857d 100644
--- a/xen/arch/arm/mmu/Makefile
+++ b/xen/arch/arm/mmu/Makefile
@@ -2,3 +2,4 @@ obj-y += p2m.o
 obj-y += pt.o
 obj-y += setup.o
 obj-y += smpboot.o
+obj-$(CONFIG_ARCH_MAP_DOMAIN_PAGE) += domain_page.o
diff --git a/xen/arch/arm/domain_page.c b/xen/arch/arm/mmu/domain_page.c
similarity index 100%
rename from xen/arch/arm/domain_page.c
rename to xen/arch/arm/mmu/domain_page.c
-- 
2.25.1



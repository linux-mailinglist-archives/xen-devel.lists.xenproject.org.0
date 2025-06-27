Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B60AEB186
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 10:44:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027411.1402065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV4gX-0001qR-MP; Fri, 27 Jun 2025 08:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027411.1402065; Fri, 27 Jun 2025 08:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV4gX-0001p0-JO; Fri, 27 Jun 2025 08:43:49 +0000
Received: by outflank-mailman (input) for mailman id 1027411;
 Fri, 27 Jun 2025 08:43:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiom=ZK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uV4gW-0001ou-Co
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 08:43:48 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2009::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6e9f951-5332-11f0-a30f-13f23c93f187;
 Fri, 27 Jun 2025 10:43:46 +0200 (CEST)
Received: from SA0PR11CA0074.namprd11.prod.outlook.com (2603:10b6:806:d2::19)
 by SN7PR12MB7131.namprd12.prod.outlook.com (2603:10b6:806:2a3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Fri, 27 Jun
 2025 08:43:40 +0000
Received: from SA2PEPF00003AE9.namprd02.prod.outlook.com
 (2603:10b6:806:d2:cafe::d1) by SA0PR11CA0074.outlook.office365.com
 (2603:10b6:806:d2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.21 via Frontend Transport; Fri,
 27 Jun 2025 08:43:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE9.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Fri, 27 Jun 2025 08:43:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Jun
 2025 03:43:37 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 27 Jun 2025 03:43:36 -0500
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
X-Inumbo-ID: d6e9f951-5332-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hU2b6NNXLcwKbaDHf/jdMFm/MjGzQ49yQNJ8oDILkIqee8ZwmXUUf4Fr0I5OqWX1Ma31lII8mIf7XnyLwyfIpJy5TBS+nkgl5nbFJ0yt8aKzmtBl6uiD1NHh/RPWBOsKVbje3icf8g0yBmMA9+iQXwbKrYnId4BOrvk1Yj0rbIw+C5Zjl+DmDMujQeMfN1vjWEom3tQVEvgmazWQqUB0cNCdl0eT4z1mXwtTdxuT/dd4leK1Jvazlc9hFlOB9FrfFbOuGazCsjWcVrbNuG81j2ZrZyngch+1MgnRmACtgeRthQ+FvYMxT7XrL7JcyOcnXZyHOeXDJhF4K/oRYHOaQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvzwjcgI+OoKbZkotdZvDHqSs82Pxp1+1cTFe6ddl2E=;
 b=D7SHMn6WF5bnZFlx4RzzFM7NV2ZOT7+vCIZvM723rqJ8UvVUuyd7rsqFuebWDdytO4FciSXgDrAvBiv+o4ocBHCzlbI72eXrASjm3h5P4ikqoIhZsc09B7daci9Zn5J6HiFX8eYlm2iWPBheACW6oSircYgyXfYUFIbOG2uW/hReJmY+7zSK970oSe81ojYZmmBoiU32fXGpGF8gzDoe9j96jQ6UobVVixGD2Zi5ZmgBm80XueQlqX2NKbUZFXnBAMpdCjjswdy0h5ERyF6I78zSzkxKwNAAYXKo4dwwtqevdi4tUExXRrYKpdedD6Oli4OVf+/HK79B1M/RPp15GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvzwjcgI+OoKbZkotdZvDHqSs82Pxp1+1cTFe6ddl2E=;
 b=ak+FnKhGNsJHE6Ik4yfnRXPecCAvFNG6lZf+dI+sSDpQYDoZeYneRguTgvEHuIl3WLlhTtZ+GvJHbHYfgQA/9UPX0MrpUAcLsjB39dAfw9m76n3qGgVWTR+jLY2oj7H6prG4qNdjsuVC+N+GmPKCe2Cq5qqrrqZHFefdl3Wbdp4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Drop frametable_virt_end
Date: Fri, 27 Jun 2025 10:43:34 +0200
Message-ID: <20250627084334.45172-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE9:EE_|SN7PR12MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dcd90b8-b454-4b54-d2f7-08ddb556b74c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kO3wakRhwOojEnXAdMNdegWRAZmtIzjy2schbZrbkmXwqJfcEcIlKKTZb32y?=
 =?us-ascii?Q?j94GwOycapLPIZDvZaybH3H0fxLN3p2ryFzNWZVYwBsabPYE/EzHuepmKkOu?=
 =?us-ascii?Q?qWrbOUgRl6vWsp6FeQyZwArtM4MYZFu5pG+iGP6uWh4X6grWgd/WgFIYVZcF?=
 =?us-ascii?Q?ME5r/sPh0G78B81kHRa3p4OfpDYZaaC/emGJKjoThlTl9dXF8akGfHN+qiX4?=
 =?us-ascii?Q?I7qyu+Qb6krJrw8hA2ss/q9YBmroGoKD040tncuEaW8qEO/kBMPDI2zxsC3p?=
 =?us-ascii?Q?9AiPuHP++HrEFgJganV5IqCRgOpzl/qAWL37BDFzPuAXxb9phzguxQDXz3yT?=
 =?us-ascii?Q?+efaZbJoFSY9QSA9mHh3YCyQjLJfpgbBOdzjbAtL8dnzTxvflcr6z/fwf5Fe?=
 =?us-ascii?Q?SS0/9olPQygJcG8W3BE6DaR3EG4DHQYCtqLOKgPeUac1v3M4B/nh0gWqKXup?=
 =?us-ascii?Q?uwTael21ygD2cJsdbDpA4iGI0Uqg+3BdK7JYSYVJ+G8mnzzyeHJ5tmSo3z4d?=
 =?us-ascii?Q?0wzcftQD4QlS5Jm8nfbcdlncyjSqS69puLFsYRbiRV4h5+10aKBQx+Qwpx52?=
 =?us-ascii?Q?oSgN1vjucHOwXf/GiOTpVwftvWIf02YozDwcJBVy1Fr/856ygX5PrIHlH9oh?=
 =?us-ascii?Q?wGWvA6U1lkA6px9H1+LsbxZlHzsLhCoa6b/xR6a5eTx0O+4gzXwEcWnfBpFM?=
 =?us-ascii?Q?Dbnr9afMK6TFPNdO0c+hPjPWTARZMJY/pjqXNO6iEYewT7tAaeI9S5NAoFHy?=
 =?us-ascii?Q?Br8c2Dn+n775Zd5iSQi7meDky0YP2YxOckIYmXOKMocwwNZmqBMTlwnrPVEL?=
 =?us-ascii?Q?FUM1W1YUF0Kq0EStpy64G8JrMWhtncPVQU8JW9DHtaNJ8u2GGzboR+h6SHtn?=
 =?us-ascii?Q?YELOarp5WrvzoCb7OOyyjLdgcSeyGWdJRKGpzFOmEmmbrJwTLi2KhX7EyKYy?=
 =?us-ascii?Q?rUJPH1ddqouipUBvWA/5S7eUuSMOjqd474i358lSa6ks9lo3QwtyaKnHSj2+?=
 =?us-ascii?Q?D02ANbASblmr3dgjZ6k9sMXEvnR2a6H/FI1QtK7JwoVRWFu0K0YgNsvgiAsb?=
 =?us-ascii?Q?PB3YFzWwpIAidPCrrhYn7GNQxPAT/NQctzbVk8CAUHx6/gFsrlyXPesXXHL3?=
 =?us-ascii?Q?/2lQRT+c8bInWY0tXPg94IAVXxnGhLC0fE3nPOCzzATue0VYwkVbbJxiZOZq?=
 =?us-ascii?Q?25o+U0WZ4D68olIqUI2dkT5t3qUhpLVN9Swy+W7yv5pa81IVaoE9K3eerkN6?=
 =?us-ascii?Q?kiN4zRul2vawaCp6qU0uf5ZZ9CEkr4iA+YcUWpb/DNA9DQ5hP5+xTyGcseAn?=
 =?us-ascii?Q?e/Iro83T5xAQvJq4ewxb6XypFMJoU6MunbcVaIa72FfODvG8HXuFATkFxdUo?=
 =?us-ascii?Q?CzL+Lj4QiqTNQY1biY1Kru1m+OfBj7KWcvnpm6DpZ9pm9hbVOuQ72R02Xa9H?=
 =?us-ascii?Q?plxr8E5O+OyZPJ3CbRJSrN5u19jQbZnUD14SOBAYfRjwl12HCaQMwSwdSb6Q?=
 =?us-ascii?Q?hszJTdmZttPl/xrAAkadhDw2ZGf04fTZ4p7P?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 08:43:40.2803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dcd90b8-b454-4b54-d2f7-08ddb556b74c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7131

It has never been used since the introduction and is technically a dead
code violating MISRA C.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/include/asm/config.h | 4 ----
 xen/arch/arm/mmu/mm.c             | 5 -----
 2 files changed, 9 deletions(-)

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 272e4565e592..f18825bc2d50 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -66,10 +66,6 @@
 #define STACK_ORDER 3
 #define STACK_SIZE  (PAGE_SIZE << STACK_ORDER)
 
-#ifndef __ASSEMBLY__
-extern unsigned long frametable_virt_end;
-#endif
-
 #define watchdog_disable() ((void)0)
 #define watchdog_enable()  ((void)0)
 
diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
index 9c50479c6373..6604f3bf4e6a 100644
--- a/xen/arch/arm/mmu/mm.c
+++ b/xen/arch/arm/mmu/mm.c
@@ -8,8 +8,6 @@
 #include <xen/pdx.h>
 #include <xen/string.h>
 
-unsigned long frametable_virt_end __read_mostly;
-
 /* Map a frame table to cover physical addresses ps through pe */
 void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
 {
@@ -46,9 +44,6 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
     memset(&frame_table[0], 0, nr_pdxs * sizeof(struct page_info));
     memset(&frame_table[nr_pdxs], -1,
            frametable_size - (nr_pdxs * sizeof(struct page_info)));
-
-    frametable_virt_end = FRAMETABLE_VIRT_START + (nr_pdxs *
-                                                   sizeof(struct page_info));
 }
 
 /*
-- 
2.25.1



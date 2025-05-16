Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D874ABA67A
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 01:22:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987713.1372932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG4NE-00061r-DC; Fri, 16 May 2025 23:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987713.1372932; Fri, 16 May 2025 23:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG4NE-0005zg-90; Fri, 16 May 2025 23:21:52 +0000
Received: by outflank-mailman (input) for mailman id 987713;
 Fri, 16 May 2025 23:21:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iQOe=YA=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1uG4NC-0005s2-9O
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 23:21:50 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8af95b2c-32ac-11f0-9eb6-5ba50f476ded;
 Sat, 17 May 2025 01:21:49 +0200 (CEST)
Received: from CH0PR03CA0267.namprd03.prod.outlook.com (2603:10b6:610:e5::32)
 by IA0PPF4D923B935.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bcd) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Fri, 16 May
 2025 23:21:45 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::a2) by CH0PR03CA0267.outlook.office365.com
 (2603:10b6:610:e5::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.20 via Frontend Transport; Fri,
 16 May 2025 23:21:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8746.27 via Frontend Transport; Fri, 16 May 2025 23:21:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 May
 2025 18:21:44 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 May
 2025 18:21:44 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 16 May 2025 18:21:43 -0500
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
X-Inumbo-ID: 8af95b2c-32ac-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=miEQldNgMP2AiDsoajvZVOqjGMmV3UmyXf7RS86ZdeAQl89dQJvde7nuQlG/hrFs7O+mSgw2xZqoH2GCBdNxksZ7JAEJOdyL+5yvHZUf3F1A2CXthXcf7ZMJIQ2FCV5Xxt6Kwk+/tQTJKvlqNsb8t4x34VfiE2nwIhl3R0diDT90POQFyP6ueTXwlozkLYkv4s0/Iza65Vutg3vF7ANtdaPN8E47ZqlY3qW5rO2APkKOIlUeaj/9I7XT1TAdPOiHVdh/wG6xCIygSlYBz6nPIpj2yD9KsLYujCVqsEpdT5xSjJy8YQlzCWviLQImzo4gKWbB7R3cMYXSbt8p5dFYtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uvsiHvmuEqOockd22z8vSZlAwyTxhLLN35xLes32HHk=;
 b=tp3TjxnJDa5NFFMpjApO5BICRidk54UBKfm/JSMzrJu5vtKlNjpW5swyLJo9Hii/kwPfAnMZ+YyckOvwREi7cxuMKvT1Ynk525VKUWEvTNWkeYpe120JSG3NveuxHVU1KdMTA2iSeRJ01pq2g1kDB2HpF0h2JC8upnwn16+5bLnucqOGD1LTHhnFl90uyqm9EU4eE5bu2nDMMPnCpTyG++6OAtf8O3KlrDdccQpyWQvCL2ijlU1YpV7upDr3utkbwyEtwaFjP+LOdgFEzxwfkz8zUhf7rR7ivJ59ee7aoGQv5KY+343anabbndFJ9RsTkptX2SSgcSQ4ZCUTKlWAoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvsiHvmuEqOockd22z8vSZlAwyTxhLLN35xLes32HHk=;
 b=mkQSTbJJh4SEWHJL4FG/Lqryi7CxDUN3ey0jCzmDXT7NBC7Ok4H7blEyS6lPf/uBAfbKORUnx9wMjmZon+KS5rBsjKeKDEGAYg1olXgeUtSAUJmrzJY0JIfvqoz/F8TQWZ9m8EPgf0wmnudwxxMTCXlYf8PMbKAks5ZTDUxleQ4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <michal.orzel@amd.com>, <jbeulich@suse.com>,
	<julien@xen.org>, <roger.pau@citrix.com>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, Federico Serafini
	<federico.serafini@bugseng.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH 1/6] xen/arm: add inclusion guards
Date: Fri, 16 May 2025 16:21:25 -0700
Message-ID: <20250516232130.835779-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2505161618280.145034@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2505161618280.145034@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|IA0PPF4D923B935:EE_
X-MS-Office365-Filtering-Correlation-Id: e201a081-0fcc-4e32-854d-08dd94d06c99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?njfK6ToZIhyebKh+NzrMt0rs4rDwpbIMo3V+6Z7VsiESbOlsje71yRdOgiac?=
 =?us-ascii?Q?VB8cQF0XNCmp4tMTdNvs1JXylnc4+k+Nkvx7MuXLmOBk7zWzuCitV+bPcExk?=
 =?us-ascii?Q?27O5LO03487TpzL1R4Qm1Ix5FtHsLciO315VOhCtV+LAQqoTJqwXwu5so7wF?=
 =?us-ascii?Q?Fdjbk4wT5vvQ0Al+D19rrqUhLU/fp/lkIiS0XHed04Hob+22VGT69mapgxCw?=
 =?us-ascii?Q?BSb7UCfbQWHvbP7s0iK95kOECZzY5nkMXu2h+zDEkk1k8g5zrnN1tTR82YbU?=
 =?us-ascii?Q?4e6d6HiqNeVb0R2hLjr8Rgv4RBkBoglx6N2eh813Fadt+f4ArlRqAStFXy42?=
 =?us-ascii?Q?xas4Cf5LI0E8qdhg6MWf5ZuW1kV/PsY46VrCx1yV65MQQmcGmVGwtMotmAiG?=
 =?us-ascii?Q?TUFbvx6ccTc9V8izogs/UL0XHzi2q9F+dK90mDo6MEihxy/CV2ZGos8NY5QV?=
 =?us-ascii?Q?A2SQ6Uo4zj5JNcnPMPvwTuT9lrnlDBRWZgV90iHU5mQgIKrdrVQdY4C0i1Ew?=
 =?us-ascii?Q?wyFTEZY+Osgm6gr/lEMDivQnK6PVir3/+DjUGJ53ejyzquldShoZscBbJlmI?=
 =?us-ascii?Q?u2ZKnBNCsJ6vtPp2jXEVo99jn4T9BgAQH6m63Hb6ODRvhscq+I0cAZL8Gydl?=
 =?us-ascii?Q?hA2Mah8rsR37WfOQsrEHmmJAz/wDNu6uym4OJxIJQsSyB1CLGXlYEctUyTDE?=
 =?us-ascii?Q?P11A7BQ9OcTU31Z42KOaWnxK2hhE0/SoiSv11mnQUMbFt93OI3rN5WBwT1tI?=
 =?us-ascii?Q?OGetJ0RBh6E6a6DxZthsmOQ/Bi82JQ0fAK6tzc4UEDtnn4/6uZHx2Kp1uvbD?=
 =?us-ascii?Q?ocuGB7AlYq38izC7PxvhgIdHNGXb+gFbXPnCsE/RUeM4pLdef2TwWbM82PPH?=
 =?us-ascii?Q?fhxJRAULddX+/bsnKdMRSFc+N7n8caDgH06ivW4xrmNMKbya/PUBedQcSY97?=
 =?us-ascii?Q?f1PNmQAiE0oCqP4wXu2dPgzT7zrzekSPXP1Mg9iaShK6Cjkn5/jNTCBflTNA?=
 =?us-ascii?Q?CU8Kwr/Duhf0Rda+QgUjjk+HFyqBzMmKKS0Fo/SDEH3zSoIjcZzTDVKTo1By?=
 =?us-ascii?Q?SPM9Z9vy9zYrKtlsWYoCknlz1Y20HyPimpK4+pU4l1uADUtxabCByJiPorYx?=
 =?us-ascii?Q?2mimQQNMvMdTt0QDww9fTz6zBYsWdwbHI14KW5g0eyNR3TUlbddpi/p6fACU?=
 =?us-ascii?Q?+zGxiufLGC0z80C+V+kFLXLbM6z5727j+00kbH5yIfstbf21+ufZfSoJ72Ft?=
 =?us-ascii?Q?G/Zcz1M6ThXRmVHoqF9LUxihj+fOGTAa9iNrxdlLrJxHeoqnHlk8uYjNBqbS?=
 =?us-ascii?Q?ZonT3jG23beArVYVJP3M3J4tcydF47XOfwShP4QYMX3GsoC/owPWX18q+VKm?=
 =?us-ascii?Q?Q5rKb1LsVA8jK/Ht40ze4/9+O9hNrUpsUclwhZgjAM1sT83qAmsn2yIPozEX?=
 =?us-ascii?Q?RB0gIB1Jled/vi+sNXwHZpXU3TMeqhxLX+3ROPJVkE/Cf95kIxRhIpugayza?=
 =?us-ascii?Q?Ay4PcqL1TRZrVDuTtKyVjJKN5Mce+jAS5UUZ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 23:21:45.1635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e201a081-0fcc-4e32-854d-08dd94d06c99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF4D923B935

From: Federico Serafini <federico.serafini@bugseng.com>

MISRA C Directive 4.10 states that:
"Precautions shall be taken in order to prevent the contents of a
header file being included more than once".

Add inclusion guards where missing to address violations of the
guideline.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/arch/arm/efi/efi-boot.h        | 6 ++++++
 xen/arch/arm/include/asm/efibind.h | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index dcad46ca72..d2a09ad3a1 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -3,6 +3,10 @@
  * is intended to be included by common/efi/boot.c _only_, and
  * therefore can define arch specific global variables.
  */
+
+#ifndef ARM_EFI_BOOT_H
+#define ARM_EFI_BOOT_H
+
 #include <xen/device_tree.h>
 #include <xen/libfdt/libfdt.h>
 #include <asm/setup.h>
@@ -1003,6 +1007,8 @@ static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size)
     __flush_dcache_area(vaddr, size);
 }
 
+#endif /* ARM_EFI_BOOT_H */
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/efibind.h b/xen/arch/arm/include/asm/efibind.h
index 09dca7a8c9..92b8bad0bb 100644
--- a/xen/arch/arm/include/asm/efibind.h
+++ b/xen/arch/arm/include/asm/efibind.h
@@ -1,2 +1,7 @@
+#ifndef ARM_EFIBIND_H
+#define ARM_EFIBIND_H
+
 #include <xen/types.h>
 #include <asm/arm64/efibind.h>
+
+#endif /* ARM_EFIBIND_H */
-- 
2.25.1



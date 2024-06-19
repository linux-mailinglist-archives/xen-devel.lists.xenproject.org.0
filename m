Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDFB90E3B6
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 08:48:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743430.1150328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJp63-0004eQ-N7; Wed, 19 Jun 2024 06:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743430.1150328; Wed, 19 Jun 2024 06:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJp63-0004cR-K1; Wed, 19 Jun 2024 06:47:07 +0000
Received: by outflank-mailman (input) for mailman id 743430;
 Wed, 19 Jun 2024 06:47:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5jEq=NV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sJp62-0004cL-3e
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 06:47:06 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2407::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb582e12-2e07-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 08:47:01 +0200 (CEST)
Received: from SJ0PR05CA0036.namprd05.prod.outlook.com (2603:10b6:a03:33f::11)
 by PH0PR12MB8773.namprd12.prod.outlook.com (2603:10b6:510:28d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 06:46:58 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::7d) by SJ0PR05CA0036.outlook.office365.com
 (2603:10b6:a03:33f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.32 via Frontend
 Transport; Wed, 19 Jun 2024 06:46:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Wed, 19 Jun 2024 06:46:57 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Jun
 2024 01:46:56 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 19 Jun 2024 01:46:55 -0500
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
X-Inumbo-ID: bb582e12-2e07-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxAjFhAP3d9qmwaygbniizDeALAi2u9gN/DA7n9+NBD3ymgRn2Z4nfPgQQTS7p1m1lO/xZbX6hfSX2XHAp2LU8cZ6CNs/YvP3l1UzUkLKzb+S7NEia/HIKYb8HL+FEckJeyGLt4vTvbcD3iW/h938Jy+V0VvDC27oz6MM36K1hKa5lzP3da3vV5FLR/eeULfSx4YwaR5UXtmjGfP6BLTObiyKVlaBcmFNfKt47p34zBY8cYyPFYEHh3hfjd0ruTSS8wyAPl9TX7Oe+GyL5WtqPUjgt1Sot0NaGl54HFCgZs1QiiKPvZHCVWLeCtU9t3cwPpXIfHEULPslx6EENcPog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8IhlyOSy1QVYCO5JuO87iS9W8d2PIRMLFUhNMPaHD4=;
 b=IUO5jujTamQ7vYF0SJ1bxqQAPVkEf3v8KHvpHLazcujPmRrYb0FR7m3kgi1GluLYlA9ySX1y/vNS4HXqxf218XARnUGzV1OQcMsgq5U4nJEwpBOaYWBybYvLrUItNQ3uKzxttZt6mCFZ5yIqrFmoT/40PAkhRSJkgnEN+VOEug7I4bmjQQnDzyFwecL2FIEA0KCqLlmczSlgQ653HWzTGVQdT/oHC/08XIRaHQm8FV9fRrvbtun/jE4LGCwR/h4RqetbSFN4jAhuu/uEycUdTGyPTmVC0KDjoUPag7qTwlMK9uzfqCJtkQ4B+dSKZqdV6a+7rmyzVPEeEkWWHaSEOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8IhlyOSy1QVYCO5JuO87iS9W8d2PIRMLFUhNMPaHD4=;
 b=PkgSavB6WgzylpGGzT1HUha7XqhyG1ry1PPFo9e6Gdd51pwT/u80X/loljYIMuxgeSzCrZdjZuEKk+u9MNHIgx6RLhIiReQPwowndhrKoDsWDqAKniEwdxmRFdG5ymQ7IARC7ccWEXU9aTfEF/gFbWX0JSrMV1O1HaIMdtEAZhY=
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
Subject: [PATCH for-4.19] xen/arm: static-shmem: fix "gbase/pbase used uninitialized" build failure
Date: Wed, 19 Jun 2024 08:46:52 +0200
Message-ID: <20240619064652.18266-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|PH0PR12MB8773:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d1368dd-9ca9-48c7-ab76-08dc902b9d5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|36860700010|376011|82310400023|1800799021;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WKpw7SppmYYMYRZl098WthIQOorjQ32v7SYsICo+bfAm4ipw5BTb8q6tCYAH?=
 =?us-ascii?Q?BQQm3zPCTvy7SJ9bKwhWx9F+PKYGw5Uek5AvX6l473kHWUwKTvwPNBCQwhfL?=
 =?us-ascii?Q?4by55/S1B1XoVokcpPoyTpvsYak7k/AbDQVj5n+QbYRlDPa7ff7SNfxHR0pL?=
 =?us-ascii?Q?AuBqWlenmPp3VJQulAx3axDoOXVf1pQQjpqa0fvmtCp+AMTkySSXN0LDPLfv?=
 =?us-ascii?Q?HpT5a0yFq9mJjocnR/hsesRHJw+rV+l0xvleY573QzbDXPP2ArQWRVWzGWbu?=
 =?us-ascii?Q?fGsdJQqHagZQWbAOInQ4905QW7q1hekVgkgSWYprSOQGZ7M3P7YszWogsQ9u?=
 =?us-ascii?Q?8iojqG0LXp7NhA+GRX+plTrCfyiu168pJsNqKx4ob3OG+hO6pzY2VspiX5+0?=
 =?us-ascii?Q?5FzacRB5F0mrXs2OiBdneK76q2C6zBcnJ27Fnc3B8Sqxtg0S893WXrfrMcpn?=
 =?us-ascii?Q?IXzXw4lo6pfJ39+NJ9m5471a43mlotv1G9XSOh//0c+6O6C6hpe9Mv4GQbK2?=
 =?us-ascii?Q?576oQuL/IRoqoLcdtqr0iuo5rsM0/tRUrHraz2hY/srrfRHVIYwvMaFoWNx8?=
 =?us-ascii?Q?OazZPx4NLau2PZ7yzPd0QBiIJZJD2BtjcieaCVjfo9V/e0NwP1BBbXmzQ0ei?=
 =?us-ascii?Q?UqynoZithPo183ENGlBQLajEMrIzT63AE0uyK0/uzlpbb6bN72AjKGJO+O6r?=
 =?us-ascii?Q?NKIlm3g7SgrSUft+q8g8xohJcCzvAxJFZKVR4TMdN865ajex4sUjnQRk4Bh6?=
 =?us-ascii?Q?R6azAuhUZkyaCB4kNHw1kq3FO3E8hFORAt3jGZeBsiIJzkz/JrjLdh3I9bz+?=
 =?us-ascii?Q?TdqtIL33Najp4xZuYqgjiTWGemdK67/lruC5XbQ0hNx6ihcgLh3hDzchMq9c?=
 =?us-ascii?Q?WRzvmHmkaZcwqgxgiy7p5nNXkfs9sKgEcYI6DmRyoQQSBh62IwIOf0lPrkmP?=
 =?us-ascii?Q?npvSADQsP01ZXjJlq+Iah31gVwmRsUaRkXmw6E2KZsV9lBf69/USYOtPoS6h?=
 =?us-ascii?Q?Ycyu2FlSvRaiq9ErmpSEts8SgDfzh2xnqWmQxwRWLwLnxzpYYa2dNQHvGCcR?=
 =?us-ascii?Q?0cfDGegwHGMrnTPV9CHqNAK634EBJs+jEhDE7fDoUAMPSXi71h7mt6wC3XBj?=
 =?us-ascii?Q?/7EcN+jj/DiN4f71MUUXwy0DMm2yQrX6NHwUlfa/oeqP5iMeXyHXX/Y1UUg3?=
 =?us-ascii?Q?AY7A4wcj4dW9lr5jEKqVg05kmA/VANxqsICHrIlJCx3tb4RjhZvBrr/F1wJs?=
 =?us-ascii?Q?3+L9bWTJkALNO/pqvJ6kceeViU/GRAH1F5/M6ZpXu3Bruq4Asf3F3AdFoAiz?=
 =?us-ascii?Q?mtnbsKrNCkIT1Ri/02IxLIFE/4u6FmXmWRPt5mLn7SRSxg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(36860700010)(376011)(82310400023)(1800799021);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 06:46:57.6647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d1368dd-9ca9-48c7-ab76-08dc902b9d5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8773

Building Xen with CONFIG_STATIC_SHM=y results in a build failure:

arch/arm/static-shmem.c: In function 'process_shm':
arch/arm/static-shmem.c:327:41: error: 'gbase' may be used uninitialized [-Werror=maybe-uninitialized]
  327 |         if ( is_domain_direct_mapped(d) && (pbase != gbase) )
arch/arm/static-shmem.c:305:17: note: 'gbase' was declared here
  305 |         paddr_t gbase, pbase, psize;

This is because the commit cb1ddafdc573 adds a check referencing
gbase/pbase variables which were not yet assigned a value. Fix it.

Fixes: cb1ddafdc573 ("xen/arm/static-shmem: Static-shmem should be direct-mapped for direct-mapped domains")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Rationale for 4.19: this patch fixes a build failure reported by CI:
https://gitlab.com/xen-project/xen/-/jobs/7131807878
---
 xen/arch/arm/static-shmem.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index c434b96e6204..cd48d2896b7e 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -324,12 +324,6 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
             printk("%pd: static shared memory bank not found: '%s'", d, shm_id);
             return -ENOENT;
         }
-        if ( is_domain_direct_mapped(d) && (pbase != gbase) )
-        {
-            printk("%pd: physical address 0x%"PRIpaddr" and guest address 0x%"PRIpaddr" are not direct-mapped.\n",
-                   d, pbase, gbase);
-            return -EINVAL;
-        }
 
         pbase = boot_shm_bank->start;
         psize = boot_shm_bank->size;
@@ -353,6 +347,13 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
             /* guest phys address is after host phys address */
             gbase = dt_read_paddr(cells + addr_cells, addr_cells);
 
+            if ( is_domain_direct_mapped(d) && (pbase != gbase) )
+            {
+                printk("%pd: physical address 0x%"PRIpaddr" and guest address 0x%"PRIpaddr" are not direct-mapped.\n",
+                       d, pbase, gbase);
+                return -EINVAL;
+            }
+
             for ( i = 0; i < PFN_DOWN(psize); i++ )
                 if ( !mfn_valid(mfn_add(maddr_to_mfn(pbase), i)) )
                 {
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 204728039F6
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 17:18:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647156.1009924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rABeL-0008GJ-Qb; Mon, 04 Dec 2023 16:18:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647156.1009924; Mon, 04 Dec 2023 16:18:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rABeL-0008Ec-Nh; Mon, 04 Dec 2023 16:18:25 +0000
Received: by outflank-mailman (input) for mailman id 647156;
 Mon, 04 Dec 2023 16:18:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y+Gv=HP=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rABeJ-0008Cw-Gq
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 16:18:23 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd225b86-92c0-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 17:18:21 +0100 (CET)
Received: from MW4PR02CA0001.namprd02.prod.outlook.com (2603:10b6:303:16d::21)
 by CY5PR12MB6573.namprd12.prod.outlook.com (2603:10b6:930:43::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 16:18:17 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:303:16d:cafe::df) by MW4PR02CA0001.outlook.office365.com
 (2603:10b6:303:16d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Mon, 4 Dec 2023 16:18:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.2 via Frontend Transport; Mon, 4 Dec 2023 16:18:16 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 10:18:16 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 4 Dec
 2023 08:18:15 -0800
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 4 Dec 2023 10:18:09 -0600
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
X-Inumbo-ID: bd225b86-92c0-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imvvKSK9s2HXdXgLzZbjBnM/uPMIhJ1J1fC7PMCWzskRDQ0z3QA6G0lJPFOkVwoh3Ncg1MmI9ODrENhKdZ0fMBAIopt2mrhWS7XB/lwHhfF/jmTv/+hgqUn6RfsMl2xkZV/d+tjnnieZVnbi4EMtoGn7fTIMhnI6dQ1zwN1QCvuknCQfr5SwA4Fp9psy2fe3Gz3b6KetTnZ2XBdq44QppaOqKjvP9hzOvhXV9pvE6uw/n94ReiwQzLp0w8MM3tgh1aK/kIviFjc9YuLxUeKogN4z5XSqxVN+S5Lpwi9pkaitMB9olE/J+8CgyCXeH+bY2QOH1RvOGMw5E0G0bXNNOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHX0uWWJY5+FNWlcKyNRL+7ZP1E/EvuXbuqBjJQtE4g=;
 b=VQ6iWrXa8nKDznWnsKGpAey6GZT7yxeZOjwECv6T85eDWWPssYaldmq3lGNpqES3+y7HzE1ALh3EFA1B4cuExV64+Splke2GJO1wtn0KAMj+mzcZxzKV2YtTC53Jpcfr2LVvtvIrknuFe5tQqvqy8eKcnbu5T2tAt6mgyvuW8hEvLTsRn7ZbkrP/6Ifd1YszRCgHf/tmKPMiQL7C7qsapzVx0+UgJfb9Ygeoa5WitxDmsUsWnhuC6uiQwxUFjUq51k4kWpbM8+zyZ08FIEUnYwL3Ty8vCOh2lqSzmqSWU/KdOexAUKV7owKKUEJgiJpa/C+/t7A4wJp0l1v0YiJJUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHX0uWWJY5+FNWlcKyNRL+7ZP1E/EvuXbuqBjJQtE4g=;
 b=XcaVJFWyo7k/VpJR55tVKbNLrkoI3tdZb1/SFOCWXvPojjHP8GaNRbV30lN3CgbJXz1XuLNWcc1GglruEuLlv+M4L/QrSuZwFGFSpoAfN0zjVRvl9U5D2Iae4WM5NKFO4JmGiY545v5ogIIkd4eg9jB+dDjIMuhmlVvYdcljgB8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>
Subject: [PATCH v11.1 16/17] xen/arm: vpci: permit access to guest vpci space
Date: Mon, 4 Dec 2023 11:18:01 -0500
Message-ID: <20231204161802.3537573-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <4920dfd5-38b2-4122-8108-508aa643ddf6@amd.com>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com> <20231202012556.2012281-17-volodymyr_babchuk@epam.com> <5bb1afc3-6de4-4b78-85a4-2610f5f1d001@suse.com> <4920dfd5-38b2-4122-8108-508aa643ddf6@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|CY5PR12MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: 856d414a-732f-43fd-3d76-08dbf4e49f9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cvOqu+Gpl7f/r8Qoy3qi4dI1qVmLHcc8LT1XJVtMruTx6A+KM/U5db4yj9yQuHsJ0vc13+DGAYzu8s0Rxo2Oo4+UqCTVJnEcGjfv4KsiLLEjVpQx30NvrN6V/k95QBKDb7UDOexcyUQE+QfhlidFh+bbymyKIuA1/4wvXmp6t14Y9WcbI2imMphZnv4//DP8BYxUwYo7dxfD43rBKUk5+Nh5cD1SJA6x77xFPtMG/cX7Y8R2wO60kFwn9gqervDHGTMV9n4jhrse3sdtDXvv76mzqaPx4ZqU8WQ1eh3pBXpmGirCMCEEWR85NtJx9zyGUIMX59zQUBwCHBSPwaxAeVt+k35Nkp0I9C/THyLlT5jRh5Y4Pu7mN5JkqJGSeo3Rm4KuBMm1RhRQOJJ32uTc3IpD0GeaOHhaS8rGRWrwc1+N7nGntdlsVS9SLPpKSEssYA4WZblDa065PjVRAa6+kMcfCteOdqDOmmCYZhNrLL07oC5w4HkeJhIWg5zm/p2XNFGyBSeHQJ2zyaFF88KmswSS7KKI4ULRvBy79d1HKBDs4DWqGGjTU8qKwq4TakRwrmmX9ZJx8GpOtAPH/8Ic/aXzUtkfJf5TUF3MSXPubrOrXu4nfklBfm0YFCxqUiqZ8a+hyVwOR/MQ1GjOQ0U8QOCgIrrbx4psLSvN34AQ9JvgJ42ZniIVQcfYGw/Wct7ERw0KJ092+FtvGRmOvSKSBNldCU/w1H7RZ2vi+yBzj13NRz26s3ieSZmMesRkQ8sRpxRLC7g1cjrOB/YimNqadg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(82310400011)(40470700004)(46966006)(36840700001)(40480700001)(44832011)(41300700001)(6666004)(86362001)(40460700003)(5660300002)(2906002)(83380400001)(356005)(4326008)(8676002)(8936002)(54906003)(36756003)(316002)(70206006)(70586007)(2616005)(478600001)(26005)(1076003)(6916009)(82740400003)(81166007)(336012)(426003)(47076005)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 16:18:16.9057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 856d414a-732f-43fd-3d76-08dbf4e49f9a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6573

Move iomem_caps initialization earlier (before arch_domain_create()).

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
Changes in v11:
* move both iomem_caps and irq_caps initializations earlier, along with NULL
  check

Changes in v10:
* fix off-by-one
* also permit access to GUEST_VPCI_PREFETCH_MEM_ADDR

Changes in v9:
* new patch

This is sort of a follow-up to:

  baa6ea700386 ("vpci: add permission checks to map_range()")

I don't believe we need a fixes tag since this depends on the vPCI p2m BAR
patches.
---
 xen/arch/arm/vpci.c |  7 +++++++
 xen/common/domain.c | 10 +++++-----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 796ff55d09d0..f8cdd085e27f 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -2,6 +2,7 @@
 /*
  * xen/arch/arm/vpci.c
  */
+#include <xen/iocap.h>
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <xen/vpci.h>
@@ -128,6 +129,12 @@ int domain_vpci_init(struct domain *d)
         }
         register_mmio_handler(d, &vpci_mmio_handler,
                               GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, NULL);
+        iomem_permit_access(d, paddr_to_pfn(GUEST_VPCI_MEM_ADDR),
+                            paddr_to_pfn(GUEST_VPCI_MEM_ADDR +
+                                         GUEST_VPCI_MEM_SIZE - 1));
+        iomem_permit_access(d, paddr_to_pfn(GUEST_VPCI_PREFETCH_MEM_ADDR),
+                            paddr_to_pfn(GUEST_VPCI_PREFETCH_MEM_ADDR +
+                                         GUEST_VPCI_PREFETCH_MEM_SIZE - 1));
     }
 
     return 0;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 26b4d558a41c..0aeb0520c96f 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -706,6 +706,11 @@ struct domain *domain_create(domid_t domid,
         d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
 
         radix_tree_init(&d->pirq_tree);
+
+        d->iomem_caps = rangeset_new(d, "I/O Memory", RANGESETF_prettyprint_hex);
+        d->irq_caps   = rangeset_new(d, "Interrupts", 0);
+        if ( !d->iomem_caps || !d->irq_caps )
+            goto fail;
     }
 
     if ( (err = arch_domain_create(d, config, flags)) != 0 )
@@ -724,11 +729,6 @@ struct domain *domain_create(domid_t domid,
         watchdog_domain_init(d);
         init_status |= INIT_watchdog;
 
-        d->iomem_caps = rangeset_new(d, "I/O Memory", RANGESETF_prettyprint_hex);
-        d->irq_caps   = rangeset_new(d, "Interrupts", 0);
-        if ( !d->iomem_caps || !d->irq_caps )
-            goto fail;
-
         if ( (err = xsm_domain_create(XSM_HOOK, d, config->ssidref)) != 0 )
             goto fail;
 
-- 
2.43.0



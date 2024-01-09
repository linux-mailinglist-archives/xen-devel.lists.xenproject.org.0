Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5445828F52
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 22:55:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665052.1035273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNK42-0004KW-Ee; Tue, 09 Jan 2024 21:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665052.1035273; Tue, 09 Jan 2024 21:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNK42-0004II-Bm; Tue, 09 Jan 2024 21:55:14 +0000
Received: by outflank-mailman (input) for mailman id 665052;
 Tue, 09 Jan 2024 21:55:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ONpl=IT=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rNK40-0003ql-D2
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 21:55:12 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c276fa03-af39-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 22:55:10 +0100 (CET)
Received: from BLAP220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::17)
 by MW4PR12MB7262.namprd12.prod.outlook.com (2603:10b6:303:228::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 21:55:05 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:208:32c:cafe::6b) by BLAP220CA0012.outlook.office365.com
 (2603:10b6:208:32c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23 via Frontend
 Transport; Tue, 9 Jan 2024 21:55:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Tue, 9 Jan 2024 21:55:04 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 9 Jan
 2024 15:55:04 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 9 Jan
 2024 15:55:04 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 9 Jan 2024 15:55:02 -0600
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
X-Inumbo-ID: c276fa03-af39-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1kmXkcivhmxB0LSnjBAQftoBe1GsxXGF9sILGmhe6yshJBV7toPL6Rolc+2sUGUOb3Vt1XHlXvIHHb3gR9w2ZG8TFpx2uBDJs7hpi7/VZD4DV60Nx3MCq64zx5xNzxbX6DwcsfhBFbVxmoQ83HNE4Qn3j04MRowsT1mClxqyCZcsN+HvzAZEgaJ26kP1Z4tpYbw16hAQrK4nJRQGuoITgM9rh5G2QhDEq2HEdzD3bKAwbFfuaDGhLdXvebdOhh4VV1M+bGt6T70SnI2K37xOQZCHVYlYCTRXhKnoz377JXeJKBRRQNbSG8FPuml3dl5F8W7JGqjyJv7UllgIBC0Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sds9Y/npwbMXFe2dWuz/kb6byGvdHn8OQgeszTqP9BU=;
 b=Mg2/Fu1E0TwcnYFP8X4bUxgJtad9udpaZgNKaOj0Magq70PZDsPYvRkoMnDwzsAwVfYQX5hEsqTHigryRC1bQFvaMnu+wGE8wxOLkT/9WxnjbXrAPUu0ytWOz9BBTYoouRjP3yZM2kwBv6cP+L9TE5p+R8iYL8dDy9pI8IyrQRqZdy6Dg5qd078Mg45CbBDnE3byRyBHdQrNbEgK9/LkkJOQ53F4Xe02J/0sHC2LZmRUaS84hoWWEc4n7Ttz6Ks0nuWrLH5wD0QDAOFr+jR68/jNwly49++umzY9Wv5Os3QLcbAPp+Fwdee0hukyjxpVtp9IFJuYOWAgZH0Cp8St8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sds9Y/npwbMXFe2dWuz/kb6byGvdHn8OQgeszTqP9BU=;
 b=TYhbABS3gl/hk/31rMNUv0zLynkV37MBk7U663m1YfWgvvW8CpdnZOLsiaLYz+zxlQDbUOcIx540fZu7UQPuHlrezol4MBxWFCjs3obrMrzeHb2ZSzSWp8vCtdAvz6FVpymM2MCArePlK4x9umc+MuQ7UPRAVS7y7udBUQHzOlw=
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
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v12 14/15] xen/arm: vpci: permit access to guest vpci space
Date: Tue, 9 Jan 2024 16:51:29 -0500
Message-ID: <20240109215145.430207-15-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109215145.430207-1-stewart.hildebrand@amd.com>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|MW4PR12MB7262:EE_
X-MS-Office365-Filtering-Correlation-Id: fbe115e6-b59a-4f06-1915-08dc115da358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ns4bMm7h8Eig2xdrhP0Uc2Cnw8FSxIEf3jPMOhRDi5z7lfczCnfiIFs3gmB5lQA5lNmoAPsU1XyXQuYQyXSqfF+YdTvQHpbAT8uTFh9WK7QSI5t9SinL3Q49dSu7Fk+G/wyU4bRDpydxCoanr2gVmwG9msbclY+Jzcy8vCGqvOIhTwYwJMpoAsaCET6nzu+5V/UTTQ5LrbOlt5NiuS8Ej5GnaL+D/DkUxaR4gLiVY5MvQD0naSyQEQ3JHL3bWHMTDheGyRV8haC0jmtItwEeRLzGsZJchtH5ZOyJED4YZnc8ap/z0RkeLPRFAN0qhdQqBIA1D2dSMNVX1EBig2X3ChYzd0C33C4BG/cGtGkuFmI05ilV17B2aWtIhzpAB9nHqn1VOwk/oOHFcrYPZO0fqR0D8ViHbP4owVfsMdZ2ugSYudYdm4ANvykzTjZUDN2rdujt4jY0g3m0upeCyXgL/lqRqWIPnUUWYjgmiwZgFxU7W/JHJlJeEBkKOMuP0RJspKdqahwRwQOPVaLdI9nUDhbesI753vCunDQ0dWrXFKaFPW+w2telVNHLTAJqk7n+hYQ8kWit1KxJLBxLsFPmVRqZ9SXN7eT8LLHMoA/hdp2eQ73FlX6rJIvv2Z3Bu8QCOF/d8ZmmQ2bqZppCwpEffwWHeg3uHnurUtf0KQEh83McQfAFh+igsjlBViLYy3XbnUHc8Z4yySDdCBuKvBAJ5mTQklpuHk8ZngieI/OGQTjS+5PNF+v69uDG87KqZSJLUoit+uncEHJMw/gEscS62Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(376002)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(82310400011)(36840700001)(40470700004)(46966006)(83380400001)(26005)(426003)(1076003)(336012)(2616005)(36860700001)(47076005)(82740400003)(4326008)(8936002)(8676002)(5660300002)(44832011)(2906002)(6916009)(6666004)(478600001)(54906003)(316002)(41300700001)(70586007)(70206006)(356005)(81166007)(36756003)(86362001)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 21:55:04.8452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe115e6-b59a-4f06-1915-08dc115da358
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7262

Move iomem_caps initialization earlier (before arch_domain_create()).

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
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
 xen/arch/arm/vpci.c |  9 +++++++++
 xen/common/domain.c | 12 ++++++------
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 348ba0fbc860..b6ef440f17b0 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -2,6 +2,7 @@
 /*
  * xen/arch/arm/vpci.c
  */
+#include <xen/iocap.h>
 #include <xen/sched.h>
 #include <xen/vpci.h>
 
@@ -115,8 +116,16 @@ int domain_vpci_init(struct domain *d)
             return ret;
     }
     else
+    {
         register_mmio_handler(d, &vpci_mmio_handler,
                               GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, NULL);
+        iomem_permit_access(d, paddr_to_pfn(GUEST_VPCI_MEM_ADDR),
+                            paddr_to_pfn(GUEST_VPCI_MEM_ADDR +
+                                         GUEST_VPCI_MEM_SIZE - 1));
+        iomem_permit_access(d, paddr_to_pfn(GUEST_VPCI_PREFETCH_MEM_ADDR),
+                            paddr_to_pfn(GUEST_VPCI_PREFETCH_MEM_ADDR +
+                                         GUEST_VPCI_PREFETCH_MEM_SIZE - 1));
+    }
 
     return 0;
 }
diff --git a/xen/common/domain.c b/xen/common/domain.c
index f6f557499660..8078d1ade690 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -693,6 +693,12 @@ struct domain *domain_create(domid_t domid,
         d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
 
         radix_tree_init(&d->pirq_tree);
+
+        err = -ENOMEM;
+        d->iomem_caps = rangeset_new(d, "I/O Memory", RANGESETF_prettyprint_hex);
+        d->irq_caps   = rangeset_new(d, "Interrupts", 0);
+        if ( !d->iomem_caps || !d->irq_caps )
+            goto fail;
     }
 
     if ( (err = arch_domain_create(d, config, flags)) != 0 )
@@ -711,12 +717,6 @@ struct domain *domain_create(domid_t domid,
         watchdog_domain_init(d);
         init_status |= INIT_watchdog;
 
-        err = -ENOMEM;
-        d->iomem_caps = rangeset_new(d, "I/O Memory", RANGESETF_prettyprint_hex);
-        d->irq_caps   = rangeset_new(d, "Interrupts", 0);
-        if ( !d->iomem_caps || !d->irq_caps )
-            goto fail;
-
         if ( (err = xsm_domain_create(XSM_HOOK, d, config->ssidref)) != 0 )
             goto fail;
 
-- 
2.43.0



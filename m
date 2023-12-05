Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4618C804560
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 03:57:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647387.1010463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rALcz-0004t4-Cy; Tue, 05 Dec 2023 02:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647387.1010463; Tue, 05 Dec 2023 02:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rALcz-0004qt-AA; Tue, 05 Dec 2023 02:57:41 +0000
Received: by outflank-mailman (input) for mailman id 647387;
 Tue, 05 Dec 2023 02:57:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H3q/=HQ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rALcy-0004ql-Iz
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 02:57:40 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d089068-931a-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 03:57:39 +0100 (CET)
Received: from MW4PR03CA0118.namprd03.prod.outlook.com (2603:10b6:303:b7::33)
 by DM6PR12MB4482.namprd12.prod.outlook.com (2603:10b6:5:2a8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Tue, 5 Dec
 2023 02:57:35 +0000
Received: from CO1PEPF000044F0.namprd05.prod.outlook.com
 (2603:10b6:303:b7:cafe::d2) by MW4PR03CA0118.outlook.office365.com
 (2603:10b6:303:b7::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Tue, 5 Dec 2023 02:57:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F0.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Tue, 5 Dec 2023 02:57:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 20:57:27 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 4 Dec 2023 20:57:21 -0600
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
X-Inumbo-ID: 0d089068-931a-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FypOhiJTliSvD4cfr+8Dp8i0Jx+ofybEdqd4CAN0MI+jMRcwEOcVbCDXAjOBGxgkM4SELRI/pG+Ai7EKbrNi/wLtWcduQtDNn1Mlw9Ppc6ebCN1uCySOI69IEfmj83/PjK0qeNTB4avGEbCMvWegwSEPvXlNhL2E4oxCBbwJ276PCJt14vBTSRokd1T3/b3p2FSM7DHDegq7LBgKGIThN4lMgkYzwKc00y/dXmTIQTVvMiXHSbLVGGXFDnLS98VOIx6BHYi4/4Z1+2Fm+bEMNDIAPZWYGZI1lhrar2vH7O90YQtUB1s+xUpW7Av6ljPElcd2dJia2AHaRRT3sPOnJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LzxGsfSgseDIFKNBhYmUMDHqo8UtHsN3wMkkk3FOB4=;
 b=CrAKHHDI9q+rAdFg0k2Bad/nJ5EEB6086H/P0r3bytCTx0Sbdi10urqgAotVJ/4yFzZl9NmHqY3g/OwdSVGlr3VbdCKQFGH2PROD6SL1iYfDzyX3+SQVuWDaXmA0seV7N5B0cp8vs0R+ZVl1TLsQTjrZZYbJKenAtRziuShpJ1Z5PL5avmBtlD6Owfyy3vJ03x4h4XJ8dboZxGYQFNDFI3CXyiPtPJjdHCNsbs9ulnEQcHJO32PpShwHqeGt1PoaeWQjeSUpEIQ1HxT3t6m/UwZ3n56vvCub3kcunMSM2zSmwCzG9nj18Wovpm5lZdO7cniegNsUT3PPsbahz4MVAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LzxGsfSgseDIFKNBhYmUMDHqo8UtHsN3wMkkk3FOB4=;
 b=Wmotc7pY38wu0JKlvaJQgCxVAJG520wdXxg6hyTGRMTFOsa8JwjWPAcYmYWn3MIK9P4BjQw3YmlJrmL1OoHoO26cRMOpcl36c+yTD3b5GERuZvnxiI7eMxrnjYxCpxK5JwBDL0nhPaX57C38tLkPcF88nROTpl7IYO2EFfqT5ss=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>
Subject: [PATCH v11.2 16/17] xen/arm: vpci: permit access to guest vpci space
Date: Mon, 4 Dec 2023 21:57:14 -0500
Message-ID: <20231205025716.3654662-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <4920dfd5-38b2-4122-8108-508aa643ddf6@amd.com>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com> <20231202012556.2012281-17-volodymyr_babchuk@epam.com> <5bb1afc3-6de4-4b78-85a4-2610f5f1d001@suse.com> <4920dfd5-38b2-4122-8108-508aa643ddf6@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F0:EE_|DM6PR12MB4482:EE_
X-MS-Office365-Filtering-Correlation-Id: d2a5cefb-0204-4bf0-4fce-08dbf53deeba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y24CayYa/P8SCOB4tQCLuQIKS5/BlWEJWF1/pcUbj0t332xKrTQsDwDD+HrRazT7VpAbdpNu/aiCTJV8iubZozkN9OpdbcgZxWPi4fCLmahABs36kc/73X53yhPpw64McCuvYK/MQkcFI2I7FCnWVqjDO+WYWBMrQZpo5gaIdpeTQji5hGtTsOGD6dQC9iSzW4r6PHoSkOLc3e1l3Rqdg/tm7AijQb1FN4pziYKx6GQWCu3sZAWJa+qdzP0QYl16jc56hGpa23a6qa13KKaivDb4GXlJEG8nHSsj/arJG2ks8EvwtPgk62/5wN/UaUKDakkhW7FGwtZcFu/wcWlAyxzZ2YCgYohbLggnS79JDkcTwmsIaz0VyZiAp7J5VXtkgIhT7TxTMJmQOJFWsbdPY8HsxHcgWeeUP/Q35dAOT2Z7Kko+dTuwdvRGXoaNb0L19zNgYSQ0f9Jx4scMaUMK1xY9WlmTF3S5jgf/wrDt/J1fcoGsRKKj9yibS6PzRVY97mMaeVb3e4OSLLSf50wwDK2ai7Lp+oKopGRnv6i0EN6Td+XcmszaxX2ub5ioAw6KoiS91sJpCjD60sJKRWn/Xt9XvrkW3Tr5ZJd8sU0cnQOuYzTsHXIBENjEBKFEVN6bK3Qk9pCQNkVsVoSUgCnsuZP+rzZ8ceVauJHYsEDA0HbHR6Cx6kiKEAu43GYEIBQ5sDI+kd03usNzuKyKEBUIuHaDeWB0WI8fJNqHGuScH1WptgbEzEpFmteI+R0gyLKRinAqp0sJZDsxLYkAC4l0/Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(346002)(376002)(230922051799003)(64100799003)(186009)(1800799012)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(86362001)(36756003)(44832011)(40460700003)(5660300002)(2906002)(41300700001)(2616005)(40480700001)(1076003)(83380400001)(82740400003)(26005)(426003)(336012)(478600001)(6666004)(356005)(47076005)(81166007)(36860700001)(8936002)(70586007)(54906003)(6916009)(70206006)(316002)(8676002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 02:57:34.8336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a5cefb-0204-4bf0-4fce-08dbf53deeba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4482

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
 xen/arch/arm/vpci.c |  9 +++++++++
 xen/common/domain.c | 10 +++++-----
 2 files changed, 14 insertions(+), 5 deletions(-)

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
index 9b8902daa305..57f4578f7f7e 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -693,6 +693,11 @@ struct domain *domain_create(domid_t domid,
         d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
 
         radix_tree_init(&d->pirq_tree);
+
+        d->iomem_caps = rangeset_new(d, "I/O Memory", RANGESETF_prettyprint_hex);
+        d->irq_caps   = rangeset_new(d, "Interrupts", 0);
+        if ( !d->iomem_caps || !d->irq_caps )
+            goto fail;
     }
 
     if ( (err = arch_domain_create(d, config, flags)) != 0 )
@@ -711,11 +716,6 @@ struct domain *domain_create(domid_t domid,
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



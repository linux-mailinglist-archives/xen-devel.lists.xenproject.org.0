Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4684E7BEB19
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 21:59:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614457.955549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpwOW-0003v1-Py; Mon, 09 Oct 2023 19:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614457.955549; Mon, 09 Oct 2023 19:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpwOW-0003sC-Lw; Mon, 09 Oct 2023 19:58:24 +0000
Received: by outflank-mailman (input) for mailman id 614457;
 Mon, 09 Oct 2023 19:58:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rjZ2=FX=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qpwOV-0003Ue-GX
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 19:58:23 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31fde5ea-66de-11ee-9b0d-b553b5be7939;
 Mon, 09 Oct 2023 21:58:21 +0200 (CEST)
Received: from MN2PR12CA0011.namprd12.prod.outlook.com (2603:10b6:208:a8::24)
 by DM4PR12MB6277.namprd12.prod.outlook.com (2603:10b6:8:a5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Mon, 9 Oct
 2023 19:58:17 +0000
Received: from BL6PEPF0001AB54.namprd02.prod.outlook.com
 (2603:10b6:208:a8:cafe::f6) by MN2PR12CA0011.outlook.office365.com
 (2603:10b6:208:a8::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36 via Frontend
 Transport; Mon, 9 Oct 2023 19:58:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB54.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Mon, 9 Oct 2023 19:58:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 14:58:16 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 9 Oct 2023 14:58:14 -0500
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
X-Inumbo-ID: 31fde5ea-66de-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X98xNMBmrTWnBRF/PrQMksTjP8Ww9l7DhxPVIrTMb0qhdX34siUTpiqOvplT3+9kk+BZsMklLZtgsbsJxtuJxcUHEUT9dRfdWjyG/x72aQ7PKILsTsOnY93h7W6M8o1i87KYzV+/mJ7ypAvSDcPNt7C7m9TvRxRMdFoYcWnKfof8tP52/MulZQGlfrGpDd1s7k8tBnEhcsbffPeUg5JLHQGIWb1Bw3kZB+Ra5xlNUuom1p5BCS8DhIQi8Pq7baWcAd+PON62UWZ21vSEhhaDNaMGCULhyKnQ6w15MQlveNo/pdDp9WG6VmlJolOOQVOEe/83WSjBY9JFI+KgvNT2Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmlGqKWuCnjtMUmBTT4XxuCpBI3jirRl8+SAumX9cok=;
 b=ZQqI+mAJ0N1Hp1G9+KNw7nn5vPqp56HjgteOaXvbsRoVzb+uBYV1IGAZPHqCrThxlee8KprxdVUehT3O2wiCP+kl54LC4TepGXfT1qDJrKmQCfADpC4bVioMHdSxUBfprXkIsyGf1OHB3fLMNiJaDsmP5Ik0p9PrU1yo8KbEbQU5otZnSDT2ROeWb51/LgXKRPhIdKcmAjONm0GpKMf8uCKRkJkOcUxu22ZrzZwZbnk+pghs5EkDap+XdrqU0YAAyktBjqLHFuIgEPNFiMG4A/+qxayJKpSWoVtMBcNIPiJMoaVD22IoTLBGWRDQG/2DcAVeyUNWLXGdduLRBJ/UxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmlGqKWuCnjtMUmBTT4XxuCpBI3jirRl8+SAumX9cok=;
 b=TDcyOLKfGKn7fSuxu9WtSMZcpyI1o+SSUCnqTZ/ErUQwMsvWZdBEw3/WPqRIkxAEU8AoyDcuqXQ30DrKj5bp4VGl9knlyfQn0tYbxYuEgvMzxWnuofWLT9F6JSVF9vvsVsKXpocM/29w7BoH93IBgSI0KJzOc1y5tJhSe8qkl5w=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 2/5] xen/arm: pci: plumb xen_arch_domainconfig with pci info
Date: Mon, 9 Oct 2023 15:57:41 -0400
Message-ID: <20231009195747.889326-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231009195747.889326-1-stewart.hildebrand@amd.com>
References: <20231009195747.889326-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB54:EE_|DM4PR12MB6277:EE_
X-MS-Office365-Filtering-Correlation-Id: 6640b990-1e25-4928-6937-08dbc9021498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oA8S9neqiZOn8F+7xLbug+1XADmhxrFbnUqtBM9F3nEO6v/esyxHcb1ZoZRwwF3hEq0BXD2nm5sPzpWe86BYFRElyDXWteQn8hIrIQzLottSyJOIrj7itS8ktqvzUGsaMX9GyctsybcvU9LKFXTGSMYKg7mGyUZiKSzI7dKshzSbyQmUKDLjQqMHErhBciGCWG8kGA2Ww0fMfu9tnrYpIrHKaF0TMAQtoZJQerjVQjIlcAv/0bkZTpKWKle2gEic0CKPtIFPjWXNo8Zw58y7TBGPeJSAKfuljXVwnJUVmJ4iZ5h8WE7Wmc/eVdU2JrfBQ0GGmd3GSW8/a0R2FdjXjvUQ0n4Z1TAEf7rmn/b/zE/ezcEP7/yRIpdhlITnZKTgVlsK0wOlz5beIsvmZDyG8hBFO9BQm/b5j5Zdg+b1/gYRUp1eLVNdT1LKftjI7T9rfI6T0taEWaIO9VNoAcETOzj2/6H99ofmByL64+3AsrCDodMjur9xBPEGcUubA4Dk//clL51sWf0W+a3jIK3Hhb9V6T3LXL6ZxMfLlnGI6VFn6sU9+lAk9Ls9FbV2vcvZDOu9qrdZSLhmBkq6dWtmGPa5vEPBS0R36qBF4tSR3MEy8LfYn/yFBh6a2FPkSoGqnNl2lEzdSvlOnZUQs9AC8na8RLfnP7NyUwKQapQv8+4LkwSO4mF/2TXdUEljgp3nn08TYqkidhsoMSMR9UWhagYYWSaG2rIt8kdQ3xuUOmjX5ii1BTsCCbAfLLkQ3MSSL3BzpLV8ZP3Bnl1lhdO36w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(82310400011)(451199024)(64100799003)(186009)(1800799009)(36840700001)(46966006)(40470700004)(86362001)(82740400003)(81166007)(356005)(36756003)(40460700003)(2906002)(40480700001)(478600001)(4326008)(44832011)(41300700001)(5660300002)(8936002)(8676002)(336012)(426003)(1076003)(2616005)(54906003)(83380400001)(6916009)(7416002)(70586007)(70206006)(6666004)(316002)(26005)(36860700001)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 19:58:17.5238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6640b990-1e25-4928-6937-08dbc9021498
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB54.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6277

Add a flag to struct xen_arch_domainconfig to allow specifying at domain
creation time whether the domain uses vPCI.

Add a corresponding flag to struct arch_domain to indicate vPCI and set it
accordingly.

Bump XEN_DOMCTL_INTERFACE_VERSION since we're modifying struct
xen_arch_domainconfig.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v2->v3:
* new patch
---
 xen/arch/arm/domain.c             | 10 ++++++++++
 xen/arch/arm/include/asm/domain.h |  2 ++
 xen/include/public/arch-arm.h     |  4 ++++
 xen/include/public/domctl.h       |  2 +-
 4 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 28e3aaa5e482..9470c28595da 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -687,6 +687,13 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
+    if ( (config->arch.pci_flags & XEN_DOMCTL_CONFIG_PCI_VPCI) &&
+         !IS_ENABLED(CONFIG_HAS_VPCI) )
+    {
+        dprintk(XENLOG_INFO, "vPCI support not enabled\n");
+        return -EINVAL;
+    }
+
     return 0;
 }
 
@@ -737,6 +744,9 @@ int arch_domain_create(struct domain *d,
         BUG();
     }
 
+    if ( config->arch.pci_flags & XEN_DOMCTL_CONFIG_PCI_VPCI )
+        d->arch.has_vpci = true;
+
     if ( (rc = domain_vgic_register(d, &count)) != 0 )
         goto fail;
 
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 99e798ffff68..0a66ed09a617 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -119,6 +119,8 @@ struct arch_domain
     void *tee;
 #endif
 
+    bool has_vpci;
+
 }  __cacheline_aligned;
 
 struct arch_vcpu
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 6a4467e8f5d1..5c8424341aad 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -300,6 +300,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
 #define XEN_DOMCTL_CONFIG_TEE_FFA       2
 
+#define XEN_DOMCTL_CONFIG_PCI_VPCI      (1U << 0)
+
 struct xen_arch_domainconfig {
     /* IN/OUT */
     uint8_t gic_version;
@@ -323,6 +325,8 @@ struct xen_arch_domainconfig {
      *
      */
     uint32_t clock_frequency;
+    /* IN */
+    uint8_t pci_flags;
 };
 #endif /* __XEN__ || __XEN_TOOLS__ */
 
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index a33f9ec32b08..dcd42b3d603d 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -21,7 +21,7 @@
 #include "hvm/save.h"
 #include "memory.h"
 
-#define XEN_DOMCTL_INTERFACE_VERSION 0x00000016
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
 
 /*
  * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
-- 
2.42.0



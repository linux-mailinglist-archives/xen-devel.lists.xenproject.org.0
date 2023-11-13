Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7207EA603
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 23:22:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632039.985945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2fKQ-0005Ai-Sd; Mon, 13 Nov 2023 22:22:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632039.985945; Mon, 13 Nov 2023 22:22:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2fKQ-00057d-Of; Mon, 13 Nov 2023 22:22:46 +0000
Received: by outflank-mailman (input) for mailman id 632039;
 Mon, 13 Nov 2023 22:22:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GGJv=G2=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r2fKO-0003AY-V2
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 22:22:44 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29e8ae9f-8273-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 23:22:43 +0100 (CET)
Received: from DM6PR17CA0032.namprd17.prod.outlook.com (2603:10b6:5:1b3::45)
 by DM4PR12MB7622.namprd12.prod.outlook.com (2603:10b6:8:109::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Mon, 13 Nov
 2023 22:22:40 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:5:1b3:cafe::20) by DM6PR17CA0032.outlook.office365.com
 (2603:10b6:5:1b3::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31 via Frontend
 Transport; Mon, 13 Nov 2023 22:22:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.17 via Frontend Transport; Mon, 13 Nov 2023 22:22:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 13 Nov
 2023 16:22:39 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Mon, 13 Nov 2023 16:22:37 -0600
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
X-Inumbo-ID: 29e8ae9f-8273-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWYClh4hTL/FLVAJFTI6oCEu7E7UlbLt2cet+3xz8nAmMh6AFk/+2TH9Pgq9S9xwcMrlnmx9S+mOc28NSQaIvCX8ZJlEprkR9E/2L8Y+5THM6TiqqYbPmQuW+jeSJ46BTdit5NX293Hn5Luo6QF5vc8fcqHB2oRou2QmCPXXJtumW+3b5dY1x4RRuNjhec3i2h57tkNWcI21ULb93RpvH7dxm0CUcAhBoiQA1UhRMwt+Tj1fFEsJuwEIawKjFOUpiIUWFAPM0wwpgKCIxiZMksqCZzu69IonNPhn+AxB4FAcI6h5CYA5sFcCqPE6LdB/pXwrL0HTzNEhYvT9i20yUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRtH1sA7/5vWe50OKi+KB9WviVia/tPm/aYWYnTd8Ys=;
 b=IY0CTHoU61GvM+82obBMnaBPYGYgtycsHqlVgjE4BJ1fPk5gmTJvMYSLVqMltR+BT1XlyHZBXtFAYsMG12EBdBAPGJpYWalmjbLWxiyV6eMSdAn5yLEYCEVnZE2uL7F3Tua7oj+S8fXfVp/XJIQSF0/ix7+CSQ6cU23sijcHtCX9qpse98BM+hrDE8Z6tkNCNiqOdahhRGoPTrPfrchj9y3W9AKsRr8vLKoHWSQuAP5u6+gUOh6XZGW7aVr4Wr8/URBkxiqba4+E+MAIMTxPHIWs+McWBAOIX4LBcQUMcaDeYWhLWv7EFFqhIlwn6VnIXXgw4q5A3rzUc79Tyr/Qfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRtH1sA7/5vWe50OKi+KB9WviVia/tPm/aYWYnTd8Ys=;
 b=kY7DFeCu1bag8WnRffkPNkDR/zU5IbA5Fgv5E2/gvG/vu025rPJ2iG2uh1L2dyH/18LmToY8P92vUM7ZkuDt+iVbDYNHTPh6g5h1z79PxETmYk5sJTF1GxdkcInxdkMDShICOMKk4lvEIOeT/zQ26OjCP2kpaKuYGKeTFfznY0c=
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
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Paul Durrant
	<paul@xen.org>
Subject: [PATCH v6 4/5] [FUTURE] xen/arm: enable vPCI for domUs
Date: Mon, 13 Nov 2023 17:21:13 -0500
Message-ID: <20231113222118.825758-5-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113222118.825758-1-stewart.hildebrand@amd.com>
References: <20231113222118.825758-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|DM4PR12MB7622:EE_
X-MS-Office365-Filtering-Correlation-Id: e78f6172-eba5-44e3-5599-08dbe4970c61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ApdUP6HIEY8XQhQyptHPBHF1ncE6dAnw/+j6FE+I5yBKeGSUaCb6QBffuFTHx4l5eqt9RLYY9SxVrG1JpXL6Yff9dw3YriJZbizIzxF4b7Kd4utKui7Cm0Ci+Nk1UfMKn3t7QqnV4/zqZSyubJMuPccyIuKAckFXjEhT9OAIF/GXqSG9hWCyGwuwVMAyXrLSRlKDHkcgHrqQY5zubW5WhUlIpx1E89+VybGkB6JU+Fyx3NghEkepKcSppuDk54OV3ZM5e+XWnAoS1LGFrh3KXJJ9hklbZOh8Z5mjyZicFDqK/nXYv6GH22fsxWGLA223t+BmkouCNmqIIj5aw01xvb3UOUGtXxLwMqcZD9mzAEimjnBibWhZntaBU9/rMDOqKvQF48+YM4/waf2cvetv3oItoTrLZzoSMbFy6pj1PwjU1wcSViPxuCKs4yTUybwkUKu/JB0RHpzz5IIHZ1kjH3wj+1HtZKUKISODjij1NJr5tQ+885ngEdCCdHkealUWPK8KRBoRxceK/ik4y8+3VC56k7GVb4fSYKwggBV2jh+0jABZP9Yuol4Il+Vhoa8TvtMqQ0BZp+fsIfddCTJMfrhs6LHCByE/XUYLbYg8lJS9nu+gJN2YlnVqO8bGaSN0dFvx+CxiIXtRbidADBz2Hrr/p+Yh6O7wnbj63nkxq95kcf+LRpAXiXls1G3aVC/o329EyoTovEMbB5ZDNJ34sveHlUXEhQ7xRIDCgibqATVPEC7UG2OtFAI1Mv8iZ0l0dPyxxyIQ2RohG4ehfLXJ3CjEta7L5RFRxaZv+Dilckk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(376002)(39860400002)(230173577357003)(230922051799003)(230273577357003)(1800799009)(82310400011)(186009)(451199024)(64100799003)(36840700001)(46966006)(40470700004)(81166007)(36860700001)(36756003)(356005)(426003)(41300700001)(83380400001)(336012)(40460700003)(47076005)(7416002)(86362001)(4326008)(1076003)(40480700001)(8936002)(8676002)(5660300002)(2616005)(44832011)(316002)(6666004)(6916009)(82740400003)(26005)(2906002)(966005)(70206006)(54906003)(478600001)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 22:22:40.1175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e78f6172-eba5-44e3-5599-08dbe4970c61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7622

Select HAS_VPCI_GUEST_SUPPORT in Kconfig for enabling vPCI support for
domUs.

Add checks to fail guest creation if the configuration is invalid.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
As the tag implies, this patch is not intended to be merged (yet).

Note that CONFIG_HAS_VPCI_GUEST_SUPPORT is not currently used in the
upstream code base. It will be used by the vPCI series [1]. This patch
is intended to be merged as part of the vPCI series. I'll coordinate
with Volodymyr to include this in the vPCI series or resend afterwards.
Meanwhile, I'll include it here until the Kconfig and
xen_domctl_createdomain prerequisites have been committed.

v5->v6:
* drop is_pvh_domain(), simply make arch_needs_vpci() return false on
  x86 for now
* leave has_vpci() alone, instead, add HAS_VPCI_GUEST_SUPPORT check in
  domain_create

v4->v5:
* replace is_system_domain() check with dom_io check
* return an error in XEN_DOMCTL_assign_device (thanks Jan!)
* remove CONFIG_ARM check
* add needs_vpci() and arch_needs_vpci()
* add HAS_VPCI_GUEST_SUPPORT check to has_vpci()

v3->v4:
* refuse to create domain if configuration is invalid
* split toolstack change into separate patch

v2->v3:
* set pci flags in toolstack

v1->v2:
* new patch

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00660.html
---
 xen/arch/arm/Kconfig              |  1 +
 xen/arch/arm/include/asm/domain.h |  2 ++
 xen/arch/arm/vpci.c               |  8 ++++++++
 xen/arch/x86/include/asm/domain.h |  2 ++
 xen/common/domain.c               |  5 +++++
 xen/drivers/passthrough/pci.c     | 20 ++++++++++++++++++++
 6 files changed, 38 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 5ff68e5d5979..3845b238a33f 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -195,6 +195,7 @@ config PCI_PASSTHROUGH
 	depends on ARM_64
 	select HAS_PCI
 	select HAS_VPCI
+	select HAS_VPCI_GUEST_SUPPORT
 	default n
 	help
 	  This option enables PCI device passthrough
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 3614562eaefe..8e6d5fe9578c 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -31,6 +31,8 @@ enum domain_type {
 
 #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
 
+#define arch_needs_vpci(d) ({ (void)(d); true; })
+
 /*
  * Is the domain using the host memory layout?
  *
diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 3bc4bb55082a..61e0edcedea9 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -2,6 +2,7 @@
 /*
  * xen/arch/arm/vpci.c
  */
+#include <xen/lib.h>
 #include <xen/sched.h>
 #include <xen/vpci.h>
 
@@ -90,8 +91,15 @@ int domain_vpci_init(struct domain *d)
             return ret;
     }
     else
+    {
+        if ( !IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) )
+        {
+            gdprintk(XENLOG_ERR, "vPCI requested but guest support not enabled\n");
+            return -EINVAL;
+        }
         register_mmio_handler(d, &vpci_mmio_handler,
                               GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, NULL);
+    }
 
     return 0;
 }
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index cb02a4d1ebb2..d34015391eed 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -503,6 +503,8 @@ struct arch_domain
 #define has_vpit(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIT))
 #define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
 
+#define arch_needs_vpci(d) ({ (void)(d); false; })
+
 #define gdt_ldt_pt_idx(v) \
       ((v)->vcpu_id >> (PAGETABLE_ORDER - GDT_LDT_VCPU_SHIFT))
 #define pv_gdt_ptes(v) \
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 12dc27428972..47d49c57bf83 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -692,6 +692,11 @@ struct domain *domain_create(domid_t domid,
 
     if ( !is_idle_domain(d) )
     {
+        err = -EINVAL;
+        if ( !is_hardware_domain(d) && (config->flags & XEN_DOMCTL_CDF_vpci) &&
+             !IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) )
+            goto fail;
+
         if ( !is_hardware_domain(d) )
             d->nr_pirqs = nr_static_irqs + extra_domU_irqs;
         else
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 04d00c7c37df..2203725a2aa6 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1542,6 +1542,18 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev)
     pcidevs_unlock();
 }
 
+static bool needs_vpci(const struct domain *d)
+{
+    if ( is_hardware_domain(d) )
+        return false;
+
+    if ( d == dom_io )
+        /* xl pci-assignable-add assigns PCI devices to domIO */
+        return false;
+
+    return arch_needs_vpci(d);
+}
+
 int iommu_do_pci_domctl(
     struct xen_domctl *domctl, struct domain *d,
     XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
@@ -1618,6 +1630,14 @@ int iommu_do_pci_domctl(
         bus = PCI_BUS(machine_sbdf);
         devfn = PCI_DEVFN(machine_sbdf);
 
+        if ( needs_vpci(d) && !has_vpci(d) )
+        {
+            printk(XENLOG_G_WARNING "Cannot assign %pp to %pd: vPCI support not enabled\n",
+                   &PCI_SBDF(seg, bus, devfn), d);
+            ret = -EPERM;
+            break;
+        }
+
         pcidevs_lock();
         ret = device_assigned(seg, bus, devfn);
         if ( domctl->cmd == XEN_DOMCTL_test_assign_device )
-- 
2.42.0



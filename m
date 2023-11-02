Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAF67DFB28
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 21:01:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626982.977789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qydsH-00019I-Ih; Thu, 02 Nov 2023 20:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626982.977789; Thu, 02 Nov 2023 20:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qydsH-00016H-Er; Thu, 02 Nov 2023 20:01:05 +0000
Received: by outflank-mailman (input) for mailman id 626982;
 Thu, 02 Nov 2023 20:01:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mhp2=GP=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qydsG-0000bG-4j
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 20:01:04 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20616.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8be6b2d9-79ba-11ee-9b0e-b553b5be7939;
 Thu, 02 Nov 2023 21:01:02 +0100 (CET)
Received: from BL1PR13CA0360.namprd13.prod.outlook.com (2603:10b6:208:2c6::35)
 by IA1PR12MB7541.namprd12.prod.outlook.com (2603:10b6:208:42f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Thu, 2 Nov
 2023 20:00:59 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:2c6:cafe::9c) by BL1PR13CA0360.outlook.office365.com
 (2603:10b6:208:2c6::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.10 via Frontend
 Transport; Thu, 2 Nov 2023 20:00:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Thu, 2 Nov 2023 20:00:58 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 2 Nov
 2023 15:00:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 2 Nov
 2023 15:00:57 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 2 Nov 2023 15:00:55 -0500
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
X-Inumbo-ID: 8be6b2d9-79ba-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JhC1Xqda0VQs9o3OAKU2bam7Lru7yhRI1Q5wJs7bzaO1x//tpVHlfBUGSZAOfqkT0PiQqQs3IY46sVwyTVl2b4cUy330Rcu4VxryPknt0QcpO5vGsx88C2uFFZY5ftvEEn7tOFMtukCJc/59X6Dc8h+cPpDr4yMeh2puLDeh3TPs0tC66xiU0i7z9ZZnMPLWPWtm4AIzpobPNffsPoVpGhOmnn9CD4RuU6QHGec95Fc1Jq4UtH6aLx+v5TTuI9WTP/rp+2jPfyL1idkKhxzqdhSaxoklptUDkNp2uzYqT4jwgMEa/5x+Txqnw99Ljg+ppR+8b4YmViapCCNREPlpOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swMECjZS0pFwEUksinFcexGL91Xa93viRgwHU+0cU2I=;
 b=PwFtVg0uWWlatN90I5bHjua3k6CWJSeCO0Yr96l+WPjdYjKBZkRWJTHeR4y3CQ3ZjoLE09mdWdM2SEpEpyW+SKbr6HnHGgzm8C40JfU+aA76jver3+9nKRzgTdox6Nc8xLiZOXhrIrcPX0NFMVjpsVYxqOTLWLObCFD8cOdlpfwVqG2nh7tWTluSNlcgQ2b5S1jWZ1skMuU48l4rHWhpWqdW1RJWnJKQmxqyfPavJl7R9OZocezuY4+iIyH/5Ip6W3C9kRTMqQylazNyHqlqrLiV0QYHzwutSU9cjZPtStmyW48P3EerUZV5R8kUAQfjfT3c7rIDn9eRk1v2tKlPtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swMECjZS0pFwEUksinFcexGL91Xa93viRgwHU+0cU2I=;
 b=4woCjpPIvNUMn5ksRorRAVlHU+U0VRJkG75R99b4RGHq4dSGxo4Mdm6DYHwvm0+palIhNElQf4qkMPq0Mdd+S/S6I9v48+id7NkOJj/hlqDx+ziXBS74gTRCG+lxGd61lJE4MRBOsWZRkXQGbcl3TtolHoLvymlgpZoa8vMjh1s=
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
	<wl@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v5 4/5] [FUTURE] xen/arm: enable vPCI for domUs
Date: Thu, 2 Nov 2023 15:59:32 -0400
Message-ID: <20231102195938.1254489-5-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102195938.1254489-1-stewart.hildebrand@amd.com>
References: <20231102195938.1254489-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|IA1PR12MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: c603b87c-47c4-4e5e-7942-08dbdbde6ea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gf8JQMyGH+OItyujxTR+aGr4hTXGE/mNB1vGaot8KoZvwt4DxCW1SocRjzhmpgc90xikHJfpecP12ztiZiINxZkh2l+yL0Tt7ij5dfOWDsBxF2X+4ae+5qzXgZNrscn/qwOFRzIrLpHmgE+6iDko5kv/P28NVtvpiEDeEP06toIdB2zdU50ZH3KXvwIxr8fDlUAO3fzhUcvpC8MrHLocZAZDRHSL7tEVdVuaqJFBOjcQix38uP1pzAJCbfmJhZt6HyKn/iXxhQeOapHaGeGQgXulGHDOXWP5VF/R40i6PvzlKVOZukuIKiIyIYfi7Ez77FkjA5jVxuQ+p2/mr4CfrIvEvvOemK8GeGs/yVdftlRVgg3kPBAs+VvySFma+vd/AnmF3L4Gdivqx8XK8LiVuGukZN+rgH6ZN3gm7vsg1Q/CKqVXf57SQRK4l4Nmkol/t+jrtcn/wbkOz07iWEyQlsw8Arz0LvIQkLuuDXiBvN/mb9Nqe6EMPLFL58X/QGig4sbt+lojfSwdiew3VWy8GCHOxIZQxLwQ/1fpDd4/t2PLDzBPRK4puiD7F+mqXXy8kzlFeyB7R1sBcdJUYE43ykaHVkO1KuUCXZ0vWjtGWRbZJ3wFpsQlwgHJNyRVYwSVZC7UXBB2o59E1AryLF/KPb9hsg7X9CzPy1Rx3lOWk9GTg8adRzRHDtmcbXi7JDZ6Gp8hWiizaQ3cJ2T68eepbtts+VMJNsb9CGqaFKwDExZSP6YnPPIwy0E4If2HUkqc3oxNdSBsacE9pt0oN99fWclcDqJ2hpfrLJiQI6b4GmQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(396003)(39860400002)(230922051799003)(230173577357003)(230273577357003)(64100799003)(82310400011)(186009)(451199024)(1800799009)(40470700004)(36840700001)(46966006)(40480700001)(40460700003)(83380400001)(47076005)(26005)(336012)(1076003)(81166007)(356005)(36860700001)(70206006)(70586007)(426003)(7416002)(5660300002)(54906003)(6916009)(4326008)(8676002)(8936002)(44832011)(316002)(41300700001)(6666004)(2616005)(966005)(2906002)(478600001)(36756003)(86362001)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 20:00:58.6365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c603b87c-47c4-4e5e-7942-08dbdbde6ea4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7541

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
 xen/arch/x86/include/asm/domain.h |  9 +++++++++
 xen/drivers/passthrough/pci.c     | 20 ++++++++++++++++++++
 xen/include/xen/domain.h          | 13 +++++++++++--
 6 files changed, 51 insertions(+), 2 deletions(-)

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
index be9ed39c9d42..e4b4a12233f0 100644
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
index cb02a4d1ebb2..57bbe842e18d 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -503,6 +503,15 @@ struct arch_domain
 #define has_vpit(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIT))
 #define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
 
+#define is_pvh_domain(d) ({                                  \
+    unsigned int _emflags = (d)->arch.emulation_flags;       \
+    IS_ENABLED(CONFIG_HVM) &&                                \
+        ((_emflags == X86_EMU_LAPIC) ||                      \
+         (_emflags == (X86_EMU_LAPIC | X86_EMU_IOAPIC))); })
+
+/* PCI passthrough may be backed by qemu for non-PVH domains */
+#define arch_needs_vpci(d) is_pvh_domain(d)
+
 #define gdt_ldt_pt_idx(v) \
       ((v)->vcpu_id >> (PAGETABLE_ORDER - GDT_LDT_VCPU_SHIFT))
 #define pv_gdt_ptes(v) \
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
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index ab8f06c5f6a2..c3364d6e2e44 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -51,8 +51,17 @@ void arch_get_domain_info(const struct domain *d,
 
 #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
 
-#define has_vpci(d) (((d)->options & XEN_DOMCTL_CDF_vpci) && \
-                     IS_ENABLED(CONFIG_HAS_VPCI))
+#define has_vpci(d) ({                                                        \
+    const struct domain *_d = (d);                                            \
+    bool _has_vpci = false;                                                   \
+    if ( (_d->options & XEN_DOMCTL_CDF_vpci) && IS_ENABLED(CONFIG_HAS_VPCI) ) \
+    {                                                                         \
+        if ( is_hardware_domain(_d) )                                         \
+            _has_vpci = true;                                                 \
+        else if ( IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) )                 \
+            _has_vpci = true;                                                 \
+    }                                                                         \
+    _has_vpci; })
 
 /*
  * Arch-specifics.
-- 
2.42.0



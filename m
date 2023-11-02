Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CF47DFB26
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 21:00:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626978.977770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qydrp-0000IE-Ub; Thu, 02 Nov 2023 20:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626978.977770; Thu, 02 Nov 2023 20:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qydrp-0000Fd-O2; Thu, 02 Nov 2023 20:00:37 +0000
Received: by outflank-mailman (input) for mailman id 626978;
 Thu, 02 Nov 2023 20:00:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mhp2=GP=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qydrn-0008L9-SW
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 20:00:35 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b0b667d-79ba-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 21:00:34 +0100 (CET)
Received: from CH0PR13CA0031.namprd13.prod.outlook.com (2603:10b6:610:b2::6)
 by DM6PR12MB4236.namprd12.prod.outlook.com (2603:10b6:5:212::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Thu, 2 Nov
 2023 20:00:28 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::73) by CH0PR13CA0031.outlook.office365.com
 (2603:10b6:610:b2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.10 via Frontend
 Transport; Thu, 2 Nov 2023 20:00:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Thu, 2 Nov 2023 20:00:26 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 2 Nov
 2023 15:00:25 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 2 Nov
 2023 15:00:25 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 2 Nov 2023 15:00:23 -0500
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
X-Inumbo-ID: 7b0b667d-79ba-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DN4Og5+Klkd9Sx4lqt2+f+JCPw/RKx9eVwNoI9HRq74u79pN3aRhOBpYG2DcIGY5ZX9+PJBusR1x2tEJt296LlbIaD37b+wTJpRlVl4s8quubr+EOVJ2rC8BXC23dzEFfVGoJZiRzb/t83BlR1TdwNN6prFOVCm5dgB917m65u4DE2R3p5xQkRm4cBLheINWiSy76Y5xnrA+Fee6Us2Sfhjp8oAA5FzjDss1gyR0vexsbkqqAA1l3RhOz8DLpokD6ws+qTBIXdDjDKp940w+Bar2AIhHGfGFyqKeNWYi0yASXp34+X4Q3BnaazylOuOgQ/n29S5yA9HuO6bC/teWbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjnO2W6+4f0rPNUpLRFrSyi97Jq1KFFGDsynMmfMRLg=;
 b=E+4d1JqC3f5OOblUHjVXVgRsUNavU8GUaQiTMUBpZEI2rQCQ/9Lx4oq1OQxpqA73MlSMofo2e3oX6lIM6AKa3R6kO4ptK1fSpoRkccXXTbjQ4dx/zVd4gqXozKxVS4AQV4cWtfsQsCBZYeBTkbaXQ2/q+LaqPp3x6Plp2e7bS5x7I6l/uzQT+8xrH3G/+CzZ+pss9GtvPZap5/ivNXE5y7RljaeWO8muJ/Sk6AAwxtGioRjlnLE1HqcqJGZIwOpf8FhvsQ2/gjY0JWC4XU4hZKsdlRsLXzVnBQ6p2zocx8bCPTsJrVDle96j7qg1YiOhjvY5JgIJfIceL3R65Z6jTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjnO2W6+4f0rPNUpLRFrSyi97Jq1KFFGDsynMmfMRLg=;
 b=Sybzzpe8q+VbPEMoL91aphg1T7qenSB8N9S4nzJEYcqU9ow0alSX3ztjDEzqJBxBHrd0Azsa/imOajjUqpORkBr+smPE3jjfmK/7acUj8GleJEn2oElngkpTRGNdZvum8ZKfw9ehweaq6S73fL/bxd4n3au78rXifxQBpwaFWFk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Oleksandr
 Andrushchenko" <oleksandr_andrushchenko@epam.com>, Rahul Singh
	<rahul.singh@arm.com>, Christian Lindig <christian.lindig@cloud.com>
Subject: [PATCH v5 2/5] xen/vpci: move xen_domctl_createdomain vPCI flag to common
Date: Thu, 2 Nov 2023 15:59:30 -0400
Message-ID: <20231102195938.1254489-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102195938.1254489-1-stewart.hildebrand@amd.com>
References: <20231102195938.1254489-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|DM6PR12MB4236:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b6b81a3-bd7f-4906-9bfe-08dbdbde5bc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/GMLFyDDCkvyfY8NEgSD2PtpVYL/Z5N/Wg2gVyam0lBbKiDKG10elLbuu4f+Bh67vXvgCSSducKMmHFDlw4oncQZpRTYlNHCnP/CVcmTrHev8UqYds3PoOrSsFhXvwKLY8Grm8n+F6bFoXQjFffAkItq1F6vNCcQy/eHz9hhikwiQLNJfFx8nydWYeF1LcwDRWKNfdwZaDStpsQXwkuL4dEGFPXmASsP3qUnUlbvWV1xCSPrkMjiIqQGP2kHji16VGUoxbsgiEbCjOEV/uVyCXIL5skFsnKDcdn5/Uijo55xSLgFhYtd5ikI9h5Pvrp/O545kCNZHtMr6oEANXtOGg9fkHXrDWVj89wh95chI0DCdzcvd8DNcY+AGNBns1sfjqNtzdyP6Xc17Uz8lV+zZKuiRPLyykX8GqtGV2NoWjhHk9QMQdyRDlkU+pQlfWnvcsueY8T0YWIuXLZ+ZvY1IBqh0z5CaY/mTh6xabSIZ+J7GNzeLnjrE1UzJhhhFDqey1fmx8bESRTZxbEXxeUYV6MnXCSPCGoBdYLbO6tYEL0MtbcgwHivgRRnrPLfd3KIaFa/UV1/8JkdzHdyGBdd+qu47ZlkO47QnUYljHzbl72/60ctckvFqXdaaj7/VXcRECsN1JEGX2XZ93Tib2K12Fw/789JQsbgw0KBmV9KPZXNvfijs1TbBw6oZ/xPxuoIjanpCriouxJ/ZwYVStu1jIIQUXkyflYSGOWznWQ0uMm5nACB6gytGxyyjyg7Po3q1HQHoOK8UWW7jSMDWk84xveNzqWEAWcf/5LDVx8EmC8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(8676002)(5660300002)(7416002)(4326008)(41300700001)(6916009)(54906003)(70206006)(70586007)(316002)(8936002)(30864003)(44832011)(966005)(2906002)(478600001)(40460700003)(6666004)(40480700001)(36860700001)(47076005)(81166007)(356005)(83380400001)(36756003)(1076003)(26005)(336012)(426003)(2616005)(86362001)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 20:00:26.9038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6b81a3-bd7f-4906-9bfe-08dbdbde5bc1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4236

Both x86 and ARM need a way at domain creation time to specify whether
the domain needs vPCI emulation. Move the vPCI flag from x86
xen_domctl_createdomain.arch.emulation_flags to the common
xen_domctl_createdomain.flags.

Move has_vpci() macro to common header.

Bump XEN_DOMCTL_INTERFACE_VERSION since we're modifying flags inside
struct xen_domctl_createdomain and xen_arch_domainconfig.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Acked-by: Christian Lindig <christian.lindig@cloud.com>
---
v4->v5:
* move flags_optional change in xen/arch/arm/domain.c to next patch
* change latter 2 args to emulation_flags_ok() to unsigned int
* move vpci && !hvm check to common code
* remove stray spaces in emulation_flags_ok(), and a minor style fixup
* add CONFIG_HAS_VPCI check into has_vpci()
* add Christian's A-b (OCaml)

v3->v4:
* renamed, was:
  ("xen/arm: pci: plumb xen_arch_domainconfig with pci info")
* reworked: move x86 vPCI flag to common instead of adding another arch
  specific vPCI flag
* folded ("xen/arm: make has_vpci() depend on d->arch.has_vpci") into
  this patch (retain Signed-off-by's from [1] and [2])

v2->v3:
* new patch

[1] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commit/27be1729ce8128dbe37275ce7946b2fbd2e5a382
[2] https://github.com/xen-troops/xen/commit/bf12185e6fb2e31db0d8e6ea9ccd8a02abadec17
---
 tools/libs/light/libxl_x86.c      |  5 ++++-
 tools/ocaml/libs/xc/xenctrl.ml    |  2 +-
 tools/ocaml/libs/xc/xenctrl.mli   |  2 +-
 tools/python/xen/lowlevel/xc/xc.c |  5 ++++-
 xen/arch/arm/include/asm/domain.h |  3 ---
 xen/arch/x86/domain.c             | 13 ++++++++-----
 xen/arch/x86/include/asm/domain.h |  6 +-----
 xen/arch/x86/setup.c              |  4 ++--
 xen/common/domain.c               | 16 +++++++++++++++-
 xen/include/public/arch-x86/xen.h |  5 +----
 xen/include/public/domctl.h       |  7 +++++--
 xen/include/xen/domain.h          |  3 +++
 12 files changed, 45 insertions(+), 26 deletions(-)

diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index d16573e72cd4..ebce1552accd 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -8,13 +8,16 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
 {
     switch(d_config->c_info.type) {
     case LIBXL_DOMAIN_TYPE_HVM:
-        config->arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
+        config->arch.emulation_flags = XEN_X86_EMU_ALL;
+        config->flags &= ~XEN_DOMCTL_CDF_vpci;
         break;
     case LIBXL_DOMAIN_TYPE_PVH:
         config->arch.emulation_flags = XEN_X86_EMU_LAPIC;
+        config->flags &= ~XEN_DOMCTL_CDF_vpci;
         break;
     case LIBXL_DOMAIN_TYPE_PV:
         config->arch.emulation_flags = 0;
+        config->flags &= ~XEN_DOMCTL_CDF_vpci;
         break;
     default:
         abort();
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index d6c6eb73db44..6f3da9c6e064 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -46,7 +46,6 @@ type x86_arch_emulation_flags =
   | X86_EMU_IOMMU
   | X86_EMU_PIT
   | X86_EMU_USE_PIRQ
-  | X86_EMU_VPCI
 
 type x86_arch_misc_flags =
   | X86_MSR_RELAXED
@@ -70,6 +69,7 @@ type domain_create_flag =
   | CDF_IOMMU
   | CDF_NESTED_VIRT
   | CDF_VPMU
+  | CDF_VPCI
 
 type domain_create_iommu_opts =
   | IOMMU_NO_SHAREPT
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 3bfc16edba96..e2dd02bec962 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -40,7 +40,6 @@ type x86_arch_emulation_flags =
   | X86_EMU_IOMMU
   | X86_EMU_PIT
   | X86_EMU_USE_PIRQ
-  | X86_EMU_VPCI
 
 type x86_arch_misc_flags =
   | X86_MSR_RELAXED
@@ -63,6 +62,7 @@ type domain_create_flag =
   | CDF_IOMMU
   | CDF_NESTED_VIRT
   | CDF_VPMU
+  | CDF_VPCI
 
 type domain_create_iommu_opts =
   | IOMMU_NO_SHAREPT
diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
index d3ea350e07b9..e3623cdcb90d 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -159,7 +159,10 @@ static PyObject *pyxc_domain_create(XcObject *self,
 
 #if defined (__i386) || defined(__x86_64__)
     if ( config.flags & XEN_DOMCTL_CDF_hvm )
-        config.arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
+    {
+        config.arch.emulation_flags = XEN_X86_EMU_ALL;
+        config.flags &= ~XEN_DOMCTL_CDF_vpci;
+    }
 #elif defined (__arm__) || defined(__aarch64__)
     config.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
 #else
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 99e798ffff68..be9ed39c9d42 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -298,9 +298,6 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
 
 #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
 
-/* vPCI is not available on Arm */
-#define has_vpci(d)    ({ (void)(d); false; })
-
 struct arch_vcpu_io {
     struct instr_details dabt_instr; /* when the instruction is decoded */
 };
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 3712e36df930..98f0397686cf 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -712,7 +712,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     return 0;
 }
 
-static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
+static bool emulation_flags_ok(const struct domain *d, unsigned int emflags,
+                               unsigned int cdf)
 {
 #ifdef CONFIG_HVM
     /* This doesn't catch !CONFIG_HVM case but it is better than nothing */
@@ -722,11 +723,13 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
     if ( is_hvm_domain(d) )
     {
         if ( is_hardware_domain(d) &&
-             emflags != (X86_EMU_VPCI | X86_EMU_LAPIC | X86_EMU_IOAPIC) )
+             (!(cdf & XEN_DOMCTL_CDF_vpci) ||
+              emflags != (X86_EMU_LAPIC | X86_EMU_IOAPIC)) )
             return false;
         if ( !is_hardware_domain(d) &&
-             emflags != (X86_EMU_ALL & ~X86_EMU_VPCI) &&
-             emflags != X86_EMU_LAPIC )
+             ((cdf & XEN_DOMCTL_CDF_vpci) ||
+              (emflags != X86_EMU_ALL &&
+               emflags != X86_EMU_LAPIC)) )
             return false;
     }
     else if ( emflags != 0 && emflags != X86_EMU_PIT )
@@ -798,7 +801,7 @@ int arch_domain_create(struct domain *d,
         return -EINVAL;
     }
 
-    if ( !emulation_flags_ok(d, emflags) )
+    if ( !emulation_flags_ok(d, emflags, config->flags) )
     {
         printk(XENLOG_G_ERR "d%d: Xen does not allow %s domain creation "
                "with the current selection of emulators: %#x\n",
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 619e667938ed..cb02a4d1ebb2 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -471,7 +471,6 @@ struct arch_domain
 #define X86_EMU_VGA      XEN_X86_EMU_VGA
 #define X86_EMU_IOMMU    XEN_X86_EMU_IOMMU
 #define X86_EMU_USE_PIRQ XEN_X86_EMU_USE_PIRQ
-#define X86_EMU_VPCI     XEN_X86_EMU_VPCI
 #else
 #define X86_EMU_LAPIC    0
 #define X86_EMU_HPET     0
@@ -482,7 +481,6 @@ struct arch_domain
 #define X86_EMU_VGA      0
 #define X86_EMU_IOMMU    0
 #define X86_EMU_USE_PIRQ 0
-#define X86_EMU_VPCI     0
 #endif
 
 #define X86_EMU_PIT     XEN_X86_EMU_PIT
@@ -492,8 +490,7 @@ struct arch_domain
                                  X86_EMU_PM | X86_EMU_RTC |             \
                                  X86_EMU_IOAPIC | X86_EMU_PIC |         \
                                  X86_EMU_VGA | X86_EMU_IOMMU |          \
-                                 X86_EMU_PIT | X86_EMU_USE_PIRQ |       \
-                                 X86_EMU_VPCI)
+                                 X86_EMU_PIT | X86_EMU_USE_PIRQ)
 
 #define has_vlapic(d)      (!!((d)->arch.emulation_flags & X86_EMU_LAPIC))
 #define has_vhpet(d)       (!!((d)->arch.emulation_flags & X86_EMU_HPET))
@@ -505,7 +502,6 @@ struct arch_domain
 #define has_viommu(d)      (!!((d)->arch.emulation_flags & X86_EMU_IOMMU))
 #define has_vpit(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIT))
 #define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
-#define has_vpci(d)        (!!((d)->arch.emulation_flags & X86_EMU_VPCI))
 
 #define gdt_ldt_pt_idx(v) \
       ((v)->vcpu_id >> (PAGETABLE_ORDER - GDT_LDT_VCPU_SHIFT))
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index a3d3f797bb1e..00dfcf231e21 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -890,12 +890,12 @@ static struct domain *__init create_dom0(const module_t *image,
 
     if ( opt_dom0_pvh )
     {
-        dom0_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
+        dom0_cfg.flags |= (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_vpci |
                            ((hvm_hap_supported() && !opt_dom0_shadow) ?
                             XEN_DOMCTL_CDF_hap : 0));
 
         dom0_cfg.arch.emulation_flags |=
-            XEN_X86_EMU_LAPIC | XEN_X86_EMU_IOAPIC | XEN_X86_EMU_VPCI;
+            XEN_X86_EMU_LAPIC | XEN_X86_EMU_IOAPIC;
     }
 
     if ( iommu_enabled )
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8f9ab01c0cb7..6a42eb6d8c18 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -509,12 +509,14 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
     bool hap = config->flags & XEN_DOMCTL_CDF_hap;
     bool iommu = config->flags & XEN_DOMCTL_CDF_iommu;
     bool vpmu = config->flags & XEN_DOMCTL_CDF_vpmu;
+    bool vpci = config->flags & XEN_DOMCTL_CDF_vpci;
 
     if ( config->flags &
          ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
            XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
            XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
-           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu) )
+           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |
+           XEN_DOMCTL_CDF_vpci) )
     {
         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
         return -EINVAL;
@@ -575,6 +577,18 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
+    if ( vpci && !hvm )
+    {
+        dprintk(XENLOG_INFO, "vPCI requested for non-HVM guest\n");
+        return -EINVAL;
+    }
+
+    if ( vpci && !IS_ENABLED(CONFIG_HAS_VPCI) )
+    {
+        dprintk(XENLOG_INFO, "vPCI requested but not enabled\n");
+        return -EINVAL;
+    }
+
     return arch_sanitise_domain_config(config);
 }
 
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index c0f4551247f4..4cf066761c6b 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -283,15 +283,12 @@ struct xen_arch_domainconfig {
 #define XEN_X86_EMU_PIT             (1U<<_XEN_X86_EMU_PIT)
 #define _XEN_X86_EMU_USE_PIRQ       9
 #define XEN_X86_EMU_USE_PIRQ        (1U<<_XEN_X86_EMU_USE_PIRQ)
-#define _XEN_X86_EMU_VPCI           10
-#define XEN_X86_EMU_VPCI            (1U<<_XEN_X86_EMU_VPCI)
 
 #define XEN_X86_EMU_ALL             (XEN_X86_EMU_LAPIC | XEN_X86_EMU_HPET |  \
                                      XEN_X86_EMU_PM | XEN_X86_EMU_RTC |      \
                                      XEN_X86_EMU_IOAPIC | XEN_X86_EMU_PIC |  \
                                      XEN_X86_EMU_VGA | XEN_X86_EMU_IOMMU |   \
-                                     XEN_X86_EMU_PIT | XEN_X86_EMU_USE_PIRQ |\
-                                     XEN_X86_EMU_VPCI)
+                                     XEN_X86_EMU_PIT | XEN_X86_EMU_USE_PIRQ)
     uint32_t emulation_flags;
 
 /*
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index a33f9ec32b08..5f3b5579c377 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -21,7 +21,7 @@
 #include "hvm/save.h"
 #include "memory.h"
 
-#define XEN_DOMCTL_INTERFACE_VERSION 0x00000016
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
 
 /*
  * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
@@ -55,9 +55,12 @@ struct xen_domctl_createdomain {
 #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
 /* Should we expose the vPMU to the guest? */
 #define XEN_DOMCTL_CDF_vpmu           (1U << 7)
+/* Should vPCI be enabled for the guest? */
+#define _XEN_DOMCTL_CDF_vpci          8
+#define XEN_DOMCTL_CDF_vpci           (1U<<_XEN_DOMCTL_CDF_vpci)
 
 /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
-#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_vpmu
+#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_vpci
 
     uint32_t flags;
 
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 54d88bf5e34b..ab8f06c5f6a2 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -51,6 +51,9 @@ void arch_get_domain_info(const struct domain *d,
 
 #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
 
+#define has_vpci(d) (((d)->options & XEN_DOMCTL_CDF_vpci) && \
+                     IS_ENABLED(CONFIG_HAS_VPCI))
+
 /*
  * Arch-specifics.
  */
-- 
2.42.0



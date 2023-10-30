Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 450EA7DC34D
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 00:54:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625424.974692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxc4c-0000yw-W5; Mon, 30 Oct 2023 23:53:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625424.974692; Mon, 30 Oct 2023 23:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxc4c-0000ww-SV; Mon, 30 Oct 2023 23:53:34 +0000
Received: by outflank-mailman (input) for mailman id 625424;
 Mon, 30 Oct 2023 23:53:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j9+r=GM=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qxc4b-00009Y-GR
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 23:53:33 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20625.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86f32cfb-777f-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 00:53:31 +0100 (CET)
Received: from MW4PR04CA0232.namprd04.prod.outlook.com (2603:10b6:303:87::27)
 by SA1PR12MB8598.namprd12.prod.outlook.com (2603:10b6:806:253::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Mon, 30 Oct
 2023 23:53:27 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:303:87:cafe::61) by MW4PR04CA0232.outlook.office365.com
 (2603:10b6:303:87::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28 via Frontend
 Transport; Mon, 30 Oct 2023 23:53:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Mon, 30 Oct 2023 23:53:25 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 30 Oct
 2023 18:53:24 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 30 Oct
 2023 18:53:24 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Mon, 30 Oct 2023 18:53:22 -0500
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
X-Inumbo-ID: 86f32cfb-777f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Syl6E7adKLrCkaXTpZwiWcqo7Hvzwujth3y3qPj07F6f9+pHDK7frIGV/EFv+u5RbTb+4XmpUtTcDu1Dco5cpPRphsoKNXMvrnTUSCitBg1xtELZtoOuWpCXcuGYkMdZDE/Cxw+7QzeIP/tNYOIsww1wiMXSpr3QmVk89LrSgoRwnLkU1TJrfcMVcaEaJjCIfFAM8ndla6TbbpoxXRZ72ysxOdM/JK5LBhPn3+HZTORqwrqpSZaBqO0TbvG4Icz0nWjcZXkQWadFQXAaGjswnI1wvFJVQ6fPle5wsXXGN3DxUfRE3+ZzF7G6Q8J24S8ZDf6S1iA+h0sASDrLgeTsMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=paYgyYFEvCqtRNrRgLjdy+iDeJ6pBAXS6AUnevvjTBg=;
 b=RdV0SJHio93Nw/QhGQtWeF9jV3OXg3SuuDkc41C/ZOZgJQietHMjKdxqDwgHy5SU18nTGDYORV499T24yQhm4XSqEXlNUmnC8YEIJ/FHMotHjkHTmxdtmpWxdd5DHsZTReLXeHbO3RYNTvsDrn14Ie6cOT3eU7tP4gUiFUlHVoJkvAGC9Nh0YcxV3GWVr1KU+7T5SgLgLbo1DicBOpBO1KySIQwZiV+U6ovnCXBcnQWmZSmiDjNWTyQ3EZVd9v8Z2C8oFdF8sPcLhIU0zzCQaEqK4s+POUnXgPrg4uBzPBPDrh5AAGJDUACfsQufD5/OEj8PtOLwADA3nPPyeAOnpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=amd.com; dmarc=temperror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=paYgyYFEvCqtRNrRgLjdy+iDeJ6pBAXS6AUnevvjTBg=;
 b=0rfVWQWX5KpJZK9hqQC8c2wrX4KZ70E4U/mNDrLYus2ykdZj5rXpmCZbP5dFHnAmN4PISS+KDxRkjypoQP7G8WOeMIYjfFJvh9iTfyZMEx5uhgOezRfINxDLZLkbz5k4ISwpxE2x3QNTJahJEHv1PkN1tPh+Ecn1KwaJJ88uy8Q=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
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
	<rahul.singh@arm.com>
Subject: [PATCH v4 2/5] xen/vpci: move xen_domctl_createdomain vPCI flag to common
Date: Mon, 30 Oct 2023 19:52:33 -0400
Message-ID: <20231030235240.106998-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231030235240.106998-1-stewart.hildebrand@amd.com>
References: <20231030235240.106998-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|SA1PR12MB8598:EE_
X-MS-Office365-Filtering-Correlation-Id: c21365b0-9592-446f-7593-08dbd9a36825
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cwdLkffRS536UIlrt7RHdgjqgvSZJMJ92QSXpEC9oBaJtN7ibmchGYqiHRGPA/Y+e70w3u20S/KaSJSBxvo+kNgXc05IOhgEx4Bctr6hKDzLnzASV/hlagnGY2ynepHXg0jRAzuCcgSTGQQ5WskDvOyb57dUIFSt2M9dqjJ0v6N0nu/99VOuQl+7FY6NCGWhf5mBoi8JNr3O8KyI0oxHZ3ZGbnOO6euYp2lDAY9B8ZQ52t/6LqBOXQ43jrFkHDyXNBJXc89bQdIak7brCbszM6VEp23K3PmXoSFoCzkSrFAQVd2/BLJOGHnMvPoLWKRRCAGc367GoPpuJLiU8nCF8O+VAt4HbliBmNrnVMwWPp/4yyAU+l7t9LPE/UhiePxcXZk2GUR5gIZTxSTKoYmmFZqflSdrcajJV3NQdoVtc9BZCwWXQCp9aXzS7WHIwAKqugD9902QSacuIhKIOBG97rknw4tu4/dG0g9+NsYXod6NQKSGmcanffASiQcAyMipylPIOBVZyJXZpaIxqQCVlC707TMWhVM4gLw15adHw9ddSkTSgZQcjlETot/dsZg2qchMdWs0MtTpkrPDwI3la0bu7t6LBE9M+Nql+b0EilDUn0v6HTdYdcQqqeCcAxM/3HPnu4S46QZ7za8qn4BhpP7M4YUGibH2t2OCdedpX91RJU3gkIFmHMPemtgHA7wTcGFkGHHIOc5KaHdhhSLVl+vKXJ1k9EIOl+Z+iEnD2Q6wuM964ce56gSDVm/YCVinYknsNQKiQhIHD8UhP7I4K2s634rAxroLkwMY0YwsaNY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(39860400002)(136003)(230922051799003)(64100799003)(82310400011)(186009)(451199024)(1800799009)(40470700004)(36840700001)(46966006)(26005)(1076003)(2616005)(40480700001)(7416002)(40460700003)(86362001)(82740400003)(81166007)(356005)(36756003)(426003)(336012)(2906002)(30864003)(83380400001)(63370400001)(63350400001)(478600001)(36860700001)(47076005)(6666004)(4326008)(8676002)(8936002)(6916009)(54906003)(316002)(966005)(5660300002)(44832011)(70586007)(70206006)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 23:53:25.1832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c21365b0-9592-446f-7593-08dbd9a36825
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8598

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
---
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
 xen/arch/arm/domain.c             |  3 ++-
 xen/arch/arm/include/asm/domain.h |  3 ---
 xen/arch/x86/domain.c             | 16 ++++++++++------
 xen/arch/x86/include/asm/domain.h |  6 +-----
 xen/arch/x86/setup.c              |  5 +++--
 xen/common/domain.c               | 10 +++++++++-
 xen/include/public/arch-x86/xen.h |  5 +----
 xen/include/public/domctl.h       |  7 +++++--
 xen/include/xen/domain.h          |  2 ++
 13 files changed, 43 insertions(+), 28 deletions(-)

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
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 28e3aaa5e482..1409a4235e13 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -607,7 +607,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 {
     unsigned int max_vcpus;
     unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
-    unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu);
+    unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu |
+                                   XEN_DOMCTL_CDF_vpci);
     unsigned int sve_vl_bits = sve_decode_vl(config->arch.sve_vl);
 
     if ( (config->flags & ~flags_optional) != flags_required )
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
index 3712e36df930..2882fc1081c1 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -712,7 +712,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     return 0;
 }
 
-static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
+static bool emulation_flags_ok(const struct domain *d, uint32_t emflags,
+                               uint32_t cdf)
 {
 #ifdef CONFIG_HVM
     /* This doesn't catch !CONFIG_HVM case but it is better than nothing */
@@ -722,14 +723,17 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
     if ( is_hvm_domain(d) )
     {
         if ( is_hardware_domain(d) &&
-             emflags != (X86_EMU_VPCI | X86_EMU_LAPIC | X86_EMU_IOAPIC) )
+             (!( cdf & XEN_DOMCTL_CDF_vpci ) ||
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
-    else if ( emflags != 0 && emflags != X86_EMU_PIT )
+    else if ( (cdf & XEN_DOMCTL_CDF_vpci) ||
+              (emflags != 0 && emflags != X86_EMU_PIT) )
     {
         /* PV or classic PVH. */
         return false;
@@ -798,7 +802,7 @@ int arch_domain_create(struct domain *d,
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
index a3d3f797bb1e..58a98acfb1ee 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -892,10 +892,11 @@ static struct domain *__init create_dom0(const module_t *image,
     {
         dom0_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
                            ((hvm_hap_supported() && !opt_dom0_shadow) ?
-                            XEN_DOMCTL_CDF_hap : 0));
+                            XEN_DOMCTL_CDF_hap : 0) |
+                           XEN_DOMCTL_CDF_vpci);
 
         dom0_cfg.arch.emulation_flags |=
-            XEN_X86_EMU_LAPIC | XEN_X86_EMU_IOAPIC | XEN_X86_EMU_VPCI;
+            XEN_X86_EMU_LAPIC | XEN_X86_EMU_IOAPIC;
     }
 
     if ( iommu_enabled )
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8f9ab01c0cb7..12dc27428972 100644
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
@@ -575,6 +577,12 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
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
index 54d88bf5e34b..17b3429240f3 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -51,6 +51,8 @@ void arch_get_domain_info(const struct domain *d,
 
 #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
 
+#define has_vpci(d) (!!((d)->options & XEN_DOMCTL_CDF_vpci))
+
 /*
  * Arch-specifics.
  */
-- 
2.42.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC317EA600
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 23:22:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632033.985925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2fJz-00046B-0f; Mon, 13 Nov 2023 22:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632033.985925; Mon, 13 Nov 2023 22:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2fJy-00044P-Td; Mon, 13 Nov 2023 22:22:18 +0000
Received: by outflank-mailman (input) for mailman id 632033;
 Mon, 13 Nov 2023 22:22:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GGJv=G2=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r2fJy-0003AY-5f
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 22:22:18 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e88::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1957e531-8273-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 23:22:16 +0100 (CET)
Received: from BL1PR13CA0274.namprd13.prod.outlook.com (2603:10b6:208:2bc::9)
 by BL1PR12MB5029.namprd12.prod.outlook.com (2603:10b6:208:31d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 22:22:11 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:2bc:cafe::1b) by BL1PR13CA0274.outlook.office365.com
 (2603:10b6:208:2bc::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15 via Frontend
 Transport; Mon, 13 Nov 2023 22:22:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.13 via Frontend Transport; Mon, 13 Nov 2023 22:22:10 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 13 Nov
 2023 16:22:10 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 13 Nov
 2023 16:22:10 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Mon, 13 Nov 2023 16:22:08 -0600
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
X-Inumbo-ID: 1957e531-8273-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VggPD7AhwUkVALtL09Xdl55REkb+/22vbgytgadPbfrBwdhan+PkHNUxKM+Gy+SEWOD3cxzsLLMZpcnWHQEJzpJz2wl7apiWKbaKpnAKrOPwe3GMnNGx3OvcyUH3U4PIEmeBexHaJyQ7cNiIz1yt+fNiW37vbkNxZesevCrn+Y1A07ZfSJ2ObGQNUxMeTlflUgab3nUhVmB5aB6GDidlcm+m5xVb4hI10yGiQ3vqCjCwAw8s/aV2WLm+eDnzL6J8UOirzz92cMyABXNpi4STBgYCTPkTTaPXNkvQ1yH5H5KlxNX44bo0WcsXEL52SDv21NjeBPZ8nQfTtO/Attv79Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNIMjSozE0dwXJVr8jQ3TQDs77gzhEx6bGfEi4dxzAs=;
 b=D70ht+4F5YlCIq40qX/7I4LqqBXuY7fa6aQLXqIu8NVqbVHf2QHZcZBxelq3cn2+PmbQdRA2VkuTm+FbiGj4N0HV4UDvFaEOiT9pRVH4rPtFNE9n/RL77XgbN1uAVR+RmgbtZSp2yQkpEC15tLEoFq51DrLD6PthoGozKlXDUAMmrU3W2lxag+9Vzj0Y9XOGlYCz7CJCD7nWdhLxT1NtorPB8JZcT/IzRUtoI0p4RDrjjWyY3lt+i/7xOkWuk3d9Dmfdgb7Y3VCPzV4iwBw+oX+fnbzShr2IhCLou97qJJXtkJ2co6zlGU5oF66gy/td5DsikJwKY3KfBbi7Ji6djg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNIMjSozE0dwXJVr8jQ3TQDs77gzhEx6bGfEi4dxzAs=;
 b=s6KzZWGj3EQrThHLHyDkvxuS1tOCQsb+3QuQ5JdHOc4SY/bnfcyJ6tC/kH+mDChkLYj5oEjioya7ZigC51tZMkMJA/0CRDRPPKwc5wZmBQy2Trge1ZBEbTyD5i6wH6t17mYW6n2o5sKhW4f5cdl5ng6Ooeg47B05AbEZ3wiPvNA=
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
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Rahul Singh <rahul.singh@arm.com>,
	Christian Lindig <christian.lindig@cloud.com>
Subject: [PATCH v6 2/5] xen/vpci: move xen_domctl_createdomain vPCI flag to common
Date: Mon, 13 Nov 2023 17:21:11 -0500
Message-ID: <20231113222118.825758-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113222118.825758-1-stewart.hildebrand@amd.com>
References: <20231113222118.825758-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|BL1PR12MB5029:EE_
X-MS-Office365-Filtering-Correlation-Id: 256ccad5-bdb1-49bf-bc26-08dbe496faf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m4FPxN77zElnYqX6THjir1vRLy23Kk71q9SOsstASpchIjS5s0VVaBotScjh6TqR7E/xABLDtP7iNGMirEw7iT/eeo3NxNfkTARsYUiEl/aZ3NwntfwPusxxaFQjbhx2S546Y/VQBfpYLg0P4RlPdUKT2lAQMTcP3A+eDsjQpY1qTkOmggrzgr1o+cGJrcbzITWgEwl1xrg7y7pzWE4zwolDjoOjenyzrhZFUbjgzMuioysXH149cYfuoIkVawcTSIpFWpVCNJe7THglRL1n+bSYhtj2gUubtzcu8IoxkJ0lTd69sLoPRtWZS49b6hgUatCqeagn2MBeYnGzAM1RpdtDmHEz3rANd05JQKBFCfh0b0b8hu+EO1bxUlDYuC6N4jg5sM7QJbIvQ4iisJRDNIel70HPChlgmIz8+pw/MZTtIGL2uHrbfut/VqTPiAgTN5D620IKhZueBPgT0H7CqycLlLOEd/c+S52Kv+WIwmk1oDHGCg+Kc7r63y3jbSd32B+xFyfZAvQlrFs6kKwmNckeGzXuEJxBEKEDB6/NPQVOMYjHlSbAHYL8Eb+OQfu6OCFHhVcaSmyD/dYHIRXU5a8gGnCj7EoVE5fYpD/Ez035ZrXzJlzLRdBt6lfgZj3QEFw1NTTU2i1djIEJNhJUB7Pwa2HNTVIgjwy9H2Qm7gz5z5CmGKAD4JJ2IX4WiHA53R5H76EuF3szSEf0Yf3uPpEqb8GGKFhqKRftTZmzEoaxhKzcEp+6Mfl+nHSpNoP9zRMl8s4Qp/t388gZEukF0S59dqkVWiCGvxYz0/HXKHs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(1800799009)(451199024)(64100799003)(82310400011)(186009)(40470700004)(36840700001)(46966006)(70586007)(54906003)(6916009)(70206006)(966005)(478600001)(316002)(40460700003)(6666004)(7416002)(86362001)(5660300002)(30864003)(41300700001)(36756003)(2906002)(8676002)(4326008)(8936002)(44832011)(2616005)(1076003)(40480700001)(26005)(356005)(83380400001)(36860700001)(47076005)(82740400003)(81166007)(426003)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 22:22:10.9486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 256ccad5-bdb1-49bf-bc26-08dbe496faf9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5029

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
v5->v6:
* don't explicitly clear XEN_DOMCTL_CDF_vpci where unnecessary
* add comment about avoiding re-using bit 10 in emulation_flags
* don't #define _XEN_DOMCTL_CDF_vpci (underscore-prefixed), only
  introduce single new flag identifier
* move ( vpci && !hvm ) check to xen/arch/x86/domain.c
* simplify has_vpci()

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
 tools/libs/light/libxl_x86.c      |  2 +-
 tools/ocaml/libs/xc/xenctrl.ml    |  2 +-
 tools/ocaml/libs/xc/xenctrl.mli   |  2 +-
 tools/python/xen/lowlevel/xc/xc.c |  2 +-
 xen/arch/arm/include/asm/domain.h |  3 ---
 xen/arch/x86/domain.c             | 20 +++++++++++++++-----
 xen/arch/x86/include/asm/domain.h |  6 +-----
 xen/arch/x86/setup.c              |  4 ++--
 xen/common/domain.c               | 10 +++++++++-
 xen/include/public/arch-x86/xen.h |  9 +++++----
 xen/include/public/domctl.h       |  6 ++++--
 xen/include/xen/domain.h          |  2 ++
 12 files changed, 42 insertions(+), 26 deletions(-)

diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index d16573e72cd4..4a42b7231f8b 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -8,7 +8,7 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
 {
     switch(d_config->c_info.type) {
     case LIBXL_DOMAIN_TYPE_HVM:
-        config->arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
+        config->arch.emulation_flags = XEN_X86_EMU_ALL;
         break;
     case LIBXL_DOMAIN_TYPE_PVH:
         config->arch.emulation_flags = XEN_X86_EMU_LAPIC;
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
index d3ea350e07b9..b9f559a8e637 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -159,7 +159,7 @@ static PyObject *pyxc_domain_create(XcObject *self,
 
 #if defined (__i386) || defined(__x86_64__)
     if ( config.flags & XEN_DOMCTL_CDF_hvm )
-        config.arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
+        config.arch.emulation_flags = XEN_X86_EMU_ALL;
 #elif defined (__arm__) || defined(__aarch64__)
     config.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
 #else
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 5fb8cd79c01a..3614562eaefe 100644
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
index 3712e36df930..bbb73abe88a1 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -636,6 +636,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     bool hvm = config->flags & XEN_DOMCTL_CDF_hvm;
     bool hap = config->flags & XEN_DOMCTL_CDF_hap;
     bool nested_virt = config->flags & XEN_DOMCTL_CDF_nested_virt;
+    bool vpci = config->flags & XEN_DOMCTL_CDF_vpci;
     unsigned int max_vcpus;
 
     if ( hvm ? !hvm_enabled : !IS_ENABLED(CONFIG_PV) )
@@ -709,10 +710,17 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
+    if ( vpci && !hvm )
+    {
+        dprintk(XENLOG_INFO, "vPCI requested for non-HVM guest\n");
+        return -EINVAL;
+    }
+
     return 0;
 }
 
-static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
+static bool emulation_flags_ok(const struct domain *d, unsigned int emflags,
+                               unsigned int cdf)
 {
 #ifdef CONFIG_HVM
     /* This doesn't catch !CONFIG_HVM case but it is better than nothing */
@@ -722,11 +730,13 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
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
@@ -798,7 +808,7 @@ int arch_domain_create(struct domain *d,
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
index c0f4551247f4..abb808c9060b 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -283,15 +283,16 @@ struct xen_arch_domainconfig {
 #define XEN_X86_EMU_PIT             (1U<<_XEN_X86_EMU_PIT)
 #define _XEN_X86_EMU_USE_PIRQ       9
 #define XEN_X86_EMU_USE_PIRQ        (1U<<_XEN_X86_EMU_USE_PIRQ)
-#define _XEN_X86_EMU_VPCI           10
-#define XEN_X86_EMU_VPCI            (1U<<_XEN_X86_EMU_VPCI)
+/*
+ * Note: bit 10 was previously used for a XEN_X86_EMU_VPCI flag. This bit should
+ * not be re-used without careful consideration.
+ */
 
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
index a33f9ec32b08..8b3ea62cae06 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -21,7 +21,7 @@
 #include "hvm/save.h"
 #include "memory.h"
 
-#define XEN_DOMCTL_INTERFACE_VERSION 0x00000016
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
 
 /*
  * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
@@ -55,9 +55,11 @@ struct xen_domctl_createdomain {
 #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
 /* Should we expose the vPMU to the guest? */
 #define XEN_DOMCTL_CDF_vpmu           (1U << 7)
+/* Should vPCI be enabled for the guest? */
+#define XEN_DOMCTL_CDF_vpci           (1U << 8)
 
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



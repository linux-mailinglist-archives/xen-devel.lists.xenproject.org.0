Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1664E42D560
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 10:48:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209090.365433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mawOq-0000i7-3e; Thu, 14 Oct 2021 08:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209090.365433; Thu, 14 Oct 2021 08:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mawOp-0000fa-Vu; Thu, 14 Oct 2021 08:47:39 +0000
Received: by outflank-mailman (input) for mailman id 209090;
 Thu, 14 Oct 2021 08:47:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9UJu=PC=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mawOn-0000fU-QA
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 08:47:37 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 615f2174-2ccb-11ec-81b5-12813bfff9fa;
 Thu, 14 Oct 2021 08:47:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3994611D4;
 Thu, 14 Oct 2021 01:47:36 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.24.225])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34EE33F66F;
 Thu, 14 Oct 2021 01:47:31 -0700 (PDT)
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
X-Inumbo-ID: 615f2174-2ccb-11ec-81b5-12813bfff9fa
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	bertrand.marquis@arm.com
Subject: [PATCH] Revert "xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag"
Date: Thu, 14 Oct 2021 10:47:18 +0200
Message-Id: <20211014084718.21733-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 2075b410ee8087662c880213c3aca196fb7ade22.

During the discussion [1] that took place after
the patch was merged it was agreed that it should
be reverted to avoid introducing a bad interface.

Furthermore, the patch rejected usage of flag
XEN_DOMCTL_CDF_vpci for x86 which is not true
as it should be set for dom0 PVH.

Due to XEN_DOMCTL_CDF_vpmu being introduced after
XEN_DOMCTL_CDF_vpci, modify its bit position
from 8 to 7.

[1] https://marc.info/?t=163354215300039&r=1&w=2

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 tools/ocaml/libs/xc/xenctrl.ml  | 1 -
 tools/ocaml/libs/xc/xenctrl.mli | 1 -
 xen/arch/arm/domain.c           | 3 +--
 xen/arch/x86/domain.c           | 6 ------
 xen/common/domain.c             | 3 +--
 xen/include/public/domctl.h     | 3 +--
 6 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 86758babb3..addcf4cc59 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -69,7 +69,6 @@ type domain_create_flag =
 	| CDF_XS_DOMAIN
 	| CDF_IOMMU
 	| CDF_NESTED_VIRT
-	| CDF_VPCI
 	| CDF_VPMU
 
 type domain_create_iommu_opts =
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 0fdb0cc169..0a5ce529e9 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -62,7 +62,6 @@ type domain_create_flag =
   | CDF_XS_DOMAIN
   | CDF_IOMMU
   | CDF_NESTED_VIRT
-  | CDF_VPCI
   | CDF_VPMU
 
 type domain_create_iommu_opts =
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index ad21c9b950..eef0661beb 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -628,8 +628,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 {
     unsigned int max_vcpus;
     unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
-    unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpci |
-                                   XEN_DOMCTL_CDF_vpmu);
+    unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu);
 
     if ( (config->flags & ~flags_optional) != flags_required )
     {
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 79c2aa4636..ef1812dc14 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -662,12 +662,6 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
-    if ( config->flags & XEN_DOMCTL_CDF_vpci )
-    {
-        dprintk(XENLOG_INFO, "vPCI cannot be enabled yet\n");
-        return -EINVAL;
-    }
-
     if ( config->vmtrace_size )
     {
         unsigned int size = config->vmtrace_size;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8543fb54fd..8b53c49d1e 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -486,8 +486,7 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
          ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
            XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
            XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
-           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpci |
-           XEN_DOMCTL_CDF_vpmu) )
+           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu) )
     {
         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
         return -EINVAL;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index a53cbd16f4..238384b5ae 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -70,9 +70,8 @@ struct xen_domctl_createdomain {
 #define XEN_DOMCTL_CDF_iommu          (1U<<_XEN_DOMCTL_CDF_iommu)
 #define _XEN_DOMCTL_CDF_nested_virt   6
 #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
-#define XEN_DOMCTL_CDF_vpci           (1U << 7)
 /* Should we expose the vPMU to the guest? */
-#define XEN_DOMCTL_CDF_vpmu           (1U << 8)
+#define XEN_DOMCTL_CDF_vpmu           (1U << 7)
 
 /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
 #define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_vpmu
-- 
2.29.0



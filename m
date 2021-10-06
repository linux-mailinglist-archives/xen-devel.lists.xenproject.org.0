Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7A44244FB
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 19:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203001.358110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYAvi-00083P-Ud; Wed, 06 Oct 2021 17:42:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203001.358110; Wed, 06 Oct 2021 17:42:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYAvi-0007zK-Q7; Wed, 06 Oct 2021 17:42:10 +0000
Received: by outflank-mailman (input) for mailman id 203001;
 Wed, 06 Oct 2021 17:42:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=13oh=O2=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mYAvg-0004uL-8e
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 17:42:08 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 61230fa9-7a97-4842-8854-09560a4c78d6;
 Wed, 06 Oct 2021 17:41:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 253AA6D;
 Wed,  6 Oct 2021 10:41:52 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42DBB3F70D;
 Wed,  6 Oct 2021 10:41:50 -0700 (PDT)
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
X-Inumbo-ID: 61230fa9-7a97-4842-8854-09560a4c78d6
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andre.Przywara@arm.com,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag
Date: Wed,  6 Oct 2021 18:40:33 +0100
Message-Id: <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633540842.git.rahul.singh@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce XEN_DOMCTL_CDF_vpci flag to enable VPCI support in XEN.
Reject the use of this new flag for x86 as VPCI is not supported for
DOMU guests for x86.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
---
Change in v5:
- Added Acked-by: Christian Lindig <christian.lindig@citrix.com>
- Added Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Change in v4: Added in this version
---
---
 tools/ocaml/libs/xc/xenctrl.ml  | 1 +
 tools/ocaml/libs/xc/xenctrl.mli | 1 +
 xen/arch/arm/domain.c           | 4 ++--
 xen/arch/x86/domain.c           | 6 ++++++
 xen/common/domain.c             | 2 +-
 xen/include/public/domctl.h     | 4 +++-
 6 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index a5588c643f..7ed1c00e47 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -69,6 +69,7 @@ type domain_create_flag =
 	| CDF_XS_DOMAIN
 	| CDF_IOMMU
 	| CDF_NESTED_VIRT
+	| CDF_VPCI
 
 type domain_create_iommu_opts =
 	| IOMMU_NO_SHAREPT
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 6e94940a8a..391d4abdf8 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -62,6 +62,7 @@ type domain_create_flag =
   | CDF_XS_DOMAIN
   | CDF_IOMMU
   | CDF_NESTED_VIRT
+  | CDF_VPCI
 
 type domain_create_iommu_opts =
   | IOMMU_NO_SHAREPT
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 19c756ac3d..36138c1b2e 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -622,8 +622,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 {
     unsigned int max_vcpus;
 
-    /* HVM and HAP must be set. IOMMU may or may not be */
-    if ( (config->flags & ~XEN_DOMCTL_CDF_iommu) !=
+    /* HVM and HAP must be set. IOMMU and VPCI may or may not be */
+    if ( (config->flags & ~XEN_DOMCTL_CDF_iommu & ~XEN_DOMCTL_CDF_vpci) !=
          (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap) )
     {
         dprintk(XENLOG_INFO, "Unsupported configuration %#x\n",
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index ef1812dc14..79c2aa4636 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -662,6 +662,12 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
+    if ( config->flags & XEN_DOMCTL_CDF_vpci )
+    {
+        dprintk(XENLOG_INFO, "vPCI cannot be enabled yet\n");
+        return -EINVAL;
+    }
+
     if ( config->vmtrace_size )
     {
         unsigned int size = config->vmtrace_size;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 6ee5d033b0..40d67ec342 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -483,7 +483,7 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
          ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
            XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
            XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
-           XEN_DOMCTL_CDF_nested_virt) )
+           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpci) )
     {
         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
         return -EINVAL;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 96696e3842..4245da3f45 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -70,9 +70,11 @@ struct xen_domctl_createdomain {
 #define XEN_DOMCTL_CDF_iommu          (1U<<_XEN_DOMCTL_CDF_iommu)
 #define _XEN_DOMCTL_CDF_nested_virt   6
 #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
+#define _XEN_DOMCTL_CDF_vpci          7
+#define XEN_DOMCTL_CDF_vpci           (1U << _XEN_DOMCTL_CDF_vpci)
 
 /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
-#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_nested_virt
+#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_vpci
 
     uint32_t flags;
 
-- 
2.25.1



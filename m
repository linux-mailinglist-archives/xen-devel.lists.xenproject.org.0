Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C4427EA34
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 15:46:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723.2466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcQr-0005Ax-Dr; Wed, 30 Sep 2020 13:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723.2466; Wed, 30 Sep 2020 13:46:09 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcQr-0005AT-9U; Wed, 30 Sep 2020 13:46:09 +0000
Received: by outflank-mailman (input) for mailman id 723;
 Wed, 30 Sep 2020 13:46:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sFQy=DH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kNcQq-00052v-4T
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:46:08 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc52b6fc-b7d0-47a3-85bd-aa002a210392;
 Wed, 30 Sep 2020 13:46:01 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sFQy=DH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kNcQq-00052v-4T
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:46:08 +0000
X-Inumbo-ID: bc52b6fc-b7d0-47a3-85bd-aa002a210392
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id bc52b6fc-b7d0-47a3-85bd-aa002a210392;
	Wed, 30 Sep 2020 13:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601473561;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OjuvPpFkciD4PB0zF10QdC1ef/eF6ozHZwFD86WkT0o=;
  b=UUaLsUwPRZF+DPO8QWgrLPdG1cM6c43IwQn6UfVw3TLafO8fH0A5h8vd
   5pXIZwL4QNbmlQssu2shFaUrwrXgJgpcrUQ21+9js5H9qkUukc1hdfaeJ
   c59MhOiCskKL02KlHyUf4Xw/RgW5vqDmEXF0kF6SS4cfvEvG8SlvAVryK
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: oIxanzhGrZSaqWoUT8gH61xIFZr1nzXyOVpm3IW54UIOYSEmFB8mPdlZZtto5F9Ngka4gLWfSn
 LT7PADtf7S/IsHQZ9hcmnkMYZw0tNixptRqqUogBP7NzF2TgeJYCGMJFYpRnkIHL/2TbQlnfWF
 IWSsPTcQ2Gza09vkRpVIMoUSZU6Te69oiS39ZRNCiSYNveUQgx1o2v670/HXw+pAvfIqfIccgC
 VJeSb9qZqsimF7rnvknwMwdgM+ylW31M4xdqBmDD2vZbxzWfVd2qp39+QX9UFEJBSIMdXHvvgE
 kSA=
X-SBRS: None
X-MesageID: 28239648
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="28239648"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, Christian Lindig <christian.lindig@citrix.com>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: [PATCH 3/8] xen/domctl: Introduce and use XEN_DOMCTL_CDF_nested_virt
Date: Wed, 30 Sep 2020 14:42:43 +0100
Message-ID: <20200930134248.4918-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200930134248.4918-1-andrew.cooper3@citrix.com>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Like other major areas of functionality, nested virt (or not) needs to be
known at domain creation time for sensible CPUID handling, and wants to be
known this early for sensible infrastructure handling in Xen.

Introduce XEN_DOMCTL_CDF_nested_virt and modify libxl to set it appropriately
when creating domains.  There is no need to adjust the ARM logic to reject the
use of this new flag.

No functional change yet.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Christian Lindig <christian.lindig@citrix.com>
CC: Edwin Török <edvin.torok@citrix.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
---
 tools/libxl/libxl_create.c      |  3 +++
 tools/ocaml/libs/xc/xenctrl.ml  |  1 +
 tools/ocaml/libs/xc/xenctrl.mli |  1 +
 xen/arch/x86/domain.c           |  7 +++++++
 xen/common/domain.c             | 11 +++++------
 xen/include/public/domctl.h     |  4 +++-
 6 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index ed671052d7..51e6809f3c 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -618,6 +618,9 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
 
             if ( !libxl_defbool_val(info->oos) )
                 create.flags |= XEN_DOMCTL_CDF_oos_off;
+
+            if ( libxl_defbool_val(b_info->nested_hvm) )
+                create.flags |= XEN_DOMCTL_CDF_nested_virt;
         }
 
         assert(info->passthrough != LIBXL_PASSTHROUGH_DEFAULT);
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 497ded7ce2..e878699b0a 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -64,6 +64,7 @@ type domain_create_flag =
 	| CDF_OOS_OFF
 	| CDF_XS_DOMAIN
 	| CDF_IOMMU
+	| CDF_NESTED_VIRT
 
 type domain_create_iommu_opts =
 	| IOMMU_NO_SHAREPT
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index f7f6ec570d..e64907df8e 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -57,6 +57,7 @@ type domain_create_flag =
   | CDF_OOS_OFF
   | CDF_XS_DOMAIN
   | CDF_IOMMU
+  | CDF_NESTED_VIRT
 
 type domain_create_iommu_opts =
   | IOMMU_NO_SHAREPT
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index d8f9be132c..5454f94d18 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -630,6 +630,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 {
     bool hvm = config->flags & XEN_DOMCTL_CDF_hvm;
     bool hap = config->flags & XEN_DOMCTL_CDF_hap;
+    bool nested_virt = config->flags & XEN_DOMCTL_CDF_nested_virt;
     unsigned int max_vcpus;
 
     if ( hvm ? !hvm_enabled : !IS_ENABLED(CONFIG_PV) )
@@ -667,6 +668,12 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
          */
         config->flags |= XEN_DOMCTL_CDF_oos_off;
 
+    if ( nested_virt && !hap )
+    {
+        dprintk(XENLOG_INFO, "Nested virt not supported without HAP\n");
+        return -EINVAL;
+    }
+
     return 0;
 }
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index cb617dc5aa..58b62d2fe4 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -303,12 +303,11 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
     bool hap = config->flags & XEN_DOMCTL_CDF_hap;
     bool iommu = config->flags & XEN_DOMCTL_CDF_iommu;
 
-    if ( config->flags & ~(XEN_DOMCTL_CDF_hvm |
-                           XEN_DOMCTL_CDF_hap |
-                           XEN_DOMCTL_CDF_s3_integrity |
-                           XEN_DOMCTL_CDF_oos_off |
-                           XEN_DOMCTL_CDF_xs_domain |
-                           XEN_DOMCTL_CDF_iommu) )
+    if ( config->flags &
+         ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
+           XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
+           XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
+           XEN_DOMCTL_CDF_nested_virt) )
     {
         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
         return -EINVAL;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 791f0a2592..666aeb71bf 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -68,9 +68,11 @@ struct xen_domctl_createdomain {
  /* Should this domain be permitted to use the IOMMU? */
 #define _XEN_DOMCTL_CDF_iommu         5
 #define XEN_DOMCTL_CDF_iommu          (1U<<_XEN_DOMCTL_CDF_iommu)
+#define _XEN_DOMCTL_CDF_nested_virt   6
+#define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
 
 /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
-#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_iommu
+#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_nested_virt
 
     uint32_t flags;
 
-- 
2.11.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD842CD5A7
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 13:42:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43407.78038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kknw0-0005yL-KT; Thu, 03 Dec 2020 12:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43407.78038; Thu, 03 Dec 2020 12:42:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kknw0-0005xg-F3; Thu, 03 Dec 2020 12:42:08 +0000
Received: by outflank-mailman (input) for mailman id 43407;
 Thu, 03 Dec 2020 12:42:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kknvz-0005wR-5p
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 12:42:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kknvx-000469-PG; Thu, 03 Dec 2020 12:42:05 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kknvx-00015A-FJ; Thu, 03 Dec 2020 12:42:05 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=lmkdn59hshdmAjDQmfZLDVWbGtLlFRpvq2lkuaCfgJY=; b=lnfsOqa1+UyaBlTlxXau6pCzBV
	Cmfflqq2/JrDMV/gHL2vnO6Hd1dVp7LZHeKXBThMnOcj1mAmAgP3xe3TMgUCcihcaPefdpoPRNw9p
	SmtW9xPEAtzVbf1g8Umd5YTlCiEMcCC7IPjBBVQgOMwbLbqeGf0NDkpGveQglSpOkft8=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 2/4] domctl: introduce a new domain create flag, XEN_DOMCTL_CDF_evtchn_upcall, ...
Date: Thu,  3 Dec 2020 12:41:57 +0000
Message-Id: <20201203124159.3688-3-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203124159.3688-1-paul@xen.org>
References: <20201203124159.3688-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

...to control the visibility of the per-vCPU upcall feature for HVM guests.

Commit 04447f4453c0 ("x86/hvm: add per-vcpu evtchn upcalls") added a mechanism
by which x86 HVM guests can register a vector for each vCPU which will be used
by Xen to signal event channels on that vCPU.

This facility (an HVMOP hypercall) appeared in a uncontrolled fashion which
has implications for the behaviour of OS when moving from an older Xen to a
newer Xen. For instance, the OS may be aware of the per-vCPU upcall feature
but support for it is buggy. In this case the OS will function perfectly well
on the older Xen, but fail (in a potentially non-obvious way) on the newer
Xen.

To maintain compatibility it is necessary to make Xen behave as it did
before the new hypercall was added and hence the code in this patch ensures
that, if XEN_DOMCTL_CDF_evtchn_upcall is not set, the hypercall will again
result in -ENOSYS being returned to the guest.

NOTE: To maintain current behavior, until a tool-stack option is added to
      control the flag, it is unconditionally set for x86 HVM domains. A
      subsequent patch will introduce such tool-stack control.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Christian Lindig <christian.lindig@citrix.com>
Cc: David Scott <dave@recoil.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>

v5:
 - New in v5
---
 tools/libs/light/libxl_x86.c    | 7 ++++++-
 tools/ocaml/libs/xc/xenctrl.ml  | 1 +
 tools/ocaml/libs/xc/xenctrl.mli | 1 +
 xen/arch/x86/domain.c           | 8 ++++++++
 xen/arch/x86/hvm/hvm.c          | 3 +++
 xen/arch/x86/setup.c            | 1 +
 xen/common/domain.c             | 3 ++-
 xen/include/public/domctl.h     | 4 +++-
 8 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 86d272999d67..f7217b422404 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -5,7 +5,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
                                       libxl_domain_config *d_config,
                                       struct xen_domctl_createdomain *config)
 {
-    switch(d_config->c_info.type) {
+    libxl_domain_create_info *info = &d_config->c_info;
+
+    if (info->type == LIBXL_DOMAIN_TYPE_HVM)
+        config->flags |= XEN_DOMCTL_CDF_evtchn_upcall;
+
+    switch(info->type) {
     case LIBXL_DOMAIN_TYPE_HVM:
         config->arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
         break;
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index fa5c7b7eb0a2..04284c364108 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -66,6 +66,7 @@ type domain_create_flag =
 	| CDF_IOMMU
 	| CDF_NESTED_VIRT
 	| CDF_EVTCHN_FIFO
+	| CDF_EVTCHN_UPCALL
 
 type domain_create_iommu_opts =
 	| IOMMU_NO_SHAREPT
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index a872002d90cc..e40759464ae5 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -59,6 +59,7 @@ type domain_create_flag =
   | CDF_IOMMU
   | CDF_NESTED_VIRT
   | CDF_EVTCHN_FIFO
+  | CDF_EVTCHN_UPCALL
 
 type domain_create_iommu_opts =
   | IOMMU_NO_SHAREPT
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 1b894d0124d7..e7f83880219d 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -662,11 +662,19 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     }
 
     if ( !hvm )
+    {
+        if ( config->flags & XEN_DOMCTL_CDF_evtchn_upcall )
+        {
+            dprintk(XENLOG_INFO, "Per-vCPU event channel vector only supported for HVM guests\n");
+            return -EINVAL;
+        }
+
         /*
          * It is only meaningful for XEN_DOMCTL_CDF_oos_off to be clear
          * for HVM guests.
          */
         config->flags |= XEN_DOMCTL_CDF_oos_off;
+    }
 
     if ( nested_virt && !hap )
     {
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 54e32e4fe85c..7ffc42a7282e 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4037,6 +4037,9 @@ static int hvmop_set_evtchn_upcall_vector(
     struct domain *d = current->domain;
     struct vcpu *v;
 
+    if ( !(d->options & XEN_DOMCTL_CDF_evtchn_upcall) )
+        return -ENOSYS;
+
     if ( !is_hvm_domain(d) )
         return -EINVAL;
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index e558241c73da..3ff9a25eede6 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -751,6 +751,7 @@ static struct domain *__init create_dom0(const module_t *image,
     if ( opt_dom0_pvh )
     {
         dom0_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
+                           XEN_DOMCTL_CDF_evtchn_upcall |
                            ((hvm_hap_supported() && !opt_dom0_shadow) ?
                             XEN_DOMCTL_CDF_hap : 0));
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 28592c7c8486..1ff2603425a3 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -307,7 +307,8 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
          ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
            XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
            XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
-           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_evtchn_fifo) )
+           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_evtchn_fifo |
+           XEN_DOMCTL_CDF_evtchn_upcall ) )
     {
         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
         return -EINVAL;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index f7149c81a7c2..f5fe43a55662 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -72,9 +72,11 @@ struct xen_domctl_createdomain {
 #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
 #define _XEN_DOMCTL_CDF_evtchn_fifo   7
 #define XEN_DOMCTL_CDF_evtchn_fifo    (1U << _XEN_DOMCTL_CDF_evtchn_fifo)
+#define _XEN_DOMCTL_CDF_evtchn_upcall 8
+#define XEN_DOMCTL_CDF_evtchn_upcall  (1U << _XEN_DOMCTL_CDF_evtchn_upcall)
 
 /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
-#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_evtchn_fifo
+#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_evtchn_upcall
 
     uint32_t flags;
 
-- 
2.20.1



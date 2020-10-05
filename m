Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7317228339B
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 11:49:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2949.8464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPN7U-0000m2-SB; Mon, 05 Oct 2020 09:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2949.8464; Mon, 05 Oct 2020 09:49:24 +0000
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
	id 1kPN7U-0000lS-MU; Mon, 05 Oct 2020 09:49:24 +0000
Received: by outflank-mailman (input) for mailman id 2949;
 Mon, 05 Oct 2020 09:49:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GPX8=DM=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kPN7T-0000a7-9N
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 09:49:23 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66d5992c-4a93-4e63-a402-3dcd90abad74;
 Mon, 05 Oct 2020 09:49:14 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kPN7I-00018e-Ki; Mon, 05 Oct 2020 09:49:12 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kPN7I-0007gW-C8; Mon, 05 Oct 2020 09:49:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GPX8=DM=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kPN7T-0000a7-9N
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 09:49:23 +0000
X-Inumbo-ID: 66d5992c-4a93-4e63-a402-3dcd90abad74
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 66d5992c-4a93-4e63-a402-3dcd90abad74;
	Mon, 05 Oct 2020 09:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=/aaR7886EUtZE6QjtNx8lerjhqgir9MSpy1XgMZF4CQ=; b=DI9ymTP2D65+vmiOYBjbM//YKo
	UEJWIwtLaTCuNuH8oEgzyJs2GxIops+nzfjC+uJUuZMZXYdP6tlLXMss/APAlfHH5UukDZkx9Odyt
	W7aLmasRZAfakrHvBpaHu1lwvzZGq3x3qRe+XIPgerBnpJ1KZ5BJSRExOy7wiq6r4Hqw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kPN7I-00018e-Ki; Mon, 05 Oct 2020 09:49:12 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kPN7I-0007gW-C8; Mon, 05 Oct 2020 09:49:12 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/5] libxl / iommu / domctl: introduce XEN_DOMCTL_IOMMU_SET_ALLOCATION...
Date: Mon,  5 Oct 2020 10:49:03 +0100
Message-Id: <20201005094905.2929-4-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005094905.2929-1-paul@xen.org>
References: <20201005094905.2929-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

... sub-operation of XEN_DOMCTL_iommu_ctl.

This patch adds a new sub-operation into the domctl. The code in iommu_ctl()
is extended to call a new arch-specific iommu_set_allocation() function which
will be called with the IOMMU page-table overhead (in 4k pages) in response
to libxl issuing a new domctl via the xc_iommu_set_allocation() helper
function.

The helper function is only called in the x86 implementation of
libxl__arch_domain_create() when the calculated 'iommu_memkb' value is
non-zero. Hence the ARM implementation of iommu_set_allocation() simply
returns -EOPNOTSUPP.

NOTE: The implementation of the IOMMU page-table memory pool will be added in
      a subsequent patch and so the x86 implementation of
      iommu_set_allocation() currently does nothing other than return 0 (to
      indicate success) thereby ensuring that the new call in
      libxl__arch_domain_create() always succeeds.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
 tools/libs/ctrl/include/xenctrl.h   |  5 +++++
 tools/libs/ctrl/xc_domain.c         | 16 ++++++++++++++++
 tools/libs/light/libxl_x86.c        | 10 ++++++++++
 xen/drivers/passthrough/iommu.c     |  8 ++++++++
 xen/drivers/passthrough/x86/iommu.c |  5 +++++
 xen/include/asm-arm/iommu.h         |  6 ++++++
 xen/include/asm-x86/iommu.h         |  2 ++
 xen/include/public/domctl.h         |  8 ++++++++
 8 files changed, 60 insertions(+)

diff --git a/tools/libs/ctrl/include/xenctrl.h b/tools/libs/ctrl/include/xenctrl.h
index 3796425e1e..4d6c9d44bc 100644
--- a/tools/libs/ctrl/include/xenctrl.h
+++ b/tools/libs/ctrl/include/xenctrl.h
@@ -2650,6 +2650,11 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
 int xc_domain_cacheflush(xc_interface *xch, uint32_t domid,
                          xen_pfn_t start_pfn, xen_pfn_t nr_pfns);
 
+/* IOMMU control operations */
+
+int xc_iommu_set_allocation(xc_interface *xch, uint32_t domid,
+                            unsigned int nr_pages);
+
 /* Compat shims */
 #include "xenctrl_compat.h"
 
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index e7cea4a17d..0b20a8f2ee 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -2185,6 +2185,22 @@ int xc_domain_soft_reset(xc_interface *xch,
     domctl.domain = domid;
     return do_domctl(xch, &domctl);
 }
+
+int xc_iommu_set_allocation(xc_interface *xch, uint32_t domid,
+                            unsigned int nr_pages)
+{
+    DECLARE_DOMCTL;
+
+    memset(&domctl, 0, sizeof(domctl));
+
+    domctl.cmd = XEN_DOMCTL_iommu_ctl;
+    domctl.domain = domid;
+    domctl.u.iommu_ctl.op = XEN_DOMCTL_IOMMU_SET_ALLOCATION;
+    domctl.u.iommu_ctl.u.set_allocation.nr_pages = nr_pages;
+
+    return do_domctl(xch, &domctl);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 6ec6c27c83..9631974dd6 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -520,6 +520,16 @@ int libxl__arch_domain_create(libxl__gc *gc, libxl_domain_config *d_config,
                           NULL, 0, &shadow, 0, NULL);
     }
 
+    if (d_config->b_info.iommu_memkb) {
+        unsigned int nr_pages = DIV_ROUNDUP(d_config->b_info.iommu_memkb, 4);
+
+        ret = xc_iommu_set_allocation(ctx->xch, domid, nr_pages);
+        if (ret) {
+            LOGED(ERROR, domid, "Failed to set IOMMU allocation");
+            goto out;
+        }
+    }
+
     if (d_config->c_info.type == LIBXL_DOMAIN_TYPE_PV &&
             libxl_defbool_val(d_config->b_info.u.pv.e820_host)) {
         ret = libxl__e820_alloc(gc, domid, d_config);
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index bef0405984..642d5c8331 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -515,6 +515,14 @@ static int iommu_ctl(
 
     switch ( ctl->op )
     {
+    case XEN_DOMCTL_IOMMU_SET_ALLOCATION:
+    {
+        struct xen_domctl_iommu_set_allocation *set_allocation =
+            &ctl->u.set_allocation;
+
+        rc = iommu_set_allocation(d, set_allocation->nr_pages);
+        break;
+    }
     default:
         rc = -EOPNOTSUPP;
         break;
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index f17b1820f4..b168073f10 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -134,6 +134,11 @@ void __hwdom_init arch_iommu_check_autotranslated_hwdom(struct domain *d)
         panic("PVH hardware domain iommu must be set in 'strict' mode\n");
 }
 
+int iommu_set_allocation(struct domain *d, unsigned nr_pages)
+{
+    return 0;
+}
+
 int arch_iommu_domain_init(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
diff --git a/xen/include/asm-arm/iommu.h b/xen/include/asm-arm/iommu.h
index 937edc8373..2e4735bace 100644
--- a/xen/include/asm-arm/iommu.h
+++ b/xen/include/asm-arm/iommu.h
@@ -33,6 +33,12 @@ int __must_check arm_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
 int __must_check arm_iommu_unmap_page(struct domain *d, dfn_t dfn,
                                       unsigned int *flush_flags);
 
+static inline int iommu_set_allocation(struct domain *d,
+                                       unsigned int nr_pages)
+{
+    return -EOPNOTSUPP;
+}
+
 #endif /* __ARCH_ARM_IOMMU_H__ */
 
 /*
diff --git a/xen/include/asm-x86/iommu.h b/xen/include/asm-x86/iommu.h
index 970eb06ffa..d086f564af 100644
--- a/xen/include/asm-x86/iommu.h
+++ b/xen/include/asm-x86/iommu.h
@@ -138,6 +138,8 @@ int pi_update_irte(const struct pi_desc *pi_desc, const struct pirq *pirq,
 int __must_check iommu_free_pgtables(struct domain *d);
 struct page_info *__must_check iommu_alloc_pgtable(struct domain *d);
 
+int __must_check iommu_set_allocation(struct domain *d, unsigned int nr_pages);
+
 #endif /* !__ARCH_X86_IOMMU_H__ */
 /*
  * Local variables:
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 75e855625a..6402678838 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1138,8 +1138,16 @@ struct xen_domctl_vuart_op {
 
 #define XEN_DOMCTL_IOMMU_INVALID 0
 
+#define XEN_DOMCTL_IOMMU_SET_ALLOCATION 1
+struct xen_domctl_iommu_set_allocation {
+    uint32_t nr_pages;
+};
+
 struct xen_domctl_iommu_ctl {
     uint32_t op; /* XEN_DOMCTL_IOMMU_* */
+    union {
+        struct xen_domctl_iommu_set_allocation set_allocation;
+    } u;
 };
 
 struct xen_domctl {
-- 
2.20.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEA69185A0
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 17:23:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749162.1157208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMUTy-00072D-8R; Wed, 26 Jun 2024 15:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749162.1157208; Wed, 26 Jun 2024 15:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMUTy-00070b-4Y; Wed, 26 Jun 2024 15:22:50 +0000
Received: by outflank-mailman (input) for mailman id 749162;
 Wed, 26 Jun 2024 15:22:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ae1K=N4=bounce.vates.tech=bounce-md_30504962.667c3245.v1-5ad0b2e156c34e69915bc1aa59ba347b@srs-se1.protection.inumbo.net>)
 id 1sMUTw-0006XW-5N
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 15:22:48 +0000
Received: from mail134-3.atl141.mandrillapp.com
 (mail134-3.atl141.mandrillapp.com [198.2.134.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0463e3a-33cf-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 17:22:46 +0200 (CEST)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-3.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4W8QS51QTbzDRJ1Wv
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 15:22:45 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5ad0b2e156c34e69915bc1aa59ba347b; Wed, 26 Jun 2024 15:22:45 +0000
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
X-Inumbo-ID: f0463e3a-33cf-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1719415365; x=1719675865;
	bh=vfdMXv8nsBcOxX19Aud9oLvJ4u7npIxafb7S7XML9pM=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=iR0ewlT2YGeR7wAWDG2V53a72e/0J0zXeziZw0hReTD2haY8Li6fACDBdS/67Qgj7
	 yumnk03Cp53XEaT5aG4bmqCHEed9zKIfoQfLrn0OInAlvdiK7NbAb3eDjD2lJCgLdL
	 EXsZ2O4Gr9JbSpSOqe7xtH1i0uazeEIJ2EULME4UnIxrQCU5VJX20HJKT+bC12tAd7
	 9V3mVTrlBOwcH9aZX69iW9CfluQNcr8rnlhaWMTxCZ0mOkqaCjHh40r09tuqZRPfst
	 WBx6CjMdOP31mdLpd9wsAKyIMlUnaRWPeyjT1sLi/PjXwI9Ytr6o7R9r34Cu5NFGz9
	 iUm9Dd0mm3ZlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1719415365; x=1719675865; i=teddy.astie@vates.tech;
	bh=vfdMXv8nsBcOxX19Aud9oLvJ4u7npIxafb7S7XML9pM=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=OBB7wWy4Q+axYu8/+GuOVuRmy+TQpbBH8bSExpK1Y8ubP9doPFLjpDm7HClP9SPo2
	 8+/7eB++iHHo4aJsNybgSCMgFMTRxLd3zf9FXscXOYL0XfG5aVLlFp2UWUA3ScTMrG
	 nraZ0GRkr0l84gQXHhjP/mrcMtSksNGLT6R+50NmnRqMCX1jJepk6JDWqeBnFjO/O3
	 9QsX9cq/0UCiFnKlpomrUWOSxx88yNgzax2nF57nDFKqQSq9bsosGTKewH0hAPKmd2
	 pQJnPe+zdvSwZW2YIAcv/WG+wGEIdT11eFsaGvCQTWyXJVdEfGJE5v5GyPqm8NPnXA
	 uLzzCTHfRgg0w==
From: TSnake41 <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20XEN=20PATCH=20v2=203/5]=20IOMMU:=20Introduce=20redesigned=20IOMMU=20subsystem?=
X-Mailer: git-send-email 2.45.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1719415362277
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Lukasz Hawrylko <lukasz@hawrylko.pl>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, =?utf-8?Q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>, =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Message-Id: <5ea6c3150ca0cf32b6f5993d1de8a638f1631e3d.1719414736.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1719414736.git.teddy.astie@vates.tech>
References: <cover.1719414736.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5ad0b2e156c34e69915bc1aa59ba347b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240626:md
Date: Wed, 26 Jun 2024 15:22:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

From: Teddy Astie <teddy.astie@vates.tech>

Based on docs/designs/iommu-contexts.md, implement the redesigned IOMMU subsystem.

Signed-off-by Teddy Astie <teddy.astie@vates.tech>
---
Changed in V2:
* cleanup some unneeded includes
* fix dangling devices in context on detach
---
 xen/arch/x86/domain.c                |   2 +-
 xen/arch/x86/mm/p2m-ept.c            |   2 +-
 xen/arch/x86/pv/dom0_build.c         |   4 +-
 xen/arch/x86/tboot.c                 |   4 +-
 xen/common/memory.c                  |   4 +-
 xen/drivers/passthrough/Makefile     |   3 +
 xen/drivers/passthrough/context.c    | 626 +++++++++++++++++++++++++++
 xen/drivers/passthrough/iommu.c      | 337 ++++----------
 xen/drivers/passthrough/pci.c        |  49 ++-
 xen/drivers/passthrough/quarantine.c |  49 +++
 xen/include/xen/iommu.h              | 118 ++++-
 xen/include/xen/pci.h                |   3 +
 12 files changed, 896 insertions(+), 305 deletions(-)
 create mode 100644 xen/drivers/passthrough/context.c
 create mode 100644 xen/drivers/passthrough/quarantine.c

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index ccadfe0c9e..1dd2453d71 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2405,7 +2405,7 @@ int domain_relinquish_resources(struct domain *d)
 
     PROGRESS(iommu_pagetables):
 
-        ret = iommu_free_pgtables(d);
+        ret = iommu_free_pgtables(d, iommu_default_context(d));
         if ( ret )
             return ret;
 
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 469e27ee93..80026a9cb9 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -975,7 +975,7 @@ out:
             rc = iommu_iotlb_flush(d, _dfn(gfn), 1ul << order,
                                    (iommu_flags ? IOMMU_FLUSHF_added : 0) |
                                    (vtd_pte_present ? IOMMU_FLUSHF_modified
-                                                    : 0));
+                                                    : 0), 0);
         else if ( need_iommu_pt_sync(d) )
             rc = iommu_flags ?
                 iommu_legacy_map(d, _dfn(gfn), mfn, 1ul << order, iommu_flags) :
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index d8043fa58a..db7298737d 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -76,7 +76,7 @@ static __init void mark_pv_pt_pages_rdonly(struct domain *d,
          * iommu_memory_setup() ended up mapping them.
          */
         if ( need_iommu_pt_sync(d) &&
-             iommu_unmap(d, _dfn(mfn_x(page_to_mfn(page))), 1, 0, flush_flags) )
+             iommu_unmap(d, _dfn(mfn_x(page_to_mfn(page))), 1, 0, flush_flags, 0) )
             BUG();
 
         /* Read-only mapping + PGC_allocated + page-table page. */
@@ -127,7 +127,7 @@ static void __init iommu_memory_setup(struct domain *d, const char *what,
 
     while ( (rc = iommu_map(d, _dfn(mfn_x(mfn)), mfn, nr,
                             IOMMUF_readable | IOMMUF_writable | IOMMUF_preempt,
-                            flush_flags)) > 0 )
+                            flush_flags, 0)) > 0 )
     {
         mfn = mfn_add(mfn, rc);
         nr -= rc;
diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
index ba0700d2d5..ca55306830 100644
--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -216,9 +216,9 @@ static void tboot_gen_domain_integrity(const uint8_t key[TB_KEY_SIZE],
 
         if ( is_iommu_enabled(d) && is_vtd )
         {
-            const struct domain_iommu *dio = dom_iommu(d);
+            struct domain_iommu *dio = dom_iommu(d);
 
-            update_iommu_mac(&ctx, dio->arch.vtd.pgd_maddr,
+            update_iommu_mac(&ctx, iommu_default_context(d)->arch.vtd.pgd_maddr,
                              agaw_to_level(dio->arch.vtd.agaw));
         }
     }
diff --git a/xen/common/memory.c b/xen/common/memory.c
index de2cc7ad92..0eb0f9da7b 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -925,7 +925,7 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
         this_cpu(iommu_dont_flush_iotlb) = 0;
 
         ret = iommu_iotlb_flush(d, _dfn(xatp->idx - done), done,
-                                IOMMU_FLUSHF_modified);
+                                IOMMU_FLUSHF_modified, 0);
         if ( unlikely(ret) && rc >= 0 )
             rc = ret;
 
@@ -939,7 +939,7 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
             put_page(pages[i]);
 
         ret = iommu_iotlb_flush(d, _dfn(xatp->gpfn - done), done,
-                                IOMMU_FLUSHF_added | IOMMU_FLUSHF_modified);
+                                IOMMU_FLUSHF_added | IOMMU_FLUSHF_modified, 0);
         if ( unlikely(ret) && rc >= 0 )
             rc = ret;
     }
diff --git a/xen/drivers/passthrough/Makefile b/xen/drivers/passthrough/Makefile
index a1621540b7..69327080ab 100644
--- a/xen/drivers/passthrough/Makefile
+++ b/xen/drivers/passthrough/Makefile
@@ -4,6 +4,9 @@ obj-$(CONFIG_X86) += x86/
 obj-$(CONFIG_ARM) += arm/
 
 obj-y += iommu.o
+obj-y += context.o
+obj-y += quarantine.o
+
 obj-$(CONFIG_HAS_PCI) += pci.o
 obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
 obj-$(CONFIG_HAS_PCI) += ats.o
diff --git a/xen/drivers/passthrough/context.c b/xen/drivers/passthrough/context.c
new file mode 100644
index 0000000000..d0c07054b3
--- /dev/null
+++ b/xen/drivers/passthrough/context.c
@@ -0,0 +1,626 @@
+/*
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/iommu.h>
+#include <xen/event.h>
+#include <xen/sched.h>
+#include <xen/spinlock.h>
+#include <xen/bitops.h>
+#include <xen/bitmap.h>
+
+bool iommu_check_context(struct domain *d, u16 ctx_no) {
+    struct domain_iommu *hd = dom_iommu(d);
+
+    if (ctx_no == 0)
+        return 1; /* Default context always exist. */
+
+    if ((ctx_no - 1) >= hd->other_contexts.count)
+        return 0; /* out of bounds */
+
+    return test_bit(ctx_no - 1, hd->other_contexts.bitmap);
+}
+
+struct iommu_context *iommu_get_context(struct domain *d, u16 ctx_no) {
+    struct domain_iommu *hd = dom_iommu(d);
+
+    if (!iommu_check_context(d, ctx_no))
+        return NULL;
+
+    if (ctx_no == 0)
+        return &hd->default_ctx;
+    else
+        return &hd->other_contexts.map[ctx_no - 1];
+}
+
+static unsigned int mapping_order(const struct domain_iommu *hd,
+                                  dfn_t dfn, mfn_t mfn, unsigned long nr)
+{
+    unsigned long res = dfn_x(dfn) | mfn_x(mfn);
+    unsigned long sizes = hd->platform_ops->page_sizes;
+    unsigned int bit = ffsl(sizes) - 1, order = 0;
+
+    ASSERT(bit == PAGE_SHIFT);
+
+    while ( (sizes = (sizes >> bit) & ~1) )
+    {
+        unsigned long mask;
+
+        bit = ffsl(sizes) - 1;
+        mask = (1UL << bit) - 1;
+        if ( nr <= mask || (res & mask) )
+            break;
+        order += bit;
+        nr >>= bit;
+        res >>= bit;
+    }
+
+    return order;
+}
+
+long _iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
+               unsigned long page_count, unsigned int flags,
+               unsigned int *flush_flags, u16 ctx_no)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    unsigned long i;
+    unsigned int order, j = 0;
+    int rc = 0;
+
+    if ( !is_iommu_enabled(d) )
+        return 0;
+
+    if (!iommu_check_context(d, ctx_no))
+        return -ENOENT;
+
+    ASSERT(!IOMMUF_order(flags));
+
+    for ( i = 0; i < page_count; i += 1UL << order )
+    {
+        dfn_t dfn = dfn_add(dfn0, i);
+        mfn_t mfn = mfn_add(mfn0, i);
+
+        order = mapping_order(hd, dfn, mfn, page_count - i);
+
+        if ( (flags & IOMMUF_preempt) &&
+             ((!(++j & 0xfff) && general_preempt_check()) ||
+              i > LONG_MAX - (1UL << order)) )
+            return i;
+
+        rc = iommu_call(hd->platform_ops, map_page, d, dfn, mfn,
+                        flags | IOMMUF_order(order), flush_flags,
+                        iommu_get_context(d, ctx_no));
+
+        if ( likely(!rc) )
+            continue;
+
+        if ( !d->is_shutting_down && printk_ratelimit() )
+            printk(XENLOG_ERR
+                   "d%d: IOMMU mapping dfn %"PRI_dfn" to mfn %"PRI_mfn" failed: %d\n",
+                   d->domain_id, dfn_x(dfn), mfn_x(mfn), rc);
+
+        /* while statement to satisfy __must_check */
+        while ( _iommu_unmap(d, dfn0, i, 0, flush_flags, ctx_no) )
+            break;
+
+        if ( !ctx_no && !is_hardware_domain(d) )
+            domain_crash(d);
+
+        break;
+    }
+
+    /*
+     * Something went wrong so, if we were dealing with more than a single
+     * page, flush everything and clear flush flags.
+     */
+    if ( page_count > 1 && unlikely(rc) &&
+         !iommu_iotlb_flush_all(d, *flush_flags) )
+        *flush_flags = 0;
+
+    return rc;
+}
+
+long iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
+               unsigned long page_count, unsigned int flags,
+               unsigned int *flush_flags, u16 ctx_no)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    long ret;
+
+    spin_lock(&hd->lock);
+    ret = _iommu_map(d, dfn0, mfn0, page_count, flags, flush_flags, ctx_no);
+    spin_unlock(&hd->lock);
+
+    return ret;
+}
+
+int iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t mfn,
+                     unsigned long page_count, unsigned int flags)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    unsigned int flush_flags = 0;
+    int rc;
+
+    ASSERT(!(flags & IOMMUF_preempt));
+
+    spin_lock(&hd->lock);
+    rc = _iommu_map(d, dfn, mfn, page_count, flags, &flush_flags, 0);
+
+    if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
+        rc = _iommu_iotlb_flush(d, dfn, page_count, flush_flags, 0);
+    spin_unlock(&hd->lock);
+
+    return rc;
+}
+
+long iommu_unmap(struct domain *d, dfn_t dfn0, unsigned long page_count,
+                 unsigned int flags, unsigned int *flush_flags,
+                 u16 ctx_no)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    long ret;
+
+    spin_lock(&hd->lock);
+    ret = _iommu_unmap(d, dfn0, page_count, flags, flush_flags, ctx_no);
+    spin_unlock(&hd->lock);
+
+    return ret;
+}
+
+long _iommu_unmap(struct domain *d, dfn_t dfn0, unsigned long page_count,
+                  unsigned int flags, unsigned int *flush_flags,
+                  u16 ctx_no)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    unsigned long i;
+    unsigned int order, j = 0;
+    int rc = 0;
+
+    if ( !is_iommu_enabled(d) )
+        return 0;
+
+    if ( !iommu_check_context(d, ctx_no) )
+        return -ENOENT;
+
+    ASSERT(!(flags & ~IOMMUF_preempt));
+
+    for ( i = 0; i < page_count; i += 1UL << order )
+    {
+        dfn_t dfn = dfn_add(dfn0, i);
+        int err;
+
+        order = mapping_order(hd, dfn, _mfn(0), page_count - i);
+
+        if ( (flags & IOMMUF_preempt) &&
+             ((!(++j & 0xfff) && general_preempt_check()) ||
+              i > LONG_MAX - (1UL << order)) )
+            return i;
+
+        err = iommu_call(hd->platform_ops, unmap_page, d, dfn,
+                         flags | IOMMUF_order(order), flush_flags,
+                         iommu_get_context(d, ctx_no));
+
+        if ( likely(!err) )
+            continue;
+
+        if ( !d->is_shutting_down && printk_ratelimit() )
+            printk(XENLOG_ERR
+                   "d%d: IOMMU unmapping dfn %"PRI_dfn" failed: %d\n",
+                   d->domain_id, dfn_x(dfn), err);
+
+        if ( !rc )
+            rc = err;
+
+        if ( !is_hardware_domain(d) )
+        {
+            domain_crash(d);
+            break;
+        }
+    }
+
+    /*
+     * Something went wrong so, if we were dealing with more than a single
+     * page, flush everything and clear flush flags.
+     */
+    if ( page_count > 1 && unlikely(rc) &&
+         !iommu_iotlb_flush_all(d, *flush_flags) )
+        *flush_flags = 0;
+
+    return rc;
+}
+
+int iommu_legacy_unmap(struct domain *d, dfn_t dfn, unsigned long page_count)
+{
+    unsigned int flush_flags = 0;
+    struct domain_iommu *hd = dom_iommu(d);
+    int rc;
+
+    spin_lock(&hd->lock);
+    rc = _iommu_unmap(d, dfn, page_count, 0, &flush_flags, 0);
+
+    if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
+        rc = _iommu_iotlb_flush(d, dfn, page_count, flush_flags, 0);
+    spin_unlock(&hd->lock);
+
+    return rc;
+}
+
+int iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
+                      unsigned int *flags, u16 ctx_no)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    int ret;
+
+    if ( !is_iommu_enabled(d) || !hd->platform_ops->lookup_page )
+        return -EOPNOTSUPP;
+
+    if (!iommu_check_context(d, ctx_no))
+        return -ENOENT;
+
+    spin_lock(&hd->lock);
+    ret = iommu_call(hd->platform_ops, lookup_page, d, dfn, mfn, flags, iommu_get_context(d, ctx_no));
+    spin_unlock(&hd->lock);
+
+    return ret;
+}
+
+int _iommu_iotlb_flush(struct domain *d, dfn_t dfn, unsigned long page_count,
+                       unsigned int flush_flags, u16 ctx_no)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    int rc;
+
+    if ( !is_iommu_enabled(d) || !hd->platform_ops->iotlb_flush ||
+         !page_count || !flush_flags )
+        return 0;
+
+    if ( dfn_eq(dfn, INVALID_DFN) )
+        return -EINVAL;
+
+    if ( !iommu_check_context(d, ctx_no) ) {
+        spin_unlock(&hd->lock);
+        return -ENOENT;
+    }
+
+    rc = iommu_call(hd->platform_ops, iotlb_flush, d, iommu_get_context(d, ctx_no),
+                    dfn, page_count, flush_flags);
+    if ( unlikely(rc) )
+    {
+        if ( !d->is_shutting_down && printk_ratelimit() )
+            printk(XENLOG_ERR
+                   "d%d: IOMMU IOTLB flush failed: %d, dfn %"PRI_dfn", page count %lu flags %x\n",
+                   d->domain_id, rc, dfn_x(dfn), page_count, flush_flags);
+
+        if ( !is_hardware_domain(d) )
+            domain_crash(d);
+    }
+
+    return rc;
+}
+
+int iommu_iotlb_flush(struct domain *d, dfn_t dfn, unsigned long page_count,
+                      unsigned int flush_flags, u16 ctx_no)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    int ret;
+
+    spin_lock(&hd->lock);
+    ret = _iommu_iotlb_flush(d, dfn, page_count, flush_flags, ctx_no);
+    spin_unlock(&hd->lock);
+
+    return ret;
+}
+
+int iommu_context_init(struct domain *d, struct iommu_context *ctx, u16 ctx_no, u32 flags)
+{
+    if ( !dom_iommu(d)->platform_ops->context_init )
+        return -ENOSYS;
+
+    INIT_LIST_HEAD(&ctx->devices);
+    ctx->id = ctx_no;
+    ctx->dying = false;
+
+    return iommu_call(dom_iommu(d)->platform_ops, context_init, d, ctx, flags);
+}
+
+int iommu_context_alloc(struct domain *d, u16 *ctx_no, u32 flags)
+{
+    unsigned int i;
+    int ret;
+    struct domain_iommu *hd = dom_iommu(d);
+
+    spin_lock(&hd->lock);
+
+    /* TODO: use TSL instead ? */
+    i = find_first_zero_bit(hd->other_contexts.bitmap, hd->other_contexts.count);
+
+    if ( i < hd->other_contexts.count )
+        set_bit(i, hd->other_contexts.bitmap);
+
+    if ( i >= hd->other_contexts.count ) /* no free context */
+        return -ENOSPC;
+
+    *ctx_no = i + 1;
+
+    ret = iommu_context_init(d, iommu_get_context(d, *ctx_no), *ctx_no, flags);
+
+    if ( ret )
+        __clear_bit(*ctx_no, hd->other_contexts.bitmap);
+
+    spin_unlock(&hd->lock);
+
+    return ret;
+}
+
+int _iommu_attach_context(struct domain *d, device_t *dev, u16 ctx_no)
+{
+    struct iommu_context *ctx;
+    int ret;
+
+    pcidevs_lock();
+
+    if ( !iommu_check_context(d, ctx_no) )
+    {
+        ret = -ENOENT;
+        goto unlock;
+    }
+
+    ctx = iommu_get_context(d, ctx_no);
+
+    if ( ctx->dying )
+    {
+        ret = -EINVAL;
+        goto unlock;
+    }
+
+    ret = iommu_call(dom_iommu(d)->platform_ops, attach, d, dev, ctx);
+
+    if ( !ret )
+    {
+        dev->context = ctx_no;
+        list_add(&dev->context_list, &ctx->devices);
+    }
+
+unlock:
+    pcidevs_unlock();
+    return ret;
+}
+
+int iommu_attach_context(struct domain *d, device_t *dev, u16 ctx_no)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    int ret;
+
+    spin_lock(&hd->lock);
+    ret = _iommu_attach_context(d, dev, ctx_no);
+    spin_unlock(&hd->lock);
+
+    return ret;
+}
+
+int _iommu_detach_context(struct domain *d, device_t *dev)
+{
+    struct iommu_context *ctx;
+    int ret;
+
+    if (!dev->domain)
+    {
+        printk("IOMMU: Trying to detach a non-attached device.");
+        WARN();
+        return 0;
+    }
+
+    /* Make sure device is actually in the domain. */
+    ASSERT(d == dev->domain);
+
+    pcidevs_lock();
+
+    ctx = iommu_get_context(d, dev->context);
+    ASSERT(ctx); /* device is using an invalid context ?
+                    dev->context invalid ? */
+
+    ret = iommu_call(dom_iommu(d)->platform_ops, detach, d, dev, ctx);
+
+    if ( !ret )
+    {
+        list_del(&dev->context_list);
+
+        /** TODO: Do we need to remove the device from domain ?
+         *        Reattaching to something (quarantine, hardware domain ?)
+         */
+
+        /*
+         * rcu_lock_domain ?
+         * list_del(&dev->domain_list);
+         * dev->domain = ?;
+         */
+    }
+
+    pcidevs_unlock();
+    return ret;
+}
+
+int iommu_detach_context(struct domain *d, device_t *dev)
+{
+    int ret;
+    struct domain_iommu *hd = dom_iommu(d);
+
+    spin_lock(&hd->lock);
+    ret = _iommu_detach_context(d, dev);
+    spin_unlock(&hd->lock);
+
+    return ret;
+}
+
+int _iommu_reattach_context(struct domain *prev_dom, struct domain *next_dom,
+                            device_t *dev, u16 ctx_no)
+{
+    struct domain_iommu *hd;
+    u16 prev_ctx_no;
+    device_t *ctx_dev;
+    struct iommu_context *prev_ctx, *next_ctx;
+    int ret;
+    bool same_domain;
+
+    /* Make sure we actually are doing something meaningful */
+    BUG_ON(!prev_dom && !next_dom);
+
+    /// TODO: Do such cases exists ?
+    // /* Platform ops must match */
+    // if (dom_iommu(prev_dom)->platform_ops != dom_iommu(next_dom)->platform_ops)
+    //     return -EINVAL;
+
+    pcidevs_lock();
+
+    if (!prev_dom)
+        return _iommu_attach_context(next_dom, dev, ctx_no);
+
+    if (!next_dom)
+        return _iommu_detach_context(prev_dom, dev);
+
+    hd = dom_iommu(prev_dom);
+    same_domain = prev_dom == next_dom;
+
+    prev_ctx_no = dev->context;
+
+    if ( !same_domain && (ctx_no == prev_ctx_no) )
+    {
+        printk(XENLOG_DEBUG "Reattaching %pp to same IOMMU context c%hu\n", &dev, ctx_no);
+        ret = 0;
+        goto unlock;
+    }
+
+    if ( !iommu_check_context(next_dom, ctx_no) )
+    {
+        ret = -ENOENT;
+        goto unlock;
+    }
+
+    prev_ctx = iommu_get_context(prev_dom, prev_ctx_no);
+    next_ctx = iommu_get_context(next_dom, ctx_no);
+
+    if ( next_ctx->dying )
+    {
+        ret = -EINVAL;
+        goto unlock;
+    }
+
+    ret = iommu_call(hd->platform_ops, reattach, next_dom, dev, prev_ctx,
+                     next_ctx);
+
+    if ( ret )
+        goto unlock;
+
+    /* Remove device from previous context, and add it to new one. */
+    list_for_each_entry(ctx_dev, &prev_ctx->devices, context_list)
+    {
+        if ( ctx_dev == dev )
+        {
+            list_del(&ctx_dev->context_list);
+            list_add(&ctx_dev->context_list, &next_ctx->devices);
+            break;
+        }
+    }
+
+    if ( !same_domain )
+    {
+        /* Update domain pci devices accordingly */
+
+        /** TODO: should be done here or elsewhere ? */
+    }
+
+    if (!ret)
+        dev->context = ctx_no; /* update device context*/
+
+unlock:
+    pcidevs_unlock();
+    return ret;
+}
+
+int iommu_reattach_context(struct domain *prev_dom, struct domain *next_dom,
+                           device_t *dev, u16 ctx_no)
+{
+    int ret;
+    struct domain_iommu *prev_hd = dom_iommu(prev_dom);
+    struct domain_iommu *next_hd = dom_iommu(next_dom);
+
+    spin_lock(&prev_hd->lock);
+
+    if (prev_dom != next_dom)
+        spin_lock(&next_hd->lock);
+
+    ret = _iommu_reattach_context(prev_dom, next_dom, dev, ctx_no);
+
+    spin_unlock(&prev_hd->lock);
+
+    if (prev_dom != next_dom)
+        spin_unlock(&next_hd->lock);
+
+    return ret;
+}
+
+int _iommu_context_teardown(struct domain *d, struct iommu_context *ctx, u32 flags)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+
+    if ( !dom_iommu(d)->platform_ops->context_teardown )
+        return -ENOSYS;
+
+    ctx->dying = true;
+
+    /* first reattach devices back to default context if needed */
+    if ( flags & IOMMU_TEARDOWN_REATTACH_DEFAULT )
+    {
+        struct pci_dev *device;
+        list_for_each_entry(device, &ctx->devices, context_list)
+            _iommu_reattach_context(d, d, device, 0);
+    }
+    else if (!list_empty(&ctx->devices))
+        return -EBUSY; /* there is a device in context */
+
+    return iommu_call(hd->platform_ops, context_teardown, d, ctx, flags);
+}
+
+int iommu_context_teardown(struct domain *d, struct iommu_context *ctx, u32 flags)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    int ret;
+
+    spin_lock(&hd->lock);
+    ret = _iommu_context_teardown(d, ctx, flags);
+    spin_unlock(&hd->lock);
+
+    return ret;
+}
+
+int iommu_context_free(struct domain *d, u16 ctx_no, u32 flags)
+{
+    int ret;
+    struct domain_iommu *hd = dom_iommu(d);
+
+    if ( ctx_no == 0 )
+        return -EINVAL;
+
+    spin_lock(&hd->lock);
+    if ( !iommu_check_context(d, ctx_no) )
+        return -ENOENT;
+
+    ret = _iommu_context_teardown(d, iommu_get_context(d, ctx_no), flags);
+
+    if ( !ret )
+        clear_bit(ctx_no - 1, hd->other_contexts.bitmap);
+
+    spin_unlock(&hd->lock);
+
+    return ret;
+}
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 50bfd62553..48ffa0f97e 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -12,15 +12,14 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/pci.h>
 #include <xen/sched.h>
 #include <xen/iommu.h>
-#include <xen/paging.h>
-#include <xen/guest_access.h>
-#include <xen/event.h>
 #include <xen/param.h>
-#include <xen/softirq.h>
+#include <xen/spinlock.h>
 #include <xen/keyhandler.h>
-#include <xsm/xsm.h>
+#include <asm/iommu.h>
+#include <asm/bitops.h>
 
 #ifdef CONFIG_X86
 #include <asm/e820.h>
@@ -35,22 +34,6 @@ bool __read_mostly force_iommu;
 bool __read_mostly iommu_verbose;
 static bool __read_mostly iommu_crash_disable;
 
-#define IOMMU_quarantine_none         0 /* aka false */
-#define IOMMU_quarantine_basic        1 /* aka true */
-#define IOMMU_quarantine_scratch_page 2
-#ifdef CONFIG_HAS_PCI
-uint8_t __read_mostly iommu_quarantine =
-# if defined(CONFIG_IOMMU_QUARANTINE_NONE)
-    IOMMU_quarantine_none;
-# elif defined(CONFIG_IOMMU_QUARANTINE_BASIC)
-    IOMMU_quarantine_basic;
-# elif defined(CONFIG_IOMMU_QUARANTINE_SCRATCH_PAGE)
-    IOMMU_quarantine_scratch_page;
-# endif
-#else
-# define iommu_quarantine IOMMU_quarantine_none
-#endif /* CONFIG_HAS_PCI */
-
 static bool __hwdom_initdata iommu_hwdom_none;
 bool __hwdom_initdata iommu_hwdom_strict;
 bool __read_mostly iommu_hwdom_passthrough;
@@ -61,6 +44,13 @@ int8_t __hwdom_initdata iommu_hwdom_reserved = -1;
 bool __read_mostly iommu_hap_pt_share = true;
 #endif
 
+uint16_t __read_mostly iommu_hwdom_nb_ctx = 8;
+bool __read_mostly iommu_hwdom_nb_ctx_forced = false;
+
+#ifdef CONFIG_X86
+unsigned int __read_mostly iommu_hwdom_arena_order = CONFIG_X86_ARENA_ORDER;
+#endif
+
 bool __read_mostly iommu_debug;
 
 DEFINE_PER_CPU(bool, iommu_dont_flush_iotlb);
@@ -156,6 +146,7 @@ static int __init cf_check parse_dom0_iommu_param(const char *s)
     int rc = 0;
 
     do {
+        long long ll_val;
         int val;
 
         ss = strchr(s, ',');
@@ -172,6 +163,20 @@ static int __init cf_check parse_dom0_iommu_param(const char *s)
             iommu_hwdom_reserved = val;
         else if ( !cmdline_strcmp(s, "none") )
             iommu_hwdom_none = true;
+        else if ( !parse_signed_integer("nb-ctx", s, ss, &ll_val) )
+        {
+            if (ll_val > 0 && ll_val < UINT16_MAX)
+                iommu_hwdom_nb_ctx = ll_val;
+            else
+                printk(XENLOG_WARNING "'nb-ctx=%lld' value out of range!\n", ll_val);
+        }
+        else if ( !parse_signed_integer("arena-order", s, ss, &ll_val) )
+        {
+            if (ll_val > 0)
+                iommu_hwdom_arena_order = ll_val;
+            else
+                printk(XENLOG_WARNING "'arena-order=%lld' value out of range!\n", ll_val);
+        }
         else
             rc = -EINVAL;
 
@@ -193,9 +198,26 @@ static void __hwdom_init check_hwdom_reqs(struct domain *d)
     arch_iommu_check_autotranslated_hwdom(d);
 }
 
+uint16_t __hwdom_init iommu_hwdom_ctx_count(void)
+{
+    if (iommu_hwdom_nb_ctx_forced)
+        return iommu_hwdom_nb_ctx;
+
+    /* TODO: Find a proper way of counting devices ? */
+    return 256;
+
+    /*
+    if (iommu_hwdom_nb_ctx != UINT16_MAX)
+        iommu_hwdom_nb_ctx++;
+    else
+        printk(XENLOG_WARNING " IOMMU: Can't prepare more contexts: too much devices");
+    */
+}
+
 int iommu_domain_init(struct domain *d, unsigned int opts)
 {
     struct domain_iommu *hd = dom_iommu(d);
+    uint16_t other_context_count;
     int ret = 0;
 
     if ( is_hardware_domain(d) )
@@ -236,6 +258,37 @@ int iommu_domain_init(struct domain *d, unsigned int opts)
 
     ASSERT(!(hd->need_sync && hd->hap_pt_share));
 
+    iommu_hwdom_nb_ctx = iommu_hwdom_ctx_count();
+
+    if ( is_hardware_domain(d) )
+    {
+        BUG_ON(iommu_hwdom_nb_ctx == 0); /* sanity check (prevent underflow) */
+        printk(XENLOG_INFO "Dom0 uses %lu IOMMU contexts\n",
+               (unsigned long)iommu_hwdom_nb_ctx);
+        hd->other_contexts.count = iommu_hwdom_nb_ctx - 1;
+    }
+    else if ( d == dom_io )
+    {
+        /* TODO: Determine count differently */
+        hd->other_contexts.count = 128;
+    }
+    else
+        hd->other_contexts.count = 0;
+
+    other_context_count = hd->other_contexts.count;
+    if (other_context_count > 0) {
+        /* Initialize context bitmap */
+        hd->other_contexts.bitmap = xzalloc_array(unsigned long,
+                                                  BITS_TO_LONGS(other_context_count));
+        hd->other_contexts.map = xzalloc_array(struct iommu_context,
+                                               other_context_count);
+    } else {
+        hd->other_contexts.bitmap = NULL;
+        hd->other_contexts.map = NULL;
+    }
+
+    iommu_context_init(d, &hd->default_ctx, 0, IOMMU_CONTEXT_INIT_default);
+
     return 0;
 }
 
@@ -249,13 +302,12 @@ static void cf_check iommu_dump_page_tables(unsigned char key)
 
     for_each_domain(d)
     {
-        if ( is_hardware_domain(d) || !is_iommu_enabled(d) )
+        if ( !is_iommu_enabled(d) )
             continue;
 
         if ( iommu_use_hap_pt(d) )
         {
             printk("%pd sharing page tables\n", d);
-            continue;
         }
 
         iommu_vcall(dom_iommu(d)->platform_ops, dump_page_tables, d);
@@ -276,10 +328,13 @@ void __hwdom_init iommu_hwdom_init(struct domain *d)
     iommu_vcall(hd->platform_ops, hwdom_init, d);
 }
 
-static void iommu_teardown(struct domain *d)
+void iommu_domain_destroy(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
 
+    if ( !is_iommu_enabled(d) )
+        return;
+
     /*
      * During early domain creation failure, we may reach here with the
      * ops not yet initialized.
@@ -288,224 +343,10 @@ static void iommu_teardown(struct domain *d)
         return;
 
     iommu_vcall(hd->platform_ops, teardown, d);
-}
-
-void iommu_domain_destroy(struct domain *d)
-{
-    if ( !is_iommu_enabled(d) )
-        return;
-
-    iommu_teardown(d);
 
     arch_iommu_domain_destroy(d);
 }
 
-static unsigned int mapping_order(const struct domain_iommu *hd,
-                                  dfn_t dfn, mfn_t mfn, unsigned long nr)
-{
-    unsigned long res = dfn_x(dfn) | mfn_x(mfn);
-    unsigned long sizes = hd->platform_ops->page_sizes;
-    unsigned int bit = ffsl(sizes) - 1, order = 0;
-
-    ASSERT(bit == PAGE_SHIFT);
-
-    while ( (sizes = (sizes >> bit) & ~1) )
-    {
-        unsigned long mask;
-
-        bit = ffsl(sizes) - 1;
-        mask = (1UL << bit) - 1;
-        if ( nr <= mask || (res & mask) )
-            break;
-        order += bit;
-        nr >>= bit;
-        res >>= bit;
-    }
-
-    return order;
-}
-
-long iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
-               unsigned long page_count, unsigned int flags,
-               unsigned int *flush_flags)
-{
-    const struct domain_iommu *hd = dom_iommu(d);
-    unsigned long i;
-    unsigned int order, j = 0;
-    int rc = 0;
-
-    if ( !is_iommu_enabled(d) )
-        return 0;
-
-    ASSERT(!IOMMUF_order(flags));
-
-    for ( i = 0; i < page_count; i += 1UL << order )
-    {
-        dfn_t dfn = dfn_add(dfn0, i);
-        mfn_t mfn = mfn_add(mfn0, i);
-
-        order = mapping_order(hd, dfn, mfn, page_count - i);
-
-        if ( (flags & IOMMUF_preempt) &&
-             ((!(++j & 0xfff) && general_preempt_check()) ||
-              i > LONG_MAX - (1UL << order)) )
-            return i;
-
-        rc = iommu_call(hd->platform_ops, map_page, d, dfn, mfn,
-                        flags | IOMMUF_order(order), flush_flags);
-
-        if ( likely(!rc) )
-            continue;
-
-        if ( !d->is_shutting_down && printk_ratelimit() )
-            printk(XENLOG_ERR
-                   "d%d: IOMMU mapping dfn %"PRI_dfn" to mfn %"PRI_mfn" failed: %d\n",
-                   d->domain_id, dfn_x(dfn), mfn_x(mfn), rc);
-
-        /* while statement to satisfy __must_check */
-        while ( iommu_unmap(d, dfn0, i, 0, flush_flags) )
-            break;
-
-        if ( !is_hardware_domain(d) )
-            domain_crash(d);
-
-        break;
-    }
-
-    /*
-     * Something went wrong so, if we were dealing with more than a single
-     * page, flush everything and clear flush flags.
-     */
-    if ( page_count > 1 && unlikely(rc) &&
-         !iommu_iotlb_flush_all(d, *flush_flags) )
-        *flush_flags = 0;
-
-    return rc;
-}
-
-int iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t mfn,
-                     unsigned long page_count, unsigned int flags)
-{
-    unsigned int flush_flags = 0;
-    int rc;
-
-    ASSERT(!(flags & IOMMUF_preempt));
-    rc = iommu_map(d, dfn, mfn, page_count, flags, &flush_flags);
-
-    if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
-        rc = iommu_iotlb_flush(d, dfn, page_count, flush_flags);
-
-    return rc;
-}
-
-long iommu_unmap(struct domain *d, dfn_t dfn0, unsigned long page_count,
-                 unsigned int flags, unsigned int *flush_flags)
-{
-    const struct domain_iommu *hd = dom_iommu(d);
-    unsigned long i;
-    unsigned int order, j = 0;
-    int rc = 0;
-
-    if ( !is_iommu_enabled(d) )
-        return 0;
-
-    ASSERT(!(flags & ~IOMMUF_preempt));
-
-    for ( i = 0; i < page_count; i += 1UL << order )
-    {
-        dfn_t dfn = dfn_add(dfn0, i);
-        int err;
-
-        order = mapping_order(hd, dfn, _mfn(0), page_count - i);
-
-        if ( (flags & IOMMUF_preempt) &&
-             ((!(++j & 0xfff) && general_preempt_check()) ||
-              i > LONG_MAX - (1UL << order)) )
-            return i;
-
-        err = iommu_call(hd->platform_ops, unmap_page, d, dfn,
-                         flags | IOMMUF_order(order), flush_flags);
-
-        if ( likely(!err) )
-            continue;
-
-        if ( !d->is_shutting_down && printk_ratelimit() )
-            printk(XENLOG_ERR
-                   "d%d: IOMMU unmapping dfn %"PRI_dfn" failed: %d\n",
-                   d->domain_id, dfn_x(dfn), err);
-
-        if ( !rc )
-            rc = err;
-
-        if ( !is_hardware_domain(d) )
-        {
-            domain_crash(d);
-            break;
-        }
-    }
-
-    /*
-     * Something went wrong so, if we were dealing with more than a single
-     * page, flush everything and clear flush flags.
-     */
-    if ( page_count > 1 && unlikely(rc) &&
-         !iommu_iotlb_flush_all(d, *flush_flags) )
-        *flush_flags = 0;
-
-    return rc;
-}
-
-int iommu_legacy_unmap(struct domain *d, dfn_t dfn, unsigned long page_count)
-{
-    unsigned int flush_flags = 0;
-    int rc = iommu_unmap(d, dfn, page_count, 0, &flush_flags);
-
-    if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
-        rc = iommu_iotlb_flush(d, dfn, page_count, flush_flags);
-
-    return rc;
-}
-
-int iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
-                      unsigned int *flags)
-{
-    const struct domain_iommu *hd = dom_iommu(d);
-
-    if ( !is_iommu_enabled(d) || !hd->platform_ops->lookup_page )
-        return -EOPNOTSUPP;
-
-    return iommu_call(hd->platform_ops, lookup_page, d, dfn, mfn, flags);
-}
-
-int iommu_iotlb_flush(struct domain *d, dfn_t dfn, unsigned long page_count,
-                      unsigned int flush_flags)
-{
-    const struct domain_iommu *hd = dom_iommu(d);
-    int rc;
-
-    if ( !is_iommu_enabled(d) || !hd->platform_ops->iotlb_flush ||
-         !page_count || !flush_flags )
-        return 0;
-
-    if ( dfn_eq(dfn, INVALID_DFN) )
-        return -EINVAL;
-
-    rc = iommu_call(hd->platform_ops, iotlb_flush, d, dfn, page_count,
-                    flush_flags);
-    if ( unlikely(rc) )
-    {
-        if ( !d->is_shutting_down && printk_ratelimit() )
-            printk(XENLOG_ERR
-                   "d%d: IOMMU IOTLB flush failed: %d, dfn %"PRI_dfn", page count %lu flags %x\n",
-                   d->domain_id, rc, dfn_x(dfn), page_count, flush_flags);
-
-        if ( !is_hardware_domain(d) )
-            domain_crash(d);
-    }
-
-    return rc;
-}
-
 int iommu_iotlb_flush_all(struct domain *d, unsigned int flush_flags)
 {
     const struct domain_iommu *hd = dom_iommu(d);
@@ -515,7 +356,7 @@ int iommu_iotlb_flush_all(struct domain *d, unsigned int flush_flags)
          !flush_flags )
         return 0;
 
-    rc = iommu_call(hd->platform_ops, iotlb_flush, d, INVALID_DFN, 0,
+    rc = iommu_call(hd->platform_ops, iotlb_flush, d, NULL, INVALID_DFN, 0,
                     flush_flags | IOMMU_FLUSHF_all);
     if ( unlikely(rc) )
     {
@@ -531,24 +372,6 @@ int iommu_iotlb_flush_all(struct domain *d, unsigned int flush_flags)
     return rc;
 }
 
-int iommu_quarantine_dev_init(device_t *dev)
-{
-    const struct domain_iommu *hd = dom_iommu(dom_io);
-
-    if ( !iommu_quarantine || !hd->platform_ops->quarantine_init )
-        return 0;
-
-    return iommu_call(hd->platform_ops, quarantine_init,
-                      dev, iommu_quarantine == IOMMU_quarantine_scratch_page);
-}
-
-static int __init iommu_quarantine_init(void)
-{
-    dom_io->options |= XEN_DOMCTL_CDF_iommu;
-
-    return iommu_domain_init(dom_io, 0);
-}
-
 int __init iommu_setup(void)
 {
     int rc = -ENODEV;
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 5a446d3dce..fc3315f8ed 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1,6 +1,6 @@
 /*
  * Copyright (C) 2008,  Netronome Systems, Inc.
- *                
+ *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
  * version 2, as published by the Free Software Foundation.
@@ -286,14 +286,14 @@ static void apply_quirks(struct pci_dev *pdev)
          * Device [8086:2fc0]
          * Erratum HSE43
          * CONFIG_TDP_NOMINAL CSR Implemented at Incorrect Offset
-         * http://www.intel.com/content/www/us/en/processors/xeon/xeon-e5-v3-spec-update.html 
+         * http://www.intel.com/content/www/us/en/processors/xeon/xeon-e5-v3-spec-update.html
          */
         { PCI_VENDOR_ID_INTEL, 0x2fc0 },
         /*
          * Devices [8086:6f60,6fa0,6fc0]
          * Errata BDF2 / BDX2
          * PCI BARs in the Home Agent Will Return Non-Zero Values During Enumeration
-         * http://www.intel.com/content/www/us/en/processors/xeon/xeon-e5-v4-spec-update.html 
+         * http://www.intel.com/content/www/us/en/processors/xeon/xeon-e5-v4-spec-update.html
         */
         { PCI_VENDOR_ID_INTEL, 0x6f60 },
         { PCI_VENDOR_ID_INTEL, 0x6fa0 },
@@ -870,8 +870,8 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
         devfn += pdev->phantom_stride;
         if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
             break;
-        ret = iommu_call(hd->platform_ops, reassign_device, d, target, devfn,
-                         pci_to_dev(pdev));
+        ret = iommu_call(hd->platform_ops, add_devfn, d, pci_to_dev(pdev), devfn,
+                         &target->iommu.default_ctx);
         if ( ret )
             goto out;
     }
@@ -880,9 +880,9 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
     vpci_deassign_device(pdev);
     write_unlock(&d->pci_lock);
 
-    devfn = pdev->devfn;
-    ret = iommu_call(hd->platform_ops, reassign_device, d, target, devfn,
-                     pci_to_dev(pdev));
+    ret = iommu_call(hd->platform_ops, reattach, target, pci_to_dev(pdev),
+                     iommu_get_context(d, pdev->context),
+                     iommu_default_context(target));
     if ( ret )
         goto out;
 
@@ -890,6 +890,7 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
         pdev->quarantine = false;
 
     pdev->fault.count = 0;
+    pdev->domain = target;
 
     write_lock(&target->pci_lock);
     /* Re-assign back to hardware_domain */
@@ -1329,12 +1330,7 @@ static int cf_check _dump_pci_devices(struct pci_seg *pseg, void *arg)
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
     {
         printk("%pp - ", &pdev->sbdf);
-#ifdef CONFIG_X86
-        if ( pdev->domain == dom_io )
-            printk("DomIO:%x", pdev->arch.pseudo_domid);
-        else
-#endif
-            printk("%pd", pdev->domain);
+        printk("%pd", pdev->domain);
         printk(" - node %-3d", (pdev->node != NUMA_NO_NODE) ? pdev->node : -1);
         pdev_dump_msi(pdev);
         printk("\n");
@@ -1373,7 +1369,7 @@ static int iommu_add_device(struct pci_dev *pdev)
     if ( !is_iommu_enabled(pdev->domain) )
         return 0;
 
-    rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
+    rc = iommu_attach_context(pdev->domain, pci_to_dev(pdev), 0);
     if ( rc || !pdev->phantom_stride )
         return rc;
 
@@ -1382,7 +1378,9 @@ static int iommu_add_device(struct pci_dev *pdev)
         devfn += pdev->phantom_stride;
         if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
             return 0;
-        rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
+
+        rc = iommu_call(hd->platform_ops, add_devfn, pdev->domain, pdev, devfn,
+                        iommu_default_context(pdev->domain));
         if ( rc )
             printk(XENLOG_WARNING "IOMMU: add %pp failed (%d)\n",
                    &PCI_SBDF(pdev->seg, pdev->bus, devfn), rc);
@@ -1409,6 +1407,7 @@ static int iommu_enable_device(struct pci_dev *pdev)
 static int iommu_remove_device(struct pci_dev *pdev)
 {
     const struct domain_iommu *hd;
+    struct iommu_context *ctx;
     u8 devfn;
 
     if ( !pdev->domain )
@@ -1418,6 +1417,10 @@ static int iommu_remove_device(struct pci_dev *pdev)
     if ( !is_iommu_enabled(pdev->domain) )
         return 0;
 
+    ctx = iommu_get_context(pdev->domain, pdev->context);
+    if ( !ctx )
+        return -EINVAL;
+
     for ( devfn = pdev->devfn ; pdev->phantom_stride; )
     {
         int rc;
@@ -1425,8 +1428,8 @@ static int iommu_remove_device(struct pci_dev *pdev)
         devfn += pdev->phantom_stride;
         if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
             break;
-        rc = iommu_call(hd->platform_ops, remove_device, devfn,
-                        pci_to_dev(pdev));
+        rc = iommu_call(hd->platform_ops, remove_devfn, pdev->domain, pdev,
+                        devfn, ctx);
         if ( !rc )
             continue;
 
@@ -1437,7 +1440,7 @@ static int iommu_remove_device(struct pci_dev *pdev)
 
     devfn = pdev->devfn;
 
-    return iommu_call(hd->platform_ops, remove_device, devfn, pci_to_dev(pdev));
+    return iommu_detach_context(pdev->domain, pdev);
 }
 
 static int device_assigned(u16 seg, u8 bus, u8 devfn)
@@ -1497,22 +1500,22 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
     if ( pdev->domain != dom_io )
     {
         rc = iommu_quarantine_dev_init(pci_to_dev(pdev));
+        /** TODO: Consider phantom functions */
         if ( rc )
             goto done;
     }
 
     pdev->fault.count = 0;
 
-    rc = iommu_call(hd->platform_ops, assign_device, d, devfn, pci_to_dev(pdev),
-                    flag);
+    iommu_attach_context(d, pci_to_dev(pdev), 0);
 
     while ( pdev->phantom_stride && !rc )
     {
         devfn += pdev->phantom_stride;
         if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
             break;
-        rc = iommu_call(hd->platform_ops, assign_device, d, devfn,
-                        pci_to_dev(pdev), flag);
+        rc = iommu_call(hd->platform_ops, add_devfn, d, pci_to_dev(pdev),
+                        devfn, iommu_default_context(d));
     }
 
     if ( rc )
diff --git a/xen/drivers/passthrough/quarantine.c b/xen/drivers/passthrough/quarantine.c
new file mode 100644
index 0000000000..b58f136ad8
--- /dev/null
+++ b/xen/drivers/passthrough/quarantine.c
@@ -0,0 +1,49 @@
+#include <xen/stdint.h>
+#include <xen/iommu.h>
+#include <xen/sched.h>
+
+#ifdef CONFIG_HAS_PCI
+uint8_t __read_mostly iommu_quarantine =
+# if defined(CONFIG_IOMMU_QUARANTINE_NONE)
+    IOMMU_quarantine_none;
+# elif defined(CONFIG_IOMMU_QUARANTINE_BASIC)
+    IOMMU_quarantine_basic;
+# elif defined(CONFIG_IOMMU_QUARANTINE_SCRATCH_PAGE)
+    IOMMU_quarantine_scratch_page;
+# endif
+#else
+# define iommu_quarantine IOMMU_quarantine_none
+#endif /* CONFIG_HAS_PCI */
+
+int iommu_quarantine_dev_init(device_t *dev)
+{
+    int ret;
+    u16 ctx_no;
+
+    if ( !iommu_quarantine )
+        return 0;
+
+    ret = iommu_context_alloc(dom_io, &ctx_no, IOMMU_CONTEXT_INIT_quarantine);
+
+    if ( ret )
+        return ret;
+
+    /** TODO: Setup scratch page, mappings... */
+
+    ret = iommu_reattach_context(dev->domain, dom_io, dev, ctx_no);
+
+    if ( ret )
+    {
+        ASSERT(!iommu_context_free(dom_io, ctx_no, 0));
+        return ret;
+    }
+
+    return ret;
+}
+
+int __init iommu_quarantine_init(void)
+{
+    dom_io->options |= XEN_DOMCTL_CDF_iommu;
+
+    return iommu_domain_init(dom_io, 0);
+}
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 442ae5322d..47c8bc6f36 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -52,7 +52,11 @@ static inline bool dfn_eq(dfn_t x, dfn_t y)
 #ifdef CONFIG_HAS_PASSTHROUGH
 extern bool iommu_enable, iommu_enabled;
 extern bool force_iommu, iommu_verbose;
+
 /* Boolean except for the specific purposes of drivers/passthrough/iommu.c. */
+#define IOMMU_quarantine_none         0 /* aka false */
+#define IOMMU_quarantine_basic        1 /* aka true */
+#define IOMMU_quarantine_scratch_page 2
 extern uint8_t iommu_quarantine;
 #else
 #define iommu_enabled false
@@ -107,6 +111,11 @@ extern bool amd_iommu_perdev_intremap;
 
 extern bool iommu_hwdom_strict, iommu_hwdom_passthrough, iommu_hwdom_inclusive;
 extern int8_t iommu_hwdom_reserved;
+extern uint16_t iommu_hwdom_nb_ctx;
+
+#ifdef CONFIG_X86
+extern unsigned int iommu_hwdom_arena_order;
+#endif
 
 extern unsigned int iommu_dev_iotlb_timeout;
 
@@ -161,11 +170,16 @@ enum
  */
 long __must_check iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
                             unsigned long page_count, unsigned int flags,
-                            unsigned int *flush_flags);
+                            unsigned int *flush_flags, u16 ctx_no);
+long __must_check _iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
+                             unsigned long page_count, unsigned int flags,
+                             unsigned int *flush_flags, u16 ctx_no);
 long __must_check iommu_unmap(struct domain *d, dfn_t dfn0,
                               unsigned long page_count, unsigned int flags,
-                              unsigned int *flush_flags);
-
+                              unsigned int *flush_flags, u16 ctx_no);
+long __must_check _iommu_unmap(struct domain *d, dfn_t dfn0,
+                               unsigned long page_count, unsigned int flags,
+                               unsigned int *flush_flags, u16 ctx_no);
 int __must_check iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t mfn,
                                   unsigned long page_count,
                                   unsigned int flags);
@@ -173,11 +187,16 @@ int __must_check iommu_legacy_unmap(struct domain *d, dfn_t dfn,
                                     unsigned long page_count);
 
 int __must_check iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
-                                   unsigned int *flags);
+                                   unsigned int *flags, u16 ctx_no);
 
 int __must_check iommu_iotlb_flush(struct domain *d, dfn_t dfn,
                                    unsigned long page_count,
-                                   unsigned int flush_flags);
+                                   unsigned int flush_flags,
+                                   u16 ctx_no);
+int __must_check _iommu_iotlb_flush(struct domain *d, dfn_t dfn,
+                                   unsigned long page_count,
+                                   unsigned int flush_flags,
+                                   u16 ctx_no);
 int __must_check iommu_iotlb_flush_all(struct domain *d,
                                        unsigned int flush_flags);
 
@@ -250,20 +269,31 @@ struct page_info;
  */
 typedef int iommu_grdm_t(xen_pfn_t start, xen_ulong_t nr, u32 id, void *ctxt);
 
+struct iommu_context;
+
 struct iommu_ops {
     unsigned long page_sizes;
     int (*init)(struct domain *d);
     void (*hwdom_init)(struct domain *d);
-    int (*quarantine_init)(device_t *dev, bool scratch_page);
-    int (*add_device)(uint8_t devfn, device_t *dev);
+    int (*context_init)(struct domain *d, struct iommu_context *ctx,
+                        u32 flags);
+    int (*context_teardown)(struct domain *d, struct iommu_context *ctx,
+                            u32 flags);
+    int (*attach)(struct domain *d, device_t *dev,
+                  struct iommu_context *ctx);
+    int (*detach)(struct domain *d, device_t *dev,
+                   struct iommu_context *prev_ctx);
+    int (*reattach)(struct domain *d, device_t *dev,
+                    struct iommu_context *prev_ctx,
+                    struct iommu_context *ctx);
+
     int (*enable_device)(device_t *dev);
-    int (*remove_device)(uint8_t devfn, device_t *dev);
-    int (*assign_device)(struct domain *d, uint8_t devfn, device_t *dev,
-                         uint32_t flag);
-    int (*reassign_device)(struct domain *s, struct domain *t,
-                           uint8_t devfn, device_t *dev);
 #ifdef CONFIG_HAS_PCI
     int (*get_device_group_id)(uint16_t seg, uint8_t bus, uint8_t devfn);
+    int (*add_devfn)(struct domain *d, struct pci_dev *pdev, u16 devfn,
+                     struct iommu_context *ctx);
+    int (*remove_devfn)(struct domain *d, struct pci_dev *pdev, u16 devfn,
+                    struct iommu_context *ctx);
 #endif /* HAS_PCI */
 
     void (*teardown)(struct domain *d);
@@ -274,12 +304,15 @@ struct iommu_ops {
      */
     int __must_check (*map_page)(struct domain *d, dfn_t dfn, mfn_t mfn,
                                  unsigned int flags,
-                                 unsigned int *flush_flags);
+                                 unsigned int *flush_flags,
+                                 struct iommu_context *ctx);
     int __must_check (*unmap_page)(struct domain *d, dfn_t dfn,
                                    unsigned int order,
-                                   unsigned int *flush_flags);
+                                   unsigned int *flush_flags,
+                                   struct iommu_context *ctx);
     int __must_check (*lookup_page)(struct domain *d, dfn_t dfn, mfn_t *mfn,
-                                    unsigned int *flags);
+                                    unsigned int *flags,
+                                    struct iommu_context *ctx);
 
 #ifdef CONFIG_X86
     int (*enable_x2apic)(void);
@@ -292,14 +325,15 @@ struct iommu_ops {
     int (*setup_hpet_msi)(struct msi_desc *msi_desc);
 
     void (*adjust_irq_affinities)(void);
-    void (*clear_root_pgtable)(struct domain *d);
+    void (*clear_root_pgtable)(struct domain *d, struct iommu_context *ctx);
     int (*update_ire_from_msi)(struct msi_desc *msi_desc, struct msi_msg *msg);
 #endif /* CONFIG_X86 */
 
     int __must_check (*suspend)(void);
     void (*resume)(void);
     void (*crash_shutdown)(void);
-    int __must_check (*iotlb_flush)(struct domain *d, dfn_t dfn,
+    int __must_check (*iotlb_flush)(struct domain *d,
+                                    struct iommu_context *ctx, dfn_t dfn,
                                     unsigned long page_count,
                                     unsigned int flush_flags);
     int (*get_reserved_device_memory)(iommu_grdm_t *func, void *ctxt);
@@ -343,11 +377,36 @@ extern int iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
 # define iommu_vcall iommu_call
 #endif
 
+struct iommu_context {
+    u16 id; /* Context id (0 means default context) */
+    struct list_head devices;
+
+    struct arch_iommu_context arch;
+
+    bool opaque; /* context can't be modified nor accessed (e.g HAP) */
+    bool dying; /* the context is tearing down */
+};
+
+struct iommu_context_list {
+    uint16_t count; /* Context count excluding default context */
+
+    /* if count > 0 */
+
+    uint64_t *bitmap; /* bitmap of context allocation */
+    struct iommu_context *map; /* Map of contexts */
+};
+
+
 struct domain_iommu {
+    spinlock_t lock; /* iommu lock */
+
 #ifdef CONFIG_HAS_PASSTHROUGH
     struct arch_iommu arch;
 #endif
 
+    struct iommu_context default_ctx;
+    struct iommu_context_list other_contexts;
+
     /* iommu_ops */
     const struct iommu_ops *platform_ops;
 
@@ -380,6 +439,7 @@ struct domain_iommu {
 #define dom_iommu(d)              (&(d)->iommu)
 #define iommu_set_feature(d, f)   set_bit(f, dom_iommu(d)->features)
 #define iommu_clear_feature(d, f) clear_bit(f, dom_iommu(d)->features)
+#define iommu_default_context(d) (&dom_iommu(d)->default_ctx)
 
 /* Are we using the domain P2M table as its IOMMU pagetable? */
 #define iommu_use_hap_pt(d)       (IS_ENABLED(CONFIG_HVM) && \
@@ -405,6 +465,8 @@ int __must_check iommu_suspend(void);
 void iommu_resume(void);
 void iommu_crash_shutdown(void);
 int iommu_get_reserved_device_memory(iommu_grdm_t *func, void *ctxt);
+
+int __init iommu_quarantine_init(void);
 int iommu_quarantine_dev_init(device_t *dev);
 
 #ifdef CONFIG_HAS_PCI
@@ -414,6 +476,28 @@ int iommu_do_pci_domctl(struct xen_domctl *domctl, struct domain *d,
 
 void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev);
 
+struct iommu_context *iommu_get_context(struct domain *d, u16 ctx_no);
+bool iommu_check_context(struct domain *d, u16 ctx_no);
+
+#define IOMMU_CONTEXT_INIT_default (1 << 0)
+#define IOMMU_CONTEXT_INIT_quarantine (1 << 1)
+int iommu_context_init(struct domain *d, struct iommu_context *ctx, u16 ctx_no, u32 flags);
+
+#define IOMMU_TEARDOWN_REATTACH_DEFAULT (1 << 0)
+#define IOMMU_TEARDOWN_PREEMPT (1 << 1)
+int iommu_context_teardown(struct domain *d, struct iommu_context *ctx, u32 flags);
+
+int iommu_context_alloc(struct domain *d, u16 *ctx_no, u32 flags);
+int iommu_context_free(struct domain *d, u16 ctx_no, u32 flags);
+
+int iommu_reattach_context(struct domain *prev_dom, struct domain *next_dom,
+                           device_t *dev, u16 ctx_no);
+int iommu_attach_context(struct domain *d, device_t *dev, u16 ctx_no);
+int iommu_detach_context(struct domain *d, device_t *dev);
+
+int _iommu_attach_context(struct domain *d, device_t *dev, u16 ctx_no);
+int _iommu_detach_context(struct domain *d, device_t *dev);
+
 /*
  * The purpose of the iommu_dont_flush_iotlb optional cpu flag is to
  * avoid unecessary iotlb_flush in the low level IOMMU code.
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 63e49f0117..d6d4aaa6a5 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -97,6 +97,7 @@ struct pci_dev_info {
 struct pci_dev {
     struct list_head alldevs_list;
     struct list_head domain_list;
+    struct list_head context_list;
 
     struct list_head msi_list;
 
@@ -104,6 +105,8 @@ struct pci_dev {
 
     struct domain *domain;
 
+    uint16_t context; /* IOMMU context number of domain */
+
     const union {
         struct {
             uint8_t devfn;
-- 
2.45.2



Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


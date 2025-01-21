Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AA8A181CB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 17:13:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875535.1286018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taGse-0002uz-R7; Tue, 21 Jan 2025 16:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875535.1286018; Tue, 21 Jan 2025 16:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taGse-0002rX-MK; Tue, 21 Jan 2025 16:13:32 +0000
Received: by outflank-mailman (input) for mailman id 875535;
 Tue, 21 Jan 2025 16:13:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZsVy=UN=bounce.vates.tech=bounce-md_30504962.678fc7a8.v1-da59f0c36c6e4d75a19f323da7dd1803@srs-se1.protection.inumbo.net>)
 id 1taGsd-0001Ka-KJ
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 16:13:31 +0000
Received: from mail187-43.suw11.mandrillapp.com
 (mail187-43.suw11.mandrillapp.com [198.2.187.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6d56301-d812-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 17:13:29 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-43.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4Ycsh904NczLfH7tZ
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 16:13:29 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 da59f0c36c6e4d75a19f323da7dd1803; Tue, 21 Jan 2025 16:13:28 +0000
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
X-Inumbo-ID: a6d56301-d812-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1737476009; x=1737746009;
	bh=DI5VKSbscTWnrZHNYJyhtqDMfI6IQMQSgrexg8QuZ0s=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=tytfObwyft0hImWnKXZq6v0iGkPPKC4qHD2tGfx//B82TUqXsEjBXGbay9PChiXIY
	 0HRZly6ywFvlAfZyRiCog5al59QDqxowy4xcmZrpogmaGvL3zc62lyj+QJGFtc4hpm
	 VJhvnxKGaXlmZjMYfBLJpQu74KGLKhqvmzT/SmnCECVsF9jS/rsPi3FSyIyFMKKRxy
	 MFsrBw+rvL8En66B9cT5bgyCdqvwcsKja9zLaD6etr6vHP+LS3XUtO1tLjvxhtl3AY
	 dbdXO1Y0/ryDRtKgDwna5959fUjvqRLIzDH1fG1TvKdKH4kjreLVhdVTCHKBntHX0+
	 iPPK3gaWc4BiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1737476009; x=1737736509; i=teddy.astie@vates.tech;
	bh=DI5VKSbscTWnrZHNYJyhtqDMfI6IQMQSgrexg8QuZ0s=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=VcuoUMZr2EwL6adAdxB3YXHtVIQF1geC7KI1aXkqMfNIeM79bG91O6eGZgE/6S3LS
	 KX0GbW6wbQkHU1/icpMRHkwThWZmEXULdp2d7rvYABfGj94T4v8SizPrde5bLciWWw
	 +HllecV6/ouQoaieTI8sQDqvndKa2CuhKArlzO1z11m1jYyxnl2NLNtipPpIfFnJvw
	 2GR5YADnWcQR+GEqDingtyULU/xWr7SGt64nW4g7MGqWg6JCuhdqbgCk4Oe1tJmJPy
	 Y/GgM1MuY1WHx8u/qPa/qGwYVMQrDmEImGv5s2hMEyuxoTwGQ0CcRgWvkUjSOtv2sF
	 SLp9/S82kb6UA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20RFC=20PATCH=20v5=204/5]=20IOMMU:=20Introduce=20redesigned=20IOMMU=20subsystem?=
X-Mailer: git-send-email 2.45.3
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1737476006465
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Lukasz Hawrylko" <lukasz@hawrylko.pl>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, "=?utf-8?Q?Mateusz=20M=C3=B3wka?=" <mateusz.mowka@intel.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Message-Id: <e80bf868a009425c03ce4589bf8af09fb147a6e3.1737470269.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1737470269.git.teddy.astie@vates.tech>
References: <cover.1737470269.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.da59f0c36c6e4d75a19f323da7dd1803?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250121:md
Date: Tue, 21 Jan 2025 16:13:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Based on docs/designs/iommu-contexts.md, implement the redesigned IOMMU subsystem.

Signed-off-by Teddy Astie <teddy.astie@vates.tech>

---
Changed in V2:
* cleanup some unneeded includes
* s/dettach/detach/
* don't dump IOMMU context of non-iommu domains (fix crash with DomUs)

Changed in v4:
* add "no-dma" support
* use new locking logic

Changed in v5:
* rewrote parts of PCI passthrough logic (pci.c)
* reworked quarantine logic (mostly fixes PCI Passthrough)
* make iotlb_flush_all context-specific
* various bug fixes related to iommu initialization with DomUs
  (e.g flags being wrongly defined)
---
 xen/arch/x86/domain.c                |   2 +-
 xen/arch/x86/mm/p2m-ept.c            |   2 +-
 xen/arch/x86/pv/dom0_build.c         |   6 +-
 xen/arch/x86/tboot.c                 |   4 +-
 xen/common/memory.c                  |   4 +-
 xen/drivers/passthrough/Makefile     |   3 +
 xen/drivers/passthrough/context.c    | 740 +++++++++++++++++++++++++++
 xen/drivers/passthrough/iommu.c      | 431 ++++++----------
 xen/drivers/passthrough/pci.c        | 379 +++++---------
 xen/drivers/passthrough/quarantine.c |  49 ++
 xen/include/xen/iommu.h              | 119 ++++-
 xen/include/xen/pci.h                |   3 +
 12 files changed, 1189 insertions(+), 553 deletions(-)
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
index 07e9594493..b77f1c5ca3 100644
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
@@ -943,7 +943,7 @@ static int __init dom0_construct(struct domain *d,
     }
 
     /* Use while() to avoid compiler warning. */
-    while ( iommu_iotlb_flush_all(d, flush_flags) )
+    while ( iommu_iotlb_flush_all(d, 0, flush_flags) )
         break;
 
     if ( initrd_len != 0 )
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
index 0000000000..6e68f840f3
--- /dev/null
+++ b/xen/drivers/passthrough/context.c
@@ -0,0 +1,740 @@
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
+bool cf_check iommu_check_context(struct domain *d, u16 ctx_no) {
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
+struct iommu_context * cf_check iommu_get_context(struct domain *d, u16 ctx_no) {
+    struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx;
+
+    if ( !iommu_check_context(d, ctx_no) )
+        return NULL;
+
+    if (ctx_no == 0)
+        ctx = &hd->default_ctx;
+    else
+        ctx = &hd->other_contexts.map[ctx_no - 1];
+
+    rspin_lock(&ctx->lock);
+    /* Check if the context is still valid at this point */
+    if ( unlikely(!iommu_check_context(d, ctx_no)) )
+    {
+        /* Context has been destroyed in between */
+        rspin_unlock(&ctx->lock);
+        return NULL;
+    }
+
+    return ctx;
+}
+
+void iommu_put_context(struct iommu_context *ctx)
+{
+    rspin_unlock(&ctx->lock);
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
+static long _iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
+                       unsigned long page_count, unsigned int flags,
+                       unsigned int *flush_flags, struct iommu_context *ctx)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    unsigned long i;
+    unsigned int order, j = 0;
+    int rc = 0;
+
+    if ( !is_iommu_enabled(d) )
+        return 0;
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
+                        flags | IOMMUF_order(order), flush_flags, ctx);
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
+        while ( iommu_unmap(d, dfn0, i, 0, flush_flags, ctx->id) )
+            break;
+
+        if ( !ctx->id && !is_hardware_domain(d) )
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
+         !iommu_iotlb_flush_all(d, ctx->id, *flush_flags) )
+        *flush_flags = 0;
+
+    return rc;
+}
+
+long iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
+               unsigned long page_count, unsigned int flags,
+               unsigned int *flush_flags, u16 ctx_no)
+{
+    struct iommu_context *ctx;
+    long ret;
+
+    if ( !(ctx = iommu_get_context(d, ctx_no)) )
+        return -ENOENT;
+
+    ret = _iommu_map(d, dfn0, mfn0, page_count, flags, flush_flags, ctx);
+
+    iommu_put_context(ctx);
+
+    return ret;
+}
+
+int iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t mfn,
+                     unsigned long page_count, unsigned int flags)
+{
+    struct iommu_context *ctx;
+    unsigned int flush_flags = 0;
+    int rc = 0;
+
+    ASSERT(!(flags & IOMMUF_preempt));
+
+    if ( dom_iommu(d)->no_dma )
+        return 0;
+
+    ctx = iommu_get_context(d, 0);
+
+    if ( !ctx->opaque )
+    {
+        rc = iommu_map(d, dfn, mfn, page_count, flags, &flush_flags, 0);
+
+        if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
+            rc = iommu_iotlb_flush(d, dfn, page_count, flush_flags, 0);
+    }
+
+    iommu_put_context(ctx);
+
+    return rc;
+}
+
+static long _iommu_unmap(struct domain *d, dfn_t dfn0, unsigned long page_count,
+                         unsigned int flags, unsigned int *flush_flags,
+                         struct iommu_context *ctx)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    unsigned long i;
+    unsigned int order, j = 0;
+    int rc = 0;
+
+    if ( !is_iommu_enabled(d) )
+        return 0;
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
+                         ctx);
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
+        if ( !ctx->id && !is_hardware_domain(d) )
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
+         !iommu_iotlb_flush_all(d, ctx->id, *flush_flags) )
+        *flush_flags = 0;
+
+    return rc;
+}
+
+long iommu_unmap(struct domain *d, dfn_t dfn0, unsigned long page_count,
+                 unsigned int flags, unsigned int *flush_flags,
+                 u16 ctx_no)
+{
+    struct iommu_context *ctx;
+    long ret;
+
+    if ( !(ctx = iommu_get_context(d, ctx_no)) )
+        return -ENOENT;
+
+    ret = _iommu_unmap(d, dfn0, page_count, flags, flush_flags, ctx);
+
+    iommu_put_context(ctx);
+
+    return ret;
+}
+
+int iommu_legacy_unmap(struct domain *d, dfn_t dfn, unsigned long page_count)
+{
+    unsigned int flush_flags = 0;
+    struct iommu_context *ctx;
+    int rc;
+
+    if ( dom_iommu(d)->no_dma )
+        return 0;
+
+    ctx = iommu_get_context(d, 0);
+
+    if ( ctx->opaque )
+        return 0;
+
+    rc = iommu_unmap(d, dfn, page_count, 0, &flush_flags, 0);
+
+    if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
+        rc = iommu_iotlb_flush(d, dfn, page_count, flush_flags, 0);
+
+    iommu_put_context(ctx);
+
+    return rc;
+}
+
+int iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
+                      unsigned int *flags, u16 ctx_no)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx;
+    int ret = 0;
+
+    if ( !is_iommu_enabled(d) || !hd->platform_ops->lookup_page )
+        return -EOPNOTSUPP;
+
+    if ( !(ctx = iommu_get_context(d, ctx_no)) )
+        return -ENOENT;
+
+    ret = iommu_call(hd->platform_ops, lookup_page, d, dfn, mfn, flags, ctx);
+
+    iommu_put_context(ctx);
+    return ret;
+}
+
+int iommu_iotlb_flush(struct domain *d, dfn_t dfn, unsigned long page_count,
+                      unsigned int flush_flags, u16 ctx_no)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx;
+    int rc;
+
+    if ( !is_iommu_enabled(d) || !hd->platform_ops->iotlb_flush ||
+         !page_count || !flush_flags )
+        return 0;
+
+    if ( dfn_eq(dfn, INVALID_DFN) )
+        return -EINVAL;
+
+    if ( !(ctx = iommu_get_context(d, ctx_no)) )
+        return -ENOENT;
+
+    rc = iommu_call(hd->platform_ops, iotlb_flush, d, ctx, dfn, page_count,
+                    flush_flags);
+    if ( unlikely(rc) )
+    {
+        if ( !d->is_shutting_down && printk_ratelimit() )
+            printk(XENLOG_ERR
+                   "d%d: IOMMU IOTLB flush failed: %d, dfn %"PRI_dfn", page count %lu flags %x\n",
+                   d->domain_id, rc, dfn_x(dfn), page_count, flush_flags);
+
+        if ( !ctx->id && !is_hardware_domain(d) )
+            domain_crash(d);
+    }
+
+    iommu_put_context(ctx);
+
+    return rc;
+}
+
+int iommu_iotlb_flush_all(struct domain *d, u16 ctx_no, unsigned int flush_flags)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx;
+    int rc;
+
+    if ( !(ctx = iommu_get_context(d, ctx_no)) )
+        return -ENOENT;
+
+    rc = iommu_call(hd->platform_ops, iotlb_flush, d, ctx, _dfn(0), 0,
+                    flush_flags | IOMMU_FLUSHF_all);
+    if ( unlikely(rc) )
+    {
+        if ( !d->is_shutting_down && printk_ratelimit() )
+            printk(XENLOG_ERR
+                   "d%d: IOMMU IOTLB flush all failed: %d\n",
+                   d->domain_id, rc);
+
+        if ( !is_hardware_domain(d) )
+            domain_crash(d);
+    }
+
+    iommu_put_context(ctx);
+    return rc;
+}
+
+int cf_check iommu_context_init(struct domain *d, struct iommu_context *ctx, u16 ctx_no,
+                       u32 flags)
+{
+    if ( !dom_iommu(d)->platform_ops->context_init )
+        return -ENOSYS;
+
+    INIT_LIST_HEAD(&ctx->devices);
+    ctx->id = ctx_no;
+    ctx->dying = false;
+    ctx->opaque = false; /* assume non-opaque by default */
+
+    return iommu_call(dom_iommu(d)->platform_ops, context_init, d, ctx, flags);
+}
+
+int iommu_context_alloc(struct domain *d, u16 *ctx_no, u32 flags)
+{
+    unsigned int i;
+    int ret;
+    struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx;
+
+    do {
+        i = find_first_zero_bit(hd->other_contexts.bitmap, hd->other_contexts.count);
+
+        if ( i >= hd->other_contexts.count )
+            return -ENOSPC;
+
+        ctx = &hd->other_contexts.map[i];
+
+        /* Try to lock the mutex, can fail on concurrent accesses */
+        if ( !rspin_trylock(&ctx->lock) )
+            continue;
+
+        /* We can now set it as used, we keep the lock for initialization. */
+        set_bit(i, hd->other_contexts.bitmap);
+    } while (0);
+
+    *ctx_no = i + 1;
+
+    ret = iommu_context_init(d, ctx, *ctx_no, flags);
+
+    if ( ret )
+        clear_bit(*ctx_no, hd->other_contexts.bitmap);
+
+    iommu_put_context(ctx);
+    return ret;
+}
+
+/**
+ * Attach dev phantom functions to ctx, override any existing
+ * mapped context.
+ */
+static int cf_check iommu_reattach_phantom(struct domain *d, device_t *dev,
+                                  struct iommu_context *ctx)
+{
+    int ret = 0;
+    uint8_t devfn = dev->devfn;
+    struct domain_iommu *hd = dom_iommu(d);
+
+    while ( dev->phantom_stride )
+    {
+        devfn += dev->phantom_stride;
+
+        if ( PCI_SLOT(devfn) != PCI_SLOT(dev->devfn) )
+            break;
+
+        ret = iommu_call(hd->platform_ops, add_devfn, d, dev, devfn, ctx);
+
+        if ( ret )
+            break;
+    }
+
+    return ret;
+}
+
+/**
+ * Detach all device phantom functions.
+ */
+static int cf_check iommu_detach_phantom(struct domain *d, device_t *dev)
+{
+    int ret = 0;
+    uint8_t devfn = dev->devfn;
+    struct domain_iommu *hd = dom_iommu(d);
+
+    while ( dev->phantom_stride )
+    {
+        devfn += dev->phantom_stride;
+
+        if ( PCI_SLOT(devfn) != PCI_SLOT(dev->devfn) )
+            break;
+
+        ret = iommu_call(hd->platform_ops, remove_devfn, d, dev, devfn);
+
+        if ( ret )
+            break;
+    }
+
+    return ret;
+}
+
+int cf_check iommu_attach_context(struct domain *d, device_t *dev, u16 ctx_no)
+{
+    struct iommu_context *ctx = NULL;
+    int ret, rc;
+
+    if ( !(ctx = iommu_get_context(d, ctx_no)) )
+    {
+        ret = -ENOENT;
+        goto unlock;
+    }
+
+    pcidevs_lock();
+
+    if ( ctx->dying )
+    {
+        ret = -EINVAL;
+        goto unlock;
+    }
+
+    ret = iommu_call(dom_iommu(d)->platform_ops, attach, d, dev, ctx);
+
+    if ( ret )
+        goto unlock;
+
+    /* See iommu_reattach_context() */
+    rc = iommu_reattach_phantom(d, dev, ctx);
+
+    if ( rc )
+    {
+        printk(XENLOG_ERR "IOMMU: Unable to attach %pp phantom functions\n",
+               &dev->sbdf);
+
+        if( iommu_call(dom_iommu(d)->platform_ops, detach, d, dev, ctx)
+            || iommu_detach_phantom(d, dev) )
+        {
+            printk(XENLOG_ERR "IOMMU: Improperly detached %pp\n", &dev->sbdf);
+            WARN();
+        }
+
+        ret = -EIO;
+        goto unlock;
+    }
+
+    dev->context = ctx_no;
+    list_add(&dev->context_list, &ctx->devices);
+
+unlock:
+    pcidevs_unlock();
+
+    if ( ctx )
+        iommu_put_context(ctx);
+
+    return ret;
+}
+
+int cf_check iommu_detach_context(struct domain *d, device_t *dev)
+{
+    struct iommu_context *ctx;
+    int ret, rc;
+
+    if ( !dev->domain )
+    {
+        printk(XENLOG_WARNING "IOMMU: Trying to detach a non-attached device\n");
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
+    if ( ret )
+        goto unlock;
+
+    rc = iommu_detach_phantom(d, dev);
+
+    if ( rc )
+        printk(XENLOG_WARNING "IOMMU: "
+               "Improperly detached device functions (%d)\n", rc);
+
+    list_del(&dev->context_list);
+
+unlock:
+    pcidevs_unlock();
+    iommu_put_context(ctx);
+    return ret;
+}
+
+int cf_check iommu_reattach_context(struct domain *prev_dom, struct domain *next_dom,
+                           device_t *dev, u16 ctx_no)
+{
+    u16 prev_ctx_no;
+    device_t *ctx_dev;
+    struct domain_iommu *prev_hd, *next_hd;
+    struct iommu_context *prev_ctx = NULL, *next_ctx = NULL;
+    int ret, rc;
+    bool same_domain;
+
+    /* Make sure we actually are doing something meaningful */
+    BUG_ON(!prev_dom && !next_dom);
+
+    /* Device domain must be coherent with prev_dom. */
+    ASSERT(!prev_dom || dev->domain == prev_dom);
+
+    /// TODO: Do such cases exists ?
+    // /* Platform ops must match */
+    // if (dom_iommu(prev_dom)->platform_ops != dom_iommu(next_dom)->platform_ops)
+    //     return -EINVAL;
+
+    if ( !prev_dom )
+        return iommu_attach_context(next_dom, dev, ctx_no);
+
+    if ( !next_dom )
+        return iommu_detach_context(prev_dom, dev);
+
+    prev_hd = dom_iommu(prev_dom);
+    next_hd = dom_iommu(next_dom);
+
+    pcidevs_lock();
+
+    same_domain = prev_dom == next_dom;
+
+    prev_ctx_no = dev->context;
+
+    if ( same_domain && (ctx_no == prev_ctx_no) )
+    {
+        printk(XENLOG_DEBUG
+               "IOMMU: Reattaching %pp to same IOMMU context c%hu\n",
+               &dev->sbdf, ctx_no);
+        ret = 0;
+        goto unlock;
+    }
+
+    if ( !(prev_ctx = iommu_get_context(prev_dom, prev_ctx_no)) )
+    {
+        ret = -ENOENT;
+        goto unlock;
+    }
+
+    if ( !(next_ctx = iommu_get_context(next_dom, ctx_no)) )
+    {
+        ret = -ENOENT;
+        goto unlock;
+    }
+
+    if ( next_ctx->dying )
+    {
+        ret = -EINVAL;
+        goto unlock;
+    }
+
+    ret = iommu_call(prev_hd->platform_ops, reattach, next_dom, dev, prev_ctx,
+                     next_ctx);
+
+    if ( ret )
+        goto unlock;
+
+    /*
+     * We need to do special handling for phantom devices as they
+     * also use some other PCI functions behind the scenes.
+     */
+    rc = iommu_reattach_phantom(next_dom, dev, next_ctx);
+
+    if ( rc )
+    {
+        /**
+         * Device is being partially reattached (we have primary function and
+         * maybe some phantom functions attached to next_ctx, some others to prev_ctx),
+         * some functions of the device will be attached to next_ctx.
+         */
+        printk(XENLOG_WARNING "IOMMU: "
+               "Device %pp improperly reattached due to phantom function"
+               " reattach failure between %dd%dc and %dd%dc (%d)\n", dev,
+               prev_dom->domain_id, prev_ctx->id, next_dom->domain_id,
+               next_dom->domain_id, rc);
+
+        /* Try reattaching to previous context, reverting into a consistent state. */
+        if ( iommu_call(prev_hd->platform_ops, reattach, prev_dom, dev, next_ctx,
+                        prev_ctx) || iommu_reattach_phantom(prev_dom, dev, prev_ctx) )
+        {
+            printk(XENLOG_ERR "Unable to reattach %pp back to %dd%dc\n",
+                   &dev->sbdf, prev_dom->domain_id, prev_ctx->id);
+
+            if ( !is_hardware_domain(prev_dom) )
+                domain_crash(prev_dom);
+
+            if ( prev_dom != next_dom && !is_hardware_domain(next_dom) )
+                domain_crash(next_dom);
+
+            rc = -EIO;
+        }
+
+        ret = rc;
+        goto unlock;
+    }
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
+    if (!ret)
+        dev->context = ctx_no; /* update device context*/
+
+unlock:
+    pcidevs_unlock();
+
+    if ( prev_ctx )
+        iommu_put_context(prev_ctx);
+
+    if ( next_ctx )
+        iommu_put_context(next_ctx);
+
+    return ret;
+}
+
+int cf_check iommu_context_teardown(struct domain *d, struct iommu_context *ctx, u32 flags)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+
+    if ( !hd->platform_ops->context_teardown )
+        return -ENOSYS;
+
+    ctx->dying = true;
+
+    /* first reattach devices back to default context if needed */
+    if ( flags & IOMMU_TEARDOWN_REATTACH_DEFAULT )
+    {
+        struct pci_dev *device;
+        list_for_each_entry(device, &ctx->devices, context_list)
+            iommu_reattach_context(d, d, device, 0);
+    }
+    else if (!list_empty(&ctx->devices))
+        return -EBUSY; /* there is a device in context */
+
+    return iommu_call(hd->platform_ops, context_teardown, d, ctx, flags);
+}
+
+int cf_check iommu_context_free(struct domain *d, u16 ctx_no, u32 flags)
+{
+    int ret;
+    struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx;
+
+    if ( ctx_no == 0 )
+        return -EINVAL;
+
+    if ( !(ctx = iommu_get_context(d, ctx_no)) )
+        return -ENOENT;
+
+    ret = iommu_context_teardown(d, ctx, flags);
+
+    if ( !ret )
+        clear_bit(ctx_no - 1, hd->other_contexts.bitmap);
+
+    iommu_put_context(ctx);
+    return ret;
+}
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 50bfd62553..091333f100 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -12,15 +12,18 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/atomic.h>
+#include <xen/errno.h>
+#include <xen/xmalloc.h>
+#include <xen/pci.h>
 #include <xen/sched.h>
+#include <xen/spinlock.h>
 #include <xen/iommu.h>
-#include <xen/paging.h>
-#include <xen/guest_access.h>
-#include <xen/event.h>
 #include <xen/param.h>
-#include <xen/softirq.h>
 #include <xen/keyhandler.h>
-#include <xsm/xsm.h>
+#include <asm/arena.h>
+#include <asm/iommu.h>
+#include <asm/bitops.h>
 
 #ifdef CONFIG_X86
 #include <asm/e820.h>
@@ -35,26 +38,11 @@ bool __read_mostly force_iommu;
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
 bool __hwdom_initdata iommu_hwdom_inclusive;
+bool __read_mostly iommu_hwdom_no_dma = false;
 int8_t __hwdom_initdata iommu_hwdom_reserved = -1;
 
 #ifndef iommu_hap_pt_share
@@ -172,6 +160,8 @@ static int __init cf_check parse_dom0_iommu_param(const char *s)
             iommu_hwdom_reserved = val;
         else if ( !cmdline_strcmp(s, "none") )
             iommu_hwdom_none = true;
+        else if ( (val = parse_boolean("dma", s, ss)) >= 0 )
+            iommu_hwdom_no_dma = !val;
         else
             rc = -EINVAL;
 
@@ -193,6 +183,98 @@ static void __hwdom_init check_hwdom_reqs(struct domain *d)
     arch_iommu_check_autotranslated_hwdom(d);
 }
 
+int iommu_domain_pviommu_init(struct domain *d, uint16_t nb_ctx, uint32_t arena_order)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    int rc;
+
+    BUG_ON(nb_ctx == 0); /* sanity check (prevent underflow) */
+
+    /*
+     * hd->other_contexts.count is always reported as 0 during initialization
+     * preventing misuse of partially initialized IOMMU contexts.
+     */
+
+    if ( atomic_cmpxchg(&hd->other_contexts.initialized, 0, 1) == 1 )
+        return -EACCES;
+
+    if ( (nb_ctx - 1) > 0 ) {
+        /* Initialize context bitmap */
+        size_t i;
+
+        hd->other_contexts.bitmap = xzalloc_array(unsigned long,
+                                                  BITS_TO_LONGS(nb_ctx - 1));
+
+        if (!hd->other_contexts.bitmap)
+        {
+            rc = -ENOMEM;
+            goto cleanup;
+        }
+
+        hd->other_contexts.map = xzalloc_array(struct iommu_context, nb_ctx - 1);
+
+        if (!hd->other_contexts.map)
+        {
+            rc = -ENOMEM;
+            goto cleanup;
+        }
+
+        for (i = 0; i < (nb_ctx - 1); i++)
+            rspin_lock_init(&hd->other_contexts.map[i].lock);
+    }
+
+    rc = arch_iommu_pviommu_init(d, nb_ctx, arena_order);
+
+    if ( rc )
+        goto cleanup;
+
+    /* Make sure initialization is complete before making it visible to other CPUs. */
+    smp_wmb();
+
+    hd->other_contexts.count = nb_ctx - 1;
+
+    printk(XENLOG_INFO "Dom%d uses %lu IOMMU contexts (%llu pages arena)\n",
+           d->domain_id, (unsigned long)nb_ctx, 1llu << arena_order);
+
+    return 0;
+
+cleanup:
+    /* TODO: Reset hd->other_contexts.initialized */
+    if ( hd->other_contexts.bitmap )
+    {
+        xfree(hd->other_contexts.bitmap);
+        hd->other_contexts.bitmap = NULL;
+    }
+
+    if ( hd->other_contexts.map )
+    {
+        xfree(hd->other_contexts.map);
+        hd->other_contexts.bitmap = NULL;
+    }
+
+    return rc;
+}
+
+int iommu_domain_pviommu_teardown(struct domain *d)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    int i;
+    /* FIXME: Potential race condition with remote_op ? */
+
+    for (i = 0; i < hd->other_contexts.count; i++)
+        WARN_ON(iommu_context_free(d, i, IOMMU_TEARDOWN_REATTACH_DEFAULT) != ENOENT);
+
+    hd->other_contexts.count = 0;
+
+    if ( hd->other_contexts.bitmap )
+        xfree(hd->other_contexts.bitmap);
+
+    if ( hd->other_contexts.map )
+        xfree(hd->other_contexts.map);
+
+    return 0;
+}
+
 int iommu_domain_init(struct domain *d, unsigned int opts)
 {
     struct domain_iommu *hd = dom_iommu(d);
@@ -208,13 +290,15 @@ int iommu_domain_init(struct domain *d, unsigned int opts)
     hd->node = NUMA_NO_NODE;
 #endif
 
+    rspin_lock_init(&hd->default_ctx.lock);
+
     ret = arch_iommu_domain_init(d);
     if ( ret )
         return ret;
 
     hd->platform_ops = iommu_get_ops();
     ret = iommu_call(hd->platform_ops, init, d);
-    if ( ret || is_system_domain(d) )
+    if ( ret || (is_system_domain(d) && d != dom_io) )
         return ret;
 
     /*
@@ -236,6 +320,23 @@ int iommu_domain_init(struct domain *d, unsigned int opts)
 
     ASSERT(!(hd->need_sync && hd->hap_pt_share));
 
+    if ( hd->no_dma )
+    {
+        /* No-DMA mode is exclusive with HAP and sync_pt. */
+        hd->hap_pt_share = false;
+        hd->need_sync = false;
+    }
+
+    hd->allow_pv_iommu = true;
+
+    iommu_context_init(d, &hd->default_ctx, 0, IOMMU_CONTEXT_INIT_default);
+
+    rwlock_init(&hd->other_contexts.lock);
+    hd->other_contexts.initialized = (atomic_t)ATOMIC_INIT(0);
+    hd->other_contexts.count = 0;
+    hd->other_contexts.bitmap = NULL;
+    hd->other_contexts.map = NULL;
+
     return 0;
 }
 
@@ -249,14 +350,11 @@ static void cf_check iommu_dump_page_tables(unsigned char key)
 
     for_each_domain(d)
     {
-        if ( is_hardware_domain(d) || !is_iommu_enabled(d) )
+        if ( !is_iommu_enabled(d) )
             continue;
 
         if ( iommu_use_hap_pt(d) )
-        {
             printk("%pd sharing page tables\n", d);
-            continue;
-        }
 
         iommu_vcall(dom_iommu(d)->platform_ops, dump_page_tables, d);
     }
@@ -276,9 +374,13 @@ void __hwdom_init iommu_hwdom_init(struct domain *d)
     iommu_vcall(hd->platform_ops, hwdom_init, d);
 }
 
-static void iommu_teardown(struct domain *d)
+void cf_check iommu_domain_destroy(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
+    struct pci_dev *pdev;
+
+    if ( !is_iommu_enabled(d) )
+        return;
 
     /*
      * During early domain creation failure, we may reach here with the
@@ -287,266 +389,25 @@ static void iommu_teardown(struct domain *d)
     if ( !hd->platform_ops )
         return;
 
-    iommu_vcall(hd->platform_ops, teardown, d);
-}
-
-void iommu_domain_destroy(struct domain *d)
-{
-    if ( !is_iommu_enabled(d) )
-        return;
-
-    iommu_teardown(d);
-
-    arch_iommu_domain_destroy(d);
-}
-
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
+    /* Move all devices back to quarantine */
+    /* TODO: Is it needed ? */
+    for_each_pdev(d, pdev)
     {
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
+        int rc = iommu_reattach_context(d, dom_io, pdev, 0);
 
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
+        if ( rc )
         {
-            domain_crash(d);
-            break;
+            printk(XENLOG_WARNING "Unable to quarantine device %pp (%d)\n", &pdev->sbdf, rc);
+            pdev->broken = true;
         }
+        else
+            pdev->domain = dom_io;
     }
 
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
-int iommu_iotlb_flush_all(struct domain *d, unsigned int flush_flags)
-{
-    const struct domain_iommu *hd = dom_iommu(d);
-    int rc;
-
-    if ( !is_iommu_enabled(d) || !hd->platform_ops->iotlb_flush ||
-         !flush_flags )
-        return 0;
-
-    rc = iommu_call(hd->platform_ops, iotlb_flush, d, INVALID_DFN, 0,
-                    flush_flags | IOMMU_FLUSHF_all);
-    if ( unlikely(rc) )
-    {
-        if ( !d->is_shutting_down && printk_ratelimit() )
-            printk(XENLOG_ERR
-                   "d%d: IOMMU IOTLB flush all failed: %d\n",
-                   d->domain_id, rc);
-
-        if ( !is_hardware_domain(d) )
-            domain_crash(d);
-    }
-
-    return rc;
-}
-
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
+    iommu_vcall(hd->platform_ops, teardown, d);
 
-    return iommu_domain_init(dom_io, 0);
+    iommu_domain_pviommu_teardown(d);
+    arch_iommu_domain_destroy(d);
 }
 
 int __init iommu_setup(void)
@@ -681,6 +542,16 @@ bool iommu_has_feature(struct domain *d, enum iommu_feature feature)
     return is_iommu_enabled(d) && test_bit(feature, dom_iommu(d)->features);
 }
 
+uint64_t iommu_get_max_iova(struct domain *d)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+
+    if ( !hd->platform_ops->get_max_iova )
+        return 0;
+
+    return iommu_call(hd->platform_ops, get_max_iova, d);
+}
+
 #define MAX_EXTRA_RESERVED_RANGES 20
 struct extra_reserved_range {
     unsigned long start;
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index ae620b3007..7b2625a9de 100644
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
@@ -651,6 +651,101 @@ unsigned int pci_size_mem_bar(pci_sbdf_t sbdf, unsigned int pos,
     return is64bits ? 2 : 1;
 }
 
+static int device_assigned(struct pci_dev *pdev)
+{
+    int rc = 0;
+
+    /*
+     * If the device exists and it is not owned by either the hardware
+     * domain or dom_io then it must be assigned to a guest, or be
+     * hidden (owned by dom_xen).
+     */
+    if ( pdev->domain != hardware_domain && pdev->domain != dom_io )
+        rc = -EBUSY;
+
+    return rc;
+}
+
+/* Caller should hold the pcidevs_lock */
+static int pci_reassign_device(struct domain *prev_dom, struct domain *next_dom,
+                               struct pci_dev *pdev, u32 flag)
+{
+    int rc = 0;
+    ASSERT(prev_dom || next_dom);
+
+    if ( !is_iommu_enabled(next_dom) )
+        return -EINVAL;
+
+    if ( !arch_iommu_use_permitted(next_dom) )
+        return -EXDEV;
+
+    /* Do not allow broken devices to be assigned to guests. */
+    if ( pdev->broken && next_dom != hardware_domain && next_dom != dom_io )
+        return -EBADF;
+
+    if ( prev_dom )
+    {
+        write_lock(&prev_dom->pci_lock);
+        vpci_deassign_device(pdev);
+        write_unlock(&prev_dom->pci_lock);
+    }
+
+    rc = pdev_msix_assign(next_dom, pdev);
+    if ( rc )
+        goto done;
+
+    pdev->fault.count = 0;
+
+    if ( prev_dom && next_dom )
+    {
+        printk(XENLOG_INFO "PCI: Reassigning PCI device from %dd to %dd\n",
+               prev_dom->domain_id, next_dom->domain_id);
+    }
+    else if ( prev_dom )
+    {
+        printk(XENLOG_INFO "PCI: Assigning PCI device to %dd\n", prev_dom->domain_id);
+    }
+    else if ( next_dom )
+    {
+        printk(XENLOG_INFO "PCI: Remove PCI device of %dd\n", next_dom->domain_id);
+    }
+    else
+    {
+        ASSERT_UNREACHABLE();
+    }
+
+    rc = iommu_reattach_context(prev_dom, next_dom, pci_to_dev(pdev), 0);
+
+    if ( rc )
+        goto done;
+
+    if ( prev_dom )
+    {
+        write_lock(&prev_dom->pci_lock);
+        list_del(&pdev->domain_list);
+        write_unlock(&prev_dom->pci_lock);
+    }
+
+    pdev->domain = next_dom;
+
+    if ( next_dom )
+    {
+        write_lock(&next_dom->pci_lock);
+        list_add(&pdev->domain_list, &next_dom->pdev_list);
+
+        rc = vpci_assign_device(pdev);
+        write_unlock(&next_dom->pci_lock);
+    }
+
+ done:
+
+    /* The device is assigned to dom_io so mark it as quarantined */
+    if ( !rc && next_dom == dom_io )
+        pdev->quarantine = true;
+
+    return rc;
+}
+
 int pci_add_device(u16 seg, u8 bus, u8 devfn,
                    const struct pci_dev_info *info, nodeid_t node)
 {
@@ -891,74 +986,6 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     return ret;
 }
 
-/* Caller should hold the pcidevs_lock */
-static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
-                           uint8_t devfn)
-{
-    const struct domain_iommu *hd = dom_iommu(d);
-    struct pci_dev *pdev;
-    struct domain *target;
-    int ret = 0;
-
-    if ( !is_iommu_enabled(d) )
-        return -EINVAL;
-
-    ASSERT(pcidevs_locked());
-    pdev = pci_get_pdev(d, PCI_SBDF(seg, bus, devfn));
-    if ( !pdev )
-        return -ENODEV;
-
-    /* De-assignment from dom_io should de-quarantine the device */
-    if ( (pdev->quarantine || iommu_quarantine) && pdev->domain != dom_io )
-    {
-        ret = iommu_quarantine_dev_init(pci_to_dev(pdev));
-        if ( ret )
-           return ret;
-
-        target = dom_io;
-    }
-    else
-        target = hardware_domain;
-
-    while ( pdev->phantom_stride )
-    {
-        devfn += pdev->phantom_stride;
-        if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
-            break;
-        ret = iommu_call(hd->platform_ops, reassign_device, d, target, devfn,
-                         pci_to_dev(pdev));
-        if ( ret )
-            goto out;
-    }
-
-    write_lock(&d->pci_lock);
-    vpci_deassign_device(pdev);
-    write_unlock(&d->pci_lock);
-
-    devfn = pdev->devfn;
-    ret = iommu_call(hd->platform_ops, reassign_device, d, target, devfn,
-                     pci_to_dev(pdev));
-    if ( ret )
-        goto out;
-
-    if ( pdev->domain == hardware_domain  )
-        pdev->quarantine = false;
-
-    pdev->fault.count = 0;
-
-    write_lock(&target->pci_lock);
-    /* Re-assign back to hardware_domain */
-    ret = vpci_assign_device(pdev);
-    write_unlock(&target->pci_lock);
-
- out:
-    if ( ret )
-        printk(XENLOG_G_ERR "%pd: deassign (%pp) failed (%d)\n",
-               d, &PCI_SBDF(seg, bus, devfn), ret);
-
-    return ret;
-}
-
 int pci_release_devices(struct domain *d)
 {
     int combined_ret;
@@ -980,13 +1007,10 @@ int pci_release_devices(struct domain *d)
         struct pci_dev *pdev = list_first_entry(&d->pdev_list,
                                                 struct pci_dev,
                                                 domain_list);
-        uint16_t seg = pdev->seg;
-        uint8_t bus = pdev->bus;
-        uint8_t devfn = pdev->devfn;
         int ret;
 
         write_unlock(&d->pci_lock);
-        ret = deassign_device(d, seg, bus, devfn);
+        ret = pci_reassign_device(d, dom_io, pdev, 0);
         write_lock(&d->pci_lock);
         if ( ret )
         {
@@ -1194,25 +1218,18 @@ struct setup_hwdom {
 static void __hwdom_init setup_one_hwdom_device(const struct setup_hwdom *ctxt,
                                                 struct pci_dev *pdev)
 {
-    u8 devfn = pdev->devfn;
     int err;
 
-    do {
-        err = ctxt->handler(devfn, pdev);
-        if ( err )
-        {
-            printk(XENLOG_ERR "setup %pp for d%d failed (%d)\n",
-                   &pdev->sbdf, ctxt->d->domain_id, err);
-            if ( devfn == pdev->devfn )
-                return;
-        }
-        devfn += pdev->phantom_stride;
-    } while ( devfn != pdev->devfn &&
-              PCI_SLOT(devfn) == PCI_SLOT(pdev->devfn) );
+    err = ctxt->handler(pdev->devfn, pdev);
+
+    if ( err )
+        goto done;
 
     write_lock(&ctxt->d->pci_lock);
     err = vpci_assign_device(pdev);
     write_unlock(&ctxt->d->pci_lock);
+
+done:
     if ( err )
         printk(XENLOG_ERR "setup of vPCI for d%d failed: %d\n",
                ctxt->d->domain_id, err);
@@ -1384,12 +1401,7 @@ static int cf_check _dump_pci_devices(struct pci_seg *pseg, void *arg)
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
@@ -1416,8 +1428,6 @@ __initcall(setup_dump_pcidevs);
 static int iommu_add_device(struct pci_dev *pdev)
 {
     const struct domain_iommu *hd;
-    int rc;
-    unsigned int devfn = pdev->devfn;
 
     if ( !pdev->domain )
         return -EINVAL;
@@ -1428,20 +1438,7 @@ static int iommu_add_device(struct pci_dev *pdev)
     if ( !is_iommu_enabled(pdev->domain) )
         return 0;
 
-    rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
-    if ( rc || !pdev->phantom_stride )
-        return rc;
-
-    for ( ; ; )
-    {
-        devfn += pdev->phantom_stride;
-        if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
-            return 0;
-        rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
-        if ( rc )
-            printk(XENLOG_WARNING "IOMMU: add %pp failed (%d)\n",
-                   &PCI_SBDF(pdev->seg, pdev->bus, devfn), rc);
-    }
+    return iommu_attach_context(pdev->domain, pci_to_dev(pdev), 0);
 }
 
 static int iommu_enable_device(struct pci_dev *pdev)
@@ -1463,145 +1460,13 @@ static int iommu_enable_device(struct pci_dev *pdev)
 
 static int iommu_remove_device(struct pci_dev *pdev)
 {
-    const struct domain_iommu *hd;
-    u8 devfn;
-
     if ( !pdev->domain )
         return -EINVAL;
 
-    hd = dom_iommu(pdev->domain);
     if ( !is_iommu_enabled(pdev->domain) )
         return 0;
 
-    for ( devfn = pdev->devfn ; pdev->phantom_stride; )
-    {
-        int rc;
-
-        devfn += pdev->phantom_stride;
-        if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
-            break;
-        rc = iommu_call(hd->platform_ops, remove_device, devfn,
-                        pci_to_dev(pdev));
-        if ( !rc )
-            continue;
-
-        printk(XENLOG_ERR "IOMMU: remove %pp failed (%d)\n",
-               &PCI_SBDF(pdev->seg, pdev->bus, devfn), rc);
-        return rc;
-    }
-
-    devfn = pdev->devfn;
-
-    return iommu_call(hd->platform_ops, remove_device, devfn, pci_to_dev(pdev));
-}
-
-static int device_assigned(u16 seg, u8 bus, u8 devfn)
-{
-    struct pci_dev *pdev;
-    int rc = 0;
-
-    ASSERT(pcidevs_locked());
-    pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
-
-    if ( !pdev )
-        rc = -ENODEV;
-    /*
-     * If the device exists and it is not owned by either the hardware
-     * domain or dom_io then it must be assigned to a guest, or be
-     * hidden (owned by dom_xen).
-     */
-    else if ( pdev->domain != hardware_domain &&
-              pdev->domain != dom_io )
-        rc = -EBUSY;
-
-    return rc;
-}
-
-/* Caller should hold the pcidevs_lock */
-static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
-{
-    const struct domain_iommu *hd = dom_iommu(d);
-    struct pci_dev *pdev;
-    int rc = 0;
-
-    if ( !is_iommu_enabled(d) )
-        return 0;
-
-    if ( !arch_iommu_use_permitted(d) )
-        return -EXDEV;
-
-    /* device_assigned() should already have cleared the device for assignment */
-    ASSERT(pcidevs_locked());
-    pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
-    ASSERT(pdev && (pdev->domain == hardware_domain ||
-                    pdev->domain == dom_io));
-
-    /* Do not allow broken devices to be assigned to guests. */
-    rc = -EBADF;
-    if ( pdev->broken && d != hardware_domain && d != dom_io )
-        goto done;
-
-    write_lock(&pdev->domain->pci_lock);
-    vpci_deassign_device(pdev);
-    write_unlock(&pdev->domain->pci_lock);
-
-    rc = pdev_msix_assign(d, pdev);
-    if ( rc )
-        goto done;
-
-    if ( pdev->domain != dom_io )
-    {
-        rc = iommu_quarantine_dev_init(pci_to_dev(pdev));
-        if ( rc )
-            goto done;
-    }
-
-    pdev->fault.count = 0;
-
-    rc = iommu_call(hd->platform_ops, assign_device, d, devfn, pci_to_dev(pdev),
-                    flag);
-
-    while ( pdev->phantom_stride && !rc )
-    {
-        devfn += pdev->phantom_stride;
-        if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
-            break;
-        rc = iommu_call(hd->platform_ops, assign_device, d, devfn,
-                        pci_to_dev(pdev), flag);
-    }
-
-    if ( rc )
-        goto done;
-
-    write_lock(&d->pci_lock);
-    rc = vpci_assign_device(pdev);
-    write_unlock(&d->pci_lock);
-
- done:
-    if ( rc )
-    {
-        printk(XENLOG_G_WARNING "%pd: assign %s(%pp) failed (%d)\n",
-               d, devfn != pdev->devfn ? "phantom function " : "",
-               &PCI_SBDF(seg, bus, devfn), rc);
-
-        if ( devfn != pdev->devfn && deassign_device(d, seg, bus, pdev->devfn) )
-        {
-            /*
-             * Device with phantom functions that failed to both assign and
-             * rollback.  Mark the device as broken and crash the target domain,
-             * as the state of the functions at this point is unknown and Xen
-             * has no way to assert consistent context assignment among them.
-             */
-            pdev->broken = true;
-            if ( !is_hardware_domain(d) && d != dom_io )
-                domain_crash(d);
-        }
-    }
-    /* The device is assigned to dom_io so mark it as quarantined */
-    else if ( d == dom_io )
-        pdev->quarantine = true;
-
-    return rc;
+    return iommu_detach_context(pdev->domain, pdev);
 }
 
 static int iommu_get_device_group(
@@ -1691,6 +1556,7 @@ int iommu_do_pci_domctl(
     u8 bus, devfn;
     int ret = 0;
     uint32_t machine_sbdf;
+    struct pci_dev *pdev;
 
     switch ( domctl->cmd )
     {
@@ -1760,7 +1626,15 @@ int iommu_do_pci_domctl(
         devfn = PCI_DEVFN(machine_sbdf);
 
         pcidevs_lock();
-        ret = device_assigned(seg, bus, devfn);
+        pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
+
+        if ( !pdev )
+        {
+            printk(XENLOG_G_INFO "%pp doesn't exist", &PCI_SBDF(seg, bus, devfn));
+            break;
+        }
+
+        ret = device_assigned(pdev);
         if ( domctl->cmd == XEN_DOMCTL_test_assign_device )
         {
             if ( ret )
@@ -1771,7 +1645,7 @@ int iommu_do_pci_domctl(
             }
         }
         else if ( !ret )
-            ret = assign_device(d, seg, bus, devfn, flags);
+            ret = pci_reassign_device(pdev->domain, d, pdev, flags);
         pcidevs_unlock();
         if ( ret == -ERESTART )
             ret = hypercall_create_continuation(__HYPERVISOR_domctl,
@@ -1805,7 +1679,20 @@ int iommu_do_pci_domctl(
         devfn = PCI_DEVFN(machine_sbdf);
 
         pcidevs_lock();
-        ret = deassign_device(d, seg, bus, devfn);
+        pdev = pci_get_pdev(d, PCI_SBDF(seg, bus, devfn));
+
+        if ( pdev )
+        {
+            struct domain *target = hardware_domain;
+
+            if ( (pdev->quarantine || iommu_quarantine) && pdev->domain != dom_io )
+                target = dom_io;
+
+            ret = pci_reassign_device(d, target, pdev, 0);
+        }
+        else
+            ret = -ENODEV;
+
         pcidevs_unlock();
         break;
 
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
index 442ae5322d..ea23f2b734 100644
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
@@ -106,6 +110,7 @@ extern bool iommu_debug;
 extern bool amd_iommu_perdev_intremap;
 
 extern bool iommu_hwdom_strict, iommu_hwdom_passthrough, iommu_hwdom_inclusive;
+extern bool iommu_hwdom_no_dma;
 extern int8_t iommu_hwdom_reserved;
 
 extern unsigned int iommu_dev_iotlb_timeout;
@@ -161,11 +166,10 @@ enum
  */
 long __must_check iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
                             unsigned long page_count, unsigned int flags,
-                            unsigned int *flush_flags);
+                            unsigned int *flush_flags, u16 ctx_no);
 long __must_check iommu_unmap(struct domain *d, dfn_t dfn0,
                               unsigned long page_count, unsigned int flags,
-                              unsigned int *flush_flags);
-
+                              unsigned int *flush_flags, u16 ctx_no);
 int __must_check iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t mfn,
                                   unsigned long page_count,
                                   unsigned int flags);
@@ -173,12 +177,13 @@ int __must_check iommu_legacy_unmap(struct domain *d, dfn_t dfn,
                                     unsigned long page_count);
 
 int __must_check iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
-                                   unsigned int *flags);
+                                   unsigned int *flags, u16 ctx_no);
 
 int __must_check iommu_iotlb_flush(struct domain *d, dfn_t dfn,
                                    unsigned long page_count,
-                                   unsigned int flush_flags);
-int __must_check iommu_iotlb_flush_all(struct domain *d,
+                                   unsigned int flush_flags,
+                                   u16 ctx_no);
+int __must_check iommu_iotlb_flush_all(struct domain *d, u16 ctx_no,
                                        unsigned int flush_flags);
 
 enum iommu_feature
@@ -250,20 +255,30 @@ struct page_info;
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
+    int (*remove_devfn)(struct domain *d, struct pci_dev *pdev, u16 devfn);
 #endif /* HAS_PCI */
 
     void (*teardown)(struct domain *d);
@@ -274,12 +289,15 @@ struct iommu_ops {
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
@@ -292,14 +310,15 @@ struct iommu_ops {
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
@@ -314,6 +333,8 @@ struct iommu_ops {
      */
     int (*dt_xlate)(device_t *dev, const struct dt_phandle_args *args);
 #endif
+
+    uint64_t (*get_max_iova)(struct domain *d);
 };
 
 /*
@@ -343,11 +364,39 @@ extern int iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
 # define iommu_vcall iommu_call
 #endif
 
+struct iommu_context {
+    u16 id; /* Context id (0 means default context) */
+    rspinlock_t lock; /* context lock */
+
+    struct list_head devices;
+
+    struct arch_iommu_context arch;
+
+    bool opaque; /* context can't be modified nor accessed (e.g HAP) */
+    bool dying; /* the context is tearing down */
+};
+
+struct iommu_context_list {
+    atomic_t initialized; /* has/is context list being initialized ? */
+    rwlock_t lock; /* prevent concurrent destruction and access of contexts */
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
+
 #ifdef CONFIG_HAS_PASSTHROUGH
     struct arch_iommu arch;
 #endif
 
+    struct iommu_context default_ctx;
+    struct iommu_context_list other_contexts;
+
     /* iommu_ops */
     const struct iommu_ops *platform_ops;
 
@@ -365,6 +414,12 @@ struct domain_iommu {
     /* SAF-2-safe enum constant in arithmetic operation */
     DECLARE_BITMAP(features, IOMMU_FEAT_count);
 
+    /* Do the IOMMU block all DMA on default context (implies !has_pt_share) ? */
+    bool no_dma;
+
+    /* Is the domain allowed to use PV-IOMMU ? */
+    bool allow_pv_iommu;
+
     /* Does the guest share HAP mapping with the IOMMU? */
     bool hap_pt_share;
 
@@ -380,6 +435,7 @@ struct domain_iommu {
 #define dom_iommu(d)              (&(d)->iommu)
 #define iommu_set_feature(d, f)   set_bit(f, dom_iommu(d)->features)
 #define iommu_clear_feature(d, f) clear_bit(f, dom_iommu(d)->features)
+#define iommu_default_context(d) (&dom_iommu(d)->default_ctx) /* does not lock ! */
 
 /* Are we using the domain P2M table as its IOMMU pagetable? */
 #define iommu_use_hap_pt(d)       (IS_ENABLED(CONFIG_HVM) && \
@@ -401,10 +457,14 @@ static inline int iommu_do_domctl(struct xen_domctl *domctl, struct domain *d,
 }
 #endif
 
+int iommu_domain_pviommu_init(struct domain *d, uint16_t nb_ctx, uint32_t arena_order);
+
 int __must_check iommu_suspend(void);
 void iommu_resume(void);
 void iommu_crash_shutdown(void);
 int iommu_get_reserved_device_memory(iommu_grdm_t *func, void *ctxt);
+
+int __init iommu_quarantine_init(void);
 int iommu_quarantine_dev_init(device_t *dev);
 
 #ifdef CONFIG_HAS_PCI
@@ -414,6 +474,27 @@ int iommu_do_pci_domctl(struct xen_domctl *domctl, struct domain *d,
 
 void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev);
 
+uint64_t iommu_get_max_iova(struct domain *d);
+
+struct iommu_context *iommu_get_context(struct domain *d, u16 ctx_no);
+void iommu_put_context(struct iommu_context *ctx);
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
 /*
  * The purpose of the iommu_dont_flush_iotlb optional cpu flag is to
  * avoid unecessary iotlb_flush in the low level IOMMU code.
@@ -429,6 +510,8 @@ DECLARE_PER_CPU(bool, iommu_dont_flush_iotlb);
 extern struct spinlock iommu_pt_cleanup_lock;
 extern struct page_list_head iommu_pt_cleanup_list;
 
+int arch_iommu_pviommu_init(struct domain *d, uint16_t nb_ctx, uint32_t arena_order);
+int arch_iommu_pviommu_teardown(struct domain *d);
 bool arch_iommu_use_permitted(const struct domain *d);
 
 #ifdef CONFIG_X86
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 82e1221c9c..bb3931b01d 100644
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
2.45.3



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


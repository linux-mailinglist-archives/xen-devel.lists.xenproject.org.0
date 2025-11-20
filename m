Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B481EC73A66
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 12:14:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166982.1493407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2bt-00014q-9s; Thu, 20 Nov 2025 11:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166982.1493407; Thu, 20 Nov 2025 11:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2bt-00013A-6d; Thu, 20 Nov 2025 11:13:57 +0000
Received: by outflank-mailman (input) for mailman id 1166982;
 Thu, 20 Nov 2025 11:13:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NE5L=54=bounce.vates.tech=bounce-md_30504962.691ef70e.v1-88d1e4a663ac4727b5f279336b0d5faf@srs-se1.protection.inumbo.net>)
 id 1vM2YE-0001PI-IZ
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 11:10:10 +0000
Received: from mail128-17.atl41.mandrillapp.com
 (mail128-17.atl41.mandrillapp.com [198.2.128.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 788e0caf-c601-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 12:10:06 +0100 (CET)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4dBwcG4z7NzCf9P1H
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 11:10:06 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 88d1e4a663ac4727b5f279336b0d5faf; Thu, 20 Nov 2025 11:10:06 +0000
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
X-Inumbo-ID: 788e0caf-c601-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763637006; x=1763907006;
	bh=c/JljpXkKEnMLI4s/6MD5SMOH2GQOJrsu01e1YgqiEs=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ymzj/HXOkuTCq1wb2WeX2Ao5eeu0Oi/3/LBM6D0Fj7WNYd2vXRUoSGtX6qsCxFhK8
	 oCcqQ6TBdxIoUjXev8X8Ny/sy1Zl+mUW9Ycrk2J+v/KD1i9w4kzUrwDCvLAHp4jvw7
	 wbTQMJsnRl7qitnXEitp0zarhc7Rbi+Y6d2MEfPi+DqfRxbzlaYsc8o6A67KldW8Kv
	 uN8tyQZubk0v/OsnXMDDIyT38LT+Qd6u8PFmx6411+zAv5Ifi325+r4Jk4lZ2dfJ6b
	 CNeQiWEOcs0UKyi6192kQd5zmrHyyiVqPxuTIpuqmqQzI75B3VJuu9BKtsvNDfavIU
	 gYmdp0XlqRlpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763637006; x=1763897506; i=teddy.astie@vates.tech;
	bh=c/JljpXkKEnMLI4s/6MD5SMOH2GQOJrsu01e1YgqiEs=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=N0NEkiqt086+XFv0AB6djIFsDHrzq5eOY8FZQkn/UhEI4yZvLGEAV8++vBIBFbJ9A
	 0OCMBDGWTE7rER6K3lZvvukE7xTpXA8QWImSDinoWWAELYije6Nq9sMkT7dJGjW0sc
	 OuaAQ38/BkHZM5JGBXarfSLu7j7QSNdiO+mZtDKxxunaoDwHoiNsz1lo0D2PwAnz/n
	 4V9sSvhF6SVlTG+nbih67GHTH+v560xQpbDTr/AVMmfTn695ERmiWDCui1cUbmQrg/
	 ojd3nLFUZ6mO+CIOgapRzxWbgAI77TBysSc/jOhJjSdf6jzmvNN0KcUNJBRaZdePw0
	 xt+w7pYK/tVWg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v7=2013/14]=20iommu:=20Introduce=20PV-IOMMU?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763637005106
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <73a34b0236aec756738e0073b75495dcb214a74b.1763569135.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1763569135.git.teddy.astie@vates.tech>
References: <cover.1763569135.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.88d1e4a663ac4727b5f279336b0d5faf?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251120:md
Date: Thu, 20 Nov 2025 11:10:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Introduce the PV-IOMMU subsystem as defined in docs/designs/pv-iommu.md.

Signed-off-by Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/include/asm/iommu.h    |   5 +-
 xen/common/Makefile                 |   1 +
 xen/common/pv-iommu.c               | 551 ++++++++++++++++++++++++++++
 xen/drivers/passthrough/iommu.c     |  95 +++++
 xen/drivers/passthrough/x86/iommu.c |  61 ++-
 xen/include/hypercall-defs.c        |   6 +
 xen/include/public/pv-iommu.h       | 343 +++++++++++++++++
 xen/include/public/xen.h            |   1 +
 xen/include/xen/iommu.h             |   9 +
 9 files changed, 1066 insertions(+), 6 deletions(-)
 create mode 100644 xen/common/pv-iommu.c
 create mode 100644 xen/include/public/pv-iommu.h

diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
index 452b98b42d..c1d19baa13 100644
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -136,6 +136,9 @@ int iommu_identity_mapping(struct domain *d, struct iommu_context *ctx,
                            p2m_access_t p2ma, paddr_t base, paddr_t end,
                            unsigned int flag);
 void iommu_identity_map_teardown(struct domain *d, struct iommu_context *ctx);
+bool iommu_identity_map_check(struct domain *d, struct iommu_context *ctx,
+                              mfn_t mfn);
+
 
 extern bool untrusted_msi;
 
@@ -151,7 +154,7 @@ unsigned long *iommu_init_domid(domid_t reserve);
 domid_t iommu_alloc_domid(unsigned long *map);
 void iommu_free_domid(domid_t domid, unsigned long *map);
 
-int __must_check iommu_free_pgtables(struct domain *d, struct iommu_context *ctx);
+int __must_check cf_check iommu_free_pgtables(struct domain *d, struct iommu_context *ctx);
 struct domain_iommu;
 struct page_info *__must_check iommu_alloc_pgtable(struct domain_iommu *hd,
                                                    struct iommu_context *ctx,
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 0c7d0f5d46..e2180b382e 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -39,6 +39,7 @@ obj-y += percpu.o
 obj-$(CONFIG_PERF_COUNTERS) += perfc.o
 obj-bin-$(CONFIG_HAS_PMAP) += pmap.init.o
 obj-y += preempt.o
+obj-y += pv-iommu.o
 obj-y += random.o
 obj-y += rangeset.o
 obj-y += radix-tree.o
diff --git a/xen/common/pv-iommu.c b/xen/common/pv-iommu.c
new file mode 100644
index 0000000000..4cdb30a031
--- /dev/null
+++ b/xen/common/pv-iommu.c
@@ -0,0 +1,551 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * xen/common/pv_iommu.c
+ *
+ * PV-IOMMU hypercall interface.
+ */
+
+#include <xen/errno.h>
+#include <xen/mm.h>
+#include <xen/lib.h>
+#include <xen/iommu.h>
+#include <xen/sched.h>
+#include <xen/iocap.h>
+#include <xen/mm-frame.h>
+#include <xen/pci.h>
+#include <xen/guest_access.h>
+#include <asm/p2m.h>
+#include <asm/event.h>
+#include <asm/mm.h>
+#include <asm/iommu.h>
+#include <public/pv-iommu.h>
+
+#define PVIOMMU_PREFIX "[PV-IOMMU] "
+
+static int get_paged_frame(struct domain *d, gfn_t gfn, mfn_t *mfn,
+                           struct page_info **page, bool readonly)
+{
+    int ret = 0;
+    p2m_type_t p2mt = p2m_invalid;
+
+    #ifdef CONFIG_X86
+    p2m_query_t query = P2M_ALLOC;
+
+    if ( !readonly )
+        query |= P2M_UNSHARE;
+
+    *mfn = get_gfn_type(d, gfn_x(gfn), &p2mt, query);
+    #else
+    *mfn = p2m_lookup(d, gfn, &p2mt);
+    #endif
+
+    if ( mfn_eq(*mfn, INVALID_MFN) )
+    {
+        /* No mapping ? */
+        gprintk(XENLOG_G_WARNING, PVIOMMU_PREFIX
+                "Trying to map to non-backed page frame (gfn=%"PRI_gfn" p2mt=%d)\n",
+                gfn_x(gfn), p2mt);
+
+        ret = -ENOENT;
+    }
+    else if ( p2m_is_any_ram(p2mt) && mfn_valid(*mfn) )
+    {
+        struct domain *owner;
+
+        *page = mfn_to_page(*mfn);
+        owner = page_get_owner_and_reference(*page);
+        if ( !owner || (owner != d && !is_hardware_domain(d)) )
+        {
+            /* TODO: foreign mappings when d is not privileged ? */
+            put_page(*page);
+            *page = NULL;
+            return -EPERM;
+        }
+        ret = 0;
+    }
+    else if ( p2m_is_mmio(p2mt) ||
+              iomem_access_permitted(d, mfn_x(*mfn),mfn_x(*mfn)) )
+    {
+        *page = NULL;
+        ret = 0;
+    }
+    else
+    {
+        gprintk(XENLOG_WARNING, PVIOMMU_PREFIX
+                "Unexpected p2mt %d (gfn=%"PRI_gfn" mfn=%"PRI_mfn")\n",
+                p2mt, gfn_x(gfn), mfn_x(*mfn));
+
+        ret = -EPERM;
+    }
+
+    put_gfn(d, gfn_x(gfn));
+    return ret;
+}
+
+static bool can_use_iommu_check(struct domain *d)
+{
+    if ( !is_iommu_enabled(d) )
+    {
+        gprintk(XENLOG_WARNING, PVIOMMU_PREFIX "IOMMU disabled for this domain\n");
+        return false;
+    }
+
+    if ( !dom_iommu(d)->allow_pv_iommu )
+    {
+        gprintk(XENLOG_WARNING, PVIOMMU_PREFIX "PV-IOMMU disabled for this domain\n");
+        return false;
+    }
+
+    return true;
+}
+
+static long capabilities_op(struct pv_iommu_capabilities *cap, struct domain *d)
+{
+    cap->max_ctx_no = d->iommu.other_contexts.count;
+    cap->max_iova_addr = iommu_get_max_iova(d);
+
+    cap->max_pasid = 0; /* TODO */
+    cap->cap_flags = 0;
+
+    cap->pgsize_mask = PAGE_SIZE_4K;
+
+    return 0;
+}
+
+static long init_op(struct pv_iommu_init *init, struct domain *d)
+{
+    if (init->max_ctx_no == UINT32_MAX)
+        return -E2BIG;
+
+    return iommu_domain_pviommu_init(d, init->max_ctx_no + 1, init->arena_order);
+}
+
+static long alloc_context_op(struct pv_iommu_alloc *alloc, struct domain *d)
+{
+    uint16_t ctx_no = 0;
+    int status = 0;
+
+    status = iommu_context_alloc(d, &ctx_no, 0);
+
+    if ( status )
+        return status;
+
+    gprintk(XENLOG_INFO, PVIOMMU_PREFIX "Created IOMMU context %hu\n", ctx_no);
+
+    alloc->ctx_no = ctx_no;
+    return 0;
+}
+
+static long free_context_op(struct pv_iommu_free *free, struct domain *d)
+{
+    int flags = IOMMU_TEARDOWN_PREEMPT;
+
+    if ( !free->ctx_no )
+        return -EINVAL;
+
+    if ( free->free_flags & IOMMU_FREE_reattach_default )
+        flags |= IOMMU_TEARDOWN_REATTACH_DEFAULT;
+
+    return iommu_context_free(d, free->ctx_no, flags);
+}
+
+static long reattach_device_op(struct pv_iommu_reattach_device *reattach,
+                               struct domain *d)
+{
+    int ret;
+    device_t *pdev;
+    struct physdev_pci_device dev = reattach->dev;
+
+    pcidevs_lock();
+    pdev = pci_get_pdev(d, PCI_SBDF(dev.seg, dev.bus, dev.devfn));
+
+    if ( !pdev )
+    {
+        pcidevs_unlock();
+        return -ENODEV;
+    }
+
+    ret = iommu_reattach_context(d, d, pdev, reattach->ctx_no);
+
+    pcidevs_unlock();
+    return ret;
+}
+
+static long map_pages_op(struct pv_iommu_map_pages *map, struct domain *d)
+{
+    struct iommu_context *ctx;
+    int ret = 0, flush_ret;
+    struct page_info *page = NULL;
+    mfn_t mfn, mfn_lookup;
+    unsigned int lookup_flags, flags = 0, flush_flags = 0;
+    size_t i = 0;
+    dfn_t dfn0 = _dfn(map->dfn); /* original map->dfn */
+
+    if ( !map->ctx_no || !(ctx = iommu_get_context(d, map->ctx_no)) )
+        return -EINVAL;
+
+    if ( map->map_flags & IOMMU_MAP_readable )
+        flags |= IOMMUF_readable;
+
+    if ( map->map_flags & IOMMU_MAP_writeable )
+        flags |= IOMMUF_writable;
+
+    for (i = 0; i < map->nr_pages; i++)
+    {
+        gfn_t gfn = _gfn(map->gfn + i);
+        dfn_t dfn = _dfn(map->dfn + i);
+
+#ifdef CONFIG_X86
+        if ( iommu_identity_map_check(d, ctx, _mfn(map->dfn)) )
+        {
+            ret = -EADDRNOTAVAIL;
+            break;
+        }
+#endif
+
+        ret = get_paged_frame(d, gfn, &mfn, &page, 0);
+
+        if ( ret )
+            break;
+
+        /* Check for conflict with existing mappings */
+        if ( !iommu_lookup_page(d, dfn, &mfn_lookup, &lookup_flags, map->ctx_no) )
+        {
+            if ( page && mfn_valid(mfn) )
+                put_page(page);
+
+            ret = -EADDRINUSE;
+            break;
+        }
+
+        ret = iommu_map(d, dfn, mfn, 1, flags, &flush_flags, map->ctx_no);
+
+        if ( ret )
+        {
+            if ( page && mfn_valid(mfn) )
+                put_page(page);
+
+            break;
+        }
+
+        map->mapped++;
+
+        if ( (i & 0xff) && hypercall_preempt_check() )
+        {
+            i++;
+
+            map->gfn += i;
+            map->dfn += i;
+            map->nr_pages -= i;
+
+            ret = -ERESTART;
+            break;
+        }
+    }
+
+    flush_ret = iommu_iotlb_flush(d, dfn0, i, flush_flags, map->ctx_no);
+
+    iommu_put_context(ctx);
+
+    if ( flush_ret )
+        gprintk(XENLOG_G_WARNING, PVIOMMU_PREFIX
+                "Flush operation failed for %d (%d)\n", ctx->id, flush_ret);
+
+    return ret;
+}
+
+static long unmap_pages_op(struct pv_iommu_unmap_pages *unmap, struct domain *d)
+{
+    struct iommu_context *ctx;
+    mfn_t mfn;
+    int ret = 0, flush_ret;
+    unsigned int flags, flush_flags = 0;
+    size_t i = 0;
+    dfn_t dfn0 = _dfn(unmap->dfn); /* original unmap->dfn */
+
+    if ( !unmap->ctx_no || !(ctx = iommu_get_context(d, unmap->ctx_no)) )
+        return -EINVAL;
+
+    for (i = 0; i < unmap->nr_pages; i++)
+    {
+        dfn_t dfn = _dfn(unmap->dfn + i);
+
+#ifdef CONFIG_X86
+        if ( iommu_identity_map_check(d, ctx, _mfn(dfn_x(dfn))) )
+        {
+            ret = -EADDRNOTAVAIL;
+            break;
+        }
+#endif
+
+        /* Check if there is a valid mapping for this domain */
+        if ( iommu_lookup_page(d, dfn, &mfn, &flags, unmap->ctx_no) ) {
+            ret = -ENOENT;
+            break;
+        }
+
+        ret = iommu_unmap(d, dfn, 1, 0, &flush_flags, unmap->ctx_no);
+
+        if ( ret )
+            break;
+
+        unmap->unmapped++;
+
+        /* Decrement reference counter (if needed) */
+        if ( mfn_valid(mfn) )
+            put_page(mfn_to_page(mfn));
+
+        if ( (i & 0xff) && hypercall_preempt_check() )
+        {
+            i++;
+
+            unmap->dfn += i;
+            unmap->nr_pages -= i;
+
+            ret = -ERESTART;
+            break;
+        }
+    }
+
+    flush_ret = iommu_iotlb_flush(d, dfn0, i, flush_flags, unmap->ctx_no);
+
+    iommu_put_context(ctx);
+
+    if ( flush_ret )
+        printk(XENLOG_WARNING PVIOMMU_PREFIX
+               "Flush operation failed for c%d (%d)\n", ctx->id, flush_ret);
+
+    return ret;
+}
+
+static long do_iommu_subop(int subop, XEN_GUEST_HANDLE_PARAM(void) arg,
+                           struct domain *d, bool remote);
+
+static long remote_cmd_op(struct pv_iommu_remote_cmd *remote_cmd,
+                          struct domain *current_domain)
+{
+    long ret = 0;
+    struct domain *d;
+
+    /* TODO: use a better permission logic */
+    if ( !is_hardware_domain(current_domain) )
+        return -EPERM;
+
+    d = get_domain_by_id(remote_cmd->domid);
+
+    if ( !d )
+        return -ENOENT;
+
+    ret = do_iommu_subop(remote_cmd->subop, remote_cmd->arg, d, true);
+
+    put_domain(d);
+
+    return ret;
+}
+
+static long do_iommu_subop(int subop, XEN_GUEST_HANDLE_PARAM(void) arg,
+                           struct domain *d, bool remote)
+{
+    long ret = 0;
+
+    switch ( subop )
+    {
+        case IOMMU_noop:
+            break;
+
+        case IOMMU_query_capabilities:
+        {
+            struct pv_iommu_capabilities cap;
+
+            ret = capabilities_op(&cap, d);
+
+            if ( unlikely(copy_to_guest(arg, &cap, 1)) )
+                ret = -EFAULT;
+
+            break;
+        }
+
+        case IOMMU_init:
+        {
+            struct pv_iommu_init init;
+
+            if ( unlikely(copy_from_guest(&init, arg, 1)) )
+            {
+                ret = -EFAULT;
+                break;
+            }
+
+            ret = init_op(&init, d);
+            gdprintk(XENLOG_INFO, PVIOMMU_PREFIX "init -> %ld\n", ret);
+        }
+
+        case IOMMU_alloc_context:
+        {
+            struct pv_iommu_alloc alloc;
+
+            if ( unlikely(copy_from_guest(&alloc, arg, 1)) )
+            {
+                ret = -EFAULT;
+                break;
+            }
+
+            ret = alloc_context_op(&alloc, d);
+
+            if ( unlikely(copy_to_guest(arg, &alloc, 1)) )
+                ret = -EFAULT;
+
+            gdprintk(XENLOG_INFO, PVIOMMU_PREFIX
+                     "alloc_context(flags:%x) -> ctx_no: %d, ret=%ld\n",
+                     alloc.alloc_flags, alloc.ctx_no, ret);
+            break;
+        }
+
+        case IOMMU_free_context:
+        {
+            struct pv_iommu_free free;
+
+            if ( unlikely(copy_from_guest(&free, arg, 1)) )
+            {
+                ret = -EFAULT;
+                break;
+            }
+
+            ret = free_context_op(&free, d);
+            gdprintk(XENLOG_INFO, PVIOMMU_PREFIX
+                     "free_context(ctx_no:%d) -> %ld\n", free.ctx_no, ret);
+            break;
+        }
+
+        case IOMMU_reattach_device:
+        {
+            struct pv_iommu_reattach_device reattach;
+
+            if ( unlikely(copy_from_guest(&reattach, arg, 1)) )
+            {
+                ret = -EFAULT;
+                break;
+            }
+
+            ret = reattach_device_op(&reattach, d);
+            gdprintk(XENLOG_INFO, PVIOMMU_PREFIX
+                     "reattach(ctx_no:%d, bus:%02x, devfn:%2x) -> %ld\n",
+                     reattach.ctx_no, reattach.dev.bus, reattach.dev.devfn, ret);
+            break;
+        }
+
+        case IOMMU_map_pages:
+        {
+            struct pv_iommu_map_pages map;
+
+            if ( unlikely(copy_from_guest(&map, arg, 1)) )
+            {
+                ret = -EFAULT;
+                break;
+            }
+
+            ret = map_pages_op(&map, d);
+
+            if ( unlikely(copy_to_guest(arg, &map, 1)) )
+                ret = -EFAULT;
+
+            break;
+        }
+
+        case IOMMU_unmap_pages:
+        {
+            struct pv_iommu_unmap_pages unmap;
+
+            if ( unlikely(copy_from_guest(&unmap, arg, 1)) )
+            {
+                ret = -EFAULT;
+                break;
+            }
+
+            ret = unmap_pages_op(&unmap, d);
+
+            if ( unlikely(copy_to_guest(arg, &unmap, 1)) )
+                ret = -EFAULT;
+
+            break;
+        }
+
+        case IOMMU_remote_cmd:
+        {
+            struct pv_iommu_remote_cmd remote_cmd;
+
+            if ( remote )
+            {
+                /* Prevent remote_cmd from being called recursively */
+                ret = -EINVAL;
+                break;
+            }
+
+            if ( unlikely(copy_from_guest(&remote_cmd, arg, 1)) )
+            {
+                ret = -EFAULT;
+                break;
+            }
+
+            ret = remote_cmd_op(&remote_cmd, d);
+            break;
+        }
+
+        /*
+         * TODO
+         */
+        case IOMMU_alloc_nested:
+        {
+            ret = -EOPNOTSUPP;
+            break;
+        }
+
+        case IOMMU_flush_nested:
+        {
+            ret = -EOPNOTSUPP;
+            break;
+        }
+
+        case IOMMU_attach_pasid:
+        {
+            ret = -EOPNOTSUPP;
+            break;
+        }
+
+        case IOMMU_detach_pasid:
+        {
+            ret = -EOPNOTSUPP;
+            break;
+        }
+
+        default:
+            return -EOPNOTSUPP;
+    }
+
+    return ret;
+}
+
+long do_iommu_op(unsigned int subop, XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    long ret = 0;
+    struct domain *d = current->domain;
+
+    if ( !can_use_iommu_check(d) )
+        return -ENODEV;
+
+    ret = do_iommu_subop(subop, arg, d, false);
+
+    if ( ret == -ERESTART )
+        return hypercall_create_continuation(__HYPERVISOR_iommu_op, "ih", subop, arg);
+
+    return ret;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 4434a9dcd0..5c6b272697 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -193,6 +193,99 @@ static void __hwdom_init check_hwdom_reqs(struct domain *d)
     arch_iommu_check_autotranslated_hwdom(d);
 }
 
+
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
@@ -238,6 +331,8 @@ int iommu_domain_init(struct domain *d, unsigned int opts)
 
     ASSERT(!(hd->need_sync && hd->hap_pt_share));
 
+    hd->allow_pv_iommu = true;
+
     rspin_lock(&hd->default_ctx.lock);
     ret = iommu_context_init(d, &hd->default_ctx, 0, IOMMU_CONTEXT_INIT_default);
     rspin_unlock(&hd->default_ctx.lock);
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index d8becfa869..ac339a2ed3 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -215,6 +215,32 @@ int arch_iommu_context_teardown(struct domain *d, struct iommu_context *ctx, u32
     return 0;
 }
 
+int arch_iommu_pviommu_init(struct domain *d, uint16_t nb_ctx, uint32_t arena_order)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+
+    if ( arena_order == 0 )
+        return 0;
+
+    return iommu_arena_initialize(&hd->arch.pt_arena, NULL, arena_order, 0);
+}
+
+int arch_iommu_pviommu_teardown(struct domain *d)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+
+    if ( iommu_arena_teardown(&hd->arch.pt_arena, true) )
+    {
+        printk(XENLOG_WARNING "IOMMU Arena used while being destroyed\n");
+        WARN();
+
+        /* Teardown anyway */
+        iommu_arena_teardown(&hd->arch.pt_arena, false);
+    }
+
+    return 0;
+}
+
 void arch_iommu_domain_destroy(struct domain *d)
 {
 }
@@ -394,6 +420,19 @@ void iommu_identity_map_teardown(struct domain *d, struct iommu_context *ctx)
     }
 }
 
+bool iommu_identity_map_check(struct domain *d, struct iommu_context *ctx,
+                              mfn_t mfn)
+{
+    struct identity_map *map;
+    uint64_t addr = pfn_to_paddr(mfn_x(mfn));
+
+    list_for_each_entry ( map, &ctx->arch.identity_maps, list )
+        if (addr >= map->base && addr < map->end)
+            return true;
+
+    return false;
+}
+
 struct handle_iomemcap {
     struct rangeset *r;
     unsigned long last;
@@ -648,7 +687,7 @@ void iommu_free_domid(domid_t domid, unsigned long *map)
         BUG();
 }
 
-int iommu_free_pgtables(struct domain *d, struct iommu_context *ctx)
+int cf_check iommu_free_pgtables(struct domain *d, struct iommu_context *ctx)
 {
     struct domain_iommu *hd = dom_iommu(d);
     struct page_info *pg;
@@ -665,7 +704,10 @@ int iommu_free_pgtables(struct domain *d, struct iommu_context *ctx)
 
     while ( (pg = page_list_remove_head(&ctx->arch.pgtables)) )
     {
-        free_domheap_page(pg);
+        if (ctx->id == 0)
+            free_domheap_page(pg);
+        else
+            iommu_arena_free_page(&hd->arch.pt_arena, pg);
 
         if ( !(++done & 0xff) && general_preempt_check() )
             return -ERESTART;
@@ -687,7 +729,11 @@ struct page_info *iommu_alloc_pgtable(struct domain_iommu *hd,
         memflags = MEMF_node(hd->node);
 #endif
 
-    pg = alloc_domheap_page(NULL, memflags);
+    if (ctx->id == 0)
+        pg = alloc_domheap_page(NULL, memflags);
+    else
+        pg = iommu_arena_allocate_page(&hd->arch.pt_arena);
+
     if ( !pg )
         return NULL;
 
@@ -766,9 +812,14 @@ void iommu_queue_free_pgtable(struct domain *d, struct iommu_context *ctx,
 
     page_list_del(pg, &ctx->arch.pgtables);
 
-    page_list_add_tail(pg, &per_cpu(free_pgt_list, cpu));
+    if ( !ctx->id )
+    {
+        page_list_add_tail(pg, &per_cpu(free_pgt_list, cpu));
 
-    tasklet_schedule(&per_cpu(free_pgt_tasklet, cpu));
+        tasklet_schedule(&per_cpu(free_pgt_tasklet, cpu));
+    }
+    else
+        iommu_arena_free_page(&dom_iommu(d)->arch.pt_arena, pg);
 }
 
 static int cf_check cpu_callback(
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index cef08eeec1..0cfda01094 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -213,6 +213,9 @@ hypfs_op(unsigned int cmd, const char *arg1, unsigned long arg2, void *arg3, uns
 #ifdef CONFIG_X86
 xenpmu_op(unsigned int op, xen_pmu_params_t *arg)
 #endif
+#ifdef CONFIG_HAS_PASSTHROUGH
+iommu_op(unsigned int subop, void *arg)
+#endif
 
 #ifdef CONFIG_PV
 caller: pv64
@@ -301,5 +304,8 @@ mca                                do       do       -        -        -
 #if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
 paging_domctl_cont                 do       do       do       do       -
 #endif
+#ifdef CONFIG_HAS_PASSTHROUGH
+iommu_op                           do       do       do       do       -
+#endif
 
 #endif /* !CPPCHECK */
diff --git a/xen/include/public/pv-iommu.h b/xen/include/public/pv-iommu.h
new file mode 100644
index 0000000000..6f50aea4b7
--- /dev/null
+++ b/xen/include/public/pv-iommu.h
@@ -0,0 +1,343 @@
+/* SPDX-License-Identifier: MIT */
+/**
+ * pv-iommu.h
+ *
+ * Paravirtualized IOMMU driver interface.
+ *
+ * Copyright (c) 2024 Teddy Astie <teddy.astie@vates.tech>
+ */
+
+#ifndef __XEN_PUBLIC_PV_IOMMU_H__
+#define __XEN_PUBLIC_PV_IOMMU_H__
+
+#include "xen.h"
+#include "physdev.h"
+
+#ifndef uint64_aligned_t
+#define uint64_aligned_t uint64_t
+#endif
+
+#define IOMMU_DEFAULT_CONTEXT (0)
+
+enum pv_iommu_cmd {
+    /* Basic cmd */
+    IOMMU_noop = 0,
+    IOMMU_query_capabilities = 1,
+    IOMMU_init = 2,
+    IOMMU_alloc_context = 3,
+    IOMMU_free_context = 4,
+    IOMMU_reattach_device = 5,
+    IOMMU_map_pages = 6,
+    IOMMU_unmap_pages = 7,
+    IOMMU_remote_cmd = 8,
+
+    /* Extended cmd */
+    IOMMU_alloc_nested = 9,      /* if IOMMUCAP_nested */
+    IOMMU_flush_nested = 10,     /* if IOMMUCAP_nested */
+    IOMMU_attach_pasid = 11,     /* if IOMMUCAP_pasid */
+    IOMMU_detach_pasid = 12,     /* if IOMMUCAP_pasid */
+};
+
+/**
+ * If set, default context allow DMA to domain memory.
+ * If cleared, default context blocks all DMA to domain memory.
+ */
+#define IOMMUCAP_default_identity  (1U << 0)
+
+/**
+ * IOMMU_MAP_cache support.
+ */
+#define IOMMUCAP_cache     (1U << 1)
+
+/**
+ * If set, IOMMU_alloc_nested and IOMMU_flush_nested are supported.
+ */
+#define IOMMUCAP_nested    (1U << 2)
+
+/**
+ * If set, IOMMU_attach_pasid and IOMMU_detach_pasid are supported and
+ * a device PASID can be specified in reattach_context.
+ */
+#define IOMMUCAP_pasid     (1U << 3)
+
+/**
+ * If set, IOMMU_ALLOC_identity is supported in pv_iommu_alloc.
+ */
+#define IOMMUCAP_identity  (1U << 4)
+
+/**
+ * IOMMU_query_capabilities
+ * Query PV-IOMMU capabilities for this domain.
+ */
+struct pv_iommu_capabilities {
+    /*
+     * OUT: Maximum device address (iova) that the guest can use for mappings.
+     */
+    uint64_aligned_t max_iova_addr;
+
+    /* OUT: IOMMU capabilities flags */
+    uint32_t cap_flags;
+
+    /* OUT: Mask of all supported page sizes. */
+    uint32_t pgsize_mask;
+
+    /* OUT: Maximum pasid (if IOMMUCAP_pasid) */
+    uint32_t max_pasid;
+
+    /* OUT: Maximum number of IOMMU context this domain can use. */
+    uint16_t max_ctx_no;
+
+    uint16_t pad0;
+};
+typedef struct pv_iommu_capabilities pv_iommu_capabilities_t;
+DEFINE_XEN_GUEST_HANDLE(pv_iommu_capabilities_t);
+
+/**
+ * IOMMU_init
+ * Initialize PV-IOMMU for this domain.
+ *
+ * Fails with -EACCESS if PV-IOMMU is already initialized.
+ */
+struct pv_iommu_init {
+    /* IN: Maximum number of IOMMU context this domain can use. */
+    uint32_t max_ctx_no;
+
+    /* IN: Arena size in pages (in power of two) */
+    uint32_t arena_order;
+};
+typedef struct pv_iommu_init pv_iommu_init_t;
+DEFINE_XEN_GUEST_HANDLE(pv_iommu_init_t);
+
+/**
+ * Create a 1:1 identity mapped context to domain memory
+ * (needs IOMMUCAP_identity).
+ */
+#define IOMMU_ALLOC_identity (1 << 0)
+
+/**
+ * IOMMU_alloc_context
+ * Allocate an IOMMU context.
+ * Fails with -ENOSPC if no context number is available.
+ */
+struct pv_iommu_alloc {
+    /* OUT: allocated IOMMU context number */
+    uint16_t ctx_no;
+
+    /* IN: allocation flags */
+    uint32_t alloc_flags;
+};
+typedef struct pv_iommu_alloc pv_iommu_alloc_t;
+DEFINE_XEN_GUEST_HANDLE(pv_iommu_alloc_t);
+
+/**
+ * Move all devices to default context before freeing the context.
+ */
+#define IOMMU_FREE_reattach_default (1 << 0)
+
+/**
+ * IOMMU_free_context
+ * Destroy a IOMMU context.
+ *
+ * If IOMMU_FREE_reattach_default is specified, move all context devices to
+ * default context before destroying this context.
+ *
+ * If there are devices in the context and IOMMU_FREE_reattach_default is not
+ * specified, fail with -EBUSY.
+ *
+ * The default context can't be destroyed.
+ */
+struct pv_iommu_free {
+    /* IN: IOMMU context number to free */
+    uint16_t ctx_no;
+
+    /* IN: Free operation specific flags */
+    uint32_t free_flags;
+};
+typedef struct pv_iommu_free pv_iommu_free_t;
+DEFINE_XEN_GUEST_HANDLE(pv_iommu_free_t);
+
+/* Device has read access */
+#define IOMMU_MAP_readable (1 << 0)
+
+/* Device has write access */
+#define IOMMU_MAP_writeable (1 << 1)
+
+/* Enforce DMA coherency */
+#define IOMMU_MAP_cache (1 << 2)
+
+/**
+ * IOMMU_map_pages
+ * Map pages on a IOMMU context.
+ *
+ * pgsize must be supported by pgsize_mask.
+ * Fails with -EINVAL if mapping on top of another mapping.
+ * Report actually mapped page count in mapped field (regardless of failure).
+ */
+struct pv_iommu_map_pages {
+    /* IN: IOMMU context number */
+    uint16_t ctx_no;
+
+    /* IN: Guest frame number */
+    uint64_aligned_t gfn;
+
+    /* IN: Device frame number */
+    uint64_aligned_t dfn;
+
+    /* IN: Map flags */
+    uint32_t map_flags;
+
+    /* IN: Size of pages to map */
+    uint32_t pgsize;
+
+    /* IN: Number of pages to map */
+    uint32_t nr_pages;
+
+    /* OUT: Number of pages actually mapped */
+    uint32_t mapped;
+};
+typedef struct pv_iommu_map_pages pv_iommu_map_pages_t;
+DEFINE_XEN_GUEST_HANDLE(pv_iommu_map_pages_t);
+
+/**
+ * IOMMU_unmap_pages
+ * Unmap pages on a IOMMU context.
+ *
+ * pgsize must be supported by pgsize_mask.
+ * Report actually unmapped page count in mapped field (regardless of failure).
+ * Fails with -ENOENT when attempting to unmap a page without any mapping
+ */
+struct pv_iommu_unmap_pages {
+    /* IN: IOMMU context number */
+    uint16_t ctx_no;
+
+    /* IN: Device frame number */
+    uint64_aligned_t dfn;
+
+    /* IN: Size of pages to unmap */
+    uint32_t pgsize;
+
+    /* IN: Number of pages to unmap */
+    uint32_t nr_pages;
+
+    /* OUT: Number of pages actually unmapped */
+    uint32_t unmapped;
+};
+typedef struct pv_iommu_unmap_pages pv_iommu_unmap_pages_t;
+DEFINE_XEN_GUEST_HANDLE(pv_iommu_unmap_pages_t);
+
+/**
+ * IOMMU_reattach_device
+ * Reattach a device to another IOMMU context.
+ * Fails with -ENODEV if no such device exist.
+ */
+struct pv_iommu_reattach_device {
+    /* IN: Target IOMMU context number */
+    uint16_t ctx_no;
+
+    /* IN: Physical device to move */
+    struct physdev_pci_device dev;
+
+    /* IN: PASID of the device (if IOMMUCAP_pasid) */
+    uint32_t pasid;
+};
+typedef struct pv_iommu_reattach_device pv_iommu_reattach_device_t;
+DEFINE_XEN_GUEST_HANDLE(pv_iommu_reattach_device_t);
+
+
+/**
+ * IOMMU_remote_cmd
+ * Do a PV-IOMMU operation on another domain.
+ * Current domain needs to be allowed to act on the target domain, otherwise
+ * fails with -EPERM.
+ */
+struct pv_iommu_remote_cmd {
+    /* IN: Target domain to do the subop on */
+    uint16_t domid;
+
+    /* IN: Command to do on target domain. */
+    uint16_t subop;
+
+    /* INOUT: Command argument from current domain memory */
+    XEN_GUEST_HANDLE(void) arg;
+};
+typedef struct pv_iommu_remote_cmd pv_iommu_remote_cmd_t;
+DEFINE_XEN_GUEST_HANDLE(pv_iommu_remote_cmd_t);
+
+/**
+ * IOMMU_alloc_nested
+ * Create a nested IOMMU context (needs IOMMUCAP_nested).
+ *
+ * This context uses a platform-specific page table from domain address space
+ * specified in pgtable_gfn and use it for nested translations.
+ *
+ * Explicit flushes needs to be submited with IOMMU_flush_nested on
+ * modification of the nested pagetable to ensure coherency between IOTLB and
+ * nested page table.
+ *
+ * This context can be destroyed using IOMMU_free_context.
+ * This context cannot be modified using map_pages, unmap_pages.
+ */
+struct pv_iommu_alloc_nested {
+    /* OUT: allocated IOMMU context number */
+    uint16_t ctx_no;
+
+    /* IN: guest frame number of the nested page table */
+    uint64_aligned_t pgtable_gfn;
+
+    /* IN: nested mode flags */
+    uint64_aligned_t nested_flags;
+};
+typedef struct pv_iommu_alloc_nested pv_iommu_alloc_nested_t;
+DEFINE_XEN_GUEST_HANDLE(pv_iommu_alloc_nested_t);
+
+/**
+ * IOMMU_flush_nested (needs IOMMUCAP_nested)
+ * Flush the IOTLB for nested translation.
+ */
+struct pv_iommu_flush_nested {
+    /* TODO */
+};
+typedef struct pv_iommu_flush_nested pv_iommu_flush_nested_t;
+DEFINE_XEN_GUEST_HANDLE(pv_iommu_flush_nested_t);
+
+/**
+ * IOMMU_attach_pasid (needs IOMMUCAP_pasid)
+ * Attach a new device-with-pasid to a IOMMU context.
+ * If a matching device-with-pasid already exists (globally),
+ * fail with -EEXIST.
+ * If pasid is 0, fails with -EINVAL.
+ * If physical device doesn't exist in domain, fail with -ENOENT.
+ */
+struct pv_iommu_attach_pasid {
+    /* IN: IOMMU context to add the device-with-pasid in */
+    uint16_t ctx_no;
+
+    /* IN: Physical device */
+    struct physdev_pci_device dev;
+
+    /* IN: pasid of the device to attach */
+    uint32_t pasid;
+};
+typedef struct pv_iommu_attach_pasid pv_iommu_attach_pasid_t;
+DEFINE_XEN_GUEST_HANDLE(pv_iommu_attach_pasid_t);
+
+/**
+ * IOMMU_detach_pasid (needs IOMMUCAP_pasid)
+ * detach a device-with-pasid.
+ * If the device-with-pasid doesn't exist or belong to the domain,
+ * fail with -ENOENT.
+ * If pasid is 0, fails with -EINVAL.
+ */
+struct pv_iommu_detach_pasid {
+    /* IN: Physical device */
+    struct physdev_pci_device dev;
+
+    /* pasid of the device to detach */
+    uint32_t pasid;
+};
+typedef struct pv_iommu_detach_pasid pv_iommu_detach_pasid_t;
+DEFINE_XEN_GUEST_HANDLE(pv_iommu_detach_pasid_t);
+
+/* long do_iommu_op(int subop, XEN_GUEST_HANDLE_PARAM(void) arg) */
+
+#endif
\ No newline at end of file
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index 82b9c05a76..f0b1860c7c 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -118,6 +118,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
 #define __HYPERVISOR_xenpmu_op            40
 #define __HYPERVISOR_dm_op                41
 #define __HYPERVISOR_hypfs_op             42
+#define __HYPERVISOR_iommu_op             43
 
 /* Architecture-specific hypercall definitions. */
 #define __HYPERVISOR_arch_0               48
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 66951c9809..3c77dfaf41 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -487,6 +487,10 @@ struct domain_iommu {
     /* SAF-2-safe enum constant in arithmetic operation */
     DECLARE_BITMAP(features, IOMMU_FEAT_count);
 
+
+    /* Is the domain allowed to use PV-IOMMU ? */
+    bool allow_pv_iommu;
+
     /* Does the guest share HAP mapping with the IOMMU? */
     bool hap_pt_share;
 
@@ -526,6 +530,8 @@ static inline int iommu_do_domctl(struct xen_domctl *domctl, struct domain *d,
 }
 #endif
 
+int iommu_domain_pviommu_init(struct domain *d, uint16_t nb_ctx, uint32_t arena_order);
+
 int __must_check iommu_suspend(void);
 void iommu_resume(void);
 void iommu_crash_shutdown(void);
@@ -542,6 +548,7 @@ int iommu_do_pci_domctl(struct xen_domctl *domctl, struct domain *d,
 
 void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev);
 
+uint64_t iommu_get_max_iova(struct domain *d);
 
 struct iommu_context *iommu_get_context(struct domain *d, u16 ctx_id);
 void iommu_put_context(struct iommu_context *ctx);
@@ -574,6 +581,8 @@ int iommu_detach_context(struct domain *d, device_t *dev);
  */
 DECLARE_PER_CPU(bool, iommu_dont_flush_iotlb);
 
+int arch_iommu_pviommu_init(struct domain *d, uint16_t nb_ctx, uint32_t arena_order);
+int arch_iommu_pviommu_teardown(struct domain *d);
 bool arch_iommu_use_permitted(const struct domain *d);
 
 #ifdef CONFIG_X86
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEAFA181CC
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 17:13:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875534.1286008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taGsc-0002cU-Fy; Tue, 21 Jan 2025 16:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875534.1286008; Tue, 21 Jan 2025 16:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taGsc-0002Zj-Bj; Tue, 21 Jan 2025 16:13:30 +0000
Received: by outflank-mailman (input) for mailman id 875534;
 Tue, 21 Jan 2025 16:13:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wtim=UN=bounce.vates.tech=bounce-md_30504962.678fc7a5.v1-57151dc962994d31b6ca681faeeeafde@srs-se1.protection.inumbo.net>)
 id 1taGsa-0001Ka-NM
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 16:13:28 +0000
Received: from mail187-43.suw11.mandrillapp.com
 (mail187-43.suw11.mandrillapp.com [198.2.187.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4fa83da-d812-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 17:13:26 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-43.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4Ycsh55dsZzLfH7tY
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 16:13:25 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 57151dc962994d31b6ca681faeeeafde; Tue, 21 Jan 2025 16:13:25 +0000
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
X-Inumbo-ID: a4fa83da-d812-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1737476005; x=1737746005;
	bh=p2FEphAG0RzRrA4z4pvhf20EVKbkOp01bHUz8SZBsrg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=V0hDTJrIC0s5IXLDIuu25RiaHgbz68kzG4Za6qtZPMa66sIMtXJkBtxX366vJdpin
	 O8/3q+kEbfeS65a6aPKJC/nFF9otcXLDZsFy51YiXc1NFlNZw2F41tTzeimfFWXvW3
	 5dRxkxu1wLeMqz1nuRdE38zFEOOcKrimyFRbTwrhhPBQb03HSTsai6SFmA9L5i0qXe
	 tHdD0QoMz0/jCOHEKrF5VgdXhxTVZAsdvEPGtxAkVchigu41OTOk5iARnAxYn6qTMn
	 AdeUjVjXIbt2EwzZIW8asUcs51aHp5W3QtUjSnJuhiVZl46DQU45toq5WgFYDsjiw+
	 wsTxvHn8IBoVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1737476005; x=1737736505; i=teddy.astie@vates.tech;
	bh=p2FEphAG0RzRrA4z4pvhf20EVKbkOp01bHUz8SZBsrg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FdvBhZQDlXojhhhujhTIc8mUvgobfYNtFQOa33r34txMAqWDPUq+wH6GQ4dFwmG62
	 37vNFCy0jBtKGB1k5WGZEvpc4HKeDf4nBs7FkUoj2TjQnBUp61cmKo0whR4lqRFjUi
	 94RF/bI3alifdGd6yj1bcE8PJCwWpo6i1Ndvi0gCQgYXY6wHTS8H1bWVa/wWvOBY57
	 GJLyZdARY0Lr+YBI2OnVkOJMGjX2I+2Omfe72ryiLpF9oNtv5dYULk6babjsU4umjO
	 HJSAwO+/ToJrpfmRAmukM8TH1+KipGUK3rdpwpvF/Oza+yRerxJxf/w4oPr5ZZtRjV
	 7adYHOjTWnDXQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20RFC=20PATCH=20v5=203/5]=20xen/public:=20Introduce=20PV-IOMMU=20hypercall=20interface?=
X-Mailer: git-send-email 2.45.3
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1737476004649
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Message-Id: <29f3e87532573bfc4196083ab0291326adae5100.1737470269.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1737470269.git.teddy.astie@vates.tech>
References: <cover.1737470269.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.57151dc962994d31b6ca681faeeeafde?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250121:md
Date: Tue, 21 Jan 2025 16:13:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Introduce a new pv interface to manage the underlying IOMMU and manage contexts
and devices. This interface allows creation of new contexts from Dom0 and
addition of IOMMU mappings using guest PoV.

This interface doesn't allow creation of mapping to other domains.

Signed-off-by Teddy Astie <teddy.astie@vates.tech>
---
Changed in V2:
* cleanup some unneeded includes
* fix dangling devices in context on detach

Changed in V3:
* add unlocked _iommu_lookup_page
* iommu_check_context+iommu_get_context -> iommu_get_context and check for NULL
* prevent IOMMU operations on dying contexts

Changed in V4:
* changed context lock logic : iommu_get_context -> iommu_get_context+iommu_put_context
* added no-dma mode (see cover letter)
* use new initialization logic
---
 xen/common/Makefile           |   1 +
 xen/common/pv-iommu.c         | 539 ++++++++++++++++++++++++++++++++++
 xen/include/hypercall-defs.c  |   6 +
 xen/include/public/pv-iommu.h | 343 ++++++++++++++++++++++
 xen/include/public/xen.h      |   1 +
 5 files changed, 890 insertions(+)
 create mode 100644 xen/common/pv-iommu.c
 create mode 100644 xen/include/public/pv-iommu.h

diff --git a/xen/common/Makefile b/xen/common/Makefile
index f12a474d40..52ada89888 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -58,6 +58,7 @@ obj-y += wait.o
 obj-bin-y += warning.init.o
 obj-$(CONFIG_XENOPROF) += xenoprof.o
 obj-y += xmalloc_tlsf.o
+obj-y += pv-iommu.o
 
 obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 unzstd earlycpio,$(n).init.o)
 
diff --git a/xen/common/pv-iommu.c b/xen/common/pv-iommu.c
new file mode 100644
index 0000000000..9c7d04b4c7
--- /dev/null
+++ b/xen/common/pv-iommu.c
@@ -0,0 +1,539 @@
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
+        printk(XENLOG_G_WARNING PVIOMMU_PREFIX
+               "Trying to map to non-backed page frame (gfn=%"PRI_gfn
+               " p2mt=%d d%d)\n", gfn_x(gfn), p2mt, d->domain_id);
+
+        ret = -ENOENT;
+    }
+    else if ( p2m_is_any_ram(p2mt) && mfn_valid(*mfn) )
+    {
+        *page = get_page_from_mfn(*mfn, d);
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
+        printk(XENLOG_G_WARNING PVIOMMU_PREFIX
+               "Unexpected p2mt %d (d%d gfn=%"PRI_gfn" mfn=%"PRI_mfn")\n",
+               p2mt, d->domain_id, gfn_x(gfn), mfn_x(*mfn));
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
+        printk(XENLOG_G_WARNING PVIOMMU_PREFIX
+               "IOMMU disabled for this domain\n");
+        return false;
+    }
+
+    if ( !dom_iommu(d)->allow_pv_iommu )
+    {
+        printk(XENLOG_G_WARNING PVIOMMU_PREFIX
+               "PV-IOMMU disabled for this domain\n");
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
+    if ( !dom_iommu(d)->no_dma )
+        cap->cap_flags |= IOMMUCAP_default_identity;
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
+    u16 ctx_no = 0;
+    int status = 0;
+
+    status = iommu_context_alloc(d, &ctx_no, 0);
+
+    if ( status )
+        return status;
+
+    printk(XENLOG_G_INFO PVIOMMU_PREFIX
+           "Created IOMMU context %hu in d%d\n", ctx_no, d->domain_id);
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
+        return -ENOENT;
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
+    unsigned int flags = 0, flush_flags = 0;
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
+        if ( !iommu_lookup_page(d, dfn, &mfn_lookup, &flags, map->ctx_no) )
+        {
+            if ( page )
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
+            if ( page )
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
+        printk(XENLOG_G_WARNING PVIOMMU_PREFIX
+               "Flush operation failed for d%dc%d (%d)\n", d->domain_id,
+               ctx->id, flush_ret);
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
+        if ( iommu_identity_map_check(d, ctx, _mfn(unmap->dfn)) )
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
+               "Flush operation failed for d%dc%d (%d)\n", d->domain_id,
+               ctx->id, flush_ret);
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
+
+    if ( !can_use_iommu_check(current->domain) )
+        return -ENODEV;
+
+    ret = do_iommu_subop(subop, arg, current->domain, false);
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
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 47c093acc8..59d7c02f55 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -209,6 +209,9 @@ hypfs_op(unsigned int cmd, const char *arg1, unsigned long arg2, void *arg3, uns
 #ifdef CONFIG_X86
 xenpmu_op(unsigned int op, xen_pmu_params_t *arg)
 #endif
+#ifdef CONFIG_HAS_PASSTHROUGH
+iommu_op(unsigned int subop, void *arg)
+#endif
 
 #ifdef CONFIG_PV
 caller: pv64
@@ -295,5 +298,8 @@ mca                                do       do       -        -        -
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
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
index b47d48d0e2..28ab815ebc 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -118,6 +118,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
 #define __HYPERVISOR_xenpmu_op            40
 #define __HYPERVISOR_dm_op                41
 #define __HYPERVISOR_hypfs_op             42
+#define __HYPERVISOR_iommu_op             43
 
 /* Architecture-specific hypercall definitions. */
 #define __HYPERVISOR_arch_0               48
-- 
2.45.3



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


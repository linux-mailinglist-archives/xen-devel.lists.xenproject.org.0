Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E04EA92EA29
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 16:04:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757527.1166552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRuPJ-0000ok-PV; Thu, 11 Jul 2024 14:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757527.1166552; Thu, 11 Jul 2024 14:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRuPJ-0000lX-MD; Thu, 11 Jul 2024 14:04:25 +0000
Received: by outflank-mailman (input) for mailman id 757527;
 Thu, 11 Jul 2024 14:04:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XHCp=OL=bounce.vates.tech=bounce-md_30504962.668fe664.v1-d61770e47a4c4aaf88d960323ac73369@srs-se1.protection.inumbo.net>)
 id 1sRuPH-0008Pw-TB
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 14:04:24 +0000
Received: from mail186-27.suw21.mandrillapp.com
 (mail186-27.suw21.mandrillapp.com [198.2.186.27])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 798547ed-3f8e-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 16:04:22 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-27.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4WKc0j0CPMz6CQ50L
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 14:04:21 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d61770e47a4c4aaf88d960323ac73369; Thu, 11 Jul 2024 14:04:20 +0000
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
X-Inumbo-ID: 798547ed-3f8e-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720706661; x=1720967161;
	bh=Q/O9cr6CBssIHXO8r7oS6ys6nHh5XJshkIKzcRx9Qco=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=n6n+bRXyB9jF3N0ATkmoRJXGXkdbMsG9wUlaJoIEI3yg+fg0B4mrAtcj/fVBPbJnv
	 olXfw2ce74/rMFfADLN6WnUruUx4YveoQUTQR+h/2W+GG5g4ObIccUCHXAMWGSrBZL
	 pcKNYE7blXtyjcpqXFPzKFUgzcDCTn2CKLlR3WpOnx0J5KmCKdY6o/MQw20GbXgjB9
	 XxOkHVJUFVSbJRW6zsD/usFIEk0+IZCUvqooHnAf5khcCayJ5UAVvKmzwO88UYvYye
	 tPKUaTGOyN94esWy0jh6WaReV0HOIrsIpOLHuCFX89HDcqVbsNRE7L2azMccnhqEao
	 Jjn/9S4qcylrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720706661; x=1720967161; i=teddy.astie@vates.tech;
	bh=Q/O9cr6CBssIHXO8r7oS6ys6nHh5XJshkIKzcRx9Qco=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=y0OZp01OneB9KSYYqlyke3Gp5E92/mdLfWpQZWmiZPv+1exzf/k2obruHMz92BEgq
	 ucam/IAsQCSQ5orXjqnypwsaNY47TgT687aaJIBFIys1WGpR2aaxOBIDakzaGNoKMa
	 hwA7xcelZuORON6YvObpyWnFQShN6pwH2QgmyxKJm6GaEWmGxtvqRqRrThJSljyu/Z
	 2h0COO2og5YYqfGSXEsLr/vFC6CNdFg5GKu1lsaTQb5XzJCuAW46Vkxxx89vrrb7Gl
	 +3clGLIdGrWznFiXWZoTWB3HobTYEzsnq1i7MKR+rHkoWXrgQbmypQKYkqioNYbQus
	 TBe58N76NNYrw==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20XEN=20PATCH=20v3=205/5]=20xen/public:=20Introduce=20PV-IOMMU=20hypercall=20interface?=
X-Mailer: git-send-email 2.45.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720706659900
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Message-Id: <f9ae663df38acc0d330b7582dfaa7ac199746aca.1720703078.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1720703078.git.teddy.astie@vates.tech>
References: <cover.1720703078.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d61770e47a4c4aaf88d960323ac73369?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240711:md
Date: Thu, 11 Jul 2024 14:04:20 +0000
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
* formatting

Changed in V3:
* prevent IOMMU operations on dying contexts
---
 xen/common/Makefile           |   1 +
 xen/common/pv-iommu.c         | 328 ++++++++++++++++++++++++++++++++++
 xen/include/hypercall-defs.c  |   6 +
 xen/include/public/pv-iommu.h | 114 ++++++++++++
 xen/include/public/xen.h      |   1 +
 5 files changed, 450 insertions(+)
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
index 0000000000..a94c0f1e1a
--- /dev/null
+++ b/xen/common/pv-iommu.c
@@ -0,0 +1,328 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * xen/common/pv_iommu.c
+ *
+ * PV-IOMMU hypercall interface.
+ */
+
+#include <xen/mm.h>
+#include <xen/lib.h>
+#include <xen/iommu.h>
+#include <xen/sched.h>
+#include <xen/pci.h>
+#include <xen/guest_access.h>
+#include <asm/p2m.h>
+#include <asm/event.h>
+#include <public/pv-iommu.h>
+
+#define PVIOMMU_PREFIX "[PV-IOMMU] "
+
+#define PVIOMMU_MAX_PAGES 256 /* Move to Kconfig ? */
+
+/* Allowed masks for each sub-operation */
+#define ALLOC_OP_FLAGS_MASK (0)
+#define FREE_OP_FLAGS_MASK (IOMMU_TEARDOWN_REATTACH_DEFAULT)
+
+static int get_paged_frame(struct domain *d, gfn_t gfn, mfn_t *mfn,
+                           struct page_info **page, int readonly)
+{
+    p2m_type_t p2mt;
+
+    *page = get_page_from_gfn(d, gfn_x(gfn), &p2mt,
+                             (readonly) ? P2M_ALLOC : P2M_UNSHARE);
+
+    if ( !(*page) )
+    {
+        *mfn = INVALID_MFN;
+        if ( p2m_is_shared(p2mt) )
+            return -EINVAL;
+        if ( p2m_is_paging(p2mt) )
+        {
+            p2m_mem_paging_populate(d, gfn);
+            return -EIO;
+        }
+
+        return -EPERM;
+    }
+
+    *mfn = page_to_mfn(*page);
+
+    return 0;
+}
+
+static int can_use_iommu_check(struct domain *d)
+{
+    if ( !iommu_enabled )
+    {
+        printk(PVIOMMU_PREFIX "IOMMU is not enabled\n");
+        return 0;
+    }
+
+    if ( !is_hardware_domain(d) )
+    {
+        printk(PVIOMMU_PREFIX "Non-hardware domain\n");
+        return 0;
+    }
+
+    if ( !is_iommu_enabled(d) )
+    {
+        printk(PVIOMMU_PREFIX "IOMMU disabled for this domain\n");
+        return 0;
+    }
+
+    return 1;
+}
+
+static long query_cap_op(struct pv_iommu_op *op, struct domain *d)
+{
+    op->cap.max_ctx_no = d->iommu.other_contexts.count;
+    op->cap.max_nr_pages = PVIOMMU_MAX_PAGES;
+    op->cap.max_iova_addr = (1LLU << 39) - 1; /* TODO: hardcoded 39-bits */
+
+    return 0;
+}
+
+static long alloc_context_op(struct pv_iommu_op *op, struct domain *d)
+{
+    u16 ctx_no = 0;
+    int status = 0;
+
+    status = iommu_context_alloc(d, &ctx_no, op->flags & ALLOC_OP_FLAGS_MASK);
+
+    if (status < 0)
+        return status;
+
+    printk("Created context %hu\n", ctx_no);
+
+    op->ctx_no = ctx_no;
+    return 0;
+}
+
+static long free_context_op(struct pv_iommu_op *op, struct domain *d)
+{
+    return iommu_context_free(d, op->ctx_no,
+                              IOMMU_TEARDOWN_PREEMPT | (op->flags & FREE_OP_FLAGS_MASK));
+}
+
+static long reattach_device_op(struct pv_iommu_op *op, struct domain *d)
+{
+    struct physdev_pci_device dev = op->reattach_device.dev;
+    device_t *pdev;
+
+    pdev = pci_get_pdev(d, PCI_SBDF(dev.seg, dev.bus, dev.devfn));
+
+    if ( !pdev )
+        return -ENOENT;
+
+    return iommu_reattach_context(d, d, pdev, op->ctx_no);
+}
+
+static long map_pages_op(struct pv_iommu_op *op, struct domain *d)
+{
+    int ret = 0, flush_ret;
+    struct page_info *page = NULL;
+    mfn_t mfn;
+    unsigned int flags;
+    unsigned int flush_flags = 0;
+    size_t i = 0;
+
+    if ( op->map_pages.nr_pages > PVIOMMU_MAX_PAGES )
+        return -E2BIG;
+
+    if ( !iommu_check_context(d, op->ctx_no) )
+        return -EINVAL;
+
+    //printk("Mapping gfn:%lx-%lx to dfn:%lx-%lx on %hu\n",
+    //       op->map_pages.gfn, op->map_pages.gfn + op->map_pages.nr_pages - 1,
+    //       op->map_pages.dfn, op->map_pages.dfn + op->map_pages.nr_pages - 1,
+    //       op->ctx_no);
+
+    flags = 0;
+
+    if ( op->flags & IOMMU_OP_readable )
+        flags |= IOMMUF_readable;
+
+    if ( op->flags & IOMMU_OP_writeable )
+        flags |= IOMMUF_writable;
+
+    spin_lock(&dom_iommu(d)->lock);
+
+    for (i = 0; i < op->map_pages.nr_pages; i++)
+    {
+        gfn_t gfn = _gfn(op->map_pages.gfn + i);
+        dfn_t dfn = _dfn(op->map_pages.dfn + i);
+
+        /* Lookup pages struct backing gfn */
+        ret = get_paged_frame(d, gfn, &mfn, &page, 0);
+
+        if ( ret )
+            break;
+
+        /* Check for conflict with existing mappings */
+        if ( !_iommu_lookup_page(d, dfn, &mfn, &flags, op->ctx_no) )
+        {
+            put_page(page);
+            ret = -EADDRINUSE;
+            break;
+        }
+
+        ret = _iommu_map(d, dfn, mfn, 1, flags, &flush_flags, op->ctx_no);
+
+        if ( ret )
+            break;
+    }
+
+    flush_ret = _iommu_iotlb_flush(d, _dfn(op->map_pages.dfn),
+                                   op->map_pages.nr_pages, flush_flags,
+                                   op->ctx_no);
+
+    spin_unlock(&dom_iommu(d)->lock);
+
+    op->map_pages.mapped = i;
+
+    if ( flush_ret )
+        printk("Flush operation failed (%d)\n", flush_ret);
+
+    return ret;
+}
+
+static long unmap_pages_op(struct pv_iommu_op *op, struct domain *d)
+{
+    mfn_t mfn;
+    int ret = 0, flush_ret;
+    unsigned int flags;
+    unsigned int flush_flags = 0;
+    size_t i = 0;
+
+    if ( op->unmap_pages.nr_pages > PVIOMMU_MAX_PAGES )
+        return -E2BIG;
+
+    if ( !iommu_check_context(d, op->ctx_no) )
+        return -EINVAL;
+
+    //printk("Unmapping dfn:%lx-%lx on %hu\n",
+    //       op->unmap_pages.dfn, op->unmap_pages.dfn + op->unmap_pages.nr_pages - 1,
+    //       op->ctx_no);
+
+    spin_lock(&dom_iommu(d)->lock);
+
+    for (i = 0; i < op->unmap_pages.nr_pages; i++)
+    {
+        dfn_t dfn = _dfn(op->unmap_pages.dfn + i);
+
+        /* Check if there is a valid mapping for this domain */
+        if ( _iommu_lookup_page(d, dfn, &mfn, &flags, op->ctx_no) ) {
+            ret = -ENOENT;
+            break;
+        }
+
+        ret = _iommu_unmap(d, dfn, 1, 0, &flush_flags, op->ctx_no);
+
+        if (ret)
+            break;
+
+        /* Decrement reference counter */
+        put_page(mfn_to_page(mfn));
+    }
+
+    flush_ret = _iommu_iotlb_flush(d, _dfn(op->unmap_pages.dfn),
+                                   op->unmap_pages.nr_pages, flush_flags,
+                                   op->ctx_no);
+
+    spin_unlock(&dom_iommu(d)->lock);
+
+    op->unmap_pages.unmapped = i;
+
+    if ( flush_ret )
+        printk("Flush operation failed (%d)\n", flush_ret);
+
+    return ret;
+}
+
+static long lookup_page_op(struct pv_iommu_op *op, struct domain *d)
+{
+    mfn_t mfn;
+    gfn_t gfn;
+    unsigned int flags = 0;
+
+    if ( !iommu_check_context(d, op->ctx_no) )
+        return -EINVAL;
+
+    /* Check if there is a valid BFN mapping for this domain */
+    if ( iommu_lookup_page(d, _dfn(op->lookup_page.dfn), &mfn, &flags, op->ctx_no) )
+        return -ENOENT;
+
+    gfn = mfn_to_gfn(d, mfn);
+    BUG_ON(gfn_eq(gfn, INVALID_GFN));
+
+    op->lookup_page.gfn = gfn_x(gfn);
+
+    return 0;
+}
+
+long do_iommu_sub_op(struct pv_iommu_op *op)
+{
+    struct domain *d = current->domain;
+
+    if ( !can_use_iommu_check(d) )
+        return -EPERM;
+
+    switch ( op->subop_id )
+    {
+        case 0:
+            return 0;
+
+        case IOMMUOP_query_capabilities:
+            return query_cap_op(op, d);
+
+        case IOMMUOP_alloc_context:
+            return alloc_context_op(op, d);
+
+        case IOMMUOP_free_context:
+            return free_context_op(op, d);
+
+        case IOMMUOP_reattach_device:
+            return reattach_device_op(op, d);
+
+        case IOMMUOP_map_pages:
+            return map_pages_op(op, d);
+
+        case IOMMUOP_unmap_pages:
+            return unmap_pages_op(op, d);
+
+        case IOMMUOP_lookup_page:
+            return lookup_page_op(op, d);
+
+        default:
+            return -EINVAL;
+    }
+}
+
+long do_iommu_op(XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    long ret = 0;
+    struct pv_iommu_op op;
+
+    if ( unlikely(copy_from_guest(&op, arg, 1)) )
+        return -EFAULT;
+
+    ret = do_iommu_sub_op(&op);
+
+    if ( ret == -ERESTART )
+        return hypercall_create_continuation(__HYPERVISOR_iommu_op, "h", arg);
+
+    if ( unlikely(copy_to_guest(arg, &op, 1)) )
+        return -EFAULT;
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
index 47c093acc8..4ba4480867 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -209,6 +209,9 @@ hypfs_op(unsigned int cmd, const char *arg1, unsigned long arg2, void *arg3, uns
 #ifdef CONFIG_X86
 xenpmu_op(unsigned int op, xen_pmu_params_t *arg)
 #endif
+#ifdef CONFIG_HAS_PASSTHROUGH
+iommu_op(void *arg)
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
index 0000000000..45f9c44eb1
--- /dev/null
+++ b/xen/include/public/pv-iommu.h
@@ -0,0 +1,114 @@
+/* SPDX-License-Identifier: MIT */
+/******************************************************************************
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
+#define IOMMU_DEFAULT_CONTEXT (0)
+
+/**
+ * Query PV-IOMMU capabilities for this domain.
+ */
+#define IOMMUOP_query_capabilities    1
+
+/**
+ * Allocate an IOMMU context, the new context handle will be written to ctx_no.
+ */
+#define IOMMUOP_alloc_context         2
+
+/**
+ * Destroy a IOMMU context.
+ * All devices attached to this context are reattached to default context.
+ *
+ * The default context can't be destroyed (0).
+ */
+#define IOMMUOP_free_context          3
+
+/**
+ * Reattach the device to IOMMU context.
+ */
+#define IOMMUOP_reattach_device       4
+
+#define IOMMUOP_map_pages             5
+#define IOMMUOP_unmap_pages           6
+
+/**
+ * Get the GFN associated to a specific DFN.
+ */
+#define IOMMUOP_lookup_page           7
+
+struct pv_iommu_op {
+    uint16_t subop_id;
+    uint16_t ctx_no;
+
+/**
+ * Create a context that is cloned from default.
+ * The new context will be populated with 1:1 mappings covering the entire guest memory.
+ */
+#define IOMMU_CREATE_clone (1 << 0)
+
+#define IOMMU_OP_readable (1 << 0)
+#define IOMMU_OP_writeable (1 << 1)
+    uint32_t flags;
+
+    union {
+        struct {
+            uint64_t gfn;
+            uint64_t dfn;
+            /* Number of pages to map */
+            uint32_t nr_pages;
+            /* Number of pages actually mapped after sub-op */
+            uint32_t mapped;
+        } map_pages;
+
+        struct {
+            uint64_t dfn;
+            /* Number of pages to unmap */
+            uint32_t nr_pages;
+            /* Number of pages actually unmapped after sub-op */
+            uint32_t unmapped;
+        } unmap_pages;
+
+        struct {
+            struct physdev_pci_device dev;
+        } reattach_device;
+
+        struct {
+            uint64_t gfn;
+            uint64_t dfn;
+        } lookup_page;
+
+        struct {
+            /* Maximum number of IOMMU context this domain can use. */
+            uint16_t max_ctx_no;
+            /* Maximum number of pages that can be modified in a single map/unmap operation. */
+            uint32_t max_nr_pages;
+            /* Maximum device address (iova) that the guest can use for mappings. */
+            uint64_t max_iova_addr;
+        } cap;
+    };
+};
+
+typedef struct pv_iommu_op pv_iommu_op_t;
+DEFINE_XEN_GUEST_HANDLE(pv_iommu_op_t);
+
+#endif
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
2.45.2



Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


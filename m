Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 621DA5A45B1
	for <lists+xen-devel@lfdr.de>; Mon, 29 Aug 2022 11:04:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394498.633921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSagk-0001VN-2v; Mon, 29 Aug 2022 09:04:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394498.633921; Mon, 29 Aug 2022 09:04:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSagj-0001Ru-Vq; Mon, 29 Aug 2022 09:04:09 +0000
Received: by outflank-mailman (input) for mailman id 394498;
 Mon, 29 Aug 2022 09:04:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O3Zu=ZB=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1oSagi-0001Rn-5M
 for xen-devel@lists.xenproject.org; Mon, 29 Aug 2022 09:04:08 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8929c316-2779-11ed-9250-1f966e50362f;
 Mon, 29 Aug 2022 11:04:06 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id bu22so8973914wrb.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Aug 2022 02:04:06 -0700 (PDT)
Received: from horizon.home (lfbn-gre-1-214-221.w90-112.abo.wanadoo.fr.
 [90.112.175.221]) by smtp.gmail.com with ESMTPSA id
 i20-20020a05600c2d9400b003a342933727sm8040952wmg.3.2022.08.29.02.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 02:04:04 -0700 (PDT)
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
X-Inumbo-ID: 8929c316-2779-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=83hCYhTpJUqzvF+GGXyp/XooWdmfFOGxjThsG0346Fs=;
        b=BUix1ueGWHzJsQXFMXC0m/byILtaD6UlvwnP8MOyYIE/m5bYmFXHqQaEoh3zQ5osLY
         g+axCmjKplejM5EjgfXJdn18QkHkObF2tg0VJcta1tu3VNcfQGtMnaHDdp8uCZjsO6pr
         75dcsJneR+Qm54fKlg713U/ug/YZwELUAXn193hXYJq43LlK4QU0L+w3BO4h4KGrnLaE
         x/idDrxE4t3RNzh4YEZw8ocbKiBfJ9YR3SYD4SLHV85nmOgEY98a1rjWzRstdh3E4cuN
         gBylGtTaOWJpW/OJ1x0shZTLDfiuFLKBp7y+hqjjQkOFJw33DoCwm2UGm8JKG4EuQPWZ
         W8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=83hCYhTpJUqzvF+GGXyp/XooWdmfFOGxjThsG0346Fs=;
        b=BS0YKqWkunnuntmTSsBh0A4BeRWPeG8130pnlwYc4yrxeGajc81RSEY32dBA3j973N
         GBz57twJJN1Jvl1STQWxFn9rxBYT/Oc/GBWcTIMGeH5taMziLXyj11KVgCPjl3PsKKSr
         HOv/9wxXQ3nIdW7YX/oomQlsxYkIHxAZ+KnWGdjNUdj0poGFB/R8YxjCFkaCjXGQA9jd
         yS+LlxmIq04CzBJqH/sXP69NrZBOCs7q7qSW+ThVb3hbjL15xCsXRRBrjDutyiUeafqb
         OtUqVnQuEVzGZMe+yMmiCdFbhJH2EtQp5AM8SaTP6TOgwIQsmMjWnLGVvtEKLOepittE
         J5rg==
X-Gm-Message-State: ACgBeo3vWdvBUm/cTxbI9OpIC9D2fKCZJ79bINa6JmGGfLUjuCdCRHAZ
	oiMPE/p8GQ6JKpJXZqPfJgdv1Y0Mn8jEwg==
X-Google-Smtp-Source: AA6agR7EpcQJZZo2h4d09GzYa1az9k0Q1inlGRocyeDFqQY/Q8tOViag0CV1g2y7fu5aawuDgqDxdw==
X-Received: by 2002:adf:ffcc:0:b0:226:df89:73d2 with SMTP id x12-20020adfffcc000000b00226df8973d2mr446544wrs.612.1661763845519;
        Mon, 29 Aug 2022 02:04:05 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
X-Google-Original-From: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
To: xen-devel@lists.xenproject.org
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH v1] xen/docs: Document acquire resource interface
Date: Mon, 29 Aug 2022 11:03:51 +0200
Message-Id: <d28893ed5c617f6e350f755508f10ba5a12e7098.1661763622.git.matias.vara@vates.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit creates a new doc to document the acquire resource interface. This
is a reference document.

Signed-off-by: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
---
Changes in v1:
- correct documentation about how mfns are allocated
- correct documentation about how mfns are released
- use the wording tool instead of pv tool
- fix typos
---
 .../acquire_resource_reference.rst            | 338 ++++++++++++++++++
 docs/hypervisor-guide/index.rst               |   2 +
 2 files changed, 340 insertions(+)
 create mode 100644 docs/hypervisor-guide/acquire_resource_reference.rst

diff --git a/docs/hypervisor-guide/acquire_resource_reference.rst b/docs/hypervisor-guide/acquire_resource_reference.rst
new file mode 100644
index 0000000000..d1989d2fd4
--- /dev/null
+++ b/docs/hypervisor-guide/acquire_resource_reference.rst
@@ -0,0 +1,338 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Acquire resource reference
+==========================
+
+Acquire resource allows you to share a resource between Xen and dom0.
+Resources are generally represented by pages that are mapped into user-space.
+These pages are accessed by Xen and belong to a domU. This document describes
+the api to build tools to access these resources. The document also describes
+the software components required to create and expose a domain's resource. This
+is not a tutorial or a how-to guide. It merely describes the machinery that is
+already described in the code itself.
+
+.. warning::
+
+    The code in this document may already be out of date, however it may
+    be enough to illustrate how the acquire resource interface works.
+
+
+Tool API
+-----------
+
+This section describes the api to map a resource in a user-space tool in dom0.
+The api is based on the following functions:
+
+* xenforeignmemory_open()
+
+* xenforeignmemory_resource_size()
+
+* xenforeignmemory_map_resource()
+
+* xenforeignmemory_unmap_resource()
+
+The ``xenforeignmemory_open()`` function gets the handler that is used by the
+rest of the functions:
+
+.. code-block:: c
+
+   fh = xenforeignmemory_open(NULL, 0);
+
+The ``xenforeignmemory_resource_size()`` function gets the size of the resource.
+For example, in the following code, we get the size of the
+``XENMEM_RESOURCE_VMTRACE_BUF``:
+
+.. code-block:: c
+
+    rc = xenforeignmemory_resource_size(fh, domid, XENMEM_resource_vmtrace_buf, vcpu, &size);
+
+The size of the resource is returned in ``size`` in bytes.
+
+The ``xenforeignmemory_map_resource()`` function maps a domain's resource. The
+function is declared as follows:
+
+.. code-block:: c
+
+    xenforeignmemory_resource_handle *xenforeignmemory_map_resource(
+        xenforeignmemory_handle *fmem, domid_t domid, unsigned int type,
+        unsigned int id, unsigned long frame, unsigned long nr_frames,
+        void **paddr, int prot, int flags);
+
+The size of the resource is in number of frames. For example, **QEMU** uses it
+to map the ioreq server between the domain and QEMU:
+
+.. code-block:: c
+
+    fres = xenforeignmemory_map_resource(xen_fmem, xen_domid, XENMEM_resource_ioreq_server,
+         state->ioservid, 0, 2, &addr, PROT_READ | PROT_WRITE, 0);
+
+
+The third parameter corresponds with the resource that we request from the
+domain, e.g., ``XENMEM_resource_ioreq_server``. The seventh parameter returns a
+pointer-to-pointer to the address of the mapped resource.
+
+Finally, the ``xenforeignmemory_unmap_resource()`` function unmaps the region:
+
+.. code-block:: c
+    :caption: tools/misc/xen-vmtrace.c
+
+    if ( fres && xenforeignmemory_unmap_resource(fh, fres) )
+        perror("xenforeignmemory_unmap_resource()");
+
+Exposing a domain's resource
+---------------------------------
+
+In this section, we describe how to build a new resource and expose it to dom0.
+Resources are defined in ``xen/include/public/memory.h``. In Xen-4.16, there
+are three resources:
+
+.. code-block:: c
+    :caption: xen/include/public/memory.h
+
+    #define XENMEM_resource_ioreq_server 0
+    #define XENMEM_resource_grant_table 1
+    #define XENMEM_resource_vmtrace_buf 2
+
+The ``resource_max_frames()`` function returns the size of a resource. The
+resource may provide a handler to get the size. This is the definition of the
+``resource_max_frame()`` function:
+
+.. code-block:: c
+    :linenos:
+    :caption: xen/common/memory.c
+
+    static unsigned int resource_max_frames(const struct domain *d,
+                                            unsigned int type, unsigned int id)
+    {
+        switch ( type )
+        {
+        case XENMEM_resource_grant_table:
+            return gnttab_resource_max_frames(d, id);
+
+        case XENMEM_resource_ioreq_server:
+            return ioreq_server_max_frames(d);
+
+        case XENMEM_resource_vmtrace_buf:
+            return d->vmtrace_size >> PAGE_SHIFT;
+
+        default:
+            return -EOPNOTSUPP;
+        }
+    }
+
+The ``_acquire_resource()`` function invokes the corresponding handler that maps
+the resource. The handler relies on ``type`` to select the correct handler:
+
+.. code-block:: c
+    :linenos:
+    :caption: xen/common/memory.c
+
+    static int _acquire_resource(
+        struct domain *d, unsigned int type, unsigned int id, unsigned int frame,
+        unsigned int nr_frames, xen_pfn_t mfn_list[])
+    {
+        switch ( type )
+        {
+        case XENMEM_resource_grant_table:
+            return gnttab_acquire_resource(d, id, frame, nr_frames, mfn_list);
+
+        case XENMEM_resource_ioreq_server:
+            return acquire_ioreq_server(d, id, frame, nr_frames, mfn_list);
+
+        case XENMEM_resource_vmtrace_buf:
+            return acquire_vmtrace_buf(d, id, frame, nr_frames, mfn_list);
+
+        default:
+            return -EOPNOTSUPP;
+        }
+    }
+
+Note that if a new resource has to be added, these two functions need to be
+modified. These handlers have the common declaration:
+
+.. code-block:: c
+    :linenos:
+    :caption: xen/common/memory.c
+
+    static int acquire_vmtrace_buf(
+        struct domain *d, unsigned int id, unsigned int frame,
+        unsigned int nr_frames, xen_pfn_t mfn_list[])
+    {
+
+The function returns in ``mfn_list[]`` a number of ``nr_frames`` of pointers to
+mfn pages. These pages are designed to be mapped contiguously. For example, for
+the ``XENMEM_resource_vmtrace_buf`` resource, the handler is defined as
+follows:
+
+.. code-block:: c
+    :linenos:
+    :caption: xen/common/memory.c
+
+    static int acquire_vmtrace_buf(
+        struct domain *d, unsigned int id, unsigned int frame,
+        unsigned int nr_frames, xen_pfn_t mfn_list[])
+    {
+        const struct vcpu *v = domain_vcpu(d, id);
+        unsigned int i;
+        mfn_t mfn;
+
+        if ( !v )
+            return -ENOENT;
+
+        if ( !v->vmtrace.pg ||
+             (frame + nr_frames) > (d->vmtrace_size >> PAGE_SHIFT) )
+            return -EINVAL;
+
+        mfn = page_to_mfn(v->vmtrace.pg);
+
+        for ( i = 0; i < nr_frames; i++ )
+            mfn_list[i] = mfn_x(mfn) + frame + i;
+
+        return nr_frames;
+    }
+
+Note that the handler only returns the mfn pages that have been previously
+allocated in ``vmtrace.pg``. The allocation of the resource happens during the
+instantiation of the vcpu. A set of pages is allocated during the instantiation
+of each vcpu. For allocating the page, we use the domheap with the
+``MEMF_no_refcount`` flag:
+
+.. code-block:: c
+
+    v->vmtrace.pg = alloc_domheap_page(s->target, MEMF_no_refcount);
+
+This allocates a page with the `PGC_allocated` bit set and a single reference
+count. Then, we grab a general reference count as well as a writable type count,
+so that it does not get used as a special page.
+
+.. code-block:: c
+
+    for ( i = 0; i < (d->vmtrace_size >> PAGE_SHIFT); i++ )
+        if ( unlikely(!get_page_and_type(&pg[i], d, PGT_writable_page)) )
+            /*
+             * The domain can't possibly know about this page yet, so failure
+             * here is a clear indication of something fishy going on.
+             */
+            goto refcnt_err;
+
+To access the pages in the context of Xen, we map the page by
+using:
+
+.. code-block:: c
+
+    va_page = __map_domain_page_global(page);
+
+The ``va_page`` pointer is used in the context of Xen.
+
+To release the page, we first unmap the frame with ``unmap_domheap_map()``, and we drop first the allocation and second the own type count, thus:
+
+.. code-block:: c
+
+    put_page_alloc_ref(pg);
+    put_page_and_type(pg);
+
+Note that we cannot free the page until all references have dropped and that includes the reference from tools in dom0. The ``put_page()`` brings the reference count to 0 thus automatically freeing the page.
+
+Acquire Resources
+-----------------
+
+This section briefly describes the resources that rely on the acquire resource
+interface. These resources are mapped by tools like QEMU.
+
+Intel Processor Trace (IPT)
+```````````````````````````
+
+This resource is named ``XENMEM_resource_vmtrace_buf`` and its size in bytes is
+set in ``d->vmtrace_size``. It contains the traces generated by the IPT. These
+traces are generated by each vcpu. The pages are allocated during
+``vcpu_create()``. The pages are stored in the ``vcpu`` structure in
+``sched.h``:
+
+.. code-block:: c
+
+   struct {
+        struct page_info *pg; /* One contiguous allocation of d->vmtrace_size */
+    } vmtrace;
+
+During ``vcpu_create()``, the pg is allocated by using the per-domain heap:
+
+.. code-block:: c
+
+    pg = alloc_domheap_pages(d, get_order_from_bytes(d->vmtrace_size), MEMF_no_refcount);
+
+For a given vcpu, the page is loaded into the guest at
+``vmx_restore_guest_msrs()``:
+
+.. code-block:: c
+    :caption: xen/arch/x86/hvm/vmx/vmx.c
+
+    wrmsrl(MSR_RTIT_OUTPUT_BASE, page_to_maddr(v->vmtrace.pg));
+
+The releasing of the pages happens during the vcpu teardown.
+
+Grant Table
+```````````
+
+The grant tables are represented by the ``XENMEM_resource_grant_table``
+resource. Grant tables are special since guests can map grant tables. Dom0 also
+needs to write into the grant table to set up the grants for xenstored and
+xenconsoled. When acquiring the resource, the pages are allocated from the xen
+heap in ``gnttab_get_shared_frame_mfn()``:
+
+.. code-block:: c
+    :linenos:
+    :caption: xen/common/grant_table.c
+
+    gt->shared_raw[i] = alloc_xenheap_page()
+    share_xen_page_with_guest(virt_to_page(gt->shared_raw[i]), d, SHARE_rw);
+
+Then, pages are shared with the guest. These pages are then converted from virt
+to mfn before returning:
+
+.. code-block:: c
+    :linenos:
+
+    for ( i = 0; i < nr_frames; ++i )
+         mfn_list[i] = virt_to_mfn(vaddrs[frame + i]);
+
+Ioreq server
+````````````
+
+The ioreq server is represented by the ``XENMEM_resource_ioreq_server``
+resource. An ioreq server provides emulated devices to HVM and PVH guests. The
+allocation is done in ``ioreq_server_alloc_mfn()``. The following code partially
+shows the allocation of the pages that represent the ioreq server:
+
+.. code-block:: c
+    :linenos:
+    :caption: xen/common/ioreq.c
+
+    page = alloc_domheap_page(s->target, MEMF_no_refcount);
+
+    iorp->va = __map_domain_page_global(page);
+    if ( !iorp->va )
+        goto fail;
+
+    iorp->page = page;
+    clear_page(iorp->va);
+    return 0;
+
+The function above is invoked from ``ioreq_server_get_frame()`` which is called
+from ``acquire_ioreq_server()``. For acquiring, the function returns the
+allocated pages as follows:
+
+.. code-block:: c
+
+    *mfn = page_to_mfn(s->bufioreq.page);
+
+The ``ioreq_server_free_mfn()`` function releases the pages as follows:
+
+.. code-block:: c
+    :linenos:
+    :caption: xen/common/ioreq.c
+
+    unmap_domain_page_global(iorp->va);
+    iorp->va = NULL;
+
+    put_page_alloc_ref(page);
+    put_page_and_type(page);
diff --git a/docs/hypervisor-guide/index.rst b/docs/hypervisor-guide/index.rst
index e4393b0697..961a11525f 100644
--- a/docs/hypervisor-guide/index.rst
+++ b/docs/hypervisor-guide/index.rst
@@ -9,3 +9,5 @@ Hypervisor documentation
    code-coverage
 
    x86/index
+
+   acquire_resource_reference
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 833925328C4
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 13:20:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336514.560848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntSZr-0002Ai-4Q; Tue, 24 May 2022 11:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336514.560848; Tue, 24 May 2022 11:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntSZr-00027R-0X; Tue, 24 May 2022 11:19:51 +0000
Received: by outflank-mailman (input) for mailman id 336514;
 Tue, 24 May 2022 11:19:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nynv=WA=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1ntSZp-00027L-Cv
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 11:19:49 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a4cbde0-db53-11ec-837f-e5687231ffcc;
 Tue, 24 May 2022 13:19:45 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id s28so25090320wrb.7
 for <xen-devel@lists.xenproject.org>; Tue, 24 May 2022 04:19:45 -0700 (PDT)
Received: from horizon.home (amontsouris-681-1-27-236.w90-87.abo.wanadoo.fr.
 [90.87.147.236]) by smtp.gmail.com with ESMTPSA id
 i5-20020a05600c290500b00397381a7ae8sm1772915wmd.30.2022.05.24.04.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 04:19:44 -0700 (PDT)
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
X-Inumbo-ID: 6a4cbde0-db53-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IGPt0T0MFxBcd/BjqjNUsvr4d51XY+PJmgSjprAWMDQ=;
        b=UnA2moS6CyM+EPmOmKGglmZB2XmV2J7r6hski81FP0TNZUzk+siAnsX3IgCFReWbEV
         G/GqEs9EcQSZL2V5BaxrM5rDL06L51g2tbOLUHUtZn1L+8T3S0W7q0CNFTac1dLArJo7
         PtXDgV5/n+qkyonr9oduG1BitLhWrhAYovJHpS9v7oEKaN+91GxjIF71c1pVkpZ44iAm
         LkLue8gGtALJ52Km+ugDiVv8JEFTkKmwhWClNvyxOsmZB7PPWBeDzBrNcYkNTCaWPi/a
         q+ZpFX/ko+O4gbXalXfv6tS5DTYIH9f7lA6tNx3zE5dNm8MktJHq9ClXlJTgsG2QDz0X
         lWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IGPt0T0MFxBcd/BjqjNUsvr4d51XY+PJmgSjprAWMDQ=;
        b=G7JQsPt1f0oiHsDsTJwULhXRuhA7eN1MHcHfY6prqJoTP50OxM4KVvONVkJfhtxTXg
         T5RjYWvJe420fyZu6PT3OVSz9nAOuYQsScTIGbr7g8QRkpOwUTwpZghqav1stT1yTxkK
         AXDeakt2P17GKg7R5AH15k+WmY19fISBAwVmPeirdYM2O+SRpkRpdA+0ovm1wX9D5WO1
         FBFmmqI7Yv8lgfb0ADPNjPndzC3g9QGp/EQ8JOWdZnyieY27LzVvUKmL0xpxiU2qjm/O
         Y9GHvpyyrpZJWG+AqIEwTiZJHtegMlZWtpCwzQX/Qf/iID7QudNUWMJveNeZfkMgmocg
         lZvw==
X-Gm-Message-State: AOAM532gvUvIQv4vHFaLMUcemkb++FKk3tDHnsnb6uEuv9/j646kogGL
	40G2A78E/F8gcQQfmck9KC08/kHuc/J02g==
X-Google-Smtp-Source: ABdhPJzFycfqg4WCve+xFYi4eXYhaj7uVysEJXGWKCFOhN6Nr1HkjCxQ9kIHlDLDTLBqVdBJ8Vol6w==
X-Received: by 2002:adf:f6cd:0:b0:20e:673a:a3e6 with SMTP id y13-20020adff6cd000000b0020e673aa3e6mr22244017wrp.694.1653391184594;
        Tue, 24 May 2022 04:19:44 -0700 (PDT)
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
Subject: [RFC PATCH] xen/docs: Document acquire resource interface
Date: Tue, 24 May 2022 13:19:30 +0200
Message-Id: <324b2ea5b95ef5233202aa8eed2085c665259753.1653390261.git.matias.vara@vates.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit creates a new doc to document the acquire resource interface. This
is a reference document.

Signed-off-by: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
---
RFC: The current document still contains TODOs. I am not really sure why
different resources are implemented differently. I would like to understand it
better so I can document it and then easily build new resources. I structured
the document in two sections but I am not sure if that is the right way to do
it.

---
 .../acquire_resource_reference.rst            | 337 ++++++++++++++++++
 docs/hypervisor-guide/index.rst               |   2 +
 2 files changed, 339 insertions(+)
 create mode 100644 docs/hypervisor-guide/acquire_resource_reference.rst

diff --git a/docs/hypervisor-guide/acquire_resource_reference.rst b/docs/hypervisor-guide/acquire_resource_reference.rst
new file mode 100644
index 0000000000..a9944aae1d
--- /dev/null
+++ b/docs/hypervisor-guide/acquire_resource_reference.rst
@@ -0,0 +1,337 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Acquire resource reference
+==========================
+
+Acquire resource allows you to share a resource between a domain and a dom0 pv
+tool.  Resources are generally represented by pages that are mapped into the pv
+tool memory space. These pages are accessed by Xen and they may or may not be
+accessed by the DomU itself. This document describes the api to build pv tools.
+The document also describes the software components required to create and
+expose a domain's resource. This is not a tutorial or a how-to guide. It merely
+describes the machinery that is already described in the code itself.
+
+.. warning::
+
+    The code in this document may already be out of date, however it may
+    be enough to illustrate how the acquire resource interface works.
+
+
+PV tool API
+-----------
+
+This section describes the api to map a resource from a pv tool. The api is based
+on the following functions:
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
+point-to-pointer to the address of the mapped resource.
+
+Finally, the ``xenforeignmemory_unmap_resource()`` function unmaps the region:
+
+.. code-block:: c
+    :caption: tools/misc/xen-vmtrace.c
+
+    if ( fres && xenforeignmemory_unmap_resource(fh, fres) )
+        perror("xenforeignmemory_unmap_resource()");
+
+Sharing a resource with a pv tool
+---------------------------------
+
+In this section, we describe how to build a new resource and share it with a pv
+too. Resources are defined in ``xen/include/public/memory.h``. In Xen-4.16,
+there are three resources:
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
+the resource. The handler relies on ``type`` to select the right handler:
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
+mfn pages. For example, for the ``XENMEM_resource_vmtrace_buf`` resource, the
+handler is defined as follows:
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
+.. What do we require to set this flag?
+
+.. code-block:: c
+
+    v->vmtrace.pg = alloc_domheap_page(s->target, MEMF_no_refcount);
+
+To access the pages in the context of Xen, we are required to map the page by
+using:
+
+.. code-block:: c
+
+    va_page = __map_domain_page_global(page);
+
+The ``va_page`` pointer is used in the context of Xen. The function that
+allocates the pages runs the following verification after allocation. For
+example, the following code is from ``vmtrace_alloc_buffer()`` that allocates
+the page for vmtrace for a given vcpu:
+
+.. Why is this verification required after allocation?
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
+The allocated pages are released by first using ``unmap_domheap_page()`` and
+then using ``free_domheap_page()`` to finally release the page. Note that the
+releasing of these resources may vary depending on how there are allocated.
+
+Acquire Resources
+-----------------
+
+This section briefly describes the resources that rely on the acquire resource
+interface. These resources are mapped by pv tools like QEMU.
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
+
+.. TODO: Why unmap() and free() are not used instead?
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0D31ACB48
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 17:46:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP6iZ-00068m-5p; Thu, 16 Apr 2020 15:46:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jP6iX-00068W-HE
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 15:46:17 +0000
X-Inumbo-ID: 685b5374-7ff9-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 685b5374-7ff9-11ea-9e09-bc764e2007e4;
 Thu, 16 Apr 2020 15:46:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 146EEAC50;
 Thu, 16 Apr 2020 15:46:15 +0000 (UTC)
Subject: [PATCH 3/6] x86/mem-paging: use guest handle for XENMEM_paging_op_prep
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3b7cc69d-709c-570a-716a-c45f6fda181f@suse.com>
Message-ID: <f3c57792-d372-a70f-691b-87681b83e898@suse.com>
Date: Thu, 16 Apr 2020 17:46:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3b7cc69d-709c-570a-716a-c45f6fda181f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

While it should have been this way from the beginning, not doing so will
become an actual problem with PVH Dom0. The interface change is binary
compatible, but requires tools side producers to be re-built.

Drop the bogus/unnecessary page alignment restriction on the input
buffer at the same time.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Is there really no way to avoid the buffer copying in libxc?

--- a/tools/libxc/xc_mem_paging.c
+++ b/tools/libxc/xc_mem_paging.c
@@ -26,15 +26,33 @@ static int xc_mem_paging_memop(xc_interf
                                unsigned int op, uint64_t gfn, void *buffer)
 {
     xen_mem_paging_op_t mpo;
+    DECLARE_HYPERCALL_BOUNCE(buffer, XC_PAGE_SIZE,
+                             XC_HYPERCALL_BUFFER_BOUNCE_IN);
+    int rc;
 
     memset(&mpo, 0, sizeof(mpo));
 
     mpo.op      = op;
     mpo.domain  = domain_id;
     mpo.gfn     = gfn;
-    mpo.buffer  = (unsigned long) buffer;
 
-    return do_memory_op(xch, XENMEM_paging_op, &mpo, sizeof(mpo));
+    if ( buffer )
+    {
+        if ( xc_hypercall_bounce_pre(xch, buffer) )
+        {
+            PERROR("Could not bounce memory for XENMEM_paging_op %u", op);
+            return -1;
+        }
+
+        set_xen_guest_handle(mpo.buffer, buffer);
+    }
+
+    rc = do_memory_op(xch, XENMEM_paging_op, &mpo, sizeof(mpo));
+
+    if ( buffer )
+        xc_hypercall_bounce_post(xch, buffer);
+
+    return rc;
 }
 
 int xc_mem_paging_enable(xc_interface *xch, uint32_t domain_id,
@@ -92,28 +110,13 @@ int xc_mem_paging_prep(xc_interface *xch
 int xc_mem_paging_load(xc_interface *xch, uint32_t domain_id,
                        uint64_t gfn, void *buffer)
 {
-    int rc, old_errno;
-
     errno = EINVAL;
 
     if ( !buffer )
         return -1;
 
-    if ( ((unsigned long) buffer) & (XC_PAGE_SIZE - 1) )
-        return -1;
-
-    if ( mlock(buffer, XC_PAGE_SIZE) )
-        return -1;
-
-    rc = xc_mem_paging_memop(xch, domain_id,
-                             XENMEM_paging_op_prep,
-                             gfn, buffer);
-
-    old_errno = errno;
-    munlock(buffer, XC_PAGE_SIZE);
-    errno = old_errno;
-
-    return rc;
+    return xc_mem_paging_memop(xch, domain_id, XENMEM_paging_op_prep,
+                               gfn, buffer);
 }
 
 
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1779,7 +1779,8 @@ void p2m_mem_paging_populate(struct doma
  * mfn if populate was called for  gfn which was nominated but not evicted. In
  * this case only the p2mt needs to be forwarded.
  */
-int p2m_mem_paging_prep(struct domain *d, unsigned long gfn_l, uint64_t buffer)
+int p2m_mem_paging_prep(struct domain *d, unsigned long gfn_l,
+                        XEN_GUEST_HANDLE_PARAM(const_uint8) buffer)
 {
     struct page_info *page = NULL;
     p2m_type_t p2mt;
@@ -1788,13 +1789,9 @@ int p2m_mem_paging_prep(struct domain *d
     mfn_t mfn;
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     int ret, page_extant = 1;
-    const void *user_ptr = (const void *) buffer;
 
-    if ( user_ptr )
-        /* Sanity check the buffer and bail out early if trouble */
-        if ( (buffer & (PAGE_SIZE - 1)) || 
-             (!access_ok(user_ptr, PAGE_SIZE)) )
-            return -EINVAL;
+    if ( !guest_handle_okay(buffer, PAGE_SIZE) )
+        return -EINVAL;
 
     gfn_lock(p2m, gfn, 0);
 
@@ -1812,7 +1809,7 @@ int p2m_mem_paging_prep(struct domain *d
 
         /* If the user did not provide a buffer, we disallow */
         ret = -EINVAL;
-        if ( unlikely(user_ptr == NULL) )
+        if ( unlikely(guest_handle_is_null(buffer)) )
             goto out;
         /* Get a free page */
         ret = -ENOMEM;
@@ -1834,7 +1831,7 @@ int p2m_mem_paging_prep(struct domain *d
 
         ASSERT( mfn_valid(mfn) );
         guest_map = map_domain_page(mfn);
-        ret = copy_from_user(guest_map, user_ptr, PAGE_SIZE);
+        ret = copy_from_guest(guest_map, buffer, PAGE_SIZE);
         unmap_domain_page(guest_map);
         if ( ret )
         {
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -741,7 +741,8 @@ void p2m_mem_paging_drop_page(struct dom
 /* Start populating a paged out frame */
 void p2m_mem_paging_populate(struct domain *d, unsigned long gfn);
 /* Prepare the p2m for paging a frame in */
-int p2m_mem_paging_prep(struct domain *d, unsigned long gfn, uint64_t buffer);
+int p2m_mem_paging_prep(struct domain *d, unsigned long gfn,
+                        XEN_GUEST_HANDLE_PARAM(const_uint8) buffer);
 /* Resume normal operation (in case a domain was paused) */
 struct vm_event_st;
 void p2m_mem_paging_resume(struct domain *d, struct vm_event_st *rsp);
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -396,10 +396,10 @@ struct xen_mem_paging_op {
     uint8_t     op;         /* XENMEM_paging_op_* */
     domid_t     domain;
 
-    /* PAGING_PREP IN: buffer to immediately fill page in */
-    uint64_aligned_t    buffer;
-    /* Other OPs */
-    uint64_aligned_t    gfn;           /* IN:  gfn of page being operated on */
+    /* IN: (XENMEM_paging_op_prep) buffer to immediately fill page from */
+    XEN_GUEST_HANDLE_64(const_uint8) buffer;
+    /* IN:  gfn of page being operated on */
+    uint64_aligned_t    gfn;
 };
 typedef struct xen_mem_paging_op xen_mem_paging_op_t;
 DEFINE_XEN_GUEST_HANDLE(xen_mem_paging_op_t);



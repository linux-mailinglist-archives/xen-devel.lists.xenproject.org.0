Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FF22F3B01
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 20:49:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65959.116972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzPfG-0006I8-Al; Tue, 12 Jan 2021 19:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65959.116972; Tue, 12 Jan 2021 19:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzPfG-0006H9-48; Tue, 12 Jan 2021 19:49:14 +0000
Received: by outflank-mailman (input) for mailman id 65959;
 Tue, 12 Jan 2021 19:49:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh5d=GP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kzPfE-00064W-9e
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 19:49:12 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c23d0fb-1d60-4474-8e6c-0091daee9a30;
 Tue, 12 Jan 2021 19:49:02 +0000 (UTC)
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
X-Inumbo-ID: 3c23d0fb-1d60-4474-8e6c-0091daee9a30
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610480942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h6cpYoyPql5rm/2pSTeQYJoN64UgrBzaPWo9HWd3Qlw=;
  b=Y8gHgi0UJsH2NhoaR2Nu9PLs6rGSquVCAfUQpeaZIQ+pEzhebMO/I5f7
   G6bYavWWBApcud3jsx9tn2QQkhU7fRWvkQy86CQE7gwAHJbaO/+yEEUK/
   9jeuqFep5pyT4s4ignTuz7T5C6+z+Q+QiAFJ4b3qXpUVUdpbnhW6pKmxX
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 5PQ3fF1pZ8VQKC2Db/6aWUTpoOQ3gJwK/divk7ZBTQAw9Ro3LbNlLtxL7Djgjtu/20xjoORY4F
 LkTYf3ssPCeMjS/MJ19gqdARyNpde0cGKCm+HEaiL5Bxp//nuoBdK3HRVAbf/HLf4FayNjT7wA
 vDOhD0bXFpjkqk0dPt+ofjK5sbKGpWy7zyD2xfq8uaCIDXeuZRBn/OCM1bc2Gr0tOfiVMu9x3I
 Ztf5xaItHfz5anBcddbuOv391Y2NGHLkqHM7i4s+9YpvPsH/go2Kw2twVRHnJkUjnCTtZgZsn7
 j5k=
X-SBRS: 5.2
X-MesageID: 35167851
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,342,1602561600"; 
   d="scan'208";a="35167851"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Hubert Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel
	<tamas@tklengyel.com>
Subject: [PATCH v3 7/7] xen/memory: Fix mapping grant tables with XENMEM_acquire_resource
Date: Tue, 12 Jan 2021 19:48:41 +0000
Message-ID: <20210112194841.1537-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210112194841.1537-1-andrew.cooper3@citrix.com>
References: <20210112194841.1537-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

A guest's default number of grant frames is 64, and XENMEM_acquire_resource
will reject an attempt to map more than 32 frames.  This limit is caused by
the size of mfn_list[] on the stack.

Fix mapping of arbitrary size requests by looping over batches of 32 in
acquire_resource(), and using hypercall continuations when necessary.

To start with, break _acquire_resource() out of acquire_resource() to cope
with type-specific dispatching, and update the return semantics to indicate
the number of mfns returned.  Update gnttab_acquire_resource() and x86's
arch_acquire_resource() to match these new semantics.

Have do_memory_op() pass start_extent into acquire_resource() so it can pick
up where it left off after a continuation, and loop over batches of 32 until
all the work is done, or a continuation needs to occur.

compat_memory_op() is a bit more complicated, because it also has to marshal
frame_list in the XLAT buffer.  Have it account for continuation information
itself and hide details from the upper layer, so it can marshal the buffer in
chunks if necessary.

With these fixes in place, it is now possible to map the whole grant table for
a guest.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Paul Durrant <paul@xen.org>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>
CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
CC: Tamas K Lengyel <tamas@tklengyel.com>

v3:
 * Spelling fixes
---
 xen/arch/x86/mm.c          |   4 +-
 xen/common/compat/memory.c |  94 +++++++++++++++++++++++++++++--------
 xen/common/grant_table.c   |   3 ++
 xen/common/memory.c        | 114 ++++++++++++++++++++++++++++++++++-----------
 4 files changed, 167 insertions(+), 48 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 7a2e94cd6f..ad12429f6c 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4628,7 +4628,6 @@ int arch_acquire_resource(struct domain *d, unsigned int type,
         if ( id != (unsigned int)ioservid )
             break;
 
-        rc = 0;
         for ( i = 0; i < nr_frames; i++ )
         {
             mfn_t mfn;
@@ -4639,6 +4638,9 @@ int arch_acquire_resource(struct domain *d, unsigned int type,
 
             mfn_list[i] = mfn_x(mfn);
         }
+        if ( i == nr_frames )
+            /* Success.  Passed nr_frames back to the caller. */
+            rc = nr_frames;
         break;
     }
 #endif
diff --git a/xen/common/compat/memory.c b/xen/common/compat/memory.c
index 834c5e19d1..533db228e0 100644
--- a/xen/common/compat/memory.c
+++ b/xen/common/compat/memory.c
@@ -402,23 +402,10 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
         case XENMEM_acquire_resource:
         {
             xen_pfn_t *xen_frame_list = NULL;
-            unsigned int max_nr_frames;
 
             if ( copy_from_guest(&cmp.mar, compat, 1) )
                 return -EFAULT;
 
-            /*
-             * The number of frames handled is currently limited to a
-             * small number by the underlying implementation, so the
-             * scratch space should be sufficient for bouncing the
-             * frame addresses.
-             */
-            max_nr_frames = (COMPAT_ARG_XLAT_SIZE - sizeof(*nat.mar)) /
-                sizeof(*xen_frame_list);
-
-            if ( cmp.mar.nr_frames > max_nr_frames )
-                return -E2BIG;
-
             /* Marshal the frame list in the remainder of the xlat space. */
             if ( !compat_handle_is_null(cmp.mar.frame_list) )
                 xen_frame_list = (xen_pfn_t *)(nat.mar + 1);
@@ -432,6 +419,28 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
 
             if ( xen_frame_list && cmp.mar.nr_frames )
             {
+                unsigned int xlat_max_frames =
+                    (COMPAT_ARG_XLAT_SIZE - sizeof(*nat.mar)) /
+                    sizeof(*xen_frame_list);
+
+                if ( start_extent >= nat.mar->nr_frames )
+                    return -EINVAL;
+
+                /*
+                 * Adjust nat to account for work done on previous
+                 * continuations, leaving cmp pristine.  Hide the continaution
+                 * from the native code to prevent double accounting.
+                 */
+                nat.mar->nr_frames -= start_extent;
+                nat.mar->frame += start_extent;
+                cmd &= MEMOP_CMD_MASK;
+
+                /*
+                 * If there are two many frames to fit within the xlat buffer,
+                 * we'll need to loop to marshal them all.
+                 */
+                nat.mar->nr_frames = min(nat.mar->nr_frames, xlat_max_frames);
+
                 /*
                  * frame_list is an input for translated guests, and an output
                  * for untranslated guests.  Only copy in for translated guests.
@@ -444,14 +453,14 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
                                              cmp.mar.nr_frames) ||
                          __copy_from_compat_offset(
                              compat_frame_list, cmp.mar.frame_list,
-                             0, cmp.mar.nr_frames) )
+                             start_extent, nat.mar->nr_frames) )
                         return -EFAULT;
 
                     /*
                      * Iterate backwards over compat_frame_list[] expanding
                      * compat_pfn_t to xen_pfn_t in place.
                      */
-                    for ( int x = cmp.mar.nr_frames - 1; x >= 0; --x )
+                    for ( int x = nat.mar->nr_frames - 1; x >= 0; --x )
                         xen_frame_list[x] = compat_frame_list[x];
                 }
             }
@@ -600,9 +609,11 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
         case XENMEM_acquire_resource:
         {
             DEFINE_XEN_GUEST_HANDLE(compat_mem_acquire_resource_t);
+            unsigned int done;
 
             if ( compat_handle_is_null(cmp.mar.frame_list) )
             {
+                ASSERT(split == 0 && rc == 0);
                 if ( __copy_field_to_guest(
                          guest_handle_cast(compat,
                                            compat_mem_acquire_resource_t),
@@ -611,6 +622,21 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
                 break;
             }
 
+            if ( split < 0 )
+            {
+                /* Continuation occurred. */
+                ASSERT(rc != XENMEM_acquire_resource);
+                done = cmd >> MEMOP_EXTENT_SHIFT;
+            }
+            else
+            {
+                /* No continuation. */
+                ASSERT(rc == 0);
+                done = nat.mar->nr_frames;
+            }
+
+            ASSERT(done <= nat.mar->nr_frames);
+
             /*
              * frame_list is an input for translated guests, and an output for
              * untranslated guests.  Only copy out for untranslated guests.
@@ -626,7 +652,7 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
                  */
                 BUILD_BUG_ON(sizeof(compat_pfn_t) > sizeof(xen_pfn_t));
 
-                for ( i = 0; i < cmp.mar.nr_frames; i++ )
+                for ( i = 0; i < done; i++ )
                 {
                     compat_pfn_t frame = xen_frame_list[i];
 
@@ -636,15 +662,45 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
                     compat_frame_list[i] = frame;
                 }
 
-                if ( __copy_to_compat_offset(cmp.mar.frame_list, 0,
+                if ( __copy_to_compat_offset(cmp.mar.frame_list, start_extent,
                                              compat_frame_list,
-                                             cmp.mar.nr_frames) )
+                                             done) )
                     return -EFAULT;
             }
-            break;
+
+            start_extent += done;
+
+            /* Completely done. */
+            if ( start_extent == cmp.mar.nr_frames )
+                break;
+
+            /*
+             * Done a "full" batch, but we were limited by space in the xlat
+             * area.  Go around the loop again without necesserily returning
+             * to guest context.
+             */
+            if ( done == nat.mar->nr_frames )
+            {
+                split = 1;
+                break;
+            }
+
+            /* Explicit continuation request from a higher level. */
+            if ( done < nat.mar->nr_frames )
+                return hypercall_create_continuation(
+                    __HYPERVISOR_memory_op, "ih",
+                    op | (start_extent << MEMOP_EXTENT_SHIFT), compat);
+
+            /*
+             * Well... Somethings gone wrong with the two levels of chunking.
+             * My condolences to whomever next has to debug this mess.
+             */
+            ASSERT_UNREACHABLE();
+            goto crash;
         }
 
         default:
+        crash:
             domain_crash(current->domain);
             split = 0;
             break;
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index bd99dddbf6..7c0481a05b 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -4083,6 +4083,9 @@ int gnttab_acquire_resource(
     for ( i = 0; i < nr_frames; ++i )
         mfn_list[i] = virt_to_mfn(vaddrs[frame + i]);
 
+    /* Success.  Passed nr_frames back to the caller. */
+    rc = nr_frames;
+
  out:
     grant_write_unlock(gt);
 
diff --git a/xen/common/memory.c b/xen/common/memory.c
index fd30eefa2e..bb4926fc30 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1072,17 +1072,31 @@ static unsigned int resource_max_frames(const struct domain *d,
     }
 }
 
+/*
+ * Returns -errno on error, or positive in the range [1, nr_frames] on
+ * success.  Returning less than nr_frames contitutes a request for a
+ * continuation.
+ */
+static int _acquire_resource(
+    struct domain *d, unsigned int type, unsigned int id, unsigned long frame,
+    unsigned int nr_frames, xen_pfn_t mfn_list[])
+{
+    switch ( type )
+    {
+    case XENMEM_resource_grant_table:
+        return gnttab_acquire_resource(d, id, frame, nr_frames, mfn_list);
+
+    default:
+        return arch_acquire_resource(d, type, id, frame, nr_frames, mfn_list);
+    }
+}
+
 static int acquire_resource(
-    XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg)
+    XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg,
+    unsigned long start_extent)
 {
     struct domain *d, *currd = current->domain;
     xen_mem_acquire_resource_t xmar;
-    /*
-     * The mfn_list and gfn_list (below) arrays are ok on stack for the
-     * moment since they are small, but if they need to grow in future
-     * use-cases then per-CPU arrays or heap allocations may be required.
-     */
-    xen_pfn_t mfn_list[32];
     unsigned int max_frames;
     int rc;
 
@@ -1100,9 +1114,6 @@ static int acquire_resource(
     if ( xmar.pad != 0 )
         return -EINVAL;
 
-    if ( xmar.nr_frames > ARRAY_SIZE(mfn_list) )
-        return -E2BIG;
-
     rc = rcu_lock_remote_domain_by_id(xmar.domid, &d);
     if ( rc )
         return rc;
@@ -1119,7 +1130,7 @@ static int acquire_resource(
 
     if ( guest_handle_is_null(xmar.frame_list) )
     {
-        if ( xmar.nr_frames )
+        if ( xmar.nr_frames || start_extent )
             goto out;
 
         xmar.nr_frames = max_frames;
@@ -1127,26 +1138,47 @@ static int acquire_resource(
         goto out;
     }
 
+    /*
+     * Limiting nr_frames at (UINT_MAX >> MEMOP_EXTENT_SHIFT) isn't ideal.  If
+     * it ever becomes a practical problem, we can switch to mutating
+     * xmar.{frame,nr_frames,frame_list} in guest memory.
+     */
+    rc = -EINVAL;
+    if ( start_extent >= xmar.nr_frames ||
+         xmar.nr_frames > (UINT_MAX >> MEMOP_EXTENT_SHIFT) )
+        goto out;
+
+    /* Adjust for work done on previous continuations. */
+    xmar.nr_frames -= start_extent;
+    xmar.frame += start_extent;
+    guest_handle_add_offset(xmar.frame_list, start_extent);
+
     do {
-        switch ( xmar.type )
-        {
-        case XENMEM_resource_grant_table:
-            rc = gnttab_acquire_resource(d, xmar.id, xmar.frame, xmar.nr_frames,
-                                         mfn_list);
-            break;
+        /*
+         * Arbitrary size.  Not too much stack space, and a reasonable stride
+         * for continuation checks.
+         */
+        xen_pfn_t mfn_list[32];
+        unsigned int todo = MIN(ARRAY_SIZE(mfn_list), xmar.nr_frames), done;
 
-        default:
-            rc = arch_acquire_resource(d, xmar.type, xmar.id, xmar.frame,
-                                       xmar.nr_frames, mfn_list);
-            break;
-        }
+        rc = _acquire_resource(d, xmar.type, xmar.id, xmar.frame,
+                               todo, mfn_list);
+        if ( rc < 0 )
+            goto out;
 
-        if ( rc )
+        done = rc;
+        rc = 0;
+        if ( done == 0 || done > todo )
+        {
+            ASSERT_UNREACHABLE();
+            rc = -EINVAL;
             goto out;
+        }
 
+        /* Adjust guest frame_list appropriately. */
         if ( !paging_mode_translate(currd) )
         {
-            if ( copy_to_guest(xmar.frame_list, mfn_list, xmar.nr_frames) )
+            if ( copy_to_guest(xmar.frame_list, mfn_list, done) )
                 rc = -EFAULT;
         }
         else
@@ -1154,10 +1186,10 @@ static int acquire_resource(
             xen_pfn_t gfn_list[ARRAY_SIZE(mfn_list)];
             unsigned int i;
 
-            if ( copy_from_guest(gfn_list, xmar.frame_list, xmar.nr_frames) )
+            if ( copy_from_guest(gfn_list, xmar.frame_list, done) )
                 rc = -EFAULT;
 
-            for ( i = 0; !rc && i < xmar.nr_frames; i++ )
+            for ( i = 0; !rc && i < done; i++ )
             {
                 rc = set_foreign_p2m_entry(currd, gfn_list[i],
                                            _mfn(mfn_list[i]));
@@ -1166,7 +1198,32 @@ static int acquire_resource(
                     rc = -EIO;
             }
         }
-    } while ( 0 );
+
+        if ( rc )
+            goto out;
+
+        xmar.nr_frames -= done;
+        xmar.frame += done;
+        guest_handle_add_offset(xmar.frame_list, done);
+        start_extent += done;
+
+        /*
+         * Explicit continuation request from _acquire_resource(), or we've
+         * still got more work to do.
+         */
+        if ( done < todo ||
+             (xmar.nr_frames && hypercall_preempt_check()) )
+        {
+            rc = hypercall_create_continuation(
+                __HYPERVISOR_memory_op, "lh",
+                XENMEM_acquire_resource | (start_extent << MEMOP_EXTENT_SHIFT),
+                arg);
+            goto out;
+        }
+
+    } while ( xmar.nr_frames );
+
+    rc = 0;
 
  out:
     rcu_unlock_domain(d);
@@ -1633,7 +1690,8 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
     case XENMEM_acquire_resource:
         rc = acquire_resource(
-            guest_handle_cast(arg, xen_mem_acquire_resource_t));
+            guest_handle_cast(arg, xen_mem_acquire_resource_t),
+            start_extent);
         break;
 
     default:
-- 
2.11.0



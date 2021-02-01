Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B94A730B37C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 00:28:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80196.146583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ibq-0007uh-OZ; Mon, 01 Feb 2021 23:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80196.146583; Mon, 01 Feb 2021 23:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ibq-0007tY-FD; Mon, 01 Feb 2021 23:27:54 +0000
Received: by outflank-mailman (input) for mailman id 80196;
 Mon, 01 Feb 2021 23:27:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWGu=HD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6ibo-0007P6-RR
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 23:27:52 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4974a30f-43f4-47f0-bfa7-ad5966e08e58;
 Mon, 01 Feb 2021 23:27:35 +0000 (UTC)
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
X-Inumbo-ID: 4974a30f-43f4-47f0-bfa7-ad5966e08e58
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612222055;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ooOeFTFX01JiGDLs2zOj6QNxJzo/EvnmXjy1QpJOiP4=;
  b=a+NT2DtUex+pSs0j0IktlIAZRKnsKiiEVDrDBiSiBjUQRJkMY1VS7Toz
   upWRHN2MSqbcsR8p6Z3l67d05V4qo/zQ6wCb2T5YAc7NuxR88ebW0UQQR
   MwRBLXl/njKInQefWZca0Xf7VE2DKx7/Ci6yDNqwejWJ6znqEGi36vImI
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: GkpqpvXlBS0xQRr0Iymb1U4xQHvVP8qukJrzdmUmf5j2EtFLx/ZR8st79ap0XebBopMenwStB5
 YK4Nc2TFUMM7caQwQ9KmRudisXuuPmgAMGDyWHmyj4kR0TI2fncs39KX6OYO15Myz6g4Uukf5D
 j+IW0IFwoqJ1NWMxWZqsHsCLZJueQJr3k4gV+0BIfQCpahOKXaVIujqLCKUAeSe9xR9eL4g8kO
 vNQXK/w3Hil2eZd/f0n2wixXZ9LeuawymIziKwkEdS1rUXuUemWdeYzeJvtVaiVWhIP0bH/HY1
 Leo=
X-SBRS: 5.1
X-MesageID: 36319806
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,393,1602561600"; 
   d="scan'208";a="36319806"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Hubert Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel
	<tamas@tklengyel.com>
Subject: [PATCH v9 01/11] xen/memory: Fix mapping grant tables with XENMEM_acquire_resource
Date: Mon, 1 Feb 2021 23:26:53 +0000
Message-ID: <20210201232703.29275-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210201232703.29275-1-andrew.cooper3@citrix.com>
References: <20210201232703.29275-1-andrew.cooper3@citrix.com>
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
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
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

v9:
 * Crash domain rather than returning late with -ERANGE/-EFAULT.

v8:
 * nat => cmp change in the start_extent check.
 * Rebase over 'frame' and ARM/IOREQ series.

v3:
 * Spelling fixes
---
 xen/common/compat/memory.c | 114 +++++++++++++++++++++++++++++++++--------
 xen/common/grant_table.c   |   3 ++
 xen/common/memory.c        | 124 +++++++++++++++++++++++++++++++++------------
 3 files changed, 187 insertions(+), 54 deletions(-)

diff --git a/xen/common/compat/memory.c b/xen/common/compat/memory.c
index 834c5e19d1..c43fa97cf1 100644
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
+                if ( start_extent >= cmp.mar.nr_frames )
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
@@ -626,21 +652,67 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
                  */
                 BUILD_BUG_ON(sizeof(compat_pfn_t) > sizeof(xen_pfn_t));
 
-                for ( i = 0; i < cmp.mar.nr_frames; i++ )
+                rc = 0;
+                for ( i = 0; i < done; i++ )
                 {
                     compat_pfn_t frame = xen_frame_list[i];
 
                     if ( frame != xen_frame_list[i] )
-                        return -ERANGE;
+                    {
+                        rc = -ERANGE;
+                        break;
+                    }
 
                     compat_frame_list[i] = frame;
                 }
 
-                if ( __copy_to_compat_offset(cmp.mar.frame_list, 0,
-                                             compat_frame_list,
-                                             cmp.mar.nr_frames) )
-                    return -EFAULT;
+                if ( !rc && __copy_to_compat_offset(
+                         cmp.mar.frame_list, start_extent,
+                         compat_frame_list, done) )
+                    rc = -EFAULT;
+
+                if ( rc )
+                {
+                    if ( split < 0 )
+                    {
+                        gdprintk(XENLOG_ERR,
+                                 "Cannot cancel continuation: %ld\n", rc);
+                        domain_crash(current->domain);
+                    }
+                    return rc;
+                }
+            }
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
             }
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
+            domain_crash(current->domain);
+            split = 0;
             break;
         }
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 280b7969b6..b95403695f 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -4053,6 +4053,9 @@ int gnttab_acquire_resource(
     for ( i = 0; i < nr_frames; ++i )
         mfn_list[i] = virt_to_mfn(vaddrs[frame + i]);
 
+    /* Success.  Passed nr_frames back to the caller. */
+    rc = nr_frames;
+
  out:
     grant_write_unlock(gt);
 
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 01cab7e493..128718b31c 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1118,23 +1118,41 @@ static int acquire_ioreq_server(struct domain *d,
         mfn_list[i] = mfn_x(mfn);
     }
 
-    return 0;
+    /* Success.  Passed nr_frames back to the caller. */
+    return nr_frames;
 #else
     return -EOPNOTSUPP;
 #endif
 }
 
+/*
+ * Returns -errno on error, or positive in the range [1, nr_frames] on
+ * success.  Returning less than nr_frames contitutes a request for a
+ * continuation.  Callers can depend on frame + nr_frames not overflowing.
+ */
+static int _acquire_resource(
+    struct domain *d, unsigned int type, unsigned int id, unsigned int frame,
+    unsigned int nr_frames, xen_pfn_t mfn_list[])
+{
+    switch ( type )
+    {
+    case XENMEM_resource_grant_table:
+        return gnttab_acquire_resource(d, id, frame, nr_frames, mfn_list);
+
+    case XENMEM_resource_ioreq_server:
+        return acquire_ioreq_server(d, id, frame, nr_frames, mfn_list);
+
+    default:
+        return -EOPNOTSUPP;
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
 
@@ -1147,9 +1165,6 @@ static int acquire_resource(
     if ( xmar.pad != 0 )
         return -EINVAL;
 
-    if ( xmar.nr_frames > ARRAY_SIZE(mfn_list) )
-        return -E2BIG;
-
     /*
      * The ABI is rather unfortunate.  nr_frames (and therefore the total size
      * of the resource) is 32bit, while frame (the offset within the resource
@@ -1179,7 +1194,7 @@ static int acquire_resource(
 
     if ( guest_handle_is_null(xmar.frame_list) )
     {
-        if ( xmar.nr_frames )
+        if ( xmar.nr_frames || start_extent )
             goto out;
 
         xmar.nr_frames = max_frames;
@@ -1187,30 +1202,47 @@ static int acquire_resource(
         goto out;
     }
 
-    do {
-        switch ( xmar.type )
-        {
-        case XENMEM_resource_grant_table:
-            rc = gnttab_acquire_resource(d, xmar.id, xmar.frame, xmar.nr_frames,
-                                         mfn_list);
-            break;
+    /*
+     * Limiting nr_frames at (UINT_MAX >> MEMOP_EXTENT_SHIFT) isn't ideal.  If
+     * it ever becomes a practical problem, we can switch to mutating
+     * xmar.{frame,nr_frames,frame_list} in guest memory.
+     */
+    rc = -EINVAL;
+    if ( start_extent >= xmar.nr_frames ||
+         xmar.nr_frames > (UINT_MAX >> MEMOP_EXTENT_SHIFT) )
+        goto out;
 
-        case XENMEM_resource_ioreq_server:
-            rc = acquire_ioreq_server(d, xmar.id, xmar.frame, xmar.nr_frames,
-                                      mfn_list);
-            break;
+    /* Adjust for work done on previous continuations. */
+    xmar.nr_frames -= start_extent;
+    xmar.frame += start_extent;
+    guest_handle_add_offset(xmar.frame_list, start_extent);
 
-        default:
-            rc = -EOPNOTSUPP;
-            break;
-        }
+    do {
+        /*
+         * Arbitrary size.  Not too much stack space, and a reasonable stride
+         * for continuation checks.
+         */
+        xen_pfn_t mfn_list[32];
+        unsigned int todo = MIN(ARRAY_SIZE(mfn_list), xmar.nr_frames), done;
 
-        if ( rc )
+        rc = _acquire_resource(d, xmar.type, xmar.id, xmar.frame,
+                               todo, mfn_list);
+        if ( rc < 0 )
+            goto out;
+
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
@@ -1218,10 +1250,10 @@ static int acquire_resource(
             xen_pfn_t gfn_list[ARRAY_SIZE(mfn_list)];
             unsigned int i;
 
-            if ( copy_from_guest(gfn_list, xmar.frame_list, xmar.nr_frames) )
+            if ( copy_from_guest(gfn_list, xmar.frame_list, done) )
                 rc = -EFAULT;
 
-            for ( i = 0; !rc && i < xmar.nr_frames; i++ )
+            for ( i = 0; !rc && i < done; i++ )
             {
                 rc = set_foreign_p2m_entry(currd, d, gfn_list[i],
                                            _mfn(mfn_list[i]));
@@ -1230,7 +1262,32 @@ static int acquire_resource(
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
@@ -1697,7 +1754,8 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
     case XENMEM_acquire_resource:
         rc = acquire_resource(
-            guest_handle_cast(arg, xen_mem_acquire_resource_t));
+            guest_handle_cast(arg, xen_mem_acquire_resource_t),
+            start_extent);
         break;
 
     default:
-- 
2.11.0



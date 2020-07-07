Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA23C21780C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 21:40:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jstSI-0007bq-GB; Tue, 07 Jul 2020 19:40:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CHg+=AS=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1jstSH-0007ao-VE
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 19:40:37 +0000
X-Inumbo-ID: b7c80ff8-c089-11ea-bca7-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7c80ff8-c089-11ea-bca7-bc764e2007e4;
 Tue, 07 Jul 2020 19:40:32 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 0B140A2660;
 Tue,  7 Jul 2020 21:40:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id ECE7EA2657;
 Tue,  7 Jul 2020 21:40:29 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id qQ7tpZAsGLBM; Tue,  7 Jul 2020 21:40:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 637FBA264E;
 Tue,  7 Jul 2020 21:40:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 9XQj3sShKaPE; Tue,  7 Jul 2020 21:40:29 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 2F4DBA2489;
 Tue,  7 Jul 2020 21:40:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 0E1D12245A;
 Tue,  7 Jul 2020 21:39:59 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id QEW3aQAhvDPS; Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 64D2522383;
 Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
X-Quarantine-ID: <8m8VZJ10Geso>
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 8m8VZJ10Geso; Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
Received: from mq-desktop.cert.pl (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id 3049C222A1;
 Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 01/11] memory: batch processing in acquire_resource()
Date: Tue,  7 Jul 2020 21:39:40 +0200
Message-Id: <02415890e4e8211513b495228c790e1d16de767f.1594150543.git.michal.leszczynski@cert.pl>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594150543.git.michal.leszczynski@cert.pl>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
In-Reply-To: <cover.1594150543.git.michal.leszczynski@cert.pl>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 luwei.kang@intel.com, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Leszczynski <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 tamas.lengyel@intel.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Michal Leszczynski <michal.leszczynski@cert.pl>

Allow to acquire large resources by allowing acquire_resource()
to process items in batches, using hypercall continuation.

Be aware that this modifies the behavior of acquire_resource
call with frame_list=NULL. While previously it would return
the size of internal array (32), with this patch it returns
the maximal quantity of frames that could be requested at once,
i.e. UINT_MAX >> MEMOP_EXTENT_SHIFT.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 xen/common/memory.c | 49 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 44 insertions(+), 5 deletions(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 714077c1e5..eb42f883df 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1046,10 +1046,12 @@ static int acquire_grant_table(struct domain *d, unsigned int id,
 }
 
 static int acquire_resource(
-    XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg)
+    XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg,
+    unsigned long *start_extent)
 {
     struct domain *d, *currd = current->domain;
     xen_mem_acquire_resource_t xmar;
+    uint32_t total_frames;
     /*
      * The mfn_list and gfn_list (below) arrays are ok on stack for the
      * moment since they are small, but if they need to grow in future
@@ -1069,7 +1071,7 @@ static int acquire_resource(
         if ( xmar.nr_frames )
             return -EINVAL;
 
-        xmar.nr_frames = ARRAY_SIZE(mfn_list);
+        xmar.nr_frames = UINT_MAX >> MEMOP_EXTENT_SHIFT;
 
         if ( __copy_field_to_guest(arg, &xmar, nr_frames) )
             return -EFAULT;
@@ -1077,8 +1079,28 @@ static int acquire_resource(
         return 0;
     }
 
+    total_frames = xmar.nr_frames;
+
+    /* Is the size too large for us to encode a continuation? */
+    if ( unlikely(xmar.nr_frames > (UINT_MAX >> MEMOP_EXTENT_SHIFT)) )
+        return -EINVAL;
+
+    if ( *start_extent )
+    {
+        /*
+         * Check whether start_extent is in bounds, as this
+         * value if visible to the calling domain.
+         */
+        if ( *start_extent > xmar.nr_frames )
+            return -EINVAL;
+
+        xmar.frame += *start_extent;
+        xmar.nr_frames -= *start_extent;
+        guest_handle_add_offset(xmar.frame_list, *start_extent);
+    }
+
     if ( xmar.nr_frames > ARRAY_SIZE(mfn_list) )
-        return -E2BIG;
+        xmar.nr_frames = ARRAY_SIZE(mfn_list);
 
     rc = rcu_lock_remote_domain_by_id(xmar.domid, &d);
     if ( rc )
@@ -1135,6 +1157,14 @@ static int acquire_resource(
         }
     }
 
+    if ( !rc )
+    {
+        *start_extent += xmar.nr_frames;
+
+        if ( *start_extent != total_frames )
+            rc = -ERESTART;
+    }
+
  out:
     rcu_unlock_domain(d);
 
@@ -1599,8 +1629,17 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 #endif
 
     case XENMEM_acquire_resource:
-        rc = acquire_resource(
-            guest_handle_cast(arg, xen_mem_acquire_resource_t));
+        do {
+            rc = acquire_resource(
+                guest_handle_cast(arg, xen_mem_acquire_resource_t),
+                &start_extent);
+
+            if ( hypercall_preempt_check() )
+                return hypercall_create_continuation(
+                    __HYPERVISOR_memory_op, "lh",
+                    op | (start_extent << MEMOP_EXTENT_SHIFT), arg);
+        } while ( rc == -ERESTART );
+
         break;
 
     default:
-- 
2.17.1



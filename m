Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8EC203ED5
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 20:11:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnQuH-00036Z-RE; Mon, 22 Jun 2020 18:10:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tVQB=AD=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jnQuG-00036U-FB
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 18:10:56 +0000
X-Inumbo-ID: b6d10532-b4b3-11ea-beb6-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b6d10532-b4b3-11ea-beb6-12813bfff9fa;
 Mon, 22 Jun 2020 18:10:55 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 7B606A28AD;
 Mon, 22 Jun 2020 20:10:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 6DC65A289F;
 Mon, 22 Jun 2020 20:10:53 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id xrxK1elMFI4u; Mon, 22 Jun 2020 20:10:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id F07BDA28AD;
 Mon, 22 Jun 2020 20:10:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id rLJEQchKP-ea; Mon, 22 Jun 2020 20:10:52 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id CA29FA289F;
 Mon, 22 Jun 2020 20:10:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id B4AE02025C;
 Mon, 22 Jun 2020 20:10:22 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id xqe4aqcn-H8Q; Mon, 22 Jun 2020 20:10:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 4107D212DF;
 Mon, 22 Jun 2020 20:10:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id nd361qW19IcA; Mon, 22 Jun 2020 20:10:17 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 1FCBF2025C;
 Mon, 22 Jun 2020 20:10:17 +0200 (CEST)
Date: Mon, 22 Jun 2020 20:10:17 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Message-ID: <1211846582.11443665.1592849417087.JavaMail.zimbra@cert.pl>
In-Reply-To: <1617453791.11443328.1592849168658.JavaMail.zimbra@cert.pl>
References: <1617453791.11443328.1592849168658.JavaMail.zimbra@cert.pl>
Subject: [PATCH v3 1/7] memory: batch processing in acquire_resource()
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: memory: batch processing in acquire_resource()
Thread-Index: fAatEklvenYpYrSWj77J6AQD/dj+xJkDPLHZ
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas.lengyel@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Allow to acquire large resources by allowing acquire_resource()
to process items in batches, using hypercall continuation.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 xen/common/memory.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 714077c1e5..3ab06581a2 100644
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
@@ -1077,8 +1079,17 @@ static int acquire_resource(
         return 0;
     }
 
+    total_frames = xmar.nr_frames;
+
+    if ( *start_extent )
+    {
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
@@ -1135,6 +1146,14 @@ static int acquire_resource(
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
 
@@ -1600,7 +1619,14 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
     case XENMEM_acquire_resource:
         rc = acquire_resource(
-            guest_handle_cast(arg, xen_mem_acquire_resource_t));
+            guest_handle_cast(arg, xen_mem_acquire_resource_t),
+            &start_extent);
+
+        if ( rc == -ERESTART )
+            return hypercall_create_continuation(
+                __HYPERVISOR_memory_op, "lh",
+                op | (start_extent << MEMOP_EXTENT_SHIFT), arg);
+
         break;
 
     default:
-- 
2.20.1



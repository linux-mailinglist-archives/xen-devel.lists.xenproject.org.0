Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEC320F4BE
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 14:35:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqFU5-0007yO-It; Tue, 30 Jun 2020 12:35:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/Ev=AL=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1jqFU4-0007rV-SN
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 12:35:32 +0000
X-Inumbo-ID: 2d6897e5-bace-11ea-8610-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d6897e5-bace-11ea-8610-12813bfff9fa;
 Tue, 30 Jun 2020 12:35:29 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 5445DA37F3;
 Tue, 30 Jun 2020 14:35:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 3B0B7A37FB;
 Tue, 30 Jun 2020 14:35:27 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 3XChIHKLaS_2; Tue, 30 Jun 2020 14:35:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id BBF7AA37F9;
 Tue, 30 Jun 2020 14:35:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 8hxz5J2M2ELj; Tue, 30 Jun 2020 14:35:26 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 2B04DA37F3;
 Tue, 30 Jun 2020 14:35:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 8F7152262A;
 Tue, 30 Jun 2020 14:34:45 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id OtfMRFhj4Dx2; Tue, 30 Jun 2020 14:34:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 1DA3A22558;
 Tue, 30 Jun 2020 14:34:40 +0200 (CEST)
X-Quarantine-ID: <g85ttXe7J3M0>
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id g85ttXe7J3M0; Tue, 30 Jun 2020 14:34:40 +0200 (CEST)
Received: from mq-desktop.cert.pl (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id E4C23223E7;
 Tue, 30 Jun 2020 14:34:39 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v4 06/10] memory: batch processing in acquire_resource()
Date: Tue, 30 Jun 2020 14:33:49 +0200
Message-Id: <a317b169e3710a481bb4be066d9b878f27b3e66c.1593519420.git.michal.leszczynski@cert.pl>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593519420.git.michal.leszczynski@cert.pl>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
In-Reply-To: <cover.1593519420.git.michal.leszczynski@cert.pl>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
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
 tamas.lengyel@intel.com, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Leszczynski <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 luwei.kang@intel.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Michal Leszczynski <michal.leszczynski@cert.pl>

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



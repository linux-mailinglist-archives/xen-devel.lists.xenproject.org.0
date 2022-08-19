Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A125F599963
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 12:03:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390192.627489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOyqa-0000VY-NB; Fri, 19 Aug 2022 10:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390192.627489; Fri, 19 Aug 2022 10:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOyqa-0000Tj-Jn; Fri, 19 Aug 2022 10:03:24 +0000
Received: by outflank-mailman (input) for mailman id 390192;
 Fri, 19 Aug 2022 10:03:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sWlb=YX=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oOyqZ-0008OP-IC
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 10:03:23 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2850d0f7-1fa6-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 12:03:22 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C83F1042;
 Fri, 19 Aug 2022 03:03:23 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 378EB3F70D;
 Fri, 19 Aug 2022 03:03:20 -0700 (PDT)
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
X-Inumbo-ID: 2850d0f7-1fa6-11ed-bd2e-47488cf2e6aa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/7] xen/evtchn: Make sure all buckets below d->valid_evtchns are allocated
Date: Fri, 19 Aug 2022 11:02:38 +0100
Message-Id: <710e9e6477270212136d6f2047fd15a033fa7d71.1660902588.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660902588.git.rahul.singh@arm.com>
References: <cover.1660902588.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Since commit 01280dc19cf3 "evtchn: simplify port_is_valid()", the event
channels code assumes that all the buckets below d->valid_evtchns are
always allocated.

This assumption hold in most of the situation because a guest is not
allowed to chose the port. Instead, it will be the first free from port
0.

When using Guest Transparent Migration and LiveUpdate, we will only
preserve ports that are currently in use. As a guest can open/close
event channels, this means the ports may be sparse.

The existing implementation of evtchn_allocate_port() is not able to
deal with such situation and will end up to override bucket or/and leave
some bucket unallocated. The latter will result to a droplet crash if
the event channel belongs to an unallocated bucket.

This can be solved by making sure that all the buckets below
d->valid_evtchns are allocated. There should be no impact for most of
the situation but LM/LU as only one bucket would be allocated. For
LM/LU, we may end up to allocate multiple buckets if ports in use are
sparse.

A potential alternative is to check that the bucket is valid in
is_port_valid(). This should still possible to do it without taking
per-domain lock but will result a couple more of memory access.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes in v2:
 - new patch in this version to fix the security issue
---
---
 xen/common/event_channel.c | 56 ++++++++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 21 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index c2c6f8c151..dbe0a27311 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -193,6 +193,15 @@ static struct evtchn *alloc_evtchn_bucket(struct domain *d, unsigned int port)
     return NULL;
 }
 
+/*
+ * Allocate a given port and ensure all the buckets up to that ports
+ * have been allocated.
+ *
+ * The last part is important because the rest of the event channel code
+ * relies on all the buckets up to d->valid_evtchns to be valid. However,
+ * event channels may be sparsed when restoring a domain during Guest
+ * Transparent Migration and Live Update.
+ */
 int evtchn_allocate_port(struct domain *d, evtchn_port_t port)
 {
     if ( port > d->max_evtchn_port || port >= max_evtchns(d) )
@@ -207,30 +216,35 @@ int evtchn_allocate_port(struct domain *d, evtchn_port_t port)
     }
     else
     {
-        struct evtchn *chn;
-        struct evtchn **grp;
-
-        if ( !group_from_port(d, port) )
+        do
         {
-            grp = xzalloc_array(struct evtchn *, BUCKETS_PER_GROUP);
-            if ( !grp )
-                return -ENOMEM;
-            group_from_port(d, port) = grp;
-        }
+            struct evtchn *chn;
+            struct evtchn **grp;
+            unsigned int alloc_port = read_atomic(&d->valid_evtchns);
 
-        chn = alloc_evtchn_bucket(d, port);
-        if ( !chn )
-            return -ENOMEM;
-        bucket_from_port(d, port) = chn;
+            if ( !group_from_port(d, alloc_port) )
+            {
+                grp = xzalloc_array(struct evtchn *, BUCKETS_PER_GROUP);
+                if ( !grp )
+                    return -ENOMEM;
+                group_from_port(d, alloc_port) = grp;
+            }
 
-        /*
-         * d->valid_evtchns is used to check whether the bucket can be
-         * accessed without the per-domain lock. Therefore,
-         * d->valid_evtchns should be seen *after* the new bucket has
-         * been setup.
-         */
-        smp_wmb();
-        write_atomic(&d->valid_evtchns, d->valid_evtchns + EVTCHNS_PER_BUCKET);
+            chn = alloc_evtchn_bucket(d, alloc_port);
+            if ( !chn )
+                return -ENOMEM;
+            bucket_from_port(d, alloc_port) = chn;
+
+            /*
+             * d->valid_evtchns is used to check whether the bucket can be
+             * accessed without the per-domain lock. Therefore,
+             * d->valid_evtchns should be seen *after* the new bucket has
+             * been setup.
+             */
+            smp_wmb();
+            write_atomic(&d->valid_evtchns,
+                         d->valid_evtchns + EVTCHNS_PER_BUCKET);
+        } while ( port >= read_atomic(&d->valid_evtchns) );
     }
 
     write_atomic(&d->active_evtchns, d->active_evtchns + 1);
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ACD5AF6FD
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:39:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400104.641728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgHd-0006GW-KI; Tue, 06 Sep 2022 21:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400104.641728; Tue, 06 Sep 2022 21:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgHd-0006Eb-F7; Tue, 06 Sep 2022 21:39:01 +0000
Received: by outflank-mailman (input) for mailman id 400104;
 Tue, 06 Sep 2022 21:39:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lcW6=ZJ=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oVgGK-0000Cs-CH
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:37:40 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 91499e18-2de9-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 15:41:11 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E3681A2D;
 Tue,  6 Sep 2022 06:41:16 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D148A3F7B4;
 Tue,  6 Sep 2022 06:41:08 -0700 (PDT)
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
X-Inumbo-ID: 91499e18-2de9-11ed-af93-0125da4c0113
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: rahul.singh@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v4 1/7] xen/evtchn: Make sure all buckets below d->valid_evtchns are allocated
Date: Tue,  6 Sep 2022 14:40:39 +0100
Message-Id: <80a13d3afcd46ecfb94a919fa0a8cf2bbd3be0a8.1662462034.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662462034.git.rahul.singh@arm.com>
References: <cover.1662462034.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Since commit 01280dc19cf3 "evtchn: simplify port_is_valid()", the event
channels code assumes that all the buckets below d->valid_evtchns are
always allocated.

This assumption hold in most of the situation because a guest is not
allowed to chose the port. Instead, it will be the first free from port
0.

When static event channel support will be added for dom0less domains
user can request to allocate the evtchn port numbers that are scattered
in nature.

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
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v4:
 - fix comment to remove the reference to Guest Transparent Migration
   and Live Update
 - Added Michal Reviewed-by
Changes in v3:
 - fix comments in commit msg.
 - modify code related to d->valid_evtchns and {read,write}_atomic()
Changes in v2:
 - new patch in this version to avoid the security issue
---
 xen/common/event_channel.c | 55 ++++++++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 20 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index c2c6f8c151..f81c229358 100644
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
+ * event channels may be sparsed when allocating the static evtchn port
+ * numbers that are scattered in nature.
+ */
 int evtchn_allocate_port(struct domain *d, evtchn_port_t port)
 {
     if ( port > d->max_evtchn_port || port >= max_evtchns(d) )
@@ -207,30 +216,36 @@ int evtchn_allocate_port(struct domain *d, evtchn_port_t port)
     }
     else
     {
-        struct evtchn *chn;
-        struct evtchn **grp;
+        unsigned int alloc_port = read_atomic(&d->valid_evtchns);
 
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
+            alloc_port += EVTCHNS_PER_BUCKET;
+            write_atomic(&d->valid_evtchns, alloc_port);
+        } while ( port >= alloc_port );
     }
 
     write_atomic(&d->active_evtchns, d->active_evtchns + 1);
-- 
2.25.1



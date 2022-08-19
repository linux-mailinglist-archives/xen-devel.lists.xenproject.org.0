Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD116599964
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 12:04:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390202.627500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOyr9-00015l-Vq; Fri, 19 Aug 2022 10:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390202.627500; Fri, 19 Aug 2022 10:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOyr9-00012l-T0; Fri, 19 Aug 2022 10:03:59 +0000
Received: by outflank-mailman (input) for mailman id 390202;
 Fri, 19 Aug 2022 10:03:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sWlb=YX=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oOyr8-0000LK-MF
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 10:03:58 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 3d96aeb3-1fa6-11ed-9250-1f966e50362f;
 Fri, 19 Aug 2022 12:03:57 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 083A11042;
 Fri, 19 Aug 2022 03:03:59 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB71B3F70D;
 Fri, 19 Aug 2022 03:03:55 -0700 (PDT)
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
X-Inumbo-ID: 3d96aeb3-1fa6-11ed-9250-1f966e50362f
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Stanislav Kinsburskii <staskins@amazon.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 2/7] xen/evtchn: Add an helper to reserve/allocate a port
Date: Fri, 19 Aug 2022 11:02:39 +0100
Message-Id: <a6835a7c7223635da27d4e7db002eae5d21417b8.1660902588.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660902588.git.rahul.singh@arm.com>
References: <cover.1660902588.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In a follow-up patch we will be able to either reserve or allocate a
port for various event channel helpers.

A new wrapper is introduced to either reserved a given port or allocate
an empty one if zero.

Take the opportunity to replace the open-coded version in
evtchn_bind_virq().

Signed-off-by: Stanislav Kinsburskii <staskins@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes in v2:
 - new patch in this version
---
---
 xen/common/event_channel.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index dbe0a27311..194f5346fb 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -304,6 +304,18 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
     xsm_evtchn_close_post(chn);
 }
 
+static int evtchn_get_port(struct domain *d, evtchn_port_t port)
+{
+    int rc;
+
+    if ( port != 0 )
+        rc = evtchn_allocate_port(d, port);
+    else
+        rc = get_free_port(d);
+
+    return rc ?: port;
+}
+
 int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
 {
     struct evtchn *chn;
@@ -461,19 +473,10 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
     if ( read_atomic(&v->virq_to_evtchn[virq]) )
         ERROR_EXIT(-EEXIST);
 
-    if ( port != 0 )
-    {
-        if ( (rc = evtchn_allocate_port(d, port)) != 0 )
-            ERROR_EXIT(rc);
-    }
-    else
-    {
-        int alloc_port = get_free_port(d);
-
-        if ( alloc_port < 0 )
-            ERROR_EXIT(alloc_port);
-        port = alloc_port;
-    }
+    port = rc = evtchn_get_port(d, port);
+    if ( rc < 0 )
+        ERROR_EXIT(rc);
+    rc = 0;
 
     chn = evtchn_from_port(d, port);
 
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD345A92D2
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 11:14:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396371.636497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTgH4-00066b-5E; Thu, 01 Sep 2022 09:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396371.636497; Thu, 01 Sep 2022 09:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTgH4-000645-1S; Thu, 01 Sep 2022 09:14:10 +0000
Received: by outflank-mailman (input) for mailman id 396371;
 Thu, 01 Sep 2022 09:14:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GjJJ=ZE=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oTgH2-000527-8t
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 09:14:08 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6e0f5312-29d6-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 11:14:06 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09029D6E;
 Thu,  1 Sep 2022 02:14:13 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B4363F766;
 Thu,  1 Sep 2022 02:14:05 -0700 (PDT)
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
X-Inumbo-ID: 6e0f5312-29d6-11ed-82f2-63bd783d45fa
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
Subject: [PATCH v3 2/7] xen/evtchn: Add an helper to reserve/allocate a port
Date: Thu,  1 Sep 2022 10:13:01 +0100
Message-Id: <4f8f5abdb7d9dfb241794375d3705524b5b53490.1662023183.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662023183.git.rahul.singh@arm.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In a follow-up patch we will want to either reserve or allocate a port
for various event channel helpers.

A new wrapper is introduced to either reserve a given port or allocate
a fresh one if zero.

Take the opportunity to replace the open-coded version in
evtchn_bind_virq().

Signed-off-by: Stanislav Kinsburskii <staskins@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3:
 - minor comments in commit msg
Changes in v2:
 - new patch in this version
---
 xen/common/event_channel.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 80b06d9743..ef4da0781d 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -305,6 +305,18 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
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
@@ -462,19 +474,10 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
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



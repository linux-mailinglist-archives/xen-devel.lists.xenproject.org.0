Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0175A92FB
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 11:19:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396387.636525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTgLl-0007Wv-7R; Thu, 01 Sep 2022 09:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396387.636525; Thu, 01 Sep 2022 09:19:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTgLl-0007Ro-27; Thu, 01 Sep 2022 09:19:01 +0000
Received: by outflank-mailman (input) for mailman id 396387;
 Thu, 01 Sep 2022 09:19:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GjJJ=ZE=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oTgI5-000527-2e
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 09:15:13 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 949126c1-29d6-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 11:15:11 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BC8ED6E;
 Thu,  1 Sep 2022 02:15:17 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23B3F3F766;
 Thu,  1 Sep 2022 02:15:10 -0700 (PDT)
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
X-Inumbo-ID: 949126c1-29d6-11ed-82f2-63bd783d45fa
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
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 5/7] xen/evtchn: modify evtchn_bind_interdomain to support static evtchn
Date: Thu,  1 Sep 2022 10:13:04 +0100
Message-Id: <cbd77576b2606614a4a0bc4d985e7ac88d4d0e54.1662023183.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662023183.git.rahul.singh@arm.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Static event channel support will be added for dom0less domains. Modify
evtchn_bind_interdomain to support static evtchn.

It is necessary to have access to the evtchn_bind_interdomain function
to do that, so make evtchn_bind_interdomain global and also make it
__must_check.

Currently evtchn_bind_interdomain() always allocates the next available
local port. Static event channel support for dom0less domains requires
allocating a specified port. Modify the evtchn_bind_interdomain to
accept the port number as an argument and allocate the specified port
if available. If the port number argument is zero, the next available
port will be allocated.

Currently evtchn_bind_interdomain() finds the local domain from
"current->domain" pointer. evtchn_bind_interdomain() will be called from
the XEN to create static event channel during domain creation.
"current" pointer is not valid at that time, therefore modify the
evtchn_bind_interdomain() to pass domain as an argument.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
Changes in v3:
 - fix minor comments in commit msg
Changes in v2:
 - Merged patches related to evtchn_bind_interdomain in one patch
---
 xen/common/event_channel.c | 20 ++++++++++++++------
 xen/include/xen/event.h    |  5 +++++
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index b464f09d2a..19832002aa 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -381,11 +381,16 @@ static void double_evtchn_unlock(struct evtchn *lchn, struct evtchn *rchn)
     evtchn_write_unlock(rchn);
 }
 
-static int evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
+/*
+ * If lport is zero get the next free port and allocate. If port is non-zero
+ * allocate the specified lport.
+ */
+int evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind, struct domain *ld,
+                            evtchn_port_t lport)
 {
     struct evtchn *lchn, *rchn;
-    struct domain *ld = current->domain, *rd;
-    int            lport, rc;
+    struct domain *rd;
+    int            rc;
     evtchn_port_t  rport = bind->remote_port;
     domid_t        rdom = bind->remote_dom;
 
@@ -405,8 +410,11 @@ static int evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
         write_lock(&ld->event_lock);
     }
 
-    if ( (lport = get_free_port(ld)) < 0 )
-        ERROR_EXIT(lport);
+    lport = rc = evtchn_get_port(ld, lport);
+    if ( rc < 0 )
+        ERROR_EXIT(rc);
+    rc = 0;
+
     lchn = evtchn_from_port(ld, lport);
 
     rchn = _evtchn_from_port(rd, rport);
@@ -1239,7 +1247,7 @@ long do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         struct evtchn_bind_interdomain bind_interdomain;
         if ( copy_from_guest(&bind_interdomain, arg, 1) != 0 )
             return -EFAULT;
-        rc = evtchn_bind_interdomain(&bind_interdomain);
+        rc = evtchn_bind_interdomain(&bind_interdomain, current->domain, 0);
         if ( !rc && __copy_to_guest(arg, &bind_interdomain, 1) )
             rc = -EFAULT; /* Cleaning up here would be a mess! */
         break;
diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
index f31963703f..8eae9984a9 100644
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -75,6 +75,11 @@ int evtchn_allocate_port(struct domain *d, unsigned int port);
 int __must_check evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc,
                                       evtchn_port_t port);
 
+/* Bind an event channel port to interdomain */
+int __must_check evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind,
+                                         struct domain *ld,
+                                         evtchn_port_t port);
+
 /* Unmask a local event-channel port. */
 int evtchn_unmask(unsigned int port);
 
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 178F65AF708
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:39:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400198.641865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgI8-0003EZ-Cd; Tue, 06 Sep 2022 21:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400198.641865; Tue, 06 Sep 2022 21:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgI7-00038p-JE; Tue, 06 Sep 2022 21:39:31 +0000
Received: by outflank-mailman (input) for mailman id 400198;
 Tue, 06 Sep 2022 21:39:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lcW6=ZJ=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oVgH4-0000Cs-7z
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:38:26 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id cde6cd7b-2de9-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 15:42:52 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 323BA1A2D;
 Tue,  6 Sep 2022 06:42:58 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B15993F7B4;
 Tue,  6 Sep 2022 06:42:50 -0700 (PDT)
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
X-Inumbo-ID: cde6cd7b-2de9-11ed-af93-0125da4c0113
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: rahul.singh@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 5/7] xen/evtchn: modify evtchn_bind_interdomain to support static evtchn
Date: Tue,  6 Sep 2022 14:40:43 +0100
Message-Id: <e1399fb6c16e594dbacd073a53f9615287d42861.1662462034.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662462034.git.rahul.singh@arm.com>
References: <cover.1662462034.git.rahul.singh@arm.com>
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
Changes in v4:
 - no changes
Changes in v3:
 - fix minor comments in commit msg
Changes in v2:
 - Merged patches related to evtchn_bind_interdomain in one patch
---
 xen/common/event_channel.c | 20 ++++++++++++++------
 xen/include/xen/event.h    |  5 +++++
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index f546e81758..f5e0b12d15 100644
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



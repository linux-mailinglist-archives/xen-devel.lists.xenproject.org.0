Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24576599969
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 12:06:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390215.627523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOytE-0002Jy-I7; Fri, 19 Aug 2022 10:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390215.627523; Fri, 19 Aug 2022 10:06:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOytE-0002Hs-FQ; Fri, 19 Aug 2022 10:06:08 +0000
Received: by outflank-mailman (input) for mailman id 390215;
 Fri, 19 Aug 2022 10:06:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sWlb=YX=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oOytC-0002Hf-LH
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 10:06:06 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 8982e0c5-1fa6-11ed-9250-1f966e50362f;
 Fri, 19 Aug 2022 12:06:05 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 649E31042;
 Fri, 19 Aug 2022 03:06:06 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79E543F70D;
 Fri, 19 Aug 2022 03:06:03 -0700 (PDT)
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
X-Inumbo-ID: 8982e0c5-1fa6-11ed-9250-1f966e50362f
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 4/7] xen/evtchn: modify evtchn_bind_interdomain to support static evtchn
Date: Fri, 19 Aug 2022 11:02:41 +0100
Message-Id: <abe4c5be55125eb3da33dbd187fd9b8ad5ace714.1660902588.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660902588.git.rahul.singh@arm.com>
References: <cover.1660902588.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Static event channel support will be added for dom0less domains. Modify
evtchn_bind_interdomain to support static evtchn.

It is necessary to have access to the evtchn_bind_interdomain function
to do that, so make evtchn_bind_interdomain global and also make it
__must_check.

evtchn_bind_interdomain() always allocates the next available local
port. Static event channel support for dom0less domains requires
allocating a specified port. Modify the evtchn_bind_interdomain to
accept the port number as an argument and allocate the specified port
if available. If the port number argument is zero, the next available
port will be allocated.

evtchn_bind_interdomain() finds the local domain from "current->domain"
pointer. evtchn_bind_interdomain() will be called from the XEN to create
static event channel during domain creation. "current" pointer is not
valid at that time, therefore modify the evtchn_bind_interdomain() to
pass domain as an argument.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes in v2:
 - Merged patches related to evtchn_bind_interdomain in one patch
---
---
 xen/common/event_channel.c | 20 ++++++++++++++------
 xen/include/xen/event.h    |  5 +++++
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 194f5346fb..eed0e94d07 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -373,11 +373,16 @@ static void double_evtchn_unlock(struct evtchn *lchn, struct evtchn *rchn)
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
 
@@ -397,8 +402,11 @@ static int evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
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
@@ -1231,7 +1239,7 @@ long do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         struct evtchn_bind_interdomain bind_interdomain;
         if ( copy_from_guest(&bind_interdomain, arg, 1) != 0 )
             return -EFAULT;
-        rc = evtchn_bind_interdomain(&bind_interdomain);
+        rc = evtchn_bind_interdomain(&bind_interdomain, current->domain, 0);
         if ( !rc && __copy_to_guest(arg, &bind_interdomain, 1) )
             rc = -EFAULT; /* Cleaning up here would be a mess! */
         break;
diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
index f3021fe304..f29b1123d9 100644
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -74,6 +74,11 @@ int evtchn_allocate_port(struct domain *d, unsigned int port);
 /* Allocate a new event channel */
 int __must_check evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc);
 
+/* Bind an event channel port to interdomain */
+int __must_check evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind,
+                                         struct domain *ld,
+                                         evtchn_port_t port);
+
 /* Unmask a local event-channel port. */
 int evtchn_unmask(unsigned int port);
 
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1626B554D9B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 16:39:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353984.581005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41Vf-0004yB-If; Wed, 22 Jun 2022 14:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353984.581005; Wed, 22 Jun 2022 14:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41Vf-0004vS-F1; Wed, 22 Jun 2022 14:39:11 +0000
Received: by outflank-mailman (input) for mailman id 353984;
 Wed, 22 Jun 2022 14:39:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBTv=W5=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1o41Ve-0003uL-Ax
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 14:39:10 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 1334c710-f239-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 16:39:09 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDD55D6E;
 Wed, 22 Jun 2022 07:39:08 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64ECE3F792;
 Wed, 22 Jun 2022 07:39:07 -0700 (PDT)
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
X-Inumbo-ID: 1334c710-f239-11ec-bd2d-47488cf2e6aa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate specified port
Date: Wed, 22 Jun 2022 15:37:59 +0100
Message-Id: <5ea66595248c41a011ac465bfabd7a7a40dcd565.1655903088.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655903088.git.rahul.singh@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

evtchn_alloc_unbound() always allocates the next available port. Static
event channel support for dom0less domains requires allocating a
specified port.

Modify the evtchn_alloc_unbound() to accept the port number as an
argument and allocate the specified port if available. If the port
number argument is zero, the next available port will be allocated.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/arm/domain_build.c |  2 +-
 xen/common/event_channel.c  | 26 +++++++++++++++++++++-----
 xen/include/xen/event.h     |  3 ++-
 3 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 7ddd16c26d..5f97d9d181 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3171,7 +3171,7 @@ static int __init alloc_xenstore_evtchn(struct domain *d)
 
     alloc.dom = d->domain_id;
     alloc.remote_dom = hardware_domain->domain_id;
-    rc = evtchn_alloc_unbound(&alloc);
+    rc = evtchn_alloc_unbound(&alloc, 0);
     if ( rc )
     {
         printk("Failed allocating event channel for domain\n");
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 8cbe9681da..80a88c1544 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -290,11 +290,15 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
     xsm_evtchn_close_post(chn);
 }
 
-int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
+/*
+ * If port is zero get the next free port and allocate. If port is non-zero
+ * allocate the specified port.
+ */
+int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, evtchn_port_t port)
 {
     struct evtchn *chn;
     struct domain *d;
-    int            port, rc;
+    int            rc;
     domid_t        dom = alloc->dom;
 
     d = rcu_lock_domain_by_any_id(dom);
@@ -303,8 +307,20 @@ int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
 
     spin_lock(&d->event_lock);
 
-    if ( (port = get_free_port(d)) < 0 )
-        ERROR_EXIT_DOM(port, d);
+    if ( port != 0 )
+    {
+        if ( (rc = evtchn_allocate_port(d, port)) != 0 )
+            ERROR_EXIT_DOM(rc, d);
+    }
+    else
+    {
+        int alloc_port = get_free_port(d);
+
+        if ( alloc_port < 0 )
+            ERROR_EXIT_DOM(alloc_port, d);
+        port = alloc_port;
+    }
+
     chn = evtchn_from_port(d, port);
 
     rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
@@ -1206,7 +1222,7 @@ long cf_check do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         struct evtchn_alloc_unbound alloc_unbound;
         if ( copy_from_guest(&alloc_unbound, arg, 1) != 0 )
             return -EFAULT;
-        rc = evtchn_alloc_unbound(&alloc_unbound);
+        rc = evtchn_alloc_unbound(&alloc_unbound, 0);
         if ( !rc && __copy_to_guest(arg, &alloc_unbound, 1) )
             rc = -EFAULT; /* Cleaning up here would be a mess! */
         break;
diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
index 61615ebbe3..48820e393e 100644
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -72,7 +72,8 @@ void evtchn_free(struct domain *d, struct evtchn *chn);
 int evtchn_allocate_port(struct domain *d, unsigned int port);
 
 /* Allocate a new event channel */
-int __must_check evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc);
+int __must_check evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc,
+                                      evtchn_port_t port);
 
 /* Bind an event channel port to interdomain */
 int __must_check evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind);
-- 
2.25.1



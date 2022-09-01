Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 369825A92FA
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 11:19:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396391.636547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTgLm-000807-VP; Thu, 01 Sep 2022 09:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396391.636547; Thu, 01 Sep 2022 09:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTgLm-0007yP-Lg; Thu, 01 Sep 2022 09:19:02 +0000
Received: by outflank-mailman (input) for mailman id 396391;
 Thu, 01 Sep 2022 09:19:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GjJJ=ZE=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oTgHj-000527-FP
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 09:14:51 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 87ac2b65-29d6-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 11:14:49 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E92B5D6E;
 Thu,  1 Sep 2022 02:14:55 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 580393F766;
 Thu,  1 Sep 2022 02:14:48 -0700 (PDT)
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
X-Inumbo-ID: 87ac2b65-29d6-11ed-82f2-63bd783d45fa
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
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 4/7] xen/evtchn: modify evtchn_alloc_unbound to allocate specified port
Date: Thu,  1 Sep 2022 10:13:03 +0100
Message-Id: <1327a2cf71f7d3b38a57124831e057f18685d24a.1662023183.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662023183.git.rahul.singh@arm.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently evtchn_alloc_unbound() always allocates the next available
port. Static event channel support for dom0less domains requires
allocating a specified port.

Modify the evtchn_alloc_unbound() to accept the port number as an
argument and allocate the specified port if available. If the port
number argument is zero, the next available port will be allocated.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3:
 - fix minor comments in commit msg
Changes in v2:
 - fix minor comments
---
 xen/arch/arm/domain_build.c |  2 +-
 xen/common/event_channel.c  | 17 ++++++++++++-----
 xen/include/xen/event.h     |  3 ++-
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index fde133cd94..707e247f6a 100644
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
index ef4da0781d..b464f09d2a 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -317,11 +317,15 @@ static int evtchn_get_port(struct domain *d, evtchn_port_t port)
     return rc ?: port;
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
@@ -330,8 +334,11 @@ int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
 
     write_lock(&d->event_lock);
 
-    if ( (port = get_free_port(d)) < 0 )
-        ERROR_EXIT_DOM(port, d);
+    port = rc = evtchn_get_port(d, port);
+    if ( rc < 0 )
+        ERROR_EXIT(rc);
+    rc = 0;
+
     chn = evtchn_from_port(d, port);
 
     rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
@@ -1222,7 +1229,7 @@ long do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         struct evtchn_alloc_unbound alloc_unbound;
         if ( copy_from_guest(&alloc_unbound, arg, 1) != 0 )
             return -EFAULT;
-        rc = evtchn_alloc_unbound(&alloc_unbound);
+        rc = evtchn_alloc_unbound(&alloc_unbound, 0);
         if ( !rc && __copy_to_guest(arg, &alloc_unbound, 1) )
             rc = -EFAULT; /* Cleaning up here would be a mess! */
         break;
diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
index f3021fe304..f31963703f 100644
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -72,7 +72,8 @@ void evtchn_free(struct domain *d, struct evtchn *chn);
 int evtchn_allocate_port(struct domain *d, unsigned int port);
 
 /* Allocate a new event channel */
-int __must_check evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc);
+int __must_check evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc,
+                                      evtchn_port_t port);
 
 /* Unmask a local event-channel port. */
 int evtchn_unmask(unsigned int port);
-- 
2.25.1



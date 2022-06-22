Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A412554DA1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 16:40:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354002.581038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41WO-0006XC-Bf; Wed, 22 Jun 2022 14:39:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354002.581038; Wed, 22 Jun 2022 14:39:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41WO-0006VB-8U; Wed, 22 Jun 2022 14:39:56 +0000
Received: by outflank-mailman (input) for mailman id 354002;
 Wed, 22 Jun 2022 14:39:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBTv=W5=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1o41WM-0004Nu-OP
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 14:39:54 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 2cc5fc79-f239-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 16:39:52 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C111ED6E;
 Wed, 22 Jun 2022 07:39:52 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 482D03F792;
 Wed, 22 Jun 2022 07:39:51 -0700 (PDT)
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
X-Inumbo-ID: 2cc5fc79-f239-11ec-b725-ed86ccbb4733
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
Subject: [PATCH 5/8] xen/evtchn: don't close the static event channel.
Date: Wed, 22 Jun 2022 15:38:02 +0100
Message-Id: <91656930b5bfd49e40ff5a9d060d7643e6311f4f.1655903088.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655903088.git.rahul.singh@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Guest can request the Xen to close the event channels. Ignore the
request from guest to close the static channels as static event channels
should not be closed.

Add the new bool variable "is_static" in "struct evtchn" to mark the
event channel static when creating the event channel.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/arm/domain_build.c |  2 +-
 xen/common/event_channel.c  | 15 +++++++++++----
 xen/include/xen/event.h     |  4 ++--
 xen/include/xen/sched.h     |  1 +
 4 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 5f97d9d181..89195b042c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3171,7 +3171,7 @@ static int __init alloc_xenstore_evtchn(struct domain *d)
 
     alloc.dom = d->domain_id;
     alloc.remote_dom = hardware_domain->domain_id;
-    rc = evtchn_alloc_unbound(&alloc, 0);
+    rc = evtchn_alloc_unbound(&alloc, 0, false);
     if ( rc )
     {
         printk("Failed allocating event channel for domain\n");
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 84f0055a5a..cedc98ccaf 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -294,7 +294,8 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
  * If port is zero get the next free port and allocate. If port is non-zero
  * allocate the specified port.
  */
-int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, evtchn_port_t port)
+int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, evtchn_port_t port,
+                         bool is_static)
 {
     struct evtchn *chn;
     struct domain *d;
@@ -330,6 +331,7 @@ int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, evtchn_port_t port)
     evtchn_write_lock(chn);
 
     chn->state = ECS_UNBOUND;
+    chn->is_static = is_static;
     if ( (chn->u.unbound.remote_domid = alloc->remote_dom) == DOMID_SELF )
         chn->u.unbound.remote_domid = current->domain->domain_id;
     evtchn_port_init(d, chn);
@@ -368,7 +370,7 @@ static void double_evtchn_unlock(struct evtchn *lchn, struct evtchn *rchn)
  * allocate the specified lport.
  */
 int evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind, struct domain *ld,
-                            evtchn_port_t lport)
+                            evtchn_port_t lport, bool is_static)
 {
     struct evtchn *lchn, *rchn;
     struct domain *rd;
@@ -423,6 +425,7 @@ int evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind, struct domain *ld,
     lchn->u.interdomain.remote_dom  = rd;
     lchn->u.interdomain.remote_port = rport;
     lchn->state                     = ECS_INTERDOMAIN;
+    lchn->is_static                 = is_static;
     evtchn_port_init(ld, lchn);
     
     rchn->u.interdomain.remote_dom  = ld;
@@ -659,6 +662,9 @@ int evtchn_close(struct domain *d1, int port1, bool guest)
         rc = -EINVAL;
         goto out;
     }
+    /* Guest cannot close a static event channel. */
+    if ( chn1->is_static && guest )
+        goto out;
 
     switch ( chn1->state )
     {
@@ -1238,7 +1244,7 @@ long cf_check do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         struct evtchn_alloc_unbound alloc_unbound;
         if ( copy_from_guest(&alloc_unbound, arg, 1) != 0 )
             return -EFAULT;
-        rc = evtchn_alloc_unbound(&alloc_unbound, 0);
+        rc = evtchn_alloc_unbound(&alloc_unbound, 0, false);
         if ( !rc && __copy_to_guest(arg, &alloc_unbound, 1) )
             rc = -EFAULT; /* Cleaning up here would be a mess! */
         break;
@@ -1248,7 +1254,8 @@ long cf_check do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         struct evtchn_bind_interdomain bind_interdomain;
         if ( copy_from_guest(&bind_interdomain, arg, 1) != 0 )
             return -EFAULT;
-        rc = evtchn_bind_interdomain(&bind_interdomain, current->domain, 0);
+        rc = evtchn_bind_interdomain(&bind_interdomain, current->domain,
+                                     0, false);
         if ( !rc && __copy_to_guest(arg, &bind_interdomain, 1) )
             rc = -EFAULT; /* Cleaning up here would be a mess! */
         break;
diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
index 8eae9984a9..71ad4c5bfd 100644
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -73,12 +73,12 @@ int evtchn_allocate_port(struct domain *d, unsigned int port);
 
 /* Allocate a new event channel */
 int __must_check evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc,
-                                      evtchn_port_t port);
+                                      evtchn_port_t port, bool is_static);
 
 /* Bind an event channel port to interdomain */
 int __must_check evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind,
                                          struct domain *ld,
-                                         evtchn_port_t port);
+                                         evtchn_port_t port, bool is_static);
 
 /* Unmask a local event-channel port. */
 int evtchn_unmask(unsigned int port);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 463d41ffb6..da823c8091 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -119,6 +119,7 @@ struct evtchn
     unsigned char priority;        /* FIFO event channels only. */
     unsigned short notify_vcpu_id; /* VCPU for local delivery notification */
     uint32_t fifo_lastq;           /* Data for identifying last queue. */
+    bool is_static;                /* Static event channels. */
 
 #ifdef CONFIG_XSM
     union {
-- 
2.25.1



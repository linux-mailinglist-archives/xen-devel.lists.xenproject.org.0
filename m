Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26905554D9C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 16:39:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353991.581016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41Vs-0005OZ-QJ; Wed, 22 Jun 2022 14:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353991.581016; Wed, 22 Jun 2022 14:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41Vs-0005ML-NJ; Wed, 22 Jun 2022 14:39:24 +0000
Received: by outflank-mailman (input) for mailman id 353991;
 Wed, 22 Jun 2022 14:39:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBTv=W5=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1o41Vr-0003uL-29
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 14:39:23 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 1acf1757-f239-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 16:39:22 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96CD0D6E;
 Wed, 22 Jun 2022 07:39:21 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 389E93F792;
 Wed, 22 Jun 2022 07:39:20 -0700 (PDT)
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
X-Inumbo-ID: 1acf1757-f239-11ec-bd2d-47488cf2e6aa
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
Subject: [PATCH 3/8] xen/evtchn: modify evtchn_bind_interdomain to allocate specified port
Date: Wed, 22 Jun 2022 15:38:00 +0100
Message-Id: <08fab20e71d280396d7b65397339ad9d9ab96d5c.1655903088.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655903088.git.rahul.singh@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

evtchn_bind_interdomain() always allocates the next available local
port. Static event channel support for dom0less domains requires
allocating a specified port.

Modify the evtchn_bind_interdomain to accept the port number as an
argument and allocate the specified port if available. If the port
number argument is zero, the next available port will be allocated.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/common/event_channel.c | 26 +++++++++++++++++++++-----
 xen/include/xen/event.h    |  3 ++-
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 80a88c1544..bf5dc2c8ad 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -363,11 +363,16 @@ static void double_evtchn_unlock(struct evtchn *lchn, struct evtchn *rchn)
     evtchn_write_unlock(rchn);
 }
 
-int evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
+/*
+ * If lport is zero get the next free port and allocate. If port is non-zero
+ * allocate the specified lport.
+ */
+int evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind,
+                            evtchn_port_t lport)
 {
     struct evtchn *lchn, *rchn;
     struct domain *ld = current->domain, *rd;
-    int            lport, rc;
+    int            rc;
     evtchn_port_t  rport = bind->remote_port;
     domid_t        rdom = bind->remote_dom;
 
@@ -387,8 +392,19 @@ int evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
         spin_lock(&ld->event_lock);
     }
 
-    if ( (lport = get_free_port(ld)) < 0 )
-        ERROR_EXIT(lport);
+    if ( lport != 0 )
+    {
+        if ( (rc = evtchn_allocate_port(ld, lport)) != 0 )
+            ERROR_EXIT_DOM(rc, ld);
+    }
+    else
+    {
+        int alloc_port = get_free_port(ld);
+
+        if ( alloc_port < 0 )
+            ERROR_EXIT_DOM(alloc_port, ld);
+        lport = alloc_port;
+    }
     lchn = evtchn_from_port(ld, lport);
 
     rchn = _evtchn_from_port(rd, rport);
@@ -1232,7 +1248,7 @@ long cf_check do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         struct evtchn_bind_interdomain bind_interdomain;
         if ( copy_from_guest(&bind_interdomain, arg, 1) != 0 )
             return -EFAULT;
-        rc = evtchn_bind_interdomain(&bind_interdomain);
+        rc = evtchn_bind_interdomain(&bind_interdomain, 0);
         if ( !rc && __copy_to_guest(arg, &bind_interdomain, 1) )
             rc = -EFAULT; /* Cleaning up here would be a mess! */
         break;
diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
index 48820e393e..6e26879793 100644
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -76,7 +76,8 @@ int __must_check evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc,
                                       evtchn_port_t port);
 
 /* Bind an event channel port to interdomain */
-int __must_check evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind);
+int __must_check evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind,
+                                         evtchn_port_t port);
 
 /* Unmask a local event-channel port. */
 int evtchn_unmask(unsigned int port);
-- 
2.25.1



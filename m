Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B324554D9D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 16:39:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353996.581028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41W7-0005wG-37; Wed, 22 Jun 2022 14:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353996.581028; Wed, 22 Jun 2022 14:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41W6-0005sy-Vq; Wed, 22 Jun 2022 14:39:38 +0000
Received: by outflank-mailman (input) for mailman id 353996;
 Wed, 22 Jun 2022 14:39:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBTv=W5=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1o41W5-0004Nu-8j
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 14:39:37 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 22c34c83-f239-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 16:39:35 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05ACAD6E;
 Wed, 22 Jun 2022 07:39:36 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B2E13F792;
 Wed, 22 Jun 2022 07:39:34 -0700 (PDT)
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
X-Inumbo-ID: 22c34c83-f239-11ec-b725-ed86ccbb4733
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
Subject: [PATCH 4/8] xen/evtchn: modify evtchn_bind_interdomain to pass domain as argument
Date: Wed, 22 Jun 2022 15:38:01 +0100
Message-Id: <037b30aa5186cff516f8acf17a3a465663a8194a.1655903088.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655903088.git.rahul.singh@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

evtchn_bind_interdomain() finds the local domain from "current->domain"
pointer.

evtchn_bind_interdomain() will be called from the XEN to support static
event channel during domain creation. "current" pointer is not valid at
that time, therefore modify the evtchn_bind_interdomain() to pass
domain as an argument.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/common/event_channel.c | 6 +++---
 xen/include/xen/event.h    | 1 +
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index bf5dc2c8ad..84f0055a5a 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -367,11 +367,11 @@ static void double_evtchn_unlock(struct evtchn *lchn, struct evtchn *rchn)
  * If lport is zero get the next free port and allocate. If port is non-zero
  * allocate the specified lport.
  */
-int evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind,
+int evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind, struct domain *ld,
                             evtchn_port_t lport)
 {
     struct evtchn *lchn, *rchn;
-    struct domain *ld = current->domain, *rd;
+    struct domain *rd;
     int            rc;
     evtchn_port_t  rport = bind->remote_port;
     domid_t        rdom = bind->remote_dom;
@@ -1248,7 +1248,7 @@ long cf_check do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         struct evtchn_bind_interdomain bind_interdomain;
         if ( copy_from_guest(&bind_interdomain, arg, 1) != 0 )
             return -EFAULT;
-        rc = evtchn_bind_interdomain(&bind_interdomain, 0);
+        rc = evtchn_bind_interdomain(&bind_interdomain, current->domain, 0);
         if ( !rc && __copy_to_guest(arg, &bind_interdomain, 1) )
             rc = -EFAULT; /* Cleaning up here would be a mess! */
         break;
diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
index 6e26879793..8eae9984a9 100644
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -77,6 +77,7 @@ int __must_check evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc,
 
 /* Bind an event channel port to interdomain */
 int __must_check evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind,
+                                         struct domain *ld,
                                          evtchn_port_t port);
 
 /* Unmask a local event-channel port. */
-- 
2.25.1



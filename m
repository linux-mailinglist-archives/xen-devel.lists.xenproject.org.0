Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1114A02DD
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 22:33:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262148.454307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDYrs-0001xC-E3; Fri, 28 Jan 2022 21:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262148.454307; Fri, 28 Jan 2022 21:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDYrs-0001oM-7C; Fri, 28 Jan 2022 21:33:16 +0000
Received: by outflank-mailman (input) for mailman id 262148;
 Fri, 28 Jan 2022 21:33:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wh6+=SM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nDYrq-0001M8-RU
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 21:33:14 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e579ac03-8081-11ec-8f75-fffcc8bd4f1a;
 Fri, 28 Jan 2022 22:33:14 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 89CCCB82697;
 Fri, 28 Jan 2022 21:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8F4C340EC;
 Fri, 28 Jan 2022 21:33:10 +0000 (UTC)
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
X-Inumbo-ID: e579ac03-8081-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643405591;
	bh=7u5+Xn46ET2Kq+hchW4hiMSc7HY0HUOJ2bLjmmIyZt8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l4nD26LstxRti4Jvl8qKqfGLBIdjuVDo0UkmTz6mTyCa/PFnxmnJmsGCHz94YKyd2
	 5ZRJaPrHAnrrdYC+etQB8+qmMmwTNz5StdQzP9gldgF1xfqqLMPt6/3GnUtIi2Y3gs
	 lh4OUyf+WB3Fu9ZbyfYG0L7BZLOLduX9BFbdgEVen9kV5i170q7cyTzWSUfqpEIPQC
	 Vjq1aV5JprTAYs/chDfIsT0VeD4MddnLPv55KD49XLgpahwiYIsnMfCxxUFAP9PzcR
	 CuCrKz14k4DyC9TaHNdmOfullJx/Qtyqi0QiyqpfY4TptdB2mc7a9QRomuIlRs6cn1
	 f/vW1KKEKZ+gw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jgross@suse.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/5] xen: make evtchn_alloc_unbound public
Date: Fri, 28 Jan 2022 13:33:03 -0800
Message-Id: <20220128213307.2822078-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

The xenstore event channel will be allocated for dom0less domains. It is
necessary to have access to the evtchn_alloc_unbound function to do
that, so make evtchn_alloc_unbound public.

Add a skip_xsm parameter to allow disabling the XSM check in
evtchn_alloc_unbound (xsm_evtchn_unbound wouldn't work for a call
originated from Xen before running any domains.)

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>
---
Changes v3:
- expose evtchn_alloc_unbound, assing a skip_xsm parameter
---
 xen/common/event_channel.c | 13 ++++++++-----
 xen/include/xen/event.h    |  3 +++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index da88ad141a..be57d00a15 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -284,7 +284,7 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
     xsm_evtchn_close_post(chn);
 }
 
-static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
+int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, bool skip_xsm)
 {
     struct evtchn *chn;
     struct domain *d;
@@ -301,9 +301,12 @@ static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
         ERROR_EXIT_DOM(port, d);
     chn = evtchn_from_port(d, port);
 
-    rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
-    if ( rc )
-        goto out;
+    if ( !skip_xsm )
+    {
+        rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
+        if ( rc )
+            goto out;
+    }
 
     evtchn_write_lock(chn);
 
@@ -1195,7 +1198,7 @@ long do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         struct evtchn_alloc_unbound alloc_unbound;
         if ( copy_from_guest(&alloc_unbound, arg, 1) != 0 )
             return -EFAULT;
-        rc = evtchn_alloc_unbound(&alloc_unbound);
+        rc = evtchn_alloc_unbound(&alloc_unbound, false);
         if ( !rc && __copy_to_guest(arg, &alloc_unbound, 1) )
             rc = -EFAULT; /* Cleaning up here would be a mess! */
         break;
diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
index 21c95e14fd..0a2cdedf7d 100644
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -68,6 +68,9 @@ int evtchn_close(struct domain *d1, int port1, bool guest);
 /* Free an event channel. */
 void evtchn_free(struct domain *d, struct evtchn *chn);
 
+/* Create a new event channel port */
+int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, bool skip_xsm);
+
 /* Allocate a specific event channel port. */
 int evtchn_allocate_port(struct domain *d, unsigned int port);
 
-- 
2.25.1



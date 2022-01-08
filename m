Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F53C488007
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jan 2022 01:49:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254711.436520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5zv7-0007B4-5W; Sat, 08 Jan 2022 00:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254711.436520; Sat, 08 Jan 2022 00:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5zv6-000795-WA; Sat, 08 Jan 2022 00:49:20 +0000
Received: by outflank-mailman (input) for mailman id 254711;
 Sat, 08 Jan 2022 00:49:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CE0l=RY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n5zv4-0006ZD-Mm
 for xen-devel@lists.xenproject.org; Sat, 08 Jan 2022 00:49:18 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cea63d42-701c-11ec-9ce5-af14b9085ebd;
 Sat, 08 Jan 2022 01:49:17 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BBC23B827C3;
 Sat,  8 Jan 2022 00:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260ABC36AF2;
 Sat,  8 Jan 2022 00:49:15 +0000 (UTC)
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
X-Inumbo-ID: cea63d42-701c-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641602955;
	bh=CDrrsjp15mArIctwhofaLq+GzkkGMG31l1XpyQakdzM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s74qh4wvO/RR5LKh2IfvYR0fI8rZcLCQBUPotG3Wn3UDmMsFW0QCH5MHCj429aRAh
	 aIhbDeAwPiR6i5MQ1ZDd+alEHNMTgPj99tsWXRKY+cl+IHOMwlbBVPu4DmgALRqhiP
	 DalkoftRyp5urKCOIXjdbcYtFyu0KQqf5fows7xgQj5L0DIHfm/gi+vj5OzSL1T++I
	 QLe2N9bV+VFuUdwtWngQndeKQqXV1/OcSrfxNAwAUMATToEOO6NtBUbKil5Qaxq9uI
	 wPdqgmIof2B4iM03YbxZBjt5Ad4f/dfOXDum/h/zVGa/5psoz74oOvFoY7Ek8UPbde
	 Gi1USrNk+/U3A==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Bertrand.Marquis@arm.com,
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	wl@xen.org,
	anthony.perard@citrix.com,
	jgross@suse.com,
	marmarek@invisiblethingslab.com
Subject: [XEN PATCH 3/7] tools: add a late_init argument to xs_introduce_domain
Date: Fri,  7 Jan 2022 16:49:08 -0800
Message-Id: <20220108004912.3820176-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

Add a late_init argument to xs_introduce_domain to handle dom0less
guests whose xenstore interfaces are initialized after boot.

This patch mechanically adds the new parameter; it doesn't change
behaviors.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: wl@xen.org
CC: anthony.perard@citrix.com
CC: jgross@suse.com
CC: marmarek@invisiblethingslab.com
---
 tools/include/xenstore.h          | 3 ++-
 tools/libs/light/libxl_dom.c      | 3 ++-
 tools/libs/store/xs.c             | 8 ++++++--
 tools/python/xen/lowlevel/xs/xs.c | 2 +-
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/tools/include/xenstore.h b/tools/include/xenstore.h
index 2b3f69fb61..1a302b5ff9 100644
--- a/tools/include/xenstore.h
+++ b/tools/include/xenstore.h
@@ -226,7 +226,8 @@ bool xs_transaction_end(struct xs_handle *h, xs_transaction_t t,
 bool xs_introduce_domain(struct xs_handle *h,
 			 unsigned int domid,
 			 unsigned long mfn,
-                         unsigned int eventchn); 
+			 unsigned int eventchn,
+			 bool late_init);
 
 /* Set the target of a domain
  * This tells the store daemon that a domain is targetting another one, so
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index 2abaab439c..bacfdfa9df 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -497,7 +497,8 @@ retry_transaction:
     if (!xs_transaction_end(ctx->xsh, t, 0))
         if (errno == EAGAIN)
             goto retry_transaction;
-    xs_introduce_domain(ctx->xsh, domid, state->store_mfn, state->store_port);
+    xs_introduce_domain(ctx->xsh, domid, state->store_mfn, state->store_port,
+                        false);
     free(vm_path);
     return 0;
 }
diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index 7a9a8b1656..dd47d607fd 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -1089,16 +1089,18 @@ bool xs_transaction_end(struct xs_handle *h, xs_transaction_t t,
  */
 bool xs_introduce_domain(struct xs_handle *h,
 			 unsigned int domid, unsigned long mfn,
-			 unsigned int eventchn)
+			 unsigned int eventchn, bool late_init)
 {
 	char domid_str[MAX_STRLEN(domid)];
 	char mfn_str[MAX_STRLEN(mfn)];
 	char eventchn_str[MAX_STRLEN(eventchn)];
-	struct iovec iov[3];
+	char late_init_str[MAX_STRLEN(late_init)];
+	struct iovec iov[4];
 
 	snprintf(domid_str, sizeof(domid_str), "%u", domid);
 	snprintf(mfn_str, sizeof(mfn_str), "%lu", mfn);
 	snprintf(eventchn_str, sizeof(eventchn_str), "%u", eventchn);
+	snprintf(late_init_str, sizeof(late_init_str), "%u", late_init);
 
 	iov[0].iov_base = domid_str;
 	iov[0].iov_len = strlen(domid_str) + 1;
@@ -1106,6 +1108,8 @@ bool xs_introduce_domain(struct xs_handle *h,
 	iov[1].iov_len = strlen(mfn_str) + 1;
 	iov[2].iov_base = eventchn_str;
 	iov[2].iov_len = strlen(eventchn_str) + 1;
+	iov[3].iov_base = late_init_str;
+	iov[3].iov_len = strlen(late_init_str) + 1;
 
 	return xs_bool(xs_talkv(h, XBT_NULL, XS_INTRODUCE, iov,
 				ARRAY_SIZE(iov), NULL));
diff --git a/tools/python/xen/lowlevel/xs/xs.c b/tools/python/xen/lowlevel/xs/xs.c
index 0dad7fa5f2..dc667fb231 100644
--- a/tools/python/xen/lowlevel/xs/xs.c
+++ b/tools/python/xen/lowlevel/xs/xs.c
@@ -678,7 +678,7 @@ static PyObject *xspy_introduce_domain(XsHandle *self, PyObject *args)
         return NULL;
 
     Py_BEGIN_ALLOW_THREADS
-    result = xs_introduce_domain(xh, dom, page, port);
+    result = xs_introduce_domain(xh, dom, page, port, false);
     Py_END_ALLOW_THREADS
 
     return none(result);
-- 
2.25.1



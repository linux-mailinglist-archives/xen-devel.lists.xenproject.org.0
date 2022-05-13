Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DEF526C15
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 23:07:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328780.551951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npcVg-0005Ts-AA; Fri, 13 May 2022 21:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328780.551951; Fri, 13 May 2022 21:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npcVg-0005ON-3b; Fri, 13 May 2022 21:07:40 +0000
Received: by outflank-mailman (input) for mailman id 328780;
 Fri, 13 May 2022 21:07:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xcQv=VV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1npcVe-0004iU-6T
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 21:07:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b669674b-d300-11ec-b8b8-f95467ff1ed0;
 Fri, 13 May 2022 23:07:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 328166230C;
 Fri, 13 May 2022 21:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6EB1C34114;
 Fri, 13 May 2022 21:07:34 +0000 (UTC)
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
X-Inumbo-ID: b669674b-d300-11ec-b8b8-f95467ff1ed0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652476055;
	bh=OcQ376zqgJ7yxyRMcJ28nIn26b0HBAsjUw2l6jWzJxs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YWjUTBH6PD5UdqsXQu8y2PqyRNQtQT0CGKFCx9Lu2T0fW+l8hHOLgAZYZ2/wB9L6R
	 SnsuFw7dwGoYSC1Zewtk7ee034pOX+tJaJ1z8A2VTyWrhg6lNEpQrZC+6fpISuHcJq
	 YWfhKo+ezolQ5FeVJux8TT187883OC1oyz/BcCeD5CJiLiTpjSIGXDcvHZL2BbSVsh
	 fSKNmv5DcGHnoV6+OAD1q5EMuThDx4a2RjVLZzKDrhqaMfy7yj3xdL1vX/TALZp9oM
	 x/LMCgo3Ru7D4EXibrwTeCF76rVmUK1fFVSrfWeQ0tKH3CtRnxsVy3b1XoDgK2iQfs
	 zPSuH4X16dMYA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jgross@suse.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v7 5/7] xenstored: send an evtchn notification on introduce_domain
Date: Fri, 13 May 2022 14:07:28 -0700
Message-Id: <20220513210730.679871-5-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2205131405550.3842@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205131405550.3842@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

When xs_introduce_domain is called, send out a notification on the
xenstore event channel so that any (dom0less) domain waiting for the
xenstore interface to be ready can continue with the initialization.
Before sending the notification, clear XENSTORE_RECONNECTING.

The extra notification is harmless for domains that don't require it.

In xs_wire.h update the commment on top of XENSTORE_RECONNECTING to
generalize its meaning to suit the dom0less use-case better. Also
improve docs/misc/xenstore-ring.txt.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v7:
- add documentation to xenstore-ring.txt
- Juergen already gave his reviewed-by, I dropped it due to the change
  to xenstore-ring.txt, but everything else is still the same

Changes in v6:
- use XENSTORE_CONNECTED instead of 0x0
- update xs_wire.h

Changes in v5:
- reset XS_CONNECTION_STATE_RECONNECTING before notifying the domU

Changes in v2:
- drop the new late_init parameter
---
 tools/xenstore/xenstored_domain.c | 4 ++++
 xen/include/public/io/xs_wire.h   | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)
---
 docs/misc/xenstore-ring.txt       | 8 +++++++-
 tools/xenstore/xenstored_domain.c | 4 ++++
 xen/include/public/io/xs_wire.h   | 2 +-
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xenstore-ring.txt b/docs/misc/xenstore-ring.txt
index b338b21b19..f3d6ca4264 100644
--- a/docs/misc/xenstore-ring.txt
+++ b/docs/misc/xenstore-ring.txt
@@ -111,7 +111,13 @@ Assuming the server has advertised the feature, the guest can initiate
 a reconnection by setting the the Connection state to 1 ("Ring close
 and reconnect is in progress") and signalling the event channel.
 The guest must now ignore all fields except the Connection state and
-wait for it to be set to 0 ("Ring is connected")
+wait for it to be set to 0 ("Ring is connected").
+
+In certain circumstances (e.g. dom0less guests with PV drivers support)
+it is possible for the guest to find the Connection state already set to
+1 by someone else during xenstore initialization. In that case, like in
+the previous case, the guest must ignore all fields except the
+Connection state and wait for it to be set to 0 before proceeding.
 
 The server will guarantee to
 
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 80ba1d627b..de88bf2a68 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -493,6 +493,10 @@ static struct domain *introduce_domain(const void *ctx,
 		/* Now domain belongs to its connection. */
 		talloc_steal(domain->conn, domain);
 
+		/* Notify the domain that xenstore is available */
+		interface->connection = XENSTORE_CONNECTED;
+		xenevtchn_notify(xce_handle, domain->port);
+
 		if (!is_master_domain && !restore)
 			fire_watches(NULL, ctx, "@introduceDomain", NULL,
 				     true, NULL);
diff --git a/xen/include/public/io/xs_wire.h b/xen/include/public/io/xs_wire.h
index 953a0050a3..c1ec7c73e3 100644
--- a/xen/include/public/io/xs_wire.h
+++ b/xen/include/public/io/xs_wire.h
@@ -141,7 +141,7 @@ struct xenstore_domain_interface {
 
 /* Valid values for the connection field */
 #define XENSTORE_CONNECTED 0 /* the steady-state */
-#define XENSTORE_RECONNECT 1 /* guest has initiated a reconnect */
+#define XENSTORE_RECONNECT 1 /* reconnect in progress */
 
 /* Valid values for the error field */
 #define XENSTORE_ERROR_NONE    0 /* No error */
-- 
2.25.1



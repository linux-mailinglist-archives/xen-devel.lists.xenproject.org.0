Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A573051B492
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 02:17:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321175.542116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmPB3-0008OO-7g; Thu, 05 May 2022 00:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321175.542116; Thu, 05 May 2022 00:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmPB2-0008I0-OE; Thu, 05 May 2022 00:17:04 +0000
Received: by outflank-mailman (input) for mailman id 321175;
 Thu, 05 May 2022 00:17:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YLaE=VN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nmPB0-0007ib-Hu
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 00:17:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aec53614-cc08-11ec-a406-831a346695d4;
 Thu, 05 May 2022 02:17:01 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4ACA561D50;
 Thu,  5 May 2022 00:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3FCEC385AF;
 Thu,  5 May 2022 00:16:59 +0000 (UTC)
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
X-Inumbo-ID: aec53614-cc08-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651709820;
	bh=rIw+2SrwT7YpYC/phawk5vOS/f23VxvR6M90QJVp4fk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IzyPwIj4awg5UuN2mAFVNIw8aZZVyleXB9GoKZL7HhJafzHHCw/zn3G4VE4mxI3dw
	 eNZxzPgcrdHBsuXo3GX5fW3S/4g7vQ1GsDhjd7LRKa99T23xZR35y8fpQc6ZpK61OV
	 fDN8+cDyn5p81t52tReUHjv8pCqDwb6DCYyW4apHyeOR6YUPiaXoGH6kARsXSmcb6Z
	 egnm+TToF8ks2H7EGKqxjiwipXZ0yRFE3g2blztRft/18ntFEUHn+u0GbbeXx1oRk3
	 YuBsq5u2SV1ll661dfDxBn9Gy+2bg0KCiHFL3T4sEN92UWu/OvTogsBU4RMmFfZWSO
	 j5fKwJksZ+yCg==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jgross@suse.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	anthony.perard@citrix.com,
	wl@xen.org
Subject: [PATCH v6 5/7] xenstored: send an evtchn notification on introduce_domain
Date: Wed,  4 May 2022 17:16:54 -0700
Message-Id: <20220505001656.395419-5-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

When xs_introduce_domain is called, send out a notification on the
xenstore event channel so that any (dom0less) domain waiting for the
xenstore interface to be ready can continue with the initialization.
Before sending the notification, clear XENSTORE_RECONNECTING.

The extra notification is harmless for domains that don't require it.

In xs_wire.h update the commment on top of XENSTORE_RECONNECTING to
generalize its meaning to suit the dom0less use-case better.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: jgross@suse.com
CC: anthony.perard@citrix.com
CC: wl@xen.org
---
If you have better suggestions for the wording in xs_wire.h please
suggest!


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

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index ae065fcbee..6f34af225c 100644
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
 				     false, NULL);
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDCF51562D
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 22:57:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317707.537207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkXgM-0008F4-QE; Fri, 29 Apr 2022 20:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317707.537207; Fri, 29 Apr 2022 20:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkXgM-00087X-GW; Fri, 29 Apr 2022 20:57:42 +0000
Received: by outflank-mailman (input) for mailman id 317707;
 Fri, 29 Apr 2022 20:57:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlFr=VH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nkXgK-0006w0-Ey
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 20:57:40 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0046ac0c-c7ff-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 22:57:38 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 30ABC621E0;
 Fri, 29 Apr 2022 20:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46767C385AC;
 Fri, 29 Apr 2022 20:57:36 +0000 (UTC)
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
X-Inumbo-ID: 0046ac0c-c7ff-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651265856;
	bh=6seieTR73PH0f82Y34HYb9MpClaXG8oJYvBYPMoiaDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k5GRPcr8GP3K8y0qny7p1zb6YiGMIlCW9P+OME3kKPshu/LxqKY8B59ApDF+m5mee
	 pNo+Bu5sC2SVSLwgUDi0wnTVvua5iZkt9eHCR416wok+K592gYw0wv2ZWUabyKJIp6
	 AdjPt2r7iLnNwCHpZnTq/aq+dmryD07R4jgweqsCm/iryHUxxWDV67dp2XIJhEX8P3
	 t844yfb6M+fyZ7E1zDYZUM2m4mIZNdeJElapXrCxxWY8ivabovwVipl5ewltATtG5E
	 BuXgm+2gstcKjkwEI1SzTluY3VMD018j96/LrrUNXCdkG1D3sPcgaBPPWlsFqbOtAI
	 6edhDcAgFtn0Q==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jgross@suse.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v5 5/7] xenstored: send an evtchn notification on introduce_domain
Date: Fri, 29 Apr 2022 13:57:30 -0700
Message-Id: <20220429205732.2030094-5-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2204291354050.1947187@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2204291354050.1947187@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

When xs_introduce_domain is called, send out a notification on the
xenstore event channel so that any (dom0less) domain waiting for the
xenstore interface to be ready can continue with the initialization.
Before sending the notification, clear XS_CONNECTION_STATE_RECONNECTING.

The extra notification is harmless for domains that don't require it.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: Juergen Gross <jgross@suse.com>
CC: Julien Grall <julien@xen.org>
---
I dropped the Reviewed-by tags due to the connect = 0 change. Julien
also suggested it would be a good idea to add a clarification statement
about the usage of XS_CONNECTION_STATE_RECONNECTING in the header files
but I wasn't sure what to write. Please advise and I am happy to include
a statement in the next version.

Changes in v5:
- reset XS_CONNECTION_STATE_RECONNECTING before notifying the domU

Changes in v2:
- drop the new late_init parameter
---
 tools/xenstore/xenstored_domain.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index ae065fcbee..7bb8c64d33 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -493,6 +493,10 @@ static struct domain *introduce_domain(const void *ctx,
 		/* Now domain belongs to its connection. */
 		talloc_steal(domain->conn, domain);
 
+		/* Notify the domain that xenstore is available */
+		interface->connection = 0x0;
+		xenevtchn_notify(xce_handle, domain->port);
+
 		if (!is_master_domain && !restore)
 			fire_watches(NULL, ctx, "@introduceDomain", NULL,
 				     false, NULL);
-- 
2.25.1



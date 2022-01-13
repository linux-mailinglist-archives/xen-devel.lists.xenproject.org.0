Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F3048CFDB
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 01:59:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256936.441237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7oSF-0001Qx-09; Thu, 13 Jan 2022 00:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256936.441237; Thu, 13 Jan 2022 00:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7oSE-0001Jl-Rb; Thu, 13 Jan 2022 00:59:02 +0000
Received: by outflank-mailman (input) for mailman id 256936;
 Thu, 13 Jan 2022 00:59:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4cYr=R5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n7oSD-0000Zm-3C
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 00:59:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdb55d7c-740b-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 01:58:59 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C784961BD1;
 Thu, 13 Jan 2022 00:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54EABC36AF2;
 Thu, 13 Jan 2022 00:58:58 +0000 (UTC)
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
X-Inumbo-ID: fdb55d7c-740b-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642035538;
	bh=fAM5YKlaoqXNElpxV8cs5t9a0K94TnXBpqeWzHX/YLs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MrtQLDgTxeYWiHqJ+w1RK29ndLFljUIZHfVsMXu5qIrpLhozntotpH0aLP7PCT3EK
	 fOrbC3BoP9dow/a6fUEojg5yNpk+XQFoKu8lVQuCNXEZoa0S9H+gANZ81tjwEuXXmg
	 45m+83bvEJb3qilWZ47C1O/NqB8lGJuQFLcGhdtUmSnjlQ3+FwrhQ4fGCoeKJPdNe7
	 q3+frVU1C/jjPhv63JEWAnvkPZS4X0qqkyQLkuzlkdtK3H3/tkRqH0X7kCY2ba2Vmk
	 kf05bfkOHFtyghID0DvFP2xQNYKvI90bwdgJB17IeCPYD2gI4Fmb6RbuMvsc1Tvk1c
	 iz0Bm65PE6bmA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jgross@suse.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [XEN PATCH v2 4/5] xenstored: send an evtchn notification on introduce_domain
Date: Wed, 12 Jan 2022 16:58:54 -0800
Message-Id: <20220113005855.1180101-4-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

When xs_introduce_domain is called, send out a notification on the
xenstore event channel so that any (dom0less) domain waiting for the
xenstore interface to be ready can continue with the initialization.

The extra notification is harmless for domains that don't require it.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v2:
- drop the new late_init parameter
---
 tools/xenstore/xenstored_domain.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index d03c7d93a9..7487129e47 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -461,6 +461,9 @@ static struct domain *introduce_domain(const void *ctx,
 		/* Now domain belongs to its connection. */
 		talloc_steal(domain->conn, domain);
 
+		/* Notify the domain that xenstore is available */
+		xenevtchn_notify(xce_handle, domain->port);
+
 		if (!is_master_domain && !restore)
 			fire_watches(NULL, ctx, "@introduceDomain", NULL,
 				     false, NULL);
-- 
2.25.1



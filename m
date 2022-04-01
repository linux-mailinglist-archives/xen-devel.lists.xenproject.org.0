Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B694EE575
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 02:39:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297159.506141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na5Ja-0000gr-Mm; Fri, 01 Apr 2022 00:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297159.506141; Fri, 01 Apr 2022 00:38:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na5Ja-0000Vm-9u; Fri, 01 Apr 2022 00:38:58 +0000
Received: by outflank-mailman (input) for mailman id 297159;
 Fri, 01 Apr 2022 00:38:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yIha=UL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1na5JX-0007ot-K3
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 00:38:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b451931-b154-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 02:38:54 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2BBB8618AB;
 Fri,  1 Apr 2022 00:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5B1C34112;
 Fri,  1 Apr 2022 00:38:52 +0000 (UTC)
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
X-Inumbo-ID: 1b451931-b154-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648773533;
	bh=1MIKxVGlrxQHtL44VHiQsIws8+/TOeEKbJHjXPBZ7lI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LuuxqOnSU2PMw/gWnGe3y0YcxCQe8Kz2xM2QdKzoO0nPrGoikibDmr/yuYLoweInC
	 hE1VvltYj+rH1mbTxz4lJnKIplr4rdytWH96OmGSLRZ++JQBJskqx4MgG/0UTa35lD
	 8yF2MCptNaNvuFZXxR7rkXjN3UoXvnfP9AH6YGaphinRVIRWsMnBe8xnEwVWwAY13q
	 Xy6MfcfqnVYM/seGEQwesKU/Hrw/LzwiNQBkzjegOefRRtvUkZKI4ARTorkPRsIfqC
	 BuN0WSbGd/3DDD2d3s3BaiV7khHLYh5/uzx6Msa4jvXhnLvmg75JADIW/9acsWaDuf
	 gTaeJ82lDBNqw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jgross@suse.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v4 7/9] xenstored: send an evtchn notification on introduce_domain
Date: Thu, 31 Mar 2022 17:38:45 -0700
Message-Id: <20220401003847.38393-7-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

When xs_introduce_domain is called, send out a notification on the
xenstore event channel so that any (dom0less) domain waiting for the
xenstore interface to be ready can continue with the initialization.

The extra notification is harmless for domains that don't require it.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v2:
- drop the new late_init parameter
---
 tools/xenstore/xenstored_domain.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index ae065fcbee..0543f49670 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -493,6 +493,9 @@ static struct domain *introduce_domain(const void *ctx,
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2058E41A789
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 07:56:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197514.350600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV66U-0003ZK-Ea; Tue, 28 Sep 2021 05:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197514.350600; Tue, 28 Sep 2021 05:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV66U-0003XE-Ar; Tue, 28 Sep 2021 05:56:34 +0000
Received: by outflank-mailman (input) for mailman id 197514;
 Tue, 28 Sep 2021 05:56:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqPr=OS=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1mV66S-0003Ws-SR
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 05:56:32 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d4870fac-2020-11ec-bc6a-12813bfff9fa;
 Tue, 28 Sep 2021 05:56:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7095761262;
 Tue, 28 Sep 2021 05:56:31 +0000 (UTC)
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
X-Inumbo-ID: d4870fac-2020-11ec-bc6a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632808591;
	bh=/vMdnTGIRNxo4mGYHll6b4s9a8WgufEfVbRp/DlK4b8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z9EwQalNw0xG35eHzPyfGcQEJ3wCFvuNTOXo9MfXW8jiLehmG/WKcj52dkulktQpL
	 1dl5PgCBvzxVzlOhaHsKGRsjEjMuYKqa5J89bfT4VdlUBswhJFSiHFuSDgUZABgK2/
	 ImKldDTbfR54KLzEnTYkgc4SCeTLFQfD7DpT5vMGm4dqjCeHzqJpKa1f/PtSa9FewL
	 c805GDmDAzWGWyMSF5k/Tq3ABdd20hwbJ2DP0VHpuc4lIRw///8TrjfhhZKBlx7pSV
	 avKKm1x8MFGF9R7trm+qs4P6GRA8dCM2kozPqUBVSUEpLJcCMQjkicgnpn2pCVTP34
	 3zPIGvtZ390nQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 5.14 28/40] Xen/gntdev: don't ignore kernel unmapping error
Date: Tue, 28 Sep 2021 01:55:12 -0400
Message-Id: <20210928055524.172051-28-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928055524.172051-1-sashal@kernel.org>
References: <20210928055524.172051-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Jan Beulich <jbeulich@suse.com>

[ Upstream commit f28347cc66395e96712f5c2db0a302ee75bafce6 ]

While working on XSA-361 and its follow-ups, I failed to spot another
place where the kernel mapping part of an operation was not treated the
same as the user space part. Detect and propagate errors and add a 2nd
pr_debug().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
Link: https://lore.kernel.org/r/c2513395-74dc-aea3-9192-fd265aa44e35@suse.com
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/xen/gntdev.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index a3e7be96527d..23fd09a9bbaf 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -396,6 +396,14 @@ static int __unmap_grant_pages(struct gntdev_grant_map *map, int offset,
 			map->unmap_ops[offset+i].handle,
 			map->unmap_ops[offset+i].status);
 		map->unmap_ops[offset+i].handle = INVALID_GRANT_HANDLE;
+		if (use_ptemod) {
+			if (map->kunmap_ops[offset+i].status)
+				err = -EINVAL;
+			pr_debug("kunmap handle=%u st=%d\n",
+				 map->kunmap_ops[offset+i].handle,
+				 map->kunmap_ops[offset+i].status);
+			map->kunmap_ops[offset+i].handle = INVALID_GRANT_HANDLE;
+		}
 	}
 	return err;
 }
-- 
2.33.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA5235C9B4
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 17:23:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109275.208588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVyOl-0005He-FR; Mon, 12 Apr 2021 15:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109275.208588; Mon, 12 Apr 2021 15:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVyOl-0005HF-Bx; Mon, 12 Apr 2021 15:22:47 +0000
Received: by outflank-mailman (input) for mailman id 109275;
 Mon, 12 Apr 2021 15:22:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oSjc=JJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lVyOj-0005H5-PF
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 15:22:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ed1d60c-ec92-4f23-8f50-3362f9c3b27d;
 Mon, 12 Apr 2021 15:22:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2AD49B317;
 Mon, 12 Apr 2021 15:22:44 +0000 (UTC)
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
X-Inumbo-ID: 4ed1d60c-ec92-4f23-8f50-3362f9c3b27d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618240964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r2eCqlORFLfVmLFfiEovHQm+H5lydtlCD/BZ4XW/beY=;
	b=ZY6aakw2fEC3vXfZq9xZvqwwci7oKFkfBBnPSnNMTCxgOcj4Ju4SD60HrEhctSujiZB1lO
	BpaMWMzq0S+mVRJDiiH5TF5k5biaFPPrVkMjHCN1dxWNOY8Z0264Cz2eEB9MAGklXg97ag
	Xyd7HdyKBemZHkCK62Q/rysTa4RLQgY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/6] tools/libs/guest: fix max_pfn setting in map_p2m()
Date: Mon, 12 Apr 2021 17:22:31 +0200
Message-Id: <20210412152236.1975-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210412152236.1975-1-jgross@suse.com>
References: <20210412152236.1975-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When setting the highest pfn used in the guest, don't subtract 1 from
the value read from the shared_info data. The value read already is
the correct pfn.

Fixes: 91e204d37f449 ("libxc: try to find last used pfn when migrating")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
This is a backport candidate
---
 tools/libs/guest/xg_sr_save_x86_pv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/guest/xg_sr_save_x86_pv.c b/tools/libs/guest/xg_sr_save_x86_pv.c
index 4964f1f7b8..dae7f2817f 100644
--- a/tools/libs/guest/xg_sr_save_x86_pv.c
+++ b/tools/libs/guest/xg_sr_save_x86_pv.c
@@ -468,7 +468,7 @@ static int map_p2m(struct xc_sr_context *ctx)
 
     ctx->x86.pv.p2m_generation = ~0ULL;
     ctx->x86.pv.max_pfn = GET_FIELD(ctx->x86.pv.shinfo, arch.max_pfn,
-                                    ctx->x86.pv.width) - 1;
+                                    ctx->x86.pv.width);
     p2m_cr3 = GET_FIELD(ctx->x86.pv.shinfo, arch.p2m_cr3, ctx->x86.pv.width);
 
     return p2m_cr3 ? map_p2m_list(ctx, p2m_cr3) : map_p2m_tree(ctx);
-- 
2.26.2



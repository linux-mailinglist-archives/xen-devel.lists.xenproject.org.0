Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A000E343EA2
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 11:58:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100144.190627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOIGm-0002wQ-5O; Mon, 22 Mar 2021 10:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100144.190627; Mon, 22 Mar 2021 10:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOIGm-0002vl-1E; Mon, 22 Mar 2021 10:58:48 +0000
Received: by outflank-mailman (input) for mailman id 100144;
 Mon, 22 Mar 2021 10:58:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lx7y=IU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lOIGk-0002uK-DF
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 10:58:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba060220-ad9c-463c-95c0-c97de1519a6e;
 Mon, 22 Mar 2021 10:58:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 22E90AD79;
 Mon, 22 Mar 2021 10:58:43 +0000 (UTC)
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
X-Inumbo-ID: ba060220-ad9c-463c-95c0-c97de1519a6e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616410723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r2eCqlORFLfVmLFfiEovHQm+H5lydtlCD/BZ4XW/beY=;
	b=A4bADNg+6697VwI4UcAjmrjv9AZlaVwjMiQufCU5j33i23rNv5aAu3fl/NIMZfjGIeJMEx
	11jc6d8cd8G+JoIJXF1Y5VmcLpkZsLfLpL6hAfAUhwz5LNZVY9IkTqs2VBwxFkXilv4JRv
	f4NSVhN7j/3QZKHPggOlAIpHpfa+/ZQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/6] tools/libs/guest: fix max_pfn setting in map_p2m()
Date: Mon, 22 Mar 2021 11:58:35 +0100
Message-Id: <20210322105840.11224-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322105840.11224-1-jgross@suse.com>
References: <20210322105840.11224-1-jgross@suse.com>
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



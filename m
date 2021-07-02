Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B1D3BA42F
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 21:04:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149303.276061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzOSA-0004us-Dx; Fri, 02 Jul 2021 19:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149303.276061; Fri, 02 Jul 2021 19:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzOSA-0004sv-A2; Fri, 02 Jul 2021 19:03:54 +0000
Received: by outflank-mailman (input) for mailman id 149303;
 Fri, 02 Jul 2021 19:03:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wENR=L2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lzOS9-0004b9-01
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 19:03:53 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee2ce74b-9f90-4eab-b1ff-80532c0c4121;
 Fri, 02 Jul 2021 19:03:51 +0000 (UTC)
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
X-Inumbo-ID: ee2ce74b-9f90-4eab-b1ff-80532c0c4121
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625252631;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=gfmANs3MCnxiFwWReGm72wEovDSLU4AH2fTV/7XxIgU=;
  b=Lq1K3KAox0l97aU1NuuBVTcFZhdMiX+Ak0kCTntpFADV8kc0+XY1yYA2
   eejJQejnnxgIdonn/Yc8ABKN6FKS+Ip2a7weU4NoRzxRjXaEs7bXaEp8D
   pWx7uBPPr7JkjahfXHm6AcT7ibaSYcTBlU3XIkKUKC+Msfy6O9BbDt6sX
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Y3L9KClQ1ZJnN9B06enohAJUu2Ta2Qkokk56xo83VZvvCU8ypoUZxh3VQZeCVgmIM1GFuuLzV/
 EWgF2qO8KKmygTzDozzfUR51wsBm+eu6fqwWtSlqaQ3+FkjM3+1izAwHB7ioYUvitAJkULp6G8
 JOr5OrOh7DaHg47dmDdzyxsQSrGxItvwXNJt6VnW0xz6/kWcdBeojyrl6Di2jil2CN8souhyWr
 Xt14Q8QwAmTLPErsnxwktX+InRZOCcCUCjm1t7LTIdEQ2ieqBQfqx6a6BzHvyJ93Dzr0JksZ+N
 Ki4=
X-SBRS: 5.1
X-MesageID: 47863089
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:CAGIEql2HENup4MFrxNEeSw2tFXpDfIk3DAbv31ZSRFFG/Fxl6
 iV/cjztCWE7gr5N0tQ+uxoVJPufZq+z+8T3WByB8bBYOCOggLBR+sOgbcKqweQfxEWndQ86U
 4PScZD4aXLfD1Hsfo=
X-IronPort-AV: E=Sophos;i="5.83,319,1616472000"; 
   d="scan'208";a="47863089"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Olaf Hering <olaf@aepfle.de>
Subject: [PATCH] tools/libxenguest: Fix migration's debug option
Date: Fri, 2 Jul 2021 20:03:42 +0100
Message-ID: <20210702190342.31319-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

The code has gone through many refactors, but the first refactor was the one
which broke it by inverting the check with respect to checkpointed streams.

Fixes: 7449fb36c6c8 ("migration/save: pass checkpointed_stream from libxl to libxc")
Reported-by: Olaf Hering <olaf@aepfle.de>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Olaf Hering <olaf@aepfle.de>

`xl migrate --debug` might not be perfect, but this at least brings it back to
mostly working.

I don't think dropping it is a sensible move.  In particular, it is invaluable
for testing the logdirty infrastructure when migrating a memtest VM.

If anyone has a clever idea to fix the grant problem, then we can.  It is
after all a debug option, without any specific prescribed behaviour.
---
 tools/libs/guest/xg_sr_save.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 2ba7c3200cd5..f0e2bd048d37 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -752,7 +752,7 @@ static int send_domain_memory_live(struct xc_sr_context *ctx)
     if ( rc )
         goto out;
 
-    if ( ctx->save.debug && ctx->stream_type != XC_STREAM_PLAIN )
+    if ( ctx->save.debug && ctx->stream_type == XC_STREAM_PLAIN )
     {
         rc = verify_frames(ctx);
         if ( rc )
-- 
2.11.0



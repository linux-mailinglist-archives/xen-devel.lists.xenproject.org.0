Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B1A947C96
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 16:12:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772197.1182632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sayRf-0008Cp-4O; Mon, 05 Aug 2024 14:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772197.1182632; Mon, 05 Aug 2024 14:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sayRf-0008AQ-0Z; Mon, 05 Aug 2024 14:12:19 +0000
Received: by outflank-mailman (input) for mailman id 772197;
 Mon, 05 Aug 2024 14:12:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XyDJ=PE=decay.netherworld.org=mag@srs-se1.protection.inumbo.net>)
 id 1sayRd-00089W-Lw
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 14:12:17 +0000
Received: from sinister.netherworld.org (sinister.netherworld.org
 [38.100.53.3]) by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id b77f6c41-5334-11ef-8776-851b0ebba9a2;
 Mon, 05 Aug 2024 16:12:15 +0200 (CEST)
Received: from decay.netherworld.org (decay.netherworld.org [192.168.6.20])
 by sinister.netherworld.org (8.17.1/8.17.1) with ESMTP id 475ECE35020715;
 Mon, 5 Aug 2024 10:12:14 -0400
Received: from decay.netherworld.org (localhost [127.0.0.1])
 by decay.netherworld.org (8.17.1/8.17.1) with ESMTP id 475ECEUE021887;
 Mon, 5 Aug 2024 10:12:14 -0400
Received: (from mag@localhost)
 by decay.netherworld.org (8.17.1/8.17.1/Submit) id 475ECDRu021886;
 Mon, 5 Aug 2024 10:12:13 -0400
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
X-Inumbo-ID: b77f6c41-5334-11ef-8776-851b0ebba9a2
From: "John E. Krokes" <mag@netherworld.org>
To: xen-devel@lists.xenproject.org
Cc: "John E. Krokes" <mag@netherworld.org>,
        Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] Fixed incorrect output in xl's "help" command.
Date: Mon,  5 Aug 2024 10:11:59 -0400
Message-Id: <20240805141159.21872-1-mag@netherworld.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In "xl help", the output includes this line:

 vsnd-list           List virtual display devices for a domain

This should obviously say "sound devices" instead of "display devices".

Signed-off-by: John E. Krokes <mag@netherworld.org>
---
 tools/xl/xl_cmdtable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 42751228c1..53fc22d344 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -433,7 +433,7 @@ const struct cmd_spec cmd_table[] = {
     },
     { "vsnd-list",
       &main_vsndlist, 0, 0,
-      "List virtual display devices for a domain",
+      "List virtual sound devices for a domain",
       "<Domain(s)>",
     },
     { "vsnd-detach",
-- 
2.39.2



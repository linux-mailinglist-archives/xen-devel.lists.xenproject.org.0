Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E7D9E6681
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:52:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849610.1264257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQJz-0002wN-2t; Fri, 06 Dec 2024 04:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849610.1264257; Fri, 06 Dec 2024 04:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQJz-0002uu-07; Fri, 06 Dec 2024 04:52:07 +0000
Received: by outflank-mailman (input) for mailman id 849610;
 Fri, 06 Dec 2024 04:52:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQA3-0004Ka-Mn
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 641a6002-b38c-11ef-a0d5-8be0dac302b0;
 Fri, 06 Dec 2024 05:41:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5D95B5C7324;
 Fri,  6 Dec 2024 04:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1783C4CEDD;
 Fri,  6 Dec 2024 04:41:38 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id EA12DE77171;
 Fri,  6 Dec 2024 04:41:38 +0000 (UTC)
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
X-Inumbo-ID: 641a6002-b38c-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460099;
	bh=pEJQg723yWljjn985dh3Vj78Rpiz9AzjJ9MOG9LwSPs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lUCcZ3dxSny9GcrhYt/E5TKfIMvzI+VBNAYrTffh2f1GwtL3InyVq1nZXnp/uq8gy
	 utDYxNt2R4iOLZd6qsqs0dGU/U5XKv3gXJn4GMcV7NsTsOce4ydHqc8XRUDpAYZCcK
	 fTU6xWBZ8z19gPFHFgNrNokWKvhsNdyTTY8ZZ+awT6s3ISU5FbhzWIXizkcEmsrW13
	 mRdXivbAsFGjdjRo2R+G+RrGBsLyD/2MbKP1dCYV45bQ9ysIzald0l+GOT19f4v0mg
	 MYI+I/JmZfrsIOLjJ/dP9wi+6dfBlOsKk+T3RsOQ5RhXSyXqF1Cj4mdiHiSxmk8NOZ
	 KWkNAMg0yJCMQ==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:55 -0800
Subject: [PATCH v2 25/35] xen/console: simplify console owner switch hint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-25-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460094; l=881;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=8rbmvBVON7AxnVLWZe4TyiZNfaP+ce1iMVhidiuAaeA=;
 b=ngSX/Bjan55Yf6HbhjCcVyH1MRrm+rX6fCLNvoL2CELYqurZ5AMRgsHmNbAjVstU/zeZv2WRK
 t2fk6SQ9SZpC3ILMTDGon5ON0+OcpvIJPkVFDh3uiDU0ZPaGM8EUHGk
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Update the hint w/ the combination of keys to press to switch physical console
to the next owner.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/console.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 115967d179998cba4a81578caba09db4e4aca7f7..d22fb4a253af26f9b51d91bd408e1dbf4bb5a7c1 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -528,8 +528,8 @@ int console_set_owner(domid_t domid)
     console_owner = domid;
 
     if ( switch_code )
-        printk(" (type 'CTRL-%c' three times to switch input)",
-               opt_conswitch[0]);
+        printk(" (type 'CTRL-%c%c%c' to switch input)",
+               opt_conswitch[0], opt_conswitch[0], opt_conswitch[0]);
     printk("\n");
 
     return 0;

-- 
2.34.1




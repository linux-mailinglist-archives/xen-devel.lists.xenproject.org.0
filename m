Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DBB48B1E7
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 17:19:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255956.438960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Jr0-0002pU-LX; Tue, 11 Jan 2022 16:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255956.438960; Tue, 11 Jan 2022 16:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Jr0-0002hA-GN; Tue, 11 Jan 2022 16:18:34 +0000
Received: by outflank-mailman (input) for mailman id 255956;
 Tue, 11 Jan 2022 16:18:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7Jqz-0002Xe-BE
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 16:18:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d6a980e-72fa-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 17:18:30 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2D09B212C9;
 Tue, 11 Jan 2022 16:18:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 00E7213AF0;
 Tue, 11 Jan 2022 16:18:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IAyjOtWt3WHnKgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 11 Jan 2022 16:18:29 +0000
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
X-Inumbo-ID: 1d6a980e-72fa-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641917910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=am4LrRyeRveJSahC0AqbZY/L5YFBvgln+Y1OIEQ8/Xk=;
	b=QsRkJFYGctcQHk2Fp22rUBZE4gJY1oZjP2opE/S4SGGQoOjUPUPQG54IHivTzcrdfIl2hR
	9CQ3NIB+jC8veBW9UlMgYmZpLEU/kfqpj+lYveeKurpCUAs0FRK62fFV7bSY62slsqCyJJ
	EYYM3bYv8zkgHsA5rkaN3Cs5MSgBxbY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 2/2] tools/libs/gnttab: make mini-os specific callback static
Date: Tue, 11 Jan 2022 17:18:27 +0100
Message-Id: <20220111161827.8982-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220111161827.8982-1-jgross@suse.com>
References: <20220111161827.8982-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is possible now to make the callback for Mini-OS static, as it is
only referenced via the file_ops vector.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/gnttab/minios.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/libs/gnttab/minios.c b/tools/libs/gnttab/minios.c
index c19f339c8c..616728d676 100644
--- a/tools/libs/gnttab/minios.c
+++ b/tools/libs/gnttab/minios.c
@@ -33,9 +33,7 @@
 
 #include "private.h"
 
-int minios_gnttab_close_fd(int fd);
-
-int minios_gnttab_close_fd(int fd)
+static int minios_gnttab_close_fd(int fd)
 {
     struct file *file = get_file_from_fd(fd);
 
-- 
2.26.2



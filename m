Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 776DA493578
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 08:28:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258728.445935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA5OZ-00041b-EG; Wed, 19 Jan 2022 07:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258728.445935; Wed, 19 Jan 2022 07:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA5OZ-0003rx-97; Wed, 19 Jan 2022 07:28:39 +0000
Received: by outflank-mailman (input) for mailman id 258728;
 Wed, 19 Jan 2022 07:28:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7l/E=SD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nA5OX-0003Y7-54
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 07:28:37 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69112513-78f9-11ec-a115-11989b9578b4;
 Wed, 19 Jan 2022 08:28:35 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 831B4218B1;
 Wed, 19 Jan 2022 07:28:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6344413B28;
 Wed, 19 Jan 2022 07:28:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wDcjF6K952EyZQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 19 Jan 2022 07:28:34 +0000
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
X-Inumbo-ID: 69112513-78f9-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642577314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Q8/hUXGqsnYkvw1oVYpCRHGGrTKxx6BfGMzSIWuIkk=;
	b=tPl30SlYFSZSWhgQFeaYYbXXz67N4URWouXDF1+5GpYXsugscg4DmYIVI7QVy9xPdeLQHz
	devaCFqz+Em7u0pzm0OMNk4RYmQckWr5sXfF48LOzAY9BslLNJzKCbDMutWY0GCgo4rk/a
	Lujhcorw5vyXBwmwbVAUGCJssmomqIQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 3/3] tools/libs/gnttab: remove old mini-os callback
Date: Wed, 19 Jan 2022 08:28:23 +0100
Message-Id: <20220119072823.21025-4-jgross@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220119072823.21025-1-jgross@suse.com>
References: <20220119072823.21025-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is possible now to delete minios_gnttab_close_fd().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- rebase
---
 tools/libs/gnttab/minios.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/tools/libs/gnttab/minios.c b/tools/libs/gnttab/minios.c
index f59fad3577..cac89f0ba6 100644
--- a/tools/libs/gnttab/minios.c
+++ b/tools/libs/gnttab/minios.c
@@ -33,8 +33,6 @@
 
 #include "private.h"
 
-void minios_gnttab_close_fd(int fd);
-
 static int gnttab_close_fd(struct file *file)
 {
     gntmap_fini(file->dev);
@@ -89,13 +87,6 @@ int osdep_gnttab_close(xengnttab_handle *xgt)
     return close(xgt->fd);
 }
 
-void minios_gnttab_close_fd(int fd)
-{
-    struct file *file = get_file_from_fd(fd);
-
-    gnttab_close_fd(file);
-}
-
 void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
                              uint32_t count, int flags, int prot,
                              uint32_t *domids, uint32_t *refs,
-- 
2.31.1



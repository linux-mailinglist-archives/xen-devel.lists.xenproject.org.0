Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F2A48B03B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 16:03:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255794.438546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7IgH-0001ym-Jz; Tue, 11 Jan 2022 15:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255794.438546; Tue, 11 Jan 2022 15:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7IgH-0001u3-Cx; Tue, 11 Jan 2022 15:03:25 +0000
Received: by outflank-mailman (input) for mailman id 255794;
 Tue, 11 Jan 2022 15:03:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7IgF-0001Pl-C2
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 15:03:23 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9de6bbf7-72ef-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 16:03:21 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 506721F3B1;
 Tue, 11 Jan 2022 15:03:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 29BBA13DDD;
 Tue, 11 Jan 2022 15:03:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sAr7CDmc3WFCfQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 11 Jan 2022 15:03:21 +0000
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
X-Inumbo-ID: 9de6bbf7-72ef-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641913401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0wxCynhrG7+3fmG6x+LbTZBr6u3QyVqAaptOz8E8AA=;
	b=H3R1EhnhtZXIGv+EwDOxndd7oUu0h/Qcna+uQd108vxqfcUQeiQS8rXlryzHcsrzjMRgZu
	DFb2TIz3bRGlJqjEUwL8sEDJYi/Efwj3oqrqtfcmpe5KdYq5ddRYRoS1YnEcF3Yl0gd7lk
	09P6Taa3yS9Rl6Lc2Y51dlMih6NWWMM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 3/3] tools/libs/ctrl: remove file related handling
Date: Tue, 11 Jan 2022 16:03:18 +0100
Message-Id: <20220111150318.22570-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220111150318.22570-1-jgross@suse.com>
References: <20220111150318.22570-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no special file handling related to libxenctrl in Mini-OS
any longer, so the close hook can be removed.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 tools/libs/ctrl/xc_minios.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/tools/libs/ctrl/xc_minios.c b/tools/libs/ctrl/xc_minios.c
index 1799daafdc..3dea7a78a5 100644
--- a/tools/libs/ctrl/xc_minios.c
+++ b/tools/libs/ctrl/xc_minios.c
@@ -35,15 +35,6 @@
 
 #include "xc_private.h"
 
-void minios_interface_close_fd(int fd);
-
-extern void minios_interface_close_fd(int fd);
-
-void minios_interface_close_fd(int fd)
-{
-    files[fd].type = FTYPE_NONE;
-}
-
 /* Optionally flush file to disk and discard page cache */
 void discard_file_cache(xc_interface *xch, int fd, int flush)
 {
-- 
2.26.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A765248FB9B
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 09:24:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257807.443142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90pW-0005Pk-HJ; Sun, 16 Jan 2022 08:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257807.443142; Sun, 16 Jan 2022 08:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90pW-0005KY-CJ; Sun, 16 Jan 2022 08:24:02 +0000
Received: by outflank-mailman (input) for mailman id 257807;
 Sun, 16 Jan 2022 08:24:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n90pU-00052L-FH
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 08:24:00 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6b1d4c6-76a5-11ec-9bbc-9dff3e4ee8c5;
 Sun, 16 Jan 2022 09:23:58 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5389D219B7;
 Sun, 16 Jan 2022 08:23:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2649013AB5;
 Sun, 16 Jan 2022 08:23:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0DIxCB7W42FLEwAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 16 Jan 2022 08:23:58 +0000
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
X-Inumbo-ID: a6b1d4c6-76a5-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642321438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErBw94A7NHEtLBOjGVvrvddf8O/VaQ+sffKi2esB83Q=;
	b=uUKXOYpzHeVUejGUQWZzyzoW7MX7yrbQOlfPg9+rBQrRlWeuP8Rh7AgUVg4cFj+C2RmVsk
	5SJvOirABifng/bv88zJYH1rtKs0mCet97sEoTzSSnr7R3IpxUHnoYgiLAtB0gQXy5m4Yd
	W0V0hyY+cNp9Gv5ZOBbqX4dllybQCNo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 3/3] tools/libs/ctrl: remove file related handling
Date: Sun, 16 Jan 2022 09:23:46 +0100
Message-Id: <20220116082346.26194-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220116082346.26194-1-jgross@suse.com>
References: <20220116082346.26194-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no special file handling related to libxenctrl in Mini-OS
any longer, so the close hook can be removed.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB65348FBB2
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 09:33:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257833.443265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90yt-0001pa-F8; Sun, 16 Jan 2022 08:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257833.443265; Sun, 16 Jan 2022 08:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90ys-0001b6-Vu; Sun, 16 Jan 2022 08:33:43 +0000
Received: by outflank-mailman (input) for mailman id 257833;
 Sun, 16 Jan 2022 08:33:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n90yo-0008IQ-Vd
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 08:33:38 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd053218-76a6-11ec-9bbc-9dff3e4ee8c5;
 Sun, 16 Jan 2022 09:33:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B7067219C8;
 Sun, 16 Jan 2022 08:33:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8DEF31346A;
 Sun, 16 Jan 2022 08:33:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oIN0IVzY42HyFQAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 16 Jan 2022 08:33:32 +0000
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
X-Inumbo-ID: fd053218-76a6-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642322012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sE2ME2yl3H92H6CBanzgJAMhj6JgWCncjlIia2KP7ss=;
	b=sVHsnUB42fimeyRpdY0mC4n6za+sNhiKzqnZBmPUpban2shE3YrSiIanyFrFGlGvp/uomA
	PaodsxbHpsaWadBuoc4vldB73m98rAZLpc0HCIW4DYCYMBw+uwEQOh2WhQXYApaANnxCxH
	4R74J0fouMHpIQVY8p6V752MtpM3Vjw=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINIOS PATCH v3 11/12] add struct file_ops for FTYPE_FILE
Date: Sun, 16 Jan 2022 09:33:27 +0100
Message-Id: <20220116083328.26524-12-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220116083328.26524-1-jgross@suse.com>
References: <20220116083328.26524-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FTYPE_FILE is the last relevant file type without a struct file_ops.
Add it.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 lib/sys.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/lib/sys.c b/lib/sys.c
index 538d6e7b..7f3dc4e4 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -99,6 +99,11 @@ static const struct file_ops file_ops_none = {
     .name = "none",
 };
 
+static const struct file_ops file_file_ops = {
+    .name = "file",
+    .lseek = lseek_default,
+};
+
 #ifdef HAVE_LWIP
 static int socket_read(struct file *file, void *buf, size_t nbytes)
 {
@@ -157,6 +162,7 @@ static const struct file_ops *file_ops[FTYPE_N + FTYPE_SPARE] = {
 #ifdef CONFIG_CONSFRONT
     [FTYPE_CONSOLE] = &console_ops,
 #endif
+    [FTYPE_FILE] = &file_file_ops,
 #ifdef HAVE_LWIP
     [FTYPE_SOCKET] = &socket_ops,
 #endif
@@ -415,16 +421,9 @@ off_t lseek(int fd, off_t offset, int whence)
     if ( ops->lseek )
         return ops->lseek(file, offset, whence);
 
-    switch(file->type) {
-       case FTYPE_FILE:
-          break;
-       default:
-          /* Not implemented for this filetype */
-          errno = ESPIPE;
-          return (off_t) -1;
-    }
-
-    return lseek_default(file, offset, whence);
+    /* Not implemented for this filetype */
+    errno = ESPIPE;
+    return (off_t) -1;
 }
 
 int fsync(int fd) {
-- 
2.26.2



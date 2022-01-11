Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF3B48B08D
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 16:12:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255879.438817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Ip6-0004rw-T6; Tue, 11 Jan 2022 15:12:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255879.438817; Tue, 11 Jan 2022 15:12:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Ip5-0004Zj-UU; Tue, 11 Jan 2022 15:12:31 +0000
Received: by outflank-mailman (input) for mailman id 255879;
 Tue, 11 Jan 2022 15:12:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7Ip0-0002Fv-W8
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 15:12:26 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de7324e1-72f0-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 16:12:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1802F1F3B9;
 Tue, 11 Jan 2022 15:12:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E27A913DDD;
 Tue, 11 Jan 2022 15:12:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MH/eNVKe3WG8AwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 11 Jan 2022 15:12:18 +0000
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
X-Inumbo-ID: de7324e1-72f0-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641913939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LT7y4F0rIJkzgfg3Wqk+kFvoECYDkYG0U0o/MY4F4aI=;
	b=J3Y9NA+QaK3CF8Btdh7yERlbdXYM4SHcMGD4DBHtgKs4C1sRKVE81UI0g2nNwB9bek+8ly
	Gx+PHio0I06zucoyCKZq/DjGp0OJMqhiLm1Ei/YJVqbBkKTwIFK8d7ACGJ6G5qp147LkSC
	2znecvy9nwsbg1LkPq6Hmb1Ni3fLgtw=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 11/12] mini-os: add struct file_ops for FTYPE_FILE
Date: Tue, 11 Jan 2022 16:12:14 +0100
Message-Id: <20220111151215.22955-12-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220111151215.22955-1-jgross@suse.com>
References: <20220111151215.22955-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FTYPE_FILE is the last relevant file type without a struct file_ops.
Add it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 lib/sys.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/lib/sys.c b/lib/sys.c
index 12deaed..0f42e97 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -99,6 +99,11 @@ static struct file_ops file_ops_none = {
     .name = "none",
 };
 
+static struct file_ops file_file_ops = {
+    .name = "file",
+    .lseek = lseek_default,
+};
+
 #ifdef HAVE_LWIP
 static int socket_read(int fd, void *buf, size_t nbytes)
 {
@@ -160,6 +165,7 @@ static struct file_ops *file_ops[FTYPE_N + FTYPE_SPARE] = {
 #ifdef CONFIG_CONSFRONT
     [FTYPE_CONSOLE] = &console_ops,
 #endif
+    [FTYPE_FILE] = &file_file_ops,
 #ifdef HAVE_LWIP
     [FTYPE_SOCKET] = &socket_ops,
 #endif
@@ -397,16 +403,9 @@ off_t lseek(int fd, off_t offset, int whence)
     if ( ops->lseek )
         return ops->lseek(fd, offset, whence);
 
-    switch(files[fd].type) {
-       case FTYPE_FILE:
-          break;
-       default:
-          /* Not implemented for this filetype */
-          errno = ESPIPE;
-          return (off_t) -1;
-    }
-
-    return lseek_default(fd, offset, whence);
+    /* Not implemented for this filetype */
+    errno = ESPIPE;
+    return (off_t) -1;
 }
 
 int fsync(int fd) {
-- 
2.26.2



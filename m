Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D433693FDB
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 09:44:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494207.764210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRURj-0005NT-7o; Mon, 13 Feb 2023 08:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494207.764210; Mon, 13 Feb 2023 08:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRURj-0005Kg-4U; Mon, 13 Feb 2023 08:44:23 +0000
Received: by outflank-mailman (input) for mailman id 494207;
 Mon, 13 Feb 2023 08:44:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DRhn=6J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pRURi-00053b-8Y
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 08:44:22 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bda6e54-ab7a-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 09:44:20 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 95DCF67B09;
 Mon, 13 Feb 2023 08:44:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6D2A21391B;
 Mon, 13 Feb 2023 08:44:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VAl9GWX46WMuRAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 13 Feb 2023 08:44:21 +0000
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
X-Inumbo-ID: 9bda6e54-ab7a-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1676277861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U4WUHNcXaKUs5EWJgyYOwx2UyA3oTZifWWQZCeAXA8E=;
	b=r91MzCy85Iz1/IfPwuNm+gVo6sS8uA04Tq51j4D7DN/0uBFeYTGxHmfLk5yiywCZbf8d6T
	udqXCa918VMQ+NMjKC7jCIr1fSLuylUAGZkkgITcfp8L0vXHP6QalG4N/BOyWNkewUwjCA
	eZVNhUqOzaW/mjJ2D+Bx2trwCwEyO4k=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 1/7] Mini-OS: xenbus: add support for reading node from directory
Date: Mon, 13 Feb 2023 09:44:06 +0100
Message-Id: <20230213084412.21065-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213084412.21065-1-jgross@suse.com>
References: <20230213084412.21065-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Especially PV device drivers often need to read multiple Xenstore
nodes from a common directory. Add support for reading a string or an
unsigned value by specifying the directory and the node.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
V2:
- check sscanf() return value (Samuel Thibault)
---
 include/xenbus.h |  6 ++++++
 xenbus.c         | 40 +++++++++++++++++++++++++++++++++++++---
 2 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/include/xenbus.h b/include/xenbus.h
index 3871f358..c0fc0ac5 100644
--- a/include/xenbus.h
+++ b/include/xenbus.h
@@ -108,6 +108,12 @@ int xenbus_read_integer(const char *path);
  * read and parsing were successful, 0 if not */
 int xenbus_read_uuid(const char* path, unsigned char uuid[16]);
 
+/* Support functions for reading values from directory/node tuple. */
+char *xenbus_read_string(xenbus_transaction_t xbt, const char *dir,
+                         const char *node, char **value);
+char *xenbus_read_unsigned(xenbus_transaction_t xbt, const char *dir,
+                           const char *node, unsigned int *value);
+
 /* Contraction of snprintf and xenbus_write(path/node). */
 char* xenbus_printf(xenbus_transaction_t xbt,
                                   const char* node, const char* path,
diff --git a/xenbus.c b/xenbus.c
index 81e9b65d..923e8181 100644
--- a/xenbus.c
+++ b/xenbus.c
@@ -936,16 +936,21 @@ int xenbus_read_uuid(const char *path, unsigned char uuid[16])
     return 1;
 }
 
+#define BUFFER_SIZE 256
+static void xenbus_build_path(const char *dir, const char *node, char *res)
+{
+    BUG_ON(strlen(dir) + strlen(node) + 1 >= BUFFER_SIZE);
+    sprintf(res,"%s/%s", dir, node);
+}
+
 char *xenbus_printf(xenbus_transaction_t xbt, const char* node,
                     const char* path, const char* fmt, ...)
 {
-#define BUFFER_SIZE 256
     char fullpath[BUFFER_SIZE];
     char val[BUFFER_SIZE];
     va_list args;
 
-    BUG_ON(strlen(node) + strlen(path) + 1 >= BUFFER_SIZE);
-    sprintf(fullpath,"%s/%s", node, path);
+    xenbus_build_path(node, path, fullpath);
     va_start(args, fmt);
     vsprintf(val, fmt, args);
     va_end(args);
@@ -964,6 +969,35 @@ domid_t xenbus_get_self_id(void)
     return ret;
 }
 
+char *xenbus_read_string(xenbus_transaction_t xbt, const char *dir,
+                         const char *node, char **value)
+{
+    char path[BUFFER_SIZE];
+
+    xenbus_build_path(dir, node, path);
+
+    return xenbus_read(xbt, path, value);
+}
+
+char *xenbus_read_unsigned(xenbus_transaction_t xbt, const char *dir,
+                           const char *node, unsigned int *value)
+{
+    char path[BUFFER_SIZE];
+    char *msg;
+    char *str;
+
+    xenbus_build_path(dir, node, path);
+    msg = xenbus_read(xbt, path, &str);
+    if ( msg )
+        return msg;
+
+    if ( sscanf(str, "%u", value) != 1 )
+        msg = strdup("EINVAL");
+    free(str);
+
+    return msg;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.35.3



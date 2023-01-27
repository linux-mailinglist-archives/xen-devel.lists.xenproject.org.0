Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B7667DE8F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 08:34:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485322.752460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLJFB-0007ZV-Ee; Fri, 27 Jan 2023 07:33:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485322.752460; Fri, 27 Jan 2023 07:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLJFB-0007X1-Aj; Fri, 27 Jan 2023 07:33:53 +0000
Received: by outflank-mailman (input) for mailman id 485322;
 Fri, 27 Jan 2023 07:33:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D8Jc=5Y=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pLJF9-0007JG-Ao
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 07:33:51 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f01b6503-9e14-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 08:33:49 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 322E321DA3;
 Fri, 27 Jan 2023 07:33:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0495C138E3;
 Fri, 27 Jan 2023 07:33:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HkVtO1t+02OkYAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 27 Jan 2023 07:33:47 +0000
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
X-Inumbo-ID: f01b6503-9e14-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674804828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2F3jMA00rIuMoLB5a5BqPwacl19YT7UGy2nW1Pjamfc=;
	b=njRbIWfll6G2JpZj/M/OWVZX+cvo69nOjKOlQppL9T3HC1pvHTHcufdWAzj6KqMDjTH5CU
	3o1JsuQ5BrxuUzsbnerkUnCRLNX3y1HeP9Tbhr+6KMs57YvOXTepuNu78Zzi0cyTs9JCEg
	7lS2RB5EwFKwptg/jPFxb08bRzTJkjU=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] Mini-OS: move xenbus test code into test.c
Date: Fri, 27 Jan 2023 08:33:46 +0100
Message-Id: <20230127073346.6992-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test code in xenbus.c can easily be moved into test.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 test.c   | 108 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 xenbus.c | 113 -------------------------------------------------------
 2 files changed, 106 insertions(+), 115 deletions(-)

diff --git a/test.c b/test.c
index 42a26661..465c54e8 100644
--- a/test.c
+++ b/test.c
@@ -44,6 +44,7 @@
 #include <fcntl.h>
 #include <xen/features.h>
 #include <xen/version.h>
+#include <xen/io/xs_wire.h>
 
 #ifdef CONFIG_XENBUS
 static unsigned int do_shutdown = 0;
@@ -52,11 +53,114 @@ static DECLARE_WAIT_QUEUE_HEAD(shutdown_queue);
 #endif
 
 #ifdef CONFIG_XENBUS
-void test_xenbus(void);
+/* Send a debug message to xenbus.  Can block. */
+static void xenbus_debug_msg(const char *msg)
+{
+    int len = strlen(msg);
+    struct write_req req[] = {
+        { "print", sizeof("print") },
+        { msg, len },
+        { "", 1 }};
+    struct xsd_sockmsg *reply;
+
+    reply = xenbus_msg_reply(XS_DEBUG, 0, req, ARRAY_SIZE(req));
+    printk("Got a reply, type %d, id %d, len %d.\n",
+           reply->type, reply->req_id, reply->len);
+}
+
+static void do_ls_test(const char *pre)
+{
+    char **dirs, *msg;
+    int x;
+
+    printk("ls %s...\n", pre);
+    msg = xenbus_ls(XBT_NIL, pre, &dirs);
+    if ( msg )
+    {
+        printk("Error in xenbus ls: %s\n", msg);
+        free(msg);
+        return;
+    }
+
+    for ( x = 0; dirs[x]; x++ )
+    {
+        printk("ls %s[%d] -> %s\n", pre, x, dirs[x]);
+        free(dirs[x]);
+    }
+
+    free(dirs);
+}
+
+static void do_read_test(const char *path)
+{
+    char *res, *msg;
+
+    printk("Read %s...\n", path);
+    msg = xenbus_read(XBT_NIL, path, &res);
+    if ( msg )
+    {
+        printk("Error in xenbus read: %s\n", msg);
+        free(msg);
+        return;
+    }
+    printk("Read %s -> %s.\n", path, res);
+    free(res);
+}
+
+static void do_write_test(const char *path, const char *val)
+{
+    char *msg;
+
+    printk("Write %s to %s...\n", val, path);
+    msg = xenbus_write(XBT_NIL, path, val);
+    if ( msg )
+    {
+        printk("Result %s\n", msg);
+        free(msg);
+    }
+    else
+        printk("Success.\n");
+}
+
+static void do_rm_test(const char *path)
+{
+    char *msg;
+
+    printk("rm %s...\n", path);
+    msg = xenbus_rm(XBT_NIL, path);
+    if ( msg )
+    {
+        printk("Result %s\n", msg);
+        free(msg);
+    }
+    else
+        printk("Success.\n");
+}
 
 static void xenbus_tester(void *p)
 {
-    test_xenbus();
+    printk("Doing xenbus test.\n");
+    xenbus_debug_msg("Testing xenbus...\n");
+
+    printk("Doing ls test.\n");
+    do_ls_test("device");
+    do_ls_test("device/vif");
+    do_ls_test("device/vif/0");
+
+    printk("Doing read test.\n");
+    do_read_test("device/vif/0/mac");
+    do_read_test("device/vif/0/backend");
+
+    printk("Doing write test.\n");
+    do_write_test("device/vif/0/flibble", "flobble");
+    do_read_test("device/vif/0/flibble");
+    do_write_test("device/vif/0/flibble", "widget");
+    do_read_test("device/vif/0/flibble");
+
+    printk("Doing rm test.\n");
+    do_rm_test("device/vif/0/flibble");
+    do_read_test("device/vif/0/flibble");
+    printk("(Should have said ENOENT)\n");
 }
 #endif
 
diff --git a/xenbus.c b/xenbus.c
index aa1fe7bf..81e9b65d 100644
--- a/xenbus.c
+++ b/xenbus.c
@@ -964,119 +964,6 @@ domid_t xenbus_get_self_id(void)
     return ret;
 }
 
-#ifdef CONFIG_TEST
-/* Send a debug message to xenbus.  Can block. */
-static void xenbus_debug_msg(const char *msg)
-{
-    int len = strlen(msg);
-    struct write_req req[] = {
-        { "print", sizeof("print") },
-        { msg, len },
-        { "", 1 }};
-    struct xsd_sockmsg *reply;
-
-    reply = xenbus_msg_reply(XS_DEBUG, 0, req, ARRAY_SIZE(req));
-    printk("Got a reply, type %d, id %d, len %d.\n",
-           reply->type, reply->req_id, reply->len);
-}
-
-static void do_ls_test(const char *pre)
-{
-    char **dirs, *msg;
-    int x;
-
-    printk("ls %s...\n", pre);
-    msg = xenbus_ls(XBT_NIL, pre, &dirs);
-    if ( msg )
-    {
-        printk("Error in xenbus ls: %s\n", msg);
-        free(msg);
-        return;
-    }
-
-    for ( x = 0; dirs[x]; x++ )
-    {
-        printk("ls %s[%d] -> %s\n", pre, x, dirs[x]);
-        free(dirs[x]);
-    }
-
-    free(dirs);
-}
-
-static void do_read_test(const char *path)
-{
-    char *res, *msg;
-
-    printk("Read %s...\n", path);
-    msg = xenbus_read(XBT_NIL, path, &res);
-    if ( msg )
-    {
-        printk("Error in xenbus read: %s\n", msg);
-        free(msg);
-        return;
-    }
-    printk("Read %s -> %s.\n", path, res);
-    free(res);
-}
-
-static void do_write_test(const char *path, const char *val)
-{
-    char *msg;
-
-    printk("Write %s to %s...\n", val, path);
-    msg = xenbus_write(XBT_NIL, path, val);
-    if ( msg )
-    {
-        printk("Result %s\n", msg);
-        free(msg);
-    }
-    else
-        printk("Success.\n");
-}
-
-static void do_rm_test(const char *path)
-{
-    char *msg;
-
-    printk("rm %s...\n", path);
-    msg = xenbus_rm(XBT_NIL, path);
-    if ( msg )
-    {
-        printk("Result %s\n", msg);
-        free(msg);
-    }
-    else
-        printk("Success.\n");
-}
-
-/* Simple testing thing */
-void test_xenbus(void)
-{
-    printk("Doing xenbus test.\n");
-    xenbus_debug_msg("Testing xenbus...\n");
-
-    printk("Doing ls test.\n");
-    do_ls_test("device");
-    do_ls_test("device/vif");
-    do_ls_test("device/vif/0");
-
-    printk("Doing read test.\n");
-    do_read_test("device/vif/0/mac");
-    do_read_test("device/vif/0/backend");
-
-    printk("Doing write test.\n");
-    do_write_test("device/vif/0/flibble", "flobble");
-    do_read_test("device/vif/0/flibble");
-    do_write_test("device/vif/0/flibble", "widget");
-    do_read_test("device/vif/0/flibble");
-
-    printk("Doing rm test.\n");
-    do_rm_test("device/vif/0/flibble");
-    do_read_test("device/vif/0/flibble");
-    printk("(Should have said ENOENT)\n");
-}
-#endif /* CONFIG_TEST */
-
 /*
  * Local variables:
  * mode: C
-- 
2.35.3



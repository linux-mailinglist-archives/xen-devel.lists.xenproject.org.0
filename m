Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 889F33EEA5C
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 11:56:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167685.306111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFvoX-0007VB-7l; Tue, 17 Aug 2021 09:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167685.306111; Tue, 17 Aug 2021 09:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFvoX-0007P1-3d; Tue, 17 Aug 2021 09:55:21 +0000
Received: by outflank-mailman (input) for mailman id 167685;
 Tue, 17 Aug 2021 09:55:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OoW9=NI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mFvoV-0007Ha-Vk
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 09:55:20 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc6e5109-a177-46dc-a90c-ea52122590ff;
 Tue, 17 Aug 2021 09:55:13 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B6B801FF2C;
 Tue, 17 Aug 2021 09:55:12 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 87BC413318;
 Tue, 17 Aug 2021 09:55:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id sMCmH4CHG2FEDwAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 17 Aug 2021 09:55:12 +0000
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
X-Inumbo-ID: cc6e5109-a177-46dc-a90c-ea52122590ff
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629194112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6C/kYgeCHpbmW4aQY5wUhjgZzqJkvYkEyqUXd4wWzEM=;
	b=igvi9mJDRgK1cbndd4mDIjnvgEhYsOX4p+oW4RPNh9dShzPROZgiHXE8ZdmCU2LEu4KX+/
	9wsBiSuZUrDjQi8wk2z8j92kBhsuhkez5CwmKlbUBYouV1vTKI/Mg8MIaR0uR5G9PqnyA4
	T7dqfBuXC0kNSS/L+cwCA1lU84l1Fh4=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/2] mini-os: move test functions under CONFIG_TEST
Date: Tue, 17 Aug 2021 11:54:59 +0200
Message-Id: <20210817095459.27671-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210817095459.27671-1-jgross@suse.com>
References: <20210817095459.27671-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to have the xenbus test support functions always
included in Mini-OS. Move them inside #ifdef CONFIG_TEST.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xenbus/xenbus.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/xenbus/xenbus.c b/xenbus/xenbus.c
index fdb0934..11427ba 100644
--- a/xenbus/xenbus.c
+++ b/xenbus/xenbus.c
@@ -573,21 +573,6 @@ static char *errmsg(struct xsd_sockmsg *rep)
     return res;
 }
 
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
-            reply->type, reply->req_id, reply->len);
-}
-
 /* List the contents of a directory.  Returns a malloc()ed array of
    pointers to malloc()ed strings.  The array is NULL terminated.  May
    block. */
@@ -882,6 +867,22 @@ domid_t xenbus_get_self_id(void)
     return ret;
 }
 
+#ifdef CONFIG_TEST
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
+            reply->type, reply->req_id, reply->len);
+}
+
 static void do_ls_test(const char *pre)
 {
     char **dirs, *msg;
@@ -968,6 +969,7 @@ void test_xenbus(void)
     do_read_test("device/vif/0/flibble");
     printk("(Should have said ENOENT)\n");
 }
+#endif /* CONFIG_TEST */
 
 /*
  * Local variables:
-- 
2.26.2



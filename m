Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D557F9DC5
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:39:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641885.1000870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Z1h-00022E-Px; Mon, 27 Nov 2023 10:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641885.1000870; Mon, 27 Nov 2023 10:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Z1h-0001uE-KO; Mon, 27 Nov 2023 10:39:41 +0000
Received: by outflank-mailman (input) for mailman id 641885;
 Mon, 27 Nov 2023 10:39:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7Yqh-0000Co-34
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:28:19 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad8b86c7-8d0f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 11:28:17 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D71B321A5E;
 Mon, 27 Nov 2023 10:28:16 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id AE454132A6;
 Mon, 27 Nov 2023 10:28:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id PWFQKUBvZGVRfwAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 27 Nov 2023 10:28:16 +0000
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
X-Inumbo-ID: ad8b86c7-8d0f-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701080896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g73YDIOfg+fr6DHKGm3oVeWr7gfJUQ0OIPzwFoMgOy0=;
	b=Idyyl2HRFHkHp4suzKoMv9lJBrLRoW23tRNrqihml85WGwhHTe9CvZhWKtkCN0MVe9ClQk
	XzfJbcpKHtuBA1UEsjIOnLLRHuRvcGupPRhOiZode3VvP7+Wb9646ItqQgt+C8aoRSDnYp
	dz8VnO5G7Sarjd/OuOXGKhZHb9+eQXE=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 31/32] Mini-OS: add EXPORT_SYMBOL() instances to xenbus.c
Date: Mon, 27 Nov 2023 11:25:22 +0100
Message-Id: <20231127102523.28003-32-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231127102523.28003-1-jgross@suse.com>
References: <20231127102523.28003-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ****************
X-Spam-Score: 16.50
X-Spamd-Result: default: False [16.50 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(5.10)[99.99%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_SPAM_SHORT(3.00)[1.000];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Add the needed instances of EXPORT_SYMBOL() to xenbus.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 xenbus.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/xenbus.c b/xenbus.c
index 8bfd5bd4..eb9af055 100644
--- a/xenbus.c
+++ b/xenbus.c
@@ -123,6 +123,7 @@ char **xenbus_wait_for_watch_return(xenbus_event_queue *queue)
 
     return &event->path;
 }
+EXPORT_SYMBOL(xenbus_wait_for_watch_return);
 
 void xenbus_wait_for_watch(xenbus_event_queue *queue)
 {
@@ -136,6 +137,7 @@ void xenbus_wait_for_watch(xenbus_event_queue *queue)
     else
         printk("unexpected path returned by watch\n");
 }
+EXPORT_SYMBOL(xenbus_wait_for_watch);
 
 void xenbus_release_wait_for_watch(xenbus_event_queue *queue)
 {
@@ -145,6 +147,7 @@ void xenbus_release_wait_for_watch(xenbus_event_queue *queue)
     *queue = event;
     wake_up(&xenbus_watch_queue);
 }
+EXPORT_SYMBOL(xenbus_release_wait_for_watch);
 
 char *xenbus_wait_for_value(const char *path, const char *value,
                             xenbus_event_queue *queue)
@@ -170,6 +173,7 @@ char *xenbus_wait_for_value(const char *path, const char *value,
         xenbus_wait_for_watch(queue);
     }
 }
+EXPORT_SYMBOL(xenbus_wait_for_value);
 
 char *xenbus_switch_state(xenbus_transaction_t xbt, const char *path,
                           XenbusState state)
@@ -220,6 +224,7 @@ exit:
 
     return msg;
 }
+EXPORT_SYMBOL(xenbus_switch_state);
 
 char *xenbus_wait_for_state_change(const char *path, XenbusState *state,
                                    xenbus_event_queue *queue)
@@ -249,6 +254,7 @@ char *xenbus_wait_for_state_change(const char *path, XenbusState *state,
     }
     return NULL;
 }
+EXPORT_SYMBOL(xenbus_wait_for_state_change);
 
 static void xenbus_read_data(char *buf, unsigned int len)
 {
@@ -602,6 +608,7 @@ struct xsd_sockmsg *xenbus_msg_reply(int type, xenbus_transaction_t trans,
 
     return rep;
 }
+EXPORT_SYMBOL(xenbus_msg_reply);
 
 static char *errmsg(struct xsd_sockmsg *rep)
 {
@@ -664,6 +671,7 @@ char *xenbus_ls(xenbus_transaction_t xbt, const char *pre, char ***contents)
 
     return NULL;
 }
+EXPORT_SYMBOL(xenbus_ls);
 
 char *xenbus_read(xenbus_transaction_t xbt, const char *path, char **value)
 {
@@ -687,6 +695,7 @@ char *xenbus_read(xenbus_transaction_t xbt, const char *path, char **value)
 
     return NULL;
 }
+EXPORT_SYMBOL(xenbus_read);
 
 char *xenbus_write(xenbus_transaction_t xbt, const char *path,
                    const char *value)
@@ -707,6 +716,7 @@ char *xenbus_write(xenbus_transaction_t xbt, const char *path,
 
     return NULL;
 }
+EXPORT_SYMBOL(xenbus_write);
 
 char* xenbus_watch_path_token(xenbus_transaction_t xbt, const char *path,
                               const char *token, xenbus_event_queue *events)
@@ -738,6 +748,7 @@ char* xenbus_watch_path_token(xenbus_transaction_t xbt, const char *path,
 
     return NULL;
 }
+EXPORT_SYMBOL(xenbus_watch_path_token);
 
 char* xenbus_unwatch_path_token(xenbus_transaction_t xbt, const char *path,
                                 const char *token)
@@ -771,6 +782,7 @@ char* xenbus_unwatch_path_token(xenbus_transaction_t xbt, const char *path,
 
     return NULL;
 }
+EXPORT_SYMBOL(xenbus_unwatch_path_token);
 
 char *xenbus_rm(xenbus_transaction_t xbt, const char *path)
 {
@@ -787,6 +799,7 @@ char *xenbus_rm(xenbus_transaction_t xbt, const char *path)
 
     return NULL;
 }
+EXPORT_SYMBOL(xenbus_rm);
 
 char *xenbus_get_perms(xenbus_transaction_t xbt, const char *path, char **value)
 {
@@ -810,6 +823,7 @@ char *xenbus_get_perms(xenbus_transaction_t xbt, const char *path, char **value)
 
     return NULL;
 }
+EXPORT_SYMBOL(xenbus_get_perms);
 
 #define PERM_MAX_SIZE 32
 char *xenbus_set_perms(xenbus_transaction_t xbt, const char *path, domid_t dom,
@@ -834,6 +848,7 @@ char *xenbus_set_perms(xenbus_transaction_t xbt, const char *path, domid_t dom,
 
     return NULL;
 }
+EXPORT_SYMBOL(xenbus_set_perms);
 
 char *xenbus_transaction_start(xenbus_transaction_t *xbt)
 {
@@ -855,6 +870,7 @@ char *xenbus_transaction_start(xenbus_transaction_t *xbt)
 
     return NULL;
 }
+EXPORT_SYMBOL(xenbus_transaction_start);
 
 char *xenbus_transaction_end(xenbus_transaction_t t, int abort, int *retry)
 {
@@ -883,6 +899,7 @@ char *xenbus_transaction_end(xenbus_transaction_t t, int abort, int *retry)
 
     return NULL;
 }
+EXPORT_SYMBOL(xenbus_transaction_end);
 
 int xenbus_read_integer(const char *path)
 {
@@ -902,6 +919,7 @@ int xenbus_read_integer(const char *path)
 
     return t;
 }
+EXPORT_SYMBOL(xenbus_read_integer);
 
 int xenbus_read_uuid(const char *path, unsigned char uuid[16])
 {
@@ -935,6 +953,7 @@ int xenbus_read_uuid(const char *path, unsigned char uuid[16])
 
     return 1;
 }
+EXPORT_SYMBOL(xenbus_read_uuid);
 
 #define BUFFER_SIZE 256
 static void xenbus_build_path(const char *dir, const char *node, char *res)
@@ -957,6 +976,7 @@ char *xenbus_printf(xenbus_transaction_t xbt, const char* node,
 
     return xenbus_write(xbt,fullpath,val);
 }
+EXPORT_SYMBOL(xenbus_printf);
 
 domid_t xenbus_get_self_id(void)
 {
@@ -968,6 +988,7 @@ domid_t xenbus_get_self_id(void)
 
     return ret;
 }
+EXPORT_SYMBOL(xenbus_get_self_id);
 
 char *xenbus_read_string(xenbus_transaction_t xbt, const char *dir,
                          const char *node, char **value)
@@ -978,6 +999,7 @@ char *xenbus_read_string(xenbus_transaction_t xbt, const char *dir,
 
     return xenbus_read(xbt, path, value);
 }
+EXPORT_SYMBOL(xenbus_read_string);
 
 char *xenbus_read_unsigned(xenbus_transaction_t xbt, const char *dir,
                            const char *node, unsigned int *value)
@@ -997,6 +1019,7 @@ char *xenbus_read_unsigned(xenbus_transaction_t xbt, const char *dir,
 
     return msg;
 }
+EXPORT_SYMBOL(xenbus_read_unsigned);
 
 /*
  * Local variables:
-- 
2.35.3



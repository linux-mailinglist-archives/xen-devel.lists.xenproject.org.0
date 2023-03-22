Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A1E6C4429
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 08:35:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513127.793686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peszw-0005Ql-LW; Wed, 22 Mar 2023 07:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513127.793686; Wed, 22 Mar 2023 07:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peszw-0005Nw-HZ; Wed, 22 Mar 2023 07:35:04 +0000
Received: by outflank-mailman (input) for mailman id 513127;
 Wed, 22 Mar 2023 07:35:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+B1I=7O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1peszu-000573-7W
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 07:35:02 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0df7312a-c884-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 08:35:01 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4AF9F3382B;
 Wed, 22 Mar 2023 07:35:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1EF4F13416;
 Wed, 22 Mar 2023 07:35:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id J7kgBqWvGmTEDAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Mar 2023 07:35:01 +0000
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
X-Inumbo-ID: 0df7312a-c884-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679470501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AqAAdYJutUgTcEYFEIRv9pmaALr54jUwXPZoDBAn7a8=;
	b=CTdafhiVTPmrVvUOTaP2NF+U9FyVdDyicV/O/GOQlLl6N/a+ehThQKDPeGdZfTFxhb0XCA
	rPlDs1bFBdAoSfgLomKOp3giYMwtvwrrJZnwXjr6QqWJNKwDDxUTIxoZkB+YUrU/sHiHW0
	OKa1tHP5Vkin19FujDOmlmTDowaUtyw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v2 1/3] tools/xl: allow split_string_into_pair() to trim values
Date: Wed, 22 Mar 2023 08:34:51 +0100
Message-Id: <20230322073453.7853-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230322073453.7853-1-jgross@suse.com>
References: <20230322073453.7853-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most use cases of split_string_into_pair() are requiring the returned
strings to be white space trimmed.

In order to avoid the same code pattern multiple times, add a predicate
parameter to split_string_into_pair() which can be specified to call
trim() with that predicate for the string pair returned. Specifying
NULL for the predicate will avoid the call of trim().

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/xl/xl_parse.c | 42 +++++++++++++++++++-----------------------
 tools/xl/xl_parse.h |  4 ++--
 2 files changed, 21 insertions(+), 25 deletions(-)

diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index e344d4fda3..0e1b6907fa 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -646,7 +646,7 @@ static void parse_vnuma_config(const XLU_Config *config,
              conf_count++) {
 
             if (xlu_cfg_value_type(conf_option) == XLU_STRING) {
-                char *buf, *option_untrimmed, *value_untrimmed;
+                char *buf;
                 char *option, *value;
                 unsigned long val;
 
@@ -654,15 +654,12 @@ static void parse_vnuma_config(const XLU_Config *config,
 
                 if (!buf) continue;
 
-                if (split_string_into_pair(buf, "=",
-                                           &option_untrimmed,
-                                           &value_untrimmed)) {
+                if (split_string_into_pair(buf, "=", &option, &value,
+                                           isspace)) {
                     fprintf(stderr, "xl: failed to split \"%s\" into pair\n",
                             buf);
                     exit(EXIT_FAILURE);
                 }
-                trim(isspace, option_untrimmed, &option);
-                trim(isspace, value_untrimmed, &value);
 
                 if (!strcmp("pnode", option)) {
                     val = parse_ulong(value);
@@ -715,8 +712,6 @@ static void parse_vnuma_config(const XLU_Config *config,
                 }
                 free(option);
                 free(value);
-                free(option_untrimmed);
-                free(value_untrimmed);
             }
         }
     }
@@ -838,7 +833,7 @@ int parse_vdispl_config(libxl_device_vdispl *vdispl, char *token)
 
             rc = split_string_into_pair(connectors[i], ":",
                                         &vdispl->connectors[i].unique_id,
-                                        &resolution);
+                                        &resolution, NULL);
 
             rc= sscanf(resolution, "%ux%u", &vdispl->connectors[i].width,
                        &vdispl->connectors[i].height);
@@ -2361,18 +2356,15 @@ void parse_config_data(const char *config_source,
             split_string_into_string_list(buf, ",", &pairs);
             len = libxl_string_list_length(&pairs);
             for (i = 0; i < len; i++) {
-                char *key, *key_untrimmed, *value, *value_untrimmed;
+                char *key, *value;
                 int rc;
-                rc = split_string_into_pair(pairs[i], "=",
-                                            &key_untrimmed,
-                                            &value_untrimmed);
+                rc = split_string_into_pair(pairs[i], "=", &key, &value,
+                                            isspace);
                 if (rc != 0) {
                     fprintf(stderr, "failed to parse channel configuration: %s",
                             pairs[i]);
                     exit(1);
                 }
-                trim(isspace, key_untrimmed, &key);
-                trim(isspace, value_untrimmed, &value);
 
                 if (!strcmp(key, "backend")) {
                     replace_string(&chn->backend_domname, value);
@@ -2395,9 +2387,7 @@ void parse_config_data(const char *config_source,
                                   " ignoring\n", key);
                 }
                 free(key);
-                free(key_untrimmed);
                 free(value);
-                free(value_untrimmed);
             }
             switch (chn->connection) {
             case LIBXL_CHANNEL_CONNECTION_UNKNOWN:
@@ -3021,10 +3011,8 @@ void trim(char_predicate_t predicate, const char *input, char **output)
     *output = result;
 }
 
-int split_string_into_pair(const char *str,
-                           const char *delim,
-                           char **a,
-                           char **b)
+int split_string_into_pair(const char *str, const char *delim,
+                           char **a, char **b, char_predicate_t predicate)
 {
     char *s, *p, *saveptr, *aa = NULL, *bb = NULL;
     int rc = 0;
@@ -3036,13 +3024,21 @@ int split_string_into_pair(const char *str,
         rc = ERROR_INVAL;
         goto out;
     }
-    aa = xstrdup(p);
+    if (predicate) {
+        trim(predicate, p, &aa);
+    } else {
+        aa = xstrdup(p);
+    }
     p = strtok_r(NULL, delim, &saveptr);
     if (p == NULL) {
         rc = ERROR_INVAL;
         goto out;
     }
-    bb = xstrdup(p);
+    if (predicate) {
+        trim(predicate, p, &bb);
+    } else {
+        bb = xstrdup(p);
+    }
 
     *a = aa;
     aa = NULL;
diff --git a/tools/xl/xl_parse.h b/tools/xl/xl_parse.h
index bab2861f8c..ab35c68545 100644
--- a/tools/xl/xl_parse.h
+++ b/tools/xl/xl_parse.h
@@ -45,14 +45,14 @@ int match_option_size(const char *prefix, size_t len,
 
 void split_string_into_string_list(const char *str, const char *delim,
                                    libxl_string_list *psl);
-int split_string_into_pair(const char *str, const char *delim,
-                           char **a, char **b);
 void replace_string(char **str, const char *val);
 
 /* NB: this follows the interface used by <ctype.h>. See 'man 3 ctype'
    and look for CTYPE in libxl_internal.h */
 typedef int (*char_predicate_t)(const int c);
 void trim(char_predicate_t predicate, const char *input, char **output);
+int split_string_into_pair(const char *str, const char *delim,
+                           char **a, char **b, char_predicate_t predicate);
 
 const char *get_action_on_shutdown_name(libxl_action_on_shutdown a);
 
-- 
2.35.3



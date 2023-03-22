Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 747D76C442A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 08:35:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513128.793696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pet02-0005ky-2h; Wed, 22 Mar 2023 07:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513128.793696; Wed, 22 Mar 2023 07:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pet01-0005hi-Um; Wed, 22 Mar 2023 07:35:09 +0000
Received: by outflank-mailman (input) for mailman id 513128;
 Wed, 22 Mar 2023 07:35:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+B1I=7O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pet01-0005gx-3U
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 07:35:09 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 114a09b7-c884-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 08:35:07 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DCB153382B;
 Wed, 22 Mar 2023 07:35:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B203213416;
 Wed, 22 Mar 2023 07:35:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GfwsKqqvGmTjDAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Mar 2023 07:35:06 +0000
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
X-Inumbo-ID: 114a09b7-c884-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679470506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PjEAqwHz5FepjmHP5AZRztMb7s0s81/7SZNZzGRzni4=;
	b=kMnWicPXpJAwWrrs9WAMz4UHTp3PAb4d7RziXIiG4P26B7NNtfYQsxzWuR67XpgxUPHgTY
	ftqaxULJLGd1CBtetv4Lp4jHJn+kxLV41WbopvhUE/1hy3/cWZ0o4Ji2B4krDmFC78lNDL
	e8tIVhtXbopql16JAsw6JdkGwG7cqX4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 2/3] tools/xl: make split_string_into_pair() more usable
Date: Wed, 22 Mar 2023 08:34:52 +0100
Message-Id: <20230322073453.7853-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230322073453.7853-1-jgross@suse.com>
References: <20230322073453.7853-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today split_string_into_pair() will not really do what its name is
suggesting: instead of splitting a string into a pair of strings using
a delimiter, it will return the first two strings of the initial string
by using the delimiter.

This is never what the callers want, so modify split_string_into_pair()
to split the string only at the first delimiter found, resulting in
something like "x=a=b" to be split into "x" and "a=b" when being called
with "=" as the delimiter. Today the returned strings would be "x" and
"a".

At the same time switch the delimiter from "const char *" (allowing
multiple delimiter characters) to "char" (a single character only), as
this makes the function more simple without breaking any use cases.

Suggested-by: Anthony PERARD <anthony.perard@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 tools/xl/xl_parse.c | 23 ++++++++++++-----------
 tools/xl/xl_parse.h |  4 ++--
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 0e1b6907fa..09cabd2732 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -654,7 +654,7 @@ static void parse_vnuma_config(const XLU_Config *config,
 
                 if (!buf) continue;
 
-                if (split_string_into_pair(buf, "=", &option, &value,
+                if (split_string_into_pair(buf, '=', &option, &value,
                                            isspace)) {
                     fprintf(stderr, "xl: failed to split \"%s\" into pair\n",
                             buf);
@@ -831,7 +831,7 @@ int parse_vdispl_config(libxl_device_vdispl *vdispl, char *token)
         {
             char *resolution;
 
-            rc = split_string_into_pair(connectors[i], ":",
+            rc = split_string_into_pair(connectors[i], ':',
                                         &vdispl->connectors[i].unique_id,
                                         &resolution, NULL);
 
@@ -2358,7 +2358,7 @@ void parse_config_data(const char *config_source,
             for (i = 0; i < len; i++) {
                 char *key, *value;
                 int rc;
-                rc = split_string_into_pair(pairs[i], "=", &key, &value,
+                rc = split_string_into_pair(pairs[i], '=', &key, &value,
                                             isspace);
                 if (rc != 0) {
                     fprintf(stderr, "failed to parse channel configuration: %s",
@@ -3011,26 +3011,27 @@ void trim(char_predicate_t predicate, const char *input, char **output)
     *output = result;
 }
 
-int split_string_into_pair(const char *str, const char *delim,
-                           char **a, char **b, char_predicate_t predicate)
+int split_string_into_pair(const char *str, char delim, char **a, char **b,
+                           char_predicate_t predicate)
 {
-    char *s, *p, *saveptr, *aa = NULL, *bb = NULL;
+    char *s, *p, *aa = NULL, *bb = NULL;
     int rc = 0;
 
     s = xstrdup(str);
 
-    p = strtok_r(s, delim, &saveptr);
+    p = strchr(s, delim);
     if (p == NULL) {
         rc = ERROR_INVAL;
         goto out;
     }
+    *p = 0;
     if (predicate) {
-        trim(predicate, p, &aa);
+        trim(predicate, s, &aa);
     } else {
-        aa = xstrdup(p);
+        aa = xstrdup(s);
     }
-    p = strtok_r(NULL, delim, &saveptr);
-    if (p == NULL) {
+    p++;
+    if (!*p) {
         rc = ERROR_INVAL;
         goto out;
     }
diff --git a/tools/xl/xl_parse.h b/tools/xl/xl_parse.h
index ab35c68545..fe0d586cdd 100644
--- a/tools/xl/xl_parse.h
+++ b/tools/xl/xl_parse.h
@@ -51,8 +51,8 @@ void replace_string(char **str, const char *val);
    and look for CTYPE in libxl_internal.h */
 typedef int (*char_predicate_t)(const int c);
 void trim(char_predicate_t predicate, const char *input, char **output);
-int split_string_into_pair(const char *str, const char *delim,
-                           char **a, char **b, char_predicate_t predicate);
+int split_string_into_pair(const char *str, char delim, char **a, char **b,
+                           char_predicate_t predicate);
 
 const char *get_action_on_shutdown_name(libxl_action_on_shutdown a);
 
-- 
2.35.3



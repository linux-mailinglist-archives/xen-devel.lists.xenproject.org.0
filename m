Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BED486C442B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 08:35:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513130.793705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pet08-0006Gb-94; Wed, 22 Mar 2023 07:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513130.793705; Wed, 22 Mar 2023 07:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pet08-0006EG-67; Wed, 22 Mar 2023 07:35:16 +0000
Received: by outflank-mailman (input) for mailman id 513130;
 Wed, 22 Mar 2023 07:35:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+B1I=7O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pet06-0005gx-8w
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 07:35:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 149c1540-c884-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 08:35:12 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 74BAF20AD9;
 Wed, 22 Mar 2023 07:35:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 49C1D13416;
 Wed, 22 Mar 2023 07:35:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 38WeELCvGmQADQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Mar 2023 07:35:12 +0000
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
X-Inumbo-ID: 149c1540-c884-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679470512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YtiGh+qpU8bhgvUDsffds7Kvt+PAjE83auDMMPS8CWk=;
	b=P5Qud/Y725woH3pW9dgAoEv14k/3mIDTXLzYKPLAUoUM51zWeOKRWCYLP1bWB1qNjwMHSW
	syd5fSWzdofh6iDNgstloR1u6sU6hwHdMk/j7P9sZpE1xC5/NM5aweDg9bfBS/K4YFymtj
	q+/WeYrgaf3I7EmNq0eGhpU24UNM630=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 3/3] tools/xl: rework p9 config parsing
Date: Wed, 22 Mar 2023 08:34:53 +0100
Message-Id: <20230322073453.7853-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230322073453.7853-1-jgross@suse.com>
References: <20230322073453.7853-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the config parsing of a p9 device to use the
split_string_into_pair() function instead of open coding it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- add libxl_string_list_dispose() call (Jason Andryuk)
---
 tools/xl/xl_parse.c | 74 ++++++++++++++++++++++-----------------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 09cabd2732..1f6f47daf4 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2180,54 +2180,54 @@ void parse_config_data(const char *config_source,
 
     if (!xlu_cfg_get_list(config, "p9", &p9devs, 0, 0)) {
         libxl_device_p9 *p9;
-        char *security_model = NULL;
-        char *path = NULL;
-        char *tag = NULL;
-        char *backend = NULL;
-        char *p, *p2, *buf2;
 
         d_config->num_p9s = 0;
         d_config->p9s = NULL;
         while ((buf = xlu_cfg_get_listitem (p9devs, d_config->num_p9s)) != NULL) {
+            libxl_string_list pairs;
+            int len;
+
             p9 = ARRAY_EXTEND_INIT(d_config->p9s,
                                    d_config->num_p9s,
                                    libxl_device_p9_init);
             libxl_device_p9_init(p9);
 
-            buf2 = strdup(buf);
-            p = strtok(buf2, ",");
-            if(p) {
-               do {
-                  while(*p == ' ')
-                     ++p;
-                  if ((p2 = strchr(p, '=')) == NULL)
-                     break;
-                  *p2 = '\0';
-                  if (!strcmp(p, "security_model")) {
-                     security_model = strdup(p2 + 1);
-                  } else if(!strcmp(p, "path")) {
-                     path = strdup(p2 + 1);
-                  } else if(!strcmp(p, "tag")) {
-                     tag = strdup(p2 + 1);
-                  } else if(!strcmp(p, "backend")) {
-                     backend = strdup(p2 + 1);
-                  } else {
-                     fprintf(stderr, "Unknown string `%s' in 9pfs spec\n", p);
-                     exit(1);
-                  }
-               } while ((p = strtok(NULL, ",")) != NULL);
-            }
-            if (!path || !security_model || !tag) {
-               fprintf(stderr, "9pfs spec missing required field!\n");
-               exit(1);
+            split_string_into_string_list(buf, ",", &pairs);
+            len = libxl_string_list_length(&pairs);
+            for (i = 0; i < len; i++) {
+                char *key, *value;
+                int rc;
+
+                rc = split_string_into_pair(pairs[i], '=', &key, &value,
+                                            isspace);
+                if (rc != 0) {
+                    fprintf(stderr, "failed to parse 9pfs configuration: %s",
+                            pairs[i]);
+                    exit(1);
+                }
+
+                if (!strcmp(key, "security_model")) {
+                    replace_string(&p9->security_model, value);
+                } else if (!strcmp(key, "path")) {
+                    replace_string(&p9->path, value);
+                } else if (!strcmp(key, "tag")) {
+                    replace_string(&p9->tag, value);
+                } else if (!strcmp(key, "backend")) {
+                    replace_string(&p9->backend_domname, value);
+                } else {
+                    fprintf(stderr, "Unknown 9pfs parameter '%s'\n", key);
+                    exit(1);
+                }
+                free(key);
+                free(value);
             }
-            free(buf2);
 
-            replace_string(&p9->tag, tag);
-            replace_string(&p9->security_model, security_model);
-            replace_string(&p9->path, path);
-            if (backend)
-                    replace_string(&p9->backend_domname, backend);
+            libxl_string_list_dispose(&pairs);
+
+            if (!p9->path || !p9->security_model || !p9->tag) {
+                fprintf(stderr, "9pfs spec missing required field!\n");
+                exit(1);
+            }
         }
     }
 
-- 
2.35.3



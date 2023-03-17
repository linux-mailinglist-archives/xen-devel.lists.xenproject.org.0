Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A996BE7CD
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 12:16:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511018.789734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd842-0000V7-EM; Fri, 17 Mar 2023 11:16:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511018.789734; Fri, 17 Mar 2023 11:16:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd842-0000Rr-B8; Fri, 17 Mar 2023 11:16:02 +0000
Received: by outflank-mailman (input) for mailman id 511018;
 Fri, 17 Mar 2023 11:16:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hL2n=7J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pd841-00008J-Gl
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 11:16:01 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18da0016-c4b5-11ed-87f5-c1b5be75604c;
 Fri, 17 Mar 2023 12:16:00 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 415B41FDDC;
 Fri, 17 Mar 2023 11:16:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 196D313428;
 Fri, 17 Mar 2023 11:16:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ftXABPBLFGTuCwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 17 Mar 2023 11:16:00 +0000
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
X-Inumbo-ID: 18da0016-c4b5-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679051760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wmNIXjSB6eN0Fkt4tu8jyil8pAFIy60BJceiR3NCVVU=;
	b=UAs4qU9uSRVHyOnB1nwekwXirgg1ajAOBOa3flPRDWp4mKttLBxIXn3RaUflgqlQfxL4d7
	AViNMIszWpeZHWFOlrsWcxg/KFhsk8OmMPbYXnKqwQTBZtGCEXfLHf7ywvcRgvHc6aFqqK
	uhNSKdxKhIRaePT241fqQjz2HQJUoAo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 2/2] tools/xl: rework p9 config parsing
Date: Fri, 17 Mar 2023 12:15:46 +0100
Message-Id: <20230317111546.18061-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230317111546.18061-1-jgross@suse.com>
References: <20230317111546.18061-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the config parsing of a p9 device to use the
split_string_into_pair() function instead of open coding it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xl/xl_parse.c | 72 ++++++++++++++++++++++-----------------------
 1 file changed, 35 insertions(+), 37 deletions(-)

diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 2f9dfea05c..715e14f95f 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2111,54 +2111,52 @@ void parse_config_data(const char *config_source,
 
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
+                rc = split_string_into_pair(pairs[i], "=", &key, &value,
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
+            if (!p9->path || !p9->security_model || !p9->tag) {
+                fprintf(stderr, "9pfs spec missing required field!\n");
+                exit(1);
+            }
         }
     }
 
-- 
2.35.3



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B749855AE5
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 07:59:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681281.1060022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raVi7-0001X3-AJ; Thu, 15 Feb 2024 06:59:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681281.1060022; Thu, 15 Feb 2024 06:59:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raVi7-0001Uw-6b; Thu, 15 Feb 2024 06:59:07 +0000
Received: by outflank-mailman (input) for mailman id 681281;
 Thu, 15 Feb 2024 06:59:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4buu=JY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1raVgD-0003NA-Hr
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 06:57:09 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6faa9a00-cbcf-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 07:57:08 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7EB0421DA6;
 Thu, 15 Feb 2024 06:57:08 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 4DC381346A;
 Thu, 15 Feb 2024 06:57:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id bAWLEcS1zWWKSQAAn2gu4w
 (envelope-from <jgross@suse.com>); Thu, 15 Feb 2024 06:57:08 +0000
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
X-Inumbo-ID: 6faa9a00-cbcf-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707980228; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RvgJykXrxBqZTlWS0F7IlE2o6lxF6w2XfzGIljjECLU=;
	b=VEYyLXGZts5i286cp136sufUGMTjF85yd5/sEv9MCLKNryZE8UrVW4I9koQ/nlQIzYvqW8
	Bs+PPerXyimJjA/QxpK1Xl0SvqGVPIIBH92Vo5UKFPS+mO/Kw8Eypz3dSJd/bfbZzVWsd3
	tPmfexS31tbN4tGmih3GLj/WJH/7SOY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707980228; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RvgJykXrxBqZTlWS0F7IlE2o6lxF6w2XfzGIljjECLU=;
	b=VEYyLXGZts5i286cp136sufUGMTjF85yd5/sEv9MCLKNryZE8UrVW4I9koQ/nlQIzYvqW8
	Bs+PPerXyimJjA/QxpK1Xl0SvqGVPIIBH92Vo5UKFPS+mO/Kw8Eypz3dSJd/bfbZzVWsd3
	tPmfexS31tbN4tGmih3GLj/WJH/7SOY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v6 15/21] tools/xl: support new 9pfs backend xen_9pfsd
Date: Thu, 15 Feb 2024 07:55:35 +0100
Message-Id: <20240215065541.21067-16-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240215065541.21067-1-jgross@suse.com>
References: <20240215065541.21067-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=VEYyLXGZ
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.49 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[suse.com,xen.org,citrix.com,gmail.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 0.49
X-Rspamd-Queue-Id: 7EB0421DA6
X-Spam-Flag: NO

Add support for the new 9pfs backend "xen_9pfsd". For this backend type
the tag defaults to "Xen" and the host side path to
"/var/log/xen/guests/<dom-name>".

Do most of the default settings in libxl. Unfortunately the default
path can't easily be set in libxl, as the domain name isn't available
in the related 9pfs specific function.

Settings the defaults in libxl requires to move the sanity checking
of 9pfs parameters from xl to libxl, too.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
V2:
- test max_files and max_open_files, too (Jason Andryuk)
V4:
- fix man page to use the "xen_9pfsd" type due to idl limitation
  (Jason Andryuk)
- set (most of) the defaults in libxl (Anthony Perard)
---
 docs/man/xl.cfg.5.pod.in      | 36 +++++++++++++++++++++++++++++++++--
 tools/libs/light/libxl_9pfs.c | 18 ++++++++++++++++++
 tools/xl/xl_parse.c           | 23 +++++++++++++++++++---
 3 files changed, 72 insertions(+), 5 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index ea8d41727d..039e057318 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -772,10 +772,16 @@ settings, from the following list:
 
 =over 4
 
+=item B<type=TYPE>
+
+The backendtype for the PV device. Supported values are B<qemu> and
+B<xen_9pfsd>.  The default is B<qemu>.
+
 =item B<tag=STRING>
 
 9pfs tag to identify the filesystem share. The tag is needed on the
-guest side to mount it.
+guest side to mount it. For the backendtype of B<xen_9pfsd> the tag defaults to
+"Xen".
 
 =item B<security_model="none">
 
@@ -785,12 +791,38 @@ squash or remap).
 
 =item B<path=STRING>
 
-Filesystem path on the backend to export.
+Filesystem path on the backend to export. For the backendtype of B<xen_9pfsd>
+the path defaults to "@XEN_LOG_DIR@/guests/<guest-name>".
 
 =item B<backend=domain-id>
 
 Specify the backend domain name or id, defaults to dom0.
 
+=item B<max-files=NUMBER>
+
+Specify the maximum number of files below B<path>. A value of 0 (which
+is the default) doesn't limit the number of files. Only valid for
+B<type=xen_9pfsd>.
+
+=item B<max-open-files=NUMBER>
+
+Specify the maximum number of concurrently opened files below B<path>.
+Multiple opens of the same file are counted individually. Only valid for
+B<type=xen_9pfsd>, which has a default of B<max-open-files=5>.
+
+=item B<max-space=NUMBER>
+
+Specify the maximum used disk space in MiB below B<path>. A value of 0 (which
+is the default) doesn't limit the usable disk space. Only valid for
+B<type=xen_9pfsd>.
+
+=item B<auto-delete=BOOLEAN>
+
+When set the backend will delete the oldest file which is currently not
+opened by the guest in case the disk space limit set via B<max-space> or the
+file limit set via B<max-files> is being reached. Only valid for
+B<type=xen_9pfsd>.
+
 =back
 
 =item B<pvcalls=[ "backend=domain-id", ... ]>
diff --git a/tools/libs/light/libxl_9pfs.c b/tools/libs/light/libxl_9pfs.c
index 900c0d46a0..ddeb4f20a7 100644
--- a/tools/libs/light/libxl_9pfs.c
+++ b/tools/libs/light/libxl_9pfs.c
@@ -20,6 +20,24 @@
 static int libxl__device_p9_setdefault(libxl__gc *gc, uint32_t domid,
                                        libxl_device_p9 *p9, bool hotplug)
 {
+    if (p9->type == LIBXL_P9_TYPE_UNKNOWN) {
+        p9->type = LIBXL_P9_TYPE_QEMU;
+    }
+    if (p9->type == LIBXL_P9_TYPE_QEMU &&
+        (p9->max_files || p9->max_open_files || p9->max_space ||
+         p9->auto_delete)) {
+        LOGD(ERROR, domid, "Illegal 9pfs parameter combination");
+        return ERROR_INVAL;
+    }
+    if (p9->type == LIBXL_P9_TYPE_XEN_9PFSD && !p9->tag) {
+        p9->tag = libxl__strdup(NOGC, "Xen");
+    }
+
+    if (!p9->path || !p9->security_model || !p9->tag) {
+        LOGD(ERROR, domid, "9pfs spec missing required field!");
+        return ERROR_INVAL;
+    }
+
     return libxl__resolve_domid(gc, p9->backend_domname, &p9->backend_domid);
 }
 
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 9b358f11b8..80ffe85f5e 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2233,6 +2233,20 @@ void parse_config_data(const char *config_source,
                     replace_string(&p9->tag, value);
                 } else if (!strcmp(key, "backend")) {
                     replace_string(&p9->backend_domname, value);
+                } else if (!strcmp(key, "type")) {
+                    if (libxl_p9_type_from_string(value, &p9->type)) {
+                        fprintf(stderr, "failed to parse 9pfs type: %s\n",
+                                value);
+                        exit(1);
+                    }
+                } else if (!strcmp(key, "max-files")) {
+                    p9->max_files = parse_ulong(value);
+                } else if (!strcmp(key, "max-open-files")) {
+                    p9->max_open_files = parse_ulong(value);
+                } else if (!strcmp(key, "max-space")) {
+                    p9->max_space = parse_ulong(value);
+                } else if (!strcmp(key, "auto-delete")) {
+                    p9->auto_delete = strtoul(value, NULL, 0);
                 } else {
                     fprintf(stderr, "Unknown 9pfs parameter '%s'\n", key);
                     exit(1);
@@ -2243,9 +2257,12 @@ void parse_config_data(const char *config_source,
 
             libxl_string_list_dispose(&pairs);
 
-            if (!p9->path || !p9->security_model || !p9->tag) {
-                fprintf(stderr, "9pfs spec missing required field!\n");
-                exit(1);
+            if (p9->type == LIBXL_P9_TYPE_XEN_9PFSD && !p9->path) {
+                char *path;
+
+                xasprintf(&path, XEN_LOG_DIR "/guests/%s", c_info->name);
+                replace_string(&p9->path, path);
+                free(path);
             }
         }
     }
-- 
2.35.3



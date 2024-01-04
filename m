Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 180BA823E66
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 10:13:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661305.1031094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJma-00078k-2g; Thu, 04 Jan 2024 09:12:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661305.1031094; Thu, 04 Jan 2024 09:12:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJmZ-00076F-UV; Thu, 04 Jan 2024 09:12:55 +0000
Received: by outflank-mailman (input) for mailman id 661305;
 Thu, 04 Jan 2024 09:12:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4u2H=IO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rLJcY-00085z-CH
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 09:02:34 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff7cdd4a-aadf-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 10:02:33 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 779F41F7F8;
 Thu,  4 Jan 2024 09:02:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4C03013722;
 Thu,  4 Jan 2024 09:02:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id RjdAESl0lmUBWQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 04 Jan 2024 09:02:33 +0000
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
X-Inumbo-ID: ff7cdd4a-aadf-11ee-98ef-6d05b1d4d9a1
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v3 17/33] tools/xl: support new 9pfs backend xen-9pfsd
Date: Thu,  4 Jan 2024 10:00:39 +0100
Message-Id: <20240104090055.27323-18-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240104090055.27323-1-jgross@suse.com>
References: <20240104090055.27323-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 779F41F7F8

Add support for the new 9pfs backend "xen-9pfsd". For this backend type
the tag defaults to "Xen" and the host side path to
"/var/log/xen/guests/<dom-name>".

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
V2:
- test max_files and max_open_files, too (Jason Andryuk)
---
 docs/man/xl.cfg.5.pod.in | 36 ++++++++++++++++++++++++++++++++++--
 tools/xl/xl_parse.c      | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 2e234b450e..80011adbf3 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -772,10 +772,16 @@ settings, from the following list:
 
 =over 4
 
+=item B<type=TYPE>
+
+The backendtype for the PV device. Supported values are B<qemu> and
+B<xen-9pfsd>.  The default is B<qemu>.
+
 =item B<tag=STRING>
 
 9pfs tag to identify the filesystem share. The tag is needed on the
-guest side to mount it.
+guest side to mount it. For the backendtype of B<xen-9pfsd> the tag defaults to
+"Xen".
 
 =item B<security_model="none">
 
@@ -785,12 +791,38 @@ squash or remap).
 
 =item B<path=STRING>
 
-Filesystem path on the backend to export.
+Filesystem path on the backend to export. For the backendtype of B<xen-9pfsd>
+the path defaults to "@XEN_LOG_DIR@/guests/<guest-name>".
 
 =item B<backend=domain-id>
 
 Specify the backend domain name or id, defaults to dom0.
 
+=item B<max-files=NUMBER>
+
+Specify the maximum number of files below B<path>. A value of 0 (which
+is the default) doesn't limit the number of files. Only valid for
+B<type=xen-9pfsd>.
+
+=item B<max-open-files=NUMBER>
+
+Specify the maximum number of concurrently opened files below B<path>.
+Multiple opens of the same file are counted individually. Only valid for
+B<type=xen-9pfsd>, which has a default of B<max-open-files=5>.
+
+=item B<max-space=NUMBER>
+
+Specify the maximum used disk space in MiB below B<path>. A value of 0 (which
+is the default) doesn't limit the usable disk space. Only valid for
+B<type=xen-9pfsd>.
+
+=item B<auto-delete=BOOLEAN>
+
+When set the backend will delete the oldest file which is currently not
+opened by the guest in case the disk space limit set via B<max-space> or the
+file limit set via B<max-files> is being reached. Only valid for
+B<type=xen-9pfsd>.
+
 =back
 
 =item B<pvcalls=[ "backend=domain-id", ... ]>
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index ed983200c3..3ded557ebc 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2232,6 +2232,20 @@ void parse_config_data(const char *config_source,
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
@@ -2242,6 +2256,28 @@ void parse_config_data(const char *config_source,
 
             libxl_string_list_dispose(&pairs);
 
+            if (p9->type == LIBXL_P9_TYPE_UNKNOWN) {
+                p9->type = LIBXL_P9_TYPE_QEMU;
+            }
+            if (p9->type == LIBXL_P9_TYPE_QEMU &&
+                (p9->max_files || p9->max_open_files || p9->max_space ||
+                 p9->auto_delete)) {
+                fprintf(stderr, "Illegal 9pfs parameter combination\n");
+                exit(1);
+            }
+            if (p9->type == LIBXL_P9_TYPE_XEN_9PFSD) {
+                if (!p9->tag) {
+                    replace_string(&p9->tag, "Xen");
+                }
+                if (!p9->path) {
+                    char *path;
+
+                    xasprintf(&path, XEN_LOG_DIR "/guests/%s", c_info->name);
+                    replace_string(&p9->path, path);
+                    free(path);
+                }
+            }
+
             if (!p9->path || !p9->security_model || !p9->tag) {
                 fprintf(stderr, "9pfs spec missing required field!\n");
                 exit(1);
-- 
2.35.3



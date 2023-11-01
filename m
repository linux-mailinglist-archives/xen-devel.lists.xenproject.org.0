Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB8E7DDEC0
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:52:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626330.976522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7u3-0005ck-Vs; Wed, 01 Nov 2023 09:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626330.976522; Wed, 01 Nov 2023 09:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7u3-0005a8-TA; Wed, 01 Nov 2023 09:52:47 +0000
Received: by outflank-mailman (input) for mailman id 626330;
 Wed, 01 Nov 2023 09:52:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7co-0005E0-LG
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:34:58 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec07ff52-7899-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 10:34:58 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D8F5021A34;
 Wed,  1 Nov 2023 09:34:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B192B13460;
 Wed,  1 Nov 2023 09:34:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S5b8KcEbQmU0CQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:34:57 +0000
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
X-Inumbo-ID: ec07ff52-7899-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l2duKyjEiM300bkMtOBaVkepRhfhz+lqeaPmjMIQyAk=;
	b=CMcpfSq9Qi/4smsf1UC6cVAn+tV5ljvH7fyTC67ZhKQCQTC9wpzXTjf/Pe7pfhXq2yiSp7
	n9prsPomAQYEPQ2n8xZJDBiDMLSVy5Xnw3jRdyR+oEL/+Cqqk6/VuMQtBcxhpWLdszo5Gj
	jkFUj+OuyLb+HrDJNwEYtYM2qfTswZw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 16/29] tools/xl: support new 9pfs backend xenlogd
Date: Wed,  1 Nov 2023 10:33:12 +0100
Message-Id: <20231101093325.30302-17-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101093325.30302-1-jgross@suse.com>
References: <20231101093325.30302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the new 9pfs backend "xenlogd". For this backend type
the tag defaults to "Xen" and the host side path to
"/var/log/xen/guests/<dom-name>".

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/man/xl.cfg.5.pod.in | 36 ++++++++++++++++++++++++++++++++++--
 tools/xl/xl_parse.c      | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 2e234b450e..be82d35eed 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -772,10 +772,16 @@ settings, from the following list:
 
 =over 4
 
+=item B<type=TYPE>
+
+The backendtype for the PV device. Supported values are B<qemu> and B<xenlogd>.
+The default is B<qemu>.
+
 =item B<tag=STRING>
 
 9pfs tag to identify the filesystem share. The tag is needed on the
-guest side to mount it.
+guest side to mount it. For the backendtype of B<xenlogd> the tag defaults to
+"Xen".
 
 =item B<security_model="none">
 
@@ -785,12 +791,38 @@ squash or remap).
 
 =item B<path=STRING>
 
-Filesystem path on the backend to export.
+Filesystem path on the backend to export. For the backendtype of B<xenlogd>
+the path defaults to "@XEN_LOG_DIR@/guests/<guest-name>".
 
 =item B<backend=domain-id>
 
 Specify the backend domain name or id, defaults to dom0.
 
+=item B<max-files=NUMBER>
+
+Specify the maximum number of files below B<path>. A value of 0 (which
+is the default) doesn't limit the number of files. Only valid for
+B<type=xenlogd>.
+
+=item B<max-open-files=NUMBER>
+
+Specify the maximum number of concurrently opened files below B<path>.
+Multiple opens of the same file are counted individually. Only valid for
+B<type=xenlogd>, which has a default of B<max-open-files=5>.
+
+=item B<max-space=NUMBER>
+
+Specify the maximum used disk space in MiB below B<path>. A value of 0 (which
+is the default) doesn't limit the usable disk space. Only valid for
+B<type=xenlogd>.
+
+=item B<auto-delete=BOOLEAN>
+
+When set the backend will delete the oldest file which is currently not
+opened by the guest in case the disk space limit set via B<max-space> or the
+file limit set via B<max-files> is being reached. Only valid for
+B<type=xenlogd>.
+
 =back
 
 =item B<pvcalls=[ "backend=domain-id", ... ]>
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index ed983200c3..346532e117 100644
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
@@ -2242,6 +2256,27 @@ void parse_config_data(const char *config_source,
 
             libxl_string_list_dispose(&pairs);
 
+            if (p9->type == LIBXL_P9_TYPE_UNKNOWN) {
+                p9->type = LIBXL_P9_TYPE_QEMU;
+            }
+            if (p9->type == LIBXL_P9_TYPE_QEMU &&
+                (p9->max_space || p9->auto_delete)) {
+                fprintf(stderr, "Illegal 9pfs parameter combination\n");
+                exit(1);
+            }
+            if (p9->type == LIBXL_P9_TYPE_XENLOGD) {
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



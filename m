Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 218B4315311
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 16:46:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83312.154729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9VDE-0001ak-7m; Tue, 09 Feb 2021 15:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83312.154729; Tue, 09 Feb 2021 15:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9VDE-0001a8-2w; Tue, 09 Feb 2021 15:46:00 +0000
Received: by outflank-mailman (input) for mailman id 83312;
 Tue, 09 Feb 2021 15:45:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhOK=HL=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1l9VDC-0001R5-NL
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 15:45:58 +0000
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:400:200::c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8129c05c-0e83-4df1-8465-e927c287ec4e;
 Tue, 09 Feb 2021 15:45:49 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.17.1 DYNA|AUTH)
 with ESMTPSA id 604447x19Fjf1k9
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 9 Feb 2021 16:45:41 +0100 (CET)
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
X-Inumbo-ID: 8129c05c-0e83-4df1-8465-e927c287ec4e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1612885548;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
	From:Subject:Sender;
	bh=zvrEgmv5X8uRsW5yGE7mKuAvmfklbHSa7m/edYazMSU=;
	b=Awrc1+37JQTq2YMQvkWL5ZXD2aXxW26igYavDfBmHxeDi3dirawjFEbThdAfDowjUv
	+JZUt+LNkeMZu5z8AygoiJMGgMD4TdT6mpdMZfWFm77M0M0yF8DLgsFRy1bs5eWpV3nv
	oEGXhsoeCEl7ckX8IzscNbn8l4gKKD5OJyVpjiSbq54JlrGTC+Mb2Ie0qIFtbNKoxchX
	9hYkA6OB7v8i0J/YZv4N4CSR40AHs1V4QWwWNXGg3rbNq1V2P4W9DjAwAbI7lu/UD/6m
	6wNpTlTQEv7m94UJRfnwhp8Ov8WGHxiE4/oxotXTqbDarMxmQRFabzBMlT4M/Wk/vmIl
	0TQQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3GxPjw=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210209 3/4] xl: optionally print timestamps when running xl commands
Date: Tue,  9 Feb 2021 16:45:35 +0100
Message-Id: <20210209154536.10851-4-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210209154536.10851-1-olaf@aepfle.de>
References: <20210209154536.10851-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a global option "-T" to xl to enable timestamps in the output from
libxl and libxc. This is most useful with long running commands such
as "migrate".

During 'xl -v.. migrate domU host' a large amount of debug is generated.
It is difficult to map each line to the sending and receiving side.
Also the time spent for migration is not reported.

With 'xl -T migrate domU host' both sides will print timestamps and
also the pid of the invoked xl process to make it more obvious which
side produced a given log line.

Note: depending on the command, xl itself also produces other output
which does not go through libxentoollog. As a result such output will
not have timestamps prepended.


This change adds also the missing "-t" flag to "xl help" output.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 docs/man/xl.1.pod.in  |  4 ++++
 tools/xl/xl.c         | 18 +++++++++++++-----
 tools/xl/xl.h         |  1 +
 tools/xl/xl_migrate.c |  3 ++-
 4 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index 618c195148..e2176bd696 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -86,6 +86,10 @@ Always use carriage-return-based overwriting for displaying progress
 messages without scrolling the screen.  Without -t, this is done only
 if stderr is a tty.
 
+=item B<-T>
+
+Include timestamps and pid of the xl process in output.
+
 =back
 
 =head1 DOMAIN SUBCOMMANDS
diff --git a/tools/xl/xl.c b/tools/xl/xl.c
index 2a5ddd4390..3a89295802 100644
--- a/tools/xl/xl.c
+++ b/tools/xl/xl.c
@@ -52,6 +52,7 @@ libxl_bitmap global_pv_affinity_mask;
 enum output_format default_output_format = OUTPUT_FORMAT_JSON;
 int claim_mode = 1;
 bool progress_use_cr = 0;
+bool timestamps = 0;
 int max_grant_frames = -1;
 int max_maptrack_frames = -1;
 libxl_domid domid_policy = INVALID_DOMID;
@@ -365,8 +366,9 @@ int main(int argc, char **argv)
     int ret;
     void *config_data = 0;
     int config_len = 0;
+    unsigned int xtl_flags = 0;
 
-    while ((opt = getopt(argc, argv, "+vftN")) >= 0) {
+    while ((opt = getopt(argc, argv, "+vftTN")) >= 0) {
         switch (opt) {
         case 'v':
             if (minmsglevel > 0) minmsglevel--;
@@ -380,6 +382,9 @@ int main(int argc, char **argv)
         case 't':
             progress_use_cr = 1;
             break;
+        case 'T':
+            timestamps = 1;
+            break;
         default:
             fprintf(stderr, "unknown global option\n");
             exit(EXIT_FAILURE);
@@ -394,8 +399,11 @@ int main(int argc, char **argv)
     }
     opterr = 0;
 
-    logger = xtl_createlogger_stdiostream(stderr, minmsglevel,
-        (progress_use_cr ? XTL_STDIOSTREAM_PROGRESS_USE_CR : 0));
+    if (progress_use_cr)
+        xtl_flags |= XTL_STDIOSTREAM_PROGRESS_USE_CR;
+    if (timestamps)
+        xtl_flags |= XTL_STDIOSTREAM_SHOW_DATE | XTL_STDIOSTREAM_SHOW_PID;
+    logger = xtl_createlogger_stdiostream(stderr, minmsglevel, xtl_flags);
     if (!logger) exit(EXIT_FAILURE);
 
     xl_ctx_alloc();
@@ -457,7 +465,7 @@ void help(const char *command)
     struct cmd_spec *cmd;
 
     if (!command || !strcmp(command, "help")) {
-        printf("Usage xl [-vfN] <subcommand> [args]\n\n");
+        printf("Usage xl [-vfNtT] <subcommand> [args]\n\n");
         printf("xl full list of subcommands:\n\n");
         for (i = 0; i < cmdtable_len; i++) {
             printf(" %-19s ", cmd_table[i].cmd_name);
@@ -468,7 +476,7 @@ void help(const char *command)
     } else {
         cmd = cmdtable_lookup(command);
         if (cmd) {
-            printf("Usage: xl [-v%s%s] %s %s\n\n%s.\n\n",
+            printf("Usage: xl [-vtT%s%s] %s %s\n\n%s.\n\n",
                    cmd->modifies ? "f" : "",
                    cmd->can_dryrun ? "N" : "",
                    cmd->cmd_name,
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 06569c6c4a..137a29077c 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -269,6 +269,7 @@ extern int run_hotplug_scripts;
 extern int dryrun_only;
 extern int claim_mode;
 extern bool progress_use_cr;
+extern bool timestamps;
 extern xentoollog_level minmsglevel;
 #define minmsglevel_default XTL_PROGRESS
 extern char *lockfile;
diff --git a/tools/xl/xl_migrate.c b/tools/xl/xl_migrate.c
index 0813beb801..b8594f44a5 100644
--- a/tools/xl/xl_migrate.c
+++ b/tools/xl/xl_migrate.c
@@ -592,9 +592,10 @@ int main_migrate(int argc, char **argv)
         } else {
             verbose_len = (minmsglevel_default - minmsglevel) + 2;
         }
-        xasprintf(&rune, "exec %s %s xl%s%.*s migrate-receive%s%s%s",
+        xasprintf(&rune, "exec %s %s xl%s%s%.*s migrate-receive%s%s%s",
                   ssh_command, host,
                   pass_tty_arg ? " -t" : "",
+                  timestamps ? " -T" : "",
                   verbose_len, verbose_buf,
                   daemonize ? "" : " -e",
                   debug ? " -d" : "",


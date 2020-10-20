Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E3F293950
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 12:44:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9082.24420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUp7h-0007X4-Nx; Tue, 20 Oct 2020 10:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9082.24420; Tue, 20 Oct 2020 10:44:09 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUp7h-0007Wf-KK; Tue, 20 Oct 2020 10:44:09 +0000
Received: by outflank-mailman (input) for mailman id 9082;
 Tue, 20 Oct 2020 10:44:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ryym=D3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kUp7g-0007Vw-CT
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 10:44:08 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.219])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1eabbd5-69bf-4743-bda4-65d4484bed17;
 Tue, 20 Oct 2020 10:44:06 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.2.1 DYNA|AUTH)
 with ESMTPSA id e003b5w9KAhuBan
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 20 Oct 2020 12:43:56 +0200 (CEST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ryym=D3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kUp7g-0007Vw-CT
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 10:44:08 +0000
X-Inumbo-ID: e1eabbd5-69bf-4743-bda4-65d4484bed17
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.219])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e1eabbd5-69bf-4743-bda4-65d4484bed17;
	Tue, 20 Oct 2020 10:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603190645;
	s=strato-dkim-0002; d=aepfle.de;
	h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
	Subject:Sender;
	bh=BeKfgTRL0Ve2EEdsp0Vygx0an64RH8IwvMCvdkEBUoY=;
	b=kmJfs6ro+FNdeSpJoN+Nn4osjKExM+WW54RKpRn8Al3mBfaZupSGlfsMS0ds9gPFng
	OF7kIVE2tRosj/knsnnFpa+LIjRNPZ76SeACypioaIec1oRZRxJzaE3lwY+CUk5JJrG8
	CskaUYwY7xe84ajK0KUHgTkihX1mIU9TxOI0U+3S+0og0I96IRrw5pATcocHLmj7fcLQ
	uMKFgerb6Qx6484VxxkCfZRyGvkKUKkRp++ZKgkIpaSonwgBseZGwmlDROGjswzBFCxc
	u+UKJhmdS06adYwAcJa1mEWrMoHUL33FHCA1BmuJ2K1zZ0ts8IfKH6KYFm1UtVBalRJD
	R0IA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.2.1 DYNA|AUTH)
	with ESMTPSA id e003b5w9KAhuBan
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Tue, 20 Oct 2020 12:43:56 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1] xl: optionally print timestamps during xl migrate
Date: Tue, 20 Oct 2020 12:43:53 +0200
Message-Id: <20201020104353.13425-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During 'xl -v.. migrate domU host' a large amount of debug is generated.
It is difficult to map each line to the sending and receiving side.
Also the time spent for migration is not reported.

With 'xl migrate -T domU host' both sides will print timestamps and
also the pid of the invoked xl process to make it more obvious which
side produced a given log line.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 docs/man/xl.1.pod.in   |  4 ++++
 tools/xl/xl_cmdtable.c |  1 +
 tools/xl/xl_migrate.c  | 25 +++++++++++++++++++++----
 3 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index 5f7d3a7134..4bde0672fa 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -482,6 +482,10 @@ domain. See the corresponding option of the I<create> subcommand.
 Send the specified <config> file instead of the file used on creation of the
 domain.
 
+=item B<-T>
+
+Include timestamps in output.
+
 =item B<--debug>
 
 Display huge (!) amount of debug information during the migration process.
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 7da6c1b927..fd2dc0aef2 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -167,6 +167,7 @@ struct cmd_spec cmd_table[] = {
       "                migrate-receive [-d -e]\n"
       "-e              Do not wait in the background (on <host>) for the death\n"
       "                of the domain.\n"
+      "-T              Show timestamps during the migration process.\n"
       "--debug         Print huge (!) amount of debug during the migration process.\n"
       "-p              Do not unpause domain after migrating it.\n"
       "-D              Preserve the domain id"
diff --git a/tools/xl/xl_migrate.c b/tools/xl/xl_migrate.c
index 0813beb801..856a6e2be1 100644
--- a/tools/xl/xl_migrate.c
+++ b/tools/xl/xl_migrate.c
@@ -32,6 +32,8 @@
 
 #ifndef LIBXL_HAVE_NO_SUSPEND_RESUME
 
+static bool timestamps;
+
 static pid_t create_migration_child(const char *rune, int *send_fd,
                                         int *recv_fd)
 {
@@ -187,6 +189,7 @@ static void migrate_domain(uint32_t domid, int preserve_domid,
     char rc_buf;
     uint8_t *config_data;
     int config_len, flags = LIBXL_SUSPEND_LIVE;
+    unsigned xtl_flags = XTL_STDIOSTREAM_HIDE_PROGRESS;
 
     save_domain_core_begin(domid, preserve_domid, override_config_file,
                            &config_data, &config_len);
@@ -202,7 +205,9 @@ static void migrate_domain(uint32_t domid, int preserve_domid,
     migrate_do_preamble(send_fd, recv_fd, child, config_data, config_len,
                         rune);
 
-    xtl_stdiostream_adjust_flags(logger, XTL_STDIOSTREAM_HIDE_PROGRESS, 0);
+    if (timestamps)
+        xtl_flags |= XTL_STDIOSTREAM_SHOW_DATE | XTL_STDIOSTREAM_SHOW_PID;
+    xtl_stdiostream_adjust_flags(logger, xtl_flags, 0);
 
     if (debug)
         flags |= LIBXL_SUSPEND_DEBUG;
@@ -328,6 +333,11 @@ static void migrate_receive(int debug, int daemonize, int monitor,
     char rc_buf;
     char *migration_domname;
     struct domain_create dom_info;
+    unsigned xtl_flags = 0;
+
+    if (timestamps)
+        xtl_flags |= XTL_STDIOSTREAM_SHOW_DATE | XTL_STDIOSTREAM_SHOW_PID;
+    xtl_stdiostream_adjust_flags(logger, xtl_flags, 0);
 
     signal(SIGPIPE, SIG_IGN);
     /* if we get SIGPIPE we'd rather just have it as an error */
@@ -491,7 +501,7 @@ int main_migrate_receive(int argc, char **argv)
         COMMON_LONG_OPTS
     };
 
-    SWITCH_FOREACH_OPT(opt, "Fedrp", opts, "migrate-receive", 0) {
+    SWITCH_FOREACH_OPT(opt, "FedrpT", opts, "migrate-receive", 0) {
     case 'F':
         daemonize = 0;
         break;
@@ -517,6 +527,9 @@ int main_migrate_receive(int argc, char **argv)
     case 'p':
         pause_after_migration = 1;
         break;
+    case 'T':
+        timestamps = 1;
+        break;
     }
 
     if (argc-optind != 0) {
@@ -545,7 +558,7 @@ int main_migrate(int argc, char **argv)
         COMMON_LONG_OPTS
     };
 
-    SWITCH_FOREACH_OPT(opt, "FC:s:epD", opts, "migrate", 2) {
+    SWITCH_FOREACH_OPT(opt, "FC:s:eTpD", opts, "migrate", 2) {
     case 'C':
         config_filename = optarg;
         break;
@@ -559,6 +572,9 @@ int main_migrate(int argc, char **argv)
         daemonize = 0;
         monitor = 0;
         break;
+    case 'T':
+        timestamps = 1;
+        break;
     case 'p':
         pause_after_migration = 1;
         break;
@@ -592,11 +608,12 @@ int main_migrate(int argc, char **argv)
         } else {
             verbose_len = (minmsglevel_default - minmsglevel) + 2;
         }
-        xasprintf(&rune, "exec %s %s xl%s%.*s migrate-receive%s%s%s",
+        xasprintf(&rune, "exec %s %s xl%s%.*s migrate-receive%s%s%s%s",
                   ssh_command, host,
                   pass_tty_arg ? " -t" : "",
                   verbose_len, verbose_buf,
                   daemonize ? "" : " -e",
+                  timestamps ? " -T" : "",
                   debug ? " -d" : "",
                   pause_after_migration ? " -p" : "");
     }


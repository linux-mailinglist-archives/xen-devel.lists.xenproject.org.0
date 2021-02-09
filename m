Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839D9315315
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 16:46:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83313.154741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9VDJ-0001g3-II; Tue, 09 Feb 2021 15:46:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83313.154741; Tue, 09 Feb 2021 15:46:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9VDJ-0001fE-D7; Tue, 09 Feb 2021 15:46:05 +0000
Received: by outflank-mailman (input) for mailman id 83313;
 Tue, 09 Feb 2021 15:46:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhOK=HL=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1l9VDH-0001R5-NO
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 15:46:03 +0000
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:400:200::c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 739a3183-5188-41ff-8023-ab4e5cfe0f35;
 Tue, 09 Feb 2021 15:45:49 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.17.1 DYNA|AUTH)
 with ESMTPSA id 604447x19Fjg1kA
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 9 Feb 2021 16:45:42 +0100 (CET)
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
X-Inumbo-ID: 739a3183-5188-41ff-8023-ab4e5cfe0f35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1612885548;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
	From:Subject:Sender;
	bh=i1NPX2zWTNw88m/1NcvmRDBKDd6HKMtx2izL2PhwkGc=;
	b=YyQOQJEab1mtpgyyEF+N4rhJCncFlCYsovqIpocTFLkHF6oZcXRc0St6/iGKr2Mkpe
	UeMGwTa+t4iKFVbU46JNBJmlA9XKgljK70d40SUbTrwKevdl/tcB+2UkerAL1AjyptLE
	QtVvSEDEKdJY0Tg5whzscUk6Md5oBadZkrIcBEHuIkrGHKhOMg7hyWrWDtP6LSnD7Y/w
	qVe/DXeHc1+j4t4+ZBtZJihbxpFdNILXNA44gkKBG9TLygUQWMbvv9rEEYqRaUsKGN7Y
	H3JDdvjfTshGyU3sAEGSdAHo7zZ3oCtjkJdS/3xuRKiMvEWe4JkfF0Cmk0ej9TYNggxU
	6cIQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3GxPjw=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210209 4/4] xl: disable --debug option for xl migrate
Date: Tue,  9 Feb 2021 16:45:36 +0100
Message-Id: <20210209154536.10851-5-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210209154536.10851-1-olaf@aepfle.de>
References: <20210209154536.10851-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xl migrate --debug used to track every pfn in every batch of pages.

Since commit cfa955591caea5d7ec505cdcbf4442f2d6e889e1 from Xen 4.6 the
debug flag changed meaning from "verify transferred memory during live
migration" to "verify transferred memory in remus/colo". At least xl
will not be able to trigger execution of the verifying code in
send_domain_memory_live anymore.

Remove "--debug" from "xl migrate -h" output.
Remove "--debug" from from xl man page.
Do not send "-d" as potential option for "xl migrate-receive" anymore.
Do not pass the flag LIBXL_SUSPEND_DEBUG anymore to libxl_domain_suspend.
Continue to recognize "--debug" as valid option for "xl migrate".
Continue to recognize "-d" as valid option for "xl migrate-receive".

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 docs/man/xl.1.pod.in   |  4 ----
 tools/xl/xl_cmdtable.c |  1 -
 tools/xl/xl_migrate.c  | 15 ++++++---------
 3 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index e2176bd696..b14196ccfe 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -479,10 +479,6 @@ domain. See the corresponding option of the I<create> subcommand.
 Send the specified <config> file instead of the file used on creation of the
 domain.
 
-=item B<--debug>
-
-Display huge (!) amount of debug information during the migration process.
-
 =item B<-p>
 
 Leave the domain on the receive side paused after migration.
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 07f54daabe..150f4cd1d3 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -171,7 +171,6 @@ struct cmd_spec cmd_table[] = {
       "                migrate-receive [-d -e]\n"
       "-e              Do not wait in the background (on <host>) for the death\n"
       "                of the domain.\n"
-      "--debug         Print huge (!) amount of debug during the migration process.\n"
       "-p              Do not unpause domain after migrating it.\n"
       "-D              Preserve the domain id"
     },
diff --git a/tools/xl/xl_migrate.c b/tools/xl/xl_migrate.c
index b8594f44a5..e4e4f918c7 100644
--- a/tools/xl/xl_migrate.c
+++ b/tools/xl/xl_migrate.c
@@ -177,8 +177,7 @@ static void migrate_do_preamble(int send_fd, int recv_fd, pid_t child,
 }
 
 static void migrate_domain(uint32_t domid, int preserve_domid,
-                           const char *rune, int debug,
-                           const char *override_config_file)
+                           const char *rune, const char *override_config_file)
 {
     pid_t child = -1;
     int rc;
@@ -204,8 +203,6 @@ static void migrate_domain(uint32_t domid, int preserve_domid,
 
     xtl_stdiostream_adjust_flags(logger, XTL_STDIOSTREAM_HIDE_PROGRESS, 0);
 
-    if (debug)
-        flags |= LIBXL_SUSPEND_DEBUG;
     rc = libxl_domain_suspend(ctx, domid, send_fd, flags, NULL);
     if (rc) {
         fprintf(stderr, "migration sender: libxl_domain_suspend failed"
@@ -500,6 +497,7 @@ int main_migrate_receive(int argc, char **argv)
         monitor = 0;
         break;
     case 'd':
+        /* For compatibility with older variants of xl */
         debug = 1;
         break;
     case 'r':
@@ -537,7 +535,7 @@ int main_migrate(int argc, char **argv)
     const char *ssh_command = "ssh";
     char *rune = NULL;
     char *host;
-    int opt, daemonize = 1, monitor = 1, debug = 0, pause_after_migration = 0;
+    int opt, daemonize = 1, monitor = 1, pause_after_migration = 0;
     int preserve_domid = 0;
     static struct option opts[] = {
         {"debug", 0, 0, 0x100},
@@ -566,7 +564,7 @@ int main_migrate(int argc, char **argv)
         preserve_domid = 1;
         break;
     case 0x100: /* --debug */
-        debug = 1;
+        /* ignored for compatibility with older variants of xl */
         break;
     case 0x200: /* --live */
         /* ignored for compatibility with xm */
@@ -592,17 +590,16 @@ int main_migrate(int argc, char **argv)
         } else {
             verbose_len = (minmsglevel_default - minmsglevel) + 2;
         }
-        xasprintf(&rune, "exec %s %s xl%s%s%.*s migrate-receive%s%s%s",
+        xasprintf(&rune, "exec %s %s xl%s%s%.*s migrate-receive%s%s",
                   ssh_command, host,
                   pass_tty_arg ? " -t" : "",
                   timestamps ? " -T" : "",
                   verbose_len, verbose_buf,
                   daemonize ? "" : " -e",
-                  debug ? " -d" : "",
                   pause_after_migration ? " -p" : "");
     }
 
-    migrate_domain(domid, preserve_domid, rune, debug, config_filename);
+    migrate_domain(domid, preserve_domid, rune, config_filename);
     return EXIT_SUCCESS;
 }
 


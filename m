Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1D172F691
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 09:42:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548534.856511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9L8u-0001tU-CF; Wed, 14 Jun 2023 07:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548534.856511; Wed, 14 Jun 2023 07:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9L8u-0001ri-9Q; Wed, 14 Jun 2023 07:42:12 +0000
Received: by outflank-mailman (input) for mailman id 548534;
 Wed, 14 Jun 2023 07:42:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cXBM=CC=arm.com=peter.hoyes@srs-se1.protection.inumbo.net>)
 id 1q9L8t-0001bG-9N
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 07:42:11 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id f75dd4a3-0a86-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 09:42:08 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7EF81FB;
 Wed, 14 Jun 2023 00:42:52 -0700 (PDT)
Received: from e125920.cambridge.arm.com (e125920.cambridge.arm.com
 [10.1.199.64])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FBA93F663;
 Wed, 14 Jun 2023 00:42:07 -0700 (PDT)
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
X-Inumbo-ID: f75dd4a3-0a86-11ee-8611-37d641c3527e
From: Peter Hoyes <peter.hoyes@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/2] xl: Add escape character argument to xl console
Date: Wed, 14 Jun 2023 08:41:44 +0100
Message-Id: <20230614074144.3505250-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230614074144.3505250-1-peter.hoyes@arm.com>
References: <20230614074144.3505250-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Hoyes <Peter.Hoyes@arm.com>

Add -e argument to xl console and pass to new escape_character argument
of libxl_console_exec.

In libxl_console_exec, there are currently two call sites to execl,
which uses varargs, in order to support optionally passing
'start-notify-fd' to the console client. In order to support passing
the 'escape' argument optionally too, refactor to instead have a single
call site to execv, which has the same behavior but takes an array of
arguments.

If -e is not specified, --escape is not passed to the console client and
the existing value (^]) is used as a default.

Issue-Id: SCM-4958
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I80ffbb7fecc63e023ec1c7f1e4ad7979ccf8da44
---
 tools/include/libxl.h            |  8 ++++++--
 tools/libs/light/libxl_console.c | 30 ++++++++++++++++++++++--------
 tools/xl/xl_cmdtable.c           |  3 ++-
 tools/xl/xl_console.c            | 10 +++++++---
 tools/xl/xl_vmcontrol.c          |  2 +-
 5 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index cac641a7eb..c513c39483 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1958,7 +1958,8 @@ int libxl_vncviewer_exec(libxl_ctx *ctx, uint32_t domid, int autopass);
  * the caller that it has connected to the guest console.
  */
 int libxl_console_exec(libxl_ctx *ctx, uint32_t domid, int cons_num,
-                       libxl_console_type type, int notify_fd);
+                       libxl_console_type type, int notify_fd,
+                       char* escape_character);
 /* libxl_primary_console_exec finds the domid and console number
  * corresponding to the primary console of the given vm, then calls
  * libxl_console_exec with the right arguments (domid might be different
@@ -1968,9 +1969,12 @@ int libxl_console_exec(libxl_ctx *ctx, uint32_t domid, int cons_num,
  * guests using pygrub.
  * If notify_fd is not -1, xenconsole will write 0x00 to it to nofity
  * the caller that it has connected to the guest console.
+ * If escape_character is not NULL, the provided value is used to exit
+ * the guest console.
  */
 int libxl_primary_console_exec(libxl_ctx *ctx, uint32_t domid_vm,
-                               int notify_fd);
+                               int notify_fd,
+                               char* escape_character);
 
 #if defined(LIBXL_API_VERSION) && LIBXL_API_VERSION < 0x040800
 
diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_console.c
index f497be141b..0b7293fe71 100644
--- a/tools/libs/light/libxl_console.c
+++ b/tools/libs/light/libxl_console.c
@@ -52,7 +52,8 @@ out:
 }
 
 int libxl_console_exec(libxl_ctx *ctx, uint32_t domid, int cons_num,
-                       libxl_console_type type, int notify_fd)
+                       libxl_console_type type, int notify_fd,
+                       char* escape_character)
 {
     GC_INIT(ctx);
     char *p = GCSPRINTF("%s/xenconsole", libxl__private_bindir_path());
@@ -75,15 +76,26 @@ int libxl_console_exec(libxl_ctx *ctx, uint32_t domid, int cons_num,
         goto out;
     }
 
+    char *args[] = {
+        p, domid_s, "--num", cons_num_s, "--type", cons_type_s,
+        NULL, NULL, NULL, NULL, // start-notify-fd, escape
+        NULL, // list terminator - do not use
+    };
+    char **args_extra = args + 6;
+
     if (notify_fd != -1) {
         notify_fd_s = GCSPRINTF("%d", notify_fd);
-        execl(p, p, domid_s, "--num", cons_num_s, "--type", cons_type_s,
-              "--start-notify-fd", notify_fd_s, (void *)NULL);
-    } else {
-        execl(p, p, domid_s, "--num", cons_num_s, "--type", cons_type_s,
-              (void *)NULL);
+        *args_extra++ = "--start-notify-fd";
+        *args_extra++ = notify_fd_s;
     }
 
+    if (escape_character) {
+        *args_extra++ = "--escape";
+        *args_extra++ = escape_character;
+    }
+
+    execv(p, args);
+
 out:
     GC_FREE;
     return ERROR_FAIL;
@@ -156,7 +168,8 @@ out:
     return rc;
 }
 
-int libxl_primary_console_exec(libxl_ctx *ctx, uint32_t domid_vm, int notify_fd)
+int libxl_primary_console_exec(libxl_ctx *ctx, uint32_t domid_vm, int notify_fd,
+                               char* escape_character)
 {
     uint32_t domid;
     int cons_num;
@@ -165,7 +178,8 @@ int libxl_primary_console_exec(libxl_ctx *ctx, uint32_t domid_vm, int notify_fd)
 
     rc = libxl__primary_console_find(ctx, domid_vm, &domid, &cons_num, &type);
     if ( rc ) return rc;
-    return libxl_console_exec(ctx, domid, cons_num, type, notify_fd);
+    return libxl_console_exec(ctx, domid, cons_num, type, notify_fd,
+                              escape_character);
 }
 
 int libxl_primary_console_get_tty(libxl_ctx *ctx, uint32_t domid_vm,
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index ccf4d83584..67604e9536 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -141,7 +141,8 @@ const struct cmd_spec cmd_table[] = {
       "Attach to domain's console",
       "[options] <Domain>\n"
       "-t <type>       console type, pv , serial or vuart\n"
-      "-n <number>     console number"
+      "-n <number>     console number\n"
+      "-e <escape>     escape character"
     },
     { "vncviewer",
       &main_vncviewer, 0, 0,
diff --git a/tools/xl/xl_console.c b/tools/xl/xl_console.c
index b27f9e0136..5633c6f6f7 100644
--- a/tools/xl/xl_console.c
+++ b/tools/xl/xl_console.c
@@ -28,8 +28,9 @@ int main_console(int argc, char **argv)
     int opt = 0, num = 0;
     libxl_console_type type = 0;
     const char *console_names = "pv, serial, vuart";
+    char* escape_character = NULL;
 
-    SWITCH_FOREACH_OPT(opt, "n:t:", NULL, "console", 1) {
+    SWITCH_FOREACH_OPT(opt, "n:t:e:", NULL, "console", 1) {
     case 't':
         if (!strcmp(optarg, "pv"))
             type = LIBXL_CONSOLE_TYPE_PV;
@@ -45,13 +46,16 @@ int main_console(int argc, char **argv)
     case 'n':
         num = atoi(optarg);
         break;
+    case 'e':
+        escape_character = optarg;
+        break;
     }
 
     domid = find_domain(argv[optind]);
     if (!type)
-        libxl_primary_console_exec(ctx, domid, -1);
+        libxl_primary_console_exec(ctx, domid, -1, escape_character);
     else
-        libxl_console_exec(ctx, domid, num, type, -1);
+        libxl_console_exec(ctx, domid, num, type, -1, escape_character);
     fprintf(stderr, "Unable to attach console\n");
     return EXIT_FAILURE;
 }
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 5518c78dc6..03971927e9 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -643,7 +643,7 @@ static void autoconnect_console(libxl_ctx *ctx_ignored,
     postfork();
 
     sleep(1);
-    libxl_primary_console_exec(ctx, bldomid, notify_fd);
+    libxl_primary_console_exec(ctx, bldomid, notify_fd, NULL);
     /* Do not return. xl continued in child process */
     perror("xl: unable to exec console client");
     _exit(1);
-- 
2.34.1



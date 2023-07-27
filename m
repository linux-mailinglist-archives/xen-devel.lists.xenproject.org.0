Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B53765911
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 18:46:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571231.894606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP476-0004gH-CK; Thu, 27 Jul 2023 16:45:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571231.894606; Thu, 27 Jul 2023 16:45:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP476-0004cj-8l; Thu, 27 Jul 2023 16:45:20 +0000
Received: by outflank-mailman (input) for mailman id 571231;
 Thu, 27 Jul 2023 16:45:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k29T=DN=arm.com=peter.hoyes@srs-se1.protection.inumbo.net>)
 id 1qP473-00047I-WD
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 16:45:18 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id f661a770-2c9c-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 18:45:15 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B3BBFEC;
 Thu, 27 Jul 2023 09:45:58 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.65])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB9153F5A1;
 Thu, 27 Jul 2023 09:45:13 -0700 (PDT)
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
X-Inumbo-ID: f661a770-2c9c-11ee-8613-37d641c3527e
From: Peter Hoyes <peter.hoyes@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	luca.fancellu@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 2/2] xl: Add escape character argument to xl console
Date: Thu, 27 Jul 2023 17:44:49 +0100
Message-Id: <20230727164450.77640-3-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230727164450.77640-1-peter.hoyes@arm.com>
References: <20230727164450.77640-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Hoyes <Peter.Hoyes@arm.com>

Add -e argument to xl console and pass to new escape_character argument
of libxl_console_exec.

Introduce a new API version to support this new argument and advertise
the new functionality in libxl.h

In libxl_console_exec, there are currently two call sites to execl,
which uses varargs, in order to support optionally passing
'start-notify-fd' to the console client. In order to support passing
the 'escape' argument optionally too, refactor to instead have a single
call site to execv, which has the same behavior but takes an array of
arguments.

If -e is not specified, --escape is not passed to the console client and
the existing value (^]) is used as a default.

Update the xl docs.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
Changes in v6:
- Fix the new compatiblity functions to use last presented version
- Fix the arguments of the existing compatibility functions

Changes in v5:
- Add this changelog
- Fix comment style in libxl_console_exec

Changes in v4:
- Document xl console -e argument in xl.1.pod.in
- Add changes for libxl API version compatibility

Changes in v3:
- Re-add the Reviewed-By tag accidentally removed in v2

Changes in v2:
- Drop the tags intended only for internal use at Arm

 docs/man/xl.1.pod.in             |  8 +++++-
 tools/include/libxl.h            | 43 ++++++++++++++++++++++++++++----
 tools/libs/light/libxl_console.c | 30 ++++++++++++++++------
 tools/xl/xl_cmdtable.c           |  3 ++-
 tools/xl/xl_console.c            | 10 +++++---
 tools/xl/xl_vmcontrol.c          |  2 +-
 6 files changed, 77 insertions(+), 19 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index 101e14241d..9ba22a8fa2 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -222,7 +222,8 @@ Attach to the console of a domain specified by I<domain-id>.  If you've set up
 your domains to have a traditional login console this will look much like a
 normal text login screen.
 
-Use the key combination Ctrl+] to detach from the domain console.
+Use the escape character key combination (default Ctrl+]) to detach from the
+domain console.
 
 B<OPTIONS>
 
@@ -239,6 +240,11 @@ emulated serial for HVM guests and PV console for PV guests.
 
 Connect to console number I<NUM>. Console numbers start from 0.
 
+=item I<-e escapechar>
+
+Customize the escape sequence used to detach from the domain console to
+I<escapechar>. If not specified, the value "^]" is used.
+
 =back
 
 =item B<destroy> [I<OPTIONS>] I<domain-id>
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index cac641a7eb..de29f11bc9 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -81,6 +81,15 @@
  */
 #define LIBXL_HAVE_CONSOLE_NOTIFY_FD 1
 
+/* LIBXL_HAVE_CONSOLE_ESCAPE_CHARACTER
+ *
+ * If this is defined, libxl_console_exec and
+ * libxl_primary_console_exe take an escape_character parameter. That
+ * parameter will be used to modify the escape sequence used to exit the
+ * console.
+ */
+#define LIBXL_HAVE_CONSOLE_ESCAPE_CHARACTER 1
+
 /* LIBXL_HAVE_CONST_COPY_AND_LENGTH_FUNCTIONS
  *
  * If this is defined, the copy functions have constified src parameter and the
@@ -790,7 +799,8 @@ typedef struct libxl__ctx libxl_ctx;
 #if LIBXL_API_VERSION != 0x040200 && LIBXL_API_VERSION != 0x040300 && \
     LIBXL_API_VERSION != 0x040400 && LIBXL_API_VERSION != 0x040500 && \
     LIBXL_API_VERSION != 0x040700 && LIBXL_API_VERSION != 0x040800 && \
-    LIBXL_API_VERSION != 0x041300 && LIBXL_API_VERSION != 0x041400
+    LIBXL_API_VERSION != 0x041300 && LIBXL_API_VERSION != 0x041400 && \
+    LIBXL_API_VERSION != 0x041800
 #error Unknown LIBXL_API_VERSION
 #endif
 #endif
@@ -1958,7 +1968,8 @@ int libxl_vncviewer_exec(libxl_ctx *ctx, uint32_t domid, int autopass);
  * the caller that it has connected to the guest console.
  */
 int libxl_console_exec(libxl_ctx *ctx, uint32_t domid, int cons_num,
-                       libxl_console_type type, int notify_fd);
+                       libxl_console_type type, int notify_fd,
+                       char* escape_character);
 /* libxl_primary_console_exec finds the domid and console number
  * corresponding to the primary console of the given vm, then calls
  * libxl_console_exec with the right arguments (domid might be different
@@ -1968,9 +1979,12 @@ int libxl_console_exec(libxl_ctx *ctx, uint32_t domid, int cons_num,
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
 
@@ -1978,17 +1992,36 @@ static inline int libxl_console_exec_0x040700(libxl_ctx *ctx,
                                               uint32_t domid, int cons_num,
                                               libxl_console_type type)
 {
-    return libxl_console_exec(ctx, domid, cons_num, type, -1);
+    return libxl_console_exec(ctx, domid, cons_num, type, -1, NULL);
 }
 #define libxl_console_exec libxl_console_exec_0x040700
 
 static inline int libxl_primary_console_exec_0x040700(libxl_ctx *ctx,
                                                       uint32_t domid_vm)
 {
-    return libxl_primary_console_exec(ctx, domid_vm, -1);
+    return libxl_primary_console_exec(ctx, domid_vm, -1, NULL);
 }
 #define libxl_primary_console_exec libxl_primary_console_exec_0x040700
 
+#elif defined(LIBXL_API_VERSION) && LIBXL_API_VERSION < 0x041800
+
+static inline int libxl_console_exec_0x041700(libxl_ctx *ctx, uint32_t domid,
+                                              int cons_num,
+                                              libxl_console_type type,
+                                              int notify_fd)
+{
+    return libxl_console_exec(ctx, domid, cons_num, type, notify_fd, NULL);
+}
+#define libxl_console_exec libxl_console_exec_0x041700
+
+static inline int libxl_primary_console_exec_0x041700(libxl_ctx *ctx,
+                                                      uint32_t domid_vm,
+                                                      int notify_fd)
+{
+    return libxl_primary_console_exec(ctx, domid_vm, notify_fd, NULL);
+}
+#define libxl_primary_console_exec libxl_primary_console_exec_0x041700
+
 #endif
 
 /* libxl_console_get_tty retrieves the specified domain's console tty path
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



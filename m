Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A5B3543E1
	for <lists+xen-devel@lfdr.de>; Mon,  5 Apr 2021 17:57:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105400.201809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRbV-0002MP-MH; Mon, 05 Apr 2021 15:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105400.201809; Mon, 05 Apr 2021 15:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRbV-0002Kq-3g; Mon, 05 Apr 2021 15:57:29 +0000
Received: by outflank-mailman (input) for mailman id 105400;
 Mon, 05 Apr 2021 15:57:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTRbT-0002Hp-Ab
 for xen-devel@lists.xenproject.org; Mon, 05 Apr 2021 15:57:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRbS-0002oL-Nz; Mon, 05 Apr 2021 15:57:26 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRbS-00053b-Fh; Mon, 05 Apr 2021 15:57:26 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=fSnIgvoSjbUt91Rc+3WKbTs8Y6JmyyNkB+9IjjcALAg=; b=49TpKmuxcFkNIHf0NZn/D91QM
	liDzLY1pqQul9K2C/SIHFl+oM8o+pki3Cl4fUQm2psyk8/+nCbY6jUqjIBBEBzoI4Zap7OFnIWMr5
	UKWnKZ9aH40D6z1jqY5HMTS537E5FENgqwyZiQgXenW3kkRonsxeLecm88Ks4xK7sd1Fk=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 07/14] tools/xl: Use const whenever we point to literal strings
Date: Mon,  5 Apr 2021 16:57:06 +0100
Message-Id: <20210405155713.29754-8-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210405155713.29754-1-julien@xen.org>
References: <20210405155713.29754-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

literal strings are not meant to be modified. So we should use const
char * rather than char * when we want to store a pointer to them.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xl/xl.h         | 8 ++++----
 tools/xl/xl_console.c | 2 +-
 tools/xl/xl_utils.c   | 4 ++--
 tools/xl/xl_utils.h   | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 137a29077c1e..3052e3db0072 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -21,13 +21,13 @@
 #include <xentoollog.h>
 
 struct cmd_spec {
-    char *cmd_name;
+    const char *cmd_name;
     int (*cmd_impl)(int argc, char **argv);
     int can_dryrun;
     int modifies;
-    char *cmd_desc;
-    char *cmd_usage;
-    char *cmd_option;
+    const char *cmd_desc;
+    const char *cmd_usage;
+    const char *cmd_option;
 };
 
 struct domain_create {
diff --git a/tools/xl/xl_console.c b/tools/xl/xl_console.c
index 4e65d7386733..b27f9e013697 100644
--- a/tools/xl/xl_console.c
+++ b/tools/xl/xl_console.c
@@ -27,7 +27,7 @@ int main_console(int argc, char **argv)
     uint32_t domid;
     int opt = 0, num = 0;
     libxl_console_type type = 0;
-    char *console_names = "pv, serial, vuart";
+    const char *console_names = "pv, serial, vuart";
 
     SWITCH_FOREACH_OPT(opt, "n:t:", NULL, "console", 1) {
     case 't':
diff --git a/tools/xl/xl_utils.c b/tools/xl/xl_utils.c
index 4503ac7ea03c..17489d182954 100644
--- a/tools/xl/xl_utils.c
+++ b/tools/xl/xl_utils.c
@@ -27,7 +27,7 @@
 #include "xl.h"
 #include "xl_utils.h"
 
-void dolog(const char *file, int line, const char *func, char *fmt, ...)
+void dolog(const char *file, int line, const char *func, const char *fmt, ...)
 {
     va_list ap;
     char *s = NULL;
@@ -248,7 +248,7 @@ void print_bitmap(uint8_t *map, int maplen, FILE *stream)
     }
 }
 
-int do_daemonize(char *name, const char *pidfile)
+int do_daemonize(const char *name, const char *pidfile)
 {
     char *fullname;
     pid_t child1;
diff --git a/tools/xl/xl_utils.h b/tools/xl/xl_utils.h
index d98b419f1075..0c337ede954b 100644
--- a/tools/xl/xl_utils.h
+++ b/tools/xl/xl_utils.h
@@ -123,7 +123,7 @@ int def_getopt(int argc, char * const argv[],
                const struct option *longopts,
                const char* helpstr, int reqargs);
 
-void dolog(const char *file, int line, const char *func, char *fmt, ...)
+void dolog(const char *file, int line, const char *func, const char *fmt, ...)
 	__attribute__((format(printf,4,5)));
 
 void xvasprintf(char **strp, const char *fmt, va_list ap)
@@ -143,7 +143,7 @@ uint32_t find_domain(const char *p) __attribute__((warn_unused_result));
 
 void print_bitmap(uint8_t *map, int maplen, FILE *stream);
 
-int do_daemonize(char *name, const char *pidfile);
+int do_daemonize(const char *name, const char *pidfile);
 #endif /* XL_UTILS_H */
 
 /*
-- 
2.17.1



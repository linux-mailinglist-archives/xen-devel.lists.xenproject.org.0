Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6141A372DD6
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 18:15:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122564.231168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldxhS-00049O-Fd; Tue, 04 May 2021 16:15:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122564.231168; Tue, 04 May 2021 16:15:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldxhS-00048x-BZ; Tue, 04 May 2021 16:15:06 +0000
Received: by outflank-mailman (input) for mailman id 122564;
 Tue, 04 May 2021 16:15:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HwvY=J7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ldxhQ-00048f-If
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 16:15:04 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a0874d7-1103-4742-a191-09a704b2fbd8;
 Tue, 04 May 2021 16:15:03 +0000 (UTC)
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
X-Inumbo-ID: 0a0874d7-1103-4742-a191-09a704b2fbd8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620144903;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RbE9Angj5xJVvHKryCVkZNxXmr6wlbJe7cuv7VsWjZQ=;
  b=OjLu0BIMP6VKLAJiCv3cg2YkW3Qiw5masuTjw74ymIXZ94WKOVVcxWjO
   9mcNGvSennboACpdddUi8Ar09HPklevJy9GuFjdu5MBBRChDx6itrsBND
   7bUrweZYZR4VWnJsLR6+wX4MtLzLGOgHIs/Xh9HG/9813Lo8d65QKRnM9
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: jrZFDAdcWP9PxAV4qiOrl5myQKBMA4t1Mg/dxxGX5aQb+gmTtFmuMon/lzloVuamPKPqnUh/O2
 fhU3+y7T4x5cEDrNrN/zrpJPO1QCXm9q+xJS6aDKKwLRKUAktm2xrRZxqQ1KDHU/8OX6LYyeTw
 4fmU/K2udp7d3WxGFIqy7hO0qaM62mqPoweMqng1FkNhkCy3yWLC2PL4OgNZ5b2s/3lZJHtBuY
 Ib15SZ2mNFe9rqRmMYLnycgkCR6ptCRVQSBcfJwQwwLXf2O2zZXxyLpZwHwTUfS6NcyVEGYx+g
 7Dw=
X-SBRS: 5.1
X-MesageID: 44563269
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:bz+VS6HP6TG5kpwwpLqEDMeALOonbusQ8zAX/mpaICY6TuWzkc
 eykPMHkSLugDEKV3063fyGMq+MQXTTnKQFhbU5F7GkQQXgpS+UPJhvhLGSpQHINiXi+odmtZ
 tIXLN5DLTLYWRSqebfzE2GH807wN+BmZrY4Nv263t2VwllZ+VBwm5Ce2WmO3Z7TgVHGpY1fa
 D0jqEsygaIQngLct+9QkAMQumrnaytqLvdfRUECxQ7gTPusRqU7tfBfCSw71M7WzNLzaxKyx
 mmrzDE
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="44563269"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Julien Grall
	<jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2] xl: constify cmd_table entries
Date: Tue, 4 May 2021 17:14:36 +0100
Message-ID: <20210504161436.613782-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Also constify cmdtable_len and make use of ARRAY_SIZE, which is
available in "xen-tools/libs.h".

The entries in cmd_table don't need to be modified once xl is running.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---

Notes:
    v2:
    - use ARRAY_SIZE()
    - rework commit message

 tools/xl/xl.c          | 4 ++--
 tools/xl/xl.h          | 6 +++---
 tools/xl/xl_cmdtable.c | 9 +++++----
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/tools/xl/xl.c b/tools/xl/xl.c
index 3a8929580212..4107d10fd469 100644
--- a/tools/xl/xl.c
+++ b/tools/xl/xl.c
@@ -362,7 +362,7 @@ int main(int argc, char **argv)
 {
     int opt = 0;
     char *cmd = 0;
-    struct cmd_spec *cspec;
+    const struct cmd_spec *cspec;
     int ret;
     void *config_data = 0;
     int config_len = 0;
@@ -462,7 +462,7 @@ int child_report(xlchildnum child)
 void help(const char *command)
 {
     int i;
-    struct cmd_spec *cmd;
+    const struct cmd_spec *cmd;
 
     if (!command || !strcmp(command, "help")) {
         printf("Usage xl [-vfNtT] <subcommand> [args]\n\n");
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 137a29077c1e..e5a106dfbc82 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -218,10 +218,10 @@ int main_qemu_monitor_command(int argc, char **argv);
 void help(const char *command);
 
 extern const char *common_domname;
-extern struct cmd_spec cmd_table[];
-extern int cmdtable_len;
+extern const struct cmd_spec cmd_table[];
+extern const int cmdtable_len;
 /* Look up a command in the table, allowing unambiguous truncation */
-struct cmd_spec *cmdtable_lookup(const char *s);
+const struct cmd_spec *cmdtable_lookup(const char *s);
 
 extern libxl_ctx *ctx;
 extern xentoollog_logger_stdiostream *logger;
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 07f54daabec3..661323d4884e 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -15,10 +15,11 @@
 #include <string.h>
 
 #include <libxl.h>
+#include <xen-tools/libs.h>
 
 #include "xl.h"
 
-struct cmd_spec cmd_table[] = {
+const struct cmd_spec cmd_table[] = {
     { "create",
       &main_create, 1, 1,
       "Create a domain from config file <filename>",
@@ -631,12 +632,12 @@ struct cmd_spec cmd_table[] = {
     },
 };
 
-int cmdtable_len = sizeof(cmd_table)/sizeof(struct cmd_spec);
+const int cmdtable_len = ARRAY_SIZE(cmd_table);
 
 /* Look up a command in the table, allowing unambiguous truncation */
-struct cmd_spec *cmdtable_lookup(const char *s)
+const struct cmd_spec *cmdtable_lookup(const char *s)
 {
-    struct cmd_spec *cmd = NULL;
+    const struct cmd_spec *cmd = NULL;
     size_t len;
     int i, count = 0;
 
-- 
Anthony PERARD



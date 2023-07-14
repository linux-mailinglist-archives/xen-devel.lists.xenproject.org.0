Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC52F759BA3
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 18:57:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566085.884720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMAUN-0004In-02; Wed, 19 Jul 2023 16:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566085.884720; Wed, 19 Jul 2023 16:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMAUM-0004Gc-R2; Wed, 19 Jul 2023 16:57:22 +0000
Received: by outflank-mailman (input) for mailman id 566085;
 Wed, 19 Jul 2023 16:57:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Pwt=DF=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qMAR9-0001Uv-8S
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 16:54:03 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc0ad879-2654-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 18:54:01 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 36JGrquc034047
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 19 Jul 2023 12:53:57 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 36JGrqGx034046;
 Wed, 19 Jul 2023 09:53:52 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: dc0ad879-2654-11ee-8611-37d641c3527e
Message-Id: <a3a352b0ce0038eeaa708ba1db279cc8912ef9ba.1689779749.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1689779749.git.ehem+xen@m5p.com>
References: <cover.1689779749.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Thu, 13 Jul 2023 19:01:19 -0700
Subject: [PATCH 4/7] tools/utils: introduce xlu_cfg_printf() function
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

Isolate the lower layer configuration handling from the upper layer.  Now
only the lowest layer of configuration handling looks inside XLU_Config.

Also make error messages a bit more consistent.  Now PCI device parsing
will report filename.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
Someone else can decide where xlu__disk_err() should have its linebreaks
and indentation.  That string isn't very good.

I'm wondering about the return codes.  *printf() can return errors, but
so many places are ignoring them.  If the output is a console the errors
are fairly unlikely, but full storage does happen.
---
 tools/libs/util/libxlu_cfg.c      | 25 +++++++++++++++++++++++++
 tools/libs/util/libxlu_disk.c     | 14 +++++---------
 tools/libs/util/libxlu_internal.h |  9 +++------
 tools/libs/util/libxlu_pci.c      |  3 +--
 tools/libs/util/libxlu_vif.c      |  4 +---
 5 files changed, 35 insertions(+), 20 deletions(-)

diff --git a/tools/libs/util/libxlu_cfg.c b/tools/libs/util/libxlu_cfg.c
index 874f5abfb9..b2947cbfc9 100644
--- a/tools/libs/util/libxlu_cfg.c
+++ b/tools/libs/util/libxlu_cfg.c
@@ -18,12 +18,19 @@
 #define _GNU_SOURCE
 
 #include <limits.h>
+#include <stdarg.h>
 
 #include "libxlu_internal.h"
 #include "libxlu_cfg_y.h"
 #include "libxlu_cfg_l.h"
 #include "libxlu_cfg_i.h"
 
+struct XLU_Config {
+    XLU_ConfigSetting *settings;
+    FILE *report;
+    char *config_source;
+};
+
 XLU_Config *xlu_cfg_init(FILE *report, const char *report_source) {
     XLU_Config *cfg;
 
@@ -703,6 +710,24 @@ void xlu__cfg_yyerror(YYLTYPE *loc, CfgParseContext *ctx, char const *msg) {
     if (!ctx->err) ctx->err= EINVAL;
 }
 
+int xlu_cfg_printf(XLU_Config *cfg, const char *format, ...)
+{
+	va_list args;
+	int ret;
+
+	if (!cfg || !cfg->report)
+		return EFAULT;
+
+	fwrite(cfg->config_source, 1, strlen(cfg->config_source), cfg->report);
+	fwrite(": ", 2, 1, cfg->report);
+
+	va_start(args, format);
+	ret = vfprintf(cfg->report, format, args);
+	va_end(args);
+
+	return ret;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/util/libxlu_disk.c b/tools/libs/util/libxlu_disk.c
index 1de16a6a06..a4d08ab7e9 100644
--- a/tools/libs/util/libxlu_disk.c
+++ b/tools/libs/util/libxlu_disk.c
@@ -5,13 +5,10 @@
 
 void xlu__disk_err(DiskParseContext *dpc, const char *erroneous,
                    const char *message) {
-    fprintf(dpc->cfg->report,
-            "%s: config parsing error in disk specification: %s"
-            "%s%s%s"
-            " in `%s'\n",
-            dpc->cfg->config_source, message,
-            erroneous?": near `":"", erroneous?erroneous:"", erroneous?"'":"",
-            dpc->spec);
+    xlu_cfg_printf(dpc->cfg,
+            "config parsing error in disk specification: %s%s%s%s in `%s'\n",
+            message, erroneous?": near `":"", erroneous?erroneous:"",
+            erroneous?"'":"", dpc->spec);
     if (!dpc->err) dpc->err= EINVAL;
 }
 
@@ -29,8 +26,7 @@ static int dpc_prep(DiskParseContext *dpc, const char *spec) {
     return 0;
 
  fail:
-    fprintf(dpc->cfg->report, "cannot init disk scanner: %s\n",
-            strerror(errno));
+    xlu_cfg_printf(dpc->cfg, "cannot init disk scanner: %s\n", strerror(errno));
     return e;
 }
 
diff --git a/tools/libs/util/libxlu_internal.h b/tools/libs/util/libxlu_internal.h
index 1f7559ecd9..2ef5eb7f5e 100644
--- a/tools/libs/util/libxlu_internal.h
+++ b/tools/libs/util/libxlu_internal.h
@@ -57,12 +57,6 @@ typedef struct XLU_ConfigSetting { /* transparent */
     int lineno;
 } XLU_ConfigSetting;
 
-struct XLU_Config {
-    XLU_ConfigSetting *settings;
-    FILE *report;
-    char *config_source;
-};
-
 typedef struct {
     XLU_Config *cfg;
     int err, lexerrlineno, likely_python;
@@ -73,6 +67,9 @@ typedef struct {
 #define STRINGIFY(x) #x
 #define TOSTRING(x) STRINGIFY(x)
 
+extern int xlu_cfg_printf(XLU_Config *cfg, const char *format, ...)
+    __attribute__((__format__ (__printf__, 2, 3)));
+
 #endif /*LIBXLU_INTERNAL_H*/
 
 /*
diff --git a/tools/libs/util/libxlu_pci.c b/tools/libs/util/libxlu_pci.c
index 294482c6d7..d6abbc1c1f 100644
--- a/tools/libs/util/libxlu_pci.c
+++ b/tools/libs/util/libxlu_pci.c
@@ -5,8 +5,7 @@
 #include "libxlu_internal.h"
 
 
-#define XLU__PCI_ERR(_c, _x, _a...) \
-    if((_c) && (_c)->report) fprintf((_c)->report, _x, ##_a)
+#define XLU__PCI_ERR(_c, _x, _a...) xlu_cfg_printf((_c), _x, ##_a)
 
 static int parse_bdf(libxl_device_pci *pci, const char *str, const char **endp)
 {
diff --git a/tools/libs/util/libxlu_vif.c b/tools/libs/util/libxlu_vif.c
index ccf0cbdf57..93c449e213 100644
--- a/tools/libs/util/libxlu_vif.c
+++ b/tools/libs/util/libxlu_vif.c
@@ -6,9 +6,7 @@ static const char *vif_bytes_per_sec_re = "^[0-9]+[GMK]?[Bb]/s$";
 static const char *vif_internal_usec_re = "^[0-9]+[mu]?s?$";
 
 static void xlu__vif_err(XLU_Config *cfg, const char *msg, const char *rate) {
-    fprintf(cfg->report,
-            "%s: config parsing error in vif: %s in `%s'\n",
-            cfg->config_source, msg, rate);
+    xlu_cfg_printf(cfg, "config parsing error in vif: %s in `%s'\n", msg, rate);
 }
 
 static int vif_parse_rate_bytes_per_sec(XLU_Config *cfg, const char *bytes,
-- 
2.30.2



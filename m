Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E678E76D9AC
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 23:37:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575608.901248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJX2-00065v-Rw; Wed, 02 Aug 2023 21:37:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575608.901248; Wed, 02 Aug 2023 21:37:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJX2-00063e-P8; Wed, 02 Aug 2023 21:37:24 +0000
Received: by outflank-mailman (input) for mailman id 575608;
 Wed, 02 Aug 2023 21:37:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w0qL=DT=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qRJOE-0004vP-Mr
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 21:28:18 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c87010a-317b-11ee-b263-6b7b168915f2;
 Wed, 02 Aug 2023 23:28:14 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 372LS4dU008489
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 2 Aug 2023 17:28:10 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 372LS4M9008488;
 Wed, 2 Aug 2023 14:28:04 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 7c87010a-317b-11ee-b263-6b7b168915f2
Message-Id: <7c33609a299bcec685b9a77becd73abefbb9d237.1690990428.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1690990427.git.ehem+xen@m5p.com>
References: <cover.1690990427.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Thu, 13 Jul 2023 19:01:19 -0700
Subject: [PATCH 14/22] tools/utils: introduce xlu_cfg_printf() function
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

Isolate the lower layer configuration handling from the upper layer.  Now
only the lowest layer of configuration handling looks inside XLU_Config.

Also make error messages a bit more consistent.  Now PCI device parsing
will report filename.

Replace the XLU__PCI_ERR() with xlu_cfg_printf().  The new function
encompasses the full functionality of the macro.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
Someone else can decide where xlu__disk_err() should have its linebreaks
and indentation.  That string isn't very good.

I'm wondering about the return codes.  *printf() can return errors, but
so many places are ignoring them.  If the output is a console the errors
are fairly unlikely, but full storage does happen.
---
 tools/libs/util/libxlu_cfg.c      | 23 +++++++++++++++++++++++
 tools/libs/util/libxlu_disk.c     | 14 +++++---------
 tools/libs/util/libxlu_internal.h |  4 ++++
 tools/libs/util/libxlu_pci.c      | 11 ++++-------
 tools/libs/util/libxlu_vif.c      |  4 +---
 5 files changed, 37 insertions(+), 19 deletions(-)

diff --git a/tools/libs/util/libxlu_cfg.c b/tools/libs/util/libxlu_cfg.c
index 67d1a8123f..e37f84829f 100644
--- a/tools/libs/util/libxlu_cfg.c
+++ b/tools/libs/util/libxlu_cfg.c
@@ -18,6 +18,7 @@
 #define _GNU_SOURCE
 
 #include <limits.h>
+#include <stdarg.h>
 
 #include "libxlu_internal.h"
 #include "libxlu_cfg_y.h"
@@ -191,6 +192,28 @@ void xlu_cfg_destroy(XLU_Config *cfg) {
     free(cfg);
 }
 
+int xlu_cfg_printf(const XLU_Config *cfg, const char *format, ...)
+{
+    va_list args;
+    int ret;
+
+    if (!cfg || !cfg->report)
+        return EFAULT;
+
+    ret = fputs(cfg->config_source, cfg->report);
+    if (ret < 0)
+        return -errno;
+    ret = fputc(':', cfg->report);
+    if (ret < 0)
+        return -errno;
+
+    va_start(args, format);
+    ret = vfprintf(cfg->report, format, args);
+    va_end(args);
+
+    return -errno;
+}
+
 static XLU_ConfigSetting *find(const XLU_Config *cfg, const char *n) {
     XLU_ConfigSetting *set;
 
diff --git a/tools/libs/util/libxlu_disk.c b/tools/libs/util/libxlu_disk.c
index e94f4d06cd..8728c9e133 100644
--- a/tools/libs/util/libxlu_disk.c
+++ b/tools/libs/util/libxlu_disk.c
@@ -4,13 +4,10 @@
 
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
+            " config parsing error in disk specification: %s%s%s%s in `%s'\n",
+            message, erroneous?": near `":"", erroneous?erroneous:"",
+            erroneous?"'":"", dpc->spec);
     if (!dpc->err) dpc->err= EINVAL;
 }
 
@@ -28,8 +25,7 @@ static int dpc_prep(DiskParseContext *dpc, const char *spec) {
     return 0;
 
  fail:
-    fprintf(dpc->cfg->report, "cannot init disk scanner: %s\n",
-            strerror(errno));
+    xlu_cfg_printf(dpc->cfg, " cannot init disk scanner: %s\n", strerror(errno));
     return e;
 }
 
diff --git a/tools/libs/util/libxlu_internal.h b/tools/libs/util/libxlu_internal.h
index 310e2145a7..214ebe5f48 100644
--- a/tools/libs/util/libxlu_internal.h
+++ b/tools/libs/util/libxlu_internal.h
@@ -37,6 +37,10 @@ struct XLU_Config {
 #define STRINGIFY(x) #x
 #define TOSTRING(x) STRINGIFY(x)
 
+
+extern int xlu_cfg_printf(const XLU_Config *cfg, const char *format, ...)
+    __attribute__((__format__(__printf__, 2, 3)));
+
 #endif /*LIBXLU_INTERNAL_H*/
 
 /*
diff --git a/tools/libs/util/libxlu_pci.c b/tools/libs/util/libxlu_pci.c
index 294482c6d7..1f75317428 100644
--- a/tools/libs/util/libxlu_pci.c
+++ b/tools/libs/util/libxlu_pci.c
@@ -5,9 +5,6 @@
 #include "libxlu_internal.h"
 
 
-#define XLU__PCI_ERR(_c, _x, _a...) \
-    if((_c) && (_c)->report) fprintf((_c)->report, _x, ##_a)
-
 static int parse_bdf(libxl_device_pci *pci, const char *str, const char **endp)
 {
     const char *ptr = str;
@@ -129,7 +126,7 @@ static int parse_rdm_policy(XLU_Config *cfg, libxl_rdm_reserve_policy *policy,
     int ret = libxl_rdm_reserve_policy_from_string(str, policy);
 
     if (ret)
-        XLU__PCI_ERR(cfg, "Unknown RDM policy: %s", str);
+        xlu_cfg_printf(cfg, " Unknown RDM policy: %s", str);
 
     return ret;
 }
@@ -193,7 +190,7 @@ int xlu_pci_parse_spec_string(XLU_Config *cfg, libxl_device_pci *pci,
             pci->name = strdup(val);
             if (!pci->name) ret = ERROR_NOMEM;
         } else {
-            XLU__PCI_ERR(cfg, "Unknown PCI_SPEC_STRING option: %s", key);
+            xlu_cfg_printf(cfg, " Unknown PCI_SPEC_STRING option: %s", key);
             ret = ERROR_INVAL;
         }
 
@@ -233,7 +230,7 @@ int xlu_rdm_parse(XLU_Config *cfg, libxl_rdm_reserve *rdm, const char *str)
                 } else if (!strcmp(tok, "policy")) {
                     state = STATE_RESERVE_POLICY;
                 } else {
-                    XLU__PCI_ERR(cfg, "Unknown RDM state option: %s", tok);
+                    xlu_cfg_printf(cfg, " Unknown RDM state option: %s", tok);
                     goto parse_error;
                 }
                 tok = ptr + 1;
@@ -246,7 +243,7 @@ int xlu_rdm_parse(XLU_Config *cfg, libxl_rdm_reserve *rdm, const char *str)
                 if (!strcmp(tok, "host")) {
                     rdm->strategy = LIBXL_RDM_RESERVE_STRATEGY_HOST;
                 } else {
-                    XLU__PCI_ERR(cfg, "Unknown RDM strategy option: %s", tok);
+                    xlu_cfg_printf(cfg, " Unknown RDM strategy option: %s", tok);
                     goto parse_error;
                 }
                 tok = ptr + 1;
diff --git a/tools/libs/util/libxlu_vif.c b/tools/libs/util/libxlu_vif.c
index ccf0cbdf57..8331010550 100644
--- a/tools/libs/util/libxlu_vif.c
+++ b/tools/libs/util/libxlu_vif.c
@@ -6,9 +6,7 @@ static const char *vif_bytes_per_sec_re = "^[0-9]+[GMK]?[Bb]/s$";
 static const char *vif_internal_usec_re = "^[0-9]+[mu]?s?$";
 
 static void xlu__vif_err(XLU_Config *cfg, const char *msg, const char *rate) {
-    fprintf(cfg->report,
-            "%s: config parsing error in vif: %s in `%s'\n",
-            cfg->config_source, msg, rate);
+    xlu_cfg_printf(cfg, " config parsing error in vif: %s in `%s'\n", msg, rate);
 }
 
 static int vif_parse_rate_bytes_per_sec(XLU_Config *cfg, const char *bytes,
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |       ehem+sigmsg@m5p.com      PGP 87145445       |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445





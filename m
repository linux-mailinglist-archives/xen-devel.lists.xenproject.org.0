Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA0F480145
	for <lists+xen-devel@lfdr.de>; Mon, 27 Dec 2021 16:57:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252010.433025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1sMZ-000183-4n; Mon, 27 Dec 2021 15:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252010.433025; Mon, 27 Dec 2021 15:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1sMY-00014U-Vp; Mon, 27 Dec 2021 15:56:38 +0000
Received: by outflank-mailman (input) for mailman id 252010;
 Mon, 27 Dec 2021 15:56:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jnZ2=RM=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1n1sMX-0007zI-Ea
 for xen-devel@lists.xenproject.org; Mon, 27 Dec 2021 15:56:37 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9163f135-672d-11ec-9e60-abaf8a552007;
 Mon, 27 Dec 2021 16:56:36 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 1BRFuO2j054498
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 27 Dec 2021 10:56:32 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 1BRFuOhH054497;
 Mon, 27 Dec 2021 07:56:24 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 9163f135-672d-11ec-9e60-abaf8a552007
Message-Id: <fdf4e903a675e3a9ec8794b92f164f6c571371e5.1640590794.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1640590794.git.ehem+xen@m5p.com>
References: <cover.1640590794.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Thu, 17 Dec 2020 17:42:42 -0800
Subject: [PATCH 3/5] tools/xl: Rename printf_info()/list_domains_details() to
 dump_by_...()
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.5
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

printf_info()/list_domains_details() had been serving fairly similar
purposes.  Increase their consistency (add file-handle and output_format
arguments to list_domains_details(), reorder arguments) and then rename
to better reflect their functionality.

Both were simply outputting full domain information.  As this is more of
a dump operation, "dump" is a better name.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/xl/xl.h      |  8 ++++++++
 tools/xl/xl_info.c | 30 ++++++++++++++++--------------
 tools/xl/xl_misc.c |  5 +----
 3 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 720adb0048..be5f4e11fe 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -300,6 +300,14 @@ typedef enum {
     DOMAIN_RESTART_SOFT_RESET,   /* Soft reset should be performed */
 } domain_restart_type;
 
+extern void dump_by_config(enum output_format output_format,
+                           FILE *fh,
+                           const libxl_domain_config *d_config,
+                           int domid);
+extern void dump_by_dominfo_list(enum output_format output_format,
+                                 FILE *fh,
+                                 const libxl_dominfo info[],
+                                 int nb_domain);
 extern void printf_info_sexp(int domid, const libxl_domain_config *d_config, FILE *fh);
 extern void apply_global_affinity_masks(libxl_domain_type type,
                                         libxl_bitmap *vcpu_affinity_array,
diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index 23d82ce2a2..3647468420 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -94,12 +94,10 @@ out:
     return s;
 }
 
-void printf_info(enum output_format output_format,
-                 int domid,
-                 libxl_domain_config *d_config, FILE *fh);
-void printf_info(enum output_format output_format,
-                 int domid,
-                 libxl_domain_config *d_config, FILE *fh)
+void dump_by_config(enum output_format output_format,
+                    FILE *fh,
+                    const libxl_domain_config *const d_config,
+                    int domid)
 {
     if (output_format == OUTPUT_FORMAT_SXP)
         return printf_info_sexp(domid, d_config, fh);
@@ -442,7 +440,10 @@ static void list_domains(bool verbose, bool context, bool claim, bool numa,
     libxl_physinfo_dispose(&physinfo);
 }
 
-static void list_domains_details(const libxl_dominfo *info, int nb_domain)
+void dump_by_dominfo_list(enum output_format output_format,
+                          FILE *fh,
+                          const libxl_dominfo info[],
+                          int nb_domain)
 {
     libxl_domain_config d_config;
 
@@ -453,7 +454,7 @@ static void list_domains_details(const libxl_dominfo *info, int nb_domain)
     const char *buf;
     libxl_yajl_length yajl_len = 0;
 
-    if (default_output_format == OUTPUT_FORMAT_JSON) {
+    if (output_format == OUTPUT_FORMAT_JSON) {
         hand = libxl_yajl_gen_alloc(NULL);
         if (!hand) {
             fprintf(stderr, "unable to allocate JSON generator\n");
@@ -472,16 +473,16 @@ static void list_domains_details(const libxl_dominfo *info, int nb_domain)
                                                  &d_config, NULL);
         if (rc)
             continue;
-        if (default_output_format == OUTPUT_FORMAT_JSON)
+        if (output_format == OUTPUT_FORMAT_JSON)
             s = printf_info_one_json(hand, info[i].domid, &d_config);
         else
-            printf_info_sexp(info[i].domid, &d_config, stdout);
+            printf_info_sexp(info[i].domid, &d_config, fh);
         libxl_domain_config_dispose(&d_config);
         if (s != yajl_gen_status_ok)
             goto out;
     }
 
-    if (default_output_format == OUTPUT_FORMAT_JSON) {
+    if (output_format == OUTPUT_FORMAT_JSON) {
         s = yajl_gen_array_close(hand);
         if (s != yajl_gen_status_ok)
             goto out;
@@ -490,11 +491,12 @@ static void list_domains_details(const libxl_dominfo *info, int nb_domain)
         if (s != yajl_gen_status_ok)
             goto out;
 
-        puts(buf);
+        fputs(buf, fh);
+        fputc('\n', fh);
     }
 
 out:
-    if (default_output_format == OUTPUT_FORMAT_JSON) {
+    if (output_format == OUTPUT_FORMAT_JSON) {
         yajl_gen_free(hand);
         if (s != yajl_gen_status_ok)
             fprintf(stderr,
@@ -571,7 +573,7 @@ int main_list(int argc, char **argv)
     }
 
     if (details)
-        list_domains_details(info, nb_domain);
+        dump_by_dominfo_list(default_output_format, stdout, info, nb_domain);
     else
         list_domains(verbose, context, false /* claim */, numa, cpupool,
                      info, nb_domain);
diff --git a/tools/xl/xl_misc.c b/tools/xl/xl_misc.c
index 08f0fb6dc9..bcf178762b 100644
--- a/tools/xl/xl_misc.c
+++ b/tools/xl/xl_misc.c
@@ -256,9 +256,6 @@ int main_dump_core(int argc, char **argv)
     return EXIT_SUCCESS;
 }
 
-extern void printf_info(enum output_format output_format,
-                        int domid,
-                        libxl_domain_config *d_config, FILE *fh);
 int main_config_update(int argc, char **argv)
 {
     uint32_t domid;
@@ -344,7 +341,7 @@ int main_config_update(int argc, char **argv)
     parse_config_data(filename, config_data, config_len, &d_config);
 
     if (debug || dryrun_only)
-        printf_info(default_output_format, -1, &d_config, stdout);
+        dump_by_config(default_output_format, stdout, &d_config, -1);
 
     if (!dryrun_only) {
         fprintf(stderr, "setting dom%u configuration\n", domid);
-- 
2.30.2



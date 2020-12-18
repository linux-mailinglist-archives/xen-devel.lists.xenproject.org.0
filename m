Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDBD480143
	for <lists+xen-devel@lfdr.de>; Mon, 27 Dec 2021 16:57:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252004.433004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1sMP-0000FM-EF; Mon, 27 Dec 2021 15:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252004.433004; Mon, 27 Dec 2021 15:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1sMP-0000C8-AN; Mon, 27 Dec 2021 15:56:29 +0000
Received: by outflank-mailman (input) for mailman id 252004;
 Mon, 27 Dec 2021 15:56:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jnZ2=RM=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1n1sMN-0000AO-Vz
 for xen-devel@lists.xenproject.org; Mon, 27 Dec 2021 15:56:27 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b18dd06-672d-11ec-bb0b-79c175774b5d;
 Mon, 27 Dec 2021 16:56:26 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 1BRFuFg7054491
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 27 Dec 2021 10:56:21 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 1BRFuFLH054490;
 Mon, 27 Dec 2021 07:56:15 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 8b18dd06-672d-11ec-bb0b-79c175774b5d
Message-Id: <26c5803fdb59bd0bd06f2509097d5929dd4f67f2.1640590794.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1640590794.git.ehem+xen@m5p.com>
References: <cover.1640590794.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Fri, 18 Dec 2020 13:32:33 -0800
Subject: [PATCH 2/5] tools/xl: Mark libxl_domain_config * arg of
 printf_info_*() const
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.5
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

With libxl having gotten a lot more constant, now printf_info_sexp() and
printf_info_one_json() can add consts.  May not be particularly
important, but it is best to mark things constant when they are known to
be so.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/xl/xl.h      | 2 +-
 tools/xl/xl_info.c | 2 +-
 tools/xl/xl_sxp.c  | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index c5c4bedbdd..720adb0048 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -300,7 +300,7 @@ typedef enum {
     DOMAIN_RESTART_SOFT_RESET,   /* Soft reset should be performed */
 } domain_restart_type;
 
-extern void printf_info_sexp(int domid, libxl_domain_config *d_config, FILE *fh);
+extern void printf_info_sexp(int domid, const libxl_domain_config *d_config, FILE *fh);
 extern void apply_global_affinity_masks(libxl_domain_type type,
                                         libxl_bitmap *vcpu_affinity_array,
                                         unsigned int size);
diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index 712b7638b0..23d82ce2a2 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -59,7 +59,7 @@ static int maybe_printf(const char *fmt, ...)
 }
 
 static yajl_gen_status printf_info_one_json(yajl_gen hand, int domid,
-                                            libxl_domain_config *d_config)
+                                            const libxl_domain_config *d_config)
 {
     yajl_gen_status s;
 
diff --git a/tools/xl/xl_sxp.c b/tools/xl/xl_sxp.c
index 359a001570..d5b9051dfc 100644
--- a/tools/xl/xl_sxp.c
+++ b/tools/xl/xl_sxp.c
@@ -26,13 +26,13 @@
 /* In general you should not add new output to this function since it
  * is intended only for legacy use.
  */
-void printf_info_sexp(int domid, libxl_domain_config *d_config, FILE *fh)
+void printf_info_sexp(int domid, const libxl_domain_config *d_config, FILE *fh)
 {
     int i;
     libxl_dominfo info;
 
-    libxl_domain_create_info *c_info = &d_config->c_info;
-    libxl_domain_build_info *b_info = &d_config->b_info;
+    const libxl_domain_create_info *c_info = &d_config->c_info;
+    const libxl_domain_build_info *b_info = &d_config->b_info;
 
     fprintf(fh, "(domain\n\t(domid %d)\n", domid);
     fprintf(fh, "\t(create_info)\n");
-- 
2.30.2



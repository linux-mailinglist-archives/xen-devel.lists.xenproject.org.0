Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8395866DF8A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 14:54:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479421.743266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmPm-0000dw-3t; Tue, 17 Jan 2023 13:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479421.743266; Tue, 17 Jan 2023 13:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmPl-0000ZW-V7; Tue, 17 Jan 2023 13:54:13 +0000
Received: by outflank-mailman (input) for mailman id 479421;
 Tue, 17 Jan 2023 13:54:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kjsf=5O=citrix.com=prvs=374a1453b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHmPl-0000XC-75
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 13:54:13 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a75dd9c-966e-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 14:54:11 +0100 (CET)
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
X-Inumbo-ID: 6a75dd9c-966e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673963650;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=/f+gRZe5yeZkzcEod1cob8AlGi1kzQQ0lSYKT6D72pM=;
  b=R0A8vR10SsyED/t7YXfpQhXQQpGOAYwLwWcpvNMwrO6sfnveNegci+Xj
   p0W6eYflkwj9FHuL/qTeN96RalJELyyS+UtkH03ts/Wzk6GVixAUa3dIm
   xqI+3XZA/KyMGsCNAuQFhDAWUrX0hvGmYwEipIu5N+VDc8kxvjcXH4yp3
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 91898370
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:0hHgiKum7DucC1PlgZHt/Lky++fnVF1eMUV32f8akzHdYApBsoF/q
 tZmKTrVMvyMYjOgf9sjOtvj80xQuceDyd81QVBkrSAyHi4X+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj51v0gnRkPaoQ5AaHyCFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwMisPSkClp8yNkKPnSsh0vMEPM8/OI9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw9
 zuWrjSiXUly2Nq30jek2y+Qic30sj7laYc/TKei6eNBnwjGroAUIEJPDgbqyRWjsWahX/pPJ
 kpS/TAhxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLmQNUDNpctEts84yAzsw2
 TehndzzAid0mKaIUn/b/bCRxQ5eIgBMczVEP3VdC1JYvZ+6+tpbYg/zoshLCrW3qo3TOR/Lk
 yHWrAkmvbA/ksguyPDulbzYuA5AtqQlXyZsuFqMDzj/tlwpDGK2T9f2sAaGtJ6sOK7cFwDc5
 yZcxqBy+chUVfmweDqxrPLh9V1Dz9KMK3XijFFmBPHNHBz9qif4Lei8DNyTTXqF0/romhezO
 ic/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvK1TXrX02NR/JjjuFfK0QfUYXY
 MfzTCpRJSxCVfQPIMSeGo/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GALmUwzN14vd+F+92
 48GZ6O3J+B3DLWWjt//rdRCcjjn7BETWfjLliCgXrXSclo8Rj9/UaG5LHFIU9UNopm5X9zgp
 hmVMnK0AnKk2hUr9S3ihqhfVY7S
IronPort-HdrOrdr: A9a23:YGR2yqxS4OclT4vDZ3JaKrPwKL1zdoMgy1knxilNoEpuA6ilfq
 GV/MjzuiWetN98YhsdcLO7WZVoI0myyXcv2/h1AV7KZmCPhILPFuxfBODZrQEIdReTygbzv5
 0QFJSXpLfLfDtHZWeR2njbL+od
X-IronPort-AV: E=Sophos;i="5.97,224,1669093200"; 
   d="scan'208";a="91898370"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Edwin Torok <edvin.torok@citrix.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: [PATCH 4/6] tools: Introduce a non-truncating xc_xenver_changeset()
Date: Tue, 17 Jan 2023 13:53:34 +0000
Message-ID: <20230117135336.11662-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230117135336.11662-1-andrew.cooper3@citrix.com>
References: <20230117135336.11662-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Update libxl and the ocaml stubs to match.  No API/ABI change in either.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Torok <edvin.torok@citrix.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
---
 tools/include/xenctrl.h             |  1 +
 tools/libs/ctrl/xc_version.c        |  5 +++++
 tools/libs/light/libxl.c            |  5 +----
 tools/ocaml/libs/xc/xenctrl_stubs.c | 19 ++++++++-----------
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 279dc17d67d4..48dbf3eab75f 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1610,6 +1610,7 @@ int xc_version(xc_interface *xch, int cmd, void *arg);
  */
 char *xc_xenver_extraversion(xc_interface *xch);
 char *xc_xenver_capabilities(xc_interface *xch);
+char *xc_xenver_changeset(xc_interface *xch);
 
 int xc_flask_op(xc_interface *xch, xen_flask_op_t *op);
 
diff --git a/tools/libs/ctrl/xc_version.c b/tools/libs/ctrl/xc_version.c
index 512302a393ea..9f2cae03dba8 100644
--- a/tools/libs/ctrl/xc_version.c
+++ b/tools/libs/ctrl/xc_version.c
@@ -161,3 +161,8 @@ char *xc_xenver_capabilities(xc_interface *xch)
 {
     return varbuf_simple_string(xch, XENVER_capabilities2);
 }
+
+char *xc_xenver_changeset(xc_interface *xch)
+{
+    return varbuf_simple_string(xch, XENVER_changeset2);
+}
diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
index 139e838d1407..80e763aba944 100644
--- a/tools/libs/light/libxl.c
+++ b/tools/libs/light/libxl.c
@@ -582,7 +582,6 @@ const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx)
     GC_INIT(ctx);
     union {
         xen_compile_info_t xen_cc;
-        xen_changeset_info_t xen_chgset;
         xen_platform_parameters_t p_parms;
         xen_commandline_t xen_commandline;
         xen_build_id_t build_id;
@@ -607,9 +606,7 @@ const libxl_version_info* libxl_get_version_info(libxl_ctx *ctx)
     info->compile_date = libxl__strdup(NOGC, u.xen_cc.compile_date);
 
     info->capabilities = xc_xenver_capabilities(ctx->xch);
-
-    xc_version(ctx->xch, XENVER_changeset, &u.xen_chgset);
-    info->changeset = libxl__strdup(NOGC, u.xen_chgset);
+    info->changeset = xc_xenver_changeset(ctx->xch);
 
     xc_version(ctx->xch, XENVER_platform_parameters, &u.p_parms);
     info->virt_start = u.p_parms.virt_start;
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 368f4727f0a0..291e92db7300 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -983,27 +983,24 @@ CAMLprim value stub_xc_version_compile_info(value xch)
 }
 
 
-static value xc_version_single_string(value xch, int code, void *info)
+CAMLprim value stub_xc_version_changeset(value xch)
 {
 	CAMLparam1(xch);
-	int retval;
+	CAMLlocal1(result);
+	char *changeset;
 
 	caml_enter_blocking_section();
-	retval = xc_version(_H(xch), code, info);
+	retval = xc_xenver_changeset(_H(xch));
 	caml_leave_blocking_section();
 
-	if (retval)
+	if (!changeset)
 		failwith_xc(_H(xch));
 
-	CAMLreturn(caml_copy_string((char *)info));
-}
+	result = caml_copy_string(changeset);
 
+	free(changeset);
 
-CAMLprim value stub_xc_version_changeset(value xch)
-{
-	xen_changeset_info_t ci;
-
-	return xc_version_single_string(xch, XENVER_changeset, &ci);
+	CAMLreturn(result);
 }
 
 
-- 
2.11.0


